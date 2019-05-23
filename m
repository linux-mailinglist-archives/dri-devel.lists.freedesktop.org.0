Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F4628BE7
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 22:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00166E072;
	Thu, 23 May 2019 20:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4387E6E072;
 Thu, 23 May 2019 20:52:30 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 33E1E60E42; Thu, 23 May 2019 20:52:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EC2EA60C8B;
 Thu, 23 May 2019 20:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EC2EA60C8B
Date: Thu, 23 May 2019 14:52:27 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v2 5/6] drm/msm/a6xx: Drop the device reference in gmu
Message-ID: <20190523205226.GF18360@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org
References: <20190523171653.138678-1-sean@poorly.run>
 <20190523171653.138678-5-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523171653.138678-5-sean@poorly.run>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558644750;
 bh=/UkhJ93ZONFLE39bSDbU+e/YiFVV3dmUDhxYaiPXzSw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K+me+D0UtBPA5O+yXWDS85YshekNJY1dvt2JHRun6D5CkFUISHahCUrrvNFk12692
 DJ8xywHQYL/oTYi7h1EGukn6Z8BtCRcK1R+aNLVcJdj0dPZk+Kv3Eybu/5ponTaFpv
 ycGOS80xNGzeUvzA8UmYEf9cmkY9rFk7aTllWor8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558644749;
 bh=/UkhJ93ZONFLE39bSDbU+e/YiFVV3dmUDhxYaiPXzSw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U42BPFA7vqS82Nn6/2voaQrRpN79EvQajEnwamQTVvn1WPeHtoaFRNNaeETP5+fEz
 GHqko3Xb2EbPgmRgLU7p4VD0HpilqYtKzKzt9HVu/brLoQPl3YXhyc0w+CHyVlyVCI
 OWReVsSzmO+wqtsoAeF1h6edDrG2RCTWJDpSzS7Q=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: Sean Paul <seanpaul@chromium.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDE6MTY6NDRQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IG9mX2ZpbmRf
ZGV2aWNlX2J5X25vZGUoKSBncmFicyBhIGRldiByZWZlcmVuY2UsIHNvIG1ha2Ugc3VyZSB3ZSBj
bGVhciBpdAo+IG9uIGVycm9yIGFuZCByZW1vdmUuCj4gCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIEFk
ZGVkIHRvIHRoZSBzZXQgKEpvcmRhbikKPiAKPiBDYzogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBj
b2RlYXVyb3JhLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9t
aXVtLm9yZz4KClJldmlld2VkLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEu
b3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jIHwgMTQg
KysrKysrKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2
eHhfZ211LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jCj4gaW5kZXgg
ZjcyNDBjOWUxMWZiLi5lMmI4MzliNWQzYmQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21zbS9hZHJlbm8vYTZ4eF9nbXUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5v
L2E2eHhfZ211LmMKPiBAQCAtMTI1Myw2ICsxMjUzLDkgQEAgdm9pZCBhNnh4X2dtdV9yZW1vdmUo
c3RydWN0IGE2eHhfZ3B1ICphNnh4X2dwdSkKPiAgCWZyZWVfaXJxKGdtdS0+Z211X2lycSwgZ211
KTsKPiAgCWZyZWVfaXJxKGdtdS0+aGZpX2lycSwgZ211KTsKPiAgCj4gKwkvKiBEcm9wIHJlZmVy
ZW5jZSB0YWtlbiBpbiBvZl9maW5kX2RldmljZV9ieV9ub2RlICovCj4gKwlwdXRfZGV2aWNlKGdt
dS0+ZGV2KTsKPiArCj4gIAlnbXUtPmluaXRpYWxpemVkID0gZmFsc2U7Cj4gIH0KPiAgCj4gQEAg
LTEyNzcsMTIgKzEyODAsMTIgQEAgaW50IGE2eHhfZ211X3Byb2JlKHN0cnVjdCBhNnh4X2dwdSAq
YTZ4eF9ncHUsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSkKPiAgCS8qIEdldCB0aGUgbGlzdCBv
ZiBjbG9ja3MgKi8KPiAgCXJldCA9IGE2eHhfZ211X2Nsb2Nrc19wcm9iZShnbXUpOwo+ICAJaWYg
KHJldCkKPiAtCQlyZXR1cm4gcmV0Owo+ICsJCWdvdG8gZXJyX3B1dF9kZXZpY2U7Cj4gIAo+ICAJ
LyogU2V0IHVwIHRoZSBJT01NVSBjb250ZXh0IGJhbmsgKi8KPiAgCXJldCA9IGE2eHhfZ211X21l
bW9yeV9wcm9iZShnbXUpOwo+ICAJaWYgKHJldCkKPiAtCQlyZXR1cm4gcmV0Owo+ICsJCWdvdG8g
ZXJyX3B1dF9kZXZpY2U7Cj4gIAo+ICAJLyogQWxsb2NhdGUgbWVtb3J5IGZvciBmb3IgdGhlIEhG
SSBxdWV1ZXMgKi8KPiAgCWdtdS0+aGZpID0gYTZ4eF9nbXVfbWVtb3J5X2FsbG9jKGdtdSwgU1pf
MTZLKTsKPiBAQCAtMTMzNCw2ICsxMzM3LDExIEBAIGludCBhNnh4X2dtdV9wcm9iZShzdHJ1Y3Qg
YTZ4eF9ncHUgKmE2eHhfZ3B1LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpCj4gIAo+ICAJCWlv
bW11X2RvbWFpbl9mcmVlKGdtdS0+ZG9tYWluKTsKPiAgCX0KPiArCXJldCA9IC1FTk9ERVY7Cj4g
IAo+IC0JcmV0dXJuIC1FTk9ERVY7Cj4gK2Vycl9wdXRfZGV2aWNlOgo+ICsJLyogRHJvcCByZWZl
cmVuY2UgdGFrZW4gaW4gb2ZfZmluZF9kZXZpY2VfYnlfbm9kZSAqLwo+ICsJcHV0X2RldmljZShn
bXUtPmRldik7Cj4gKwo+ICsJcmV0dXJuIHJldDsKPiAgfQo+IC0tIAo+IFNlYW4gUGF1bCwgU29m
dHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCj4gCgotLSAKVGhlIFF1YWxjb21t
IElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIENvZGUgQXVyb3JhIEZvcnVt
LAphIExpbnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
