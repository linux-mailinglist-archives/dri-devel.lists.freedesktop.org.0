Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2033446EE92
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5093A10E8A8;
	Thu,  9 Dec 2021 16:53:37 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E07C10E116
 for <dri-devel@freedesktop.org>; Thu,  9 Dec 2021 07:37:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSZvvoGDvo347t+sXR2GQnbH0vazb0kUPDjLvpqmviaEHpmGQceWq/Z6eJrGfku8WQbWxiDzUkzj0JcDZ19wT5RQnw0jr3TYF2tOUBzvkGazNr31Nm8jtszz5/fZCJy5VTA3NBZA4V8HwTMwNaRoFwd3MwUYhKcHujbo5Y/yGj4VD4Qx+4pFhuw1JlqzQ7QBpWCjb2iCSHjpRgF/AKAIEjlHB/s1u5+rZ4e3QrlkdrjKa95JDn1rD7Y87MPD6Y3kaECZfrF/YCyx4bgqH3Nmsda1HSzy9D0LE5dWpDLIuW65ZE232TACyxAXvD/xUybIRDvKC0FC3LCiSX/2fjSZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tys2HQhJtG9RR85xF6FzwB2+n28jk5rmC4VB766SBdM=;
 b=SPhdGaTuXc7VRUIS0We8iD+Sk1E0HI6SPDkuJ7B7ksyXtXlzDXVJ3RlI7J8EKxm+GVADc22yVpGQNzI/0Yx/+L9VsZPz7TtIYE6xxICjhTx6tNzRaaCr2e2pdFgVaccX+s8/dZe6lyMjwIA0/gAuGA6xXQoWZDXMOiu8T7qo4ePlK1dfa6E6RvnfXnauvl81Sku6K+exfm0Tv8Ow5XZP0wvZKmFXGkpdm0jyOoUpWJkj6dhqCGRkjuQ+dwksvJ945zMRcw982r5u/EOUuCF74obTv/hcRSPRcMgaSHA+kpKbg1GWkaoVBGweUnfrGJAlRmW1FqqqugW7sIs26sGgbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tys2HQhJtG9RR85xF6FzwB2+n28jk5rmC4VB766SBdM=;
 b=WffmbEkslv3mc3VH3jGBM0PAM+wxLVCC+347YWSpIsF/5UFPJS+LaavWYRNL8tPgYT53IgSbTnsae0mKnBriIOAwlEXGpu3FkV9PbRmu3REYteRsDeXpM1xi5jw7z7CbkE0CnDW2CN4SKkrFz9viCdwl28jHJuTVOmaJK7XNvKk=
Received: from DM6PR05MB7099.namprd05.prod.outlook.com (2603:10b6:5:14e::10)
 by DM5PR05MB2795.namprd05.prod.outlook.com (2603:10b6:3:52::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.10; Thu, 9 Dec 2021 07:37:56 +0000
Received: from DM6PR05MB7099.namprd05.prod.outlook.com
 ([fe80::eca1:ac54:5509:47dc]) by DM6PR05MB7099.namprd05.prod.outlook.com
 ([fe80::eca1:ac54:5509:47dc%4]) with mapi id 15.20.4755.025; Thu, 9 Dec 2021
 07:37:56 +0000
From: Martin Krastev <krastevm@vmware.com>
To: "dri-devel@freedesktop.org" <dri-devel@freedesktop.org>, "zack@kde.org"
 <zack@kde.org>
Subject: Re: [PATCH 06/12] drm/vmwgfx: Update device headers for GL43
Thread-Topic: [PATCH 06/12] drm/vmwgfx: Update device headers for GL43
Thread-Index: AQHX6sZwJdA2VUt+4U+3VJpPMFvDdawpyc6A
Date: Thu, 9 Dec 2021 07:37:56 +0000
Message-ID: <62eba7e9f95d49f869320c2607272d4e8be16442.camel@vmware.com>
References: <20211206172620.3139754-1-zack@kde.org>
 <20211206172620.3139754-7-zack@kde.org>
In-Reply-To: <20211206172620.3139754-7-zack@kde.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.1 (by Flathub.org) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0254ce88-1dbf-4c50-427d-08d9bae6d153
x-ms-traffictypediagnostic: DM5PR05MB2795:EE_
x-microsoft-antispam-prvs: <DM5PR05MB279502B0AAE83FBBD3A733BEAE709@DM5PR05MB2795.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jzbr8NsO9yuEHSZqELUM6jEX+FgQX/nuhKZ0ourOx0E9HhLeHzv5aft2bW3Wo2UwRG8bjIWoyzABG0fTDzMYvgjH3PkW7eub6QjepPr7kDjgFUAUMrvIMeGTT9ohHjAv23cWEHL2GKTpqaK6zQXa/Wl2jGrKF3Z/ToXVb1bxEBNx1XL1w85bAAY3WyO0yOTr4xNvIBF7rCk02kLHN+OQoc3bGtjURMomm1ok4L7sVs4/cOH5X2ZlH6JzKPajj532tA/y3+0q29DOXqC0+6xmwdRDY7EYBkevUtVc7Pjq/ngw3ZhuInRSYhqyJQZJGQ2lx+RzzT7y3a+Xr48WayZkOTNMGXQM29YfjfNAvQlWVrrvUXbcwfqjr/LhO35PfEeeZfSSRor33xDUQtx+wdQj8M2rfg4dc3MiOC7TP9vsvnFB3TA9o8ZHgQ1un3bst3qs9QqabDrvdlD1DJMMVog3z4IbnQVyywd9jYRt00PTo+vQOQ49lqxeuuw0Ls9WuZIs/OlO3rrSN3sRZNtbo2dPmhK1onv1jr6BVzXwrj3XI+4kkZweMBhjXBMgILvYsE/f8EbT36/YHxdWctRK00YV+3cACMKDMWZXEj3ocFSAgbdwDX8/xhZzaJ2C6yHkdXOOmyQmOJAjehhFTkfDNx7z9ljJY1gzqCW2UtIdi7zcdC92xErunOGzWfm46nPwLon7Iwugv1cJARdoBaHE0yZceA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR05MB7099.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(110136005)(36756003)(6506007)(508600001)(71200400001)(15650500001)(38070700005)(6512007)(4744005)(6486002)(5660300002)(8936002)(66446008)(66476007)(8676002)(64756008)(66556008)(26005)(2616005)(316002)(122000001)(38100700002)(86362001)(2906002)(186003)(107886003)(76116006)(91956017)(83380400001)(4326008)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTg4cUpaM1BoaVU2MzI0NWRoWlVpWGFTc29RdzFVTStIeUxNeVI2QWl6ZGR5?=
 =?utf-8?B?UEJNMDRPS3NIeUEyNzlBZ0c3MUdrWXZ3c2k3V01NNE1JNExBazkxVWNrbzNi?=
 =?utf-8?B?QlpHVlVZbW1JOVhVQ1phTjBISHB4VXo3N0lHR0QvQ09USDIvblE3VXFDZzBn?=
 =?utf-8?B?Q01wS2xWMWszUVozdktSdVpZLzIyNGVQck5oaThod0NMRW1wNko4ZmwvUGJV?=
 =?utf-8?B?Q21Na2FOYXVrSDNQcEw5RHNUV3lieUFHbVU5azJob2haeEpnN2lvb09WNEpW?=
 =?utf-8?B?MkhYV09DTVd0Q3VxOTUwTU9EY1FzV2tsOHRVcXNDc2tsYjdqRFdoZEhMUGVD?=
 =?utf-8?B?U2tCS2RlajhTdERrSDlENzN6V0p3dUN3VUFlTFowNDlvSVVxZmVoTjdwR2tI?=
 =?utf-8?B?Q0JtV1JXNkdtQklZbC9RRG5CQ2VZNVlsVjdZaFNtcThUWERkMENVV1dBVnJ5?=
 =?utf-8?B?Qk1jeDBlWFlHTmgyTnlOK1pqRU9wM0ExcDNPZWxoVm9qY2kvbFk4VVo2VjQ1?=
 =?utf-8?B?eGFMM0FLRWROMHRwWkRRZmI4NlRHRlY0TVRBOUpNME5tMkU2aDR5UDgrSlNy?=
 =?utf-8?B?aDcrUmhaZk9QSTd0alhGYlFlZXFadWdHS1I4T1ZNdTRwVy9mOEUydUxTck9x?=
 =?utf-8?B?cFBmc0F1NjZnQWVNbnZkSCt5M1ZOOHZGY1BVUEp2VEpYY1YvNERjM3hlRkFu?=
 =?utf-8?B?MkxENUY5dXNJS3p2clVvNkZnQno2VXR1WVVpeUZCQ1lMb0NST2w0M0VIbjJX?=
 =?utf-8?B?SThhUU5FSFdjaGhrb0ZNb3pTa081RDVXSkR0clF6dWxlbUpxZXJjMGlGZkNx?=
 =?utf-8?B?a1hab3MxN2JRQklVNjdQaC9xYUZDeEh4UjZPYVRtUU5KcFpVWjF1NVRva0Ry?=
 =?utf-8?B?YUlPMjJtSEhoQkJPTUtLaDlHSDRqMnlyM2U1SStQUGs2ZGxoYmR0U3c0cjZ1?=
 =?utf-8?B?Um9hQllyMWZRSW9Xd3RoNUVUK29zRC9FRGR6dGZ0OURrbXQ4eUpiWHBHcjZa?=
 =?utf-8?B?ZmVMODlPUEs3VGphTmFIUlE2QWpxcWE5L3ozS0tBYk5LNmlCajJUREhyRmNs?=
 =?utf-8?B?K1d0M1loWWZRODRDTVl3R1V1WmV0dW9ramovK2hEaHd1ZUVKYUdNeEFjQ2l0?=
 =?utf-8?B?T1FHSGlwOXdSNk5XZ2tpSzFpSEMzMFBwd1BYSTJCK3dCT3o0RTlOdFNhaTBB?=
 =?utf-8?B?ZWFTVmVqKzhadDYraTVjMWQzbm15VU5EanZKMGNIYlNDMU9SUzYvdjRGNXhs?=
 =?utf-8?B?TkxTRW8rdTZJdy9zZTA3ZEltYm45Sy9OTEIwdjBPZEo0SEhQenBxdmY3Ymp1?=
 =?utf-8?B?cnJDS1RwUGR5K2EzaGZ4eDNrdFFFc3BXY2RnS3lBQUtJajNhK1FmYU4wQ3k5?=
 =?utf-8?B?N2c2TTNyV1p1MW95bGJUV1Q5UHpldVlBeFdRb25oTlBWSit2cCtEbWtKZU04?=
 =?utf-8?B?OGdVL1M3OFBPeDluazRQeXdRYW1SZ3p5bWlLYUpod29MTFg5cmFLT24vcGNJ?=
 =?utf-8?B?UWlLU205K3JIOUFWUEZpL2ZET2pFRTBKL3E0MjJseWZiREJQWWRqK1lwNVNq?=
 =?utf-8?B?R3J1UlA0ZTI1dUlBUVBPRGlleFNnSklkcU5WWDJDVnlJRlBuS1Mza2NoSTZu?=
 =?utf-8?B?ZUNKak9jU21uV1k5M1dxWnRCRDRHU1NjQlZINTZiQklBVUtXWExTdTNWdksw?=
 =?utf-8?B?U2dibXcyckNiNGJjZWxTMGFPaCthRUpYYUNRV1RMM2diSUI4aHp4Zy9rbk1Z?=
 =?utf-8?B?V2JSR0djWFhabThWSzZ4SGw1MGptUW5UakgwalVFQm1xMGFTK2FDc29aeHQv?=
 =?utf-8?B?LzVkRC9SbW5WTnljUHJCSGV3NlRnYjNxd0ZzS1c3czQyRlViUVF5NS9ZLzNT?=
 =?utf-8?B?UXAxdEdYeXdUaUJadUdSU05pbzJHK1VGaHp5YTRPdnRUSUZkSVc1dFBKejBJ?=
 =?utf-8?B?OWdaRTYrdUdhWFkvOXVKbGZJdnBPTm5Zd3ZPaDRmNDFsUExRNmNBOXBVZjZZ?=
 =?utf-8?B?ZFJWSk5UNUcwbUFRQlp2QU5jSVFCWkpzWU91Vy9ML3pwM0JXeDZPL1dJdjlZ?=
 =?utf-8?B?SDJUTTBvZDFLUCtaS09tdW1vU3hPc2VIYituVTlkU0ZzRkFnN1NuMjYrcWk4?=
 =?utf-8?B?eVNNRCtzTjJVczl5d09oN2p4VzYxczVxVlZQTXdPOGdyTnhHUStLU21zTy9X?=
 =?utf-8?Q?WAXBmcmoMn88ytvk+o7n0dU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D34DB6BA5447C45A581A2C7CE3B4066@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR05MB7099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0254ce88-1dbf-4c50-427d-08d9bae6d153
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2021 07:37:56.5565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 99Xt0pLHeuXPdgLgc70FqcNOph+gy6gjhlbXxRQd95vpFlh3f58QNP9WHdXfW2vpJYuHhMZAN4rsSYGgZLAKYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR05MB2795
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
Cc: Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIxLTEyLTA2IGF0IDEyOjI2IC0wNTAwLCBaYWNrIFJ1c2luIHdyb3RlOg0KPiBG
cm9tOiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPg0KPiANCj4gVXBkYXRlIHRoZSBoZWFk
ZXJzIGZvciBHTDQzIHVzZXJzcGFjZSB3b3JrcyB0aGF0IGxhbmRlZCBpbiBNZXNhM0QuIEFsc28N
Cj4gdXBkYXRlIHRoZSBsaWNlbnNlIGhlYWRlcnMgdG8gY29uZm9ybSB0byB0aGUga2VybmVsIGd1
aWRlbGluZXMuDQo+IA0KPiBGb3IgR0w0MyB0aGUgdmlydHVhbCBkZXZpY2UgZ290IEQzRDExLjEg
c3VwcG9ydCB3aXRoIHNvbWUgR0wgZXh0ZW5zaW9ucy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFph
Y2sgUnVzaW4gPHphY2tyQHZtd2FyZS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC9kZXZpY2VfaW5jbHVkZS9zdmdhM2RfY21kLmggfCAgNiArKystLS0NCj4gIC4uLi9ncHUv
ZHJtL3Ztd2dmeC9kZXZpY2VfaW5jbHVkZS9zdmdhM2RfZGV2Y2Fwcy5oIHwgMTAgKysrKysrKy0t
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC9kZXZpY2VfaW5jbHVkZS9zdmdhM2RfZHguaCAg
fCAxMiArKysrKystLS0tLS0NCj4gIC4uLi9ncHUvZHJtL3Ztd2dmeC9kZXZpY2VfaW5jbHVkZS9z
dmdhM2RfbGltaXRzLmggIHwgIDggKysrKystLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS92bXdnZngv
ZGV2aWNlX2luY2x1ZGUvc3ZnYTNkX3JlZy5oIHwgIDYgKysrLS0tDQo+ICAuLi4vZ3B1L2RybS92
bXdnZngvZGV2aWNlX2luY2x1ZGUvc3ZnYTNkX3R5cGVzLmggICB8ICA3ICsrKy0tLS0NCj4gIC4u
Li9ncHUvZHJtL3Ztd2dmeC9kZXZpY2VfaW5jbHVkZS9zdmdhX2VzY2FwZS5oICAgIHwgIDYgKysr
LS0tDQo+ICAuLi4vZ3B1L2RybS92bXdnZngvZGV2aWNlX2luY2x1ZGUvc3ZnYV9vdmVybGF5Lmgg
ICB8ICA2ICsrKy0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC9kZXZpY2VfaW5jbHVkZS9z
dmdhX3JlZy5oICAgfCAxNCArKysrKysrKy0tLS0tLQ0KPiAgOSBmaWxlcyBjaGFuZ2VkLCA0MSBp
bnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkNCg0KUmV2aWV3ZWQtYnk6IE1hcnRpbiBLcmFz
dGV2IDxrcmFzdGV2bUB2bXdhcmUuY29tPg0K
