Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B145283F76
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 21:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5020489F77;
	Mon,  5 Oct 2020 19:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C5789F77;
 Mon,  5 Oct 2020 19:19:02 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e2so664079wme.1;
 Mon, 05 Oct 2020 12:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MKJ0Z2LrOcSMty3u3jdPYY8eZgYP8C0LUVpRcfJQcdA=;
 b=oXM1ucCGVCDA8xwI/i2vJHb4ovOKZts7YSPsUFdJF7e/+sZSaDL7A0QYciZ7OWuKEf
 rDEcBJ5P6vGuCTJG+i1pmHmXvSeD26/8Ct7Airpr30KIuDF60vxZk6AJJ2a6dVpCxSNG
 nXasaQHlATpm13XS77Z/Cy5N9YgkqS4OaAg86L3akOoTTEVQDB0GN8syBnKNs4hKfGD7
 HBo1SU03KYfh5feBYpd01SNUHCrGOjvhlCclnVr1AIGSe2Nm2aQEM3X+vK7eIZRsnJxH
 14N5FncC90+0CPjWihgjSMRilELvRK59CY1nl5lQw8MBlixkmz86vWsO0T+EGP9tEXnc
 3Csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MKJ0Z2LrOcSMty3u3jdPYY8eZgYP8C0LUVpRcfJQcdA=;
 b=bBr9nuB45FPE0axbaDakZtlIUbqgiHG9xuW0jtqEV8sD1vBEQvnB8UumuCpZ/qxaMc
 n6ABx2I/potF6jRqhae9AboVmPSAFYI8zgMwgmAGzo83aoRYy49EeCj0nBpTibmZ9JS3
 4FjefhOE4AWW1ALKElHAw4PnfYk6bL7YvvP6Va8zwH+cmoNM5kN3TA2UwHZTgpvbuClY
 tZ+GvufrRQdcmIVw9hFw/rSLGAdp+W7jMA5NBSt8dIeKiPJ55KCCwogzzxwUCb0WJYWV
 pA1fPTDCC2CB5WBmFEqp4o8GXH37C6GiSmsBNSNycO8CJ2dgvuDe5tp8qT1Xpdhb7nNU
 r2+w==
X-Gm-Message-State: AOAM531Q4M9/ZI32mPrmIF4FuPf2Vy2tG4J3jdLWuHcYY2YjJdxghopP
 DGN12vI5SybtKEfoakxYbhxghkqMyInpauDapty4NP54
X-Google-Smtp-Source: ABdhPJzKpkAc9+tHVLcH2XCyoRrlWag4dHEgar33qcoBOzqjotkNWv+m9JGfXyTZ0TRLtiEivBDItncnmVVXp51/CnU=
X-Received: by 2002:a1c:a184:: with SMTP id k126mr857264wme.39.1601925541053; 
 Mon, 05 Oct 2020 12:19:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201004064917.17941-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201004064917.17941-1-lukas.bulwahn@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 5 Oct 2020 15:18:49 -0400
Message-ID: <CADnq5_M4nagoEoVYL011ysVDZyWp3hKQjfO97GQuvyeW-_QdWQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove unintended executable mode
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 5, 2020 at 3:22 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Besides the intended change, commit 3437f5f6c979 ("drm/amdgpu: add gfx
> support for van gogh (v2)") also set the source files gfx_v10_0.c to be
> executable, i.e., changed from old mode 644 to new mode 755.
>
> Set to the usual mode for source and headers files. No functional change.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Luben already sent out a similar patch.  Fixed up and will be pushed out soon.

Alex


> ---
> applies cleanly on next-20201002
>
> Alex, please pick this minor non-urgent cleanup patch on your -next tree.
>
> Huang Rui, please ack. You might want to check your development environment
> introducing those executable modes on files.
>
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  mode change 100755 => 100644 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> old mode 100755
> new mode 100644
> --
> 2.17.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
