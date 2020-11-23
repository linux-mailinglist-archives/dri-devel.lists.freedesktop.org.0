Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3392C173B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 22:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCA96E0DA;
	Mon, 23 Nov 2020 21:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECA06E0DA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 21:07:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606165650; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FdKrt5CvzTP/ssLP4rRCX6O+jYFh6N5XUhxBj14QiFw=;
 b=uLh6FPCX5/kEbKZoyXu24Dqdpw9jSpSqgEDsQQEMwDtbmIlyzBEFOCHof0PXK2tNLcXZPh/m
 Q1EYHUU6VqEldflXILBiwnAgBh6FBTR46+fob0goPZpxrnmFaAdujZRAzhoHK4OFEGsueohx
 ZZLNfqWDi97pbtel39B2xVI5+Ik=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5fbc2485a5a29b56a1acdfc4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 21:07:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4AD80C43468; Mon, 23 Nov 2020 21:07:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2DFA3C43462;
 Mon, 23 Nov 2020 21:07:16 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 23 Nov 2020 13:07:16 -0800
From: abhinavk@codeaurora.org
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [Freedreno] [PATCH 13/40] drm/msm/disp/dpu1/dpu_hw_catalog:
 Remove duplicated initialisation of 'max_linewidth'
In-Reply-To: <20201123111919.233376-14-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-14-lee.jones@linaro.org>
Message-ID: <a5dfd401fb36840bea08c496ffea8dc7@codeaurora.org>
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
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0xMS0yMyAwMzoxOCwgTGVlIEpvbmVzIHdyb3RlOgo+IEZpeGVzIHRoZSBmb2xsb3dp
bmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvZHB1MS9kcHVfaHdfY2F0YWxvZy5jOjEyNDoxOTogd2FybmluZzoKPiBpbml0aWFsaXpl
ZCBmaWVsZCBvdmVyd3JpdHRlbiBbLVdvdmVycmlkZS1pbml0XQo+ICBkcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvZHB1MS9kcHVfaHdfY2F0YWxvZy5jOjEyNDoxOTogbm90ZTogKG5lYXIKPiBpbml0
aWFsaXphdGlvbiBmb3Ig4oCYc204MjUwX2RwdV9jYXBzLm1heF9saW5ld2lkdGjigJkpCj4gCj4g
Q2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KPiBDYzogU2VhbiBQYXVsIDxzZWFu
QHBvb3JseS5ydW4+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBsaW51eC1hcm0tbXNtQHZnZXIu
a2VybmVsLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGZy
ZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogQWJoaW5hdiBLdW1hciA8YWJoaW5h
dmtAY29kZWF1cm9yYS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV9od19jYXRhbG9nLmMgfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2Nh
dGFsb2cuYwo+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2NhdGFsb2cu
Ywo+IGluZGV4IDZhNmE3MTcyZTNiZWIuLmE3MDA0ZjE4NTIzYjAgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2NhdGFsb2cuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19jYXRhbG9nLmMKPiBAQCAtMTEzLDcgKzEx
Myw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHB1X2NhcHMgc204MTUwX2RwdV9jYXBzID0gewo+
ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRwdV9jYXBzIHNtODI1MF9kcHVfY2FwcyA9IHsKPiAgCS5t
YXhfbWl4ZXJfd2lkdGggPSBERUZBVUxUX0RQVV9PVVRQVVRfTElORV9XSURUSCwKPiAgCS5tYXhf
bWl4ZXJfYmxlbmRzdGFnZXMgPSAweGIsCj4gLQkubWF4X2xpbmV3aWR0aCA9IDQwOTYsCj4gIAku
cXNlZWRfdHlwZSA9IERQVV9TU1BQX1NDQUxFUl9RU0VFRDMsIC8qIFRPRE86IHFzZWVkMyBsaXRl
ICovCj4gIAkuc21hcnRfZG1hX3JldiA9IERQVV9TU1BQX1NNQVJUX0RNQV9WMiwgLyogVE9ETzog
djIuNSAqLwo+ICAJLnVid2NfdmVyc2lvbiA9IERQVV9IV19VQldDX1ZFUl80MCwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
