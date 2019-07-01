Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D83F45C4B2
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 22:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D1989D5C;
	Mon,  1 Jul 2019 20:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEE389C03
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 14:38:52 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id x17so14135396wrl.9
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2019 07:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=KOo32uLhooDfd7wd1XNFbgy3T5iU1PJ9JGNEUBH3WAY=;
 b=h3t1AKDMg0TB0l1kbjRXzQ8Gtt2xsOSwXPxLTpjFXePjnc0k3/3kc4X14MyPkTzhS3
 LqZCPgIxkgqaRDz7SZJ+mBCjM9h8Tb9tDJQdvG319CWGz4jV5uzpDjrHE3eTr5nyvmXd
 zF5h8SY6Qsqt/Xk+hdsv1gW9WzyIloNylD0jYToJTpxh+Ec5YcOZEPDKm/UevTsb1Kga
 VAe0Rh3afTGwadBjdCnradmYYCl9PwJ53tfHgq/YmNX8Lee/qMVH6/5G4alGp6nFA3aD
 QBqqS/NcA2CUhXdU7V5aNyP20kUKtMQ2E6avcawZqkRLJRABi1mgex4dAFySt9I5ehCK
 B2LQ==
X-Gm-Message-State: APjAAAXdaw2NopVSyDiM4anerJsu1YiLPzKSAARiZzlndbV+S7Ts0axc
 64Eb+LkJsLxSxtWTLc7xOMI=
X-Google-Smtp-Source: APXvYqxYU3Ey69Ku8Rc8SrYEN010pVUM8H8iNP0baRrA6jUaoihCL/IXmlM+aS5/StE+RBmMR8sTKA==
X-Received: by 2002:adf:f80a:: with SMTP id s10mr6774303wrp.39.1561991930845; 
 Mon, 01 Jul 2019 07:38:50 -0700 (PDT)
Received: from Timur-XPS ([152.66.80.213])
 by smtp.gmail.com with ESMTPSA id d10sm11991749wro.18.2019.07.01.07.38.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 07:38:50 -0700 (PDT)
Message-ID: <0bfd8ba5abb9288fe1f1ee1d9d7265885b8c8c94.camel@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 01 Jul 2019 16:38:48 +0200
In-Reply-To: <CADnq5_NSCqbPkfA-7Z-tjBP8ffiw0ZvEdDxRXpZ-LioNApr8Hw@mail.gmail.com>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
 <CADnq5_NSCqbPkfA-7Z-tjBP8ffiw0ZvEdDxRXpZ-LioNApr8Hw@mail.gmail.com>
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 01 Jul 2019 20:58:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=KOo32uLhooDfd7wd1XNFbgy3T5iU1PJ9JGNEUBH3WAY=;
 b=f/XAka/Qtloe5xGWEfTUVTasuzoOYxtckfju8tw+8D5XA8E4HZFLzMLMH979oOdyHo
 to6NaowXg+Rfi8kOsOTzh/yPnwdejuk7cLYGaRIomnel8EIMkSmiK9tFBZFBvv4KdVj+
 8UFkPKAaurUP1DnwVIotssYgH6K7871KNaSA2C8kGMXVO4ibo+rEWei9fY0DGcCwSx2x
 56QQwO3WmrEW9qmB2ATh8ierP13c6Cn7krLctCmACCihOiyaOLEhIn6G7ApxuNiDgO4y
 R5MovSylTvd4RhgtqS2RAkLAbsUUzR7T3Al95Jn49JHkrcPOd8aQ2FINcF9FJ9TlDvGg
 nQow==
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
Cc: "michael.jamet@intel.com" <michael.jamet@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiA+ID4gPiBMaWtlIEkgc2FpZCB0aGUgZGV2aWNlIHJlYWxseSBpcyBsaW1pdGVkIHRvIDIuNSBH
VC9zIGV2ZW4KPiA+ID4gPiB0aG91Z2ggaXQKPiA+ID4gPiBzaG91bGQgYmUgYWJsZSB0byBkbyA4
IEdUL3MuCj4gPiA+IAo+ID4gPiBUaGVyZSBpcyBUaHVuZGVyYm9sdCBsaW5rIGJldHdlZW4gdGhl
IGhvc3Qgcm91dGVyICh5b3VyIGhvc3QKPiA+ID4gc3lzdGVtKQo+ID4gPiBhbmQKPiA+ID4gdGhl
IGVHUFUgYm94LiBUaGF0IGxpbmsgaXMgbm90IGxpbWl0ZWQgdG8gMi41IEdUL3Mgc28gZXZlbiBp
ZiB0aGUKPiA+ID4gc2xvdAo+ID4gPiBjbGFpbXMgaXQgaXMgUENJIGdlbjEgdGhlIGFjdHVhbCBi
YW5kd2lkdGggY2FuIGJlIG11Y2ggaGlnaGVyCj4gPiA+IGJlY2F1c2UKPiA+ID4gb2YKPiA+ID4g
dGhlIHZpcnR1YWwgbGluay4KPiA+IAo+ID4gTm90IHN1cmUgSSB1bmRlcnN0YW5kIGNvcnJlY3Rs
eSwgYXJlIHlvdSBzYXlpbmcgdGhhdCBUQjMgY2FuIGRvIDQwCj4gPiBHYml0L3NlYyBldmVuIHRo
b3VnaCB0aGUga2VybmVsIHRoaW5rcyBpdCBjYW4gb25seSBkbyA4IEdiaXQgLyBzZWM/Cj4gPiAK
PiA+IEkgaGF2ZW4ndCBmb3VuZCBhIGdvb2Qgd2F5IHRvIG1lYXN1cmUgdGhlIG1heGltdW0gUENJ
ZSB0aHJvdWdocHV0Cj4gPiBiZXR3ZWVuIHRoZSBDUFUgYW5kIEdQVSwgYnV0IEkgZGlkIHRha2Ug
YSBsb29rIGF0IEFNRCdzIHN5c2ZzCj4gPiBpbnRlcmZhY2UKPiA+IGF0IC9zeXMvY2xhc3MvZHJt
L2NhcmQxL2RldmljZS9wY2llX2J3IHdoaWNoIHdoaWxlIHJ1bm5pbmcgdGhlCj4gPiBib3R0bGVu
ZWNrZWQgZ2FtZS4gVGhlIGhpZ2hlc3QgdGhyb3VnaHB1dCBJIHNhdyB0aGVyZSB3YXMgb25seSAy
LjQzCj4gPiBHYml0IC9zZWMuCj4gPiAKPiA+IE9uZSBtb3JlIHRob3VnaHQuIEkndmUgYWxzbyBs
b29rZWQgYXQKPiA+IC9zeXMvY2xhc3MvZHJtL2NhcmQxL2RldmljZS9wcF9kcG1fcGNpZSAtIHdo
aWNoIHRlbGxzIG1lIHRoYXQKPiA+IGFtZGdwdQo+ID4gdGhpbmtzIGl0IGlzIHJ1bm5pbmcgb24g
YSAyLjVHVC9zIHg4IGxpbmsgKGFzIG9wcG9zZWQgdG8gdGhlCj4gPiBleHBlY3RlZCA4Cj4gPiBH
VC9zIHg0KS4gQ2FuIHRoaXMgYmUgYSBwcm9ibGVtPwo+IAo+IFdlIGxpbWl0IHRoZSBzcGVlZCBv
ZiB0aGUgbGluayB0aGUgdGhlIGRyaXZlciB0byB0aGUgbWF4IHNwZWVkIG9mIGFueQo+IHVwc3Ry
ZWFtIGxpbmtzLiAgU28gaWYgdGhlcmUgYXJlIGFueSBsaW5rcyB1cHN0cmVhbSBsaW1pdGVkIHRv
IDIuNQo+IEdUL3MsIGl0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBjbG9jayB0aGUgbG9jYWwgbGlu
ayB1cCB0byBmYXN0ZXIKPiBzcGVlZHMuCj4gCj4gQWxleAoKSGkgQWxleCwKCkkgaGF2ZSB0d28g
Y29uY2VybnMgYWJvdXQgaXQ6CgoxLiBXaHkgZG9lcyBhbWRncHUgdGhpbmsgdGhhdCB0aGUgbGlu
ayBoYXMgOCBsYW5lcywgd2hlbiBpdCBvbmx5IGhhcyA0PwoKMi4gQXMgZmFyIGFzIEkgdW5kZXJz
dG9vZCB3aGF0IE1pa2Egc2FpZCwgdGhlcmUgaXNuJ3QgcmVhbGx5IGEgMi41IEdUL3MKbGltaXRh
dGlvbiB0aGVyZSwgc2luY2UgdGhlIHZpcnR1YWwgbGluayBzaG91bGQgYmUgcnVubmluZyBhdCA0
MCBHYi9zCnJlZ2FyZGxlc3Mgb2YgdGhlIHJlcG9ydGVkIHNwZWVkIG9mIHRoYXQgZGV2aWNlLiBX
b3VsZCBpdCBiZSBwb3NzaWJsZQp0byBydW4gdGhlIEFNRCBHUFUgYXQgOCBHVC9zIGluIHRoaXMg
Y2FzZT8KCkJlc3QgcmVnYXJkcywKVGltCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
