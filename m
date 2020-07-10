Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D987D21B345
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 12:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E5C6EBB3;
	Fri, 10 Jul 2020 10:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0836EBB3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 10:39:05 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 73B7320767;
 Fri, 10 Jul 2020 10:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594377544;
 bh=HDyErklfj0q++8WN9XP41nC/bRxqicIDn73o+NgdPNk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fTpz7wXjqgY5sfUmWHEMnywXuKq7P5uqC/mAyKbtmXHOi7dYGuhXKb3z4vMVSgdoJ
 YYFNUQEJpsSdhao2/3O7MG+6uMyyldnHpLZLgpsb/0i4umTozftocAoq/s6HtGUmxk
 e/lwLlcil0/tuisKOJpEP7Iknb/9mthe6K4vKcv4=
Date: Fri, 10 Jul 2020 12:39:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Subject: Re: KASAN: use-after-free Read in drm_gem_object_release
Message-ID: <20200710103910.GD1203263@kroah.com>
References: <CAFcO6XO58pV+j9gu5Hha3JUW555EPQo6ELTvxRyQ5PWu_1gsUA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFcO6XO58pV+j9gu5Hha3JUW555EPQo6ELTvxRyQ5PWu_1gsUA@mail.gmail.com>
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
Cc: robdclark@chromium.org, security@kernel.org, airlied@linux.ie,
 syzkaller-bugs@googlegroups.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, seanpaul@chromium.org, sam@ravnborg.org,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 10, 2020 at 04:24:03PM +0800, butt3rflyh4ck wrote:
> I report a bug (in linux-5.8.0-rc4) found by syzkaller.

Great!

But can you also submit a fix for this as well?  We are drowning in
syzkaller reports and just throwing them at us doesn't really help
anyone here anymore.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
