Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2412B24DF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 20:46:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421D26E825;
	Fri, 13 Nov 2020 19:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF7C6E825
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 19:46:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1605296808; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=XQR2DizaqucPQpeF3S73VOOHiAuFQxlGivhbcgxWTSo=;
 b=StremGYGbhqNIvOyniEMaPng5fekn0bw6VesngHuCLhhDdfO4xVzxvLdXbYGRGsQ/cO3/ynW
 rb/tzYjP2Nu/VeFsOy00Wm5rYcm6HFyf53q1TE4Lx/kDN3l3oTeutMoUmA4eDIJqUMGcRBpH
 FT2AyR9ZThmw4ZPjrk5nvlUDduk=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5faee2a16c42d983b97f8d22 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 13 Nov 2020 19:46:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B1B79C433C8; Fri, 13 Nov 2020 19:46:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 57163C433C6;
 Fri, 13 Nov 2020 19:46:40 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 13 Nov 2020 11:46:40 -0800
From: abhinavk@codeaurora.org
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 35/40] drm/msm/disp/mdp5/mdp5_kms: Make local functions
 'mdp5_{en, dis}able()' static
In-Reply-To: <20201113134938.4004947-36-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-36-lee.jones@linaro.org>
Message-ID: <cf160e1968c0473501e66e163c4c6beb@codeaurora.org>
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
L2Rpc3AvbWRwNS9tZHA1X2ttcy5jOjI5OTo1OiB3YXJuaW5nOiBubyBwcmV2aW91cwo+IHByb3Rv
dHlwZSBmb3Ig4oCYbWRwNV9kaXNhYmxl4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgZHJp
dmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYzozMTk6NTogd2FybmluZzogbm8g
cHJldmlvdXMKPiBwcm90b3R5cGUgZm9yIOKAmG1kcDVfZW5hYmxl4oCZIFstV21pc3NpbmctcHJv
dG90eXBlc10KPiAKPiBDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgo+IENjOiBT
ZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxp
bnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IENjOiBsaW51eC1hcm0tbXNtQHZn
ZXIua2VybmVsLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6
IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9u
ZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogQWJoaW5hdiBLdW1hciA8YWJo
aW5hdmtAY29kZWF1cm9yYS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9t
ZHA1L21kcDVfa21zLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL21kcDUvbWRwNV9rbXMuYwo+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRw
NV9rbXMuYwo+IGluZGV4IGIzZWVjZjg2OTQ3NzEuLjE1YWVkNDUwMjJiYzggMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMKPiBAQCAtMjk2LDcgKzI5Niw3IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWRwX2ttc19mdW5jcyBrbXNfZnVuY3MgPSB7Cj4gIAkuc2V0
X2lycW1hc2sgICAgICAgICA9IG1kcDVfc2V0X2lycW1hc2ssCj4gIH07Cj4gCj4gLWludCBtZHA1
X2Rpc2FibGUoc3RydWN0IG1kcDVfa21zICptZHA1X2ttcykKPiArc3RhdGljIGludCBtZHA1X2Rp
c2FibGUoc3RydWN0IG1kcDVfa21zICptZHA1X2ttcykKPiAgewo+ICAJREJHKCIiKTsKPiAKPiBA
QCAtMzE2LDcgKzMxNiw3IEBAIGludCBtZHA1X2Rpc2FibGUoc3RydWN0IG1kcDVfa21zICptZHA1
X2ttcykKPiAgCXJldHVybiAwOwo+ICB9Cj4gCj4gLWludCBtZHA1X2VuYWJsZShzdHJ1Y3QgbWRw
NV9rbXMgKm1kcDVfa21zKQo+ICtzdGF0aWMgaW50IG1kcDVfZW5hYmxlKHN0cnVjdCBtZHA1X2tt
cyAqbWRwNV9rbXMpCj4gIHsKPiAgCURCRygiIik7Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
