Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 545762AF7B2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 19:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F6489F2D;
	Wed, 11 Nov 2020 18:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4FE89F2D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 18:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1605117961;
 bh=ApwHJgnFtO9F+H3qPaRi0DKrnk3tSql8Ml7NaQ/Ji14=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=btL8lUSn+AWnF1udwL/fVdsEMrqocHuModplfax4prbdc/8aiiq3eLTz3e6AMPuGI
 rnzkzahDiIg0tT97KJxTAppDZckkVFrcSNw6fgc9f2N0BwwqmQdrgLbeBkp7HB6BxP
 RudoCSwENYNzvZi75qwkeMSViTDdsjd494RKbcZk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [173.228.6.223] ([173.228.6.223]) by
 msvc-msdbsched-gmx002.server.lan (via HTTP); Wed, 11 Nov 2020 19:06:00
 +0100
MIME-Version: 1.0
Message-ID: <trinity-7fc6bee5-8d75-4099-bc9d-802265bd511f-1605064005261@3c-app-mailcom-bs06>
From: Kevin Brace <kevinbrace@gmx.com>
To: =?UTF-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: Re: Why is atomic_disable callback's plane->state->crtc sometimes
 null?
Date: Wed, 11 Nov 2020 19:06:00 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20201109172645.GK6112@intel.com>
References: <trinity-0d015aed-dc82-456d-9640-de541eafed45-1604361043510@3c-app-mailcom-bs01>
 <20201109172645.GK6112@intel.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:65qyLB7ivFLQewZcU694GJl8TRm1fNvMme0R0JVaBjMEaXI2+F2DRg+HV4DPvywjLLCZE
 dQdDUfiCkxn6WRLUWi906za8gLstakvFMmdiUNdNKEpPMRih69vc1K+clZsq7ULgZdMf5xFx6hZ+
 bBh693VJ0/sJvvde57VToZ1DnVseu1BgC9d1Bsat309xStSjzWF4DZaK8xdy7aRmSQkQYIXUdkje
 mB3MdxgsrpxDR+wq0bVblZImVlzICl/mwhPICaA9sahz2uU7Y1wCMe3DTJyCO1o5azRyRxSh4VMr
 HI=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gu2lZLnI8jU=:Ie69W/Pjr+oTilmfczPc4m
 p/V8LavGnXe+l0Ds0cAv8eDfSzANEy+4x3ymbDQ/+TO0kFU4w2s/VOr1bDfsfYTIzlvNqMI3q
 6rC+LOZK8UD+aTLd8osc1+FMu/Mdae44Ve68KmJOloUMPvtDH6HZAMue3OOk21A5bMwMR2OID
 pYrDNgleYthrSxF9WlUDUy+QxAA7UHDHHNPDDj89MGC0IHX+0ZsGaPfPEQY8Uv4BshanTlBrw
 UDoclEViLZj3uacXI00eBStbPwmZDTAs74VmzrT7/eQ3Loqre8oKptKRFWqIzVNXBMlD5mLUN
 HOWCrQ1t+a5uzHTz5ck322izOjJ8wCmd6uyr8yJkf3Y61pD8LZjaAWGAwTBg9UWB0wzOm7++P
 UCqZvy5f/W7/jVYyZJhYaXifq4HDygJDnZvoA2+LjCEojfvIxDsRvcm/nD2DsgkYeeOiuk6OF
 dZF/oXGprumblWNvMn9oWkKe+PPgzEUNSa3s/B3jTZSYkbE694PmoiXXhC8Rs4XVCjfz3aase
 S87HX/vqY1MkDT9eUhAUSEFvT4Crn2MVg3FHK9TsXkIM90IYqASjd2hZa7fIb1xTtTJ2I8UEV
 NaMgWdwKA3+lE=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmlsbGUsCgpJIHdhcyBhYmxlIHRvIGZpbmQgYSBzYXRpc2ZhY3Rvcnkgd29ya2Fyb3VuZC4K
V2hhdCBJIHdhcyB0cnlpbmcgdG8gZG8gaXMgdG8gZ2V0IGEgcG9pbnRlciB0byAic3RydWN0IGRy
bV9kZXZpY2UiIHZpYSBjcnRjIHBvaW50ZXIuCkkgc3dpdGNoZWQgdG8gZ2V0dGluZyBpdCBmcm9t
ICJzdHJ1Y3QgZHJtX3BsYW5lIi4KT24gYSBzZXBhcmF0ZSBub3RlLCBJIHdpbGwgbG9vayBpbnRv
IHVzaW5nIGRybV9hdG9taWNfZ2V0X25ld19wbGFuZV9zdGF0ZSgpIGFuZCBkcm1fYXRvbWljX2dl
dF9vbGRfcGxhbmVfc3RhdGUoKSBpbiBteSBjb2RlIHNvb24uCgpSZWdhcmRzLAoKS2V2aW4gQnJh
Y2UKQnJhY2UgQ29tcHV0ZXIgTGFib3J0b3J5IGJsb2cKaHR0cHM6Ly9icmFjZWNvbXB1dGVybGFi
LmNvbQoKCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciAwOSwgMjAyMCBhdCA5OjI2IEFNCj4gRnJv
bTogIlZpbGxlIFN5cmrDpGzDpCIgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IFRv
OiAiS2V2aW4gQnJhY2UiIDxrZXZpbmJyYWNlQGdteC5jb20+Cj4gQ2M6ICJkcmktZGV2ZWwiIDxk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPgo+IFN1YmplY3Q6IFJlOiBXaHkgaXMgYXRv
bWljX2Rpc2FibGUgY2FsbGJhY2sncyBwbGFuZS0+c3RhdGUtPmNydGMgc29tZXRpbWVzIG51bGw/
Cj4KPiBPbiBUdWUsIE5vdiAwMywgMjAyMCBhdCAxMjo1MDo0M0FNICswMTAwLCBLZXZpbiBCcmFj
ZSB3cm90ZToKPiA+IEhpLAo+ID4gCj4gPiBGaXJzdCwgSSB3aWxsIGxpa2UgdG8gdGhhbmsgdGhv
c2Ugd2hvIGdhdmUgbWUgaGludHMgb24gaG93IHRvIHByb2NlZWQgd2l0aCBnZXR0aW5nIHJpZCBv
ZiBhbiB1bndhbnRlZCBkb3VibGUgYWxsb2NhdGlvbiBvZiB2aXNpYmxlIHBvcnRpb24gb2YgdGhl
IGZyYW1lIGJ1ZmZlci4KPiA+IAo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJj
aGl2ZXMvZHJpLWRldmVsLzIwMjAtT2N0b2Jlci8yODM0NTIuaHRtbAo+ID4gCj4gPiBJIG1heSBy
ZXBvc3QgdGhlIHF1ZXN0aW9uIGxhdGVyIHRvIHRoZSBtYWlsaW5nIGxpc3QgYmFzZWQgb24gdGhl
IGZlZWRiYWNrIEkgcmVjZWl2ZWQuCj4gPiAgICAgQWZ0ZXIgYSBmZXcgbW9yZSBkYXlzIG9mIHRy
eWluZywgSSBmaW5hbGx5IGdvdCBteSBwcm90b3R5cGUgT3BlbkNocm9tZSBEUk0gYXRvbWljIG1v
ZGVzZXR0aW5nIGNvZGUgYmFyZWx5IHdvcmtpbmcgZm9yIGJvdGggcHJpbWFyeSBhbmQgY3Vyc29y
IHBsYW5lcyAoY3Vyc29yIHBsYW5lIHdhcyBub3Qgd29ya2luZyBwcmV2aW91c2x5KS4KPiA+IEkg
ZmluYWxseSBmaWd1cmVkIG91dCB3aGF0IHdhcyBjYXVzaW5nIHRoZSBmcmVlemUsIGFuZCBpbiBm
YWN0LCBJIGFtIHdyaXRpbmcgdGhpcyBlLW1haWwgZnJvbSB0aGUgdmVyeSBjb21wdXRlciB0aGF0
IGhhcyB0aGUgZXhwZXJpbWVudGFsIGNvZGUgcnVubmluZy4KPiA+IFRoZSBjb2RlIGl0c2VsZiBp
cyBzdGlsbCBxdWl0ZSB1bnN0YWJsZSB0aGF0IHN0YW5kYnkgcmVzdW1lIGlzIG5vdCB3b3JraW5n
IGFuZCBWVCAoVmlydHVhbCBUZXJtaW5hbCkgaXMgYnJva2VuLCBidXQgWCBTZXJ2ZXIgaXMgd29y
a2luZyBmaW5lIGp1c3Qgd2l0aCBhIGZldyBtaW5vciB3ZWlyZCBhcnRpZmFjdCBsaW5lcyBvbiB0
aGUgcmlnaHQgYW5kIGJvdHRvbSBlZGdlcyBvZiB0aGUgc2NyZWVuLgo+ID4gQW55d2F5LCB0aGUg
cXVlc3Rpb24gSSBoYXZlIGhlcmUgKGFuZCBJIGFtIGFzc3VtaW5nIHRoYXQgRGFuaWVsIFZldHRl
ciB3aWxsIGdpdmUgbWUgYW4gZXhwbGFuYXRpb24pIGlzIHRoYXQgSSBub3RpY2VkIHRoYXQgZm9y
IGN1cnNvciBwbGFuZSdzIGF0b21pY19kaXNhYmxlIGNhbGxiYWNrLCBwbGFuZS0+c3RhdGUtPmNy
dGMgaXMgbnVsbCBvciBzb21ldGltZXMgbnVsbC4KPiA+IFdoeSBpcyB0aGlzPwo+IAo+IEl0IGNh
biBiZSBOVUxMIGlmIHRoZSB1c2VyIHNldCBpdCB0byBOVUxMLiBUaGF0J3MgaG93IHlvdSBkaXNh
YmxlCj4gYSBwbGFuZTogY3J0Yz1OVUxMICsgZmI9TlVMTC4KPiAKPiBBbHNvIHlvdSBzaG91bGRu
J3QgcmVhbGx5IHVzZSBwbGFuZS0+c3RhdGUgZGlyZWN0bHkgYW55bW9yZS4KPiBJbnN0ZWFkIHlv
dSBzaG91bGQgcmF0aGVyIHVzZSBmb3JfZWFjaF97bmV3LG9sZCxvbGRuZXd9X3BsYW5lX2luX3N0
YXRlKCkKPiBhbmQvb3IgZHJtX2F0b21pY19nZXRfe25ldyxvbGR9X3BsYW5lX3N0YXRlKCkuCj4g
Cj4gLS0gCj4gVmlsbGUgU3lyasOkbMOkCj4gSW50ZWwKPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
