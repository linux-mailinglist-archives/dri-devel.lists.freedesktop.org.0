Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6387537D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 18:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7192F6E784;
	Thu, 25 Jul 2019 16:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE876E784;
 Thu, 25 Jul 2019 16:03:52 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 682CB605A5; Thu, 25 Jul 2019 16:03:52 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0C1A06086B;
 Thu, 25 Jul 2019 16:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0C1A06086B
Date: Thu, 25 Jul 2019 10:03:47 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Yue Hu <zbestahu@gmail.com>
Subject: Re: [PATCH RESEND] drm: Switch to use DEVFREQ_GOV_SIMPLE_ONDEMAND
 constant
Message-ID: <20190725160346.GB25162@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Yue Hu <zbestahu@gmail.com>, airlied@linux.ie,
 daniel@ffwll.ch, robdclark@gmail.com, sean@poorly.run,
 robh@kernel.org, tomeu.vizoso@collabora.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, cw00.choi@samsung.com,
 myungjoo.ham@samsung.com, huyue2@yulong.com, zhangwen@yulong.com
References: <20190725035239.1192-1-zbestahu@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725035239.1192-1-zbestahu@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1564070632;
 bh=HDXaB/rW7q3NhbJzyZnv5ZmlVlcc/d4sB5nS46rp6rM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KQxlOrRWPvrUMCmae53NOEZlL4bpBqgvj8tjshsF9DEXv14YNOtuFRrYk167ju4RB
 jM7pyv1tfkMZiUNlLgL+Zw99tC/5NjHYolwHqMWOINZU2VyydCh2Vws8n4cPBpmeyP
 vZOinePkLG43oI+Mtruc6tczsnbcOJJa8fIIIN5o=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1564070631;
 bh=HDXaB/rW7q3NhbJzyZnv5ZmlVlcc/d4sB5nS46rp6rM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=itMOi4yCXHgJR6ppYN/+r7rGmGwbxzE0GMwSUEAtFQTikMUd+WnQSVO6Mwz6aKXA2
 vehbfWwGUEhk84lCesWnxUfMKaJYEl0EjhOEgvD2XCPRBgLZ5IMK0VVLX5nDbSgdQp
 T/oTscM52dvlKNK1ypD92V7XdKgyQT6UdiegBDH8=
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 huyue2@yulong.com, dri-devel@lists.freedesktop.org, cw00.choi@samsung.com,
 myungjoo.ham@samsung.com, zhangwen@yulong.com, freedreno@lists.freedesktop.org,
 sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMTE6NTI6MzlBTSArMDgwMCwgWXVlIEh1IHdyb3RlOgo+
IEZyb206IFl1ZSBIdSA8aHV5dWUyQHl1bG9uZy5jb20+Cj4gCj4gU2luY2UgZ292ZXJub3IgbmFt
ZSBpcyBkZWZpbmVkIGJ5IERFVkZSRVEgZnJhbWV3b3JrIGludGVybmFsbHksIHVzZSB0aGUKPiBt
YWNybyBkZWZpbml0aW9uIGluc3RlYWQgb2YgdXNpbmcgdGhlIG5hbWUgZGlyZWN0bHkuCgpBY2tl
ZC1ieTogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4gZm9yIHRoZSBtc20g
cGFydC4KCj4gU2lnbmVkLW9mZi1ieTogWXVlIEh1IDxodXl1ZTJAeXVsb25nLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMgICAgICAgICAgICAgICB8IDMgKystCj4g
IGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgfCAzICsrLQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMgYi9kcml2ZXJzL2dwdS9kcm0v
bXNtL21zbV9ncHUuYwo+IGluZGV4IDRlZGI4NzQuLmY3MzA4ZDYgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21z
bV9ncHUuYwo+IEBAIC05NSw3ICs5NSw4IEBAIHN0YXRpYyB2b2lkIG1zbV9kZXZmcmVxX2luaXQo
c3RydWN0IG1zbV9ncHUgKmdwdSkKPiAgCSAqLwo+ICAKPiAgCWdwdS0+ZGV2ZnJlcS5kZXZmcmVx
ID0gZGV2bV9kZXZmcmVxX2FkZF9kZXZpY2UoJmdwdS0+cGRldi0+ZGV2LAo+IC0JCQkmbXNtX2Rl
dmZyZXFfcHJvZmlsZSwgInNpbXBsZV9vbmRlbWFuZCIsIE5VTEwpOwo+ICsJCQkmbXNtX2RldmZy
ZXFfcHJvZmlsZSwgREVWRlJFUV9HT1ZfU0lNUExFX09OREVNQU5ELAo+ICsJCQlOVUxMKTsKPiAg
Cj4gIAlpZiAoSVNfRVJSKGdwdS0+ZGV2ZnJlcS5kZXZmcmVxKSkgewo+ICAJCURSTV9ERVZfRVJS
T1IoJmdwdS0+cGRldi0+ZGV2LCAiQ291bGRuJ3QgaW5pdGlhbGl6ZSBHUFUgZGV2ZnJlcVxuIik7
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVx
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCj4gaW5kZXgg
ZGI3OTg1My4uYTdjMThiYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZGV2ZnJlcS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2RldmZyZXEuYwo+IEBAIC0xNTcsNyArMTU3LDggQEAgaW50IHBhbmZyb3N0X2RldmZyZXFf
aW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKPiAgCWRldl9wbV9vcHBfcHV0KG9w
cCk7Cj4gIAo+ICAJcGZkZXYtPmRldmZyZXEuZGV2ZnJlcSA9IGRldm1fZGV2ZnJlcV9hZGRfZGV2
aWNlKCZwZmRldi0+cGRldi0+ZGV2LAo+IC0JCQkmcGFuZnJvc3RfZGV2ZnJlcV9wcm9maWxlLCAi
c2ltcGxlX29uZGVtYW5kIiwgTlVMTCk7Cj4gKwkJCSZwYW5mcm9zdF9kZXZmcmVxX3Byb2ZpbGUs
IERFVkZSRVFfR09WX1NJTVBMRV9PTkRFTUFORCwKPiArCQkJTlVMTCk7Cj4gIAlpZiAoSVNfRVJS
KHBmZGV2LT5kZXZmcmVxLmRldmZyZXEpKSB7Cj4gIAkJRFJNX0RFVl9FUlJPUigmcGZkZXYtPnBk
ZXYtPmRldiwgIkNvdWxkbid0IGluaXRpYWxpemUgR1BVIGRldmZyZXFcbiIpOwo+ICAJCXJldCA9
IFBUUl9FUlIocGZkZXYtPmRldmZyZXEuZGV2ZnJlcSk7Cj4gLS0gCj4gMS45LjEKPiAKCi0tIApU
aGUgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIgb2YgQ29kZSBB
dXJvcmEgRm9ydW0sCmEgTGludXggRm91bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFByb2plY3QKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
