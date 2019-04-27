Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B82B43D
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2019 20:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6C6891D4;
	Sat, 27 Apr 2019 18:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D32891D4;
 Sat, 27 Apr 2019 18:14:22 +0000 (UTC)
Received: from 177.17.250.151.dynamic.adsl.gvt.net.br ([177.17.250.151]
 helo=coco.lan)
 by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKRpd-000420-Hf; Sat, 27 Apr 2019 18:13:49 +0000
Date: Sat, 27 Apr 2019 15:13:37 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 25/79] docs: convert docs to ReST and rename to *.rst
Message-ID: <20190427151337.2fb0ed5f@coco.lan>
In-Reply-To: <20190427172551.GI14916@sirena.org.uk>
References: <cover.1555938375.git.mchehab+samsung@kernel.org>
 <7adf9035ae06ecc6c7e46b51cb677f0a8f61d19a.1555938376.git.mchehab+samsung@kernel.org>
 <20190425180758.GC23183@sirena.org.uk>
 <20190426064609.7f00e013@coco.lan>
 <20190427172551.GI14916@sirena.org.uk>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qGs9gyd+8mbF58d9iNV6zlbIYiLoTBxs09/Lf+hRxz0=; b=AT03D5WhhdhSSqw5qyiTpKUV6a
 3eE4Wdu+1gVtasvrfougGt3ALT56zCvhZOn8KRHD7zUcFq3NeWJljEDtUKx1hHacFligCR1atNkYB
 7lixNeZeySWOMWwi7WjOC45YXLKKDC59/5LNIBW7wyRlyBJp/tCbSfs6pH30pSY5C2ArC+VSUUrZ3
 rv8R1F2vx5kXk1Akz0sAdpy+EXsdmSBFQvse1djp6fjsv1screwgGOVlsuUflM0CYFlWVTm1oiPcq
 uUZukeInFjffVcJMf83lAOtsqJuBv6F5ZEqcQz2+0bRES908WOMXDwi5JKQoivn+ja5POC6NbVNPZ
 7E3O+/Bw==;
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
Cc: Nishanth Menon <nm@ti.com>, linux-wireless@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Harry Wei <harryxiyou@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, Alex Shi <alex.shi@linux.alibaba.com>,
 Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-pci@vger.kernel.org,
 Len Brown <len.brown@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 intel-gfx@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 Borislav Petkov <bp@alien8.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW0gU3VuLCAyOCBBcHIgMjAxOSAwMjoyNTo1MSArMDkwMApNYXJrIEJyb3duIDxicm9vbmllQGtl
cm5lbC5vcmc+IGVzY3JldmV1OgoKPiBPbiBGcmksIEFwciAyNiwgMjAxOSBhdCAwNjo0NjowOUFN
IC0wMzAwLCBNYXVybyBDYXJ2YWxobyBDaGVoYWIgd3JvdGU6Cj4gPiBNYXJrIEJyb3duIDxicm9v
bmllQGtlcm5lbC5vcmc+IGVzY3JldmV1OiAgCj4gCj4gPiA+IFRoaXMgaXMgbWFzc2l2ZWx5IEND
ZWQgY292ZXJpbmcgYSBsYXJnZSByYW5nZSBvZiBzdWJzeXN0ZW1zIGFuZCBpcyBwYXRjaAo+ID4g
PiAyNSBvZiBhIDc5IHBhdGNoIHNlcmllcyBzbyBJJ3ZlIG5vIGNvbnRleHQgZm9yIHdoYXQncyBn
b2luZyBvbiBoZXJlIG9yCj4gPiA+IHdoeS4uLiAgICAKPiAKPiA+IFlvdSBjYW4gc2VlIG1vcmUg
ZGV0YWlscyBhdCBwYXRjaCAwMC83OToKPiA+IAlodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
LzIwMTkwNDIyMTE1MTEwLjI2NDQzYjQ0QGNvY28ubGFuLyAgCj4gCj4gT0ssIGl0IHdvdWxkJ3Zl
IGhlbHBlZCB0byBDQyBwZW9wbGUgb24gdGhhdC4gCgpJIGtub3csIGJ1dCwgZHVlIHRvIGJhZCBl
eHBlcmllbmNlcyBpbiB0aGUgcGFzdCwgSSBoYWQgdG8gYWN0dWFsbHkKcmVtb3ZlIHBlb3BsZSBm
cm9tIGl0LCBiZWNhdXNlIHNldmVyYWwgc2VydmVycyByZWplY3QgZS1tYWlscyB3aXRoIAptb3Jl
IHRoYW4gfjMwIGRlc3RpbmF0aW9uIGFkZHJlc3NlcywgYXMgdGhleSBjb25zaWRlciBpdCB0byBi
ZSBzcGFtLgoKPiBBbnl3YXkKPiAKPiBBY2tlZC1ieTogTWFyayBCcm93biA8YnJvb25pZUBrZXJu
ZWwub3JnPgoKVGhhbmtzIQoKVGhhbmtzLApNYXVybwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
