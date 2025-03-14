Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DD9A60778
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 03:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962C110E269;
	Fri, 14 Mar 2025 02:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bMZSn0J1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E5B10E269
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 02:28:04 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30762598511so17023141fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 19:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1741919282; x=1742524082;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3EDLto5Fj+QyO1rc5OeVTSwga/F1rC5M7RFzWcpsACU=;
 b=bMZSn0J1lCW+kAXiEWow0VuhClFfDXajT1FbXmWUaHDbetpqlFJUz23VQ2NuRgInGT
 IWL2LgcxY+eo4UDl7kzpSieJ3H6GMfgL0PJT28srHLhPdi3osWS2Jno/hUhF7Lwt3c7g
 mKbNqWAGkOd8rTOXk2w5q6C5yTaBEk0dqn36A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741919282; x=1742524082;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3EDLto5Fj+QyO1rc5OeVTSwga/F1rC5M7RFzWcpsACU=;
 b=I5af9jkl8Da/rWb2j/61UOLF6s7Hb1baa75jozwz/JGDI7H3D2JI2Lz14AheYmYFuN
 Fagvu7TVGn0Kq6shWIwB17bdpmiqq78DwvVwHejknb9nr2iB5+pO6IxvHrDz2fN6S5HX
 pxP11rK80w5NCZsjhn5YV1t3WUOcFF12ejhHbR8JmdzbFLmmKuzeu288r/0CZ3/jJhU3
 6OAdo59lRjglDfXaLz6yxJav7+0ko/w2Oz+aK+9zaMzqvD3WDRPmc5y9Rl59VpqAtrLT
 /M0uHF/dXiN3+W4u4ZZFKQeosRq0hANic4h82g9JQO0OZAp7fUBP1SutneazT/xzboyM
 jw7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL21PUVbS7RY6RVc2tcyMn31Kr2NBIzRHIfkkKeWn2/sTAekVuMkS/JfrTp6AzJYyQM3T4mz1CBH8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbNRfclZskB4sT+As3WbN4hghWW3Q8zKsMrN5AKeQYDHn4uSnM
 6L4jBfD05i64q+wN/jJmgMt88zcewFe5EnC0xDaQxwvTxlqCTWdNxQ7VQ4FeVLZMUKykNprJS3/
 iBg==
X-Gm-Gg: ASbGncu6edrGMPek47JJ8lTYOMNtnuT2Uk0i6KAkT3WpghStrR7zQ8weOT0ifLl3cdX
 ZVER/Aqg3VvdWZmimnuENdK92zi1eJnhNyi+8Yo5+qAa66eYssonqQ2r+qzO8moGzGCtrjdHcr7
 zpUHc7ItHHis9Nk2+ik1r4Mhl3jXLUK8UVRM4mJdCu4pysqoNCkBpskDHEr0fIxwtFFbVLYNOqw
 BNWymEXmz5d6Q/PrjjsbLSSPTUeGkPtEy8D+4hjIJPvRABYdUFuNxYNIbhIblku50vin/Olv2vN
 Ai8ABNadFVYTL3PFBTnd3Cpu6HZ10D8e85Wrr0LJ/TuI8kPzxumWSB6eq2uNNFPLIPG4fZf8sQK
 I1T7PiWoRXrEd
X-Google-Smtp-Source: AGHT+IEEeNrHmItFQeStFubdfLmBEhb3iXul3LKTZukBdpOUQui/QHgAp3Vq5pGJooGRviS+yENLOA==
X-Received: by 2002:a05:651c:2108:b0:300:5c57:526b with SMTP id
 38308e7fff4ca-30c4a861dc9mr2366231fa.11.1741919281752; 
 Thu, 13 Mar 2025 19:28:01 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f1dbb12sm3961671fa.95.2025.03.13.19.28.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 19:28:00 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30795988ebeso17107561fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 19:28:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWWX7UxbHlk9Lru1wGmtZKZXHDcdYWnFEvv2tPMWX+2nhURiY2ZbB9427HXeOCjqXFq2DFWWJ6PSG0=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3b90:b0:549:c1e6:cbb9 with SMTP id
 2adb3069b0e04-549c38d07bemr214129e87.9.1741919280219; Thu, 13 Mar 2025
 19:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250310104114.2608063-1-damon.ding@rock-chips.com>
 <20250310104114.2608063-7-damon.ding@rock-chips.com>
In-Reply-To: <20250310104114.2608063-7-damon.ding@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Mar 2025 19:27:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V0Q5v6hcEFJqMfhCSQ80ki5SQRmrXvyeGCOQiFsXc28A@mail.gmail.com>
X-Gm-Features: AQ5f1Jpkp3eXwx7hKjmZ3N01Nrt914JFcQlKc2Ek2r-3Xhw1Wi6nZVzuUBUzhgE
Message-ID: <CAD=FV=V0Q5v6hcEFJqMfhCSQ80ki5SQRmrXvyeGCOQiFsXc28A@mail.gmail.com>
Subject: Re: [PATCH v8 06/13] drm/bridge: analogix_dp: Add support to get
 panel from the DP AUX bus
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, dmitry.baryshkov@linaro.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, 
 boris.brezillon@collabora.com, l.stach@pengutronix.de, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
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

On Mon, Mar 10, 2025 at 3:42=E2=80=AFAM Damon Ding <damon.ding@rock-chips.c=
om> wrote:
>
> The main modification is moving the DP AUX initialization from function
> analogix_dp_bind() to analogix_dp_probe(). In order to get the EDID of
> eDP panel during probing, it is also needed to advance PM operations to
> ensure that eDP controller and phy are prepared for AUX transmission.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>
> ---
>
> Changes in v4:
> - Use done_probing() to call drm_of_find_panel_or_bridge() and
>   component_add() when getting panel from the DP AUX bus
>
> Changes in v5:
> - Advance PM operations to make eDP AUX work well
>
> Changes in v6:
> - Use devm_pm_runtime_enable() instead of devm_add_action_or_reset()
> - Add a new function analogix_dp_remove() to ensure symmetry for PM
>   operations
>
> Changes in v7:
> - Fix the misspelling of word 'operations' in commit message
> - Remove the check related to CONFIG_PM
> - Remove the unnecessary call to pm_runtime_dont_use_autosuspend() if
>   devm_pm_runtime_enable() fails
> - Remove unnecessary function analogix_dp_remove()
> - Add new function analogix_dpaux_wait_hpd_asserted()
>
> Changes in v8:
> - Move the addition of the analogix_dpaux_wait_hpd_asserted() to the
>   other patch
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 20 ++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
