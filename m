Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED585740D3
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 03:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CE798B8D;
	Thu, 14 Jul 2022 01:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228E298B8D;
 Thu, 14 Jul 2022 01:11:28 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id r6so513965edd.7;
 Wed, 13 Jul 2022 18:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a93Cdw/b08yokkZOSoTxTp1XSO9jT1YPFIGh2tVBaFY=;
 b=UUMi4C1J6wo829oEZN7ope7dgBnp7YAvLYYnMn8vrRhxCl76VTZp95FiE2L0VKlIkN
 WgYqr0+0mpJY3k2EW3/4faf45g3D/11EJ9QNBYIu1Drq38/CStnSGwEGsxWCfdpHOGDW
 cZtOdCgXjI1sf2Zm6CUuRjVBkljGpwg0u9ARRc9kH09L0zOz4kvjMbzZW8HkbXrXwMBE
 7BCtU+4zu/BAGj9UsCUXu6tKAlcgAEgkwgw/04gUwounq3t4xykoSXyHt9Vw4tVNZHW/
 lHyeA0cF+Nf5+xSeggakBgwuPc59QlOT7gbOHGmUNi0hsdXwYBKmcO/wCKL5dBKRm40E
 erfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a93Cdw/b08yokkZOSoTxTp1XSO9jT1YPFIGh2tVBaFY=;
 b=C7X5aotoOT3Ln1MTOOB7GS6CU51ArIxohrH6WDNbigfKix/1upDEtpVqb6PlXSBPGU
 bYClbiswnwr/ypJ7S+FlriFDn9oRb4BbzLy/AyvMpdDu8RMDZjKEwA6y+ehKmDnSSrcD
 82M+XRIAMOb/kgAX53xomaFDe366EYrMavR4uJpyyYduSJwt8HdxrxPMwgk6irLUulYu
 ZL2Ajrfk4MgrrLHnS064DWTQw/Eo9Kw1ghIDRMzvYZ0YZnSglMgVAakLuXyH1VU+0yre
 yD0DvDgQY8aGZN+rJR54ysB5fH82PaXQ+PNfEOqkQVQ1l/qeK6KEF8ozyzVDDl6lqGQb
 QS4Q==
X-Gm-Message-State: AJIora808QRSR3xHP/Wy6i+C4KT/BIilfgksEZgJCiN0q63L7JVSo2Pf
 eU7hozUaUtOGhz2JwGLj3tFVi+4ENimXCUDQVHSPxyluWe0=
X-Google-Smtp-Source: AGRyM1vejis9cF5nlYAXPBkQvErPD5hsJQ+0uQcZHBF7j95H9sjacuUDwJm2zzPpCY152/+jN4qYQcQzaSHHnVS9lO0=
X-Received: by 2002:a05:6402:274c:b0:43a:9204:95fb with SMTP id
 z12-20020a056402274c00b0043a920495fbmr8880451edd.259.1657761086555; Wed, 13
 Jul 2022 18:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220618232737.2036722-1-linux@roeck-us.net>
 <584fc348-7a60-26a2-af61-9edc4f4830e4@amd.com>
 <CADnq5_NkVWqcxwLMBeskqpcSEYCEjUAK0hqvA_PAo7ACHKL2cA@mail.gmail.com>
 <6a026c9a-c4ee-deba-e028-4c0f478c1911@roeck-us.net>
 <CADnq5_OrxMMkazXEPHeZXp_bV890=r21DRx2QsqLXUFj4t8aYg@mail.gmail.com>
 <20220713230917.GE32544@roeck-us.net>
In-Reply-To: <20220713230917.GE32544@roeck-us.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 13 Jul 2022 21:11:14 -0400
Message-ID: <CADnq5_PAg8xg2J3WUfjxK_-WFaLOK7cQd6bqWDnfVqE6fpXq2Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Add missing hard-float compile flags for
 PPC64 builds
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: Leo Li <sunpeng.li@amd.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 7:09 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Jul 13, 2022 at 05:20:40PM -0400, Alex Deucher wrote:
> > >
> > > The problem is not the FPU operations, but the fact that soft-float
> > > and hard-float compiled code is linked together. The soft-float and
> > > hard-float ABIs on powerpc are not compatible, so one ends up with
> > > an object file which is partially soft-float and partially hard-float
> > > compiled and thus uses different ABIs. That can only create chaos,
> > > so the linker complains about it.
> >
> > I get that, I just don't see why only DCN 3.1.x files have this
> > problem.  The DCN 2.x files should as well.
> >
>
> Seen in drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile:
>
> # prevent build errors regarding soft-float vs hard-float FP ABI tags
> # this code is currently unused on ppc64, as it applies to Renoir APUs only
> ifdef CONFIG_PPC64
> CFLAGS_$(AMDDALPATH)/dc/clk_mgr/dcn21/rn_clk_mgr.o := $(call cc-option,-mno-gnu-attribute)
> endif
>
> Does that explain it ?

I would expect to see it in dcn20_resource.c and dcn30_clk_mgr.c for
example.  They follow the same pattern as the dcn 3.1.x files.  They
call functions that use FP, but maybe there is some FP code still in
those functions that we missed somehow.

Alex
