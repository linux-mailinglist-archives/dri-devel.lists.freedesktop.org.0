Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BF263BC89
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 10:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE92A10E342;
	Tue, 29 Nov 2022 09:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D0110E342
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 09:07:40 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id h16so8480784qtu.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 01:07:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pRTrs4STHN19HAaWZ6G6ImvhRFTGcXTwtf66lKxgXXI=;
 b=Q23e3hjzVfXD5bTEqTkqCfSGtsnzzbrbP3JLFWMKKeEXh7mC0NLbw1N4lo8CLqDXpi
 7NVpuEJ7NzgrWDUnmV7i/b9+kikdCzY9ZtaRJ6NJvtLWb+PRKeaMSFIntpOqi5SdYjje
 2OjYG8srNtpEWMSZRettkxImkT2wEUCz9h2anTvev7wQ90GXWFU+2dlzED4koNN2kuaf
 OO5PryuFiuxw1Q4EpDxFPzLONXlr8rP1CpNM2g0A4pIY2Q4b07BTsIa4+v+da6sop+XT
 oaG+WMmEXi4AmS1DD0BxPBdBc48LM1U4H9+3er/xVcFcixTeSKgtdPFC+3vCyY4QU1mc
 iMEA==
X-Gm-Message-State: ANoB5pnr/uPU2DKyS1w/3UHW+z54Af8QInIMbzizp3FxDJFpSii4QcKv
 woNP2n7nLUlv0U7rCGx2MwhcXULP+u9aPA==
X-Google-Smtp-Source: AA0mqf51DB5AJzh6QZzRhDY6++VallOXk2V9rCDkQuqfmBFtz2l+7aXenfTOgmWjBlTOSvY9wrZniA==
X-Received: by 2002:ac8:678e:0:b0:3a6:847d:637e with SMTP id
 b14-20020ac8678e000000b003a6847d637emr803629qtp.447.1669712858903; 
 Tue, 29 Nov 2022 01:07:38 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 c14-20020ac8518e000000b003a611cb2a95sm7406533qtn.9.2022.11.29.01.07.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 01:07:37 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id y83so16606954yby.12
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 01:07:37 -0800 (PST)
X-Received: by 2002:a25:7408:0:b0:6f2:49a7:38ef with SMTP id
 p8-20020a257408000000b006f249a738efmr20678381ybc.365.1669712857595; Tue, 29
 Nov 2022 01:07:37 -0800 (PST)
MIME-Version: 1.0
References: <20221128105844.315bb58a@canb.auug.org.au>
In-Reply-To: <20221128105844.315bb58a@canb.auug.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Nov 2022 10:07:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXkDOn+J-Tjd_nDpkAKYXBhHVtNWSrLrkiGjpvYYXJkEg@mail.gmail.com>
Message-ID: <CAMuHMdXkDOn+J-Tjd_nDpkAKYXBhHVtNWSrLrkiGjpvYYXJkEg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
To: Dave Airlie <airlied@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "Stanley.Yang" <Stanley.Yang@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi DRm people,

On Mon, Nov 28, 2022 at 1:02 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the drm tree got a conflict in:
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>
> between commits:
>
>   3cb93f390453 ("drm/amdgpu: fix use-after-free during gpu recovery")
>   b09d6acba1d9 ("drm/amdgpu: handle gang submit before VMID")
>
> from Linus' tree and commits:
>
>   1b2d5eda5ad7 ("drm/amdgpu: move explicit sync check into the CS")
>   1728baa7e4e6 ("drm/amdgpu: use scheduler dependencies for CS")
>   c5093cddf56b ("drm/amdgpu: drop the fence argument from amdgpu_vmid_grab")
>   940ca22b7ea9 ("drm/amdgpu: drop amdgpu_sync from amdgpu_vmid_grab v2")
>   1b2d5eda5ad7 ("drm/amdgpu: move explicit sync check into the CS")
>   1728baa7e4e6 ("drm/amdgpu: use scheduler dependencies for CS")
>
> from the drm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Have you considered merging drm-fixes into drm-next, so not everyone
who consumes your trees needs to resolve the same merge conflicts?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
