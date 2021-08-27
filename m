Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2043F9551
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 09:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194A86E8EC;
	Fri, 27 Aug 2021 07:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05A76E8EB;
 Fri, 27 Aug 2021 07:46:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bpuk2ns+V4vmPPgWo1j20X4hdn5P0/DuqMWVYLJb7avoiGRwSPVq+Elm2AKJRgeGGTpFFVQOX9nPqMEt6Ncu/WzY7w6XhLoia6KMP8ch1Lyzp+Yy5/3+lxXdxPsgJ9IRty/jvZB0q/1UsKXLmdDxuJ+lXfAgofVHOdNByYl9NHhEW3cZaDmt/2uY5yDoXdEPlmgU4sikB/oHiWNm9jBdCYXE/1sQU1+CegPH/2E7l5lG4TpSZwkM0dor5AVfyZN4bk3LK9HEJGpCfSfukf0ayDj4BUFSIb1xSUaZWqPqSWzMBGg6fgTRFTuQYMTHPrDNpVhUDureH/thj4GgrRFs2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRVRS2lgsezbiJ7LZ+j1rKzN5m4JP8+uzcoZeN72WRA=;
 b=jhhedlljzKFPa7FmBFUsu3olUZHvg8iK84I+dCH8gffE3MD61i25ptWqaBTrIGhsNA2Y0nUEosVJxSOMU7nyf2XcUxNoheMw/XFWXg1/FungiFSW4rs8o1IV2atZyRy79bNw8QfoGRxfJkdD3FKx8PL0lsjjhD8GHijOoS49hevHwjbGI2UK4b2V/vvRII6vjgvY7LgH2NdWXyknaw6OXKrOEIv4VMsWANh0Fl8AFMrsFneHuNsnppGe0xS/mMkkCY+bgXOfSzhnU5bo83aPbinDFpCtHF4dV9VxGfiYII4FLRyMmXsVsxWZdKtlBzeB9iTTECpa5c/YLh6fJlhpNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRVRS2lgsezbiJ7LZ+j1rKzN5m4JP8+uzcoZeN72WRA=;
 b=YX/g8mHowzvDxuBG32TYvs02Q69CiEWsKmFkrNGraka89ZLn1lN+iRerHc2xx7jZDWpt+FheHnxP/LpwkDSmWZHxrxQFhq/Nh4aH+uMLauEnGauDm/mHzQzl/ZduNPyyki1iXotVBoXFWuGb5gKLzwyBqCLD+mWfJs3Tqg0Xvbs=
Received: from BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 by BL1PR12MB5223.namprd12.prod.outlook.com (2603:10b6:208:315::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Fri, 27 Aug
 2021 07:46:54 +0000
Received: from BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a]) by BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a%5]) with mapi id 15.20.4436.024; Fri, 27 Aug 2021
 07:46:54 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/sched: fix the bug of time out calculation(v3)
Thread-Topic: [PATCH] drm/sched: fix the bug of time out calculation(v3)
Thread-Index: AQHXmjadxsIrIGn2Y02EiNcylnR376uF0cOAgABnvwCAAKb8AIAAGjKQ
Date: Fri, 27 Aug 2021 07:46:54 +0000
Message-ID: <BL1PR12MB52691420DCC3A00794168A1284C89@BL1PR12MB5269.namprd12.prod.outlook.com>
References: <1629953731-14629-1-git-send-email-Monk.Liu@amd.com>
 <20419179-ee90-45aa-f4b8-b6bcb20a9c52@amd.com>
 <cc01416c-c04e-a716-f617-71351c1ad06a@amd.com>
 <8c675723-b272-3d81-06c2-fe574a1dff06@gmail.com>
In-Reply-To: <8c675723-b272-3d81-06c2-fe574a1dff06@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-08-27T07:46:52Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=5b4199ca-c9c2-4c51-b9f6-fadbf4968861;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b23fb4ad-1be3-404f-7892-08d9692ed714
x-ms-traffictypediagnostic: BL1PR12MB5223:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB522314EA48CC55B74C20BB4584C89@BL1PR12MB5223.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J42K7vvMInYMJigNY0UpHoC8rESkuKB0AVSJFmXQdPbzrZcJSPwigPWSrmyeNT1ubx/vFb6GbZHJcGuXcG0BmzxF8wpY6cPCMLiMCW2GIbVejLQ0CKYlGab/aNuext4m+G7mxPRI1ygGdD0m9QjA71etHKo27XbX7IpdBX5faLSDYdiN4H6WaDDc8z3ZPIhfOxR24E3EJcBzapdiLDpTTwCOmGAVPPSsoBvSwY1RHkJ6OO6t7+gyjHpmid+NWR/B/c8Ky/kMwNpV/nHu2drQ+UfsPT9CXKEF/WqebHXlhhUWMPg32wSiYQfxPupSPTrcE1iGb3J/tPfXkhApbIrin9243WiCJXAA5IPqP74+0yGnE7ZT1cJKlVPrnG3KCrdxnrvr1kKUY4HDMXN+wot0ZnHhmz7x9q1jj/KD4xiV81PguK7mjguQkM0CqAWlFGgypdGOML5aQlzGQQtfNwYzdo/HYHpI6oMT85dgJEJMa64OccNRsPMmuO3H2Rha9VjnIVq8B2F+ceLu5yrxTlz4AIot8ZLTGCyKMzgIZNSiunocSIVej7mzvSvOVRoUq3f4Bc2m5EK1wF9duTevB0W/tqHWqIDg40KKtALuu6MuHautUj35P32mxAF0gRnBTt4bcNt8OLtJdB/+W+TivDUF6vvFw1ufQuo8D4BpuNGVoub1jb5+mduFU1GJVvDf97LNlbtzcVZap+PrXNY+vaELBQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5269.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(26005)(83380400001)(66946007)(9686003)(55016002)(38100700002)(64756008)(66574015)(53546011)(76116006)(86362001)(122000001)(6636002)(186003)(8676002)(110136005)(66476007)(71200400001)(316002)(8936002)(38070700005)(508600001)(52536014)(66446008)(4326008)(2906002)(66556008)(7696005)(5660300002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1UzbkpFOG9RWGdHVUdkM1N2Rm9ZU29mVnZpeFRwd2JGbUlJOStNaWFGc2Zt?=
 =?utf-8?B?RW1HbVc1QlR2ZkhtZEV3OU1CalhUcmlEckVnbzNmQVNldWlFS1pXc2sxYW9L?=
 =?utf-8?B?MVNPYzhTaCtLMGNXTjRYd2V4S1Z2OVNUOWRkVkhpMWdrcG81WGhkVjEyMVBq?=
 =?utf-8?B?MnduQXBDZkt0OGJoYjl2Mk42WDQzVVZDWERORXdGdU1ZalZmcDVMSkpiUUpN?=
 =?utf-8?B?cTVoNmk3VkVKVWM4L1NrUjlyWUVWL3hBcE9EdTFJUE1BeTZpbnJRWmx5YnpI?=
 =?utf-8?B?d1J2OUUyQnVkQnJqeWhic2paZVZ4Yi9zQ2Q0ajYrOTVMNDZxRHF1OHA4b3g4?=
 =?utf-8?B?a1JWM2tLTUJnMUNVUUtlK0J6by9yMmEraHc2bXV6T09ydHp1bTh6UlI4S1d2?=
 =?utf-8?B?Mm9sQk15ZzNkU01KS1FwT2ZrdXJyaHBRby9oZWpwZG84Q283Z0hmY2ROVzla?=
 =?utf-8?B?RjR2alUyRUpVWUE1YWxRWURpakk2U1NLWDlKLzZkUk1jQU9TaTd2T2t5S21s?=
 =?utf-8?B?eVc2N1pULzMvYlhPK2t6UFBPS1RFaG00MnJpSXU2a3ZMM3dUQS9OVDVyZ29n?=
 =?utf-8?B?Wkh0RStMeGNlbTFWMDMxRzJEUmlBNDYwQ2pkV2VOQ1l5YjdqL3JnMXM3VGd5?=
 =?utf-8?B?eWxFQ1lZaDFVUUYrK2QzVjNhdW1VeExrRU9NZVBKTFFRK1RDZWRJUXV1WHM5?=
 =?utf-8?B?d1JZYU8wRU1NMFZsYkN6cllMa05qQzFHc1BnRVhCeTZCOWNEdmgzUmFzQks2?=
 =?utf-8?B?dGpRY0VDQUtEWmQ4c29yOFNmVElyTE1YQm5BMzV0dWxpOElCaHRJZzN5cW4y?=
 =?utf-8?B?U0RjVUxnTmVRS2svRm9Fdy9OT2ZLVlRaSDJzOExteStNMjdKRjJPbnJMdjA0?=
 =?utf-8?B?NXlrcmkvZjk1ak52ellCYXpOTysxWTYycC9sbXpwRFBnanEzY2tpekMvMkR2?=
 =?utf-8?B?eng5R2dPZVUyMzZQazY0MmwvZmduNUhlWEE3dHl1ZVY5VHQ1QzVzRkVNUVBm?=
 =?utf-8?B?RXNRek1qRFV4RHo1SldWWHFXeEVacU5PNkM4VngyNFlEWlB1MEhlaDQ4MEtJ?=
 =?utf-8?B?Z0Z2QkJSZ1BsOHdpa2xyRG1MY3FaVkdIYzdaY29Cb2ltYm9GYUF4NGNjRDJQ?=
 =?utf-8?B?ZXFUaFJkTk1LWW1OTk81ak5CWklVbnR3MmMwM3hLM2JLSmUwRVRJME96WmRn?=
 =?utf-8?B?VzFheDVPQ2Nmb0pvQy9RdExpd2poSEJ1aDBpT3JJM1Z0NkZDRWpsQ29aNDN0?=
 =?utf-8?B?TzVJdnQ5b1A3Vi8xZ1oyMzZNZE5JRVpleldWbURSWnZQR3FXdTluaVdHSVN4?=
 =?utf-8?B?bjcrMmZEZW83L1l1dFRpeGxhNUJYUHRLZDNNZ1Q3UUovQ0FYaXJyNCtxNndL?=
 =?utf-8?B?bjJNSk44UWJNSW12bmhkR1ZlNFZrLzJnN2psWGdnSk5FK2tGUkhTRCtkR09z?=
 =?utf-8?B?a0NDZXVwOWowRXVtU3ZObTlsM0hZQWpOd0NHUXBYYnIxb1QxblMxOEN4S3hz?=
 =?utf-8?B?VGltZ0FlTUkxY1VqaXMwMEJSYWRHOU5jWFBTQkovcE1RWmY4OXM4OU1VOWdO?=
 =?utf-8?B?VWNhbStXVmtSRWJmVlRRMEZnWWc5d0hpdVgzVWtoc0w1Z0RoNWpXWWFPRHVB?=
 =?utf-8?B?eHZjbEsxUmt0RWJCQUl2RzR3cHN6UzNJZkt1VkY1aEwvOWRZOXJSL3JmWkFp?=
 =?utf-8?B?T2t6V2dMUWplZlk1b2ZKdTY5ZGVTV0dOMTBoNm1ta21NWS9mTklVSUFtQVQ4?=
 =?utf-8?Q?eZjRBV9IR6O2vpHGx69/oR0C6twrQUWyVgnneQ2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5269.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b23fb4ad-1be3-404f-7892-08d9692ed714
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2021 07:46:54.5838 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v8E7vTsfwrDEF+WxRNPvCsVlbqdtP4pV2a1P+EFuRBCzlP45J5NktoWDZk49uhqa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5223
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KWWVhaCwgdGhhdCAia3RocmVhZF9zaG91bGRfcGFy
ayIgaXMgYWxzbyBpcnJlbGV2YW50IGxvb2tzIHRvIG1lIGFzIHdlbGwgYW5kIGl0IGRlbGF5cyB0
aGUgc2lnbmFsZWQgam9iJ3MgY2xlYW51cC9mcmVlDQoNClRoYW5rcyANCg0KLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpNb25rIExpdSB8IENsb3VkLUdQVSBDb3Jl
IHRlYW0NCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IA0KU2VudDogRnJpZGF5LCBBdWd1c3QgMjcsIDIwMjEg
MjoxMiBQTQ0KVG86IEdyb2R6b3Zza3ksIEFuZHJleSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNv
bT47IExpdSwgTW9uayA8TW9uay5MaXVAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRy
bS9zY2hlZDogZml4IHRoZSBidWcgb2YgdGltZSBvdXQgY2FsY3VsYXRpb24odjMpDQoNCkkgZG9u
J3QgdGhpbmsgdGhhdCB0aGlzIHdpbGwgYmUgbmVjZXNzYXJ5IG5vciBkZXNpcmVkLg0KDQpTZWUg
dGhlIGpvYiBzaG91bGQgYmUgY2xlYW5lZCB1cCBhcyBzb29uIGFzIHBvc3NpYmxlIGFmdGVyIGl0
IGlzIGZpbmlzaGVkIG9yIG90aGVyd2lzZSB3ZSB3b24ndCBjYW5jZWwgdGhlIHRpbWVvdXQgcXVp
Y2sgZW5vdWdoIGVpdGhlci4NCg0KQ2hyaXN0aWFuLg0KDQpBbSAyNi4wOC4yMSB1bSAyMjoxNCBz
Y2hyaWViIEFuZHJleSBHcm9kem92c2t5Og0KPiBBdHRhY2hlZCBxdWljayBwYXRjaCBmb3IgcGVy
IGpvYiBUVEwgY2FsY3VsYXRpb24gdG8gbWFrZSBtb3JlIHByZWNpc2VzIA0KPiBuZXh0IHRpbWVy
IGV4cGlyYXRpb24uIEl0J3Mgb24gdG9wIG9mIHRoZSBwYXRjaCBpbiB0aGlzIHRocmVhZC4gTGV0
IG1lIA0KPiBrbm93IGlmIHRoaXMgbWFrZXMgc2Vuc2UuDQo+DQo+IEFuZHJleQ0KPg0KPiBPbiAy
MDIxLTA4LTI2IDEwOjAzIGEubS4sIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOg0KPj4NCj4+IE9u
IDIwMjEtMDgtMjYgMTI6NTUgYS5tLiwgTW9uayBMaXUgd3JvdGU6DQo+Pj4gaXNzdWU6DQo+Pj4g
aW4gY2xlYW51cF9qb2IgdGhlIGNhbmNsZV9kZWxheWVkX3dvcmsgd2lsbCBjYW5jZWwgYSBUTyB0
aW1lciBldmVuIA0KPj4+IHRoZSBpdHMgY29ycmVzcG9uZGluZyBqb2IgaXMgc3RpbGwgcnVubmlu
Zy4NCj4+Pg0KPj4+IGZpeDoNCj4+PiBkbyBub3QgY2FuY2VsIHRoZSB0aW1lciBpbiBjbGVhbnVw
X2pvYiwgaW5zdGVhZCBkbyB0aGUgY2FuY2VsbGluZyANCj4+PiBvbmx5IHdoZW4gdGhlIGhlYWRp
bmcgam9iIGlzIHNpZ25hbGVkLCBhbmQgaWYgdGhlcmUgaXMgYSAibmV4dCIgam9iIA0KPj4+IHdl
IHN0YXJ0X3RpbWVvdXQgYWdhaW4uDQo+Pj4NCj4+PiB2MjoNCj4+PiBmdXJ0aGVyIGNsZWFudXAg
dGhlIGxvZ2ljLCBhbmQgZG8gdGhlIFREUiB0aW1lciBjYW5jZWxsaW5nIGlmIHRoZSANCj4+PiBz
aWduYWxlZCBqb2IgaXMgdGhlIGxhc3Qgb25lIGluIGl0cyBzY2hlZHVsZXIuDQo+Pj4NCj4+PiB2
MzoNCj4+PiBjaGFuZ2UgdGhlIGlzc3VlIGRlc2NyaXB0aW9uDQo+Pj4gcmVtb3ZlIHRoZSBjYW5j
ZWxfZGVsYXllZF93b3JrIGluIHRoZSBiZWdpbmluZyBvZiB0aGUgY2xlYW51cF9qb2IgDQo+Pj4g
cmVjb3ZlciB0aGUgaW1wbGVtZW50IG9mIGRybV9zY2hlZF9qb2JfYmVnaW4uDQo+Pj4NCj4+PiBU
T0RPOg0KPj4+IDEpaW50cm9kdWNlIHBhdXNlL3Jlc3VtZSBzY2hlZHVsZXIgaW4gam9iX3RpbWVv
dXQgdG8gc2VyaWFsIHRoZSANCj4+PiBoYW5kbGluZyBvZiBzY2hlZHVsZXIgYW5kIGpvYl90aW1l
b3V0Lg0KPj4+IDIpZHJvcCB0aGUgYmFkIGpvYidzIGRlbCBhbmQgaW5zZXJ0IGluIHNjaGVkdWxl
ciBkdWUgdG8gYWJvdmUgDQo+Pj4gc2VyaWFsaXphdGlvbiAobm8gcmFjZSBpc3N1ZSBhbnltb3Jl
IHdpdGggdGhlIHNlcmlhbGl6YXRpb24pDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBNb25rIExp
dSA8TW9uay5MaXVAYW1kLmNvbT4NCj4+PiAtLS0NCj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vc2No
ZWR1bGVyL3NjaGVkX21haW4uYyB8IDI1IA0KPj4+ICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0N
Cj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0p
DQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9t
YWluLmMNCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+Pj4g
aW5kZXggYTJhOTUzNi4uZWNmODE0MCAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
c2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVs
ZXIvc2NoZWRfbWFpbi5jDQo+Pj4gQEAgLTY3NiwxMyArNjc2LDcgQEAgZHJtX3NjaGVkX2dldF9j
bGVhbnVwX2pvYihzdHJ1Y3QgDQo+Pj4gZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQ0KPj4+IMKg
IHsNCj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fc2NoZWRfam9iICpqb2IsICpuZXh0Ow0KPj4+
IMKgIC3CoMKgwqAgLyoNCj4+PiAtwqDCoMKgwqAgKiBEb24ndCBkZXN0cm95IGpvYnMgd2hpbGUg
dGhlIHRpbWVvdXQgd29ya2VyIGlzIHJ1bm5pbmcgT1IgDQo+Pj4gdGhyZWFkDQo+Pj4gLcKgwqDC
oMKgICogaXMgYmVpbmcgcGFya2VkIGFuZCBoZW5jZSBhc3N1bWVkIHRvIG5vdCB0b3VjaCBwZW5k
aW5nX2xpc3QNCj4+PiAtwqDCoMKgwqAgKi8NCj4+PiAtwqDCoMKgIGlmICgoc2NoZWQtPnRpbWVv
dXQgIT0gTUFYX1NDSEVEVUxFX1RJTUVPVVQgJiYNCj4+PiAtwqDCoMKgwqDCoMKgwqAgIWNhbmNl
bF9kZWxheWVkX3dvcmsoJnNjaGVkLT53b3JrX3RkcikpIHx8DQo+Pj4gLcKgwqDCoMKgwqDCoMKg
IGt0aHJlYWRfc2hvdWxkX3BhcmsoKSkNCj4+PiArwqDCoMKgIGlmIChrdGhyZWFkX3Nob3VsZF9w
YXJrKCkpDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBOVUxMOw0KPj4NCj4+DQo+PiBJ
IGFjdHVhbGx5IGRvbid0IHNlZSB3aHkgd2UgbmVlZCB0byBrZWVwIHRoZSBhYm92ZSwgb24gdGhl
IG90aGVyIHNpZGUgDQo+PiAoaW4gZHJtX3NjaGVkX3N0b3ApIHdlIHdvbid0IHRvdWNoIHRoZSBw
ZW5kaW5nIGxpc3QgYW55d2F5IHVudGlsIA0KPj4gc2NoZWQgdGhyZWFkIGNhbWUgdG8gZnVsbCBz
dG9wIChrdGhyZWFkX3BhcmspLiBJZiB5b3UgZG8gc2VlIGEgcmVhc29uIA0KPj4gd2h5IHRoaXMg
bmVlZGVkIHRoZW4gYSBjb21tZW50IHNob3VsZCBiZSBoZXJlIGkgdGhpbmsuDQo+Pg0KPj4gQW5k
cmV5DQo+Pg0KPj4NCj4+PiBzcGluX2xvY2soJnNjaGVkLT5qb2JfbGlzdF9sb2NrKTsNCj4+PiBA
QCAtNjkzLDE3ICs2ODcsMjEgQEAgZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYihzdHJ1Y3QgDQo+
Pj4gZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQ0KPj4+IMKgwqDCoMKgwqAgaWYgKGpvYiAmJiBk
bWFfZmVuY2VfaXNfc2lnbmFsZWQoJmpvYi0+c19mZW5jZS0+ZmluaXNoZWQpKSB7DQo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIC8qIHJlbW92ZSBqb2IgZnJvbSBwZW5kaW5nX2xpc3QgKi8NCj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgbGlzdF9kZWxfaW5pdCgmam9iLT5saXN0KTsNCj4+PiArDQo+Pj4g
K8KgwqDCoMKgwqDCoMKgIC8qIGNhbmNlbCB0aGlzIGpvYidzIFRPIHRpbWVyICovDQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGNhbmNlbF9kZWxheWVkX3dvcmsoJnNjaGVkLT53b3JrX3Rkcik7DQo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgIC8qIG1ha2UgdGhlIHNjaGVkdWxlZCB0aW1lc3RhbXAgbW9yZSBh
Y2N1cmF0ZSAqLw0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBuZXh0ID0gbGlzdF9maXJzdF9lbnRy
eV9vcl9udWxsKCZzY2hlZC0+cGVuZGluZ19saXN0LA0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHR5cGVvZigqbmV4dCksIGxpc3QpOw0KPj4+
IC3CoMKgwqDCoMKgwqDCoCBpZiAobmV4dCkNCj4+PiArDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlm
IChuZXh0KSB7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmV4dC0+c19mZW5jZS0+
c2NoZWR1bGVkLnRpbWVzdGFtcCA9DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBqb2ItPnNfZmVuY2UtPmZpbmlzaGVkLnRpbWVzdGFtcDsNCj4+PiAtDQo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLyogc3RhcnQgVE8gdGltZXIgZm9yIG5leHQgam9iICovDQo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHJtX3NjaGVkX3N0YXJ0X3RpbWVvdXQoc2NoZWQpOw0K
Pj4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+Pj4gwqDCoMKgwqDCoCB9IGVsc2Ugew0KPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBqb2IgPSBOVUxMOw0KPj4+IC3CoMKgwqDCoMKgwqDCoCAvKiBxdWV1ZSB0
aW1lb3V0IGZvciBuZXh0IGpvYiAqLw0KPj4+IC3CoMKgwqDCoMKgwqDCoCBkcm1fc2NoZWRfc3Rh
cnRfdGltZW91dChzY2hlZCk7DQo+Pj4gwqDCoMKgwqDCoCB9DQo+Pj4gwqAgwqDCoMKgwqDCoCBz
cGluX3VubG9jaygmc2NoZWQtPmpvYl9saXN0X2xvY2spOw0KPj4+IEBAIC03OTEsMTEgKzc4OSw4
IEBAIHN0YXRpYyBpbnQgZHJtX3NjaGVkX21haW4odm9pZCAqcGFyYW0pDQo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoZW50aXR5ID0gZHJtX3NjaGVk
X3NlbGVjdF9lbnRpdHkoc2NoZWQpKSkgDQo+Pj4gfHwNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBrdGhyZWFkX3Nob3VsZF9zdG9wKCkpOw0KPj4+IMKg
IC3CoMKgwqDCoMKgwqDCoCBpZiAoY2xlYW51cF9qb2IpIHsNCj4+PiArwqDCoMKgwqDCoMKgwqAg
aWYgKGNsZWFudXBfam9iKQ0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNjaGVkLT5v
cHMtPmZyZWVfam9iKGNsZWFudXBfam9iKTsNCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAv
KiBxdWV1ZSB0aW1lb3V0IGZvciBuZXh0IGpvYiAqLw0KPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGRybV9zY2hlZF9zdGFydF90aW1lb3V0KHNjaGVkKTsNCj4+PiAtwqDCoMKgwqDCoMKgwqAg
fQ0KPj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWVudGl0eSkNCj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsNCg==
