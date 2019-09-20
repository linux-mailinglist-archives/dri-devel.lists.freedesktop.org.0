Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA564B9891
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 22:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25AE6FDD3;
	Fri, 20 Sep 2019 20:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6326FDCB
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 20:22:56 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id c4so7637824edl.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 13:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h7BiFEPr6i2z1i+pS9YVOr9uD6I+CcNi47gOZAMaFAE=;
 b=NE37tBNIifjg1b4QmTNc9iV0FsJbpYZPrKxxs5Z68vybYDUldOw5YeqdbtieZHc4rK
 jxQOvg5Vj7U4Lf6ZsiABprBDRZonKkTkZpHkLhB7gXcp2jjgyY2AgOncWAQIu3eOnlwP
 KQybzzRsbJi1vTHHg8fuTkdWXqloK6ASXiPlAWSHYDCQMk3luhKNXH9UOsY+4X8Rxh6s
 kgcY9/jaXc1uoYtS5qMZYZu9+py4c1h/VYxOYLq/aLH8R9XfM/Zg7Kslyr1L4GBXIh0d
 OH9AWUxuz2NVprD5OTFO5GPKuHvLNX6W6Hq5D+KQtmv3s6tWpmvyB0ZbXppyoPsfoCbc
 E35Q==
X-Gm-Message-State: APjAAAXOmR46LVe3eTtEZ3pm3KQoaQXoY+FD8PMHYJqsnf7ggITJsnPm
 HQadbHAvKofNV6ugcnS5J97oYUQAgbtL6dd8i+Z+irWZ
X-Google-Smtp-Source: APXvYqyZ6XcE8G2zZNhRFLWq4H1A60w6Pa1SLGVXlR9A6Djwejt0ptIcJHhDbV4C+IRf0Ac+43I9tOdzbXtBRRJvkOM=
X-Received: by 2002:a05:6402:1a45:: with SMTP id
 bf5mr23501603edb.275.1569010975439; 
 Fri, 20 Sep 2019 13:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190918110541.38124-1-roman.stratiienko@globallogic.com>
 <9229663.7SG9YZCNdo@jernej-laptop>
In-Reply-To: <9229663.7SG9YZCNdo@jernej-laptop>
From: Roman Stratiienko <roman.stratiienko@globallogic.com>
Date: Fri, 20 Sep 2019 23:22:44 +0300
Message-ID: <CAODwZ7uonAyhJAwZ+NFm_aHzC1Rzp=NyhQCu1h_85ecRxZ50cw@mail.gmail.com>
Subject: Re: drm/sun4i: Add missing pixel formats to the vi layer
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>
X-Mailman-Approved-At: Fri, 20 Sep 2019 20:39:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=globallogic.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h7BiFEPr6i2z1i+pS9YVOr9uD6I+CcNi47gOZAMaFAE=;
 b=liCM9nAEDr7Gr8QClveC6J+S79HCWVXIGBasnLKSVkdl+APVU2MCw2m8v1CzztgsSB
 jV8amWhYyF85BndLq6ycNdOVYhEKnDdxnISMMcjWcyPgmyg3+ei0CkJ9rDYP2iLFGBr+
 ugwotT82GAMMg6hf1X2VTCua1p63E28ZZZMDsp0HND2NfbKd3Qjnz+EyRsC5CmfuDFet
 N8vNNfc8afp+ZyUc2kxRrAA1JIuWerjr/o6qbGIEAh/ww6itLhAqRTw4LmUGNiS7HFsX
 vTP3C4oksB3bvgUwomMjiIj7ivIhW0RLGWtk09OxGBaldN926WUdbhVw89XBNwTqUXRj
 1kPw==
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgOTo1MyBQTSBKZXJuZWogxaBrcmFiZWMgPGplcm5lai5z
a3JhYmVjQHNpb2wubmV0PiB3cm90ZToKPgo+IEhpIQo+Cj4gRG5lIHNyZWRhLCAxOC4gc2VwdGVt
YmVyIDIwMTkgb2IgMTM6MDU6NDEgQ0VTVCBqZQo+IHJvbWFuLnN0cmF0aWllbmtvQGdsb2JhbGxv
Z2ljLmNvbSBuYXBpc2FsKGEpOgo+ID4gRnJvbTogUm9tYW4gU3RyYXRpaWVua28gPHJvbWFuLnN0
cmF0aWllbmtvQGdsb2JhbGxvZ2ljLmNvbT4KPiA+Cj4gPiBBY2NvcmRpbmcgdG8gQWxsd2lubmVy
IERFMi4wIFNwZWNpZmljYXRpb24gUkVWIDEuMCwgdmkgbGF5ZXIgc3VwcG9ydHMgdGhlCj4gPiBm
b2xsb3dpbmcgcGl4ZWwgZm9ybWF0czogIEFCR1JfODg4OCwgQVJHQl84ODg4LCBCR1JBXzg4ODgs
IFJHQkFfODg4OAo+Cj4gSXQncyB0cnVlIHRoYXQgREUyIFZJIGxheWVycyBzdXBwb3J0IHRob3Nl
IGZvcm1hdHMsIGJ1dCBpdCB3b3VsZG4ndCBjaGFuZ2UKPiBhbnl0aGluZyBiZWNhdXNlIGFscGhh
IGJsZW5kaW5nIGlzIG5vdCBzdXBwb3J0ZWQgYnkgdGhvc2UgcGxhbmVzLiBUaGVzZQo+IGZvcm1h
dHMgd2VyZSBkZWxpYmVyYXRlbHkgbGVmdCBvdXQgYmVjYXVzZSB0aGVpciBjb3VudGVycGFydHMg
d2l0aG91dCBhbHBoYQo+IGV4aXN0LCBmb3IgZXhhbXBsZSBBQkdSODg4OCA8LT4gWEJHUjg4ODgu
IEl0IHdvdWxkIGFsc28gY29uZnVzZSB1c2VyLCB3aGljaAo+IHdvdWxkIGV4cGVjdCB0aGF0IGFs
cGhhIGJsZW5kaW5nIHdvcmtzIGlmIGZvcm1hdCB3aXRoIGFscGhhIGNoYW5uZWwgaXMKPiBzZWxl
Y3RlZC4KPgo+IEFkbWl0dGVkbHkgc29tZSBmb3JtYXRzIHdpdGggYWxwaGEgYXJlIHN0aWxsIHJl
cG9ydGVkIGFzIHN1cHBvcnRlZCBkdWUgdG8gbGFjawo+IG9mIHRoZWlyIGNvdW50ZXJwYXJ0cyB3
aXRob3V0IGFscGhhLCBidXQgSSdtIGZpbmUgd2l0aCByZW1vdmluZyB0aGVtIGZvcgo+IGNvbnNp
c3RlbmN5LgoKV2h5IG5vdCB0byByZXBsYWNlICdBJyB3aXRoICdYJyBvbiBhbGwgcmVsZXZhbnQg
Zm9ybWF0cyBhbmQgbWFwIHRoZW0KdG8gY29ycmVzcG9uZGluZyBpbmRleCBtYXJrZWQgd2l0aCAn
QScgKHRoYXQgYmVoYXZlcyBhcyB0cnVlICdYJyBmb3IKdmkpCgo+Cj4gQmVzdCByZWdhcmRzLAo+
IEplcm5lago+Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUm9tYW4gU3RyYXRpaWVua28gPHJvbWFu
LnN0cmF0aWllbmtvQGdsb2JhbGxvZ2ljLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9zdW40aS9zdW44aV92aV9sYXllci5jIHwgNCArKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkv
c3VuOGlfdmlfbGF5ZXIuYwo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfdmlfbGF5
ZXIuYyBpbmRleCBiZDBlNmE1MmQxZDguLjA3YzI3ZTZhNGI3Nwo+ID4gMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfdmlfbGF5ZXIuYwo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3N1bjRpL3N1bjhpX3ZpX2xheWVyLmMKPiA+IEBAIC00MDQsMTcgKzQwNCwyMSBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9mdW5jcwo+ID4gc3VuOGlfdmlfbGF5ZXJf
ZnVuY3MgPSB7IHN0YXRpYyBjb25zdCB1MzIgc3VuOGlfdmlfbGF5ZXJfZm9ybWF0c1tdID0gewo+
ID4gICAgICAgRFJNX0ZPUk1BVF9BQkdSMTU1NSwKPiA+ICAgICAgIERSTV9GT1JNQVRfQUJHUjQ0
NDQsCj4gPiArICAgICBEUk1fRk9STUFUX0FCR1I4ODg4LAo+ID4gICAgICAgRFJNX0ZPUk1BVF9B
UkdCMTU1NSwKPiA+ICAgICAgIERSTV9GT1JNQVRfQVJHQjQ0NDQsCj4gPiArICAgICBEUk1fRk9S
TUFUX0FSR0I4ODg4LAo+ID4gICAgICAgRFJNX0ZPUk1BVF9CR1I1NjUsCj4gPiAgICAgICBEUk1f
Rk9STUFUX0JHUjg4OCwKPiA+ICAgICAgIERSTV9GT1JNQVRfQkdSQTU1NTEsCj4gPiAgICAgICBE
Uk1fRk9STUFUX0JHUkE0NDQ0LAo+ID4gKyAgICAgRFJNX0ZPUk1BVF9CR1JBODg4OCwKPiA+ICAg
ICAgIERSTV9GT1JNQVRfQkdSWDg4ODgsCj4gPiAgICAgICBEUk1fRk9STUFUX1JHQjU2NSwKPiA+
ICAgICAgIERSTV9GT1JNQVRfUkdCODg4LAo+ID4gICAgICAgRFJNX0ZPUk1BVF9SR0JBNDQ0NCwK
PiA+ICAgICAgIERSTV9GT1JNQVRfUkdCQTU1NTEsCj4gPiArICAgICBEUk1fRk9STUFUX1JHQkE4
ODg4LAo+ID4gICAgICAgRFJNX0ZPUk1BVF9SR0JYODg4OCwKPiA+ICAgICAgIERSTV9GT1JNQVRf
WEJHUjg4ODgsCj4gPiAgICAgICBEUk1fRk9STUFUX1hSR0I4ODg4LAo+Cj4KPgo+CgoKLS0gCkJl
c3QgcmVnYXJkcywKUm9tYW4gU3RyYXRpaWVua28KR2xvYmFsIExvZ2ljIEluYy4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
