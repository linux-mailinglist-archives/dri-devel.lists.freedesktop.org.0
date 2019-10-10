Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8B7D212C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 08:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB60289F8B;
	Thu, 10 Oct 2019 06:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3622F6EA88
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 04:00:12 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id p30so2784662pgl.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 21:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=A9so9NzeHO42VwWr5hvpwtUD9ohInwQ0WN2EfuSCaYQ=;
 b=lf4H3FjN3xOySMTifhBNOIJ98Ik90NVgWnB2hIN7eiSWgi4I4uYeLyPqkvfKhrumtb
 1pnk86Cpmvp5RIMnYDafhF+zg/VKrfx+s2UTwbgbI3UK+ptGLzVGXjD98+jv2JC6zzh+
 cFDTGxa/Tny1MXTP1dp9CfxLh10mcCDjmLEY/JtyA/qwSjWy8Yve/VXmgM/kf1a6uS8h
 fr4H8OD3AR8TkzgHpSthtkDAlWCKSNr5z15cnhfmyG5bFI0CKD+h2ASfGnNr9CEz74Z6
 2CVwbAZjJADtvQyj6zg7BbtgZy3x/UTgHBqeY76fASiLDKKCYkWFqYNGvnVvN3XjojNf
 yQZA==
X-Gm-Message-State: APjAAAWN+Pa23cSsyKmqvC9oIYKpD9y0dTNDHP3ba12WmkGaW3stt20M
 Ng7GByfUaksB4Qq3CABb04TKJg==
X-Google-Smtp-Source: APXvYqyMCqNfgvu9rSzgpLBith2VQ2EjFXAb8ru9qakTkbGzpJFfAzqmKezZYqlKdqVa6ckEkHpirA==
X-Received: by 2002:a17:90a:718a:: with SMTP id
 i10mr8374336pjk.54.1570680011597; 
 Wed, 09 Oct 2019 21:00:11 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id o185sm4296079pfg.136.2019.10.09.21.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 21:00:10 -0700 (PDT)
Date: Wed, 9 Oct 2019 21:00:08 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: zhengbin <zhengbin13@huawei.com>
Subject: Re: [PATCH] drm/msm/mdp5: Remove set but not used variable 'hw_cfg'
 in modeset_init
Message-ID: <20191010040008.GP6390@tuxbook-pro>
References: <1570630403-92371-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1570630403-92371-1-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Thu, 10 Oct 2019 06:55:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=A9so9NzeHO42VwWr5hvpwtUD9ohInwQ0WN2EfuSCaYQ=;
 b=s4W0J/XFJ7RamPtActqgeS4CLDn8XfPdVYh0M1LVeYXO9BPvLAFSv83QwINQYNhoPR
 gtMN5d1eJFZuU2/E7j42QEeL5oOUuOlRmv5mJ8xO0gKZRlqiwCxJSbmwlISC7IORvVCw
 qQ3upCAthSxLtiGZfhyYeaT8i3hT9qXa/QfYVkKrITAPKXZyDREy0BdKKsrsMY4LuDaW
 DWrdEHCKhZo9xVDDQKWxsMDtwJbmO8/QkrpnnseUYlMZgA5za6ghnVVEYSK+qWw4mabD
 ZYUEZ58tRZxuvChDkxXbsLCqvKUy+ABN39s9bQncQh2OIGcapstEcSKwW/jZ3fCK6J5H
 FanA==
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
Cc: sean@poorly.run, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkIDA5IE9jdCAwNzoxMyBQRFQgMjAxOSwgemhlbmdiaW4gd3JvdGU6Cgo+IEZpeGVzIGdj
YyAnLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZScgd2FybmluZzoKPiAKPiBkcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jOiBJbiBmdW5jdGlvbiBtb2Rlc2V0X2luaXQ6Cj4g
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYzo0NTg6Mjg6IHdhcm5pbmc6
IHZhcmlhYmxlIGh3X2NmZyBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlh
YmxlXQo+IAo+IEl0IGlzIG5vdCB1c2VkIHNpbmNlIGNvbW1pdCAzNmQxMzY0YWJiZWQgKCJkcm0v
bXNtL21kcDU6Cj4gQ2xlYW4gdXAgaW50ZXJmYWNlIGFzc2lnbm1lbnQiKQo+IAo+IFJlcG9ydGVk
LWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiB6aGVu
Z2JpbiA8emhlbmdiaW4xM0BodWF3ZWkuY29tPgoKUmV2aWV3ZWQtYnk6IEJqb3JuIEFuZGVyc3Nv
biA8Ympvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jIHwgMyAtLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1
L21kcDVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jCj4g
aW5kZXggZjhiZDBiZi4uNTQ3Njg5MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvbWRwNS9tZHA1X2ttcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21k
cDUvbWRwNV9rbXMuYwo+IEBAIC00NjEsMTQgKzQ2MSwxMSBAQCBzdGF0aWMgaW50IG1vZGVzZXRf
aW5pdChzdHJ1Y3QgbWRwNV9rbXMgKm1kcDVfa21zKQo+ICB7Cj4gIAlzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2ID0gbWRwNV9rbXMtPmRldjsKPiAgCXN0cnVjdCBtc21fZHJtX3ByaXZhdGUgKnByaXYg
PSBkZXYtPmRldl9wcml2YXRlOwo+IC0JY29uc3Qgc3RydWN0IG1kcDVfY2ZnX2h3ICpod19jZmc7
Cj4gIAl1bnNpZ25lZCBpbnQgbnVtX2NydGNzOwo+ICAJaW50IGksIHJldCwgcGkgPSAwLCBjaSA9
IDA7Cj4gIAlzdHJ1Y3QgZHJtX3BsYW5lICpwcmltYXJ5W01BWF9CQVNFU10gPSB7IE5VTEwgfTsK
PiAgCXN0cnVjdCBkcm1fcGxhbmUgKmN1cnNvcltNQVhfQkFTRVNdID0geyBOVUxMIH07Cj4gCj4g
LQlod19jZmcgPSBtZHA1X2NmZ19nZXRfaHdfY29uZmlnKG1kcDVfa21zLT5jZmcpOwo+IC0KPiAg
CS8qCj4gIAkgKiBDb25zdHJ1Y3QgZW5jb2RlcnMgYW5kIG1vZGVzZXQgaW5pdGlhbGl6ZSBjb25u
ZWN0b3IgZGV2aWNlcwo+ICAJICogZm9yIGVhY2ggZXh0ZXJuYWwgZGlzcGxheSBpbnRlcmZhY2Uu
Cj4gLS0KPiAyLjcuNAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
