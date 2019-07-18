Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 119A76CA13
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 09:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC3F6E330;
	Thu, 18 Jul 2019 07:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6D16E290
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 17:33:52 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaZXA4NYcM="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
 by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
 with ESMTPSA id V09459v6HHXaDXl
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Wed, 17 Jul 2019 19:33:36 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Letux-kernel] [PATCH v3 0/5] drm/panel-simple: Add panel
 parameters for ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CF1D9929-58D2-4E75-932A-870D11BBFBDE@goldelico.com>
Date: Wed, 17 Jul 2019 19:33:35 +0200
Message-Id: <33D92C0E-A430-4C34-A698-646F2592093D@goldelico.com>
References: <cover.1559905870.git.hns@goldelico.com>
 <0842FF88-D8E0-441B-837B-769C2EF6C1CB@goldelico.com>
 <20190625204356.GF18595@ravnborg.org> <20190626073350.GA15288@ravnborg.org>
 <CF1D9929-58D2-4E75-932A-870D11BBFBDE@goldelico.com>
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Thu, 18 Jul 2019 07:39:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1563384830; 
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=dOZPXX2/0UU+1woBsjSlDEXl3gIGo8OmSzylGf5Wz0k=;
 b=Js25+o0uVb7ms9JQU3WrBp3tZ0zLBwOUaMvG1HVZBoHQLMzoP53YuLM52beG2xMtg3
 nOGcF5j4WQl+w4+wevLqxqLVuMs8M0CBEjMJAFrYyfCy/WN6KOs35QQBNDQZMx9QQgwu
 5bmzuaCzSIWn+gdJ0fue/ugcG2P75lxS6rJb30NdYP1rgLTTEWILCep9ZsL6EyS4qK6Q
 zMhF/GXRDwTAXW3rWPc4HEgZNM6ICFr/L67APJPNFfjfcFTSNxkTyobCwd0UH+gyS8dY
 XSQDepx1wNhcPPa6oYMffsUsYDTMWiRRWZxpK53FoCXKzfq1uJ0eaz8j5rpOtUyIhPsU
 /7/w==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 David Airlie <airlied@linux.ie>, Belisko Marek <marek.belisko@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKPiBBbSAyNi4wNi4yMDE5IHVtIDE0OjQwIHNjaHJpZWIgSC4gTmlrb2xhdXMgU2No
YWxsZXIgPGhuc0Bnb2xkZWxpY28uY29tPjoKPiAKPiBIaSBTYW0sCj4gCj4+IEFtIDI2LjA2LjIw
MTkgdW0gMDk6MzMgc2NocmllYiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Ogo+PiAK
Pj4gSGkgTmlrb2xhdXMuCj4+IAo+Pj4+IAo+Pj4+IGFueSBwcm9ncmVzcyB0b3dhcmRzIG1lcmdp
bmcgdGhpcyBzb21ld2hlcmU/IEl0IGRpZCBub3QgeWV0IGFycml2ZSBpbiBsaW51eC1uZXh0Lgo+
Pj4+IAo+Pj4+IEJUVzogc2hvdWxkIGFsc28gYmUgYXBwbGllZCB0byA1LjIKPj4+IFRoZSBkcm0g
Yml0cyBhcmUgcmV2aWV3ZWQuIFRoZSBEVCBiaXRzIG5lZWRzIE9LIGZyb20gRFQgcGVvcGxlLgo+
Pj4gV2hlbiB3ZSBoYXZlIE9LIGZyb20gRFQgcGVvcGxlIHdlIGNhbiBhcHBseSB0aGVtIGFsbCB0
byBkcm0tbWlzYy1uZXh0Lgo+PiAKPj4gSSBnb3QgT0sgb24gaXJjIGZyb20gUm9iIHRvIHByb2Nl
c3MgdGhlc2UuCj4+IEFsbCBwYXRjaGVzIGFyZSBub3cgYXBwbGllZCB0byBkcm0tbWlzYy1uZXh0
Lgo+IAo+IFRoYW5rcyBmb3IgdGFraW5nIGNhcmUgb2YgdGhpcyEKCkkgaGF2ZSBjaGVja2VkIGJ1
dCBpdCBzZWVtcyB0aGV5IGFyZSBzdGlsbCBub3QgbWVyZ2VkIGludG8gbGludXgtbmV4dC4KCkJS
IGFuZCB0aGFua3MsCk5pa29sYXVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
