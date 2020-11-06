Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BE42AAE0B
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 23:50:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFDB89786;
	Sun,  8 Nov 2020 22:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85E3890F2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 08:44:41 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kaxML-0007ok-Qg; Fri, 06 Nov 2020 09:44:37 +0100
Subject: Re: [PATCH 03/19] gpu: drm: imx: ipuv3-plane: Mark 'crtc_state' as
 __always_unused
To: Lee Jones <lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-4-lee.jones@linaro.org>
 <15a4a184-74c2-e630-193a-cdea61545a03@pengutronix.de>
 <20201106074151.GU4488@dell>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <5056c156-9f6c-8e0d-54e8-5317fdd46c12@pengutronix.de>
Date: Fri, 6 Nov 2020 09:44:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201106074151.GU4488@dell>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Sun, 08 Nov 2020 22:49:24 +0000
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

T24gMTEvNi8yMCA4OjQxIEFNLCBMZWUgSm9uZXMgd3JvdGU6Cj4gT24gVGh1LCAwNSBOb3YgMjAy
MCwgQWhtYWQgRmF0b3VtIHdyb3RlOgo+IAo+PiBIZWxsbyBMZWUsCj4+Cj4+IE9uIDExLzUvMjAg
Mzo0NSBQTSwgTGVlIEpvbmVzIHdyb3RlOgo+Pj4gSW4gdGhlIG1hY3JvIGZvcl9lYWNoX29sZG5l
d19jcnRjX2luX3N0YXRlKCkgJ2NydGNfc3RhdGUnIGlzIHByb3ZpZGVkCj4+PiBhcyBhIGNvbnRh
aW5lciBmb3Igc3RhdGUtPmNydGNzW2ldLm5ld19zdGF0ZSwgYnV0IGlzIG5vdCB1dGlsaXNlZCBp
bgo+Pj4gdGhpcyB1c2UtY2FzZS4gIFdlIGNhbm5vdCBzaW1wbHkgZGVsZXRlIHRoZSB2YXJpYWJs
ZSwgc28gaGVyZSB3ZSB0ZWxsCj4+PiB0aGUgY29tcGlsZXIgdGhhdCB3ZSdyZSBpbnRlbnRpb25h
bGx5IGRpc2NhcmRpbmcgdGhlIHJlYWQgdmFsdWUuCj4+Cj4+IGZvcl9lYWNoX29sZG5ld19jcnRj
X2luX3N0YXRlIGFscmVhZHkgKHZvaWQpIGNhc3RzIHRoZSBkcm1fY3J0YyBhbmQgdGhlIG9sZAo+
PiBkcm1fY3J0Y19zdGF0ZSB0byBzaWxlbmNlIHVudXNlZC1idXQtc2V0LXZhcmlhYmxlIHdhcm5p
bmcuIFNob3VsZCB3ZSBtYXliZQo+PiAodm9pZCkgY2FzdCB0aGUgbmV3IGNydGNfc3RhdGUgYXMg
d2VsbD8KPiAKPiBGcm9tIHdoYXQgSSBzYXcsIGl0IG9ubHkgdm9pZCBjYXN0cyB0aGUgb25lcyB3
aGljaCBhcmVuJ3QgYXNzaWduZWQuCgpIb3cgZG8geW91IG1lYW4/IEkgd29uZGVyIGlmCgogI2Rl
ZmluZSBmb3JfZWFjaF9vbGRuZXdfY3J0Y19pbl9zdGF0ZShfX3N0YXRlLCBjcnRjLCBvbGRfY3J0
Y19zdGF0ZSwgbmV3X2NydGNfc3RhdGUsIF9faSkgXAogICAgICAgIGZvciAoKF9faSkgPSAwOyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAg
ICAgICAoX19pKSA8IChfX3N0YXRlKS0+ZGV2LT5tb2RlX2NvbmZpZy5udW1fY3J0YzsgICAgICAg
ICAgICAgIFwKICAgICAgICAgICAgIChfX2kpKyspICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAgZm9yX2VhY2hfaWYgKChf
X3N0YXRlKS0+Y3J0Y3NbX19pXS5wdHIgJiYgICAgICAgICAgICAgICBcCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKChjcnRjKSA9IChfX3N0YXRlKS0+Y3J0Y3NbX19pXS5wdHIsICAgICAg
IFwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHZvaWQpKGNydGMpIC8qIE9ubHkgdG8g
YXZvaWQgdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUgd2FybmluZyAqLywgXAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIChvbGRfY3J0Y19zdGF0ZSkgPSAoX19zdGF0ZSktPmNydGNzW19faV0u
b2xkX3N0YXRlLCBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHZvaWQpKG9sZF9jcnRj
X3N0YXRlKSAvKiBPbmx5IHRvIGF2b2lkIHVudXNlZC1idXQtc2V0LXZhcmlhYmxlIHdhcm5pbmcg
Ki8sIFwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAobmV3X2NydGNfc3RhdGUpID0gKF9f
c3RhdGUpLT5jcnRjc1tfX2ldLm5ld19zdGF0ZSwgMSkpCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKG5ld19jcnRjX3N0YXRlKSA9IChfX3N0YXRlKS0+Y3J0Y3NbX19pXS5uZXdfc3RhdGUs
IFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAodm9pZCkobmV3X2NydGNfc3RhdGUpLCAx
KSkKCndvdWxkbid0IGJlIGJldHRlci4KCj4gCj4+PiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBr
ZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPj4+Cj4+PiAgZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2
My1wbGFuZS5jOiBJbiBmdW5jdGlvbiDigJhpcHVfcGxhbmVzX2Fzc2lnbl9wcmXigJk6Cj4+PiAg
ZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1wbGFuZS5jOjc0Njo0Mjogd2FybmluZzogdmFyaWFi
bGUg4oCYY3J0Y19zdGF0ZeKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZh
cmlhYmxlXQo+Pj4KPj4+IENjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRl
Pgo+Pj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPj4+IENjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4+PiBDYzogU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJu
ZWwub3JnPgo+Pj4gQ2M6IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4KPj4+
IENjOiBQZW5ndXRyb25peCBLZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPgo+Pj4g
Q2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KPj4+IENjOiBOWFAgTGludXgg
VGVhbSA8bGludXgtaW14QG54cC5jb20+Cj4+PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+Pj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9y
Zz4KPj4+IC0tLQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtcGxhbmUuYyB8IDIgKy0K
Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1wbGFuZS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2lteC9pcHV2My1wbGFuZS5jCj4+PiBpbmRleCA4YTQyMzVkOWQ5ZjFlLi5hY2Mw
YTNjZTQ5OTJmIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1wbGFu
ZS5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLXBsYW5lLmMKPj4+IEBAIC03
NDMsNyArNzQzLDcgQEAgYm9vbCBpcHVfcGxhbmVfYXRvbWljX3VwZGF0ZV9wZW5kaW5nKHN0cnVj
dCBkcm1fcGxhbmUgKnBsYW5lKQo+Pj4gIGludCBpcHVfcGxhbmVzX2Fzc2lnbl9wcmUoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwKPj4+ICAJCQkgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0
ZSkKPj4+ICB7Cj4+PiAtCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqb2xkX2NydGNfc3RhdGUsICpj
cnRjX3N0YXRlOwo+Pj4gKwlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm9sZF9jcnRjX3N0YXRlLCBf
X2Fsd2F5c191bnVzZWQgKmNydGNfc3RhdGU7Cj4+PiAgCXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUg
KnBsYW5lX3N0YXRlOwo+Pj4gIAlzdHJ1Y3QgaXB1X3BsYW5lX3N0YXRlICppcHVfc3RhdGU7Cj4+
PiAgCXN0cnVjdCBpcHVfcGxhbmUgKmlwdV9wbGFuZTsKPj4+Cj4+Cj4gCgotLSAKUGVuZ3V0cm9u
aXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwKU3RldWVyd2FsZGVyIFN0ci4gMjEgICAgICAgICAgICAgICAgICAgICAgIHwgaHR0
cDovL3d3dy5wZW5ndXRyb25peC5kZS8gIHwKMzExMzcgSGlsZGVzaGVpbSwgR2VybWFueSAgICAg
ICAgICAgICAgICAgIHwgUGhvbmU6ICs0OS01MTIxLTIwNjkxNy0wICAgIHwKQW10c2dlcmljaHQg
SGlsZGVzaGVpbSwgSFJBIDI2ODYgICAgICAgICAgIHwgRmF4OiAgICs0OS01MTIxLTIwNjkxNy01
NTU1IHwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
