Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CBB46A32
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F29589483;
	Fri, 14 Jun 2019 20:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA858938F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:30 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id EE29C740;
 Fri, 14 Jun 2019 20:36:28 +0000 (UTC)
Date: Fri, 14 Jun 2019 14:36:27 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v4 14/28] docs: locking: convert docs to ReST and rename
 to *.rst
Message-ID: <20190614143627.173f5005@lwn.net>
In-Reply-To: <791f74dab9607d3d349b1e7fe5d0ab5abbb24081.1560361364.git.mchehab+samsung@kernel.org>
References: <cover.1560361364.git.mchehab+samsung@kernel.org>
 <791f74dab9607d3d349b1e7fe5d0ab5abbb24081.1560361364.git.mchehab+samsung@kernel.org>
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, David Airlie <airlied@linux.ie>,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Ingo Molnar <mingo@redhat.com>,
 Federico Vaga <federico.vaga@vaga.pv.it>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxMiBKdW4gMjAxOSAxNDo1Mjo1MCAtMDMwMApNYXVybyBDYXJ2YWxobyBDaGVoYWIg
PG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPiB3cm90ZToKCj4gQ29udmVydCB0aGUgbG9ja2lu
ZyBkb2N1bWVudHMgdG8gUmVTVCBhbmQgYWRkIHRoZW0gdG8gdGhlCj4ga2VybmVsIGRldmVsb3Bt
ZW50IGJvb2sgd2hlcmUgaXQgYmVsb25ncy4KPiAKPiBNb3N0IG9mIHRoZSBzdHVmZiBoZXJlIGlz
IGp1c3QgdG8gbWFrZSBTcGhpbnggdG8gcHJvcGVybHkKPiBwYXJzZSB0aGUgdGV4dCBmaWxlLCBh
cyB0aGV5J3JlIGFscmVhZHkgaW4gZ29vZCBzaGFwZSwKPiBub3QgcmVxdWlyaW5nIG1hc3NpdmUg
Y2hhbmdlcyBpbiBvcmRlciB0byBiZSBwYXJzZWQuCj4gCj4gVGhlIGNvbnZlcnNpb24gaXMgYWN0
dWFsbHk6Cj4gICAtIGFkZCBibGFuayBsaW5lcyBhbmQgaWRlbnRhdGlvbiBpbiBvcmRlciB0byBp
ZGVudGlmeSBwYXJhZ3JhcGhzOwo+ICAgLSBmaXggdGFibGVzIG1hcmt1cHM7Cj4gICAtIGFkZCBz
b21lIGxpc3RzIG1hcmt1cHM7Cj4gICAtIG1hcmsgbGl0ZXJhbCBibG9ja3M7Cj4gICAtIGFkanVz
dCB0aXRsZSBtYXJrdXBzLgo+IAo+IEF0IGl0cyBuZXcgaW5kZXgucnN0LCBsZXQncyBhZGQgYSA6
b3JwaGFuOiB3aGlsZSB0aGlzIGlzIG5vdCBsaW5rZWQgdG8KPiB0aGUgbWFpbiBpbmRleC5yc3Qg
ZmlsZSwgaW4gb3JkZXIgdG8gYXZvaWQgYnVpbGQgd2FybmluZ3MuCj4gCj4gU2lnbmVkLW9mZi1i
eTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK3NhbXN1bmdAa2VybmVsLm9yZz4KPiBB
Y2tlZC1ieTogRmVkZXJpY28gVmFnYSA8ZmVkZXJpY28udmFnYUB2YWdhLnB2Lml0PgoKVGhpcyBw
YXRjaCBjb250YWlucyBsaW51eC1uZXh0IGNoYW5nZXMgYW5kIGRvZXNuJ3QgYXBwbHkgdG8gZG9j
cy1uZXh0LgpQZXJoYXBzIHRoZSBiZXN0IHRoaW5nIHRvIGRvIGlzIHRvIGFwcGx5IGl0IHRvIHRo
ZSBsb2NraW5nIHRyZWU/CgpUaGFua3MsCgpqb24KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
