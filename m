Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598CB3D94BD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 19:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369156E86F;
	Wed, 28 Jul 2021 17:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 28 Jul 2021 17:57:53 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35C36E892;
 Wed, 28 Jul 2021 17:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627495073; x=1659031073;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=hLnwlnH76OWtNhIleJuayNy0b4PWiCL68vpzC4GgvPU=;
 b=i7dJ/lMurVHSvmX67byL466+K5Y0xBDM0jmfRCY268Zrggfolk2zqtt/
 NgMTuyiCJ3XvFRMFBhMKoxkxIW4aseosvatyXq+bUyiHCj2ktrRtb70Fv
 4GKExYZ4FJNAYsjFWQDbr4vO41x08BBjp+0lJSQqDP6mzrgcjZHTPvNWm
 7p/HXLKh8EmD7ijZnKZUZsIOGM2I9unaUPwvpuLQozyHChK9KfhcZjdVF
 Mrj/JbUMsTndIGh6jl1fmLAEYdv4qJP6NoboU0CMG9qPpnyNigkMVhE12
 L1vsGE1ApeTaKYu9njiF2jVBoR4SyIzyxxj9iyYW3LQZtgJgH2WRtdUzl g==;
IronPort-SDR: F4Sj3vF0v6zyr4Lb1YhXdtzF8sMtz74YrlrKIG30c2groid4LBedozqOkGkTz11tA9ovpGaJi4
 jVzByOqCBTVxfsiKu1RV5OEwbtH3NT/Wkb9GUlWN5QX7jiYiL3Ti6WVdyzmCfYXIhtgkscBXBe
 RbghNM1VRvXddmtLtNG2l7TXUeRyibLKn+wCQ8a5PPqSnN0v2c1pqetaFJLpXPdf5I1Lw+CbjH
 SG38gQHev7HjVTgA8wIgD9T7Zp0EKeTWwKWlZ4J1MphkPd2DBN4glstc03W/Bhl908VcckUfRA
 A4Tahc9zcezGj29tCXxAvOAQ
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="123795897"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jul 2021 10:50:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 10:50:37 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Wed, 28 Jul 2021 10:50:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPFrA81/7LWcNBhZKwPfNQQWAUl3laaBHT1OPeZatECZsj/o5DpEQxlOqN09/bUxWYqu8yd2F6g4M7LFClxOikaOa4MpsTaWIliEzCB6xC3UeHBmrfhyUvpgZFoRUFP9zgtEhUCMiFk8DotytdXtYhcTmMBt/0ths2+r71AV11OuL9LPmprYJQr7k+IpbLlNN31+nIrzD1lCvxoe5e46dq0PuiqZPOqpnsCZe30LSLhKXv1W9N3qoCJZu0M4HF7FUIc/OmntA2l9lNVV2VClSb6ifbpxnTYoZFiW1JbQl9KEVtE4owQK7ZOq+ZrohUqvdDhTK/KUtPudXvLHFU7RVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLnwlnH76OWtNhIleJuayNy0b4PWiCL68vpzC4GgvPU=;
 b=Skuyl1lbJQMPvjni7l+KiIylo044eArtb1LwexocTl8y4CyI7UgGiMJcrucwFPqO8WFqfkNpHe8aQHaR71jSl3z9zFjIg7v3izCLXyP5tg/GC06vTjE4Y4SDijSmOlhWj3cV3+Ln8zZxlgkFYqZhH1GEacs2ldGdjq3hrNITgi9eIlCooJYHFcuNtqcl2UgT16Ermc6bePB0ZM3xQQHvQ7z8FZsVBJqWGUBVT6dyn6C3Wa0ce3UV+DjtYkXr09fjs64dtyWLF7DOtruJnoQiM1qYNMOx3yIBwmChfFt0ckUZ4+CdsxHV1NEwvQjPO/fgEsj4BI/G4HW2677y2HEotw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLnwlnH76OWtNhIleJuayNy0b4PWiCL68vpzC4GgvPU=;
 b=SBzgr1bnZSIFsb8LxoQd4hh5b+zOo8d9iC/cSjrIXW13InlJWfL2wbAGgE9ZedIpVGtYYs2NV2kV1AGMLMW+/bN1QztCNe5oDYEaaexbo8RZJrLM9piyAUvqvVMSfE9XTKAHwiQYxkeT6SjizBh5d2wmhMZc6XC5kjz91FHCIUc=
Received: from BY5PR11MB4007.namprd11.prod.outlook.com (2603:10b6:a03:189::28)
 by BYAPR11MB3063.namprd11.prod.outlook.com (2603:10b6:a03:89::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Wed, 28 Jul
 2021 17:50:34 +0000
Received: from BY5PR11MB4007.namprd11.prod.outlook.com
 ([fe80::e478:6b2c:f71e:65bf]) by BY5PR11MB4007.namprd11.prod.outlook.com
 ([fe80::e478:6b2c:f71e:65bf%5]) with mapi id 15.20.4373.018; Wed, 28 Jul 2021
 17:50:34 +0000
From: <Dan.Sneddon@microchip.com>
To: <sam@ravnborg.org>, <Dan.Sneddon@microchip.com>
Subject: Re: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
Thread-Topic: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
Thread-Index: AQHXg7j3kajdLBgx2U2WcmMzDSjJJqtYfiKAgAAJZACAACMogA==
Date: Wed, 28 Jul 2021 17:50:34 +0000
Message-ID: <3d2f6b84-dd07-d925-a8b8-2bfd5fc736d9@microchip.com>
References: <20210727182721.17981-1-tzimmermann@suse.de>
 <20210727182721.17981-4-tzimmermann@suse.de> <YQFi96yaYbTG4OO7@ravnborg.org>
 <e28b1a2f-015c-c81b-eb64-5323df9ed35d@microchip.com>
 <YQF7bKyeup8n3awU@ravnborg.org>
In-Reply-To: <YQF7bKyeup8n3awU@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ravnborg.org; dkim=none (message not signed)
 header.d=none; ravnborg.org; dmarc=none action=none header.from=microchip.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cdae643-6589-4590-6d01-08d951f03345
x-ms-traffictypediagnostic: BYAPR11MB3063:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB30632BED29974E744D8D075FE1EA9@BYAPR11MB3063.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WCxkMEsV6krL78ZYR04WR93AsxxF3NiP9hh955tIJLl6ZAZSwTA/IdIx3n91tmi7atwpbWqsCBWpk+jDuaj9Ej8yg8uTC8d5v3TWvc0N7wWFbvjxyTaxg6OLlF9vVx96l/axE/Bb9Ft8c5IQvzDNkljpUiwgHELbyEqembEtVLGFRqikW7ygoAh5ZFyHUOvGRT8PU7sa1FSMwDx93RhFv64h2Aos6cPdLL0jfSnqsNuWc0/8jwCpbm6i/u42BiZFXu6/RMShkFDqubifOxTPdiN073DFryWMAPnfjZ0Ff5VL51MQ94a6LLy2vT7GXLpLoXNmR0P49JZLITr94qt+tDjnzqCefNeRkHJAotI2dwJ+ZsboPHVzrMdXK6EzHFwy8zJ+uTnAkT72tjfFORXyrAnensNXInJTthoAf1nmvL4gxIIxH6pCydnVb3/7+O2i0nSKPewfkqAal+GxhHHeL7gjqr28tNYaCNXE3CgyPTIXTnnVFqiAKyElRNfzCJuiEbV47aFCiib95ZiVahpIWfPx1J/Wv4b4jm8/sM4qe4lxn4bRqrz9RYbcX1DotCi9p/XTIsargfJ4ZBrBwtPhZBGzo6pNjDSO9xZ10wAkH3mDWqsXK0A6xZDPLNPt/ZeFsh5DBstdzBeXyFmxz3b5ZdeXVv+VNKkGsyL+8UAhJWZhaD22BbgGuVWJ5Q+BYtOsn6+utjDlOeuiC+wZBPSzJj12DE47H0yxXiyrt41bh0J87k4IdexNPvFoUM9+HY/k3uB3IGUMqJ1FcBFyFRkR3gEFkEaWiljC2FfLjSTXL6Lyx2vnWnGYEJMO4/GhHXBs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4007.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(346002)(376002)(396003)(366004)(66556008)(2616005)(26005)(53546011)(6506007)(83380400001)(71200400001)(7416002)(4326008)(2906002)(31686004)(5660300002)(6486002)(91956017)(110136005)(8936002)(31696002)(66476007)(38100700002)(54906003)(316002)(186003)(478600001)(966005)(86362001)(66946007)(8676002)(6512007)(122000001)(64756008)(38070700005)(36756003)(66446008)(76116006)(45980500001)(43740500002)(10090945008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Unc4NG1ORE9OV3ZXaFRvTXBRUk5VU3ZGMXY2T0dnU05XaEJSZEg1cGMrMWZP?=
 =?utf-8?B?Q1RkblVhN0Q5M3pGSGJOK1BZU2JEb25oUkZDdkIxaFV5RTgxRWZNdkIwY0VQ?=
 =?utf-8?B?dHpWYVlkSG05NXJ1b1FHM1V2L0xxS3lHdnN6NHpEMVVhS3lNRzBrQXlZMEt6?=
 =?utf-8?B?OEU0R3R3Wk43NUJJc1VveEc5a05iMFFibWJ5WldhUFJFcUtYSk1ySDhDUWtC?=
 =?utf-8?B?ZllNOC8vbElmL21MdDFva05PVlJKRW1NNVlNaFd6NXFnMjUvWTZlY2RDaGRQ?=
 =?utf-8?B?a2V0UHVkTXZTc2ZSSFgwVFAwdmpmZ003WjBQS2NxdEZUOVlCV2JLbktPSnkz?=
 =?utf-8?B?RHhHWWZ0ek5kd1hnK2ROYzFtL0JVaHNTN2JpaTQ3RzA1OWRxdXRpSkdhOW14?=
 =?utf-8?B?WWM4UXZiZFdQemlKUmdnbjFxdk81dlFZT0pWUzNGTG11aldEcEYwUUpZSWhU?=
 =?utf-8?B?NldEZW5xVUJra3hPbytISkNKQmIvRy8zTCs4SDlYNjg2Mld4Vy9RSWlHYUZW?=
 =?utf-8?B?MDdQY3pZaWdydnJpMjJlNGprMHA1VC8zQTJ5andXNmw2MW5TTmhSbTl4VUw2?=
 =?utf-8?B?Vmx4L202SkRaQTA2M3RlLy9QQWdxaW5LRFB0NXhEb1RjS0ZKR0xWSlRpUHh5?=
 =?utf-8?B?M3JKZEdPMTlkdnM3UEREeVhFUVdqeWtOL2RkMHBwaTNldHVIQnhicTVkQytW?=
 =?utf-8?B?Ukc2bjhjRTZ3amtGaWo4c3FpWUs1Mno3eVhXWUM2ejdPd01SUEh3NEVsNm9r?=
 =?utf-8?B?WFpldTF4WHFYUTZlSHd0Q2FoZE95REdCaFppdk5wck9vdzNtSFY1MGNpbzBx?=
 =?utf-8?B?SWdFdEVLNWVpazJuY2ZkRkVxSWNpQnovazhqVDBvWnRMZHE4ODdhenRSUGxa?=
 =?utf-8?B?d29DN2g5dzNSdzgyYStreXR3VEVRWlc1VGhPOU0zU255T1lsNGRTRm5IYmpn?=
 =?utf-8?B?U05sV0xQbGhmNHIvRVMrdldRcW9JYTk4WDd5c3JJc21xVHpMNi9tcUZFYjd2?=
 =?utf-8?B?V1VybUJWTkprRlBMK2swRVJpcTlEQjZ0Y1dTZGRERDBJMmxQa3I0Y01IYTNS?=
 =?utf-8?B?TWhDSXNMTldVVDhmV1duT1FWRmxKMGhhdy8xcWhZL3VwSysvOXBWN1Zyb1Vv?=
 =?utf-8?B?Z1F5MHVxZXpCeENwMTM4aG84N3ZEYzMxZE94YnVrblZrU0psOVdHOTdtMmZJ?=
 =?utf-8?B?NEpEU2pVL05panZGWlNueTAwTFBNMEk3WVdwcktZQjR5VDZBWVZBajk5V05r?=
 =?utf-8?B?VmNKblgxaGwwaE0zTENxQ2NnNHFWaVdxMVJrQU1Nd29ZR1B5UDB2dGVwb2tP?=
 =?utf-8?B?ZllCRGpraC80ZkFJTVoyc2tMR29DL2dmTy9QaFUwSEZZbkkzN1ZwblBodncx?=
 =?utf-8?B?alEvSEVTZjVUWGhHcmRNMitDVng4WjJlaFphUzZqR3NhZlZIQkQyM09kMlM5?=
 =?utf-8?B?cmlrcDBFVGRnbWV4QnRabDJ2ZFhSajFVL0NCdjVscUpBNU5YK3dGeVI2VkZv?=
 =?utf-8?B?OGk0VmdIUUxnOEdyQjcwdWZCS0F2d2xWWFdoT0pRSVBDd25kcDhrbURSK3Fr?=
 =?utf-8?B?aXJNRDlFbkFhZTEyNzJYRWM1WjJuMTdxRXVTdkZzZHE0eEl4UEo5c0NMK1dD?=
 =?utf-8?B?bk9YVzNBbkxFZ1lWUmhObXk1RUtCaDZuM1J5anVDRVlZUVc4OUJZTHBFOWcx?=
 =?utf-8?B?L01BRjJUcUJPTHFiZTQxY2dlWCtFWnhzWU00cHZXNWVsR0VMVVMrWloxakI5?=
 =?utf-8?Q?wpSyi1WWwFM9LDi9ytxYVKcnyuAKVs5+5ddm4PR?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69D78A6CC2A6F54B8092FEDD3DB2BA94@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4007.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cdae643-6589-4590-6d01-08d951f03345
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 17:50:34.2025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6S2uV548POlDXLyX2UJeR32xLw0J6WNw8gWKJrEKKAXiVnAU5ypkndGK2ijuzvFpBykJxBg92QWa81iHfMkLNQITbWqPTWN7/TCKgIkcZmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3063
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, amd-gfx@lists.freedesktop.org,
 anitha.chrisanthus@intel.com, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, tzimmermann@suse.de, edmund.j.dea@intel.com,
 s.hauer@pengutronix.de, alison.wang@nxp.com, dri-devel@lists.freedesktop.org,
 sean@poorly.run, linux-arm-kernel@lists.infradead.org, tomba@kernel.org,
 bbrezillon@kernel.org, jyri.sarha@iki.fi, Nicolas.Ferre@microchip.com,
 christian.koenig@amd.com, kernel@pengutronix.de, alexander.deucher@amd.com,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yOC8yMSA4OjQ0IEFNLCBTYW0gUmF2bmJvcmcgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gSGkgRGFuLA0KPiANCj4gT24gV2VkLCBKdWwgMjgs
IDIwMjEgYXQgMDM6MTE6MDhQTSArMDAwMCwgRGFuLlNuZWRkb25AbWljcm9jaGlwLmNvbSB3cm90
ZToNCj4+IE9uIDcvMjgvMjEgNzowMCBBTSwgU2FtIFJhdm5ib3JnIHdyb3RlOg0KPj4+IFtZb3Ug
ZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gc2FtQHJhdm5ib3JnLm9yZy4gTGVhcm4gd2h5IHRo
aXMgaXMgaW1wb3J0YW50IGF0IGh0dHA6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZp
Y2F0aW9uLl0NCj4+Pg0KPj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPj4+
DQo+Pj4gSGkgRGFuLA0KPj4+DQo+Pj4gSSBob3BlIHlvdSBjYW4gZmluZSB0byB0ZXN0IHRoaXMg
cGF0Y2ggZnJvbSBUaG9tYXMuDQo+Pj4gSWYgdGhpcyB3b3JrcyB0aGVuIHdlIGNhbiBmb3JnZXQg
YWJvdXQgbXkgYXR0ZW1wdCB0byBkbyB0aGUgc2FtZS4NCj4+DQo+PiBJJ2xsIHRlc3QgdGhpcyBh
cyBzb29uIGFzIEkgY2FuIGFuZCBsZXQgeW91IGtub3cuDQo+IA0KPiBUaGFua3MsIGNyb3NzaW5n
IG15IGZpbmdlcnMuLi4gKHdoaWNoIGV4cGxhaW5zIHRoZSBmdW5ueSBzcGVsbGluZyBmcm9tDQo+
IHRpbWUgdG8gdGltZSkNCj4gDQo+ICAgICAgICAgIFNhbQ0KPiBTbyBJIHJhbiB0aGUgdGVzdCBv
biBhbiBBNUQyNyBYVUxUIGJvYXJkIHdpdGggYSBQREE1IGRpc3BsYXkuICBPdXIgDQpncmFwaGlj
cyBkZW1vcyB0aGF0IGNvbWUgd2l0aCBvdXIgbGludXg0c2FtIHJlbGVhc2VzIHNlZW0gdG8gcnVu
IGp1c3QgDQpmaW5lLiAgbW9kZXRlc3QgLXYgc2VlbXMgdG8gcnVuIGp1c3QgZmluZS4gIEhvd2V2
ZXIsIHZibHRlc3QgcmV0dXJucyANCiJkcm1XYWl0VkJsYW5rIChyZWxhdGl2ZSkgZmFpbGVkIHJl
dDogLTEiLiAgSSBkb24ndCB1bmRlcnN0YW5kIHdoeSANCm1vZGV0ZXN0IC12IGlzIHdvcmtpbmcg
YW5kIHZibHRlc3QgaXNuJ3QsIGJ1dCB0aGF0J3Mgd2hhdCBJJ20gc2VlaW5nLg0KDQpUaGFua3Ms
DQpEYW4NCg==
