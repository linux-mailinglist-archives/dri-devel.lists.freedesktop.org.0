Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4C32A33A
	for <lists+dri-devel@lfdr.de>; Sat, 25 May 2019 08:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F401891C5;
	Sat, 25 May 2019 06:56:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BC0891C5
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2019 06:56:26 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3D13420096;
 Sat, 25 May 2019 08:56:23 +0200 (CEST)
Date: Sat, 25 May 2019 08:56:21 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Subject: Re: [PATCH RE-RESEND 1/2] drm/panel: Add support for Armadeus ST0700
 Adapt
Message-ID: <20190525065621.GC9586@ravnborg.org>
References: <20190507152713.27494-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190507152713.27494-1-sebastien.szymanski@armadeus.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=VwQbUJbxAAAA:8
 a=k4gcJ1N8AAAA:8 a=rQ_wcCec06wBi9E7-2gA:9 a=wPNLvfGTeEIA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=0EuUHwVWM4Mljrm1lpjw:22
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, stable@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMDcsIDIwMTkgYXQgMDU6Mjc6MTJQTSArMDIwMCwgU8OpYmFzdGllbiBTenlt
YW5za2kgd3JvdGU6Cj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHRoZSBBcm1hZGV1cyBT
VDA3MDAgQWRhcHQuIEl0IGNvbWVzIHdpdGggYQo+IFNhbnRlayBTVDA3MDBJNVktUkJTTFcgNy4w
IiBXVkdBICg4MDB4NDgwKSBURlQgYW5kIGFuIGFkYXB0ZXIgYm9hcmQgc28KPiB0aGF0IGl0IGNh
biBiZSBjb25uZWN0ZWQgb24gdGhlIFRGVCBoZWFkZXIgb2YgQXJtYWRldXMgRGV2IGJvYXJkcy4K
PiAKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIHY0LjE5Cj4gUmV2aWV3ZWQtYnk6IFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBT
enltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgoKVGhhbmtzLCBhcHBs
aWVkLgpPbmx5IHBhdGNoIDEvMiBhcHBsaWVkLCBhcyBwYXRjaCAyLzIgaXMgbWlzc2luZyByZXZp
ZXcuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
