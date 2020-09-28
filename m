Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44A727BDB0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B80289E5F;
	Tue, 29 Sep 2020 07:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 355 seconds by postgrey-1.36 at gabe;
 Mon, 28 Sep 2020 18:05:54 UTC
Received: from mxout.uchuujin.de (static.85-10-192-230.clients.your-server.de
 [85.10.192.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15BD89F31
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 18:05:54 +0000 (UTC)
Received: by neutronstar.dyndns.org (Postfix, from userid 1000)
 id 9BCF71430A404; Mon, 28 Sep 2020 19:59:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=uchuujin.de; s=h;
 t=1601315997; bh=zxamZpi3kSU9G+GXTPakbJErD/WY1mYQwmtEPBU7ZC0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o1HF5W8sg+Fx0UJpLZCZ4nPr3K28U4Tme52Fa1L3eyBgZ1+7l6BNktaLBxaUzmHCX
 iIVvXyJlDX11mF7UVoF0VC+jrfJXnSJuH8LSwzDNsaOcwv6PsbrPR8tnxy40B8EOId
 CnPg76oQLTLGf0P/9b1tuFS3yq1bELL+2cJO3kfizuFRpWRDCRwe8QnpvfUkVvub2Q
 NKY99T2dOSISEmCjhimA9az6bAg037O798uHbsHDOguRZCgYsDkhsYTranteGdKPBi
 QA2V+E8aLjQvguwb8IKpDahCjakN3nBaCAvt1BoZo8i1IXmxD2FRYvAqxtN0rbCovS
 Z32aAWOHEZnQw==
Date: Mon, 28 Sep 2020 19:59:56 +0200
From: Martin Hostettler <textshell@uchuujin.de>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH] vt_ioctl: make VT_RESIZEX behave like VT_RESIZE
Message-ID: <20200928175956.GF24673@neutronstar.dyndns.org>
References: <000000000000226d3f05b02dd607@google.com>
 <bbcef674-4ac6-c933-b55d-8961ada97f4c@i-love.sakura.ne.jp>
 <47907f77-b14b-b433-45c6-a315193f0c1a@i-love.sakura.ne.jp>
 <494395bc-a7dd-fdb1-8196-a236a266ef54@i-love.sakura.ne.jp>
 <20200927092701.GA1037755@PWN>
 <4933b81b-9b1a-355b-df0e-9b31e8280ab9@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4933b81b-9b1a-355b-df0e-9b31e8280ab9@i-love.sakura.ne.jp>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 29 Sep 2020 07:12:58 +0000
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
Cc: syzbot <syzbot+b308f5fd049fbbc6e74f@syzkaller.appspotmail.com>,
 linux-fbdev@vger.kernel.org, George Kennedy <george.kennedy@oracle.com>,
 b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch, deller@gmx.de,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Linus Torvalds <torvalds@linux-foundation.org>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 27, 2020 at 08:46:30PM +0900, Tetsuo Handa wrote:
> VT_RESIZEX was introduced in Linux 1.3.3, but it is unclear that what
> comes to the "+ more" part, and I couldn't find a user of VT_RESIZEX.
> 

It seems this is/was used by "svgatextmode" which seems to be at
http://www.ibiblio.org/pub/Linux/utils/console/

Not sure if that kind of software still has a chance to work nowadays.

 - Martin Hostettler
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
