Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 574D725DD30
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 17:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEC66EC1C;
	Fri,  4 Sep 2020 15:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6236EC37
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 15:24:07 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 230432074D;
 Fri,  4 Sep 2020 15:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599233047;
 bh=ri7zmUpgyKTMYbtz2kSDMQhuxoAgWTRyxdor8sG91Hg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=v7jW2vEhVr8p23I/HLTgMVDzv/+VDSoGYpdmM/nuLNXYiLpN+dnzni3LQmpvsVaVd
 UZ3874kcTdk389T9t/dzruGQ70LzC/qKevtSC0v38b2LWOyO9LrH1oc10AB0Io28zh
 HqQFP/YiUoenvO6h10Kes+Xr/Qvi8HyI++84pREE=
Date: Fri, 4 Sep 2020 17:24:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH v2 (resend)] video: fbdev: fix OOB read in
 vga_8planes_imageblit()
Message-ID: <20200904152428.GA3501859@kroah.com>
References: <11ad8786-e407-3289-8bd9-2745c4834718@i-love.sakura.ne.jp>
 <90b55ec3-d5b0-3307-9f7c-7ff5c5fd6ad3@i-love.sakura.ne.jp>
 <36618e37-2cb6-8114-7a43-788780fae321@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <36618e37-2cb6-8114-7a43-788780fae321@i-love.sakura.ne.jp>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 04, 2020 at 11:53:16PM +0900, Tetsuo Handa wrote:
> Hello, Greg.
> 
> Since nobody is interested in this bug, can you directly pick up
> this obvious patch without waiting for maintainer's response?

I'll pick it up now.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
