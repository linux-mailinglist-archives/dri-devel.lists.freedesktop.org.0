Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCC41735DA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 12:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0946F3F9;
	Fri, 28 Feb 2020 11:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C36D6F3FA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 11:11:57 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id v2so2431118wrp.12
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 03:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DHQ6TzRktfwCFm2G9nYdTK63QiLmDj/mtTDHdDVEhuo=;
 b=g4C7DdAEqM4BKXX20OOHqg1jMbkUdn4kj4rTEouy1QKgYT0nk2TjxlAZjK10Wmf728
 kfzYLmO7somr4O7GfJsilkrGWsonG5wEm/U0gqyvvtDEfV6lHIuhcvmNsIZCW/yxArf6
 Fg9YuGFPMUNEdyC0AFMt63kfuMwDM1xQ/TB3MSESmxMSeqcR7WpoovpDU9F4DxZJaksl
 Ya7rZG+SrhDJyst13zvU6YvtBX/NvQd57mGb68E+7j2KXsT8StwPYYYp6z4DL4ES0sBJ
 1j7n1cTo+KuazVLKgIPWLEF3B8CQIbshox+u9VkRYKsk6TaFD1lujddwJJO2WuZ3Uo5D
 0pfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DHQ6TzRktfwCFm2G9nYdTK63QiLmDj/mtTDHdDVEhuo=;
 b=H1cYWUzYJnamhKYM3H5eSwxjRDUeANt3quPq6EMgxpLUhARaxYbmOQ4rA7FFF6E8P4
 NCEBZfOsFg9fnlL9JGq40++nuzjreMGisVdYUQMeVzyQGcBDvMfg34GfQniq+nw8hd4o
 /Ov8Vocgn8tOQUHHAsz+et2VNDKcPlvPgFcmW4TUVzBP3qOTUp8CtL3zFdsTVM/74Z62
 ZtODZxga1x2aNs2+XYaVo25FM0GeZX5k43C8msvLg3heHRBh2gmRZ0Uv5opNdGrqhHPb
 a3My0sTAzIo+SSvjcZQFgPez2U6Eg58DfFGWreIyxT4KPV0H7isXforPHdMVanKxOQwy
 5yEQ==
X-Gm-Message-State: APjAAAXu3OOjKiIKPa3CjMhV9c4TZF5iTucrRg44Rqn/jnlroeN8hSzD
 R40tuL514T/4qkltejjg4xjQu5CPIR7A5rmyBwS/nA==
X-Google-Smtp-Source: APXvYqwARf5DZs1zg6/ecp9sruGG1vb9RhyuI2hP5UvlreueEs7N7/Xx1koU3RPXd3D2P8QO3Kd44Sqsy05qaxAK14I=
X-Received: by 2002:adf:f586:: with SMTP id f6mr4346004wro.256.1582888315899; 
 Fri, 28 Feb 2020 03:11:55 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAEdQ38Hr-L6rg80Gf18QNM7eK-QDK0BBU-9tChT6VxrP+T4qCw@mail.gmail.com>
 <CAPj87rOhwLPGHaHvPrZ6j8zufO8VqiwNFoBGFjx95yHr3cBm3Q@mail.gmail.com>
 <nycvar.YFH.7.76.2002281033590.15553@n3.vanv.qr>
In-Reply-To: <nycvar.YFH.7.76.2002281033590.15553@n3.vanv.qr>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 28 Feb 2020 11:11:15 +0000
Message-ID: <CAPj87rOwKMorAw_roNuBG63oRO-pMZZNHkYJ3Bo9OL6=o5xMrA@mail.gmail.com>
Subject: Re: gitlab.fd.o financial situation and impact on services
To: Jan Engelhardt <jengelh@inai.de>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "X.Org development" <xorg-devel@lists.x.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>, Matt Turner <mattst88@gmail.com>,
 gstreamer-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFuLAoKT24gRnJpLCAyOCBGZWIgMjAyMCBhdCAxMDowOSwgSmFuIEVuZ2VsaGFyZHQgPGpl
bmdlbGhAaW5haS5kZT4gd3JvdGU6Cj4gT24gRnJpZGF5IDIwMjAtMDItMjggMDg6NTksIERhbmll
bCBTdG9uZSB3cm90ZToKPiA+SSBiZWxpZXZlIHRoYXQgaW4gSmFudWFyeSwgd2UgaGFkICQyMDgy
IG9mIG5ldHdvcmsgY29zdCAoYWxtb3N0Cj4gPmVudGlyZWx5IGVncmVzczsgaW5ncmVzcyBpcyBi
YXNpY2FsbHkgZnJlZSkgYW5kICQxNzUwIG9mCj4gPmNsb3VkLXN0b3JhZ2UgY29zdCAoYWxtb3N0
IGFsbCBvZiB3aGljaCB3YXMgZG93bmxvYWQpLiBUaGF0J3MgYmFzZWQKPiA+b24gMTZUQiBvZiBj
bG91ZC1zdG9yYWdlIChDSSBhcnRpZmFjdHMsIGNvbnRhaW5lciBpbWFnZXMsIGZpbGUKPiA+dXBs
b2FkcywgR2l0IExGUykgZWdyZXNzIGFuZCAxNy45VEIgb2Ygb3RoZXIgZWdyZXNzICh0aGUgd2Vi
IHNlcnZpY2UKPiA+aXRzZWxmLCByZXBvIGFjdGl2aXR5KS4gUHJvamVjdGluZyB0aGF0IG91dCBb
w5cxMiBmb3IgYSB5ZWFyXSBnaXZlcwo+ID51cyByb3VnaGx5ICQ0NWsgb2YgbmV0d29yayBhY3Rp
dml0eSBhbG9uZSwKPgo+IEkgaGFkIGNvbWUgdG8gYSBzaW1pbGFyIGNvbmNsdXNpb24gYSBmZXcg
eWVhcnMgYmFjazogSXQgaXMgbm90IHZlcnkKPiBlY29ub21pYyB0byBydW4gZXBoZW1lcmVhbCBi
dWlsZHJvb3RzIChhbmQgYW55dGhpbmcgbGlrZSBpdCkgYmV0d2Vlbgo+IHR3byAob3IgbW9yZSkg
InNpZ25pZmljYW50IGxvY2F0aW9ucyIgb2Ygd2hpY2ggb25lIGVuZCBpcyBsb2NhdGVkIGluCj4g
YSBMYXJnZSBDbG91ZCBkYXRhY2VudGVyIGxpa2UgRUMyL0FXUy9ldGMuCj4KPiBBcyBmb3Igc3Vj
aCB1c2VjYXNlcywgbWUgYW5kIG15IHN1cnJvdW5kaW5nIHBlZXJzIGhhdmUgdXNlZCAob3RoZXIp
Cj4gb2ZmZXJpbmdzIHdoZXJlIHRoZXJlIGlzIDUwIFRCIGZyZWUgbmV0d29yay9tb250aCwgYW5k
IHllcyB0aGF0IG1heQo+IGhhdmUgZW50YWlsZWQgZG9pbmcgbW9yZSBhZG1pbm5pbmcgdGhhbiBl
bHNld2hlcmUgLSBidXQgYW4gYWRtaW4KPiBhcHByZWNpYXRlcyAkMjAwMCBhIGxvdCBtb3JlIHRo
YW4gYSBjb3Jwb3JhdGlvbiwgdG9vLgoKWWVzLCBhYnNvbHV0ZWx5LiBGb3IgY29udGV4dCwgb3Vy
IHN0b3JhZ2UgJiBuZXR3b3JrIGNvc3RzIGhhdmUKaW5jcmVhc2VkID4xMHggaW4gdGhlIHBhc3Qg
MTIgbW9udGhzICh+JDMyMCBKYW4gMjAxOSksID4zeCBpbiB0aGUgcGFzdAo2IG1vbnRocyAofiQx
MzUwIEp1bHkgMjAxOSksIGFuZCB+MnggaW4gdGhlIHBhc3QgMyBtb250aHMgKH4kMjAwMCBPY3QK
MjAxOSkuCgpJIGRvIG5vdyAocGVyc29uYWxseSkgdGhpbmsgdGhhdCBpdCdzIGNyb3NzZWQgdGhl
IHBvaW50IGF0IHdoaWNoIGl0CndvdWxkIGJlIHdvcnRod2hpbGUgcGF5aW5nIGFuIGFkbWluIHRv
IHNvbHZlIHRoZSBwcm9ibGVtcyB0aGF0IGNsb3VkCnNlcnZpY2VzIGN1cnJlbnRseSBzb2x2ZSBm
b3IgdXMgLSB3aGljaCB3YXNuJ3QgdHJ1ZSBiZWZvcmUuIFN1Y2ggYW4KYWRtaW4gY291bGQgYWxz
byBkZWFsIHdpdGggdGhpbmdzIGxpa2Ugb3VyIFNNVFAgZGVsaXZlcnkgZmFpbHVyZSByYXRlLAp3
aGljaCBpbiB0aGUgcGFzdCB5ZWFyIGhhcyBzcGlrZWQgb3ZlciA1MCUgKHNlZSBwcmV2aW91cyBl
bWFpbCksCmRlbWFuZCBmb3IgbmV3IHNlcnZpY2VzIHN1Y2ggYXMgRGlzY291cnNlIHdoaWNoIHdp
bGwgZW5hYmxlIHVzZXIKc3VwcG9ydCB3aXRob3V0IGVpdGhlciBhKSB1c2VycyBoYXZpbmcgdG8g
c3Vic2NyaWJlIHRvIGEgbWFpbGluZyBsaXN0LApvciBiKSBidWcgdHJhY2tlcnMgYmVpbmcgY2x1
dHRlcmVkIHVwIHdpdGggdXNlciByZXF1ZXN0cyBhbmQgb3RoZXIKbm9uLWJ1Z3MsIGV0Yy4KCkNo
ZWVycywKRGFuaWVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
