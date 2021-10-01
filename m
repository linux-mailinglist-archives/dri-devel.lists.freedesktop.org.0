Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD1241F22A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 18:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E136EE60;
	Fri,  1 Oct 2021 16:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D169C6EE61
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 16:33:10 +0000 (UTC)
Date: Fri, 01 Oct 2021 16:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1633105988;
 bh=kZ04ing8GhFUbmJalqgqZSFwyo6BDJ3+H4IsGEXwhFU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=C9LZWXa/YbrnKW/nqhy2bnVbRvfUAC9sthOe9DNGJhmwM5z3iShThd6AA8wV2nqKq
 GWmYWwl3NsqvV0nmK8vQpFsxBOTKAJOWqz0F99ay0xQAKcpXMtREx8stabXIsl9mnS
 cMzPGyqlWhOk1/R/ar6OJQIrTgnMoHYhJYb+9EkLP/cMUgwlkvV0mnIDJ0Twh2Q/85
 2uLmrpQk1kekXFlzQ3Rvpnpim0OYFT7cAGwPUGnDkXPFMa+wDD5iFPo81wMlrdXA4M
 mRKPjJmhMSAySinpUoc+ubssWYIU6LmejCVaUWLOuU1KZYVTMFjgczRYpWud81j6qn
 BXIkehEqcdr9Q==
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <ppaalanen@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dennis Filder <d.filder@web.de>, dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: Handling DRM master transitions cooperatively
Message-ID: <QM4QO9NZvRU73KFxXZiKRQurIj8NbJiS8G8emzrZ6Rq7lz4FsADE3e1-6nGvjTjBeJKgJQ5cDnwckdS6VwsOrbtaY2FUv9GvhDK261Jibfg=@emersion.fr>
In-Reply-To: <3195aecb-833f-9f8f-efad-51d80da6f4dc@redhat.com>
References: <YTJypepF1Hpc2YYT@reader> <20210907130746.7b667dac@eldfell>
 <ccdba09b-011d-093e-17d0-578ca8a3ec44@redhat.com>
 <20210908103603.44a533bb@eldfell>
 <CAKMK7uGeuaZDYkr=mFiA4Okhod6KqKRnv_RfF-NJG=2KzG-=WQ@mail.gmail.com>
 <20210909103703.09a573e4@eldfell> <YUCncex3woPlAhI6@phenom.ffwll.local>
 <20210922115657.17006ed1@eldfell>
 <3195aecb-833f-9f8f-efad-51d80da6f4dc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, September 22nd, 2021 at 11:21, Hans de Goede <hdegoede@redhat=
.com> wrote:

> I would be happy to work on the plymouth side of this, so that we
> have at least one consumer of such a flag lined up for merging.

Do you have plans to work on the kernel side part of this? If so, feel free=
 to
CC me for a review. If not, let me know if you'd like to switch roles, I co=
uld
work on a patch.

Simon
