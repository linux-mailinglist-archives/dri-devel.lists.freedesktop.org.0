Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C70152B6CA7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 19:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573DF8855B;
	Tue, 17 Nov 2020 18:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798368855B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 18:12:54 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p1so24092610wrf.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 10:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=sy11XZxk2UapLYKn4i4gXsIKXlY4QqHYxqwrkdcDSg4=;
 b=wUafgPlH0pdlylG8w4VJtjz2eCiqI8uWYjuWKDcZerO7JqIH06BqNXcYPF+AfMM7RW
 5qZLCajp6dntsBGiOp6L+s+uqRv7JCv0eHkT27tOhpdy3qQQl+TWbZZYCxRl/xqlSXPG
 kq1ClL1K4yPBMzdZEpIF65EfPpcQwUlo1iQ6VXbhvbEg0xusMHYryjp9Pu7Rn307l0+a
 8beTKUVURc/fuk6QAxqnCXwCT9m48ZrEcECxj0Y/czaXcAEt+rR38G0jm/lXeNvkvePe
 hXm23B0BGeoJdmX66MKsmacvQFjwA/Y+oJCJEkg91pJkv2QBuaHOAYQpw0naV9KOb62J
 yOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=sy11XZxk2UapLYKn4i4gXsIKXlY4QqHYxqwrkdcDSg4=;
 b=Hm3eeog1n+Qwx8KqMKpjlEV+UUx7VqLrXw4yU9JKxrqmMeaKiwTPH9jh/TvipWo9Gj
 +QjY4qNF4+J+BoRhcJB3PhVQrotjaSwypq8hbwNzgLQq8RYo04ViFnGoagAYtiNvAdQP
 manwf4vvw6+fge664s3DLeR2D7A7/7DHyhscwvISQdsb5W2Mu5+DKZURnhtRNDKLQmEE
 H+WG/6SKc3BTxX4WCrnUeLoJ62AW2gNSWJEgtnjwaWJNYB2ybPiqpc++DTrIZB1MwzRr
 FWtW82QtKx+IZ8irJI1XY8HT40uQIUg11FjcS5xG3ClV8+lU7bWZ/DjNvJJ17cEA4rZZ
 RdpA==
X-Gm-Message-State: AOAM5321aRIPT4vaf2vFA36EI3o4KVMBBeqX99ka7kv4IZ/RDBkGkZK/
 MU9cgYgah3GiaO6WcVJguYBqyHUg/0Z3gNnp
X-Google-Smtp-Source: ABdhPJxWNo3jDSMV6Q/igylxB209/03TI6WOA2HljuZCCtF8aRIy/XIUcF+ZPgfMNkk3gZ43jnJJiw==
X-Received: by 2002:adf:b358:: with SMTP id k24mr725103wrd.388.1605636773200; 
 Tue, 17 Nov 2020 10:12:53 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t13sm29699403wru.67.2020.11.17.10.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 10:12:52 -0800 (PST)
Date: Tue, 17 Nov 2020 18:12:50 +0000
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 03/42] drm/drm_dp_mst_topology: Remove set but never used
 variable 'len'
Message-ID: <20201117181250.GL1869941@dell>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
 <20201116174112.1833368-4-lee.jones@linaro.org>
 <20201117172925.GN401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117172925.GN401619@phenom.ffwll.local>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxNyBOb3YgMjAyMCwgRGFuaWVsIFZldHRlciB3cm90ZToKCj4gT24gTW9uLCBOb3Yg
MTYsIDIwMjAgYXQgMDU6NDA6MzNQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gRml4ZXMg
dGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4gPiAKPiA+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jOiBJbiBmdW5jdGlvbiDigJhkcm1fZHBf
c2VuZF9xdWVyeV9zdHJlYW1fZW5jX3N0YXR1c+KAmToKPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX21zdF90b3BvbG9neS5jOjMyNjM6Njogd2FybmluZzogdmFyaWFibGUg4oCYbGVu4oCZIHNl
dCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gPiAKPiA+IENjOiBN
YWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+ID4g
Q2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiA+IENjOiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxp
ZWRAbGludXguaWU+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4g
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IExl
ZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gCj4gR29pbmcgdG8gYXBwbHkgdGhpcywg
YnV0IEkgbm90aWNlZCB0aGF0IHRoZSByZXR1cm4gdmFsdWUgb2YgdGhlCj4gYnVpbGRfcXVlcnlf
c3RyZWFtX2VuY19zdGF0dXMoKSBpcyBwb2ludGxlc3MuIENhbiB5b3UgcGxzIGZvbGxvdyB1cCB3
aXRoCj4gYW4gYWRkaXRpb25hbCBwYXRjaCB0byBjaGFuZ2UgdGhhdCB0byB2b2lkPwoKSSBjYW4u
CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVs
b3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJt
IFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
