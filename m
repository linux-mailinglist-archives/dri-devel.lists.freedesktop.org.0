Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7666367E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 15:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F4989AB2;
	Tue,  9 Jul 2019 13:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0772F89AB2
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 13:10:14 +0000 (UTC)
Received: from [192.168.43.26] (unknown [86.8.202.39])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C854256A;
 Tue,  9 Jul 2019 15:10:10 +0200 (CEST)
Subject: Re: [PATCH v2 03/19] arm64: renesas: Update 'vsps' property
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-4-jacopo+renesas@jmondi.org>
 <20190708031121.GA5046@pendragon.ideasonboard.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
X-Enigmail-Draft-Status: N11100
Organization: Ideas on Board
Message-ID: <6c62ed5e-fbfd-cf5e-7611-47577e78efe6@ideasonboard.com>
Date: Tue, 9 Jul 2019 14:10:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190708031121.GA5046@pendragon.ideasonboard.com>
Content-Language: en-GB
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562677811;
 bh=MC2VktNHFEzC8E+DTe2UiB5DhWKIJmSeaH4pPOxCqyU=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=IZxchB5GZRgI3H3uorN1VxyGSwpEy5eytBXqvjMZquAsTYicmUZHDF1z/6VHMipu4
 uEiO3Jo2FoWLZEIdljV/pAdAcTJ1zk6jRSHUs66TUhR+KwguZKwhGg4z2Ti7wke+MA
 UdC54Omud2BY6i4EdMx5SCsnpg9IK9B42MqL4byo=
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: muroya@ksk.co.jp, airlied@linux.ie, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, VenkataRajesh.Kalakodima@in.bosch.com,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gMDgvMDcvMjAxOSAwNDoxMSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToK
PiBIaSBKYWNvcG8sCj4gCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCj4gCj4gT24gU2F0LCBK
dWwgMDYsIDIwMTkgYXQgMDQ6MDc6MzBQTSArMDIwMCwgSmFjb3BvIE1vbmRpIHdyb3RlOgo+PiBV
cGRhdGUgdGhlICd2c3BzJyBwcm9wZXJ0eSBpbiB0aGUgUi1DYXIgR2VuMyBTb0MgZGV2aWNlIHRy
ZWUgZmlsZXMgdG8KPj4gbWF0Y2ggd2hhdCdzIGluIGluIHRoZSBkb2N1bWVudGF0aW9uIGV4YW1w
bGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1v
bmRpLm9yZz4KPiAKPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5j
aGFydEBpZGVhc29uYm9hcmQuY29tPgoKKzEgZnJvbSBtZSB0b28uIFRoaXMgY2VydGFpbmx5IGlt
cHJvdmVzIHJlYWRhYmlsaXR5L2NsYXJpdHkgSU1PLgoKUmV2aWV3ZWQtYnk6IEtpZXJhbiBCaW5n
aGFtIDxraWVyYW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+Cgo+IAo+PiAtLS0K
Pj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRjMC5kdHNpIHwgMiArLQo+PiAg
YXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTUuZHRzaSAgfCAyICstCj4+ICBhcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NjUuZHRzaSB8IDIgKy0KPj4gIGFyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk5MC5kdHNpIHwgMiArLQo+PiAgYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3I4YTc3OTk1LmR0c2kgfCAyICstCj4+ICA1IGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRjMC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0
cy9yZW5lc2FzL3I4YTc3NGMwLmR0c2kKPj4gaW5kZXggM2Y4NmRiMTk5ZGJmLi5lNjQzZjlkM2Mx
MDIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRjMC5k
dHNpCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRjMC5kdHNpCj4+
IEBAIC0xODA3LDcgKzE4MDcsNyBAQAo+PiAgCQkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3MjQ+
LAo+PiAgCQkJCSA8JmNwZyBDUEdfTU9EIDcyMz47Cj4+ICAJCQljbG9jay1uYW1lcyA9ICJkdS4w
IiwgImR1LjEiOwo+PiAtCQkJdnNwcyA9IDwmdnNwZDAgMCAmdnNwZDEgMD47Cj4+ICsJCQl2c3Bz
ID0gPCZ2c3BkMCAwPiwgPCZ2c3BkMSAwPjsKPj4gIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+
ICAKPj4gIAkJCXBvcnRzIHsKPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9yOGE3Nzk1LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NS5k
dHNpCj4+IGluZGV4IDA5NzUzOGNjNGIxZi4uNDMyZjQwMzZhOGE4IDEwMDY0NAo+PiAtLS0gYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NS5kdHNpCj4+ICsrKyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk1LmR0c2kKPj4gQEAgLTMwOTgsNyArMzA5OCw3IEBA
Cj4+ICAJCQkJIDwmY3BnIENQR19NT0QgNzIyPiwKPj4gIAkJCQkgPCZjcGcgQ1BHX01PRCA3MjE+
Owo+PiAgCQkJY2xvY2stbmFtZXMgPSAiZHUuMCIsICJkdS4xIiwgImR1LjIiLCAiZHUuMyI7Cj4+
IC0JCQl2c3BzID0gPCZ2c3BkMCAwICZ2c3BkMSAwICZ2c3BkMiAwICZ2c3BkMCAxPjsKPj4gKwkJ
CXZzcHMgPSA8JnZzcGQwIDA+LCA8JnZzcGQxIDA+LCA8JnZzcGQyIDA+LCA8JnZzcGQwIDE+Owo+
PiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPj4gIAo+PiAgCQkJcG9ydHMgewo+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTY1LmR0c2kgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NjUuZHRzaQo+PiBpbmRleCAyNTU0YjE3NDJkYmYu
LmI3MDFhZWI0ZjQzOCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2Fz
L3I4YTc3OTY1LmR0c2kKPj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3
OTY1LmR0c2kKPj4gQEAgLTI0NTYsNyArMjQ1Niw3IEBACj4+ICAJCQljbG9jay1uYW1lcyA9ICJk
dS4wIiwgImR1LjEiLCAiZHUuMyI7Cj4+ICAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+PiAgCj4+
IC0JCQl2c3BzID0gPCZ2c3BkMCAwICZ2c3BkMSAwICZ2c3BkMCAxPjsKPj4gKwkJCXZzcHMgPSA8
JnZzcGQwIDA+LCA8JnZzcGQxIDA+LCA8JnZzcGQwIDE+Owo+PiAgCj4+ICAJCQlwb3J0cyB7Cj4+
ICAJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNh
cy9yOGE3Nzk5MC5kdHNpCj4+IGluZGV4IDU2Y2I1NjZmZmEwOS4uNzlkYjU0NDFiN2U3IDEwMDY0
NAo+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAuZHRzaQo+PiAr
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAuZHRzaQo+PiBAQCAtMTc2
NCw3ICsxNzY0LDcgQEAKPj4gIAkJCWNsb2NrcyA9IDwmY3BnIENQR19NT0QgNzI0PiwKPj4gIAkJ
CQkgPCZjcGcgQ1BHX01PRCA3MjM+Owo+PiAgCQkJY2xvY2stbmFtZXMgPSAiZHUuMCIsICJkdS4x
IjsKPj4gLQkJCXZzcHMgPSA8JnZzcGQwIDAgJnZzcGQxIDA+Owo+PiArCQkJdnNwcyA9IDwmdnNw
ZDAgMD4sIDwmdnNwZDEgMD47Cj4+ICAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+PiAgCj4+ICAJ
CQlwb3J0cyB7Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhh
Nzc5OTUuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk5NS5kdHNpCj4+
IGluZGV4IDViZjNhZjI0NmUxNC4uNDlhMTFiNGY1NWJkIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUuZHRzaQo+PiArKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUuZHRzaQo+PiBAQCAtMTAwMSw3ICsxMDAxLDcgQEAKPj4g
IAkJCWNsb2NrcyA9IDwmY3BnIENQR19NT0QgNzI0PiwKPj4gIAkJCQkgPCZjcGcgQ1BHX01PRCA3
MjM+Owo+PiAgCQkJY2xvY2stbmFtZXMgPSAiZHUuMCIsICJkdS4xIjsKPj4gLQkJCXZzcHMgPSA8
JnZzcGQwIDAgJnZzcGQxIDA+Owo+PiArCQkJdnNwcyA9IDwmdnNwZDAgMD4sIDwmdnNwZDEgMD47
Cj4+ICAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+PiAgCj4+ICAJCQlwb3J0cyB7Cj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
