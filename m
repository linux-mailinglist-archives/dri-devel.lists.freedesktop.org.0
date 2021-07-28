Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B893D952B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 20:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26D16E9F2;
	Wed, 28 Jul 2021 18:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1966E949;
 Wed, 28 Jul 2021 18:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627496381; x=1659032381;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kzj/87PPYnnSpnKTxozsS6QXHEzzm+gCHR9I4NHhEso=;
 b=kXJ0xIrUL8etgjpht8qYzID78yRfvLRpERM0HG0eldKRQWXTM2VMZzCG
 2XUuehP1IaQZBYVuKnFUebIRfa0ElIxjoTubkqj7UEqS1i1MQTApZylEK
 xMsC9qRjo/k63pgbIa6dRETLVQAbry2sPUaV7dQ/BWXj5/OkuLn9L1CwU
 EhJ4VRQz6lZzY0/AyuuJvEK9QEpMcBGRUn0jQHWys25E2CGhvaGZlOuLI
 tqDA4AtmybnDG/FWQsE6weyH89CgjTZB4QgpRG+oHj8PYNZDwzZOBGQYf
 iJN8TRUbJAoc8zRxyieY71quiXiBAqMSthQd4TrI4elNtj2aBDxS0gbwe A==;
IronPort-SDR: DUzfc9K7lZEGS9gNnWyUKM9nhYpoqQaKFgKG2a4lnzgZZqu1U3PK0YRqS+5d6jjs+Sw2nIw1/0
 LbiWGngvQS3NaaVe1ToIaGUGk0Jh4kx9Dnpl6h/s5LeB3I+r9zvrFHUfeh1SJZ7jfrBau3t8rg
 crZ9P4i//sJLEOBGYhW+WphIDHg6HqO71B9rVwM6f915cq29HUpap6ylRf+MfKCmjNB94bxPqz
 eiBckRxSmhkCPG/sl4GYJQfibvzMfI2NoIGJ5UdQ/V2BxQ5sGYF9mnAnm4R+Xue46mLR/XddPA
 whANVyBLl8v34ePBBx2RbNLZ
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="137903766"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jul 2021 11:19:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 11:19:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Wed, 28 Jul 2021 11:19:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDbAkYEqIO0WjTiUEKz0iGqBy3HKH95gDhClW3Y9nJYLXyeqS39mUhRNz4YVxxtGdLCtOn1xooasRaLozVgZC3YVYOmQjTUOD1iIYfr6MhQwU0oN+IxJgqY5l+xo59si6U8mc+nxyUeXV9B71xBx85/y3ixLP2gqfVxO7RwvUYcpPTrlVcTTPm5gImMxFoyIYuz7ibWIgTJwPB6ulfUX4Coyn05KErwzaLHAHU2UnlGRAk0MsE7YhTpgUmJAkhrLbX3GE885DTNvextNN3UQmViN003ybd2nwMac9cRmtaB1GBV2jLtlYdqpUiJRm3vUxrXdkuR4sLHJbfxsxiXFlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzj/87PPYnnSpnKTxozsS6QXHEzzm+gCHR9I4NHhEso=;
 b=dyd6ZVrh8Mr7AfVp8kn3D12QhJEz+owbg4vD+j8RpuBszymGtjyYKvPxpM4J3hL4kL8TezzOHSFK7Q7fCbcg+QBzvVw1ctbAIjFg+LobCg7E2KVzkfCrLJhHnvJX2pxroTYQMRtjsrbEE2JLOlUxFbeUM4F7x7qn+t2HPVW4VZE/zT+G09ASC0Ho/sMCaPpd6O3osJLv1B+Z1mM/SGW9GKCp/nrNt7y/6Ao9M7W9KjB276OOxR0MH+wvLRUkR0m5gqLng3vmW40pbhBU3igjseZIMbGBDUMKuXMjtI3mXipfMmrP9Xxkuvf/mhiI2av9jnqFtWqZtDzSe7Xim0+wDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzj/87PPYnnSpnKTxozsS6QXHEzzm+gCHR9I4NHhEso=;
 b=ZCUSBlg0OHh3/hBHMk3YNYEaJCGwVi8TJiNKkKbmiUq4sECrj0VaBZJksUR0WT6lepRj1uJ//7ltIlKzIv0oM4wOId3xKWeGbkZCeROqYgfm6d6H6ZyecrdJgVlwVFH/BUiu3YEA6cdOBnoeiax0aQo4KthPeWmS+C9QDTIzoZQ=
Received: from BY5PR11MB4007.namprd11.prod.outlook.com (2603:10b6:a03:189::28)
 by BY5PR11MB4305.namprd11.prod.outlook.com (2603:10b6:a03:1bf::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 18:19:27 +0000
Received: from BY5PR11MB4007.namprd11.prod.outlook.com
 ([fe80::e478:6b2c:f71e:65bf]) by BY5PR11MB4007.namprd11.prod.outlook.com
 ([fe80::e478:6b2c:f71e:65bf%5]) with mapi id 15.20.4373.018; Wed, 28 Jul 2021
 18:19:27 +0000
From: <Dan.Sneddon@microchip.com>
To: <sam@ravnborg.org>, <Dan.Sneddon@microchip.com>
Subject: Re: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
Thread-Topic: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
Thread-Index: AQHXg7j3kajdLBgx2U2WcmMzDSjJJqtYfiKAgAAJZACAACMogIAABcwAgAACRQA=
Date: Wed, 28 Jul 2021 18:19:27 +0000
Message-ID: <1416f8fb-5e16-b57e-d3bb-cb69c21d1604@microchip.com>
References: <20210727182721.17981-1-tzimmermann@suse.de>
 <20210727182721.17981-4-tzimmermann@suse.de> <YQFi96yaYbTG4OO7@ravnborg.org>
 <e28b1a2f-015c-c81b-eb64-5323df9ed35d@microchip.com>
 <YQF7bKyeup8n3awU@ravnborg.org>
 <3d2f6b84-dd07-d925-a8b8-2bfd5fc736d9@microchip.com>
 <YQGdxtV0BGZ8VOpm@ravnborg.org>
In-Reply-To: <YQGdxtV0BGZ8VOpm@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ravnborg.org; dkim=none (message not signed)
 header.d=none; ravnborg.org; dmarc=none action=none header.from=microchip.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0541629c-6198-4958-0c2e-08d951f43c6a
x-ms-traffictypediagnostic: BY5PR11MB4305:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4305A80ECD01BF43D8725982E1EA9@BY5PR11MB4305.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eh5ieBOB/Cj2/jcj8LzKh1C0IwhH/Vr/af7LByiBu+Jhmpe9wH5npq/lEEm07fglXOteg75nQARJOJGGSmOZvsSMKonbHFBs9JFkEAq/pks74aH74CQ5dkHHWcC6uzjIatDCChGMw0gHInOQqaQtdTEACNvzC5wxJLVzs9eBpbgMW9WG2xJXBmvwtza1jJ12IYB/gJ1Fp/ABbEUS/Dx8ngbNn4Yjz7KxZjjvhVq2tZO3ILEk6aA2pT7VuonAhunyUc7RF9E7h1HddAUW/2/V6R6UDOCP1soa6s+TbOiE2sQYKnv48JxeGsFjRI6PSjkb9bG2sOfntWNotvNHJNYEcQ8SLoiHmFeIqLXwroAzz0csGcCeZFzjtR/tMnob5E1JLWKmtuiO99gp4rCD7DEM2WC8HDhJuMU8eKNuAVcN4vewxac2pDxxnHvd99+OW82Vghh0ZGBhKD6WW+I8AKTm4Aw3uD1Ivi10/4nsXe2SIwDq6o9LnNkJvAS0d/6ng+uH8s1Un/MzZT3bhAr0syNPZZHxpbyQR7UQkmBJjyB32NlVUQOfYRqPusJABgKJwn4XJIGzwUMKgi+mo/nLC+OFTWNUJG/JH6pX/3CMRCJfdpwEEC2zf81KD4uIa7Ecb8YZ3pOq2V1UEK2PSvZp1ecT9vNmY4qHhsVMEbr/72QMp8NXcs/9KqWZEjjcGrklXU4uDLO+6imwo8ZEtR/8d1HvyUEu4cFOjFYKyYMlub5VFlqql21ITQaYqErp+7LzDse2t0NDvQJS9XLA/coU6ZrxR6ct33f22Talugda0TGvBxALtBtGxLfqY1+3dNyPHQ5D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4007.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(396003)(376002)(346002)(136003)(2906002)(31696002)(86362001)(36756003)(6506007)(66446008)(5660300002)(66476007)(64756008)(66556008)(71200400001)(53546011)(122000001)(31686004)(38070700005)(7416002)(38100700002)(91956017)(4326008)(83380400001)(66946007)(6486002)(2616005)(478600001)(6512007)(966005)(316002)(8676002)(8936002)(186003)(26005)(76116006)(110136005)(54906003)(43740500002)(45980500001)(10090945008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkVEUkFMUnducjVmK0IvZDJnc2NvcUNLdXdTcjAwODVVQWJjWTRWMGV5RkJN?=
 =?utf-8?B?WjZIRysya0NEczNPQm9HSVAyTHEvMjRZK3cvZUlxTlFVcElSOHdQLzlzR2V2?=
 =?utf-8?B?VWZuRXJQMEJpNGpET0NnQUM3RjFjcjc1bzZJWlM4MDRKTjVtN1I0KzRZOEtn?=
 =?utf-8?B?THU0NHFDd0YvbnloYVFIVW02MWtFbWo2akhQQWNPWmhxM0x6UzVrRjl2WmV1?=
 =?utf-8?B?UUJLbkZDK1ZTV3B0QUxkakNMQkxLY0lydUd2aFBJUlJZcXlTeGlTdkhBcFE2?=
 =?utf-8?B?b0lSSmdNbVB2V1JjY2R1NmIzTEJjTitDcG9IMFB0ZFZSZkwydzNyUXlQNVdh?=
 =?utf-8?B?d3UrZUs2a1VyZk9FaXozTmhwMGdLSCtRQkJiL2M0K3IvaU9zT1ppejVrQnFE?=
 =?utf-8?B?WXhYUFNPaGEvT3BONGhCS0k4bFh2UExDakJEQmxub2xtTkJXQjJDellYdTZJ?=
 =?utf-8?B?SW1yZWVSMTF2cDNnM3pUZG0rejVaS09QYzhTdVdTUisyRkJoa2RzNmt3cnVP?=
 =?utf-8?B?R0NnSCt4SlhWSGZidzJ5UWhOTjc4bC8wZURMemxnR0pHeDJtclhBVWNjUEtT?=
 =?utf-8?B?ODN4MjZDTFlMUlpDdXJtUkpyendUanRMUkVpV3kzZ216dmZXL0RsSWFOYlBQ?=
 =?utf-8?B?Sno5ZHZPZmsvYUwxMjJZYXFSUWdkRWw0OUdGbElGWnNDajNFbG4razhYTEhr?=
 =?utf-8?B?Uk9EbCtvTk15TWtWTGhBdVZPYngwSXdOWUlJc21XQnNYUFBMWW94MFpQbFhM?=
 =?utf-8?B?R0ltKzU2N1NpWHlnL3ZRRVMxT3RuUjZqQnMxYnp4WGhlMm1ZbmZaVFZqWC8w?=
 =?utf-8?B?Z0ttNXo0UHdsWG9DZWxpUzIrcnRmb0RhTU1ZY0JCS3FPT2FobVdMcWN3NEt3?=
 =?utf-8?B?RXYwcldDbHE1ZnhpTVgvL2VCY3lpaGtvVGxiaFRwTjVsNFVxRnpVbnp5WHNw?=
 =?utf-8?B?Y2lMbGY2NmcyU21HUzRvT3VBd2hkK1I5aVVaWVIyVkpUdzFacWRyVnZhaEpi?=
 =?utf-8?B?WEhsbkloRisvdGh4a2pwRWJhcTFKanRjd1JWSTFNS3NlYUtqblVMcngycith?=
 =?utf-8?B?VGg0K3R5WjJ2YjRXa1I4ZGZpQmFkOGRha05JWXl0Y1IrK2wzRzRCS0VUd2Yw?=
 =?utf-8?B?ekVvb3RudE1GVWczRTB6WmhNWkcyeElXTDJtaDBzWWtyOEUvYlMyQVRmTHFN?=
 =?utf-8?B?SDF4V0VaQXFrcE1MdGdyL1k2TG51cVF5NDh6QStOUllOQmdWY0JLenpyUHRO?=
 =?utf-8?B?SWhLeXBaNTRINU1mR2hkSHBFMmJrMzdzQy9Wbk1yMjlQRUlINTRnMlQvWklj?=
 =?utf-8?B?dmhTalB6OExQcUpLR1RURWZzUzlsV3VDSXNTQ2oyM1VWRzhzME11ekErZWJF?=
 =?utf-8?B?QXZaQWh0OUZmV3NublVxL296WWd6NmlzUUJkMEdmK1AwVTlKcktDQzZRTFBI?=
 =?utf-8?B?cG9pVE0xTGNxTW9wdjNoOUV6QllLTC9ZNEw0MlJCZXlkL0VDZUNjdG1tMWI3?=
 =?utf-8?B?c1RtLyt3UjhaZHowckQydHgyRStUM1Q3Z01ENE4zb3laSWxFTDRrNzlKTmpG?=
 =?utf-8?B?RlFPZGw3cmY3UlVXaitpS2JlOUJhS25qanQxOHAzQ3lMWDIra2NQNmpmVGlN?=
 =?utf-8?B?dXhMM1V0citZUDNmRmVubFczR0ZWa1VSQmdWci93TGhuSWhvV3lvMzc1ZDR4?=
 =?utf-8?B?eE9qeXptb0d4bXlId0I2ZUNMWFc1TGplUnN6eGo5TTVCTXV0Y2ZaaEZQQmJ0?=
 =?utf-8?Q?JC1T6M8Qgmw2ed1ln2hlGWBHforcGNpjHt7PcGs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <76AF352FC670D04A90ED2B01F6433C55@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4007.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0541629c-6198-4958-0c2e-08d951f43c6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 18:19:27.5549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pNIlPiAdOcHiNKIpHkSFrAQm97OlcWaiu2Vpp0QrO6qRlwcWv04toKM0hVvSuewhNiJDr8gkJOusnooe3OJe4fjaTiGanIf1gkrB/DAUGQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4305
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

T24gNy8yOC8yMSAxMToxMSBBTSwgU2FtIFJhdm5ib3JnIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpIERhbiwNCj4gDQo+IHRoYW5rcyBmb3IgdGhl
IHF1aWNrIGZlZWRiYWNrIQ0KPiANCj4gT24gV2VkLCBKdWwgMjgsIDIwMjEgYXQgMDU6NTA6MzRQ
TSArMDAwMCwgRGFuLlNuZWRkb25AbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IE9uIDcvMjgvMjEg
ODo0NCBBTSwgU2FtIFJhdm5ib3JnIHdyb3RlOg0KPj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3Qg
Y2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZQ0KPj4+DQo+Pj4gSGkgRGFuLA0KPj4+DQo+Pj4gT24gV2VkLCBKdWwgMjgsIDIw
MjEgYXQgMDM6MTE6MDhQTSArMDAwMCwgRGFuLlNuZWRkb25AbWljcm9jaGlwLmNvbSB3cm90ZToN
Cj4+Pj4gT24gNy8yOC8yMSA3OjAwIEFNLCBTYW0gUmF2bmJvcmcgd3JvdGU6DQo+Pj4+PiBbWW91
IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIHNhbUByYXZuYm9yZy5vcmcuIExlYXJuIHdoeSB0
aGlzIGlzIGltcG9ydGFudCBhdCBodHRwOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlm
aWNhdGlvbi5dDQo+Pj4+Pg0KPj4+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5r
cyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZl
DQo+Pj4+Pg0KPj4+Pj4gSGkgRGFuLA0KPj4+Pj4NCj4+Pj4+IEkgaG9wZSB5b3UgY2FuIGZpbmUg
dG8gdGVzdCB0aGlzIHBhdGNoIGZyb20gVGhvbWFzLg0KPj4+Pj4gSWYgdGhpcyB3b3JrcyB0aGVu
IHdlIGNhbiBmb3JnZXQgYWJvdXQgbXkgYXR0ZW1wdCB0byBkbyB0aGUgc2FtZS4NCj4+Pj4NCj4+
Pj4gSSdsbCB0ZXN0IHRoaXMgYXMgc29vbiBhcyBJIGNhbiBhbmQgbGV0IHlvdSBrbm93Lg0KPj4+
DQo+Pj4gVGhhbmtzLCBjcm9zc2luZyBteSBmaW5nZXJzLi4uICh3aGljaCBleHBsYWlucyB0aGUg
ZnVubnkgc3BlbGxpbmcgZnJvbQ0KPj4+IHRpbWUgdG8gdGltZSkNCj4+Pg0KPj4+ICAgICAgICAg
ICBTYW0NCj4+PiBTbyBJIHJhbiB0aGUgdGVzdCBvbiBhbiBBNUQyNyBYVUxUIGJvYXJkIHdpdGgg
YSBQREE1IGRpc3BsYXkuICBPdXINCj4+IGdyYXBoaWNzIGRlbW9zIHRoYXQgY29tZSB3aXRoIG91
ciBsaW51eDRzYW0gcmVsZWFzZXMgc2VlbSB0byBydW4ganVzdA0KPj4gZmluZS4gIG1vZGV0ZXN0
IC12IHNlZW1zIHRvIHJ1biBqdXN0IGZpbmUuICBIb3dldmVyLCB2Ymx0ZXN0IHJldHVybnMNCj4+
ICJkcm1XYWl0VkJsYW5rIChyZWxhdGl2ZSkgZmFpbGVkIHJldDogLTEiLiAgSSBkb24ndCB1bmRl
cnN0YW5kIHdoeQ0KPj4gbW9kZXRlc3QgLXYgaXMgd29ya2luZyBhbmQgdmJsdGVzdCBpc24ndCwg
YnV0IHRoYXQncyB3aGF0IEknbSBzZWVpbmcuDQo+IA0KPiBTdHJhbmdlIGluZGVlZC4NCj4gDQo+
IA0KPiBKdXN0IHRvIGJlIHN1cmUuLi4NCj4gQ2FuIHlvdSBjb25maXJtIHRoYXQgdmJsdGVzdCBp
cyB3b3JraW5nIE9LICpiZWZvcmUqIHRoaXMgcGF0Y2g/DQo+IA0KPiAgICAgICAgICBTYW0NCj4g
DQpJJ20gYWZyYWlkIHZibHRlc3Qgd29ya3Mgd2l0aG91dCB0aGUgcGF0Y2gsIGJ1dCBub3Qgd2l0
aCBpdC4NCg0KRGFuDQo=
