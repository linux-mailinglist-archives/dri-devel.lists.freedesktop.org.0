Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A21A43851E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011B0899E8;
	Fri,  7 Jun 2019 07:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E023E899E8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 07:34:59 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id m10so1625253edv.6
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 00:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=jS58mmJTY5I7PXAvctEFeIpM7K0K7qQukKixQVW0/nA=;
 b=JhVSoJtinMgCK0rVl1tNAY1SFIS6ndg/u38VocRGSw4xNp2FrMeaSx/81TkJC+K4Wz
 vawiqqnK8uSxzy3DIDEBYrvw7PhKavbnsJbMHx4iN9aix0KEz0OdolFV83zM9Ok1ftno
 CX0D8d6nV1Jt+WgB9GpOEl/5NiWeO9gsBQpnRMp9xF9m5uiTos+Cc3Pckj0yUShsmkHx
 FAhmrfqD1EKlNJPNrGW+PVuah5QT0buagU5RoyCgJn69oVQ8NrMVUnEI9XiC8vMYIC36
 XMaEp9Zv95CuLqczNrRUmqeG4Uxz+6KD/qdrhQiND0wZnge2gsnbG0qgAJBYQv8PmlTY
 tnPQ==
X-Gm-Message-State: APjAAAX6/tWu6wyXPjmfXcIcaW9uKyCUpslfkcvalpcNWg6rL3eJ3cDn
 iZ0xq7p8bC063ZyDni4mTEwmjQ==
X-Google-Smtp-Source: APXvYqxDoJmol97F1WuvoCFnTCwQvHf4KX6AEdU4X1U42cBxozCTefF2tO2I5HuwEYnBtYk70WdLSw==
X-Received: by 2002:aa7:c991:: with SMTP id c17mr23597762edt.282.1559892898579; 
 Fri, 07 Jun 2019 00:34:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id gw2sm222882ejb.82.2019.06.07.00.34.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 07 Jun 2019 00:34:57 -0700 (PDT)
Date: Fri, 7 Jun 2019 09:34:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 3/4] drm/i915: remove irrelevant DRM_UNLOCKED flag
Message-ID: <20190607073455.GA21222@phenom.ffwll.local>
References: <20190522154702.16269-1-emil.l.velikov@gmail.com>
 <20190522154702.16269-3-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190522154702.16269-3-emil.l.velikov@gmail.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jS58mmJTY5I7PXAvctEFeIpM7K0K7qQukKixQVW0/nA=;
 b=DAFivv8TS5N7bN/k65bf4+3nqQnfazrBurG/NKjYaOIuJOt5wdzD+0Wocv1fChsCTx
 zgZsjmhqwzKoxvcMwyxo7E1NqbjZm1LBfnIqctRtvoydk6XKC3Z9Vy4ZHGXO7AkOoqH9
 pkL9VRlq87GC0pDTFNx9x7hjHa/DfWFsB34DI=
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
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMDQ6NDc6MDFQTSArMDEwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4g
Cj4gRFJNX1VOTE9DS0VEIGRvZXNuJ3QgZG8gYW55dGhpbmcgZm9yIG5vbi1sZWdhY3kgZHJpdmVy
cy4gUmVtb3ZlIGl0Lgo+IAo+IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBTaWduZWQtb2ZmLWJ5OiBFbWls
IFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgoKUmV2aWV3ZWQtYnk6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9pOTE1X2Rydi5jIHwgNiArKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmMKPiBpbmRl
eCAxYWQ4OGU2ZDdjMDQuLmExOGMxNTVjZmY4OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9pOTE1X2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYu
Ywo+IEBAIC0zMTQ1LDkgKzMxNDUsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9pb2N0bF9k
ZXNjIGk5MTVfaW9jdGxzW10gPSB7Cj4gIAlEUk1fSU9DVExfREVGX0RSVihJOTE1X0dFTV9DT05U
RVhUX0dFVFBBUkFNLCBpOTE1X2dlbV9jb250ZXh0X2dldHBhcmFtX2lvY3RsLCBEUk1fUkVOREVS
X0FMTE9XKSwKPiAgCURSTV9JT0NUTF9ERUZfRFJWKEk5MTVfR0VNX0NPTlRFWFRfU0VUUEFSQU0s
IGk5MTVfZ2VtX2NvbnRleHRfc2V0cGFyYW1faW9jdGwsIERSTV9SRU5ERVJfQUxMT1cpLAo+ICAJ
RFJNX0lPQ1RMX0RFRl9EUlYoSTkxNV9QRVJGX09QRU4sIGk5MTVfcGVyZl9vcGVuX2lvY3RsLCBE
Uk1fUkVOREVSX0FMTE9XKSwKPiAtCURSTV9JT0NUTF9ERUZfRFJWKEk5MTVfUEVSRl9BRERfQ09O
RklHLCBpOTE1X3BlcmZfYWRkX2NvbmZpZ19pb2N0bCwgRFJNX1VOTE9DS0VEfERSTV9SRU5ERVJf
QUxMT1cpLAo+IC0JRFJNX0lPQ1RMX0RFRl9EUlYoSTkxNV9QRVJGX1JFTU9WRV9DT05GSUcsIGk5
MTVfcGVyZl9yZW1vdmVfY29uZmlnX2lvY3RsLCBEUk1fVU5MT0NLRUR8RFJNX1JFTkRFUl9BTExP
VyksCj4gLQlEUk1fSU9DVExfREVGX0RSVihJOTE1X1FVRVJZLCBpOTE1X3F1ZXJ5X2lvY3RsLCBE
Uk1fVU5MT0NLRUR8RFJNX1JFTkRFUl9BTExPVyksCj4gKwlEUk1fSU9DVExfREVGX0RSVihJOTE1
X1BFUkZfQUREX0NPTkZJRywgaTkxNV9wZXJmX2FkZF9jb25maWdfaW9jdGwsIERSTV9SRU5ERVJf
QUxMT1cpLAo+ICsJRFJNX0lPQ1RMX0RFRl9EUlYoSTkxNV9QRVJGX1JFTU9WRV9DT05GSUcsIGk5
MTVfcGVyZl9yZW1vdmVfY29uZmlnX2lvY3RsLCBEUk1fUkVOREVSX0FMTE9XKSwKPiArCURSTV9J
T0NUTF9ERUZfRFJWKEk5MTVfUVVFUlksIGk5MTVfcXVlcnlfaW9jdGwsIERSTV9SRU5ERVJfQUxM
T1cpLAo+ICB9Owo+ICAKPiAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGRyaXZlciA9IHsKPiAt
LSAKPiAyLjIxLjAKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
