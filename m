Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 570C072F38
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9137F6E4AE;
	Wed, 24 Jul 2019 12:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585DD6E4F5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 12:52:32 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id x3so31970915lfc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 05:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qHv399UMvKmjBUhICvXu9ZcLkXJpNhyDQbmeOYvi/us=;
 b=g1rjULRm86tiWOvpYwghsJcrQyMgyGyib8rY4AmtNRs9Hl7vKuc+qZ8PuM3Q6mZu5y
 Mqy5dsbz7awYlCJw9rbl8RjEoXBkmjB3vnM3yRtvIrCYiP9efpbbraArfN40MdM+bZ8D
 yyC/82fOqQPbvCLYKo45nYwpwEEp5/uNJWX1lTkbw9Js/7ZNGim3spolN5ZkKiUuyLb3
 ZJq22DXWfSt+b66tUUbTEmOObs+NNAN2t88Ircu6oyd4M2vHNFATMGM+7ADGK70+Kp2p
 kfvkk0feq9c81tMGoYcMRwGf3N3HH0e1w9EQwAlRgCRY9UNaS86gpCOSFB8LC+Q2Bez8
 Me4g==
X-Gm-Message-State: APjAAAWmqBiV95DtIV4jMcaEdpiJvGieA51+FtfvRmGOvgNHKcsDbtb7
 tuWFqb6gLKYj41Q2Q46OLBZNCrnUhyd7Vkh+6Fk23Q==
X-Google-Smtp-Source: APXvYqx7ok3vKGTE6pvikYTLe5JQi+JRtOUMWS2eTVmv7HEpUj+ZPg+oss7sKY2J8CzaCQe10KiSRVRX2w5u+ZqLQNs=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr37074528lfh.92.1563972750695; 
 Wed, 24 Jul 2019 05:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190723133755.22677-1-linus.walleij@linaro.org>
 <20190723133755.22677-2-linus.walleij@linaro.org>
 <9c9b77b3b76e7a7e87c7c3d9076a8339362157bd.camel@redhat.com>
 <CAKMK7uHVudGdTzQS3Q6qVTZtDU-UsSQ2K04M9VvZHxzXo0DHOw@mail.gmail.com>
In-Reply-To: <CAKMK7uHVudGdTzQS3Q6qVTZtDU-UsSQ2K04M9VvZHxzXo0DHOw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 24 Jul 2019 14:52:19 +0200
Message-ID: <CACRpkdZWpRFN7=m+XRUbYLjAUxygwHZ6ehKEK+7nmPxSKY0o9w@mail.gmail.com>
Subject: Re: [PATCH 1/3] RFT: drm/pl111: Support grayscale
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=qHv399UMvKmjBUhICvXu9ZcLkXJpNhyDQbmeOYvi/us=;
 b=zIkNBt1oiaYdHbqQmoPWFDOqdeXEMdP0Gfihv9qP2HCt9xdrhbe6Yx0K9+6afLNiD8
 W24oV8N8NBvHjLMQ+h4NL4Ocu/Bg8WmYsZwYPIw371iOH6a5A4zo8y6SUncOAz1uOYj7
 MJMPK5vx5kmyG45kVVe12aCdB6VT9ye7a/wCkD8y92avs1CCY9/4ndQd8I029MDa6EEY
 5neB32DWbdafhdIelNbN75hSr/nqSHus0gEc1yU4Cucdil742idfQTYVC6DJKJGnmA3v
 QGpgxltqytrVz4+UQf5b2GmQbTQV+v7ha5FMzLS+W4E6wkwUalVGvH8+HRMcQd23NtQq
 84iQ==
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
Cc: Fabian Vogt <fabian@ritter-vogt.de>, Daniel Tang <dt.tangr@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMTE6MDcgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPiB3cm90ZToKPiBPbiBUdWUsIEp1bCAyMywgMjAxOSBhdCA3OjI1IFBNIEFkYW0gSmFj
a3NvbiA8YWpheEByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIDIwMTktMDctMjMg
YXQgMTU6MzcgKzAyMDAsIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gPiA+IE1pZ3JhdGluZyB0aGUg
VEkgbnNwaXJlIGNhbGN1bGF0b3JzIHRvIHVzZSB0aGUgUEwxMTEgZHJpdmVyIGZvcgo+ID4gPiBm
cmFtZWJ1ZmZlciByZXF1aXJlcyBncmF5c2NhbGUgc3VwcG9ydCBmb3IgdGhlIGVsZGVyIHBhbmVs
Cj4gPiA+IHdoaWNoIHVzZXMgOGJpdCBncmF5c2NhbGUgb25seS4KPiA+ID4KPiA+ID4gRFJNIGRv
ZXMgbm90IHN1cHBvcnQgOGJpdCBncmF5c2NhbGUgZnJhbWVidWZmZXJzIGluIG1lbW9yeSwKPiA+
ID4gYnV0IGJ5IGRlZmluaW5nIHRoZSBidXMgZm9ybWF0IHRvIGJlIE1FRElBX0JVU19GTVRfWThf
MVg4IHdlCj4gPiA+IGNhbiBnZXQgdGhlIGhhcmR3YXJlIHRvIHR1cm4gb24gYSBncmF5c2NhbGlu
ZyBmZWF0dXJlIGFuZAo+ID4gPiBjb252ZXJ0IHRoZSBSR0IgZnJhbWVidWZmZXIgdG8gZ3JheXNj
YWxlIGZvciB1cy4KPiA+Cj4gPiBXaGF0J3Mgd3Jvbmcgd2l0aCBEUk1fRk9STUFUX1I4PyBZZXMg
dGhlIGhhcmR3YXJlIGlzIG5vdCByZWFsbHkKPiA+ICJyZWRzY2FsZSIsIGJ1dCBpdCdzIHN0aWxs
IGEgc2luZ2xlIGNvbG9yIGNoYW5uZWwgYW5kIHRoZXJlJ3Mgbm90Cj4gPiByZWFsbHkgYW55IGFt
YmlndWl0eS4KPgo+IFllYWgsIEkgdGhpbmsgd2l0aCBhIGNvbW1lbnQgb3IgYW4gYWxpYXNpbmcg
I2RlZmluZSB0byBfWTggKG9yIGJvdGgpCj4gdGhpcyBpcyBnb29kIHRvIGdvLgoKSXMgdGhlcmUg
c29tZXRoaW5nIHJlYWxseSB3cm9uZyB3aXRoIGp1c3QgYml0aW5nIHRoZSBidWxsZXQgYW5kIGRv
IHRoaXM6CgovKiA4IGJwcCBncmF5c2NhbGUgKi8KI2RlZmluZSBEUk1fRk9STUFUX1k4IGZvdXJj
Y19jb2RlKCdZJywgJzgnLCAnICcsICcgJykgLyogWzc6MF0gWSAqLwoKSXQncyBxdWl0ZSBhbiBl
bWJhcnJhc2VtZW50IGZvciBteSBPQ0QgdGVuZGVuY2llcyB0byB0YWxrIGFib3V0CmJsYWNrLWFu
ZC13aGl0ZSBUViBhcyBpZiBpdCB3YXMgMjU2IFNoYWRlcyBvZiBSZWQgKGdvb2QgdGl0bGUKZm9y
IGEgbm92ZWwgYnkgdGhlIHdheSkuCgpJIGRvbid0IGtub3cgaG93IHRoZXNlIEZPVVJDQyB0aGlu
Z3Mgd29yaywgcG9zc2libHkgbmV3CmZvdXJjYzpzIGNhbiBvbmx5IGJlIGRlZmluZWQgYnkgc29t
ZSBlc3BlY2lhbGx5IGVubGlnaHRlbmVkCmNhYmFsIG9mIHN0YW5kYXJkaXphdGlvbj8KCihJdCBi
ZWF0cyBtZSBob3cgaXQgY2FuIG5vdCBhbHJlYWR5IGV4aXN0IGluIHRoYXQgY2FzZS4pCgo+IFlv
dSBwcm9iYWJseSBzdGlsbCB3YW50IHRvIGV4cG9zZSB0aGUgcmdiIGZvcm1hdCBzaW5jZSB0b28g
bXVjaAo+IHVzZXJzcGFjZSBqdXN0IGFzc3VtZXMgdGhhdCB4cmdiODg4OCB3b3Jrcy4gU2FtZSBy
ZWFzb24gd2h5IHRoZQo+IHRpbnlkcm0gZHJpdmVycyBkbyB0aGUgc3cgY29udmVyc2lvbi4KClll
cyB0aGlzIGlzIHdoYXQgd2UgZG8gb24gUEwxMTEgbm93LCB3ZSBqdXN0IHJ1biBpdCB0aHJvdWdo
CnRoZSBoYXJkd2FyZSBncmF5c2NhbGVyLgoKVGhpcyBoYXJkd2FyZSBncmFjaW91c2x5IHN1cHBv
cnRzIHJlYWRpbmcgYmxhY2std2hpdGUgYW5kCmdyYXlzY2FsZSBiaXRtYXBzIHdpdGggMSAobW9u
b2Nocm9tZSksIDIsIDQgYW5kIDggYml0cyBwZXIKcGl4ZWwgd2hpY2ggd291bGQgYmUgWTEsIFky
LCBZNCBhbmQgWTguIEJ1dCB3ZSBvbmx5IGhhdmUKaGFyZHdhcmUgc3VwcG9ydGluZyBZOCBhdCBs
ZWFzdCBvbiB0aGUgb3RoZXIgc2lkZSBzbwpJIGRvbid0IHNlZSBhbnkgbmVlZCBmb3IgdGhlIG90
aGVycyBBVE0uCgpJIHN1c3BlY3QgdGhlIFkxIGV0YyBjb3VsZCBiZSB1c2VmdWwgZm9yIHBlb3Bs
ZSBkb2luZyBub3QKb25seSBIZXJjdWxlcyB2aWRlbyBkcml2ZXJzIChoYWghKSBidXQgYWxzbyBm
b3IgZVBhcGVyCmRpc3BsYXlzIG9mIHNheSwgc29tZSByYW5kb20gS2luZGxlLgoKWW91cnMsCkxp
bnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
