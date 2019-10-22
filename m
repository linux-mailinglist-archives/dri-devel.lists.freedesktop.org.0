Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52729DFFBB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 10:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67946E45F;
	Tue, 22 Oct 2019 08:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0DD6E45F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:42:14 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e11so8310402wrv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 01:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=CCoUEx7pgvSwkd52sbHiDWqhbn6D15dx3IidcUSOlCs=;
 b=f75jsznureId8BJB4zSU9PFJZj251ozOPoh7xueM4OpCHP/IkWi5bJIBEMBhDA37GU
 FOvnPjb3pbT/OWp+gO9oBnvo4ygHlDmrW+4qJnMtV8vKxhtK+01Ea1YhOcauHN6wwOSO
 XcSDJRol+7tTLXWSRr9o+DXbwRAuz/NaC6m9UT0/awwvYAzV8Bh1SA69dV4jf8XUIEQR
 K/uZY9Nq0upRB8ciD3/TzyfqLlCVACDXzrnd9sgcsnfisONnOHKdsR6Z5dw6Z68BuC2I
 ArtScAGm8msHJ+8Q1DoY1mhZRKvQTJQeSsxIKu8Q1bwD0xm+YzgLWKGLBCtnNTofDphW
 6vCg==
X-Gm-Message-State: APjAAAX/6ffCxV/Ga/Z9NMPRHlJ/qFYoFq5v+o3ExiYHneJtGxStVAQN
 edf7K1YZY7qW3xx/yQTiql0pKXYn5Gw=
X-Google-Smtp-Source: APXvYqysKcOFImNh7q+xLEnI5+oG8yvXGOPWq0yok1GRmNS4PwSgal7nZQXzjWKsbnuYzK3jXSOCnw==
X-Received: by 2002:adf:c409:: with SMTP id v9mr2344929wrf.41.1571733732870;
 Tue, 22 Oct 2019 01:42:12 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id d4sm24692928wrc.54.2019.10.22.01.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 01:42:12 -0700 (PDT)
Date: Tue, 22 Oct 2019 10:42:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Message-ID: <20191022084210.GX11828@phenom.ffwll.local>
Mail-Followup-To: Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Brian Starkey <Brian.Starkey@arm.com>, nd <nd@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Sean Paul <sean@poorly.run>
References: <20191004143418.53039-4-mihail.atanassov@arm.com>
 <20191009055407.GA3082@jamwan02-TSP300>
 <5390495.Gzyn2rW8Nj@e123338-lin>
 <20191016162206.u2yo37rtqwou4oep@DESKTOP-E1NTVVP.localdomain>
 <20191017030752.GA3109@jamwan02-TSP300>
 <20191017082043.bpiuvfr3r4jngxtu@DESKTOP-E1NTVVP.localdomain>
 <20191017102055.GA8308@jamwan02-TSP300>
 <20191017104812.6qpuzoh5bx5i2y3m@DESKTOP-E1NTVVP.localdomain>
 <20191017114137.GC25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017114137.GC25745@shell.armlinux.org.uk>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=CCoUEx7pgvSwkd52sbHiDWqhbn6D15dx3IidcUSOlCs=;
 b=Dnqw8eUlpREisKkdtKQIU3R7AtWD+I7KGdKQt39MsbLsH6Qoc355nKrI0tHLiqB3NG
 /Y4Dn9+GMLBCqAfugauXi/usjnov8QawMPImXtU3CjjRKa7jMHE2ZeArfrFGVHD/rFE1
 xT/hLokfxu1BCgHKdBRBCGLOgTZF0se9W2/2o=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTI6NDE6MzdQTSArMDEwMCwgUnVzc2VsbCBLaW5nIC0g
QVJNIExpbnV4IGFkbWluIHdyb3RlOgo+IE9uIFRodSwgT2N0IDE3LCAyMDE5IGF0IDEwOjQ4OjEy
QU0gKzAwMDAsIEJyaWFuIFN0YXJrZXkgd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAxNywgMjAxOSBh
dCAxMDoyMTowM0FNICswMDAwLCBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5h
KSB3cm90ZToKPiA+ID4gT24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMDg6MjA6NTZBTSArMDAwMCwg
QnJpYW4gU3RhcmtleSB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIE9jdCAxNywgMjAxOSBhdCAwMzow
Nzo1OUFNICswMDAwLCBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90
ZToKPiA+ID4gPiA+IE9uIFdlZCwgT2N0IDE2LCAyMDE5IGF0IDA0OjIyOjA3UE0gKzAwMDAsIEJy
aWFuIFN0YXJrZXkgd3JvdGU6Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBJZiBKYW1lcyBpcyBz
dHJvbmdseSBhZ2FpbnN0IG1lcmdpbmcgdGhpcywgbWF5YmUgd2UganVzdCBzd2FwCj4gPiA+ID4g
PiA+IHdob2xlc2FsZSB0byBicmlkZ2U/IEJ1dCBmb3IgbWUsIHRoZSBwcmFnbWF0aWMgYXBwcm9h
Y2ggd291bGQgYmUgdGhpcwo+ID4gPiA+ID4gPiBzdG9wLWdhcC4KPiA+ID4gPiA+ID4KPiA+ID4g
PiA+IAo+ID4gPiA+ID4gVGhpcyBpcyBhIGdvb2QgaWRlYSwgYW5kIEkgdm90ZSArVUxPTkdfTUFY
IDopCj4gPiA+ID4gPiAKPiA+ID4gPiA+IGFuZCBJIGFsc28gY2hlY2tlZCB0ZGE5OTh4IGRyaXZl
ciwgaXQgc3VwcG9ydHMgYnJpZGdlLiBzbyBzd2FwIHRoZQo+ID4gPiA+ID4gd2hvbGVzYWxlIHRv
IGJyaWdlIGlzIHBlcmZlY3QuIDopCj4gPiA+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiBXZWxsLCBh
cyBNaWhhaWwgd3JvdGUsIGl0J3MgZGVmaW5pdGVseSBub3QgcGVyZmVjdC4KPiA+ID4gPiAKPiA+
ID4gPiBUb2RheSwgaWYgeW91IHJtbW9kIHRkYTk5OHggd2l0aCB0aGUgRFBVIGRyaXZlciBzdGls
bCBsb2FkZWQsCj4gPiA+ID4gZXZlcnl0aGluZyB3aWxsIGJlIHVuYm91bmQgZ3JhY2VmdWxseS4K
PiA+ID4gPiAKPiA+ID4gPiBJZiB3ZSBzd2FwIHRvIGJyaWRnZSwgdGhlbiBybW1vZCdpbmcgdGRh
OTk4eCAob3IgYW55IG90aGVyIGJyaWRnZQo+ID4gPiA+IGRyaXZlciB0aGUgRFBVIGlzIHVzaW5n
KSB3aXRoIHRoZSBEUFUgZHJpdmVyIHN0aWxsIGxvYWRlZCB3aWxsIHJlc3VsdAo+ID4gPiA+IGlu
IGEgY3Jhc2guCj4gPiA+IAo+ID4gPiBJIGhhdmVuJ3QgcmVhZCB0aGUgYnJpZGdlIGNvZGUsIGJ1
dCBzZWVtcyB0aGlzIGlzIGEgYnVnIG9mIGRybV9icmlkZ2UsCj4gPiA+IHNpbmNlIGlmIHRoZSBi
cmlkZ2UgaXMgc3RpbGwgaW4gdXNpbmcgYnkgb3RoZXJzLCB0aGUgcm1tb2Qgc2hvdWxkIGZhaWwK
PiA+ID4gCj4gPiAKPiA+IENvcnJlY3QsIGJ1dCB0aGVyZSdzIG5vIGZpeCBmb3IgdGhhdCB0b2Rh
eS4gWW91IGNhbiBhbHNvIHRha2UgYSBsb29rCj4gPiBhdCB0aGUgdGhyZWFkIGxpbmtlZCBmcm9t
IE1paGFpbCdzIGNvdmVyIGxldHRlci4KPiA+IAo+ID4gPiBBbmQgcGVyc29uYWxseSBvcGluaW9u
LCBpZiB0aGUgYnJpZGdlIGRvZXNuJ3QgaGFuZGxlIHRoZSBkZXBlbmRlbmNlLgo+ID4gPiBmb3Ig
dXM6Cj4gPiA+IAo+ID4gPiAtIGFkZCBzdWNoIHN1cHBvcnQgdG8gYnJpZGdlCj4gPiAKPiA+IFRo
YXQgd291bGQgY2VydGFpbmx5IGJlIGhlbHBmdWwuIEkgZG9uJ3Qga25vdyBpZiB0aGVyZSdzIGNv
bnNlbnN1cyBvbgo+ID4gaG93IHRvIGRvIHRoYXQuCj4gPiAKPiA+ID4gICBvcgo+ID4gPiAtIGp1
c3QgZG8gdGhlIGluc21vZC9ybW1vZCBpbiBjb3JyZWN0IG9yZGVyLgo+ID4gPiAKPiA+ID4gPiBT
bywgdGhlcmUgcmVhbGx5IGFyZSBwcm9wZXIgYmVuZWZpdHMgdG8gc3RpY2tpbmcgd2l0aCB0aGUg
Y29tcG9uZW50Cj4gPiA+ID4gY29kZSBmb3IgdGRhOTk4eCwgd2hpY2ggaXMgd2h5IEknZCBsaWtl
IHRvIHVuZGVyc3RhbmQgd2h5IHlvdSdyZSBzbwo+ID4gPiA+IGFnYWluc3QgdGhpcyBwYXRjaD8K
PiA+ID4gPgo+ID4gPiAKPiA+ID4gVGhpcyBjaGFuZ2UgaGFuZGxlcyB0d28gZGlmZmVyZW50IGNv
bm5lY3RvcnMgaW4ga29tZWRhIGludGVybmFsbHksIGNvbXBhcmUKPiA+ID4gd2l0aCBvbmUgaW50
ZXJmYWNlLCBpdCBpbmNyZWFzZXMgdGhlIGNvbXBsZXhpdHksIG1vcmUgcmlzayBvZiBidWcgYW5k
IG1vcmUKPiA+ID4gY29zdCBvZiBtYWludGFpbmFuY2UuCj4gPiA+IAo+ID4gCj4gPiBXZWxsLCBp
dCdzIG9ubHkgYWJvdXQgaG93IHRvIGJpbmQgdGhlIGRyaXZlcnMgLSB0d28gZGlmZmVyZW50IG1l
dGhvZHMKPiA+IG9mIGJpbmRpbmcsIG5vdCB0d28gZGlmZmVyZW50IGNvbm5lY3RvcnMuIEkgd291
bGQgYXJndWUgdGhhdCBjYXJyeWluZwo+ID4gb3VyIG91dC1vZi10cmVlIHBhdGNoZXMgdG8gc3Vw
cG9ydCBib3RoIHBsYXRmb3JtcyBpcyBhIGxhcmdlcgo+ID4gbWFpbnRlbmFuY2UgYnVyZGVuLgo+
ID4gCj4gPiBIb25lc3RseSB0aGlzIGxvb2tzIGxpa2UgYSB3aW4td2luIHRvIG1lLiBXZSBnZXQg
dGhlIHN1cGVyaW9yIGFwcHJvYWNoCj4gPiB3aGVuIGl0cyBzdXBwb3J0ZWQsIGFuZCBzdGlsbCBn
ZXQgdG8gc3VwcG9ydCBicmlkZ2VzIHdoaWNoIGFyZSBtb3JlCj4gPiBjb21tb24uCj4gPiAKPiA+
IEFzL3doZW4gaW1wcm92ZW1lbnRzIGFyZSBtYWRlIHRvIHRoZSBicmlkZ2UgY29kZSB3ZSBjYW4g
cmVtb3ZlIHRoZQo+ID4gY29tcG9uZW50IGJpdHMgYW5kIG5vdCBsb3NlIGFueXRoaW5nLgo+IAo+
IFRoZXJlIHdhcyBhbiBpZGVhIGEgd2hpbGUgYmFjayBhYm91dCB1c2luZyB0aGUgZGV2aWNlIGxp
bmtzIGNvZGUgdG8KPiBzb2x2ZSB0aGUgYnJpZGdlIGlzc3VlIC0gYnV0IGF0IHRoZSB0aW1lIHRo
ZSBkZXZpY2UgbGlua3MgY29kZSB3YXNuJ3QKPiB1cCB0byB0aGUgam9iLiAgSSB0aGluayB0aGF0
J3MgYmVlbiByZXNvbHZlZCBub3csIGJ1dCBJIGhhdmVuJ3QgYmVlbgo+IGFibGUgdG8gY29uZmly
bSBpdC4gIEkgZGlkIHByb3Bvc2Ugc29tZSBwYXRjaGVzIGZvciBicmlkZ2UgYXQgdGhlCj4gdGlt
ZSBidXQgdGhleSBwcm9iYWJseSBuZWVkIHVwZGF0aW5nLgoKSSB0aGluayB0aGUgb25seSBwYXRj
aGVzIHRoYXQgZXhpc3RlZCB3aGVyZSBmb3IgcGFuZWwsIGFuZCB3ZSBvbmx5CmRpc2N1c3NlZCB0
aGUgYnJpZGdlIGNhc2UuIEF0IGxlYXN0IEkgY2FuIG9ubHkgZmluZCBwYXRjaGVzIGZvciBwYW5l
bCxub3QKYnJpZGdlLCBidXQgbWlnaHQgYmUgbWlzc2luZyBzb21ldGhpbmcuCgpFaXRoZXIgd2F5
IEkgdGhpbmsgZGV2aWNlIGNvcmUgaXMgZml4ZWQgbm93LCBzbyB3b3VsZCBiZSByZWFsbHkgZ3Jl
YXQgaWYKc29tZW9uZSBjYW4gZ2l2ZSB0aGlzIGFub3RoZXIgc3RhYiwgYW5kIG1ha2UgZHJtX2Jy
aWRnZS9wYW5lbCBlYXNpZXIgdG8KdXNlIHdpdGhvdXQgZmlyZXdvcmtzIG9uIHVubG9hZC4KLURh
bmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
