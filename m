Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DB86BF2EC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 21:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3444610EFA3;
	Fri, 17 Mar 2023 20:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0E910EFA2;
 Fri, 17 Mar 2023 20:43:46 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id c11so4737138oiw.2;
 Fri, 17 Mar 2023 13:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679085826;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V+vnPzUKBbbp60sLbriuJoTVLeT2qpgVyidWWMBruqI=;
 b=MNWjsFR5l3Myb0V6T7z+EMsW6VY+/GDJusrh1CSBUfI1a/bXIpEP+PwEKuElPZoYNd
 F43hbSBTJ4rts6PmdSv8ShCcPhTU1y1uF/lYNG8h/nhh9a/Lm8bWBzLAICI8Jq0uRmDL
 fJGa22EKRlPmdqie0uytdmfdoFeIH395zTlEJ+H9baSuGsg+6mpUvsQpwtIsHyo5+cq4
 MKYotVFJJ9nGPC+W5FDtbChzaKexp57r3OSx8VyYuO80fWJ/56pJH2yPo3vH1siPMPjW
 XmU6tu0VHGHUiEQAcNzAmyIArhcmtFlikvxbbxWgBn6wvLrKl+FDnHk9LcigjMYwXrA6
 ZaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679085826;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V+vnPzUKBbbp60sLbriuJoTVLeT2qpgVyidWWMBruqI=;
 b=1vM2TcBIU9XKVe2QZwRqF94Wva+Ccm0DmHOLGq8yVM+65rJrqWe/GdZIKrVEdKVDoS
 ktxbIMhH5HIecYLSljqSxrk7+bHRBuSZ65613/xJSQB/hDPNaruZGruxGU882pHqHnHY
 CcrYmznv3yIO8rIuhXqljSNLXnh1DSjMwrv9FGYVLeoXbO7hxupxNv7OoFRqMWnG1UWg
 /DbqJL9P1TNsw72fdcPVJvtYyy3s1mKQQOAaYBHOOh3IaDvv7W5bSt3S3IFrG/YuUANq
 Heqeqwmm7R4if2F+pJ4MaWH99OskBvzZCqEM0kvSgh+WfDNiZegZl7FCsH8P2Bw1/ZYS
 WwZA==
X-Gm-Message-State: AO0yUKX7LcShY/5CXrOj0ET9451Pcl3AQYnpV5uzhrg1l7z7z1FArURq
 q6ACRt6g8AqB404AyUI2Wd0uWOAlI404NAGFS88=
X-Google-Smtp-Source: AK7set96NAWjRM0dhZTl6MtY0ZKvhPyLq1625CW71CwetE0UHMapHje95A11BQcCq9iqkqaWObban1sWl2S61Lm6D08=
X-Received: by 2002:a05:6808:2d6:b0:386:e28c:7ee2 with SMTP id
 a22-20020a05680802d600b00386e28c7ee2mr277403oid.3.1679085825849; Fri, 17 Mar
 2023 13:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-36-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-36-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Mar 2023 16:43:34 -0400
Message-ID: <CADnq5_PeuW1gTMmVP2no_aE8K-7m024Q0P8fBJDgH40Pw2Ex2A@mail.gmail.com>
Subject: Re: [PATCH 35/37] drm/amd/display/dc/dce60/Makefile: Fix previous
 attempt to silence known override-init warnings
To: Lee Jones <lee@kernel.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Mauro Rossi <issor.oruam@gmail.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Mar 17, 2023 at 4:23=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:157:21: =
note: in expansion of macro =E2=80=98mmCRTC1_DCFE_MEM_LIGHT_SLEEP_CNTL=E2=
=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_transform.h:170:9: note=
: in expansion of macro =E2=80=98SRI=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:183:17: =
note: in expansion of macro =E2=80=98XFM_COMMON_REG_LIST_DCE60=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:188:17: =
note: in expansion of macro =E2=80=98transform_regs=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_d.h:722:43: w=
arning: initialized field overwritten [-Woverride-init]
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:157:21: =
note: in expansion of macro =E2=80=98mmCRTC2_DCFE_MEM_LIGHT_SLEEP_CNTL=E2=
=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_transform.h:170:9: note=
: in expansion of macro =E2=80=98SRI=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:183:17: =
note: in expansion of macro =E2=80=98XFM_COMMON_REG_LIST_DCE60=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:189:17: =
note: in expansion of macro =E2=80=98transform_regs=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_d.h:722:43: n=
ote: (near initialization for =E2=80=98xfm_regs[2].DCFE_MEM_LIGHT_SLEEP_CN
>
> [100 lines snipped for brevity]
>
> Fixes: ceb3cf476a441 ("drm/amd/display/dc/dce60/Makefile: Ignore -Woverri=
de-init warning")
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Mauro Rossi <issor.oruam@gmail.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/dc/dce60/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce60/Makefile b/drivers/gpu/=
drm/amd/display/dc/dce60/Makefile
> index dda596fa1cd76..fee331accc0e7 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce60/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dce60/Makefile
> @@ -23,7 +23,7 @@
>  # Makefile for the 'controller' sub-component of DAL.
>  # It provides the control and status of HW CRTC block.
>
> -CFLAGS_AMDDALPATH)/dc/dce60/dce60_resource.o =3D $(call cc-disable-warni=
ng, override-init)
> +CFLAGS_$(AMDDALPATH)/dc/dce60/dce60_resource.o =3D $(call cc-disable-war=
ning, override-init)
>
>  DCE60 =3D dce60_timing_generator.o dce60_hw_sequencer.o \
>         dce60_resource.o
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>
