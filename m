Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC525D411B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 15:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1106EAC2;
	Fri, 11 Oct 2019 13:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F466EAC2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 13:27:17 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id m7so3470286ywe.4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 06:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=gfuUfZlYZ9oJJ+/N0uMt9DhhQR0v6tIoqlaSGbKIW5Q=;
 b=TvMtJJx11MLl5YsTwf74hwaaDhzvZ6OC6uSIzjxMG3LTFamfzpKvQDmUtmPcyjdKIZ
 tjVuQrvXuC12LFXUi/X/c4gkE4FbSpBh5mjmBLulOQHiKAN/5YEMifFN+Svl6qcrh1lK
 UOcQiImkLMBXLNyhmxD78iamJVb23ucQY3h4jWWy54IZMkW2Nhrc7KudwdiqQp8KaCpG
 jhHJ+8lCjaXul1ytWUR0+A+KKuhdJQBCJGhfdnYy65N+HjApze+QqoNaXNHWJellHt8/
 PAkcJ/gZYDX3bAPQYMqvgiPSjqKUPxBpf8wb/RZbA/6FQ1j9M+EvmeTMDPQeFvmwHoDs
 Z0iA==
X-Gm-Message-State: APjAAAUicSyOdZUonUXWl+2WWyomiCthwhM0k4ZG4I3T6E0ZkOTlGc+h
 DwRUxQ0qiJjz7e91ZZhmOMYE3kXerDM=
X-Google-Smtp-Source: APXvYqxDF1UT0llbpAUs7tUd+8/Bo22/yMWIlZSCpGQIlSr+dT1MkqQR6ab3Q5CqDbLhAZxbBpAWoQ==
X-Received: by 2002:a81:a303:: with SMTP id a3mr2217302ywh.244.1570800436812; 
 Fri, 11 Oct 2019 06:27:16 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id r193sm2177467ywg.38.2019.10.11.06.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 06:27:16 -0700 (PDT)
Date: Fri, 11 Oct 2019 09:27:15 -0400
From: Sean Paul <sean@poorly.run>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v5 0/3] RK3288 Gamma LUT
Message-ID: <20191011132715.GO85762@art_vandelay>
References: <20191010194351.17940-1-ezequiel@collabora.com>
 <2314316.IrHOdPmtjk@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2314316.IrHOdPmtjk@diego>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=gfuUfZlYZ9oJJ+/N0uMt9DhhQR0v6tIoqlaSGbKIW5Q=;
 b=RvgE9Ld3dkdeSZz8gPaqgtDS2qowzHQRexrjX4HVG+BcCfNR2BlabHALJqmY1Saxnc
 HE2pECbmda8Himuhffd/NA1tqR0k4XjDsOlSEKRUkwfRYV1jcg7dLhBqCsZqE0VOeJHb
 4iIJnwiS1A5mL54Igw1bUOiiglA20xIEKTF68jZ4BeiNpX1oNbVmvxoOP0RbsGVKTG02
 Lh9C9oacHynhu1RsLZBgMVUjBOkjjKbHUIcaU7LLVVidv9O9wVRz7TkwqJoORkrmduRr
 y7Np5zdZwOrk2IJfM9fIh0bw44es8W306LoVI3o+kn092f+LLQLQgK8g3eZYeG3U2Apj
 Qoow==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDM6MjI6MDBQTSArMDIwMCwgSGVpa28gU3TDvGJuZXIg
d3JvdGU6Cj4gQW0gRG9ubmVyc3RhZywgMTAuIE9rdG9iZXIgMjAxOSwgMjE6NDM6NDggQ0VTVCBz
Y2hyaWViIEV6ZXF1aWVsIEdhcmNpYToKPiA+IE5ldyBpdGVyYXRpb24sIHNlZW1zIHRoYXQgd2Ug
YXJlIGZpbmFsbHkgY29udmVyZ2luZy4KPiA+IAo+ID4gRm9yIHRoaXMgdjUsIHdlIGFyZSBvbmx5
IGRvaW5nIHNvbWUgY2hhbmdlcyBvbgo+ID4gdGhlIGdhbW1hX3NldCBpbXBsZW1lbnRhdGlvbi4g
QXMgYSByZXN1bHQsIHRoZSBjb2RlCj4gPiBpcyBtb3JlIHJlYWRhYmxlLiBTZWUgdGhlIGNoYW5n
ZWxvZyBpbiBwYXRjaCAyIGZvciBtb3JlCj4gPiBpbmZvcm1hdGlvbi4KPiA+IAo+ID4gVGhhbmtz
IQo+IAo+IG9uIHJrMzI4OCAoYW5kIHJrMzM5OStyazMzMjggdG8gbWFrZSBzdXJlIG5vdGhpbmcg
YnJlYWtzKQo+IFRlc3RlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPiAK
CkFwcGxpZWQgdGhlIGZpcnN0IDIgcGF0Y2hlcyB0byBkcm0tbWlzYy1uZXh0IGZvciA1LjUuIEkn
bGwgbGVhdmUgMy8zIGZvciBIZWlrbwphbmQgdGhlIHJvY2tjaGlwIHRyZWUuCgpUaGFua3MgdG8g
YWxsIGZvciB0aGUgcmV2aWV3cyBhbmQgdGVzdGluZywgdGhhbmtzIHRvIEV6ZXF1aWVsIGZvciBz
dGlja2luZyB3aXRoCnRoaXMgdG8gY29tcGxldGlvbiEKClNlYW4KCj4gCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKU2VhbiBQYXVsLCBT
b2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
