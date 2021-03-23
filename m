Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CA0346881
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 20:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EDF6E02E;
	Tue, 23 Mar 2021 19:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A1E6E913
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 19:06:55 +0000 (UTC)
Date: Tue, 23 Mar 2021 19:06:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1616526413;
 bh=vraXsV4uY/eI/YFIux7/Gzg0JogDvb0dMFQRgcXIsVE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=i4+ZvzFSw6nKf0zapSe04XxFVgHWOFrnaMktBInHxRWe1VO1oLTafJnLIM1tu8u2I
 erUBHG9Xstfi9aV2ltHc24v7Xtc19WpHv7eJ97Z4pE7Gw7nq21Zbqe3MT/nKMsNm4k
 DqVW3TVOC2TOqJMmomPDkXfS6KAYAtpu+sBaGFBJyPdS0DMgtVVH9/F9cdzaDGV7gE
 VvUm9ziJRVSTryTwmIszKC2thZbJJnuJ34+C4VsAZ8bLM71wWtWBKo8V9A81EjOowb
 825Bn4n6BlHQbz3GSEcdPoXr01mlcbPGbQA3NSmp2yZVXVS2DnAAxD242WXYTOQoo0
 Bp3FOmdxr0c2A==
To: Jason Ekstrand <jason@jlekstrand.net>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 3/3] dma-buf: Add an API for exporting sync files (v8)
Message-ID: <hyCtqDEpMZuIrQY210jTEgTokrX7YaWPrBpDPfL2vewIa_7sU7k0gNte9qmLcrLyHgTKD7nuXlnH9uCJc9jy9JqdxksgZVA-Vt6GldA1yPM=@emersion.fr>
In-Reply-To: <CAOFGe96L3Bc-hZbh+mH8Hz8EEbxDKMO+6xmX5EU3H5-auP8_wA@mail.gmail.com>
References: <20210316045322.2020294-1-jason@jlekstrand.net>
 <20210317221940.2146688-1-jason@jlekstrand.net>
 <20210317221940.2146688-4-jason@jlekstrand.net>
 <CAOFGe96L3Bc-hZbh+mH8Hz8EEbxDKMO+6xmX5EU3H5-auP8_wA@mail.gmail.com>
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
Cc: ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From a user-space point-of-view, this looks super useful! The uAPI sounds
good to me.

Acked-by: Simon Ser <contact@emersion.fr>

Would be nice to have some short docs as well. Here's an example of a
patch adding some docs for an ioctl [1], if you aren't familiar with
that. I think just some basic stuff (description, which parameters are
in/out, what the flags are) would be great.

[1]: https://patchwork.freedesktop.org/patch/401951/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
