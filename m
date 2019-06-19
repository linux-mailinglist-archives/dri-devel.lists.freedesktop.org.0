Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B69014BAE9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 16:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7EA6E40F;
	Wed, 19 Jun 2019 14:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5EE6E419
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 14:13:58 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 2B4E72E5;
 Wed, 19 Jun 2019 14:13:54 +0000 (UTC)
Date: Wed, 19 Jun 2019 08:13:53 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v1 12/22] docs: driver-api: add .rst files from the main
 dir
Message-ID: <20190619081353.75762028@lwn.net>
In-Reply-To: <20190619104239.GM3419@hirez.programming.kicks-ass.net>
References: <cover.1560890771.git.mchehab+samsung@kernel.org>
 <b0d24e805d5368719cc64e8104d64ee9b5b89dd0.1560890772.git.mchehab+samsung@kernel.org>
 <CAKMK7uGM1aZz9yg1kYM8w2gw_cS6Eaynmar-uVurXjK5t6WouQ@mail.gmail.com>
 <20190619072218.4437f891@coco.lan>
 <20190619104239.GM3419@hirez.programming.kicks-ass.net>
Organization: LWN.net
MIME-Version: 1.0
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Farhan Ali <alifm@linux.ibm.com>,
 Will Deacon <will.deacon@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Evgeniy Polyakov <zbr@ioremap.net>,
 "open list:GENERIC INCLUDE/A..." <linux-arch@vger.kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Alan Stern <stern@rowland.harvard.edu>,
 Jiri Slaby <jslaby@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Ohad Ben-Cohen <ohad@wizery.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
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
 linux-gpio <linux-gpio@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Johannes Thumshirn <morbidrsa@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Andrea Parri <andrea.parri@amarulasolutions.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 platform-driver-x86@vger.kernel.org,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
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
 Andreas =?UTF-8?B?RsOkcmJl?= =?UTF-8?B?cg==?= <afaerber@suse.de>,
 kvm@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-remoteproc@vger.kernel.org, Jerry Hoemann <jerry.hoemann@hpe.com>,
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

T24gV2VkLCAxOSBKdW4gMjAxOSAxMjo0MjozOSArMDIwMApQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6
QGluZnJhZGVhZC5vcmc+IHdyb3RlOgoKPiBObywgdGhlIG90aGVyIHdheSBhcm91bmQsIFNwaGlu
eCBjYW4gcmVjb2duaXplIGxvY2FsIGZpbGVzIGFuZCB0cmVhdAo+IHRoZW0gc3BlY2lhbC4gVGhh
dCB3YXkgd2Uga2VlcCB0aGUgdGV4dCByZWFkYWJsZS4KPiAKPiBTYW1lIHdpdGggdGhhdCA6Yzpm
dW5jOidmb28nIGNyYXAsIHRoYXQgbmVlZHMgdG8gZGllLCBhbmQgU3BoaW54IG5lZWRzCj4gdG8g
YmUgdGF1Z2h0IGFib3V0IGZvbygpLgoKSSBkaWQgYSBwYXRjaCB0byBtYWtlIHRoYXQgbGF0dGVy
IHBhcnQgaGFwcGVuLCBidXQgaGF2ZW4ndCBiZWVuIGFibGUgdG8KZmluZCB0aGUgdGltZSB0byBh
ZGRyZXNzIHRoZSBjb21tZW50cyBhbmQgZ2V0IGl0IG91dCB0aGVyZS4gIEl0IGRlZmluaXRlbHkK
Y2xlYW5lZCB1cCB0aGUgc291cmNlIGZpbGVzIGEgbG90IGFuZCBpcyB3b3J0aCBkb2luZy4gIFdp
bGwgdHJ5IHRvIGdldApiYWNrIHRvIGl0IHNvb24uCgpUaGUgbG9jYWwgZmlsZSBsaW5rcyBzaG91
bGQgYmUgZWFzeSB0byBkbzsgd2Ugc2hvdWxkbid0IG5lZWQgdG8gYWRkIGFueQptYXJrdXAgZm9y
IHRob3NlLgoKam9uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
