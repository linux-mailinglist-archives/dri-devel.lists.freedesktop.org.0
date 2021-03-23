Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD0E3467AA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 19:32:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD6F6E94C;
	Tue, 23 Mar 2021 18:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548966E94C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 18:32:04 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id n140so18048093oig.9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 11:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K+T9J28jjl61wFwR8sOn/dolEBn3Acb0Hwet+RnL6BY=;
 b=XYbt6yoyL5Y2v6flxP+44gcZ3dL+CnxLzJWpu2hooVP8sUQ+0swaj29laUsM46YnY4
 zWC/Vu5/PjYYMOBtdUU7wWRwAHKvDvz97/lWpjV8CmLmHufKiiNleofIGr/Pjikcj4CZ
 uhNWm6rQvsPbmLwFy9MwlMlbYNTktGP3u4qhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K+T9J28jjl61wFwR8sOn/dolEBn3Acb0Hwet+RnL6BY=;
 b=OQtS+au5z3/BCw/P+s8TasyopKfyZR3agDT+5v2lEl+8AT8fke9JJ9LzGilBW0Rl6S
 zpdOteDvIFK8i+s/ztXD3moSyA1KJYk+nTq0LX54NXutNscL79YpsNvRWT2IPTcFljzk
 uv747/5Hz44EqalDWIRowqR9UGX98BDFQRvHcleR7iwZmEFMmqBhvl2kcSnhG5MYxS56
 ZK9wa890WuLEgNYkP97VstVFKUXPc7TMSwiNPRB8CTzl3soXUBt0oiv6rjJYBE7C6h0k
 h7tXZWmQTTJqhE/frT7NVTtML3vNL5aVUCj45+ps28+yOqr/d5eZ56faCCRvAJxA9D5+
 j2Gg==
X-Gm-Message-State: AOAM531ATmYQD58jl6pHrtKAoJ96OX4ZEV7rET69FjIDfEu4657HD/uA
 ZaDfnDzjsCWLRxuwtWVTqCJF8qPp1eIDo8NYRaYXew==
X-Google-Smtp-Source: ABdhPJwxfHSm9T5Jk3b71cbiHY5fTVEkyEwpKQ+6P5xsMEVY2dUm6EFDVxTW0STVyBpKDFqGug64KpWEsoMz4QpdzKA=
X-Received: by 2002:aca:4188:: with SMTP id o130mr4288312oia.101.1616524323733; 
 Tue, 23 Mar 2021 11:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210323084453.366863-1-daniel.vetter@ffwll.ch>
 <20210323084453.366863-2-daniel.vetter@ffwll.ch>
 <_qgkbhnFRPb-XwdmeoSsVd7rlelflxuh9B-f9G8GLZoFIeXj48RGtUoEjws4RV0kI1jZvvZSGbOIcHhLWmI_RKJzzawOO9OIyJjBkG9lQH8=@emersion.fr>
 <CAOFGe94kCGPW3YD31a9OjhKxpvyKGQS-HJVPg8OqVE1j1qpdJA@mail.gmail.com>
In-Reply-To: <CAOFGe94kCGPW3YD31a9OjhKxpvyKGQS-HJVPg8OqVE1j1qpdJA@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 23 Mar 2021 19:31:52 +0100
Message-ID: <CAKMK7uHfA5f68JzCQ26sTXXcE6DVZvtvGMpYZ1vwvt5a2P2OCw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/doc: Add RFC section
To: Jason Ekstrand <jason@jlekstrand.net>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXIgMjMsIDIwMjEgYXQgNjo1NSBQTSBKYXNvbiBFa3N0cmFuZCA8amFzb25Aamxl
a3N0cmFuZC5uZXQ+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXIgMjMsIDIwMjEgYXQgMTI6MDEgUE0g
U2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPiB3cm90ZToKPiA+Cj4gPiBTaWRlIG5vdGU6
IEkgZmVlbCBsaWtlIHdlIGNvdWxkIGhhdmUgYmV0dGVyIGxpbmVzIG9mIGNvbW11bmljYXRpb24K
PiA+IGJldHdlZW4ga2VybmVsIGRldnMgYW5kIHVzZXItc3BhY2UgZGV2cy4gVGhlIG5ldyB1QVBJ
IHJlcXVpcmVtZW50cyBzZWVtCj4gPiB0byBiZSBhIGhpZ2ggYmFycmllciB0byBlbnRyeSBmb3Ig
a2VybmVsIGRldnMuIEhvd2V2ZXIgc29tZXRpbWVzCj4gPiB1c2VyLXNwYWNlIGRldnMgbWlnaHQg
YmUgaW50ZXJlc3RlZCBpbiBoZWxwaW5nIG91dCB3aXRoIHRoZSB1c2VyLXNwYWNlCj4gPiBwYXJ0
4oCmCj4gPgo+ID4gTWF5YmUgaXQgd291bGQgYmUgZ29vZCB0byBDQyBlLmcuIHdheWxhbmQtZGV2
ZWwgZm9yIG5ldyBSRkNzLCBzbyB0aGF0Cj4gPiB1c2VyLXNwYWNlIGRldnMgY2FuIGp1bXAgaW4g
aWYgdGhleSdyZSBpbnRlcmVzdGVkLiBBbmQgYWxzbyBwcm92aWRlCj4gPiBmZWVkYmFjaywgc2lu
Y2UgbmV3IHVBUEkgaXMgaGFyZCB0byBzcG90IGluIHRoZSBzZWEgb2YgbWVzc2FnZXMgaW4KPiA+
IGRyaS1kZXZlbC4KPgo+IFRoYXQncyBhIGdvb2Qgc3VnZ2VzdGlvbi4gIENDaW5nIHdheWxhbmQt
ZGV2IG9yIG1lc2EtZGV2LCBhcwo+IGFwcHJvcHJpYXRlLCB3aXRoIHN1Y2ggZG9jcyBwYXRjaGVz
IHNvdW5kcyBsaWtlIGEgZ29vZCBpZGVhLiAgSSdtIG5vdAo+IHN1cmUgd2hlcmUgd2Ugd291bGQg
cHV0IHRoYXQgaW4gaGVyZSBidXQgaXQgd291bGQgYmUgZ29vZCB0byBjYWxsIG91dC4KCkknbGwg
YWRkIGEgc3VnZ2VzdGlvbiB0byB0aGF0IGV4dGVuZCwgaXQncyBhIGdvb2Qgb25lLgotRGFuaWVs
Ci0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
