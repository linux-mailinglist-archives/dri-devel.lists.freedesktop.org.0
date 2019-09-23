Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 516B3BB9DB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 18:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256966E975;
	Mon, 23 Sep 2019 16:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACE66E975
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 16:45:56 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f22so2905879wmc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 09:45:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YZottsNo9dP9sxiK9k2Pisr2Qm5tcc6fwuMDqhOgSTY=;
 b=ZhQYhBQjCZhEvCgJ+uQbrBfwkZCE2+/eXVpzky5sgJt9gRIsSzduD8F9UiX6fPRb4z
 B3pzujUr9OeQVXjzEXf7cLmUb3lSoFyggzlCyPp/G2DX9wS8sy3TWNIM5MoyOIuHCNhE
 UYMB3UVcJfL37HPY7uX8G8AQJICKE+ge4vr3qs9qscLp/eloyhTSn40E6pfBWxcj4KhP
 ryBU5YDKMB5mEICX0uzlGm6+vKoiyjbocHN3/f/JEdv4+gSjBzA9tBwXddnS4VFcIljB
 6hTVgPhpRDxPstisZOsjRpR3p4g0bLhBMyzIwZMKZ3WHwsgaQ3PXlvbzwL6hr9zte35O
 t/uw==
X-Gm-Message-State: APjAAAWFSxxP1NOPZW4/L0pUvP9jOQNFGspRlC6MQAngteH/nAHXkfOd
 1nHJJim2pb/OcdDnA422ONc=
X-Google-Smtp-Source: APXvYqz5f2hHpzllsCbosbkpt9BL/y+iKOdw90u+mTixiKOOTkgT7ZkZkVdfwtOVDS2lG85rkzerTw==
X-Received: by 2002:a05:600c:22d9:: with SMTP id
 25mr386973wmg.133.1569257154376; 
 Mon, 23 Sep 2019 09:45:54 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id
 g185sm22261538wme.10.2019.09.23.09.45.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Sep 2019 09:45:53 -0700 (PDT)
Date: Mon, 23 Sep 2019 18:45:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Steven Price <steven.price@arm.com>
Subject: Re: [RESEND PATCH] drm/panfrost: Reduce the amount of logs on
 deferred probe
Message-ID: <20190923164550.GA17765@kozik-lap>
References: <20190909155146.14065-1-krzk@kernel.org>
 <1858ea3d-8f33-66f4-0e71-31bf68443b24@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1858ea3d-8f33-66f4-0e71-31bf68443b24@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMTA6MzY6MjVBTSArMDEwMCwgU3RldmVuIFByaWNlIHdy
b3RlOgo+IE9uIDA5LzA5LzIwMTkgMTY6NTEsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4g
PiBUaGVyZSBpcyBubyBwb2ludCB0byBwcmludCBkZWZlcnJlZCBwcm9iZSAoYW5kIGl0cyBmYWls
dXJlcyB0byBnZXQKPiA+IHJlc291cmNlcykgYXMgYW4gZXJyb3IuCj4gPiAKPiA+IEluIGNhc2Ug
b2YgbXVsdGlwbGUgcHJvYmUgdHJpZXMgdGhpcyB3b3VsZCBwb2xsdXRlIHRoZSBkbWVzZy4KPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3Jn
Pgo+IAo+IExvb2tzIGxpa2UgYSBnb29kIGlkZWEsIGhvd2V2ZXIgZnJvbSB3aGF0IEkgY2FuIHRl
bGwgeW91IGhhdmVuJ3QKPiBjb21wbGV0ZWx5IHNpbGVuY2VkIHRoZSAnZXJyb3InIGFzIHRoZSBy
ZXR1cm4gZnJvbQo+IHBhbmZyb3N0X3JlZ3VsYXRvcl9pbml0KCkgd2lsbCBiZSAtRVBST0JFX0RF
RkVSIGNhdXNpbmcgYW5vdGhlcgo+IGRldl9lcnIoKSBvdXRwdXQ6Cj4gCj4gICAgICAgICBlcnIg
PSBwYW5mcm9zdF9yZWd1bGF0b3JfaW5pdChwZmRldik7Cj4gICAgICAgICBpZiAoZXJyKSB7Cj4g
ICAgICAgICAgICAgICAgIGRldl9lcnIocGZkZXYtPmRldiwgInJlZ3VsYXRvciBpbml0IGZhaWxl
ZCAlZFxuIiwgZXJyKTsKPiAgICAgICAgICAgICAgICAgZ290byBlcnJfb3V0MDsKPiAgICAgICAg
IH0KPiAKPiBDYW4geW91IGZpeCB0aGF0IHVwIGFzIHdlbGw/IE9yIGluZGVlZCBkcm9wIGl0IGFs
dG9nZXRoZXIgc2luY2UKPiBwYW5mcm9zdF9yZWd1bGF0b3JfaW5pdCgpIGFscmVhZHkgb3V0cHV0
cyBhbiBhcHByb3ByaWF0ZSBtZXNzYWdlLgoKSSdsbCBkcm9wIHRoaXMgZXJyb3IgbWVzc2FnZSB0
aGVuLiBUaGFua3MgZm9yIGZlZWRiYWNrIQoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
