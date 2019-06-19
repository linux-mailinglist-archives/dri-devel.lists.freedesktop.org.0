Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 218384B627
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 12:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1B68923A;
	Wed, 19 Jun 2019 10:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6388923A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 10:27:13 +0000 (UTC)
Received: from 177.133.86.196.dynamic.adsl.gvt.net.br ([177.133.86.196]
 helo=coco.lan)
 by casper.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hdXjq-0002py-Ny; Wed, 19 Jun 2019 10:22:47 +0000
Date: Wed, 19 Jun 2019 07:22:18 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 12/22] docs: driver-api: add .rst files from the main
 dir
Message-ID: <20190619072218.4437f891@coco.lan>
In-Reply-To: <CAKMK7uGM1aZz9yg1kYM8w2gw_cS6Eaynmar-uVurXjK5t6WouQ@mail.gmail.com>
References: <cover.1560890771.git.mchehab+samsung@kernel.org>
 <b0d24e805d5368719cc64e8104d64ee9b5b89dd0.1560890772.git.mchehab+samsung@kernel.org>
 <CAKMK7uGM1aZz9yg1kYM8w2gw_cS6Eaynmar-uVurXjK5t6WouQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YFOuuDPHS3QNn8VKFuojZaSfGLUUo0b1zU6yyzH4L70=; b=jUOdYjXbPDpIqxwy+em4PxKM0J
 xkdPx5H7WoOJmCChJicEuS8Dw2vGo7mwneAjeyi/LT8ATPVb5S+ALOXm5/Rzu/m/bwxiNabowOpId
 KTNbE0GjSU9RtfDT+1PQcqgQun5phOiqhIxET9CZjXTzuGBuEwZDsnS3H6c2LYMh2oOiNmhFWz4QI
 5LpiOvcGTG0XtZtaCQLIVUZgfoYZriCL5J7XK54Z/NAaIsvntp4qlD7U9stNDGJMYfNjWdO4E24E6
 pE61p2yrvQvZslNH6L8H9NPDI9f0qIvVnf5BvnYePk9zRpaO9pe2QH39CgKVXQtIf0orgbPicFQeU
 WxI16YxA==;
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
 "moderated list:DMA BUFFER SHARING
 FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
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
 Maxime Ripard <maxime.ripard@bootlin.com>, Emese Revfy <re.emese@gmail.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Darren Hart <dvhart@infradead.org>, Jade Alglave <j.alglave@ucl.ac.uk>,
 linux-pwm <linux-pwm@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Luc Maranget <luc.maranget@inria.fr>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Rodolfo Giometti <giometti@enneenne.com>, Harry Wei <harryxiyou@gmail.com>,
 Stuart Hayes <stuart.w.hayes@gmail.com>, Logan Gunthorpe <logang@deltatee.com>,
 Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-remoteproc@vger.kernel.org,
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

SGkgRGFuaWVsLAoKRW0gV2VkLCAxOSBKdW4gMjAxOSAxMTowNTo1NyArMDIwMApEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IGVzY3JldmV1OgoKPiBPbiBUdWUsIEp1biAxOCwgMjAxOSBh
dCAxMDo1NSBQTSBNYXVybyBDYXJ2YWxobyBDaGVoYWIKPiA8bWNoZWhhYitzYW1zdW5nQGtlcm5l
bC5vcmc+IHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L2RybS1tbS5y
c3QgYi9Eb2N1bWVudGF0aW9uL2dwdS9kcm0tbW0ucnN0Cj4gPiBpbmRleCBmYTMwZGZjZmMzYzgu
LmIwZjk0OGQ4NzMzYiAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L2RybS1tbS5y
c3QKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZ3B1L2RybS1tbS5yc3QKPiA+IEBAIC0zMjAsNyAr
MzIwLDcgQEAgc3RydWN0IDpjOnR5cGU6YHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgPGZpbGVfb3Bl
cmF0aW9ucz5gIGdldF91bm1hcHBlZF9hcmVhCj4gPiAgZmllbGQgd2l0aCBhIHBvaW50ZXIgb24g
OmM6ZnVuYzpgZHJtX2dlbV9jbWFfZ2V0X3VubWFwcGVkX2FyZWFgLgo+ID4KPiA+ICBNb3JlIGRl
dGFpbGVkIGluZm9ybWF0aW9uIGFib3V0IGdldF91bm1hcHBlZF9hcmVhIGNhbiBiZSBmb3VuZCBp
bgo+ID4gLURvY3VtZW50YXRpb24vbm9tbXUtbW1hcC5yc3QKPiA+ICtEb2N1bWVudGF0aW9uL2Ry
aXZlci1hcGkvbm9tbXUtbW1hcC5yc3QgIAo+IAo+IFJhbmRvbSBkcml2ZS1ieSBjb21tZW50OiBD
b3VsZCB3ZSBjb252ZXJ0IHRoZXNlIGludG8gaHlwZXJsaW5rcyB3aXRoaW4KPiBzcGhpbnggc29t
ZWhvdywgd2l0aG91dCBtYWtpbmcgdGhlbSBsZXNzIHVzZWZ1bCBhcyByYXcgZmlsZSByZWZlcmVu
Y2VzCj4gKHdpdGggdmltIEkgY2FuIGp1c3QgdHlwZSAnZ2YnIGFuZCBpdCB3b3JrcywgZW1hY3Mg
cHJvYmFibHkgdGhlIHNhbWUpLgo+IC1EYW5pZWwKClNob3J0IGFuc3dlcjogSSBkb24ndCBrbm93
IGhvdyB2aW0vZW1hY3Mgd291bGQgcmVjb2duaXplIFNwaGlueCB0YWdzLgoKVGhlcmUgYXJlIHR3
byB3YXlzIG9mIGRvaW5nIGh5cGVybGlua3MgdG8gbG9jYWwgZmlsZXMuIFRoZSBmaXJzdCBvbmUg
aXMgdG8gCmFkZCBhIGxhYmVsIGF0IHRoZSBvdGhlciBmaWxlIGFuZCB1c2UgYSByZWZlcmVuY2Ug
dG8gc3VjaCBsYWJlbCwgZS4gZy4gYXQKbm9tbXUtbW1hcC5yc3QsIHlvdSB3b3VsZCBhZGQgYSBs
YWJlbCBsaWtlOgoKCS4uIF9kcm1fbm9tbXUtbW1hcDoKCmF0IHRoZSBiZWdpbm5pbmcgb2YgdGhl
IGZpbGUuCgpUaGVuLCBhdCBkcm0tbW0ucnN0LCB5b3Ugd291bGQgdXNlIDpyZWY6YGRybV9ub21t
dS1tbWFwYCAodGhlcmUgYXJlIGEKZmV3IG90aGVyIGFsdGVybmF0aXZlIHRhZ3MgdGhhdCB3b3Vs
ZCB3b3JrIHRoZSBzYW1lIHdheSkuCgpUaGUgYWR2YW50YWdlIGlzIHRoYXQgeW91IGNvdWxkIG1v
dmUvcmVuYW1lIGRvY3VtZW50cyBhbnl0aW1lLCB3aXRob3V0Cm5lZWRpbmcgdG8gdGFrZSBjYXJl
IG9mIGl0LgoKUGVyaGFwcyBpdCBjb3VsZCBiZSBwb3NzaWJsZSBhIHRvb2wgbGlrZSBjc2NvcGUg
dG8gcGFyc2UgdGhvc2UgaW4Kb3JkZXIgdG8gcHJvdmlkZSBzdWNoIGF1dG9tYXRpb24gZm9yIFNw
aGlueC4gSSBkdW5uby4KCi0KClRoZSBvdGhlciB3YXkgaXMgdG8gdXNlOgoKCTpkb2M6YG5vbW11
LW1tYXAucnN0YCAoaWYgYm90aCBmaWxlcyBhcmUgYXQgdGhlIHNhbWUgZGlyKQoKVGhlIDpkb2M6
IHBhdGggaXMgdGhlIGN1cnJlbnQgZGlyZWN0b3J5LiBTbywgaWYgYSBmaWxlIGF0LCBsZXQncyBz
YXksCkRvY3VtZW50YXRpb24vZ3B1IHdhbnRzIHRvIHJlZmVyIGFub3RoZXIgZmlsZSBhdCBkcml2
ZXItYXBpLCBpdCB3b3VsZApuZWVkIHRvIHdyaXRlIGl0IGFzOgoKCTpkb2M6YC4uL2RyaXZlci1h
cGkvbm9tbXUtbW1hcC5yc3RgCgpJJ20gbm90IHN1cmUgaWYgdmltL2VtYWNzIHJlY29nbml6ZXMg
dGhpcyBzeW50YXgsIHRob3VnaC4KClBlcmhhcHMgdGhpcyB0YWcgY291bGQgYmUgdXNlZCBhczoK
Cgk6ZG9jOmBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvbm9tbXUtbW1hcC5yc3QgPC4uL2RyaXZl
ci1hcGkvbm9tbXUtbWFwLnJzdGAKCkJ1dCB0aGF0IGxvb2tzIHRvbyB1Z2x5IHRvIG15IHRhc3Rl
LgoKLQoKT24gdGhpcyBjb252ZXJzaW9uLCBJIG9wdGVkIHRvIG5vdCB0b3VjaCB0aGlzLiBXZSBt
YXkgY29uc2lkZXIgdHJ5aW5nCnRvIHJlcGxhY2UgdGhvc2UgCgoKVGhhbmtzLApNYXVybwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
