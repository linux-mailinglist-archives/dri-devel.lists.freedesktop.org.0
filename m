Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 647DE167AD
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 18:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598E46E7F6;
	Tue,  7 May 2019 16:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6772F6E7F6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 16:19:56 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 57E01803FE;
 Tue,  7 May 2019 18:19:52 +0200 (CEST)
Date: Tue, 7 May 2019 18:19:50 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH RE-RESEND 1/2] drm/panel: Add support for Armadeus ST0700
 Adapt
Message-ID: <20190507161950.GA24879@ravnborg.org>
References: <20190507152713.27494-1-sebastien.szymanski@armadeus.com>
 <CAOMZO5B2nMsVNO6O_D+YTSjux=-DjNPGxhkEi3AQquOZVODumA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5B2nMsVNO6O_D+YTSjux=-DjNPGxhkEi3AQquOZVODumA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=k4gcJ1N8AAAA:8
 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8 a=t7PmZwswHXuigcJotc4A:9
 a=wPNLvfGTeEIA:10 a=0EuUHwVWM4Mljrm1lpjw:22 a=AjGcO6oz07-iQ99wixmX:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 stable <stable@vger.kernel.org>,
 =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>,
 Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFiaW8KCk9uIFR1ZSwgTWF5IDA3LCAyMDE5IGF0IDEyOjMzOjM5UE0gLTAzMDAsIEZhYmlv
IEVzdGV2YW0gd3JvdGU6Cj4gW0FkZGluZyBTYW0sIHdobyBpcyBoZWxwaW5nIHRvIHJldmlldy9j
b2xsZWN0IHBhbmVsLXNpbXBsZSBwYXRjaGVzXQo+IAo+IE9uIFR1ZSwgTWF5IDcsIDIwMTkgYXQg
MTI6MjcgUE0gU8OpYmFzdGllbiBTenltYW5za2kKPiA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1h
ZGV1cy5jb20+IHdyb3RlOgo+ID4KPiA+IFRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZvciB0aGUg
QXJtYWRldXMgU1QwNzAwIEFkYXB0LiBJdCBjb21lcyB3aXRoIGEKPiA+IFNhbnRlayBTVDA3MDBJ
NVktUkJTTFcgNy4wIiBXVkdBICg4MDB4NDgwKSBURlQgYW5kIGFuIGFkYXB0ZXIgYm9hcmQgc28K
PiA+IHRoYXQgaXQgY2FuIGJlIGNvbm5lY3RlZCBvbiB0aGUgVEZUIGhlYWRlciBvZiBBcm1hZGV1
cyBEZXYgYm9hcmRzLgo+ID4KPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnICMgdjQuMTkK
PiA+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4gU2lnbmVk
LW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRl
dXMuY29tPgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKSWYg
eW91IHdpbCBscmVzZW5kIHRoZSBwYXRjaCBJIGNhbiBhcHBseSBpdC4KSSBoYXZlIGxvc3QgdGhl
IG9yaWdpbmFsIG1haWwuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
