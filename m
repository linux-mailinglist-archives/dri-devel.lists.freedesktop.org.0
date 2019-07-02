Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 388675D2A0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 17:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFE989E11;
	Tue,  2 Jul 2019 15:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DA489E11;
 Tue,  2 Jul 2019 15:20:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83D8C255;
 Tue,  2 Jul 2019 17:20:30 +0200 (CEST)
Date: Tue, 2 Jul 2019 18:20:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 5/5] drm/bridge: ti-sn65dsi86: support booloader enabled
 display
Message-ID: <20190702152011.GE5033@pendragon.ideasonboard.com>
References: <20190630150230.7878-1-robdclark@gmail.com>
 <20190630150230.7878-6-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190630150230.7878-6-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562080830;
 bh=MQPbS86dIXLIzRT7cKc2d+ifqWU4LvOkgbT4PqUtUs8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AjyAX71LRoe8eRV+OuUkmQlR9YQO/vf1ZVwhHDHWiea63RF+ToCjI1skAe8BqYFZ/
 PmWK4A7hGuqGDfDm0bX9JeknSYfL9JDtJjYykDHFVlViecPn3Xsmu1jZJpC4V4Uonz
 xTA1y9MKIbsTw5Dc5U5MuggGLuy54MMFTBhSYe+g=
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 linux-pm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBTdW4sIEp1biAzMCwgMjAxOSBh
dCAwODowMTo0M0FNIC0wNzAwLCBSb2IgQ2xhcmsgd3JvdGU6Cj4gRnJvbTogUm9iIENsYXJrIDxy
b2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+IAo+IFJlcXVlc3QgdGhlIGVuYWJsZSBncGlvIEFTSVMg
dG8gYXZvaWQgZGlzYWJsaW5nIGJyaWRnZSBkdXJpbmcgcHJvYmUsIGlmCj4gYWxyZWFkeSBlbmFi
bGVkLiAgQW5kIGlmIGFscmVhZHkgZW5hYmxlZCwgZGVmZXIgZW5hYmxpbmcgcnVucG0gdW50aWwK
PiBhdHRhY2ggdG8gYXZvaWQgY3V0dGluZyBvZmYgdGhlIHBvd2VyIHRvIHRoZSBicmlkZ2UuCj4g
Cj4gT25jZSB3ZSBnZXQgdG8gYXR0YWNoLCB3ZSBrbm93IHBhbmVsIGFuZCBkcm0gZHJpdmVyIGFy
ZSBwcm9iZWQKPiBzdWNjZXNzZnVsbHksIHNvIGF0IHRoaXMgcG9pbnQgaXQgaSBzIHNhZmUgdG8g
ZW5hYmxlIHJ1bnBtIGFuZCByZXNldCB0aGUKPiBicmlkZ2UuICBJZiB3ZSBkbyBpdCBlYXJsaWVy
LCB3ZSBraWxsIGVmaWZiIChpbiB0aGUgY2FzZSB0aGF0IHBhbmVsIG9yCj4gZHJtIGRyaXZlciBk
byBub3QgcHJvYmUgc3VjY2Vzc2Z1bGx5LCBnaXZpbmcgdGhlIHVzZXIgbm8gd2F5IHRvIHNlZSB3
aGF0Cj4gaXMgZ29pbmcgb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xh
cmtAY2hyb21pdW0ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVk
c2k4Ni5jIHwgMTIgKysrKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RpLXNuNjVkc2k4Ni5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYu
Ywo+IGluZGV4IDdhMDQ2YmNkZDgxYi4uOGJkYzMzNTc2OTkyIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RpLXNuNjVkc2k4Ni5jCj4gQEAgLTI1Nyw2ICsyNTcsMTIgQEAgc3RhdGljIGludCB0
aV9zbl9icmlkZ2VfYXR0YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4gIAkJCQkJCSAg
IC5ub2RlID0gTlVMTCwKPiAgCQkJCQkJIH07Cj4gIAo+ICsJaWYgKGdwaW9kX2dldF92YWx1ZShw
ZGF0YS0+ZW5hYmxlX2dwaW8pKSB7Cj4gKwkJcG1fcnVudGltZV9lbmFibGUocGRhdGEtPmRldik7
CgpEb2VzIHRoaXMgbmVlZCB0byBiZSBiYWxhbmNlZCB3aXRoIGEgcG1fcnVudGltZV9kaXNhYmxl
KCkgY2FsbCA/IEJyaWRnZXMKY2FuIGJlIGF0dGFjaGVkIGFuZCBkZXRhY2hlZCBhdCBydW50aW1l
IHdoZW4gcmVsb2FkaW5nIHRoZSBkaXNwbGF5CmNvbnRyb2xsZXIgZHJpdmVycywgc28geW91IG5l
ZWQgdG8gZW5zdXJlIHRoYXQgZGV0YWNoL3JlLWF0dGFjaCBjeWNsZXMKd29yay4KCj4gKwkJdGlf
c25fYnJpZGdlX3Jlc3VtZShwZGF0YS0+ZGV2KTsKPiArCQl0aV9zbl9icmlkZ2Vfc3VzcGVuZChw
ZGF0YS0+ZGV2KTsKPiArCX0KPiArCj4gIAlyZXQgPSBkcm1fY29ubmVjdG9yX2luaXQoYnJpZGdl
LT5kZXYsICZwZGF0YS0+Y29ubmVjdG9yLAo+ICAJCQkJICZ0aV9zbl9icmlkZ2VfY29ubmVjdG9y
X2Z1bmNzLAo+ICAJCQkJIERSTV9NT0RFX0NPTk5FQ1RPUl9lRFApOwo+IEBAIC04MTMsNyArODE5
LDcgQEAgc3RhdGljIGludCB0aV9zbl9icmlkZ2VfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNs
aWVudCwKPiAgCWRldl9zZXRfZHJ2ZGF0YSgmY2xpZW50LT5kZXYsIHBkYXRhKTsKPiAgCj4gIAlw
ZGF0YS0+ZW5hYmxlX2dwaW8gPSBkZXZtX2dwaW9kX2dldChwZGF0YS0+ZGV2LCAiZW5hYmxlIiwK
PiAtCQkJCQkgICAgR1BJT0RfT1VUX0xPVyk7Cj4gKwkJCQkJICAgIEdQSU9EX0FTSVMpOwo+ICAJ
aWYgKElTX0VSUihwZGF0YS0+ZW5hYmxlX2dwaW8pKSB7Cj4gIAkJRFJNX0VSUk9SKCJmYWlsZWQg
dG8gZ2V0IGVuYWJsZSBncGlvIGZyb20gRFRcbiIpOwo+ICAJCXJldCA9IFBUUl9FUlIocGRhdGEt
PmVuYWJsZV9ncGlvKTsKPiBAQCAtODQzLDcgKzg0OSw5IEBAIHN0YXRpYyBpbnQgdGlfc25fYnJp
ZGdlX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCj4gIAlpZiAocmV0KQo+ICAJCXJl
dHVybiByZXQ7Cj4gIAo+IC0JcG1fcnVudGltZV9lbmFibGUocGRhdGEtPmRldik7Cj4gKwlpZiAo
IWdwaW9kX2dldF92YWx1ZShwZGF0YS0+ZW5hYmxlX2dwaW8pKSB7Cj4gKwkJcG1fcnVudGltZV9l
bmFibGUocGRhdGEtPmRldik7Cj4gKwl9CgpJZiBJIHVuZGVyc3RhbmQgdGhlIGlzc3VlIGNvcnJl
Y3RseSwgdGhpcyBpcyBwYXJ0IG9mIGFuIGVmZm9ydCB0byBhdm9pZApkaXNhYmxpbmcgYSBwb3Rl
bnRpYWxseSBkaXNwbGF5IG91dHB1dCB1bnRpbCB3ZSBnZXQgYXMgY2xvc2UgYXMgcG9zc2libGUK
dG8gZGlzcGxheSBoYW5kb3ZlciwgcmlnaHQgPyBJcyB0aGVyZSBhIGRyYXdiYWNrIGluIGFsd2F5
cyBlbmFibGluZwpydW50aW1lIFBNIHdoZW4gdGhlIGJyaWRnZSBpcyBhdHRhY2hlZCBpbnN0ZWFk
IG9mIGF0IHByb2JlIHRpbWUgPyBJCnRoaW5rIHdlIG5lZWQgdG8gY29tZSB1cCB3aXRoIGEgc2V0
IG9mIHJ1bGVzIGZvciBicmlkZ2UgZHJpdmVyIGF1dGhvcnMsCm90aGVyd2lzZSB3ZSdsbCBlbmQg
dXAgd2l0aCBpbmNvbXBhdGlibGUgZXhwZWN0YXRpb25zIG9mIGJyaWRnZSBkcml2ZXJzCmFuZCBk
aXNwbGF5IGNvbnRyb2xsZXIgZHJpdmVycy4KCj4gIAo+ICAJaTJjX3NldF9jbGllbnRkYXRhKGNs
aWVudCwgcGRhdGEpOwo+ICAKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
