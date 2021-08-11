Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 528993E9A39
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 23:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE5B6E1BB;
	Wed, 11 Aug 2021 21:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B306E1BB;
 Wed, 11 Aug 2021 21:06:59 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 y23-20020a4a62570000b029028727ffa408so1110438oog.5; 
 Wed, 11 Aug 2021 14:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CWnPOaXqwG7kn4SEtHcFJeDqfvrX/IkhUBZgOG8Xn+I=;
 b=ND+o9xQuiGBiwFoK5Fwd3WFKu3m1KxQgoSQ3dnGdS8By0mIO59fqEmOZywQZagOxgN
 0GSR3eBYLcSrLD1p7A7XZAOAf2wg0oMGq7XuruiN6Ie8NvO3qrxXk7qcjhzfINjLPDoT
 4fZpIW6gSN9KFap1MP8BiOxTGZqEmfP43+o1c87f7XfQGDZrYT7tMI+LS8F5SolqW1Ep
 DUOKMsMS2NRRoB999WODOP/gMj/MAfk8t0XODOOEBuBlytQox4EYrxJ9HKEN/7JD45po
 6ZFRYt23PmfDcoqXTNDYGGz8XSDIZrfy3cLEofPT4uFCIPs1LOI+sATDgun10wJEx71K
 lEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CWnPOaXqwG7kn4SEtHcFJeDqfvrX/IkhUBZgOG8Xn+I=;
 b=Dfx+qUHAZWEHtbif9ykVeuJdgGCCGRkyuRxwkX27dIcC5DM79N0sPRO+0loayS7BaV
 Yeu1Lw/KKrwvNDEOHpdP9Kv/qZA/Z2zNMmM2UkFSxL93a/HYFEMZfmcOpjk6F77Z0JQE
 J6wPhJfnbtkCKbb7ThcPpyCEiKe/VTJGNzt/NZLs3K9cXnnD8vZR0QcnUlXUS2epkv3O
 r5CeOhrAwYo3ui4zXdbUJINZ44IMntDV2WDTfG43yLzXz6f3jGYIU8P7bXsVjgIljTLp
 oD8QgLGR9cSHefLtUvNvkcz1GcDh0WKDze2TTWviQeaS4C0EctI4GxK5NQOGA4S8MfY3
 IfmQ==
X-Gm-Message-State: AOAM532qD2pxlCHxa/zywmje/8fPpBx7/9iEMedaWPiiae3s+r4xKmx5
 CIzv5EcdmM/N28mSP0nt0BUEMwQklAFGhIgTt28=
X-Google-Smtp-Source: ABdhPJz50GMn/63EG6LYzmro/LcC+4AaIqvjolekdLwtXM1aGZhDDRXgd3BlXm/8kV4KHY/A60Gyc+7Vkz9Bm/JQkHQ=
X-Received: by 2002:a4a:a38a:: with SMTP id s10mr537795ool.72.1628716018794;
 Wed, 11 Aug 2021 14:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210811191104.21919-1-Ramesh.Errabolu@amd.com>
 <CADnq5_OVA1fB5x6=CGrd_5O-i=P7snmoJaTyauF2RKuWjc8Gog@mail.gmail.com>
 <ba4ee532-d64a-72c5-7aab-2b86a75b8174@amd.com>
In-Reply-To: <ba4ee532-d64a-72c5-7aab-2b86a75b8174@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 11 Aug 2021 17:06:47 -0400
Message-ID: <CADnq5_OmH6ZsL_Q_wO2B7dbaD_JFcaNbYFzd_Nv4kui1npkVPw@mail.gmail.com>
Subject: Re: [PATCH] Whitelist AMD host bridge device(s) to enable P2P DMA
To: Felix Kuehling <felix.kuehling@amd.com>
Cc: Ramesh Errabolu <Ramesh.Errabolu@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, 
 Linux PCI <linux-pci@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
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

On Wed, Aug 11, 2021 at 4:50 PM Felix Kuehling <felix.kuehling@amd.com> wro=
te:
>
>
> Am 2021-08-11 um 3:29 p.m. schrieb Alex Deucher:
> > On Wed, Aug 11, 2021 at 3:11 PM Ramesh Errabolu <Ramesh.Errabolu@amd.co=
m> wrote:
> >> Current implementation will disallow P2P DMA if the participating
> >> devices belong to different root complexes. Implementation allows
> >> this default behavior to be overridden for whitelisted devices. The
> >> patch adds an AMD host bridge to be whitelisted
> > Why do we need this?  cpu_supports_p2pdma() should return true for all
> > AMD Zen CPUs.
>
> This is part of our on-going work to get P2P support upstream. We want
> to use pci_p2pdma_distance_many to determine whether P2P is possible
> between a pair of devices. This whitelist is used in this function. This
> will affect the P2P links reported in the topology and it will be
> double-checked in the BO mapping function to ensure a peer mapping is leg=
al.
>
> I think this change is a bit free of context at the moment, as we're
> still working on a few other loose ends for P2P support in our internal
> branch. I'm hoping we'll have a bigger patch series for upstreamable KFD
> P2P support ready in a few weeks. I also think we'll probably want to
> add a few more PCI IDs for other supported AMD root complexes.

We don't need to keep adding AMD root complexes.  You must be using an
older kernel or something.  All root complexes on all Zen platforms
support P2P DMA.  See:

commit dea286bb71baded7d2fb4f090e3b9fd2c1ccac58
Author: Logan Gunthorpe <logang@deltatee.com>
Date:   Wed Jul 29 17:18:44 2020 -0600

    PCI/P2PDMA: Allow P2PDMA on AMD Zen and newer CPUs

    Allow P2PDMA if the CPU vendor is AMD and family is 0x17 (Zen) or great=
er.

    [bhelgaas: commit log, simplify #if/#else/#endif]
    Link: https://lore.kernel.org/r/20200729231844.4653-1-logang@deltatee.c=
om
    Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
    Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
    Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
    Cc: Huang Rui <ray.huang@amd.com>

Alex


>
> Regards,
>   Felix
>
>
> >
> > Alex
> >
> >> Signed-off-by: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
> >> ---
> >>  drivers/pci/p2pdma.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
> >> index 196382630363..7003bb9faf23 100644
> >> --- a/drivers/pci/p2pdma.c
> >> +++ b/drivers/pci/p2pdma.c
> >> @@ -305,6 +305,8 @@ static const struct pci_p2pdma_whitelist_entry {
> >>         {PCI_VENDOR_ID_INTEL,   0x2032, 0},
> >>         {PCI_VENDOR_ID_INTEL,   0x2033, 0},
> >>         {PCI_VENDOR_ID_INTEL,   0x2020, 0},
> >> +       /* AMD Host Bridge Devices */
> >> +       {PCI_VENDOR_ID_AMD,     0x1480, 0},
> >>         {}
> >>  };
> >>
> >> --
> >> 2.31.1
> >>
