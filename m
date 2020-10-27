Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90CB29BFC6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 18:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EDB36EC0C;
	Tue, 27 Oct 2020 17:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0014.hostedemail.com
 [216.40.44.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C823D6EC07
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 17:08:12 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 45489182CED2A;
 Tue, 27 Oct 2020 17:08:10 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:69:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:1801:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3354:3622:3865:3866:3867:3868:3870:3871:3872:3874:4321:4605:5007:6742:6743:7576:7903:8603:10004:10400:10848:11026:11232:11473:11658:11783:11914:12043:12296:12297:12438:12555:12679:12740:12895:12986:13161:13229:13439:13894:14096:14097:14181:14659:14721:21080:21451:21627:21990:30012:30054:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: rake71_590ddfb2727d
X-Filterd-Recvd-Size: 4916
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Tue, 27 Oct 2020 17:08:04 +0000 (UTC)
Message-ID: <2767969b94fd66db1fb0fc13b5783ae65b7deb2f.camel@perches.com>
Subject: Re: [PATCH 3/8] vhost: vringh: use krealloc_array()
From: Joe Perches <joe@perches.com>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Tue, 27 Oct 2020 10:08:02 -0700
In-Reply-To: <CAMpxmJU0C84DjPmqmWvPgv0zwgGLhkpKLRDuKkZHAa=wi+LvBA@mail.gmail.com>
References: <20201027121725.24660-1-brgl@bgdev.pl>
 <20201027121725.24660-4-brgl@bgdev.pl>
 <20201027112607-mutt-send-email-mst@kernel.org>
 <685d850347a1191bba8ba7766fc409b140d18f03.camel@perches.com>
 <CAMpxmJU0C84DjPmqmWvPgv0zwgGLhkpKLRDuKkZHAa=wi+LvBA@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Gustavo Padovan <gustavo@padovan.org>,
 linux-drm <dri-devel@lists.freedesktop.org>, Jaroslav Kysela <perex@perex.cz>,
 linux-mm@kvack.org, Christoph Lameter <cl@linux.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 David Rientjes <rientjes@google.com>,
 virtualization@lists.linux-foundation.org, Jason Wang <jasowang@redhat.com>,
 linux-media <linux-media@vger.kernel.org>, Robert Richter <rric@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linaro-mm-sig@lists.linaro.org,
 linux-gpio <linux-gpio@vger.kernel.org>, Borislav Petkov <bp@alien8.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, netdev <netdev@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>,
 Pekka Enberg <penberg@kernel.org>, James Morse <james.morse@arm.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-10-27 at 17:58 +0100, Bartosz Golaszewski wrote:
> On Tue, Oct 27, 2020 at 5:50 PM Joe Perches <joe@perches.com> wrote:
> > =

> > On Tue, 2020-10-27 at 11:28 -0400, Michael S. Tsirkin wrote:
> > > On Tue, Oct 27, 2020 at 01:17:20PM +0100, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > =

> > > > Use the helper that checks for overflows internally instead of manu=
ally
> > > > calculating the size of the new array.
> > > > =

> > > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > =

> > > No problem with the patch, it does introduce some symmetry in the cod=
e.
> > =

> > Perhaps more symmetry by using kmemdup
> > ---
> > =A0drivers/vhost/vringh.c | 23 ++++++++++-------------
> > =A01 file changed, 10 insertions(+), 13 deletions(-)
> > =

> > diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
> > index 8bd8b403f087..99222a3651cd 100644
> > --- a/drivers/vhost/vringh.c
> > +++ b/drivers/vhost/vringh.c
> > @@ -191,26 +191,23 @@ static int move_to_indirect(const struct vringh *=
vrh,
> > =A0static int resize_iovec(struct vringh_kiov *iov, gfp_t gfp)
> > =A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0struct kvec *new;
> > -       unsigned int flag, new_num =3D (iov->max_num & ~VRINGH_IOV_ALLO=
CATED) * 2;
> > +       size_t new_num =3D (iov->max_num & ~VRINGH_IOV_ALLOCATED) * 2;
> > +       size_t size;
> > =

> > =A0=A0=A0=A0=A0=A0=A0=A0if (new_num < 8)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0new_num =3D 8;
> > =

> > -       flag =3D (iov->max_num & VRINGH_IOV_ALLOCATED);
> > -       if (flag)
> > -               new =3D krealloc(iov->iov, new_num * sizeof(struct iove=
c), gfp);
> > -       else {
> > -               new =3D kmalloc_array(new_num, sizeof(struct iovec), gf=
p);
> > -               if (new) {
> > -                       memcpy(new, iov->iov,
> > -                              iov->max_num * sizeof(struct iovec));
> > -                       flag =3D VRINGH_IOV_ALLOCATED;
> > -               }
> > -       }
> > +       if (unlikely(check_mul_overflow(new_num, sizeof(struct iovec), =
&size)))
> > +               return -ENOMEM;
> > +
> =

> The whole point of using helpers such as kmalloc_array() is not doing
> these checks manually.

Tradeoffs for in readability for overflow and not mistyping or doing
the multiplication of iov->max_num * sizeof(struct iovec) twice.

Just fyi:

the realloc doesn't do a multiplication overflow test as written so the
suggestion is slightly more resistant to defect.

   =


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
