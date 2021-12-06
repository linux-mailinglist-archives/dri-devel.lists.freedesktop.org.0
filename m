Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D339B46939F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D4873EBA;
	Mon,  6 Dec 2021 10:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300099.outbound.protection.outlook.com [40.107.130.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620BB73893
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 01:38:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKgdNSBse6h5YbECFWU123xeeZyrAZTLA6+WAnOx9AAKL+MRGUM803Mbg6ed1yHrtJhc8Y6wLXHY5OH+l71iHN1ASctTDxDhuk2NAvtyY8W+hwJd+Mn3bqSvBJ8EQsMUK0Y/zD0WGiJ1mQAmWNSn6LI8AixjvlVqevWn1LXI3IMuswyB1EF+JOh2Kr+k5OIRQptB3ch6bnGZy1iPoHx5j3Uj88u9/dBauoKOnfxcTfvREfnG9XPVgjUP9biJmyX8pG06Z3UBK7JdswQKmfze8bHiXfOvC0RFrV+jtVC1v0Q7DEbYjzgYmIFlIsoEvSGFc/7vDD3i+5CvK8lrxmsU+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjELZN7CmkQKGnfLlQsAp+5kgyqrRXfQIWlqDHdPE+c=;
 b=bSW1Z32Gzhe9RMvznBzOn2sFjM9hcp8eNeyhM2OAIiS5wWTpclV9slegib2fbVJY8v152s4I3W8zstKdlAHzYO9juKZRO/U03+Mos86gH33oPe3QLXK0asGirHodD2ntmtQXfAkqXiaapdG0Br8pAWK1Cab8hko+CCsn8Ns6awnBYnTnW8JkolFWT3FozZmLPoR3LCu//yZAnL0K+o8hQkONJplH8C3OSzOmFUZZ+TtzuIb+5Q/TxvTQznBsnlT3xEX7TsdiISuFHeLNc2S20ub+4AU9izI8FAuBsniom0HIf7iJX2TEtrb6gSWs6C9Q4pr8S42gDVkUwkdbQTXVag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjELZN7CmkQKGnfLlQsAp+5kgyqrRXfQIWlqDHdPE+c=;
 b=A78MdLT5KATFsUMu7M5mPIv3Swsn1CMgwikSP3asAKNLUHYgLVfDsKK31np9fML3Fy/WX5sF2FtBq6H0289fmvQy6pwxHPucpiYqnILH1TUzrLLSqCVlpnuNClxOSEvYufWAztM9+uyReafvnuF/YX6jkICwMDhAiOt2qs2/gQtQwUd+iBQSjOC1zmTS6Y3tcD4c0MvKP8Mg0NMwfywy61XWbQYDSitz9+v1w1l54lsx8PKN0hK7FriD5kaK98QF+JPv4+FeM3UbvJbn7pu7YftrilJ/YXMQSRhVez7XyMKgWZZqUVcuqGll9cc9nVl3nili960KqVllfAXy1kUhww==
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com (2603:1096:202:34::18)
 by HK2PR06MB3508.apcprd06.prod.outlook.com (2603:1096:202:34::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Mon, 6 Dec
 2021 01:38:24 +0000
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::6913:5fd5:84b0:1d4]) by HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::6913:5fd5:84b0:1d4%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 01:38:23 +0000
From: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/ast: Atomic CR/SR reg R/W
Thread-Topic: [PATCH] drm/ast: Atomic CR/SR reg R/W
Thread-Index: AQHXq5TM0RiIoM3rJkSmAmQ7phtcuqusmKiAgA+eivCAZDgvEIAAfg2AgAQ8d3A=
Date: Mon, 6 Dec 2021 01:38:23 +0000
Message-ID: <HK2PR06MB3300A0A69348024725AFD4BE8C6D9@HK2PR06MB3300.apcprd06.prod.outlook.com>
References: <20210917072226.17357-1-kuohsiang_chou@aspeedtech.com>
 <7c128e03-842a-57b3-0c11-24fed9d4d126@suse.de>
 <HK2PR06MB3300C768B6A3C390A7D1BBC28CAA9@HK2PR06MB3300.apcprd06.prod.outlook.com>
 <HK2PR06MB3300EB8A7BEB41907FB7FC5F8C6A9@HK2PR06MB3300.apcprd06.prod.outlook.com>
 <4a7ce84d-faef-4fb2-d36d-5cff2fba8ecf@suse.de>
In-Reply-To: <4a7ce84d-faef-4fb2-d36d-5cff2fba8ecf@suse.de>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da09702e-002e-4b9c-5227-08d9b85917b3
x-ms-traffictypediagnostic: HK2PR06MB3508:
x-microsoft-antispam-prvs: <HK2PR06MB350852EC50303E279DCFBE2C8C6D9@HK2PR06MB3508.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fj356AwNyGVDYCFO4JUN9FmuWSn2ibeGcXEH3efDZJzm9lw8I7CSIXTbQAeZYuzuiL5x86Emi2+KHnFzLFavOhnRqaZwc508XUf4++UMuM7fetfBg4Ijv5Ci0p6qKo4dkI1lO69MfU6HAEPKHH+RsZ7ukUabAP8Hjcrn0jmMHI66IH1aYqjooYVOT7GQqZ5NzW8uf2qUxBSzjon4VrmbWrcVSVEZyjpFqb9QhytstBqEvQ4KXVsVBZfk31MjJ4/GSAf5GDPZVFCOOxWMIgg7D+o75s2zYdNMoLxCEQiFpiil7EMk/xMn+Bce7rwFECp+Hx1Q+3sc2iCOFn2ZkJuULuluhoes8WK+u6msJfSQM1iVUkkgXoa8zNBnMOejZngBPKJrYC8zEYHxL1IirqbYmB62A45NHP82UxoveIrV8m09885WbDQQ5my91X6l32JBfQSJiM8t4VyIpeXAVrx6x+FNjKeMRSgKKeOVuoPoaovtbKTxnZ2fiHtCgEiT4m9+jSmFvkw3a0aSA6s+kyzbJ/bw7Co8AlKghcnka1KMKqzswz6UazsmWsbHwKpjAqYfgUVN1hVOzGq+CsciqRx9AkunZtJTB7ui8Vl7d08ubtb/J9WNmc1BIctg1baGN4uGTAsfGkLr7PeF+RQ2G48HQUHtIzNoBzfVK0VD9YjFfG2Iif7olxE/3p+6tYFnuBmigkhsbXAPqg7pfW8SJyV3Bg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3300.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39830400003)(366004)(136003)(376002)(396003)(346002)(26005)(508600001)(316002)(66574015)(55016003)(53546011)(8936002)(38070700005)(52536014)(6506007)(38100700002)(7696005)(66946007)(4326008)(71200400001)(8676002)(2906002)(83380400001)(76116006)(66446008)(5660300002)(186003)(64756008)(33656002)(54906003)(122000001)(66556008)(110136005)(9686003)(107886003)(66476007)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzB6YW5teEtTU2UyNGNQZEJtT3lZcHhXWUtNUUF2YVVaS1RsSnh4YmFXUlV5?=
 =?utf-8?B?WTNXQnArWUkzT0tWSEdTaXJKcHpNWEltOHhaZXlLc0tucUtHTXFzbmFLck4w?=
 =?utf-8?B?ek1CcjA1SGk3WExaNVphbGdXdHZrTzRUTVAvZ280ektyeTdaSjYxS2NmUElH?=
 =?utf-8?B?cWg2R1l1eDFnZ1g3WkRqNks4YWlaNkJWQlhERVVmYmVEUHRKTmEvYlBjRUM1?=
 =?utf-8?B?SmtIRmUrMFpGUmZ2ZUt5dXRHVFZYWjkxYWpxZzNldlBadE5LTmdaNjVGNm5C?=
 =?utf-8?B?WVpCc3VqS1FIeXlRTzVobGhhalFUZnkzdzM4M2w2VERqa1BYc3kzaWFYcExv?=
 =?utf-8?B?Q0luRWpCakJ4N21kNC9XSTFuNUthYnJpVzRSaFZ2c2FaYzRwOWVjdmtRYXdi?=
 =?utf-8?B?OWpzdU5WMXZ4QjJFVk9FU3JVdVF4SFhrbHp4bUZEWHVrR2gwb3FhalJlejR5?=
 =?utf-8?B?Sm04NU1YcWJncFhxUkYzY1V6UFFpZWhkZ3ZGeVdtSDF2ZmY2blBSMXhXOU40?=
 =?utf-8?B?M0ovaHJ3WTdzRzNmL2NPOVVLTnVIaG9POWx3UGJxK0NRMXVKME1kRUlqTVE3?=
 =?utf-8?B?dk5IVXowRUNEZDZrem93Q2VsdlFmRG1SUDNhdkorNitWMkZWWkk1clIwQ1p0?=
 =?utf-8?B?QldpV3FpamlzaVZzR08vbCthejNBVkFzK2t2WUQ3aTVqU0pWa0licFR5TVJP?=
 =?utf-8?B?eE1HZVE5TzZrVEpwZzQwR2ZnSW5kYWdwY1R4c1RaajN6dkZZQzBtRHVDZU9M?=
 =?utf-8?B?cmpxL0pIWWd0dGJ2VitQMmRZWFltOWFrUUhDdm0xUjJzMmRWSFFiSmM0bmRY?=
 =?utf-8?B?NHdLaTZ6aDlGeXhrekpBLzZCN3I2bUJaQ2dodUo5TU5zSEJIN1FiaG9zNXRi?=
 =?utf-8?B?QW5VYi9CTzhCbzcrZ1BSRHdrL2pNbndaV2FuVXdQcUN6ZTZDNk4vbGpkTWo3?=
 =?utf-8?B?UkYrQndHZUNOWGtpM2V1cTYvSG9QKzNUR1pDalkyVmVWbTZKcWh1R1BsSnBn?=
 =?utf-8?B?cDcxSldPOHprWDZkbHhlL3hrOExRZjlaelc5bnNUY0RPVmNGbnlCSWM1SE5m?=
 =?utf-8?B?S3BXQjBsT2dRR1gxVUkzUHhSS1laL0xiQ1grMCthTVVIWTR0TDkwc29CYmxr?=
 =?utf-8?B?Wkh3Skx0OWRiUXdVWEpCTW1KRlVab0N2TGczWlV5MEVLdVY5SXJFUkNxdGdY?=
 =?utf-8?B?OVY0bmMzTDZGT0F3WjFBL0N0Lzg4VGZwWG9pYnV2RXlYaVdtSCtMbXk0S2Vp?=
 =?utf-8?B?WmhIdnRQNEVGeWFhbXZvTUh3YW1iUDdDSkdiT1pNT3U1RFhjb0ZORU9XL1dk?=
 =?utf-8?B?RG85WERGY2tsTHI5bUNYdzVUaTlGTkVkazFoMDIxY20wdk11ditwTngrZTVC?=
 =?utf-8?B?RGtGV1dUajVRTGtCaGd3YjBObnh4REFWbWV5WkttNU5URWVRam1vc2s1NjBs?=
 =?utf-8?B?YjY3T2pIL3VoTGwxa29xZXRkckFKTWJJUU15TnVYYkxEZUlmejdtZ0JNUXdn?=
 =?utf-8?B?SFkveDdBell3QU04UHlaekpwdmtsLy8vTm1PVVVuMkMxcW8xcGQ1MXkwSFht?=
 =?utf-8?B?aEJxTzZiREdaaGFxdUczK3I3QVRObVM3RWVEeVRISGtmNitmWTh2b1ArcDV3?=
 =?utf-8?B?MlhpYTU3RjVTQWZFNTVrVnl5RU4xc2F0VC85c1RaamZCL0FCWFk4dDdQc2ty?=
 =?utf-8?B?SGdtVWFwVys4TDZkUy90K0xFTXlNbDZCQ1NKWDYya1UxNmp1Z0M5YnhQUHkv?=
 =?utf-8?B?ZUM4Um53VDhVMFZHY01rVjB6VXh2ZFZhOXA2dlVLcjg0WmJYanZCNm1FY2Q4?=
 =?utf-8?B?c3ljQ2QwK3AwYy9UMnBkeHlQQUNhelJ0TFJvZmtqbW9pNjNSa2kwL2hkL1BT?=
 =?utf-8?B?U0kvWE9zVTFZa25Kd084K0V3RlFqeTRFaHlFcTdJYVI1c2kxRDhQYjZjZE14?=
 =?utf-8?B?aW5vOHNDdk1ENFFzM2Q1UXlGNHZNQk13OWdYb3ovcXpEUytwZXNtWFhOZHQr?=
 =?utf-8?B?S3hlZWMrYVJNTDJRSjlIaHVBdmRjYkhNTzdsLzlCL3dDclNQa3dvandJYk9S?=
 =?utf-8?B?cXhqWHdUbkVoUVU3MHM0aktUMGJaRTB6STRZZ1BXZ3E1VUhNM2ZweThTL0ww?=
 =?utf-8?B?MGdPQ0hBa28vTWVQc2JFZW5VdEJqejZMNjVHS3plK01sQXluSjVzL2hiZHhI?=
 =?utf-8?B?c2Z2OFgyMGkrRVBMcnhPbDgxSXNTNzhWeEd6YXJBbGg0YndRUjNkWm5jb0tS?=
 =?utf-8?B?SGV3eUJrNCtuSy9vS1pNc2VtbEp3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3300.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da09702e-002e-4b9c-5227-08d9b85917b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2021 01:38:23.7145 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EMeVTk0NIWy9i5QCxFciYDacZREyYtFFcPEo08spkEPF9adAihpytKdywk0GOWNL9KabEJHd/DZvEUm4wfJg3izmRF058EPNdm7Ty4m/WKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3508
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, "airlied@linux.ie" <airlied@linux.ie>,
 =?utf-8?B?5riF5rC05L+uKG8tc2hpbWl6dSkt5Y+w54GjTkVD?=
 <o-shimizu@nec.com.tw>, Jenmin Yuan <jenmin_yuan@aspeedtech.com>,
 "airlied@redhat.com" <airlied@redhat.com>, Arc Sung <arc_sung@aspeedtech.com>,
 Luke Chen <luke_chen@aspeedtech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFRob21hcyBaaW1tZXJtYW5u
IFttYWlsdG86dHppbW1lcm1hbm5Ac3VzZS5kZV0gDQpTZW50OiBGcmlkYXksIERlY2VtYmVyIDAz
LCAyMDIxIDQ6NDcgUE0NClRvOiBLdW8tSHNpYW5nIENob3UgPGt1b2hzaWFuZ19jaG91QGFzcGVl
ZHRlY2guY29tPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FzdDogQXRvbWljIENS
L1NSIHJlZyBSL1cNCg0KSGkNCg0KQW0gMDMuMTIuMjEgdW0gMDI6MjMgc2NocmllYiBLdW8tSHNp
YW5nIENob3U6DQo+IA0KPiANCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
S3VvLUhzaWFuZyBDaG91DQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMzAsIDIwMjEgMzox
OSBQTQ0KPiBUbzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+OyANCj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZw0KPiBTdWJqZWN0OiBSRTogW1BBVENIXSBkcm0vYXN0OiBBdG9taWMgQ1IvU1IgcmVnIFIv
Vw0KPiANCj4gSGkNCj4gDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFRo
b21hcyBaaW1tZXJtYW5uIFttYWlsdG86dHppbW1lcm1hbm5Ac3VzZS5kZV0NCj4gU2VudDogTW9u
ZGF5LCBTZXB0ZW1iZXIgMjAsIDIwMjEgNDoxNyBQTQ0KPiBUbzogS3VvLUhzaWFuZyBDaG91IDxr
dW9oc2lhbmdfY2hvdUBhc3BlZWR0ZWNoLmNvbT47IA0KPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGRybS9hc3Q6IEF0b21pYyBDUi9TUiByZWcgUi9XDQo+IA0KPiBIaQ0KPiANCj4gQW0g
MTcuMDkuMjEgdW0gMDk6MjIgc2NocmllYiBLdW9Ic2lhbmcgQ2hvdToNCj4+IDEuIEF2b2lkIElP
LWluZGV4IHJhY2luZw0KPj4gMi4gSU8taW5kZXggcmFjaW5nIGhhcHBlbmVkIG9uIHJlc29sdXN0
aW9uIHN3aXRjaGluZw0KPj4gICAgICBhbmQgbW91c2UgbW92aW5nIGF0IHRoZSBzYW1lIHRpbWUg
My4gU3lzdGVtIGh1bmcgd2hpbGUgSU8taW5kZXggDQo+PiByYWNpbmcgb2NjdXJyZWQuDQo+IA0K
PiBJJ2Qgc2F5IHRoYXQgdGhlcmUncyBzb21ldGhpbmcgZWxzZSBnb2luZyBvbmUgaGVyZS4gTW9k
ZSBzZXR0aW5nIGFuZCBjdXJzb3IgbW92ZW1lbnQgc2hvdWxkIGJlIHByb3RlY3RlZCBhZ2FpbnN0
IGVhY2ggb3RoZXIgYnkgRFJNIGxvY2tpbmcuDQo+IENoYW5naW5nIHRoZXNlIGxvdy1sZXZlbCBm
dW5jdGlvbnMgd291bGQgbm90IHNvbHZlIHRoZSBpc3N1ZXMuIEknbGwgdHJ5IHRvIHJlcHJvZHVj
ZSB0aGUgcHJvYmxlbSBBU0FQLg0KPiANCj4gSGkgVGhvbWFzLA0KPiANCj4gU29ycnkgdG8gaW50
ZXJydXB0IHlvdSBhZ2FpbiENCj4gTWF5IEkgdW5kZXJzdGFuZCB0aGUgcmV2aWV3J3Mgc2l0dWF0
aW9uPyBUaGFua3MhDQpIaSBUaG9tYXMsDQoNCkxvb2ssIHlvdSByZWFsbHkgaGF2ZSB0byB3b3Jr
IHdpdGggdXMgZHVyaW5nIHRoZSByZXZpZXcgcHJvY2Vzcy4gRG9uJ3QganVzdCBleHBlY3QgdXMg
dG8gdGVsbCB5b3Ugd2hhdCB0byBkby4NClRoYW5rcyEgR290IGl0Lg0KDQpJJ20gbm90IGdvaW5n
IHRvIG1lcmdlIHRoaXMgcGF0Y2guIEFzIEkgc2FpZCwgSSBkb24ndCB0aGluayBpdCBmaXhlcyB0
aGUgcHJvYmxlbS4gTW91c2UgbW92ZW1lbnQgYW5kIHJlc29sdXRpb24gc3dpdGNoaW5nIHNob3Vs
ZCBub3QgaW50ZXJmZXJlIHdpdGggZWFjaCBvdGhlci4gVGhlIERSTSBmcmFtZXdvcmsgc2hvdWxk
IGd1YXJhbnRlZSB0aGF0Lg0KT0ssIHRoYW5rcyBmb3IgeW91ciBjb25maXJtYXRpb24uDQoNCkkg
Y2Fubm90IHJlcHJvZHVjZSB0aGUgaXNzdWUsIGJ1dCB0aGVyZSdzIG1vc3QgbGlrZWx5IHNvbWV0
aGluZyBlbHNlIGhhcHBlbmluZyBoZXJlLiBIb3cgY2FuIHRoZSBzeXN0ZW0gc3dpdGNoIHJlc29s
dXRpb24gYW5kIGNoYW5nZSB0aGUgbW91c2UgYXQgdGhlIHNhbWUgdGltZT8NClN1cmUsIHdlIHdp
bGwgY2hlY2sgaWYgdGhlcmUgaXMgYSAxMDAgcGVyY2VudCBtZXRob2QgdG8gcmVwcm9kdWNlIHRo
ZSBpc3N1ZS4gDQpUaGFua3MgZm9yIHlvdXIgcmVzcG9uc2VzLg0KDQpSZWdhcmRzLA0KCUt1by1I
c2lhbmcgQ2hvdQ0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBIaSBUb21hcywNCj4g
R29vZCBkYXkhDQo+IE1heSBJIHVuZGVyc3RhbmQgdGhlIHJldmlldyBzdGF0dXMsIG9yIGlzIHRo
ZXJlIGFueXRoaW5nIEkgY2FuIGRvIHRvIGltcHJvdmUgaXQ/IFRoYW5rcyENCj4gDQo+IEJlc3Qg
UmVnYXJkcywNCj4gCUt1by1Ic2lhbmcgQ2hvdQ0KPiANCj4gQmVzdCBSZWdhcmRzLA0KPiAgIAlL
dW8tSHNpYW5nIENob3UNCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBUaG9tYXMNCj4gDQo+Pg0KPj4g
U2lnbmVkLW9mZi1ieTogS3VvSHNpYW5nIENob3UgPGt1b2hzaWFuZ19jaG91QGFzcGVlZHRlY2gu
Y29tPg0KPj4gLS0tDQo+PiAgICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMgfCA0OCAr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tDQo+PiAgICAxIGZpbGUgY2hhbmdlZCwg
MzYgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYyANCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfbWFpbi5jIGluZGV4IDc5YTM2MTg2Ny4uMWQ4ZmE3MGM1IDEwMDY0NA0KPj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tYWluLmMNCj4+IEBAIC00MSwyOCArNDEsNTIgQEAgdm9pZCBhc3Rfc2V0X2luZGV4X3Jl
Z19tYXNrKHN0cnVjdCBhc3RfcHJpdmF0ZSAqYXN0LA0KPj4gICAgCQkJICAgIHVpbnQzMl90IGJh
c2UsIHVpbnQ4X3QgaW5kZXgsDQo+PiAgICAJCQkgICAgdWludDhfdCBtYXNrLCB1aW50OF90IHZh
bCkNCj4+ICAgIHsNCj4+IC0JdTggdG1wOw0KPj4gLQlhc3RfaW9fd3JpdGU4KGFzdCwgYmFzZSwg
aW5kZXgpOw0KPj4gLQl0bXAgPSAoYXN0X2lvX3JlYWQ4KGFzdCwgYmFzZSArIDEpICYgbWFzaykg
fCB2YWw7DQo+PiAtCWFzdF9zZXRfaW5kZXhfcmVnKGFzdCwgYmFzZSwgaW5kZXgsIHRtcCk7DQo+
PiArCXVpbnQxNl90IHZvbGF0aWxlIHVzRGF0YTsNCj4+ICsJdWludDhfdCAgdm9sYXRpbGUgakRh
dGE7DQo+PiArDQo+PiArCWRvIHsNCj4+ICsJCWFzdF9pb193cml0ZTgoYXN0LCBiYXNlLCBpbmRl
eCk7DQo+PiArCQl1c0RhdGEgPSBhc3RfaW9fcmVhZDE2KGFzdCwgYmFzZSk7DQo+PiArCX0gd2hp
bGUgKCh1aW50OF90KSh1c0RhdGEpICE9IGluZGV4KTsNCj4+ICsNCj4+ICsJakRhdGEgID0gKHVp
bnQ4X3QpKHVzRGF0YSA+PiA4KTsNCj4+ICsJakRhdGEgJj0gbWFzazsNCj4+ICsJakRhdGEgfD0g
dmFsOw0KPj4gKwl1c0RhdGEgPSAoKHVpbnQxNl90KSBqRGF0YSA8PCA4KSB8ICh1aW50MTZfdCkg
aW5kZXg7DQo+PiArCWFzdF9pb193cml0ZTE2KGFzdCwgYmFzZSwgdXNEYXRhKTsNCj4+ICAgIH0N
Cj4+DQo+PiAgICB1aW50OF90IGFzdF9nZXRfaW5kZXhfcmVnKHN0cnVjdCBhc3RfcHJpdmF0ZSAq
YXN0LA0KPj4gICAgCQkJICB1aW50MzJfdCBiYXNlLCB1aW50OF90IGluZGV4KQ0KPj4gICAgew0K
Pj4gLQl1aW50OF90IHJldDsNCj4+IC0JYXN0X2lvX3dyaXRlOChhc3QsIGJhc2UsIGluZGV4KTsN
Cj4+IC0JcmV0ID0gYXN0X2lvX3JlYWQ4KGFzdCwgYmFzZSArIDEpOw0KPj4gLQlyZXR1cm4gcmV0
Ow0KPj4gKwl1aW50MTZfdCB2b2xhdGlsZSB1c0RhdGE7DQo+PiArCXVpbnQ4X3QgIHZvbGF0aWxl
IGpEYXRhOw0KPj4gKw0KPj4gKwlkbyB7DQo+PiArCQlhc3RfaW9fd3JpdGU4KGFzdCwgYmFzZSwg
aW5kZXgpOw0KPj4gKwkJdXNEYXRhID0gYXN0X2lvX3JlYWQxNihhc3QsIGJhc2UpOw0KPj4gKwl9
IHdoaWxlICgodWludDhfdCkodXNEYXRhKSAhPSBpbmRleCk7DQo+PiArDQo+PiArCWpEYXRhICA9
ICh1aW50OF90KSh1c0RhdGEgPj4gOCk7DQo+PiArDQo+PiArCXJldHVybiBqRGF0YTsNCj4+ICAg
IH0NCj4+DQo+PiAgICB1aW50OF90IGFzdF9nZXRfaW5kZXhfcmVnX21hc2soc3RydWN0IGFzdF9w
cml2YXRlICphc3QsDQo+PiAgICAJCQkgICAgICAgdWludDMyX3QgYmFzZSwgdWludDhfdCBpbmRl
eCwgdWludDhfdCBtYXNrKQ0KPj4gICAgew0KPj4gLQl1aW50OF90IHJldDsNCj4+IC0JYXN0X2lv
X3dyaXRlOChhc3QsIGJhc2UsIGluZGV4KTsNCj4+IC0JcmV0ID0gYXN0X2lvX3JlYWQ4KGFzdCwg
YmFzZSArIDEpICYgbWFzazsNCj4+IC0JcmV0dXJuIHJldDsNCj4+ICsJdWludDE2X3Qgdm9sYXRp
bGUgdXNEYXRhOw0KPj4gKwl1aW50OF90ICB2b2xhdGlsZSBqRGF0YTsNCj4+ICsNCj4+ICsJZG8g
ew0KPj4gKwkJYXN0X2lvX3dyaXRlOChhc3QsIGJhc2UsIGluZGV4KTsNCj4+ICsJCXVzRGF0YSA9
IGFzdF9pb19yZWFkMTYoYXN0LCBiYXNlKTsNCj4+ICsJfSB3aGlsZSAoKHVpbnQ4X3QpKHVzRGF0
YSkgIT0gaW5kZXgpOw0KPj4gKw0KPj4gKwlqRGF0YSAgPSAodWludDhfdCkodXNEYXRhID4+IDgp
Ow0KPj4gKwlqRGF0YSAmPSBtYXNrOw0KPj4gKw0KPj4gKwlyZXR1cm4gakRhdGE7DQo+PiAgICB9
DQo+Pg0KPj4gICAgc3RhdGljIHZvaWQgYXN0X2RldGVjdF9jb25maWdfbW9kZShzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCB1MzINCj4+ICpzY3VfcmV2KQ0KPj4gLS0NCj4+IDIuMTguNA0KPj4NCj4g
DQo+IC0tDQo+IFRob21hcyBaaW1tZXJtYW5uDQo+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIN
Cj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+IE1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueSAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQo+IEdl
c2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXINCj4gDQoNCi0tDQpUaG9tYXMgWmlt
bWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkN
CihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==
