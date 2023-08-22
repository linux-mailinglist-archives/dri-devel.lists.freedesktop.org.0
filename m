Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA42F7845D9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 17:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827F210E39D;
	Tue, 22 Aug 2023 15:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE87C10E396;
 Tue, 22 Aug 2023 15:41:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GaF0ExzhdQEd9+5G0maRf881zr3WVI7f7S3xx8yckUwqAeGZzteb1y/q0CvIK47lLaH6F6+nYrTBplv0kJnF4rDGA4zITj0oVjBf2SyTmK4zIzUDk8TQDeGVI15wh08ZG5EYixfWAZrOH6uKmJymIuSHFbj2n6vwIgl/LOPHi48C1VJO9cUL4Jsm4jZyxWR8SMTJUVysFbQqqn3EP0F9DSokpT580zrTYbBzbfofEu/oG60GWDzGIftz9xbbNiOc05f5Lva+d5RqrqBPsfkYw3DqxjHfDuz/j6LjCvppuWwUS36NrIDXAhmtdy1FtDNyZaMSIhb2D0ytTP+O1A37gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkwRk/eNcS7snfTP1FJ4Y6RjB9LsuS0uVXBPMO/MAN0=;
 b=hWEDjvSMVq2n+PPaQxOYD6h1RxC0RoHe9Uoi2HtLQstdSRSIxPsqZfjGudOuTYwF1w+KIyBA8STeYcgPOwY11Sy2r+2vPbn+wuPJ0Vplv5ejA96+Ye0oCEkI33Qf3KDwxq5mz5VWEJys4Lu9o3CWbxso20ttNMIx7fY8MDu0GzjxICWTt+tzVbj6644f0xHe9Gu+Oh8bg4Ome9GI6AGfLUt/dNiOaFVbjE82TfXvPbhlujVJ+c7kiXp+ecB6JIaUAnhWMaGGvOiKde09FTSmvcBFAowg4P/LQQFFxG2A5BaqQ5eAazinEYFCGhEpF7HujYIggiqgFOuHsLVnc0oymQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkwRk/eNcS7snfTP1FJ4Y6RjB9LsuS0uVXBPMO/MAN0=;
 b=C+Fmm2hRHhz8K6ERH3mOaTDdqAMYmj7fO48uaAurx+SaCvN+p8w+F5eosoVqllWu440rQlG1sZkkK3WCkzro0lVNcs8He5PVWKinIBzTwhEb0u1LywVa9+y1HV9u9BZIP+AawhnL1CwdtnT31YiPb8tZISpyEqdGfvQgE2z1nL4=
Received: from BN9PR12MB5146.namprd12.prod.outlook.com (2603:10b6:408:137::16)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 15:41:20 +0000
Received: from BN9PR12MB5146.namprd12.prod.outlook.com
 ([fe80::858f:e2c1:3f1e:fefe]) by BN9PR12MB5146.namprd12.prod.outlook.com
 ([fe80::858f:e2c1:3f1e:fefe%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 15:41:20 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Sasha Levin <sashal@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH AUTOSEL 5.15 6/6] drm/amdkfd: ignore crat by default
Thread-Topic: [PATCH AUTOSEL 5.15 6/6] drm/amdkfd: ignore crat by default
Thread-Index: AQHZ1O0DvrkLgVmrmUWGHT4Ct5bd6K/2dECA
Date: Tue, 22 Aug 2023 15:41:20 +0000
Message-ID: <BN9PR12MB5146C0787341AD0E46FBAF2CF71FA@BN9PR12MB5146.namprd12.prod.outlook.com>
References: <20230822113658.3551550-1-sashal@kernel.org>
 <20230822113658.3551550-6-sashal@kernel.org>
In-Reply-To: <20230822113658.3551550-6-sashal@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=b76dc897-4c02-4850-982d-46b054408e35;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-08-22T15:41:05Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5146:EE_|LV3PR12MB9188:EE_
x-ms-office365-filtering-correlation-id: 2343a644-a88f-4f56-5ed9-08dba3263b85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gUT6IFC+9M9Dc8QfQJR4gk4bM+0xP2EfQuAqxmlRpm5XrjTXX9pwxU5kvDr+p3aX/nR9zYSujCj8YjrahCOAYF8F7J9BGy7V1MTp3yqFprOzDdHmkU14nGC7G4ypT4ueVkY0Z2FP6xMTDIlccnWNybhg9IMBkPOSuSnBcpaqXBa3yODS/O651nDwXOaCtxwqyAodKjQFSaaK9FbLBz4guMnDNRU+F+mU7YZxkksVdoRA0UbGOgJ6eQjlCJR9lSNu4hSVRlhTJ8TryCpVNAde1zG28qLb9DEkb8IClA5Dzw7uYFch6Ho04iET8UX6ymp5FAnEZbA3PTBtKM5UYyd1Ac35nFxEifqCQ2/Nz1LvYj5XrfKIVQirhtYM04u7dpJ6va7p7sSzbHfgFrBKsJg8T3kNYv48iD+m0o6ARGB8kQlT0W8s7pmURU5GEQTN2GPrnSmA7bP9hbBaRAsA2qZspUH7dPvbxIC8RIhuxn0uJ+73SJ6+wzud2DNunaceZ5adGVUV0DPaxZvJZ2G+TRPdC0SIRiaXMniAwjGAkbdnnKdakEfCAfjDSKglNCTgb1T//QfZiRcjMyWEdVlB/xMNcR/SRE1gkC3uTCte4w9wYjImxJMZHXLAWIfOheyHFdIE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5146.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(1800799009)(186009)(451199024)(66446008)(54906003)(66476007)(64756008)(66556008)(76116006)(316002)(9686003)(110136005)(8676002)(4326008)(8936002)(41300700001)(122000001)(478600001)(55016003)(71200400001)(66946007)(38100700002)(53546011)(6506007)(66574015)(2906002)(83380400001)(86362001)(7696005)(38070700005)(5660300002)(26005)(33656002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFRoSENvOGhxY2xKNGpVaGdRclkvQTFtRVBQcGJ0b0orc2taaUhseVh0TWsr?=
 =?utf-8?B?dTNEanhtbEhkajBocm1FS25ONkROenBXWk1IREVuZ0JDSndCYlJrN0N1RDU2?=
 =?utf-8?B?cGhIM1h6U2RTbzlZSWRDSm1hM2kyYlhsMFk4ZXR1VDRrWU0zZEhlbkI4R1dq?=
 =?utf-8?B?Y3pXNFJRZEhtY1piZFpaWUk2QnBIRExNWFlCS3hDRUU5V3B0L1VJQnQxcXh6?=
 =?utf-8?B?U2UySjI3VXF5L2dyWkRaRjdSVmRNMXFKM2RhTFE1NzR4TllyZStzZVpQSXVY?=
 =?utf-8?B?akU1dStKdUlBOGZIZVE1SzJjRGJCajBkV2pxUXh2ak5idGRuTW5MamhIdkpV?=
 =?utf-8?B?dkV5VXJaSDJBZW02ZjRmWVRGVkpiamZBOWVka3MxM0V5ekhLQ25sd0Q1d2Fh?=
 =?utf-8?B?RVBPMkJISFBrcG5nOC8zbGhmczZ0dFpHRU1aRXVrMGEySnpjWmlrN2dRZ3Rl?=
 =?utf-8?B?ZWxKcDdXYVBmUE1yR1FSeXVZUHczSkRub0UzbytyQWNsUExrWUl3aW5Fd0Nx?=
 =?utf-8?B?aFNiK09BTm12Sm9NekJKRVJhQVh6UUpjd3ExVHRHV3RVeENOb09pQmNoZmJ3?=
 =?utf-8?B?RHFjeGpPWkVKWDR2T1NXanRVanpGWDZPclNkZFR3eUtTYkZ2TEhEN3ZUcVBY?=
 =?utf-8?B?RjhkS0VuRGJEUW9WKzJLUm15cnVobzZhNDRVcEhrbkJub2JES05JaDRvcHRR?=
 =?utf-8?B?eWowVGxwNDQ1NHBsRC9IQXQxakRiVlA0cWxDbW10aXBaVmxqWHlhRkV4eGp3?=
 =?utf-8?B?VWNkYzZwR3FvTUtVeTJBTDhNOWxkZTV2UVloZXliVlcrQ1hRZnRXK2Z4Y3lU?=
 =?utf-8?B?aHZBTWx5dmlTSTFnT01jdXgwTVJnQ3ViRjEvSk9XMUl4Q1hiakNzdFVxV2lY?=
 =?utf-8?B?Skp0ZGVtU2c3WFBsRjVDZEg4YWNmQ1dsNzFjN253L1BGWDRRZTh0YUlDeEVV?=
 =?utf-8?B?STU5TktZNFNWQUh5QjA1aWpta0wwVm9naUhCY1hnMHVHek4xd0hDYUh2MmZv?=
 =?utf-8?B?eEpjOUp0YlhjWGRkS3JocjU5bVRKT0x3RDQ5TGVqcHpFaG5EYVhpZTVoR0w1?=
 =?utf-8?B?ZjEvMU5tZThybnRhUmxpczExSEJqK3FTbHc1eTZQNWp5SUhiSE4rL05DL3kv?=
 =?utf-8?B?b200b3pjNU1XcmdXYjUrZUMwRWpqaC90V3JrbXpDUVpTVEkvb0dPRjNOTVpC?=
 =?utf-8?B?S0lOY1ZvclRmRncvbnhSbTk4UzdpeXBrYmdTbWlyT0d1OEpGZlhMNG43SXdt?=
 =?utf-8?B?OVI0UlpMMHUwUy9lKzRLM0tRcUkrTVZ6SUFxRlZDeXQ4a29CSzBUQUtBcy9F?=
 =?utf-8?B?ZE5YZ3BNZFJtbS9qTWFucTcrU1VyVmVyOXhhU0J4VkNPcDZDT21jcGRMR0RR?=
 =?utf-8?B?RFA3cThmMm4yejdiUUF1c1BOcnpDazA5NllNaElLazZSc0RhcUQ5MVdPWVpI?=
 =?utf-8?B?OXBnTmxXK0p1N1Jicm9RZDZEZm41UnptN0JRZ3IxbVl6ck1LNDVQTkVoU1BZ?=
 =?utf-8?B?MmNEaTVWbys1bGU1RHU3emVRWHN0cjVHYldpdjRWN1B6SVkwVjJrZkgxNUF4?=
 =?utf-8?B?WE1qTmN4VDdJRmE4b3RWbW1vTXBhTEIrdzhqRkR3OU1KV0hucS92TnZQSlU0?=
 =?utf-8?B?OG9BazAvaVBMZ09WbFlEaFlGVWV1R2VsTU1CN3c3OWtvYWRGSUg5RGpKM2R6?=
 =?utf-8?B?bEdRbjF1cXJ1UWN3TFBORkVJbWJHNWZtUnBHY2U1NVNoem5uRnp0MVNBTDlr?=
 =?utf-8?B?dTl2ZXZTbnZRN3BKcHdKSG5oZ1VEY3g5dVh1ZDBGZGR4WnpuczVBbnNtL0xJ?=
 =?utf-8?B?bWtYbmlmY00rV0NrMVZFUHNpMklpNDJPMWlud0xCNEJTOXJPQzRTTXkwYS92?=
 =?utf-8?B?ZlN4NXpBUHpZcG5OYWNKSHYrcU1jYlZhek9WQ2VaVDUveXJwcE5ROEFDSWla?=
 =?utf-8?B?TFYvN1o0a3RHUTJ3VENIcnZJTjBWclhXRHFiZ3I5SVdXZVVtRnBRYWdyZStD?=
 =?utf-8?B?anJCYVhxeUVWTm40NHZyRkJKWkxySWo0SS9jU3JMQXpEc1dhV1k1RjhObGhr?=
 =?utf-8?B?WjRJNlNpcDRScE4wbyszUzY0TU4vSEljcHlWTUdBZk96alc2bkQ5eit6RnEz?=
 =?utf-8?Q?cPKY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5146.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2343a644-a88f-4f56-5ed9-08dba3263b85
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 15:41:20.5122 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ufDRSdZaQd3/jZiS0QLbd110wJzsXBwxwpz3kbCnLOGXRHJeA6/V/G0JkxVuDLYHBe49UB4JcD4aeoCrDwSNHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTYXNoYSBM
ZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAyMiwgMjAy
MyA3OjM3IEFNDQo+IFRvOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBzdGFibGVAdmdl
ci5rZXJuZWwub3JnDQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVy
QGFtZC5jb20+OyBLdWVobGluZywgRmVsaXgNCj4gPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBL
b2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsNCj4gTWlrZSBMb3Ro
aWFuIDxtaWtlQGZpcmVidXJuLmNvLnVrPjsgU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3Jn
PjsgUGFuLA0KPiBYaW5odWkgPFhpbmh1aS5QYW5AYW1kLmNvbT47IGFpcmxpZWRAZ21haWwuY29t
OyBkYW5pZWxAZmZ3bGwuY2g7IGFtZC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBbUEFUQ0ggQVVUT1NFTCA1
LjE1IDYvNl0gZHJtL2FtZGtmZDogaWdub3JlIGNyYXQgYnkgZGVmYXVsdA0KPg0KPiBGcm9tOiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+DQo+IFsgVXBzdHJlYW0g
Y29tbWl0IGE2ZGVhMmQ2NGZmOTI4NTFlNjhjZDRlMjBhMzVmNjUzNDI4NmUwMTYgXQ0KPg0KPiBX
ZSBhcmUgZHJvcHBpbmcgdGhlIElPTU1VdjIgcGF0aCwgc28gbm8gbmVlZCB0byBlbmFibGUgdGhp
cy4NCj4gSXQncyBvZnRlbiBidWdneSBvbiBjb25zdW1lciBwbGF0Zm9ybXMgYW55d2F5Lg0KDQpU
aGlzIGlzIG5vdCBuZWVkZWQgZm9yIHN0YWJsZS4NCg0KQWxleA0KDQo+DQo+IFJldmlld2VkLWJ5
OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4gQWNrZWQtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gVGVzdGVkLWJ5OiBN
aWtlIExvdGhpYW4gPG1pa2VAZmlyZWJ1cm4uY28udWs+DQo+IFNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogU2Fz
aGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9jcmF0LmMgfCA0IC0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0
aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2NyYXQuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMNCj4gaW5k
ZXggZTU3NGFhMzJhMTExZC4uNDZkZmQ5YmFlYjAxMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NyYXQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfY3JhdC5jDQo+IEBAIC0xNTIzLDExICsxNTIzLDcgQEAgc3RhdGljIGJvb2wg
a2ZkX2lnbm9yZV9jcmF0KHZvaWQpDQo+ICAgICAgIGlmIChpZ25vcmVfY3JhdCkNCj4gICAgICAg
ICAgICAgICByZXR1cm4gdHJ1ZTsNCj4NCj4gLSNpZm5kZWYgS0ZEX1NVUFBPUlRfSU9NTVVfVjIN
Cj4gICAgICAgcmV0ID0gdHJ1ZTsNCj4gLSNlbHNlDQo+IC0gICAgIHJldCA9IGZhbHNlOw0KPiAt
I2VuZGlmDQo+DQo+ICAgICAgIHJldHVybiByZXQ7DQo+ICB9DQo+IC0tDQo+IDIuNDAuMQ0KDQo=
