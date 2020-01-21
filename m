Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45609143C34
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 12:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2AD6EC7A;
	Tue, 21 Jan 2020 11:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5936EC7A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 11:46:20 +0000 (UTC)
Received: from mail-qv1-f47.google.com ([209.85.219.47]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N3bGP-1jbM2C1Oy3-010gh6; Tue, 21 Jan 2020 12:46:19 +0100
Received: by mail-qv1-f47.google.com with SMTP id t6so1264325qvs.5;
 Tue, 21 Jan 2020 03:46:19 -0800 (PST)
X-Gm-Message-State: APjAAAWa0naDNBnvQGPFjMNdJUK1v7abzOOixpSwvr01WD6eNeLQpbSh
 Wu4VvAQcojqDaRPLGTn0kM7i//fnIcBoxrCa3hE=
X-Google-Smtp-Source: APXvYqyxZGlIFCBF780+KS/2bkfvq0hP+a0/hThj2asG4RwHxIFlbrU9wtbrUp8O1361oVkawD1TQHBg3rBp7/M4I3g=
X-Received: by 2002:a0c:e7c7:: with SMTP id c7mr4350634qvo.222.1579607178086; 
 Tue, 21 Jan 2020 03:46:18 -0800 (PST)
MIME-Version: 1.0
References: <20191213204936.3643476-1-arnd@arndb.de>
 <20191213205417.3871055-4-arnd@arndb.de>
 <20200117154726.GA328525@bogon.m.sigxcpu.org>
 <aaf2f587a61dee42c25805c3fe7916bed4dbd0c3.camel@pengutronix.de>
 <CAK8P3a3hyDeskg0ix=1+yNihqacZ5rqsXaHbRsBfPt7zFr8EOw@mail.gmail.com>
 <8d86fcb526ee14c7e6c80a787db645192c2c7c33.camel@pengutronix.de>
In-Reply-To: <8d86fcb526ee14c7e6c80a787db645192c2c7c33.camel@pengutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 Jan 2020 12:46:01 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0tKt_ZfAPnPKbaOQ9j3A+kS0LypeGA46epdyQw-knitA@mail.gmail.com>
Message-ID: <CAK8P3a0tKt_ZfAPnPKbaOQ9j3A+kS0LypeGA46epdyQw-knitA@mail.gmail.com>
Subject: Re: [PATCH v2 13/24] drm/etnaviv: reject timeouts with tv_nsec >=
 NSEC_PER_SEC
To: Lucas Stach <l.stach@pengutronix.de>
X-Provags-ID: V03:K1:7cCfG2I6unPcykExA0eqGhnxq3kI8O7GEPYxwEe4m0+U+J5oK/c
 Ih/SDYWYAkHN/g2GTL6b02UWOOSR+VEJriLqsKoTsYJ52+WgOb+hKHCEFrnga8Mton3z+Qj
 pkxoKV1bLskDuw6DVDnY4lbJ1ooUVIeeC4UKDucBoro5wVYWM8DRoQ2x5zExya0exZ4Lq1C
 TBuHpiXgZ1jupKl/3q7YQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2YCRzndC4xc=:JRryxyAVY1pT0zIctrGYpO
 TeXJuf8ZUHTQFZgSflAZnDI1MD8V7Rrq/uDkGM7/kjjcN17sdPsVyo0hLPuF6Mag0eBY8navr
 gHa/kADLwBXEqV3X+ZaqWk1NSzuKKQ/j82eITaItd7qpV8Pn+MALZtFxNwfbWQZDSO+g0hZXJ
 KWvh1YduVw1cRUVFajRMpUBVPq97HqTryB05L6Tsd5tNDMfLA/G4oUQdzSNIcg0qCOni95qwA
 tu/y1ewq975R08J8ukYjzvUIWWN2saKHpcanKJvzWLwFXyVcOYPKOCrWE4XjIWgZa8L0b2mIF
 RZ3h6umVyzEc4nq5x7bDOMd1ajQu9SxZjJ1rV6L6IhHILtCO7mdcPU3oWYxSCHH9CJx0RDJKW
 DsK/dk72GGFdEMhfixQW+Jw6xFRTDWJxeJeGBNQ5tJu4L84SaLjd+w6nTebOuPpGLLGiR5CiV
 iJ+ylHTox6MGpQdcONLBvxRr+HzX3Hww+ZpxuFsyOjPRD8IhQOZmi7C/MsLKirae5b0bQZ/vG
 UErU2ba2BzvWBoWK3/JjWRLx3xzcHagQx7toxccZIHSoD6iZuEYFJSwq7lw8IXCyhb/m3H+5j
 Sxy7lF+ty7IwdhAQGP7wpx6YZATQHZ7q0nor5CK6Cy1cBwI+9umW/UQFqb/tHucRgsmkJ9v/h
 2+5H44jz+WbDCv1Vvx4vKQrb9JMlUYelvJ2A8/Kn8WURXACzMtd6CpmLCFizef7j1ZxRMqUGX
 2Bx6bw3MutS5JuDwg6x8IOQs3KBo8hghXPlO4IMCaT+FunCeMUa2DpiSHvpXJ1rRRSK8VTZy4
 BmfzoarXzTcxsxjSk0c3785HhNiC/ND38T3Jd9OzGM2dyY0QYFint8OPzOdHCHLJStVNO5ovp
 ntkOB72Ajf3fUmgWee8g==
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
Cc: y2038 Mailman List <y2038@lists.linaro.org>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgMTE6MjIgQU0gTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVu
Z3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gT24gTW8sIDIwMjAtMDEtMjAgYXQgMTk6NDcgKzAxMDAs
IEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPiBPbiBNb24sIEphbiAyMCwgMjAyMCBhdCA2OjQ4IFBN
IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiA+ID4gT24gRnIs
IDIwMjAtMDEtMTcgYXQgMTY6NDcgKzAxMDAsIEd1aWRvIEfDvG50aGVyIHdyb3RlOgo+ID4gPiA+
IFRoaXMgYnJlYWtzIHJlbmRlcmluZyBoZXJlIG9uIGFybTY0L2djNzAwMCBkdWUgdG8KPiA+ID4g
Pgo+ID4gPiA+IGlvY3RsKDYsIERSTV9JT0NUTF9FVE5BVklWX0dFTV9DUFVfUFJFUCBvciBEUk1f
SU9DVExfTVNNX0dFTV9DUFVfUFJFUCwgMHhmZmZmZjc4ODg2ODApID0gLTEgRUlOVkFMIChJbnZh
bGlkIGFyZ3VtZW50KQo+ID4gPiA+IGlvY3RsKDYsIERSTV9JT0NUTF9FVE5BVklWX0dFTV9DUFVf
RklOSSBvciBEUk1fSU9DVExfUVhMX0NMSUVOVENBUCwgMHhmZmZmZjc4ODg1ZTApID0gMAo+ID4g
PiA+IGlvY3RsKDYsIERSTV9JT0NUTF9FVE5BVklWX0dFTV9DUFVfUFJFUCBvciBEUk1fSU9DVExf
TVNNX0dFTV9DUFVfUFJFUCwgMHhmZmZmZjc4ODg2ODApID0gLTEgRUlOVkFMIChJbnZhbGlkIGFy
Z3VtZW50KQo+ID4gPiA+IGlvY3RsKDYsIERSTV9JT0NUTF9FVE5BVklWX0dFTV9DUFVfRklOSSBv
ciBEUk1fSU9DVExfUVhMX0NMSUVOVENBUCwgMHhmZmZmZjc4ODg1ZTApID0gMAo+ID4gPiA+IGlv
Y3RsKDYsIERSTV9JT0NUTF9FVE5BVklWX0dFTV9DUFVfUFJFUCBvciBEUk1fSU9DVExfTVNNX0dF
TV9DUFVfUFJFUCwgMHhmZmZmZjc4ODg2ODApID0gLTEgRUlOVkFMIChJbnZhbGlkIGFyZ3VtZW50
KQo+ID4gPiA+IGlvY3RsKDYsIERSTV9JT0NUTF9FVE5BVklWX0dFTV9DUFVfRklOSSBvciBEUk1f
SU9DVExfUVhMX0NMSUVOVENBUCwgMHhmZmZmZjc4ODg1ZTApID0gMAo+ID4gPiA+Cj4gPiA+ID4g
VGhpcyBpcyBkdWUgdG8KPiA+ID4gPgo+ID4gPiA+ICAgICBnZXRfYWJzX3RpbWVvdXQoJnJlcS50
aW1lb3V0LCA1MDAwMDAwMDAwKTsKPiA+ID4gPgo+ID4gPiA+IGluIGV0bmFfYm9fY3B1X3ByZXAg
d2hpY2ggY2FuIGV4Y2VlZCBOU0VDX1BFUl9TRUMuCj4gPiA+ID4KPiA+ID4gPiBTaG91bGQgaSBz
ZW5kIGEgcGF0Y2ggdG8gcmV2ZXJ0IHRoYXQgY2hhbmdlIHNpbmNlIGl0IGJyZWFrcyBleGlzdGlu
ZyB1c2Vyc3BhY2U/Cj4gPiA+Cj4gPiA+IE5vIG5lZWQgdG8gcmV2ZXJ0LiBUaGlzIHBhdGNoIGhh
cyBub3QgYmVlbiBhcHBsaWVkIHRvIHRoZSBldG5hdml2IHRyZWUKPiA+ID4geWV0LCBJIGd1ZXNz
IGl0J3MganVzdCBpbiBvbmUgb2YgQXJuZHMgYnJhbmNoZXMgZmVlZGluZyBpbnRvIC1uZXh0Lgo+
ID4gPgo+ID4gPiBUaGF0IHBhcnQgb2YgdXNlcnNwYWNlIGlzIHByZXR0eSBkdW1iLCBhcyBpdCBt
aXNzZXMgdG8gcmVub3JtYWxpemUKPiA+ID4gdHZfbnNlYyB3aGVuIGl0IG92ZXJmbG93cyB0aGUg
c2Vjb25kIGJvdW5kYXJ5LiBTbyBpZiB3aGF0IEkgc2VlIGlzCj4gPiA+IGNvcnJlY3QgaXQgc2hv
dWxkIGJlIGVub3VnaCB0byBhbGxvdyAyICogTlNFQ19QRVJfU0VDLCB3aGljaCBzaG91bGQKPiA+
ID4gYm90aCByZWplY3QgYnJva2VuIGxhcmdlIHRpbWVvdXQgYW5kIGtlZXAgZXhpc3RpbmcgdXNl
cnNwYWNlIHdvcmtpbmcuCj4gPgo+ID4gQWgsIHNvIGl0J3MgbmV2ZXIgbW9yZSB0aGFuIDIgYmls
bGlvbiBuYW5vc2Vjb25kcyBpbiBrbm93biB1c2VyIHNwYWNlPwo+ID4gSSBjYW4gZGVmaW5pdGVs
eSBjaGFuZ2UgbXkgcGF0Y2ggKGFjdHVhbGx5IGFkZCBvbmUgb24gdG9wKSB0byBhbGxvdyB0aGF0
Cj4gPiBhbmQgaGFuZGxlIGl0IGFzIGJlZm9yZSwgb3IgYWx0ZXJuYXRpdmVseSBhY2NlcHQgYW55
IDY0LWJpdCBuYW5vc2Vjb25kIHZhbHVlCj4gPiBhcyBhcm02NCBhbHJlYWR5IGRpZCwgYnV0IG1h
a2UgaXQgbGVzcyBpbmVmZmljaWVudCB0byBoYW5kbGUuCj4KPiBTbyB0aGUgYnJva2VuIHVzZXJz
cGFjZSBjb2RlIGxvb2tzIGxpa2UgdGhpczoKPgo+IHN0YXRpYyBpbmxpbmUgdm9pZCBnZXRfYWJz
X3RpbWVvdXQoc3RydWN0IGRybV9ldG5hdml2X3RpbWVzcGVjICp0diwgdWludDY0X3QgbnMpCj4g
ewo+ICAgICAgICAgc3RydWN0IHRpbWVzcGVjIHQ7Cj4gICAgICAgICB1aW50MzJfdCBzID0gbnMg
LyAxMDAwMDAwMDAwOwo+ICAgICAgICAgY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUMsICZ0
KTsKPiAgICAgICAgIHR2LT50dl9zZWMgPSB0LnR2X3NlYyArIHM7Cj4gICAgICAgICB0di0+dHZf
bnNlYyA9IHQudHZfbnNlYyArIG5zIC0gKHMgKiAxMDAwMDAwMDAwKTsKPiB9Cj4KPiBXaGljaCBt
ZWFucyBpdCBfdHJpZXNfIHRvIGRvIHRoZSByaWdodCB0aGluZyBieSBwdXR0aW5nIHRoZSBiaWxs
aW9uCj4gcGFydCBpbnRvIHRoZSB0dl9zZWMgbWVtYmVyIGFuZCBvbmx5IHRoZSByZW1haW5pbmcg
bnMgcGFydCBpcyBhZGRlZCB0bwo+IHR2X25zZWMsIGJ1dCB0aGVuIGl0IGZhaWxzIHRvIHByb3Bh
Z2F0ZSBhIHR2X25zZWMgb3ZlcmZsb3cgb3Zlcgo+IE5TRUNfUEVSX1NFQyBpbnRvIHR2X3NlYy4K
Pgo+IFdoaWNoIG1lYW5zIHRoZSB0dl9uc2VjIHNob3VsZCBuZXZlciBiZSBtb3JlIHRoYW4gMiAq
IE5TRUNfUEVSX1NFQyBpbgo+IGtub3duIHVzZXJzcGFjZS4gSSB3b3VsZCBwcmVmZXIgaWYgd2Ug
Y291bGQgbWFrZSB0aGUgaW50ZXJmYWNlIGFzCj4gc3RyaWN0IGFzIHBvc3NpYmxlIChpLmUuIG5v
IGFyYml0cmFyeSBsYXJnZSBudW1iZXJzIGluIHR2X25zZWMpLCB3aGlsZQo+IGtlZXBpbmcgdGhp
cyBzcGVjaWZpYyBjb3JuZXIgY2FzZSB3b3JraW5nLgoKSSd2ZSBhZGRlZCBhIHBhdGNoIG9uIHRv
cCBvZiBteSAyMDM4IGJyYW5jaCwgcGxlYXNlIGhhdmUgYSBsb29rIGF0IHRoYXQuCgogICAgICBB
cm5kCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
