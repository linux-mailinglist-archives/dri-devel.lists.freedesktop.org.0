Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB356E18E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 09:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE3E6E5B5;
	Fri, 19 Jul 2019 07:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C920B6E3EE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 15:13:22 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id e20so21646085iob.9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 08:13:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YxhFlZti0naM2sDVdiDzJc8/ssIuZA4T/1kRQ8AEdP4=;
 b=D1xASbyJmtia/SStItiT4TzoARjPinj6ZZEtY+cUIOU3+eZcU/Jrvu+6ANutJwGXhu
 jnEXRhdhEoaafIX8tZmYsBGYARNmSrh0x+BoulB2+9tKlJ3RvQ+cYtcKasrr3Wrl5El4
 8d9dG1voQr5+Rmyqn39yIc4LZvsf3zN36oYWeDnl7+8bDUv9Ty1FxbWsj614fwhqqcW2
 /xf7zOKm766WTo3H8byUFmYbomRnhXJpN/iigYAyhNHA9snlsH3gUk+r5ye5PRpsuc8S
 ZoaT26qcPgINR6j8btOi9YAHQUSn51Z1dMtIS2ihT57psoWEzYAS2OVdBAfwun+Um6tM
 K3oA==
X-Gm-Message-State: APjAAAUKC7OElDwtu57pGYjLGuCeX2t1u1qL4vbu5sP4BjNB9MhSj3Qx
 DS8DzqJ0GAmhqLrc6ps2DOSC6pHkkgaDNg6BeSI=
X-Google-Smtp-Source: APXvYqyy6OG/tR1lqn+BDem6HrdtnNMA/3X8yiuoyfk09UEpbo1gGBW+QIlyr9RnAWtrI/EnjoS/vbf3L1Ls5JIE9U8=
X-Received: by 2002:a6b:7208:: with SMTP id n8mr33238445ioc.151.1563462801849; 
 Thu, 18 Jul 2019 08:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190718134253epcas3p32a5afece52c47aaac0cd5795ff4cf022@epcas3p3.samsung.com>
 <20190718134240.2265724-1-arnd@arndb.de>
 <ea59751e-7391-e3e9-bb46-00e86b25f1a8@samsung.com>
 <CAK8P3a0q5xmi+mCvb1ET4d1uQmbnw+J2VkjRCzjemCXGy+5OBg@mail.gmail.com>
 <7da08013-5ee0-1c39-e16b-8b6843a28381@samsung.com>
In-Reply-To: <7da08013-5ee0-1c39-e16b-8b6843a28381@samsung.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 18 Jul 2019 18:13:08 +0300
Message-ID: <CAKdAkRQQn40nUm6KjK80Zj95b_dhkTmETp7rMe+1s61gR4Xv5Q@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: fix RC_CORE dependency
To: Andrzej Hajda <a.hajda@samsung.com>
X-Mailman-Approved-At: Fri, 19 Jul 2019 07:16:02 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=YxhFlZti0naM2sDVdiDzJc8/ssIuZA4T/1kRQ8AEdP4=;
 b=Fd1twbsRFkV2uARiboN365L46fCumZdWwggXza4I9g+14jQ/0ZBU41IunO1gxAhnWh
 AJZKfFjseNbttdxS58l+XFoCi/V6+cjbOQyavTaAF8iO+GNZ4txNmYtFQG0pSl/NYngW
 uqJpqlDXRXluzItAEgpuqPVTDhJDbe8MdjBLmSrTTFhw8+FesAoGRxe/ekypVMsI1SHl
 MB7fMS2gNVIkHA7BLfob3iDPXQF30JC90BqeDLbK9FzAFj7rr2cSH9Xq0XaTRNeURyt9
 5p0NvduYZLObluTF/yq1Pprx3hS3M9IpM7TxlsFlgAitcruT57tSgHKqYql5f+72OGds
 VIWQ==
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Ronald_Tschal=C3=A4r?= <ronald@innovation.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNTo1NSBQTSBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNh
bXN1bmcuY29tPiB3cm90ZToKPgo+IE9uIDE4LjA3LjIwMTkgMTY6MjEsIEFybmQgQmVyZ21hbm4g
d3JvdGU6Cj4gPiBPbiBUaHUsIEp1bCAxOCwgMjAxOSBhdCA0OjE2IFBNIEFuZHJ6ZWogSGFqZGEg
PGEuaGFqZGFAc2Ftc3VuZy5jb20+IHdyb3RlOgo+ID4+IEhpIEFybmQsCj4gPj4KPiA+PiBPbiAx
OC4wNy4yMDE5IDE1OjQyLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4+PiBVc2luZyAnaW1wbHkn
IGNhdXNlcyBhIG5ldyBwcm9ibGVtLCBhcyBpdCBhbGxvd3MgdGhlIGNhc2Ugb2YKPiA+Pj4gQ09O
RklHX0lOUFVUPW0gd2l0aCBSQ19DT1JFPXksIHdoaWNoIGZhaWxzIHRvIGxpbms6Cj4gPj4+Cj4g
Pj4+IGRyaXZlcnMvbWVkaWEvcmMvcmMtbWFpbi5vOiBJbiBmdW5jdGlvbiBgaXJfZG9fa2V5dXAn
Ogo+ID4+PiByYy1tYWluLmM6KC50ZXh0KzB4MmI0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBg
aW5wdXRfZXZlbnQnCj4gPj4+IGRyaXZlcnMvbWVkaWEvcmMvcmMtbWFpbi5vOiBJbiBmdW5jdGlv
biBgcmNfcmVwZWF0JzoKPiA+Pj4gcmMtbWFpbi5jOigudGV4dCsweDM1MCk6IHVuZGVmaW5lZCBy
ZWZlcmVuY2UgdG8gYGlucHV0X2V2ZW50Jwo+ID4+PiBkcml2ZXJzL21lZGlhL3JjL3JjLW1haW4u
bzogSW4gZnVuY3Rpb24gYHJjX2FsbG9jYXRlX2RldmljZSc6Cj4gPj4+IHJjLW1haW4uYzooLnRl
eHQrMHg5MGMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBpbnB1dF9hbGxvY2F0ZV9kZXZpY2Un
Cj4gPj4+Cj4gPj4+IEFkZCBhICdkZXBlbmRzIG9uJyB0aGF0IGFsbG93cyBidWlsZGluZyBib3Ro
IHdpdGggYW5kIHdpdGhvdXQKPiA+Pj4gQ09ORklHX1JDX0NPUkUsIGJ1dCBkaXNhbGxvd3MgY29t
YmluYXRpb25zIHRoYXQgZG9uJ3QgbGluay4KPiA+Pj4KPiA+Pj4gRml4ZXM6IDUwMjNjZjMyMjEw
ZCAoImRybS9icmlkZ2U6IG1ha2UgcmVtb3RlIGNvbnRyb2wgb3B0aW9uYWwiKQo+ID4+PiBTaWdu
ZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+ID4+Cj4gPj4gUHJvcGVy
IHNvbHV0aW9uIGhhcyBiZWVuIGFscmVhZHkgbWVyZ2VkIHZpYSBpbnB1dCB0cmVlWzFdLgo+ID4+
Cj4gPj4KPiA+PiBbMV06Cj4gPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9DQUtkQWtS
VEdYTmJVc3VLQVNOR0xmd1V3QzdBc29kOUs1YmFZTFBXUFU3RVgtNDIteUFAbWFpbC5nbWFpbC5j
b20vCj4gPiBBdCB0aGF0IGxpbmssIEkgb25seSBzZWUgdGhlIHBhdGNoIHRoYXQgY2F1c2VkIHRo
ZSByZWdyZXNzaW9uLCBub3QKPiA+IHRoZSBzb2x1dGlvbi4gQXJlIHlvdSBzdXJlIGl0J3MgZml4
ZWQ/Cj4KPgo+IFVwcywgeW91IGFyZSByaWdodCwgSSB0aG91Z2ggeW91IGFyZSBmaXhpbmcgd2hh
dCB0aGlzIHBhdGNoIGF0dGVtcHRlZCB0bwo+IGZpeCA6KQo+Cj4gQW55d2F5LCB3ZSB3YW50IHRv
IGF2b2lkIGRlcGVuZGVuY3kgb24gUkNfQ09SRSAtIHRoaXMgZHJpdmVyIGRvZXMgbm90Cj4gcmVx
dWlyZSBpdCwgYnV0IHdpdGggUkNfQ09SRSBpdCBoYXMgYWRkaXRpb25hbCBmZWF0dXJlcy4KPgo+
IE1heWJlICJpbXBseSBJTlBVVCIgd291bGQgaGVscD8KCk5vLCBpdCB3b24ndC4gSSBhbSBzb3Jy
eSwgSSBzaG91bGQgaGF2ZSBsb29rZWQgY2xvc2VyLCBidXQgYXMgd3JpdHRlbiwKZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zaWwtc2lpODYyMC5jIGhhcyBhIGhhcmQgZGVwZW5kZW5jeSBvbiB0aGUg
UkMKY29yZSBhbmQgImltcGx5IiB3YXMgdGhlIHdyb25nIHNvbHV0aW9uIGZvciB0aGlzLCB3ZSBu
ZWVkICJkZXBlbmRzIG9uClJDX0NPUkUiLiBJZiB3ZSB3YW50IHRvIG1ha2UgUkMgc3VwcG9ydCBv
cHRpb25hbCB0aGFuIHdlIHNob3VsZCBzdHViCm91dCBwYXRocyB0aGF0IHVzZSBSQ19DT1JFIChz
dWNoIGFzIHNpaTg2MjBfaW5pdF9yY3BfaW5wdXRfZGV2KCkpIGFuZApndWFyZCB0aGVtIGJ5ICIj
aWZkZWYgQ09ORklHX1JDX0NPUkUiLiBUaGVuIHdlIGNvdWxkIGtlZXAgImltcGx5IiBvbgpSQ19D
T1JFLgoKSSBhbSBzdXJwcmlzZWQgdGhvdWdoIHRoYXQgaW1wbHkgYWxsb3dzIHZpb2xhdGluZyB0
aGUgY29uc3RyYWludCBvbgppbXBsaWVkIHN5bWJvbHMsIGFzIFJDX0NPUkUgaGFzIHN0cmFpZ2h0
ICJkZXBlbmRzIG9uIiBmb3IgSU5QVVQuCgpUaGFua3MuCgotLSAKRG1pdHJ5Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
