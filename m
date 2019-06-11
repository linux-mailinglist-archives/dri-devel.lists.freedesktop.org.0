Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AE73C5D7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 10:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4883E890D5;
	Tue, 11 Jun 2019 08:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net
 [194.109.24.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F389890D5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 08:21:31 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.252.75])
 by smtp-cloud8.xs4all.net with ESMTPA
 id ac1qhfdph41bFac1thCupM; Tue, 11 Jun 2019 10:21:30 +0200
Subject: Re: [PATCH 5/8] drivers: media: coda: fix warning same module names
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Matt Redfearn <matt.redfearn@thinci.com>,
 Anders Roxell <anders.roxell@linaro.org>
References: <20190606094722.23816-1-anders.roxell@linaro.org>
 <d6b79ee0-07c6-ad81-16b0-8cf929cc214d@xs4all.nl>
 <CADYN=9KY5=FzrkC7MKj9QnG-eM1NVuL00w8Xv4yU2r05rhr7WQ@mail.gmail.com>
 <c2ff2c77-5c14-4bc4-f59c-7012d272ec76@thinci.com>
 <1560240943.13886.1.camel@pengutronix.de>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <221c8ef8-7adc-4383-93c9-9031dca590f0@xs4all.nl>
Date: Tue, 11 Jun 2019 10:21:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1560240943.13886.1.camel@pengutronix.de>
Content-Language: en-US
X-CMAE-Envelope: MS4wfF4l958gFcXbV6p95xz+ivCMsV6s4588moNOs9xu2Iu97gq8E8gpQpJUwHv+LkhfdxwpeLJQXiKUx1AlyFqxgT1gA/7wWLItAOSIJiLQdmwKpWc+fKFG
 vgDVAUCC1cZ5stiYDkUqlh2EcAWqi7Md5RRcCmEXm+8tYSNg7ISwK4efXRTEoVW+I2hyFPVUagqURLbJjEHp7pP3NnPKy/31ZBETWX+oQtaxu1L/JuO7dgPf
 HnNSYxRiWghAhGKyI62h1BpN1w42uc7cQ/oXIBCiaAgS1eJcxOPiu326GTdnuN9Kx92iuMp7/n6vKpnBQPtR/qLOg8JPRgUhpRSa0zqt4djY9V5mQS96lJKz
 f2rH+YlTJL7CmaaSGOeTqdiUiT38QtxmsSL7i8X+kcrLMk/EcGT+tj0AQyDmDRjspjsgFZA1mSsLUsOkNUYiWkr+hdrd1GsXkgOz2PjXGTukYJzJeaQVoSqe
 d60XFTDTbLgStGivDZdX7UNH8PzRRVaOtyLSAG3t3AO+qlhY4dy4sxkZ8G/NhLkDqsMh8B71+/zBo8rSUSrq5M8ZXkCdaii8SMkssCHGQ6+Vv2FAY2I6fbmx
 Xid/liFV0KXCTUzeN7CzTYM4AAa46DnSAQ/0T1QT6pPbCpbK2gX/gZTvJ5cZgmWDrg8JOkBFjD+Pi1oWHQBsSHz6qibIVsZfsI/CgaK9NSRFtvTEp7ifwfAc
 geBvs8P2gZmQHGj8Ju+w+QrHQ+R3mvF8yzEKjhUR9xrQS/1pD8MRZy4EUvBFJgjuxT6so14qzZAOm+JHvhULAxlG6OPFrvg2ZpHhoUY47YPJbEiIBYIsv/IE
 teJbVQgtWRv9SBf2e6uP15ECcp65KaAsnUtq1UySLHJYiTXhfptY9WRsvCwbK5Ft3KwaiNCpmHGOE5Fhr8Y7ZrFIS081K3OeEhfJL6J0GJq9qc4QQKC02EFJ
 KKueZgpH2AuUJhfG/GxasVo2z5POtJFu7M6QSx11WjThU8995eci5lvaMj4+QzckJISsRw==
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
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lee Jones <lee.jones@linaro.org>, "marex@denx.de" <marex@denx.de>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "vivien.didelot@gmail.com" <vivien.didelot@gmail.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Networking <netdev@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 David Miller <davem@davemloft.net>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8xMS8xOSAxMDoxNSBBTSwgUGhpbGlwcCBaYWJlbCB3cm90ZToKPiBIaSwKPiAKPiBPbiBN
b24sIDIwMTktMDYtMTAgYXQgMTM6MTQgKzAwMDAsIE1hdHQgUmVkZmVhcm4gd3JvdGU6Cj4+Cj4+
IE9uIDEwLzA2LzIwMTkgMTQ6MDMsIEFuZGVycyBSb3hlbGwgd3JvdGU6Cj4+PiBPbiBUaHUsIDYg
SnVuIDIwMTkgYXQgMTI6MTMsIEhhbnMgVmVya3VpbCA8aHZlcmt1aWxAeHM0YWxsLm5sPiB3cm90
ZToKPj4+Pgo+Pj4+IE9uIDYvNi8xOSAxMTo0NyBBTSwgQW5kZXJzIFJveGVsbCB3cm90ZToKPj4+
Pj4gV2hlbiBidWlsZGluZyB3aXRoIENPTkZJR19WSURFT19DT0RBIGFuZCBDT05GSUdfQ09EQV9G
UyBlbmFibGVkIGFzCj4+Pj4+IGxvYWRhYmxlIG1vZHVsZXMsIHdlIHNlZSB0aGUgZm9sbG93aW5n
IHdhcm5pbmc6Cj4+Pj4+Cj4+Pj4+IHdhcm5pbmc6IHNhbWUgbW9kdWxlIG5hbWVzIGZvdW5kOgo+
Pj4+PiAgICBmcy9jb2RhL2NvZGEua28KPj4+Pj4gICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9j
b2RhL2NvZGEua28KPj4+Pj4KPj4+Pj4gUmV3b3JrIHNvIG1lZGlhIGNvZGEgbWF0Y2hlcyB0aGUg
Y29uZmlnIGZyYWdtZW50LiBMZWF2aW5nIENPREFfRlMgYXMgaXMKPj4+Pj4gc2luY2UgdGhhdHMg
YSB3ZWxsIGtub3duIG1vZHVsZS4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5kZXJzIFJv
eGVsbCA8YW5kZXJzLnJveGVsbEBsaW5hcm8ub3JnPgo+Pj4+PiAtLS0KPj4+Pj4gICBkcml2ZXJz
L21lZGlhL3BsYXRmb3JtL2NvZGEvTWFrZWZpbGUgfCA0ICsrLS0KPj4+Pj4gICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jb2RhL01ha2VmaWxlIGIvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9jb2RhL01ha2VmaWxlCj4+Pj4+IGluZGV4IDU0ZTlhNzNhOTJhYi4uNTg4ZTZi
ZjdjMTkwIDEwMDY0NAo+Pj4+PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NvZGEvTWFr
ZWZpbGUKPj4+Pj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jb2RhL01ha2VmaWxlCj4+
Pj4+IEBAIC0xLDYgKzEsNiBAQAo+Pj4+PiAgICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb25seQo+Pj4+Pgo+Pj4+PiAtY29kYS1vYmpzIDo9IGNvZGEtY29tbW9uLm8gY29kYS1i
aXQubyBjb2RhLWdkaS5vIGNvZGEtaDI2NC5vIGNvZGEtbXBlZzIubyBjb2RhLW1wZWc0Lm8gY29k
YS1qcGVnLm8KPj4+Pj4gK3ZpZGVvLWNvZGEtb2JqcyA6PSBjb2RhLWNvbW1vbi5vIGNvZGEtYml0
Lm8gY29kYS1nZGkubyBjb2RhLWgyNjQubyBjb2RhLW1wZWcyLm8gY29kYS1tcGVnNC5vIGNvZGEt
anBlZy5vCj4+Pj4+Cj4+Pj4+IC1vYmotJChDT05GSUdfVklERU9fQ09EQSkgKz0gY29kYS5vCj4+
Pj4+ICtvYmotJChDT05GSUdfVklERU9fQ09EQSkgKz0gdmlkZW8tY29kYS5vCj4+Pj4KPj4+PiBI
b3cgYWJvdXQgaW14LWNvZGE/IHZpZGVvLWNvZGEgc3VnZ2VzdHMgaXQgaXMgcGFydCBvZiB0aGUg
dmlkZW8gc3Vic3lzdGVtLAo+Pj4+IHdoaWNoIGl0IGlzbid0Lgo+Pj4KPj4+IEknbGwgcmVzZW5k
IGEgdjIgc2hvcnRseSB3aXRoIGlteC1jb2RhIGluc3RlYWQuCj4gCj4gSSdkIGJlIGluIGZhdm9y
IG9mIGNhbGxpbmcgaXQgImNvZGEtdnB1IiBpbnN0ZWFkLgoKRmluZSBieSBtZSEKCj4gCj4+IFdo
YXQgYWJvdXQgb3RoZXIgdmVuZG9yIFNvQ3MgaW1wbGVtZW50aW5nIHRoZSBDb2RhIElQIGJsb2Nr
IHdoaWNoIGFyZSAKPj4gbm90IGFuIGlteD8gSSdkIHByZWZlciBhIG1vcmUgZ2VuZXJpYyBuYW1l
IC0gbWF5YmUgbWVkaWEtY29kYS4KPiAKPiBSaWdodCwgdGhpcyBkcml2ZXIgY2FuIGJlIHVzZWQg
b24gb3RoZXIgU29DcyBbMV0uCgpHb29kIHBvaW50LgoKUmVnYXJkcywKCglIYW5zCgo+IAo+IFsx
XSBodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL2xpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9y
Zy9tc2cxNDY0OTguaHRtbAo+IAo+IHJlZ2FyZHMKPiBQaGlsaXBwCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
