Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C2EB2B225
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 22:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40E410E12A;
	Mon, 18 Aug 2025 20:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="QMw4Djqi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6DB10E032
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 20:14:38 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-afcb73394b4so692854766b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 13:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755548072; x=1756152872;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7AbLN0mEOCL5wJFjFbEqIHTYiHqCns+0OdQO7zoWlxk=;
 b=QMw4DjqiRPp5n5d5MbDhzos1oeQeMghcXrgf0Z1rqkzClCtyHjRSyg3JxxKyVyCgl+
 m49xWh18NbBqtq47yue+vzg73tgUiX4LCQ0IFGQafX7JXF06Wp4Sw84qcd+n0yHF5GMM
 iXqBbU6rHrzCGIfbsokI3F9yspbBLAjNjMgyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755548072; x=1756152872;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7AbLN0mEOCL5wJFjFbEqIHTYiHqCns+0OdQO7zoWlxk=;
 b=P6Qo3DVuzv2iEnXPdAzt6I9Sp3VSSJUxvuIOov0X8rPvb/aygDswXvZiWFVj3IPFYa
 3hAZd7s5FdpdQ8i31Ao9d6oCvL1LnRgwfqaDRSE8mId1aP2MW76NLIjs3XUsKsNIuume
 F/5hY1P/QucVdGct0evX0Kd4/B1D3NBfaJZrW4SP2Lo2PxtwN223rr1QZjgJ/UEKEOBo
 H3S10QAfrJZRbFLl1qhSXnmhTalf2WjKdpqhvlGBNmM36uGZYhog7JvwnJNO94Mevm6p
 wJXQ7f20k2Z6EXQYsmIy3svrvERvbcEesXDjIFztgjaY/slRJebWeqNCsvOf1ac5X09t
 NKRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/yKlWobb1K8splPUIi/CUbS7X+CrkwMqeteRDhWu8famy3b8U5YXLxOe4A28dBM3gtfr3xvJW38Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5USNQNxDYRu6s+5IBaxglV0g39eb5wno7VoYO76bVDG0BAiPB
 5Ux8Z20f6JI5ODE8f1k4vi1DaatJeUOHkqCg5f+Tjhau6Nn/S/GZGXQ4v0KrDR5jUmV1WG6oY59
 n9oeOYQ==
X-Gm-Gg: ASbGncuDNmkE+RaCbBY7gsMvaFH0V9I/zSH/ZnTSZF+aRSwN6t7tkHyeqobFsXwkI20
 6BDqI56LOU2ZHZ6fTo+iZXv/Vy54xQJ28wxOW+FV6GkizEjao7hq89PZLg2PxACe8RtS7fqU3BF
 2KYaCFT9pK63Zblp+r6CA7t/1/aJ49Vx+/4syyrcXtlhKgvVBUDZN0IBkEdBEQI0wnmsDikS5bw
 aT9vizjrynozg0TKurAFRfHLwCIQxbweOw04xb05A8oxBgDQbybigreB/hEdlBAFICIyM3iiXRt
 BXLOdzqIWOHwpwEBr1zlsy0g6NEwP2hKfCLu/G/kiH95VfTeEUevhU1gJxkNqMY1yUIDJ5NSMSx
 4JnlyPydPVj/CNU0RQFqSnPqIQeMJlM5zlojlEeTZsyeJOmh6GrlrRH0wSmjTsA==
X-Google-Smtp-Source: AGHT+IEB7uniWdXPcBmDHXrULcoHk8UiVpk5GYbIKUIKyt9dpW2xrQvRJjNN2e6Ye2yUiNDwib66nA==
X-Received: by 2002:a17:907:7254:b0:af9:c321:7e01 with SMTP id
 a640c23a62f3a-afddd0d1f9dmr7659166b.41.1755548071919; 
 Mon, 18 Aug 2025 13:14:31 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com.
 [209.85.218.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdcfccbebsm860230066b.59.2025.08.18.13.14.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 13:14:26 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so606301766b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 13:14:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW72q0VWxQl3mYG+dIdKDCLpDOsooM5QoOCAXXeGCHYxev9BK8q/KfSeYPYbYnjYovpd03onrSzbuE=@lists.freedesktop.org
X-Received: by 2002:a17:907:2d10:b0:afd:d994:cb3 with SMTP id
 a640c23a62f3a-afddd24993emr6364066b.65.1755548065667; Mon, 18 Aug 2025
 13:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250818115015.2909525-1-treapking@chromium.org>
 <20250818115015.2909525-2-treapking@chromium.org>
In-Reply-To: <20250818115015.2909525-2-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Aug 2025 13:14:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WCfFWHAh=XxA_jZpMsS_L0U_k=_g_oj36Nd=4winZ24g@mail.gmail.com>
X-Gm-Features: Ac12FXxhwq2Tdk0MQ-VqGrmgMkR2gFXqi4A8weX1E66vNCEQGqMpqL4njS8RunA
Message-ID: <CAD=FV=WCfFWHAh=XxA_jZpMsS_L0U_k=_g_oj36Nd=4winZ24g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] HID: Make elan touch controllers power on after
 panel is enabled
To: Pin-yen Lin <treapking@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>, 
 dri-devel@lists.freedesktop.org
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

On Mon, Aug 18, 2025 at 4:50=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Introduce a new HID quirk to indicate that this device has to be enabled
> after the panel's backlight is enabled, and update the driver data for
> the elan devices to enable this quirk. This cannot be a I2C HID quirk
> because the kernel needs to acknowledge this before powering up the
> device and read the VID/PID. When this quirk is enabled, register
> .panel_enabled()/.panel_disabling() instead for the panel follower.
>
> Also rename the *panel_prepare* functions into *panel_follower* because
> they could be called in other situations now.
>
> Fixes: bd3cba00dcc63 ("HID: i2c-hid: elan: Add support for Elan eKTH6915 =
i2c-hid touchscreens")
> Fixes: d06651bebf99e ("HID: i2c-hid: elan: Add elan-ekth6a12nay timing")
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>
> ---
>
> Changes in v3:
> - Collect review tag
> - Add fixes tags
>
> Changes in v2:
> - Rename *panel_prepare* functions to *panel_follower*
> - Replace after_panel_enabled flag with enabled/disabling callbacks
>
>  drivers/hid/i2c-hid/i2c-hid-core.c    | 46 ++++++++++++++++-----------
>  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 11 ++++++-
>  include/linux/hid.h                   |  2 ++
>  3 files changed, 40 insertions(+), 19 deletions(-)

Re-iterating my response from v2 [1] so it's still seen even if people
only look at the latest version. :-) If HID folks don't mind us
landing this through drm-misc, feel free to Ack this patch. If HID
folks would rather not land through drm-misc, the default plan would
be to just wait until patch #1 makes its way to mainline before
landing patch #2.

Thanks!

[1] https://lore.kernel.org/r/CAD=3DFV=3DUV8_XGmxC=3D7Z18PEnj6wKz+yZQuV_4h+=
LJh_MNCqszvg@mail.gmail.com/
