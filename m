Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1751155C74
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 18:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13DD6EAF0;
	Fri,  7 Feb 2020 17:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70087.outbound.protection.outlook.com [40.107.7.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D91D6FA18
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 10:09:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrRAGS2izlhjDaffdyWBSVKc+5y6a/TCtUAfIwnya67Se77T+PQ577dv31r9hC6dC7NO0czeg9tPXmFwtsjhb7vo318MhbibGg3nWJDr5Bbdeu/inHMFSpLzUuARf0IgWSWjgqQaPeby7SIU/IR2ivA/E7lUypswEi4uII+6DB26xaD/fZQwGm75lm0IhF5YIXzpseJmMk34ruaSMKN2fwu5S4m4WON5LVXY5aiZ/bO2Kxqlf15OkN9wxIC4AMN92IiaDoqQJW/IHzjJOMTBOgSufCDyPEz58FPX8PalVviwnbyVExp55/fxvf116ygTQRFywIxEdn5izR9ueTe6JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqXQLsYJ66PInr8F0Ezon7XBH59VryLqYVZkeElj8Y4=;
 b=XCg2DDxkde0DoQ/AC9MYx9VDMPeVnlZY1kOVUnC2Q9od3OhcpEKYCTHtYlfkLAJp0LIgTjEYCd9H8WW/Mmfr9TO6O4mDWTvt1kQgVrDbhPybqZ5ZOKQVHXqM+9gM3oak7CFkkj4IJhTJ9rLG2LY/5c91ReJSH876khnz3brwviLyjZ6Zt8MRiITFi0ro2sLcMjmKFBrDnX8MugS70nPXoZlqVVNaSPwSblOzfDulzgL1KFk9sw8JjPzwW2g8MG68nLLXN4NZtggvIjdzYdxVaa/nfZ/GtZGuuZ+y8WoRlZNo2ySFHmd5Zl5rrZmXd+Cb0xHCsYd0wWYk/bxUdFhOBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nextfour.com; dmarc=pass action=none header.from=nextfour.com;
 dkim=pass header.d=nextfour.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NextfourGroupOy.onmicrosoft.com;
 s=selector2-NextfourGroupOy-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqXQLsYJ66PInr8F0Ezon7XBH59VryLqYVZkeElj8Y4=;
 b=b+euUG4HzzKX74d4ClFu1A5DJ54EnZq9gvAWN7Y7RuCXFoGWFtb3d11rKcd/XnFVVB6nvPPYW+72+29lyhWAECHRCcUU9P8nRDXeNyCvyrG/7w/0uxRGrqFlbcuLsjqvC2DMSu5UgbHmMyPeY14wlEaRiExcOKTyFviJzLlp4FQ=
Received: from VI1PR03MB3775.eurprd03.prod.outlook.com (52.134.21.155) by
 VI1PR03MB3839.eurprd03.prod.outlook.com (20.177.54.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Thu, 6 Feb 2020 10:09:54 +0000
Received: from VI1PR03MB3775.eurprd03.prod.outlook.com
 ([fe80::fdfe:b987:16ad:9de9]) by VI1PR03MB3775.eurprd03.prod.outlook.com
 ([fe80::fdfe:b987:16ad:9de9%5]) with mapi id 15.20.2686.031; Thu, 6 Feb 2020
 10:09:53 +0000
Received: from [10.10.10.144] (194.157.170.35) by
 HE1PR05CA0165.eurprd05.prod.outlook.com (2603:10a6:3:f8::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21 via Frontend Transport; Thu, 6 Feb 2020 10:09:53 +0000
From: =?utf-8?B?TWlrYSBQZW50dGlsw6Q=?= <mika.penttila@nextfour.com>
To: "hjc@rock-chips.com" <hjc@rock-chips.com>
Subject: rk3399 and two mipi dsi
Thread-Topic: rk3399 and two mipi dsi
Thread-Index: AQHV3NWTBshUNMErmk6gb8rnaFM/cA==
Date: Thu, 6 Feb 2020 10:09:53 +0000
Message-ID: <4e9435d6-876a-e0e4-f42f-d0de50d4086f@nextfour.com>
References: <2bf23a36-1b6c-c793-20f9-39aec71afc63@nextfour.com>
In-Reply-To: <2bf23a36-1b6c-c793-20f9-39aec71afc63@nextfour.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0165.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::13) To VI1PR03MB3775.eurprd03.prod.outlook.com
 (2603:10a6:803:2b::27)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mika.penttila@nextfour.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-pep-version: 2.0
x-originating-ip: [194.157.170.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b1335f8-f1a0-4dd0-45c6-08d7aaecb5a0
x-ms-traffictypediagnostic: VI1PR03MB3839:
x-microsoft-antispam-prvs: <VI1PR03MB3839E706BE8DDF2F081AA1C8831D0@VI1PR03MB3839.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0305463112
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39830400003)(396003)(346002)(376002)(136003)(189003)(199004)(71200400001)(66946007)(66616009)(66556008)(64756008)(66446008)(66476007)(54906003)(16526019)(31696002)(86362001)(8936002)(2906002)(508600001)(31686004)(6916009)(956004)(81166006)(52116002)(8676002)(2616005)(85182001)(316002)(6486002)(4744005)(26005)(186003)(36756003)(16576012)(5660300002)(4326008)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR03MB3839;
 H:VI1PR03MB3775.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nextfour.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M0JodbAgK9Ch9o58uZNt3bGhoy5JGqpazfDAiRpOekud978J5LAwT1yX7XEEexuBfpgA/i9SGiHm8/Q9CY3KiaL9MG7AmlMNC63WcddQmy5R8g4BFQMh62oBiqtUJQ5rDhZsOciVCoayv/ydf1FoIIhOsVkKMkkmLQ6+RSHi4eQA65pG/Ci290wQIFIU0l0XyVMmAgKd0v7mC0nCCEyY1e2NHtxIose55+LYNM6XFj/ftWcXguuVTBuk6If2gZxkwsfJjShMgQu4e3AxC+5rZS9fchS8LrIhwLHynEz12+9s3V9yYDG0jKM2A908arGMvdYECouqtbHIjoQN7mW5kyvJdtU153VNM0pg9vo1GxZJhTL2XvM0PwumDXN0KZ9kMwBD7PoFZMnGYmTrb7RgLD1N0zDnklP2EMBSOZm8v7qfuhojk2UuV7/J0NNAsgrj
x-ms-exchange-antispam-messagedata: DLZRWpc3NJW+BkZLdrbAKXUJdZnvBYma3fw86M7k52cp7s+iy24G2Dr/KmNUeHsz+mv6ngCLNHpBQIgTArVgDmklaMHz0RVOGW6VIhqLRU3je10Xy0eX1zNy88eW9sTURonUvkKYq/+Rakyx5ytuOQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_002_4e9435d6876ae0e4f42fd0de50d4086fnextfourcom_"
MIME-Version: 1.0
X-OriginatorOrg: nextfour.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1335f8-f1a0-4dd0-45c6-08d7aaecb5a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2020 10:09:53.6555 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 972e95c2-9290-4a02-8705-4014700ea294
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QoxaQ5AFQ/ESDRxhXbyzDSW0s5g4Ssijc4YfvCaw3EbErD+UWmSCKdomSkD7ytsaKEH7M1p0VATcpN5pcPurFW0E4WCbKLqjXAz719u6tnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3839
X-Mailman-Approved-At: Fri, 07 Feb 2020 17:01:42 +0000
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
Cc: "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_002_4e9435d6876ae0e4f42fd0de50d4086fnextfourcom_
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA81E1081B968C4D8328BEFD7800CF6F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

SGksDQoNCldlIGFyZSBkZXZlbG9waW5nIGEgY3VzdG9tIGJvYXJkIGJhc2VkIG9uIHRoZSByazMz
OTkgc29jLiBXZSBuZWVkIHR3bw0KZGlzcGxheXMsIGFuZCB3b3VsZCBsaWtlIHRvIHVzZSB0aGUg
dHdvIG1pcGkgRFNJIGludGVyZmFjZXMNCmZmOTYwMDAwLm1pcGkgYW5kIGZmOTY4MDAwLm1pcGks
DQpzaW11bHRhbmVvdXNseSwgaW5kZXBlbmRlbnRseSwgYm90aCB3aXRoIGFuIG93biB0b3VjaCBj
b250cm9sbGVyLCA0DQpsYW5lcyBwZXIgZGlzcGxheS4NCg0KUXVlc3Rpb24sIGlzIHRoaXMgYSBw
b3NzaWJsZSBzY2VuYXJpbywgY29uY2VybmluZyByazMzOTkgYW5kIG1pcGkgZHBoeXMuDQpTbyB0
d28gZnVsbHkgaW5kZXBlbmRlbnQsIG5vIGR1YWwgbW9kZXMsIG1hc3Rlci1zbGF2ZXMgZXRjLg0K
DQoNClRoYW5rcyBpbiBhZHZhbmNlLA0KTWlrYSBQZW50dGlsw6QNCk5leHRmb3VyDQoNCg==

--_002_4e9435d6876ae0e4f42fd0de50d4086fnextfourcom_
Content-Type: application/pgp-keys; name="pEpkey.asc"
Content-Description: pEpkey.asc
Content-Disposition: attachment; filename="pEpkey.asc"; size=3157;
	creation-date="Thu, 06 Feb 2020 10:09:53 GMT";
	modification-date="Thu, 06 Feb 2020 10:09:53 GMT"
Content-ID: <66168517A0C6AF4E9F3402ABD0FB095A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tDQoNCm1RR05CRnZYMjBRQkRBREhm
U1VzR2tvY2JsMCt0T1R5TXYyYnQxdVZnWVNDN09QQTE5d3FwWXZhTk9ZdjN1d0UNCnUxRmo0QUl3
Tkp1cjZHZWlETzhheXZ0NHlMSzErUnQraGUxQzNlQmJvbnlPNGVIVml5QmdoYkdoN0JsM0xqemEN
CndONVo2WmR0alBzZFVrUTROWGhoWXJDL041QXAwWi80U1VIOWwwMS9LdkgyTy9ERUZwUWVGekFY
TG9DYVBFTnQNCmJ6bnNmdTlGN2VWV3FUa0ZtdTVLNkR3MFJaMzRHNlJQaGtFUG5Uc0VPWkZLbENT
WkJUNFhXZWQ3dys3Y0d1R2YNCmJSVmNzQ3QwSThXNzlEQU12WTl0Qk4wOGVtUXZUeWsrWnF5SUNN
UVFIR0dyVGhpcWVRbVZhNEcxYzBuaW5YWG0NCkNXaHZ4MUxiYUxlOFhuVG4rODV2SndTb092N2NH
R00yUXJGY2sza1A4cGdsbEd1c0hsU0JNUkVwQWEvZmFKVk4NCmJXL1c1TS8yVGtuS3I0YjZjYWNq
NjduOGVTalIxb0VsOVMxR09CM0xSYWRmYlJ2NDhVNXRsRFhtSlEwMHdURlcNCjZNZE5Oc0Q5dnRP
OXJ6UkEyWlhNUnJxTTkxV0RReHdFYW9mTDc5RjU1a3E2eW5FQmJWNEdKbG11TTdHS1h4RWkNCjZw
ZWIvVGNVeUN0YzBzRUFFUUVBQWJRclRXbHJZU0JRWlc1MGRHbHN3NlFnUEcxcGEyRXVjR1Z1ZEhS
cGJHRkENCmJtVjRkR1p2ZFhJdVkyOXRQb2tCMUFRVEFRZ0FQZ0liQXdVTENRZ0hBZ1lWQ2drSUN3
SUVGZ0lEQVFJZUFRSVgNCmdCWWhCRmF0YTJrVEl4ZWtsTWhPWU1RR2VjZnoyd3pGQlFKZHI5Z1VC
UWtEdVc3TUFBb0pFTVFHZWNmejJ3ekYNCmZxME1BS1N1M2hIc1ZOZG1BaUEreDhYU3o4SEhVTnFo
ZVEyM053U2MwZEJleDZibytGdVUwT1hLTmZhODRUZTgNCnpwQ2V5OU80bWY0L0ZyQ09temF5U2xh
a2ZrRFZhQy9lSm5ETTV1Ny9yVy9pZnJ6a1pRMWdjcXpKcTJud1lTUzANCittbDZBcVpOYU9SWEFz
bjlRNkZWZVlFR1BremNNK0pLcGxqQllwTUN0ckhqOG1JSCsxL0JOcGR4VGplVThPTSsNCmpKbTQy
R1RtRXVDZGI3a1M1WXdFcTNTajZ3bXdnOFI3RFpnQTlraG9GMHcyUFdCYi9LNk1NMHZQZjZvTE9o
RFANCk1KTXlaSjQzMUpJQ0FlTFl6V3ZCQitCdCtDYkRqQkpUcFBPYmRhYTd1VnVuOGlUVUJYZEc2
RVNBY3VPUzlTMlENCnBRMkhVV3A1WkZxbWpmb0lCcklWTTFXSnVRZmgrSXBsWTc0MHhVUWVvd2VZ
TVVndVFEekVFSVlPT3ZXNzVrMFANCkdUYUcxSjdJVktuRjcrRHIzcWxUd29vMWVpeVMzakxuYVlH
VWRvS1h5dDVXcythU2liYWlIV1pUUkFQM3R6MWUNClFCUmU0Mml3aVBOUFlVOWNyaTNlMHkxT0VN
M0Rqd0ErMmJGbm05aFEyaGVMQUV6ZkswWTBHMmJ6R00ydWJSN0INCnY2WnBBb2tCMUFRVEFRZ0FQ
aFloQkZhdGEya1RJeGVrbE1oT1lNUUdlY2Z6Mnd6RkJRSmIxOXVMQWhzREJRa0INCjRUT0FCUXNK
Q0FjQ0JoVUtDUWdMQWdRV0FnTUJBaDRCQWhlQUFBb0pFTVFHZWNmejJ3ekZWandMLzM1UzU0dEkN
CmRXT0xGZXUzcHdUT3ZjKzY1SzR4V1l4cE5aMVRxWVltWW9pUG9IUERTT1pnUDlQeEV2eFk3ODZ1
OTV4M0dPekkNCk9WbkFWRkxtYTZPeDdnbEVISThwYkNUZEs0ZTdZb2o0NHdqcWcyeTFoMWl4N2d4
Ny94MEpyU2dadG9oMEJCeG0NCjM4UENTamg1QUtwTGt5ZmlhWktpblJUWE1SejROL0VPSHBKQlJv
eHN5V2U4aFNsUFdGbXpRVE81SGJ5NzdNZ1ENCnAzajRLV1ZNYnUxdWVUQi9HZzgxN2hLTUViWFo5
SnlMYVhmdDIxUjFvYU8zUDdwajhPWk9RN0F5OFBwWTlxbTgNCkVKZHo4R2VIUVZQMEhadHdJMXdZ
YWFYS1FuMzVWRThVU21MNndUZmVtRW55bVFEMWUyYU9nVGNIb1NOR001a3gNCnNuQUd4VjcrK0pr
Njh6K2hBVHpoajJ4SmpKNjRHdGoySlJFNU52T011RG4yM2QrcnlHblZjZmQwcHdTMU9UUEoNCmVK
V3lZb0xCNm1sRUliT2NoUmhaeVFweGNNZktkdkJhTURNK0l2YXo0aWFldDhiWHlVdVhhMXBzR0o2
NGpycUMNCnFiUDBzK2xBLzBPVTBidHNoTjNNWjZCSGxrR3A0WFBhSFFaVVc2dDlPSitrQnhaaXpl
WjRvOTdRWUxrQmpRUmINCjE5dEpBUXdBcmJUTW8wbGFTaG1WODJXV1lBM1NjRmYzT3NyYmt2aTVN
VGxyTkpTUTRjZGhNVmZHeVU2cmlOM2INCjU0OTVFQm1BQ21FRTduWjduQVJyYllUN0E1UENKUFpz
YUU0Mnp3cTNBWjg5MEFvRWpqTEYrU2x1VUJHWmtaeisNCmxMQnhwTHh5aGxxQ2gwaUkyR3JnRVZG
aGtlRExNSkZRT2ZUdm1HeVFRWXUzRllJMlpvNG9CcHFtaXd5WlZOaTgNCllKbUNZSksrMTFZT1I4
U21SVC9nN3c1cG95Mldla3RIZmhJbUdwZE1FUmtUTnp6U3g5cmUra1NmRUlLRWxlQ2ENClhDZjNK
VW4wWU1ZYlY3Z2lnV2RqR0tFYmZIODJYbm1qejFkd2pjcVBoRitUbHhsaHNvTDF3ZGh1eUJCTGpm
SE8NCjEzLzh3YUQwRGxtdFpibmdCSW5kVkJDQmV0Qzl3cDk3MkdQamN5VkFQTHlHUWE5cGs1SklP
Z0lVRWRNcjV0VG8NClkyZ0hqS2pKMzFrUk9FbDhWRnppdGt1K2ZzSXNaYmRQZnFwMmdPVW9xZ1ZF
RGt5M0hZRmlhWnVsek5QVW1ZUlkNCkovR0hvOEFMVThoNE5TdkNkazk3Q3pIdmRrQjEvRThIMTlL
dmswYVpIekZRY0JuaGt6cStuMFpiU2FUSlM3TTQNCmFxUmFJOGY3QUJFQkFBR0pBYndFR0FFSUFD
WUNHd3dXSVFSV3JXdHBFeU1YcEpUSVRtREVCbm5IODlzTXhRVUMNClhhL1lGQVVKQTdsdXh3QUtD
UkRFQm5uSDg5c014WUx4Qy85THUxeGpkVVRkbWQxMC81RXpBMWkwYmROQm9qQlkNCjNQSjRPNGJo
R3BiOUtHbnhzaFRPRVduY05teXk0MHM4YUhMYmRyZ0VWS0N0a1Mra3dBcm1URmptazQ5R3pRaWUN
CnJSTzJjTlUwV2tVZXBjWDl3cjUxcUtTYnJuZDdFMHJ6MHlNbXVXdlJIalJ0ejErRDhkUi9HSmhK
ZFlyRUtxbmwNCnZQVm5yT05qNVp4WFc4d2pzZ1FtczVpTHVWUXp1eVJ5WDRROHhiSFJiYWlsWEVE
TlUrSFRXUjU4YUFtdzRpeWwNCjI4N0x0RHd5VS9JU2M3T3FNMkVzVFBPaFNlWWpPbkxIWnZvdCt1
ZnU2cU9HS2tBaUthTm53TjZwUkprVzF6S1kNCnFuUVJZMEhKNmt5cmoxWmFKdzFONEMzVm9wQkxq
Qy9Qbm44dldBekgzNVJMKzJvaGs0MTY4ZEhhQXJVYVJOV0sNCnF1REFWK3psOGRsR0wySDVVMHlu
cUxCNWtvU0NINHpnUURtY0gycHQyN3pCcXVxNE1ySzNwTC85emduWE9VeWENClZuUGVjTGRHakhS
YTIyS2xkb05WT2Y0MWtJQ2wxTFo2ZllXcXhWWEl2ZUE2N0hTcWlmZHVjVVA5bjUwYVdUeWcNCkZx
L1JFbVVlcmFVV2NZeWRFK0IrNFh0NXlJRi9WL1p3bTBvPQ0KPVoyVkoNCi0tLS0tRU5EIFBHUCBQ
VUJMSUMgS0VZIEJMT0NLLS0tLS0NCg==

--_002_4e9435d6876ae0e4f42fd0de50d4086fnextfourcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--_002_4e9435d6876ae0e4f42fd0de50d4086fnextfourcom_--
