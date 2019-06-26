Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC2A572A6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 22:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845186E509;
	Wed, 26 Jun 2019 20:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920846E503;
 Wed, 26 Jun 2019 20:37:43 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k11so4293645wrl.1;
 Wed, 26 Jun 2019 13:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PoKojTv4DP1CTaPk4hl31T1ZiHUB+yaY0GHfGPmG7PM=;
 b=traBG78wGAhnEAEexF9+eRM5CaaRk1U7fpm7UFbOcLzWaBDCwi7JbL+gMhQPwEPnFX
 TL35xTrro/rmiB9f9uqY3NeHpqMjHOxHKKnw41fBGaW5x5vzi3aAivwiGMo8yN8pAeVM
 A7dfCl+bsoHaplXqoYmXv1nHPkiN33NdxPEpcWrgtqcZ/o/Gw1qptlkwkWEhLYoPr9r1
 /yMtoPunQ0383uBwFFUYd9FTbWGi21kasVlgoOMZgeCgef1mHQZ9BRsjGyb7qe3vi1dS
 Oa/GS9pYRoHhODHqvknIobGxYO2LXc1HfG5paPZUVU3dXg5ijmEorUHNTj+fuDNzfWNP
 wNKA==
X-Gm-Message-State: APjAAAWjcw2y2+MWaBYN2kKTrtR3VRPo1fZHVXS64gzu0XlKRqMCADnw
 TDnHRzm1AC/FN0bm3MbdOYHeWDYrkBx8z7FEN4Q=
X-Google-Smtp-Source: APXvYqwtqlEbO8+EMh/ywP0aoBCzVSiuqXGkS4Jdu/wv5ptIaGrtHk2EKqYsmvsmVqAnmd6ZpSYApKlu1XeSlNhqCKo=
X-Received: by 2002:adf:e9c6:: with SMTP id l6mr5384686wrn.216.1561581462095; 
 Wed, 26 Jun 2019 13:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
 <20190626150522.11618-3-Kenny.Ho@amd.com>
 <20190626155605.GQ12905@phenom.ffwll.local>
In-Reply-To: <20190626155605.GQ12905@phenom.ffwll.local>
From: Kenny Ho <y2kenny@gmail.com>
Date: Wed, 26 Jun 2019 16:37:30 -0400
Message-ID: <CAOWid-cDopwjMns+c=fRpUA-z51zU=YbDC2QCVUXDjjTiyRcXw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 02/11] cgroup: Add mechanism to register DRM devices
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=PoKojTv4DP1CTaPk4hl31T1ZiHUB+yaY0GHfGPmG7PM=;
 b=eUqmKVHgMpukYvvbovqdh1LhXRpdrgqpQKey28jlQCM+Z2NyKA/h27OpNMKUxV6bYV
 5BX8neOV3Bed+Va0CkiQNd8/4a2FU5bIPkS2HLD8lmbJRZAlAdnU5nbCHNPmSw/+pch2
 AbPIIiiK+qSWrkNz7jfKIZv5FX/Yzoz63Uam7VUJtTjKCm/iKPYKzNEPGKvI5EjBHXb8
 vQ9Ub1oczsHWAS2GDPptvCvvWA5kaivBOQrZ2jPY4H7CUedY352otYLsf0cbTAuqcEgx
 3jqkv84tdl7nSmo5Ez2hl1q8jt5RnBv1CMU9ZCsBS6NQ5yfdIXHOilRrGNQ0dJxTx2VM
 Nw7g==
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, jsparks@cray.com,
 amd-gfx@lists.freedesktop.org, lkaplan@cray.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 joseph.greathouse@amd.com, Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KHNlbmRpbmcgYWdhaW4sIEkga2VlcCBtaXNzaW5nIHRoZSByZXBseS1hbGwgaW4gZ21haWwuKQoK
T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMTE6NTYgQU0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPiB3cm90ZToKPgo+IFdoeSB0aGUgc2VwYXJhdGUsIGV4cGxpY2l0IHJlZ2lzdHJhdGlv
biBzdGVwPyBJIHRoaW5rIGEgc2ltcGxlciBkZXNpZ24gZm9yCj4gZHJpdmVycyB3b3VsZCBiZSB0
aGF0IHdlIHNldCB1cCBjZ3JvdXBzIGlmIHRoZXJlJ3MgYW55dGhpbmcgdG8gYmUKPiBjb250cm9s
bGVkLCBhbmQgdGhlbiBmb3IgR0VNIGRyaXZlcnMgdGhlIGJhc2ljIEdFTSBzdHVmZiB3b3VsZCBi
ZSBzZXQgdXAKPiBhdXRvbWljYWxseSAodGhlcmUncyByZWFsbHkgbm8gcmVhc29uIG5vdCB0byBJ
IHRoaW5rKS4KCklzIHRoaXMgd2hhdCB5b3UgbWVhbiB3aXRoIHRoZSBjb21tZW50IGFib3V0IGRy
bV9kZXZfcmVnaXN0ZXIgYmVsb3c/CkkgdGhpbmsgSSB1bmRlcnN0YW5kIHdoYXQgeW91IGFyZSBz
YXlpbmcgYnV0IG5vdCBzdXBlciBjbGVhci4gIEFyZSB5b3UKc3VnZ2VzdGluZyB0aGUgdXNlIG9m
IGRyaXZlciBmZWF0dXJlIGJpdHMgKGRybV9jb3JlX2NoZWNrX2ZlYXR1cmUsCmV0Yy4pIHNpbWls
YXIgdG8gdGhlIHdheSBCcmlhbiBXZWx0eSBkaWQgaW4gaGlzIHByb3Bvc2FsIGluIE1heT8KCj4g
QWxzbyB0eWluZyB0byB0aGUgbWlub3IgaXMgYSBiaXQgZnVua3ksIHNpbmNlIHdlIGhhdmUgbXVs
dGlwbGUgb2YgdGhlc2UuCj4gTmVlZCB0byBtYWtlIHN1cmUgd2VyZSBhdCBsZWFzdCBjb25zaXN0
ZW50IHdpdGggd2hldGhlciB3ZSB1c2UgdGhlIHByaW1hcnkKPiBvciByZW5kZXIgbWlub3IgLSBJ
J2QgYWx3YXlzIGdvIHdpdGggdGhlIHByaW1hcnkgb25lIGxpa2UgeW91IGRvIGhlcmUuCgpVbS4u
LiBjb21lIHRvIHRoaW5rIG9mIGl0LCBJIGNhbiBwcm9iYWJseSBlbWJlZCBzdHJ1Y3QgZHJtY2dy
cF9kZXZpY2UKaW50byBkcm1fZGV2aWNlIGFuZCB0aGF0IHdheSBJIGRvbid0IHJlYWxseSBuZWVk
IHRvIGtlZXAgYSBzZXBhcmF0ZQphcnJheSBvZgprbm93bl9kcm1jZ3JwX2RldnMgYW5kIGdldCBy
aWQgb2YgdGhhdCBtYXhfbWlub3IgdGhpbmcuICBOb3Qgc3VyZSB3aHkKSSBkaWRuJ3QgdGhpbmsg
b2YgdGhpcyBiZWZvcmUuCgo+ID4gKwo+ID4gK2ludCBkcm1jZ3JwX3JlZ2lzdGVyX2RldmljZShz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+Cj4gSW1vIHRoaXMgc2hvdWxkIGJlIGRvbmUgYXMgcGFy
dCBvZiBkcm1fZGV2X3JlZ2lzdGVyIChtYXliZSBvbmx5IGlmIHRoZQo+IGRyaXZlciBoYXMgc2V0
IHVwIGEgY29udHJvbGxlciBvciBzb21ldGhpbmcpLiBEZWZpbml0ZWx5IHdpdGggdGhlCj4gdW5y
ZWdpc3RlciBsb2dpYyBiZWxvdy4gQWxzbyBhbnl0aGluZyB1c2VkIGJ5IGRyaXZlcnMgbmVlZHMg
a2VybmVsZG9jLgo+Cj4KPiA+ICsgICAgIC8qIGluaXQgY2dyb3VwcyBjcmVhdGVkIGJlZm9yZSBy
ZWdpc3RyYXRpb24gKGkuZS4gcm9vdCBjZ3JvdXApICovCj4gPiArICAgICBpZiAocm9vdF9kcm1j
Z3JwICE9IE5VTEwpIHsKPiA+ICsgICAgICAgICAgICAgc3RydWN0IGNncm91cF9zdWJzeXNfc3Rh
dGUgKnBvczsKPiA+ICsgICAgICAgICAgICAgc3RydWN0IGRybWNncnAgKmNoaWxkOwo+ID4gKwo+
ID4gKyAgICAgICAgICAgICByY3VfcmVhZF9sb2NrKCk7Cj4gPiArICAgICAgICAgICAgIGNzc19m
b3JfZWFjaF9kZXNjZW5kYW50X3ByZShwb3MsICZyb290X2RybWNncnAtPmNzcykgewo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIGNoaWxkID0gY3NzX2RybWNncnAocG9zKTsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBpbml0X2RybWNncnAoY2hpbGQsIGRldik7Cj4gPiArICAgICAgICAgICAg
IH0KPiA+ICsgICAgICAgICAgICAgcmN1X3JlYWRfdW5sb2NrKCk7Cj4KPiBJIGhhdmUgbm8gaWRl
YSwgYnV0IGlzIHRoaXMgZ3VhcmFudGVlZCB0byBnZXQgdGhlbSBhbGw/CgpJIGJlbGlldmUgc28s
IGJhc2Ugb24gbXkgdW5kZXJzdGFuZGluZyBhYm91dApjc3NfZm9yX2VhY2hfZGVzY2VuZGFudF9w
cmUgYW5kIGhvdyBJIGFtIHN0YXJ0aW5nIGZyb20gdGhlIHJvb3QKY2dyb3VwLiAgSG9wZWZ1bGx5
IEkgZGlkbid0IG1pc3MgYW55dGhpbmcuCgpSZWdhcmRzLApLZW5ueQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
