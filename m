Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DED2C14C72E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 09:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5ECB6F477;
	Wed, 29 Jan 2020 08:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from brightrain.aerifal.cx (216-12-86-13.cv.mvl.ntelos.net
 [216.12.86.13])
 by gabe.freedesktop.org (Postfix) with ESMTP id CCEE66E062
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 18:58:26 +0000 (UTC)
Received: from dalias by brightrain.aerifal.cx with local (Exim 3.15 #2)
 id 1iwW43-0002pe-00; Tue, 28 Jan 2020 18:58:19 +0000
Date: Tue, 28 Jan 2020 13:58:19 -0500
From: Rich Felker <dalias@libc.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] matroxfb: add Matrox MGA-G200eW board support
Message-ID: <20200128185819.GG30412@brightrain.aerifal.cx>
References: <20200125195506.GA16638@brightrain.aerifal.cx>
 <1466259e-efe7-df52-c05b-80042628d577@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1466259e-efe7-df52-c05b-80042628d577@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Wed, 29 Jan 2020 08:06:22 +0000
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 27, 2020 at 08:36:07AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 25.01.20 um 20:55 schrieb Rich Felker:
> > Signed-off-by: Rich Felker <dalias@libc.org>
> > --
> > I've had this lying around a while and figure I should send it
> > upsteam; it's needed to support the onboard video on my Spectre-free
> > Atom S1260 server board.
> 
> This HW is supported by mgag200, which is maintained. Can't you use that?

Perhaps; I wasn't aware it existed. I'll give it a try. It still might
be nice to apply my patch though since the matroxfb driver works with
it and only fails to support it because of not knowing the device id.

Rich
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
