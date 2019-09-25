Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5074BE622
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 22:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB62E6F8C0;
	Wed, 25 Sep 2019 20:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF306F8E6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 20:08:40 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id x4so1519264ybo.8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 13:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=VAaiqGoJ4pEXMzYJOikHUUPKtKAF3wx8lqD0K1ST4aU=;
 b=N9tJ8seKsX1fTIvB53BbdAadBsJv71FxVMw718JRX4nHaTcCi5XLirs6D3gnbbN/HQ
 82qzBB3FuGRrLpVVOoEt34Fc6M6YRlZ22JBmpNsDd+JmCAvixkK5JNRLQLaPzAHz6LER
 kZxSC3r+0iglbzs9ToDSCLs3bOd41OW93e9u50V+gNWhh8k7o6hwFd9JmwbEOJcrELy+
 HrFZ/vo3g3MSqaJTqFu/a3KsBRH9s21AaBExdrMb90t8oS0f9aTTf4ojhbAIG43tW6XR
 oWvqwvMKWpZTS7NxztK5UppEvqMLA5XLl8epSguHi9efnctqoLADdP8tx5kpewD8IE3t
 NuuQ==
X-Gm-Message-State: APjAAAXL1JY6jWDjW04MyDqNBcdn8LmD8SE7ag5cFwNHdYfdJjUq2sfT
 KHjcM6UOhsa9ZAaJ8M66lb1zZw==
X-Google-Smtp-Source: APXvYqzHtod4n2+whggfrt7HgHX6HJwM31fm7krzjZzFBf0YmRR0H8hZpdFsXRX/JxLZErFMY3j6fA==
X-Received: by 2002:a5b:bc4:: with SMTP id c4mr1267071ybr.270.1569442119582;
 Wed, 25 Sep 2019 13:08:39 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id u67sm1487609ywf.44.2019.09.25.13.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 13:08:39 -0700 (PDT)
Date: Wed, 25 Sep 2019 16:08:38 -0400
From: Sean Paul <sean@poorly.run>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2 24/27] drm/amdgpu/dm: Resume short HPD IRQs before
 resuming MST topology
Message-ID: <20190925200838.GO218215@art_vandelay>
References: <20190903204645.25487-1-lyude@redhat.com>
 <20190903204645.25487-25-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903204645.25487-25-lyude@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=VAaiqGoJ4pEXMzYJOikHUUPKtKAF3wx8lqD0K1ST4aU=;
 b=avhIse5/RpZfaFodCvM+4FD3O2mvJQh97DzvaZXBZYVqRDzM/KKnpGktHjBkk6qTo4
 ZluHFmK/j7vB/YDW9UOdND4nib0QCocOdYW/X6Kef74sjmd5WKB/5BQM9YTYF5JwUlah
 7b6fgcEaWaayEw/i5sbJBNPPxwIJ3Hpe1+xBnsozs6pANPepf/cZdcOYXME7lPLtmxPy
 BA2cxyO4o7qTboXkzt0SAlK7IWTxSkCL1zJF4FJ9LLQeW9D2ChBzpHd4ehh3IpTOa/OY
 Lb+9U+F/aiQCQfXqwqZrqtzQaA5kFXasKjTzAY8WbljfS1jXuAa0ci5NT2LMscnsgv7m
 91kA==
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
Cc: dri-devel@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, David Airlie <airlied@linux.ie>,
 Juston Li <juston.li@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Francis <David.Francis@amd.com>, Harry Wentland <hwentlan@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDQ6NDY6MDJQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBTaW5jZSB3ZSdyZSBnb2luZyB0byBiZSByZXByb2JpbmcgdGhlIGVudGlyZSB0b3BvbG9n
eSBzdGF0ZSBvbiByZXN1bWUKPiBub3cgdXNpbmcgc2lkZWJhbmQgdHJhbnNhY3Rpb25zLCB3ZSBu
ZWVkIHRvIGVuc3VyZSB0aGF0IHdlIGFjdHVhbGx5IGhhdmUKPiBzaG9ydCBIUEQgaXJxcyBlbmFi
bGVkIGJlZm9yZSBjYWxsaW5nIGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3Jlc3VtZSgpLgo+IFNv
LCBkbyB0aGF0Lgo+IAo+IENjOiBKdXN0b24gTGkgPGp1c3Rvbi5saUBpbnRlbC5jb20+Cj4gQ2M6
IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogSGFycnkgV2VudGxhbmQgPGh3ZW50
bGFuQGFtZC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+
Cj4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDYgKysr
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jCj4gaW5kZXggNzM2MzBlMjk0MGQ0Li40ZDNjOGJmZjc3ZGEgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiBAQCAtMTE4
NSwxNSArMTE4NSwxNSBAQCBzdGF0aWMgaW50IGRtX3Jlc3VtZSh2b2lkICpoYW5kbGUpCj4gIAkv
KiBwcm9ncmFtIEhQRCBmaWx0ZXIgKi8KPiAgCWRjX3Jlc3VtZShkbS0+ZGMpOwo+ICAKPiAtCS8q
IE9uIHJlc3VtZSB3ZSBuZWVkIHRvICByZXdyaXRlIHRoZSBNU1RNIGNvbnRyb2wgYml0cyB0byBl
bmFtYmxlIE1TVCovCj4gLQlzM19oYW5kbGVfbXN0KGRkZXYsIGZhbHNlKTsKPiAtCj4gIAkvKgo+
ICAJICogZWFybHkgZW5hYmxlIEhQRCBSeCBJUlEsIHNob3VsZCBiZSBkb25lIGJlZm9yZSBzZXQg
bW9kZSBhcyBzaG9ydAo+ICAJICogcHVsc2UgaW50ZXJydXB0cyBhcmUgdXNlZCBmb3IgTVNUCj4g
IAkgKi8KPiAgCWFtZGdwdV9kbV9pcnFfcmVzdW1lX2Vhcmx5KGFkZXYpOwo+ICAKPiArCS8qIE9u
IHJlc3VtZSB3ZSBuZWVkIHRvICByZXdyaXRlIHRoZSBNU1RNIGNvbnRyb2wgYml0cyB0byBlbmFt
YmxlIE1TVCovCgpXaGlsZSB3ZSdyZSBoZXJlLAoKcy8gIC8gLyAmJiBzL2VuYW1ibGUvZW5hYmxl
LyAmJiBzXyovXyAqL18KCj4gKwlzM19oYW5kbGVfbXN0KGRkZXYsIGZhbHNlKTsKPiArCj4gIAkv
KiBEbyBkZXRlY3Rpb24qLwo+ICAJZHJtX2Nvbm5lY3Rvcl9saXN0X2l0ZXJfYmVnaW4oZGRldiwg
Jml0ZXIpOwo+ICAJZHJtX2Zvcl9lYWNoX2Nvbm5lY3Rvcl9pdGVyKGNvbm5lY3RvciwgJml0ZXIp
IHsKPiAtLSAKPiAyLjIxLjAKPiAKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBH
b29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
