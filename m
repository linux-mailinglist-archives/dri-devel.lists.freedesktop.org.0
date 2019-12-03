Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF98110329
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 18:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991E06E863;
	Tue,  3 Dec 2019 17:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392696E863
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 17:09:40 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y17so4632626wrh.5
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 09:09:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4aNKjl9ZXdF3AK1cV58XGK57a6lAFd0g+SUxwHwseyM=;
 b=hZngqd9e9xnFlx0huijVC0FAquFPRNA7qj4IJv8AiP8LL6TFdEBe03BqQrWgOQ2OwT
 tBPhB7eXGtjRlLF8DS8woOpjz0My2vq6b1YBKPo3VD+h68ZiyLSR1iHV6Od+CC7J05XV
 8LOmFiyIUA77D666HHGqfaP7rgXmF3vJnd+HcfDxkQG9OkFXwtMUT4FwMRI3HnGuB+wn
 HLh+49R8oUG2fsEpOPq9vls64N/GuBaRZMJ9xjZx4e8mJqhEOc8GWLrzoFMRgqZxHebJ
 qoJYQrTFc6qTTy/ow80s/nWzlP4euxJx9aCbK3/Eim6t0HhoU9iLZRJB+8OjH3ZPF90N
 Z9vQ==
X-Gm-Message-State: APjAAAVF73AyvNO9iw41ZzJ2PXqS2wHmKs28oPuIeY1t4WMJzacohgyW
 Ww4LDCPGVzMhoAaWTcwxeIA1C5tB5QY=
X-Google-Smtp-Source: APXvYqxK4lj4oCGHsKgjKafAITg82puCSFA+6gcgZOmxj+U2vnlp/3O9ktmtLb34cFTlGaTmxCytrw==
X-Received: by 2002:a05:6000:118d:: with SMTP id
 g13mr6755027wrx.141.1575392978895; 
 Tue, 03 Dec 2019 09:09:38 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id g25sm3278615wmh.3.2019.12.03.09.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 09:09:37 -0800 (PST)
Date: Tue, 3 Dec 2019 18:09:35 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 07/12] video: fbdev: intelfb: use const pointer for
 fb_ops
Message-ID: <20191203170935.GI624164@phenom.ffwll.local>
References: <cover.1575390740.git.jani.nikula@intel.com>
 <171c573bc2977a6ec374753ac7bb03a3523ca2b7.1575390740.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <171c573bc2977a6ec374753ac7bb03a3523ca2b7.1575390740.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4aNKjl9ZXdF3AK1cV58XGK57a6lAFd0g+SUxwHwseyM=;
 b=FaxzFbnZEuJHu+72oQwz5fbgxQvzkOPZZqwR5J9/3HaGy6vlJ1JXKtjtRj8kXJzjcf
 cebam9NRy927CWhIwukGyksu/O2FzRZYwolnbrLg+GFuZKKbuDQszQKM8mCUXNNdW2pb
 x3R8Iy+WOdlNtMsZSM+kt5ghqbl/4opipl0uE=
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMDY6Mzg6NDlQTSArMDIwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gVXNlIGNvbnN0IGZvciBmYl9vcHMgdG8gbGV0IHVzIG1ha2UgdGhlIGZib3BzIHN0cnVj
dCBjb25zdCBpbiB0aGUKPiBmdXR1cmUuCj4gCj4gQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVs
Lm9yZwo+IFNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvaW50ZWxmYi9pbnRlbGZiLmggfCAyICstCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2ludGVsZmIvaW50ZWxmYi5oIGIvZHJpdmVycy92
aWRlby9mYmRldi9pbnRlbGZiL2ludGVsZmIuaAo+IGluZGV4IGI1NGRiMDVmMDI4ZC4uNWRlNzAz
OTAyYTIxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvaW50ZWxmYi9pbnRlbGZi
LmgKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2ludGVsZmIvaW50ZWxmYi5oCj4gQEAgLTI3
Myw3ICsyNzMsNyBAQCBzdHJ1Y3QgaW50ZWxmYl92c3luYyB7Cj4gIAo+ICBzdHJ1Y3QgaW50ZWxm
Yl9pbmZvIHsKPiAgCXN0cnVjdCBmYl9pbmZvICppbmZvOwo+IC0Jc3RydWN0IGZiX29wcyAgKmZi
b3BzOwo+ICsJY29uc3Qgc3RydWN0IGZiX29wcyAqZmJvcHM7CgpJIHRoaW5rIGFzaWRlIGZyb20g
YSBsb25lIGFzc2lnbm1lbnQgaW4gaW50ZWxmYl9wY2lfcmVnaXN0ZXIgdGhpcyBpcwplbnRpcmVs
eSB1bnVzZWQuIEJ1dCBJIGFsc28gdGhpbmsgcmVzaXN0YW5jZSBpcyBmdXRpbGUgc28KClJldmll
d2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKPiAgCXN0cnVj
dCBwY2lfZGV2ICpwZGV2Owo+ICAKPiAgCXN0cnVjdCBpbnRlbGZiX2h3c3RhdGUgc2F2ZV9zdGF0
ZTsKPiAtLSAKPiAyLjIwLjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
