Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ECC55E561
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 16:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD1B10F1AA;
	Tue, 28 Jun 2022 14:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99C810F23B;
 Tue, 28 Jun 2022 14:38:42 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id u12so26162839eja.8;
 Tue, 28 Jun 2022 07:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d2IvGKvL7xHbKgdp4YNJ7+ySjxu0hJFiVWDS9pQpBNk=;
 b=EcBgKNzJYFcIXq77mC+QLh+Q55CV5PEEkCt6SGuIjlr8nNlTqUUyaWmbT2G7JdgDGo
 uqmNvpq2WUhMBOjfHI6TWd2ppwa1SVtYuqKl5UIpiFbVZm942d9kd0oD9QbD3YVgoCSD
 SFlhn29XBVtI//iLY2i1cuSBVYvwyYNunt2R3uw/l8S9q86k09viSPZME21XQ1zy4y86
 Q2WY8QDQlqDnZzIyRjRL1iqIdTAZ6A8Zuu3Uzbis9dyTr9jetyFvOTdzy0Rpznj+FNyN
 RV0y4x/2Byy5dYiaMqeCNu9OaDND630skNeHGfq3IZid5ej14diTDvF7wEaiBx0s8oeS
 kkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d2IvGKvL7xHbKgdp4YNJ7+ySjxu0hJFiVWDS9pQpBNk=;
 b=dJuIxPwgeHVb2mW3pwdUZNIovVMiRCrZYNMP4CniIR2DGuNVUm0I4sqeiQGuK8VXqf
 bs6PDz46dJlMBEaF7k/1LyyZCKvql0D0cMMhH1A4H1qeux2RjhREWMnMnS+L85r/ZQoF
 hiGdoETqnhhVkHJo3dl4CP48ERxPqsLYQdYetqctQfF//3M/Zsp/Vkx3Vpf5yOezynVK
 N9IR2yf3GSdO8ePQtcGz1EpOmoKlp6e4M6p3n+qqeUBasnUv6LbBfz+eviYbotv7nWej
 lpImC+exopTQvo7aZAi94/6pMjszypxHQn2h9fqTqV9pHAY8RBT51aN26padviabsT+j
 57/w==
X-Gm-Message-State: AJIora+Aa4Cccq8jW9O+g3sVKudinDWjn/SF1j8wRZmEtloe2kZnn+pE
 lMzas2pAino+hp6lU7WdhF8S5voSQFlecrGCGmU=
X-Google-Smtp-Source: AGRyM1shI3TGX5wshjkJFJrz2mDXSYu4lQcGDUhsZNRYOYlP5MHGbzWtZvb2qfxNCOMOmPZt2NzdiNV9hBqFxBUlu9E=
X-Received: by 2002:a17:907:94cf:b0:726:c81a:f30e with SMTP id
 dn15-20020a17090794cf00b00726c81af30emr5834374ejc.451.1656427121388; Tue, 28
 Jun 2022 07:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656409369.git.mchehab@kernel.org>
 <3aee446a0e396fe3f338f270746939f6e803a4de.1656409369.git.mchehab@kernel.org>
In-Reply-To: <3aee446a0e396fe3f338f270746939f6e803a4de.1656409369.git.mchehab@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 28 Jun 2022 10:38:29 -0400
Message-ID: <CADnq5_OJ=-hNo=Tx1L70sa4hyRx8YD=RMMJ0uEx4QegXDofkJw@mail.gmail.com>
Subject: Re: [PATCH 11/22] drm: amd: amd_shared.h: Add missing doc for
 PP_GFX_DCS_MASK
To: Mauro Carvalho Chehab <mchehab@kernel.org>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Zhang <dingchen.zhang@amd.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Zhan Liu <zhan.liu@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, David Airlie <airlied@linux.ie>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Jun 28, 2022 at 5:46 AM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> This symbol is missing documentation:
>
>         drivers/gpu/drm/amd/include/amd_shared.h:224: warning: Enum value 'PP_GFX_DCS_MASK' not described in enum 'PP_FEATURE_MASK'
>
> Document it.
>
> Fixes: 680602d6c2d6 ("drm/amd/pm: enable DCS")
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/22] at: https://lore.kernel.org/all/cover.1656409369.git.mchehab@kernel.org/
>
>  drivers/gpu/drm/amd/include/amd_shared.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
> index bcdf7453a403..2e02a6fc1717 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -193,6 +193,7 @@ enum amd_powergating_state {
>   * @PP_ACG_MASK: Adaptive clock generator.
>   * @PP_STUTTER_MODE: Stutter mode.
>   * @PP_AVFS_MASK: Adaptive voltage and frequency scaling.
> + * @PP_GFX_DCS_MASK: GFX Async DCS.
>   *
>   * To override these settings on boot, append amdgpu.ppfeaturemask=<mask> to
>   * the kernel's command line parameters. This is usually done through a system's
> --
> 2.36.1
>
