Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C26D4F45E
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 10:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957616E961;
	Sat, 22 Jun 2019 08:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598AA6E961
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 08:37:45 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B910021530
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 08:37:44 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id 136so6647503lfa.8
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 01:37:44 -0700 (PDT)
X-Gm-Message-State: APjAAAXye5ou5F6aYwYnpIeeUOLmQnoeBB2nP/PobK+RB7oEAq6CgfMd
 9QzzzIFMWNUODovkikpuTek4sTsWF46hgSSDuMo=
X-Google-Smtp-Source: APXvYqyLVGQPlWhbJ09ZX5CYdbZxSXnIlvz/U8JCuU7CUMKaRPaxTXM43XNGCrpYbrXB+BMZbuLJAJd2oAegLs3vQAo=
X-Received: by 2002:ac2:514b:: with SMTP id q11mr12128246lfd.33.1561192663014; 
 Sat, 22 Jun 2019 01:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190621184904.25975-1-sam@ravnborg.org>
 <CAJKOXPeNDGYCctL4OpBH1V+Ez4Ld1CDzB_pANxQkwqBzj8zEmA@mail.gmail.com>
 <20190622073144.GA12883@ravnborg.org>
In-Reply-To: <20190622073144.GA12883@ravnborg.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sat, 22 Jun 2019 10:37:31 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfwSB5dn4k5OfMN=jb5DxnqwqAZnma3yF_UPHs5PapUSg@mail.gmail.com>
Message-ID: <CAJKOXPfwSB5dn4k5OfMN=jb5DxnqwqAZnma3yF_UPHs5PapUSg@mail.gmail.com>
Subject: Re: [PATCH v3 0/1] drm/exynos: drop use of drmP.h
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561192665;
 bh=kFK/Wyp8OETDF3kupL6XKIC15f/P/J/xF+vlt1/yfQA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JPOgsteqhEv3q9dy8Yjhjf/u8GD4v9WmKrYHb3blPQ7j93cehM1LivkBggVRudJAj
 cVl4Ogtid1xQ7wCWwM/mgq5UTo7SmPwezvAiOjhfSJPiZ5whvGQGtoxegirDfn4WGE
 VdEMs2vz9lXXbG/68KMzRDf5PbyIvZkY03A6ZehI=
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
Cc: David Airlie <airlied@linux.ie>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMiBKdW4gMjAxOSBhdCAwOTozMSwgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPiB3cm90ZToKPgo+IEhpIEtyenlzenRvZi4KPgo+ID4gPiBCdWlsZCB0ZXN0ZWQgdXNpbmcg
YWxseWVzY29uZmlnLCBhbGxtb2Rjb25maWcgZm9yIHZhcmlvdXMKPiA+ID4gYXJjaGl0ZWN0dXJl
cy4KPiA+Cj4gPiBIaSwKPiA+Cj4gPiBUaGFua3MgZm9yIGZpeGVzLiBKdXN0IGZvciB0aGUgcmVj
b3JkLCBhbGx5ZXNjb25maWcvYWxsbW9kY29uZmlnIGFyZQo+ID4gbm90IGEgcHJvcGVyIHdheSBm
b3IgYnVpbGQgdGVzdCBzcGVjaWZpYyBkcml2ZXJzLiBUaGV5IGFyZSBuaWNlIGJ1dAo+ID4gc2lu
Y2UgYWxsIGRlcGVuZGVuY2llcyBhcmUgaW4sIHRoZXkgbWlnaHQgbWlzcyBhIGxvdC4gWW91IHNo
b3VsZCBidWlsZAo+ID4gbWVudGlvbmVkIHBsYXRmb3JtIChleHlub3NfZGVmY29uZmlnIG9uIEFS
TXY3LCBkZWZjb25maWcgb24gQVJNdjgpIGFuZAo+ID4gbXVsdGkgY29uZmlncyAobXVsdGlfdjcg
b24gQVJNdjcpLiBTdWNoIHJ1bGUgaXMgYWxzbyB2YWxpZCBmb3Igb3RoZXIKPiA+IGRyaXZlcnMs
IG5vdCBzcGVjaWZpYyB0byBFeHlub3MuCj4KPiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4gSSBo
YXZlIGFkZGVkIGV4eW5vc19kZWZjb25maWcsCj4gbXVsdGlfdjdfZGVmY29uZmlnIHRvIG15IGdy
b3dpbmcgbGlzdCBvZiBjb25maWdzIHRoYXQgSSB0cnkgd2hlbiBkb2luZwo+IGNyb3NzIGRyaXZl
ciBjaGFuZ2VzLgo+IFRoZXkgaW5jbHVkZSBkZWZjb25maWcgKyBhbGxub2NvbmZpZyBmb3IgdGhl
IHN1cHBvcnRlZCBhcmNocyB0b28uCj4KPiBOb25lIG9mIHRoZXNlIGNvbmZpZ3Mgd291bGQgaGF2
ZSB0cmlnZ2VyZWQgYSBidWlsZCBvZiBleHlub3NfZHJtX2cyZC5jCj4gc28gdG8gZG8gdGhhdCBz
b21lIG1hbnVhbCB0d2Fla3Mgb2YgdGhlIGNvbmZnIHdhcyBuZWNlc3NhcnkuCj4KPiBBZGRpbmcg
YSBDT01QSUxFX1RFU1QgZGVwZW5kZW5jeSB3aWxsIGVuYWJsZSB0aGUgYnVpbGQKPiBmb3IgdGhl
IGFsbHllc2NvbmZpZywgYWxsbW9kY29uZmlnLgo+IFRoYXRzIHdvcnRocyB0byBjb25zaWRlciB0
byBhdm9pZCBmdXR1cmUgbWlzdGFrZXMuCj4KPiAgICAgICAgIFNhbQo+Cj4gU29tZXRoaW5nIGxp
a2UgdGhpczoKPgo+IEZyb20gOWIyOWI4NWYyNWY0Y2M0ODVmMzZlZmI4ZDY1ODc2NmZhOWEyNTJk
OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiBGcm9tOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZu
Ym9yZy5vcmc+Cj4gRGF0ZTogU2F0LCAyMiBKdW4gMjAxOSAwOToyNDowNiArMDIwMAo+IFN1Ympl
Y3Q6IFtQQVRDSCB2MV0gZHJtL2V4eW5vczogdHJpZ2dlciBidWlsZCBvZiBhbGwgbW9kdWxlcwo+
Cj4gQWRkIENPTVBJTEVfVEVTVCBkZXBlbmRlbmN5IHRvIGEgZmV3IG9wdGlvbnMgdG8gdHJpZ2dl
ciB0aGF0IHRoZSBtb2R1bGVzCj4gZ2V0IGJ1aWx0IHVzaW5nIGFsbHllc2NvbmZpZywgYWxsbW9k
Y29uZmlnLgo+IFRoaXMgYWxsb3dzIGEgbm9uLWV4eW5vcyBkZXZlbG9wZXIgdG8gY2F0Y2ggYnVp
bGQgaXNzdWVzCj4gaW4gZmlsZXMgdGhhdCBpcyB1c3VhbGx5IG5vdCBidWlsdC4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogSW5raSBEYWUg
PGlua2kuZGFlQHNhbXN1bmcuY29tPgo+IENjOiBKb29ueW91bmcgU2hpbSA8ankwOTIyLnNoaW1A
c2Ftc3VuZy5jb20+Cj4gQ2M6IFNldW5nLVdvbyBLaW0gPHN3MDMxMi5raW1Ac2Ftc3VuZy5jb20+
Cj4gQ2M6IEt5dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+Cj4gQ2M6IERh
dmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgo+IENjOiBLdWtqaW4gS2ltIDxrZ2VuZUBrZXJuZWwub3JnPgo+IENjOiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4gQ2M6IEppbmdvbyBIYW4gPGppbmdv
b2hhbjFAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL0tjb25maWcg
fCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL0tjb25maWcgYi9kcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL0tjb25maWcKPiBpbmRleCBjYmU1OGQzMDdkMWMuLmVhZGVhMmRh
ZjFhYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL0tjb25maWcKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL0tjb25maWcKPiBAQCAtODYsNyArODYsNyBAQCBjb21t
ZW50ICJTdWItZHJpdmVycyIKPgo+ICBjb25maWcgRFJNX0VYWU5PU19HMkQKPiAgICAgICAgIGJv
b2wgIkcyRCIKPiAtICAgICAgIGRlcGVuZHMgb24gVklERU9fU0FNU1VOR19TNVBfRzJEPW4KPiAr
ICAgICAgIGRlcGVuZHMgb24gVklERU9fU0FNU1VOR19TNVBfRzJEPW4gfHwgQ09NUElMRV9URVNU
CgpPaCB5ZXMsIHRoYXQgZGVmaW5pdGVseSBtYWtlcyBzZW5zZSAoYXNzdW1pbmcgaXQgY29tcGls
ZXMgb24gYWxsCmFyY2hzKS4gTWF5YmUgeW91IGNhbiBzZW5kIGEgZm9sbG93IHVwIGFkZGluZyB0
aGVzZT8KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
