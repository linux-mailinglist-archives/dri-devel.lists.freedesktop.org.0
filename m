Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2300C61B11
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2DF89B29;
	Mon,  8 Jul 2019 07:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A81B6E4F9
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 16:01:44 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b2so9206121wrx.11
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 09:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:in-reply-to:references
 :content-transfer-encoding:date:message-id:mime-version;
 bh=N5AckEpSq/1+AAW5XtOOE2H4WYc1Y6IdpEMDsE/Fu1k=;
 b=X0fZpCK4EUB+oT2GMsRteq5oyMD6s2pMKlo7LC7Y3898Hf/Ebh5cK2+HsCZTil5Vtq
 FpVjA3aF70knscJo/3wrYbWu1Lw+jH0/6wqR680c8f6JRnfXe0pWj0aobmfc7wW2zUc0
 0/947nXIsXI/ufg8ky+ubvBZsLS2KCNvZ/CZGxa+GnHNZzYRw9LOdGkOSn5H47g84Yg2
 kKqm6NM6BaVlI8mwtKE+qzpwh58IWP9sumT9m/ybJ2RPF7+EFh9ZzLeZ7zt6bNBxzBK9
 7txJjqHdHcVcTE3seFMC3EYJpx9L/MTmzDmOlpIclkjXhy43Bb2OF4QYwhVCmS/KOjjO
 /uag==
X-Gm-Message-State: APjAAAULBWtspdhqKlx0XEHDoMl5bA8YJyUT1plvZ8LxlJ/oD1IHIaQZ
 LaE6gtMAwnroUn7RCiaFbDk=
X-Google-Smtp-Source: APXvYqy7mDvfo7SoOI+1vKHr1xjFVHTTHFR9CmJjyQbeuh/J+TXDhTmbDll8Ex+MixofHL9zuEGbhg==
X-Received: by 2002:adf:eb49:: with SMTP id u9mr4892469wrn.215.1562342502975; 
 Fri, 05 Jul 2019 09:01:42 -0700 (PDT)
Received: from [100.64.59.210] (netacc-gpn-7-135-251.pool.telenor.hu.
 [176.77.135.251])
 by smtp.gmail.com with ESMTPSA id q16sm8515370wra.36.2019.07.05.09.01.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jul 2019 09:01:41 -0700 (PDT)
X-Priority: 3
To: maraeo@gmail.com
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
In-Reply-To: <CAAxE2A6K-oaZqOJr+k0fZfwCmrPO+tfygu8EjDwk9PNgk4qU=Q@mail.gmail.com>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
 <c3b38b60-7c1a-730d-8de0-e3c880902003@daenzer.net>
 <627b7fff64edcba0f8d8b5ced79a351821c419c7.camel@gmail.com>
 <792d0f36-b8ae-bef9-3b07-95677637ba00@daenzer.net>
 <f986d6687e2b1f1fc8a93f86cbc8fd1ab971663a.camel@gmail.com>
 <d1dfe289-8501-8848-6324-c43d6e66a77f@daenzer.net>
 <CAAxE2A4hgaJ6+AoOGz=b+1aRQEb+eKB88N82KGkcU1w_dnffOQ@mail.gmail.com>
 <ba05faee86fd702f0ba9baa2322a5e32c27432d7.camel@gmail.com>
 <CAAxE2A6K-oaZqOJr+k0fZfwCmrPO+tfygu8EjDwk9PNgk4qU=Q@mail.gmail.com>
Date: Fri, 5 Jul 2019 16:01:39 +0000
Message-ID: <uyxy4s.pu6f6t.rtdmfm-qmf@smtp.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=to:cc:from:subject:in-reply-to:references:content-transfer-encoding
 :date:message-id:mime-version;
 bh=N5AckEpSq/1+AAW5XtOOE2H4WYc1Y6IdpEMDsE/Fu1k=;
 b=Xe1k0b2CXVlWgOWFVm/0qcHSYHeR9/USx2XSDlz+ybUKDe5aoiQhMdoNQF46lX68qU
 T5zFYu93v7y8mvPlFX7/tXjYsQ6Kv29WYGFJhwK0ERb+oJMZReqE7XZ8UsWR2qEb4zKF
 Drvg/kkY8YCiHVXkaMdVBknVY04XNr8Ws/bYLUIxRYJD3NCTnVPatBYdt5xukX6GWUuQ
 iQTIewlNnxXKGrTQTw+9gvemycqz6oKwae3ehxj1gub9JCgEVo7op/8KsMkAQxtXL7/+
 ym9cpNONxw009GDjVOkcfp3BnXxkwmdm7P5NfAOl8nOn/VnAwte+Es6OTMT3LEJ0/fEc
 dlKw==
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
Cc: michael.jamet@intel.com, michel@daenzer.net,
 mika.westerberg@linux.intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIEZyaWRheSwgNSBKdWx5IDIwMTksIE1hcmVrIE9sxaHDoWsgd3JvdGU6DQo+IE9uIEZy
aSwgSnVsIDUsIDIwMTkgYXQgNToyNyBBTSBUaW11ciBLcmlzdMOzZiA8dGltdXIua3Jpc3RvZkBn
bWFpbC5jb20+DQo+IHdyb3RlOg0KPiANCj4gPiBPbiBXZWQsIDIwMTktMDctMDMgYXQgMTQ6NDQg
LTA0MDAsIE1hcmVrIE9sxaHDoWsgd3JvdGU6DQo+ID4gPiBZb3UgY2FuIHJ1bjoNCj4gPiA+IEFN
RF9ERUJVRz10ZXN0ZG1hcGVyZiBnbHhnZWFycw0KPiA+ID4NCj4gPiA+IEl0IHRlc3RzIHRyYW5z
ZmVyIHNpemVzIG9mIHVwIHRvIDEyOCBNQiwgYW5kIGl0IHRlc3RzIH42MCBzbGlnaHRseQ0KPiA+
ID4gZGlmZmVyZW50IG1ldGhvZHMgb2YgdHJhbnNmZXJpbmcgZGF0YS4NCj4gPiA+DQo+ID4gPiBN
YXJlaw0KPiA+DQo+ID4NCj4gPiBUaGFua3MgTWFyZWssIEkgZGlkbid0IGtub3cgYWJvdXQgdGhh
dCBvcHRpb24uDQo+ID4gVHJpZWQgaXQsIGhlcmUgaXMgdGhlIG91dHB1dDogaHR0cHM6Ly9wYXN0
ZWJpbi5jb20vcmF3LzlTQUFiYkFBDQo+ID4NCj4gPiBJJ20gbm90IHF1aXRlIHN1cmUgaG93IHRv
IGludGVycHJldCB0aGUgbnVtYmVycywgdGhleSBhcmUgaW5jb25zaXN0ZW50DQo+ID4gd2l0aCB0
aGUgcmVzdWx0cyBmcm9tIGJvdGggcGNpZV9idyBhbmQgYW1kZ3B1LmJlbmNobWFyaywgZm9yIGV4
YW1wbGUNCj4gPiBHVFQtPlZSQU0gYXQgYSAxMjggS0IgaXMgYXJvdW5kIDE0MDAgTUIvcyAoSSBh
c3N1bWUgdGhhdCBpcyBtZWdhYnl0ZXMgLw0KPiA+IHNlYywgcmlnaHQ/KS4NCj4gPg0KPiANCj4g
QmFzZWQgb24gdGhlIFNETUEgcmVzdWx0cywgeW91IGhhdmUgMi40IEdCL3MuIEZvciAxMjhLQiwg
aXQncyAyLjIgR0IvcyBmb3INCj4gR1RULT5WUkFNIGNvcGllcy4NCj4gDQo+IE1hcmVrDQoNClRo
YXQncyBpbnRlcmVzdGluZywgQUZBSVUgdGhhdCB3b3VsZCBiZSAxNy42IEdiaXQvc2VjLiBCdXQg
aG93IGNhbiB0aGF0IGJlIHNvIG11Y2ggZmFzdGVyIHRoYW4gdGhlIDUgR2JpdC9zZWMgcmVzdWx0
IGZyb20gYW1kZ3B1LmJlbmNobWFyaz8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
