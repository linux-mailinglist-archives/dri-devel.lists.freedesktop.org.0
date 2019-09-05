Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D57FCAA934
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 18:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF166E0AA;
	Thu,  5 Sep 2019 16:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB7D6E0AA
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 16:38:21 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id B4663606E1; Thu,  5 Sep 2019 16:38:21 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 107E8606E1;
 Thu,  5 Sep 2019 16:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 107E8606E1
Date: Thu, 5 Sep 2019 10:38:18 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Do not print error on
 "qcom,gpu-pwrlevels" absence
Message-ID: <20190905163818.GA32558@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Fabio Estevam <festevam@gmail.com>, robdclark@gmail.com,
 sean@poorly.run, jonathan@marek.ca, cphealy@gmail.com,
 dri-devel@lists.freedesktop.org, l.stach@pengutronix.de
References: <20190905111648.11559-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190905111648.11559-1-festevam@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1567701501;
 bh=AlNWYB3epxDz35ahhul5dRy9SeRaPv4p+3JpcHLEAY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AdeJuzvCkSDRHD6Orie2QChPEFRwt0OghL53qr3mDS/AF8zeoZXkapK/7EAyNgFv7
 NtdgZ8a/MO3xKNd/SZQD7Tl85FXPOtX95qmpQKylRNLe74UKSovDwLXRqMJ6SKSa6a
 82uK4a2/4i9IUncBZ4yVKC0N0SwBBYDajyty1zmQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1567701500;
 bh=AlNWYB3epxDz35ahhul5dRy9SeRaPv4p+3JpcHLEAY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i1yTTZul/rQckcK3ulX+0M2EYWiwngNHh3YwblEUyPaiM1UW3zngLaBgkR/gQvbGZ
 cF0Vh3dh7bM4K2mj1FaK0Swyh3lyNvNZT9xEUZvcDl53EbXNcUdr7OttXUIkO90dKd
 B76C0zwLVA1t49+Kk8ZxdFCndzMVmQQR+tyIUsms=
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
Cc: jonathan@marek.ca, dri-devel@lists.freedesktop.org, sean@poorly.run,
 cphealy@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMDg6MTY6NDhBTSAtMDMwMCwgRmFiaW8gRXN0ZXZhbSB3
cm90ZToKPiBCb290aW5nIHRoZSBhZHJlbm8gZHJpdmVyIG9uIGEgaW14NTMgYm9hcmQgbGVhZHMg
dG8gdGhlIGZvbGxvd2luZwo+IGVycm9yIG1lc3NhZ2U6Cj4gCj4gYWRyZW5vIDMwMDAwMDAwLmdw
dTogW2RybTphZHJlbm9fZ3B1X2luaXRdICpFUlJPUiogQ291bGQgbm90IGZpbmQgdGhlIEdQVSBw
b3dlcmxldmVscwo+IAo+IEFzIHRoZSAicWNvbSxncHUtcHdybGV2ZWxzIiBwcm9wZXJ0eSBpcyBv
cHRpb25hbCBhbmQgbmV2ZXIgcHJlc2VudCBvbgo+IGkuTVg1LCB0dXJuIHRoZSBtZXNzYWdlIGlu
dG8gZGVidWcgbGV2ZWwgaW5zdGVhZC4KClNvdW5kcyBsZWdpdCB0byBtZS4gVGhpcyBpcyBtYWlu
bHkgZm9yIGNvbXBhdGliaWxpdHkgd2l0aCBkb3duc3RyZWFtIGRldmljZSB0cmVlCmZpbGVzIGFu
ZCB0aGUgZm9sa3MgZG9pbmcgRFJNIG9uIEFuZHJvaWQgc2hvdWxkIGtub3cgd2hhdCB0aGV5IGFy
ZSBkb2luZy4KClJldmlld2VkLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEu
b3JnPgoKPiBTaWduZWQtb2ZmLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19ncHUuYyB8IDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19ncHUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19ncHUuYwo+IGluZGV4IDA0OGM4YmU0MjZmMy4u
NzNjNzlmMTYxNGMxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2Fk
cmVub19ncHUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19ncHUu
Ywo+IEBAIC04MjUsNyArODI1LDcgQEAgc3RhdGljIGludCBhZHJlbm9fZ2V0X2xlZ2FjeV9wd3Js
ZXZlbHMoc3RydWN0IGRldmljZSAqZGV2KQo+ICAKPiAgCW5vZGUgPSBvZl9nZXRfY29tcGF0aWJs
ZV9jaGlsZChkZXYtPm9mX25vZGUsICJxY29tLGdwdS1wd3JsZXZlbHMiKTsKPiAgCWlmICghbm9k
ZSkgewo+IC0JCURSTV9ERVZfRVJST1IoZGV2LCAiQ291bGQgbm90IGZpbmQgdGhlIEdQVSBwb3dl
cmxldmVsc1xuIik7Cj4gKwkJRFJNX0RFVl9ERUJVRyhkZXYsICJDb3VsZCBub3QgZmluZCB0aGUg
R1BVIHBvd2VybGV2ZWxzXG4iKTsKPiAgCQlyZXR1cm4gLUVOWElPOwo+ICAJfQo+ICAKPiAtLSAK
PiAyLjE3LjEKPiAKCi0tIApUaGUgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMg
YSBtZW1iZXIgb2YgQ29kZSBBdXJvcmEgRm9ydW0sCmEgTGludXggRm91bmRhdGlvbiBDb2xsYWJv
cmF0aXZlIFByb2plY3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
