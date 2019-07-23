Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E59714B5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 11:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6DF89BD2;
	Tue, 23 Jul 2019 09:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A6389BD2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 09:12:04 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k21so43157706edq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 02:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=CUaLpMwjN+04mbedwWGjJycg6zciRce+Wx0QmHNnWG4=;
 b=hErXhX5EdmNsWcS7nmAa/Mja9q9rkICKY1uogF7Y7S9fCrNf5Ym4m0N+cWcsaoRAop
 uyLk4aeDDw+hPvMC8ZIkqsX+D61C19RiKlqsLI9qi5+35b4hfxevUOdtETQC1+Q89Ggq
 sd0+0fP8U3oF4dn8mR4v6gKf7gvsDIRSqcmdu4qAhZuVXZDpLEaEBD/oQjVGKMW/jxio
 rcS5YWypFOY1QLYycznE12dGZJYSnPd7bABrcPxsG5GgjfPdQtIe8ubqczEzBontWrOH
 k7m42ytvy1LuZxh/j1Q+okUUNbqED40347Hovmu1cILC9wl6iHueoY6yWGRYXYZK0lGR
 ERHQ==
X-Gm-Message-State: APjAAAWhl1+svtBe1YS0awb83ytb7qRDjBY6spDP0ztsGAzizt/5yV6j
 5kPZ6j7dGAwwMybt2z0oT7tR6mBBx9c=
X-Google-Smtp-Source: APXvYqyaNJ3RQfSE2Pc1ybxHU3JCZh30J9KHaIqNg/prriesBVnHAogUbD1aX5HDn5wGSbe77/RVoQ==
X-Received: by 2002:a17:906:802:: with SMTP id
 e2mr56439719ejd.59.1563873123345; 
 Tue, 23 Jul 2019 02:12:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id j7sm12201109eda.97.2019.07.23.02.12.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 02:12:02 -0700 (PDT)
Date: Tue, 23 Jul 2019 11:12:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH v2 -next] drm/komeda: remove set but not used variable
 'old'
Message-ID: <20190723091200.GV15868@phenom.ffwll.local>
Mail-Followup-To: YueHaibing <yuehaibing@huawei.com>,
 james.qian.wang@arm.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20190709135808.56388-1-yuehaibing@huawei.com>
 <20190722055627.38008-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722055627.38008-1-yuehaibing@huawei.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=CUaLpMwjN+04mbedwWGjJycg6zciRce+Wx0QmHNnWG4=;
 b=TfONsWXYMwUcKzbOc8dKiNMQy8TYUdmIoQw/WUQlxLxyyqCngcQdKbl1KNZvwnRRmf
 V0Maw3YkBT1ufYSMhG0xxoGE+vXwEZjs2ykDFBEW8e+OelNOqTpqhvG0uYj8FmXI5E8H
 QEYLqpAvH3nB6cOCBYZ4iWkKi/bSmbObu2coI=
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, james.qian.wang@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDE6NTY6MjdQTSArMDgwMCwgWXVlSGFpYmluZyB3cm90
ZToKPiBGaXhlcyBnY2MgJy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4gCj4g
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYzoKPiAgSW4g
ZnVuY3Rpb24ga29tZWRhX3BsYW5lX2F0b21pY19kdXBsaWNhdGVfc3RhdGU6Cj4gZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYzoxNjE6MzU6Cj4gIHdhcm5p
bmc6IHZhcmlhYmxlIG9sZCBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlh
YmxlCj4gCj4gSXQgaXMgbm90IHVzZWQgc2luY2UgY29tbWl0IDk5MGRlZTNhYTQ1NiAoImRybS9r
b21lZGE6Cj4gQ29tcHV0aW5nIGltYWdlIGVuaGFuY2VyIGludGVybmFsbHkiKQo+IAo+IFJlcG9y
dGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBZ
dWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+Cj4gLS0tCj4gdjI6IGZpeCBjb21waWxl
IGVycgoKT2sgdGhpcyBvbmUgd29ya2VkLCBhcHBsaWVkLgoKVGhhbmtzLCBEYW5pZWwKCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMgfCA0
ICstLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxh
bmUuYwo+IGluZGV4IGMwOTVhZjEuLjk4ZTkxNWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMKPiBAQCAtMTU4LDcgKzE1OCw3
IEBAIHN0YXRpYyB2b2lkIGtvbWVkYV9wbGFuZV9yZXNldChzdHJ1Y3QgZHJtX3BsYW5lICpwbGFu
ZSkKPiAgc3RhdGljIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKgo+ICBrb21lZGFfcGxhbmVfYXRv
bWljX2R1cGxpY2F0ZV9zdGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSkKPiAgewo+IC0Jc3Ry
dWN0IGtvbWVkYV9wbGFuZV9zdGF0ZSAqbmV3LCAqb2xkOwo+ICsJc3RydWN0IGtvbWVkYV9wbGFu
ZV9zdGF0ZSAqbmV3Owo+ICAKPiAgCWlmIChXQVJOX09OKCFwbGFuZS0+c3RhdGUpKQo+ICAJCXJl
dHVybiBOVUxMOwo+IEBAIC0xNjksOCArMTY5LDYgQEAga29tZWRhX3BsYW5lX2F0b21pY19kdXBs
aWNhdGVfc3RhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCj4gIAo+ICAJX19kcm1fYXRvbWlj
X2hlbHBlcl9wbGFuZV9kdXBsaWNhdGVfc3RhdGUocGxhbmUsICZuZXctPmJhc2UpOwo+ICAKPiAt
CW9sZCA9IHRvX2twbGFuZV9zdChwbGFuZS0+c3RhdGUpOwo+IC0KPiAgCXJldHVybiAmbmV3LT5i
YXNlOwo+ICB9Cj4gIAo+IC0tIAo+IDIuNy40Cj4gCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0
d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
