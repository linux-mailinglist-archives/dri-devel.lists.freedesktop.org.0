Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6A02B9C0A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 21:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0006E820;
	Thu, 19 Nov 2020 20:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC2189A8B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 09:31:02 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-220--Y-lcYUAMEG_EoAlzMORdQ-1; Thu, 19 Nov 2020 09:30:57 +0000
X-MC-Unique: -Y-lcYUAMEG_EoAlzMORdQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 19 Nov 2020 09:30:56 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 19 Nov 2020 09:30:56 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Dave Airlie' <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: RE: Linux 5.10-rc4
Thread-Topic: Linux 5.10-rc4
Thread-Index: AQHWu7P6i7HOJgcGCEellKywj802qKnNzjYQgAB+qGeAACacEIAAOFJJgACIcRA=
Date: Thu, 19 Nov 2020 09:30:56 +0000
Message-ID: <886a1e597e784b42a0fd490b85aa4936@AcuMS.aculab.com>
References: <CAHk-=wjFfAktnadOPb_iV5nKh=V5Am1sG-gciYveswRtuEkrLQ@mail.gmail.com>
 <692820a49ded436591b5fe3a18c68a5e@AcuMS.aculab.com>
 <CAHk-=wgQY7k_3NVCbaSmiJyLiAV_1TgwLk-d4QRMHMWqM5Oo_w@mail.gmail.com>
 <0a10da3d-085f-c7a7-0053-dc1e9ea871ed@suse.de>
 <f7be660da595411ab60aaa4b76008769@AcuMS.aculab.com>
 <CAKMK7uFZhVqEzjfHszQ=1KeoRecXSDa0+tdH_rT8yENY9zasyQ@mail.gmail.com>
 <CAPM=9tw7_BU1_mUVa8ZeqsXfsN_cODsTzTAXiQkDGT+i1v0JaQ@mail.gmail.com>
 <CAPM=9twMArmaJ9rqxDzhZh+dwgVuTdAXrtzFK+TpSe_9xSKDOA@mail.gmail.com>
In-Reply-To: <CAPM=9twMArmaJ9rqxDzhZh+dwgVuTdAXrtzFK+TpSe_9xSKDOA@mail.gmail.com>
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
X-Mailman-Approved-At: Thu, 19 Nov 2020 20:32:07 +0000
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Huang, Ray" <ray.huang@amd.com>,
 Thomas
 Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>, Linus
 Torvalds <torvalds@linux-foundation.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie
> Sent: 19 November 2020 01:16
> 
> On Thu, 19 Nov 2020 at 08:25, Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Thu, 19 Nov 2020 at 08:15, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > On Wed, Nov 18, 2020 at 11:01 PM David Laight <David.Laight@aculab.com> wrote:
> > > >
> > > > From: Thomas Zimmermann
> > > > > Sent: 18 November 2020 19:37
> > > > >
> > > > > Hi
> > > > >
> > > > > Am 18.11.20 um 19:10 schrieb Linus Torvalds:
> > > > > > On Wed, Nov 18, 2020 at 4:12 AM David Laight <David.Laight@aculab.com> wrote:
> > > > > >>
> > > > > >> I've got the 'splat' below during boot.
> > > > > >> This is an 8-core C2758 Atom cpu using the on-board/cpu graphics.
> > > > > >> User space is Ubuntu 20.04.
> > > > > >>
> > > > > >> Additionally the X display has all the colours and alignment slightly
> > > > > >> messed up.
> > > > > >> 5.9.0 was ok.
> > > > > >> I'm just guessing the two issues are related.
> > > > > >
> > > > > > Sounds likely.  But it would be lovely if you could bisect when
> > > > > > exactly the problem(s) started to both verify that, and just to
> > > > > > pinpoint the exact change..
> > > >
> > > > I don't quite understand what 'git bisect' did.
> > > > I was bisecting between v5.9 and v5.10-rc1 but it suddenly started
> > > > generating v5.9.0-rc5+ kernels.
> > >
> > > We queue up patches for -rc1 way before the previous kernel is
> > > released, so this is normal.
> > >
> > > > The identified commit was 13a8f46d803 drm/ttm: move ghost object created.
> > > > (retyped - hope it is right).
> > > > But the diff to that last 'good' commit is massive.
> > >
> > > Yeah that's also normal for non-linear history. If you want to
> > > double-check, re-test the parent of that commit (which is 2ee476f77ffe
> > > ("drm/ttm: add a simple assign mem to bo wrapper")), which should
> > > work, and then the bad commit.
> > >
> > > Also is this the first bad commit for both the splat and the screen
> > > corruption issues?
> > >
> > > > So I don't know if that is anywhere near right.
> > >
> > > Thomas guessed it could be a ttm change, you hit one, and it looks
> > > like it could be the culprit. Now I guess it's up to Dave. Also adding
> > > Christian, in case he has an idea.
> >
> > I'd be mildly surprised if it's that commit, since it just refactors
> > what looks to me to be two identical code pieces into one instance
> > (within the scope of me screwing that up, but reading it I can't see
> > it).
> >
> > I'll dig into this today.
> 
> https://patchwork.freedesktop.org/patch/401559/
> 
> should fix it.

Nope, and probably not relevant.
pl_flags is 2 or 3 and it is testing for 4.

The oldest kernel doesn't generate the 'splat' either.
Just the f*cked up display output.

I'll put a screenshot (photo) into another email.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
