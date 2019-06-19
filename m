Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC09C4B65E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 12:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BC26E357;
	Wed, 19 Jun 2019 10:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A22B6E357
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 10:43:15 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hdY38-0006TL-Ru; Wed, 19 Jun 2019 10:42:43 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id AA9C320098E60; Wed, 19 Jun 2019 12:42:39 +0200 (CEST)
Date: Wed, 19 Jun 2019 12:42:39 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v1 12/22] docs: driver-api: add .rst files from the main
 dir
Message-ID: <20190619104239.GM3419@hirez.programming.kicks-ass.net>
References: <cover.1560890771.git.mchehab+samsung@kernel.org>
 <b0d24e805d5368719cc64e8104d64ee9b5b89dd0.1560890772.git.mchehab+samsung@kernel.org>
 <CAKMK7uGM1aZz9yg1kYM8w2gw_cS6Eaynmar-uVurXjK5t6WouQ@mail.gmail.com>
 <20190619072218.4437f891@coco.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619072218.4437f891@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m16f9ue1VFiC0DkFO5F5uINqAIvhMmZvVgKeJd9wfsY=; b=NNCmFmFTbay0EtIcKhS6MVrGl
 AdplcSD+3WFy0yuGIcmTpCJPXrfb55Lpu2H797MTbB6ew5vKohxoJSQJLtIC/C2gEN00R3UVsIYdk
 odvorgfBGIM5ZpvJM6uL3VI0bU22NQpoEeUUFz+Qq+N4xgBsUVncaZjurZV2iJ+3aQP5JQXidntqu
 +L1KkgDQZHNmUbATT3kjxJVRF+EClVGvxhKRuhAQkfGjP/Y38SLSfoc4EkRuJvyz2Mh8Rgw/5+zcv
 hP5pBkdqtyojMN8no8YOonPn5fOmDREMC15lAYsx4mRCklZKOVfPXs+KTV497tIaRpmhDdfuXR6ce
 ZM4YeuitQ==;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Farhan Ali <alifm@linux.ibm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jaroslav Kysela <perex@perex.cz>,
 Evgeniy Polyakov <zbr@ioremap.net>,
 "open list:GENERIC INCLUDE/A..." <linux-arch@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Alan Stern <stern@rowland.harvard.edu>, Jiri Slaby <jslaby@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Ohad Ben-Cohen <ohad@wizery.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Boqun Feng <boqun.feng@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-crypto@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-s390@vger.kernel.org, Alex Shi <alex.shi@linux.alibaba.com>,
 Corey Minyard <minyard@acm.org>, "David S. Miller" <davem@davemloft.net>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Daniel Lustig <dlustig@nvidia.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Eric Farman <farman@linux.ibm.com>, linux-watchdog@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 linux-gpio <linux-gpio@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Johannes Thumshirn <morbidrsa@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Andrea Parri <andrea.parri@amarulasolutions.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 platform-driver-x86@vger.kernel.org,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Emese Revfy <re.emese@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Darren Hart <dvhart@infradead.org>, Jade Alglave <j.alglave@ucl.ac.uk>,
 linux-pwm <linux-pwm@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Luc Maranget <luc.maranget@inria.fr>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Rodolfo Giometti <giometti@enneenne.com>, Harry Wei <harryxiyou@gmail.com>,
 Stuart Hayes <stuart.w.hayes@gmail.com>, Logan Gunthorpe <logang@deltatee.com>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, kvm@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, linux-remoteproc@vger.kernel.org,
 Jerry Hoemann <jerry.hoemann@hpe.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Howells <dhowells@redhat.com>, Linux MM <linux-mm@kvack.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Ingo Molnar <mingo@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, netdev <netdev@vger.kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 openipmi-developer@lists.sourceforge.net, Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDc6MjI6MThBTSAtMDMwMCwgTWF1cm8gQ2FydmFsaG8g
Q2hlaGFiIHdyb3RlOgo+IEhpIERhbmllbCwKPiAKPiBFbSBXZWQsIDE5IEp1biAyMDE5IDExOjA1
OjU3ICswMjAwCj4gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiBlc2NyZXZldToKPiAK
PiA+IE9uIFR1ZSwgSnVuIDE4LCAyMDE5IGF0IDEwOjU1IFBNIE1hdXJvIENhcnZhbGhvIENoZWhh
Ygo+ID4gPG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZ3B1L2RybS1tbS5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS9kcm0t
bW0ucnN0Cj4gPiA+IGluZGV4IGZhMzBkZmNmYzNjOC4uYjBmOTQ4ZDg3MzNiIDEwMDY0NAo+ID4g
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS9kcm0tbW0ucnN0Cj4gPiA+ICsrKyBiL0RvY3VtZW50
YXRpb24vZ3B1L2RybS1tbS5yc3QKPiA+ID4gQEAgLTMyMCw3ICszMjAsNyBAQCBzdHJ1Y3QgOmM6
dHlwZTpgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyA8ZmlsZV9vcGVyYXRpb25zPmAgZ2V0X3VubWFw
cGVkX2FyZWEKPiA+ID4gIGZpZWxkIHdpdGggYSBwb2ludGVyIG9uIDpjOmZ1bmM6YGRybV9nZW1f
Y21hX2dldF91bm1hcHBlZF9hcmVhYC4KPiA+ID4KPiA+ID4gIE1vcmUgZGV0YWlsZWQgaW5mb3Jt
YXRpb24gYWJvdXQgZ2V0X3VubWFwcGVkX2FyZWEgY2FuIGJlIGZvdW5kIGluCj4gPiA+IC1Eb2N1
bWVudGF0aW9uL25vbW11LW1tYXAucnN0Cj4gPiA+ICtEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkv
bm9tbXUtbW1hcC5yc3QgIAo+ID4gCj4gPiBSYW5kb20gZHJpdmUtYnkgY29tbWVudDogQ291bGQg
d2UgY29udmVydCB0aGVzZSBpbnRvIGh5cGVybGlua3Mgd2l0aGluCj4gPiBzcGhpbnggc29tZWhv
dywgd2l0aG91dCBtYWtpbmcgdGhlbSBsZXNzIHVzZWZ1bCBhcyByYXcgZmlsZSByZWZlcmVuY2Vz
Cj4gPiAod2l0aCB2aW0gSSBjYW4ganVzdCB0eXBlICdnZicgYW5kIGl0IHdvcmtzLCBlbWFjcyBw
cm9iYWJseSB0aGUgc2FtZSkuCj4gPiAtRGFuaWVsCj4gCj4gU2hvcnQgYW5zd2VyOiBJIGRvbid0
IGtub3cgaG93IHZpbS9lbWFjcyB3b3VsZCByZWNvZ25pemUgU3BoaW54IHRhZ3MuCgpObywgdGhl
IG90aGVyIHdheSBhcm91bmQsIFNwaGlueCBjYW4gcmVjb2duaXplIGxvY2FsIGZpbGVzIGFuZCB0
cmVhdAp0aGVtIHNwZWNpYWwuIFRoYXQgd2F5IHdlIGtlZXAgdGhlIHRleHQgcmVhZGFibGUuCgpT
YW1lIHdpdGggdGhhdCA6YzpmdW5jOidmb28nIGNyYXAsIHRoYXQgbmVlZHMgdG8gZGllLCBhbmQg
U3BoaW54IG5lZWRzCnRvIGJlIHRhdWdodCBhYm91dCBmb28oKS4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
