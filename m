Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CA715E26
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 09:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AB589DFD;
	Tue,  7 May 2019 07:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F014089B00
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 19:55:39 +0000 (UTC)
Received: from [179.182.172.35] (helo=coco.lan)
 by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNje4-000732-8K; Mon, 06 May 2019 19:51:28 +0000
Date: Mon, 6 May 2019 16:50:59 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 56/79] docs: Documentation/*.txt: rename all ReST
 files to *.rst
Message-ID: <20190506165059.51eb2959@coco.lan>
In-Reply-To: <20190424065209.GC4038@hirez.programming.kicks-ass.net>
References: <cover.1555938375.git.mchehab+samsung@kernel.org>
 <cda57849a6462ccc72dcd360b30068ab6a1021c4.1555938376.git.mchehab+samsung@kernel.org>
 <20190423083135.GA11158@hirez.programming.kicks-ass.net>
 <20190423125519.GA7104@redhat.com>
 <20190423130132.GT4038@hirez.programming.kicks-ass.net>
 <20190423103053.07cf2149@lwn.net>
 <20190423171158.GG12232@hirez.programming.kicks-ass.net>
 <20190423172006.GD16353@zn.tnic> <20190423170409.7b1370ac@coco.lan>
 <20190423213816.GE16353@zn.tnic>
 <20190424065209.GC4038@hirez.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 07 May 2019 07:20:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=svFixFLsbnaR5DUt4ImgtkhN2pmye2Nmylim0WQyDAU=; b=K9WI+zD/+TOTuXyzRM3G0QrDjG
 O43eurvDKzXS14FOyzPI66y2DyZJK3ddvQ17HuJpD3Dkbpp79KIPyIc15lIW7bL6o/2IGwUXHJnoE
 7oG1A+M8EAKYBGhEWvxDE7yw1SsCjeVfdDN46pMZVeJiXYcFYpEZ6BVHabmbsYj7K+l8d+CO0NsWJ
 X90cZKjwaT2MBtVvJEsxuHXwkk036LS07zGrOkcMW419VfZxtnGajVdxgtgQf3BRcrzFoI/6TKMGE
 BMrjekCKBlvsGpjvJHnwEr+tmcnRqswvMdmTpdFRftvLfz9mwyOr5M27O56OJUnDhbZTYUnkXIrGm
 zPeBiieQ==;
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
Cc: Mike Snitzer <snitzer@redhat.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Farhan Ali <alifm@linux.ibm.com>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, kernel-hardening@lists.openwall.com,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arch@vger.kernel.org, linux-sh@vger.kernel.org,
 James Morris <jmorris@namei.org>, Halil Pasic <pasic@linux.ibm.com>,
 tboot-devel@lists.sourceforge.net, Alan Stern <stern@rowland.harvard.edu>,
 openipmi-developer@lists.sourceforge.net, Guenter Roeck <linux@roeck-us.net>,
 Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, Matt Mackall <mpm@selenic.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
 linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org,
 David Airlie <airlied@linux.ie>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, dm-devel@redhat.com,
 Harry Wei <harryxiyou@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Alasdair Kergon <agk@redhat.com>, linux-s390@vger.kernel.org,
 Alex Shi <alex.shi@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Changbin Du <changbin.du@gmail.com>, Eric Farman <farman@linux.ibm.com>,
 linux-watchdog@vger.kernel.org, Corey Minyard <minyard@acm.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, linaro-mm-sig@lists.linaro.org,
 linux-gpio@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 Cornelia Huck <cohuck@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrea Parri <andrea.parri@amarulasolutions.com>, linux-pci@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 platform-driver-x86@vger.kernel.org,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Kishon Vijay Abraham I <kishon@ti.com>, Peter Zijlstra <peterz@infradead.org>,
 Emese Revfy <re.emese@gmail.com>, Darren Hart <dvhart@infradead.org>,
 Jade Alglave <j.alglave@ucl.ac.uk>, "Serge
 E. Hallyn" <serge@hallyn.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Ning Sun <ning.sun@intel.com>, Borislav Petkov <bp@alien8.de>,
 Luc Maranget <luc.maranget@inria.fr>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-parisc@vger.kernel.org, iommu@lists.linux-foundation.org,
 Stuart Hayes <stuart.w.hayes@gmail.com>, Logan Gunthorpe <logang@deltatee.com>,
 Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,
 Rich Felker <dalias@libc.org>, kvm@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Jerry Hoemann <jerry.hoemann@hpe.com>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, Kirti Wankhede <kwankhede@nvidia.com>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 devicetree@vger.kernel.org, Daniel Lustig <dlustig@nvidia.com>,
 linux-block@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, linux-security-module@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, Robin Murphy <robin.murphy@arm.com>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW0gV2VkLCAyNCBBcHIgMjAxOSAwODo1MjowOSArMDIwMApQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6
QGluZnJhZGVhZC5vcmc+IGVzY3JldmV1OgoKPiBPbiBUdWUsIEFwciAyMywgMjAxOSBhdCAxMToz
ODoxNlBNICswMjAwLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6Cj4gPiBJZiB0aGF0IGlzIGFsbCB0
aGUgY2hhbmdlcyBpdCB3b3VsZCBuZWVkLCB0aGVuIEkgZ3Vlc3MgdGhhdCdzIG9rLiBCdHcsCj4g
PiB0aG9zZSByc3QtY29udmVyc2lvbiBwYXRjaGVzIGRvbid0IHJlYWxseSBzaG93IHdoYXQgZ290
IGNoYW5nZWQuIER1bm5vCj4gPiBpZiBnaXQgY2FuIGV2ZW4gc2hvdyB0aGF0IHByb3Blcmx5LiBJ
IGRpZmZlZCB0aGUgdHdvIGZpbGVzIGJ5IGhhbmQgdG8KPiA+IHNlZSB3aGF0IGdvdCBjaGFuZ2Vk
LCBzZWUgZW5kIG9mIG1haWwuICAKPiAKPiBUaGF0IGlzIG5vdCBhIGhhcHB5IGRpZmY7IHRoYXQg
dGFibGUgaGFzIGdvdHRlbiB3YWF5IHdvcnNlIHRvIHJlYWQgZHVlCj4gdG8gYWxsIHRoYXQgZXh0
cmEgdGFibGUgY3JhcC4KCk5vdCB0aGF0IEknbSBwcm9wb3Npbmcgc3VjaCBjaGFuZ2UsIGJ1dCwg
YXMgYSByZWZlcmVuY2UsIEkganVzdCBkaXNjb3ZlcmVkIAp0b2RheSB0aGF0IHRoZXJlJ3MgYSB3
YXkgdG8gbWFrZSBpdCBldmVuIGxpZ2h0ZXIgdGhhbiBpdCBpcyB3aGlsZSBzdGlsbApzaG93aW5n
IGl0IGFzIGEgdGFibGU6Cgo9PT09PT09PT09PT09PT09PSAgPT09PT09PT0gPT0gICA9PT09PT09
PT09PT09PT09ICA9PT09PSA9PSAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KICAgIFN0YXJ0IGFkZHIgICAgICAgIE9mZnNldCAgICAg
ICAgRW5kIGFkZHIgICAgICAgICBTaXplICAgIFZNIGFyZWEgZGVzY3JpcHRpb24KLS0tLS0tLS0t
LS0tLS0tLS0gIC0tLS0tLS0tLS0tICAgLS0tLS0tLS0tLS0tLS0tLSAgLS0tLS0tLS0gIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAw
MDAwMDAwMDAwMDAwMDAwICAgICAgMCAgICAgICAgIDAwMDA3ZmZmZmZmZmZmZmYgICAgMTI4IFRC
ICAgdXNlci1zcGFjZSB2aXJ0dWFsIG1lbW9yeSwgZGlmZmVyZW50IHBlciBtbQoKIDAwMDA4MDAw
MDAwMDAwMDAgICArMTI4ICAgIFRCICAgZmZmZjdmZmZmZmZmZmZmZiAgIH4xNk0gVEIgICAuLi4g
aHVnZSwgYWxtb3N0IDY0IGJpdHMgd2lkZSBob2xlIG9mIG5vbi1jYW5vbmljYWwKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dmlydHVhbCBtZW1vcnkgYWRkcmVzc2VzIHVwIHRvIHRoZSAtMTI4IFRCCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXJ0
aW5nIG9mZnNldCBvZiBrZXJuZWwgbWFwcGluZ3MuCgotLS0tLS0tLS0tLS0tLS0tLSAgLS0tLS0t
LS0gLS0gICAtLS0tLS0tLS0tLS0tLS0tICAtLS0tLSAtLSAgLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEtlcm5lbC1zcGFjZSB2
aXJ0dWFsIG1lbW9yeSwgc2hhcmVkIGJldHdlZW4gYWxsIHByb2Nlc3NlczoKLS0tLS0tLS0tLS0t
LS0tLS0gIC0tLS0tLS0tLS0tICAgLS0tLS0tLS0tLS0tLS0tLSAgLS0tLS0tLS0gIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgogZmZm
ZjgwMDAwMDAwMDAwMCAgIC0xMjggICAgVEIgICBmZmZmODdmZmZmZmZmZmZmICAgICAgOCBUQiAg
IC4uLiBndWFyZCBob2xlLCBhbHNvIHJlc2VydmVkIGZvciBoeXBlcnZpc29yCiBmZmZmODgwMDAw
MDAwMDAwICAgLTEyMCAgICBUQiAgIGZmZmY4ODdmZmZmZmZmZmYgICAgMC41IFRCICAgTERUIHJl
bWFwIGZvciBQVEkKIGZmZmY4ODgwMDAwMDAwMDAgICAtMTE5LjUgIFRCICAgZmZmZmM4N2ZmZmZm
ZmZmZiAgICAgNjQgVEIgICBkaXJlY3QgbWFwcGluZyBvZiBhbGwgcGh5c2ljYWwgbWVtb3J5IChw
YWdlX29mZnNldF9iYXNlKQogZmZmZmM4ODAwMDAwMDAwMCAgICAtNTUuNSAgVEIgICBmZmZmYzhm
ZmZmZmZmZmZmICAgIDAuNSBUQiAgIC4uLiB1bnVzZWQgaG9sZQogZmZmZmM5MDAwMDAwMDAwMCAg
ICAtNTUgICAgVEIgICBmZmZmZThmZmZmZmZmZmZmICAgICAzMiBUQiAgIHZtYWxsb2MvaW9yZW1h
cCBzcGFjZSAodm1hbGxvY19iYXNlKQogZmZmZmU5MDAwMDAwMDAwMCAgICAtMjMgICAgVEIgICBm
ZmZmZTlmZmZmZmZmZmZmICAgICAgMSBUQiAgIC4uLiB1bnVzZWQgaG9sZQogZmZmZmVhMDAwMDAw
MDAwMCAgICAtMjIgICAgVEIgICBmZmZmZWFmZmZmZmZmZmZmICAgICAgMSBUQiAgIHZpcnR1YWwg
bWVtb3J5IG1hcCAodm1lbW1hcF9iYXNlKQogZmZmZmViMDAwMDAwMDAwMCAgICAtMjEgICAgVEIg
ICBmZmZmZWJmZmZmZmZmZmZmICAgICAgMSBUQiAgIC4uLiB1bnVzZWQgaG9sZQogZmZmZmVjMDAw
MDAwMDAwMCAgICAtMjAgICAgVEIgICBmZmZmZmJmZmZmZmZmZmZmICAgICAxNiBUQiAgIEtBU0FO
IHNoYWRvdyBtZW1vcnkKLS0tLS0tLS0tLS0tLS0tLS0gIC0tLS0tLS0tIC0tICAgLS0tLS0tLS0t
LS0tLS0tLSAgLS0tLS0gLS0gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBJZGVudGljYWwgbGF5b3V0IHRvIHRoZSA1Ni1iaXQg
b25lIGZyb20gaGVyZSBvbjoKLS0tLS0tLS0tLS0tLS0tLS0gIC0tLS0tLS0tLS0tICAgLS0tLS0t
LS0tLS0tLS0tLSAgLS0tLS0tLS0gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgogZmZmZmZjMDAwMDAwMDAwMCAgICAgLTQgICAgVEIg
ICBmZmZmZmRmZmZmZmZmZmZmICAgICAgMiBUQiAgIC4uLiB1bnVzZWQgaG9sZQogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZhZGRy
X2VuZCBmb3IgS0FTTFIKIGZmZmZmZTAwMDAwMDAwMDAgICAgIC0yICAgIFRCICAgZmZmZmZlN2Zm
ZmZmZmZmZiAgICAwLjUgVEIgICBjcHVfZW50cnlfYXJlYSBtYXBwaW5nCiBmZmZmZmU4MDAwMDAw
MDAwICAgICAtMS41ICBUQiAgIGZmZmZmZWZmZmZmZmZmZmYgICAgMC41IFRCICAgLi4uIHVudXNl
ZCBob2xlCiBmZmZmZmYwMDAwMDAwMDAwICAgICAtMSAgICBUQiAgIGZmZmZmZjdmZmZmZmZmZmYg
ICAgMC41IFRCICAgJWVzcCBmaXh1cCBzdGFja3MKIGZmZmZmZjgwMDAwMDAwMDAgICAtNTEyICAg
IEdCICAgZmZmZmZmZWVmZmZmZmZmZiAgICA0NDQgR0IgICAuLi4gdW51c2VkIGhvbGUKIGZmZmZm
ZmVmMDAwMDAwMDAgICAgLTY4ICAgIEdCICAgZmZmZmZmZmVmZmZmZmZmZiAgICAgNjQgR0IgICBF
RkkgcmVnaW9uIG1hcHBpbmcgc3BhY2UKIGZmZmZmZmZmMDAwMDAwMDAgICAgIC00ICAgIEdCICAg
ZmZmZmZmZmY3ZmZmZmZmZiAgICAgIDIgR0IgICAuLi4gdW51c2VkIGhvbGUKIGZmZmZmZmZmODAw
MDAwMDAgICAgIC0yICAgIEdCICAgZmZmZmZmZmY5ZmZmZmZmZiAgICA1MTIgTUIgICBrZXJuZWwg
dGV4dCBtYXBwaW5nLCBtYXBwZWQgdG8gcGh5c2ljYWwgYWRkcmVzcyAwCiBmZmZmZmZmZjgwMDAw
MDAwICAtMjA0OCAgICBNQgogZmZmZmZmZmZhMDAwMDAwMCAgLTE1MzYgICAgTUIgICBmZmZmZmZm
ZmZlZmZmZmZmICAgMTUyMCBNQiAgIG1vZHVsZSBtYXBwaW5nIHNwYWNlCiBmZmZmZmZmZmZmMDAw
MDAwICAgIC0xNiAgICBNQgogICAgRklYQUREUl9TVEFSVCAgIH4tMTEgICAgTUIgICBmZmZmZmZm
ZmZmNWZmZmZmICAgfjAuNSBNQiAgIGtlcm5lbC1pbnRlcm5hbCBmaXhtYXAgcmFuZ2UsIHZhcmlh
YmxlIHNpemUgYW5kIG9mZnNldAogZmZmZmZmZmZmZjYwMDAwMCAgICAtMTAgICAgTUIgICBmZmZm
ZmZmZmZmNjAwZmZmICAgICAgNCBrQiAgIGxlZ2FjeSB2c3lzY2FsbCBBQkkKIGZmZmZmZmZmZmZl
MDAwMDAgICAgIC0yICAgIE1CICAgZmZmZmZmZmZmZmZmZmZmZiAgICAgIDIgTUIgICAuLi4gdW51
c2VkIGhvbGUKPT09PT09PT09PT09PT09PT0gID09PT09PT09ID09ICAgPT09PT09PT09PT09PT09
PSAgPT09PT0gPT0gID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09CgpJZiBvbmUgd2FudHMgdGhlIHRhYmxlIGhlYWRlcnMgYXMgc3VjaCwg
YW4gZXh0cmEgbGluZSBpcyByZXF1aXJlZDoKCgo9PT09PT09PT09PT09PT09PSAgPT09PT09PT0g
PT0gICA9PT09PT09PT09PT09PT09ICA9PT09PSA9PSAgPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KICAgIFN0YXJ0IGFkZHIgICAgICAg
IE9mZnNldCAgICAgICAgRW5kIGFkZHIgICAgICAgICBTaXplICAgIFZNIGFyZWEgZGVzY3JpcHRp
b24KLS0tLS0tLS0tLS0tLS0tLS0gIC0tLS0tLS0tLS0tICAgLS0tLS0tLS0tLS0tLS0tLSAgLS0t
LS0tLS0gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj09PT09PT09PT09PT09PT09ICA9PT09PT09PSA9PSAgID09PT09PT09PT09PT09
PT0gID09PT09ID09ICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQoKPHNuaXAvPgoKPT09PT09PT09PT09PT09PT0gID09PT09PT09ID09
ICAgPT09PT09PT09PT09PT09PSAgPT09PT0gPT0gID09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgoKVGhlIG91dHB1dCB1c2luZyB0aGlz
IGFwcHJvYWNoIGFuZCBhIG1hcmt1cCB0byB1c2UgbW9uby1zcGFjZWQgY2VsbHMKZS4gZy4gZWl0
aGVyIHVzaW5nIC4ucmF3IG9yIHVzaW5nIC4uIGNzc2NsYXNzIGFzIGNvbW1lbnRlZCBiZWZvcmUg
aW4KdGhpcyB0aHJlYWQgaXMgYXQ6CgoJaHR0cHM6Ly93d3cuaW5mcmFkZWFkLm9yZy9+bWNoZWhh
Yi9yc3RfY29udmVyc2lvbi94ODYveDg2XzY0L21tX2FsdGVybmF0aXZlLmh0bWwKCkp1c3QgY29u
dmVydGVkIHRoZSBmaXJzdCB0YWJsZSwga2VlcGluZyB0aGUgb3RoZXIgYXMgYSBsaXRlcmFsIGJs
b2NrLgoKVGhhbmtzLApNYXVybwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
