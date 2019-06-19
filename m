Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B41214B750
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 13:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618DC6E345;
	Wed, 19 Jun 2019 11:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C78A6E345
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 11:46:04 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hdZ2G-0006lG-SN; Wed, 19 Jun 2019 11:45:53 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A55D3201F98F6; Wed, 19 Jun 2019 13:45:51 +0200 (CEST)
Date: Wed, 19 Jun 2019 13:45:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v1 12/22] docs: driver-api: add .rst files from the main
 dir
Message-ID: <20190619114551.GQ3463@hirez.programming.kicks-ass.net>
References: <cover.1560890771.git.mchehab+samsung@kernel.org>
 <b0d24e805d5368719cc64e8104d64ee9b5b89dd0.1560890772.git.mchehab+samsung@kernel.org>
 <20190619114356.GP3419@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619114356.GP3419@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8Ld1/gUBGA37LwDlAfN0RHjyQhkqgHav958Z4E1YaNk=; b=DhxC+ENOnd2Nk4b8T/HMJUPzz
 5WNVLKvDJcfUGbnM5+VTHFA2m91PvfuRuayR5ED5QmBv3lEawxZ5ApLG84FZIQYeVrko8q9k4XwU9
 FR7toCfnP0eO4dTCz2MYzpJDu0Pp0m8FTj4RiVREpibUIYeZN7luHs0i/Rr7l8KI09XjMPUDzeV1U
 927w887Wj92ThjXRQcqoyjlxYHUeG7U0dKoS3GeOQePvL63I3zBb+tyDtMTtMtEwmsyDX4GWZIyt0
 F6PZU9yN6ShrwEzJwdf2fXRGHvQ0w4XtpTkSLJeTIdMj3LE4T0i1tBWPOMtDb3yLncV0gNnoPYjHg
 tMoWXagEw==;
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
Cc: kernel-hardening@lists.openwall.com, Farhan Ali <alifm@linux.ibm.com>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Evgeniy Polyakov <zbr@ioremap.net>,
 linux-arch@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Alan Stern <stern@rowland.harvard.edu>,
 Jiri Slaby <jslaby@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Ohad Ben-Cohen <ohad@wizery.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fbdev@vger.kernel.org,
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
 Mauro Carvalho Chehab <mchehab@infradead.org>, linaro-mm-sig@lists.linaro.org,
 linux-gpio@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org, Johannes Thumshirn <morbidrsa@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Andrea Parri <andrea.parri@amarulasolutions.com>, linux-pci@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 platform-driver-x86@vger.kernel.org,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Emese Revfy <re.emese@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Darren Hart <dvhart@infradead.org>, Jade Alglave <j.alglave@ucl.ac.uk>,
 linux-pwm@vger.kernel.org, Kees Cook <keescook@chromium.org>,
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
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Ingo Molnar <mingo@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, netdev@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>,
 openipmi-developer@lists.sourceforge.net, Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDE6NDM6NTZQTSArMDIwMCwgUGV0ZXIgWmlqbHN0cmEg
d3JvdGU6Cj4gT24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDU6NTM6MTdQTSAtMDMwMCwgTWF1cm8g
Q2FydmFsaG8gQ2hlaGFiIHdyb3RlOgo+IAo+ID4gIC4uLi97ID0+IGRyaXZlci1hcGl9L2F0b21p
Y19iaXRvcHMucnN0ICAgICAgICB8ICAyIC0KPiAKPiBUaGF0J3MgYSAudHh0IGZpbGUsIGJpZyBm
YXQgTkFLIGZvciBtYWtpbmcgaXQgYW4gcnN0LgoKQWxzbywgaG93IG1hbnkgYmxvb2R5IHRpbWVz
IGRvIEkgaGF2ZSB0byBrZWVwIHRlbGxpbmcgdGhpcz8gSXQgaXMKc3RhcnRpbmcgdG8gZ2V0IF9S
RUFMTFlfIGFubm95aW5nLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
