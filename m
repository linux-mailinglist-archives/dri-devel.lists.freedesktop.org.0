Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA977E366C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 09:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D63710E4C3;
	Tue,  7 Nov 2023 08:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2042.outbound.protection.outlook.com [40.107.22.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7847210E4C3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 08:12:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i27dwTTKzmatWHZc8qFVTf/4nWi4hkfJ7rNFJh1AkFcUL957vYDYjvQF3UOvTTZ7M+nbkkjOy3eGLA5LNsxwaC22y0eaQwoMOnmtF0g6Nu7H2zH6/dXZFHprtSW7xQZFcN5iclUPLC/BDgaMu0Wv8qqVNzkxHer44ywtZkSMHLJYGwyIq3iMTr6YI8EXzTzCGVq6VPtCtqW5UrteD/7HJWVwDPZdVH/0GbQcvLLAIIJ1Pt8v9jLrlfpOtgNbalgO48KCjKxkYgxMJwl1XtVqiJAIcZvpm9oVLW9ne6TrBlqQaJKrqRVdoKhxKDiB9pLKYfk3Od7R+GuOn2Ct6aLq9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8I0NZk5+3zv84e60dPmMmd5Gt2hUxfQ4WUPlsJaids=;
 b=VCkS9MKt2oWJEdQBZeeom8BxgnrtSrxe48YvOa91MG8f6pIPam6iSsfC81HKln+sQ4ogBng2B/gNTnmRm3/Eq8CtQaDfYnGIV2xeCUcH/xEmDI047VubOi4RBMwWg4FqNcc10oTdS6Pkyr9Q1DyVdjAKbQP1yYwrV+pSZZ8WJXxTD6E/emYhoKATuyA+ICjJ95+30her6QHXA+2rW0S0GcfnUmXMCHajUjoUZWtChsiXY9yd9VbEdRjCUEZ8447+h6Gw4BEW4kdgSy2M+Alq8VK6zraHQXHntV26yLdqDTWTaTP/9Vu1RKfSQgi9JAWT9rhtWpydbj2D7M841b6ZVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8I0NZk5+3zv84e60dPmMmd5Gt2hUxfQ4WUPlsJaids=;
 b=OgJEyTjV6L/KxTN9d1h6ayWbFF7x+WGIByImd29kSVFFZUXjuc/fCalXyeTtQKZHxkHy4yqZxdnNu9G4mOgy+LSMtoDjTbxaJcZzgTlhmjS/60K6MiaXmamR1XZQAAhPIiXcaP6lG1mjEf1DVSJ3e75YnpkOxs4fJYRRNP0QDAM6U9vqPYhu9PB47grzdA7WTlDt+AOCanbn/hCd/T3hNRmKtIzuABL9ejINBfAyD7n7jb/Ke7JvXKL8bzagSPapR//S/4OhiZoOT8RfXTj8iUA+8pnFg1W769L34IjtsP+liF7w0moutMjkEGBne9b1A+0U9hDanzgwG6gUULNR9w==
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:423::12)
 by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 08:12:48 +0000
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2a47:ee6d:baa2:9f1]) by DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2a47:ee6d:baa2:9f1%5]) with mapi id 15.20.6954.027; Tue, 7 Nov 2023
 08:12:47 +0000
From: "Jonas Mark (BT-FS/ENG1-GRB)" <Mark.Jonas@de.bosch.com>
To: Doug Anderson <dianders@chromium.org>
Subject: AW: drm/panel: panel-simple power-off sequencing
Thread-Topic: drm/panel: panel-simple power-off sequencing
Thread-Index: AdoIGZn+78j/WD9uTEuaO26ZQdjdBAAPsJUAAB5CrBAABDvCAAIA2huAABmhXdA=
Date: Tue, 7 Nov 2023 08:12:47 +0000
Message-ID: <DU0PR10MB7076A69167409EDE4B6A2EF8ADA9A@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
References: <DU0PR10MB7076C5C33C4F3E9097E372E7ADDDA@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
 <CAD=FV=XafnQy0Tg_pSvarNmsFX-mkFq0abYipkAm+28wr+byrw@mail.gmail.com>
 <DU0PR10MB707649F0596653D2B16D6AB9ADDCA@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
 <CAD=FV=WF3cU_f8UoUj3gWqnnL8QDy2tBuLqxc=81enCFAKjyUw@mail.gmail.com>
 <CAD=FV=XeEGAKNsxLuwzheOn7ieftNC-zoQtxopxJ3NdHJ3k4vw@mail.gmail.com>
In-Reply-To: <CAD=FV=XeEGAKNsxLuwzheOn7ieftNC-zoQtxopxJ3NdHJ3k4vw@mail.gmail.com>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR10MB7076:EE_|PA4PR10MB5681:EE_
x-ms-office365-filtering-correlation-id: ebab523b-15c4-41d2-7571-08dbdf695419
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YQOMEjFGIOBoZRLGYFt53wNMbEoTcAWr4wKS67YO5P79qApMEphEtJkAwuW8aCzclHO/p/c+MlD9daqkLmn5ckWVR0Vqt1YzAv+4FST3kIKYM+DihtmMHctVmZswj6unrz52vqDQdMDWpcKw7fnrN7sMBZWUZaQmfJjbrbnXuewM7UZL5wtGDAFpiBXjU76lS/G2PnlyI7t0oetWybeFTh1s7qOgX7J58TzwLu6fq611vq4N/4QYXct/Hws03UxXcxrF6yXvmnww+XM8SlQy+kEKqRTGNXGn0ncbr37IQ9qzIy7sodGLVA4sGQ8NKRweHuzXZ/8I41uokeLMDIsbQ+DNIGlaId+LQ6CrNSj5lATv4X5dcn0xbT+DF1z3alc78l0qLMSbzFTqC0amUKynL2nhG7Ln1y7dQL8TreqojfsR/CgKCln0O9NagPhAOb8mC/JcvtqQLMYtCBVnhEcQSEYP4u92IPjAUSPa4ruQqksfQmMVveovpywoiWpyjvLC1lVxczbcGa8is750Cg1g31TDMKp3SoQcHqCOcinO1zmL2CGKY8ZoYncSpQ5Z0tELwd1uHH0MqFkK2bMVGK50kvPMIqt4xIlohqttFzkCCX8lrxbg40t8nwj/zpwZs5MI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(366004)(39860400002)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(478600001)(9686003)(41300700001)(7696005)(6506007)(71200400001)(316002)(4326008)(52536014)(66476007)(8936002)(8676002)(2906002)(5660300002)(66556008)(64756008)(26005)(76116006)(66446008)(66946007)(6916009)(54906003)(38100700002)(122000001)(86362001)(82960400001)(33656002)(55016003)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWhoSE9JaHRmVXZqTis2SDNMYms1WVVtZHdRaVRkSmtsRjc4MW1kTGQzUTVJ?=
 =?utf-8?B?MDRhVzRlM0xwTVBHMWhSRnV4T3cvdUVzdDQ5QXhHRmlrS2U4NUx6Q0kyR2gr?=
 =?utf-8?B?a3oxV0dhQ0xjNGplbUMvYXlYYXhCdjkrMk01N2k1Zk03eU90cUtVbzRnd1h5?=
 =?utf-8?B?RkZBSCtXOVFYdlFXaFBlQVhVenFLZjM5TDZCek4xT3BxNGorVzV3L3RtSGwz?=
 =?utf-8?B?bnhZRUxRTFJLTzNFVVNaaitEamh5WWtNYThZR3VyYlFOK3IzY2F2bW9CRkk3?=
 =?utf-8?B?Vkp1eXNBS0tSWTVQQUFnYXZjZmRtZ1liSWZkRXVCcXR0OXhLc3ZoWU5xcGZI?=
 =?utf-8?B?TGV5TzZiamlYMmdHSlMzR2lOU3U5YnIxT0ppSy9YQ0tUNCtYV3l0Tkd5Nmty?=
 =?utf-8?B?ZTUreXd3L2xtTUxVR1lsN1E5V3BQSStBOWJMSjVNSnp6a2ZBOVljZ0VOUUFz?=
 =?utf-8?B?cXJCS1dRU0pVVDc5WHprT3VlYi9ieGFlVk9WTS9sUmM5OFJlenFyS1hBQjE2?=
 =?utf-8?B?Rm9OV0NpZUpEMlZkVTZ1MkxXazZNOWdhK2lHczVuY0NxWGNETCtkSlBIT203?=
 =?utf-8?B?N0pSb1ZVRStGQTVqWVY1djNJNGt6ZnhGdW85QkQxMGZVMjRsbmVIc3RmYzB6?=
 =?utf-8?B?aUhHSzVSeFpUVmxtVnNDNElzemZ2MTQ3b2FvUHdMUTQyRlR1V1FpQlN1ZVJs?=
 =?utf-8?B?bk94UjAzdi9vWVJLZkJaL0tEeCtsK1B5QVRpelN6eVVXNFdvWGdtSE0wTFRn?=
 =?utf-8?B?eHM5ZzFZT2t6NXZBb0VxaUR2UFNtYnhEbkRpdUUrTk9IcmRBV29JUS9oYjRo?=
 =?utf-8?B?K1B5WXZJblpveHVLVmtpTE8yMVpvVEJkd0lyQ2EzQ3dGU3AyRnpQeno1SjdJ?=
 =?utf-8?B?MzlqQ3BuZlA5RUdGMUVlYjlrR043VEVuSEtpU0dLcTA4alU1Skp3bVMrT29H?=
 =?utf-8?B?N0JzSjlEZ01nRjZhZkswcnJPdGtaS2Y2UWcrS3pDOVR2WVRvSU1oMWZnKy8r?=
 =?utf-8?B?bmNjdERvY3hjbmVuZmx6VVNqR1Y3eXRjdVpocWlHbnFxOFd2MFVHd3UvWHNm?=
 =?utf-8?B?VU9YMXZuRzBwdkdMei9JbEpsUWFpWktqM3NOWmlhQ1BTdnFNUmh2cjVBR293?=
 =?utf-8?B?cDdrUlJpMTl1RUFOYTJmc3BiK1NSenRLTUxPc1BmUDRnSk1QQWlaUFZOZDZO?=
 =?utf-8?B?Z0kzLzJqb0s2K0xYbGxpSnlpU0RRTlFMNmRCcmhxRnZCRmp2bW1kS2EwSnJV?=
 =?utf-8?B?T2dhUWdSdlEvWXNHQjZINjlmc1dIQnpqMmNscnhKYjlRWk1oSVIxV29xSi9w?=
 =?utf-8?B?ZEJWWU1Zc2szREhlaFBvZnpmdmtiaDFyVVVQKzh0bWg2RXhCODVXaGJFaVFH?=
 =?utf-8?B?Uy9Xc014bmsrZ2NxV1JKVXUyYSs4a2hTRFVKZWFtRW5HRHBWUFpaRUNtcUtE?=
 =?utf-8?B?UDNIU2FJajU0cTFNNnZxdndEcTFnVGhwNnZEL2V4WU9WcVFldldtZ1phbnNO?=
 =?utf-8?B?OTRTUzE2bitWSUVmNUtWSVNsWUxCS1J2RzVydWtCQ1pNTFBueHZKVFVUelln?=
 =?utf-8?B?S2o0ZFk5VWJXOHBsVmJoek80bXNqVm1HYjhYOUZkSWt0eHl2QXpZWTY4WWhm?=
 =?utf-8?B?eFRYUm1mWk03ZE9wamM4TkthaTBYY3BIVVEvTkI0WWlwRk9rYlNUQTQzWU9a?=
 =?utf-8?B?S3FscXhHeTlDOTFlN3Jub3JLUWdSYXdhc2doMmhZRGpIVytYQ0hkQUwvVUFL?=
 =?utf-8?B?RlU4VlJGc2pBQ00xek9mK1RyV0lxSnFCZ3pxZVVGdENHekFLS0tleW0yczF2?=
 =?utf-8?B?UHFqZElVY2ZHdWdoV2tQb0o0MWJ5ZE0zbE44YXhSeTcyY0hYSWhQVTc0OEFZ?=
 =?utf-8?B?eDAwMmVxTlpWN3ZhSHpGam1pdUVsdGVvb09nV0htQ2FVcFkxb2NPdjFkWXpJ?=
 =?utf-8?B?eE1UQnBCS2FNQW10NFcxYWFRVVpYNGNydmlRaDNDZ293UDN3eGs4QmhZemxU?=
 =?utf-8?B?eWo2UjZlRVl5WGNSRDJreVRuRGdCOFRoVDBWQTBEeDZlMFhiMzRlTml3M2xj?=
 =?utf-8?B?K0t2NUNlSFRXUS9wT0VKaUZlZml4OWxUUEpUekNXYk1JQWs4cE5vaEFzSUsz?=
 =?utf-8?Q?34Yo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ebab523b-15c4-41d2-7571-08dbdf695419
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 08:12:47.8459 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pxv66BCPZ1GxZLkUViZINqHEqFOpdd0NUrK+NwMU+Qv9vwuAh/9IqGL2xSGnOgYhM7gCbIt45k3nLlc0rW6R3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5681
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
Cc: David Airlie <airlied@linux.ie>, Mark Jonas <toertel@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "Simoes Ricardo \(BT-FS/ENG1.1-Ovr\)" <Ricardo.Simoes@pt.bosch.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG91ZywNCg0KPiA+IEkgZ3Vlc3MsIGluIHN1bW1hcnksIEknbSBob3BpbmcgeW91J2xsIGxv
b2sgYWdhaW4gYW5kIGZpbmQgdGhhdCB0aGlzDQo+ID4gcmVhbGx5IGlzIGEgYmFja2xpZ2h0IGVu
YWJsZS4gSWYgbm90LCBJJ2QgcHJvYmFibHkgYWR2b2NhdGUgZm9yIGENCj4gPiBwZXItcGFuZWwg
Ym9vbGVhbi4NCj4gDQo+IENpcmNsaW5nIGJhY2ssIEknbSBjdXJpb3VzIHdoYXQgZW5kZWQgdXAg
aGFwcGVuaW5nIGhlcmUuIERpZCB5b3UNCj4gZGVjaWRlIHRoYXQgaXQgYWN0dWFsbHkgd2FzIGEg
YmFja2xpZ2h0IGVuYWJsZSBHUElPLCBvciBhcmUgeW91DQo+IHBsYW5uaW5nIG9uIHNlbmRpbmcg
YSBwYXRjaD8NCg0KVGhhbmsgeW91IGZvciBjb21pbmcgYmFjayB0byB0aGlzIHRvcGljLg0KDQpX
ZSBhZ3JlZSB0aGF0IGxpbmtpbmcgdGhlIGVuYWJsZSBzaWduYWwgb2YgIm9sZCBzY2hvb2wiIHBh
cmFsbGVsIHBhbmVscyB3aXRoIHRoZSBlbmFibGUgb2YgdGhlIGJhY2tsaWdodCB3b3VsZCB3b3Jr
LiBXZSB0ZXN0ZWQgaXQgYW5kIGl0IHdvcmtzIHdpdGggb3VyIHBhbmVscy4NCg0KWWV0LCB3ZSBh
cmUgbm90IGNvbnZpbmNlZCB0aGF0IHRoZSBiYWNrbGlnaHQgaXMgcGFydCBvZiB0aGUgcGFuZWwu
IEFuZCB0aHVzLCBhcmNoaXRlY3R1cmFsbHksIHRoaXMgc2hvdWxkIGJlIGtlcHQgc2VwYXJhdGUu
IEZvciB1cywgYSBkaXNwbGF5IGlzIHRoZSBjb21iaW5hdGlvbiBvZiBhIGJhY2tsaWdodCBhbmQg
YSBwYW5lbC4NCg0KRm9yIGFkZGluZyBzdXBwb3J0IG9mIHRoZSBraW5kIG9mIGVuYWJsZSBzaWdu
YWwgcmVxdWlyZWQgZm9yIG91ciAib2xkIHNjaG9vbCIgcGFyYWxsZWwgcGFuZWxzIGludG8gcGFu
ZWwtc2ltcGxlIHdlIHNlZSB0aGUgZm9sbG93aW5nIHBvc3NpYmlsaXRpZXM6DQoNCi0gQWRkIGFu
b3RoZXIgR1BJTyB3aXRoIGEgdGlnaHQgY291cGxpbmcgdG8gdGhlIHByZXBhcmUgYW5kIHVucHJl
cGFyZSBzdGF0ZS4NCi0gQWRkIGEgZmxhZyB3aGljaCBzaWduYWxzIHRvIHByZXBhcmUvIHVucHJl
cGFyZSB0byBoYW5kbGUgdGhlIGV4aXN0aW5nIEdQSU8gc3luY2hyb25vdXNseS4NCg0KQnV0IHdl
IGFyZSBub3QgY29udmluY2VkIHRoYXQgdGhpcyBpcyBpbiB0aGUgc3Bpcml0IG9mIGEgcGFuZWwg
KnNpbXBsZSouIFNob3J0LXRlcm0gd2Ugd2lsbCBub3cgY3JlYXRlIG91ciBvd24gcGFuZWwgZHJp
dmVyIHdoaWNoIHdpbGwgc3VwcG9ydCBvdXIgcGFyYWxsZWwgcGFuZWxzLiBNaWQtdGVybSB3ZSB3
b3VsZCBsaWtlIHRvIHJldmlzaXQgdGhlIHRvcGljIGFuZCBob3BlZnVsbHkgY29tZSB1cCB3aXRo
IGEgcGF0Y2ggZm9yIHBhbmVsLXNpbXBsZS4NCg0KQ2hlZXJzLA0KTWFyaw0K
