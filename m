Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1069BA10C93
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 17:45:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9442C10E38F;
	Tue, 14 Jan 2025 16:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Z9I1hme6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD9F10E3EE
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 16:45:00 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-30225b2586cso61682281fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 08:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1736873096; x=1737477896;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Rhf5Q0PvplmYAXP+OjxhPE8wqzzFNL3gHIBGS42sTM=;
 b=Z9I1hme6/4x4KHPaisQDYIhEnX5JWSPDU+/KQT50i+aKLnAW6QFFfJ5LI9BrSA+uTZ
 dUsJbyzo6kWlXywMfPz9tC8uLqNmmzLHKYCkae5cozfjjkh7SimT2jXR1+jiF+EoIlxI
 sIbET2MEY5hh4jvBko08Uc07po+2TQHNwNHyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736873096; x=1737477896;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Rhf5Q0PvplmYAXP+OjxhPE8wqzzFNL3gHIBGS42sTM=;
 b=oUI8uFmmWmBqc5FeGBo+0updkUqPcixEehX/8YY7hB4qrJUIbXY8/QMzEksWgdiwC+
 Ksr5j88a+etMr21IWRCkzqg4niYTuOHYcVo+KHMvVMInhFFbJtsJ4sBBIKQxWAFI1xZM
 flKS6zUTuXsv3zK1DoHIkP25VKgd6w2+0Ul9TgQeDYiAS1UofE87vZqIVs/0nw2lwWsB
 wLN6RnEH066b3ScFkgfTuQdm0ts9Mxqwa8ra1M2K+7Lz2Xs0MoEaFgeD1Hmr6i9NkrZV
 pWXQCZk2YwLdV5DT3YfOYJQ2VXG4e0ME7A6pPXaWVHD9MUiCfFtPgmsR9DOIHy9yU/Vs
 oJiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdsrme4E0Emv4G54B/cP9v1n4XXKigpFe06V5kKAOI8FLzscFRcQaqlIgYt08e0V6TLkCH+l9ulO8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yylcf51acrY2arHH/dAU+01v0BC8O0xmNTZ4Bp/PSrSjSjCkvHP
 KwZIVfnRaxeeZxkEmjfRcxkPW49P/zMI/NUjnNrWL+zpZ4WH2vjd8qstCq/XOlzlacoVbHwdfYh
 e7lZh
X-Gm-Gg: ASbGnculkLDRJx0VfPe3yWOiFUbX5LULIwCzs2OkHzDshy7L8Q6TBgVoJOIpv0gwlu/
 OD/M2IrpMJhzBP6RkVprKaredZsLIPBDDLcG9aNalROb86y4x2P1RoEahv6uRgmo2s4HzN5BpIf
 hYs43NlthuL5fvryPoP+wHMCOrCijQrshfcqhHuqPNGJc4B3PM9FZe7QRRun4kxRbf4TbuT6w9Z
 EOM0gB6VB6gSkyWBOnll5JLHgaW/W1cPJ7BzW2aKrdXOEFBw7KIgl0SNbRPo3rirnTir+m9ccpV
 WuwnezTvaa+AQA8iA8S0jh6p
X-Google-Smtp-Source: AGHT+IHgOQTinSYkF3Ynoj16l3nuImR3vsuBHsy7yed8Lsvf96nAU+yeAJerJZSowu5nWNO6c6nA1A==
X-Received: by 2002:a05:6512:2391:b0:540:2fe6:6a3c with SMTP id
 2adb3069b0e04-5428a5775dcmr8121199e87.0.1736873096407; 
 Tue, 14 Jan 2025 08:44:56 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428becae9esm1743254e87.232.2025.01.14.08.44.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 08:44:55 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30219437e63so62296781fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 08:44:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWk6BIAQJfEUU/1lPhPsrJgfwOrVN8R8e6gGMghIY8QfI/4wlLG1L+LQQFajzmEcnCWNXrHmH2Crzg=@lists.freedesktop.org
X-Received: by 2002:a05:6512:2391:b0:540:2fe6:6a3c with SMTP id
 2adb3069b0e04-5428a5775dcmr8121151e87.0.1736873093549; Tue, 14 Jan 2025
 08:44:53 -0800 (PST)
MIME-Version: 1.0
References: <20250113085956.2150207-1-andyshrk@163.com>
 <34a1058f.9829.1945f2b448c.Coremail.andyshrk@163.com>
 <341c653.7fa6.194640f0f37.Coremail.andyshrk@163.com>
In-Reply-To: <341c653.7fa6.194640f0f37.Coremail.andyshrk@163.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 14 Jan 2025 08:44:41 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VdtA+4AsdoKeig4hheS0CX9d9wk7+ksi0_TC-R6px2UQ@mail.gmail.com>
X-Gm-Features: AbW1kvampitepN_q8Ct06ykQC2d9XxVa0ppgZ5JU78BlYAwIuwapvkOR0kwrX5Y
Message-ID: <CAD=FV=VdtA+4AsdoKeig4hheS0CX9d9wk7+ksi0_TC-R6px2UQ@mail.gmail.com>
Subject: Re: Re:[PATCH] drm/panel-edp: Add BOE NV140FHM-N4Z panel entry
To: Andy Yan <andyshrk@163.com>
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, neil.armstrong@linaro.org, tzimmermann@suse.de, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Tue, Jan 14, 2025 at 1:05=E2=80=AFAM Andy Yan <andyshrk@163.com> wrote:
>
>
> Hi All,
>
> At 2025-01-13 18:17:38, "Andy Yan" <andyshrk@163.com> wrote:
> >
> >Sorry, please don't merge this patch. after further testing,
> >I found that there are still some changce, it can't read edid.
>
> It turns out that we need set hpd-reliable-delay-ms =3D 120 in dts to ens=
ure
> the right time to access edid.

That seems awfully high and feels likely to be a problem with your
board design and not the panel. Are you sure HPD is even hooked up
properly on your board? Maybe you're missing a pullup/pulldown config
somewhere? Would it be better to just specify "no-hpd" and get the
full "HPD absent" delay?


> So the patch is ok, it is ready for review.
>
> >
> >At 2025-01-13 16:59:54, "Andy Yan" <andyshrk@163.com> wrote:
> >>Add an eDP panel entry for BOE NV140FHM-N4Z.
> >>
> >>No datasheet found for this panel.

I seem to be able to find a datasheet for something that calls itself
NV140FHM-N4Z, but it might be a different HW version since it has a
different ID. In my datasheet, though, "prepare_to_enable" should be
80 for this panel, not 200. That matches another nearby panel
"NV140WUM-N41". Are you sure you need 200?


> >>edid:
> >>00 ff ff ff ff ff ff 00 09 e5 09 0b 00 00 00 00
> >>01 20 01 04 a5 1f 11 78 03 9b 75 99 5b 5d 8f 2a
> >>23 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> >>01 01 01 01 01 01 c8 37 80 cc 70 38 28 40 6c 30
> >>aa 00 35 ae 10 00 00 1a 00 00 00 fd 00 30 3c 43
> >>43 8f 01 0a 20 20 20 20 20 20 00 00 00 fe 00 42
> >>4f 45 20 48 46 0a 20 20 20 20 20 20 00 00 00 fe
> >>00 4e 56 31 34 30 46 48 4d 2d 4e 34 5a 0a 00 35
> >>
> >>Signed-off-by: Andy Yan <andyshrk@163.com>
> >>---
> >>
> >> drivers/gpu/drm/panel/panel-edp.c | 1 +
> >> 1 file changed, 1 insertion(+)

FWIW it's good that Thomas replied to your patch, since that was the
only thing that showed up in my inbox. Your initial patch showed up as
spam for me. :( Not sure why, though...


> >>diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/=
panel-edp.c
> >>index 94a46241dece..a3402b76aa3e 100644
> >>--- a/drivers/gpu/drm/panel/panel-edp.c
> >>+++ b/drivers/gpu/drm/panel/panel-edp.c
> >>@@ -1909,6 +1909,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
> >>      EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116=
WHM-N4C"),
> >>      EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ae8, &delay_200_500_e50_p2e80, =
"NV140WUM-N41"),
> >>      EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80, "NV122=
WUM-N41"),
> >>+     EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b09, &delay_200_500_e50_p2e200,=
 "NV140FHM-NZ"),
> >>      EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV14=
0FHM-T09"),

This is mis-sorted. 0xb09 should be _before_ 0x0b34. I'll often fix
this up when applying (though it's more work for me), but since I had
a question above about delay_200_500_e50_p2e200 vs.
delay_200_500_e50_p2e80 maybe you can answer and also send a v2 with
the sort order fixed.

-Doug
