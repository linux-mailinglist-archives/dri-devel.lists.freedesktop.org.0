Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15828A6DA70
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 13:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780DC10E2F8;
	Mon, 24 Mar 2025 12:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cjqGr3+m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B7310E2EC;
 Mon, 24 Mar 2025 12:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742820885; x=1774356885;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=5Yofkm1dNa6vGniR8xlKP/z1QwhPxmHysFr4OgO1Qtk=;
 b=cjqGr3+m94657UAMQLtc5dieGJiIS9TGNrVmcPeWCHxonAzFoWvgzKC7
 oSA1NoGK3s4tb8MfTVtFk7tnFn91Ehd/+tfihgLuk/NEspALOADXCQHQO
 iw5rUlIOMX7wfIs9SXxcrKpteJNuibdYOFTjK4s0f/oTpB4Oz6/b6rkUf
 KWNHXCqv4hbDYd9hBe6QkpnT+5sJSVC47yvgsgeJl9tOdPglfBN+gKtjM
 36IFyU9Pv3BBednbov7TmpTHc5vXm2Yj7HUvbMWa0A6s8yViGHrkMWQ7H
 UqMzx3qGzM1tv9OjAaJHp2W/i18PkAtxRp+OUPyMyR2/jp7P9TY/kadl5 Q==;
X-CSE-ConnectionGUID: wYQAu+gSQsCeUqJXvGHcIw==
X-CSE-MsgGUID: ZkhTfKS/Q8ewIJdbZQRriw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43178732"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="43178732"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 05:54:44 -0700
X-CSE-ConnectionGUID: YsdPNGcISjGrFVNme+iMeg==
X-CSE-MsgGUID: IBn7zjQUQz60GGLw/GwisQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="147243419"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.30])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 05:54:39 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Damian Tometzki <damian@riscv-rocks.de>, Kees Cook <kees@kernel.org>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.wang.linux@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gvt: Add __nonstring annotations for
 unterminated strings
In-Reply-To: <01070195c306db7f-9f28efdd-9456-4db3-b6c6-343298bd571b-000000@eu-central-1.amazonses.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250310222355.work.417-kees@kernel.org>
 <01070195c306db7f-9f28efdd-9456-4db3-b6c6-343298bd571b-000000@eu-central-1.amazonses.com>
Date: Mon, 24 Mar 2025 14:54:36 +0200
Message-ID: <87r02ma8s3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Sun, 23 Mar 2025, Damian Tometzki <damian@riscv-rocks.de> wrote:
> On Mon, 10. Mar 15:23, Kees Cook wrote:
>> When a character array without a terminating NUL character has a static
>> initializer, GCC 15's -Wunterminated-string-initialization will only
>> warn if the array lacks the "nonstring" attribute[1]. Mark the arrays
>> with __nonstring to and correctly identify the char array as "not a C
>> string" and thereby eliminate the warning.
>>=20
>> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D117178 [1]
>> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
>> Cc: Zhi Wang <zhi.wang.linux@gmail.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: intel-gvt-dev@lists.freedesktop.org
>> Cc: intel-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Kees Cook <kees@kernel.org>
>> ---
>>  drivers/gpu/drm/i915/gvt/opregion.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/=
gvt/opregion.c
>> index 509f9ccae3a9..f701638d3145 100644
>> --- a/drivers/gpu/drm/i915/gvt/opregion.c
>> +++ b/drivers/gpu/drm/i915/gvt/opregion.c
>> @@ -43,7 +43,7 @@
>>  #define DEVICE_TYPE_EFP4   0x10
>>=20=20
>>  struct opregion_header {
>> -	u8 signature[16];
>> +	u8 signature[16] __nonstring;

Why would this annotation be needed? It's not treated as a string
anywhere, and it's u8 not char.

>>  	u32 size;
>>  	u32 opregion_ver;
>>  	u8 bios_ver[32];
>> @@ -222,7 +222,7 @@ int intel_vgpu_init_opregion(struct intel_vgpu *vgpu)
>>  	u8 *buf;
>>  	struct opregion_header *header;
>>  	struct vbt v;
>> -	const char opregion_signature[16] =3D OPREGION_SIGNATURE;
>> +	const char opregion_signature[16] __nonstring =3D OPREGION_SIGNATURE;
>>=20=20
>>  	gvt_dbg_core("init vgpu%d opregion\n", vgpu->id);
>>  	vgpu_opregion(vgpu)->va =3D (void *)__get_free_pages(GFP_KERNEL |
>> --=20
>> 2.34.1
>>=20
> Hello together,
>
> it doesnt resolve the build issue with gcc15 gcc (GCC) 15.0.1 20250228
>
> CC [M]  drivers/gpu/drm/i915/gvt/scheduler.o
> /home/damian/kernel/linux/drivers/gpu/drm/i915/gvt/opregion.c: In functio=
n =E2=80=98intel_vgpu_init_opregion=E2=80=99:
> /home/damian/kernel/linux/drivers/gpu/drm/i915/gvt/opregion.c:35:28: erro=
r: initializer-string for array of =E2=80=98char=E2=80=99 is too long [-Wer=
ror=3Dunterminated-string-initialization]
>    35 | #define OPREGION_SIGNATURE "IntelGraphicsMem"
>       |                            ^~~~~~~~~~~~~~~~~~
> /home/damian/kernel/linux/drivers/gpu/drm/i915/gvt/opregion.c:225:57: not=
e: in expansion of macro =E2=80=98OPREGION_SIGNATURE=E2=80=99
>   225 |         const char opregion_signature[16] __nonstring =3D OPREGIO=
N_SIGNATURE;
>       |                                                         ^~~~~~~~~=
~~~~~~~~~
>   CC [M]  drivers/gpu/drm/i915/gvt/trace_points.o
> cc1: all warnings being treated as errors
> make[7]: *** [/home/damian/kernel/linux/scripts/Makefile.build:207: drive=
rs/gpu/drm/i915/gvt/opregion.o] Error 1
> make[7]: *** Waiting for unfinished jobs....
>   CC [M]  drivers/gpu/drm/i915/gvt/vgpu.o
> make[6]: *** [/home/damian/kernel/linux/scripts/Makefile.build:465: drive=
rs/gpu/drm/i915] Error 2
> make[5]: *** [/home/damian/kernel/linux/s

What about this?

IMO it's anyway good practice to use sizeof(dest) rather than
sizeof(src) for memcpy.


diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt=
/opregion.c
index 509f9ccae3a9..dbad4d853d3a 100644
--- a/drivers/gpu/drm/i915/gvt/opregion.c
+++ b/drivers/gpu/drm/i915/gvt/opregion.c
@@ -222,7 +222,6 @@ int intel_vgpu_init_opregion(struct intel_vgpu *vgpu)
 	u8 *buf;
 	struct opregion_header *header;
 	struct vbt v;
-	const char opregion_signature[16] =3D OPREGION_SIGNATURE;
=20
 	gvt_dbg_core("init vgpu%d opregion\n", vgpu->id);
 	vgpu_opregion(vgpu)->va =3D (void *)__get_free_pages(GFP_KERNEL |
@@ -236,8 +235,10 @@ int intel_vgpu_init_opregion(struct intel_vgpu *vgpu)
 	/* emulated opregion with VBT mailbox only */
 	buf =3D (u8 *)vgpu_opregion(vgpu)->va;
 	header =3D (struct opregion_header *)buf;
-	memcpy(header->signature, opregion_signature,
-	       sizeof(opregion_signature));
+
+	static_assert(sizeof(header->signature) =3D=3D sizeof(OPREGION_SIGNATURE)=
 - 1);
+	memcpy(header->signature, OPREGION_SIGNATURE, sizeof(header->signature));
+
 	header->size =3D 0x8;
 	header->opregion_ver =3D 0x02000000;
 	header->mboxes =3D MBOX_VBT;



--=20
Jani Nikula, Intel
