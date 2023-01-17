Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C294066E5BC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 19:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF0E10E321;
	Tue, 17 Jan 2023 18:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484E610E5A4;
 Tue, 17 Jan 2023 18:14:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkyUWDd9eRA3lLxSXJ/j0bALZlsPQ5LHe6lvTnrzVuNoeqTySN+mYQFnfXu0LYquq5I/1f9G+NNKrA8lVy10xfeuceYusYFIGltCKy7aTDdlyfz3s4+V4cVG/HTxKj8cn3wtsL9PQveXFMKW7AhtyVbrGlqucwBCmjsz/H1KDyf1GrupBI390yamWYWeNE+CFVW/b0MsUw5IV7hpOF6Vbt/I7ASIglChOMzWJmxftudHUjwIWr0k1BMP5y5F1jnWBVzTp7qY3OKgV3cmDhjmel0/+rd2Q14y60q4c0NCcS0uBruziyH+6zwUHLftg86u+fMNXyiXh6I9EkouNVmOOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VU1FH/NJ2tc0LRCSWIkcuAdorcmlUjwvq/+r9zYqwU=;
 b=VzlefDWXew6C12kh9I6n7a5WhSB035uZOruKQ3tCellI87xijAc3iUtq7Ad1fS8iUR6GtuDjs9NFZkM1TDojthbLplSHjAcedtKZV/a3vr6jpfS8UnywZyYl0I+gDaVyN0LBnAtFdHxQ4mCkxbhWrqJI0rQtAJycoaSgRukN/3fxBHfREze1jyidVtrlJFHJhWHfNvqVAt2g0tHq7hYuv3JHumbb4qozJYGdp9RXQX7+T3leGqCo4mxow0a0xG6gHGoj6vNiUWiiTgtp8pZxEZthYrbr7Bya+jz+EBBO9Zygj181LIA6F2S6a21Z8F4Db5CxTxiD25RlW1Mv2cxvYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VU1FH/NJ2tc0LRCSWIkcuAdorcmlUjwvq/+r9zYqwU=;
 b=KjBmJ7nRzCqy0sV75RDCjxAezaQASdDppWGTCebg4ECW/WFWkXhfCeGBWSSeo2Sr5kaUnogQcbzcTgrjaDWJCzQv+U570IT3z87Oeu/Lqp13qbIUhHolyeYehm9MqqFiRynlOsQJARax6g5Ps1yrjqLqLZAbDKcTvyZYMyWrPiA=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH0PR12MB5466.namprd12.prod.outlook.com (2603:10b6:510:d7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 18:14:44 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a%8]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 18:14:44 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH v2 2/2] drm/amdgpu/vcn: Remove redundant indirect SRAM HW
 model check
Thread-Topic: [PATCH v2 2/2] drm/amdgpu/vcn: Remove redundant indirect SRAM HW
 model check
Thread-Index: AQHZKp2l1MSpqVkrKES+9mLYPlTkJa6i5/IggAABtgCAAAAqgA==
Date: Tue, 17 Jan 2023 18:14:44 +0000
Message-ID: <MN0PR12MB61019DC93A66101D672C3E9AE2C69@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230117175836.914304-1-gpiccoli@igalia.com>
 <20230117175836.914304-2-gpiccoli@igalia.com>
 <MN0PR12MB6101FE6B2CC0AABB239DB06BE2C69@MN0PR12MB6101.namprd12.prod.outlook.com>
 <3526e25c-c0bb-a61f-319f-1c313f8fbea1@igalia.com>
In-Reply-To: <3526e25c-c0bb-a61f-319f-1c313f8fbea1@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-01-17T18:14:43Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=991b353a-cffd-4a49-871b-9ba5cf890810;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-01-17T18:14:43Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 84b7000a-323e-4487-a286-6fdcfaaac546
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|PH0PR12MB5466:EE_
x-ms-office365-filtering-correlation-id: 88d95030-ac1f-47e9-6ae0-08daf8b6b5da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TKiPMQpY5tupaPPodxjqQpfIVHjD7Q2up0tag+lCDRQZ2ChZV5yWPNO7UMuBKoL3UEIRoOc7AR+bBUuKx6YQpGmKJYQsc8sZ3J4z2Odb+Jc9okb+pkiYb2MuqSLKbx9hf7sLBav2SlY7V5pV7c5BbOwvoauyLrNt7ra08uVrOSduzPmdLFE1TQivZPNddiEOK2AbagtQs0WWzoXAa5DJueynybjBHOt7yhTaP+k/A0xyZ6O+EQTa/0De7YUqRa8x7zRxRepCifI1+lsfGFtcCbPgCzzRPSwRl6/dNJvO51jOrzLHPCodkpTEXqvGIJDElvumRT0SIIZnTUCQ30MZt1WBK3vKppfqdjY9f1bjbi+eodTHOVCeYKKF6HxmKQWKRLDJZXCdeQpTHIkYl8jGsU3X8lT0qJ4yKIYF5YVmYDTgCryHy69EQ0t38rWRmhyWm1NzAO9ljSVYutfA2hPZwqsDxesqQ0Tq0msyuAYm2r9sfs9KIpCx2HY/nryV4RxgLrxRsXY7IUZ1fxxiylFievj+LTVLKbPtiF6o+B0L1YogeqFF0kkXDICUpmdeHKWFRwhJUWpJcYw3rDLAaA3+46q3zorsmNN7MEfNw5tGhhHzFeY4/8eTTuCiG0zaepeMge/9iMbg0Vs2+MmUu/4D1JA1L5GWcAg5lW3CpJPMG9XFpZRDlrLwbMeeJCjMiMzhQKbXNr17bIfU//kyjQo3Xw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199015)(86362001)(53546011)(33656002)(83380400001)(64756008)(9686003)(186003)(26005)(4326008)(66946007)(41300700001)(8676002)(66446008)(66556008)(66476007)(76116006)(55016003)(71200400001)(316002)(110136005)(6636002)(54906003)(2906002)(478600001)(7696005)(122000001)(38100700002)(38070700005)(4744005)(6506007)(52536014)(5660300002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGxJTHRhL2t5ZmtydEFQVnhUc1EzR29oU1plbG1Dd2pHMkFieW9PVi80ejhS?=
 =?utf-8?B?OEp2bzRKa2M1d2VmcWpSYS9aNzY1VE1VaTFtZ3liTFc5eC9mdC9FWU5wTzE0?=
 =?utf-8?B?WGlRejJuYWNtUmRIb1lYTHIzejRpQnl0SGpuRzYyemVHeTZ0bWR2SnYyRjVj?=
 =?utf-8?B?T2U3dVh0SUN6RlJ4NUpOYThua3hvWGpYK1FtUkZLS0U0alhIYnZLaGJKZ2FL?=
 =?utf-8?B?cWNHbjZrOFZNNFJ5SDFaK2J2aTBYc2d1alJlNE1ZWDdpWHgxOS8xZmpFVnpL?=
 =?utf-8?B?YTlGTlBENlR3emQ5MklIZ3FyekZCZUdUQXViL3IxN2JiOXFIRjBpc2dVdm1v?=
 =?utf-8?B?WlNLTjRDYkliUXI1WWJvUE1TZ0dQUUJDTTlhVmFXSHVCdWZKMXhXcG1waThW?=
 =?utf-8?B?UXpKSVdxUEZaQmVkSWZiYTVqZnBiM1JINUJGYnM1QkRKelFncXVVcU1XUXNm?=
 =?utf-8?B?ZC9HVTl5ZDdXV3IrQk1QNHBpYnBtbGcyUC80TkJKeEhVTnhEaHI5NExPWkNu?=
 =?utf-8?B?dWNYOEVxbUFwQXlVWmdmZGRmdHFhOHhEYmZPUTZaZHUrVUhDbzdFbUdXVEJq?=
 =?utf-8?B?UVN6YXlPOFNsTElsL2p4RDBEWnRxUzBDWlZ4c01ZWDAyN0Q4d2lDOE95VmZw?=
 =?utf-8?B?bGxyeVVTQlBqWnFCZjVNSjViSS9kaWtzNTAvVmF6ekZsaGo4WFZweWdjc1pl?=
 =?utf-8?B?a1Vsc2F2ZkhoT0FLeDRQeGM2K01Vd25VRmNtenFvTGNyanVNUkFEU3hDRHcw?=
 =?utf-8?B?b1NYYnJzZjU0cVpqTEFvVzBZUkFMa0tGeVFoSHVzSjFZejFmNm5PQkg3b2NO?=
 =?utf-8?B?OFJ0eEVvZGdTUkEweUNLZWhsK3F3ak01UHNJdjF2ekZ0WTlWN1gwVnRsQW4w?=
 =?utf-8?B?VmdtN0dlSzlLU2cxZkVzbHhTVHJmU3JmMUw0VWVZampSQjBsSnQxc1hsZGdL?=
 =?utf-8?B?RWNwZHE0SXhxdDBsM1NuRnk3TFVOMkhyZ2ZucXorSHVSanNmT3JzNGFhWnBv?=
 =?utf-8?B?K3lURVU2ZmdRYm42V3J3MzdQZExtdWRIdlRhVG5DYnRuQzNjejJIYTlpY0lS?=
 =?utf-8?B?ZzVMdllRMW1FS1RPUmRTaFMrdXRZMUFEbE8zaFBaSUtRZU1ETy9LRlRwelZY?=
 =?utf-8?B?R0sxb281cG9SSzBJT2JsNjIrdEFLa1gvRzA2eUw5VVR0ZHBZeGl0RXlUS1dF?=
 =?utf-8?B?eVd5MUs0YVRaYUJWOEdkSnFXRC9kTmVGUzJVZFRJUFJoRnVRMGdQRnJPeVVX?=
 =?utf-8?B?V0d6eHB0WW9acUxZNXhSd0dwdG1jNUFCKzBXbGlLS2xFWVdITXYyWHFFbVNP?=
 =?utf-8?B?Q2VYdGpaYThmZWlBa1RkUUI4VFZuL3ZrZHpMaURtb3hBZURla1VvM2hTczlm?=
 =?utf-8?B?dHVSa2pHTkVlaVJML3pLekdFdy9ZcFhaVGVWOHY5TU1tQ2syQVNGQWxyUzR4?=
 =?utf-8?B?NmVleGh2ZTVUSHV4NjhleFRiTlZWQnVpQ1I5V1dTNkVmbU5XNXRNTnFkYW9x?=
 =?utf-8?B?K1ZiWG9oUmJKTWZhbmNrT0JsUW93SURsejRPeHd4eGtrMll2WUFydlEySEZw?=
 =?utf-8?B?QzFEOWRVelNEcEwrSncwYjVFMTMxUVFML1FQTGhwS2JrSnQxU1FPTzk5S3JX?=
 =?utf-8?B?eGVUcElJUUgrOVVOVmY3TzY3VzF6UlZhWFVWZVIwWW8wNXd4cHJWRzJiYVFt?=
 =?utf-8?B?bFZ0WlVvVGFWMi8vM0NnUTJvelJ6R2xOei9pMWhMVUNQcjk3SlRHYXFuditz?=
 =?utf-8?B?S29Fem5aZThVMjl2ZVlFZm1HbHpoTnBqektaZGQrR29zV1lxOUpOSFRuRFJq?=
 =?utf-8?B?TlNTMm5YWWhUQTQvZzFDUUNQdGMzazQycXZjbUhnRFNVNEVTWHVmT0haYWFW?=
 =?utf-8?B?dnk0NFZaQ3N3ajdyWkEyK3p6dkIvckNqZ2ZlWThNUExTTDlxdGpvTVNmUnVL?=
 =?utf-8?B?eEZXR2ZHS29PVXk2ek1qOGUzT2hPY2c0dGpQZkNVV0xkT3lMLzVCbXBETVV4?=
 =?utf-8?B?MmZSb2p0MFpYa2FUSzlQTmtGdHo4M0lWUmNUcUx0YVpWWDVzendDVi9BL2Zj?=
 =?utf-8?B?aW1IUXlwdFQxeUVNY2pFSkVFZGFGSUdmNVM4V2lpMWVaTDRUK0NjMERTckZp?=
 =?utf-8?Q?wI1g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d95030-ac1f-47e9-6ae0-08daf8b6b5da
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 18:14:44.4760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /QVD8a2I5iwH6jwYIS7Baa/rpRDvt0BeDjhpd9Pk+e6D8NxHw6B8mzPtFxwYIAHHSLIt+9jiQtzkom2d1X0HtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5466
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
Cc: "Jiang, Sonny" <Sonny.Jiang@amd.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>, "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 "Zhu, James" <James.Zhu@amd.com>, "Liu, Leo" <Leo.Liu@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3Vp
bGhlcm1lIEcuIFBpY2NvbGkgPGdwaWNjb2xpQGlnYWxpYS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEphbnVhcnkgMTcsIDIwMjMgMTI6MTQNCj4gVG86IExpbW9uY2llbGxvLCBNYXJpbyA8TWFyaW8u
TGltb25jaWVsbG9AYW1kLmNvbT47IGFtZC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
RGV1Y2hlciwgQWxleGFuZGVyDQo+IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KPiBDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgS29lbmlnLCBDaHJpc3RpYW4NCj4gPENo
cmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+
Ow0KPiBrZXJuZWxAZ3BpY2NvbGkubmV0OyBrZXJuZWwtZGV2QGlnYWxpYS5jb207IFpodSwgSmFt
ZXMNCj4gPEphbWVzLlpodUBhbWQuY29tPjsgTGF6YXIsIExpam8gPExpam8uTGF6YXJAYW1kLmNv
bT47IExpdSwgTGVvDQo+IDxMZW8uTGl1QGFtZC5jb20+OyBKaWFuZywgU29ubnkgPFNvbm55Lkpp
YW5nQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi8yXSBkcm0vYW1kZ3B1L3Zj
bjogUmVtb3ZlIHJlZHVuZGFudCBpbmRpcmVjdA0KPiBTUkFNIEhXIG1vZGVsIGNoZWNrDQo+IA0K
PiBPbiAxNy8wMS8yMDIzIDE1OjA4LCBMaW1vbmNpZWxsbywgTWFyaW8gd3JvdGU6DQo+ID4gWy4u
Ll0NCj4gPg0KPiA+IFNob3VsZCBoYXZlIGFkZGVkIHRoaXMgdGFnIHRvbzoNCj4gPiBTdWdnZXN0
ZWQtYnk6IEFsZXhhbmRlciBEZXVjaGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KPiA+
DQo+ID4gTG9va3MgZ29vZCB0byBtZSwgdGhhbmtzIQ0KPiA+IFJldmlld2VkLWJ5OiBNYXJpbyBM
aW1vbmNpZWxsbyA8bWFyaW8ubGltb25jaWVsbG9AYW1kLmNvbT4NCj4gPg0KPiANCj4gWW91J3Jl
IHRvdGFsbHkgcmlnaHQsIHRoYW5rcyBmb3IgdGhlIHJlbWluZGVyIGFuZCBhcG9sb2dpZXMgZm9y
IG1pc3NpbmcNCj4gdGhhdCEgSnVzdCBzZW5kaW5nIFYzIGhlaGVoDQo+IA0KPiBBaCwgdGhhbmtz
IGZvciB0aGUgcmV2aWV3cyBhbmQgcHJvbXB0IHJlc3BvbnNlcy4NCj4gQ2hlZXJzLA0KPiANCj4g
DQo+IEd1aWxoZXJtZQ0KDQpObyBuZWVkIHRvIHJlc2VuZC4gIFBhdGNod29yayB3aWxsIGVtYmVk
IHRoZSB0YWdzIHdoZW4gd2UgcGljayB0aGlzIHVwLg0K
