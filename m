Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C70360AF04
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 17:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDEC10E85B;
	Mon, 24 Oct 2022 15:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE93910E86C;
 Mon, 24 Oct 2022 15:27:06 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 a16-20020a056830101000b006619dba7fd4so6049639otp.12; 
 Mon, 24 Oct 2022 08:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nub8BP8GK64yoOEOVp/VCw/GranT7qsuMJj9rUXtDDA=;
 b=iRF9APagwpOQ6U/BO5CHcMMIOGjLT4OwMWfaw5FBv5PbU/XHsctLi/oMCwvapYDdHf
 E1rOp4GbohVg1TLh57BEG2CoR0sZHDgQjrWr/7bvOINl2I6Dn0Av24R9WDQF1Osg3PAY
 vVqADyKG2vPSRe2gJfT2tkk2sPwfa/Mer+ALTFz002xD37BMLVQZSQlQ4EEwkw/rl8Oe
 SwasYlGv4ZH4vdRO2ST+9D5OuPA+KTn3z3WHcdfiLBSKjQROE+EyODHCfrX0sg2TkZpb
 Zl9mlCx3Eq/togle/IHwzYUqWoOMza2xA/Ry8Yc1sBhHCKGRF3/rdUL0htUh+obpr2Xz
 pNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nub8BP8GK64yoOEOVp/VCw/GranT7qsuMJj9rUXtDDA=;
 b=IGBBFbOwBdUcdhCtK/7m9fptBch6nQF8Z4qcvVi07oxCUghNi63YFK7Ng9cSRxdm+T
 /iabJW5n8eM2pOkTEO+NE54Ij2uTYjG5u5Qnec4wFCU2k3B1Eu+2P3RpyB3uD33HpsKa
 P/k1+sT2zvZjNcbB8x4/eSPZCR/HdmKEj4/2c3JcrSeysMRzx3sLUstDDXpENDipPe3V
 82Ae2HyuRRxhUqU8ciNgPf66XBoXTkMXTY56qqFz0TxZK07wqm1hXYgLgV40nBaw5Oo1
 76Fcgp18vq27yZBuhvS8GjpP/TBuQOcCDZ/Qt/UdWfqF0qvkRVtxoKEBJTG+mfURE+Sh
 BHHQ==
X-Gm-Message-State: ACrzQf0g8iiA0C/bHJhMBvayCNdTozc/HUjEqilKxY6ziKLSStuKGV12
 oiLKmvujMn5+VvsyajNE2s2k4yD6gumpAz1EKzY00QAG
X-Google-Smtp-Source: AMsMyM4/bhQvenoyCezxgqiDKYW+75o2ItfjCqdf8xA2HZ030BPYzRlZPg6WCThDy7uDjX+ADkpnTzMDjEKqn02sK2c=
X-Received: by 2002:a9d:6645:0:b0:661:b778:41b8 with SMTP id
 q5-20020a9d6645000000b00661b77841b8mr17129566otm.233.1666625226162; Mon, 24
 Oct 2022 08:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221024151953.2238616-1-nathan@kernel.org>
In-Reply-To: <20221024151953.2238616-1-nathan@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Oct 2022 11:26:52 -0400
Message-ID: <CADnq5_PotEg3naWq111RKbRFsxSd_ETN4J8tE+V+fhhrJqCygg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix uninitialized warning in
 mmhub_v2_0_get_clockgating()
To: Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Tom Rix <trix@redhat.com>,
 Lijo Lazar <lijo.lazar@amd.com>, llvm@lists.linux.dev, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Oct 24, 2022 at 11:20 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang warns:
>
>   drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c:686:3: error: variable 'data' is uninitialized when used here [-Werror,-Wuninitialized]
>                   data |= MM_ATC_L2_MISC_CG__ENABLE_MASK;
>                   ^~~~
>   drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c:674:10: note: initialize the variable 'data' to silence this warning
>           int data, data1;
>                   ^
>                   = 0
>   1 error generated.
>
> This clearly should have just been a regular '=', as there was no prior
> assignment.
>
> Fixes: 7a4fad619819 ("drm/amdgpu: Remove ATC L2 access for MMHUB 2.1.x")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1748
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
> index 5ec6d17fed09..998b5d17b271 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
> @@ -683,7 +683,7 @@ static void mmhub_v2_0_get_clockgating(struct amdgpu_device *adev, u64 *flags)
>                 /* There is no ATCL2 in MMHUB for 2.1.x. Keep the status
>                  * based on DAGB
>                  */
> -               data |= MM_ATC_L2_MISC_CG__ENABLE_MASK;
> +               data = MM_ATC_L2_MISC_CG__ENABLE_MASK;
>                 data1 = RREG32_SOC15(MMHUB, 0, mmDAGB0_CNTL_MISC2_Sienna_Cichlid);
>                 break;
>         default:
>
> base-commit: fb5e487f910e1105019b883e8ed25e36e4bfd657
> --
> 2.38.1
>
