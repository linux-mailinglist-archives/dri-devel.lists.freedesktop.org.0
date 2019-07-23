Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8274C71F17
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF9E6E36B;
	Tue, 23 Jul 2019 18:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F2D6E326;
 Tue, 23 Jul 2019 17:34:03 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id i2so20896795plt.1;
 Tue, 23 Jul 2019 10:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding;
 bh=RvkJCESD/CzjFS1KF/Km/SwmbhukObYIhQgynXRi43Y=;
 b=g7Yg5Lb/l/QnzvDdasBErRUj6KAd+PKThGQ30g/zVUfYbPaQaqU5kt5a4ZTljaEeI+
 +jB0yOKmQxuLVMeQPzLsNgAkC2VyYBIjeXpr3SF8rxXhSGg2Fxe/PokR9yrUHk20+8hQ
 w/ww/oBQ8pj3p3HefnVVjcEGrH37gDk6esnVBE48QXneu2+kGj5U3OsYenOFV3C/uJpt
 GAreaorAXwSFqhL062GF36MDOruakEZmBnS1H5pOK4D689LAhgutcdPd/MJVFAj8f8yv
 +pOB0rxk3ctjPfW83kyzenmDNBIDERcLYN+/VFDc4wFRhDPlAv41W1aU+XgVFDCa3+Tj
 zcKw==
X-Gm-Message-State: APjAAAWNW16G3uuVD6sgD8A1IKpbuc39rZte0vF1hfaAF3G8h5XDWthd
 rR1rS/aDJFpB3ESoVokkFwc=
X-Google-Smtp-Source: APXvYqwGQLiTfDI9SBHWYaZ9CwHrfVyV37jq8D6e5I6AkYOX2lZLeDWIDHgJf7h1Rvimw3Dng5QcJA==
X-Received: by 2002:a17:902:848b:: with SMTP id
 c11mr81172081plo.217.1563903242938; 
 Tue, 23 Jul 2019 10:34:02 -0700 (PDT)
Received: from localhost ([184.63.162.180])
 by smtp.gmail.com with ESMTPSA id c69sm54574734pje.6.2019.07.23.10.33.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 10:34:02 -0700 (PDT)
Date: Tue, 23 Jul 2019 10:33:51 -0700
From: John Fastabend <john.fastabend@gmail.com>
To: syzbot <syzbot+79f5f028005a77ecb6bb@syzkaller.appspotmail.com>, 
 John Fastabend <john.fastabend@gmail.com>
Message-ID: <5d3744ff777cc_436d2adb6bf105c41c@john-XPS-13-9370.notmuch>
In-Reply-To: <0000000000002cec2e058e5c7e63@google.com>
References: <5d37433a832d_3aba2ae4f6ec05bc3a@john-XPS-13-9370.notmuch>
 <0000000000002cec2e058e5c7e63@google.com>
Subject: Re: Re: kernel panic: stack is corrupted in pointer
Mime-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding;
 bh=RvkJCESD/CzjFS1KF/Km/SwmbhukObYIhQgynXRi43Y=;
 b=OFvJt7jM5i+5flNvPymUu2grjKYxQLI+Ue38nlnfmT9uKM8LzKoZup+x5xVh8Ey7UD
 q4ahJ/wr4tHijZz4awmUMuRAI1dQAJqxZhO+QMNqOjvFYhB6Y/4GlaKhyLKD35H7dUol
 Uy4K+/6bxiHcxghZedGjlpNTFbwvMv4+ixJoosTU8yDa1hrUb4Q/Wgjqi3amLPgFGYOK
 Bkry6Ytx9Yxy4/m97IDI+bHOgbYy/7FP9ybFRfjZUiqPe/XEt21rtN3j+mLK3wjIuvMX
 tbRWOocUuR+pURAJdMxExJnJPV8WahdQxZMty1g7oYioNc1Vy638hbvkedO6GInDMVT3
 95Og==
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
Cc: daniel@iogearbox.net, airlied@linux.ie, netdev@vger.kernel.org,
 john.fastabend@gmail.com, ast@kernel.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 bpf@vger.kernel.org, leo.liu@amd.com, christian.koenig@amd.com,
 dvyukov@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

c3l6Ym90IHdyb3RlOgo+ID4gRG1pdHJ5IFZ5dWtvdiB3cm90ZToKPiA+PiBPbiBXZWQsIEp1bCAx
NywgMjAxOSBhdCAxMDo1OCBBTSBzeXpib3QKPiA+PiA8c3l6Ym90Kzc5ZjVmMDI4MDA1YTc3ZWNi
NmJiQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20+IHdyb3RlOgo+ID4+ID4KPiA+PiA+IEhlbGxv
LAo+ID4+ID4KPiA+PiA+IHN5emJvdCBmb3VuZCB0aGUgZm9sbG93aW5nIGNyYXNoIG9uOgo+ID4+
ID4KPiA+PiA+IEhFQUQgY29tbWl0OiAgICAxNDM4Y2RlNyBBZGQgbGludXgtbmV4dCBzcGVjaWZp
YyBmaWxlcyBmb3IgMjAxOTA3MTYKPiA+PiA+IGdpdCB0cmVlOiAgICAgICBsaW51eC1uZXh0Cj4g
Pj4gPiBjb25zb2xlIG91dHB1dDogIAo+ID4+IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29t
L3gvbG9nLnR4dD94PTEzOTg4MDU4NjAwMDAwCj4gPj4gPiBrZXJuZWwgY29uZmlnOiAgIAo+ID4+
IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvLmNvbmZpZz94PTM0MzBhMTUxZTE0NTIz
MzEKPiA+PiA+IGRhc2hib2FyZCBsaW5rOiAgCj4gPj4gaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3Bv
dC5jb20vYnVnP2V4dGlkPTc5ZjVmMDI4MDA1YTc3ZWNiNmJiCj4gPj4gPiBjb21waWxlcjogICAg
ICAgZ2NjIChHQ0MpIDkuMC4wIDIwMTgxMjMxIChleHBlcmltZW50YWwpCj4gPj4gPiBzeXogcmVw
cm86ICAgICAgIAo+ID4+IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvcmVwcm8uc3l6
P3g9MTExZmM4YWZhMDAwMDAKPiAKPiA+PiAgRnJvbSB0aGUgcmVwcm8gaXQgbG9va3MgbGlrZSB0
aGUgc2FtZSBicGYgc3RhY2sgb3ZlcmZsb3cgYnVnLiArSm9obgo+ID4+IFdlIG5lZWQgdG8gZHVw
IHRoZW0gb250byBzb21lIGNhbm9uaWNhbCByZXBvcnQgZm9yIHRoaXMgYnVnLCBvciB0aGlzCj4g
Pj4gYmVjb21lcyB1bm1hbmFnZWFibGUuCj4gCj4gPiBGaXhlcyBpbiBicGYgdHJlZSBzaG91bGQg
Zml4IHRoaXMuIEhvcGVmdWxseSwgd2Ugd2lsbCBzcXVhc2ggdGhpcyBvbmNlICAKPiA+IGZpeGVz
Cj4gPiBwZXJjb2xhdGUgdXAuCj4gCj4gPiAjc3l6IHRlc3Q6IGdpdDovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9icGYvYnBmLmdpdAo+IAo+ICI+IiBkb2VzIG5vdCBs
b29rIGxpa2UgYSB2YWxpZCBnaXQgYnJhbmNoIG9yIGNvbW1pdC4KPiAKCnRyeSBhZ2FpbiwKCiNz
eXogdGVzdDogZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Jw
Zi9icGYuZ2l0IG1hc3RlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
