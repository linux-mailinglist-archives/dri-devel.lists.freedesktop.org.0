Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D72C2D0D06
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 12:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4276E973;
	Wed,  9 Oct 2019 10:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E502A6E974
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 10:45:35 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id h2so1585866edn.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 03:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=6+XvDcKE2RU3GarFMY6VFWF5e0vqSLtQ1WSp/MxdvAE=;
 b=YH50kVRKCwMIQlcAN5EfwYtwQUkQbqG33saL1dZDz7wJSyubq5c4Em/SySIaYmCTu3
 QobZEIB+Em5SBoDYyCG89vDcEFR2e5uu3DhU+Zu82dzq4WQ3+vyYMz2nWnRWCbxIauyJ
 PkOIsb/29B75h3lXqOT0VW2tzfmfRL6ZCIee4zh7NwXrjqzkA8XrhUeDaM8nkG9bFOFm
 9mLuhYJPoVUev8J22neU8ewDcX1usq/9aI88hS/+fRA+mSw9qQEdaZmQrDnA10SPBBw+
 GHGK7OTmLbFNfxdSbX5my16NZjOa9/Mi1EZeXz+0GT9rb2D4msQVg1Qgp6t6IF/McEy+
 GfyQ==
X-Gm-Message-State: APjAAAUHJ0fevgHx4ACei7B27SvMO7iPzmteW2P6haGBiWXymfW6Fj/z
 DFlre9vgxH6iFi2IMQSUEGI/Fw==
X-Google-Smtp-Source: APXvYqypf8TUWCjOC1hqek7KsLpkZOQhKyoafQfZ3yoK7AHqD4tOQfjVJl8fSNIoCuMXhrJPXSLG4g==
X-Received: by 2002:a17:906:218a:: with SMTP id
 10mr2138984eju.38.1570617934430; 
 Wed, 09 Oct 2019 03:45:34 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id u30sm292574edd.18.2019.10.09.03.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 03:45:33 -0700 (PDT)
Date: Wed, 9 Oct 2019 12:45:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [1/3] drm/tinydrm/Kconfig: Remove menuconfig DRM_TINYDRM
Message-ID: <20191009104531.GW16989@phenom.ffwll.local>
Mail-Followup-To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org
References: <20190725105132.22545-2-noralf@tronnes.org>
 <20191001123636.GA8351@ziepe.ca>
 <1fffe7b1-a738-a9e3-ea5f-9d696cb98650@tronnes.org>
 <20191001134555.GB22532@ziepe.ca>
 <75055e2d-44f7-0cba-4e41-537097b73c3c@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75055e2d-44f7-0cba-4e41-537097b73c3c@tronnes.org>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=6+XvDcKE2RU3GarFMY6VFWF5e0vqSLtQ1WSp/MxdvAE=;
 b=gOh0Ame+9n5xA+JyzEumEbwhcF1sWB3ZNPV4KTv2mW1kph+Ebri0o4bV02T8jtXDRR
 J+f+5LbjnmqKFqIz1sDF96Cj0BrmfyhOLrosPja6sx/hqLaZOUI020WNSzpiBSBy2PbL
 2SB/swB2haCopFqm+jdn5U/g9HgbyD0os75Bs=
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
Cc: sam@ravnborg.org, hdegoede@redhat.com, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Maxime Ripard <mripard@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMDQ6MDc6MzhQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVz
IHdyb3RlOgo+IEhpIGRybS1taXNjIG1haW50YWluZXJzLAo+IAo+IEkgaGF2ZSBqdXN0IGFwcGxp
ZWQgYSBwYXRjaCB0byBkcm0tbWlzYy1uZXh0IHRoYXQgYXMgaXQgdHVybnMgb3V0IHNob3VsZAo+
IGhhdmUgYmVlbiBhcHBsaWVkIHRvIC1maXhlcyBmb3IgdGhpcyAtcmMgY3ljbGUuCj4gCj4gU2hv
dWxkIEkgY2hlcnJ5IHBpY2sgaXQgdG8gZHJtLW1pc2MtbmV4dC1maXhlcz8KCll1cCwgY2hlcnJ5
IHBpY2sgYW5kIHJlZmVyZW5jZSB0aGUgY29tbWl0IHRoYXQncyBhbHJlYWR5IGluIC1uZXh0IChp
biBjYXNlCml0IGNyZWF0ZXMgY29uZmxpY3RzIGRvd24gdGhlIHJvYWQgdGhhdCByZWZlcmVuY2Ug
bWFrZXMgdGhlIG1lc3MgZWFzaWVyIHRvCnVuZGVyc3RhbmQpLgoKPiAoSSBrbm93IHRoZXJlJ3Mg
YSBmbG93Y2hhcnQgaW4gdGhlIGRvY3MgYnV0IEkndmUgbmV2ZXIgcmVhbGx5IHVuZGVyc3Rvb2QK
PiBpdC4pCgpVc3VhbGx5IGJ1Z2ZpeGVzIGZvciBrZXJuZWwgcmVsZWFzZXMgc2hvdWxkIGxhbmQg
aW4gZHJtLW1pc2MtbmV4dC1maXhlcyBvcgpkcm0tbWlzYy1maXhlcy4gQnV0IGNoZXJyeS1waWNr
aW5nIG92ZXIgaW4gY2FzZSBvZiBtaXN0YWtlcyBpcyBvayB0b28uCi1EYW5pZWwKCj4gCj4gTm9y
YWxmLgo+IAo+IERlbiAwMS4xMC4yMDE5IDE1LjQ1LCBza3JldiBKYXNvbiBHdW50aG9ycGU6Cj4g
PiBPbiBUdWUsIE9jdCAwMSwgMjAxOSBhdCAwMzoyODo0NlBNICswMjAwLCBOb3JhbGYgVHLDuG5u
ZXMgd3JvdGU6Cj4gPj4KPiA+Pgo+ID4+IERlbiAwMS4xMC4yMDE5IDE0LjM2LCBza3JldiBKYXNv
biBHdW50aG9ycGU6Cj4gPj4+IE9uIFRodSwgSnVsIDI1LCAyMDE5IGF0IDEyOjUxOjMwUE0gKzAy
MDAsIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPiA+Pj4+IFRoaXMgbWFrZXMgdGhlIHRpbnkgZHJp
dmVycyB2aXNpYmxlIGJ5IGRlZmF1bHQgd2l0aG91dCBoYXZpbmcgdG8gZW5hYmxlIGEKPiA+Pj4+
IGtub2IuCj4gPj4+Pgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogTm9yYWxmIFRyw7hubmVzIDxub3Jh
bGZAdHJvbm5lcy5vcmc+Cj4gPj4+PiBSZXZpZXdlZC1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29l
ZGVAcmVkaGF0LmNvbT4gdG8gaXQgb25jZQo+ID4+Pj4gIGRyaXZlcnMvZ3B1L2RybS9NYWtlZmls
ZSAgICAgICAgfCAgMiArLQo+ID4+Pj4gIGRyaXZlcnMvZ3B1L2RybS90aW55ZHJtL0tjb25maWcg
fCAzNyArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiA+Pj4+ICAyIGZpbGVzIGNo
YW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQo+ID4+Pgo+ID4+PiBCaXNl
Y3Rpb24gc2F5cyB0aGlzIHBhdGNoICgyOGM0N2UxNmVhMmExOWFkYjQ3ZmUyYzE4MmNiZDYxY2I4
NTQyMzdjKQo+ID4+PiBicmVha3Mga2NvbmZpZyBzdHVmZiBpbiB2NS40LXJjIGJ5IGNyZWF0aW5n
IGNpcmN1bGFyCj4gPj4+IGRlcGVuZGVuY2llcy4gQ291bGQgc29tZW9uZSBzZW5kIGEgLXJjIHBh
dGNoIHRvIGZpeCB0aGlzIHBsZWFzZT8KPiA+Pj4KPiA+Pj4gVEhJTktQQURfQUNQSSAoZGVmaW5l
ZCBhdCBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9LY29uZmlnOjQ4NCksIHdpdGggZGVmaW5pdGlvbi4u
Lgo+ID4+PiAuLi5kZXBlbmRzIG9uIEZCX1NTRDEzMDcgKGRlZmluZWQgYXQgZHJpdmVycy92aWRl
by9mYmRldi9LY29uZmlnOjIyNTkpLCB3aXRoIGRlZmluaXRpb24uLi4KPiA+Pj4gLi4uZGVwZW5k
cyBvbiBGQiAoZGVmaW5lZCBhdCBkcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWc6MTIpLCB3aXRo
IGRlZmluaXRpb24uLi4KPiA+Pj4gLi4uZGVwZW5kcyBvbiBEUk1fS01TX0ZCX0hFTFBFUiAoZGVm
aW5lZCBhdCBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZzo3OSksIHdpdGggZGVmaW5pdGlvbi4uLgo+
ID4+PiAuLi5kZXBlbmRzIG9uIERSTV9LTVNfSEVMUEVSIChkZWZpbmVkIGF0IGRyaXZlcnMvZ3B1
L2RybS9LY29uZmlnOjczKSwgd2l0aCBkZWZpbml0aW9uLi4uCj4gPj4+IC4uLmRlcGVuZHMgb24g
VElOWURSTV9SRVBBUEVSIChkZWZpbmVkIGF0IGRyaXZlcnMvZ3B1L2RybS90aW55ZHJtL0tjb25m
aWc6NTEpLCB3aXRoIGRlZmluaXRpb24uLi4KPiA+Pj4gLi4uZGVwZW5kcyBvbiBUSEVSTUFMIChk
ZWZpbmVkIGF0IGRyaXZlcnMvdGhlcm1hbC9LY29uZmlnOjYpLCB3aXRoIGRlZmluaXRpb24uLi4K
PiA+Pj4gLi4uZGVwZW5kcyBvbiBTRU5TT1JTX05QQ003WFggKGRlZmluZWQgYXQgZHJpdmVycy9o
d21vbi9LY29uZmlnOjEyODUpLCB3aXRoIGRlZmluaXRpb24uLi4KPiA+Pj4gLi4uZGVwZW5kcyBv
biBIV01PTiAoZGVmaW5lZCBhdCBkcml2ZXJzL2h3bW9uL0tjb25maWc6NiksIHdpdGggZGVmaW5p
dGlvbi4uLgo+ID4+PiAuLi5kZXBlbmRzIG9uIFRISU5LUEFEX0FDUEkgKGRlZmluZWQgYXQgZHJp
dmVycy9wbGF0Zm9ybS94ODYvS2NvbmZpZzo0ODQpLCB3aXRoIGRlZmluaXRpb24uLi4KPiA+Pj4g
Li4uZGVwZW5kcyBvbiBBQ1BJX1ZJREVPIChkZWZpbmVkIGF0IGRyaXZlcnMvYWNwaS9LY29uZmln
OjE5MyksIHdpdGggZGVmaW5pdGlvbi4uLgo+ID4+PiAuLi5kZXBlbmRzIG9uIEFDRVJfV01JIChk
ZWZpbmVkIGF0IGRyaXZlcnMvcGxhdGZvcm0veDg2L0tjb25maWc6MTkpLCB3aXRoIGRlZmluaXRp
b24uLi4KPiA+Pj4gLi4uZGVwZW5kcyBvbiBCQUNLTElHSFRfQ0xBU1NfREVWSUNFIChkZWZpbmVk
IGF0IGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25maWc6MTQ0KSwgd2l0aCBkZWZpbml0aW9u
Li4uCj4gPj4+IC4uLmRlcGVuZHMgYWdhaW4gb24gVEhJTktQQURfQUNQSSAoZGVmaW5lZCBhdCBk
cml2ZXJzL3BsYXRmb3JtL3g4Ni9LY29uZmlnOjQ4NCkKPiA+Pj4KPiA+Pgo+ID4+IFdvdWxkIHRo
aXMgY29tbWl0IGZpeCB0aGlzIGJ5IGFueSBjaGFuY2U6Cj4gPj4KPiA+PiBkcm0vdGlueTogS2Nv
bmZpZzogUmVtb3ZlIGFsd2F5cy15IFRIRVJNQUwgZGVwLiBmcm9tIFRJTllEUk1fUkVQQVBFUgo+
ID4+IGh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjL2NvbW1pdC8/aWQ9
ZGZlZjk1OTgwM2M3MjhjNjE2YWQyOWIwMDhjZDkxYjM0NDZhOTkzYQo+ID4gCj4gPiBZZXMsIHRo
YW5rIHlvdSwgY2FuIHNvbWVvbmUgc2VuZCB0aGlzIHRvIC1yYyB0byB1bmJyZWFrIDUuND8KPiA+
IAo+ID4gSmFzb24KPiA+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
