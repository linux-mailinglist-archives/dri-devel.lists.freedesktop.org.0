Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D89757CE4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443B86E5DB;
	Thu, 27 Jun 2019 07:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB1D6E3F7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 12:41:02 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSUXA0Pfg=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
 with ESMTPSA id V09459v5QCepbN8
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Wed, 26 Jun 2019 14:40:51 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v3 0/5] drm/panel-simple: Add panel parameters for
 ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190626073350.GA15288@ravnborg.org>
Date: Wed, 26 Jun 2019 14:40:50 +0200
Message-Id: <CF1D9929-58D2-4E75-932A-870D11BBFBDE@goldelico.com>
References: <cover.1559905870.git.hns@goldelico.com>
 <0842FF88-D8E0-441B-837B-769C2EF6C1CB@goldelico.com>
 <20190625204356.GF18595@ravnborg.org> <20190626073350.GA15288@ravnborg.org>
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Thu, 27 Jun 2019 07:11:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1561552859; 
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=E23wCGPFOoYgw+3FSRZ9zJVg+DR9nmCJTrte3qyokfc=;
 b=QJNm8kjHFUXa8FUp4iFZXfyhQMBfw8PlyW9khizzY3MFRsVjmW3MZeLT38jEN5h6pU
 jbS6Oal3uecbBPjMF2bESNxUE8y7eoj8V2/b4HnMHFZHj08yZ+VIhTuNGiZRNc4AbmAh
 OtgA1dB/YwQdm6RVRc6KW2ub6RLh9CP9X6cvUadoreW1scI6U+xWQsndXL2OW2oqJd2s
 X9/BMOa1mWdZyonXgwg3kjzSqwb7RKkN41pB2tFl1oSJ/7ZcqL2oIMw/0SI/UxqlBunk
 EDlzocF5/Vz7HDjRXqXsAHJWrJe/om3UzoRhD4laysUq7meFWy+IGTmv49hJKLLaDfVu
 TlFw==
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
 devicetree <devicetree@vger.kernel.org>, letux-kernel@openphoenux.org,
 David Airlie <airlied@linux.ie>, marek.belisko@gmail.com,
 tomi.valkeinen@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKPiBBbSAyNi4wNi4yMDE5IHVtIDA5OjMzIHNjaHJpZWIgU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPjoKPiAKPiBIaSBOaWtvbGF1cy4KPiAKPj4+IAo+Pj4gYW55IHByb2dy
ZXNzIHRvd2FyZHMgbWVyZ2luZyB0aGlzIHNvbWV3aGVyZT8gSXQgZGlkIG5vdCB5ZXQgYXJyaXZl
IGluIGxpbnV4LW5leHQuCj4+PiAKPj4+IEJUVzogc2hvdWxkIGFsc28gYmUgYXBwbGllZCB0byA1
LjIKPj4gVGhlIGRybSBiaXRzIGFyZSByZXZpZXdlZC4gVGhlIERUIGJpdHMgbmVlZHMgT0sgZnJv
bSBEVCBwZW9wbGUuCj4+IFdoZW4gd2UgaGF2ZSBPSyBmcm9tIERUIHBlb3BsZSB3ZSBjYW4gYXBw
bHkgdGhlbSBhbGwgdG8gZHJtLW1pc2MtbmV4dC4KPiAKPiBJIGdvdCBPSyBvbiBpcmMgZnJvbSBS
b2IgdG8gcHJvY2VzcyB0aGVzZS4KPiBBbGwgcGF0Y2hlcyBhcmUgbm93IGFwcGxpZWQgdG8gZHJt
LW1pc2MtbmV4dC4KClRoYW5rcyBmb3IgdGFraW5nIGNhcmUgb2YgdGhpcyEKCj4gCj4gCVNhbQoK
QlIsCk5pa29sYXVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
