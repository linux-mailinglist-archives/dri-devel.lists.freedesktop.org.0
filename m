Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2546854D6
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 23:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0316E3F5;
	Wed,  7 Aug 2019 20:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DC26E3F5
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 20:59:56 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id e3so87855345edr.10
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 13:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=u2m8EsyQIMdqnUmonlV4rukS0GnrPzswST0pBSlmwOw=;
 b=m+k6fAzpMOIK+bdVlmp3GbSu6Tmx9hWfz1fwNun/YQkHiCOOpBR314fn3vGNimUrfg
 US1bEG8h1unXo49pJEGq66dus8lOBQjwGUjOSzIgWc33qmsM+28xVpFTATMzKmBLEMX9
 XJlisbDspbZBE5eQ4olqmWG+x26idIXK6r8BfIf9AC+4+1L5nFclnh/xodPUYHc+e4FY
 mDeLW0iJWTgJVvCYFKsmZe17yqcpagfKh+IcUBixeuz0BSEQcTOTBQSmyCNxlAf8iH8/
 Hovo1aFynLMsIW9ZgdRdPIH8yO1ZX9gvfyReGI29g3sR+AEck/Te4oY4KcHZmPwpT5LP
 Wbyg==
X-Gm-Message-State: APjAAAWsVTXtBVtXx9Wb5uGlTdPRuCIFjC5Qw1WMyMTSjZpXr2pomPF2
 wGf3a+EQR5VSWBEMadZjG005NQ==
X-Google-Smtp-Source: APXvYqwVv40quKtD3XcZ3X5YmVuNDpXQibhQ4nl5wPx/hJyiq0HyJMJs2bcb9NOp8EMTKHbA1KorQA==
X-Received: by 2002:a17:906:3756:: with SMTP id
 e22mr10083077ejc.72.1565211595192; 
 Wed, 07 Aug 2019 13:59:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id d16sm12952ejl.33.2019.08.07.13.59.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 13:59:54 -0700 (PDT)
Date: Wed, 7 Aug 2019 22:59:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 2/2] Revert "drm/panfrost: Use drm_gem_map_offset()"
Message-ID: <20190807205952.GE7444@phenom.ffwll.local>
References: <20190807145253.2037-1-sean@poorly.run>
 <20190807145253.2037-3-sean@poorly.run>
 <CACvgo50K+Wy3HAmVud8+Rvotm86vaqen1yPaO6gsUjc3K5BwSg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo50K+Wy3HAmVud8+Rvotm86vaqen1yPaO6gsUjc3K5BwSg@mail.gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=u2m8EsyQIMdqnUmonlV4rukS0GnrPzswST0pBSlmwOw=;
 b=BT+IgzEmQPqS7+tqLhGi92O3fxUmFHpSKNxVH6kfTIQINtbo6SBiI8j6kbDeJ+bLxP
 kY5jWds75fdjuX7PaAbOrCKbTW/iVxcjzMaACbtlNsSEua7Jet+NpkVXw/+kSrUHw2CD
 bNE0jCZOr/bQFCJadSzxA4VZKukjOjBOOoeN4=
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
Cc: Sean Paul <sean@poorly.run>, Maxime Ripard <mripard@kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDQ6NTk6NTFQTSArMDEwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IE9uIFdlZCwgNyBBdWcgMjAxOSBhdCAxNTo1MywgU2VhbiBQYXVsIDxzZWFuQHBvb3Js
eS5ydW4+IHdyb3RlOgo+ID4KPiA+IEZyb206IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+
Cj4gPgo+ID4gVGhpcyByZXZlcnRzIGNvbW1pdCA1ODNiYmY0NjEzM2M3MjZiYWUyNzdlOGY0ZTMy
YmZiYTJhNTI4YzdmLgo+ID4KPiA+IFR1cm5zIG91dCB3ZSBuZWVkIG1tYXAgdG8gd29yayBvbiBp
bXBvcnRlZCBCT3MgZXZlbiBpZiB0aGUgY3VycmVudCBjb2RlCj4gPiBpcyBidWdneS4KPiA+Cj4g
UGVyc29uYWxseSBJIHdvdWxkIGhhdmUgbWVudGlvbmVkIGEgdXNlIGNhc2Ugd2hlcmUgaW1wb3J0
ZWQgQk9zIGFyZSB1c2VkLgo+IAo+ID4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVu
Pgo+IAo+IFJlZ2FyZGxlc3Mgb2YgdGhlIGFib3ZlIG5pdHBpY2ssIHdpdGggdGhlIHBhdGNoIG9y
ZGVyIGZpeGVkIHRoZSBzZXJpZXMgaXM6Cj4gUmV2aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1p
bC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gCj4gLi4uIGluIGNhc2UgeW91IGhhdmVuJ3QgcGlj
a2VkIGl0IGFscmVhZHkuCgpZZWFoIGEgZm9sbG93LXVwIHBhdGNoIHRvIGFkZCBhIGNvbW1lbnQg
aGVyZSBhYm91dCB3aHkgZXhhY3RseSB0aGlzIHdlbnQKYWxsIGthYm9vbSwgcGx1cyB3aGljaCB1
c2Vyc3BhY2UgKHNpbmNlIHBhbmZyb3N0IGlzIG1vdmluZyBmYXN0KSB3b3VsZCBiZQpyZWFsIG5p
Y2UgaGVyZS4KCkF0bSB3ZSBuZWVkIHRvIGhvcGUgc29tZW9uZSBkb2VzIGEgZ2l0IGJsYW1lIG9u
IHRoaXMgYmVmb3JlIHRoZSBicmVhayB0aGlzCmFnYWluLCB3aGljaCBzZWVtcyBhIGJpdCBob3Bl
ZnVsIC4uLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
