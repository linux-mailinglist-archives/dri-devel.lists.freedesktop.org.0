Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B67924FAE17
	for <lists+dri-devel@lfdr.de>; Sun, 10 Apr 2022 15:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F328710F5B6;
	Sun, 10 Apr 2022 13:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CCC10F5B6;
 Sun, 10 Apr 2022 13:54:24 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id s14so2164763plk.8;
 Sun, 10 Apr 2022 06:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x6PPcktaF21f9upBr78QhnzJ6O8/NNRSC9H7jHUfSVk=;
 b=ZjHOKGewNdnoyQoQ4+1sMIO8mNsZhtZaCNu9dp5a8tS4dNARaGpGcdmZcDMdOWfVeg
 yzXhcLB4TUYDN0aR1aAYJNtzwekjRzHML2CS44Hsj9Nq6N8Z+6sSeJNkYjdNSXNug9ME
 19wiBrNc/ELmqRsVn0ooD+iaz5PeLfpUaZqthT4ghSkWPXxMRC75gLRTP19FKSDkEW+U
 ifaHJsD6A6XUS12X3mpM5Yk11q6cM74ZNCTWk+PlLosRiCn0lFk3vNU2EjXjBJI7i84K
 zXR+0/Xw7EeCTOHgpbtEoQZEv4IBPoS6cNiotAlmyKt2dc5l6Dt7qpHHBPqe69Yw5y9Y
 9b1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x6PPcktaF21f9upBr78QhnzJ6O8/NNRSC9H7jHUfSVk=;
 b=wMaxba8lNQozD9ptWMUT+6WkogcpcPRY9g06321aEHKGbvD7TI2qOpsUeRz7wMHLt4
 eCxLAK4KRRvQbHtmgCKTCHRPFWHa+HQg7xDZxzNR0iIH+ukpUiou3mWf+BGbCY62E8dS
 23209kMnbREVCpCNtjfNt3ZwTzU4T6xdi24jE0zTRC/IYIdVUSG5pAswZQU2vxQVmkRP
 irsRaiDKEJUiE0MlTg/4lejR6LL0h+SALI+EIazNinSejAEUe+uhNieSFlwE3ZhB1QpY
 q5YRy+/RcKJNZNKU7RX5VR4usfG5cmJ+mMQ48I2bI2dZUjS3ocfbuCtwJgbJ53/FP//O
 oXYA==
X-Gm-Message-State: AOAM530A8SbkK7bGHTHXH8WVmBvp4GEZcB9oe0UQ3MPpInJzpaJWX6No
 PsP+g44l0WtJgG2wDbTbVr4wi8oQPYfl4wiXOoE=
X-Google-Smtp-Source: ABdhPJwAYqqtu5JKbjkVTCMYYki1aCO23WJJdbnSso/mGJ4qP4dpMjUc/s3jbcVxPjYW+/LgB1u4EGGbImKyzoqr3WU=
X-Received: by 2002:a17:90b:224f:b0:1c9:949e:2202 with SMTP id
 hk15-20020a17090b224f00b001c9949e2202mr31585598pjb.56.1649598863849; Sun, 10
 Apr 2022 06:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220408190502.4103670-1-richard.gong@amd.com>
In-Reply-To: <20220408190502.4103670-1-richard.gong@amd.com>
From: =?UTF-8?Q?Nils_Wallm=C3=A9nius?= <nils.wallmenius@gmail.com>
Date: Sun, 10 Apr 2022 15:54:12 +0200
Message-ID: <CA+nq7DsCU97Ana34GcyQZ_GzR4eiQbzkzPLUBRQTAtNYa-OiLA@mail.gmail.com>
Subject: Re: [PATCHv2] drm/amdgpu: disable ASPM on Intel AlderLake based
 systems
To: Richard Gong <richard.gong@amd.com>
Content-Type: multipart/alternative; boundary="0000000000004d3d6905dc4d2aff"
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
Cc: amd-gfx@lists.freedesktop.org, airlied@linux.ie, xinhui.pan@amd.com,
 linux-kernel@vger.kernel.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mario.limonciello@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000004d3d6905dc4d2aff
Content-Type: text/plain; charset="UTF-8"

Hi Richard, see inline comment.

Den fre 8 apr. 2022 21:05Richard Gong <richard.gong@amd.com> skrev:

> Active State Power Management (ASPM) feature is enabled since kernel 5.14.
> There are some AMD GFX cards (such as WX3200 and RX640) that cannot be
> used with Intel AlderLake based systems to enable ASPM. Using these GFX
> cards as video/display output, Intel Alder Lake based systems will hang
> during suspend/resume.
>
> Add extra check to disable ASPM on Intel AlderLake based systems.
>
> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
> Signed-off-by: Richard Gong <richard.gong@amd.com>
> ---
> v2: correct commit description
>     move the check from chip family to problematic platform
> ---
>  drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c
> b/drivers/gpu/drm/amd/amdgpu/vi.c
> index 039b90cdc3bc..8b4eaf54b23e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> @@ -81,6 +81,10 @@
>  #include "mxgpu_vi.h"
>  #include "amdgpu_dm.h"
>
> +#if IS_ENABLED(CONFIG_X86_64)
> +#include <asm/intel-family.h>
> +#endif
> +
>  #define ixPCIE_LC_L1_PM_SUBSTATE       0x100100C6
>  #define PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK
>  0x00000001L
>  #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK   0x00000002L
> @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct amdgpu_device
> *adev)
>                 WREG32_PCIE(ixPCIE_LC_CNTL, data);
>  }
>

There's a typo in the new function name apsm/aspm. Btw might be worth a
comment why this check is done?

Regards
Nils


> +static bool intel_core_apsm_chk(void)
> +{
> +#if IS_ENABLED(CONFIG_X86_64)
> +       struct cpuinfo_x86 *c = &cpu_data(0);
> +
> +       return (c->x86 == 6 && c->x86_model == INTEL_FAM6_ALDERLAKE);
> +#else
> +       return false;
> +#endif
> +}
> +
>  static void vi_program_aspm(struct amdgpu_device *adev)
>  {
>         u32 data, data1, orig;
>         bool bL1SS = false;
>         bool bClkReqSupport = true;
>
> -       if (!amdgpu_device_should_use_aspm(adev))
> +       if (!amdgpu_device_should_use_aspm(adev) || intel_core_apsm_chk())
>                 return;
>
>         if (adev->flags & AMD_IS_APU ||
> --
> 2.25.1
>
>

--0000000000004d3d6905dc4d2aff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Richard, see inline comment.<br><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Den fre 8 apr. 2022 21:=
05Richard Gong &lt;<a href=3D"mailto:richard.gong@amd.com">richard.gong@amd=
.com</a>&gt; skrev:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Active State Po=
wer Management (ASPM) feature is enabled since kernel 5.14.<br>
There are some AMD GFX cards (such as WX3200 and RX640) that cannot be<br>
used with Intel AlderLake based systems to enable ASPM. Using these GFX<br>
cards as video/display output, Intel Alder Lake based systems will hang<br>
during suspend/resume.<br>
<br>
Add extra check to disable ASPM on Intel AlderLake based systems.<br>
<br>
Fixes: 0064b0ce85bb (&quot;drm/amd/pm: enable ASPM by default&quot;)<br>
Link: <a href=3D"https://gitlab.freedesktop.org/drm/amd/-/issues/1885" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.freedesktop.org=
/drm/amd/-/issues/1885</a><br>
Signed-off-by: Richard Gong &lt;<a href=3D"mailto:richard.gong@amd.com" tar=
get=3D"_blank" rel=3D"noreferrer">richard.gong@amd.com</a>&gt;<br>
---<br>
v2: correct commit description<br>
=C2=A0 =C2=A0 move the check from chip family to problematic platform<br>
---<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-<br>
=C2=A01 file changed, 16 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/v=
i.c<br>
index 039b90cdc3bc..8b4eaf54b23e 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/vi.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c<br>
@@ -81,6 +81,10 @@<br>
=C2=A0#include &quot;mxgpu_vi.h&quot;<br>
=C2=A0#include &quot;amdgpu_dm.h&quot;<br>
<br>
+#if IS_ENABLED(CONFIG_X86_64)<br>
+#include &lt;asm/intel-family.h&gt;<br>
+#endif<br>
+<br>
=C2=A0#define ixPCIE_LC_L1_PM_SUBSTATE=C2=A0 =C2=A0 =C2=A0 =C2=A00x100100C6=
<br>
=C2=A0#define PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK=C2=
=A0 =C2=A0 =C2=A0 =C2=A00x00000001L<br>
=C2=A0#define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK=C2=A0 =
=C2=A00x00000002L<br>
@@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct amdgpu_device *ad=
ev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WREG32_PCIE(ixPCIE_=
LC_CNTL, data);<br>
=C2=A0}<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockq=
uote></div></div><div dir=3D"auto">There&#39;s a typo in the new function n=
ame apsm/aspm. Btw might be worth a comment why this check is done?</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Regards</div><div dir=3D"auto">=
Nils</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><br></blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
+static bool intel_core_apsm_chk(void)<br>
+{<br>
+#if IS_ENABLED(CONFIG_X86_64)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct cpuinfo_x86 *c =3D &amp;cpu_data(0);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return (c-&gt;x86 =3D=3D 6 &amp;&amp; c-&gt;x86=
_model =3D=3D INTEL_FAM6_ALDERLAKE);<br>
+#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+#endif<br>
+}<br>
+<br>
=C2=A0static void vi_program_aspm(struct amdgpu_device *adev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 data, data1, orig;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool bL1SS =3D false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool bClkReqSupport =3D true;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!amdgpu_device_should_use_aspm(adev))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!amdgpu_device_should_use_aspm(adev) || int=
el_core_apsm_chk())<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (adev-&gt;flags &amp; AMD_IS_APU ||<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div></div>

--0000000000004d3d6905dc4d2aff--
