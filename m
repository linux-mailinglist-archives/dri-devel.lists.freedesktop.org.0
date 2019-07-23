Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A5F71282
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDA789395;
	Tue, 23 Jul 2019 07:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B8C89C80
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 06:59:34 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCzzAWjYNpPLf7dKT9br2BTgS7Wra5BtV3XNo7sm"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:26fe:7700:487b:93ce:9f6c:e3a4]
 by smtp.strato.de (RZmta 44.24 AUTH) with ESMTPSA id j00b6dv6N6xJJkB
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Tue, 23 Jul 2019 08:59:19 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Letux-kernel] [PATCH v3 0/5] drm/panel-simple: Add panel
 parameters for ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190717181455.GB6522@ravnborg.org>
Date: Tue, 23 Jul 2019 08:59:29 +0200
Message-Id: <201E8D0D-96A3-4E32-AF88-030879162F61@goldelico.com>
References: <cover.1559905870.git.hns@goldelico.com>
 <0842FF88-D8E0-441B-837B-769C2EF6C1CB@goldelico.com>
 <20190625204356.GF18595@ravnborg.org> <20190626073350.GA15288@ravnborg.org>
 <CF1D9929-58D2-4E75-932A-870D11BBFBDE@goldelico.com>
 <33D92C0E-A430-4C34-A698-646F2592093D@goldelico.com>
 <20190717181455.GB6522@ravnborg.org>
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1563865172; 
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=HMzGT/OWeM8K38nQoAk3mo3OqufNI1pKnUDvqT6/cQs=;
 b=sSENN3k66OG2akkQktqi9cTDGetTrHgy1Szp/gwOYS8QKrhCOjmbM+uCVfY77P8h6I
 n9VDZez1XjgLTbEqf7YVpSjPE50oPzGfpG41H5Ao0OTjkrGI3d0Ye3LGjbfjvkyUqcLA
 yNy4A5iH0JoKj5d4QvTlfHQL8/YgYnDRTgCbiFEmURgzLdgtWDYGbR02Y7LbLy3OXGTP
 7E1UQhD+tNTgd4/FB1/YO5w4FK1MWQb8x2OjbxjLH+qE9KktHYjoMVIog7ckvBOQKcUZ
 J17q5XXcCg8KJ8rNJGOuqBvSeGNGznJFkjWpwfNVpalrykAdn4aWRUq0V54C2bkL5uk4
 EPfw==
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

SGkgU2FtLAoKPiBBbSAxNy4wNy4yMDE5IHVtIDIwOjE0IHNjaHJpZWIgU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPjoKPiAKPiBIaSBOaWtvbGF1cy4KPiAKPj4+Pj4+IEJUVzogc2hvdWxk
IGFsc28gYmUgYXBwbGllZCB0byA1LjIKPj4+Pj4gVGhlIGRybSBiaXRzIGFyZSByZXZpZXdlZC4g
VGhlIERUIGJpdHMgbmVlZHMgT0sgZnJvbSBEVCBwZW9wbGUuCj4+Pj4+IFdoZW4gd2UgaGF2ZSBP
SyBmcm9tIERUIHBlb3BsZSB3ZSBjYW4gYXBwbHkgdGhlbSBhbGwgdG8gZHJtLW1pc2MtbmV4dC4K
Pj4+PiAKPj4+PiBJIGdvdCBPSyBvbiBpcmMgZnJvbSBSb2IgdG8gcHJvY2VzcyB0aGVzZS4KPj4+
PiBBbGwgcGF0Y2hlcyBhcmUgbm93IGFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dC4KPj4+IAo+Pj4g
VGhhbmtzIGZvciB0YWtpbmcgY2FyZSBvZiB0aGlzIQo+PiAKPj4gSSBoYXZlIGNoZWNrZWQgYnV0
IGl0IHNlZW1zIHRoZXkgYXJlIHN0aWxsIG5vdCBtZXJnZWQgaW50byBsaW51eC1uZXh0Lgo+IAo+
IFRoZXkgd2lsbCBhcHBlYXIgaW4gbmV4dCBtZXJnZSB3aW5kb3cuIFRoZXkgd2VyZSB0byBsYXRl
IHRvIGhpdCBjdXJyZW50Cj4gbWVyZ2Ugd2luZG93LCBhcyB0aGUgY3V0LW9mIHRpbWUgaXMgYXJv
dW5kIC5yYzUgaW4gdGhlIGRybSBzdWJzeXN0ZW0uCj4gQW5kIHRoaXMgaXMgbm90IHJlYWxseSBh
IGZpeCBzbyBub3Qgc3RhYmxlIG1hdGVyaWFsLgoKaGF2ZSBmaW5hbGx5IGFycml2ZWQuIEkganVz
dCB3YXNuJ3QgcGF0aWVudCBlbm91Z2ggOikKCkJSIGFuZCB0aGFua3MsCk5pa29sYXVzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
