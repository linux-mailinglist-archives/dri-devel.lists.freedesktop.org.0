Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BB144AE95
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 14:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06AE8970E;
	Tue,  9 Nov 2021 13:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B92893A2;
 Tue,  9 Nov 2021 13:16:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0/KNcn0YQEIi4a1UqXfNObrV5f276pyRZJCA0alEaHG0H0CHrZEIJo0q/u3ZW5Pu3sYKQvtUJ3oRpyNwfIIcm5v0jCkle9W/UUKZN45wgy0b+ibIDxoG/EYpTOqc80Xqy6j57KkpSOmPUwwaI0MZOdm/H8+RhRPwsMAQocdmuyq5UZcrGKT27clsCkJmSvyce5k6fCAIgAEuCunyJu5Modfh/izcSl+dTv3j62PH5XMni5cTKX1W/bqJZc1XNF303AVO+Bss/Fw32a/EQlCFQlP36kXZ00RWCS8kRqdCicnGBICVM+bpnNNyMRM04FF7Z1840CtwFSYipo+ZgyNgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPKWIaU9c5l4F0NorzLLaVTxW5NhkijlH7NoRubdrZ0=;
 b=VbqqyPu3BKI0bW69WoJ1oRSPDWMFBvIWjfSnCPwRylVt44zBn+rC4HtLkr3oTPaTENOFbmfFw/nGSMgmXxJ6UK7lCEmIS/bN/WH2qRXqpDwyiHlfrWbJYl2zJquxAkRJAW4elVoCwg8wCWxnUguuJ2L5P+ijkHejVssalr44ZK9v5+7sCzYy1qySAjJZgej2w8wAgaAH+N01D0crrs4ZPrc2iV2iMH03QAiMSZE3wjkqfggQMGcM2dTNcXYhEChOZVYJFdy3DXWWxGK9W5/K7ebPMdrdQZUaKVBQiLZ4h3Xgf/NqwFEkjRO6YIhkOrEK5UH55IJSfc38QXaXU7RmWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPKWIaU9c5l4F0NorzLLaVTxW5NhkijlH7NoRubdrZ0=;
 b=ey5N4+swh/2BcQz7XC/96NO2z0KS376OSuaWQYBqi89zETXp30vUIysuP3FVmYJyXzaNS6VpXu7TQEbGz7rZRUQrTDBXa12qW9Wn0JNSpMhndAb9W6z8/B05tNKEtvf8ACFu32iLc/SPVYm1HZCb5xAHXREv0P3Sqct9bHTl9j0=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM4PR12MB5373.namprd12.prod.outlook.com (2603:10b6:5:39a::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.15; Tue, 9 Nov 2021 13:16:00 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::3070:7b8d:5f19:ce5f]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::3070:7b8d:5f19:ce5f%8]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 13:16:00 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRDSF0gZHJtL3R0bTogUHV0IEJPIGluIGl0?=
 =?utf-8?Q?s_memory_manager's_lru_list?=
Thread-Topic: =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIGRybS90dG06IFB1dCBCTyBpbiBpdHMgbWVtb3J5?=
 =?utf-8?Q?_manager's_lru_list?=
Thread-Index: AQHX1VvXjWHPm2/pokm2eFnZq+sX9Kv7Hb8AgAAAQ4eAAAO0AIAAAa9XgAAIFFs=
Date: Tue, 9 Nov 2021 13:16:00 +0000
Message-ID: <DM4PR12MB51658A8C75586BCC2B0BDA6487929@DM4PR12MB5165.namprd12.prod.outlook.com>
References: <20211109111954.41968-1-xinhui.pan@amd.com>
 <da46c607-1a3c-7ea9-92ef-78a2b60d38c9@amd.com>
 <DM4PR12MB51653AB0F1A0B89A41782B1087929@DM4PR12MB5165.namprd12.prod.outlook.com>
 <76d78ff7-efe4-4796-ec18-a668757f2e04@amd.com>
 <DM4PR12MB51657C53FAA6C096884118AD87929@DM4PR12MB5165.namprd12.prod.outlook.com>
In-Reply-To: <DM4PR12MB51657C53FAA6C096884118AD87929@DM4PR12MB5165.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-11-09T13:15:59.367Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
suggested_attachment_session_id: 4953c3de-7d4d-c349-025a-c72601edacc7
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0605e3f1-f262-4c59-5a0b-08d9a38312e5
x-ms-traffictypediagnostic: DM4PR12MB5373:
x-microsoft-antispam-prvs: <DM4PR12MB5373583DF9F4A93EEABAE20087929@DM4PR12MB5373.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fVZ2k9kIzFaUpk8hiPvGJnuYbotsQF1mk5HJldGx4OXOR3o6iv9AmzOTWXlyGiEDtTgdyZJtPuLFzJ4MYab4v5JzI5u3OwabTe074emMJ9hM01sVvjuXawizuO5Vul5MxMCKrRz8tAr4YrR/NIJX6Z3BgavlnJ7MPn4NWIIoZ1OvWV+FZ2p64eDSSzGvBo3mCZeXfbCK+DzmUrx00bNW+1Ykl9Hk6ZEBwgUe8aM1sHMjgbB+M3ITu0+jg0FrtWyo1BpHqEDJqB/AB09wROXlWJL7sWD2NISjtUZb8olHUXZ9kfX6Dz4bTsbsDwpfy8z7Mw6zzXcgAn0elUjCu0Q7ZlD+rhn4ZJPcfh5sFszu9hcyaZPTlNtO8y0tFNgBpt4jJn1Bi1hKomvXKOoGAa7ga36rivx2jmvn8dn6w9XQgVwE96vmGXYb94ewtMGW24MJSX0iB4nA53EaY6VMcNq3xn4GyRB8ZCyWziU0km+v/A8V2a0MegEMhG8F+MPT4A+DcNBeMzgdBm7lzby4vQtEbIZwxDP8oi9ogzoBfawpnwYG0xMrX/qT4gLHUkt++VFKxGFfpJOkQKuGBo5/XDOwWsq5dXE9WgIjnaedLZo16bowOKujSzTgUliPoOxL+5+z0AvTIORoUoyN2j1u6g3Yj2i4Ds0zexZ6doir+QmwxjAk0988ZqqJxW34dzEp1IkKYHOs63yDLux0T9K/+qVdAg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(4326008)(224303003)(8936002)(26005)(450100002)(38070700005)(91956017)(76116006)(66946007)(66446008)(66556008)(5660300002)(66476007)(508600001)(33656002)(64756008)(2940100002)(316002)(7696005)(2906002)(186003)(122000001)(86362001)(6506007)(52536014)(38100700002)(55016002)(9686003)(83380400001)(71200400001)(66574015);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHVId0ozMFM1VjN2Ry9CbDdGbjcvL3J3YVJ1R25EN29lTWVrV01sbDlFc0gv?=
 =?utf-8?B?ampMR3VyYUMwUkFObzBiekI4ZW5DUFA3T2VDU0I0WXZ5R2VxaE1rM2IxZWt4?=
 =?utf-8?B?c2srV3JpT0ozQ3B3eXJtZzhWWCszVXcvY2U4bUFjN0hka25RVnFMWlg2UkZM?=
 =?utf-8?B?YVVoY2x2Q2t1enVUOGpJTTllS2dDY3Rldm1Nb2FnaWdRY2piM1ZLRzVieEN5?=
 =?utf-8?B?QzhyZ28xM2FuelpmVmJydXZpcHNKSzFBVlZ0eXduNXA1NmZNbmx6QUhkNE44?=
 =?utf-8?B?YS9pODdFRElQREFjTkphZXJmR0p0L1NaVFNXZE1Hb3VtU3l1SC9PWUpGZWFp?=
 =?utf-8?B?NGk2K1k3MkpZeXFPKzFhWG93V1U2S3RTeFcyTXlLcjdFTlNYenJyMEliSHc5?=
 =?utf-8?B?d2FKUDNPU1pVUkZoL0N2MVV0OUIxdytva2syTzRFVFhJc01RSk52eXpuNEZm?=
 =?utf-8?B?RmNBNUpabmh6YW4xRXB4RXpWdVpOWk95T3pJUEcyaXlwVTJ2MnAzUjI0eVN3?=
 =?utf-8?B?a245MzNLWFNmbXo3RlEzL3pONHRIejVIeFZHaTNCRHJ0UkE2Ykx3b2laZGRD?=
 =?utf-8?B?UEJJMDNHcnQrdW11NVkrbHB0U05JUXQ5OUIyQStpVzBOWXRnYkZpWkt2bjIv?=
 =?utf-8?B?K01oamJLeG1SQ285dldVN053aHFOOTAwaGo4U2VMdGVPZTR4L3VlN09vM0Rh?=
 =?utf-8?B?a1R3aHBPbjJ4SFpQZmZPdmFESGkzQTNoWTRucCs5SU52V3ZKejJscFNZbWZB?=
 =?utf-8?B?OVZpTnNTRmFqcGU4MUROYktOVnF0SWZ3eGl1THY5YXZXeXVjTVpIeGtIMHRZ?=
 =?utf-8?B?bjlBODV4bm00MHdLbmJtVnNvUTdmVFhOTGxBL09BcnNWR0VEK0c0SDk0SFFD?=
 =?utf-8?B?NDh1NHNaL2NRdDJxcWNhd3Q2aTZrY0FFeXJENVVkSnlrcXJuTitqMFhlWnZB?=
 =?utf-8?B?NEs4cnkrVm9XZEZ5VllOL0c3WWIzTzNIUEVwTXoxQ2F4RWhoU3drNXBJOUJU?=
 =?utf-8?B?U1pkK2E3RlBydVR2aGtRNjMvanJTTHM5RjY4VTJzUmg4ZGZOMXZEUkpob1dH?=
 =?utf-8?B?L0hKSkNNcmUvOEdxa0c0NFhwakl6UDJoUC9RZnk0M2xFMDhoaVZqd01BWDB6?=
 =?utf-8?B?a0d0UTdXSithckd5SytFaW5LWFZ6OVNOY2Z6R3NOUGFyNlF4ejZCSUVqOWE5?=
 =?utf-8?B?UGx6S3lLSUl1N0wyWFp2WWx4L1R4RXpMOEhKSTFiWG8zRVlIM1BObkplVzVz?=
 =?utf-8?B?eVdwV1FXY1AzNkJuYWJjWHNlREJZVXdPREFvMXBlNHBCcEZMdlZqSk1OYTJ3?=
 =?utf-8?B?MU0zOTdvZTJscnFIMUd0dTJEaVJFTVY5ajRWaTc5VmRsWTF2ay9KMkMyaSts?=
 =?utf-8?B?TkdJQ2dpYnhrUjNjdkZoS2U5TGtwQVpSbmttRGFndFljQ25SZ3B2N1FHUmY4?=
 =?utf-8?B?UVQ5clFWSi82NEJ6aHZVc04rL1JLeCtlK09kdUJwNWVvRWpuMHp1OGtLWW5T?=
 =?utf-8?B?bDZaOWtUY3FCV2dVSHQveVlHM0p3bHRIaUhERnNPTUlSaVoxYkhqZ3F2c1Rx?=
 =?utf-8?B?eG5HZjVROUdUVlRHc2tUNFRhZ1R1dlYyMDBiUXlwZFNjTXVrZXhBUytKTEww?=
 =?utf-8?B?b09xOXVJVEJvUnI4YVYyblpkYWlRN0NoZGgwQnRVN2dWcXV1U1ZBcVpwT2N2?=
 =?utf-8?B?ZlhMdDRLSmN5Z3EweGV6alBBQkNaNzlpTEkvendDU0huOVdiS2cwU05aQzFl?=
 =?utf-8?B?UGtZOXJzQnBsZWdnNXJNT1ZuUlJ1b0gxZ2UvU09UellVSURMeWs5SllBY0pL?=
 =?utf-8?B?VmJnZmZzVkt4WS9aUjl0aUI2WndOYW00NWdlYTBhaHJhMXVOL2RwNFlDRSto?=
 =?utf-8?B?dzE3WHEzSjB6R2R4Sy9FNHpUaWlwUkVISTBaRWo2Y2dJWCtteHlYOTRpQzQv?=
 =?utf-8?B?VmZQdnllRFpRQzNVMWYzZ2xHUWZadGlDS2h4TmtqaDJ6RHFRWkhTOERvc2o1?=
 =?utf-8?B?UlN5WnQvd2tvNGNqVFZlcTU2c09JYm8wenpFZXFDVXVRWWtMZzRXUG5ISGxk?=
 =?utf-8?B?TzN0YU5FcDRKeVJhakM1bC9iSDkzUzE4QnBNWWpTTU14Wlh1aXY0eit4RlRh?=
 =?utf-8?Q?f3cA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0605e3f1-f262-4c59-5a0b-08d9a38312e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 13:16:00.0877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hX/FdL15kn+DzX0XZion0MEjQGz+hX3isCtN4rQ102rdIgAgmmHPVc4nnpPSjUBY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5373
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KQWN0dWFsbHkgdGhpcyBwYXRjaCBkb2VzIG5vdCB0
b3RhbGx5IGZpeCB0aGUgbWlzbWF0Y2ggb2YgbHJ1IGxpc3Qgd2l0aCBtZW1fdHlwZSBhcyBtZW1f
dHlwZSBpcyBjaGFuZ2VkIGluIC0+bW92ZSgpIGFuZCBscnUgbGlzdCBpcyBjaGFuZ2VkIGFmdGVy
IHRoYXQuDQoNCkR1cmluZyB0aGlzIHNtYWxsIHBlcmlvZCwgYW5vdGhlciBldmljdGlvbiBjb3Vs
ZCBzdGlsbCBoYXBwZWQgYW5kIGV2aWN0IHRoaXMgbWlzbWF0Y2hlZCBCTyBmcm9tIHNNYW0oc2F5
LCBpdHMgbHJ1IGxpc3QgaXMgb24gdnJhbSBkb21haW4pIHRvIHNNZW0uDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQrlj5Hku7bkuro6IFBhbiwgWGluaHVpIDxYaW5o
dWkuUGFuQGFtZC5jb20+DQrlj5HpgIHml7bpl7Q6IDIwMjHlubQxMeaciDnml6UgMjE6MDUNCuaU
tuS7tuS6ujogS29lbmlnLCBDaHJpc3RpYW47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQrmioTpgIE6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCuS4u+mimDog5Zue5aSN
OiDlm57lpI06IFtQQVRDSF0gZHJtL3R0bTogUHV0IEJPIGluIGl0cyBtZW1vcnkgbWFuYWdlcidz
IGxydSBsaXN0DQoNClllcywgYSBzdGFibGUgdGFnIGlzIG5lZWRlZC4gdnVsa2FuIGd1eXMgc2F5
IDUuMTQgaGl0IHRoaXMgaXNzdWUgdG9vLg0KDQpJIHRoaW5rIHRoYXQgYW1kZ3B1X2JvX21vdmUo
KSBkb2VzIHN1cHBvcnQgY29weSBmcm9tIHN5c01lbSB0byBzeXNNZW0gY29ycmVjdGx5Lg0KbWF5
YmUgc29tZXRoaW5nIGJlbG93IGlzIG5lZWRlZC4NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmMNCmluZGV4IGM4M2VmNDJjYTcwMi4uYWE2M2FlN2RkZjFlIDEwMDY0NA0KLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCkBAIC00ODUsNyArNDg1LDggQEAgc3Rh
dGljIGludCBhbWRncHVfYm9fbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBib29s
IGV2aWN0LA0KICAgICAgICB9DQogICAgICAgIGlmIChvbGRfbWVtLT5tZW1fdHlwZSA9PSBUVE1f
UExfU1lTVEVNICYmDQogICAgICAgICAgICAobmV3X21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1RU
IHx8DQotICAgICAgICAgICAgbmV3X21lbS0+bWVtX3R5cGUgPT0gQU1ER1BVX1BMX1BSRUVNUFQp
KSB7DQorICAgICAgICAgICAgbmV3X21lbS0+bWVtX3R5cGUgPT0gQU1ER1BVX1BMX1BSRUVNUFQg
fHwNCisgICAgICAgICAgICBuZXdfbWVtLT5tZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVNKSkgew0K
ICAgICAgICAgICAgICAgIHR0bV9ib19tb3ZlX251bGwoYm8sIG5ld19tZW0pOw0KICAgICAgICAg
ICAgICAgIGdvdG8gb3V0Ow0KICAgICAgICB9DQoNCm90aGVyd2lzZSwgYW1kZ3B1X21vdmVfYmxp
dCgpIGlzIGNhbGxlZCB0byBkbyB0aGUgc3lzdGVtIG1lbW9yeSBjb3B5IHdoaWNoIHVzZSBhIHdy
b25nIGFkZHJlc3MuDQogMjA2ICAgICAgICAgLyogTWFwIG9ubHkgd2hhdCBjYW4ndCBiZSBhY2Nl
c3NlZCBkaXJlY3RseSAqLw0KIDIwNyAgICAgICAgIGlmICghdG16ICYmIG1lbS0+c3RhcnQgIT0g
QU1ER1BVX0JPX0lOVkFMSURfT0ZGU0VUKSB7DQogMjA4ICAgICAgICAgICAgICAgICAqYWRkciA9
IGFtZGdwdV90dG1fZG9tYWluX3N0YXJ0KGFkZXYsIG1lbS0+bWVtX3R5cGUpICsNCiAyMDkgICAg
ICAgICAgICAgICAgICAgICAgICAgbW1fY3VyLT5zdGFydDsNCiAyMTAgICAgICAgICAgICAgICAg
IHJldHVybiAwOw0KIDIxMSAgICAgICAgIH0NCg0KbGluZSAyMDgsICphZGRyIGlzIHplcm8uIFNv
IHdoZW4gYW1kZ3B1X2NvcHlfYnVmZmVyIHN1Ym1pdCBqb2Igd2l0aCBzdWNoIGFkZHIsIHBhZ2Ug
ZmF1bHQgaGFwcGVucy4NCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQrlj5Hku7bkuro6IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5j
b20+DQrlj5HpgIHml7bpl7Q6IDIwMjHlubQxMeaciDnml6UgMjA6MzUNCuaUtuS7tuS6ujogUGFu
LCBYaW5odWk7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQrmioTpgIE6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCuS4u+mimDogUmU6IOWbnuWkjTogW1BBVENIXSBkcm0v
dHRtOiBQdXQgQk8gaW4gaXRzIG1lbW9yeSBtYW5hZ2VyJ3MgbHJ1IGxpc3QNCg0KTWhtLCBJJ20g
bm90IHN1cmUgd2hhdCB0aGUgcmF0aW9uYWwgYmVoaW5kIHRoYXQgaXMuDQoNCk5vdCBtb3Zpbmcg
dGhlIEJPIHdvdWxkIG1ha2UgdGhpbmdzIGxlc3MgZWZmaWNpZW50LCBidXQgc2hvdWxkIG5ldmVy
DQpjYXVzZSBhIGNyYXNoLg0KDQpNYXliZSB3ZSBzaG91bGQgYWRkIGEgQ0M6IHN0YWJsZSB0YWcg
YW5kIHB1c2ggaXQgdG8gLWZpeGVzIGluc3RlYWQ/DQoNCkNocmlzdGlhbi4NCg0KQW0gMDkuMTEu
MjEgdW0gMTM6Mjggc2NocmllYiBQYW4sIFhpbmh1aToNCj4gW0FNRCBPZmZpY2lhbCBVc2UgT25s
eV0NCj4NCj4gSSBoaXQgdnVsa2FuIGN0cyB0ZXN0IGhhbmcgd2l0aCBuYXZpMjMuDQo+DQo+IGRt
ZXNnIHNheXMgZ21jIHBhZ2UgZmF1bHQgd2l0aCBhZGRyZXNzIDB4MCwgMHgxMDAwLCAweDIwMDAu
Li4uDQo+IEFuZCBzb21lIGRlYnVnIGxvZyBhbHNvIHNheXMgYW1kZ3UgY29weSBvbmUgQk8gZnJv
bSBzeXN0ZW0gRG9tYWluIHRvIHN5c3RlbSBEb21haW4gd2hpY2ggaXMgcmVhbGx5IHdlaXJkLg0K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IOWPkeS7tuS6ujog
S29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCj4g5Y+R6YCB5pe2
6Ze0OiAyMDIx5bm0MTHmnIg55pelIDIwOjIwDQo+IOaUtuS7tuS6ujogUGFuLCBYaW5odWk7IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IOaKhOmAgTogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiDkuLvpopg6IFJlOiBbUEFUQ0hdIGRybS90dG06IFB1dCBCTyBpbiBp
dHMgbWVtb3J5IG1hbmFnZXIncyBscnUgbGlzdA0KPg0KPiBBbSAwOS4xMS4yMSB1bSAxMjoxOSBz
Y2hyaWViIHhpbmh1aSBwYW46DQo+PiBBZnRlciB3ZSBtb3ZlIEJPIHRvIGEgbmV3IG1lbW9yeSBy
ZWdpb24sIHdlIHNob3VsZCBwdXQgaXQgdG8NCj4+IHRoZSBuZXcgbWVtb3J5IG1hbmFnZXIncyBs
cnUgbGlzdCByZWdhcmRsZXNzIHdlIHVubG9jayB0aGUgcmVzdiBvciBub3QuDQo+Pg0KPj4gU2ln
bmVkLW9mZi1ieTogeGluaHVpIHBhbiA8eGluaHVpLnBhbkBhbWQuY29tPg0KPiBJbnRlcmVzdGlu
ZyBmaW5kLCBkaWQgeW91IHRyaWdnZXIgdGhhdCBzb21laG93IG9yIGRpZCB5b3UganVzdCBzdHVt
YmxlZA0KPiBvdmVyIGl0IGJ5IHJlYWRpbmcgdGhlIGNvZGU/DQo+DQo+IFBhdGNoIGlzIFJldmll
d2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+LCBJIHdp
bGwNCj4gcGljayB0aGF0IHVwIGZvciBkcm0tbWlzYy1uZXh0Lg0KPg0KPiBUaGFua3MsDQo+IENo
cmlzdGlhbi4NCj4NCj4+IC0tLQ0KPj4gICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8
IDIgKysNCj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvLmMNCj4+IGluZGV4IGYxMzY3MTA3OTI1Yi4uZTMwNzAwNGYwYjI4IDEwMDY0NA0K
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYw0KPj4gQEAgLTcwMSw2ICs3MDEsOCBAQCBpbnQgdHRtX21lbV9l
dmljdF9maXJzdChzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwNCj4+ICAgICAgICByZXQgPSB0dG1f
Ym9fZXZpY3QoYm8sIGN0eCk7DQo+PiAgICAgICAgaWYgKGxvY2tlZCkNCj4+ICAgICAgICAgICAg
ICAgIHR0bV9ib191bnJlc2VydmUoYm8pOw0KPj4gKyAgICAgZWxzZQ0KPj4gKyAgICAgICAgICAg
ICB0dG1fYm9fbW92ZV90b19scnVfdGFpbF91bmxvY2tlZChibyk7DQo+Pg0KPj4gICAgICAgIHR0
bV9ib19wdXQoYm8pOw0KPj4gICAgICAgIHJldHVybiByZXQ7DQoNCg==
