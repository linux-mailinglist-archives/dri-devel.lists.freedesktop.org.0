Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABDA1CFD52
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 20:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401B76E969;
	Tue, 12 May 2020 18:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534356E968;
 Tue, 12 May 2020 18:32:14 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id y24so24825471wma.4;
 Tue, 12 May 2020 11:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sOuNa/PVOjE84zfu/Cex34/rDw0AbxG3fNBvr58PBO4=;
 b=pf39AzjrnaeYwqypYL7lTbJTb1+EE0GMq8jvwsVuyf7Bs79w7Jnt67NTsosACHxqz4
 tjV80nHZYgRfAZoXstpAQfvYFDBqnMFvKqh4WPXHgu4g06bzg5eR+2TaG6Fln7+ZyFy6
 TJ/RxWVNfWZ9gGAv/ihOcVC+ed0bV1RgxCZAhKqKjOxW+OswOySe7WQAfa5QtJJhoOTg
 XY74T0JwQcH5CBmUSN/C0+/8e8Mm2vdrNP3L8sseBCOe2SQqC9/rjS84jLNW7eLSm+u0
 +uCHq7fKh7lL5EgdObUk3dt8T9CVmwmo70MM5vyipL0oe43VWGbcA98EDQxTb3RQI9Os
 2taQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sOuNa/PVOjE84zfu/Cex34/rDw0AbxG3fNBvr58PBO4=;
 b=OHN6zXon1uSIpCAzr1uLdG7kp3mZ52Yn5tUBZs9DjYPbb0LMSg/uXxxe8gdkWiBwpD
 zTWzBl1d/anZgOiiPzXvkOcLAh8uTYkjJ3cOo2G1klOm1hao6E4QjhhkqMjFTaahtfJ2
 2wzXV1dE3pyQhTOXbO+xXyVW+7dNbsKeoBFmSaOLhe4uPuM/6vYbXPdU5Zjue64Ty1Ja
 kW2gdX94U9SyhQuhot0W0smcU7tTitin8CBMsgWeiiRnmj4oRm3E7Zc7INhK/t571ZHX
 0HP767NNJqJ+ct8qDIzIj/G3dhEFlK9hqGzxNwSKDnQkmy2xMPIC7CoOtlBJQee5kXWG
 ocwA==
X-Gm-Message-State: AGi0PuYNy2RrQUisksKLomVcTqnZWbLVuHkKVOiAR9hEq/LntX3Yebfn
 lDlhY40wZMIdEpeyC6k+LgSh/2jPatDAbRmGOjObqg==
X-Google-Smtp-Source: APiQypJZwlso4MmQ8wF6sQLABXDq3gq9wey8f7ez/AgHGdBWvkTbdlNMnUPeSl0QZY170jrXXU/ngN841tPfBIiHR3s=
X-Received: by 2002:a7b:cc0e:: with SMTP id f14mr38808642wmh.39.1589308332995; 
 Tue, 12 May 2020 11:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200511171722.96576-1-christian.koenig@amd.com>
 <1f7b3774-8724-7653-3481-9429ae991acc@suse.de>
In-Reply-To: <1f7b3774-8724-7653-3481-9429ae991acc@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 May 2020 14:32:01 -0400
Message-ID: <CADnq5_OnoH3YhhEjD7eOrBPPqxQZ+S1cKWRBaUMVnA0V=E0i+Q@mail.gmail.com>
Subject: Re: [Nouveau] [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTIsIDIwMjAgYXQgMjoyOSBQTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBIaQo+Cj4gQW0gMTEuMDUuMjAgdW0gMTk6MTcgc2No
cmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+ID4gSGkgZ3V5cywKPiA+Cj4gPiBXZWxsIGxldCdzIGZh
Y2UgaXQgQUdQIGlzIGEgdG90YWwgaGVhZGFjaGUgdG8gbWFpbnRhaW4gYW5kIGRlYWQgZm9yIGF0
IGxlYXN0IDEwKyB5ZWFycy4KPiA+Cj4gPiBXZSBoYXZlIGEgbG90IG9mIHg4NiBzcGVjaWZpYyBz
dHVmZiBpbiB0aGUgYXJjaGl0ZWN0dXJlIGluZGVwZW5kZW50IGdyYXBoaWNzIG1lbW9yeSBtYW5h
Z2VtZW50IHRvIGdldCB0aGUgY2FjaGluZyByaWdodCwgYWJ1c2luZyB0aGUgRE1BIEFQSSBvbiBt
dWx0aXBsZSBvY2Nhc2lvbnMsIG5lZWQgdG8gZGlzdGluY3QgYmV0d2VlbiBBR1AgYW5kIGRyaXZl
ciBzcGVjaWZpYyBwYWdlIHRhYmxlcyBldGMgZXRjLi4uCj4gPgo+ID4gU28gdGhlIGlkZWEgaGVy
ZSBpcyB0byBqdXN0IGdvIGFoZWFkIGFuZCByZW1vdmUgdGhlIHN1cHBvcnQgZnJvbSBSYWRlb24g
YW5kIE5vdXZlYXUgYW5kIHRoZW4gZHJvcCB0aGUgbmVjZXNzYXJ5IGNvZGUgZnJvbSBUVE0uCj4g
Pgo+ID4gRm9yIFJhZGVvbiB0aGlzIG1lYW5zIHRoYXQgd2UganVzdCBzd2l0Y2ggb3ZlciB0byB0
aGUgZHJpdmVyIHNwZWNpZmljIHBhZ2UgdGFibGVzIGFuZCBldmVyeXRoaW5nIHNob3VsZCBtb3Jl
IG9yIGxlc3MgY29udGludWUgdG8gd29yay4KPiA+Cj4gPiBGb3IgTm91dmVhdSBJJ20gbm90IDEw
MCUgc3VyZSwgYnV0IGZyb20gdGhlIGNvZGUgaXQgb2YgaGFuZCBsb29rcyBsaWtlIHdlIGNhbiBk
byBpdCBzaW1pbGFyIHRvIFJhZGVvbi4KPiA+Cj4gPiBQbGVhc2UgY29tbWVudCB3aGF0IHlvdSB0
aGluayBhYm91dCB0aGlzLgo+Cj4gVGhlcmUncyBzb21lIEFHUCBzdXBwb3J0IGNvZGUgaW4gdGhl
IERSTSBjb3JlLiBDYW4gc29tZSBvZiB0aGF0IGRlY2xhcmVkCj4gYXMgbGVnYWN5Pwo+Cj4gU3Bl
Y2lmaWNhbGx5LCB3aGF0IGFib3V0IHRoZXNlIEFHUC1yZWxhdGVkIGlvY3RsIGNhbGxzPyBDYW4g
dGhleSBiZQo+IGRlY2xhcmVkIGFzIGxlZ2FjeT8gSXQgd291bGQgYXBwZWFyIHRvIG1lIHRoYXQg
S01TLWJhc2VkIGRyaXZlcnMgZG9uJ3QKPiBoYXZlIHRvIG1hbmFnZSBBR1AgYnkgdGhlbXNlbHZl
cy4gKD8pCgpUaGUgb2xkIGRybSBjb3JlIEFHUCBjb2RlIGlzIG1haW5seSAob25seT8pIGZvciB0
aGUgbm9uLUtNUyBkcml2ZXJzLgpFLmcuLCBtYWNoNjQsIHIxMjgsIHNpcywgc2F2YWdlLCBldGMu
CgpBbGV4Cgo+Cj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4KPiA+Cj4gPiBSZWdhcmRzLAo+ID4g
Q2hyaXN0aWFuLgo+ID4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+ID4gTm91dmVhdSBtYWlsaW5nIGxpc3QKPiA+IE5vdXZlYXVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL25vdXZlYXUKPiA+Cj4KPiAtLQo+IFRob21hcyBaaW1tZXJtYW5uCj4gR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcgo+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SAo+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQo+IChIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykKPiBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1n
ZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
