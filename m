Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1F83D918C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 17:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49046E110;
	Wed, 28 Jul 2021 15:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF3D6E110
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 15:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627485073; x=1659021073;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GlPawDKn+tgwgVuSiCv2mWtF4ddTrtC2DzvZGqGqL3c=;
 b=aGnP80QzhiiJkJ0O6rZcNJa3fu6A+snEuM3AstZ64Ob3dhsiOuz1XHsA
 kds3mPlfOdUVh1xmXdCwZIhFUgLyFkLue/oIfDT1wpI2yr21PprA9lIeA
 G5KUhDQLtthyRTt8rads3DcDRgE+wxhhreRComu086IrIoe+H61nbQv/u
 ZGGSFt6IMDB/rjg4draeZ95hainCIbhA2Oa8KPWUuEfh43Zwcxdhz1Uvx
 ceGkaqx/kWcBvvAVrSUgKYAjqWzuM+VUKGpcIZbghpWQWCq2Xh3LW2yR0
 lrauCXjIaRf9vQ7k3SsPnLQiGjQjjAKusd+1ujGbsVu04aNApC/YXpCkk g==;
IronPort-SDR: UASToKUbgbjKLQ4YAVjXEITdjT9Ms/vSLtGgFt2YbH7wWR0olBK86rhtS9EgwUBPoL8CijW+GM
 KX9YXD8td4k/JcMZ2WXYlJwN1aN6bgpY0cShv/M1S4AW3uoAJphCeH/ydnRTbz7XCIG14+ciff
 pOc4acehH4XsCDmZfDM96RkUr/+8+XpxU6QGPXiTYIg8PwVk5y26XtYBFQSaS/9lL8+LFd1//U
 xvbpcR92VPvdEoaYk9qYz5TmaN9jY6y3ne5CF13dF213eNe+7OcBl0WQcN9envqNM70SzDL8Ql
 rZM+nLBfNr6rJnq1A1ZGdphC
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="130153875"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jul 2021 08:11:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 08:11:10 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Wed, 28 Jul 2021 08:11:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5vrU8ythGUbbkXyetLjCjNzccALPeYtjZdS3YSrS5F9/sUZEr+XrhSdebpr3wtdumgs4kQXT9GqNbyL0IxOkN+OSYMxGHcQAYt5DMW2OXKFd9v9zLl26MmdJPHVmmfDCdeyNsfHtqWr4fDJ2CtoScK457ttGGZcHpYG7mHhyiX2dZBKjthNYWSdf/3n5R5sAT2GwhwNV2Kes+rjtLCyk/OQcZabVJTTt0e8kUUzwkOfT013JaA7pWkITFXxSdWlrPIrzSnqRjUWaxSvj51ECc6aMs8xb/+iiZbCfqdN31uRjdbKfyPXnZuG/CgVHKIOgnhthoJq3JxFfZcdZ0Y+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlPawDKn+tgwgVuSiCv2mWtF4ddTrtC2DzvZGqGqL3c=;
 b=Q9oiRtnzrZ/ElWZ7j7t5Qvk7xxbRhB2c9OFLP3t38YvvlO7T9stbW5uuM/TXSZm06Ca+HDIuOLWbf0hxGNfhG0In8OQN2VEb+AkVn9vAo1zv5bUhS5soI6C4PpOYh/CG13uubwV2HSNcl6uobBe31LPUlzqFz2BID6YAxzDcidt2kpYCdRWRgoo5StSGWa02tUxvCGE/bUOcvkHCVJUcHlmO8y6mO6b40anPih4ZDIMlVsSld7RV1iDC7tfJkkHXr0cEgZayLIz24LGOXfev3ac3yvvrI0LnQKms8lqPhB+6CIRux4LP9Po/0SI0UGWIhR98Chcv4qIjoCLRmpuN+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlPawDKn+tgwgVuSiCv2mWtF4ddTrtC2DzvZGqGqL3c=;
 b=Xa37YYQoZkU6VHSJdX9FtH7EI9WGkkifJcUbNsbESm8OMfQUlZVqUvpP9e/dQnz0rJX9N/xI9oQ2t/iF4sjVA4ovAqcu0EHLRIjOsyL7AB7soFWTjKIF5dFEDiU3b2JFRV0zYDSUnfFiVZQbxXUOsdV8vZrXdHnA9VIoEWqvXvo=
Received: from BY5PR11MB4007.namprd11.prod.outlook.com (2603:10b6:a03:189::28)
 by SJ0PR11MB5168.namprd11.prod.outlook.com (2603:10b6:a03:2dc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 15:11:08 +0000
Received: from BY5PR11MB4007.namprd11.prod.outlook.com
 ([fe80::e478:6b2c:f71e:65bf]) by BY5PR11MB4007.namprd11.prod.outlook.com
 ([fe80::e478:6b2c:f71e:65bf%5]) with mapi id 15.20.4373.018; Wed, 28 Jul 2021
 15:11:08 +0000
From: <Dan.Sneddon@microchip.com>
To: <sam@ravnborg.org>, <tzimmermann@suse.de>, <Dan.Sneddon@microchip.com>
Subject: Re: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
Thread-Topic: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
Thread-Index: AQHXg7j3kajdLBgx2U2WcmMzDSjJJqtYfiKA
Date: Wed, 28 Jul 2021 15:11:08 +0000
Message-ID: <e28b1a2f-015c-c81b-eb64-5323df9ed35d@microchip.com>
References: <20210727182721.17981-1-tzimmermann@suse.de>
 <20210727182721.17981-4-tzimmermann@suse.de> <YQFi96yaYbTG4OO7@ravnborg.org>
In-Reply-To: <YQFi96yaYbTG4OO7@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ravnborg.org; dkim=none (message not signed)
 header.d=none; ravnborg.org; dmarc=none action=none header.from=microchip.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77373543-5365-4973-81d8-08d951d9edad
x-ms-traffictypediagnostic: SJ0PR11MB5168:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB5168548BE43F7F3E73EF44E0E1EA9@SJ0PR11MB5168.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pbvmu+fvCAn8i9D1UIDU7t96ABcCdEWMJp9Gn1oTaxIOmxKv45CjG/UZeNQ14rGClF5tQaT0OUA8+Ihpxc2KKHVJP4gidzCyME256SXl/2bBktjrnBekKSsIG00JXXgsAYobFsQt1aO7PWEjs16aXHM8938mIGI1qITMii/WIM9C3kwOESQpPtwE4blKcJsQ/RWKDgFNDAgLuuTT5ObN0RO2mEDpmJBSOeZQaGphebLvEetowqsM2L9wI/1X+QuWYSV2n4vvhnSVMJdEA3wG0isfnd2IIY5qN+xzfCJKQWTA/oec4Ipm3artGgZta/iUD5jwKHL3vELNwq2xptMOByT2vq+AhoFnTM+I4m6rOohal+/GzKhlSA6g6b9HPn57w3QReZcJLtx3x/2e8mxBQH10GI0FtHOQu3FuYxFoDnAoiVQwWARqZx0Q+7UbBoq9wZY99JGBPvSdvJIasOakubCK7pjrCQYUPR4ND6raHFphv0XUDMBAPIodzYXepta90gZRn1tUBYv1MloqIvP9bSaD1/kPKAk2XCIdF4ZTj3eJ1PrSKrfmWKqri4shBet4g88xikL13bY8FCF6onNSDoqRlovrYNC2dfRUtQDxukmLpyQfbyOLNipDb0GQlJV+nHUCusI41bribNuslUV9NScU5xjV3qyI5FOdTFhL+UVllTAWJ1SGviwC4Q7FnOqWyKYj+ctrCTD4L0ZyFwG55nY6R+IbaFcSSaob/G/8BFRQMJtnhpO8GQxUIN2rjnoMR8ppyByNHMsu7o+enxub+RL3oJdrYqhdIsTzxlbhflRog60XSrpGdeZX5DewVXXF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4007.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(346002)(366004)(396003)(39860400002)(53546011)(5660300002)(7416002)(6486002)(8936002)(26005)(186003)(8676002)(2906002)(36756003)(31686004)(54906003)(6512007)(316002)(966005)(83380400001)(66556008)(71200400001)(122000001)(64756008)(86362001)(6506007)(110136005)(66476007)(66446008)(38100700002)(31696002)(91956017)(478600001)(38070700005)(4326008)(2616005)(76116006)(66946007)(45980500001)(43740500002)(10090945008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmRKWUtvd3hUTytOZ3JvZnl6ZUVxYjJ0MmRrcEZJU1dWdXlVVnZyZnh4NEs3?=
 =?utf-8?B?YlhkdFZ2MG1QbmFkVlJuLzhtWFB0ZE43bjRqOXZ1ZlA5NlFTWU9vSDg1Rmtx?=
 =?utf-8?B?aGdBWlZHN3pHVm9YSWZVaFZMREFKUzBEUTJRM1o0LzZ3Q3l6Q0tzV29zYVNZ?=
 =?utf-8?B?emdIYkE3OGtNUEl5eWF2MzdtRDh4bzBubjIxcjJaTExOaWRGQi9GeWJoVmEy?=
 =?utf-8?B?akJobzJ6V2ZaalIzL2hEKzh4d0tvWEFUMDYxcE9VZGEzSE53SVQ3TTNqTWRW?=
 =?utf-8?B?a242aHRzblFNTjJkRmpjYjZ0eW9sdWNUb0plb1VZQ3FLV0NrWHZhMjlUMW1J?=
 =?utf-8?B?b2RaeENOajFYTUVJWkgrNUFrNEhnSFQxeVhDZ3pLSTRqbzBlM0ZWNWN6Qk9x?=
 =?utf-8?B?SVRZZkNrWFN4Zmg1UEFTTlAwRWdTZW1nQy9tSlZjTDdrWHMvaXVRSExOOVA1?=
 =?utf-8?B?U3ZPMVFJc3dkNTllTGdzTEpWS3ltQ09vbWZKVzJTUFdZTFg4ZWEvZU5mNlBo?=
 =?utf-8?B?SWZacENZdTN4TFNhNG5zWTZpckFkQkw1RFR1ejJ0ZDZIWlJhV1pjSExSeEhF?=
 =?utf-8?B?YUxiblFuVnIvY3d3Z2JGSkdoTzRRSTdzeXhHdTVVbVZEcE5aVlMxeE1Ua2lN?=
 =?utf-8?B?Nkp4QVhTZ0VWTzd6ODVVZU1kTGlmQ3hkZ1YzVGloYy9aNXJWWXFNZkhXazVP?=
 =?utf-8?B?Rk5LdDhXRXdtcUVmcTRwSkVkUERhNlNmcU9Ha0NLNkJ1Y24waVBMbTY2eVlS?=
 =?utf-8?B?NXdXWWhjOGJhM29rbzdBTitiUG5vS1FxMXg4cy9Nck9DYnk3YnBKSThxS0NO?=
 =?utf-8?B?cGlFeEpXUmNTUkNFbCtKT3hrQU14dXRHM05aWVFYc2F4enhwWnpMQjd1VnZo?=
 =?utf-8?B?RVcxcHI2YzhLelRuKzV3c3dEVDg5a2pnQ2N4Y3h5OFR2ZElMRFhXLzFIdmlF?=
 =?utf-8?B?Yk9CN2hheEtnYzZteEdZYnRUOTEyd0IwYmkxR3RqVXNEdnc3b0JXSkJjOTFI?=
 =?utf-8?B?ZVlJRk5CYS9WTFdzZHZaSkxJdVdCTVZ5elFoWTQ5ZmZ2dVNhY2FiTnBWZktJ?=
 =?utf-8?B?dFJkcGE2UFYzdlJHdEZ6VVBJNk1FK1F6SHg5c2pGQ3VxSG1mQlVISTNITE5J?=
 =?utf-8?B?Y2x6ZFNNcjBZNWcvdy9OeDVEK1ppTmxyaW1SaUwvT0M5VzZzZTdPbDNxcGV0?=
 =?utf-8?B?REtWYWlvMW5hU1B3T0htMk1leEc0Y3UxQ0FGOVgwSGxENjRVTS8vSjYzVlhN?=
 =?utf-8?B?czJYNElQTnNLNnh4OTNuSk5KRVVnV1ErMEpDMlNIV2M0UWpCbUk3Mm0wQmZn?=
 =?utf-8?B?dmVTa1MwbXY4SGNtcjhDRTBGRExsS2Z2aENQclZlSDdHWUp1QmU2Rm5IQm9k?=
 =?utf-8?B?VUVsZ3U4a2tVM01vNEJKZXdiMzVrbnUxQ3FOMWVqY1MyUDE1ZWVvQnp5NGsw?=
 =?utf-8?B?ZGtHRGp3ZUlCNVJKcmw3SjFMbU5EYjVmbHpSbG5xVDhoQ1drL0ZtUU5Va055?=
 =?utf-8?B?eU5IYUc2QWZucWFvb3d4YUhFOHlHRUpDcXpER0ZNYXJOaWZVUjcrNFFXUHJh?=
 =?utf-8?B?ZSsrYUNiLysxUjJHVC9oMG9JajhUSGdMc1l2V1ArUC9RKzJBSkpFTkw3SElj?=
 =?utf-8?B?S0JvNS9BNjFncWtrZmVZcEJJN1FoaHRNaTE5OWdhUUxESk5zdzZkbmx5V2pk?=
 =?utf-8?B?ZEtjYzBiNXIrVGx1WGhjT1pSeExDWXZ2WktZcWNSQk0vOFg1T3dueGR1RE9N?=
 =?utf-8?Q?vvNNoQEk1jUaCFKvcsv3TAg+RpCBSuiVOgy+kWi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9527976352521042B6E4A04A608B8B9E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4007.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77373543-5365-4973-81d8-08d951d9edad
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 15:11:08.6040 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lmhwHxjfk8eSsmOPXaYMB95ZXQ9/yy/u3lwGWNrxXVuAzZofUW4f4XFlj0nlHno4FOvvMaMf7BYuNFfHQa5dpMgdjprC054xj/MCDlkhbLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5168
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
 freedreno@lists.freedesktop.org, edmund.j.dea@intel.com,
 s.hauer@pengutronix.de, alison.wang@nxp.com, dri-devel@lists.freedesktop.org,
 sean@poorly.run, linux-arm-kernel@lists.infradead.org, tomba@kernel.org,
 bbrezillon@kernel.org, jyri.sarha@iki.fi, Nicolas.Ferre@microchip.com,
 christian.koenig@amd.com, kernel@pengutronix.de, alexander.deucher@amd.com,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yOC8yMSA3OjAwIEFNLCBTYW0gUmF2bmJvcmcgd3JvdGU6DQo+IFtZb3UgZG9uJ3Qgb2Z0
ZW4gZ2V0IGVtYWlsIGZyb20gc2FtQHJhdm5ib3JnLm9yZy4gTGVhcm4gd2h5IHRoaXMgaXMgaW1w
b3J0YW50IGF0IGh0dHA6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uLl0N
Cj4gDQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gSGkgRGFuLA0K
PiANCj4gSSBob3BlIHlvdSBjYW4gZmluZSB0byB0ZXN0IHRoaXMgcGF0Y2ggZnJvbSBUaG9tYXMu
DQo+IElmIHRoaXMgd29ya3MgdGhlbiB3ZSBjYW4gZm9yZ2V0IGFib3V0IG15IGF0dGVtcHQgdG8g
ZG8gdGhlIHNhbWUuDQoNCkknbGwgdGVzdCB0aGlzIGFzIHNvb24gYXMgSSBjYW4gYW5kIGxldCB5
b3Uga25vdy4NCg0KVGhhbmtzLA0KRGFuDQo+IA0KPiBIaSBUaG9tYXMsDQo+IA0KPiBJUlFfTk9U
Q09OTkVDVEVEIGNoZWNrIHNlZW1zIHJlZHVuZGFudCwgYXMgbWVudGlvbmVkIGluIGFub3RoZXIg
cGF0Y2gNCj4gYWxyZWFkeS4NCj4gDQo+IFdpdGggdGhhdCBjb25zaWRlcmVkOg0KPiBSZXZpZXdl
ZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPg0KPiANCj4gV2Ugc2hhbGwgd2Fp
dCBmb3IgdGVzdGluZyBmcm9tIERhbiBiZWZvcmUgeW91IGFwcGx5IGl0IGFzIEkgaGFkIG1hZGUg
YQ0KPiBzaW1pbGFyIHBhdGNoIHRoYXQgZmFpbGVkIHRvIHdvcmsuIEkgYXNzdW1lIG15IHBhdGNo
IHdhcyBidWdneSBidXQgSQ0KPiBwcmVmZXIgdG8gYmUgc3VyZS4NCj4gDQo+ICAgICAgICAgIFNh
bQ0KPiANCj4gT24gVHVlLCBKdWwgMjcsIDIwMjEgYXQgMDg6Mjc6MTBQTSArMDIwMCwgVGhvbWFz
IFppbW1lcm1hbm4gd3JvdGU6DQo+PiBEcm9wIHRoZSBEUk0gSVJRIG1pZGxheWVyIGluIGZhdm9y
IG9mIExpbnV4IElSUSBpbnRlcmZhY2VzLiBEUk0ncw0KPj4gSVJRIGhlbHBlcnMgYXJlIG1vc3Rs
eSB1c2VmdWwgZm9yIFVNUyBkcml2ZXJzLiBNb2Rlcm4gS01TIGRyaXZlcnMNCj4+IGRvbid0IGJl
bmVmaXQgZnJvbSB1c2luZyBpdC4gRFJNIElSUSBjYWxsYmFja3MgYXJlIG5vdyBiZWluZyBjYWxs
ZWQNCj4+IGRpcmVjdGx5IG9yIGlubGluZWQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFz
IFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9n
cHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2RjLmMgfCA4NSArKysrKysrKysrKystLS0t
LS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKSwgMzMgZGVsZXRpb25z
KC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1l
bF9obGNkY19kYy5jIGIvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2Rj
LmMNCj4+IGluZGV4IGYwOWI2ZGQ4NzU0Yy4uY2ZhOGMyYzljOGFhIDEwMDY0NA0KPj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2RjLmMNCj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19kYy5jDQo+PiBAQCAtMjIsNyAr
MjIsNiBAQA0KPj4gICAjaW5jbHVkZSA8ZHJtL2RybV9mYl9oZWxwZXIuaD4NCj4+ICAgI2luY2x1
ZGUgPGRybS9kcm1fZ2VtX2NtYV9oZWxwZXIuaD4NCj4+ICAgI2luY2x1ZGUgPGRybS9kcm1fZ2Vt
X2ZyYW1lYnVmZmVyX2hlbHBlci5oPg0KPj4gLSNpbmNsdWRlIDxkcm0vZHJtX2lycS5oPg0KPj4g
ICAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4NCj4+ICAgI2luY2x1ZGUgPGRybS9k
cm1fdmJsYW5rLmg+DQo+Pg0KPj4gQEAgLTU1Nyw2ICs1NTYsNTYgQEAgc3RhdGljIGlycXJldHVy
bl90IGF0bWVsX2hsY2RjX2RjX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRhdGEpDQo+PiAg
ICAgICAgcmV0dXJuIElSUV9IQU5ETEVEOw0KPj4gICB9DQo+Pg0KPj4gK3N0YXRpYyB2b2lkIGF0
bWVsX2hsY2RjX2RjX2lycV9wb3N0aW5zdGFsbChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPj4g
K3sNCj4+ICsgICAgIHN0cnVjdCBhdG1lbF9obGNkY19kYyAqZGMgPSBkZXYtPmRldl9wcml2YXRl
Ow0KPj4gKyAgICAgdW5zaWduZWQgaW50IGNmZyA9IDA7DQo+PiArICAgICBpbnQgaTsNCj4+ICsN
Cj4+ICsgICAgIC8qIEVuYWJsZSBpbnRlcnJ1cHRzIG9uIGFjdGl2YXRlZCBsYXllcnMgKi8NCj4+
ICsgICAgIGZvciAoaSA9IDA7IGkgPCBBVE1FTF9ITENEQ19NQVhfTEFZRVJTOyBpKyspIHsNCj4+
ICsgICAgICAgICAgICAgaWYgKGRjLT5sYXllcnNbaV0pDQo+PiArICAgICAgICAgICAgICAgICAg
ICAgY2ZnIHw9IEFUTUVMX0hMQ0RDX0xBWUVSX1NUQVRVUyhpKTsNCj4+ICsgICAgIH0NCj4+ICsN
Cj4+ICsgICAgIHJlZ21hcF93cml0ZShkYy0+aGxjZGMtPnJlZ21hcCwgQVRNRUxfSExDRENfSUVS
LCBjZmcpOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBhdG1lbF9obGNkY19kY19pcnFf
ZGlzYWJsZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPj4gK3sNCj4+ICsgICAgIHN0cnVjdCBh
dG1lbF9obGNkY19kYyAqZGMgPSBkZXYtPmRldl9wcml2YXRlOw0KPj4gKyAgICAgdW5zaWduZWQg
aW50IGlzcjsNCj4+ICsNCj4+ICsgICAgIHJlZ21hcF93cml0ZShkYy0+aGxjZGMtPnJlZ21hcCwg
QVRNRUxfSExDRENfSURSLCAweGZmZmZmZmZmKTsNCj4+ICsgICAgIHJlZ21hcF9yZWFkKGRjLT5o
bGNkYy0+cmVnbWFwLCBBVE1FTF9ITENEQ19JU1IsICZpc3IpOw0KPj4gK30NCj4+ICsNCj4+ICtz
dGF0aWMgaW50IGF0bWVsX2hsY2RjX2RjX2lycV9pbnN0YWxsKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsIHVuc2lnbmVkIGludCBpcnEpDQo+PiArew0KPj4gKyAgICAgaW50IHJldDsNCj4+ICsNCj4+
ICsgICAgIGlmIChpcnEgPT0gSVJRX05PVENPTk5FQ1RFRCkNCj4+ICsgICAgICAgICAgICAgcmV0
dXJuIC1FTk9UQ09OTjsNCj4+ICsNCj4+ICsgICAgIGF0bWVsX2hsY2RjX2RjX2lycV9kaXNhYmxl
KGRldik7DQo+PiArDQo+PiArICAgICByZXQgPSByZXF1ZXN0X2lycShpcnEsIGF0bWVsX2hsY2Rj
X2RjX2lycV9oYW5kbGVyLCAwLCBkZXYtPmRyaXZlci0+bmFtZSwgZGV2KTsNCj4+ICsgICAgIGlm
IChyZXQpDQo+PiArICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+PiArDQo+PiArICAgICBhdG1l
bF9obGNkY19kY19pcnFfcG9zdGluc3RhbGwoZGV2KTsNCj4+ICsNCj4+ICsgICAgIHJldHVybiAw
Ow0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBhdG1lbF9obGNkY19kY19pcnFfdW5pbnN0
YWxsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+PiArew0KPj4gKyAgICAgc3RydWN0IGF0bWVs
X2hsY2RjX2RjICpkYyA9IGRldi0+ZGV2X3ByaXZhdGU7DQo+PiArDQo+PiArICAgICBhdG1lbF9o
bGNkY19kY19pcnFfZGlzYWJsZShkZXYpOw0KPj4gKyAgICAgZnJlZV9pcnEoZGMtPmhsY2RjLT5p
cnEsIGRldik7DQo+PiArfQ0KPj4gKw0KPj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9tb2Rl
X2NvbmZpZ19mdW5jcyBtb2RlX2NvbmZpZ19mdW5jcyA9IHsNCj4+ICAgICAgICAuZmJfY3JlYXRl
ID0gZHJtX2dlbV9mYl9jcmVhdGUsDQo+PiAgICAgICAgLmF0b21pY19jaGVjayA9IGRybV9hdG9t
aWNfaGVscGVyX2NoZWNrLA0KPj4gQEAgLTY0Nyw3ICs2OTYsNyBAQCBzdGF0aWMgaW50IGF0bWVs
X2hsY2RjX2RjX2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4+ICAgICAgICBkcm1fbW9k
ZV9jb25maWdfcmVzZXQoZGV2KTsNCj4+DQo+PiAgICAgICAgcG1fcnVudGltZV9nZXRfc3luYyhk
ZXYtPmRldik7DQo+PiAtICAgICByZXQgPSBkcm1faXJxX2luc3RhbGwoZGV2LCBkYy0+aGxjZGMt
PmlycSk7DQo+PiArICAgICByZXQgPSBhdG1lbF9obGNkY19kY19pcnFfaW5zdGFsbChkZXYsIGRj
LT5obGNkYy0+aXJxKTsNCj4+ICAgICAgICBwbV9ydW50aW1lX3B1dF9zeW5jKGRldi0+ZGV2KTsN
Cj4+ICAgICAgICBpZiAocmV0IDwgMCkgew0KPj4gICAgICAgICAgICAgICAgZGV2X2VycihkZXYt
PmRldiwgImZhaWxlZCB0byBpbnN0YWxsIElSUSBoYW5kbGVyXG4iKTsNCj4+IEBAIC02NzYsNyAr
NzI1LDcgQEAgc3RhdGljIHZvaWQgYXRtZWxfaGxjZGNfZGNfdW5sb2FkKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYpDQo+PiAgICAgICAgZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZGV2KTsNCj4+DQo+
PiAgICAgICAgcG1fcnVudGltZV9nZXRfc3luYyhkZXYtPmRldik7DQo+PiAtICAgICBkcm1faXJx
X3VuaW5zdGFsbChkZXYpOw0KPj4gKyAgICAgYXRtZWxfaGxjZGNfZGNfaXJxX3VuaW5zdGFsbChk
ZXYpOw0KPj4gICAgICAgIHBtX3J1bnRpbWVfcHV0X3N5bmMoZGV2LT5kZXYpOw0KPj4NCj4+ICAg
ICAgICBkZXYtPmRldl9wcml2YXRlID0gTlVMTDsNCj4+IEBAIC02ODUsNDAgKzczNCwxMCBAQCBz
dGF0aWMgdm9pZCBhdG1lbF9obGNkY19kY191bmxvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRldikN
Cj4+ICAgICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUoZGMtPmhsY2RjLT5wZXJpcGhfY2xrKTsN
Cj4+ICAgfQ0KPj4NCj4+IC1zdGF0aWMgaW50IGF0bWVsX2hsY2RjX2RjX2lycV9wb3N0aW5zdGFs
bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPj4gLXsNCj4+IC0gICAgIHN0cnVjdCBhdG1lbF9o
bGNkY19kYyAqZGMgPSBkZXYtPmRldl9wcml2YXRlOw0KPj4gLSAgICAgdW5zaWduZWQgaW50IGNm
ZyA9IDA7DQo+PiAtICAgICBpbnQgaTsNCj4+IC0NCj4+IC0gICAgIC8qIEVuYWJsZSBpbnRlcnJ1
cHRzIG9uIGFjdGl2YXRlZCBsYXllcnMgKi8NCj4+IC0gICAgIGZvciAoaSA9IDA7IGkgPCBBVE1F
TF9ITENEQ19NQVhfTEFZRVJTOyBpKyspIHsNCj4+IC0gICAgICAgICAgICAgaWYgKGRjLT5sYXll
cnNbaV0pDQo+PiAtICAgICAgICAgICAgICAgICAgICAgY2ZnIHw9IEFUTUVMX0hMQ0RDX0xBWUVS
X1NUQVRVUyhpKTsNCj4+IC0gICAgIH0NCj4+IC0NCj4+IC0gICAgIHJlZ21hcF93cml0ZShkYy0+
aGxjZGMtPnJlZ21hcCwgQVRNRUxfSExDRENfSUVSLCBjZmcpOw0KPj4gLQ0KPj4gLSAgICAgcmV0
dXJuIDA7DQo+PiAtfQ0KPj4gLQ0KPj4gLXN0YXRpYyB2b2lkIGF0bWVsX2hsY2RjX2RjX2lycV91
bmluc3RhbGwoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4+IC17DQo+PiAtICAgICBzdHJ1Y3Qg
YXRtZWxfaGxjZGNfZGMgKmRjID0gZGV2LT5kZXZfcHJpdmF0ZTsNCj4+IC0gICAgIHVuc2lnbmVk
IGludCBpc3I7DQo+PiAtDQo+PiAtICAgICByZWdtYXBfd3JpdGUoZGMtPmhsY2RjLT5yZWdtYXAs
IEFUTUVMX0hMQ0RDX0lEUiwgMHhmZmZmZmZmZik7DQo+PiAtICAgICByZWdtYXBfcmVhZChkYy0+
aGxjZGMtPnJlZ21hcCwgQVRNRUxfSExDRENfSVNSLCAmaXNyKTsNCj4+IC19DQo+PiAtDQo+PiAg
IERFRklORV9EUk1fR0VNX0NNQV9GT1BTKGZvcHMpOw0KPj4NCj4+ICAgc3RhdGljIGNvbnN0IHN0
cnVjdCBkcm1fZHJpdmVyIGF0bWVsX2hsY2RjX2RjX2RyaXZlciA9IHsNCj4+ICAgICAgICAuZHJp
dmVyX2ZlYXR1cmVzID0gRFJJVkVSX0dFTSB8IERSSVZFUl9NT0RFU0VUIHwgRFJJVkVSX0FUT01J
QywNCj4+IC0gICAgIC5pcnFfaGFuZGxlciA9IGF0bWVsX2hsY2RjX2RjX2lycV9oYW5kbGVyLA0K
Pj4gLSAgICAgLmlycV9wcmVpbnN0YWxsID0gYXRtZWxfaGxjZGNfZGNfaXJxX3VuaW5zdGFsbCwN
Cj4+IC0gICAgIC5pcnFfcG9zdGluc3RhbGwgPSBhdG1lbF9obGNkY19kY19pcnFfcG9zdGluc3Rh
bGwsDQo+PiAtICAgICAuaXJxX3VuaW5zdGFsbCA9IGF0bWVsX2hsY2RjX2RjX2lycV91bmluc3Rh
bGwsDQo+PiAgICAgICAgRFJNX0dFTV9DTUFfRFJJVkVSX09QUywNCj4+ICAgICAgICAuZm9wcyA9
ICZmb3BzLA0KPj4gICAgICAgIC5uYW1lID0gImF0bWVsLWhsY2RjIiwNCj4+IC0tDQo+PiAyLjMy
LjANCg0K
