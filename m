Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 530E12A9184
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4CD6EE30;
	Fri,  6 Nov 2020 08:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C192A6E177
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 19:17:31 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kaklE-0000Lw-MI; Thu, 05 Nov 2020 20:17:28 +0100
Subject: Re: [PATCH 03/19] gpu: drm: imx: ipuv3-plane: Mark 'crtc_state' as
 __always_unused
To: Lee Jones <lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-4-lee.jones@linaro.org>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <15a4a184-74c2-e630-193a-cdea61545a03@pengutronix.de>
Date: Thu, 5 Nov 2020 20:17:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201105144517.1826692-4-lee.jones@linaro.org>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gTGVlLAoKT24gMTEvNS8yMCAzOjQ1IFBNLCBMZWUgSm9uZXMgd3JvdGU6Cj4gSW4gdGhl
IG1hY3JvIGZvcl9lYWNoX29sZG5ld19jcnRjX2luX3N0YXRlKCkgJ2NydGNfc3RhdGUnIGlzIHBy
b3ZpZGVkCj4gYXMgYSBjb250YWluZXIgZm9yIHN0YXRlLT5jcnRjc1tpXS5uZXdfc3RhdGUsIGJ1
dCBpcyBub3QgdXRpbGlzZWQgaW4KPiB0aGlzIHVzZS1jYXNlLiAgV2UgY2Fubm90IHNpbXBseSBk
ZWxldGUgdGhlIHZhcmlhYmxlLCBzbyBoZXJlIHdlIHRlbGwKPiB0aGUgY29tcGlsZXIgdGhhdCB3
ZSdyZSBpbnRlbnRpb25hbGx5IGRpc2NhcmRpbmcgdGhlIHJlYWQgdmFsdWUuCgpmb3JfZWFjaF9v
bGRuZXdfY3J0Y19pbl9zdGF0ZSBhbHJlYWR5ICh2b2lkKSBjYXN0cyB0aGUgZHJtX2NydGMgYW5k
IHRoZSBvbGQKZHJtX2NydGNfc3RhdGUgdG8gc2lsZW5jZSB1bnVzZWQtYnV0LXNldC12YXJpYWJs
ZSB3YXJuaW5nLiBTaG91bGQgd2UgbWF5YmUKKHZvaWQpIGNhc3QgdGhlIG5ldyBjcnRjX3N0YXRl
IGFzIHdlbGw/CgpDaGVlcnMKQWhtYWQKCj4gCj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2Vy
bmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtcGxh
bmUuYzogSW4gZnVuY3Rpb24g4oCYaXB1X3BsYW5lc19hc3NpZ25fcHJl4oCZOgo+ICBkcml2ZXJz
L2dwdS9kcm0vaW14L2lwdXYzLXBsYW5lLmM6NzQ2OjQyOiB3YXJuaW5nOiB2YXJpYWJsZSDigJhj
cnRjX3N0YXRl4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVd
Cj4gCj4gQ2M6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IERh
dmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgo+IENjOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+Cj4gQ2M6IFNh
c2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4KPiBDYzogUGVuZ3V0cm9uaXggS2Vy
bmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT4KPiBDYzogRmFiaW8gRXN0ZXZhbSA8ZmVz
dGV2YW1AZ21haWwuY29tPgo+IENjOiBOWFAgTGludXggVGVhbSA8bGludXgtaW14QG54cC5jb20+
Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
aW14L2lwdXYzLXBsYW5lLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lw
dXYzLXBsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLXBsYW5lLmMKPiBpbmRleCA4
YTQyMzVkOWQ5ZjFlLi5hY2MwYTNjZTQ5OTJmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pbXgvaXB1djMtcGxhbmUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtcGxh
bmUuYwo+IEBAIC03NDMsNyArNzQzLDcgQEAgYm9vbCBpcHVfcGxhbmVfYXRvbWljX3VwZGF0ZV9w
ZW5kaW5nKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lKQo+ICBpbnQgaXB1X3BsYW5lc19hc3NpZ25f
cHJlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIAkJCSAgc3RydWN0IGRybV9hdG9taWNfc3Rh
dGUgKnN0YXRlKQo+ICB7Cj4gLQlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm9sZF9jcnRjX3N0YXRl
LCAqY3J0Y19zdGF0ZTsKPiArCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqb2xkX2NydGNfc3RhdGUs
IF9fYWx3YXlzX3VudXNlZCAqY3J0Y19zdGF0ZTsKPiAgCXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUg
KnBsYW5lX3N0YXRlOwo+ICAJc3RydWN0IGlwdV9wbGFuZV9zdGF0ZSAqaXB1X3N0YXRlOwo+ICAJ
c3RydWN0IGlwdV9wbGFuZSAqaXB1X3BsYW5lOwo+IAoKLS0gClBlbmd1dHJvbml4IGUuSy4gICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ClN0
ZXVlcndhbGRlciBTdHIuIDIxICAgICAgICAgICAgICAgICAgICAgICB8IGh0dHA6Ly93d3cucGVu
Z3V0cm9uaXguZGUvICB8CjMxMTM3IEhpbGRlc2hlaW0sIEdlcm1hbnkgICAgICAgICAgICAgICAg
ICB8IFBob25lOiArNDktNTEyMS0yMDY5MTctMCAgICB8CkFtdHNnZXJpY2h0IEhpbGRlc2hlaW0s
IEhSQSAyNjg2ICAgICAgICAgICB8IEZheDogICArNDktNTEyMS0yMDY5MTctNTU1NSB8Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
