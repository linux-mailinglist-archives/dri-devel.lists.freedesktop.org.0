Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A97709871
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 15:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A953710E104;
	Fri, 19 May 2023 13:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6EC110E104
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 13:38:14 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-19a53345720so354181fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 06:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684503493; x=1687095493;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lOs4suB6MnnzG1pHzOuyNVjRaMPdw2D6u8onPNTnXCs=;
 b=FyiwmVotfX881qqJXvXVr8I/37+f/EwH62uArJP45i32hidV08/PPKTbtCA1segTtl
 Hx6T37WppSRmIVsT4MffeX3QQ6S+L7jgBBuAo8bGdLfrZ+lWZj61nsXNkPTJsMUfBp9G
 LHKpN2iYIpOaQxuI9No2KfChAHa895xtaVzsxhiV65mlV0YQqOAwdThgl9KZubW2yjLN
 PD+zDW1g+9kj0seIQgnldZEvF76NrB6Zg7F/AtwQk2bQAoXrHFPtf3EyO7xjyP84NR02
 6xNptIJDgKLnmzPCd+ho7Zt9OVL0XX+mJ5W03ZsojX8dFWgH95rhq2TJ5Zt4yAw02LhY
 YI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684503493; x=1687095493;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lOs4suB6MnnzG1pHzOuyNVjRaMPdw2D6u8onPNTnXCs=;
 b=F23fPYzSll+1FlmzD4QS69VPX2eoI3/fmZBEGlNGCVvfyeJaeOjqhY4PqveKMhZJDU
 yMUuF3HcIw7+xsY0jMHHD/YZ6/Q/4vxUzX3UhIW/KJxj1vQSUBuCU7tD6flMtN3lVl1W
 xBnbB+yCU1Wh2p+p4D3qsMfBRmTX09HsU3czrN4eEz+TIyX9aE529IJlxpWdAF1KOIdk
 Nc/B+wMdEQayBFiOfx3+DiVSdyJUET2tJN2tLfEKe/eFcUnk/CwuhotJ5xpVUGhVq03D
 5sq6NpEQDTNngO8bD0fRlGbrEh7E9S6HeyCJyAJVrDMViSPp1KMiZxsikrXUcgqV9VH+
 eFYg==
X-Gm-Message-State: AC+VfDz6uYEnhByiT4ZTw2bQ8sKcSi0eSqrXe32cZsV7uu4rlA5fYDLz
 FP1VIHvYLPUoUKm/MSYIL/3e+xJeL1gP89axlE8=
X-Google-Smtp-Source: ACHHUZ4sz0CZP+JY5qG77XL/A750Zj2aQw9ysamuG3u/ML3pICVKykNXTg73YqKJ7Gsz2M8heIGluGdMNNlLCX8Yg1s=
X-Received: by 2002:a05:6870:a2c3:b0:19a:229d:3f71 with SMTP id
 w3-20020a056870a2c300b0019a229d3f71mr1250186oak.6.1684503493507; Fri, 19 May
 2023 06:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230519100608.7e836126@canb.auug.org.au>
In-Reply-To: <20230519100608.7e836126@canb.auug.org.au>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 May 2023 09:38:02 -0400
Message-ID: <CADnq5_NFvQgca9_YzY49-SpVRh51AQ9KfYOxOA0p1PTcxAx_ZA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 James Zhu <James.Zhu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 18, 2023 at 8:06=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the amdgpu tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c: In function 'amdgpu_ctx_init':
> drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c:348:26: error: 'fpriv' undeclared=
 (first use in this function)
>   348 |         ctx->ctx_mgr =3D &(fpriv->ctx_mgr);
>       |                          ^~~~~
>
> Caused by commit
>
>   2458393a4e98 ("drm/amdgpu: keep amdgpu_ctx_mgr in ctx structure")
>
> I have used the amdgpu tree from next-20230518 for today.

Lost part of that patch in a rebase.  Fixed now.

Alex

>
> --
> Cheers,
> Stephen Rothwell
