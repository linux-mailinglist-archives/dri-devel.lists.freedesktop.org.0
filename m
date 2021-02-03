Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD9B30DC83
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 15:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05DE86EAD5;
	Wed,  3 Feb 2021 14:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379C96EAD5
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 14:21:02 +0000 (UTC)
Date: Wed, 03 Feb 2021 14:20:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1612362059;
 bh=dUWLmw5XDp1/H4uDyVQstdny05hwTaD63a5CJ5MDzkE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=XakE0taSVyIgSKGOKQd7893c0FHqrMoNYROHKPdhRzveRvOgc4LzzLKd6uLxfbp56
 P9rQPGG1TB0NZk2o3yG+DHhXCkcBYvvxETfcqDLaaDcyMey7fmyYfMIGvcJLQMMrDX
 ZBgA34E5bWG+ieKhJGjQS8U9gQoh9Irea3hy1Oh3LGeT01NANzDfYVnK3tRbBdU9mP
 IVfmbgOhMpf+3j3UMs6BipiSCi4mFqVIeNf55084NlvO4cyKxbw+sV8Zkh4USudcHd
 5DEAOsBxGKzzQ6lg7W/U4LPO3AIl+7jJg4KZVUPqtIFnUleoW2wRCe72bp9tpTG/QU
 by9dzUIBrpeQQ==
To: Emil Velikov <emil.l.velikov@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/fourcc: introduce DRM_FOURCC_STANDALONE guard
Message-ID: <3YZGYeCokyp-fEABJS4acHkPKfFBiHtsL3lM8fRBI-ma8q--4afeisOnhmHURa5iF8AVHpUdw2E7fKCe5bug9PX4j8HJ4btFWDdWepXftBY=@emersion.fr>
In-Reply-To: <CACvgo51nJLrcuAAH=RGxCY9Cf-ZGvgPqzdrKj8ODuhbL+eTWjw@mail.gmail.com>
References: <20210202224704.2794318-1-emil.l.velikov@gmail.com>
 <CABjik9dde-HCWBsfwxjD+jTKaoy-YxDeSObmH7X5rSzNHoA_qA@mail.gmail.com>
 <CACvgo53wJ2XrLRBy4ysOBfU5TFo7nBwDS_CyrPkB1rotJXW5Nw@mail.gmail.com>
 <KZZVYm0Qza351oOJ53ZX0pUcEa6NRh2sJJiq5OR2IjRlmJsdCZXRusR3ZuiiL5dqUgpR_STva8ySdYIJAUnSHVkU5HnNLzC68pNSEcuYdcA=@emersion.fr>
 <1eXnpBNSePW1qsq6q5BR3IEa6Q4DGeWBmJ23QArM9eGt12sN9W2Mhpk2OkUwZj-fhRjAtf9XNne5vxJ-7_JjPl549Ml3wxwMo0hhKsojL_4=@emersion.fr>
 <CACvgo53_f83NFhCkzDx5ydE+H0KdEYKx6Mgdk+-z1hZE8piM7Q@mail.gmail.com>
 <_L67Dl3bTZirFqSulhWUeN215npWnjsPyUzg7Rb-2iffHxMbZ1-H6ex7R14gdkDqZfpRw9xLoiol8m5WtPKuJxiBN_FcnailoQHvW02qNI0=@emersion.fr>
 <CACvgo51PDiXPQ=gfChZw2LQmg=NmvshTqw5F3HgkV_9vGYs=5w@mail.gmail.com>
 <N0eVw6YLfc6v63pbpbmd1GPURTahNkBdrWWuwvJNYtXTryToehQecES5PSEqhZvm9yDhH6VLVw4wnSj1Ba3JXINtwZ6tWQXAgokAP32oIA0=@emersion.fr>
 <CACvgo51nJLrcuAAH=RGxCY9Cf-ZGvgPqzdrKj8ODuhbL+eTWjw@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <james.park@lagfreegames.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, February 3rd, 2021 at 3:13 PM, Emil Velikov <emil.l.velikov@gmail.com> wrote:

> As said before, there are multiple ways to handle this without
> introducing yet another UAPI header. I don't see why you're dismissing
> all of them, can you elaborate?

Because I hate it when I have to adjust my compiler flags because of
some third-party header.

Can you explain what were the past issues with introducing a new
header?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
