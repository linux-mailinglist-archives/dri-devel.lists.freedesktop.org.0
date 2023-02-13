Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9550A694C2D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 17:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BB410E062;
	Mon, 13 Feb 2023 16:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1597810E602;
 Mon, 13 Feb 2023 16:15:41 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-16cc1e43244so11462433fac.12; 
 Mon, 13 Feb 2023 08:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n00XwKmDj7Zhd185pYuu8ZoQFNENKpBwwusRZRdqFfA=;
 b=B7Ms3LWMXQT1D2m+TZUxvcLgPRJY0e1HjsPk1qEfUWwrMXjM/cBH03F42Oq0GY3t/2
 Vk60mCS+nRAf4XWaUcxxAN7C4dPPE0PTjyfOYz77owMl5uDG7unIFED5/4nGCaPLuxxK
 uhscyN+sbD1jm8ZVmWQyVdlw4wuahoBZrK62Bzx3amZLlPCICeVtV858iR+wSQgOD0WX
 +OrfR4zm02S140bYQM+5sxpuHZezSM/4NwiY4kf9mfUaV7hZr0/NdfXyCMM8cRm3KfGe
 YyF2h/JWt+3nLMifBPDzxGmboHb+Rz1sY4dOsL9EKpjGf1y1rLmaJUWtkPp08ctF70QT
 85Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n00XwKmDj7Zhd185pYuu8ZoQFNENKpBwwusRZRdqFfA=;
 b=0slvxodAuwd8RXUQhcJSxi+Ekh4h2/zHiA26rZlonu8UODBUnwKHfX1CQEKGS0pocu
 yXcBXuOPWEg8vlfgGSgdbZhBS4tbzSeXe8zWBoNW2aqLc6uIVBhcsNHnhk34zSGwfB0V
 syONGwifY+kvmhgdbTBFJolg3Jcwio66uIcBDMWzWkL1cpdIjPHRHVO0btbUSuX23JCW
 O8T0LZnDGCUo5JiMb3B62fE0j6M65NaRs6EXr3baOBE8qvxNE5P4/vddVE3/vuZ/N+TK
 pJ+2mzgyxSTFI+lKbcxXvbMCf7AFp7WtibaI7gvY0BYitqI0KEnrhvwq3C6+U1TIQOVK
 yH7Q==
X-Gm-Message-State: AO0yUKX694wmBmbSPL2lfta9Kogag9lOiS/S7WyfA3/+C7wElXMhNKGB
 aqrRNX8yTkUbeHx1HmXJ6jo1WivBwRVJQIFgW/g=
X-Google-Smtp-Source: AK7set9RyIIPHVCELYmiS06jLlThqm2dDvK3fN3R53a2gbk5cyFDMJ6F/3CaMYl3xWodnmdfFNn9dpOMGkBZ55r14gI=
X-Received: by 2002:a05:6870:13d1:b0:163:a303:fe2f with SMTP id
 17-20020a05687013d100b00163a303fe2fmr2647823oat.96.1676304940310; Mon, 13 Feb
 2023 08:15:40 -0800 (PST)
MIME-Version: 1.0
References: <20230210022839.3152-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230210022839.3152-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Feb 2023 11:15:28 -0500
Message-ID: <CADnq5_OaFqucwsJwm5CCQw=R5CpKnnWFDvp_M0=hutEKAbA0Og@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove the unused variable ds_port
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Feb 9, 2023 at 9:28 PM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Variable ds_port is not effectively used, so delete it.
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capabilit=
y.c:280:35: warning: variable =E2=80=98ds_port=E2=80=99 set but not used.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D4030
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  .../drm/amd/display/dc/link/protocols/link_dp_capability.c    | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capabi=
lity.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> index 24d356ebd7a9..816bf4ff8017 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> @@ -277,7 +277,6 @@ static void dp_wa_power_up_0010FA(struct dc_link *lin=
k, uint8_t *dpcd_data,
>                 int length)
>  {
>         int retry =3D 0;
> -       union dp_downstream_port_present ds_port =3D { 0 };
>
>         if (!link->dpcd_caps.dpcd_rev.raw) {
>                 do {
> @@ -290,9 +289,6 @@ static void dp_wa_power_up_0010FA(struct dc_link *lin=
k, uint8_t *dpcd_data,
>                 } while (retry++ < 4 && !link->dpcd_caps.dpcd_rev.raw);
>         }
>
> -       ds_port.byte =3D dpcd_data[DP_DOWNSTREAMPORT_PRESENT -
> -                                DP_DPCD_REV];
> -
>         if (link->dpcd_caps.dongle_type =3D=3D DISPLAY_DONGLE_DP_VGA_CONV=
ERTER) {
>                 switch (link->dpcd_caps.branch_dev_id) {
>                 /* 0010FA active dongles (DP-VGA, DP-DLDVI converters) po=
wer down
> --
> 2.20.1.7.g153144c
>
