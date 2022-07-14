Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD04574635
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 09:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7127D93A10;
	Thu, 14 Jul 2022 07:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m1524.mail.126.com (m1524.mail.126.com [220.181.15.24])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7CE1E93A10
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 07:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=9GCiJ
 KLq0xmBC3eQPvccV913YhLoSk13xrBhmRni0O4=; b=FkkS/oTbZ+uRU125YhcqO
 o/zR66vbwxEZEYEwThAcONSLHMl4crdFZjwRH4B8FGIjBOVQ85I2WeSGvGvfLovK
 K1uUuaPT+FJ0nTNu76paR18ZwR9hWxT2yvmUjGv/vE8NOZm3lvPeGaGZyeo448t4
 HRDW3ISn0svsCv+cXJykyg=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr24
 (Coremail) ; Thu, 14 Jul 2022 15:53:35 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Thu, 14 Jul 2022 15:53:35 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>
Subject: Re:Re: [PATCH] drm/imx/dcss: Add missing of_node_put() in fail path
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <20220714073741.raufdst77ezkyw2u@fsr-ub1664-121.ea.freescale.net>
References: <20220707023214.307451-1-windhl@126.com>
 <20220714073741.raufdst77ezkyw2u@fsr-ub1664-121.ea.freescale.net>
Content-Type: multipart/alternative; 
 boundary="----=_Part_73274_1372756763.1657785215985"
MIME-Version: 1.0
Message-ID: <4969c4df.4de3.181fbb2ebf2.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GMqowABHViaBy89iNjRIAA--.41000W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGhI+F1-HZfxhcAABsw
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
Cc: airlied@linux.ie, shawnguo@kernel.org, s.hauer@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

------=_Part_73274_1372756763.1657785215985
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

CgoKCkF0IDIwMjItMDctMTQgMTU6Mzc6NDEsICJMYXVyZW50aXUgUGFsY3UiIDxsYXVyZW50aXUu
cGFsY3VAb3NzLm54cC5jb20+IHdyb3RlOgo+SGkgTGlhbmcsCj4KPlRoYW5rcyBmb3IgdGhlIHBh
dGNoLgo+Cj5UaGUgcGF0Y2ggaXMgb2sgYnV0LCBzaW5jZSB5b3UncmUgYXQgaXQsIG1heWJlIGFk
ZCBvZl9ub2RlX3B1dCgpIGluIHRoZQo+ZGNzc19kZXZfZGVzdHJveSgpIHRvbz8KCj4KVGhhbmtz
LCBsYXVyZW50aXUsCkkgbWlzcyBpdCBhbmQgSSB3aWxsIGFkZCBpdCBzb29uLgoKCj5UaGFua3Ms
Cj5sYXVyZW50aXUKPgo+T24gVGh1LCBKdWwgMDcsIDIwMjIgYXQgMTA6MzI6MTRBTSArMDgwMCwg
TGlhbmcgSGUgd3JvdGU6Cj4+IEluIGRjc3NfZGV2X2NyZWF0ZSgpLCB3ZSBzaG91bGQgY2FsbCBv
Zl9ub2RlX3B1dCgpIGluIGZhaWwgcGF0aCBmb3IKPj4gb2ZfZ3JhcGhfZ2V0X3BvcnRfYnlfaWQo
KSB3aGljaCB3aWxsIGluY3JlYXNlIHRoZSByZWZjb3VudC4KPj4gCj4+IEZpeGVzOiA5MDIxYzMx
N2I3NzAgKCJkcm0vaW14OiBBZGQgaW5pdGlhbCBzdXBwb3J0IGZvciBEQ1NTIG9uIGlNWDhNUSIp
Cj4+IFNpZ25lZC1vZmYtYnk6IExpYW5nIEhlIDx3aW5kaGxAMTI2LmNvbT4KPj4gLS0tCj4+ICBk
cml2ZXJzL2dwdS9kcm0vaW14L2Rjc3MvZGNzcy1kZXYuYyB8IDEgKwo+PiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2lt
eC9kY3NzL2Rjc3MtZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2Rjc3MvZGNzcy1kZXYuYwo+
PiBpbmRleCBjODQ5NTMzY2E4M2UuLmE5OTE0MTUzODYyMSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2lteC9kY3NzL2Rjc3MtZGV2LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2lt
eC9kY3NzL2Rjc3MtZGV2LmMKPj4gQEAgLTIwNyw2ICsyMDcsNyBAQCBzdHJ1Y3QgZGNzc19kZXYg
KmRjc3NfZGV2X2NyZWF0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsIGJvb2wgaGRtaV9vdXRwdXQpCj4+
ICAKPj4gIAlyZXQgPSBkY3NzX3N1Ym1vZHVsZXNfaW5pdChkY3NzKTsKPj4gIAlpZiAocmV0KSB7
Cj4+ICsJCW9mX25vZGVfcHV0KGRjc3MtPm9mX3BvcnQpOwo+PiAgCQlkZXZfZXJyKGRldiwgInN1
Ym1vZHVsZXMgaW5pdGlhbGl6YXRpb24gZmFpbGVkXG4iKTsKPj4gIAkJZ290byBjbGtzX2VycjsK
Pj4gIAl9Cj4+IC0tIAo+PiAyLjI1LjEKPj4gCg==
------=_Part_73274_1372756763.1657785215985
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxwcmU+PGJy
PkF0IDIwMjItMDctMTQgMTU6Mzc6NDEsICJMYXVyZW50aXUgUGFsY3UiICZsdDtsYXVyZW50aXUu
cGFsY3VAb3NzLm54cC5jb20mZ3Q7IHdyb3RlOgomZ3Q7SGkgTGlhbmcsCiZndDsKJmd0O1RoYW5r
cyBmb3IgdGhlIHBhdGNoLgomZ3Q7CiZndDtUaGUgcGF0Y2ggaXMgb2sgYnV0LCBzaW5jZSB5b3Un
cmUgYXQgaXQsIG1heWJlIGFkZCBvZl9ub2RlX3B1dCgpIGluIHRoZQomZ3Q7ZGNzc19kZXZfZGVz
dHJveSgpIHRvbz8KPGRpdj4mZ3Q7PC9kaXY+PGRpdj5UaGFua3MsIGxhdXJlbnRpdSw8L2Rpdj48
ZGl2PkkgbWlzcyBpdCBhbmQgSSB3aWxsIGFkZCBpdCBzb29uLjwvZGl2PjxkaXY+PGJyPjwvZGl2
PiZndDtUaGFua3MsCiZndDtsYXVyZW50aXUKJmd0OwomZ3Q7T24gVGh1LCBKdWwgMDcsIDIwMjIg
YXQgMTA6MzI6MTRBTSArMDgwMCwgTGlhbmcgSGUgd3JvdGU6CiZndDsmZ3Q7IEluIGRjc3NfZGV2
X2NyZWF0ZSgpLCB3ZSBzaG91bGQgY2FsbCBvZl9ub2RlX3B1dCgpIGluIGZhaWwgcGF0aCBmb3IK
Jmd0OyZndDsgb2ZfZ3JhcGhfZ2V0X3BvcnRfYnlfaWQoKSB3aGljaCB3aWxsIGluY3JlYXNlIHRo
ZSByZWZjb3VudC4KJmd0OyZndDsgCiZndDsmZ3Q7IEZpeGVzOiA5MDIxYzMxN2I3NzAgKCJkcm0v
aW14OiBBZGQgaW5pdGlhbCBzdXBwb3J0IGZvciBEQ1NTIG9uIGlNWDhNUSIpCiZndDsmZ3Q7IFNp
Z25lZC1vZmYtYnk6IExpYW5nIEhlICZsdDt3aW5kaGxAMTI2LmNvbSZndDsKJmd0OyZndDsgLS0t
CiZndDsmZ3Q7ICBkcml2ZXJzL2dwdS9kcm0vaW14L2Rjc3MvZGNzcy1kZXYuYyB8IDEgKwomZ3Q7
Jmd0OyAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiZndDsmZ3Q7IAomZ3Q7Jmd0OyBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2lteC9kY3NzL2Rjc3MtZGV2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vaW14L2Rjc3MvZGNzcy1kZXYuYwomZ3Q7Jmd0OyBpbmRleCBjODQ5NTMzY2E4M2Uu
LmE5OTE0MTUzODYyMSAxMDA2NDQKJmd0OyZndDsgLS0tIGEvZHJpdmVycy9ncHUvZHJtL2lteC9k
Y3NzL2Rjc3MtZGV2LmMKJmd0OyZndDsgKysrIGIvZHJpdmVycy9ncHUvZHJtL2lteC9kY3NzL2Rj
c3MtZGV2LmMKJmd0OyZndDsgQEAgLTIwNyw2ICsyMDcsNyBAQCBzdHJ1Y3QgZGNzc19kZXYgKmRj
c3NfZGV2X2NyZWF0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsIGJvb2wgaGRtaV9vdXRwdXQpCiZndDsm
Z3Q7ICAKJmd0OyZndDsgIAlyZXQgPSBkY3NzX3N1Ym1vZHVsZXNfaW5pdChkY3NzKTsKJmd0OyZn
dDsgIAlpZiAocmV0KSB7CiZndDsmZ3Q7ICsJCW9mX25vZGVfcHV0KGRjc3MtJmd0O29mX3BvcnQp
OwomZ3Q7Jmd0OyAgCQlkZXZfZXJyKGRldiwgInN1Ym1vZHVsZXMgaW5pdGlhbGl6YXRpb24gZmFp
bGVkXG4iKTsKJmd0OyZndDsgIAkJZ290byBjbGtzX2VycjsKJmd0OyZndDsgIAl9CiZndDsmZ3Q7
IC0tIAomZ3Q7Jmd0OyAyLjI1LjEKJmd0OyZndDsgCjwvcHJlPjwvZGl2Pg==
------=_Part_73274_1372756763.1657785215985--

