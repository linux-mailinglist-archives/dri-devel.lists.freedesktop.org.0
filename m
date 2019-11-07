Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FE0F41E6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBA66F89A;
	Fri,  8 Nov 2019 08:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D2D6F747
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 16:38:13 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PrwDCq1eY="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id L09db3vA7GbsfsV
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Thu, 7 Nov 2019 17:37:54 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v2 1/8] RFC: dt-bindings: add img,
 pvrsgx.yaml for Imagination GPUs
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191107155401.GC5610@atomide.com>
Date: Thu, 7 Nov 2019 17:37:54 +0100
Message-Id: <65C6747A-982A-4179-95AF-4061733978A1@goldelico.com>
References: <cover.1573124770.git.hns@goldelico.com>
 <4292cec1fd82cbd7d42742d749557adb01705574.1573124770.git.hns@goldelico.com>
 <20191107155401.GC5610@atomide.com>
To: Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1573144692; 
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=RUuZUnY8v0t17sljokJZv0i1/4lvzd4ncub/rgk8kuU=;
 b=RXk72VS4CSubJkTUr6C+K1pYd03kXkgX7Ox2n4mIj2HzmECuPPVQUmfXWQziLTU5gk
 W0tU+OqcB4qyI79BzFTknguTLAs5xqpCckuQPXPpY3LiKaJfMsngGfk0Zf2wz+7R7tID
 UXGIJxWyQaWJfxxfoOPUbaiyX8AqywzFpSXxwJbZ43LyQMDk4S5WgGU12nabPYV0dkl+
 JvyTsfndIz+8Bi/p4xjcP/WhnuCMxEDxTr6bD0rMVhGTC5vLHtXHPXPXxRrmJ8iSrQIZ
 tF8DcfZfAUWIKCxuWuLit0CNVG4iGGKiG2vXX0Wk53l1JOSM9hn4eu5m3Zuaac1DOjjK
 7NVg==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 letux-kernel@openphoenux.org, Paul Burton <paulburton@kernel.org>,
 David Airlie <airlied@linux.ie>, James Hogan <jhogan@kernel.org>,
 openpvrsgx-devgroup@letux.org, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cj4gQW0gMDcuMTEuMjAxOSB1bSAxNjo1NCBzY2hyaWViIFRvbnkgTGluZGdyZW4gPHRvbnlAYXRv
bWlkZS5jb20+Ogo+IAo+ICogSC4gTmlrb2xhdXMgU2NoYWxsZXIgPGhuc0Bnb2xkZWxpY28uY29t
PiBbMTkxMTA3IDExOjA3XToKPj4gKyAgICAgICAgLSBjb25zdDogInRpLGFtMzM1eC1zZ3g1MzAt
MTI1IiwgImltZyxzZ3g1MzAtMTI1IiwgImltZyxzZ3g1MzAiLCAiaW1nLHNneDUiCj4gCj4gVGhp
cyBzaG91bGQgYmUgd2l0aG91dCB0aGUgeCwgbWF5YmUgdXNlIHRoZSBlYXJsaWVzdCBvbmUgaGVy
ZQo+IGZvciAidGksYW0zMzUyLXNneDUzMC0xMjUiIGxpa2Ugd2UgaGF2ZSBmb3IgInRpLGFtMzM1
Mi11YXJ0Ii4KCk9rLCBmaW5lLiBXaWxsIHVwZGF0ZSBhY2NvcmRpbmdseS4KCj4gV2UgY291bGQg
dXNlICJ0aSxhbTMtc2d4NTMwLTEyNSIgYnV0IHRoYXQgY2FuIGdldCBjb25mdXNlZAo+IHRoZW4g
d2l0aCBhbTM1MTcgdGhlbi4KCkluZGVlZC4KCkJSIGFuZCB0aGFua3MsCk5pa29sYXVzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
