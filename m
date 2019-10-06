Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E013CD932
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2019 22:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0006E220;
	Sun,  6 Oct 2019 20:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 401 seconds by postgrey-1.36 at gabe;
 Sun, 06 Oct 2019 20:40:55 UTC
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205266E217
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2019 20:40:55 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 2110C3EC;
 Sun,  6 Oct 2019 16:34:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 06 Oct 2019 16:34:13 -0400
X-ME-Sender: <xms:wk-aXeN_yLb80W7gM2wn_PJMPNouOSRQlLYjstQOY-Mn97lujsbvxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheehgdduheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdttddttdervdenucfhrhhomhepjfgvnhhr
 ihhquhgvucguvgcuofhorhgrvghsucfjohhlshgthhhuhhcuoehhmhhhsehhmhhhrdgvnh
 hgrdgsrheqnecukfhppedvtddurdekvddrgeehrddvfeegnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehhmhhhsehhmhhhrdgvnhhgrdgsrhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:wk-aXZGUKg6qynH5oJ4TvGBM5oMH6MRebWq46ZDPEpHpFGW-t3oZLw>
 <xmx:wk-aXRHUkSVMld3VXmDDnbPWpW5wwNgLL3yjxkWFpSJB_ufBARi72g>
 <xmx:wk-aXYAsp9RiCDTVfl25ei7mAZmx1QiUjikdouXhFSgI19j-qB4C8A>
 <xmx:w0-aXcIlO3TIXyeKDXH7Dx4X5hbWwtpfb0RCaoJbCBvEf9ONWW06z1vw6p4>
Received: from khazad-dum.debian.net (unknown [201.82.45.234])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8D971D60057;
 Sun,  6 Oct 2019 16:34:10 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by localhost.khazad-dum.debian.net (Postfix) with ESMTP id 06BA2340015B;
 Sun,  6 Oct 2019 17:34:09 -0300 (-03)
X-Virus-Scanned: Debian amavisd-new at khazad-dum.debian.net
Received: from khazad-dum.debian.net ([127.0.0.1])
 by localhost (khazad-dum2.khazad-dum.debian.net [127.0.0.1]) (amavisd-new,
 port 10024)
 with LMTP id imtwoQQbVsa9; Sun,  6 Oct 2019 17:34:08 -0300 (-03)
Received: by khazad-dum.debian.net (Postfix, from userid 1000)
 id 10243340015A; Sun,  6 Oct 2019 17:34:07 -0300 (-03)
Date: Sun, 6 Oct 2019 17:34:07 -0300
From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: New sysfs interface for privacy screens
Message-ID: <20191006203407.GA14301@khazad-dum.debian.net>
References: <CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com>
 <20191002094650.3fc06a85@lwn.net> <87muei9r7i.fsf@intel.com>
 <20191003102254.dmwl6qimdca3dbrv@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003102254.dmwl6qimdca3dbrv@holly.lan>
X-GPG-Fingerprint1: 4096R/0x0BD9E81139CB4807: C467 A717 507B BAFE D3C1  6092
 0BD9 E811 39CB 4807
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hmh.eng.br; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=ejeoZ3ISdZsRr54JCVMXEDJt/1V
 Fp4bSIyHVCBG50b8=; b=mHHW/VKLracUbzT5k/Yt/2zRfz6PcGuqBRiKbisrLOy
 YtyOjbUfAq/9fJ2ZoRWnMBBouN+CtMbptke0sdVkzxgNfXNK4fXr5NwU2TCml+CD
 Gou69jWnyqS+XBOfvhKRU2kD05KF9oMt+nDyI1osG8dEh87GchKnAKVX0nRiOoKm
 sxjrfniejyMc2Ueh8gmQSGqhPXBOU24qLLkA3s7FyWMEhz2gIefsaJA2lLSTtP2h
 Lpyy3Pe5qQ7U01c4eyi4jLiFlRYVFo4McCUY4tSjsj/YPAtNqs+8U6R4FpaZgMUl
 8oGfzelTrlI0KuATIjokWOXZ+CObcXMQFKvxYUxTpng==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ejeoZ3
 ISdZsRr54JCVMXEDJt/1VFp4bSIyHVCBG50b8=; b=xrKbdHsWlLiTRqHDsYu+te
 DiSiarnwMVNrf6IHi3Up2h6zQhhJhpn8haR3Gq5GO9iil89OWjBzN2aYNXKkxdac
 glWTIOoHbfKXNQc8IEcNgyUt9dCulbHizKaEHIBJ3IFHbsuIRafEDxNeomAWP3bB
 8ZYdDkafQAdN3YG+Ntf76ClDXtqAsErAPn6uUSY0nhUuEklyKT+m2t8iN1MuwWUS
 7M6UElsmFH1H0hgHNJtXQwz8swjBa5uTQzJpXpRz9PKWCc2kwIxboDKiUHaN2kNO
 pgrHPQfJ/XaVwiClqz9eipCUVXN7wPGFU1VadWme6yt19An6NxweIDtNJilO0w3g
 ==
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, rafael@kernel.org,
 gregkh@linuxfoundation.org, Jonathan Corbet <corbet@lwn.net>,
 Ross Zwisler <zwisler@google.com>, linux-kernel@vger.kernel.org,
 Mat King <mathewk@google.com>, dri-devel@lists.freedesktop.org,
 Jingoo Han <jingoohan1@gmail.com>, Rajat Jain <rajatja@google.com>,
 Lee Jones <lee.jones@linaro.org>, Alexander Schremmer <alex@alexanderweb.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAwMyBPY3QgMjAxOSwgRGFuaWVsIFRob21wc29uIHdyb3RlOgo+IEkgZ3Vlc3MuLi4g
YWx0aG91Z2ggdGhlIFRoaW5rcGFkIGNvZGUgaGFzbid0IGFkZGVkIGFueSBzdGFuZGFyZAo+IGlu
dGVyZmFjZXMgKG5vIG90aGVyIGxhcHRvcCBzaG91bGQgYmUgcGxhY2luZyBjb250cm9scyBmb3Ig
YSBwcml2YWN5Cj4gc2NyZWVuIGluIC9wcm9jL2FjcGkvaWJtLy4uLiApLiBNYXliZSBpdHMgbm90
IHRvbyBsYXRlLgoKQXMgZmFyIGFzIEkgYW0gY29uY2VybmVkLCBpdCBpcyAqbm90KiB0b28gbGF0
ZS4gIEFuZCB5b3UgY2FuIGFsd2F5cyBoYXZlCmEgZHJpdmVyLXByaXZhdGUgd2F5IG9mIG1lc3Np
bmcgd2l0aCBzb21ldGhpbmcsIGFuZCBhIG1vcmUgZ2VuZXJpYyB3YXkKb2YgZG9pbmcgdGhlIHNh
bWUgdGhpbmcuCgp0aGlua3BhZC1hY3BpIHdpbGwgYWx3YXlzIHdlbGNvbWUgcGF0Y2hlcyBzd2l0
Y2hpbmcgdG8gdGhlIG5ldyBnZW5lcmljCndheSAoYXMgbG9uZyBhcyB3ZSBjYW4gaGF2ZSBhIGRl
cHJlY2F0aW9uIHBlcmlvZCAqZm9yIGxvbmctdGltZS11c2VkCmZhY2lsaXRpZXMqIC0tIHdoaWNo
IGlzIG5vdCB0aGUgY2FzZSBvZiB0aGUgcHJpdmFjeSBzY3JlZW4sIG5vCmRlcHJlY2F0aW9uIHBl
cmlvZCBuZWVkIHRoZXJlKS4KClRoZSBwcml2YWN5IHRoaW5nIGlzIHRvbyBuZXcsIGZlZWwgZnJl
ZSB0byBkZXNpZ24gYSBnZW5lcmljIG9uZSBhbmQKc2VuZCBpbiBhIHBhdGNoICpzd2l0Y2hpbmcq
IHRoaW5rcGFkLWFjcGkgdG8gdGhlIG5ldyBnZW5lcmljIG9uZS4KCkkgd291bGQgQUNLIHRoYXQu
ICBJZiB0aGUgc3Vic3lzdGVtIG1haW50YWluZXIgYWxzbyBhZ3JlZXMsIChhbmQgbm9ib2R5Cipz
ZXJpb3VzbHkqIGNvbXBsYWluIGFib3V0IGl0IGZyb20gdXNlcnNwYWNlKSwgdGhlIHByaXZhdGUg
aW50ZXJmYWNlCndvdWxkIGJlIGdvbmUganVzdCBsaWtlIHRoYXQuCgotLSAKICBIZW5yaXF1ZSBI
b2xzY2h1aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
