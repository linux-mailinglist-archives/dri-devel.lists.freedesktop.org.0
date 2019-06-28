Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0765B141
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6653989DA4;
	Sun, 30 Jun 2019 18:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1CA6E925
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 13:33:59 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id n4so6290517wrw.13
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 06:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=bueEbAZpUa/LNe0yqLUK3WOrwRroVQk3aJ1yODbpRtI=;
 b=h5Sd5ZIpznQS0gsM/IipEauxjJz8GHbWSSyVlNkaEmJTRqbPUl/Zfhw/LAAnaMD/wB
 sM8biiZmYzezOY5fZuL+OIyEJhjXoEQpVq7iuKLm5Mm5Bz14mWK4+iSYCtcyF4v/LlmS
 iaokt04g2/VlXyPKDoAFdMRLS8u0+KkyeQyCTwlJKygro3T5OICCUr6Ig9pCsknE6dwG
 k/tZS5VazVbxRiTP2cPVY7DOdjqGYjKBQrgDLFjjPc6c2ObI1jdLDt/IVij0D3VgIJ7E
 nSJRoclVv23SmC6dNNE4MpB5OenjKRlGvFgPlKJT86svtAK4KSJ6V4D0+KQFMLjkw091
 LUtA==
X-Gm-Message-State: APjAAAW4AmWW7X++6SmCzcUeh+9OnsvgYii2fjE4VEM3wts1StgXh2ic
 8bSasoS0F3m+mqZTjar+L6k=
X-Google-Smtp-Source: APXvYqwQJ41R/HJCGlJLsSgxnxkeTe/odk0hASTaZit38kCNbHJu3/qGS70+8W6NmiUKYmUo5BoNbg==
X-Received: by 2002:adf:e705:: with SMTP id c5mr8264610wrm.270.1561728838131; 
 Fri, 28 Jun 2019 06:33:58 -0700 (PDT)
Received: from Timur-XPS (catv-80-99-228-232.catv.broadband.hu.
 [80.99.228.232])
 by smtp.gmail.com with ESMTPSA id x17sm1542957wrq.64.2019.06.28.06.33.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 06:33:57 -0700 (PDT)
Message-ID: <c5545128e27cbcce5888f9972ff066fb4979fd28.camel@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Fri, 28 Jun 2019 15:33:56 +0200
In-Reply-To: <20190628125346.GM2640@lahna.fi.intel.com>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
 <20190628125346.GM2640@lahna.fi.intel.com>
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 30 Jun 2019 18:26:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=bueEbAZpUa/LNe0yqLUK3WOrwRroVQk3aJ1yODbpRtI=;
 b=gWk8C9lNZAznhZs7iSB7M8uiNrotyEq25Mgsw4tasmvoVn3sTKej+EUAXUxMRT4GnS
 zolyWl1qUMgs/v9WprlMxGuhgWSxFb9/cJqDpGplAllLWKbC3JRfQE8Gt+ABjraPFk8p
 LlIyDSLCLq34lRUsnFLBMq5F8k2smu1GPR2Ks+Oo2EPhHf0fUVtF15D17GvqLqZwozZ4
 ytjwUs9B5kfpxh+zDCpzFo/jAsjdcUMi0ATBufkZcEYI3f7Sp2RG6XdXj5aPhVNcKfZ2
 G4grSk8E/UEzbFnpr9eFNi4HdpM96F5EqMtCMNvggupZPi//eKhDol0B4FfGvnAvXbKH
 pNsg==
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cj4gV2VsbCB0aGF0J3MgdGhlIGV4dGVuc2lvbiBQQ0llIGRvd25zdHJlYW0gcG9ydC4gVGhlIG90
aGVyIG9uZSBpcwo+IDA0OjAxLjAuCj4gCj4gVHlwaWNhbGx5IDA0OjAwLjAgYW5kIDA0OjAwLjIg
YXJlIHVzZWQgdG8gY29ubmVjdCBUQlQgKDA1OjAwLjApIGFuZAo+IHhIQ0kKPiAoMzk6MDAuMCkg
YnV0IGluIHlvdXIgY2FzZSB5b3UgZG9uJ3Qgc2VlbSB0byBoYXZlIFVTQiAzIGRldmljZXMKPiBj
b25uZWN0ZWQgdG8gdGhhdCBzbyBpdCBpcyBub3QgcHJlc2VudC4gSWYgeW91IHBsdWcgaW4gVVNC
LUMgZGV2aWNlCj4gKG5vbi1UQlQpIHlvdSBzaG91bGQgc2VlIHRoZSBob3N0IHJvdXRlciB4SENJ
IGFwcGVhcmluZyBhcyB3ZWxsLgo+IAo+IFRoaXMgaXMgcHJldHR5IHN0YW5kYXJkIHRvcG9sb2d5
Lgo+ID4gCj4gPiBOb3Qgc3VyZSBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCBhcmUgeW91IHNheWlu
ZyB0aGF0IFRCMyBjYW4gZG8gNDAKPiA+IEdiaXQvc2VjIGV2ZW4gdGhvdWdoIHRoZSBrZXJuZWwg
dGhpbmtzIGl0IGNhbiBvbmx5IGRvIDggR2JpdCAvIHNlYz8KPiAKPiBZZXMgdGhlIFBDSWUgc3dp
dGNoIHVwc3RyZWFtIHBvcnQgKDNhOjAwLjApIGlzIGNvbm5lY3RlZCBiYWNrIHRvIHRoZQo+IGhv
c3Qgcm91dGVyIG92ZXIgdmlydHVhbCBUaHVuZGVyYm9sdCA0MEdiL3MgbGluayBzbyB0aGUgUENJ
ZSBnZW4xCj4gc3BlZWRzCj4gaXQgcmVwb3J0cyBkbyBub3QgcmVhbGx5IG1hdHRlciBoZXJlIChz
YW1lIGdvZXMgZm9yIHRoZSBkb3duc3RyZWFtKS4KPiAKPiBUaGUgdG9wb2xvZ3kgbG9va3MgbGlr
ZSBiZWxsb3cgaWYgSSBnb3QgaXQgcmlnaHQgZnJvbSB0aGUgbHNwY2kKPiBvdXRwdXQ6Cj4gCj4g
ICAwMDoxYy40IChyb290IHBvcnQpIDggR1QvcyB4IDQKPiAgICAgXgo+ICAgICB8IHJlYWwgUENJ
ZSBsaW5rCj4gICAgIHYKPiAgIDAzOjAwLjAgKHVwc3RyZWFtIHBvcnQpIDggR1QvcyB4IDQKPiAg
IDA0OjA0LjAgKGRvd25zdHJlYW0gcG9ydCkgMi41IEdUL3MgeCA0Cj4gICAgIF4KPiAgICAgfCAg
dmlydHVhbCBsaW5rIDQwIEdiL3MKPiAgICAgdgo+ICAgM2E6MDAuMCAodXBzdHJlYW0gcG9ydCkg
Mi41IEdUL3MgeCA0Cj4gICAzYjowMS4wIChkb3duc3RyZWFtIHBvcnQpIDggR1QvcyB4IDQKPiAg
ICAgXgo+ICAgICB8IHJlYWwgUENJZSBsaW5rCj4gICAgIHYKPiAgIDNjOjAwLjAgKGVHUFUpIDgg
R1QvcyB4IDQKPiAKPiBJbiBvdGhlciB3b3JkcyBhbGwgdGhlIHJlYWwgUENJZSBsaW5rcyBydW4g
YXQgZnVsbCA4IEdUL3MgeCA0IHdoaWNoCj4gaXMKPiB3aGF0IGlzIGV4cGVjdGVkLCBJIHRoaW5r
LgoKCkl0IG1ha2VzIHNlbnNlIG5vdy4gVGhpcyBpcyBoYW5kcyBkb3duIHRoZSBiZXN0IGV4cGxh
bmF0aW9uIEkndmUgc2VlbgphYm91dCBob3cgVEIzIGhhbmdzIHRvZ2V0aGVyLiBUaGFua3MgZm9y
IHRha2luZyB0aGUgdGltZSB0byBleHBsYWluIGl0IQoKSSBoYXZlIHR3byBtb3JlIHF1ZXN0aW9u
czoKCjEuIFdoYXQgaXMgdGhlIGJlc3Qgd2F5IHRvIHRlc3QgdGhhdCB0aGUgdmlydHVhbCBsaW5r
IGlzIGluZGVlZCBjYXBhYmxlCm9mIDQwIEdiaXQgLyBzZWM/IFNvIGZhciBJJ3ZlIGJlZW4gdW5h
YmxlIHRvIGZpZ3VyZSBvdXQgaG93IHRvIG1lYXN1cmUKaXRzIG1heGltdW0gdGhyb3VnaHB1dC4K
CjIuIFdoeSBpcyBpdCB0aGF0IHRoZSBnYW1lIGNhbiBvbmx5IHV0aWxpemUgYXMgbXVjaCBhcyAy
LjUgR2JpdCAvIHNlYwp3aGVuIGl0IGdldHMgYm90dGxlbmVja2VkPyBUaGUgc2FtZSBwcm9ibGVt
IGlzIG5vdCBwcmVzZW50IG9uIGEgZGVza3RvcApjb21wdXRlciB3aXRoIGEgIm5vcm1hbCIgUENJ
ZSBwb3J0LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
