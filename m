Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2913A5F578E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 17:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4AD10E6B5;
	Wed,  5 Oct 2022 15:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8681410E6B5
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 15:30:38 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id m81so17997652oia.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Oct 2022 08:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=X2C9NpjkzSIFyjSc8krQm4ahQQhwd6xH158mB569dTc=;
 b=aOiJu2zMzQds9XXZCJxWaOkP8JWwxUdyM6lxXECzdHlBqL53gRQjf0b3to37Rcoeek
 3b7u7jAKg76wuUJcbOt58rW+auewfBnoEnrtpsxHmDUSon9lPiKWkfBKlgfdEvMW/1YW
 fSioqNp5yOxBbhgiiBB3C0j1qO3zWH+51SdNabd7oJotJgT7cQGByCD1Po3reTTSdrIn
 6sTVdRySbdZINNVERtFhKfApCl624I2jUE4Svyvv8/0CPjI7F5lc6byhDet7Zgrhgtel
 E3E7gOcTUFeKDj8J3OymIqzzEwnshBQSynse457cE48sIV3SZRUIPYR1Dwg7dhZYitg3
 KzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=X2C9NpjkzSIFyjSc8krQm4ahQQhwd6xH158mB569dTc=;
 b=6YMITEVrc+isiXrbOb8k3JlwxQ8HMCjnBhsyoeK7qTHMpOtmaqfjCFA3vBR1KHQtdU
 WTtpaVfgl2WxaRM7jgy84vlRBFsOZ6PQNPVGIP4k/Cfdg7ji49rMk4FMWdmt5qJmr3dx
 1VYm/xFBeowGVmZIgTRqFlwUfhh9fNHM/MTz28antb/PxBH0bLTQnmYHzb7+RW7cceCV
 5dRprkVYotWINkZKgvHQWZwrvpVr0tQfclEKxXJ7LhL/NxqYyV1hGtNFFFKc0llBy5l0
 SUFiIyJKo2zKHBCM7/6xb71AD0g0uMaPCk+V7qybbRayjAeVTU5q30Mhd3lxuonBViY/
 /TJQ==
X-Gm-Message-State: ACrzQf1h9Dv2G5z/vx+KY436xx9WM20JJC1uZjxheeSU7bK3qPG3Mrj1
 xZpb/w/53pdgd+LmsbghXR/nznNgiEGXjza2giU=
X-Google-Smtp-Source: AMsMyM5VwGJODOGxycweKrN1XoHFTMm4jpXK6PlMseeSAOkpc6Vzki8bBhh9s/IYeyDjekkcAGGFPc/JA22W0Fkx9HY=
X-Received: by 2002:aca:1b0f:0:b0:353:f306:198b with SMTP id
 b15-20020aca1b0f000000b00353f306198bmr182796oib.96.1664983837838; Wed, 05 Oct
 2022 08:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220930105434.111407-1-broonie@kernel.org>
 <20221004132047.435d42db@canb.auug.org.au>
 <CAMwc25oshRcJBoCT70B+b42bh5sPqgyoHuBx6K6ZLrwBMHnJzw@mail.gmail.com>
 <20221004140558.64f59f2c@canb.auug.org.au> <YzwbW4YQwQPsRPYw@sirena.org.uk>
In-Reply-To: <YzwbW4YQwQPsRPYw@sirena.org.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 5 Oct 2022 11:30:26 -0400
Message-ID: <CADnq5_PbPQPui1tOdUMB+OYbz6UBMKCgtwvE95oA+SfcN0RzNg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To: Mark Brown <broonie@kernel.org>, "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

@Mahfooz, Hamza
@Aurabindo Pillai can you get this fixed up?

Thanks,

Alex

On Tue, Oct 4, 2022 at 7:39 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Oct 04, 2022 at 02:05:58PM +1100, Stephen Rothwell wrote:
> > On Tue, 4 Oct 2022 12:24:37 +1000 David Airlie <airlied@redhat.com> wrote:
> > > On Tue, Oct 4, 2022 at 12:21 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> > > I'm not seeing it here, what gcc is this with?
>
> > I am using an x86_64 cross compiler hosted on ppc64le - gcc v11.2.0 (on
> > Debian).
>
> I was seeing this with an x86_64 cross compiler hosted on arm64 -
> Ubuntu 11.2.0-17ubuntu1 from the looks of it.
