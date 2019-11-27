Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C66D10B5CF
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 19:33:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8828B6E58E;
	Wed, 27 Nov 2019 18:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D256E58E;
 Wed, 27 Nov 2019 18:33:49 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id y23so752585ual.2;
 Wed, 27 Nov 2019 10:33:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JBlm0yGbQPclcwxhO7BdYb6YbQvw+Y7an1/vLsOZRGE=;
 b=cUCnln8TuG0lHoUDRhWXT/U5FROS7q3gpPaSiWzRyRHO2zY3+now3FDXwkFe5O8uQS
 MOEpsSwtB6NTw///Z6jyDPRiZBUkg+dz2p9GjRX0pJhz/Nsrc/tpEgFcme3vmRU6mCkk
 mPLq7lE3nBSfcKuFftInXgXw5qU9MOlyQXc8cVlV6o1w6ZemHX1bzVi7NuHx7mslEwDq
 dNsgZzy710ZNX+7dqWI6TfJWTSWwDO9iZ7pYXb8mVI9UOlQxJaW6ZBIBnJH36qTB+Adw
 uI5DRdP0hwoHgHVe6WJwxiTTNlA+rrnFemqRxwlxXPM0Qhcl6t0QBrGFpHdvIgZZWjx3
 nEXA==
X-Gm-Message-State: APjAAAWzaRVw6fCwHQV0pHQEkHCz/YT1/Vg6iHZ3sjZkbuOCIoLhlghH
 yoP30lOWiFrlfvbbPtCaAX4kuWpgOr/QghOlhqfvew==
X-Google-Smtp-Source: APXvYqyUSaBMHqyq8DN7agzZDeclimz4A2LXycNHuZLlVEp/SW045b61o5oOfa5ArshfzOsomfLUZDNwZwoJ6Nh+otw=
X-Received: by 2002:ab0:230b:: with SMTP id a11mr3461841uao.106.1574879628550; 
 Wed, 27 Nov 2019 10:33:48 -0800 (PST)
MIME-Version: 1.0
References: <20191101130313.8862-1-emil.l.velikov@gmail.com>
 <20191101130313.8862-5-emil.l.velikov@gmail.com>
 <20191127084104.1ceb1f62@collabora.com>
 <CACvgo52UB-sAv55_kREgHbRsg6b5KXv7At0TbgUPdc0e1E+QaA@mail.gmail.com>
 <20191127180456.GD406127@phenom.ffwll.local>
In-Reply-To: <20191127180456.GD406127@phenom.ffwll.local>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 27 Nov 2019 18:32:56 +0000
Message-ID: <CACvgo50j0sU18-AqeerkgDq9joJysT_0PuQrgVS1tVhUqV9rcg@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm: drop DRM_AUTH from PRIME_TO/FROM_HANDLE ioctls
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=JBlm0yGbQPclcwxhO7BdYb6YbQvw+Y7an1/vLsOZRGE=;
 b=mv03FlmGJq5W5qCw0FCJUj28M2qbSHC20yjAUKaMAFabZcoKUXMVLXnPNC8yQ2HiV3
 B0NqPyDAPoQP3otJZqcXevCkkH7rNtkMGLM3zfbZ86Z4LmbdxoyD/4lsOWZZNabgkztq
 UltRj7cQCF0TMFQz5/6YT0mLpoJ+bciHvJVw4lkC/CVidAq5JwHqjO6dwc8CFFgJjKS6
 PApXiOic45lFNbf+pbcKwOGVPMw9RyWGQMRVsMMUdbWbS+Hm/pBuJlvs2lUh56eZu2Un
 3+nd6q4dXwcLKAuLViYMsUT94bMd1oX7PL6NjuIH8NNsqIHA9H3gsDdMSUOzy5LyIWTE
 E6Ow==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Sean Paul <sean@poorly.run>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyNyBOb3YgMjAxOSBhdCAxODowNCwgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPiB3cm90ZToKPgo+IE9uIFdlZCwgTm92IDI3LCAyMDE5IGF0IDA0OjI3OjI5UE0gKzAwMDAs
IEVtaWwgVmVsaWtvdiB3cm90ZToKPiA+IE9uIFdlZCwgMjcgTm92IDIwMTkgYXQgMDc6NDEsIEJv
cmlzIEJyZXppbGxvbgo+ID4gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZToK
PiA+ID4KPiA+ID4gSGkgRW1pbCwKPiA+ID4KPiA+ID4gT24gRnJpLCAgMSBOb3YgMjAxOSAxMzow
MzoxMyArMDAwMAo+ID4gPiBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNvbT4g
d3JvdGU6Cj4gPiA+Cj4gPiA+ID4gRnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29s
bGFib3JhLmNvbT4KPiA+ID4gPgo+ID4gPiA+IEFzIG1lbnRpb25lZCBieSBDaHJpc3RpYW4sIGZv
ciBkcml2ZXJzIHdoaWNoIHN1cHBvcnQgb25seSBwcmltYXJ5IG5vZGVzCj4gPiA+ID4gdGhpcyBj
aGFuZ2VzIHRoZSByZXR1cm5lZCBlcnJvciBmcm9tIC1FQUNDRVMgaW50byAtRU9QTk9UU1VQUC8t
RU5PU1lTLgo+ID4gPgo+ID4gPiBBcmUgeW91IHN1cmUgdGhpcyBpcyB0cnVlIGZvciBNT0RFU0VU
LW9ubHkgbm9kZXMgKHRob3NlIHRoYXQgZG8gbm90Cj4gPiA+IGhhdmUgdGhlIFJFTkRFUiBjYXAg
c2V0KSBpbXBsZW1lbnRpbmcgLT57ZmRfdG9faGFuZGxlLGhhbmRsZV90b19mZH0oKT8KPiA+ID4g
U2hvdWxkbid0IHRoZSBpc19hdXRoZW50aWNhdGVkKCkgY2hlY2sgc3RpbGwgYmUgZG9uZSBpbiB0
aGF0IGNhc2U/Cj4gPiA+Cj4gPiBUaGFua3MgZm9yIGNhdGNoaW5nIHRoaXMuIEp1c3Qgc2VudCBv
dXQgdjIsIHdoaWNoIEkgc2hvdWxkIGFkZHJlc3MgdGhlIGNvbmNlcm4uCj4KPiBXaHkgZG8gd2Ug
bmVlZCB0aGlzIGFkZGl0aW9uYWwgY2hlY2sgaW4gdjI/IFdoYXQgY2FuIGdvIHdyb25nIG9uIG1v
ZGVzZXQKPiBkcml2ZXJzIGlmIG5vbi1hdXRoZW50aWNhdGVkIGxlZ2FjeSB0aGluZ3MgY2FuIHVz
ZSB0aGlzPyBtb2Rlc2V0LW9ubHkKPiBkcml2ZXJzIGhhdmUgYWxsIHRoZWlyIHJlc291cmNlcyBz
ZWdyZWdhdGVkIGJ5IHRoZSBkcm0gY29yZSAoZHJtX2ZiLAo+IG1tYXBzLCBidWZmZXIgbGlzdHMp
LCBzbyB0aGVyZSdzIHJlYWxseSBubyBhY2Nlc3MgbGltaXRhdGlvbnMgdGhhdCBjYW4gZ28KPiB3
cm9uZyBoZXJlLgoKV2VsY29tZSBiYWNrIERhbmllbC4KCkkgaGF2ZW4ndCBhdWRpdGVkIHRoZSBj
b3JlIGRybSBjb2RlLCBzbyB3YXNuJ3Qgc3VyZSBpZiB0aGVyZSdzIGFueQppc3N1ZXMgdGhhdCBt
YXkgYXJpc2UuCkhlbmNlIHRoZSBjb25zZXJ2YXRpdmUgYXBwcm9hY2ggaW4gdjIuCgpJZiB5b3Ug
dGhpbmsgdGhpcyBpcyBmaW5lIGFzLWlzIGEgZm9ybWFsIFJldmlld2VkLWJ5IHdvdWxkIGJlIGhp
Z2hseQphcHByZWNpYXRlZC4KClRoYW5rcwpFbWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
