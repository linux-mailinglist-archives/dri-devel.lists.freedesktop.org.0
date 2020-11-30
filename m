Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB58E2C9958
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599756E4F1;
	Tue,  1 Dec 2020 08:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE36C89FCE
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 19:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1606764388;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=wuyWxZXlgDq4DzOPbD2rhxj59j06ksQkkvhjKAfj4zk=;
 b=OjBi9GzbOwk6sh9o8K0RFIFBWkANpPA9WABZMFnsYVHY+qlz/wSFjMC8UMP9msz090
 +9WxmXPHBVRBTC2gmj7FnRykU5FoRW/0M4r9lbQ8uTVBEn9uYRKZ5mwAxY5VdK52JglD
 W1ArfzGWUnWrH1uQtQvO9JWviLzxvBUtB+gmIZJqZ3t41pLkG8EuKYrpGOLydcn8mdAO
 n9NfV+2zh+O/D8G5fir6xb+OybVR6oiOBuZhtnTCg7kWcGOvbpZynMHcIHQ/78M7+1Ps
 gkmucNqcIPBjNcC22mwf8NryFH7ECkpcwVW2+ynxqyi0H/1SEe7hRiArTOaV+RrASqJg
 Hl2Q==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/vgwDCqtd0="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
 with ESMTPSA id N02faawAUJNCQni
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 30 Nov 2020 20:23:12 +0100 (CET)
Subject: Re: [REGRESSION] omapdrm/N900 display broken
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <23e27b7a-d2b9-a0c0-7518-bb5105306a97@gmail.com>
Date: Mon, 30 Nov 2020 20:23:11 +0100
Message-Id: <96523285-8FD9-47F1-A669-803643C7242C@goldelico.com>
References: <20200728181412.GA49617@darkstar.musicnaut.iki.fi>
 <660b2fe1-343d-b83e-11d2-5a5eb530b83f@ti.com>
 <448c1441-2cac-44ef-95ef-bb28b512297b@ti.com>
 <20200823162625.GC4313@darkstar.musicnaut.iki.fi>
 <ac42f7f9-2ac2-246e-69c1-3d56cea7e59b@ti.com>
 <5072a25d-e885-cdd2-978d-70942406c272@gmail.com>
 <09044fd2-2926-c7b3-826b-52b742e84ff5@ti.com>
 <79ad8816-815c-14d3-ebe1-3c5007c81dd1@gmail.com>
 <1fe9fed7-f619-eb6a-6e31-b9eadbf09bad@ti.com>
 <8010e452-745a-ac12-bc02-5537305c70ed@gmail.com>
 <4948a40d-c887-5617-f5bc-1e0aff824ad7@gmail.com>
 <a86e0ef4-0b90-5aec-9632-e78fa4ca6d58@ti.com>
 <23e27b7a-d2b9-a0c0-7518-bb5105306a97@gmail.com>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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
Cc: Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 kernel list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sebastian Reichel <sre@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSXZheWxvLAoKPiBBbSAyNy4xMS4yMDIwIHVtIDE5OjQ0IHNjaHJpZWIgSXZheWxvIERpbWl0
cm92IDxpdm8uZy5kaW1pdHJvdi43NUBnbWFpbC5jb20+Ogo+IAo+IEhpLAo+IAo+IE9uIDI3LjEx
LjIwINCzLiAxOTozMCDRhy4sIFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+PiBPbiAyNy8xMS8yMDIw
IDE3OjM3LCBJdmF5bG8gRGltaXRyb3Ygd3JvdGU6Cj4+PiBXaXRoIDUuOS4xMSBhbmQgdGhlIHBh
dGNoIG9uIHRvcCwgbjkwMCBib290cyBmaW5lLCBhbGJlaXQgZGlzcGxheSByZW1haW5zIGJsYW5r
LCBjb3VsZCBiZSByZWxhdGVkIHRvCj4+PiBicmlnaHRuZXNzLCB3ZSdyZSBzdGlsbCBpbnZlc3Rp
Z2F0aW5nLgo+PiBPay4gQSBEU1MgcmVnZHVtcCBmb3IgYSB3b3JraW5nIHZlcnNpb24gYW5kIHRo
ZSBsYXRlc3Qgb25lIHdvdWxkIGJlIGdvb2QgdG9vLiBUaGVyZSdzIGEgb21hcGRzcwo+PiBkZWJ1
Z2ZzIGRpciwgd2l0aCBkc3MsIGRpc3BjIGFuZCBjbGsgZmlsZXMgd2hpY2ggYXJlIG9mIGludGVy
ZXN0IGhlcmUuCj4gCj4gSXQgdHVybmVkIG91dCB0byBiZSBhIGxvbmcgc3RhbmRpbmcgYnVnIGlu
IHRoZSBwYW5lbCBkcml2ZXIsIHdpdGggdGhlIGJlbGxvdyBmaXggaXQgd29ya3MgZmluZToKPiAK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNvbnktYWN4NTY1
YWttLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc29ueS1hY3g1NjVha20uYwo+IGlu
ZGV4IGZjNmE3ZTQ1MWFiZS4uMzA0MjY3Zjc4NDlhCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLXNvbnktYWN4NTY1YWttLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtc29ueS1hY3g1NjVha20uYwo+IEBAIC02MjksNyArNjI5LDcgQEAgc3RhdGljIGludCBh
Y3g1NjVha21fcHJvYmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkKPiAgICAgICAgbGNkLT5zcGkg
PSBzcGk7Cj4gICAgICAgIG11dGV4X2luaXQoJmxjZC0+bXV0ZXgpOwo+IAo+IC0gICAgICAgbGNk
LT5yZXNldF9ncGlvID0gZGV2bV9ncGlvZF9nZXQoJnNwaS0+ZGV2LCAicmVzZXQiLCBHUElPRF9P
VVRfTE9XKTsKPiArICAgICAgIGxjZC0+cmVzZXRfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0KCZzcGkt
PmRldiwgInJlc2V0IiwgR1BJT0RfT1VUX0hJR0gpOwo+ICAgICAgICBpZiAoSVNfRVJSKGxjZC0+
cmVzZXRfZ3BpbykpIHsKPiAgICAgICAgICAgICAgICBkZXZfZXJyKCZzcGktPmRldiwgImZhaWxl
ZCB0byBnZXQgcmVzZXQgR1BJT1xuIik7Cj4gICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIo
bGNkLT5yZXNldF9ncGlvKTsKPiAKPiBQcm9wZXIgcGF0Y2ggd2lsbCBmb2xsb3cuCgpJIGp1c3Qg
Zm91bmQgYW5vdGhlciBpc3N1ZSB3aGljaCBzZWVtcyB0byBoaXQgYSBoYW5kZnVsIG9mIFNQSSBi
YXNlZCBwYW5lbCBkcml2ZXJzLApmb3IgZXhhbXBsZSB0aGUgcGFuZWwtdHBvLXRkMDI4dHRlYzEu
CgpJdCBpcyBjb21taXQKCjc2NmM2YjYzYWEwNCAoInNwaTogZml4IGNsaWVudCBkcml2ZXIgYnJl
YWthZ2VzIHdoZW4gdXNpbmcgR1BJTyBkZXNjcmlwdG9ycyIpCgp3aGljaCBicmVha3Mgb3VyIERN
MzczMCBiYXNlZCBHVEEwNCBwYW5lbCBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRk
MDI4dHRlYzEuYy4KSXQgbWF5IGFsc28gYWZmZWN0IG90aGVyIFNQSSBiYXNlZCBkcml2ZXJzIGlm
IHRoZXkgYXJlIG9wZXJhdGVkIHRob3VnaCBzcGktZ3BpbyAoSSB3b3VsZApoYXZlIHRvIGxvb2sg
dXAgdGhlIE45MDAgaGFyZHdhcmUgc2V0dXApLgoKQlIsCk5pa29sYXVzCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
