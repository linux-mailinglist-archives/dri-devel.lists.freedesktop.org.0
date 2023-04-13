Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 622A16E1615
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 22:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7390010E060;
	Thu, 13 Apr 2023 20:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B7E10E060;
 Thu, 13 Apr 2023 20:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681418962; x=1712954962;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZbAlNSsYnj0cdYN49a7sm+0UcbGefbh1a7y6661GqAE=;
 b=fY8n99RsbZ8LPncL/D4TEYynntldNdOBoKNnckqfPhNiMK/ReGq8h9BJ
 /woyiRZgjxKvWGXeC5gNBORiFBUyu9ZCK8WY+hzz/47ruGH2MmQHZ41Af
 WCX4OtjymEAqvQAPvX27XDabCVeVS1ptorwDdZl8Ko3c2sd3MXljAwvGL
 1Drug03zYWZFDCBfE76JNfmZMvIePIoGjeGrKrQ4ZbTP3s8DC6+xyquIT
 RLJ/Fj617VXjORPHzD6jmPAVmOtEdpYSbvIqBd3SjVBbqiWwB2OuglrMx
 ntRKTrOxHmRExqvv6HJkQKsR7zWOLFrr8E/xp3sSFLXTjoASeICk2pd96 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="372156495"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="372156495"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 13:49:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="1019310850"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="1019310850"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 13 Apr 2023 13:49:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 13:49:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 13:49:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 13 Apr 2023 13:49:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 13 Apr 2023 13:49:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLPwCZX9g9acfU+g4MtZBVCub9a1SEL5b1hi2pzUCVXbq4e9WOtcEVtTcBAB3D9l0mctzAk3PaM95QlM+OIPdy6cyLy00nKsIT+OeVr1P3RQ5dRbuXNoqbFmU+3OlivUajS2sUR1mGX7QIV7ve8XY6IEttjbJhmu2o0pD4k+WHlv26OpGsAh0wRPRYtjG9yf80MTujLDo+DrKb9tTOUIeWjZf1lFyEzXzmNtlAsU1UZ+WRDswXDxe9PmPUDLEBQlZHORYrCiM8CLIYnHQrYeKAvXtP/e6soCpbeNUjcWiD79pZSeIRvXUfjoIw72bsZLz7+07TB0tvahpgZr7i9Qsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbAlNSsYnj0cdYN49a7sm+0UcbGefbh1a7y6661GqAE=;
 b=DCSzA2p8wXZePTrB1uEDruKhls4VOzMlMzCRAeE7GkFyWAMUeOxHc11bAw5zyYuUUFKFS3uRevvTWGUqNx29WW9CYBAIbdS6HJwnoeALO7rk85zdRKXIpDj2aiUsna7XSmQ/dYasyAgJJW/DYK5bW4LhtERkD9+9mi/D+r5QG6iee255HfyddtkV7wI9qR05leXtbJ03cjwep5bcuJHmeDxezTpkPdZyRFID0GvkAgf7T7XsRnRMGFQ3QfWZBanZub82mTLGO82KJmhqaWtA4YM9McFoZBurKvKRTXUVbxAebjGPMgwOhIxwzUiOwnmYOoNk9NjsqAbNmeuAZLiIjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2574.namprd11.prod.outlook.com (2603:10b6:805:59::14)
 by PH0PR11MB7613.namprd11.prod.outlook.com (2603:10b6:510:285::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 20:49:18 +0000
Received: from SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::cb23:5215:112f:30c3]) by SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::cb23:5215:112f:30c3%5]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 20:49:18 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Justen, Jordan L" <jordan.l.justen@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, Chris Wilson <chris.p.wilson@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 7/7] drm/i915: Allow user to set cache at BO
 creation
Thread-Topic: [Intel-gfx] [PATCH 7/7] drm/i915: Allow user to set cache at BO
 creation
Thread-Index: AQHZZGRiuuNpc8BVKEecHbCKjiVefa8axZGAgACOQHCAAQiPAIAA1LaAgAcRuoCABYOfAA==
Date: Thu, 13 Apr 2023 20:49:18 +0000
Message-ID: <SN6PR11MB2574C4D76673F8F6B4C511F69A989@SN6PR11MB2574.namprd11.prod.outlook.com>
References: <20230401063830.438127-1-fei.yang@intel.com>
 <20230401063830.438127-8-fei.yang@intel.com>
 <7aa541f8-55e3-a182-5390-6ca161edb70b@intel.com>
 <BYAPR11MB256790AC5BDC891F186E000E9A939@BYAPR11MB2567.namprd11.prod.outlook.com>
 <7fd9424a-678a-0d90-715c-f63179552093@intel.com>
 <168072640394.392286.10003850953246720395@jljusten-skl>
 <168111503901.392286.9448911281846869775@jljusten-skl>
In-Reply-To: <168111503901.392286.9448911281846869775@jljusten-skl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2574:EE_|PH0PR11MB7613:EE_
x-ms-office365-filtering-correlation-id: 00348aa7-a039-4b87-f9ff-08db3c608d3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5QhYTgfZQxbxarrkJvztgdHRRKMzQlqja9GMfiMQKQCHBHpAnL3+ZG5aubtfHWNcimv1phmi2Aa2KUjLybcystHD3nC7hPCjZuqc5ZN8Ut7V5l3V/1HKms2tbu4PYPpMTNX3kwg8SmUWfF8o9kLdjbUBHO0FinLJVF29ZXJKnSzrCBGnVqBRQFrsZX7bsaKCKRfUfBjAPauxKHg9++Nxvd61JylAAxcmN84lfvWYlDaUE2PrYQFvE4G8P6oS20/38kpd3JvApFBkZyn2ZKzOhRbHPrb93wuAxMKsP38zC2e5Ou4WRMoBUTJ5MgASfRFmxHhIYka0SOhwsYiwysEEpAaQBtFkm63cbcsDbUpYwSz4BkGOudCp/i8culEgEU+6rL9DAPDta7YX0+yvGr8FAwQlNYahzT3I0fJj7zmMeU4NocrP+iWmPZrDBwV5vIa7TWjXAw9yo6Vf1ZkC352uouwmEWYOY8032l5OXEaiXIiPh3MYSNiDeuH5Tz8HOIb0VtinxLZ+Lva2en0FZ+IHpOEwEtb7Ov3MYLScZoqWtWFk77LiymIx/RPrbmdYyRqgtjzjpTgfhcDoZGk6Jhjnm0UN5w5Dl8zu365+cPsPCNQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2574.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199021)(71200400001)(7696005)(966005)(66476007)(66556008)(66946007)(66446008)(64756008)(76116006)(4326008)(110136005)(2906002)(38070700005)(86362001)(122000001)(52536014)(82960400001)(41300700001)(5660300002)(33656002)(8676002)(8936002)(38100700002)(316002)(478600001)(55016003)(54906003)(53546011)(9686003)(6506007)(26005)(84970400001)(186003)(66899021)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3A3cWRtZU9FUFFLZFB2TGpUSVE2RVJDQWF3K1BodnI5MXFJREpCRDh6anY3?=
 =?utf-8?B?akZSOS9iOFhnTjlCYWFVZU9yU043NXRmaFRmckRNUkJGeE95Mm1FYjVHYitJ?=
 =?utf-8?B?OWFKQmNNa0QyUW1NbWR3TUd0QzNuMGZnQjNDYzRSblRvc3pUYVQrQWs0NlA2?=
 =?utf-8?B?N1FoYi9uZEFJKzU5OUVtY25QVE00enpacDFUdm00L2xBOTNYZW9sZGdXNkM1?=
 =?utf-8?B?cTdlckFXWStTQjY2VDF4K1NGUUtNeVFvSEFkNWszaisyK2h6UUJEL3pwWlR6?=
 =?utf-8?B?TGxyVnJtckJ4SVpWT1ppeE5SNStNQkROQnR3bmpSS3dHTEhUKzJCMjFvbDZJ?=
 =?utf-8?B?WGNPYTk5aE5PMlZBY2lteVR4MjJ4UGxWZEszV2RjVExTZmFQU3J4dm9iM2NE?=
 =?utf-8?B?MHY1LzVURjI1RzBESkYwMXNuWFNuVldoSHFzVmVyN0xROUpIMUdWcS9ocExP?=
 =?utf-8?B?cmh6MGxseVNYeG8raTJnbGRRZmNqSDFGZC9sZzh3aGt6T1FPZ3ltMHI2REkz?=
 =?utf-8?B?RDdFUDAxNklZWFR0am41ZGFZQm5vMzJuRjg2UzJVQmJCUFlDQmhMMDYyQkM2?=
 =?utf-8?B?QWpwaldOekNZeFZRbTBvdXdiMlMwTGZvMW5zc2Z5dnltY3ZjUXBsL2RUY0JJ?=
 =?utf-8?B?QWRiYk5uZEdVc2J1aWtiV1d0TVh0OHp4NFU5eHUzdGkvaXpNSmtpUWV2aDda?=
 =?utf-8?B?Z1RISE5TRXUyWFhlcW1oQWdyM1c5U3d6RDRqdW5RNmRFWVVFemxqK1VkYk1M?=
 =?utf-8?B?Y3NoeVI0TVl3NGhWVEJ3citHQnh2Y1FMQkxPdnNaV3N5cmlZUGNsUzYyVWFI?=
 =?utf-8?B?V0puMTNIUUJkUE4wV3ZoU2RwQ0V0ZkJGa2ZRNHhxVEVYOXpieS9wRHZURFdU?=
 =?utf-8?B?K3NNWHpKNXZZSGYxVXVqMWRCTzl5cWVRNEJYb0RXWXMvMUNvdHZGT2lqSVJ2?=
 =?utf-8?B?K2NqTlpMb3ZDY3N4ZFdPSDBURFJVc1ZEaWlHdDE3aTQ0Mmh6R0NhK0d1TEFD?=
 =?utf-8?B?aGtEQTdEZXM4RVNseEsyTlZRa2M0dElmdktzN1BIODZuVTQxMkhhY0I0V0Uw?=
 =?utf-8?B?ZU9HOGZpa0tZWkprUEdEOVM5Q0lya1gzOVBGMkFMcVc5d2hMRUpVQUdLQldk?=
 =?utf-8?B?REQvSzlvVFFmZ2I1QlhwRGlHck1zTWFZc3U0Ti91SXl2Zi9vZW82c1R4TnE5?=
 =?utf-8?B?TCtKYmZ4czY5NlVTN2pUdllnb0FOQWFtaTk0UnI4UG44dkpmT09aemVWK3A0?=
 =?utf-8?B?MjcvMlRZK2U5WXhWNFY5cnBad3dCYktnaHpZTXIySFVvaHh3WkUwaEVibUl4?=
 =?utf-8?B?U1R3SEFuUFN4TlNOd2ZKcnNHL09yZjFFMU5seGFvUytyVGJjYWxUWEcrNjJi?=
 =?utf-8?B?T1poZy9TU3gySllPN3VjSExtcVpxenhaaGx3QlZkQkdyRlhsQjdZaHJ0NzVm?=
 =?utf-8?B?a3Y1aUhqempCOE93bHNTNVZvNm45cUFPUTgvMVErM1NkNFpyQmpiUlV0VDcy?=
 =?utf-8?B?WVBlbGlmNml5MjRUWGdRM0tpRkp1QXVkc0VkSzlRbUU1NUxxZmdkbGg2eitk?=
 =?utf-8?B?SXhYdTZ4RUJGSkNLUm16d2dhYktDUkZlSmh2aWFmVDJmbjZ5U2k4WmhZNUZB?=
 =?utf-8?B?a285bi9FaDExZElrTjdjbG1xY0JWdlNJcUVrMnlDZSszVlVTR0g2dVpwTCtv?=
 =?utf-8?B?ZWtMMGtGR2pXS0FBYUdEeVB0b3piOUZtNmNHVGhiak9ZK3JGMW10bWg5cHFm?=
 =?utf-8?B?b3RlWkg1V2JpdERrN1lFQVAvK2kwUy90VWswUHRCZFNRcytvcVdqSm50Qy9Z?=
 =?utf-8?B?VjZpQ29MNDhIYzRyZ09Ld1M4T2VBaTQ1YStXWXEyRGRBUHZWVW9TcUNyZmpu?=
 =?utf-8?B?TllyK3A4dEhlT0tvVEJ2S1J4T1RZYjYycXZkak5BV3dVYU16TmVETUtETWhy?=
 =?utf-8?B?VkFWOC9OTm1iNFFGRVVYaVZPL003SEVPc3lYMjFQcU5aVXdZaUZNb0tmVm1E?=
 =?utf-8?B?SHpLcmZqZ2hNbm1YLzVIOHkyNXhZbW1vclhldHU1emlOdXdLbGFkWUVadG5z?=
 =?utf-8?B?ZkpaL2Faci80YzhvaTZMVFJHbUMyM3ZJdXowOVpwU3k1UHp6SXlIRDlSUENW?=
 =?utf-8?Q?Jwhw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2574.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00348aa7-a039-4b87-f9ff-08db3c608d3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2023 20:49:18.6787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uYWPgBrY9ktr9RvsRW1DV7etQsc7h8cBZgWuNOhezj2DYcJG/pfgdCjCS/ZEzF4YyIdGhRMn764GUWtUhyya1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7613
X-OriginatorOrg: intel.com
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
Cc: Kenneth Graunke <kenneth@whitecape.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBTdWJqZWN0OiBSZTogW0ludGVsLWdmeF0gW1BBVENIIDcvN10gZHJtL2k5MTU6IEFsbG93IHVz
ZXIgdG8gc2V0IGNhY2hlIGF0IEJPIGNyZWF0aW9uDQo+DQo+IE9uIDIwMjMtMDQtMDUgMTM6MjY6
NDMsIEpvcmRhbiBKdXN0ZW4gd3JvdGU6DQo+PiBPbiAyMDIzLTA0LTA1IDAwOjQ1OjI0LCBMaW9u
ZWwgTGFuZHdlcmxpbiB3cm90ZToNCj4+PiBPbiAwNC8wNC8yMDIzIDE5OjA0LCBZYW5nLCBGZWkg
d3JvdGU6DQo+Pj4+PiBTdWJqZWN0OiBSZTogW0ludGVsLWdmeF0gW1BBVENIIDcvN10gZHJtL2k5
MTU6IEFsbG93IHVzZXIgdG8gc2V0IA0KPj4+Pj4gY2FjaGUgYXQgQk8gY3JlYXRpb24NCj4+Pj4+
DQo+Pj4+PiBKdXN0IGxpa2UgdGhlIHByb3RlY3RlZCBjb250ZW50IHVBUEksIHRoZXJlIGlzIG5v
IHdheSBmb3IgDQo+Pj4+PiB1c2Vyc3BhY2UgdG8gdGVsbCB0aGlzIGZlYXR1cmUgaXMgYXZhaWxh
YmxlIG90aGVyIHRoYW4gdHJ5aW5nIHVzaW5nIGl0Lg0KPj4+Pj4NCj4+Pj4+IEdpdmVuIHRoZSBp
c3N1ZXMgd2l0aCBwcm90ZWN0ZWQgY29udGVudCwgaXMgaXQgbm90IHRoaW5nIHdlIGNvdWxkIHdh
bnQgdG8gYWRkPw0KPj4+PiBTb3JyeSBJJ20gbm90IGF3YXJlIG9mIHRoZSBpc3N1ZXMgd2l0aCBw
cm90ZWN0ZWQgY29udGVudCwgY291bGQgeW91IGVsYWJvcmF0ZT8NCj4+Pj4gVGhlcmUgd2FzIGEg
bG9uZyBkaXNjdXNzaW9uIG9uIHRlYW1zIHVBUEkgY2hhbm5lbCwgY291bGQgeW91IA0KPj4+PiBj
b21tZW50IHRoZXJlIGlmIGFueSBjb25jZXJucz8NCj4+Pj4NCj4+PiANCj4+PiBXZSB3YW50ZWQg
dG8gaGF2ZSBhIGdldHBhcmFtIHRvIGRldGVjdCBwcm90ZWN0ZWQgc3VwcG9ydCBhbmQgd2VyZSAN
Cj4+PiB0b2xkIHRvIGRldGVjdCBpdCBieSB0cnlpbmcgdG8gY3JlYXRlIGEgY29udGV4dCB3aXRo
IGl0Lg0KPj4+IA0KPj4gDQo+PiBBbiBleHRlbnNpb25zIHN5c3RlbSB3aGVyZSB0aGUgZGV0ZWN0
aW9uIG1lY2hhbmlzbSBpcyAianVzdCB0cnkgaXQiLCANCj4+IGFuZCBhc3N1bWUgaXQncyBub3Qg
c3VwcG9ydGVkIGlmIGl0IGZhaWxzLiA/Pw0KPj4gDQo+DQo+IEkgZ3Vlc3Mgbm8gb25lIHdhbnRz
IHRvIGRpc2N1c3MgdGhlIGlzc3VlcyB3aXRoIHRoaXMgc28tY2FsbGVkIGRldGVjdGlvbg0KPiBt
ZWNoYW5pc20gZm9yIGk5MTUgZXh0ZW5zaW9ucy4gKEp1c3QgdHJ5IGl0IGFuZCBpZiBpdCBmYWls
cywgaXQgbXVzdCBub3QNCiBiZSBzdXBwb3J0ZWQuKQ0KPg0KPiBJIHdvbmRlciBob3cgbWFueSBp
b2N0bHMgd2Ugd2lsbCBiZSBtYWtpbmcgYSBjb3VwbGUgeWVhcnMgZG93biB0aGUgcm9hZA0KPiBq
dXN0IHRvIHNlZSB3aGF0IHRoZSBrZXJuZWwgc3VwcG9ydHMuDQo+DQo+IE1heWJlIHdlJ2xsIGdl
dCBtb3JlIGZ1biA4IHNlY29uZCB0aW1lb3V0cyB0byBkZWFsIHdpdGguIE1heWJlIHRoZXNlIHBy
b2JpbmcNCj4gaW9jdGxzIGZhaWxpbmcgb3Igc3VjY2VlZGluZyB3aWxsIGFsdGVyIHRoZSBrbWQn
cyBzdGF0ZSBpbiBzb21lIHVuZXhwZWN0ZWQgd2F5Lg0KDQpGb3IgdGhpcyBTRVRfUEFUIGV4dGVu
c2lvbiwgSSBjYW4gYXNzdXJlIHlvdSB0aGVyZSBpcyBubyA4IHNlY29uZCB3YWl0IDopDQpUaGlz
IGlzIGRlZmluaXRlbHkgYSBub24tYmxvY2tpbmcgY2FsbC4NCg0KPiBJdCdsbCBhbHNvIGJlIGZ1
biB0byBkZWJ1ZyBjYXNlcyB3aGVyZSB0aGUgZHJpdmVyIGlzIG5vdCBzdGFydGluZyB1cCB3aXRo
IHRoZQ0KPiBub2lzZSBvZiBhIGJ1bmNoIG9mIHByb2JpbmcgaW9jdGxzIGZseWluZyBieS4NCj4N
Cj4gSSB0aG91Z2h0IGFib3V0IHN1Z2dlc3RpbmcgYXQgbGVhc3Qgc29tZXRoaW5nIGxpa2UgSTkx
NV9QQVJBTV9DTURfUEFSU0VSX1ZFUlNJT04sDQo+IGJ1dCBJIGRvbid0IGtub3cgaWYgdGhhdCBj
b3VsZCBoYXZlIHByZXZlbnRlZCB0aGlzIDggc2Vjb25kIHRpbWVvdXQgZm9yIGNyZWF0aW5nDQo+
IGEgcHJvdGVjdGVkIGNvbnRlbnQgY29udGV4dC4gTWF5YmUgaXQncyBiZXR0ZXIgdGhhbiBub3Ro
aW5nIHRob3VnaC4NCj4NCj4gT2YgY291cnNlLCB0aGVyZSB3YXMgYWxzbyB0aGUgdmFndWUgaWRl
YSBJIHRocmV3IG91dCBiZWxvdyBmb3IgZ2V0dGluZyBhIGxpc3Qgb2YNCj4gc3VwcG9ydGVkIGV4
dGVudGlvbnMuDQoNClRoZSBkZXRlY3Rpb24gbWVjaGFuaXNtIGl0c2VsZiBpcyBhbiB1QVBJIGNo
YW5nZSwgSSBkb24ndCB0aGluayBpdCdzIGEgZ29vZCBpZGVhIHRvDQpjb21iaW5lIHRoYXQgd2l0
aCB0aGlzIFNFVF9QQVQgZXh0ZW5zaW9uIHBhdGNoLg0KSSBzdWdnZXN0IHdlIHN0YXJ0IGEgZGlz
Y3Vzc2lvbiBpbiB0aGUgImk5MTUgdUFQSSBjaGFuZ2VzIiB0ZWFtcyBjaGFubmVsIGp1c3QgbGlr
ZQ0KaG93IHdlIHNvcnRlZCBvdXQgYSBzb2x1dGlvbiBmb3IgdGhpcyBzZXR0aW5nIGNhY2hlIHBv
bGljeSBpc3N1ZS4gV291bGQgdGhhdCB3b3JrPw0KDQpodHRwczovL3RlYW1zLm1pY3Jvc29mdC5j
b20vbC9jaGFubmVsLzE5JTNhZjE3NjdiZGE2NzM0NDc2YmEwYTljN2QxNDdiOTI4ZDElNDB0aHJl
YWQuc2t5cGUvaTkxNSUyNTIwdUFQSSUyNTIwY2hhbmdlcz9ncm91cElkPTM3OWYzYWUxLWQxMzgt
NDIwNS1iYjY1LWQ0YzdkMzhjYjQ4MSZ0ZW5hbnRJZD00NmM5OGQ4OC1lMzQ0LTRlZDQtODQ5Ni00
ZWQ3NzEyZTI1NWQNCg0KLUZlaQ0KDQo+IC1Kb3JkYW4NCj4NCj4+IA0KPj4gVGhpcyBzZWVtIGxp
a2VseSB0byBnZXQgbW9yZSBhbmQgbW9yZSBwcm9ibGVtYXRpYyBhcyBhIGRldGVjdGlvbiANCj4+
IG1lY2hhbmlzbSBhcyBtb3JlIGV4dGVuc2lvbnMgYXJlIGFkZGVkLg0KPj4gDQo+PiA+IA0KPj4g
PiBOb3cgaXQgYXBwZWFycyB0cnlpbmcgdG8gY3JlYXRlIGEgcHJvdGVjdGVkIGNvbnRleHQgY2Fu
IGJsb2NrIGZvciANCj4+ID4gc2V2ZXJhbCBzZWNvbmRzLg0KPj4gPiANCj4+ID4gU2luY2Ugd2Ug
aGF2ZSB0byByZXBvcnQgY2FwYWJpbGl0aWVzIHRvIHRoZSB1c2VyIGV2ZW4gYmVmb3JlIGl0IA0K
Pj4gPiBjcmVhdGVzIHByb3RlY3RlZCBjb250ZXh0cywgYW55IGFwcCBpcyBhdCByaXNrIG9mIGJs
b2NraW5nLg0KPj4gPiANCj4+IA0KPj4gVGhpcyBmYWlsdXJlIHBhdGggaXMgbm90IGNhdXNpbmcg
YW55IHJlLXRoaW5raW5nIGFib3V0IHVzaW5nIHRoaXMgYXMgDQo+PiB0aGUgZXh0ZW5zaW9uIGRl
dGVjdGlvbiBtZWNoYW5pc20/DQo+PiANCj4+IERvZXNuJ3QgdGhlIGlvY3RsIyArIGlucHV0LXN0
cnVjdC1zaXplICsgdTY0LWV4dGVuc2lvbiMgaWRlbnRpZnkgdGhlIA0KPj4gZXh0ZW5zaW9uIHN1
Y2ggdGhhdCB0aGUga2VybmVsIGNvdWxkIGluZGljYXRlIGlmIGl0IGlzIHN1cHBvcnRlZCBvciAN
Cj4+IG5vdC4gKE9yLCBwZXJoYXBzIHJldHVybiBhbiBhcnJheSBvZiB0aGUgc3VwcG9ydGVkIGV4
dGVuc2lvbnMgc28gdGhlIA0KPj4gdW1kIGRvZXNuJ3QgaGF2ZSB0byBwb3RlbnRpYWxseSBtYWtl
IG1hbnkgaW9jdGxzIGZvciBlYWNoIGV4dGVuc2lvbiBvZg0KPj4gaW50ZXJlc3QuKQ0KPj4gDQo+
PiAtSm9yZGFuDQo=
