Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9146FAE7128
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 22:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA9F10E10C;
	Tue, 24 Jun 2025 20:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="iGBof+V6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CFB10E10C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 20:59:19 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-31393526d0dso797841a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 13:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1750798758; x=1751403558;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GmATIdQ/ffuscr1/9tqMcccuRap6fnp/uwfwA9P/3gs=;
 b=iGBof+V6QvYCwpYOVa60Elhe+3PX0hUYWq4/d4PD9uCGBt1RX6ayFHDXmyrwS/Rck4
 JGF+xmdwNKkn9TFlV4DLSfnAXNsNIpFMYA2kLHHkfvxTs7Q9y3qQaKQ6uy/QuGPCQDd+
 eSZDf23qe/qGvHoNpFXft2yUWOmq4kX0BOpns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750798758; x=1751403558;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GmATIdQ/ffuscr1/9tqMcccuRap6fnp/uwfwA9P/3gs=;
 b=SFlvsOPtBrvFt9jO//P2HSUBuuZ+aTAdd68O4xcvaV92GqqFmoZc2R7ZOP2uwJyf+s
 APBAJ9UPXaGW7A9lKICzcZjvJIwhu0s2KONfd7pRWEYDq/P7qbjrO9owPCd/Cjlunwkg
 KYg6tYaH7sUrUEGtql4yIlS0FiF2pgiW7Z4f3y+5MPGlTmrmnc67QXXscM3TJI4qMB45
 wcf7HRTOMdca/Zoyd+w0tH6NJRXpX1Uv1BTy+3ksV3YQY9pc8WCBhsKWHvsUvfo6bqlT
 fsI7A/X+e8cMavnwZrRyCbbYedd2ecBHGFK9GIBWLkgf460Zj3m4uvuBwp9n9GrvQeNJ
 2TDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy+uGYxFZkeMDEgC/nil8ZtAZCsmWHeBu3DsUzwM/gXH+Pl7+amY6POp9aOdZ8XMkT1mNkzjKz/yQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwV/Ce4P+tb8Ua/NErtUxGr2KSK+TiMYBF+dEdyPjCRXyHR4crJ
 7iqWg3YgzIwv1f4RmPGcaJwTUII2bJoul6ybl+Ae5MZj1can4BRCHk8KyBa/uSJwgdRJUSMjsJb
 kX4s=
X-Gm-Gg: ASbGncuext1AVGcnGZuS36DlBUxJZ0nSIdXdJThvzi5K6vWNsR057Ncxg/HCiPqhYVn
 N8VcI8nv/e0z5DCXg30MTzdLFTcQsBT1A2YIskI4sjtIrr8wfQO5K2XC+wZTSve3e6sXqoQ/HLr
 69mcVBvcMcl+kzExvP//5Qid8D/S1544WVu7udkqlHcF/z4u66bH9JU7p9nlO5OrFlJg5h2y0kw
 JoR7EO595H2YKXhWMVz11RvNvMYgIyXzYTbrrA4WBKFe1ydP3v62gt+qmwb2uQR3FjbkybJE1wH
 38+9QuprvA2vde/6pzXe56PYxGvbld717QImYQQK6IyhOrCLiBzS9rH6Sofi9MYO6YBSSf/0R1B
 2Ty55tAzyW1TavhoImKHUVl3PdiBUI1h+nh7k
X-Google-Smtp-Source: AGHT+IGRbi54nZJtWK/lwD+GihqOqBs6iuCvx30DAgX4zigW+sbHgbg+CDCacnXQBV1KBDAhV8e6GQ==
X-Received: by 2002:a17:90b:33cc:b0:311:c1ec:7cfd with SMTP id
 98e67ed59e1d1-315f26b387fmr370337a91.26.1750798758489; 
 Tue, 24 Jun 2025 13:59:18 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com.
 [209.85.216.49]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f53a8c8fsm9158a91.20.2025.06.24.13.59.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 13:59:17 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-311bd8ce7e4so1004552a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 13:59:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWkPAmWlIVKFtUwzHKdijznh01iAq1+bj7ynVQVP4wx41oXPX6CtdSn29x+2ekZfFqLDrPC3vdjWzg=@lists.freedesktop.org
X-Received: by 2002:a17:90b:5210:b0:312:e9bd:5d37 with SMTP id
 98e67ed59e1d1-315f2613846mr422766a91.6.1750798756465; Tue, 24 Jun 2025
 13:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250624044835.165708-1-j-choudhary@ti.com>
In-Reply-To: <20250624044835.165708-1-j-choudhary@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 24 Jun 2025 13:59:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WgLCwZ5De1B0Cs6MS7310xRa45po_LW7065W2bPNT3Xg@mail.gmail.com>
X-Gm-Features: AX0GCFsuP_XCTbLoYyR2QmXPmrUMfyrQTUAlc0NxhI0dj1sXsPCFPgIpb-cazDo
Message-ID: <CAD=FV=WgLCwZ5De1B0Cs6MS7310xRa45po_LW7065W2bPNT3Xg@mail.gmail.com>
Subject: Re: [PATCH v6] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
 devarsht@ti.com, tomi.valkeinen@ideasonboard.com, 
 kieran.bingham+renesas@ideasonboard.com, ernest.vanhoecke@toradex.com, 
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 linux-kernel@vger.kernel.org, max.oss.09@gmail.com, geert@linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jun 23, 2025 at 9:48=E2=80=AFPM Jayesh Choudhary <j-choudhary@ti.co=
m> wrote:
>
> By default, HPD was disabled on SN65DSI86 bridge. When the driver was
> added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-enable
> call which was moved to other function calls subsequently.
> Later on, commit "c312b0df3b13" added detect utility for DP mode. But wit=
h
> HPD_DISABLE bit set, all the HPD events are disabled[0] and the debounced
> state always return 1 (always connected state).
>
> Set HPD_DISABLE bit conditionally based on display sink's connector type.
> Since the HPD_STATE is reflected correctly only after waiting for debounc=
e
> time (~100-400ms) and adding this delay in detect() is not feasible
> owing to the performace impact (glitches and frame drop), remove runtime
> calls in detect() and add hpd_enable()/disable() bridge hooks with runtim=
e
> calls, to detect hpd properly without any delay.
>
> [0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)
>
> Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge connecto=
r operations for DP")
> Cc: Max Krummenacher <max.krummenacher@toradex.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>
> Changelog v5->v6:
> - Drop pm_runtime_mark_last_busy()
> - Pick up tags
>
> v5 patch link:
> <https://lore.kernel.org/all/20250616093240.499094-1-j-choudhary@ti.com/>
>
> Changelog v4->v5:
> - Make suspend asynchronous in hpd_disable()
> - Update HPD_DISABLE in probe function to address the case for when
>   comms are already enabled. Comments taken verbatim from [2]
> - Update comments
>
> v4 patch link:
> <https://lore.kernel.org/all/20250611052947.5776-1-j-choudhary@ti.com/>
>
> Changelog v3->v4:
> - Remove "no-hpd" support due to backward compatibility issues
> - Change the conditional from "no-hpd" back to connector type
>   but still address [1]
>
> v3 patch link:
> <https://lore.kernel.org/all/20250529110418.481756-1-j-choudhary@ti.com/>
>
> Changelog v2->v3:
> - Change conditional based on no-hpd property to address [1]
> - Remove runtime calls in detect() with appropriate comments
> - Add hpd_enable() and hpd_disable() in drm_bridge_funcs
>
> v2 patch link:
> <https://lore.kernel.org/all/20250508115433.449102-1-j-choudhary@ti.com/>
>
> Changelog v1->v2:
> - Drop additional property in bindings and use conditional.
> - Instead of register read for HPD state, use dpcd read which returns 0
>   for success and error codes for no connection
> - Add relevant history for the required change in commit message
> - Drop RFC subject-prefix in v2
> - Add "Cc:" tag
>
> v1 patch link:
> <https://lore.kernel.org/all/20250424105432.255309-1-j-choudhary@ti.com/>
>
> [1]: <https://lore.kernel.org/all/mwh35anw57d6nvre3sguetzq3miu4kd43rokegv=
ul7fk266lys@5h2euthpk7vq/>
> [2]: <https://lore.kernel.org/all/CAD=3DFV=3DWvH73d78De3PrbiG7b6OaS_BysGt=
xQ=3DmJTj4z-h0LYWA@mail.gmail.com/>
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 69 +++++++++++++++++++++++----
>  1 file changed, 60 insertions(+), 9 deletions(-)

I'll plan to push this to drm-misc-fixes tomorrow morning unless there
are any objections or requests for me to wait.

-Doug
