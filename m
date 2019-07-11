Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6AE65FBA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 20:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581A86E27E;
	Thu, 11 Jul 2019 18:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A856E273;
 Thu, 11 Jul 2019 18:47:33 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 641F960E7A; Thu, 11 Jul 2019 18:47:33 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8C0E160E57;
 Thu, 11 Jul 2019 18:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8C0E160E57
Date: Thu, 11 Jul 2019 12:47:29 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/dpu: remove dpu_mdss:hwversion
Message-ID: <20190711184729.GC26247@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Jayant Shekhar <jshekhar@codeaurora.org>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20190630131445.25712-1-robdclark@gmail.com>
 <20190630131445.25712-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190630131445.25712-3-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562870853;
 bh=sIf85qt6fGhqNhD9KR+F6pvXY2yVgu3Wm2WY/oV+PR8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zdsr9eeXuJv+kG+dvZQRz5HdDo9SJabMlhSgxEHt1opiPvpGY5Y3IGaaM0pMKq4Od
 W851rP2UmKqBsUZ6FaFazRRgSPh8Uct68C/kTOF9XOp/FcEy6ydw05G0MQzHsMTj+A
 NXIeHy2R5ZHAzh8V0ZAnbmgdDT1+JdWeGI8TFELg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562870852;
 bh=sIf85qt6fGhqNhD9KR+F6pvXY2yVgu3Wm2WY/oV+PR8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b6RRDe3V9ulvyAE6NCTh2YNTaatOsYq4SQXp76x2z7KC32m7jG0rIkkdsPFmnMmN7
 VC8pWcXHhOorEdRwNcP0VUl56e3eSo6z/AnqR45h0LLdieVbWvWKhLFg8g832s8LgH
 FgAchtis5/E+CO/QtqFgh11OrU34vl7KU5dvuwxo=
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Jayant Shekhar <jshekhar@codeaurora.org>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgMDY6MTQ6NDJBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAKPiBVbnVzZWQg
YW5kIHRoZSBleHRyYSBycG0gZ2V0L3B1dCBpbnRlcmZlcmVzIHdpdGggaGFuZG92ZXIgZnJvbQo+
IGJvb3Rsb2FkZXIgKGllLiBoYXBwZW5zIGJlZm9yZSB3ZSBoYXZlIGEgY2hhbmNlIHRvIGNoZWNr
IGlmCj4gdGhpbmdzIGFyZSBhbHJlYWR5IGVuYWJsZWQpLgoKWWF5IGZvciBub3QgdHVybmluZyBv
biB0aGUgaGFyZHdhcmUgYmVmb3JlIHdlIG5lZWQgdG8uCgpSZXZpZXdlZC1ieTogSm9yZGFuIENy
b3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KCj4gU2lnbmVkLW9mZi1ieTogUm9iIENsYXJr
IDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvZHB1MS9kcHVfbWRzcy5jIHwgNSAtLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1
X21kc3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9tZHNzLmMKPiBpbmRl
eCA5ODY5MTViYmJjMDIuLmU4M2RkNGM2ZWM1OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvZHB1MS9kcHVfbWRzcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL2RwdTEvZHB1X21kc3MuYwo+IEBAIC0yMiw3ICsyMiw2IEBAIHN0cnVjdCBkcHVfbWRzcyB7
Cj4gIAlzdHJ1Y3QgbXNtX21kc3MgYmFzZTsKPiAgCXZvaWQgX19pb21lbSAqbW1pbzsKPiAgCXVu
c2lnbmVkIGxvbmcgbW1pb19sZW47Cj4gLQl1MzIgaHd2ZXJzaW9uOwo+ICAJc3RydWN0IGRzc19t
b2R1bGVfcG93ZXIgbXA7Cj4gIAlzdHJ1Y3QgZHB1X2lycV9jb250cm9sbGVyIGlycV9jb250cm9s
bGVyOwo+ICAJc3RydWN0IGljY19wYXRoICpwYXRoWzJdOwo+IEBAIC0yODcsMTAgKzI4Niw2IEBA
IGludCBkcHVfbWRzc19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4gIAo+ICAJZHB1X21k
c3NfaWNjX3JlcXVlc3RfYncocHJpdi0+bWRzcyk7Cj4gIAo+IC0JcG1fcnVudGltZV9nZXRfc3lu
YyhkZXYtPmRldik7Cj4gLQlkcHVfbWRzcy0+aHd2ZXJzaW9uID0gcmVhZGxfcmVsYXhlZChkcHVf
bWRzcy0+bW1pbyk7Cj4gLQlwbV9ydW50aW1lX3B1dF9zeW5jKGRldi0+ZGV2KTsKPiAtCj4gIAly
ZXR1cm4gcmV0Owo+ICAKPiAgaXJxX2Vycm9yOgo+IC0tIAo+IDIuMjAuMQo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gRnJlZWRyZW5vIG1haWxp
bmcgbGlzdAo+IEZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwoKLS0gClRoZSBRdWFs
Y29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1lbWJlciBvZiBDb2RlIEF1cm9yYSBG
b3J1bSwKYSBMaW51eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJvamVjdApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
