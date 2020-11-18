Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0DB2B8D21
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A4D6E51A;
	Thu, 19 Nov 2020 08:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938626E2F2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 19:01:36 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-25-1cEBhn94MimnJjzlWXZTFw-1; Wed, 18 Nov 2020 19:00:22 +0000
X-MC-Unique: 1cEBhn94MimnJjzlWXZTFw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 18 Nov 2020 19:00:21 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Wed, 18 Nov 2020 19:00:21 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Linus Torvalds' <torvalds@linux-foundation.org>, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: RE: Linux 5.10-rc4
Thread-Topic: Linux 5.10-rc4
Thread-Index: AQHWu7P6i7HOJgcGCEellKywj802qKnNzjYQgABmnYCAAAwRYA==
Date: Wed, 18 Nov 2020 19:00:21 +0000
Message-ID: <c776ad37ae9f48aa8eff020e4499901c@AcuMS.aculab.com>
References: <CAHk-=wjFfAktnadOPb_iV5nKh=V5Am1sG-gciYveswRtuEkrLQ@mail.gmail.com>
 <692820a49ded436591b5fe3a18c68a5e@AcuMS.aculab.com>
 <CAHk-=wgQY7k_3NVCbaSmiJyLiAV_1TgwLk-d4QRMHMWqM5Oo_w@mail.gmail.com>
In-Reply-To: <CAHk-=wgQY7k_3NVCbaSmiJyLiAV_1TgwLk-d4QRMHMWqM5Oo_w@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-Mailman-Approved-At: Thu, 19 Nov 2020 08:31:38 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Linus Torvalds
> Sent: 18 November 2020 18:11
> 
> On Wed, Nov 18, 2020 at 4:12 AM David Laight <David.Laight@aculab.com> wrote:
> >
> > I've got the 'splat' below during boot.
> > This is an 8-core C2758 Atom cpu using the on-board/cpu graphics.
> > User space is Ubuntu 20.04.
> >
> > Additionally the X display has all the colours and alignment slightly
> > messed up.
> > 5.9.0 was ok.
> > I'm just guessing the two issues are related.
> 
> Sounds likely.  But it would be lovely if you could bisect when
> exactly the problem(s) started to both verify that, and just to
> pinpoint the exact change..

I'm working on it - have been all afternoon.
(I'm on holiday and it is raining...)

5.10-rc1 fails, so it is something in the merge window.
I suspect I'll just hit the pull of the drm changes.
The bisect suddenly build a 5.9-rc5+ kernel!
So I'm retesting a good/bad pair with likely dates and will restart it.

Annoyingly the test system defaults to booting the highest version
kernel - not the one I've just build; I may have given it a wrong answer.
The builds also all take 20 minutes; so the bisect is slow.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
