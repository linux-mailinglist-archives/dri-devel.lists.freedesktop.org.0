Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A02B143F550
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 05:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CBC6E9B7;
	Fri, 29 Oct 2021 03:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952206E9B7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 03:21:33 +0000 (UTC)
X-UUID: 2dba88b38c3540438a28b88c24c76d01-20211029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xdv4d7nI1ycmG37vIm9TiH0S/IWUI0X7yItFKfzx29o=; 
 b=ec9wU3+U2HqXwLZ3JO/nhuOEoAo+/uXWyBjBe3Hz9+QBwADFgaTLl56tRDklyGRkCObIx/EvxNjgPoiTjf5eFUdvfY0oSX9a/KkL+e9MWyT/MKLowlQDHFmEmAs37retLDG1CgZ/pt3gVsIRQB7W4AmXoshgzbwu9TMFkxa2UWE=;
X-UUID: 2dba88b38c3540438a28b88c24c76d01-20211029
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 949362073; Fri, 29 Oct 2021 11:21:29 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Oct 2021 11:21:27 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 29 Oct 2021 11:21:26 +0800
Message-ID: <8101e4837f6a5530c491a426600a4bd3b77d6a86.camel@mediatek.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Irui Wang
 <irui.wang@mediatek.com>, linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 29 Oct 2021 11:21:26 +0800
In-Reply-To: <CAAEAJfD0=0zNOS8ydu-BwpdoCsADAjdpm1LXBzZ2T8D=JQmYtg@mail.gmail.com>
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
 <3b9463e88d88ce85205da08f8263252da7726ade.camel@mediatek.com>
 <aba7fb4ffe6e45ac90869b5017468386bce64d28.camel@mediatek.com>
 <b7ed8b71578a98704e9b8ca29cac63c67cc14b3f.camel@mediatek.com>
 <CAAEAJfCHEBFc8B7C0bu7UxtJdffvDarqgA-rset1wPjLOiV01A@mail.gmail.com>
 <b3fa00e8b66658e120279e37261cbdb5db7edf52.camel@mediatek.com>
 <CAAEAJfD0=0zNOS8ydu-BwpdoCsADAjdpm1LXBzZ2T8D=JQmYtg@mail.gmail.com>
Content-Type: multipart/alternative; boundary="=-nDDiQwBFMm8yoqKvjglO"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-nDDiQwBFMm8yoqKvjglO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgRXplcXVpZWwsDQoNClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLg0KDQpPbiBUaHUsIDIw
MjEtMTAtMTQgYXQgMDk6MzggLTAzMDAsIEV6ZXF1aWVsIEdhcmNpYSB3cm90ZToNCj4gSGkgWXVu
ZmVpLA0KPiANCj4gT24gVHVlLCAxMiBPY3QgMjAyMSBhdCAyMjoxNywgeXVuZmVpLmRvbmdAbWVk
aWF0ZWsuY29tDQo+IDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20+IHdyb3RlOg0KPiA+IEhpIEV6
ZXF1aWVsLA0KPiA+IA0KPiA+IFRoYW5rcyBmb3IgeW91ciBmZWVkYmFjaywNCj4gPiANCj4gPiBU
aGUgZHJpdmVyIGNhbiB3b3JrIHdlbGwgbm93IGFjY29yZGluZyB0byB5b3VyIGFkdmljZSB3aXRo
DQo+ID4gb2ZfcGxhdGZvcm1fcG9wdWxhdGUgaW50ZXJmYWNlLg0KPiA+IA0KPiA+IEluIG9yZGVy
IHRvIHNlcGFyYXRlIHBhcmVudCBub2RlIHdpdGggY2hpbGRyZW4gbm9kZSwgcGFyZW50IG5vZGUN
Cj4gPiBpcw0KPiA+IG1hc3RlciBkZXZpY2UsIGNoaWxkcmVuIG5vZGUgaXMgY29tcG9uZW50IGRl
dmljZS4NCj4gPiANCj4gPiBUaGUgbWFzdGVyIGFuZCBjb21wb25lbnQgYXJlIHJlZ2lzdGVyZWQg
cGxhdGZvcm0gZGV2aWNlLg0KPiA+IA0KPiA+IA0KPiA+IENvdWxkIHlvdSBwbGVhc2UgaGVscCB0
byByZXZpZXcgdGhlIHBhdGNoIGFnYWluIHdoZW4geW91IGFyZSBmcmVlOg0KPiA+IA0KPiA+IA0K
aHR0cHM6Ly9wYXRjaHdvcmsubGludXh0di5vcmcvcHJvamVjdC9saW51eC1tZWRpYS9jb3Zlci8y
MDIxMTAxMTA3MDI0Ny43OTItMS15dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20vDQo+ID4gDQo+IA0K
PiBJJ20gZ2xhZCB5b3UgbWFuYWdlZCB0byBzaW1wbGlmeSB0aGUgZHJpdmVyLiBJIHRyaWVkIGFw
cGx5aW5nIHRoZQ0KPiBwYXRjaGVzDQo+IGJ1dCB0aGV5IGRvbid0IGFwcGx5IG9uIG1lZGlhIG1h
c3Rlci4gUGxlYXNlIHB1c2ggYSBicmFuY2ggdG8gZ2l0bGFiDQo+IG9yIGdpdGh1Yg0KPiBvciBz
b21ld2hlcmUgcHVibGljLg0KPiANCj4gS2VlcCBpbiBtaW5kIHRoYXQgd2hlbiB5b3UgbmVlZCBw
ZW9wbGUgdG8gcmV2aWV3IHlvdXIgY29kZSwNCj4gaXQncyBnZW5lcmFsbHkgZ29vZCBwcmFjdGlj
ZSB0byB0cnkgdG8gbWFrZSBpdCBlYXN5IG9uIHRoZW0uDQo+IFRoZSBoYXJkZXIgeW91IG1ha2Ug
aXQsIHRoZSBsZXNzIGluY2xpbmVkIHBlb3BsZSB3aWxsIGJlIHRvDQo+IHNwZW5kIHRpbWUgb24g
eW91ciB3b3JrLg0KPiANCkkgd2lsbCBzZW5kIHRoZSBwYXRjaCB2OCBiYXNlIG9uIG1lZGlhIHRy
ZWUsIGFuZCBJIGFscmVhZHkgdGVzdCBpdCBpbg0KbXkgbG9jYWwgZW52aXJvbm1lbnQuDQpBbmQg
eW91IGNhbiBnZXQgbWVkaWFfdHJlZSB0aGVuIHN5bmMgcGF0Y2ggdjguDQoNCj4gVGhhbmtzLA0K
PiBFemVxdWllbA0KVGhhbmtzDQpZdW5mZWkgRG9uZw0K

--=-nDDiQwBFMm8yoqKvjglO
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgZGlyPSJsdHIiPjxoZWFkPjwvaGVhZD48Ym9keSBzdHlsZT0idGV4dC1hbGlnbjpsZWZ0
OyBkaXJlY3Rpb246bHRyOyI+PGRpdj5IaSBFemVxdWllbCw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2PlRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
T24gVGh1LCAyMDIxLTEwLTE0IGF0IDA5OjM4IC0wMzAwLCBFemVxdWllbCBHYXJjaWEgd3JvdGU6
PC9kaXY+PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4OyBi
b3JkZXItbGVmdDoycHggIzcyOWZjZiBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2PkhpIFl1
bmZlaSw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pk9uIFR1ZSwgMTIgT2N0IDIwMjEgYXQgMjI6
MTcsIDxhIGhyZWY9Im1haWx0bzp5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20iPnl1bmZlaS5kb25n
QG1lZGlhdGVrLmNvbTwvYT48L2Rpdj48ZGl2PiZsdDs8YSBocmVmPSJtYWlsdG86eXVuZmVpLmRv
bmdAbWVkaWF0ZWsuY29tIj55dW5mZWkuZG9uZ0BtZWRpYXRlay5jb208L2E+Jmd0OyB3cm90ZTo8
L2Rpdj48YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7IGJv
cmRlci1sZWZ0OjJweCAjNzI5ZmNmIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPjxkaXY+PGJyPjwv
ZGl2PjxkaXY+SGkgRXplcXVpZWwsPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MgZm9y
IHlvdXIgZmVlZGJhY2ssPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGUgZHJpdmVyIGNhbiB3
b3JrIHdlbGwgbm93IGFjY29yZGluZyB0byB5b3VyIGFkdmljZSB3aXRoPC9kaXY+PGRpdj5vZl9w
bGF0Zm9ybV9wb3B1bGF0ZSBpbnRlcmZhY2UuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JbiBv
cmRlciB0byBzZTxmb250IHNpemU9IjQiPjwvZm9udD5wYXJhdGUgcGFyZW50IG5vZGUgd2l0aCBj
aGlsZHJlbiBub2RlLCBwYXJlbnQgbm9kZSBpczwvZGl2PjxkaXY+bWFzdGVyIGRldmljZSwgY2hp
bGRyZW4gbm9kZSBpcyBjb21wb25lbnQgZGV2aWNlLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
VGhlIG1hc3RlciBhbmQgY29tcG9uZW50IGFyZSByZWdpc3RlcmVkIHBsYXRmb3JtIGRldmljZS48
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkNvdWxkIHlvdSBwbGVhc2Ug
aGVscCB0byByZXZpZXcgdGhlIHBhdGNoIGFnYWluIHdoZW4geW91IGFyZSBmcmVlOjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+PGEgaHJlZj0iaHR0cHM6Ly9wYXRjaHdvcmsubGludXh0di5vcmcv
cHJvamVjdC9saW51eC1tZWRpYS9jb3Zlci8yMDIxMTAxMTA3MDI0Ny43OTItMS15dW5mZWkuZG9u
Z0BtZWRpYXRlay5jb20vIj5odHRwczovL3BhdGNod29yay5saW51eHR2Lm9yZy9wcm9qZWN0L2xp
bnV4LW1lZGlhL2NvdmVyLzIwMjExMDExMDcwMjQ3Ljc5Mi0xLXl1bmZlaS5kb25nQG1lZGlhdGVr
LmNvbS88L2E+PC9kaXY+PGRpdj48YnI+PC9kaXY+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2
PjxkaXY+SSdtIGdsYWQgeW91IG1hbmFnZWQgdG8gc2ltcGxpZnkgdGhlIGRyaXZlci4gSSB0cmll
ZCBhcHBseWluZyB0aGUgcGF0Y2hlczwvZGl2PjxkaXY+YnV0IHRoZXkgZG9uJ3QgYXBwbHkgb24g
bWVkaWEgbWFzdGVyLiBQbGVhc2UgcHVzaCBhIGJyYW5jaCB0byBnaXRsYWIgb3IgZ2l0aHViPC9k
aXY+PGRpdj5vciBzb21ld2hlcmUgcHVibGljLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+S2Vl
cCBpbiBtaW5kIHRoYXQgd2hlbiB5b3UgbmVlZCBwZW9wbGUgdG8gcmV2aWV3IHlvdXIgY29kZSw8
L2Rpdj48ZGl2Pml0J3MgZ2VuZXJhbGx5IGdvb2QgcHJhY3RpY2UgdG8gdHJ5IHRvIG1ha2UgaXQg
ZWFzeSBvbiB0aGVtLjwvZGl2PjxkaXY+VGhlIGhhcmRlciB5b3UgbWFrZSBpdCwgdGhlIGxlc3Mg
aW5jbGluZWQgcGVvcGxlIHdpbGwgYmUgdG88L2Rpdj48ZGl2PnNwZW5kIHRpbWUgb24geW91ciB3
b3JrLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjwvYmxvY2txdW90ZT48ZGl2Pkkgd2lsbCBzZW5kIHRo
ZSBwYXRjaCB2OCBiYXNlIG9uIG1lZGlhIHRyZWUsIGFuZCBJIGFscmVhZHkgdGVzdCBpdCBpbiBt
eSBsb2NhbCBlbnZpcm9ubWVudC48L2Rpdj48ZGl2PkFuZCB5b3UgY2FuIGdldCBtZWRpYV90cmVl
IHRoZW4gc3luYyBwYXRjaCB2OC48L2Rpdj48ZGl2Pjxicj48L2Rpdj48YmxvY2txdW90ZSB0eXBl
PSJjaXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7IGJvcmRlci1sZWZ0OjJweCAjNzI5ZmNm
IHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPjxkaXY+VGhhbmtzLDwvZGl2PjxkaXY+RXplcXVpZWw8
L2Rpdj48L2Jsb2NrcXVvdGU+PGRpdj5UaGFua3M8L2Rpdj48ZGl2Pll1bmZlaSBEb25nPC9kaXY+
PC9ib2R5PjwvaHRtbD4NCg==

--=-nDDiQwBFMm8yoqKvjglO--

