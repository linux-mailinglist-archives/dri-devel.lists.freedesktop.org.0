Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 172663D957C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 20:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9766E06B;
	Wed, 28 Jul 2021 18:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D616E06B;
 Wed, 28 Jul 2021 18:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627498004; x=1659034004;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=pmJF+/uHpVqA4oMdO1PJ+zIv8c6YPf9wnMmlNTS1Cws=;
 b=TlROldWzWjwH6ewe4C12wnJt6t6rh5SHfM6exx+LpO0OMa5IX5aHrt/H
 zZ6rjksoT4y8+7dknGgQP/lMUjWgeXrXQ/X5Wr5ccZUvY5kvwgcO9yjVR
 lNCyyU/Ul+VsE4LHv6M0PG5PaJfsl46ai2Rfk75Lg1ho7knjHBFemoK0M
 cXxaCxMlxmMWKvgqvyBRfPgHIKPNyV/Y21td+8EHLaEEn2yG4U/1dLR2y
 sNqcADXpNxlKErCsO5QzFouffb1Ilkkcb7KCBz8BcFF2ZwTeIJScSvCvO
 g0i5cxlkQk9qwwdqPDyc+rJ6xS/s/Mp0aniovUWGYIdYmPfYMB9viCiYW A==;
IronPort-SDR: JdJg7u6I3L4rfOpltO2UcDZtZRo8F1BRMS+tWQNxJ4Kfz15REHpCkO5QzpNvFwEgWySRph6Euk
 z4PUMvobGR9/9Mtn6zMe+SrEiCT8wLJ4QgUEaqSUjMGg8SJnAMNQYP3nWehPwQ0CrleSgn6fNw
 jCABStcvKhfsuTNAR/+cY3wMfpNswi/wuWblzVOKxix9skaZ9HP54SwEgOcHXy2eS1SL1wMpyE
 +jaZxFdeGwyE4kOXswjRytCbpiwqLOQXWZwQfCq+oemReOs+W3kImevcSVm2c6u9wZqT7s5Kka
 spGeQa7B8V774noQLQOnaRKh
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="130726175"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jul 2021 11:46:42 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 11:46:41 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Wed, 28 Jul 2021 11:46:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnmJY2MD04Ed9RTIt+cWgkl1CLKLeW6IGCQdE9jy1OixRwJsncclu65YQvUsMxJ0l3RN/xhnNaBLPOltr1XZfmDtth6e9u7ZXrjrecC+0vlWS0TA5gQBY6iW38jdNP+m+foBLAcai748/xm/PSgol5pRevafLzM1TNx057plNGUY9qd250BK9JtXsNVsmVx/+ZNzHL9/Cp2kJHuyoRrQ2NroxvdA1DtDAyDUKg2Fpwn4CLkWEIhNFuUQGDmLpuW5abM0hoTdccclHyvkJFARv+XlBpdLL5JU6VJeIzgc4CmMkwpZ8docDcoYtDYd3UYUkR3QRYo35lcaBd8kja8gjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmJF+/uHpVqA4oMdO1PJ+zIv8c6YPf9wnMmlNTS1Cws=;
 b=GfW0aTyMN2/KUFZPueYv9GxS8k6jmyWj0/GOX/hC/qbd8iGk8u4GrpyocI5gOQZ37HxVwtI0VWamuXoaB+0/JzD0tiz58WPPeHvpG0tj+EhAZpZNVkDr2XsFQpcDm/SfA2T2mNE/s1jADtioNEtt1t4QTt5e5QSZ8wgv8aKyH92X+tWmtRWIE9UBl7hWolnERT84ZiEfx2NZNA6Kocgswy3bFevt9Jsz9A7QRI6LqsxbHWtdiQgGtmM73UkHbbueCRydCIgIvfrjniAB21mEYjKsHErsms6ElAJ8UmpgsmNEP3mIwg42+bT7r0rT+hLAcf8jd1RTd+vDjF3FMuKfRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmJF+/uHpVqA4oMdO1PJ+zIv8c6YPf9wnMmlNTS1Cws=;
 b=vfGgXiSld3kKBJzpdhlvB3jR4YO0DG7jK4ojIcdhGuBOYmE/dReY4T2qbhJBiOjkyip2qATKySaXfUHG+78HLFDpCSemHZHqCP8evqDgsmsynFrfAozK6Ug7nihs8ZzFhZ6GIkEqdCBncLQQF8jDb/tcmAQ/2144Lfq0iZkCcg4=
Received: from BY5PR11MB4007.namprd11.prod.outlook.com (2603:10b6:a03:189::28)
 by SJ0PR11MB5167.namprd11.prod.outlook.com (2603:10b6:a03:2d9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 18:46:39 +0000
Received: from BY5PR11MB4007.namprd11.prod.outlook.com
 ([fe80::e478:6b2c:f71e:65bf]) by BY5PR11MB4007.namprd11.prod.outlook.com
 ([fe80::e478:6b2c:f71e:65bf%5]) with mapi id 15.20.4373.018; Wed, 28 Jul 2021
 18:46:39 +0000
From: <Dan.Sneddon@microchip.com>
To: <tzimmermann@suse.de>, <sam@ravnborg.org>, <Dan.Sneddon@microchip.com>
Subject: Re: Re: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
Thread-Topic: Re: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ
 interfaces
Thread-Index: AQHXg7j3kajdLBgx2U2WcmMzDSjJJqtYfiKAgAAJZACAACMogIAABcwAgAAByICAAAgXAA==
Date: Wed, 28 Jul 2021 18:46:39 +0000
Message-ID: <793514f6-0270-771b-fe36-f82edf4e5fd2@microchip.com>
References: <20210727182721.17981-1-tzimmermann@suse.de>
 <20210727182721.17981-4-tzimmermann@suse.de> <YQFi96yaYbTG4OO7@ravnborg.org>
 <e28b1a2f-015c-c81b-eb64-5323df9ed35d@microchip.com>
 <YQF7bKyeup8n3awU@ravnborg.org>
 <3d2f6b84-dd07-d925-a8b8-2bfd5fc736d9@microchip.com>
 <YQGdxtV0BGZ8VOpm@ravnborg.org>
 <2f04b986-6b41-62f9-1587-23818b841655@suse.de>
In-Reply-To: <2f04b986-6b41-62f9-1587-23818b841655@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 807082c7-e26c-479e-f93a-08d951f808ff
x-ms-traffictypediagnostic: SJ0PR11MB5167:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB5167E88218124F8BCEE47315E1EA9@SJ0PR11MB5167.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7pQ5Xi8N/VxoilYjcyoxq1zQm2E6QuLjulrbxNJqAh4mQhSZzxg+Z1uVeBFHFPt4ZVS0SwE8g7T6lcaPT8C3fvY6JRJOxhoyxIcwsICcqLy4lvrNenTfigkGbEVh7Ym3FGZJmI+ZY6lskpeJk7VAjhVEIlUA02XS/MumeCTY3x9WPkJUY7K9SeYXh+kZpRsX6jHFvZRB8Zgfx0U6Z/k35g1u/kMksJypnqEU9xOJA7jRfVI3MF3BEzsuMoBwFwcN3dknWxUPcyxEDZktyhrYzukPLZiW9bc9bRRplSCHxWQsqYMmXKzQr2ocbmRZi0i1xstL+RP6Aohu51DnzqoZa28jygrfVj6rXz62KokMfuS2j4wkTVGqwEcaD3qZ3s6XI7sNqtEn9RE2SUgjiFVAmLKF2aL9FC2qg90lWQEgTqo+I4twvfOeuCpm2CjXUMiuOs/q02THQNLP+PSf2rU0DtO5HUAIvA3+DinCfgy9BT8o0E8ErTkpNfFAm29xfIWHuNtGL+4OEp28AYODsdCTU7eJooIbTZNfRDiP2aGFw0/E0rb4D/6p5EaPMnbaBSNONR7kwq6qZLXg8bhYwWDXsQ3930T3G7NvrwEqPcp4GZh4wMEGEbDdiR+waSzF86MO1GhOT1UDYSrj3icRo9YpvnovPAUV2f7ixiVk+bcIFySQLRVCArTVr3xB+DETI4xdkpPoJd3GKPp910FqjbV+8dJnIgpndWupxlmUUyEtWlMd5X415qi6Cpuu9N6IemOfMLz5+gVJnKybbgPofU3UBB9hBkWk8u1ojZkWdZacIgsWGkOSi4a9TP4yAZIW0oqE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4007.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(346002)(136003)(366004)(31696002)(6512007)(2906002)(2616005)(86362001)(966005)(478600001)(6486002)(36756003)(53546011)(6506007)(26005)(83380400001)(186003)(71200400001)(110136005)(54906003)(66476007)(122000001)(316002)(38100700002)(7416002)(8936002)(8676002)(66556008)(64756008)(66446008)(76116006)(4326008)(91956017)(66946007)(31686004)(5660300002)(38070700005)(45980500001)(43740500002)(10090945008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHB2V2pvVnNIazV2clFLRUpoRGp2NWc0UGNjZVF0RzN1enE1VEJ4YkNTL0E5?=
 =?utf-8?B?TWNISjNIRm5VUE9xdk1nU0NKemdaUzFyZy9JNXJ6L1hyU2ZKVVRnb3RNeVBM?=
 =?utf-8?B?VTJFRDVSeWE5RTRnQmNudENacVViNTVSNTlWeTlMaTdwcTNUVkxNRGhOaFBW?=
 =?utf-8?B?UTNiYlJ0d3J2eG5DZmRia05TcFVJYjVRWGFvZURyaklLK2xkT0czV2MySTJI?=
 =?utf-8?B?VlZaZVE4cWJLM2pzTEY1MnFIZDdHVDBiajBickxheGJGQzRxUTR6c3VtZmdO?=
 =?utf-8?B?ajRlLzVnWFhvdVZzWEJYL1BMZEx6RWh2U1pwQ3JRV01QM0pxU09lWHEwaHlr?=
 =?utf-8?B?dkUyMzBDeDl0dUxrRk5idlBRa2VDd0U4azlVaHpOaWxFTmhyOVZMOWgyRERw?=
 =?utf-8?B?TUFBd1ZReTJpYmxJc0g3Skc1dG9NdEhvY041MTV5cGgrK1JnYTBjQUs0UGww?=
 =?utf-8?B?ckFHejFVaTFyQS9DYXQwMk9UTXRKRmFXSC93a0VRaHo3eUNNbkVJQUx5bkYx?=
 =?utf-8?B?REpSaG5HOTlNNlRPdnVXd0JhUk15TEdSbzNETG5Zbng0ZHhKR1VZVHJHRzIz?=
 =?utf-8?B?NmoxOGlvZzNQdG1ld2dKUERSUmJ4UFBUSHZGMTBQa2JTZDFqZGs4WUM2dWM5?=
 =?utf-8?B?OStvUnFIb3RwQlduNFpYcnBlKzdhaXBVWnU0MWVoZElNSHpZUktyWlVhU0hV?=
 =?utf-8?B?cjNobjgyY0tHRFJFYmx4cUNwOHNkNjJKTEY0emcyWlJpUGM4dm80aXZybTdh?=
 =?utf-8?B?MVBjbmV0STVLTTJwMTQ4bDlid1RPY3J0MlRGb0hiQzd6VWtaczBTL2Y5a21E?=
 =?utf-8?B?Z09NeE5xM3ZSSTBIMmk0SWJIZzM3Nmg3WTVpWXppcDRPSHV4Mkh5a0R1Rmxq?=
 =?utf-8?B?MEErNDZjNW1iSWVsSVZJdnpmVFdocXIvNHpCaEtHSGxYQWdCei9kZ1pMYjdV?=
 =?utf-8?B?MG1GZWY2WUNVV2E0NXZSWUNEcnNtTDJoT1E4S0FmRUpXV01ncmpMR1ZkMVBH?=
 =?utf-8?B?dnpQcU5RYnZOQ2NZV3RjalNsRW5sVlUyRit4Zmt0TTJ3YkFrYjB3RWJZOUsr?=
 =?utf-8?B?YjB2dENoLzNuOWJjQnN2blpZazJ3R1Z0UU1ybngremVKMlBHYVcrbE94NTJT?=
 =?utf-8?B?SVlGTVdxZjNXd0YwbUd2RDUzZjUzajJhNWZVZjVGazVlZFRQTFBZTmFKMnhF?=
 =?utf-8?B?RHNFbkxHNlM3TzdmaVI5dFVUR3F2QzVsR285eTg2K2pnNDFMcm9UWTZXbFhM?=
 =?utf-8?B?TGtmQjhNd0VhOVRDd1pVOXp5a0RKUGQyQ0dQK3JLUlQ1dkJNeDBOc2lsVWph?=
 =?utf-8?B?R2JvL09ITXVOY0Zmb21uYkxaYmxRU0NLaDgrY0dGWjh3NTlmczlNWE9CNTcr?=
 =?utf-8?B?Y090K04yYnFJL3hWamZ4cFlmejhpOTRZWE0wcFVEM0dPT3FGeTY2VXRkamtB?=
 =?utf-8?B?aVRHdWd3MjJISzN4YzJoZG5YUWFXOFpnOXljUk1HOENLdGhDT0h6aHZ4U3c2?=
 =?utf-8?B?VndYYm4zZU93TFc0T01YVFFNL1ErSDVLWjNYUGJXQlY3dEVRUTViOStqV0kr?=
 =?utf-8?B?Y2V0ZXlEZitET1JybmhrbWNBMitGcHFBQks4MEF6bU8vd2xnRGxFaXZtWUZX?=
 =?utf-8?B?ZkhSUjduL1lnVnRGSlFaYVh4Zk9paUtoWk0vMTdEcElpanlPcnc2M2ptdjNT?=
 =?utf-8?B?RGVHbmkyNzRwcE5kaGNrWk1MZTFHdEVTL3FyY09SdGpUTkxjOW45OXMwZXhW?=
 =?utf-8?Q?YD39IvkLfmPSHH51uZiRxR0KJcP0XTL7VkUR/Om?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE37A93B1AE28041823BF11DB1C91138@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4007.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 807082c7-e26c-479e-f93a-08d951f808ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 18:46:39.3538 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6BBVnwvkViUCz+KQI4QkP+FbQY2pHdfR19bJlP3Lqi0ePLYbRdOHaPRh7uG9AX18d0GmzBM2FxZN7KusNWbS5LGxXtMdHWVVYm93oau9ysw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5167
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

SGkgVGhvbWFzLA0KDQpPbiA3LzI4LzIxIDExOjE3IEFNLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4gSGkNCj4gDQo+IEFtIDI4LjA3LjIxIHVtIDIwOjExIHNjaHJpZWIgU2FtIFJhdm5ib3Jn
Og0KPj4gSGkgRGFuLA0KPj4NCj4+IHRoYW5rcyBmb3IgdGhlIHF1aWNrIGZlZWRiYWNrIQ0KPj4N
Cj4+IE9uIFdlZCwgSnVsIDI4LCAyMDIxIGF0IDA1OjUwOjM0UE0gKzAwMDAsIERhbi5TbmVkZG9u
QG1pY3JvY2hpcC5jb20gDQo+PiB3cm90ZToNCj4+PiBPbiA3LzI4LzIxIDg6NDQgQU0sIFNhbSBS
YXZuYm9yZyB3cm90ZToNCj4+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBv
ciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgDQo+Pj4+IGtub3cgdGhlIGNvbnRlbnQgaXMg
c2FmZQ0KPj4+Pg0KPj4+PiBIaSBEYW4sDQo+Pj4+DQo+Pj4+IE9uIFdlZCwgSnVsIDI4LCAyMDIx
IGF0IDAzOjExOjA4UE0gKzAwMDAsIERhbi5TbmVkZG9uQG1pY3JvY2hpcC5jb20gDQo+Pj4+IHdy
b3RlOg0KPj4+Pj4gT24gNy8yOC8yMSA3OjAwIEFNLCBTYW0gUmF2bmJvcmcgd3JvdGU6DQo+Pj4+
Pj4gW1lvdSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBzYW1AcmF2bmJvcmcub3JnLiBMZWFy
biB3aHkgdGhpcyANCj4+Pj4+PiBpcyBpbXBvcnRhbnQgYXQgaHR0cDovL2FrYS5tcy9MZWFybkFi
b3V0U2VuZGVySWRlbnRpZmljYXRpb24uXQ0KPj4+Pj4+DQo+Pj4+Pj4gRVhURVJOQUwgRU1BSUw6
IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgDQo+Pj4+
Pj4ga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+Pj4+Pj4NCj4+Pj4+PiBIaSBEYW4sDQo+Pj4+
Pj4NCj4+Pj4+PiBJIGhvcGUgeW91IGNhbiBmaW5lIHRvIHRlc3QgdGhpcyBwYXRjaCBmcm9tIFRo
b21hcy4NCj4+Pj4+PiBJZiB0aGlzIHdvcmtzIHRoZW4gd2UgY2FuIGZvcmdldCBhYm91dCBteSBh
dHRlbXB0IHRvIGRvIHRoZSBzYW1lLg0KPj4+Pj4NCj4+Pj4+IEknbGwgdGVzdCB0aGlzIGFzIHNv
b24gYXMgSSBjYW4gYW5kIGxldCB5b3Uga25vdy4NCj4+Pj4NCj4+Pj4gVGhhbmtzLCBjcm9zc2lu
ZyBteSBmaW5nZXJzLi4uICh3aGljaCBleHBsYWlucyB0aGUgZnVubnkgc3BlbGxpbmcgZnJvbQ0K
Pj4+PiB0aW1lIHRvIHRpbWUpDQo+Pj4+DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBTYW0NCj4+
Pj4gU28gSSByYW4gdGhlIHRlc3Qgb24gYW4gQTVEMjcgWFVMVCBib2FyZCB3aXRoIGEgUERBNSBk
aXNwbGF5LsKgIE91cg0KPj4+IGdyYXBoaWNzIGRlbW9zIHRoYXQgY29tZSB3aXRoIG91ciBsaW51
eDRzYW0gcmVsZWFzZXMgc2VlbSB0byBydW4ganVzdA0KPj4+IGZpbmUuwqAgbW9kZXRlc3QgLXYg
c2VlbXMgdG8gcnVuIGp1c3QgZmluZS7CoCBIb3dldmVyLCB2Ymx0ZXN0IHJldHVybnMNCj4+PiAi
ZHJtV2FpdFZCbGFuayAocmVsYXRpdmUpIGZhaWxlZCByZXQ6IC0xIi7CoCBJIGRvbid0IHVuZGVy
c3RhbmQgd2h5DQo+Pj4gbW9kZXRlc3QgLXYgaXMgd29ya2luZyBhbmQgdmJsdGVzdCBpc24ndCwg
YnV0IHRoYXQncyB3aGF0IEknbSBzZWVpbmcuDQo+IA0KPiBUaGFua3MgZm9yIHRlc3RpbmcuDQo+
IA0KPj4NCj4+IFN0cmFuZ2UgaW5kZWVkLg0KPj4NCj4+DQo+PiBKdXN0IHRvIGJlIHN1cmUuLi4N
Cj4+IENhbiB5b3UgY29uZmlybSB0aGF0IHZibHRlc3QgaXMgd29ya2luZyBPSyAqYmVmb3JlKiB0
aGlzIHBhdGNoPw0KPiANCj4gWWVzLCBjYW4geW91IHBsZWFzZSB2ZXJpZnkgdGhhdCBpdCByZWdy
ZXNzZWQuIElmIHNvLCB0aGlzIHdvdWxkIG1lYW4gDQo+IHRoYXQgdGhlIGRyaXZlciBtaXNzZXMg
dmJsYW5rIGludGVycnVwdHMgd2l0aCB0aGUgcGF0Y2ggYXBwbGllZC4NCg0KWWVzLCB1bmZvcnR1
bmF0ZWx5IHRoZSB2Ymx0ZXN0IHdvcmtzIGJlZm9yZSB0aGlzIHBhdGNoLCBidXQgZmFpbHMgYWZ0
ZXIgDQp0aGlzIHBhdGNoIGlzIGFwcGxpZWQuDQoNCkJlc3QgUmVnYXJkcywNCkRhbg0KDQo+IA0K
PiBCZXN0IHJlZ2FyZHMNCj4gVGhvbWFzDQo+IA0KPj4NCj4+IMKgwqDCoMKgU2FtDQo+Pg0KPiAN
Cg0K
