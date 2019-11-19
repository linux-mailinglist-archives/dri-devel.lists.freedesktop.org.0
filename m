Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D8C102E34
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 22:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E96C6E9B2;
	Tue, 19 Nov 2019 21:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A776E3F5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 21:25:05 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id l17so4843697wmh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 13:25:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MC0bSMbpPhp7pCY2c+IYZvdByFPUpqgh0fiHNdjQVo8=;
 b=kczzWTbpFMyti3lGxiuq5jYX3XxoByWrZNhGggJ1Om2WnNgiCg+P8T5o46DgvtxUKG
 XAMEKjoubGxMhqF5muSZwhDVn3tKBKOmfU3bOmrwaWznN9gNXXuEnRhQeZp9Cl4GQ7wf
 7faUTWXzrouKHCY7KmWbSBLv5CmYO6DghEWCpNyn3UzDk9ioIy7hs85Q11Qrc33wxNpd
 k4GPNKppmlhekCX61D7yf3HjkrH0WHshE0m9oEQJPCewPLrTHJ2n8hAq1xS4DqE2USCm
 ukAVbWbjkVS1a3d7r8MAyr446hfWmyHW8vWEynM/pSZOWC3qZUNe8Ep2Z5o3TD7isHjl
 UCuA==
X-Gm-Message-State: APjAAAWRGyrNIJCUNUP2oL6w3UYekCLAZjw5769wm1sAlB1kS9TK21+w
 Pq+BssjkJxwLInDhPjGnwOyBoQ==
X-Google-Smtp-Source: APXvYqymUTVGrHeR5kxR1PpIDF+Wee+sQmK2YpTORP8MalB9/WapJ2Fmf3oupLJegggPfPC9W6is6Q==
X-Received: by 2002:a05:600c:218c:: with SMTP id
 e12mr8422702wme.30.1574198703900; 
 Tue, 19 Nov 2019 13:25:03 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id z2sm16771612wrs.89.2019.11.19.13.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 13:25:03 -0800 (PST)
Date: Tue, 19 Nov 2019 22:25:01 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH 5/8] drm/tilcdc: Drop drm_gem_fb_create wrapper
Message-ID: <20191119212501.GF30416@phenom.ffwll.local>
References: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
 <20191115092120.4445-6-daniel.vetter@ffwll.ch>
 <b8b0a079-c101-f09a-f367-7a9315dd9e19@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b8b0a079-c101-f09a-f367-7a9315dd9e19@ti.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MC0bSMbpPhp7pCY2c+IYZvdByFPUpqgh0fiHNdjQVo8=;
 b=YhRaE2904E0W863ywPPgZdYp/7D6qh7+DGvPEFTjGNqM+nJzAnLdOsqwCDkOS5FETo
 udhQMIisct58JO5u4aaPlKCigcgxtau2UOQIu3bYHZMe6nXCxBmkEg5XLJGKvWyNvPKd
 KHegeqXdGqyxhPQQ5Wk9+F+XRyqxzmyTJ1Z1I=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMDM6MjE6MjBQTSArMDIwMCwgSnlyaSBTYXJoYSB3cm90
ZToKPiBPbiAxNS8xMS8yMDE5IDExOjIxLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gRG9lc24n
dCBkbyBhbnl0aGluZy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBpbnRlbC5jb20+Cj4gPiBDYzogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4K
PiA+IENjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgo+IAo+IEFja2Vk
LWJ5OiBKeXJpIFNhcmhhIDxqc2FyaGFAdGkuY29tPgoKVGhhbmtzIGZvciB0YWtpbmcgYSBsb29r
LCBwdXNoZWQgdG8gZHJtLW1pc2MtbmV4dC4KLURhbmllbAoKPiAKPiA+IC0tLQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX2Rydi5jIHwgOCArLS0tLS0tLQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJt
L3RpbGNkYy90aWxjZGNfZHJ2LmMKPiA+IGluZGV4IDJhOWU2NzU5NzM3NS4uYTE2MDg4MGJlYTBh
IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfZHJ2LmMKPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX2Rydi5jCj4gPiBAQCAtNjQsMTIg
KzY0LDYgQEAgdm9pZCB0aWxjZGNfbW9kdWxlX2NsZWFudXAoc3RydWN0IHRpbGNkY19tb2R1bGUg
Km1vZCkKPiA+ICAKPiA+ICBzdGF0aWMgc3RydWN0IG9mX2RldmljZV9pZCB0aWxjZGNfb2ZfbWF0
Y2hbXTsKPiA+ICAKPiA+IC1zdGF0aWMgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqdGlsY2RjX2Zi
X2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ID4gLQkJc3RydWN0IGRybV9maWxlICpm
aWxlX3ByaXYsIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9mYl9jbWQyICptb2RlX2NtZCkKPiA+IC17
Cj4gPiAtCXJldHVybiBkcm1fZ2VtX2ZiX2NyZWF0ZShkZXYsIGZpbGVfcHJpdiwgbW9kZV9jbWQp
Owo+ID4gLX0KPiA+IC0KPiA+ICBzdGF0aWMgaW50IHRpbGNkY19hdG9taWNfY2hlY2soc3RydWN0
IGRybV9kZXZpY2UgKmRldiwKPiA+ICAJCQkgICAgICAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUg
KnN0YXRlKQo+ID4gIHsKPiA+IEBAIC0xNDAsNyArMTM0LDcgQEAgc3RhdGljIGludCB0aWxjZGNf
Y29tbWl0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gPiAgfQo+ID4gIAo+ID4gIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnX2Z1bmNzIG1vZGVfY29uZmlnX2Z1bmNzID0gewo+
ID4gLQkuZmJfY3JlYXRlID0gdGlsY2RjX2ZiX2NyZWF0ZSwKPiA+ICsJLmZiX2NyZWF0ZSA9IGRy
bV9nZW1fZmJfY3JlYXRlLAo+ID4gIAkuYXRvbWljX2NoZWNrID0gdGlsY2RjX2F0b21pY19jaGVj
aywKPiA+ICAJLmF0b21pY19jb21taXQgPSB0aWxjZGNfY29tbWl0LAo+ID4gIH07Cj4gPiAKPiAK
PiAKPiAtLSAKPiBUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIy
LCAwMDE4MCBIZWxzaW5raS4KPiBZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3Rp
cGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
