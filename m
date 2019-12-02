Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E07FD10EFE5
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D8B6E2B1;
	Mon,  2 Dec 2019 19:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE0D6E250;
 Mon,  2 Dec 2019 19:14:40 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id w16so328204qvn.4;
 Mon, 02 Dec 2019 11:14:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=QIwY2zPo3ipb4HjrxhdMR+nMxJM+BtZphU9RF6iDWeU=;
 b=ITAWZD5HFPYXlnovBWxwoAChyDW4l2i7ZaausnS9ti7nowM4BjlX1YVPdd+5FafCo/
 hrC7iyiNRdN88zvzZZYLTFZyVfIdfQpRA0Mylx6JnGfrViSvBgd5nyNkBp3qwrRslzNt
 891DcnH4TIhPpC/zD2As9dJbFNUuXxzZpSbnUXHFqXuCSCGwZSWAcKRekCQ6yJQBwTXb
 CiIsTYOJEFUfeDe5FY/IhXRIWahX/C1qi4xS9fZ61ZRE54ilVfqN2HMwyY6pBlFh97zO
 JY/TFlX5Uw1L65olRFbViexPR5MCdsCOKdzstXpv+1GfrU4deIBrcglTNGi0cLg/IR1h
 udpg==
X-Gm-Message-State: APjAAAWZDaKUOGjBISrJjZTiYo1n6ViqKAW2sfQ7EQxIvKPEwQtv+fEI
 dW1My/MkWpum6dOIDR/fZjQ=
X-Google-Smtp-Source: APXvYqxlV4KPPBpwnmKUj99p+IArO+a+uhEWMvRZMhQZytthgNgfB57f9MGSo2YD2rbVnoE4GYregw==
X-Received: by 2002:a05:6214:1709:: with SMTP id
 db9mr711187qvb.68.1575314079340; 
 Mon, 02 Dec 2019 11:14:39 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::1:c909])
 by smtp.gmail.com with ESMTPSA id i17sm231520qtm.53.2019.12.02.11.14.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Dec 2019 11:14:38 -0800 (PST)
Date: Mon, 2 Dec 2019 11:14:36 -0800
From: Tejun Heo <tj@kernel.org>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [PATCH RFC v4 02/16] cgroup: Introduce cgroup for drm subsystem
Message-ID: <20191202191436.GG16681@devbig004.ftw2.facebook.com>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190829060533.32315-3-Kenny.Ho@amd.com>
 <20191001143106.GA4749@blackbody.suse.cz>
 <CAOWid-ewvs-c-z_WW+Cx=Jaf0p8ZAwkWCkq2E8Xkj+2HvfNjaA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOWid-ewvs-c-z_WW+Cx=Jaf0p8ZAwkWCkq2E8Xkj+2HvfNjaA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=QIwY2zPo3ipb4HjrxhdMR+nMxJM+BtZphU9RF6iDWeU=;
 b=TvFns/ZrhMMvvKw4xSqFeBbOm3xLJ3LdC6WG77/3x7nQJkVazjKafuDUdNO3tPdkaO
 IQvLpcGQEQTu78eLkQoY8CGRR6caHMUmy6qEsLPEft/bCWZDOq9N+YJI38GxygJ2cYvV
 RxQqhCUY1Y+DRbLvhZeC6pM2z1GPCGD2QTHqbV5o6E/59krKxPT9+j58A4d0jQXUB/f8
 WmSZ12On6OUXjzH9ukX0PHCRsSWWwO7wG54OlDFXhSr8ICv5ELG0PN+lzC//7iGoRFOU
 CVsyBKPlob68Fwwo3yeQoEawwG+GB4rSmQu9N611J3VlVvJD8BH+HR3XMgro8itIVVrR
 aKbQ==
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, "Kuehling, Felix" <felix.kuehling@amd.com>,
 jsparks@cray.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 lkaplan@cray.com, Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Greathouse,
 Joseph" <joseph.greathouse@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMDE6MDA6MzZBTSAtMDUwMCwgS2VubnkgSG8gd3JvdGU6
Cj4gT24gVHVlLCBPY3QgMSwgMjAxOSBhdCAxMDozMSBBTSBNaWNoYWwgS291dG7DvSA8bWtvdXRu
eUBzdXNlLmNvbT4gd3JvdGU6Cj4gPiBPbiBUaHUsIEF1ZyAyOSwgMjAxOSBhdCAwMjowNToxOUFN
IC0wNDAwLCBLZW5ueSBIbyA8S2VubnkuSG9AYW1kLmNvbT4gd3JvdGU6Cj4gPiA+ICtzdHJ1Y3Qg
Y2dyb3VwX3N1YnN5cyBkcm1fY2dycF9zdWJzeXMgPSB7Cj4gPiA+ICsgICAgIC5jc3NfYWxsb2Mg
ICAgICA9IGRybWNnX2Nzc19hbGxvYywKPiA+ID4gKyAgICAgLmNzc19mcmVlICAgICAgID0gZHJt
Y2dfY3NzX2ZyZWUsCj4gPiA+ICsgICAgIC5lYXJseV9pbml0ICAgICA9IGZhbHNlLAo+ID4gPiAr
ICAgICAubGVnYWN5X2NmdHlwZXMgPSBmaWxlcywKPiA+IERvIHlvdSByZWFsbHkgd2FudCB0byBl
eHBvc2UgdGhlIERSTSBjb250cm9sbGVyIG9uIHYxIGhpZXJhcmNoaWVzICh3aGVyZQo+ID4gdGhy
ZWFkcyBvZiBvbmUgcHJvY2VzcyBjYW4gYmUgaW4gZGlmZmVyZW50IGNncm91cHMsIG9yIGNoaWxk
cmVuIGNncm91cHMKPiA+IGNvbXBldGUgd2l0aCB0aGVpciBwYXJlbnRzKT8KPiAKPiAoU29ycnkg
Zm9yIHRoZSBkZWxheSwgSSBoYXZlIGJlZW4gZGlzdHJhY3RlZCBieSBzb21ldGhpbmcgZWxzZS4p
Cj4gWWVzLCBJIGFtIGhvcGluZyB0byBtYWtlIHRoZSBmdW5jdGlvbmFsaXR5IGFzIHdpZGVseSBh
dmFpbGFibGUgYXMKPiBwb3NzaWJsZSBzaW5jZSB0aGUgZWNvc3lzdGVtIGlzIHN0aWxsIHRyYW5z
aXRpb25pbmcgdG8gdjIuICBEbyB5b3Ugc2VlCj4gaW5oZXJlbnQgcHJvYmxlbSB3aXRoIHRoaXMg
YXBwcm9hY2g/CgpJbnRlZ3JhdGluZyB3aXRoIG1lbWNnIGNvdWxkIGJlIG1vcmUgY2hhbGxlbmdp
bmcgb24gY2dyb3VwMS4gIFRoYXQncwpvbmUgb2YgdGhlIHJlYXNvbnMgd2h5IGUuZy4gY2dyb3Vw
LWF3YXJlIHBhZ2VjYWNoZSB3cml0ZWJhY2sgaXMgb25seQpvbiBjZ3JvdXAyLgoKLS0gCnRlanVu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
