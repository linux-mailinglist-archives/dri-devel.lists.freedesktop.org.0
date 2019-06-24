Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9471524B8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366ED6E043;
	Tue, 25 Jun 2019 07:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6486F89D7D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 18:45:14 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAgw4vuNw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
 with ESMTPSA id V09459v5OIj0Rvj
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Mon, 24 Jun 2019 20:45:00 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v3 0/5] drm/panel-simple: Add panel parameters for
 ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <cover.1559905870.git.hns@goldelico.com>
Date: Mon, 24 Jun 2019 20:44:59 +0200
Message-Id: <0842FF88-D8E0-441B-837B-769C2EF6C1CB@goldelico.com>
References: <cover.1559905870.git.hns@goldelico.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
 imirkin@alum.mit.edu, marek.belisko@gmail.com,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1561401913; 
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=s0LbhSknlCM5hc8ANHokTmG0D8Dtvf0T0SdiBQitSTY=;
 b=DPCjcL/iokGJeyWKsDRXf1mrWNZVRm+LP5mn/wr46r8zPh9QxAaFaAAZvSeWtV1vGf
 nUor9aj5kRVx3HeWfKGK5Clzu6lnlAtOhy8mLByX8zuxP1iyIQDLBKchXTb13YQ/+wkU
 VmfxW/xYAWHDXsaq9VncdA0EbQbxyDnicL3mQlRcjUasGKdb2svD7h8hTN4ZcGo4iVB6
 baWjAB2LBOF9BR6GidOSxoYN18wFKUKhMq1B4zgxlf5os2COnwA0yuipebSffTdWkcrW
 L5UyGtS8XPThwDM0lIg2gMlacQdfaAwk7wo8WKFxc9k7ago+/g5gZb4M0/BtrpjgIbRr
 tAJg==
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
Cc: devicetree@vger.kernel.org, letux-kernel@openphoenux.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgo+IEFtIDA3LjA2LjIwMTkgdW0gMTM6MTEgc2NocmllYiBILiBOaWtvbGF1cyBTY2hhbGxl
ciA8aG5zQGdvbGRlbGljby5jb20+Ogo+IAo+IFYzOgo+ICogYWRkIGJpbmRpbmdzIGRvY3VtZW50
YXRpb24gKHN1Z2dlc3RlZCBieSBzYW1AcmF2bmJvcmcub3JnKQo+IAo+IFYyIDIwMTktMDYtMDUg
MDc6MDc6MDU6Cj4gKiBmaXggdHlwbyBpbiA5OWR0YyBwYW5lbCBjb21wYXRpYmxlIHN0cmluZyAo
cmVwb3J0ZWQgYnkgaW1pcmtpbkBhbHVtLm1pdC5lZHUpCj4gCj4gVjEgMjAxOS0wNi0wNCAxNDo1
MzowMDoKPiAKPiBTaW5jZSB2NS4yLXJjMSBPTUFQIGlzIG5vIGxvbmdlciB1c2luZyBhIHNwZWNp
YWwgZGlzcGxheSBkcml2ZXIgYXJjaGl0ZWN0dXJlCj4gZm9yIERQSSBwYW5lbHMsIGJ1dCB1c2Vz
IHRoZSBnZW5lcmFsIGRybS9wYW5lbC9wYW5lbC1zaW1wbGUuCj4gCj4gU28gd2UgZmluYWxseSBj
YW4gYWRkIFNvQyBpbmRlcGVuZGVudCBwYW5lbCBkZWZpbml0aW9ucyBmb3IgdHdvIHBhbmVsIG1v
ZGVscwo+IHdoaWNoIHdlIGFscmVhZHkgaGFkIHdvcmtlZCBvbiBxdWl0ZSBhIHdoaWxlIGFnbyAo
YmVmb3JlIGRldmljZSB0cmVlIHdhcwo+IGludHJvZHVjZWQpOgo+IAo+IAlodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3BhdGNoLzI4NTEyOTUvCj4gCj4gCj4gCj4gSC4gTmlrb2xhdXMgU2No
YWxsZXIgKDUpOgo+ICBkcm0vcGFuZWw6IHNpbXBsZTogQWRkIFNoYXJwIExRMDcwWTNERzNCIHBh
bmVsIHN1cHBvcnQKPiAgZHJtL3BhbmVsOiBzaW1wbGU6IEFkZCBPcnR1c3RlY2ggQ09NMzdIM00g
cGFuZWwgc3VwcG9ydAo+ICBkdC1iaW5kaW5nczogZHJtL3BhbmVsOiBzaW1wbGU6IGFkZCBvcnR1
c3RlY2gsY29tMzdoM20wNWR0YyBwYW5lbAo+ICBkdC1iaW5kaW5nczogZHJtL3BhbmVsOiBzaW1w
bGU6IGFkZCBvcnR1c3RlY2gsY29tMzdoM205OWR0YyBwYW5lbAo+ICBkdC1iaW5kaW5nczogZHJt
L3BhbmVsOiBzaW1wbGU6IGFkZCBzaGFycCxscTA3MHkzZGczYiBwYW5lbAo+IAo+IC4uLi9kaXNw
bGF5L3BhbmVsL29ydHVzdGVjaCxjb20zN2gzbTA1ZHRjLnR4dCB8IDEyICsrKysKPiAuLi4vZGlz
cGxheS9wYW5lbC9vcnR1c3RlY2gsY29tMzdoM205OWR0Yy50eHQgfCAxMiArKysrCj4gLi4uL2Rp
c3BsYXkvcGFuZWwvc2hhcnAsbHEwNzB5M2RnM2IudHh0ICAgICAgIHwgMTIgKysrKwo+IGRyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyAgICAgICAgICB8IDYzICsrKysrKysrKysr
KysrKysrKysKPiA0IGZpbGVzIGNoYW5nZWQsIDk5IGluc2VydGlvbnMoKykKPiBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
b3J0dXN0ZWNoLGNvbTM3aDNtMDVkdGMudHh0Cj4gY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL29ydHVzdGVjaCxjb20zN2gz
bTk5ZHRjLnR4dAo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9wYW5lbC9zaGFycCxscTA3MHkzZGczYi50eHQKPiAKPiAtLSAKPiAy
LjE5LjEKPiAKCmFueSBwcm9ncmVzcyB0b3dhcmRzIG1lcmdpbmcgdGhpcyBzb21ld2hlcmU/IEl0
IGRpZCBub3QgeWV0IGFycml2ZSBpbiBsaW51eC1uZXh0LgoKQlRXOiBzaG91bGQgYWxzbyBiZSBh
cHBsaWVkIHRvIDUuMgoKQlIgYW5kIHRoYW5rcywKTmlrb2xhdXMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
