Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D91828414
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 11:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4CA10E3AD;
	Tue,  9 Jan 2024 10:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC34410E3AD
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 10:37:09 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 409514fM024567; Tue, 9 Jan 2024 10:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-transfer-encoding:mime-version; s=
 qcppdkim1; bh=doZSVThDl+rEsM8+z088MTldxx8ituz61HC+0IA192U=; b=Fv
 ogehUSZpG3NNZwaWqgCqxvznFocUP5wTGcMbVO4Mzwm0m/LkOYp1COwzXbbP9d0X
 bsfDBFksud9JCrrn5Ui9uISzD3wOfepwgZv1D8j4VQb6iWa1rTig12anGbILYBN5
 o3YfDaKzOTdAgEK7VE5casq8tctZltrMUV+V9BO5LzUeF2DyWfKQJpP7CwyhnY1H
 BAckIXJyCgEKumByyH86NggP9Pxt6pQCHtjew3Ayi7nzSufUNBaxXtmlno1Haktg
 jKbF0X+MMFXm0ZcQrg+dk9Yx8mAYS+NEhzdiTFJ+Gru4LSbWDktPgkUhipgUqt1n
 aBqj2VzKuJHJ4V/vfnyg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vgwsjrsb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jan 2024 10:36:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 409AanMc025789
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 9 Jan 2024 10:36:49 GMT
Received: from nasanex01a.na.qualcomm.com (10.52.223.231) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 9 Jan 2024 02:36:47 -0800
Received: from nasanex01a.na.qualcomm.com ([fe80::5887:2b4f:ce74:2394]) by
 nasanex01a.na.qualcomm.com ([fe80::5887:2b4f:ce74:2394%12]) with mapi id
 15.02.1118.040; Tue, 9 Jan 2024 02:36:48 -0800
From: "Ritesh Kumar (QUIC)" <quic_riteshk@quicinc.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [v2 1/2] dt-bindings: display: panel: Add Novatek NT36672E LCD DSI
Thread-Topic: [v2 1/2] dt-bindings: display: panel: Add Novatek NT36672E LCD
 DSI
Thread-Index: AQHaQhlaWbCuVjlKVE28ed4o8u9QQrDQNvIAgAETHNA=
Date: Tue, 9 Jan 2024 10:36:48 +0000
Message-ID: <341a0546d52c43998bace0292b99ec4c@quicinc.com>
References: <20240108095902.22725-1-quic_riteshk@quicinc.com>
 <20240108095902.22725-2-quic_riteshk@quicinc.com>
 <4ca08b91-a950-43cc-946a-932afd855f9a@linaro.org>
In-Reply-To: <4ca08b91-a950-43cc-946a-932afd855f9a@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.204.67.124]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: paJe1E5CMyncrXs2NtbyauatnO_m0Szf
X-Proofpoint-ORIG-GUID: paJe1E5CMyncrXs2NtbyauatnO_m0Szf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 spamscore=0 impostorscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401090085
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "Rajeev Nandan \(QUIC\)" <quic_rajeevny@quicinc.com>, "Jessica Zhang
 \(QUIC\)" <quic_jesszhan@quicinc.com>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+U2VudDogTW9uZGF5LCBKYW51YXJ5
IDgsIDIwMjQgMzozOCBQTQ0KPlRvOiBSaXRlc2ggS3VtYXIgKFFVSUMpIDxxdWljX3JpdGVzaGtA
cXVpY2luYy5jb20+OyBkcmktDQo+ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+a2VybmVsQHZnZXIua2VybmVsLm9yZw0KPkNj
OiBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnOyBKZXNzaWNhIFpoYW5nIChRVUlDKQ0KPjxxdWlj
X2plc3N6aGFuQHF1aWNpbmMuY29tPjsgc2FtQHJhdm5ib3JnLm9yZzsNCj5tYWFydGVuLmxhbmto
b3JzdEBsaW51eC5pbnRlbC5jb207IG1yaXBhcmRAa2VybmVsLm9yZzsNCj50emltbWVybWFubkBz
dXNlLmRlOyBhaXJsaWVkQGdtYWlsLmNvbTsgZGFuaWVsQGZmd2xsLmNoOw0KPnJvYmgrZHRAa2Vy
bmVsLm9yZzsga3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnOyBjb25vcitkdEBrZXJu
ZWwub3JnOw0KPkFiaGluYXYgS3VtYXIgKFFVSUMpIDxxdWljX2FiaGluYXZrQHF1aWNpbmMuY29t
PjsgUmFqZWV2IE5hbmRhbiAoUVVJQykNCj48cXVpY19yYWplZXZueUBxdWljaW5jLmNvbT47IFZp
c2hudXZhcmRoYW4gUHJvZGR1dHVyaSAoUVVJQykNCj48cXVpY192cHJvZGR1dEBxdWljaW5jLmNv
bT47IHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnDQo+U3ViamVjdDogUmU6IFt2MiAxLzJdIGR0LWJp
bmRpbmdzOiBkaXNwbGF5OiBwYW5lbDogQWRkIE5vdmF0ZWsgTlQzNjY3MkUgTENEDQo+RFNJDQo+
DQo+T24gMDgvMDEvMjAyNCAxMDo1OSwgUml0ZXNoIEt1bWFyIHdyb3RlOg0KPj4gRG9jdW1lbnQg
Tm92YXRlayBOVDM2NjcyRSBGSEQrIExDRCBEU0kgcGFuZWwuDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogUml0ZXNoIEt1bWFyIDxxdWljX3JpdGVzaGtAcXVpY2luYy5jb20+DQo+Pg0KPj4gLS0tDQo+
PiB2MjogRml4ZWQgcmV2aWV3IGNvbW1lbnRzIGZyb20gS3J6eXN6dG9mDQo+DQo+UGxlYXNlIHVz
ZSBzdGFuZGFyZCBlbWFpbCBzdWJqZWN0cywgc28gd2l0aCB0aGUgUEFUQ0gga2V5d29yZCBpbiB0
aGUgdGl0bGUuIGBnaXQNCj5mb3JtYXQtcGF0Y2hgIGhlbHBzIGhlcmUgdG8gY3JlYXRlIHByb3Bl
ciB2ZXJzaW9uZWQgcGF0Y2hlcy4NCj5Bbm90aGVyIHVzZWZ1bCB0b29sIGlzIGI0LiBTa2lwcGlu
ZyB0aGUgUEFUQ0gga2V5d29yZCBtYWtlcyBmaWx0ZXJpbmcgb2YgZW1haWxzDQo+bW9yZSBkaWZm
aWN1bHQgdGh1cyBtYWtpbmcgdGhlIHJldmlldyBwcm9jZXNzIGxlc3MgY29udmVuaWVudC4NCg0K
SSBhbSB1c2luZyBnaXQgZm9ybWF0LXBhdGNoIG9ubHkuIEkgdGhpbmsgdGhlIG5hbWUgb2Ygc2Vy
aWVzIGlzIGNoYW5nZWQgY2F1c2luZyB0aGUgdHJvdWJsZS4NCg0KPg0KPj4gICAgICAgLSByZW5h
bWVkIHRvIG5vdmF0ZWssbnQzNjY3MmUsIHNpbmNlIHRoZSBiaW5kaW5nIGlzIGZvciB0aGUgSUMg
YW5kDQo+PiAgICAgICAgIG5vdCB0aGUgcGFuZWwuDQo+PiAgICAgICAtIG1vdmVkIGFkZGl0aW9u
YWxQcm9wZXJ0aWVzIGFmdGVyIHJlcXVpcmVkLg0KPj4gLS0tDQo+PiAgLi4uL2Rpc3BsYXkvcGFu
ZWwvbm92YXRlayxudDM2NjcyZS55YW1sICAgICAgIHwgNjYgKysrKysrKysrKysrKysrKysrKw0K
Pj4gIDEgZmlsZSBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspDQo+PiAgY3JlYXRlIG1vZGUgMTAw
NjQ0DQo+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9u
b3ZhdGVrLG50MzY2NzJlLnlhbWwNCj4+DQo+PiBkaWZmIC0tZ2l0DQo+Pg0KPmEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbm92YXRlayxudDM2NjcyZS55
YW0NCj4+IGwNCj4+DQo+Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9ub3ZhdGVrLG50MzY2NzJlLnlhbQ0KPj4gbA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZGM0NjcyZjNkMDFkDQo+PiAtLS0gL2Rldi9udWxs
DQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5l
bC9ub3ZhdGVrLG50MzY2NzJlDQo+PiArKysgLnlhbWwNCj4+IEBAIC0wLDAgKzEsNjYgQEANCj4+
ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNl
ICVZQU1MIDEuMg0KPj4gKy0tLQ0KPj4gKyRpZDoNCj4+ICtodHRwOi8vZGV2aWNldHJlZS5vcmcv
c2NoZW1hcy9kaXNwbGF5L3BhbmVsL25vdmF0ZWssbnQzNjY3MmUueWFtbCMNCj4+ICskc2NoZW1h
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4+ICsNCj4+
ICt0aXRsZTogTm92YXRlayBOVDM2NjcyRSBMQ0QgRFNJIFBhbmVsDQo+PiArDQo+PiArbWFpbnRh
aW5lcnM6DQo+PiArICAtIFJpdGVzaCBLdW1hciA8cXVpY19yaXRlc2hrQHF1aWNpbmMuY29tPg0K
Pj4gKw0KPj4gK2FsbE9mOg0KPj4gKyAgLSAkcmVmOiBwYW5lbC1jb21tb24ueWFtbCMNCj4+ICsN
Cj4+ICtwcm9wZXJ0aWVzOg0KPj4gKyAgY29tcGF0aWJsZToNCj4+ICsgICAgY29uc3Q6IG5vdmF0
ZWssbnQzNjY3MmUNCj4+ICsNCj4+ICsgIHJlZzoNCj4+ICsgICAgbWF4SXRlbXM6IDENCj4+ICsg
ICAgZGVzY3JpcHRpb246IERTSSB2aXJ0dWFsIGNoYW5uZWwNCj4+ICsNCj4+ICsgIHZkZGktc3Vw
cGx5OiB0cnVlDQo+PiArICBhdmRkLXN1cHBseTogdHJ1ZQ0KPj4gKyAgYXZlZS1zdXBwbHk6IHRy
dWUNCj4NCj5BcmUgdGhlc2UgbmFtZXMgb2YgcGlucz8gU29tZWhvdyBJIGhhdmUgdHJvdWJsZXMg
YmVsaWV2aW5nIHRoYXQgTlQzNjY3MkENCj5hbmQgTlQzNjY3MkUgaGF2ZSBlbnRpcmVseSBkaWZm
ZXJlbnQgbmFtZXMgZm9yIHRoZXNlLi4uDQoNClllcywgdGhlc2UgYXJlIG5hbWUgb2YgcGlucy4N
Cg0KQmVsb3cgaXMgdGhlIFBpbiBEZXNjcmlwdGlvbiBmcm9tIE5UMzY2NzJFIERhdGFzaGVldDoN
Cg0KdmRkaSAtIFBvd2VyIHN1cHBseSB0byB0aGUgSS9PLg0KYXZkZCAtIFBvc2l0aXZlIGlucHV0
IGFuYWxvZyBwb3dlciBmb3IgZHJpdmVyIElDIHVzZS4NCmF2ZWUgLSBOZWdhdGl2ZSBpbnB1dCBh
bmFsb2cgcG93ZXIgZm9yIGRyaXZlciBJQyB1c2UuDQoNCkkgY291bGQgbm90IGZpbmQgZGF0YXNo
ZWV0IG9mIE5UMzY2NzJBIG9ubGluZSB0byBjb21wYXJlICB0aGUgbmFtZXMuDQoNClRoYW5rcywN
ClJpdGVzaA0K
