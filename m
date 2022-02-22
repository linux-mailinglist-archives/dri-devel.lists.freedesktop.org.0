Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 948B14BFEF6
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 17:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D88910E750;
	Tue, 22 Feb 2022 16:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D329A10E750;
 Tue, 22 Feb 2022 16:38:13 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id j2so15127639oie.7;
 Tue, 22 Feb 2022 08:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gGjkIZdn8iDygTC74bA8nSai9fnVzHtbdRMYVYGrfT4=;
 b=pMIIbsd55BhAHXzDncwJDFaoOpcF1JY1qxQPilcyT26Qxu/McqAW3L2Oc4KYVG3IE3
 0fawyyZe7TzzanS8DKSyt/POvD+2k06/UEHiMLmuEiKYnYRKmKtdkfuWEM776cY1yZl3
 +TuLtOD1Mie67XV1QiKXv0iuCeCfewE6DJSh65Sg+gR9bH7hFtT4FAHaWsViIGCSobT3
 4P1Os4tfO+IQ3sjbD9iv0zCMnnqyDr3xCsIPzGy3aOwIwmbejNBxAT58re5XcOe2VFIl
 ZRx0ps3lJe+LD5EyVwxlQ7B7MQj59n+nHbuUa81q21Z4o3secnKC031WczgJ1bx2QlmF
 SPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gGjkIZdn8iDygTC74bA8nSai9fnVzHtbdRMYVYGrfT4=;
 b=AGhaj2sxJWbyJkj1hexSUT+GuPG61IPRwPbdWF9r1po7OgsV1IrxYY2k8Ay8+HPCcr
 uWfjXvVM4xneFNsdUgfJYqbEH5lTbzfh07SO1qPlnu95HRwlSQgZfjoNzgYAKcK30nZQ
 FoievOn92ui/V91zDQR6zZ27fdYJHktUJISk57CVAOpim+Om3MUwU66haNEKExp8oHdm
 27k1+O2ehW6DEFSX/YojhUaBdG7pvtONBWMcV/eO6gGpNDEXzr+KjuPNIbb9ZsXgArUo
 qhV3tC2AX9fwR2ehZNIV1vm6EZ9ElDDlgt70SsKrzjt98oseNVMb9CDBQt0r3V7caLh5
 vLDg==
X-Gm-Message-State: AOAM531Ucomic1TUjwKz9ZN3ZdSnf4N1Npz1G19It2Z+x8lImZyZQNEM
 qZjJaMZBlockctZGs1PtOgJ55hoIHVPjsd2Z9pk=
X-Google-Smtp-Source: ABdhPJzmfTAp4Sj4WVRbXm3Si8HXcxr7ff9pQ3CcSdD+6jcXlEyVCZXJw1HrD4rfTNApYpY6u/vtBTcW+BrNV5f0OxQ=
X-Received: by 2002:aca:ab4c:0:b0:2d4:7c7d:606e with SMTP id
 u73-20020acaab4c000000b002d47c7d606emr2389607oie.132.1645547893097; Tue, 22
 Feb 2022 08:38:13 -0800 (PST)
MIME-Version: 1.0
References: <20220222131701.356117-1-maira.canal@usp.br>
 <20220222131701.356117-7-maira.canal@usp.br>
In-Reply-To: <20220222131701.356117-7-maira.canal@usp.br>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Feb 2022 11:38:02 -0500
Message-ID: <CADnq5_O_YzwjBOBv8_ifZHZQy2rmOyC5d4n1bEeL3Xw0w6JEkg@mail.gmail.com>
Subject: Re: [PATCH 06/10] drm/amd/display: Remove vupdate_int_entry definition
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
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
Cc: "Tuikov, Luben" <luben.tuikov@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, "Joshi, Mukul" <mukul.joshi@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mwen@igalia.com, "Chai, Thomas" <YiPeng.Chai@amd.com>,
 "Stanley.Yang" <Stanley.Yang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Magali Lemes <magalilemes00@gmail.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Isabella Basso <isabbasso@riseup.net>,
 John Clements <john.clements@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Feb 22, 2022 at 8:18 AM Ma=C3=ADra Canal <maira.canal@usp.br> wrote=
:
>
> Remove the vupdate_int_entry definition and utilization to avoid the
> following warning by Clang:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:41=
0:2:
> warning: initializer overrides prior initialization of this subobject
> [-Winitializer-overrides]
>     vupdate_no_lock_int_entry(0),
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:28=
0:39:
> note: expanded from macro 'vupdate_no_lock_int_entry'
>     [DC_IRQ_SOURCE_VUPDATE1 + reg_num] =3D {\
>     ^~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:40=
4:2:
> note: previous initialization is here
>     vupdate_int_entry(0),
>     ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:26=
9:39:
> note: expanded from macro 'vupdate_int_entry'
>     [DC_IRQ_SOURCE_VUPDATE1 + reg_num] =3D {\
>     ^~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:41=
1:2:
> warning: initializer overrides prior initialization of this subobject
> [-Winitializer-overrides]
>     vupdate_no_lock_int_entry(1),
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:28=
0:39:
> note: expanded from macro 'vupdate_no_lock_int_entry'
>     [DC_IRQ_SOURCE_VUPDATE1 + reg_num] =3D {\
>     ^~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:40=
5:2:
> note: previous initialization is here
>     vupdate_int_entry(1),
>     ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:26=
9:39:
> note: expanded from macro 'vupdate_int_entry'
>     [DC_IRQ_SOURCE_VUPDATE1 + reg_num] =3D {\
>     ^~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:41=
2:2:
> warning: initializer overrides prior initialization of this subobject
> [-Winitializer-overrides]
>     vupdate_no_lock_int_entry(2),
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:28=
0:39:
> note: expanded from macro 'vupdate_no_lock_int_entry'
>     [DC_IRQ_SOURCE_VUPDATE1 + reg_num] =3D {\
>     ^~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:40=
6:2:
> note: previous initialization is here
>     vupdate_int_entry(2),
>     ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:26=
9:39:
> note: expanded from macro 'vupdate_int_entry'
>     [DC_IRQ_SOURCE_VUPDATE1 + reg_num] =3D {\
>     ^~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:41=
3:2:
> warning: initializer overrides prior initialization of this subobject
> [-Winitializer-overrides]
>     vupdate_no_lock_int_entry(3),
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:28=
0:39:
> note: expanded from macro 'vupdate_no_lock_int_entry'
>     [DC_IRQ_SOURCE_VUPDATE1 + reg_num] =3D {\
>     ^~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:40=
7:2:
> note: previous initialization is here
>     vupdate_int_entry(3),
>     ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:26=
9:39:
> note: expanded from macro 'vupdate_int_entry'
>     [DC_IRQ_SOURCE_VUPDATE1 + reg_num] =3D {\
>     ^~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:41=
4:2:
> warning: initializer overrides prior initialization of this subobject
> [-Winitializer-overrides]
>     vupdate_no_lock_int_entry(4),
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:28=
0:39:
> note: expanded from macro 'vupdate_no_lock_int_entry'
>     [DC_IRQ_SOURCE_VUPDATE1 + reg_num] =3D {\
>     ^~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:40=
8:2:
> note: previous initialization is here
>     vupdate_int_entry(4),
>     ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:26=
9:39:
> note: expanded from macro 'vupdate_int_entry'
>     [DC_IRQ_SOURCE_VUPDATE1 + reg_num] =3D {\
>     ^~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:41=
5:2:
> warning: initializer overrides prior initialization of this subobject
> [-Winitializer-overrides]
>     vupdate_no_lock_int_entry(5),
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:28=
0:39:
> note: expanded from macro 'vupdate_no_lock_int_entry'
>     [DC_IRQ_SOURCE_VUPDATE1 + reg_num] =3D {\
>     ^~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:40=
9:2:
> note: previous initialization is here
>     vupdate_int_entry(5),
>     ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:26=
9:39:
> note: expanded from macro 'vupdate_int_entry'
>         [DC_IRQ_SOURCE_VUPDATE1 + reg_num] =3D {\
>         ^~
> 6 warnings generated.
>
> fixes: 688f97ed ("drm/amd/display: Add vupdate_no_lock interrupts for
> DCN2.1")
>
> Signed-off-by: Ma=C3=ADra Canal <maira.canal@usp.br>
> ---
>  .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   | 14 --------------
>  1 file changed, 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c=
 b/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
> index 0f15bcada4e9..717977aec6d0 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
> @@ -265,14 +265,6 @@ static const struct irq_source_info_funcs vline0_irq=
_info_funcs =3D {
>                 .funcs =3D &pflip_irq_info_funcs\
>         }
>
> -#define vupdate_int_entry(reg_num)\
> -       [DC_IRQ_SOURCE_VUPDATE1 + reg_num] =3D {\
> -               IRQ_REG_ENTRY(OTG, reg_num,\
> -                       OTG_GLOBAL_SYNC_STATUS, VUPDATE_INT_EN,\
> -                       OTG_GLOBAL_SYNC_STATUS, VUPDATE_EVENT_CLEAR),\
> -               .funcs =3D &vblank_irq_info_funcs\
> -       }
> -
>  /* vupdate_no_lock_int_entry maps to DC_IRQ_SOURCE_VUPDATEx, to match se=
mantic
>   * of DCE's DC_IRQ_SOURCE_VUPDATEx.
>   */
> @@ -401,12 +393,6 @@ irq_source_info_dcn21[DAL_IRQ_SOURCES_NUMBER] =3D {
>         dc_underflow_int_entry(6),
>         [DC_IRQ_SOURCE_DMCU_SCP] =3D dummy_irq_entry(),
>         [DC_IRQ_SOURCE_VBIOS_SW] =3D dummy_irq_entry(),
> -       vupdate_int_entry(0),
> -       vupdate_int_entry(1),
> -       vupdate_int_entry(2),
> -       vupdate_int_entry(3),
> -       vupdate_int_entry(4),
> -       vupdate_int_entry(5),
>         vupdate_no_lock_int_entry(0),
>         vupdate_no_lock_int_entry(1),
>         vupdate_no_lock_int_entry(2),
> --
> 2.35.1
>
