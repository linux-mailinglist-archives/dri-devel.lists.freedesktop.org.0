Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E073E4C1E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 20:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C702D89C93;
	Mon,  9 Aug 2021 18:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF7D89C84;
 Mon,  9 Aug 2021 18:28:38 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 d10-20020a9d4f0a0000b02904f51c5004e3so14655900otl.9; 
 Mon, 09 Aug 2021 11:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q+P56kv9bQ232dCkEySITmYOrGM+KOpFmBwsjS+8fhg=;
 b=WkUUG5bGWhQhQe25Xl2P/LeoFg4SyCoanFWnc4QYT6bgwTvHi/lBciWY3nGzny5EXU
 /31VZJ92VmwAG20/xpLWe2+qAEDLYEvHRNvAd50DMMdyc5LhAcXEXqQPwLQCzRtW4HXk
 P3UJSuYeNCRSw/O+V7DFdHFiOTwUlHEfSHyf5B1JBjgETFpleeSPNA+8LvFD9vAtHGKr
 RlDMOii0yNXocGLSrJeHi34l6CfBQRwUj9BnmNQQY02giQQXFNXhMpawjstNaiIFjthw
 tkh+fRm+brKZjJCrTC8HRtHBCIgMxB0KNyavNUylFzby84MH5vrwYaF8LAKS3EkxTlRz
 lLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q+P56kv9bQ232dCkEySITmYOrGM+KOpFmBwsjS+8fhg=;
 b=WaMNUWRDfBtUj2IMs+f5p9/FVdVpMePl93t5FRrSOGcwDgl0L9G9uwfja1HTe6xGAg
 mh08YOsLawVgLmX3ncvLrYIDvqPO6/e7f9/ajV9+cEphb/+iSJ55IdZGx/S+xVY/fQlt
 p79r4klxBzH7gzYSzihg5fSYNeoy4ErpPkfMYJhIGv7Yp33Nn/6+YqN7k9/Ev+PA5nGb
 l6MzPcjUHjC7WI3FiD5hK863nY5gT9AFovLAVLvUrs2VmRb12s58SmIUhzDk5ausTN5j
 HHho12yXWAhuzDFS26mfpMXdAxwq5zShK3WeofrvKg53jZg3BMwlMMKFCkYzTcA/8sJ0
 4ygg==
X-Gm-Message-State: AOAM531/DDU7eoqTASbA1mKhbLiaq1aEQ3DXRIGguVO5e4zqrwWruHSs
 oJLJRzNaOtYKQAkkTzbiEkHJCqee2GOa4HLI38c=
X-Google-Smtp-Source: ABdhPJyxsj5BZ1EB1iq1I8ieuBouSFvT1j8rHAFbxVO0Ltlury2vfDp5FYTHZsMeFpDw5r15HE2o2srv5b0dj7T5nFI=
X-Received: by 2002:a9d:70c3:: with SMTP id w3mr17546162otj.311.1628533718180; 
 Mon, 09 Aug 2021 11:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210807233842.13545-1-rdunlap@infradead.org>
In-Reply-To: <20210807233842.13545-1-rdunlap@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Aug 2021 14:28:27 -0400
Message-ID: <CADnq5_PDnbDU04pHQYm8AeyXGPshAQuH1OmCgEyRLXaCMPwRYQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix kernel-doc warnings on non-kernel-doc
 comments
To: Randy Dunlap <rdunlap@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Dennis Li <Dennis.Li@amd.com>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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

On Sat, Aug 7, 2021 at 7:38 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Don't use "begin kernel-doc notation" (/**) for comments that are
> not kernel-doc. This eliminates warnings reported by the 0day bot.
>
> drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:89: warning: This comment starts =
with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/k=
ernel-doc.rst
>     * This shader is used to clear VGPRS and LDS, and also write the inpu=
t
> drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:209: warning: This comment starts=
 with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/=
kernel-doc.rst
>     * The below shaders are used to clear SGPRS, and also write the input
> drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:301: warning: This comment starts=
 with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/=
kernel-doc.rst
>     * This shader is used to clear the uninitiated sgprs after the above
>
> Fixes: 0e0036c7d13b ("drm/amdgpu: fix no full coverage issue for gprs ini=
tialization")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: Dennis Li <Dennis.Li@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> --- linux-next-20210806.orig/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
> +++ linux-next-20210806/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
> @@ -85,7 +85,7 @@ static const struct soc15_reg_golden gol
>         SOC15_REG_GOLDEN_VALUE(GC, 0, regTCI_CNTL_3, 0xff, 0x20),
>  };
>
> -/**
> +/*
>   * This shader is used to clear VGPRS and LDS, and also write the input
>   * pattern into the write back buffer, which will be used by driver to
>   * check whether all SIMDs have been covered.
> @@ -206,7 +206,7 @@ const struct soc15_reg_entry vgpr_init_r
>         { SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE7), 0xff=
ffffff },
>  };
>
> -/**
> +/*
>   * The below shaders are used to clear SGPRS, and also write the input
>   * pattern into the write back buffer. The first two dispatch should be
>   * scheduled simultaneously which make sure that all SGPRS could be
> @@ -302,7 +302,7 @@ const struct soc15_reg_entry sgpr96_init
>         { SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE7), 0xff=
ffffff },
>  };
>
> -/**
> +/*
>   * This shader is used to clear the uninitiated sgprs after the above
>   * two dispatches, because of hardware feature, dispath 0 couldn't clear
>   * top hole sgprs. Therefore need 4 waves per SIMD to cover these sgprs
