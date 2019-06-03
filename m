Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA6833103
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 15:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D01C891A4;
	Mon,  3 Jun 2019 13:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A9C891A4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 13:27:49 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id m8so2119902vsj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 06:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bg4KfDcsq7ytpo7oEO0tVHhVhzbO1loJoTA9Ui9BYbk=;
 b=moe5ZLqB+PB5NjOxPxPUYpA9oWN7yMnBmuq3+PMlVRFAbl9/dxS+tI31V+GiQATc34
 U6kOcBFFHzTlzwaOw5ISdM4NYAg88kHd824aLdJmMNqSph6f1om2wbMyeLrEkZnVNr5x
 aCKpK/tDMUB696NfJA8GQHMbTupN7L+WlzP2xG61pvclC0dm6gKcoRI7W4VbOCn58gEX
 gfJqixoouaDUDyHlaa2NSfCS6CfP/M/7KXh7AhNs8Kq39xfVd9Bv7KGLyRSV1Bbbr68y
 Z7u5nUfifwrBM73BfkNkOZC/6h7mpVwsMITKeibLUIEtCBTRiO3hBaSmFHatqkJchJC6
 VdHg==
X-Gm-Message-State: APjAAAVTRpQiulR6IxS3DP6rlYKF9VYRDFRZWY57pX41a0XMG2qgCZRz
 LjFGg5A9JeZQOKp5sLx2XXBlVZbOR9Nxbf9i+6c=
X-Google-Smtp-Source: APXvYqxlgotBFCwZ5ISiu5deOoEBKTmV3dl7lofoLcBpKroBgJy+dbSBzgH8ph9zDPNXdkrodty8i198X08XE6Gbrno=
X-Received: by 2002:a67:df8a:: with SMTP id x10mr3820566vsk.220.1559568469046; 
 Mon, 03 Jun 2019 06:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190603004017.7114-1-imirkin@alum.mit.edu>
 <20190603073242.GD21222@phenom.ffwll.local>
In-Reply-To: <20190603073242.GD21222@phenom.ffwll.local>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 3 Jun 2019 09:27:37 -0400
Message-ID: <CAKb7UvhkisWMfa4mqjpPf5hAN16PTMFY2LMhZE33FmHS3=jmbg@mail.gmail.com>
Subject: Re: [PATCH libdrm 00/10] Add C8, 30bpp and FP16 support to modetest
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMywgMjAxOSBhdCAzOjMyIEFNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4gd3JvdGU6Cj4KPiBPbiBTdW4sIEp1biAwMiwgMjAxOSBhdCAwODo0MDowOFBNIC0wNDAw
LCBJbGlhIE1pcmtpbiB3cm90ZToKPiA+IFRoaXMgc2VyaWVzIGltcHJvdmVzIHRoZSBwYXR0ZXJu
IGdlbmVyYXRpb24gbG9naWMgdG8gc3VwcG9ydCBhZGRpdGlvbmFsCj4gPiBmb3JtYXRzLCBhcyB3
ZWxsIGFzIGEgbmV3ICJncmFkaWVudCIgcGF0dGVybiAoc2VlIHBhdGNoIGNvbW1lbnRzIG9uIHdo
eQo+ID4gSSBmb3VuZCBpdCB1c2VmdWwpLgo+ID4KPiA+IEZ1cnRoZXJtb3JlLCB0aGVzZSBmb3Jt
YXRzIGFyZSBwaXBlZCB0aHJvdWdoIHRvIG1vZGV0ZXN0LCBpbmNsdWRpbmcgdGhlCj4gPiBhYmls
aXR5IHRvIHNldCBhIGdhbW1hIHRhYmxlLCB3aGljaCBpcyBuZWNlc3NhcnkgZm9yIHRoZSBDOCBp
bmRleGVkCj4gPiBmb3JtYXQuCj4gPgo+ID4gVGhpcyB3YXMgdGVzdGVkIG9uIG5vdXZlYXUsIGFu
ZCB1c2VkIGZvciBicmluZy11cCBvZiB0aGUgQzgsIFhCMzAsIGFuZAo+ID4gRlAxNiBmb3JtYXRz
IG9uIHRoZSBOVklESUEgaGFyZHdhcmUgdGhhdCBzdXBwb3J0cyB0aGVzZS4KPgo+IERvZXMgbm91
dmVhdSBhbHNvIHdvcmsgd2l0aCBpZ3QgdGVzdHMgZm9yIHRoaXMgc3R1ZmY/IFdlIGRvIGhhdmUg
c3VwcG9ydAo+IGZvciBpbnRlcmFjdGl2ZSB0ZXN0aW5nIChpLmUuICJodW1hbiBwbHMgY2hlY2sg
eW91cnNlbGYiIGtpbmQgb2YgdGVzdHMpIGluCj4gaWd0LCBzbyBpZGVhbGx5IHdlIGNvdWxkIG1l
cmdlIGV2ZXJ5dGhpbmcgaW50byBvbmUgcGxhY2UuIExvbmctdGVybSBhdAo+IGxlYXN0IC4uLgoK
bm91dmVhdSBoYXMgbm8gc3BlY2lhbCBleGNsdXNpb25zIGZvciBwcm9ncmFtcyB0aGF0IHN0YXJ0
IHdpdGggdGhlCmxldHRlcnMgImlndCIsIHNvIHByZXN1bWFibHkgaXQgc2hvdWxkIGJlIE9LIHdp
dGggdGhlIGJhc2ljIHRlc3RzLgpIb3dldmVyIGl0IHdhcyBteSBpbXByZXNzaW9uIHRoYXQgaWd0
IHdhcyB0YXJnZXRlZCBhdCBhdXRvbWF0ZWQKdGVzdGluZywgYW5kIGFsbCB0aGUgdGVzdHMgYmFz
aWNhbGx5IHJlcXVpcmVkIGNyYywgd2hpY2ggaXMKcXVlc3Rpb25hYmxlIHdoZXRoZXIgaXQgZXhp
c3RzIGluIHRoZSBodyBpbiBhIG1hbm5lciB1c2FibGUgYnkgc3VjaAp0ZXN0cywgYW5kIGRlZmlu
aXRlbHkgbm90IHN1cHBvcnRlZCBieSBub3V2ZWF1IGluIGFueSBjYXNlLiBBcyBhCnJlc3VsdCwg
SSBoYXZlbid0IHJlYWxseSB0YWtlbiBtdWNoIG9mIGEgbG9vay4KCkhhdmluZyBzb21ldGhpbmcg
ZmxleGlibGUgbGlrZSBtb2RldGVzdCBoYXMgYmVlbiByZWFsbHkgdXNlZnVsIGluCmRldmVsb3Bt
ZW50LiBCZWluZyBhYmxlIHRvIHJ1biB3aXRoIGRpZmZlcmVudCBmb3JtYXRzLCBtZXNzaW5nIHdp
dGgKcmVzb2x1dGlvbnMsIHNjYWxpbmcgcGFyYW1ldGVycyBmb3Igb3ZlcmxheXMsIGRpZmZlcmVu
dCBwYXR0ZXJucyAtLQp0aGVzZSB0aGluZ3MgaGF2ZSBhbGwgYmVlbiBoZWxwZnVsIGluIHZhbGlk
YXRpbmcgdGhhdCB0aGUgbmV3IGZlYXR1cmVzCmltcGxlbWVudGVkIGFjdHVhbGx5IHdvcmsgYXMg
ZXhwZWN0ZWQuIEkgcGxhbiBvbiBleHRlbmRpbmcgaXQgZnVydGhlcgp0byBjb3ZlciBIRFIsIGFz
IHBhcnQgb2YgbXkgYnJpbmd1cCBvZiBIRFIgb24gbm91dmVhdS4KCkFzIGFuIGV4YW1wbGUsIHBy
ZS1HRjExOSBGUDE2IHN1cHBvcnQgZXhwZWN0cyBhIDAuLjEwMjQtdmFsdWVkIGlucHV0Cmluc3Rl
YWQgb2YgMC4uMSAoc29tZXRoaW5nIHdoaWNoIHdlIGRpZCBub3QgcHJldmlvdXNseSBrbm93KS4g
SSB3YXMKYWJsZSB0byBndWVzcyB0aGF0IGJ5IGNoYW5naW5nIHRoZSBwYXR0ZXJuIGluIHRoZSBj
b2RlIHRvIGdlbmVyYXRlCmxhcmdlciBudW1iZXJzLCBhZnRlciBzZWVpbmcgYSBibGFjayBkaXNw
bGF5IHdpdGggdGhlIDAuLjEgcGF0dGVybi4gKEkKbWF5IGhhdmUgYWxzbyBtZXNzZWQgd2l0aCB0
aGUgZ2FtbWEgcmFtcCB0byBzZWUgaWYgaXQgd2FzICJ3b3JraW5nIiBvcgpub3QgLSBJIGZvcmdl
dCBhbHJlYWR5LikgSGF2aW5nIGEgdG9vbCB0aGF0IG1ha2VzIHRoaW5ncyBsaWtlIHRoYXQKc2lt
cGxlIHRvIGludmVzdGlnYXRlIGlzIHByZXR0eSB2YWx1YWJsZSB0byBtZS4KCiAgLWlsaWEKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
