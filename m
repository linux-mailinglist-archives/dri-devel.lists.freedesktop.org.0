Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 319722BBEB0
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 12:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F446E9A1;
	Sat, 21 Nov 2020 11:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42026E8AB
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 10:51:27 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-234-k48j_AcUP4appSBg89PJ6g-1; Fri, 20 Nov 2020 10:51:24 +0000
X-MC-Unique: k48j_AcUP4appSBg89PJ6g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 20 Nov 2020 10:51:23 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Fri, 20 Nov 2020 10:51:23 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Thomas Zimmermann' <tzimmermann@suse.de>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: RE: Linux 5.10-rc4; graphics alignment
Thread-Topic: Linux 5.10-rc4; graphics alignment
Thread-Index: Ada/IUdqcU2WLz13TDyBa91ssXd9zQABIUYAAAEibgA=
Date: Fri, 20 Nov 2020 10:51:23 +0000
Message-ID: <c01d2d95f1e64be984cff71e7bdf1c84@AcuMS.aculab.com>
References: <2c474745ae884de3b4ecb8abe2152bfd@AcuMS.aculab.com>
 <fa5c887e-82d8-5347-ff18-85e3628dadbe@suse.de>
In-Reply-To: <fa5c887e-82d8-5347-ff18-85e3628dadbe@suse.de>
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
X-Mailman-Approved-At: Sat, 21 Nov 2020 11:34:30 +0000
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
 dri-devel <dri-devel@lists.freedesktop.org>, "Huang, Ray" <ray.huang@amd.com>,
 Dave Airlie <airlied@redhat.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann
> Sent: 20 November 2020 10:14
...
> > Is there any way to bisect through the parts of the
> > drm merge patch into v5.10-rc1 ?
> >
> > That ought to be quicker (and less error prone) than
> > the bisect builds I was doing.
> >
> > Note that the stack 'splat' is due to a later change.
> > It is separate from the broken pixel alignment.
> >
> > I actually saw the vga text go 'funny' while the boot
> > was outputting all the [OK] messages (from systemd?)
> > before the graphic login stole tty1 (bloody stupid
> > to use tty1).
> >
> > I don't need to use the failing system today, I'll
> > have another go at isolating the failure.
> 
> You can use drm-tip for testing, where many of the DRM patches go through.
> 
>    https://cgit.freedesktop.org/drm/drm-tip/
> 
> It's fairly up-to-date.

Any idea of tags either side of the 5.10 merge?

> I have two systems with AST chips and neither shows any of the symptoms
> you describe; nor do we have such reports about drivers that use a
> similar stack (hibmc, bochs). Could you provide the output of
> 
>    dmesg | grep drm

[    2.112303] fb0: switching to astdrmfb from EFI VGA
[    2.120222] ast 0000:02:00.0: [drm] Using P2A bridge for configuration
[    2.120233] ast 0000:02:00.0: [drm] AST 2400 detected
[    2.120247] ast 0000:02:00.0: [drm] Analog VGA only
[    2.120257] ast 0000:02:00.0: [drm] dram MCLK=408 Mhz type=1 bus_width=16
[    2.121121] [drm] Initialized ast 0.1.0 20120228 for 0000:02:00.0 on minor 0
[    2.125838] fbcon: astdrmfb (fb0) is primary device
[    2.152179] ast 0000:02:00.0: [drm] fb0: astdrmfb frame buffer device
[    6.061034] systemd[1]: Condition check resulted in Load Kernel Module drm being skipped.

The output is the same for both good and bad kernels.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
