Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B95A845B6
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF8A6E62A;
	Wed,  7 Aug 2019 07:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBB46E54C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 20:03:58 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id w17so5287458qto.10
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 13:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=X4WStm4sd99gxcsiHRK905oUotgl76w2o1W1C4yVJ6I=;
 b=B3tHhNTMvQt3RdxL7fyaTZtrjuQHf5gz/NkMxYJavzsIaW6W96XyFVRdtFjYRrvPA8
 9f62/qzUSj+6Aw9J1xk+oq6LDoX6kPOKTQi6qo4mF1bbQg4ASoWSqwrWQLWTlcadHkFn
 dkJ/2X5pX6GTmxlYOS5d3mn61rdib0c13iraxrlqwFPtD8kXkbuqMHwi4Ylqgjnj3X71
 zYyQmYMTYtfboTtCZgbQNUdlqBC4uRSORb5ZqHPFhRFvx/9yETdPaM7fIhak0yplXMT7
 k1calPqNp8xuzbJ9el9Wu2pvdApDi8BcSP0gM9m5FsYwWb6qKyh0gtFqQkdsA7myxwIk
 U67Q==
X-Gm-Message-State: APjAAAXkIhqiLCDkfjvfqiONI/4csUvKPgUo2bVRK1InBeirIr63S8/n
 pO0wsNO/7Iq6AZigzG1eHUtfjw==
X-Google-Smtp-Source: APXvYqx6UY5l/vYT32k/wTnl8SPfwuXYE5Fx1fiKKYFrCmOXi/6TIYwyn3yhKlGhO9HMcVXQYwiuNw==
X-Received: by 2002:ac8:3118:: with SMTP id g24mr4769493qtb.390.1565121837686; 
 Tue, 06 Aug 2019 13:03:57 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id g10sm35341761qki.37.2019.08.06.13.03.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 13:03:57 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hv5ga-0003dB-O6; Tue, 06 Aug 2019 17:03:56 -0300
Date: Tue, 6 Aug 2019 17:03:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 15/15] amdgpu: remove CONFIG_DRM_AMDGPU_USERPTR
Message-ID: <20190806200356.GU11627@ziepe.ca>
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-16-hch@lst.de>
 <20190806174437.GK11627@ziepe.ca>
 <587b1c3c-83c4-7de9-242f-6516528049f4@amd.com>
 <CADnq5_Puv-N=FVpNXhv7gOWZ8=tgBD2VjrKpVzEE0imWqJdD1A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_Puv-N=FVpNXhv7gOWZ8=tgBD2VjrKpVzEE0imWqJdD1A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=X4WStm4sd99gxcsiHRK905oUotgl76w2o1W1C4yVJ6I=;
 b=dcd3JYDJk152NlFfhO/9qO7tld2EmCF8YFkFxS8Gs6O3Eoi2v5a/p+kLVV72KaaDZH
 4AOPO6UQwsqqSpKlkkmk62Hxppen7/IFJKSpOLIvaEcL3N5LOWdJcJ3uwdOeXMO99Q9Q
 Y+QyzsRM0n6nW3nAnKygZxiG5A+b6hJR/51n9u0k+imi9/6Ip/PFhv8jDVoF1QLCfhOE
 mc8U5KqjaSeDQJIru7Rkv0aQxcqZ/bBs3+8ohxG0EleOYIJ0yGSZ17/3ZQ9kmYzGdGc9
 lnGhK+bfHIxMwOWyuDrIFwNQZiRvrAKnQOXdx2VYo9gZpFBLdNdodmHnLp7wXWjv5EFF
 EsSQ==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Christoph Hellwig <hch@lst.de>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDI6NTg6NThQTSAtMDQwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+IE9uIFR1ZSwgQXVnIDYsIDIwMTkgYXQgMTo1MSBQTSBLdWVobGluZywgRmVsaXggPEZl
bGl4Lkt1ZWhsaW5nQGFtZC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIDIwMTktMDgtMDYgMTM6NDQs
IEphc29uIEd1bnRob3JwZSB3cm90ZToKPiA+ID4gT24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDc6
MDU6NTNQTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiA+PiBUaGUgb3B0aW9u
IGlzIGp1c3QgdXNlZCB0byBzZWxlY3QgSE1NIG1pcnJvciBzdXBwb3J0IGFuZCBoYXMgYSB2ZXJ5
Cj4gPiA+PiBjb25mdXNpbmcgaGVscCB0ZXh0LiAgSnVzdCBwdWxsIGluIHRoZSBITU0gbWlycm9y
IGNvZGUgYnkgZGVmYXVsdAo+ID4gPj4gaW5zdGVhZC4KPiA+ID4+Cj4gPiA+PiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiA+ID4+ICAgZHJpdmVycy9ncHUv
ZHJtL0tjb25maWcgICAgICAgICAgICAgICAgIHwgIDIgKysKPiA+ID4+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvS2NvbmZpZyAgICAgIHwgMTAgLS0tLS0tLS0tLQo+ID4gPj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgfCAgNiAtLS0tLS0KPiA+ID4+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5oIHwgMTIgLS0tLS0tLS0tLS0t
Cj4gPiA+PiAgIDQgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMo
LSkKPiA+ID4gRmVsaXgsIHdhcyB0aGlzIGFuIGVmZm9ydCB0byBhdm9pZCB0aGUgYXJjaCByZXN0
cmljdGlvbiBvbiBobW0gb3IKPiA+ID4gc29tZXRoaW5nPyBBbHNvIGNhbid0IHNlZSB3aHkgdGhp
cyB3YXMgbGlrZSB0aGlzLgo+ID4KPiA+IFRoaXMgb3B0aW9uIHByZWRhdGVzIEtGRCdzIHN1cHBv
cnQgb2YgdXNlcnB0cnMsIHdoaWNoIGluIHR1cm4gcHJlZGF0ZXMKPiA+IEhNTS4gUmFkZW9uIGhh
cyB0aGUgc2FtZSBraW5kIG9mIG9wdGlvbiwgdGhvdWdoIGl0IGRvZXNuJ3QgYWZmZWN0IEhNTSBp
bgo+ID4gdGhhdCBjYXNlLgo+ID4KPiA+IEFsZXgsIENocmlzdGlhbiwgY2FuIHlvdSB0aGluayBv
ZiBhIGdvb2QgcmVhc29uIHRvIG1haW50YWluIHVzZXJwdHIKPiA+IHN1cHBvcnQgYXMgYW4gb3B0
aW9uIGluIGFtZGdwdT8gSSBzdXNwZWN0IGl0IHdhcyBvcmlnaW5hbGx5IG1lYW50IGFzIGEKPiA+
IHdheSB0byBhbGxvdyBrZXJuZWxzIHdpdGggYW1kZ3B1IHdpdGhvdXQgTU1VIG5vdGlmaWVycy4g
Tm93IGl0IHdvdWxkCj4gPiBhbGxvdyBhIGtlcm5lbCB3aXRoIGFtZGdwdSB3aXRob3V0IEhNTSBv
ciBNTVUgbm90aWZpZXJzLiBJIGRvbid0IGtub3cgaWYKPiA+IHRoaXMgaXMgYSB1c2VmdWwgdGhp
bmcgdG8gaGF2ZS4KPiAKPiBSaWdodC4gIFRoZXJlIHdlcmUgcGVvcGxlIHRoYXQgZGlkbid0IGhh
dmUgTU1VIG5vdGlmaWVycyB0aGF0IHdhbnRlZAo+IHN1cHBvcnQgZm9yIHRoZSBHUFUuCgo/PyBJ
cyB0aGF0IGV2ZW4gYSByZWFsIHRoaW5nPyBtbXVfbm90aWZpZXIgZG9lcyBub3QgaGF2ZSBtdWNo
IGtjb25maWcKZGVwZW5kZW5jeS4KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
