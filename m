Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D48685B20A
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 23:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32F489CD4;
	Sun, 30 Jun 2019 21:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3175489CA0;
 Sun, 30 Jun 2019 21:17:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C26D255;
 Sun, 30 Jun 2019 23:17:45 +0200 (CEST)
Date: Mon, 1 Jul 2019 00:17:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 4/4] drm/bridge: ti-sn65dsi86: use helper to lookup
 panel-id
Message-ID: <20190630211726.GJ7043@pendragon.ideasonboard.com>
References: <20190630203614.5290-1-robdclark@gmail.com>
 <20190630203614.5290-5-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190630203614.5290-5-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1561929465;
 bh=qhQR3O5AsGUf/DlkqR0aLfys56Lbc2SRqyc65RdPD1w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q1hoRxI+AArRf6NPjZ0SH5dBwLIj+BUVSB/Qx9IsGPdZjDtqaIErraVoxKLClT5jS
 Mqyuowa1m9tcV7t5KT3FoyywDZ0GvUS9unghvIbocO/3n8tFW4+WKWM1N5sakBRHUf
 l1OTO/TFESLE3cy6OkfyDCEuL3VYaVdtCO4YkO3g=
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
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBTdW4sIEp1biAzMCwgMjAxOSBh
dCAwMTozNjowOFBNIC0wNzAwLCBSb2IgQ2xhcmsgd3JvdGU6Cj4gRnJvbTogUm9iIENsYXJrIDxy
b2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+IAo+IFVzZSB0aGUgZHJtX29mX2ZpbmRfcGFuZWxfaWQo
KSBoZWxwZXIgdG8gZGVjaWRlIHdoaWNoIGVuZHBvaW50IHRvIHVzZQo+IHdoZW4gbG9va2luZyB1
cCBwYW5lbC4gIFRoaXMgd2F5IHdlIGNhbiBzdXBwb3J0IGRldmljZXMgdGhhdCBoYXZlCj4gbXVs
dGlwbGUgcG9zc2libGUgcGFuZWxzLCBzdWNoIGFzIHRoZSBhYXJjaDY0IGxhcHRvcHMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jIHwgNSArKystLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYwo+IGluZGV4IDI3MTlkOWMwODY0Yi4uNTZjNjZhNDNm
MWE2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jCj4gQEAgLTc5MCw3
ICs3OTAsNyBAQCBzdGF0aWMgaW50IHRpX3NuX2JyaWRnZV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVu
dCAqY2xpZW50LAo+ICAJCQkgICAgICBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCAqaWQpCj4g
IHsKPiAgCXN0cnVjdCB0aV9zbl9icmlkZ2UgKnBkYXRhOwo+IC0JaW50IHJldDsKPiArCWludCBy
ZXQsIHBhbmVsX2lkOwo+ICAKPiAgCWlmICghaTJjX2NoZWNrX2Z1bmN0aW9uYWxpdHkoY2xpZW50
LT5hZGFwdGVyLCBJMkNfRlVOQ19JMkMpKSB7Cj4gIAkJRFJNX0VSUk9SKCJkZXZpY2UgZG9lc24n
dCBzdXBwb3J0IEkyQ1xuIik7Cj4gQEAgLTgxMSw3ICs4MTEsOCBAQCBzdGF0aWMgaW50IHRpX3Nu
X2JyaWRnZV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LAo+ICAKPiAgCXBkYXRhLT5k
ZXYgPSAmY2xpZW50LT5kZXY7Cj4gIAo+IC0JcmV0ID0gZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJp
ZGdlKHBkYXRhLT5kZXYtPm9mX25vZGUsIDEsIDAsCj4gKwlwYW5lbF9pZCA9IGRybV9vZl9maW5k
X3BhbmVsX2lkKCk7Cj4gKwlyZXQgPSBkcm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2UocGRhdGEt
PmRldi0+b2Zfbm9kZSwgMSwgcGFuZWxfaWQsCj4gIAkJCQkJICAmcGRhdGEtPnBhbmVsLCBOVUxM
KTsKPiAgCWlmIChyZXQpIHsKPiAgCQlEUk1fRVJST1IoImNvdWxkIG5vdCBmaW5kIGFueSBwYW5l
bCBub2RlXG4iKTsKCk5vLCBJJ20gc29ycnksIGJ1dCB0aGF0J3MgYSBuby1nby4gV2UgY2FuJ3Qg
cGF0Y2ggZXZlcnkgc2luZ2xlIGJyaWRnZQpkcml2ZXIgdG8gc3VwcG9ydCB0aGlzIGhhY2suIFdl
IG5lZWQgYSBzb2x1dGlvbiBpbXBsZW1lbnRlZCBhdCBhbm90aGVyCmxldmVsIHRoYXQgd2lsbCBu
b3Qgc3ByZWFkIHRocm91Z2hvdXQgdGhlIHdob2xlIHN1YnN5c3RlbS4KCi0tIApSZWdhcmRzLAoK
TGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
