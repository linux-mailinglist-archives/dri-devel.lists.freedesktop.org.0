Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B64DB71258
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D192189F2A;
	Tue, 23 Jul 2019 07:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D872089F24
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 07:10:42 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k8so42788528edr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 00:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=jID3j6lQ+qjnSkT7UThjoCCKK2ldSBTqohrGecypD1I=;
 b=sns3aEOR27a2mqETKJlhJa6CZtZXyL+KIAQK7R/8Bf62mrksKeWBk7z3TMgfETEhG8
 RqymhFRlIYX06cB5vH6XCfNvOz67lx52TX1R+tkGvN7XABu0QXICwPJAX+2xpOpxXKiL
 mhjg5qtzzE7JCdqe3WkFqYvTtuyu/IKYKZz7wVB2VCOieYEUKq2nkd1C3GJuLwfNdeGz
 TaSteog//B6psi/o6jjFPCIAjiRM9XO0c7wTU3nRpFG+b/DadRNSaZ16D8f6jBUy/VRK
 jOMsoS7a+8GMnIImyHnfOLfrrWqn8X8OegLsaF+xvHUg15gfk6n793dmJJfPwyn8dmEm
 cr8w==
X-Gm-Message-State: APjAAAUz4t5Mrjhdp0K4GdynlyvRHu1o2pUGV4/41GGOBnIM/UNLkF43
 yS1+NKJqGSl8OB/HBMZPRFiOkDLjtrU=
X-Google-Smtp-Source: APXvYqxCPsu7oV09FGKl5QX/86cX6AjVnwSrl0wVI5PoFW8iQ9szpLCEnWkpEdR+YZbbPVg/OyMamA==
X-Received: by 2002:a17:906:78c7:: with SMTP id
 r7mr57159033ejn.147.1563865841407; 
 Tue, 23 Jul 2019 00:10:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id k8sm11424377edr.31.2019.07.23.00.10.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 00:10:39 -0700 (PDT)
Date: Tue, 23 Jul 2019 09:10:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 0/6] drm/tinydrm: Move mipi_dbi
Message-ID: <20190723071037.GS15868@phenom.ffwll.local>
References: <20190720134709.15186-1-noralf@tronnes.org>
 <877e8aeyg8.fsf@anholt.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877e8aeyg8.fsf@anholt.net>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=jID3j6lQ+qjnSkT7UThjoCCKK2ldSBTqohrGecypD1I=;
 b=LPVKUO059Ohh/chEwMpISkLUM7hnj5eXy3UaJJ3PNdevYjgQcqn5pGIJPkMuWptJfQ
 u72jjPnHVI0jPrixjR7G+h3wCYazQUxN7/Urqz5iJWvUpRjqFFbEr8MpZuPEcXsYdRuQ
 JNaytDqJMWIl3TdHTBc6s7i61LxgNcIydOD3g=
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
Cc: david@lechnology.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMTE6MDY6MTVBTSAtMDcwMCwgRXJpYyBBbmhvbHQgd3Jv
dGU6Cj4gTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+IHdyaXRlczoKPiAKPiA+
IFRoaXMgc2VyaWVzIHRpY2tzIG9mZiB0aGUgbGFzdCB0aW55ZHJtIHRvZG8gZW50cnkgYW5kIG1v
dmVzIG91dCBtaXBpX2RiaQo+ID4gdG8gYmUgYSBjb3JlIGhlbHBlci4KPiA+Cj4gPiBJdCBzcGxp
dHMgc3RydWN0IG1pcGlfZGJpIGludG8gYW4gaW50ZXJmYWNlIHBhcnQgYW5kIGEgZGlzcGxheSBw
aXBlbGluZQo+ID4gcGFydCAodXBsb2FkIGZyYW1lYnVmZmVyIG92ZXIgU1BJKS4gSSBhbHNvIHRv
b2sgdGhlIG9wcG9ydHVuaXR5IHRvCj4gPiByZW5hbWUgdGhlIGFtYmlndW91cyAnbWlwaScgdmFy
aWFibGUgbmFtZSB0byAnZGJpJy4gVGhpcyBsaW5lcyB1cCB3aXRoCj4gPiB0aGUgdXNlIG9mIHRo
ZSAnZHNpJyB2YXJpYWJsZSBuYW1lIGluIHRoZSBNSVBJIERTSSBoZWxwZXIuCj4gPgo+ID4gTm90
ZToKPiA+IFRoaXMgZGVwZW5kcyBvbiBzZXJpZXM6IGRybS90aW55ZHJtOiBSZW1vdmUgdGlueWRy
bS5rbwo+ID4KPiA+IFNlcmllcyBpcyBhbHNvIGF2YWlsYWJsZSBoZXJlOgo+ID4gaHR0cHM6Ly9n
aXRodWIuY29tL25vdHJvL2xpbnV4L3RyZWUvbW92ZV9taXBpX2RiaQo+IAo+IENvbmdyYXR1bGF0
aW9ucyBvbiBtYWtpbmcgaXQgdG8gdGhpcyBzdGFnZS4gIFRoaXMgbG9va3MgbGlrZSBhIGZpbmUK
PiBjb25jbHVzaW9uIHRvIHRpbnlkcm0uCj4gCj4gQWNrZWQtYnk6IEVyaWMgQW5ob2x0IDxlcmlj
QGFuaG9sdC5uZXQ+CgpZZWFoIGxldCBtZSBoZWFwIG9uIHRoZSBjb25ncmF0cyB0b28sIHRoaXMg
aGFzIGJlbiBhIGxvbmcgYnV0IHJlYWxseQppbXByZXNzaXZlIGpvdXJuZXkgdG8gd2F0Y2ghCi1E
YW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0
aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
