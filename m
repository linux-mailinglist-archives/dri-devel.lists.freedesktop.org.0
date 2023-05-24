Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3590970FE7C
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 21:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8EB510E5F7;
	Wed, 24 May 2023 19:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E52710E5ED;
 Wed, 24 May 2023 19:22:33 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3980f932206so452412b6e.1; 
 Wed, 24 May 2023 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684956152; x=1687548152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S2MKQchWUI0FAkJHrQVirdj5xxCSU2CZ+/GrJRPq7B8=;
 b=qmcA7bO+beP8btIoBYHwlyAwgiDEqzN6A1J0CvnsA911MD/8axY2IazqByJunWum8v
 ff5MHC6Nv0BhDOZ1jh6ZzFKh7yXQ/dqPfbsqiixPqW+xDoLLuaMNN9wYgf5onfgt8ttO
 R4TNEtErOuIX9D/cWyZYCGvo7kKNMjzRn+gP9RNwsKFQ5XdwAYd6WjNply4dSc35lILj
 G3M6RM8aPa2h9mxWRDqFYuBD0bhw1oHO1PkYiGiCa1RlTISx711Yo/2sbeMtvgulKCXW
 SVkdV4hyAKdNmFqy2mIKteOwn+vbM6hpPmlJDQctv/PJIAHwq3BjqL59lNeMcdsKLdFv
 FXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684956152; x=1687548152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S2MKQchWUI0FAkJHrQVirdj5xxCSU2CZ+/GrJRPq7B8=;
 b=DxTGtFMGlIYQvgyNvejU/wcbikBSEmoNxYOIqVbjqDZmimR5JMpyFvBtm35sn2mYJT
 eTMfyyl22aOW+lbLSWuRhBudYqdpWlmKuFwWjmcFUpCvV+aGDQ5fN8IGhmrPriZlSJgg
 YnhO42nHkXLShuSOMuWBiaSviQkzWaVLDQGCQfbmZz2eZt+R6E8gHfhMVbJGKZqXA6Iw
 SIY78rSKcc3A4ZyMJprmLRFJKrHIS+QVqBDeSukqVKXYmZegQBJr9i2SuJM5DHUdzUcD
 EyVmsiXEqNKEjwbtS92RXYKp1WU9m6t3pIy0FufqnTByCVm2xMlvpbsJdqDgMY7fixwf
 HdLw==
X-Gm-Message-State: AC+VfDx9AFPCqcI2eJWXFKTJHSZd+J+TM4xtRdkm/vubR6qKSXfjiqDi
 rJ/DVYCt9amoEqpmxd5gHLo4mPrPeYZsfZ5agcg=
X-Google-Smtp-Source: ACHHUZ6+o43wIGXEkDmzv0/0EngB13qldFCGeSitptxs3zpaCN7kPY6u37qi2JoztOJVQXZzTysmEZNfLSW0dIKL58U=
X-Received: by 2002:a05:6808:3b4:b0:397:f715:5e6e with SMTP id
 n20-20020a05680803b400b00397f7155e6emr6895688oie.56.1684956152482; Wed, 24
 May 2023 12:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230524191955.252212-1-hamza.mahfooz@amd.com>
In-Reply-To: <20230524191955.252212-1-hamza.mahfooz@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 24 May 2023 15:22:21 -0400
Message-ID: <CADnq5_Mz6aPFYGnr8J8C8UeTpbo7JDg+uvjqAxo7o4vmTGej2A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: enable more strict compile checks
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, Kenny Ho <kenny.ho@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 3:20=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@amd.co=
m> wrote:
>
> Currently, there are quite a number of issues that are quite easy for
> the CI to catch, that slip through the cracks. Among them, there are
> unused variable and indentation issues. Also, we should consider all
> warnings to be compile errors, since the community will eventually end
> up complaining about them. So, enable -Werror, -Wunused and
> -Wmisleading-indentation for all kernel builds.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Kenny Ho <kenny.ho@amd.com>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
> v2: fix grammatical error
> ---
>  drivers/gpu/drm/amd/display/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/Makefile b/drivers/gpu/drm/amd/d=
isplay/Makefile
> index 0d610cb376bb..3c44162ebe21 100644
> --- a/drivers/gpu/drm/amd/display/Makefile
> +++ b/drivers/gpu/drm/amd/display/Makefile
> @@ -26,6 +26,8 @@
>
>  AMDDALPATH =3D $(RELATIVE_AMD_DISPLAY_PATH)
>
> +subdir-ccflags-y +=3D -Werror -Wunused -Wmisleading-indentation
> +

Care to enable this for the rest of amdgpu as well?  Or send out an
additional patch to do that?  Either way:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Alex

>  subdir-ccflags-y +=3D -I$(FULL_AMD_DISPLAY_PATH)/dc/inc/
>  subdir-ccflags-y +=3D -I$(FULL_AMD_DISPLAY_PATH)/dc/inc/hw
>  subdir-ccflags-y +=3D -I$(FULL_AMD_DISPLAY_PATH)/dc/clk_mgr
> --
> 2.40.1
>
