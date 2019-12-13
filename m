Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C431711F229
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:43:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F756E3C7;
	Sat, 14 Dec 2019 14:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9931E6EC40
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 21:05:49 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 2so2091162pfg.12
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 13:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=gQu1vgT8omrbaFBe9PimRJj7yCCMbva+ZbVcZpGoxd0=;
 b=A8kTSPU8+tY+0OsLuPLp3IkneedWyJPXB4Frf0BHggtOTqenHqal+NH0pDXGNeGUAK
 ppyNH4tNE+obUXc2HjjB8rVZDB+WXuaUgW/8inP7qOSmdyUOOHaZrU1UoBr4GUIjOY83
 Td7bH/eP/hYxyDkthwz88T5wt0sJIEP5Z5hTBwj6M75B62Ayhkbxbt/5iwcJHlg3NIsJ
 MciyjRQ0rGCUE5NoHmkWmny42fVOk381T+UqCJxb65I6sY2whFI9X+2D5aVoCyVMe1E2
 GjokBaEkcw3pPnych+HSw33exYi+6YK4H4Qv/SwhU0l6POvW/ULO7rs2m3fkplkUWwXm
 MwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=gQu1vgT8omrbaFBe9PimRJj7yCCMbva+ZbVcZpGoxd0=;
 b=YV1ALO+6Zk0ya4LFIKoXdWrcgZtlJwGjT6NcjhTa2y44YCw0xcCW26WjkxsEXyqnKU
 hfEPWz65Ia53t9wPC8Bcmxr4999yCE3lBlwoqHwY7bS7G5YGxVyDrMUk0q1h9Q/gXGGy
 zg24fj0QfZK+lez21NDy+hI/+2DGtnZJSHo9ScHlk7zssf5GfAqfRRGTvfYpIJpJz++F
 4W44P0nYB9i61JtvC58Hnc8jsqIk9OPlygceQhd2af/+122caeCbHqsPVYwlE/WmFxmI
 zIV/D/jwADaoS/n+3oKdylAbtplNCGuTd4xexkMRGQjhZO1KdEdu8IYboS/XNwIg294M
 qRGw==
X-Gm-Message-State: APjAAAWlR5M1CrVUWlEZc32mpXdUanjx+enRYlKc09jPvIOrwM9FlOm3
 BufmhqJOpinaG2n85c3ZKsImvA==
X-Google-Smtp-Source: APXvYqxhjg8tbfCBWFs3lNzftq0MN2NHqRRDedFONER6UBl2tL2BXS11c5c+dNHLaS0R5N0v3Pmtdg==
X-Received: by 2002:aa7:98cd:: with SMTP id e13mr1618089pfm.56.1576271148883; 
 Fri, 13 Dec 2019 13:05:48 -0800 (PST)
Received: from google.com ([2620:0:1000:2511:b34b:87b6:d099:91b0])
 by smtp.gmail.com with ESMTPSA id t5sm10550167pje.6.2019.12.13.13.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 13:05:48 -0800 (PST)
Date: Fri, 13 Dec 2019 13:05:43 -0800
From: Tom Anderson <thomasanderson@google.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 3/4] drm/edid: Throw away the dummy VIC 0 cea mode
Message-ID: <20191213210543.GB131138@google.com>
References: <20191213174348.27261-1-ville.syrjala@linux.intel.com>
 <20191213174348.27261-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213174348.27261-4-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: Hans Verkuil <hansverk@cisco.com>,
 Manasi Navare <manasi.d.navare@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bGd0bQoKUmV2aWV3ZWQtYnk6IFRob21hcyBBbmRlcnNvbiA8dGhvbWFzYW5kZXJzb25AZ29vZ2xl
LmNvbT4KCk9uIEZyaSwgRGVjIDEzLCAyMDE5IGF0IDA3OjQzOjQ3UE0gKzAyMDAsIFZpbGxlIFN5
cmphbGEgd3JvdGU6Cj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4
LmludGVsLmNvbT4KPiAKPiBOb3cgdGhhdCB0aGUgY2VhIG1vZGUgaGFuZGxpbmcgaXMgbm90IDEw
MCUgdGllZCB0byB0aGUgc2luZ2xlCj4gYXJyYXkgdGhlIGR1bW15IFZJQyAwIG1vZGUgaXMgcHJl
dHR5IG11Y2ggcG9pbnRsZXMuIFRocm93IGl0Cj4gb3V0Lgo+IAo+IHYyOiBSZWJhc2UKPiAKPiBD
YzogVG9tIEFuZGVyc29uIDx0aG9tYXNhbmRlcnNvbkBnb29nbGUuY29tPgo+IENjOiBIYW5zIFZl
cmt1aWwgPGhhbnN2ZXJrQGNpc2NvLmNvbT4KPiBDYzogTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQu
bmF2YXJlQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Vk
aWQuYyB8IDEyICsrKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Vk
aWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gaW5kZXggMjc4N2FkMGVmODgxLi44
YmM2OWRhNTNjMmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+IEBAIC03MTQsOSArNzE0LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBtaW5pbW9kZSBleHRyYV9tb2Rlc1tdID0gewo+ICAgKgo+ICAgKiBE
byBub3QgYWNjZXNzIGRpcmVjdGx5LCBpbnN0ZWFkIGFsd2F5cyB1c2UgY2VhX21vZGVfZm9yX3Zp
YygpLgo+ICAgKi8KPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGVkaWRf
Y2VhX21vZGVzXzBbXSA9IHsKPiAtCS8qIDAgLSBkdW1teSwgVklDcyBzdGFydCBhdCAxICovCj4g
LQl7IH0sCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBlZGlkX2NlYV9t
b2Rlc18xW10gPSB7Cj4gIAkvKiAxIC0gNjQweDQ4MEA2MEh6IDQ6MyAqLwo+ICAJeyBEUk1fTU9E
RSgiNjQweDQ4MCIsIERSTV9NT0RFX1RZUEVfRFJJVkVSLCAyNTE3NSwgNjQwLCA2NTYsCj4gIAkJ
ICAgNzUyLCA4MDAsIDAsIDQ4MCwgNDkwLCA0OTIsIDUyNSwgMCwKPiBAQCAtMzIxNSwxMCArMzIx
Myw4IEBAIHN0YXRpYyB1OCAqZHJtX2ZpbmRfY2VhX2V4dGVuc2lvbihjb25zdCBzdHJ1Y3QgZWRp
ZCAqZWRpZCkKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqY2Vh
X21vZGVfZm9yX3ZpYyh1OCB2aWMpCj4gIHsKPiAtCWlmICghdmljKQo+IC0JCXJldHVybiBOVUxM
Owo+IC0JaWYgKHZpYyA8IEFSUkFZX1NJWkUoZWRpZF9jZWFfbW9kZXNfMCkpCj4gLQkJcmV0dXJu
ICZlZGlkX2NlYV9tb2Rlc18wW3ZpY107Cj4gKwlpZiAodmljID49IDEgJiYgdmljIDwgMSArIEFS
UkFZX1NJWkUoZWRpZF9jZWFfbW9kZXNfMSkpCj4gKwkJcmV0dXJuICZlZGlkX2NlYV9tb2Rlc18x
W3ZpYyAtIDFdOwo+ICAJaWYgKHZpYyA+PSAxOTMgJiYgdmljIDwgMTkzICsgQVJSQVlfU0laRShl
ZGlkX2NlYV9tb2Rlc18xOTMpKQo+ICAJCXJldHVybiAmZWRpZF9jZWFfbW9kZXNfMTkzW3ZpYyAt
IDE5M107Cj4gIAlyZXR1cm4gTlVMTDsKPiBAQCAtMzIzMSw3ICszMjI3LDcgQEAgc3RhdGljIHU4
IGNlYV9udW1fdmljcyh2b2lkKQo+ICAKPiAgc3RhdGljIHU4IGNlYV9uZXh0X3ZpYyh1OCB2aWMp
Cj4gIHsKPiAtCWlmICgrK3ZpYyA9PSBBUlJBWV9TSVpFKGVkaWRfY2VhX21vZGVzXzApKQo+ICsJ
aWYgKCsrdmljID09IDEgKyBBUlJBWV9TSVpFKGVkaWRfY2VhX21vZGVzXzEpKQo+ICAJCXZpYyA9
IDE5MzsKPiAgCXJldHVybiB2aWM7Cj4gIH0KPiAtLSAKPiAyLjIzLjAKPiAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
