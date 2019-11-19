Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C129100FB7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 01:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3E86E851;
	Tue, 19 Nov 2019 00:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 318 seconds by postgrey-1.36 at gabe;
 Tue, 19 Nov 2019 00:10:02 UTC
Received: from a27-187.smtp-out.us-west-2.amazonses.com
 (a27-187.smtp-out.us-west-2.amazonses.com [54.240.27.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A2E6E85A;
 Tue, 19 Nov 2019 00:10:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5295AC43383
Date: Tue, 19 Nov 2019 00:04:43 +0000
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: restore previous freq on resume
Message-ID: <0101016e80f9c71b-cfef4b5f-94c3-4213-b525-179c7fde6c95-000000@us-west-2.amazonses.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20191118234043.331542-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118234043.331542-1-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-SES-Outgoing: 2019.11.19-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574121883;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=OlbgppkuQo/Y6oDZ30f1NHoNLeu2B2S5yJCvYaZxH5Q=;
 b=IpQcH354bR2nv0cWuUKygKt0slSRWhZStQv9pnuaOccd+pvnTNzdgEL1O8wVoDq4
 FBPm4d+gqfWo9ee6ZaDAXlSiuGVE3WTYhA/xo/dl+RTzX6IpGJ8eEshNlU4Cwa0OxQL
 IrxzUPsTTwGfXBiB3dUSQzZy9tFRnrk4IfbWp4/4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574121883;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Feedback-ID;
 bh=OlbgppkuQo/Y6oDZ30f1NHoNLeu2B2S5yJCvYaZxH5Q=;
 b=dnIvOD+NMB1IgAlWYEIUCBdmr3CBh6RopWpO6o6870NBaCWDU7FeMNdmmMqX+Nc2
 ntrjPmd05LLljuVLfCfvwyGbG2E7vN98Q/nA/YCDRegQc/abyRbQIwZJcJKMI5RvhBQ
 gMhaboCur65JsoJI32hfFmAs+RXVUGVuIKjqfCwQ=
X-Mailman-Original-Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Mamta Shukla <mamtashukla555@gmail.com>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMDM6NDA6MzhQTSAtMDgwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAKPiBQcmV2aW91
c2x5LCBpZiB0aGUgZnJlcSB3ZXJlIG92ZXJyaWRlbiAoaWUuIHZpYSBzeXNmcyksIGl0IHdvdWxk
IGdldAo+IHJlc2V0IHRvIG1heCBvbiByZXN1bWUuCgpEZXZmcmVxIGdvZXMgdG8gc2xlZXAgYXNz
dW1pbmcgdGhhdCB0aGUgaGFyZHdhcmUgd2lsbCBzdGlsbCBiZSBhdCB0aGUgc2FtZQpmcmVxdWVu
Y3kgd2hlbiBpdCB3YWtlcyB1cCBidXQgdGhlIEdNVSBzbmVha3Mgb3V0IGluIHRoZSBtaWRkbGUg
b2YgdGhlIG5pZ2h0CmFuZCB0YWtlcyB0aGUgaGFyZHdhcmUgZm9yIGEgam95cmlkZS4KClJldmll
d2VkLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgoKPiBTaWduZWQt
b2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMgfCA4ICsrKysrKy0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmggfCAzICsrKwo+ICAyIGZpbGVzIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRy
ZW5vL2E2eHhfZ211LmMKPiBpbmRleCAyY2E0NzBlYjVjYjguLmI2NDg2NzcwMWU1YSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYwo+IEBAIC0xNDksNiArMTQ5LDggQEAg
dm9pZCBhNnh4X2dtdV9zZXRfZnJlcShzdHJ1Y3QgbXNtX2dwdSAqZ3B1LCB1bnNpZ25lZCBsb25n
IGZyZXEpCj4gIAkJaWYgKGZyZXEgPT0gZ211LT5ncHVfZnJlcXNbcGVyZl9pbmRleF0pCj4gIAkJ
CWJyZWFrOwo+ICAKPiArCWdtdS0+Y3VycmVudF9wZXJmX2luZGV4ID0gcGVyZl9pbmRleDsKPiAr
Cj4gIAlfX2E2eHhfZ211X3NldF9mcmVxKGdtdSwgcGVyZl9pbmRleCk7Cj4gIH0KPiAgCj4gQEAg
LTc0MSw4ICs3NDMsOCBAQCBpbnQgYTZ4eF9nbXVfcmVzdW1lKHN0cnVjdCBhNnh4X2dwdSAqYTZ4
eF9ncHUpCj4gIAlnbXVfd3JpdGUoZ211LCBSRUdfQTZYWF9HTVVfR01VMkhPU1RfSU5UUl9NQVNL
LCB+QTZYWF9IRklfSVJRX01BU0spOwo+ICAJZW5hYmxlX2lycShnbXUtPmhmaV9pcnEpOwo+ICAK
PiAtCS8qIFNldCB0aGUgR1BVIHRvIHRoZSBoaWdoZXN0IHBvd2VyIGZyZXF1ZW5jeSAqLwo+IC0J
X19hNnh4X2dtdV9zZXRfZnJlcShnbXUsIGdtdS0+bnJfZ3B1X2ZyZXFzIC0gMSk7Cj4gKwkvKiBT
ZXQgdGhlIEdQVSB0byB0aGUgY3VycmVudCBmcmVxICovCj4gKwlfX2E2eHhfZ211X3NldF9mcmVx
KGdtdSwgZ211LT5jdXJyZW50X3BlcmZfaW5kZXgpOwo+ICAKPiAgCS8qCj4gIAkgKiAiZW5hYmxl
IiB0aGUgR1ggcG93ZXIgZG9tYWluIHdoaWNoIHdvbid0IGFjdHVhbGx5IGRvIGFueXRoaW5nIGJ1
dCBpdAo+IEBAIC0xMTY2LDYgKzExNjgsOCBAQCBzdGF0aWMgaW50IGE2eHhfZ211X3B3cmxldmVs
c19wcm9iZShzdHJ1Y3QgYTZ4eF9nbXUgKmdtdSkKPiAgCWdtdS0+bnJfZ3B1X2ZyZXFzID0gYTZ4
eF9nbXVfYnVpbGRfZnJlcV90YWJsZSgmZ3B1LT5wZGV2LT5kZXYsCj4gIAkJZ211LT5ncHVfZnJl
cXMsIEFSUkFZX1NJWkUoZ211LT5ncHVfZnJlcXMpKTsKPiAgCj4gKwlnbXUtPmN1cnJlbnRfcGVy
Zl9pbmRleCA9IGdtdS0+bnJfZ3B1X2ZyZXFzIC0gMTsKPiArCj4gIAkvKiBCdWlsZCB0aGUgbGlz
dCBvZiBSUE1oIHZvdGVzIHRoYXQgd2UnbGwgc2VuZCB0byB0aGUgR01VICovCj4gIAlyZXR1cm4g
YTZ4eF9nbXVfcnBtaF92b3Rlc19pbml0KGdtdSk7Cj4gIH0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuaCBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRy
ZW5vL2E2eHhfZ211LmgKPiBpbmRleCAzOWEyNmRkNjM2NzQuLjJhZjkxZWQ3ZWQwYyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5oCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuaAo+IEBAIC02Myw2ICs2Myw5IEBAIHN0
cnVjdCBhNnh4X2dtdSB7Cj4gIAlzdHJ1Y3QgY2xrX2J1bGtfZGF0YSAqY2xvY2tzOwo+ICAJc3Ry
dWN0IGNsayAqY29yZV9jbGs7Cj4gIAo+ICsJLyogY3VycmVudCBwZXJmb3JtYW5jZSBpbmRleCBz
ZXQgZXh0ZXJuYWxseSAqLwo+ICsJaW50IGN1cnJlbnRfcGVyZl9pbmRleDsKPiArCj4gIAlpbnQg
bnJfZ3B1X2ZyZXFzOwo+ICAJdW5zaWduZWQgbG9uZyBncHVfZnJlcXNbMTZdOwo+ICAJdTMyIGd4
X2FyY192b3Rlc1sxNl07Cj4gLS0gCj4gMi4yMy4wCj4gCgotLSAKVGhlIFF1YWxjb21tIElubm92
YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIENvZGUgQXVyb3JhIEZvcnVtLAphIExp
bnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
