Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6D0265D5
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387CB89AC3;
	Wed, 22 May 2019 14:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 11968 seconds by postgrey-1.36 at gabe;
 Mon, 20 May 2019 11:10:58 UTC
Received: from 20.mo6.mail-out.ovh.net (20.mo6.mail-out.ovh.net
 [178.32.124.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547E388FE2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 11:10:58 +0000 (UTC)
Received: from player760.ha.ovh.net (unknown [10.109.160.40])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id F244E1CBF82
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 09:34:09 +0200 (CEST)
Received: from armadeus.com (lfbn-1-7591-179.w90-126.abo.wanadoo.fr
 [90.126.248.179])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player760.ha.ovh.net (Postfix) with ESMTPSA id 064FF5F24312;
 Mon, 20 May 2019 07:33:54 +0000 (UTC)
Subject: Re: [PATCH RE-RESEND 1/2] drm/panel: Add support for Armadeus ST0700
 Adapt
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190507152713.27494-1-sebastien.szymanski@armadeus.com>
 <CAOMZO5B2nMsVNO6O_D+YTSjux=-DjNPGxhkEi3AQquOZVODumA@mail.gmail.com>
 <20190507161950.GA24879@ravnborg.org>
 <20190508083303.GR17751@phenom.ffwll.local>
 <20190508090612.GT17751@phenom.ffwll.local>
From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Openpgp: preference=signencrypt
Message-ID: <0c5d70db-e7c1-5d02-9c33-65dabd431a68@armadeus.com>
Date: Mon, 20 May 2019 09:34:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508090612.GT17751@phenom.ffwll.local>
Content-Language: en-US
X-Ovh-Tracer-Id: 6372874948130854140
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddtjedguddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:25 +0000
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
 Shawn Guo <shawnguo@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 stable <stable@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gU2FtLAoKT24gNS84LzE5IDExOjA2IEFNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9u
IFdlZCwgTWF5IDA4LCAyMDE5IGF0IDEwOjMzOjAzQU0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3Jv
dGU6Cj4+IE9uIFR1ZSwgTWF5IDA3LCAyMDE5IGF0IDA2OjE5OjUwUE0gKzAyMDAsIFNhbSBSYXZu
Ym9yZyB3cm90ZToKPj4+IEhpIEZhYmlvCj4+Pgo+Pj4gT24gVHVlLCBNYXkgMDcsIDIwMTkgYXQg
MTI6MzM6MzlQTSAtMDMwMCwgRmFiaW8gRXN0ZXZhbSB3cm90ZToKPj4+PiBbQWRkaW5nIFNhbSwg
d2hvIGlzIGhlbHBpbmcgdG8gcmV2aWV3L2NvbGxlY3QgcGFuZWwtc2ltcGxlIHBhdGNoZXNdCj4+
Pj4KPj4+PiBPbiBUdWUsIE1heSA3LCAyMDE5IGF0IDEyOjI3IFBNIFPDqWJhc3RpZW4gU3p5bWFu
c2tpCj4+Pj4gPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPiB3cm90ZToKPj4+Pj4K
Pj4+Pj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHRoZSBBcm1hZGV1cyBTVDA3MDAgQWRh
cHQuIEl0IGNvbWVzIHdpdGggYQo+Pj4+PiBTYW50ZWsgU1QwNzAwSTVZLVJCU0xXIDcuMCIgV1ZH
QSAoODAweDQ4MCkgVEZUIGFuZCBhbiBhZGFwdGVyIGJvYXJkIHNvCj4+Pj4+IHRoYXQgaXQgY2Fu
IGJlIGNvbm5lY3RlZCBvbiB0aGUgVEZUIGhlYWRlciBvZiBBcm1hZGV1cyBEZXYgYm9hcmRzLgo+
Pj4+Pgo+Pj4+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIHY0LjE5Cj4+Pj4+IFJldmll
d2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+
Cj4+PiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+Pj4KPj4+
IElmIHlvdSB3aWwgbHJlc2VuZCB0aGUgcGF0Y2ggSSBjYW4gYXBwbHkgaXQuCj4+PiBJIGhhdmUg
bG9zdCB0aGUgb3JpZ2luYWwgbWFpbC4KPj4KPj4gVXN1YWxseSBwYXRjaHdvcmsgc2hvdWxkIGhh
dmUgaXQgYWxyZWFkeSAoYW5kIHlvdSBjYW4gcGlwZSB0aGUgcmF3Cj4+IHBhdGNod29yayBtYm94
IGludG8gZGltIGFwcGx5KSwgYnV0IHNvbWVob3cgaXQncyBub3QgdGhlcmUgZWl0aGVyLgo+PiBO
b3Qgc3VyZSB3aHksIHNvbWV0aW1lcyB0aGlzIGlzIGJlY2F1c2UgbWFpbHMgYXJlIHN0dWNrIGlu
IG1vZGVyYXRpb24sCj4+IHNvbWV0aW1lcyBiZWNhdXNlIHBlb3BsZSBkbyBpbnRlcmVzdGluZyB0
aGluZ3Mgd2l0aCB0aGVpciBtYWlscyAoZS5nLiBzbXRwCj4+IHNlcnZlcnMgbWFuZ2xpbmcgZm9y
bWF0dGluZykuCj4gCj4gcGF0Y2h3b3JrIHdhcyBqdXN0IGEgYml0IHNsb3csIGl0J3MgdGhlcmUg
bm93Ogo+IAo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjA0MDgv
Cj4gCgpXaWxsIHlvdSB0YWtlIHRoZSBwYXRjaCBmcm9tIHBhdGNod29yayBvciBzaG91bGQgSSBy
ZXNlbnQgaXQgPwoKUmVnYXJkcywKCj4gQ2hlZXJzLCBEYW5pZWwKPiAKCgotLSAKU8OpYmFzdGll
biBTenltYW5za2kKU29mdHdhcmUgZW5naW5lZXIsIEFybWFkZXVzIFN5c3RlbXMKVGVsOiArMzMg
KDApOSA3MiAyOSA0MSA0NApGYXg6ICszMyAoMCk5IDcyIDI4IDc5IDI2Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
