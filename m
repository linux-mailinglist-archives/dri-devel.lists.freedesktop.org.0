Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0E127B904
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 02:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E166E3C6;
	Tue, 29 Sep 2020 00:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800426E3C6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 00:46:18 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id lo4so12431464ejb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 17:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DCSkx39v+5WgV4TIc07LMkL8Pce10dvaG6mrcOnTXJc=;
 b=UlYdO7jqyNuQecHHvclKhQwQ7pTWovhjW8FbPTYFanjn/UPQL69+rGJ0srFByLhbBS
 lVulFazewiKVcJUlB1yN7NvXLPp5UbxfVJux+iAY5xDaD+LskiXf64vo9eNOMelMvjvg
 sYUCbdrYanCy9fTR3E/pxPKA8S6kTK3ZJqmIhGODN58jEFR64fkij37vxse3vQWVIJ6y
 N2MjVO/XpM/CbS0+biabyuMhVG28DRludZddyBAkm8rkAd8ogWhBKMbQu/SXfgJhhAkO
 POPWppPj06UxryWz0Cn4z5cyf1iNPvQLS4fKzJKedTEld7BYuhZeqmDRSc8PHwL4PbjW
 XHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DCSkx39v+5WgV4TIc07LMkL8Pce10dvaG6mrcOnTXJc=;
 b=lOl4Zyu+7jAEn01lccmB6ZwjYcBaia/I1xk/K8LhS79Eq2z5gQyG2KKoSukjZBceUK
 GP119cAq9kgnGaQHhHuS2QTNeVbnodG5Eo1WjWASyS0Z+EPGM13rQ0hkZkakspJ3760t
 CemAK1Fvj1E1ubb7Ss2w1FV3zPdKdv9Vo1W9qdwd1JOO3L5JmbR3Pfw3VVp7MsBcfqKI
 9OMI2XXeTxhhdW5s+L8frye179IQKWd/pPyhaVI/ufX2zw/ukX/4P5KFAF2SPq9PqskK
 XRAEt2CcIYXXrDoQnKS6Crqbzhajs3p4LVy5qhLVc8qDM8hDqKapG7s8ZD5WrQn+oPuk
 qfZw==
X-Gm-Message-State: AOAM531pt4mJhIMixvrhUiasc2UhrzQJdH/0OWCmHiIFFpdYxOaYKgUv
 yjBFuzvH0NHP7jUOuVQEkcyOF2+IHlgd0Delpmrjg9O6
X-Google-Smtp-Source: ABdhPJwceB1tV3x6CHt5EPfVZrUGQ0m0bruN037I1JPqL+9NqKMA36Ns3+VawWGu+dJvrTdUNmH7FfoRI/7I5JUbjmw=
X-Received: by 2002:a17:906:2b83:: with SMTP id
 m3mr1353576ejg.456.1601340377166; 
 Mon, 28 Sep 2020 17:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200914231227.30500-1-chunkuang.hu@kernel.org>
 <CAAOTY__u7AgKuLc6mVoVZrt1sQnu4vYyn8EwhK7B4dh7FoNAug@mail.gmail.com>
In-Reply-To: <CAAOTY__u7AgKuLc6mVoVZrt1sQnu4vYyn8EwhK7B4dh7FoNAug@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 29 Sep 2020 10:46:05 +1000
Message-ID: <CAPM=9tyuPyrFTgROQE6ig7NOtMxqeMdqnafQy968i-gtOU74Dg@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm next for 5.10
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Sep 2020 at 01:55, Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote:
>
> Hi, Dave & Daniel:
>
> I does not see these patches in drm-next branch. Does these patches
> have any problem?
>

Sorry just got caught in the queue, should be all landed now.

Thanks,
Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
