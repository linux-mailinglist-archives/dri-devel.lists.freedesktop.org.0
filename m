Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC7D588211
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 20:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C4612B1F2;
	Tue,  2 Aug 2022 18:48:43 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8879443A;
 Tue,  2 Aug 2022 18:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659466116; x=1691002116;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5stqXPyvptpFLWTmFG8ao99975dGHPHTI/NCpX6BKjs=;
 b=DSlmL6wyrUgdM3PwOsVEiyb+NYfHuEPqf61pA21EvIRJncmOokugQHck
 49E2xBJOOSeOitEf3FThoVUeQAQFmReBgvowSPwl0MNF7Dlmo4OMzzTye
 zNAIAbcMtjNPpuSP3TnGs5+tJaQ199k4Xf/7BINV+8cal3M+ad/Rd1qLm
 FH2UdANMM1x6UVPz2e4AWqqubkudIAcZMiIBvK4pXdDDQATN9yI65vYXk
 QI9FyK2KlyHlZvz04Hu5xvHDVuSQRVvjKvl+rq3yBuLTYIxulbHfY6QCN
 hqhvNM6n5S88z1aWyFRgDqH6XRraV0+yLkzkNXVFROcY+YvW2TPgPPBHZ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="375795446"
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; d="scan'208";a="375795446"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 11:48:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; d="scan'208";a="848307600"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 02 Aug 2022 11:48:17 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 11:48:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 2 Aug 2022 11:48:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 2 Aug 2022 11:48:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7wC0v0+a5ZlLApAJj1GxrCdvqhZTr9GmfJ6JEDFHRQjzixj+aMCqirJDCZ+XFg5jvDWEZqbPyZ42fQU8XQfoPJ74cN2vTKvp4zGRKFxFeGcIwKLpi+Z/EZHlzzIQ70VNBwm/A0GeWm7bGMP3CjnT6KLuaXp+cD9kLBbS1Ox43fTAgPzrlyCV7woUqlG7i10uhv4YPzhGClfbLkTcsa0qwslwsjZjk38N/+6hnWTp7dw7+iRF99+SKDnwY7FOEOvki1xc+XugmG4aeAIIhBLRCvMP+PIZNabzcxQel8v+HY38Ymj+VPlaeLyNCkIYUjMXbfXw/CRY9aZdt+dAvn65A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5stqXPyvptpFLWTmFG8ao99975dGHPHTI/NCpX6BKjs=;
 b=bjRArPG5A0xj3FkvMzcA3KU3HFfM/YVyG90/g5AQnQ7bQ1DvqJAhGX1KDSoaB2pDisBDEXB0fONTIRwxdmiCfNBeApoBv9wZkIOw2xF4FjwDb0sonThSp+dxz7c3oTdHOf47VHwnea5FpPQ6V1QApOUrjBfzNbVLlGR8CEGGnywRk4VcalcS5e9UAuzzmhVTtrzaCzxhbTC9/fxklZiVm9paUWyXRuqbdj1r40qUvi9g/3wpEV5feAskZlRgE3iLRH5K8qHB0Rt1XEOngN51VkNP2lTzyiQNeYQMiMmLNunfNiD+aYpmZ7meo4kB++0bspUwnu/+e1snhk2MqapMaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MN0PR11MB6208.namprd11.prod.outlook.com (2603:10b6:208:3c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 18:48:15 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::fdd1:18b1:3e9c:b03e]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::fdd1:18b1:3e9c:b03e%4]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 18:48:15 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [Intel-gfx] [PATCH 5/7] drm/i915/guc: Use streaming loads to
 speed up dumping the guc log
Thread-Topic: [Intel-gfx] [PATCH 5/7] drm/i915/guc: Use streaming loads to
 speed up dumping the guc log
Thread-Index: AQHYoijZ7AsQwZSbzk6zYPBV+uHM162b/NWA
Date: Tue, 2 Aug 2022 18:48:15 +0000
Message-ID: <2c7675a1557691dd5546ef2bb36ad9190def37d3.camel@intel.com>
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
 <20220728022028.2190627-6-John.C.Harrison@Intel.com>
In-Reply-To: <20220728022028.2190627-6-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c1bca29-0eb5-4dd8-834e-08da74b78f06
x-ms-traffictypediagnostic: MN0PR11MB6208:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rrFwLuLrx5l0AXqz8x2jjhzpgnDWYUXHkSimUtypCxWn/kGtYd7xmi463nH4Wc7hYZTbCssNJttuIA8DU5+hgNilfly83sQ9MrW9/i4K3OD4xzWWtmXMiCM9VEW/lqMbQDz96MeQL94+2qO61C0enPuqk+78BF4uG/vBBJbpj2FDvV3luKiY8t7t/WNcXYcGx9KF4OXY8JS/ffEgQVXltFyHFdvur/o6OSth2MZk1QxZMqcxyuu24gcF0C5Zlcb6ShHtgTBE/paTSnf2NVIvYMchFyCCkoepVRg8arC4CCTFz0aYv6uJdyl0V5QOdxUu5VknFkDpGMG+EGG04gkmDvRSyIqt+0yinuZJo+GmVBIfHJK/e6NsUrF1pnPM0J5qXD+DZ4p32Y4sDDgQhv/06GJG2wA91xwYIzv19CNURc7cB0OHodpMLRtSnJYypBAT0maNXRJwwqAAVHjm0hHFfxg2ZwQqwBIyBNOYkV7nl7P+8K9b1i795HCSA0oU7yM0ioIEjPE6ZawaOf4yOjtQKHYuBcErKknyMOEH3qbKiVGNBjlPAlRbWLpejbsFTz9gc/ukREC61mTLuP5irQWVcBZhtrpfH77C90NJukvGyAfhZIBT6zXJVd/PRpqf5TozUW7+X4438XgERSkNqi0TTGzgK9CQEY5T1mdWIkpLn46DXYaOSl4wMjzZyvlLn7iDDzZg5zLr5FEHn4xhkUaBwh5UE4M8MY22BqRcMC8Actu6LNm9B9kqUKDSMnGUd70xK296Hx2xhlHCpLuxObbD81gnDyMqZ161HTWaq9rTlwCRqx134tNUwaX9/GIrBGZf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(346002)(376002)(366004)(136003)(316002)(26005)(6512007)(478600001)(71200400001)(38100700002)(122000001)(110136005)(186003)(107886003)(6486002)(83380400001)(54906003)(2616005)(36756003)(8936002)(6506007)(41300700001)(76116006)(2906002)(8676002)(66446008)(91956017)(86362001)(66556008)(64756008)(66946007)(4326008)(66476007)(450100002)(5660300002)(82960400001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yk5yNHJyc2s3MWM0NUwwZDZ0d2gzUUpHaHAxdkJ2QnF1L3FVMUJrSzhCd0w3?=
 =?utf-8?B?SjAvUFBWeDlsc3pyWWZpM3NJdzBXbGFId0Z3K2tEMmo5V05TTkZ0UVhDZ04w?=
 =?utf-8?B?ZiswOEhIMXZZNDM3TmdoeE9KV3pUQ1pQcVB0UXhUL0V5a3didUQyeWhsTEM2?=
 =?utf-8?B?VEw3eUJSdTZseHVaVVRTTTJiZWZLS3htSUdVM2NXNWZ4YitFMWhMaGJjRW42?=
 =?utf-8?B?QXBVSUhGSEFSLzRwcXRycGFDL3JyVk1xRnNhTlo0QWduMWdWdEQ3UFYxL3pm?=
 =?utf-8?B?UjV1ektLMlBielRjU0tlYmsycjFmdHRuS2YxdjlkZzE4V2xiWFg1SUoyb1cw?=
 =?utf-8?B?bm0yRDRqallQdDNmQkVGSVB4RVN0d2hMeVo1NzdSZlY4MXVjelZsRFg2VThn?=
 =?utf-8?B?QTBnbmNGMWFBMldOaENIOFlGUVdmTC9xaXl1Wk1kSlppaDlOUDVSQmJmak5J?=
 =?utf-8?B?cERBQkNwUUEzUXFnR3dyTDRJUThhb3g3Z2tmZktScXh6c3FWSEp0L2tGakdJ?=
 =?utf-8?B?VnBjZWpVeVYwREtCeFVCODl4R0Z4SHFLZXl2WWgzS3BvU1V4MWd3djhyWitQ?=
 =?utf-8?B?cWowb1hnK3BKazV1S1BvOXFHNzNPVFRIblRwcnZ5TEVSZDZUeDN2KzVPQzlC?=
 =?utf-8?B?ek4wK0taWkc2ZUllWFB4bVIzcUtuMTBuZjdPZFNQQVdmSVU2Wk02QmRsdnk1?=
 =?utf-8?B?MTBVNGdYNTh0RGFoSmxGUlhwR255YStLU2p4QmpkT0p4bnppbm5TVWpWVWZj?=
 =?utf-8?B?RTNiNjN2SVkwbTF4MVByM1ltUDRTaHJlSEpadHRsZGVKU080VW1MeWpHYWNS?=
 =?utf-8?B?MWoyUnc5a1dzUW5pSVNBdGNlV3MvWTFiSnp1QWhOTFVJOEhrQjd3UVB1d3dz?=
 =?utf-8?B?SnpLRlBvN3Y5YmVucEE4aVZiZUJ4T3lZNkd6YkpTRjNRVktsWlAwQzRVNVRO?=
 =?utf-8?B?NDhCR2g3THExWGlZamppd0JoeFRCQVlBc1MwcUlJU1cxeVM0a09kZmM3Vkho?=
 =?utf-8?B?R2NFRmhlQS9HMWhYSENGSjFxdU9LMjV1WTBYbDYyeUMxT2lEYUVDZTdkakkr?=
 =?utf-8?B?d3dQcDltdmxBYWhvL2l4R1NQSVpsZVpiR3Q5cEFmK1BybnZPMzRvWmtTa3g2?=
 =?utf-8?B?eEw4VlJ4d3hVWG9TVlVZOGgzbHZKVDVYdFJQLysvMVdlNzlJU1duRHI0MmJy?=
 =?utf-8?B?cHdzQ0M3QU1ReGtmS2RCeWt3YXllQzlKendvejhSTjV3VmFNNS9XOUU4bUtQ?=
 =?utf-8?B?djJQYWdoV1RUV3NUUXV3K2tMaWY1UUxnSDZlRGQ4dTUvYXZGbUplU081NmN0?=
 =?utf-8?B?K3JhVE52cHUremdEVHlCZXNjY24xc2Q2Q3o1Y0dDdXNwWUEybGlhdXM1M1A2?=
 =?utf-8?B?UmdNUUxKanhZRlFjNTB1Yko4TTNVQkNlazVKTEl3RFNXSVZaWW93SWFZZUFw?=
 =?utf-8?B?S1FmU01zTGcvSUV3aVB2UWlxVEFvVHRDQ1VnRWNOMnFyOTVFOXprQkhQdjlW?=
 =?utf-8?B?QWN3L21hSXpWM3c5UVJYeWVPN1dZUVBKUTAzdld4R0tQQURsMTNBdnNXakFZ?=
 =?utf-8?B?c1RiU0tXWHB3Y2FLK3AzMjRXV29rZnZtK0V5a2lUWllYNnZBTkJTSVo2RWw1?=
 =?utf-8?B?VnhoelE2YVhjVlh6S1FHOTdwNDE3Uk9tZTQxZ3FPR2liYVZGcnNCRVNNc1JV?=
 =?utf-8?B?RmdQL3VMZ3lFM2g2cXd0dWRWWnN6TG1jU09mRU1MOGZuUDZ0MVZqUmZ6SWIy?=
 =?utf-8?B?dm5waWtBSWIxZHFVNTMzTDk1aDk4OEtmcFZUR1VjcUliMjNpWTIrVkhhNHpa?=
 =?utf-8?B?QnBPL1JBY0lBdjIwMS9KaGdGMGFwT2Zpc0pMVDlOUEN1SmdlTzNNUTAzK25N?=
 =?utf-8?B?L2RMd2pFTlliSGw3R0xNcHc5R1gwRlNuMGdtajBYMTc5Q3pFR0FUR0dnUDl2?=
 =?utf-8?B?NW9vamRLRGdKZnpFUGhEenlmNzBobjlDdVN4dG1xRjJ0WnpZWXdDQnpBNmJu?=
 =?utf-8?B?ME0ya0RPd1JMeGlBdG8zaVFRV0VjcUtZSEQ1bGYwSHpqRjlwZjl3d3l5dkYx?=
 =?utf-8?B?UFBJNHJGN1dyQmlTck55dXJYT0loZTl4RzErUjVrRnBxMWVIZkt0Sjd0MXVk?=
 =?utf-8?B?RG8waDhiNzk2dTlCTFlmN1M5K1lMdm9xV1M5STNuS3J0RW9LZEVGT2VaOW9m?=
 =?utf-8?Q?3xKpnFXZiyZ0xGbbDq/lNZc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C3AE08C700F164BAD9047B7557E2705@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1bca29-0eb5-4dd8-834e-08da74b78f06
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 18:48:15.3596 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 69n9AnOq7CCRa4gdk9qCG2txR9AaTc7aOEzt9emXtIyxwvYQgkFSc44/icS4S3HsYgVN0EdBjXeM5CDtQ4AlDIOpEc3hMWrtAIAbwaA3TxgfTjXhhrCid3K/LmgQD4ho
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6208
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
Cc: "Wilson, Chris P" <chris.p.wilson@intel.com>,
 "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T25lIGNvbmNlcm4gYmVsb3cuIEVsc2UsIG5pY2UsIHNpbXBsZSB5ZXQgZ29vZCBvcHRpbWl6YXRp
b24gaGVyZS4gOikNCg0KSW4gdGhlIGludGVyZXN0IG9mIHF1aWNrZXIgcHJvZ3Jlc3Npb24sIEkg
d2lsbCBwcm92aWRlIGEgY29uZGl0aW9uYWwgUi1CIGlmIHlvdSBjYW4gZWl0aGVyIGZpeCB0aGUg
aXNzdWUgcmFpc2VkIGJlbG93IG9uDQp0aGUgd2F5IGluIG9yIHByb3ZpZGUgYSByZWFzb24gd2h5
IHRoYXQncyBub3QgYW4gaXNzdWU6DQoNClJldmlld2VkLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5w
cmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCg0KT24gV2VkLCAyMDIyLTA3LTI3IGF0IDE5
OjIwIC0wNzAwLCBKb2huLkMuSGFycmlzb25ASW50ZWwuY29tIHdyb3RlOg0KPiBGcm9tOiBDaHJp
cyBXaWxzb24gPGNocmlzLnAud2lsc29uQGludGVsLmNvbT4NCj4gDQo+IFVzZSBhIHRlbXBvcmFy
eSBwYWdlIGFuZCBtZW1weV9mcm9tX3djIHRvIHJlZHVjZSB0aGUgdGltZSBpdCB0YWtlcyB0bw0K
PiBkdW1wIHRoZSBndWMgbG9nIHRvIGRlYnVnZnMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJp
cyBXaWxzb24gPGNocmlzLnAud2lsc29uQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSm9o
biBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEpv
aG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2xvZy5jIHwgMjQgKysrKysrKysrKysrKysr
Ky0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxf
Z3VjX2xvZy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2xvZy5jDQo+
IGluZGV4IDA3ZDMxYWUzMmY3NjUuLjQ3MjJkNGIxOGVkMTkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19sb2cuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfbG9nLmMNCj4gQEAgLTc1MCw4ICs3NTAsOSBAQCBp
bnQgaW50ZWxfZ3VjX2xvZ19kdW1wKHN0cnVjdCBpbnRlbF9ndWNfbG9nICpsb2csIHN0cnVjdCBk
cm1fcHJpbnRlciAqcCwNCj4gIAlzdHJ1Y3QgaW50ZWxfZ3VjICpndWMgPSBsb2dfdG9fZ3VjKGxv
Zyk7DQo+ICAJc3RydWN0IGludGVsX3VjICp1YyA9IGNvbnRhaW5lcl9vZihndWMsIHN0cnVjdCBp
bnRlbF91YywgZ3VjKTsNCj4gIAlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqID0gTlVM
TDsNCj4gLQl1MzIgKm1hcDsNCj4gLQlpbnQgaSA9IDA7DQo+ICsJdm9pZCAqbWFwOw0KPiArCXUz
MiAqcGFnZTsNCj4gKwlpbnQgaSwgajsNCj4gIA0KPiAgCWlmICghaW50ZWxfZ3VjX2lzX3N1cHBv
cnRlZChndWMpKQ0KPiAgCQlyZXR1cm4gLUVOT0RFVjsNCj4gQEAgLTc2NCwyMyArNzY1LDM0IEBA
IGludCBpbnRlbF9ndWNfbG9nX2R1bXAoc3RydWN0IGludGVsX2d1Y19sb2cgKmxvZywgc3RydWN0
IGRybV9wcmludGVyICpwLA0KPiAgCWlmICghb2JqKQ0KPiAgCQlyZXR1cm4gMDsNCj4gIA0KPiAr
CXBhZ2UgPSAodTMyICopX19nZXRfZnJlZV9wYWdlKEdGUF9LRVJORUwpOw0KPiArCWlmICghcGFn
ZSkNCj4gKwkJcmV0dXJuIC1FTk9NRU07DQoNCkFsYW46IGFsdGhvdWdoIHVubGlrZWx5LCBpdHMg
cG9zc2libGUgdGhhdCB1c2VyIGNvdWxkIHRyaWdnZXIgZGVidWdmcyBtaWQgb2YgYSBndCByZXNl
dCAtIG5vdCBzdXJlIGlmIHdlIG5lZWQgdG8gdXNlIHRoZQ0KInVjLT5yZXNldF9pbl9wcm9ncmVz
cyIgYmVmb3JlIGNhbGxpbmcgdGhpcyBhbGxvY2F0aW9uIGFuZCByZXR1cm4gYSBkaWZmZXJlbnQg
ZXJyb3IgaW4gdGhhdCBjYXNlIGxpa2UgRUFHQUlOIG9yIEVCVVNZIG9yDQpFQ09OTlJFU0VULg0K
DQo+ICsNCj4gIAlpbnRlbF9ndWNfZHVtcF90aW1lX2luZm8oZ3VjLCBwKTsNCj4gIA0KPiAgCW1h
cCA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwX3VubG9ja2VkKG9iaiwgSTkxNV9NQVBfV0MpOw0K
PiAgCWlmIChJU19FUlIobWFwKSkgew0KPiAgCQlEUk1fREVCVUcoIkZhaWxlZCB0byBwaW4gb2Jq
ZWN0XG4iKTsNCj4gIAkJZHJtX3B1dHMocCwgIihsb2cgZGF0YSB1bmFjY2Vzc2libGUpXG4iKTsN
Cj4gKwkJZnJlZV9wYWdlKCh1bnNpZ25lZCBsb25nKXBhZ2UpOw0KPiAgCQlyZXR1cm4gUFRSX0VS
UihtYXApOw0KPiAgCX0NCj4gIA0KPiAtCWZvciAoaSA9IDA7IGkgPCBvYmotPmJhc2Uuc2l6ZSAv
IHNpemVvZih1MzIpOyBpICs9IDQpDQo+IC0JCWRybV9wcmludGYocCwgIjB4JTA4eCAweCUwOHgg
MHglMDh4IDB4JTA4eFxuIiwNCj4gLQkJCSAgICoobWFwICsgaSksICoobWFwICsgaSArIDEpLA0K
PiAtCQkJICAgKihtYXAgKyBpICsgMiksICoobWFwICsgaSArIDMpKTsNCj4gKwlmb3IgKGkgPSAw
OyBpIDwgb2JqLT5iYXNlLnNpemU7IGkgKz0gUEFHRV9TSVpFKSB7DQo+ICsJCWlmICghaTkxNV9t
ZW1jcHlfZnJvbV93YyhwYWdlLCBtYXAgKyBpLCBQQUdFX1NJWkUpKQ0KPiArCQkJbWVtY3B5KHBh
Z2UsIG1hcCArIGksIFBBR0VfU0laRSk7DQo+ICsNCj4gKwkJZm9yIChqID0gMDsgaiA8IFBBR0Vf
U0laRSAvIHNpemVvZih1MzIpOyBqICs9IDQpDQo+ICsJCQlkcm1fcHJpbnRmKHAsICIweCUwOHgg
MHglMDh4IDB4JTA4eCAweCUwOHhcbiIsDQo+ICsJCQkJICAgKihwYWdlICsgaiArIDApLCAqKHBh
Z2UgKyBqICsgMSksDQo+ICsJCQkJICAgKihwYWdlICsgaiArIDIpLCAqKHBhZ2UgKyBqICsgMykp
Ow0KPiArCX0NCj4gIA0KPiAgCWRybV9wdXRzKHAsICJcbiIpOw0KPiAgDQo+ICAJaTkxNV9nZW1f
b2JqZWN0X3VucGluX21hcChvYmopOw0KPiArCWZyZWVfcGFnZSgodW5zaWduZWQgbG9uZylwYWdl
KTsNCj4gIA0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAtLSANCj4gMi4zNy4xDQo+IA0KDQo=
