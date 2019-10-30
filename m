Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9B9EA503
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 21:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BA96EB84;
	Wed, 30 Oct 2019 20:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FDF6EB84
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 20:55:04 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m7so4248648lji.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 13:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hZ5hpzMv+H/MROSrIWVYlJRraI4VuJyu7F9zPR0wEVk=;
 b=SR7NXeSDeing1flSJtOTChjvkjnpJedQLy8E5TCiq1IEriBtiJwZQ043b7B4WqpBvt
 o2ExyuEKtGg3YXJUBPZZgfOY4v7asxXOJqcCDw0Ywk6RK0G51utWe6z0mvPdxPKGSgAt
 dkNHSw+keQJs82C6q8XC4g8nsVgs4tsHcyJX+nfW1pC9j0c/JxshBbgSVuyX4wLCxA1c
 44BgcmUsqzQVI4UVWXP1uY0U4mlK9NwP1IZrAVpsguDG/RNIQhzmPDFAGEbu+O8IRkGJ
 RjBnS/W0IENGoE0b/xyUVFRVnnFKRHO79aqc+b4PIxC9/F56bz0PuQGr9h4C96iIywKG
 xGoA==
X-Gm-Message-State: APjAAAWKYaJCS5V5FWRTx8XSKwhJVD2VLkCoo16djJ0T2sNStgBIrRi5
 xuYpTUXgzPvmO/KkahHfTI2mV7/x3pZ8UKvf+iKz+Eb8
X-Google-Smtp-Source: APXvYqyd6G9d6YIz/ozOjENXIbTX86zolC0x5vroOdNxUa4IuwrxoGeJ39Oi6sQTdUdKKb0PTbZuMD44yZFFS1We4Ww=
X-Received: by 2002:a05:651c:38f:: with SMTP id
 e15mr1170019ljp.107.1572468902102; 
 Wed, 30 Oct 2019 13:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191030203003.101156-1-sean@poorly.run>
In-Reply-To: <20191030203003.101156-1-sean@poorly.run>
From: Sean Paul <sean@poorly.run>
Date: Wed, 30 Oct 2019 16:54:25 -0400
Message-ID: <CAMavQKLj7dyQR8JbV1fHp+fA1ePcf2HXm_rUOBuUy93tUxNqOg@mail.gmail.com>
Subject: Re: [PATCH 0/5] Revert "DMA-BUF Heaps (destaging ION)"
To: dri-devel <dri-devel@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hZ5hpzMv+H/MROSrIWVYlJRraI4VuJyu7F9zPR0wEVk=;
 b=e5+GXg62447PN7DJlUYCjZf/1Kaa7mm13FMCWMqjjMv198Z+YkowITN8nb/a8XNnHW
 a+LiEpuD3EOcUAiV/mRwT/q0y60JqdMQzRxy/ebbhHmr1x6MvhaML0SnK+wwkxNEMb6D
 l2h+Xg5o8/ubSOY3whp16NoGhth3WSMVZyiac+GTmiOqpuCFquZ/gLCZA1smlM/Tm56Z
 ItyI6zgdrKg39UJLSYKZIaoeNP/dCCwWIU5zDJtonLJrHbsEOzH0wpe1K7in/5YhzUJp
 UHdl5UvEZkgfwGAsazO9LxazXJJD2+4SV6YLriNKHwg918mWsAOch1bUfxA4DCrIzTm0
 oOXQ==
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
Cc: Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgNDozMCBQTSBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1
bj4gd3JvdGU6Cj4KPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPgo+
IFdoaWxlIHRoZSBrZXJuZWwgc2V0IGhhcyBhIHNvbGlkIG51bWJlciBvZiByLWIncyBhbmQgYWNr
cywgdGhlCj4gdXNlcnNwYWNlIGNvbXBvbmVudCBkb2VzIG5vdCBtZWV0IHRoZSBkcm0gcmVxdWly
ZW1lbnRzIG9mIGJlaW5nCj4gInJldmlld2VkIGFuZCByZWFkeSBmb3IgbWVyZ2luZyBpbnRvIGEg
c3VpdGFibGUgYW5kIGNhbm9uaWNhbCB1cHN0cmVhbQo+IHByb2plY3QiLgo+Cj4gT25jZSB0aGUg
dXNlcnNwYWNlIHBvcnRpb24gaGFzIGJlZW4gcmV2aWV3ZWQsIGxldCdzIHRyeSBhZ2Fpbi4KPgoK
UHVzaGVkIHRvIGRybS1taXNjLW5leHQuCgpTZWFuCgo+IFNlYW4KPgo+IFsxXSBodHRwczovLzAx
Lm9yZy9saW51eGdyYXBoaWNzL2dmeC1kb2NzL2RybS9ncHUvZHJtLXVhcGkuaHRtbCNvcGVuLXNv
dXJjZS11c2Vyc3BhY2UtcmVxdWlyZW1lbnRzCj4KPiBTZWFuIFBhdWwgKDUpOgo+ICAgUmV2ZXJ0
ICJrc2VsZnRlc3RzOiBBZGQgZG1hLWhlYXAgdGVzdCIKPiAgIFJldmVydCAiZG1hLWJ1ZjogaGVh
cHM6IEFkZCBDTUEgaGVhcCB0byBkbWFidWYgaGVhcHMiCj4gICBSZXZlcnQgImRtYS1idWY6IGhl
YXBzOiBBZGQgc3lzdGVtIGhlYXAgdG8gZG1hYnVmIGhlYXBzIgo+ICAgUmV2ZXJ0ICJkbWEtYnVm
OiBoZWFwczogQWRkIGhlYXAgaGVscGVycyIKPiAgIFJldmVydCAiZG1hLWJ1ZjogQWRkIGRtYS1i
dWYgaGVhcHMgZnJhbWV3b3JrIgo+Cj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAxOCAtLQo+ICBkcml2ZXJzL2RtYS1idWYvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMTEgLQo+ICBkcml2ZXJzL2RtYS1idWYvTWFrZWZpbGUgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDIgLQo+ICBkcml2ZXJzL2RtYS1idWYvZG1hLWhlYXAuYyAgICAg
ICAgICAgICAgICAgICAgfCAyNjkgLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvZG1hLWJ1
Zi9oZWFwcy9LY29uZmlnICAgICAgICAgICAgICAgICB8ICAxNCAtCj4gIGRyaXZlcnMvZG1hLWJ1
Zi9oZWFwcy9NYWtlZmlsZSAgICAgICAgICAgICAgICB8ICAgNCAtCj4gIGRyaXZlcnMvZG1hLWJ1
Zi9oZWFwcy9jbWFfaGVhcC5jICAgICAgICAgICAgICB8IDE3OCAtLS0tLS0tLS0tLS0KPiAgZHJp
dmVycy9kbWEtYnVmL2hlYXBzL2hlYXAtaGVscGVycy5jICAgICAgICAgIHwgMjY4IC0tLS0tLS0t
LS0tLS0tLS0tCj4gIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9oZWFwLWhlbHBlcnMuaCAgICAgICAg
ICB8ICA1NSAtLS0tCj4gIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jICAgICAg
ICAgICB8IDEyNCAtLS0tLS0tLQo+ICBpbmNsdWRlL2xpbnV4L2RtYS1oZWFwLmggICAgICAgICAg
ICAgICAgICAgICAgfCAgNTkgLS0tLQo+ICBpbmNsdWRlL3VhcGkvbGludXgvZG1hLWhlYXAuaCAg
ICAgICAgICAgICAgICAgfCAgNTUgLS0tLQo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9kbWFi
dWYtaGVhcHMvTWFrZWZpbGUgfCAgIDkgLQo+ICAuLi4vc2VsZnRlc3RzL2RtYWJ1Zi1oZWFwcy9k
bWFidWYtaGVhcC5jICAgICAgfCAyMzggLS0tLS0tLS0tLS0tLS0tLQo+ICAxNCBmaWxlcyBjaGFu
Z2VkLCAxMzA0IGRlbGV0aW9ucygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9kbWEt
YnVmL2RtYS1oZWFwLmMKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZG1hLWJ1Zi9oZWFw
cy9LY29uZmlnCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2RtYS1idWYvaGVhcHMvTWFr
ZWZpbGUKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVh
cC5jCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2RtYS1idWYvaGVhcHMvaGVhcC1oZWxw
ZXJzLmMKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9oZWFwLWhl
bHBlcnMuaAo+ICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5c3Rl
bV9oZWFwLmMKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvZG1hLWhlYXAuaAo+
ICBkZWxldGUgbW9kZSAxMDA2NDQgaW5jbHVkZS91YXBpL2xpbnV4L2RtYS1oZWFwLmgKPiAgZGVs
ZXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2RtYWJ1Zi1oZWFwcy9NYWtl
ZmlsZQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZG1hYnVm
LWhlYXBzL2RtYWJ1Zi1oZWFwLmMKPgo+IC0tCj4gU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVl
ciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
