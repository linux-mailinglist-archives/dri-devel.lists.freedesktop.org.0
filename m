Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C48EF4BC23
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 16:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A896E3D3;
	Wed, 19 Jun 2019 14:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC756E336
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 09:17:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 2284B286272
Subject: Re: [PATCH 3/4] backlight: pwm_bl: Set scale type for CIE 1931 curves
To: Matthias Kaehlcke <mka@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20190613194326.180889-1-mka@chromium.org>
 <20190613194326.180889-4-mka@chromium.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <3ef89251-146c-c4e4-91c8-19ae855824ac@collabora.com>
Date: Wed, 19 Jun 2019 11:17:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190613194326.180889-4-mka@chromium.org>
Content-Language: en-GB
X-Mailman-Approved-At: Wed, 19 Jun 2019 14:58:26 +0000
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF0dGhpYXMsCgpPbiAxMy82LzE5IDIxOjQzLCBNYXR0aGlhcyBLYWVobGNrZSB3cm90ZToK
PiBGb3IgYmFja2xpZ2h0IGN1cnZlcyBjYWxjdWxhdGVkIHdpdGggdGhlIENJRSAxOTMxIGFsZ29y
aXRobSBzZXQKPiB0aGUgYnJpZ2h0bmVzcyBzY2FsZSB0eXBlIHByb3BlcnR5IGFjY29yZGluZ2x5
LiBUaGlzIG1ha2VzIHRoZQo+IHNjYWxlIHR5cGUgYXZhaWxhYmxlIHRvIHVzZXJzcGFjZSB2aWEg
dGhlICdzY2FsZScgc3lzZnMgYXR0cmlidXRlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoaWFz
IEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPgoKVGVzdGVkIG9uIFNhbXN1bmcgQ2hyb21lYm9v
ayBQbHVzIHdoaWNoIHVzZXMgdGhlIENJRSAxOTMxIGFsZ29yaXRobS4KClRlc3RlZC1ieTogRW5y
aWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4KCj4gLS0t
Cj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIHwgNSArKysrLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGln
aHQvcHdtX2JsLmMKPiBpbmRleCBmYjQ1Zjg2NmI5MjMuLmYwNjdmZTdhYTM1ZCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwo+ICsrKyBiL2RyaXZlcnMvdmlk
ZW8vYmFja2xpZ2h0L3B3bV9ibC5jCj4gQEAgLTU1Myw2ICs1NTMsOCBAQCBzdGF0aWMgaW50IHB3
bV9iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCQlnb3Rv
IGVycl9hbGxvYzsKPiAgCX0KPiAgCj4gKwltZW1zZXQoJnByb3BzLCAwLCBzaXplb2Yoc3RydWN0
IGJhY2tsaWdodF9wcm9wZXJ0aWVzKSk7Cj4gKwo+ICAJaWYgKGRhdGEtPmxldmVscykgewo+ICAJ
CS8qCj4gIAkJICogRm9yIHRoZSBEVCBjYXNlLCBvbmx5IHdoZW4gYnJpZ2h0bmVzcyBsZXZlbHMg
aXMgZGVmaW5lZAo+IEBAIC01OTEsNiArNTkzLDggQEAgc3RhdGljIGludCBwd21fYmFja2xpZ2h0
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAo+ICAJCQlwYi0+bGV2ZWxz
ID0gZGF0YS0+bGV2ZWxzOwo+ICAJCX0KPiArCj4gKwkJcHJvcHMuc2NhbGUgPSBCQUNLTElHSFRf
U0NBTEVfQ0lFMTkzMTsKPiAgCX0gZWxzZSB7Cj4gIAkJLyoKPiAgCQkgKiBUaGF0IG9ubHkgaGFw
cGVucyBmb3IgdGhlIG5vbi1EVCBjYXNlLCB3aGVyZSBwbGF0Zm9ybSBkYXRhCj4gQEAgLTYwMSw3
ICs2MDUsNiBAQCBzdGF0aWMgaW50IHB3bV9iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKPiAgCj4gIAlwYi0+bHRoX2JyaWdodG5lc3MgPSBkYXRhLT5sdGhfYnJp
Z2h0bmVzcyAqIChzdGF0ZS5wZXJpb2QgLyBwYi0+c2NhbGUpOwo+ICAKPiAtCW1lbXNldCgmcHJv
cHMsIDAsIHNpemVvZihzdHJ1Y3QgYmFja2xpZ2h0X3Byb3BlcnRpZXMpKTsKPiAgCXByb3BzLnR5
cGUgPSBCQUNLTElHSFRfUkFXOwo+ICAJcHJvcHMubWF4X2JyaWdodG5lc3MgPSBkYXRhLT5tYXhf
YnJpZ2h0bmVzczsKPiAgCWJsID0gYmFja2xpZ2h0X2RldmljZV9yZWdpc3RlcihkZXZfbmFtZSgm
cGRldi0+ZGV2KSwgJnBkZXYtPmRldiwgcGIsCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
