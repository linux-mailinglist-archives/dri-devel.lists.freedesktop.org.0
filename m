Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B98C4E685
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 12:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55176E3E5;
	Fri, 21 Jun 2019 10:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0C86E339;
 Fri, 21 Jun 2019 10:55:57 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f9so6087001wre.12;
 Fri, 21 Jun 2019 03:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8ku1Iv+7kChbm3Qtx7U+9WDPrgivVkbeJkYkXYzjoZc=;
 b=gkLSJTNu2hk5+uJgd44Njz02/WzNKVUAzn9XrqX8B/EELlAAq6zw88f7zuos1V9xps
 Mdowf7Uw//d9WqJ9vYAOv+kGrZ50yYCO8Bkod0ZDhokxJ/lYrRv5CwzZBi2bHOUw3AxS
 vqMGpjHjlFKp+RlmdQwSi1cTlv20vfoqRIeUzrFIHhz5YTe42cmtG6GD9S0K4B4adY8b
 lS8GYSeU+BIR9g1N8KqZHqQ91ZBvCS81UNdixp4yVsWgotpuTMFrqFNXIAM2fpZvI/7R
 3Voa5DE2bdnyGT/zxce4E+eSxzISh8eUrp/uk/XGJWutO8D3QM+aqyCfeyQxr5QVHkuW
 yFig==
X-Gm-Message-State: APjAAAWAsI+H7x044Fx9DZPumHpkFFssGioIHQ74TfIb3r2o4/Aq701B
 x8amm1F6KXoVyH1pIT2L56g=
X-Google-Smtp-Source: APXvYqypBd8jBa+c7H4zst4PR8CcMzrAXizQQIdAS5/jpoUxLyWDvZE7wwT8c5pIhE0ipARZ0HmY9Q==
X-Received: by 2002:adf:ee49:: with SMTP id w9mr2313114wro.178.1561114556224; 
 Fri, 21 Jun 2019 03:55:56 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id z6sm2086983wrw.2.2019.06.21.03.55.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 03:55:55 -0700 (PDT)
Date: Fri, 21 Jun 2019 11:53:47 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Message-ID: <20190621105347.GB21486@arch-x1c3>
References: <9dbdda6c-8916-e5ae-1676-86828b9890e7@amd.com>
 <20190614155325.GC32412@arch-x1c3>
 <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
 <20190620163012.GF1896@arch-x1c3>
 <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
 <20190621090953.GZ12905@phenom.ffwll.local>
 <be9f38f5-6bb5-9535-f3d9-bafa83370e0f@amd.com>
 <CAKMK7uE5qO4q3RYNDp22gkMSSJGgz9ChxhuWPYqXO6D1UUvy6Q@mail.gmail.com>
 <20190621102015.GA21486@arch-x1c3>
 <d241fab3-b6f0-d38a-b83f-03b70736b355@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d241fab3-b6f0-d38a-b83f-03b70736b355@amd.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8ku1Iv+7kChbm3Qtx7U+9WDPrgivVkbeJkYkXYzjoZc=;
 b=ggohj1E09tTUd2l3wjBlymNRNV4+pu/UM5ZPpSlmhWtsVHp/819o19feBk7sVWKYVr
 FdO48QC2X7elZY3mSxjWWiAWLJvL0VtIjiG2pRGLfiCFaFertlGM1ktxlhIYa0t8EtMF
 JqAJ9CTaJ4X9SI44KylSvhpFuZKpCrKdVaoJHazUHjbMAgvz1jSiZGG2MnihghLomdMK
 GnGOZXTteEMHgkPu67jFdMHUYr5Zz7tICwhegR+sLh8MPGM0jWv/YTAvbQijA54Qvr3x
 mOSCv6W09ngwh0Zgo+SPnkLQvtEAAumjK5MfbDlYyGPufC/ORDpNf57yTz9Qe/hYxTT0
 wNMw==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@linux.ie>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNi8yMSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4gTm8gdGhpcyBzaG91bGQg
YXBwbHkgdG8gYWxsIGRyaXZlcnMsIG5vdCBqdXN0IGFtZGdwdS4KPiAKPiA+IFdoaWxlIEkgc3Vn
Z2VzdGVkOgo+ID4gICAtIGtlZXBpbmcgYW1kZ3B1IGNvbnNpc3RlbnQgd2l0aCB0aGUgcmVzdAo+
ID4gICAtIGV4cG9zaW5nIHRoZSBLQ29uZmlnIG9wdGlvbiBmb3IgdGhlIHdob2xlIG9mIHRoZSBr
ZXJuZWwsIGFuZAo+ID4gICAtIG1lcmdpbmcgaXQgYWxvbmdzaWRlIHRoaXMgd29yawo+ID4KPiA+
IFNvIEkgZWZmZWN0aXZlbHkgd2FpdGVkIGZvciB3ZWVrcywgaW5zdGVhZCBvZiBzaW1wbHkgZ29p
bmcgYWhlYWQgYW5kCj4gPiB3cml0aW5nL3N1Ym1pdHRpbmcgcGF0Y2hlcy4gVGhhdCdzIGEgYml0
IHVuZm9ydHVuYXRlLi4uCj4gPgo+ID4+PiBCZWNhdXNlIHdlIHNpbXBseSBtYWRlIHN1cmUgdGhh
dCB1c2Vyc3BhY2UgaXMgdXNpbmcgdGhlIHJlbmRlciBub2RlIGZvcgo+ID4+PiBjb21tYW5kIHN1
Ym1pc3Npb24gYW5kIG5vdCB0aGUgcHJpbWFyeSBub2RlLgo+ID4+Pgo+ID4+PiBTbyBub2JvZHkg
Y2FuIGdvIGFoZWFkIGFuZCByZW1vdmUgcmVuZGVyIG5vZGUgc3VwcG9ydCBhbnkgbW9yZSA6KQo+
ID4+IEhvdyBkb2VzIHRoaXMgd29yaz8gSSB0aG91Z2h0IHRoZSBlbnRpcmUgcHJvYmxlbSBvZiBE
Uk1fQVVUSCByZW1vdmFsCj4gPj4gZm9yIHlvdSB3YXMgdGhhdCBpdCBicm9rZSBzdHVmZiwgYW5k
IHlvdSBkaWRuJ3Qgd2FudCB0byBkZWFsIHdpdGgKPiA+PiB0aGF0LiBXZSBzdGlsbCBoYXZlIHRo
YXQgZXhhY3QgcHJvYmxlbSBhZmFpY3MgLi4uIG9sZCB1c2Vyc3BhY2UKPiA+PiBkb2Vzbid0IHNp
bXBseSB2YW5pc2gsIGV2ZW4gaWYgeW91IGVudGlyZWx5IG51a2UgaXQgZ29pbmcgZm9yd2FyZC4K
PiA+Pgo+ID4+IEFsc28sIHRlc3Rpbmcgb24gdGhlIGFtZGdwdSBzdGFjayBpc24ndCByZWFsbHkg
dGVzdGluZyBhIGhvbGUgbG90Cj4gPj4gaGVyZSwgaXQncyBhbGwgdGhlIHZhcmlvdXMgc2lsbHkg
Y29tcG9zaXRvcnMgb3V0IHRoZXJlIEknZCBleHBlY3QgdG8KPiA+PiBmYWxsIG92ZXIuIFdpbGwg
Z2JtL3JhZGVvbnNpL3doYXRldmVyIGp1c3QgaW50ZXJuYWxseSBkbyBhbGwgdGhlCj4gPj4gbmVj
ZXNzYXJ5IGRtYS1idWYgaW1wb3J0L2V4cG9ydCBiZXR3ZWVuIHRoZSBwcmltYXJ5IG5vZGUgYW5k
IGRpc3BsYXkKPiA+PiBub2RlIHRvIGtlZXAgdGhpcyBhbGwgd29ya2luZz8KPiA+IElmIEkgdW5k
ZXJzdG9vZCBDaHJpc3RpYW4sIGZlZWwgZnJlZSB0byBjb3JyZWN0IG1lLCB0aGUgZmFjdCB0aGF0
IG15Cj4gPiBlYXJsaWVyIHBhdGNoIGJyb2tlIFJBRFYgd2FzIG5vdCB0aGUgYXJndW1lbnQuIFRo
ZSBwcm9ibGVtIHdhcyB3YXMgdGhlCj4gPiBwYXRjaCBkb2VzLgo+IAo+IFdlbGwgcGFydGlhbGx5
LiBUaGF0IFJBRFYgYnJva2UgaXMgdW5mb3J0dW5hdGUsIGJ1dCB3ZSBoYXZlIGRvbmUgc28gbWFu
eSAKPiBjdXN0b21pemVkIHVzZXJzcGFjZSBzdHVmZiBib3RoIGJhc2VkIG9uIE1lc2EvRERYIGFz
IHdlbGwgYXMgY2xvc2VkIAo+IHNvdXJjZSBjb21wb25lbnRzIHRoYXQgaXQgaXMganVzdCBoaWdo
bHkgbGlrZWx5IHRoYXQgd2Ugd291bGQgYnJlYWsgCj4gc29tZXRoaW5nIGVsc2UgYXMgd2VsbC4K
PiAKQXMgYW4gZW5naW5lZXIgSSBsaWtlIHRvIHdvcmsgd2l0aCB0YW5naWJsZXMuIFRoZSBoaWdo
bHkgbGlrZWx5IHBhcnQgaXMKcHJvYmFibGUsIGJ1dCBhcyBtZW50aW9uZWQgbXVsdGlwbGUgdGlt
ZXMgdGhlIHNlcmllcyBhbGxvd3MgZm9yIGEgX2RlYWRfCnRyaXZpYWwgd2F5IHRvIGFkZHJlc3Mg
YW55IHN1Y2ggcHJvYmxlbXMuCgo+ID4gSW4gcGFydGljdWxhciwgdGhhdCB1c2VyLXNwYWNlIHdp
bGwgInJlbW92ZSIgcmVuZGVyIG5vZGVzLgo+IAo+IFllcywgdGhhdCBpcyBteSBtYWluIGNvbmNl
cm4gaGVyZS4gWW91IGJhc2ljYWxseSBtYWtlIHJlbmRlciBub2RlcyAKPiBzdXBlcmZsdW91c2x5
LiBUaGF0IGdpdmVzIHVzZXJzcGFjZSBhbGwgbGVnaXRpbWl6YXRpb24gdG8gYWxzbyByZW1vdmUg
Cj4gc3VwcG9ydCBmb3IgdGhlbS4gVGhhdCBpcyBub3Qgc3R1cGlkIG9yIGV2aWwgb3Igd2hhdGV2
ZXIsIHVzZXJzcGFjZSAKPiB3b3VsZCBqdXN0IGZvbGxvdyB0aGUga2VybmVsIGRlc2lnbi4KPiAK
RG8geW91IGhhdmUgYW4gZXhhbXBsZSBvZiB1c2Vyc3BhY2UgZG9pbmcgc3VjaCBhbiBleHRyZW1l
bHkgc2lsbHkgdGhpbmc/Ckl0IGRvZXMgc2VlbSBsaWtlIHN1c3BlY3QgeW91J3JlIGEgY291cGxl
IG9mIHN0ZXBzIGJleW9uZCBvdmVyY2F1dGlvdXMsCnBlcmhhcHMgcmlnaHRmdWxseSBzby4gTWF5
YmUgeW91J3ZlIHNlZW4gc29tZSBjbG9zZWQtc291cmNlIHVzZXItc3BhY2UKZ29pbmcgY3Jhenk/
IE9yIGFueSBvdGhlciBwcm9qZWN0cz8KCkluIG90aGVyIHdvcmRzLCBiZWluZyBjYXV0aW91cyBp
cyBncmVhdCwgYnV0IHdpdGhvdXQgcmVmZXJlbmNlcyBvZgptaXN1c2UgaXQncyB2ZXJ5IGhhcmQg
Zm9yIG90aGVycyB0byBkcmF3IHRoZSBmdWxsIHBpY3R1cmUuCgo+ID4gSSdtIHJlYWxseSBzYWQg
dGhhdCBhbWRncHUgaW5zaXN0cyBvbiBzdGFuZGluZyBvdXQsIGhvcGUgb25lIGRheSBpdCB3aWxs
Cj4gPiBjb252ZXJnZS4gWWV0IHNpbmNlIGFsbCBvdGhlciBtYWludGFpbmVycyBhcmUgb2sgd2l0
aCB0aGUgc2VyaWVzLCBJJ2xsCj4gPiBzdGFydCBtZXJnaW5nIHBhdGNoZXMgaW4gYSBmZXcgaG91
cnMuIEknbSByZWFsbHkgc2FkIHRoYXQgYW1kZ3B1IHdhbnRzCj4gPiB0byBzdGFuZCBvdXQsIGhv
cGUgaXQgd2lsbCBjb252ZXJnZSBzb29uZXIgcmF0aGVyIHRoYW4gbGF0ZXIuCj4gPgo+ID4gQ2hy
aXN0aWFuLCBob3cgd291bGQgeW91IGxpa2UgYW1kZ3B1IGhhbmRsZWQgLSB3aXRoIGEgc2VwYXJh
dGUgZmxhZyBpbgo+ID4gdGhlIGRyaXZlciBvciBzaGFsbCB3ZSBzcGVjaWFsIGNhc2UgYW1kZ3B1
IHdpdGhpbiBjb3JlIGRybT8KPiAKPiBObywgSSBhc2sgeW91IHRvIHBsZWFzZSBzdGljayBhcm91
bmQgRFJNX0FVVEggZm9yIGF0IGxlYXN0IGFtZGdwdSBhbmQgCj4gcmFkZW9uLiBBbmQgTk9UIGVu
YWJsZSBhbnkgcmVuZGVyIG5vZGUgZnVuY3Rpb25hbGl0eSBmb3IgdGhlbSBvbiB0aGUgCj4gcHJp
bWFyeSBub2RlLgo+IApNeSBxdWVzdGlvbiBpcyBob3cgZG8geW91IHdhbnQgdGhpcyBoYW5kbGVk
OgogLSBEUk1fUExFQVNFX0ZPUkNFX0FVVEggLSBhZGRlZCB0byBBTURHUFUvUkFERU9OLCBvcgog
LSBkcml2ZXJfbmFtZSA9PSBhbWRncHUsIGluIGNvcmUgRFJNLgoKClRoYW5rcwpFbWlsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
