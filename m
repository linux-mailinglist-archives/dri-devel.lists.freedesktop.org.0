Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEC344AEF7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 14:41:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B8C6E859;
	Tue,  9 Nov 2021 13:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1456E110;
 Tue,  9 Nov 2021 13:41:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dazH8cmfFDpMKqJbtcHLlBGUWOjqOzOmM03z8aPnBBb/Dl/eeCgLu1/f4DBsX87PTsg8v/HNTw7i7FPvHmleoL1fWTFSsMJxAFtH/nWStp9W4P81GqlZonL54Vu5Ls+qD+AKinxCpo33EZitdGxWCYk10F2LU18LrZx1lZARxnch5l5nonfkAyJJyPQVNRLftqViR1H8N0QKvNSHlI1bpRGoewZsUdwWKNHjJzgyhTmqu0DLllW4NzG9X8S/YVs+uYrYAMXrgnO90kXkOUH/RwZoK3p5WSC8CBrBOUTqHB8ctCLhu5oQj9hACT9EKu3l6onqPNdOi+G2gdtyHzqEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEsOTTpMWYw6WVf5ILvNITWawilMxBC3DptGH7I/bTE=;
 b=EZVdOK+3+CW+0qz/3ZbnUIqGmtDLzQeat7PcG3KL5/U94+jIwhVBU3ZvqU5AW+mJbf7qDWrEy1zVAM+QAKXvpFPgL4x0DRBLf+jcJzef7X24PqL3FUm8kiTR4MIudGeMwucZ1zXEn1lmWgKupBvZoRcbPsWA6DqjnOy77ej0sO857mPpHQixN8M9DtM8eSosJfTLmvw9N7jpwzXCXQ+trbRzjXFO5XWH5s1CidQrdzlC96pOS6Lk2IOX8YUOYNdK7/Y2dnHQ/4suW9m7s6CVyIcp0osMa84/Cpn2X+amd0VDAXeKUErgp/Oc3euR3jFwGD0E7hhTIZGlWxbZMTzMKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEsOTTpMWYw6WVf5ILvNITWawilMxBC3DptGH7I/bTE=;
 b=w0gI3gyXDgrS2Z7PMmIaZg6KFl3WzuQoyXVqDRmuUrfD8SZ8bc3i9BKNhYn4kcSpALxKvQtY/OUp07zFoJM84oylLA2W0LTXoLINePqoaEFJjKfl8BqzsESHvynbrB7l0ptqVUuPWhcoid+oIymMlfv4nnFgV5DqIzc5fEYGOEA=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.15; Tue, 9 Nov 2021 13:41:42 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::3070:7b8d:5f19:ce5f]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::3070:7b8d:5f19:ce5f%8]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 13:41:42 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: =?utf-8?B?5Zue5aSNOiDlm57lpI06IOWbnuWkjTogW1BBVENIXSBkcm0vdHRtOiBQdXQg?=
 =?utf-8?Q?BO_in_its_memory_manager's_lru_list?=
Thread-Topic: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRDSF0gZHJtL3R0bTogUHV0IEJPIGluIGl0?=
 =?utf-8?Q?s_memory_manager's_lru_list?=
Thread-Index: AQHX1VvXjWHPm2/pokm2eFnZq+sX9Kv7Hb8AgAAAQ4eAAAO0AIAAAa9XgAAIFFuAAAJgAIAAANYs
Date: Tue, 9 Nov 2021 13:41:42 +0000
Message-ID: <DM4PR12MB51658C237B36EE47DDC68F9D87929@DM4PR12MB5165.namprd12.prod.outlook.com>
References: <20211109111954.41968-1-xinhui.pan@amd.com>
 <da46c607-1a3c-7ea9-92ef-78a2b60d38c9@amd.com>
 <DM4PR12MB51653AB0F1A0B89A41782B1087929@DM4PR12MB5165.namprd12.prod.outlook.com>
 <76d78ff7-efe4-4796-ec18-a668757f2e04@amd.com>
 <DM4PR12MB51657C53FAA6C096884118AD87929@DM4PR12MB5165.namprd12.prod.outlook.com>
 <DM4PR12MB51658A8C75586BCC2B0BDA6487929@DM4PR12MB5165.namprd12.prod.outlook.com>
 <5b2e8116-7bff-604c-5b9a-e37e29d66dd0@amd.com>
In-Reply-To: <5b2e8116-7bff-604c-5b9a-e37e29d66dd0@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-11-09T13:41:42.100Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
suggested_attachment_session_id: 19c09935-0983-f0c4-f0ca-436c1c6a5df7
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b827e56a-c54a-4f73-a562-08d9a386aa51
x-ms-traffictypediagnostic: DM4PR12MB5390:
x-microsoft-antispam-prvs: <DM4PR12MB53907F3E1CFB8CC186377F7587929@DM4PR12MB5390.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JMwV2qZT9HYtULtDgUVv5XM64Jctq/+Xf+6tcjPOwhCMbOtnVL/Qx10LJBFmnNrU087z9SJDVYbnLL9EU2tWXtCR/MX+dN+HFnmGwA9RbbvXROkiydJK+0sChQzWy+NK8gbdoAcyHhchBmdLku7voCHZpgC3Z7o15jnFitpv9+qUt0AQUOCnho/Ecn1AFSIB6rXgRNIT8mUvnnCLhUpVco4h9FkpqQc9CBjBVRor4UaJACIzY5p0m1eKcBlviSzVlDRnu20ZnmSwfqrP0I7xSkB/UPzU98QGt4UIBLeBEzkYC6Zf2BmrZoNF9bAuhrVHjXDtOvD0c6jFTb+kdCNU4anYWhVVUXuN0oisbKzHHPHEpCskwvkn3PL4dsKq1euR66VbAWaptY4Yqz36RjjfB/L20gfmIhiIMmg+nTJH87f0wpmeogYdhn2ken+A/hD2VJEm1UTQP1PNSx4h+VGeP/QMQFmsw3g+flL6xvQKndp3B5qY0nZ9Wzu/4DC6O1UdRa3/GKpj8PAe4l7Z/XRmETZdt71lK/hVBQA9PDau4PmtUHSENrpDun0wdJoWJL+OJI/lfpPbo8TzoTMxwIc36AeWcm+cgOf9cBiJY8kBfn+/XxfJEgUvjzyHDhjE+L8ulGYUOQsGsiODLD+YJhh1RUhX6nMUSh4mi2uC6eTObmp2f1xQTcrZmTEZr+aqAksAn5uoW7LWOn1JFGhT3zFi4Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38070700005)(186003)(5660300002)(508600001)(316002)(26005)(52536014)(8936002)(110136005)(33656002)(86362001)(224303003)(66574015)(66476007)(6506007)(91956017)(9686003)(7696005)(76116006)(71200400001)(4326008)(450100002)(66946007)(64756008)(2906002)(83380400001)(66446008)(66556008)(122000001)(38100700002)(55016002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDViVUVybG4vVzdlSSs2amFiOTBhRDhRaGhBdzc5RzhOYU1sT2dnRHhtbG1E?=
 =?utf-8?B?YU9Lb2NGOEdWVlZ1WW1LOEIyaUhjT0g2RnBFSTdzVjNtS3FKczNUOGJJOXRz?=
 =?utf-8?B?bEZveW9hUWI5K0pVckxCZytQVjk4SWxWUDIzYUhGdFZJZkpEejE5VG5LTUx0?=
 =?utf-8?B?R25pVXprNG1zUUdHUGtYdVE2UkdSNXVDbVJIZzZpTDlLOFF0dWh1TEJlQzVl?=
 =?utf-8?B?Z3FQcTd1SjlLRmI0NVdOZSs0Um51dDNZUHdZOEJuTjUvNUM2QXo3ZjhNT0JF?=
 =?utf-8?B?ZXRqYklkRGQ5TEZWZ3lUVURkdFVDc3R5cXlNUHZaSVg0M1B5RlI5MFVtMmlx?=
 =?utf-8?B?OXNTMHdZZ0FiV0lQd1BhQWtvZDdOdDNzVnV0eXkxL3FJTUl5TnMvWS9tY2Fu?=
 =?utf-8?B?WnRvc1RKcnc0eHpJa1FGKzdHdjl1elRwVjY4Z2grQzlTZWJYSEJ6N1JpNDZI?=
 =?utf-8?B?K2dsMWRpa3gwc2kzQ1AwR0pTam1qU3NvK3JWRzh2MkVqblA3bGlZeXJJdTVR?=
 =?utf-8?B?M2sva3cxQ0RRK3BEOHU2dk1sRFVuSTVpanN4OUpHL3dBM3JhT2J4ZXk5R05E?=
 =?utf-8?B?bFpleW1MWDJrN2RORHhrb2pDbTZTK2dhOURIWmJiUXA4L0xBcE5OR3FEb3Zi?=
 =?utf-8?B?Y0RxVU9HZFNvODNOZG1YNmVydDRmV29SRm4zd2pKRHBOSk9FNUdyb0lZQ3Rq?=
 =?utf-8?B?ekpFNHduNmdPakwwTkpzZkh6M2F3cE5sNkliMWpXUnh1eWJmcE01NUZndXBM?=
 =?utf-8?B?N2FZM094UTJyM0NlSzBQbUJSak5jUFYyM05sY1pZUEtBTnZXaDBDRlplTGIr?=
 =?utf-8?B?Z2Y4SlNJSmR2TUUzMDgzTnk3UEhEVUd0Sy9Kb0NBSENPeENodFRON0FxK3J5?=
 =?utf-8?B?TGFsVUZ6NEEwRXA5SEVSMXhwcDNpOVNUdWljcTJhVjZGU2IrdmY1WUl1UW5o?=
 =?utf-8?B?MkRPTVZaa0k2YWVILzEzcnRlWHlISnZPeXBvcFR6LzZmTGd1SUNqeFduUzlQ?=
 =?utf-8?B?RVR0eGRtcStJQWd0NEhBd0ZubUJMT01tVThXeUhsdVVOMnJKMUlBN25mbUEv?=
 =?utf-8?B?Mm1wMXpVS1o1QXZQL1p4QVlET0NVeDVXSlBSL2VJTVp2Qi82eEhrUVc0TitP?=
 =?utf-8?B?Zllsc2cxSnBjL1pKNU9TWWFKWGVtV1MwTTlXckF2YklqMER2UTVJZHJ0VDJV?=
 =?utf-8?B?d01EWTFZbVExeUIra3QvUzl1RWtOU0F2SVRSUGt0ZjZBRENYOGxTY3Vyemtl?=
 =?utf-8?B?b3dDVDlsOW91S012bEU1SzBkTXNiZHBnSnR4UTFxcGhTbmJWazlHQ2treTJx?=
 =?utf-8?B?Wlp6ckVna1V5TEJnMTdxRWJBQzV6T1EwWE1UTmtuN2pzU1haT1lXaWwzazVR?=
 =?utf-8?B?ZUVjWWlKV0d0THlOY3lJdE1EUE9tdE0rYm9UTUVOTWNIVHhTUDhxUGR4aXhN?=
 =?utf-8?B?SEt4bGtBa0NSRHMyb0NaOExvc2JhTFRYVXJJNTFIYjdNbFd0WmlQZ210c05y?=
 =?utf-8?B?UmEycHJoOWwxTzBZaEF2K1pTcEZjUVlJcGI2VEZ2K0Qrb2RLNEJDcklOOU5M?=
 =?utf-8?B?cmdWeExLN25uMUQ1bnpRZi9aSm1nZVFrcnhkbDNYWStHbzRadnZrZmx1c0lL?=
 =?utf-8?B?bndzbWc5S0daWU9SOWIzMlpUWVNoSmpwYVpPOUhNREJrb1Z6VitOb3pVcHFp?=
 =?utf-8?B?RkpZSDNVWTNkYUovV3BFSDZHbTV0NUZTdldGTnBUc1M5aU1XRGRzaFYyWDYr?=
 =?utf-8?B?VXJqb2x1L0lpc3ZlaEVNMU1PVGs0TldnM2pQWXgzdVRwYXhtWGRBTTEvRVkx?=
 =?utf-8?B?MUcyWFFQL29XMGNWUXBPdUtqdTByanRzUEQ4Nk9rWlpBRWM5SFVqVmpENGVN?=
 =?utf-8?B?Uk9OLzJjTndEeWdmZThwQ2NvU20zeWxHZFhDWXVrWFZPcjFEc0JrbkhzakZn?=
 =?utf-8?B?OERXRWhQVnNGaUhNSVBLTmVOd3pDai82MytTK0FhS1ZKNFlrZkhyMHhFRlRW?=
 =?utf-8?B?QjNrWUlnUnBpV3YxSEdPcE1LaS9zR05XZGJPdEl6K1dQdEhpN0NjajBUc0Fq?=
 =?utf-8?B?cGdqMXViSDZ1a3VjYVFzbm1wL1JucWhXemdDWDdtRThjc2ZtNUllWlZicjl1?=
 =?utf-8?Q?JO58=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b827e56a-c54a-4f73-a562-08d9a386aa51
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 13:41:42.7490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TNW1Viv6dISSxcLOtFmV+qKiRNS2kJKQMTWNQ9/yZCB7FLCRToymWyjBsT1oAPn4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5390
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KeWVzLCBhIGRvdWJsZSBjaGVjayBpcyBuZWVkZWQu
DQpob3cgYWJvdXQgY2hhbmdlIGJlbG93Lg0KDQpBcyBsb25nIGFzIHdlIGRldGVjdCBzdWNoIG1p
c21hdGNoLCBpdCBpbmRpY2F0ZXMgYW5vdGhlciBldmljdGlvbiBpcyBvbiBnb2luZy4gcmV0dXJu
IGZhbHNlIGhlcmUgaXMgcmVhc29uYWJsZS4NCg0KQEAgLTEzMzUsNiArMTMzNiw4IEBAIHN0YXRp
YyBib29sIGFtZGdwdV90dG1fYm9fZXZpY3Rpb25fdmFsdWFibGUoc3RydWN0IHR0bV9idWZmZXJf
b2JqZWN0ICpibywNCiAgICAgICAgc3RydWN0IGRtYV9mZW5jZSAqZjsNCiAgICAgICAgaW50IGk7
DQoNCisgICAgICAgaWYgKGJvLT5yZXNvdXJjZS0+bWVtX3R5cGUgIT0gcGxhY2UtPm1lbV90eXBl
KQ0KKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsNCiAgICAgICAgLyogU3dhcG91dD8gKi8N
CiAgICAgICAgaWYgKGJvLT5yZXNvdXJjZS0+bWVtX3R5cGUgPT0gVFRNX1BMX1NZU1RFTSkNCiAg
ICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0K5Y+R5Lu25Lq6OiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktv
ZW5pZ0BhbWQuY29tPg0K5Y+R6YCB5pe26Ze0OiAyMDIx5bm0MTHmnIg55pelIDIxOjE4DQrmlLbk
u7bkuro6IFBhbiwgWGluaHVpOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K5oqE6YCB
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQrkuLvpopg6IFJlOiDlm57lpI06IOWb
nuWkjTogW1BBVENIXSBkcm0vdHRtOiBQdXQgQk8gaW4gaXRzIG1lbW9yeSBtYW5hZ2VyJ3MgbHJ1
IGxpc3QNCg0KRXhhY3RseSB0aGF0J3MgdGhlIHJlYXNvbiB3aHkgd2Ugc2hvdWxkIGhhdmUgdGhl
IGRvdWJsZSBjaGVjayBpbiBUVE0NCkkndmUgbWVudGlvbmVkIGluIHRoZSBvdGhlciBtYWlsLg0K
DQpDaHJpc3RpYW4uDQoNCkFtIDA5LjExLjIxIHVtIDE0OjE2IHNjaHJpZWIgUGFuLCBYaW5odWk6
DQo+IFtBTUQgT2ZmaWNpYWwgVXNlIE9ubHldDQo+DQo+IEFjdHVhbGx5IHRoaXMgcGF0Y2ggZG9l
cyBub3QgdG90YWxseSBmaXggdGhlIG1pc21hdGNoIG9mIGxydSBsaXN0IHdpdGggbWVtX3R5cGUg
YXMgbWVtX3R5cGUgaXMgY2hhbmdlZCBpbiAtPm1vdmUoKSBhbmQgbHJ1IGxpc3QgaXMgY2hhbmdl
ZCBhZnRlciB0aGF0Lg0KPg0KPiBEdXJpbmcgdGhpcyBzbWFsbCBwZXJpb2QsIGFub3RoZXIgZXZp
Y3Rpb24gY291bGQgc3RpbGwgaGFwcGVkIGFuZCBldmljdCB0aGlzIG1pc21hdGNoZWQgQk8gZnJv
bSBzTWFtKHNheSwgaXRzIGxydSBsaXN0IGlzIG9uIHZyYW0gZG9tYWluKSB0byBzTWVtLg0KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IOWPkeS7tuS6ujogUGFu
LCBYaW5odWkgPFhpbmh1aS5QYW5AYW1kLmNvbT4NCj4g5Y+R6YCB5pe26Ze0OiAyMDIx5bm0MTHm
nIg55pelIDIxOjA1DQo+IOaUtuS7tuS6ujogS29lbmlnLCBDaHJpc3RpYW47IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IOaKhOmAgTogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiDkuLvpopg6IOWbnuWkjTog5Zue5aSNOiBbUEFUQ0hdIGRybS90dG06IFB1dCBCTyBp
biBpdHMgbWVtb3J5IG1hbmFnZXIncyBscnUgbGlzdA0KPg0KPiBZZXMsIGEgc3RhYmxlIHRhZyBp
cyBuZWVkZWQuIHZ1bGthbiBndXlzIHNheSA1LjE0IGhpdCB0aGlzIGlzc3VlIHRvby4NCj4NCj4g
SSB0aGluayB0aGF0IGFtZGdwdV9ib19tb3ZlKCkgZG9lcyBzdXBwb3J0IGNvcHkgZnJvbSBzeXNN
ZW0gdG8gc3lzTWVtIGNvcnJlY3RseS4NCj4gbWF5YmUgc29tZXRoaW5nIGJlbG93IGlzIG5lZWRl
ZC4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPiBpbmRleCBjODNl
ZjQyY2E3MDIuLmFhNjNhZTdkZGYxZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90dG0uYw0KPiBAQCAtNDg1LDcgKzQ4NSw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2Jv
X21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgYm9vbCBldmljdCwNCj4gICAgICAg
ICAgfQ0KPiAgICAgICAgICBpZiAob2xkX21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1NZU1RFTSAm
Jg0KPiAgICAgICAgICAgICAgKG5ld19tZW0tPm1lbV90eXBlID09IFRUTV9QTF9UVCB8fA0KPiAt
ICAgICAgICAgICAgbmV3X21lbS0+bWVtX3R5cGUgPT0gQU1ER1BVX1BMX1BSRUVNUFQpKSB7DQo+
ICsgICAgICAgICAgICBuZXdfbWVtLT5tZW1fdHlwZSA9PSBBTURHUFVfUExfUFJFRU1QVCB8fA0K
PiArICAgICAgICAgICAgbmV3X21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1NZU1RFTSkpIHsNCj4g
ICAgICAgICAgICAgICAgICB0dG1fYm9fbW92ZV9udWxsKGJvLCBuZXdfbWVtKTsNCj4gICAgICAg
ICAgICAgICAgICBnb3RvIG91dDsNCj4gICAgICAgICAgfQ0KPg0KPiBvdGhlcndpc2UsIGFtZGdw
dV9tb3ZlX2JsaXQoKSBpcyBjYWxsZWQgdG8gZG8gdGhlIHN5c3RlbSBtZW1vcnkgY29weSB3aGlj
aCB1c2UgYSB3cm9uZyBhZGRyZXNzLg0KPiAgIDIwNiAgICAgICAgIC8qIE1hcCBvbmx5IHdoYXQg
Y2FuJ3QgYmUgYWNjZXNzZWQgZGlyZWN0bHkgKi8NCj4gICAyMDcgICAgICAgICBpZiAoIXRteiAm
JiBtZW0tPnN0YXJ0ICE9IEFNREdQVV9CT19JTlZBTElEX09GRlNFVCkgew0KPiAgIDIwOCAgICAg
ICAgICAgICAgICAgKmFkZHIgPSBhbWRncHVfdHRtX2RvbWFpbl9zdGFydChhZGV2LCBtZW0tPm1l
bV90eXBlKSArDQo+ICAgMjA5ICAgICAgICAgICAgICAgICAgICAgICAgIG1tX2N1ci0+c3RhcnQ7
DQo+ICAgMjEwICAgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gICAyMTEgICAgICAgICB9DQo+
DQo+IGxpbmUgMjA4LCAqYWRkciBpcyB6ZXJvLiBTbyB3aGVuIGFtZGdwdV9jb3B5X2J1ZmZlciBz
dWJtaXQgam9iIHdpdGggc3VjaCBhZGRyLCBwYWdlIGZhdWx0IGhhcHBlbnMuDQo+DQo+DQo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4g5Y+R5Lu25Lq6OiBLb2Vu
aWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPiDlj5HpgIHml7bpl7Q6
IDIwMjHlubQxMeaciDnml6UgMjA6MzUNCj4g5pS25Lu25Lq6OiBQYW4sIFhpbmh1aTsgYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g5oqE6YCBOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IOS4u+mimDogUmU6IOWbnuWkjTogW1BBVENIXSBkcm0vdHRtOiBQdXQgQk8g
aW4gaXRzIG1lbW9yeSBtYW5hZ2VyJ3MgbHJ1IGxpc3QNCj4NCj4gTWhtLCBJJ20gbm90IHN1cmUg
d2hhdCB0aGUgcmF0aW9uYWwgYmVoaW5kIHRoYXQgaXMuDQo+DQo+IE5vdCBtb3ZpbmcgdGhlIEJP
IHdvdWxkIG1ha2UgdGhpbmdzIGxlc3MgZWZmaWNpZW50LCBidXQgc2hvdWxkIG5ldmVyDQo+IGNh
dXNlIGEgY3Jhc2guDQo+DQo+IE1heWJlIHdlIHNob3VsZCBhZGQgYSBDQzogc3RhYmxlIHRhZyBh
bmQgcHVzaCBpdCB0byAtZml4ZXMgaW5zdGVhZD8NCj4NCj4gQ2hyaXN0aWFuLg0KPg0KPiBBbSAw
OS4xMS4yMSB1bSAxMzoyOCBzY2hyaWViIFBhbiwgWGluaHVpOg0KPj4gW0FNRCBPZmZpY2lhbCBV
c2UgT25seV0NCj4+DQo+PiBJIGhpdCB2dWxrYW4gY3RzIHRlc3QgaGFuZyB3aXRoIG5hdmkyMy4N
Cj4+DQo+PiBkbWVzZyBzYXlzIGdtYyBwYWdlIGZhdWx0IHdpdGggYWRkcmVzcyAweDAsIDB4MTAw
MCwgMHgyMDAwLi4uLg0KPj4gQW5kIHNvbWUgZGVidWcgbG9nIGFsc28gc2F5cyBhbWRndSBjb3B5
IG9uZSBCTyBmcm9tIHN5c3RlbSBEb21haW4gdG8gc3lzdGVtIERvbWFpbiB3aGljaCBpcyByZWFs
bHkgd2VpcmQuDQo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+
PiDlj5Hku7bkuro6IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+
DQo+PiDlj5HpgIHml7bpl7Q6IDIwMjHlubQxMeaciDnml6UgMjA6MjANCj4+IOaUtuS7tuS6ujog
UGFuLCBYaW5odWk7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiDmioTpgIE6IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IOS4u+mimDogUmU6IFtQQVRDSF0gZHJt
L3R0bTogUHV0IEJPIGluIGl0cyBtZW1vcnkgbWFuYWdlcidzIGxydSBsaXN0DQo+Pg0KPj4gQW0g
MDkuMTEuMjEgdW0gMTI6MTkgc2NocmllYiB4aW5odWkgcGFuOg0KPj4+IEFmdGVyIHdlIG1vdmUg
Qk8gdG8gYSBuZXcgbWVtb3J5IHJlZ2lvbiwgd2Ugc2hvdWxkIHB1dCBpdCB0bw0KPj4+IHRoZSBu
ZXcgbWVtb3J5IG1hbmFnZXIncyBscnUgbGlzdCByZWdhcmRsZXNzIHdlIHVubG9jayB0aGUgcmVz
diBvciBub3QuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiB4aW5odWkgcGFuIDx4aW5odWkucGFu
QGFtZC5jb20+DQo+PiBJbnRlcmVzdGluZyBmaW5kLCBkaWQgeW91IHRyaWdnZXIgdGhhdCBzb21l
aG93IG9yIGRpZCB5b3UganVzdCBzdHVtYmxlZA0KPj4gb3ZlciBpdCBieSByZWFkaW5nIHRoZSBj
b2RlPw0KPj4NCj4+IFBhdGNoIGlzIFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+LCBJIHdpbGwNCj4+IHBpY2sgdGhhdCB1cCBmb3IgZHJtLW1p
c2MtbmV4dC4NCj4+DQo+PiBUaGFua3MsDQo+PiBDaHJpc3RpYW4uDQo+Pg0KPj4+IC0tLQ0KPj4+
ICAgICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIHwgMiArKw0KPj4+ICAgICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMNCj4+PiBp
bmRleCBmMTM2NzEwNzkyNWIuLmUzMDcwMDRmMGIyOCAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym8uYw0KPj4+IEBAIC03MDEsNiArNzAxLDggQEAgaW50IHR0bV9tZW1fZXZpY3RfZmlyc3Qoc3Ry
dWN0IHR0bV9kZXZpY2UgKmJkZXYsDQo+Pj4gICAgICAgICByZXQgPSB0dG1fYm9fZXZpY3QoYm8s
IGN0eCk7DQo+Pj4gICAgICAgICBpZiAobG9ja2VkKQ0KPj4+ICAgICAgICAgICAgICAgICB0dG1f
Ym9fdW5yZXNlcnZlKGJvKTsNCj4+PiArICAgICBlbHNlDQo+Pj4gKyAgICAgICAgICAgICB0dG1f
Ym9fbW92ZV90b19scnVfdGFpbF91bmxvY2tlZChibyk7DQo+Pj4NCj4+PiAgICAgICAgIHR0bV9i
b19wdXQoYm8pOw0KPj4+ICAgICAgICAgcmV0dXJuIHJldDsNCg0K
