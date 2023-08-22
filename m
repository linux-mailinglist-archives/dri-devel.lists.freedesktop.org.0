Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4117845E4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 17:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2DC10E3A0;
	Tue, 22 Aug 2023 15:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF36D10E394;
 Tue, 22 Aug 2023 15:41:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sgadn9vZAxo1mGT+cYYOjco1DW5JBS4v3ykamXwYf3RQS8dwghEsVKJotSdDeRHR40p9/Yd3/PAwontf9Ba8nkms4y5OKucggof6cGhkUFF6AvdaC+ncMrIaaNbjS7zBi5F+BDPp2YQxEXjb9Cb3YFHq4Y9gMIEJB6WJk8xp+EeQCHnqK93CNFRnKPODutculAWH6y7K9xRYPsHEIo7CF4s5vvy1h1iwd0P26newkxwmydpps/UzfcqD8MgzzRTNun8NW2HVLl+vP2mf5qFLY4cNoY3Bmt06QnZdARn6UuZqTj8U1KJvVXye492jE2JU8YswvLRdxw2+3LMlqxAwoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8L5DvE871j3pfSVk5uwkV6MZboh468aXyeSwEG6Qf4=;
 b=EyJhNBJ81hOxDKDDF5ktcjrYq7QM1Paym7s6PUrjl5oXTxd4L7nN3AKIRJH6ka/VywkpPk2zoKkzHrczvjeLxPssc77gj0ntMRZN3G+/a1LnobdZcndReC1tUPQ6EEw/ha5D7fHeS3PYS7Tzxgsd5XVTyvVQ5+e3a4TRjEejH+0g3jepTeqqC9E4SoBhZDoT4Tk/i7jO1zf/c+eJbkxKEAaAHFXv9LI2PlXMluHmfiwb/qCFP1TaJVnlVJ83Mq2BXnXeGopgYU+3+6Js3SacW/M3GHP9L5/BBTlpsw4eMpiEW6hdLvgAUeR2d8v4qSqIuvwmAI3dbliBfb4ZlAHjVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8L5DvE871j3pfSVk5uwkV6MZboh468aXyeSwEG6Qf4=;
 b=ceNKdkoivIy93u/hBGyeaSmeZnIE/+CVYkt9gpRapM3kQqchbcOtlA6E6zJN7MI6TaZ1lxZ8txT5IrFczXZYAQqRq4TzeoBBfi/l9f6LaKM7/FXK7HzsVgduR6fs9RNIos85JV/HgYNHSX9k2tcO6uFBmlwYrBPCnHIX9GW5HjA=
Received: from BN9PR12MB5146.namprd12.prod.outlook.com (2603:10b6:408:137::16)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 15:41:58 +0000
Received: from BN9PR12MB5146.namprd12.prod.outlook.com
 ([fe80::858f:e2c1:3f1e:fefe]) by BN9PR12MB5146.namprd12.prod.outlook.com
 ([fe80::858f:e2c1:3f1e:fefe%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 15:41:57 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Sasha Levin <sashal@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH AUTOSEL 5.10 3/3] drm/amdkfd: ignore crat by default
Thread-Topic: [PATCH AUTOSEL 5.10 3/3] drm/amdkfd: ignore crat by default
Thread-Index: AQHZ1O0I1eo5JC1hBkypehDTQqHqCa/2dG5A
Date: Tue, 22 Aug 2023 15:41:57 +0000
Message-ID: <BN9PR12MB514680D55C89BECDA7895348F71FA@BN9PR12MB5146.namprd12.prod.outlook.com>
References: <20230822113719.3551639-1-sashal@kernel.org>
 <20230822113719.3551639-3-sashal@kernel.org>
In-Reply-To: <20230822113719.3551639-3-sashal@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=ea822615-2f3c-4fc9-8b5f-1e08bdbb5052;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-08-22T15:41:48Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5146:EE_|LV3PR12MB9188:EE_
x-ms-office365-filtering-correlation-id: a5de7e39-b2a8-4887-1dd1-08dba32651c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A6+9e3fDp6A97A2GE1GnP8VYANNG/PhCMeIoUmE62FRaWIx/qS8Ei/AI7EddwUo7LQNm1mO3cMG/H7ott+IeC/9d8cyWGoL0nzpWiCQ6RHe84wl63R9BXsjy82fK0etVr0gnNkgUs2pDHvCx5cnqOCIbEinH4XcAPXYDBm9DNPHwKm9WsdBogNqKcphp6MFKt02mtbISCdbFPq+qSZ4MrX68fwnq2/9R2F86WL6TwNOX8Hc6CkNEs+1LVwp9QIFLWTGmwc/51E/li1Xucge96QJo2COo8StXPayF3RwH/SQVk3Evkj4uDeuNOFWZwzs7psqhiZLZO9gqurk1Q/CDDM1pOVeGfbJC645dKvftxDZ2vl3ygsnGZjyKrACk2+wfXa26FJh4zkutrasJGASdElI0UfLwmnYYiUQZpXnnZHERycCVzVqzP5bYB6/BYhz867A/Qz2XWuJTcMYTeELzx5HWx/Q4LRsqKWw+qgiJcgsJ9/Wrr/uJuoDDPelkoedAnQkndyBv7r8zPwRpmq6Gcv5zqBAna3l/QdoqNbZR1W6iN90Gyde2yedm2fS6EmbyZmrYFUiGlsReFngfUtJc5cYhq3L2G+ARftFIXqcRgnfYX59Czp+YE/BXXcmwaYEF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5146.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(1800799009)(186009)(451199024)(66446008)(54906003)(66476007)(64756008)(66556008)(76116006)(316002)(9686003)(110136005)(8676002)(4326008)(8936002)(41300700001)(122000001)(478600001)(55016003)(71200400001)(66946007)(38100700002)(53546011)(6506007)(66574015)(2906002)(83380400001)(86362001)(7696005)(38070700005)(5660300002)(26005)(33656002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmtVY21zZFdjNjVRWEpkWG13Rk5ocVhDRWkvdGdYSW55bC9lL0w4V1dYWW44?=
 =?utf-8?B?bXk1QWs0ZDBFVnZCajZUUEYrOXZCazNmdHVwekxoM0lsbEd2T2NsMVlxRHh4?=
 =?utf-8?B?SEgzRit5N2lpZzUydmJoNHZoTnl0RVJ0U0pucEorWjBKM3RDeUd5WHRicVRs?=
 =?utf-8?B?bHFpVGZWdHdwczdZaWNVQkdYRzJ2WE0yK29KUnFha2dpMjhBQkQ0OFVwVWM1?=
 =?utf-8?B?MzNwS3hjLzlnSmJUUWN2NWdmSEdiM3l1T0JlWnF6dFBEYkpFQUZEamo3b0tN?=
 =?utf-8?B?NHJndktXN1ZkOGk2ZU5wQzhkYjZKV2dlVXlHcGphbTFXWjJvMnNpWmhZVTM1?=
 =?utf-8?B?T0ZOejUxNmpGck9URm8xdDVKQW05Mnh5QTRrUXkyckRGTnhIbXFVVmlWTjIy?=
 =?utf-8?B?L3N6eDF3VXdqM0I1ZktuQUVjNElEeG5tOXJTWForM2tPSUJ0LytJS2lGSU9U?=
 =?utf-8?B?NFhTTmJsaFZBRXJGR3RYblFwc2NYbmtubWVoZ2FBaDhGN09OWGhBdkh0V0Q2?=
 =?utf-8?B?b0RIaGp3cHZHaHRMczFyQVB2cE1EbEZ3Q3lyWHlTMUkvNWtJKzg2WXNyUk8y?=
 =?utf-8?B?OXVySkdXazNoSU5RL1lPUnhWQVg5UmJmVU9LWEpISzN1UzIxcmU4UUszL0ZL?=
 =?utf-8?B?QU85VjhmTlBzY0h1c0NIcVkrWEQwQ2xKTUtCbm1NQ0NNUzFRWSt3bVV6VWlP?=
 =?utf-8?B?QS9pZFl0amIxNFE1aGNDaExnWHRMMmxWYmIwYi83WHhBVDg4b28yVnoyMjN6?=
 =?utf-8?B?dVhDSGFLWEVQWGdmYzNKeXZDc09QZ0lTTkNqQld2c3lKZENhRTlMU2lPOU51?=
 =?utf-8?B?ZmlUOFN6NENIaGxlVEtqQVo4WnA2Sjg2UXRYblFxN1lNcnZnMmRmYzd6dysw?=
 =?utf-8?B?MG1aUXhpeWNmTkxNNGFRc3dTZytmNWZ2c0UwMEZaTTNsMGNRclNYWEk4enZP?=
 =?utf-8?B?aXZva1JFRk12WnNpSDBiWmlycmFySU5vU2QrVTJCc05MdWxTbkRpNm4zMGpG?=
 =?utf-8?B?MzEvd2FqNTdWa2NFVnFjNFJjVHBqUVVEa3JrcnMweDRqRmZmMGkxQkxNbWJL?=
 =?utf-8?B?TFU5L0VVb2VkblJIcnpMU3FPOXlmdUlmUHltTjRMUW5iUGVOMUNpSFJMK3Fo?=
 =?utf-8?B?TU9jK0wzaVY4amtTM3JweTFPbUpGYzAyTWliOUEzbmRWUWxVajB1azA2bWt4?=
 =?utf-8?B?T2szZklaOEZPMmlqV1JseUR1ZUFRVUFDdkxpZUJMWjJ1YkIvUDJKNFBOTGxw?=
 =?utf-8?B?dEk4TnVwcnBNaHo2ZEZBUHBWSHoyZ0ozVmJLNkRuNm5pWVdWenN6MWZmWFVZ?=
 =?utf-8?B?SUI0NmtBZFNYdXVteHM2dmJMT01tdG9CVFNPUW9nUTRNTTBBaU9WTzlzZTBv?=
 =?utf-8?B?bnFsY0tFaVV5VzJDZ0NYOWpza0svQlZ3aEowbFd6aVR5c2JWTEhZZUxVTmF3?=
 =?utf-8?B?TE0raVQ3KzB2L3lhams2U0d4NjlhS05Zb1R3ak1RdUF2Z3NjcVlYaDNjTWxp?=
 =?utf-8?B?T3gySlBWT2hSZGovZkExemF6em10bU1UMVlxLzFObHg5Sm5mcVZQaUhkMkJV?=
 =?utf-8?B?c1FzL1B4WnlkZDQwZ09XYXM0ZVNxUG5uRjU4Uit6dThNcGVoWWpGR1g0Nm9a?=
 =?utf-8?B?eGdTRHF5MUU2WjVodnNORTF6bHNZcTh1VExpS1dGWjR4dmFrcmdsODJpOU9E?=
 =?utf-8?B?V2UrbjUzQ1EzYy9WRjhNSFllWWVWeU4wczNSaXdaS3RBQUd5VTNTYUlqUWlo?=
 =?utf-8?B?c09iZHdtWHhDYnBTTGhPbTQzR2dmTGFqcGVVdVpTaVAxRFpHMW41akVlaGlm?=
 =?utf-8?B?SlZ1bmNnOUhsR1BuYXdIRjZqamgyeUtWSDNqdE5abStNYlFHVnp2SUprQXFD?=
 =?utf-8?B?Q2doQ25mcE1oc0V4K000ck1McjYzKytTZDhzUHhVbHJ3YzlqVytKM3JBckhy?=
 =?utf-8?B?amVKK2ZpN0NLVHl0QldGQWZtSVJTZmQ5bmE1V2szWGVkMGR6ZCszMU1YK0xN?=
 =?utf-8?B?NFhRS0V1cEhxdEdGSi9MTURSeEhyTkVkNXE1ZFU2YmRkVndqUGZKeFNEZmNr?=
 =?utf-8?B?d2Q2cEw3ek9HdTBlWlZmc0dzbjZYY2dSeVVUZ3djVStUVVhsWHNMS29JK0hM?=
 =?utf-8?Q?jYJc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5146.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5de7e39-b2a8-4887-1dd1-08dba32651c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 15:41:57.8565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VXaHqlr2nWK8Q95nKZsyjWKQO0x6lXcaNzFl4jMAdzkuNIX2Jtz9e5hcac3Qct63w3t56oMlfNZ/wIj4/quvXQ==
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
LjEwIDMvM10gZHJtL2FtZGtmZDogaWdub3JlIGNyYXQgYnkgZGVmYXVsdA0KPg0KPiBGcm9tOiBB
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
ZXggODZiNGRhZGY3NzJlMy4uNjFmZWEwZDI2OGI5NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NyYXQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfY3JhdC5jDQo+IEBAIC03NDksMTEgKzc0OSw3IEBAIHN0YXRpYyBib29sIGtm
ZF9pZ25vcmVfY3JhdCh2b2lkKQ0KPiAgICAgICBpZiAoaWdub3JlX2NyYXQpDQo+ICAgICAgICAg
ICAgICAgcmV0dXJuIHRydWU7DQo+DQo+IC0jaWZuZGVmIEtGRF9TVVBQT1JUX0lPTU1VX1YyDQo+
ICAgICAgIHJldCA9IHRydWU7DQo+IC0jZWxzZQ0KPiAtICAgICByZXQgPSBmYWxzZTsNCj4gLSNl
bmRpZg0KPg0KPiAgICAgICByZXR1cm4gcmV0Ow0KPiAgfQ0KPiAtLQ0KPiAyLjQwLjENCg0K
