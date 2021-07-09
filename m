Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 206E73C2ACD
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 23:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D7A6EA88;
	Fri,  9 Jul 2021 21:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from h4.fbrelay.privateemail.com (h4.fbrelay.privateemail.com
 [131.153.2.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52586EA88
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 21:28:55 +0000 (UTC)
Received: from MTA-11-3.privateemail.com (mta-11-1.privateemail.com
 [198.54.118.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id 6B371800A1
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 17:28:54 -0400 (EDT)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 5450D18000A9;
 Fri,  9 Jul 2021 17:28:51 -0400 (EDT)
Received: from [192.168.0.46] (unknown [10.20.151.249])
 by mta-11.privateemail.com (Postfix) with ESMTPA id 906FD18000A5;
 Fri,  9 Jul 2021 17:28:48 -0400 (EDT)
Date: Fri, 09 Jul 2021 17:28:42 -0400
From: Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH] fbcon: garbage collect fbdev scrolling acceleration
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-Id: <UBYZVQ.O83H1QJFD7TX@effective-light.com>
In-Reply-To: <CAMuHMdWhs4en-yR9ic+d4V9M_0BUFX40rP0M=tZRGMaUy2wv3g@mail.gmail.com>
References: <20210709010055.86663-1-someguy@effective-light.com>
 <CAMuHMdWhs4en-yR9ic+d4V9M_0BUFX40rP0M=tZRGMaUy2wv3g@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Virus-Scanned: ClamAV using ClamSMTP
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
 Pavel Machek <pavel@ucw.cz>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jing Xiangfeng <jingxiangfeng@huawei.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sam Ravnborg <sam@ravnborg.org>, Peilin Ye <yepeilin.cs@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, Jul 9 2021 at 09:49:02 AM +0200, Geert Uytterhoeven 
<geert@linux-m68k.org> wrote:
> Bummer, more code to revert to re-enable acceleration in the _56_
> fbdev drivers using acceleration (some of them unusable without),
> despite commit 39aead8373b3 claiming "No other driver supportes
> accelerated fbcon"...
Should they be refactored to DRM drivers? (I don't mind looking into it 
if you believe it's worthwhile.)


