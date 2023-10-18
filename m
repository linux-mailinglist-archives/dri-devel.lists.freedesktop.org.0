Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A157CE44B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 19:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BFE10E410;
	Wed, 18 Oct 2023 17:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 87833 seconds by postgrey-1.36 at gabe;
 Wed, 18 Oct 2023 17:19:37 UTC
Received: from mailo.com (msg-1.mailo.com [213.182.54.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C84810E410
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 17:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1697649563; bh=B1cgb8snhfBGvxDZW4alCwgPKMEjrzTDUDC8NKrs268=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=KS9AlqLepVVPF2OOVUXU6YS7adFmgG4t+2mhhmqUFM+QeRiPL25/yV1drwMhJ1X2P
 k2ahpoc9U3kS3YPwUbzStU5ZRYgsiFe31gVMatZf/pu6ztlp3bvs3hx/dxezgFaBEW
 ptFuth4VKlYqBulJ2D0i5IbfIRqdO3h9xd+F/WME=
Received: by b221-3.in.mailobj.net [192.168.90.23] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Wed, 18 Oct 2023 19:19:22 +0200 (CEST)
X-EA-Auth: UMZRru0/Ise3CE3gDNk9iOU0F6Lrl70MGQwwBM6Trk3KrsGK6bCkt9N8u71Dc2HxfQkZcvG1ZxMrRjPdBoP5jLiRVTZUegRE
Date: Wed, 18 Oct 2023 22:49:15 +0530
From: Deepak R Varma <drv@mailo.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: Re: ivpu TODO list items
Message-ID: <ZTATkznuHyX4rUit@runicha.com>
References: <ZSjwuyCOL9Vb9+yb@runicha.com> <ZS68dysac34rA32D@runicha.com>
 <20231018075053.GB525429@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018075053.GB525429@linux.intel.com>
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
Cc: Deepak R Varma <drv@mailo.com>, Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 18, 2023 at 09:50:53AM +0200, Stanislaw Gruszka wrote:
> Hi
>
> On Tue, Oct 17, 2023 at 10:25:19PM +0530, Deepak R Varma wrote:
> > On Fri, Oct 13, 2023 at 12:54:43PM +0530, Deepak R Varma wrote:
> > > Hello,
> > > I am shortlisted as a mentee for the LF Mentorship program. I looked at the TODO
> > > file for the ivpu driver for my project tasks. Could you please answer the
> > > following questions:
> > >
> > > 1. Is the TODO list up to date? If not, can we have it updated? Let me know if I
> > > can help.
> It's not. Some of those was already implemented (but yet not submitted).
> Some ideas there was dropped.
>
> I think this file can be whole removed. Feel free to post patch for
> that.

Hello,
Thank you for the response. I sincerely appreciate your time.
I will send in a patch to remove the TODO file.

>
> > > 2. Is it absolutely necessary for me to have a specialized hardware to test my
> > > patches? Is it limited to the 14thGen or above CPU or do I need more than that?
> Yes, I don't think someone can work on ivpu without hardware.

Okay. Could you suggest what would be the minimum hardware required to explore
this driver?

>
> > > 3. Is it okay for me to work on the TODO list items. Let me know if you have a
> > > preference [Please note I just started a few months ago and still learning].
> I recommend you to work on items from:
> https://www.kernel.org/doc/html/latest/gpu/todo.html

This is helpful. I will review the list tiems.
Thank you again.

Deepak.

>
> > Hello,
> > May I request the maintainer to review my questions and comment please?
>
> Sorry, I haven't seen this email before.
>
> Regards
> Stanislaw


