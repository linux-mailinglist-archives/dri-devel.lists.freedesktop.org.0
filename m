Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4F129FC3B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 04:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780696E94A;
	Fri, 30 Oct 2020 03:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1F36E94A;
 Fri, 30 Oct 2020 03:35:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n15so4963529wrq.2;
 Thu, 29 Oct 2020 20:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=059naSWfurNn2aUNwcfHXakrr4O73rHmWhbtYJ5BFu4=;
 b=sN1W6qxW83FwgI/hiYVad7M010tIqNjEifXVM+igY/j76qLOP+HDuyUAJ6lxaOiQgm
 1RoOtyvcl48nwtECpAlxj5kTcUZ3v6GYXEJSw6dzSLsIYJiXcC7igmcZNR+LptJtiEt8
 CkANG3NRGkZ0yQdx/gJD4g8D38NJEqYqJzqvH1pu9W7NzzzpFn3sNyp+o4vQ1Fv8v6HY
 Ew7T/W6oYINd/0Xa6czUH3zJ4b8wG52IH/6H5mLnpoBmcoj6EooUcpFKXeWXw5TpEAbQ
 fYLLezTyHmttOcx3xHgcToQmzn8o3+ArxM3sBIh6Y3aSU2Bykydo5p7Lqpy1VKTtK8ej
 VNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=059naSWfurNn2aUNwcfHXakrr4O73rHmWhbtYJ5BFu4=;
 b=CiEiwiaKleOyECgQHF07hZzK5whwB2yuN/R1DKbOgMn+F1gZ6cFMIJGPNboj9q4dHN
 YySI4GHWNm0MZnefRNZUxmfE5LnUleHu3hxmgL9ASsGDSqTpbLIEAPF2KqVTUDlAtxnt
 kqlSUO57a8KsZL9YGZLVUKE+xipSrQlQAYFQ6jeiIq/8TontYAwKzowQC7nEEr2w2euY
 K8yWBrYtjGM6aHwr0NYHKSHWeS4nu8QNjQ7x9oRa6HHZsE2D1Uu39plUS+QYO3ItE+nB
 Dc8RPRSwHA7sQqZg4Dak72G+/PjPpiefltpWMx/QGrHwsnPTCmtRg/qI3uX5Z43fRZEa
 V5kw==
X-Gm-Message-State: AOAM533flHydkmAF6j58lSkkFkr9lBoyIBHmDe+MCbby4XmvCuaMIxnV
 uznq3TwhLanyvrWp+pnrG0eyNxYzHyoJvUSXrPs=
X-Google-Smtp-Source: ABdhPJxtD4X3iywmdZ0jW00LyhYdLNA9SC1N0Wv3820HxFdKXhmI67dXiwkKIzDvwYFHMjfvbJonG6MpaIIsHpqNNg4=
X-Received: by 2002:adf:f181:: with SMTP id h1mr331178wro.374.1604028910967;
 Thu, 29 Oct 2020 20:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201027190726.1588801-1-trix@redhat.com>
In-Reply-To: <20201027190726.1588801-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Oct 2020 23:34:59 -0400
Message-ID: <CADnq5_NbX+6bn13MzfEwFF86NB+Y8QsToiPZ21LfQgYXube1Pg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove unneeded semicolon
To: trix@redhat.com
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
Cc: "Kim, Jonathan" <jonathan.kim@amd.com>,
 Joseph Greathouse <Joseph.Greathouse@amd.com>, "Chen,
 Guchun" <guchun.chen@amd.com>, Dave Airlie <airlied@linux.ie>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Harish Kasiviswanathan <harish.kasiviswanathan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 zhengbin <zhengbin13@huawei.com>, "Tuikov, Luben" <luben.tuikov@amd.com>,
 "Stanley.Yang" <Stanley.Yang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, John Clements <john.clements@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  I dropped the first hunk as that fix had already been
submitted by someone else.

Alex

On Tue, Oct 27, 2020 at 3:07 PM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> A semicolon is not needed after a switch statement.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> index 1b213c4ddfcb..19c0a3655228 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> @@ -654,7 +654,7 @@ int amdgpu_pmu_init(struct amdgpu_device *adev)
>
>         default:
>                 return 0;
> -       };
> +       }
>
>         return ret;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> index 8bf6a7c056bc..a61cf8cfbfc3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -953,7 +953,7 @@ static char *amdgpu_ras_badpage_flags_str(unsigned int flags)
>         case AMDGPU_RAS_RETIRE_PAGE_FAULT:
>         default:
>                 return "F";
> -       };
> +       }
>  }
>
>  /**
> --
> 2.18.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
