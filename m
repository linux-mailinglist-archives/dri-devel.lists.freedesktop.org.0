Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1504350F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 12:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E94898C7;
	Thu, 13 Jun 2019 10:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC65A898C7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 10:01:45 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:56354)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hbMY6-0002DN-H9; Thu, 13 Jun 2019 11:01:38 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hbMY5-00018D-4V; Thu, 13 Jun 2019 11:01:37 +0100
Date: Thu, 13 Jun 2019 11:01:37 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH 12/13] drm/i2c: tda998x: add bridge timing information
Message-ID: <20190613100136.krfozwahi3ca73li@shell.armlinux.org.uk>
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
 <E1haeXy-0001yu-1V@rmk-PC.armlinux.org.uk>
 <CAGngYiUMCY7Mx30jNxznrUqyPp4D98GJbMOjtoQBOE4qJqf96w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGngYiUMCY7Mx30jNxznrUqyPp4D98GJbMOjtoQBOE4qJqf96w@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7GKTHzI1uELWUyk3SvJEdoYl2txuf0RP6oGRJ7x3TuU=; b=rGYAOxwqEHlfgrKpaaBmVJdO2
 n9yOrg9n+gNjW69Xgr6zOm3HwIT5Ckj+ZyyswY1KEK3CZDGcGc/DHsBSHAN5RM4qe1telujpWkG/E
 ldFBQVRJZ5gpqqUrw8W6a6/+3yi5mF2t1JGh6fdDgeta52J+pPLzlUOp1Ps1am740SSBCdh1WP1Il
 0waRbe4WrsgOLn9vnwGKcyD8Cfs54gc4DrZ9yOjx/iX7a+vqheB0OyDhCbahiJcyvrUYLAjluAmXR
 38fpCSuqqB9M3LBMVtD6cOeNfdwkOSTQzJTMSNeAKl5EFS7FX2DRzE8VcDiYQcnW4Cj0Teu0FTRAf
 dNl9J1a6Q==;
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTE6Mzg6MDZBTSAtMDQwMCwgU3ZlbiBWYW4gQXNicm9l
Y2sgd3JvdGU6Cj4gT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNzowNCBBTSBSdXNzZWxsIEtpbmcg
PHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+Cj4gPiBBZGQgYnJpZGdlIHRp
bWluZyBpbmZvcm1hdGlvbiBzbyB0aGF0IGJyaWRnZSB1c2VycyBjYW4gZmlndXJlIG91dCB0aGUK
PiA+IHRpbWluZyBwYXJhbWV0ZXJzIHRoYXQgYXJlIG5lY2Vzc2FyeSBmb3IgVERBOTk4eC4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgPHJtaytrZXJuZWxAYXJtbGludXgub3Jn
LnVrPgo+ID4gLS0tCj4gCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2JyaWRnZV90aW1pbmdz
IHRkYTk5ODlfdGltaW5ncyA9IHsKPiArICAgICAgIC5zYW1wbGluZ19lZGdlID0gRFJNX0JVU19G
TEFHX1BJWERBVEFfUE9TRURHRSwKPiArICAgICAgIC5zZXR1cF90aW1lX3BzID0gMTUwMCwKPiAr
ICAgICAgIC5ob2xkX3RpbWVfcHMgPSAxMDAwLAo+ICt9Owo+ICsKPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBkcm1fYnJpZGdlX3RpbWluZ3MgdGRhMTk5ODhfdGltaW5ncyA9IHsKPiArICAgICAgIC5z
YW1wbGluZ19lZGdlID0gRFJNX0JVU19GTEFHX1BJWERBVEFfUE9TRURHRSwKPiArICAgICAgIC5z
ZXR1cF90aW1lX3BzID0gMTYwMCwKPiArICAgICAgIC5ob2xkX3RpbWVfcHMgPSAxMjAwLAo+ICt9
Owo+IAo+IE5lZWQgdG8gcG9ydCB0aGVzZSB0byA1LjEga2VybmVsOiBzYW1wbGluZ19lZGdlIC0+
IGlucHV0X2J1c19mbGFncyA/Cgo1LjEgc3RpbGwgaGFzIGl0IGFzICJzYW1wbGluZ19lZGdlIiwg
YnV0IDUuMi1yYyBjaGFuZ2VzIHRoaXMsIHNvCkknbGwgZHJvcCB0aGlzIHBhdGNoIGZyb20gdGhp
cyBzZXJpZXMgZm9yIG5vdy4gIFRoYW5rcyBmb3IgcG9pbnRpbmcKdGhhdCBvdXQuCgotLSAKUk1L
J3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3Bh
dGNoZXMvCkZUVEMgYnJvYWRiYW5kIGZvciAwLjhtaWxlIGxpbmUgaW4gc3VidXJiaWE6IHN5bmMg
YXQgMTIuMU1icHMgZG93biA2MjJrYnBzIHVwCkFjY29yZGluZyB0byBzcGVlZHRlc3QubmV0OiAx
MS45TWJwcyBkb3duIDUwMGticHMgdXAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
