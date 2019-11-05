Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5430F0268
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 17:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4D56E0E7;
	Tue,  5 Nov 2019 16:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025C56E0E7
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 16:14:32 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id i185so18015966oif.9
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2019 08:14:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ds6VYusfCqeI+CxBbQC5l0BjKnCAgOPSpeG/INpDB7s=;
 b=TrT/+g3BBYmVatK8r7sxYlixgaZQc+Zx/FX7Gs/ZViEzOP1qe83Bu2MXvcG5SroG8o
 Ek/Edki0tepyUQ22oIv8FYEjBXBLBSdl2sG5GU5i8hb7G25DTsLs0/c7ikeyqb/N3ZOi
 Q39nPitVXm112Gay3bNCMRWPso/r1lNDqbi4CJ2eYT7HgfGYGdlEEXQ1ipR+WW2DgUvG
 RysBY4pXHDEA0txDHrtX5ATlPSQMN9OceJkeFcxKVlEUVPO2EcDbdHEVU3H+80JQSr1T
 vEA3BShm9kQ+OtCU6lRgI2iUy1x0t0HgKFyMqFWtH5qdUlyeH+srSD4DZQPKAuvTehjg
 oAkw==
X-Gm-Message-State: APjAAAWFUUAHOTP1D5vQUiOP9in2q6PCMNPGZANUm6bdpOsmP/q18/ps
 gNeq3h+vK//k8goXmymDCEVpKZ9OLPR9QFizJ1Mmdw==
X-Google-Smtp-Source: APXvYqweOH2gctOiMkOfsylw9IuOXcy7+Rtobt+PETLBgPWqINBQvTUx4ZjcibUTN+3TaAgCY5UmWMrEgoOR73cwrbA=
X-Received: by 2002:aca:fc92:: with SMTP id a140mr4437471oii.153.1572970472082; 
 Tue, 05 Nov 2019 08:14:32 -0800 (PST)
MIME-Version: 1.0
References: <20191016085548.105703-1-jacopo+renesas@jmondi.org>
 <20191017191400.GH4901@pendragon.ideasonboard.com>
In-Reply-To: <20191017191400.GH4901@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Nov 2019 17:14:20 +0100
Message-ID: <CAMuHMdWTCF30+JpztF-p-5JqHS5ALiAs5E0Jo82DCgpu99NZ7w@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] drm: rcar-du: Add Color Management Module (CMM)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCk9uIFRodSwgT2N0IDE3LCAyMDE5IGF0IDk6MTQgUE0gTGF1cmVudCBQaW5j
aGFydAo8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPiB3cm90ZToKPiBPbiBXZWQs
IE9jdCAxNiwgMjAxOSBhdCAxMDo1NTo0MEFNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4g
PiBNaW5pbWFsIGluY3JlbWVudCB0byB0aGUgQ01NIHNlcmllcywgdGhpcyB0aW1lIHNob3VsZCBy
ZWFsbHkgYmUgdGhlIGxhc3Qgb25lLgo+ID4KPiA+IEp1c3QgbWlzc2luZyBSb2IncyBhY2sgb24g
WzEvOF0gYW5kIExhdXJlbnQncyBvbmUgb24gWzUvOF0uCj4gPgo+ID4gQ2hhbmdlbG9nIGlzIG1p
bmltYWw6Cj4gPiBDTU0KPiA+IC0gUmVtb3ZlIHRoZSBjbW1fY29uZmlnLmVuYWJsZSBmbGFnLiBU
aGUgY21tX2NvbmZpZy50YWJsZSBmaWVsZCB2YWxpZGl0eSBpcwo+ID4gICB1c2VkIHRvIGVuYWJs
ZS9kaXNhYmxlIHRoZSBMVVQgb3BlcmF0aW9ucwo+ID4gLSBFeHBhbmQgY29tbWVudHMgYXMgc3Vn
Z2VzdGVkIGJ5IExhdXJlbnQKPiA+Cj4gPiBDUlRDCj4gPiAtIHVzZSBkcm1fY29sb3JfbHV0X3Np
emUoKSB0byBjaGVjayB0aGUgTFVUIHRhYmxlIHNpemUKPiA+IC0gSW5saW5lIGNhbGxzIHRvIHJj
YXJfY21tX2VuYWJsZSgpL2Rpc2FibGUoKQo+ID4gLSBBZGQgVE9ETyBlbnRyaWVzIGFzIHN1Z2dl
c3RlZCBieSBMYXVyZW50Cj4gPgo+ID4gRm9yIHRoZSByZWNvcmQsIHRoZSBmdWxsIHNlcmllcyBj
aGFuZ2Vsb2cgaXMgYXZhaWxhYmxlIGF0Ogo+ID4gaHR0cHM6Ly9wYXN0ZS5kZWJpYW4ubmV0LzEx
MDc0MjcvCj4gPgo+ID4gdjUgZnJvbSB5ZXN0ZXJkYXkgd2l0aCBpbmZvcm1hdGlvbnMgb24gdGVz
dGluZyBpcyBhdmFpbGFibGUgYXQ6Cj4gPiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS8xMC8x
NS8zMzcKPiA+Cj4gPiBHZWVydCB3aWxsIHlvdSBjb2xsZWN0IGZvciBEVFMgcGF0Y2hlcyBmb3Ig
dGhlIG5leHQgcmVsZWFzZT8KPiA+IEkgYXNzdW1lIHRoZSBEVSBjaGFuZ2VzIGdvIHRocm91Z2gg
TGF1cmVudCBpbnN0ZWFkID8KPgo+IEkndmUgdGFrZW4gcGF0Y2ggMS84IHRvIDYvOCBhbmQgOC84
IGluIG15IHRyZWUuIEkgZXhwZWN0ZWQgR2VlcnQgdG8gdGFrZQo+IDcvOC4KCkFuZCBzbyBJIGRp
ZC4gNy84IGlzIG5vdyBpbiBhcm0tc29jL2Zvci1uZXh0LgoKSG93ZXZlciwgeW91ciBkcm0vZHUv
bmV4dCBicmFuY2ggc2VlbXMgdG8gY29udGFpbiA3LzggaW5zdGVhZCBvZiA4Lzg/CgpHcntvZXRq
ZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgoKLS0KR2VlcnQgVXl0
dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBs
aW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBw
ZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpv
dXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQu
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
