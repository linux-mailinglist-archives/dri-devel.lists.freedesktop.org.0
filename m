Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9390F24DBD
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 13:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4EC891EB;
	Tue, 21 May 2019 11:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0316891EB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 11:15:29 +0000 (UTC)
Date: Tue, 21 May 2019 11:15:26 +0000
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/doc: More fine-tuning on userspace review requirements
Message-ID: <VBdHSgQOdRb7pbZ1O2ZvojW6YH-9aVPTWvu6FDxfh-MDJfZ4-cfXkP0cMZl5byMv4e6tECsdV1hi7cDIIa_ity0b1gbF32Q6e3jYLBCIAZo=@emersion.fr>
In-Reply-To: <20190521084849.27452-1-daniel.vetter@ffwll.ch>
References: <20190521084849.27452-1-daniel.vetter@ffwll.ch>
Feedback-ID: FsVprHBOgyvh0T8bxcZ0CmvJCosWkwVUg658e_lOUQMnA9qynD8O1lGeniuBDfPSkDAUuhiKfOIXUZBfarMyvA==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=emersion.fr; s=protonmail; t=1558437327;
 bh=uV42verKjAdnJQNBexYdhxBUviB4IrGGe6dcKi8fj5Y=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=VfkALMu4Q1+cJepNMrx1SR+A1E65ux7SFm4ypEQIBX9PtBOe0ehhIKRRafihR5XWN
 uLJ5nHddk30ewdAtu42MHajrKS4h5ho06Yo7NlvKs8oYEWWsFj+Iz/X3XLFnIGF+/k
 I5KBQw/TFG+Xg0H7liIEn345BC07cuncVuhH+u90=
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgTWF5IDIxLCAyMDE5IDExOjQ4IEFNLCBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPiB3cm90ZToKPiBXaXRoIEVyaWMncyBwYXRjaAo+Cj4gY29tbWl0IGJh
NmU3OThlY2YzMjA3MTY3ODBiYjZhNjA4OGE4ZDE3ZGNiYTFkNDkKPiBBdXRob3I6IEVyaWMgQW5o
b2x0IDxlcmljQGFuaG9sdC5uZXQ+Cj4gRGF0ZTogICBXZWQgQXByIDI0IDExOjU2OjE3IDIwMTkg
LTA3MDAKPgo+ICAgICBkcm0vZG9jOiBEb2N1bWVudCBleHBlY3RhdGlvbiB0aGF0IHVzZXJzcGFj
ZSByZXZpZXcgbG9va3MgYXQga2VybmVsIHVBUEkuCj4KPiB0aGVyZSdzIGJlZW4gY29uY2VybnMg
cmFpc2VkIHRoYXQgd2UgZXhwZWN0IHVzZXJzcGFjZSBwZW9wbGUgdG8gZG8KPiBpbi1kZXB0aCBr
ZXJuZWwgcGF0Y2ggcmV2aWV3LiBUaGF0J3Mgbm90IHJlYXNvbmFibGUsIHNhbWUgd2F5IGtlcm5l
bAo+IHBlb3BsZSBjYW4ndCByZXZpZXcgYWxsIHRoZSB1c2Vyc3BhY2Ugd2UgaGF2ZS4gVHJ5IHRv
IGNsYXJpZnkKPiBleHBlY3RhdGlvbnMgYSBiaXQgbW9yZS4KPgo+IENjOiBFcmljIEFuaG9sdCA8
ZXJpY0BhbmhvbHQubmV0Pgo+IENjOiBQZWtrYSBQYWFsYW5lbiA8cHBhYWxhbmVuQGdtYWlsLmNv
bT4KPiBDYzogY29udGFjdEBlbWVyc2lvbi5mcgo+IENjOiB3YXlsYW5kLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAaW50ZWwuY29tPgoKVGhpcyBMR1RNLCB0aGFua3MgZm9yIHRoZSBwYXRjaCEgT25lIHRpbnkg
bml0IGJlbG93LCBidXQgcmVnYXJkbGVzcyBvZgp3aGV0aGVyIGl0J3MgY2hhbmdlZCBvciBub3Q6
CgpSZXZpZXdlZC1ieTogU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPgoKPiAtLS0KPiAg
RG9jdW1lbnRhdGlvbi9ncHUvZHJtLXVhcGkucnN0IHwgNiArKystLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2dwdS9kcm0tdWFwaS5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS9kcm0tdWFwaS5y
c3QKPiBpbmRleCAwNTg3NGQwOTgyMGMuLmYzNjhlNThmYjcyNyAxMDA2NDQKPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2dwdS9kcm0tdWFwaS5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL2dwdS9kcm0t
dWFwaS5yc3QKPiBAQCAtODUsOSArODUsOSBAQCBsZWFkcyB0byBhIGZldyBhZGRpdGlvbmFsIHJl
cXVpcmVtZW50czoKPiAgLSBUaGUgdXNlcnNwYWNlIHNpZGUgbXVzdCBiZSBmdWxseSByZXZpZXdl
ZCBhbmQgdGVzdGVkIHRvIHRoZSBzdGFuZGFyZHMgb2YgdGhhdAo+ICAgIHVzZXJzcGFjZSBwcm9q
ZWN0LiBGb3IgZS5nLiBtZXNhIHRoaXMgbWVhbnMgcGlnbGl0IHRlc3RjYXNlcyBhbmQgcmV2aWV3
IG9uIHRoZQo+ICAgIG1haWxpbmcgbGlzdC4gVGhpcyBpcyBhZ2FpbiB0byBlbnN1cmUgdGhhdCB0
aGUgbmV3IGludGVyZmFjZSBhY3R1YWxseSBnZXRzIHRoZQo+IC0gIGpvYiBkb25lLiAgVGhlIHVz
ZXJzcGFjZS1zaWRlIHJldmlld2VyIHNob3VsZCBhbHNvIHByb3ZpZGUgYXQgbGVhc3QgYW4KPiAt
ICBBY2tlZC1ieSBvbiB0aGUga2VybmVsIHVBUEkgcGF0Y2ggaW5kaWNhdGluZyB0aGF0IHRoZXkn
dmUgbG9va2VkIGF0IGhvdyB0aGUKPiAtICBrZXJuZWwgc2lkZSBpcyBpbXBsZW1lbnRpbmcgdGhl
IG5ldyBmZWF0dXJlIGJlaW5nIHVzZWQuCj4gKyAgam9iIGRvbmUuICBUaGUgdXNlcnNwYWNlLXNp
ZGUgcmV2aWV3ZXIgc2hvdWxkIGFsc28gcHJvdmlkZSBhbiBBY2tlZC1ieSBvbiB0aGUKPiArICBr
ZXJuZWwgdUFQSSBwYXRjaCBpbmRpY2F0aW5nIHRoYXQgdGhleSBiZWxpZXZlIHRoZSBwcm9wb3Nl
ZCB1QVBJIGlzIHNvdW5kIGFuZAo+ICsgIHN1ZmZpY2llbnRseSBkb2N1bWVudGVkIGFuZCB2YWxp
ZGF0ZWQgZm9yIHVzZXJzcGFjZSdzIGNvbnN1bXB0aW9uLgoKTml0OiAiYW5kIiBpcyByZXBlYXRl
ZCB0d2ljZSAobWF5YmUgdGhhdCdzIGludGVudGlvbmFsPykKCj4gIC0gVGhlIHVzZXJzcGFjZSBw
YXRjaGVzIG11c3QgYmUgYWdhaW5zdCB0aGUgY2Fub25pY2FsIHVwc3RyZWFtLCBub3Qgc29tZSB2
ZW5kb3IKPiAgICBmb3JrLiBUaGlzIGlzIHRvIG1ha2Ugc3VyZSB0aGF0IG5vIG9uZSBjaGVhdHMg
b24gdGhlIHJldmlldyBhbmQgdGVzdGluZwo+IC0tCj4gMi4yMC4xCj4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
