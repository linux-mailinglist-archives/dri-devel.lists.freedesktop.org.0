Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F1B5B14C
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B9089DC2;
	Sun, 30 Jun 2019 18:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87F76E916
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:21:40 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id s15so8771771wmj.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 05:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=nRsrjfXNIG2K5qKZBLYkRmhjTrEcdF0GSignMrnqEw4=;
 b=GAtsADcBOjyklo9my6ieHc2GCd+rmxYUR3eskEbUtBQxvYu3kZj58wx9sWOpvHeGgk
 IVuDQ2EtIJPKffU99MQugeEJNHfL0CrI3yToU7wgG1nPt81B7bNVhTeY4Fz5EljfIJhf
 Vm+DdyuFxnJ9uabEm1Vjog+ldHgvXPjNvHRxA1MyJJo2yBuluQh86h+K3QHhpDVodLpg
 SOBRhfHgZbzfjnuEihu8CmypgtY2ecjvE1TxE2x/VfUiGSP4bJ7IPF4YhyC/h+Ic0Thz
 Eq7zFtmlVuHEr/8bFmliHiD4Rk7DwW7FPjldw4V2Wmf+XiHwVTk0+cmycdJFH7X9bUtg
 sRpg==
X-Gm-Message-State: APjAAAW4DPr229t9+JI5SNUHmvohaAhu1/L171Adp8vN7N1Px1CaZ6ON
 ptCUvAgKSMZpxnvxoCr8cyE=
X-Google-Smtp-Source: APXvYqzRDhwuWQ25CEx7Nq3l28Uo7h5J3dKcMt7MIBoys4RjP+GXh8OY3ei8UbAPtdj+P0ygGwjFSA==
X-Received: by 2002:a1c:3b45:: with SMTP id i66mr7399076wma.48.1561724499535; 
 Fri, 28 Jun 2019 05:21:39 -0700 (PDT)
Received: from Timur-XPS (catv-80-99-228-232.catv.broadband.hu.
 [80.99.228.232])
 by smtp.gmail.com with ESMTPSA id l8sm4324784wrg.40.2019.06.28.05.21.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 05:21:38 -0700 (PDT)
Message-ID: <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Fri, 28 Jun 2019 14:21:36 +0200
In-Reply-To: <20190628113415.GL2640@lahna.fi.intel.com>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 30 Jun 2019 18:26:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=nRsrjfXNIG2K5qKZBLYkRmhjTrEcdF0GSignMrnqEw4=;
 b=OQUmmN+XsZ0r4unPWw4cFJyDYlq32Nplk+ItKuAJzTweOQNX75b9XVyxPBgvIZmIwU
 PNc0qqIZPCqmARql61EJj702Mh479WVL6ciQMhG6UD2odlE/GPv0D++lmX/F7v9dkALt
 qvDHaRs9cCkeoItg8GCfRGV8bp951Rw1FlfMCEfKHB0r3e3v+Y544yW7wstC9zNUPPOG
 5mTaM3dfs/7L/m8tdJZylrmK2nWfI9IuVNOvzs3BcEdRuOz2JvfTyUxH6SUkvP+PtHWD
 /rFP7VEwJvqyg3v9bqGbVWwVIbMep/9gKjHCeyywq6sG4BFgTBTOBTpbV3vLQmVjr6Xo
 MXsQ==
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

Cj4gPiBTdXJlLCB0aG91Z2ggaW4gdGhpcyBjYXNlIDMgb2YgdGhvc2UgZG93bnN0cmVhbSBwb3J0
cyBhcmUgbm90Cj4gPiBleHBvc2VkCj4gPiBieSB0aGUgaGFyZHdhcmUsIHNvIGl0J3MgYSBiaXQg
c3VycHJpc2luZyB0byBzZWUgdGhlbSB0aGVyZS4KPiAKPiBUaGV5IGxlYWQgdG8gb3RoZXIgcGVy
aXBoZXJhbHMgb24gdGhlIFRCVCBob3N0IHJvdXRlciBzdWNoIGFzIHRoZSBUQlQKPiBjb250cm9s
bGVyIGFuZCB4SENJLiBBbHNvIHRoZXJlIGFyZSB0d28gZG93bnN0cmVhbSBwb3J0cyBmb3IKPiBl
eHRlbnNpb24KPiBmcm9tIHdoaWNoIHlvdSBlR1BVIGlzIHVzaW5nIG9uZS4KCklmIHlvdSBsb29r
IGF0IHRoZSBkZXZpY2UgdHJlZSBmcm9tIG15IGZpcnN0IGVtYWlsLCB5b3UgY2FuIHNlZSB0aGF0
CmJvdGggdGhlIEdQVSBhbmQgdGhlIFhIQ0kgdXNlcyB0aGUgc2FtZSBwb3J0OiAwNDowNC4wIC0g
aW4gZmFjdCBJIGNhbgpldmVuIHJlbW92ZSB0aGUgb3RoZXIgMyBwb3J0cyBmcm9tIHRoZSBzeXN0
ZW0gd2l0aG91dCBhbnkgY29uc2VxdWVuY2VzLgoKPiA+IExpa2UgSSBzYWlkIHRoZSBkZXZpY2Ug
cmVhbGx5IGlzIGxpbWl0ZWQgdG8gMi41IEdUL3MgZXZlbiB0aG91Z2ggaXQKPiA+IHNob3VsZCBi
ZSBhYmxlIHRvIGRvIDggR1Qvcy4KPiAKPiBUaGVyZSBpcyBUaHVuZGVyYm9sdCBsaW5rIGJldHdl
ZW4gdGhlIGhvc3Qgcm91dGVyICh5b3VyIGhvc3Qgc3lzdGVtKQo+IGFuZAo+IHRoZSBlR1BVIGJv
eC4gVGhhdCBsaW5rIGlzIG5vdCBsaW1pdGVkIHRvIDIuNSBHVC9zIHNvIGV2ZW4gaWYgdGhlCj4g
c2xvdAo+IGNsYWltcyBpdCBpcyBQQ0kgZ2VuMSB0aGUgYWN0dWFsIGJhbmR3aWR0aCBjYW4gYmUg
bXVjaCBoaWdoZXIgYmVjYXVzZQo+IG9mCj4gdGhlIHZpcnR1YWwgbGluay4KCk5vdCBzdXJlIEkg
dW5kZXJzdGFuZCBjb3JyZWN0bHksIGFyZSB5b3Ugc2F5aW5nIHRoYXQgVEIzIGNhbiBkbyA0MApH
Yml0L3NlYyBldmVuIHRob3VnaCB0aGUga2VybmVsIHRoaW5rcyBpdCBjYW4gb25seSBkbyA4IEdi
aXQgLyBzZWM/CgpJIGhhdmVuJ3QgZm91bmQgYSBnb29kIHdheSB0byBtZWFzdXJlIHRoZSBtYXhp
bXVtIFBDSWUgdGhyb3VnaHB1dApiZXR3ZWVuIHRoZSBDUFUgYW5kIEdQVSwgYnV0IEkgZGlkIHRh
a2UgYSBsb29rIGF0IEFNRCdzIHN5c2ZzIGludGVyZmFjZQphdCAvc3lzL2NsYXNzL2RybS9jYXJk
MS9kZXZpY2UvcGNpZV9idyB3aGljaCB3aGlsZSBydW5uaW5nIHRoZQpib3R0bGVuZWNrZWQgZ2Ft
ZS4gVGhlIGhpZ2hlc3QgdGhyb3VnaHB1dCBJIHNhdyB0aGVyZSB3YXMgb25seSAyLjQzCkdiaXQg
L3NlYy4KCk9uZSBtb3JlIHRob3VnaHQuIEkndmUgYWxzbyBsb29rZWQgYXQKL3N5cy9jbGFzcy9k
cm0vY2FyZDEvZGV2aWNlL3BwX2RwbV9wY2llIC0gd2hpY2ggdGVsbHMgbWUgdGhhdCBhbWRncHUK
dGhpbmtzIGl0IGlzIHJ1bm5pbmcgb24gYSAyLjVHVC9zIHg4IGxpbmsgKGFzIG9wcG9zZWQgdG8g
dGhlIGV4cGVjdGVkIDgKR1QvcyB4NCkuIENhbiB0aGlzIGJlIGEgcHJvYmxlbT8KCj4gCj4gPiA+
ID4gMy4gSXMgaXQgcG9zc2libGUgdG8gbWFudWFsbHkgc2V0IHRoZW0gdG8gOCBHVC9zPwo+ID4g
PiAKPiA+ID4gTm8gaWRlYS4KPiA+ID4gCj4gPiA+IEFyZSB5b3UgYWN0dWFsbHkgc2VlaW5nIHNv
bWUgcGVyZm9ybWFuY2UgaXNzdWUgYmVjYXVzZSBvZiB0aGlzIG9yCj4gPiA+IGFyZQo+ID4gPiB5
b3UganVzdCBjdXJpb3VzPwo+ID4gCj4gPiBZZXMsIEkgc2VlIGEgbm90aWNhYmxlIHBlcmZvcm1h
bmNlIGhpdDogc29tZSBnYW1lcyBoYXZlIHZlcnkgbG93Cj4gPiBmcmFtZQo+ID4gcmF0ZSB3aGls
ZSBuZWl0aGVyIHRoZSBDUFUgbm9yIHRoZSBHUFUgYXJlIGZ1bGx5IHV0aWxpemVkLgo+IAo+IElz
IHRoYXQgcHJvYmxlbSBpbiBMaW51eCBvbmx5IG9yIGRvIHlvdSBzZWUgdGhlIHNhbWUgaXNzdWUg
aW4gV2luZG93cwo+IGFzCj4gd2VsbD8KCgpJIGFkbWl0IEkgZG9uJ3QgaGF2ZSBXaW5kb3dzIG9u
IHRoaXMgY29tcHV0ZXIgbm93IGFuZCBpdCBoYXMgYmVlbiBzb21lCnRpbWUgc2luY2UgSSBsYXN0
IHRyaWVkIGl0LCBidXQgd2hlbiBJIGRpZCwgSSBkaWRuJ3Qgc2VlIHRoaXMgcHJvYmxlbS4KCkJl
c3QgcmVnYXJkcywKVGltCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
