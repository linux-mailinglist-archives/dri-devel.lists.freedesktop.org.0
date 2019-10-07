Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE11CF3D2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CEF6E279;
	Tue,  8 Oct 2019 07:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84C26E673
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 17:58:55 +0000 (UTC)
Received: from p200300ccff0a88001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff0a:8800:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1iHXHW-0003AN-Mp; Mon, 07 Oct 2019 19:58:51 +0200
Date: Mon, 7 Oct 2019 19:58:49 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [Letux-kernel] [PATCH 4/5] drm/panel: tpo-td028ttec1: Fix SPI
 alias
Message-ID: <20191007195849.72562d6b@aktux>
In-Reply-To: <20191007170801.27647-5-laurent.pinchart@ideasonboard.com>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
 <20191007170801.27647-5-laurent.pinchart@ideasonboard.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Tue, 08 Oct 2019 07:28:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1e9YvUYbHTjTGxx39yq/yhCu8wiFrtyzwxbNVNLjJyY=; b=j1EtwBtm0uFIGttHj8cdQknkyj
 +cyZXvo1tqqx4N2xvQ0/IVOWxxxQFYHR3dkEn53CD1pEdrQ/NtrGE51toLfobBxoR/YgJ99vwOznj
 +OK+D607QOIXfDgSOFE8m7CFKRI0fZGHkUSDvQEy2lo4ZbyjOAEc7VuDZGWa/eyYXe+8=;
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
Cc: Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Tony Lindgren <tony@atomide.com>, Jyri Sarha <jsarha@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, thierry.reding@gmail.com,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAgNyBPY3QgMjAxOSAyMDowODowMCArMDMwMApMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgoKPiBUaGUgcGFuZWwtdHBvLXRk
MDI4dHRlYzEgZHJpdmVyIGluY29ycmVjdGx5IGluY2x1ZGVzIHRoZSBPRiB2ZW5kb3IKPiBwcmVm
aXggaW4gaXRzIFNQSSBhbGlhcy4gRml4IGl0Lgo+IAo+IEZpeGVzOiA0MTViOGRkMDg3MTEgKCJk
cm0vcGFuZWw6IEFkZCBkcml2ZXIgZm9yIHRoZSBUb3Bwb2x5IFREMDI4VFRFQzEgcGFuZWwiKQo+
IFJlcG9ydGVkLWJ5OiBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGljby5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPgoKVGVzdGVkLWJ5OiBBbmRyZWFzIEtlbW5hZGUgPGFuZHJlYXNAa2VtbmFkZS5p
bmZvPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXRwby10ZDAyOHR0ZWMx
LmMgfCAzICstLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC10cG8tdGQw
Mjh0dGVjMS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXRwby10ZDAyOHR0ZWMxLmMK
PiBpbmRleCBkN2IyZTM0NjI2ZWYuLmYyYmFmZjgyN2Y1MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRkMDI4dHRlYzEuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC10cG8tdGQwMjh0dGVjMS5jCj4gQEAgLTM3NSw4ICszNzUsNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCB0ZDAyOHR0ZWMxX29mX21hdGNoW10gPSB7
Cj4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHRkMDI4dHRlYzFfb2ZfbWF0Y2gpOwo+ICAKPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBzcGlfZGV2aWNlX2lkIHRkMDI4dHRlYzFfaWRzW10gPSB7Cj4g
LQl7ICJ0cG8sdGQwMjh0dGVjMSIsIDB9LAo+IC0JeyAidG9wcG9seSx0ZDAyOHR0ZWMxIiwgMCB9
LAo+ICsJeyAidGQwMjh0dGVjMSIsIDAgfSwKPiAgCXsgLyogc2VudGluZWwgKi8gfQo+ICB9Owo+
ICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
