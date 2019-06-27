Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C3958D1C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 23:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 958126E836;
	Thu, 27 Jun 2019 21:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B5E6E836
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 21:33:22 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id e3so8472666edr.10
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 14:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ymOdyMM4kE64/AUQiKyV50r6ZF407r2qw9+vaz2LbUI=;
 b=a6NP1mGZ1aNdo/dgdyC4/kx8iui/7zZHuATA92GHwFg91/2dGcIt8FQSJTDgfo1IxD
 FY4f+uevFGsZELKZV0eRZnBtRnpmZ8dJOUAbiUfGj5deWYZR2yoz//Ysf2Q0bgw1HXTz
 YGiDv5rL9bGefpdTW0BsuxEkA8iEUttbMcS+Xao6itlaLrma6tPEbL5cF8lvoqVlDWfZ
 Ji+NFE6qJAm5gzQBffm/Ig+xmr7StXQ4DB4IrVkEGg7TsbH6eyH5oLQgAVQPn3L3jvH1
 iFwYBNSEzOwmjWtjiVn3J3Nx9obhpTdFLDX3aUSUhoK/zuK+6qcl6B35/ulDzXWWipXt
 fqag==
X-Gm-Message-State: APjAAAVcKzRKTRBiSgt5zdn1C6gffR43X/ykIyCPevbbbR1HU06Rde5T
 F2u1WusZi/hc85HTSKyY+BjgxA==
X-Google-Smtp-Source: APXvYqxjRbFKIe6IvjmJOpPred6Rdtl4vcg0lEYGA3qs82CKrGWrX1IF77bjtg7XJeyS5vyoT9pSfg==
X-Received: by 2002:a17:906:6a89:: with SMTP id
 p9mr5325560ejr.44.1561671201380; 
 Thu, 27 Jun 2019 14:33:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y18sm40743ejh.84.2019.06.27.14.33.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 14:33:20 -0700 (PDT)
Date: Thu, 27 Jun 2019 23:33:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [RFC PATCH v3 07/11] drm, cgroup: Add TTM buffer allocation stats
Message-ID: <20190627213317.GP12905@phenom.ffwll.local>
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
 <20190626150522.11618-8-Kenny.Ho@amd.com>
 <20190626161254.GS12905@phenom.ffwll.local>
 <CAOWid-f3kKnM=4oC5Bba5WW5WNV2MH5PvVamrhO6LBr5ydPJQg@mail.gmail.com>
 <20190627060113.GC12905@phenom.ffwll.local>
 <CAOWid-e=M4Rf30s8ZoK5n2fOYNHhvpun0H=7URsKmsGc3Z0FDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOWid-e=M4Rf30s8ZoK5n2fOYNHhvpun0H=7URsKmsGc3Z0FDQ@mail.gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ymOdyMM4kE64/AUQiKyV50r6ZF407r2qw9+vaz2LbUI=;
 b=MW1qpb3KrqbU/Ri52N56RHJJu7qB/KHN0qgpeEJFE+8Ms9Ugd0095JF4DfwKy7Egk9
 HiMg+Jc+1knkFL32tTiY098a490CCZrIQzEkunpROdZ5dxGhMm3TZgBXeLYDsR+gf+6f
 QRMptRQYM6W86dRG6gll7PSlfiGFvycyPyDHc=
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, joseph.greathouse@amd.com,
 Kenny Ho <Kenny.Ho@amd.com>, Brian Welty <brian.welty@intel.com>,
 jsparks@cray.com, dri-devel <dri-devel@lists.freedesktop.org>,
 lkaplan@cray.com, Alex Deucher <alexander.deucher@amd.com>, kraxel@redhat.com,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMDQ6MTc6MDlQTSAtMDQwMCwgS2VubnkgSG8gd3JvdGU6
Cj4gT24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMjowMSBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+IHdyb3RlOgo+ID4gYnR3IHJlbWluZHMgbWU6IEkgZ3Vlc3MgaXQgd291bGQgYmUg
Z29vZCB0byBoYXZlIGEgcGVyLXR5cGUgLnRvdGFsCj4gPiByZWFkLW9ubHkgZXhwb3NlZCwgc28g
dGhhdCB1c2Vyc3BhY2UgaGFzIGFuIGlkZWEgb2YgaG93IG11Y2ggdGhlcmUgaXM/Cj4gPiB0dG0g
aXMgdHJ5aW5nIHRvIGJlIGFnbm9zdGljIHRvIHRoZSBhbGxvY2F0b3IgdGhhdCdzIHVzZWQgdG8g
bWFuYWdlIGEKPiA+IG1lbW9yeSB0eXBlL3Jlc291cmNlLCBzbyBkb2Vzbid0IGV2ZW4ga25vdyB0
aGF0LiBCdXQgSSB0aGluayBzb21ldGhpbmcgd2UKPiA+IG5lZWQgdG8gZXhwb3NlIHRvIGFkbWlu
cywgb3RoZXJ3aXNlIHRoZXkgY2FuJ3QgbWVhbmluZ2Z1bGx5IHNldCBsaW1pdHMuCj4gCj4gSSBk
b24ndCB0aGluayBJIHVuZGVyc3RhbmQgdGhpcyBiaXQsIGRvIHlvdSBtZWFuIHRvdGFsIGFjcm9z
cyBtdWx0aXBsZQo+IEdQVSBvZiB0aGUgc2FtZSBtZW0gdHlwZT8gIE9yIGRvIHlvdSBtZWFuIHRo
ZSB0b3RhbCBhdmFpbGFibGUgcGVyIEdQVQo+IChvciBzb21ldGhpbmcgZWxzZT8pCgpUb3RhbCBm
b3IgYSBnaXZlbiB0eXBlIG9uIGEgZ2l2ZW4gY3B1LiBFLmcuIG1heWJlIHlvdSB3YW50IHRvIGdp
dmUgNTAlIG9mCnlvdXIgdnJhbSB0byBvbmUgY2dyb3VwLCBhbmQgdGhlIG90aGVyIDUwJSB0byB0
aGUgb3RoZXIgY2dyb3VwLiBGb3IgdGhhdAp5b3UgbmVlZCB0byBrbm93IGhvdyBtdWNoIHZyYW0g
eW91IGhhdmUuIEFuZCBleHBlY3RpbmcgcGVvcGxlIHRvIGxzcGNpIGFuZAp0aGVuIGxvb2sgYXQg
d2lraXBlZGlhIGZvciBob3cgbXVjaCB2cmFtIHRoYXQgY2hpcCBzaG91bGQgaGF2ZSAob3IKc29t
ZXRoaW5nIGxpa2UgdGhhdCkgaXNuJ3QgZ3JlYXQuIEhlbmNlIDAudnJhbS50b3RhbCwgMC50dC50
b3RhbCwgYW5kIHNvCm9uIChhbHNvIGZvciBhbGwgdGhlIG90aGVyIGdwdSBtaW5vcnMgb2ZjKS4g
IEZvciBzeXN0ZW0gbWVtb3J5IHdlIHByb2JhYmx5CmRvbid0IHdhbnQgdG8gcHJvdmlkZSBhIHRv
dGFsLCBzaW5jZSB0aGF0J3MgYWxyZWFkeSBhIHZhbHVlIHRoYXQncyBlYXN5IHRvCm9idGFpbiBm
cm9tIHZhcmlvdXMgc291cmNlcy4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBF
bmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
