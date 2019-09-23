Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6650BB196
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 11:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81496891FB;
	Mon, 23 Sep 2019 09:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2347 seconds by postgrey-1.36 at gabe;
 Mon, 23 Sep 2019 09:44:58 UTC
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669BA891FB
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 09:44:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8N8uoN6019132; Mon, 23 Sep 2019 11:05:40 +0200
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v5arhaawf-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 23 Sep 2019 11:05:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E191568;
 Mon, 23 Sep 2019 09:05:23 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14B452B186E;
 Mon, 23 Sep 2019 11:05:23 +0200 (CEST)
Received: from SFHDAG6NODE1.st.com (10.75.127.16) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 11:05:19 +0200
Received: from SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27]) by
 SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27%20]) with mapi id
 15.00.1473.003; Mon, 23 Sep 2019 11:05:19 +0200
From: Yannick FERTRE <yannick.fertre@st.com>
To: Markus Elfring <Markus.Elfring@web.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 =?utf-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Jernej Skrabec
 <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Matt Redfearn
 <matt.redfearn@thinci.com>, Neil Armstrong <narmstrong@baylibre.com>,
 "Nickey Yang" <nickey.yang@rock-chips.com>,
 Philippe CORNU <philippe.cornu@st.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm/bridge/synopsys: dsi: Use
 devm_platform_ioremap_resource() in __dw_mipi_dsi_probe()
Thread-Topic: [PATCH] drm/bridge/synopsys: dsi: Use
 devm_platform_ioremap_resource() in __dw_mipi_dsi_probe()
Thread-Index: AQHVcKlLK7VzSxkW4UqiudAOMZ7WUac42TGA
Date: Mon, 23 Sep 2019 09:05:19 +0000
Message-ID: <59343c81-3dd8-023c-6440-d48c8d74e05e@st.com>
References: <e0d7b7d7-3e89-8b3f-04ed-0b14806e66f7@web.de>
In-Reply-To: <e0d7b7d7-3e89-8b3f-04ed-0b14806e66f7@web.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-23_03:2019-09-23,2019-09-23 signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=STMicroelectronics;
 bh=/Hh/DjTUEzzdTpaKlDKsvrNg4NsvQhYhLVxRp0xcPPM=;
 b=PcMTBxKUsEWngN0F/fO3Hu4qoYboBfG1frA9oPdcpWidIdWVHw/yDfIulCOakBN1kOTq
 9ZLCkMG0OETLWnvku7S9DUyC/yMJ20bbfolWDsF8Xue/hTrMUQpXVorlPfnSxNNKBxfm
 4mVBbc1MNGb/VZKZASlQ2WW/TNVLafVviwDO7k+ByhABnMaZeokmGUW/oOwc2QKn+4jX
 RVZzjIRAlqiHMo6NKg/uyRFTj1G8Ge7GeGUPDEQl/8CNvfcsU/dApv4TZpQGRf1IWuB+
 hM7Vb17hifvSpvDXAsqBeZYez1eIV0Qk4hjmKT9Foaelci+TRvBUc+4975axOKOCcLgJ EQ== 
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0656671032=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0656671032==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_59343c813dd8023c6440d48c8d74e05estcom_"

--_000_59343c813dd8023c6440d48c8d74e05estcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UmV2aWV3ZWQtYnk6IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPjxtYWls
dG86eWFubmljay5mZXJ0cmVAc3QuY29tPg0KVGVzdGVkLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlh
bm5pY2suZmVydHJlQHN0LmNvbT48bWFpbHRvOnlhbm5pY2suZmVydHJlQHN0LmNvbT4NCg0KDQpC
ZXN0IHJlZ2FyZHMNCg0KLS0NCllhbm5pY2sgRmVydHLDqSB8IFRJTkE6IDE2NiA3MTUyIHwgVGVs
OiArMzMgMjQ0MDI3MTUyIHwgTW9iaWxlOiArMzMgNjIwNjAwMjcwDQpNaWNyb2NvbnRyb2xsZXJz
IGFuZCBEaWdpdGFsIElDcyBHcm91cCB8IE1pY3JvY29udHJvbGxldXJzIERpdmlzaW9uDQoNCg0K
T24gOS8yMS8xOSA4OjIwIFBNLCBNYXJrdXMgRWxmcmluZyB3cm90ZToNCg0KRnJvbTogTWFya3Vz
IEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PjxtYWlsdG86ZWxmcmluZ0B1
c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+DQpEYXRlOiBTYXQsIDIxIFNlcCAyMDE5IDIwOjA0OjA4ICsw
MjAwDQoNClNpbXBsaWZ5IHRoaXMgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24gYnkgdXNpbmcgYSBr
bm93biB3cmFwcGVyIGZ1bmN0aW9uLg0KDQpUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2lu
ZyB0aGUgQ29jY2luZWxsZSBzb2Z0d2FyZS4NCg0KU2lnbmVkLW9mZi1ieTogTWFya3VzIEVsZnJp
bmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PjxtYWlsdG86ZWxmcmluZ0B1c2Vycy5z
b3VyY2Vmb3JnZS5uZXQ+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3
LW1pcGktZHNpLmMgfCA3ICstLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDYgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LW1pcGktZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3
LW1pcGktZHNpLmMNCmluZGV4IDY3NTQ0MmJmYzFiZC4uNmFkYTE0OWFmOWVmIDEwMDY0NA0KLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jDQorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNpLmMNCkBAIC05ODEsNyAr
OTgxLDYgQEAgX19kd19taXBpX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
LA0KICAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KICAgICAgICBzdHJ1
Y3QgcmVzZXRfY29udHJvbCAqYXBiX3JzdDsNCiAgICAgICAgc3RydWN0IGR3X21pcGlfZHNpICpk
c2k7DQotICAgICAgIHN0cnVjdCByZXNvdXJjZSAqcmVzOw0KICAgICAgICBpbnQgcmV0Ow0KDQog
ICAgICAgIGRzaSA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqZHNpKSwgR0ZQX0tFUk5FTCk7
DQpAQCAtOTk3LDExICs5OTYsNyBAQCBfX2R3X21pcGlfZHNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYsDQogICAgICAgIH0NCg0KICAgICAgICBpZiAoIXBsYXRfZGF0YS0+YmFz
ZSkgew0KLSAgICAgICAgICAgICAgIHJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJ
T1JFU09VUkNFX01FTSwgMCk7DQotICAgICAgICAgICAgICAgaWYgKCFyZXMpDQotICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRU5PREVWKTsNCi0NCi0gICAgICAgICAgICAg
ICBkc2ktPmJhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCByZXMpOw0KKyAgICAgICAg
ICAgICAgIGRzaS0+YmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAw
KTsNCiAgICAgICAgICAgICAgICBpZiAoSVNfRVJSKGRzaS0+YmFzZSkpDQogICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRU5PREVWKTsNCg0KLS0NCjIuMjMuMA0KDQoNCg0K

--_000_59343c813dd8023c6440d48c8d74e05estcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <7162D186E80F9241AD65B5674BD918DF@st.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHRleHQ9IiMwMDAwMDAi
IGJnY29sb3I9IiNGRkZGRkYiPg0KPHA+PC9wPg0KPHByZT5SZXZpZXdlZC1ieTogWWFubmljayBG
ZXJ0csOpIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzp5YW5u
aWNrLmZlcnRyZUBzdC5jb20iPiZsdDt5YW5uaWNrLmZlcnRyZUBzdC5jb20mZ3Q7PC9hPiANClRl
c3RlZC1ieTogWWFubmljayBGZXJ0csOpIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUi
IGhyZWY9Im1haWx0bzp5YW5uaWNrLmZlcnRyZUBzdC5jb20iPiZsdDt5YW5uaWNrLmZlcnRyZUBz
dC5jb20mZ3Q7PC9hPiANCjwvcHJlPg0KPHA+QmVzdCByZWdhcmRzPC9wPg0KPHA+LS0gPGJyPg0K
WWFubmljayBGZXJ0csOpIHwgVElOQTogMTY2IDcxNTIgfCBUZWw6ICYjNDM7MzMgMjQ0MDI3MTUy
IHwgTW9iaWxlOiAmIzQzOzMzIDYyMDYwMDI3MDxicj4NCk1pY3JvY29udHJvbGxlcnMgYW5kIERp
Z2l0YWwgSUNzIEdyb3VwIHwgTWljcm9jb250cm9sbGV1cnMgRGl2aXNpb248L3A+DQo8cD48YnI+
DQo8L3A+DQo8ZGl2IGNsYXNzPSJtb3otY2l0ZS1wcmVmaXgiPk9uIDkvMjEvMTkgODoyMCBQTSwg
TWFya3VzIEVsZnJpbmcgd3JvdGU6PGJyPg0KPC9kaXY+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRl
IiBjaXRlPSJtaWQ6ZTBkN2I3ZDctM2U4OS04YjNmLTA0ZWQtMGIxNDgwNmU2NmY3QHdlYi5kZSI+
DQo8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPkZyb206IE1hcmt1cyBFbGZyaW5n
IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzplbGZyaW5nQHVz
ZXJzLnNvdXJjZWZvcmdlLm5ldCI+Jmx0O2VsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0Jmd0
OzwvYT4NCkRhdGU6IFNhdCwgMjEgU2VwIDIwMTkgMjA6MDQ6MDggJiM0MzswMjAwDQoNClNpbXBs
aWZ5IHRoaXMgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24gYnkgdXNpbmcgYSBrbm93biB3cmFwcGVy
IGZ1bmN0aW9uLg0KDQpUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2lu
ZWxsZSBzb2Z0d2FyZS4NCg0KU2lnbmVkLW9mZi1ieTogTWFya3VzIEVsZnJpbmcgPGEgY2xhc3M9
Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmVsZnJpbmdAdXNlcnMuc291cmNl
Zm9yZ2UubmV0Ij4mbHQ7ZWxmcmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQmZ3Q7PC9hPg0KLS0t
DQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jIHwgNyAmIzQz
Oy0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigmIzQzOyksIDYgZGVsZXRpb25z
KC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1p
cGktZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNpLmMN
CmluZGV4IDY3NTQ0MmJmYzFiZC4uNmFkYTE0OWFmOWVmIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jDQomIzQzOyYjNDM7JiM0MzsgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNpLmMNCkBAIC05ODEsNyAm
IzQzOzk4MSw2IEBAIF9fZHdfbWlwaV9kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldiwNCiAJc3RydWN0IGRldmljZSAqZGV2ID0gJmFtcDtwZGV2LSZndDtkZXY7DQogCXN0cnVj
dCByZXNldF9jb250cm9sICphcGJfcnN0Ow0KIAlzdHJ1Y3QgZHdfbWlwaV9kc2kgKmRzaTsNCi0J
c3RydWN0IHJlc291cmNlICpyZXM7DQogCWludCByZXQ7DQoNCiAJZHNpID0gZGV2bV9remFsbG9j
KGRldiwgc2l6ZW9mKCpkc2kpLCBHRlBfS0VSTkVMKTsNCkBAIC05OTcsMTEgJiM0Mzs5OTYsNyBA
QCBfX2R3X21pcGlfZHNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsDQogCX0N
Cg0KIAlpZiAoIXBsYXRfZGF0YS0mZ3Q7YmFzZSkgew0KLQkJcmVzID0gcGxhdGZvcm1fZ2V0X3Jl
c291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsNCi0JCWlmICghcmVzKQ0KLQkJCXJldHVy
biBFUlJfUFRSKC1FTk9ERVYpOw0KLQ0KLQkJZHNpLSZndDtiYXNlID0gZGV2bV9pb3JlbWFwX3Jl
c291cmNlKGRldiwgcmVzKTsNCiYjNDM7CQlkc2ktJmd0O2Jhc2UgPSBkZXZtX3BsYXRmb3JtX2lv
cmVtYXBfcmVzb3VyY2UocGRldiwgMCk7DQogCQlpZiAoSVNfRVJSKGRzaS0mZ3Q7YmFzZSkpDQog
CQkJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7DQoNCi0tDQoyLjIzLjANCg0KPC9wcmU+DQo8L2Js
b2NrcXVvdGU+DQo8ZGl2IGNsYXNzPSJtb3otc2lnbmF0dXJlIj48YnI+DQo8L2Rpdj4NCjwvYm9k
eT4NCjwvaHRtbD4NCg==

--_000_59343c813dd8023c6440d48c8d74e05estcom_--

--===============0656671032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0656671032==--
