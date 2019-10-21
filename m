Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F61DFE41
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 09:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B656E3FE;
	Tue, 22 Oct 2019 07:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1836 seconds by postgrey-1.36 at gabe;
 Mon, 21 Oct 2019 23:11:50 UTC
Received: from pulsar.hadrons.org (2.152.178.181.dyn.user.ono.com
 [2.152.178.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A14A6E2D6;
 Mon, 21 Oct 2019 23:11:49 +0000 (UTC)
Received: from guillem by pulsar.hadrons.org with local (Exim 4.92)
 (envelope-from <guillem@hadrons.org>)
 id 1iMgP5-0004ci-4m; Tue, 22 Oct 2019 00:43:55 +0200
Date: Tue, 22 Oct 2019 00:40:57 +0200
From: Guillem Jover <guillem@hadrons.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the vfs-fixes tree
Message-ID: <20191021224057.GA6880@thunder.hadrons.org>
Mail-Followup-To: Guillem Jover <guillem@hadrons.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Al Viro <viro@ZenIV.linux.org.uk>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022093512.4317a715@canb.auug.org.au>
 <20191022074426.2c0a2485@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 22 Oct 2019 07:27:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=hadrons.org
 ; s=201908; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:From:Reply-To:Subject:Content-Transfer-Encoding:Content-ID:
 Content-Description:References:X-Debbugs-Cc;
 bh=lcZ+YMK9Whi3z5tx7xSI8b6zl56GrrzI4ArlbeylLpQ=; b=Z7Y5hGMHdidz4k/M88HQxnRP8X
 M1p/0nnLKKgjZgcK8WtKsxct9/D22d3I1D/xnLjiv/zjDdOEwRSGaBDeLShPruvPtj48jgU0TtHsg
 xHVoeRZg6qdzTtLGR2c9twppv/19Fcpax+wnNBQlEskJWBnXO6OqFHw+6O9e9Zh2oP87C9Xqx4pqe
 P4612ObycNaGWYeokAELYxC9KxWSu/2PcfaPI8OFlsrkiQglI5TQ6AixKXi6z0/oYw9kbptltD9nl
 +o/foFD8bugCUjyR05p/aXHpO+naPMztzCg2vDPhv9Oeh3OUla57u5yRCrZFDP1T+nSfNAc5mcEzv
 EwhVJjfQ==;
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Al Viro <viro@ZenIV.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgpPbiBUdWUsIDIwMTktMTAtMjIgYXQgMDc6NDQ6MjYgKzExMDAsIFN0ZXBoZW4gUm90aHdl
bGwgd3JvdGU6Cj4gRml4ZXMgdGFnCj4gCj4gICBGaXhlczogN2EwNzRlOTYgKCJhaW86IGltcGxl
bWVudCBpb19wZ2V0ZXZlbnRzIikKPiAKPiBoYXMgdGhlc2UgcHJvYmxlbShzKToKPiAKPiAgIC0g
U0hBMSBzaG91bGQgYmUgYXQgbGVhc3QgMTIgZGlnaXRzIGxvbmcKPiAgICAgQ2FuIGJlIGZpeGVk
IGJ5IHNldHRpbmcgY29yZS5hYmJyZXYgdG8gMTIgKG9yIG1vcmUpIG9yIChmb3IgZ2l0IHYyLjEx
Cj4gICAgIG9yIGxhdGVyKSBqdXN0IG1ha2luZyBzdXJlIGl0IGlzIG5vdCBzZXQgKG9yIHNldCB0
byAiYXV0byIpLgoKT24gVHVlLCAyMDE5LTEwLTIyIGF0IDA5OjM1OjEyICsxMTAwLCBTdGVwaGVu
IFJvdGh3ZWxsIHdyb3RlOgo+IE9uIFR1ZSwgMjIgT2N0IDIwMTkgMDg6MDc6MzQgKzExMDAgU3Rl
cGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+IHdyb3RlOgo+ID4gZnMvYWlvLmM6
MjE5NjozODogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICdOVUxMJwo+ID4gIDIxOTYgfCAg
c3RydWN0IF9fY29tcGF0X2Fpb19zaWdzZXQga3NpZyA9IHsgTlVMTCwgfTsKPiA+ICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn4KCj4gPiBmcy9haW8uYzoy
MTk2OjM4OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gJ05VTEwnCj4gPiAgMjE5NiB8ICBz
dHJ1Y3QgX19jb21wYXRfYWlvX3NpZ3NldCBrc2lnID0geyBOVUxMLCB9Owo+ID4gICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fgoKPiA+IGZzL2Fpby5jOjIy
MzE6Mzg6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyAnTlVMTCcKPiA+ICAyMjMxIHwgIHN0
cnVjdCBfX2NvbXBhdF9haW9fc2lnc2V0IGtzaWcgPSB7IE5VTEwsIH07Cj4gPiAgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+Cgo+ID4gZnMvYWlvLmM6MjIz
MTozODogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICdOVUxMJwo+ID4gIDIyMzEgfCAgc3Ry
dWN0IF9fY29tcGF0X2Fpb19zaWdzZXQga3NpZyA9IHsgTlVMTCwgfTsKPiA+ICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn4KPiA+IAo+ID4gSW50cm9kdWNl
ZCBieSBjb21taXQKPiA+IAo+ID4gICBkZTgwMTY2YTU3M2QgKCJhaW86IEZpeCBpb19wZ2V0ZXZl
bnRzKCkgc3RydWN0IF9fY29tcGF0X2Fpb19zaWdzZXQgbGF5b3V0IikKClVnaCwgc29ycnkgYWJv
dXQgdGhhdCwgSSBndWVzcyBJIGRpZG4ndCBzZWUgdGhlIHdhcm5pbmdzIGluIHRoZSBzY3JvbGwK
YmFjayB3aGVuIEkgYnVpbHQgdGhpcyBiYWNrIHRoZW4gZm9yIHRlc3RpbmcuIDovIFNlbmRpbmcg
YSBuZXcgdmVyc2lvbgpmaXhpbmcgYm90aCBpc3N1ZXMuCgpUaGFua3MsCkd1aWxsZW0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
