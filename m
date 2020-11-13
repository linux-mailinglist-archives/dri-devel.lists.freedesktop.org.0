Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06582B24CA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 20:43:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCB56E7E5;
	Fri, 13 Nov 2020 19:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1ABD6E7E5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 19:43:39 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1605296620; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=TyQ0mHnntgl9EfCWZQvfvs2r3JqCv/GaZsWL2QQ2T34=;
 b=QCe8kjYwwOGTgJjhGc+0KQuVLLXEcELKoERVgBVNfoJ7pn/Se4Ri+t/eLZZHk/p488L2VPfu
 ddO9D1I/mR5zRbl1pd/n7iCTMj8sAcR1iDJSej6B1fb+EbNz1P52VDU+IQp8D+2b6WWZk6qu
 CvX40zasIeVoMrCGHd1/+G1iZ4U=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5faee1eb9a53d19da94374b5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 13 Nov 2020 19:43:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B642EC433FE; Fri, 13 Nov 2020 19:43:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E4833C433C6;
 Fri, 13 Nov 2020 19:43:38 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 13 Nov 2020 11:43:38 -0800
From: abhinavk@codeaurora.org
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 32/40] drm/msm/disp/mdp5/mdp5_crtc: Make local function
 'mdp5_crtc_setup_pipeline()' static
In-Reply-To: <20201113134938.4004947-33-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-33-lee.jones@linaro.org>
Message-ID: <25c1f9f7bb42feebb08f7a357d78166a@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0xMS0xMyAwNTo0OSwgTGVlIEpvbmVzIHdyb3RlOgo+IEZpeGVzIHRoZSBmb2xsb3dp
bmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvbWRwNS9tZHA1X2NydGMuYzo1ODE6NTogd2FybmluZzogbm8gcHJldmlvdXMKPiBwcm90
b3R5cGUgZm9yIOKAmG1kcDVfY3J0Y19zZXR1cF9waXBlbGluZeKAmSBbLVdtaXNzaW5nLXByb3Rv
dHlwZXNdCj4gCj4gQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KPiBDYzogU2Vh
biBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBDYzogbGludXgtYXJtLW1zbUB2Z2Vy
Lmtlcm5lbC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBm
cmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVz
IDxsZWUuam9uZXNAbGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6IEFiaGluYXYgS3VtYXIgPGFiaGlu
YXZrQGNvZGVhdXJvcmEub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRw
NS9tZHA1X2NydGMuYyB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9tZHA1L21kcDVfY3J0Yy5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9t
ZHA1X2NydGMuYwo+IGluZGV4IDc5ZGQ1NmZhZjNkZTAuLjBjOGY5Zjg4MzAxZmEgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9jcnRjLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NydGMuYwo+IEBAIC01NzgsOSArNTc4
LDkgQEAgc3RhdGljIHZvaWQgbWRwNV9jcnRjX2F0b21pY19lbmFibGUoc3RydWN0IGRybV9jcnRj
IAo+ICpjcnRjLAo+ICAJbWRwNV9jcnRjLT5lbmFibGVkID0gdHJ1ZTsKPiAgfQo+IAo+IC1pbnQg
bWRwNV9jcnRjX3NldHVwX3BpcGVsaW5lKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiAtCQkJICAg
ICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm5ld19jcnRjX3N0YXRlLAo+IC0JCQkgICAgIGJvb2wg
bmVlZF9yaWdodF9taXhlcikKPiArc3RhdGljIGludCBtZHA1X2NydGNfc2V0dXBfcGlwZWxpbmUo
c3RydWN0IGRybV9jcnRjICpjcnRjLAo+ICsJCQkJICAgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAq
bmV3X2NydGNfc3RhdGUsCj4gKwkJCQkgICAgYm9vbCBuZWVkX3JpZ2h0X21peGVyKQo+ICB7Cj4g
IAlzdHJ1Y3QgbWRwNV9jcnRjX3N0YXRlICptZHA1X2NzdGF0ZSA9Cj4gIAkJCXRvX21kcDVfY3J0
Y19zdGF0ZShuZXdfY3J0Y19zdGF0ZSk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
