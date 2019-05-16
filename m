Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E67B420932
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 16:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532F389612;
	Thu, 16 May 2019 14:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0213789612;
 Thu, 16 May 2019 14:10:19 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id f24so3976050qtk.11;
 Thu, 16 May 2019 07:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=4sDOxMUP58OIR9BfihJ4UZAZRlR6Y13wM0CaqjH6oNE=;
 b=ZRxqc1uqT7yEz/B7CHnBjCv8+v+dcQrbwZB29kwGKGVzoSVJVUIOL0El/6M+xg1m6w
 NnwEzxar8v/m6NXYWPb1rrQzdNFKuMpLzLZc071FRjDw2g7jMg9VpEQqxCFrwZvaAI1+
 cjtly0PnqIrAWNpmXluQLNKl0rXhZqvTZ1YYS36jrHt/aFYHy6zC/16dfHQq/4fXzRLk
 ACJnBQIaqFpu5V391Te9BVZ2j4CIP0dnhYC5IXZTqepEKscK0nvh2lgaOzvtYWxsmh7L
 Cx/BnFo8KaGufurHjdjdiIxMrf7nr23JVae+dTaDjlZAYo4tZsP59oSy/78ZLhQbEDLV
 sJlw==
X-Gm-Message-State: APjAAAV1QGzT8Whe2dSZFazzHKuGSzDjija7pyl22lDpAeb8cHAJ16z5
 mdJEhzsG0RzNHuOFUXmdvKY=
X-Google-Smtp-Source: APXvYqwbWSZUa7+C4SUhRR7nMwltVkifbPmv9MOwZiTJD/HH2P7E+cA10XzeUWDy3BsfOIk4/YIaeg==
X-Received: by 2002:ac8:2edc:: with SMTP id i28mr42310462qta.115.1558015818989; 
 Thu, 16 May 2019 07:10:18 -0700 (PDT)
Received: from localhost ([2620:10d:c091:500::3:30c9])
 by smtp.gmail.com with ESMTPSA id p8sm3389554qta.24.2019.05.16.07.10.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 07:10:18 -0700 (PDT)
Date: Thu, 16 May 2019 07:10:15 -0700
From: Tejun Heo <tj@kernel.org>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [RFC PATCH v2 4/5] drm, cgroup: Add total GEM buffer allocation
 limit
Message-ID: <20190516141015.GC374014@devbig004.ftw2.facebook.com>
References: <20181120185814.13362-1-Kenny.Ho@amd.com>
 <20190509210410.5471-1-Kenny.Ho@amd.com>
 <20190509210410.5471-5-Kenny.Ho@amd.com>
 <d81e8f55-9602-818e-0f9c-1d9d150133b1@intel.com>
 <CAOWid-ftUrVVWPu9KuS8xpWKNQT6_FtxB8gEyEAn9nLD6qxb5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOWid-ftUrVVWPu9KuS8xpWKNQT6_FtxB8gEyEAn9nLD6qxb5Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4sDOxMUP58OIR9BfihJ4UZAZRlR6Y13wM0CaqjH6oNE=;
 b=gqMdqGipCRaZuzcjHF1PBfs5h15q+m/gyx1euVyQWs60klB8iAxKHH295hUzDZ5Dil
 aN1Lsbi7UwxeSod3kZoXguG7TPCHIJgQcKlejv4WFgyAXPKPUv30dsjltoh+s77gEH+s
 oGXGGuHJHZ7iWXvoiNK2TjukdS7hIh+WZjKxzIHjvsyfA2kSDj11XkdYAwPuscuTFXPg
 iie+OAMNP2cdtNDBhnZ123S1/aeZXPM3RPbCSK1i2FE411VCoFcoh26AMtaSafk1K/TM
 Wz0f4nmOXS3Aj+jb3WqHoehP4+HUuHouLzjcc+ZxQ2uhpr1w8NMLTmkGA2jl6yG7EFeX
 M1bA==
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
Cc: sunnanyong@huawei.com, Kenny Ho <Kenny.Ho@amd.com>, "Welty,
 Brian" <brian.welty@intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpJIGhhdmVuJ3QgZ29uZSB0aHJvdWdoIHRoZSBwYXRjaHNldCB5ZXQgYnV0IHNvbWUg
cXVpY2sgY29tbWVudHMuCgpPbiBXZWQsIE1heSAxNSwgMjAxOSBhdCAxMDoyOToyMVBNIC0wNDAw
LCBLZW5ueSBIbyB3cm90ZToKPiBHaXZlbiB0aGlzIGNvbnRyb2xsZXIgaXMgc3BlY2lmaWMgdG8g
dGhlIGRybSBrZXJuZWwgc3Vic3lzdGVtIHdoaWNoCj4gdXNlcyBtaW5vciB0byBpZGVudGlmeSBk
cm0gZGV2aWNlLCBJIGRvbid0IHNlZSBhIG5lZWQgdG8gY29tcGxpY2F0ZQo+IHRoZSBpbnRlcmZh
Y2VzIG1vcmUgYnkgaGF2aW5nIG1ham9yIGFuZCBhIGtleS4gIEFzIHlvdSBjYW4gc2VlIGluIHRo
ZQo+IGV4YW1wbGVzIGJlbG93LCB0aGUgZHJtIGRldmljZSBtaW5vciBjb3JyZXNwb25kcyB0byB0
aGUgbGluZSBudW1iZXIuCj4gSSBhbSBub3Qgc3VyZSBob3cgc3RyaWN0IGNncm91cCB1cHN0cmVh
bSBpcyBhYm91dCB0aGUgY29udmVudGlvbiBidXQgSQoKV2UncmUgcHJldHR5IHN0cmljdC4KCj4g
YW0gaG9waW5nIHRoZXJlIGFyZSBmbGV4aWJpbGl0eSBoZXJlIHRvIGFsbG93IGZvciB3aGF0IEkg
aGF2ZQo+IGltcGxlbWVudGVkLiAgVGhlcmUgYXJlIGEgY291cGxlIG9mIG90aGVyIHRoaW5ncyBJ
IGhhdmUgZG9uZSB0aGF0IGlzCgpTbywgcGxlYXNlIGZvbGxvdyB0aGUgaW50ZXJmYWNlIGNvbnZl
bnRpb25zLiAgV2UgY2FuIGRlZmluaXRlbHkgYWRkCm5ldyBvbmVzIGJ1dCB0aGF0IHdvdWxkIG5l
ZWQgZnVuY3Rpb25hbCByZWFzb25zLgoKPiBub3QgZGVzY3JpYmVkIGluIHRoZSBjb252ZW50aW9u
OiAxKSBpbmNsdXNpb24gb2YgcmVhZC1vbmx5ICouaGVscCBmaWxlCj4gYXQgdGhlIHJvb3QgY2dy
b3VwLCAyKSB1c2UgcmVhZC1vbmx5ICh3aGljaCBJIGNhbiBwb3RlbnRpYWxseSBtYWtlIHJ3KQo+
ICouZGVmYXVsdCBmaWxlIGluc3RlYWQgb2YgaGF2aW5nIGEgZGVmYXVsdCBlbnRyaWVzIChzaW5j
ZSB0aGUgZGVmYXVsdAo+IGNhbiBiZSBkaWZmZXJlbnQgZm9yIGRpZmZlcmVudCBkZXZpY2VzKSBp
bnNpZGUgdGhlIGNvbnRyb2wgZmlsZXMgKHRoaXMKPiB3YXksIHRoZSByZXNldHRpbmcgb2YgY2dy
b3VwIHZhbHVlcyBmb3IgYWxsIHRoZSBkcm0gZGV2aWNlcywgY2FuIGJlCj4gZG9uZSBieSBhIHNp
bXBsZSAnY3AnLikKCkFnYWluLCBwbGVhc2UgZm9sbG93IHRoZSBleGlzdGluZyBjb252ZW50aW9u
cy4gIFRoZXJlJ3MgYSBsb3QgbW9yZQpoYXJtIHRoYW4gZ29vZCBpbiBldmVyeSBjb250cm9sbGVy
IGJlaW5nIGNyZWF0aXZlIGluIHRoZWlyIG93biB3YXkuCkl0J3MgdHJpdmlhbCB0byBidWlsZCBj
b252ZW5pZW5jZSBmZWF0dXJlcyBpbiB1c2Vyc3BhY2UuICBQbGVhc2UgZG8gaXQKdGhlcmUuCgo+
ID4gSXMgdGhpcyByZWFsbHkgdXNlZnVsIGZvciBhbiBhZG1pbmlzdHJhdG9yIHRvIGNvbnRyb2w/
Cj4gPiBJc24ndCB0aGUgcmVzb3VyY2Ugd2Ugd2FudCB0byBjb250cm9sIGFjdHVhbGx5IHRoZSBw
aHlzaWNhbCBiYWNraW5nIHN0b3JlPwo+IFRoYXQncyBjb3JyZWN0LiAgVGhpcyBpcyBqdXN0IHRo
ZSBmaXJzdCBsZXZlbCBvZiBjb250cm9sIHNpbmNlIHRoZQo+IGJhY2tpbmcgc3RvcmUgY2FuIGJl
IGJhY2tlZCBieSBkaWZmZXJlbnQgdHlwZSBvZiBtZW1vcnkuICBJIGFtIGluIHRoZQo+IHByb2Nl
c3Mgb2YgYWRkaW5nIGF0IGxlYXN0IHR3byBtb3JlIHJlc291cmNlcy4gIFN0YXkgdHVuZWQuICBJ
IGFtCj4gZG9pbmcgdGhlIGNoYXJnZSBoZXJlIHRvIGVuZm9yY2UgdGhlIGlkZWEgb2YgImNyZWF0
b3IgaXMgZGVlbWVkIG93bmVyIgo+IGF0IGEgcGxhY2Ugd2hlcmUgdGhlIGNvZGUgaXMgc2hhcmVk
IGJ5IGFsbCAodGhlIGluaXQgZnVuY3Rpb24uKQoKSWRlYWxseSwgY29udHJvbGxlciBzaG91bGQg
b25seSBjb250cm9sIGhhcmQgcmVzb3VyY2VzIHdoaWNoIGltcGFjdApiZWhhdmlvcnMgYW5kIHBl
cmZvcm1hbmNlIHdoaWNoIGFyZSBpbW1lZGlhdGVseSB2aXNpYmxlIHRvIHVzZXJzLgoKVGhhbmtz
LgoKLS0gCnRlanVuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
