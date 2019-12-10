Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF9511A6BD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601E16EAB7;
	Wed, 11 Dec 2019 09:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EAE6E059
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 23:20:30 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id z124so9662400pgb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 15:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=wSk6OR3WTe/e4AGOTjWNzGnLtwmeYHBEancCuN3ulzI=;
 b=iT6Ms17KMCQEXudRb9wkMuzZA5MvtDGDu8fcW76Uv4l8Ahfo4/eyFFab0nxnvvl+yD
 0i4DTbbbQdlfvvfH7n2wJgoSsIbl93fXKYxQlGy90RsMJtfSs23Nl/RIpKVQVWnmE6tt
 3t9EowwAwWZ6jTaWipvTC7D3N6r84Lhrqg1DIiT/5BldqHahmWKfMfEELLTcql+bZhw/
 9Nkh5+oilERBlmwkNtOUjS+xPTob+eQWIYR85nZZdwT5IZx5wS0ifSlWilowlh7G3X3f
 2zAFa3PlSvOQnS51c0lzcoeSiuMR/sxl/9EgA3haV196LSqnh217aeiInu6rcl3LhniC
 drAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=wSk6OR3WTe/e4AGOTjWNzGnLtwmeYHBEancCuN3ulzI=;
 b=Pxah+c/ZTDIvEZk0ozGJjjlWTz9ydiNK+MDU4xIyoZLypE5cHOnlJjiJSnxbshqz27
 JuiMQZulaYXIVeSWtiyxhleYoC8jhLzxSfUHY2u+PX0U7WR9vlowWEDVTeGJxc1YmpaB
 3o6U3fuOKRDCG1t8deowBajaiBxpWJ6oSX92cOwMS6vNZu/TqdgkkQiGsngVqMordpDf
 2/BO55VBPtuwBDNDlMyVSDiLmYbdtu/DNenW/T/LbJKNkvuwBR62fpHuQfwbrKINHYLF
 68ldPqtvM5ttJfBThGft7iFwKS9h6x4sgGGXxq/WplySd4/KdsYFW0wwEXTeCO1ERCAV
 eJRQ==
X-Gm-Message-State: APjAAAVAdWqNgUM0H63kTcNNOBtOZxyHwVU7zsx3C7Q8Z/Ys0aw8Gxbl
 tQpSXqDhGcz96f0FroPDOwe4tVnZSrkgqGow
X-Google-Smtp-Source: APXvYqwQgUQaCOzXAnwrbDHZF5DMYjf3yiGkqceqc0GlmQ4ypCx1Y06uS7l8tsTalo+2m3Pjz7Kfqw==
X-Received: by 2002:a63:590e:: with SMTP id n14mr704976pgb.10.1576020029750;
 Tue, 10 Dec 2019 15:20:29 -0800 (PST)
Received: from google.com ([2620:0:1000:2511:b34b:87b6:d099:91b0])
 by smtp.gmail.com with ESMTPSA id u1sm106853pfn.133.2019.12.10.15.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 15:20:29 -0800 (PST)
Date: Tue, 10 Dec 2019 15:20:25 -0800
From: Tom Anderson <thomasanderson@google.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [v3,4/4] drm/edid: Make sure the CEA mode arrays have the
 correct amount of modes
Message-ID: <20191210232025.GC25612@google.com>
References: <20190925135502.24055-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925135502.24055-5-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 11 Dec 2019 09:20:35 +0000
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
Cc: Hans Verkuil <hansverk@cisco.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFRob21hcyBBbmRlcnNvbiA8dGhvbWFzYW5kZXJzb25AZ29vZ2xlLmNvbT4K
Ck9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0IDA0OjU1OjAyUE0gKzAzMDAsIFZpbGxlIFN5cmphbGEg
d3JvdGU6Cj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbT4KPiAKPiBXZSBkZXBlbmQgb24gYSBzcGVjaWZpYyByZWxhdGlvbnNoaXAgYmV0d2VlbiB0
aGUgVklDIG51bWJlciBhbmQgdGhlCj4gaW5kZXggaW4gdGhlIENFQSBtb2RlIGFycmF5cy4gQXNz
ZXJ0IHRoYXQgdGhlIGFycmF5cyBoYXZlIHRoZSBleGNwZWN0ZWQKPiBzaXplIHRvIG1ha2Ugc3Vy
ZSB3ZSd2ZSBub3QgYWNjaWRlbnRhbGx5IGxlZnQgaG9sZXMgaW4gdGhlbS4KPiAKPiB2MjogUGlt
cCB0aGUgQlVJTERfQlVHX09OKClzCj4gCj4gQ2M6IEhhbnMgVmVya3VpbCA8aGFuc3ZlcmtAY2lz
Y28uY29tPgo+IENjOiBTaGFzaGFuayBTaGFybWEgPHNoYXNoYW5rLnNoYXJtYUBpbnRlbC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGlu
dGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCAzICsrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiBpbmRleCAw
MDA3MDA0ZDMyMjEuLjA2Y2FjOGUyYWZjMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2VkaWQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gQEAgLTMyMDks
NiArMzIwOSw5IEBAIHN0YXRpYyB1OCAqZHJtX2ZpbmRfY2VhX2V4dGVuc2lvbihjb25zdCBzdHJ1
Y3QgZWRpZCAqZWRpZCkKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9k
ZSAqY2VhX21vZGVfZm9yX3ZpYyh1OCB2aWMpCj4gIHsKPiArCUJVSUxEX0JVR19PTigxICsgQVJS
QVlfU0laRShlZGlkX2NlYV9tb2Rlc18xKSAtIDEgIT0gMTI3KTsKPiArCUJVSUxEX0JVR19PTigx
OTMgKyBBUlJBWV9TSVpFKGVkaWRfY2VhX21vZGVzXzE5MykgLSAxICE9IDIxOSk7Cj4gKwo+ICAJ
aWYgKHZpYyA+PSAxICYmIHZpYyA8IDEgKyBBUlJBWV9TSVpFKGVkaWRfY2VhX21vZGVzXzEpKQo+
ICAJCXJldHVybiAmZWRpZF9jZWFfbW9kZXNfMVt2aWMgLSAxXTsKPiAgCWlmICh2aWMgPj0gMTkz
ICYmIHZpYyA8IDE5MyArIEFSUkFZX1NJWkUoZWRpZF9jZWFfbW9kZXNfMTkzKSkKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
