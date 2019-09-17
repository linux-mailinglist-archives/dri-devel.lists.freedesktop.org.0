Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2672BB4CB4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 13:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5676EBCD;
	Tue, 17 Sep 2019 11:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05276EBCC;
 Tue, 17 Sep 2019 11:20:16 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id b24so2675587wmj.5;
 Tue, 17 Sep 2019 04:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=fyrkqIX9311l/D++adTO4ErO5BZABk5y2ZCBpx4QRBM=;
 b=mngkv8Vewh0wm6DhgMFEqJSOiUtoyjszRxNcRRibSu94Vba1Km0LnOrgvQFcQ6Ikxm
 w6bPHORmqByxQ6kl1B0bPAGZM5fSXfBxIOCOlE2a4RtuRHXTO0FOoKgBBAIWFdGGmb4R
 c/aXYDFtmQewqIeRy6kDZSXqzikrCljPWPYT77jcyuxBLxqABOQN4XFNziK8eTTOSk+0
 2tHGjGRsB8Zu1OABFTOTIv+jSZs+VgH6FtT52yM3g2vmtK66lf6i+Xh9KayusrQnG4m4
 pGl16zYzRzdZQvfeOFwAEzXvqxO3jlXaUocHqQZq9shJVdk17SaAojMakm14nWGm14v9
 FEmw==
X-Gm-Message-State: APjAAAWVY8BXpd5bsYymnKrXCzsb5X/GnORp1UIH6j1jklf7IbYIdABC
 wfP9ulPiJJ3kSTy5M7xKlr0j9oSo
X-Google-Smtp-Source: APXvYqw1JPuOL1DhECMDfKu2JEqURZcN5Y0n6PCSNrHxD3DYsa/ZVG1Z8KKdSvrLi2V/wHiGjBp4+A==
X-Received: by 2002:a7b:c013:: with SMTP id c19mr2945312wmb.34.1568719215025; 
 Tue, 17 Sep 2019 04:20:15 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id u11sm2313414wmd.32.2019.09.17.04.20.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Sep 2019 04:20:14 -0700 (PDT)
Subject: Re: [PATCH] drm: add drm device name
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20190903214040.2386-1-sonny.jiang@amd.com>
 <CAAxE2A45N4gMYrcETDpznGKyxLztuwenFasL19a81QQmBkYiww@mail.gmail.com>
 <CAF6AEGvvUUOGujJC9P3t72N93AJuxiiVt0OAk8zf226Q8WmHvg@mail.gmail.com>
 <CAKMK7uHFNhdNY4Y9ZFMNuci7gssPWCT5f5y=e4npg8s5r_jBdQ@mail.gmail.com>
 <CAAxE2A6sESsKAi3K1etAZeCwAPgexn099G6g0aJQnavTkiH+mA@mail.gmail.com>
 <87woe7eanv.fsf@intel.com> <03d31464-3968-6923-5323-f63060d70f1f@gmail.com>
 <CAKMK7uEj4FZ3YQqG-cCTa4EEaJoAk09Zaz398F9Hmo+mdXCKiw@mail.gmail.com>
 <7540df63-e623-19b0-dde5-b89ff2b7fb89@amd.com>
 <7535dcf4-413f-f06f-b3d1-dcffc86b43e0@daenzer.net>
 <5d0a8619-7073-fac2-cdd6-83b55221140b@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b61ec704-894d-092a-253c-961ff2ea01a2@gmail.com>
Date: Tue, 17 Sep 2019 13:20:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5d0a8619-7073-fac2-cdd6-83b55221140b@daenzer.net>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=fyrkqIX9311l/D++adTO4ErO5BZABk5y2ZCBpx4QRBM=;
 b=FOt/zej3o73XdvboV7wY8lzQN4AmuMvR6UbECGf9P6BsqslNzVbIESYa0F3ooE/zQ5
 G5O8ywvuyYUeYheZmxxtiUNlX7P7WsCK+RPcM7x3/2Qg9EJmkgR9QF2RX2VXfvkRoi3n
 LP1JNjJxUZveKAENBw0/g/wGbANKKL1LKn+SakgoI/C4p6BoVgC3FKfIwGTnE3l90fjv
 77HQcJu/j3tFIlWRI6P9HIqvjOwevj2C88urgb72fj5/k7F33v/fqypmVH2/6X9b/4vc
 rwARPotylkKzYnOZpnRl5mDSZcJqCFqbmXIykEK7dXxmTrMvxmuJJq5pxbHvRh9rc0bH
 3DZg==
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
Reply-To: christian.koenig@amd.com
Cc: "Jiang, Sonny" <Sonny.Jiang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDkuMTkgdW0gMTE6Mjcgc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPiBPbiAyMDE5LTA5
LTE3IDExOjIzIGEubS4sIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+PiBPbiAyMDE5LTA5LTE3IDEw
OjIzIGEubS4sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOgo+Pj4gQW0gMTcuMDkuMTkgdW0gMTA6
MTcgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+Pj4+IE9uIFR1ZSwgU2VwIDE3LCAyMDE5IGF0IDEw
OjEyIEFNIENocmlzdGlhbiBLw7ZuaWcKPj4+PiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFp
bC5jb20+IHdyb3RlOgo+Pj4+PiBBbSAxNy4wOS4xOSB1bSAwNzo0NyBzY2hyaWViIEphbmkgTmlr
dWxhOgo+Pj4+Pj4gT24gTW9uLCAxNiBTZXAgMjAxOSwgTWFyZWsgT2zFocOhayA8bWFyYWVvQGdt
YWlsLmNvbT4gd3JvdGU6Cj4+Pj4+Pj4gVGhlIHB1cnBvc2UgaXMgdG8gZ2V0IHJpZCBvZiBhbGwg
UENJIElEIHRhYmxlcyBmb3IgYWxsIGRyaXZlcnMgaW4KPj4+Pj4+PiB1c2Vyc3BhY2UuIChvciBh
dCBsZWFzdCBzdG9wIHVwZGF0aW5nIHRoZW0pCj4+Pj4+Pj4KPj4+Pj4+PiBNZXNhIGNvbW1vbiBj
b2RlIGFuZCBtb2Rlc2V0dGluZyB3aWxsIHVzZSB0aGlzLgo+Pj4+Pj4gSSdkIHRoaW5rIHRoaXMg
d291bGQgd2FycmFudCBhIGhpZ2ggbGV2ZWwgZGVzY3JpcHRpb24gb2Ygd2hhdCB5b3Ugd2FudAo+
Pj4+Pj4gdG8gYWNoaWV2ZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCj4+Pj4+IEFuZCBtYXliZSBl
eHBsaWNpdGx5IGNhbGwgaXQgdWFwaV9uYW1lIG9yIGV2ZW4gdWFwaV9kcml2ZXJfbmFtZS4KPj4+
PiBJZiBpdCdzIHVhcGlfbmFtZSwgdGhlbiB3aHkgZG8gd2UgbmVlZCBhIG5ldyBvbmUgZm9yIGV2
ZXJ5IGdlbmVyYXRpb24/Cj4+Pj4gVXNlcnNwYWNlIGRyaXZlcnMgdGVuZCB0byBzcGFuIGEgbG90
IG1vcmUgdGhhbiBqdXN0IDEgZ2VuZXJhdGlvbi4gQW5kCj4+Pj4gaWYgeW91IHdhbnQgdG8gaGF2
ZSBwZXItZ2VuZXJhdGlvbiBkYXRhIGZyb20gdGhlIGtlcm5lbCB0byB1c2Vyc3BhY2UsCj4+Pj4g
dGhlbiBpbW8gdGhhdCdzIG11Y2ggYmV0dGVyIHN1aXRlZCBpbiBzb21lIGFtZGdwdSBpb2N0bCwg
aW5zdGVhZCBvZgo+Pj4+IHRyeWluZyB0byBlbmNvZGUgdGhhdCBpbnRvIHRoZSBkcml2ZXIgbmFt
ZS4KPj4+IFdlbGwgd2UgYWxyZWFkeSBoYXZlIGFuIElPQ1RMIGZvciB0aGF0LCBidXQgSSB0aG91
Z2h0IHRoZSBpbnRlbnRpb24gaGVyZQo+Pj4gd2FzIHRvIGdldCByaWQgb2YgdGhlIFBDSS1JRCB0
YWJsZXMgaW4gdXNlcnNwYWNlIHRvIGZpZ3VyZSBvdXQgd2hpY2gKPj4+IGRyaXZlciB0byBsb2Fk
Lgo+PiBUaGF0J3MganVzdCB1bnJlYWxpc3RpYyBpbiBnZW5lcmFsLCBJJ20gYWZyYWlkLiBTZWUg
ZS5nLiB0aGUgb25nb2luZwo+PiB0cmFuc2l0aW9uIGZyb20gaTk2NSB0byBpcmlzIGZvciByZWNl
bnQgSW50ZWwgaGFyZHdhcmUuIEhvdyBpcyB0aGUKPj4ga2VybmVsIHN1cHBvc2VkIHRvIGtub3cg
d2hpY2ggZHJpdmVyIGlzIHRvIGJlIHVzZWQ/CgpXZWxsIGhvdyBpcyB1c2Vyc3BhY2UgY3VycmVu
dGx5IGhhbmRsaW5nIHRoYXQ/IFRoZSBrZXJuZWwgc2hvdWxkIE5PVCBzYXkgCndoaWNoIGRyaXZl
ciB0byB1c2UgaW4gdXNlcnNwYWNlLCBidXQgcmF0aGVyIHdoaWNoIG9uZSBpcyB1c2VkIGluIHRo
ZSAKa2VybmVsLgoKTWFwcGluZyB0aGF0IGluZm9ybWF0aW9uIHRvIGFuIHVzZXJzcGFjZSBkcml2
ZXIgc3RpbGwgbmVlZHMgdG8gYmUgZG9uZSAKc29tZXdoZXJlIGVsc2UsIGJ1dCB0aGUgZGlmZmVy
ZW5jZSBpcyB0aGF0IHlvdSBkb24ndCBuZWVkIHRvIGFkZCBhbGwgClBDSS1JRHMgdHdpY2UuCgpD
aHJpc3RpYW4uCgo+Pgo+Pgo+PiBGb3IgdGhlIFhvcmcgbW9kZXNldHRpbmcgZHJpdmVyLCB0aGVy
ZSdzIGEgc2ltcGxlIHNvbHV0aW9uLCBzZWUKPj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL3hvcmcveHNlcnZlci9tZXJnZV9yZXF1ZXN0cy8yNzggLgo+PiBTb21ldGhpbmcgc2ltaWxh
ciBjYW4gcHJvYmFibHkgYmUgZG9uZSBpbiBNZXNhIGFzIHdlbGwuCj4gQW5vdGhlciBwb3NzaWJp
bGl0eSBtaWdodCBiZSBmb3IgWG9yZyB0byB1c2UKPiBodHRwczovL3d3dy5raHJvbm9zLm9yZy9y
ZWdpc3RyeS9FR0wvZXh0ZW5zaW9ucy9NRVNBL0VHTF9NRVNBX3F1ZXJ5X2RyaXZlci50eHQKPiB0
byBkZXRlcm1pbmUgdGhlIGRyaXZlciBuYW1lLiBUaGVuIG9ubHkgTWVzYSBtaWdodCBuZWVkIGFu
eSBIVyBzcGVjaWZpYwo+IGNvZGUuCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
