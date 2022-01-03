Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB65482DBC
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 05:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421FC898EE;
	Mon,  3 Jan 2022 04:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B17898E1;
 Mon,  3 Jan 2022 04:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641183120; x=1672719120;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sGEGrF2p/F5MwimCwrpjBrIZ1ri2gKM+DVHpd6aI+ns=;
 b=TKD9tvKb3NLligqDdGhwGL/L3re4jaXi88jbA3Vy3h4RbcKT7D1ePFId
 eXyW0ZnpsY6REptZST+BQ8p1/GtdQ8+nz+SXyX4f6VjHeiRAX2YxZMMQR
 sldfL7rhiutvEkgd0k/LE2VmglpCeHDJVXnb89tVmOEGZJAAyT5tbuHF3
 IYlUzCNDi1M2V1WkCsk46gYirHFcW5shV9DDhRMqjisCjQ+94Sp5VcyIF
 9Ttbf3eTJUR/aev9o6FoiAY5Q0/ZQd8eZ83AY4GP4oxSi4qteI52ZMmgb
 /rLD2IQWCv+htpHBTTF3WXz16YI2C7fAm53DldXzXDsey8amU/cSKSlGT w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10215"; a="302766072"
X-IronPort-AV: E=Sophos;i="5.88,256,1635231600"; d="scan'208";a="302766072"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2022 20:11:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,256,1635231600"; d="scan'208";a="525866040"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga007.fm.intel.com with ESMTP; 02 Jan 2022 20:11:59 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 2 Jan 2022 20:11:58 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 2 Jan 2022 20:11:58 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Sun, 2 Jan 2022 20:11:58 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Sun, 2 Jan 2022 20:11:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1KSNbYxFZJiyA1hl919KqYsa8DQhrl8xoZVvuqq/ZKmFGwk/W8/41UNNbmAxD6fB6oWxjqYMdkJPECiWhzwDc6LSwp6b9VLO7IjqTR9RL5r7DHF9KyMS+iuzqWcdyrX0DkCTdyDhUhg7dWxFQ/0WLjrfbXMCBHAs0nDpnq+6NdB+lr7uZeE/AQfN7QFO2NHKgiaT29184mvEMJeQODIpzGxM/co2VIZXVPEaigME9d38F/ykeXmv91llKWu1lh5cSGZzOCvtEc1v+RegPsDRJXBgRySREj2qHx0dXciCYkzETeJMV9nc4+eiegOt2GzaY8IpwRj88S7DIwhKXcjgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGEGrF2p/F5MwimCwrpjBrIZ1ri2gKM+DVHpd6aI+ns=;
 b=V7iUa7ReMJ9MCYC8e5HgtlPpy3Q7vK5U4O5+RWRhYVbtTnG0/U4rFwW8gyYfQeiA21w3yq7utbm3BudC9WP9F/++6BNsKy9MB/XWuzG1wn+CnVp2tt4HDgs5HrkInv57hC3Wu6BPOEDBrVgR3qRWsEMEP7WES9MIzQaUetj7QIXZ0WQXtLB7WyuYIldpy9jWAUR8DT0Hf8zbx+XLGOnuZK8qNFChSnE9fj/DdnZdQ2ClfLoo9O+dq2MN+0ifO+B9Qf4LU2cX1w8qXU+4LWNGb2h/qm3gw/pYz0iZ0rdsHtWWrgDHfmFPLK9v8SqseA1Xu8BrTeL2ZdxJRHs90RVLCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 DM6PR11MB4171.namprd11.prod.outlook.com (2603:10b6:5:191::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.14; Mon, 3 Jan 2022 04:11:55 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::4c47:45d4:7870:1c79]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::4c47:45d4:7870:1c79%5]) with mapi id 15.20.4844.016; Mon, 3 Jan 2022
 04:11:55 +0000
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
To: Harry Wentland <harry.wentland@amd.com>, Pekka Paalanen
 <ppaalanen@gmail.com>
Subject: RE: [i-g-t 00/14] Add IGT support for plane color management
Thread-Topic: [i-g-t 00/14] Add IGT support for plane color management
Thread-Index: AQHX2gY5rWLSRsLRbkinlhrugfnTHqwJD0MAgA0JXYCABDgLgIAAZIeAgDDIWwA=
Date: Mon, 3 Jan 2022 04:11:55 +0000
Message-ID: <DM8PR11MB571951C2110DA00DD821CC588D499@DM8PR11MB5719.namprd11.prod.outlook.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211118115002.14003184@eldfell>
 <26abc3eb-c50e-8f89-ccc9-ad96f1177987@amd.com>
 <20211129112033.770d1c2a@eldfell>
 <b961943f-3e92-cb93-7b2c-a1ddabb971ed@amd.com>
In-Reply-To: <b961943f-3e92-cb93-7b2c-a1ddabb971ed@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4dde5f1a-064c-451a-ba20-08d9ce6f2e02
x-ms-traffictypediagnostic: DM6PR11MB4171:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB41716DB9AFE4430E274D9FCB8D499@DM6PR11MB4171.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5DO7rrug6/q4uAU/HQ7+yLxbUkMKOgoGZLDDIGuC9MfFtQJ/htoXnrCS3joifVEdG5IxdcjKJPUIwlFeFRp3gMec6Ea/phpHkSp9Jm3Ac1xEZPlH0nhvA7yn2NYPzSVEr54VFYuqV92pXGtdQeltUarYH9OEWCA4rcDWVoWwsHx/YD8lT1kkVii1UGvFTajkWcIEQ2fz29Nt5wDIw9M3V30LMMalf4z7oE/N09HhN/bK29CkCXk/GuS5rvfjex+RHSPB9uLSavCkObMwByOrZNBLTamaHDJiTY5WxmHeVd/vHh39Edxow+5yHbWybeRnJiAioYJkdlJPRb3/44b0I1eSRQEKLJGwYdrMINE2kDvdWFHbhKh9nqVxso4S4h81yjj+9V7q/lrCFnIjo+ggb0iAdAgrFYPVouChE7QNs61ficTHEyzA70o4tsz9ak2BRMW2BI+kMnwsLrUDLMxPbWQ6MwiTFlDrzZaNV6jpajVlxqrxXA+cakEqnYYiK358p0hiBjQdTrlxEgdVZ47An/EoTiyCS5ePSBQNGV+UWEV8kadW4QHX+ZkL901/Mvs3DCOK21S2N6pyUTXUaGvByQCdT4LMzprllDjZhp9bqU6SBCWabcGi17OFqk+cKTmu+DNI+/Vg0fc+0TFpjjrIqCo+30fV7T+WKMo9R7/qmqzz94CkMI8nKr+lbkArV+xbTfN/rlBi5DFzXw8nqq0ucA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(82960400001)(55016003)(71200400001)(107886003)(66446008)(9686003)(52536014)(8936002)(38070700005)(316002)(86362001)(508600001)(8676002)(4326008)(33656002)(966005)(110136005)(5660300002)(66946007)(4001150100001)(2906002)(122000001)(66476007)(76116006)(53546011)(54906003)(6506007)(26005)(64756008)(83380400001)(38100700002)(7696005)(186003)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFo2anNKZU5NVEdPYWtWenNxcTB2SlY2SGp6MU9wY1MwNWxrOHM4TmRhSjc3?=
 =?utf-8?B?OXVSRjgwNkpCWEkrTlB0VmR4RGVIRDdaMiswVzVWR2g1TnIwUytSRHlKMlZ4?=
 =?utf-8?B?bDk3cmhmeUVLNlBZNFBGUXhNakt0ZkFjVFQyOHFuQjVhU1FhSTBXWmRyQnkv?=
 =?utf-8?B?ZmZuWWRXSHY3WEt4Rm9NemxycmxKYVpMT0VENkVkS0loZFBDeHluM3ptT2dl?=
 =?utf-8?B?VnpJZUloT2llRmJCcXNYTS82MnR3Y1BLTVdnTFM0d1RyR2RERW5lSnE1ZDFZ?=
 =?utf-8?B?anRUcVFFTW8rOWo1cEJSeFdKSFhwNVFWVEQ4SGFvSU5Uc251Sk4wTTBjMHNj?=
 =?utf-8?B?TmRxaXVXNzFjNXdJRG1VNDlnWHpQZFN3OUhNQWhRU285UDRRTGFnVXc2dnh6?=
 =?utf-8?B?SWdZWFRFclY5S3l3bi9WWDhKaDVzVVk5OFRsWloyRGJhSWFjVGlmbzBZeGtj?=
 =?utf-8?B?TXdLSUVOYVJBMlpVTlJIbW9Obk5UWEtrYjlzWDBOTS9KNjdWbm13eFR2L0Q4?=
 =?utf-8?B?bzYxSml5UVE0aHlKVUdUS3R0amQxZkp1aU15a05uV0V4YmVqd0gxRUZvNHRx?=
 =?utf-8?B?Q0pLaTVwVWdkcGQ5aFg1VFh6VHMvSW5FVVIrdWlva3FBemM1bi80NUIxM1FW?=
 =?utf-8?B?c1NaZkpRNUM5aUJEQTJKWnBVRUlnUHFOeUdKSlMzN0NJemdWaW0wS2pDVVVR?=
 =?utf-8?B?UzhGR1grY21lYzcxbFg2WUd0RHA5Y1BOdjFoMVJ5NnBSRGplaUkvOXpkNDJk?=
 =?utf-8?B?UzlmQWxnWFJQRjlWZ3VCQWM3UGtwaUZmUUNmV2V6alVBWEFxMUhPT0ZaUjVk?=
 =?utf-8?B?NmM2UU9PS2oyUFRFODVOSkVVaDBiNWNIOUM2cW53Y0hhYXlxa0dBOFVvQ1dX?=
 =?utf-8?B?V3M0V1RWb1N0eTdxNjIyYWZ2TzF4K2h6YXdwaU5QOHNGaWIxbEducS9nOWty?=
 =?utf-8?B?bGVOQW5qRnVvTTIzdmJnWFduTGh4andaRmk3UG11YkRTeEdpbC9SMzRTWTZU?=
 =?utf-8?B?UHBEUVVpY3NlWlVNcnJHSmlyUGVYZ1N6NlRSSjZzVGJPYXF3WWYyUklLbkty?=
 =?utf-8?B?RnFJV1ZuYnFGU2ZWVUk4WlBLbDN5RXJTQituWjZSdVhtQ1U3UHlmYWxoZnNp?=
 =?utf-8?B?WGdPOFZoMjN6cVQwVm42aGZETjlHNXl1TU40a2g4TUowcTF2dTBpZC9RVDVG?=
 =?utf-8?B?dm5OUDlKZmtwbktscUhaZGNaTXdRaTR2cXk4VnhLMG5pQlJQcXoraGQxamdH?=
 =?utf-8?B?UGJVTmNNWTUwS2I3Z0xaeXd6ZWRhY3pLd3pCUzJmSytUNDJBRzVCWEdPT29B?=
 =?utf-8?B?dkd6QnAydStCUi8wNjlSNndDKzZ1amppakd1ZWU1MGNQeVpVaWFEdU1uT09F?=
 =?utf-8?B?UzBzTzhWUHhHU2Mxd0ZKenl1SGRxRGt3RGh2R1MvQ0FwY3hkelZrdjZncnlF?=
 =?utf-8?B?bE5nbUROZ3RDbkt1MUVmaGVmNTJVOUFPeXBXNnV5UVVOdm5Vems0NVVTQlVQ?=
 =?utf-8?B?WTNYN2pNV0NwbC9LaU14R2IxbjduYTZmbXZKTnU1RkJwTzJ1cGgyMUFNWmRz?=
 =?utf-8?B?NTBzUndYeWNjZGd4WVJkNkp3Z1llZXBtejgxU2tQOHFzRStNV3huckZtNjJs?=
 =?utf-8?B?Ym9QdDkrZk9WdUE2N01JUVhpc2hELzlFSGJEN2RZL0toNzRpWWMwSjJFUzQz?=
 =?utf-8?B?cDlDdnppTktRZS9iWVpZd0VvVWVOM3E0SU4rZ2NvTks5RjYvZ29WVlBXNVo3?=
 =?utf-8?B?MEhDRzdadEpadVVKZFMzSEtKa1RqSlpUc3pXTnVmRW82amkvdnZ4blZtTHgz?=
 =?utf-8?B?RVRWZi9OUVdrMUlLcGVlazBqcUNVajd3a2JvdFFrVGR1dStBL2ZRVE1kRTNX?=
 =?utf-8?B?K0wrNVQvTTRtbEJoaU9oS0RIVC9kK3doQnJSejJJOHhaekhzQmFyL1hWNlR0?=
 =?utf-8?B?cWF5SmlYOU9XMnRoclhSdkNSZXozZXJ5TnNTTDAySE54L0R3WXZtVEpRclpK?=
 =?utf-8?B?T3JhcllQMVRWNFdLWi9zQnZib0tvWjZuVU5EdFZQdmxaVzE4L0RWeEl4eVZ6?=
 =?utf-8?B?QWFRd1d3RVFCazRWNlNKRTAwVVkrcW5rSlhCT202aXc3Nnd1MnkyMThEOUtj?=
 =?utf-8?B?clN6M2RYOWZpWFdLdktZYzJMWjdtWU42eGZDK2N0NlNGeDVpaEtIdUpiVlZ4?=
 =?utf-8?B?ck54NmxqZzhMSC9kdHBnWHUvT3FuUmJxTG9NVUFSZTNEZm41aFlyTDBHRmt6?=
 =?utf-8?B?L2VDQWxRRmNmWFQ0MzRTOTlwSTdBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dde5f1a-064c-451a-ba20-08d9ce6f2e02
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2022 04:11:55.7476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XRmL+w31JOWFFKOi+1kUGuk/n+zpvBKDj4ZV2iXSThkgBT+6gDNfb5BbCgSq1DcOnGvVBqacXXdywPhAgaYaTF+klQbJoDVHxPZoyM3KsdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4171
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
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Shankar,
 Uma" <uma.shankar@intel.com>, "Kumar, 
 Mukunda Pramodh" <mukunda.pramodh.kumar@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBGcm9tOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCj4gU2VudDog
TW9uZGF5LCBOb3ZlbWJlciAyOSwgMjAyMSA4OjUwIFBNDQo+IFRvOiBQZWtrYSBQYWFsYW5lbiA8
cHBhYWxhbmVuQGdtYWlsLmNvbT4NCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IE1vZGVtLCBCaGFudXByYWthc2gNCj4gPGJoYW51cHJha2FzaC5tb2RlbUBpbnRlbC5jb20+
OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgS3VtYXIsDQo+IE11a3VuZGEgUHJhbW9k
aCA8bXVrdW5kYS5wcmFtb2RoLmt1bWFyQGludGVsLmNvbT47IEp1aGEtUGVra2EgSGVpa2tpbGEN
Cj4gPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+OyBTaGFua2FyLCBVbWEgPHVtYS5zaGFu
a2FyQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtpLWctdCAwMC8xNF0gQWRkIElHVCBzdXBw
b3J0IGZvciBwbGFuZSBjb2xvciBtYW5hZ2VtZW50DQo+IA0KPiBPbiAyMDIxLTExLTI5IDA0OjIw
LCBQZWtrYSBQYWFsYW5lbiB3cm90ZToNCj4gPiBPbiBGcmksIDI2IE5vdiAyMDIxIDExOjU0OjU1
IC0wNTAwDQo+ID4gSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+IHdyb3Rl
Og0KPiA+DQo+ID4+IE9uIDIwMjEtMTEtMTggMDQ6NTAsIFBla2thIFBhYWxhbmVuIHdyb3RlOg0K
PiA+Pj4gT24gTW9uLCAxNSBOb3YgMjAyMSAxNToxNzo0NSArMDUzMA0KPiA+Pj4gQmhhbnVwcmFr
YXNoIE1vZGVtIDxiaGFudXByYWthc2gubW9kZW1AaW50ZWwuY29tPiB3cm90ZToNCj4gPj4+DQo+
ID4+Pj4gRnJvbSB0aGUgUGxhbmUgQ29sb3IgTWFuYWdlbWVudCBmZWF0dXJlIGRlc2lnbiwgdXNl
cnNwYWNlIGNhbg0KPiA+Pj4+IHRha2UgdGhlIHNtYXJ0IGJsZW5kaW5nIGRlY2lzaW9ucyBiYXNl
ZCBvbiBoYXJkd2FyZSBzdXBwb3J0ZWQNCj4gPj4+PiBwbGFuZSBjb2xvciBmZWF0dXJlcyB0byBv
YnRhaW4gYW4gYWNjdXJhdGUgY29sb3IgcHJvZmlsZS4NCj4gPj4+Pg0KPiA+Pj4+IFRoZXNlIElH
VCBwYXRjaGVzIGV4dGVuZCB0aGUgZXhpc3RpbmcgcGlwZSBjb2xvciBtYW5hZ2VtZW50DQo+ID4+
Pj4gdGVzdHMgdG8gdGhlIHBsYW5lIGxldmVsLg0KPiA+Pj4+DQo+ID4+Pj4gS2VybmVsIGltcGxl
bWVudGF0aW9uOg0KPiA+Pj4+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJp
ZXMvOTA4MjUvDQo+ID4NCj4gPiAuLi4NCj4gPg0KPiA+Pj4gSSBhbHNvIGZvdW5kIHNvbWUgdGhp
bmdzIHRoYXQgbG9va2VkIGhhcmR3YXJlLXNwZWNpZmljIGluIHRoaXMgY29kZQ0KPiA+Pj4gdGhh
dCB0byBteSB1bmRlcnN0YW5kaW5nIGlzIHN1cHBvc2VkIHRvIGJlIGdlbmVyaWMsIGFuZCBzb21l
IGNvbmNlcm5zDQo+ID4+PiBhYm91dCBVQVBJIGFzIHdlbGwuDQo+ID4+Pg0KPiA+Pg0KPiA+PiBJ
IGxlZnQgc29tZSBjb21tZW50cyBvbiBpbnRlbGxpc21zIGluIHRoZXNlIHBhdGNoZXMuDQo+ID4+
DQo+ID4+IERvIHlvdSBoYXZlIGFueSBzcGVjaWZpY3MgYWJvdXQgeW91ciBjb25jZXJucyBhYm91
dCBVQVBJPw0KPiA+DQo+ID4gWWVhaCwgdGhlIGNvbW1lbnRzIEkgbGVmdCBpbiB0aGUgcGF0Y2hl
czoNCj4gPg0KPiA+IHBhdGNoIDM6DQo+ID4NCj4gPj4gSGF2aW5nIHRvIGV4cGxpY2l0bHkgc3Bl
Y2lhbC1jYXNlIGluZGV4IHplcm8gZmVlbHMgb2RkIHRvIG1lLiBXaHkgZG9lcw0KPiA+PiBpdCBu
ZWVkIGV4cGxpY2l0IHNwZWNpYWwtY2FzaW5nPw0KPiA+Pg0KPiA+PiBUbyBtZSBpdCdzIGEgaGlu
dCB0aGF0IHRoZSBkZWZpbml0aW9ucyBvZiAuc3RhcnQgYW5kIC5lbmQgYXJlIHNvbWVob3cNCj4g
Pj4gaW5jb25zaXN0ZW50Lg0KPiA+DQo+ID4gcGF0Y2ggNCBhbmQgODoNCj4gPg0KPiA+Pj4gK3N0
YXRpYyBib29sIGlzX2hkcl9wbGFuZShjb25zdCBpZ3RfcGxhbmVfdCAqcGxhbmUpDQo+ID4+PiAr
ew0KPiA+Pj4gKwlyZXR1cm4gcGxhbmUtPmluZGV4ID49IDAgJiYgcGxhbmUtPmluZGV4IDwgU0RS
X1BMQU5FX0JBU0U7DQo+ID4+DQo+ID4+IEhvdyBjYW4gdGhpcyBiZSByaWdodCBmb3IgYWxsIEtN
UyBkcml2ZXJzPw0KPiA+Pg0KPiA+PiBXaGF0IGlzIGEgSERSIHBsYW5lPw0KPiA+DQo+ID4gcGF0
Y2ggMTI6DQo+ID4NCj4gPj4+ICtzdHJ1Y3QgZHJtX2NvbG9yX2x1dCAqY29lZmZzX3RvX2xvZ2Fy
aXRobWljX2x1dChkYXRhX3QgKmRhdGEsDQo+ID4+PiArCQkJCQkJY29uc3QgZ2FtbWFfbHV0X3Qg
KmdhbW1hLA0KPiA+Pj4gKwkJCQkJCXVpbnQzMl90IGNvbG9yX2RlcHRoLA0KPiA+Pj4gKwkJCQkJ
CWludCBvZmYpDQo+ID4+PiArew0KPiA+Pj4gKwlzdHJ1Y3QgZHJtX2NvbG9yX2x1dCAqbHV0Ow0K
PiA+Pj4gKwlpbnQgaSwgbHV0X3NpemUgPSBnYW1tYS0+c2l6ZTsNCj4gPj4+ICsJLyogVGhpcyBp
cyB0aGUgbWF4aW11bSB2YWx1ZSBkdWUgdG8gMTYgYml0IHByZWNpc2lvbiBpbiBoYXJkd2FyZS4g
Ki8NCj4gPj4NCj4gPj4gSW4gd2hvc2UgaGFyZHdhcmU/DQo+ID4+DQo+ID4+IEFyZSBpZ3QgdGVz
dHMgbm90IHN1cHBvc2VkIHRvIGJlIGdlbmVyaWMgZm9yIGV2ZXJ5dGhpbmcgdGhhdCBleHBvc2Vz
DQo+ID4+IHRoZSBwYXJ0aWN1bGFyIEtNUyBwcm9wZXJ0aWVzPw0KPiA+Pg0KPiA+PiBUaGlzIGFs
c28gaGludHMgdGhhdCB0aGUgVUFQSSBkZXNpZ24gaXMgbGFja2luZywgYmVjYXVzZSB1c2Vyc3Bh
Y2UNCj4gPj4gbmVlZHMgdG8ga25vdyBoYXJkd2FyZSBzcGVjaWZpYyB0aGluZ3Mgb3V0IG9mIHRo
aW4gYWlyLiBEaXNwbGF5IHNlcnZlcnMNCj4gPj4gYXJlIG5vdCBnb2luZyB0byBoYXZlIGhhcmR3
YXJlLXNwZWNpZmljIGNvZGUuIFRoZXkgc3BlY2lhbGlzZSBiYXNlZCBvbg0KPiA+PiB0aGUgZXhp
c3RlbmNlIG9mIEtNUyBwcm9wZXJ0aWVzIGluc3RlYWQuDQo+ID4NCj4gPiAuLi4NCj4gPg0KPiA+
Pj4gK3ZvaWQgc2V0X2FkdmFuY2VfZ2FtbWEoZGF0YV90ICpkYXRhLCBpZ3RfcGlwZV90ICpwaXBl
LCBlbnVtIGdhbW1hX3R5cGUNCj4gdHlwZSkNCj4gPj4+ICt7DQo+ID4+PiArCWlndF9kaXNwbGF5
X3QgKmRpc3BsYXkgPSAmZGF0YS0+ZGlzcGxheTsNCj4gPj4+ICsJZ2FtbWFfbHV0X3QgKmdhbW1h
X2xvZzsNCj4gPj4+ICsJZHJtTW9kZVByb3BlcnR5UHRyIGdhbW1hX21vZGUgPSBOVUxMOw0KPiA+
Pj4gKwlzZWdtZW50X2RhdGFfdCAqc2VnbWVudF9pbmZvID0gTlVMTDsNCj4gPj4+ICsJc3RydWN0
IGRybV9jb2xvcl9sdXQgKmx1dCA9IE5VTEw7DQo+ID4+PiArCWludCBsdXRfc2l6ZSA9IDA7DQo+
ID4+PiArDQo+ID4+PiArCWRybVNldENsaWVudENhcChkYXRhLT5kcm1fZmQsIERSTV9DTElFTlRf
Q0FQX0FEVkFOQ0VfR0FNTUFfTU9ERVMsIDEpOw0KPiA+Pg0KPiA+PiBJcyB0aGlzIGhvdyB3ZSBh
cmUgZ29pbmcgdG8gZG8gY3Jvc3Mtc29mdHdhcmUgRFJNLW1hc3RlciBoYW5kLW92ZXIgb3INCj4g
Pj4gc3dpdGNoaW5nIGNvbXBhdGliaWxpdHkgaW4gZ2VuZXJhbD8NCj4gPj4NCj4gPj4gQWRkIGEg
bmV3IGNsaWVudCBjYXAgZm9yIGV2ZXJ5IG5ldyBLTVMgcHJvcGVydHksIGFuZCBpZiB0aGUgS01T
IGNsaWVudA0KPiA+PiBkb2VzIG5vdCBzZXQgdGhlIHByb3BlcnR5LCB0aGUga2VybmVsIHdpbGwg
bWFnaWNhbGx5IHJlc2V0IGl0IHRvIGVuc3VyZQ0KPiA+PiB0aGUgY2xpZW50J3MgZXhwZWN0YXRp
b25zIGFyZSBtZXQ/IElzIHRoYXQgaG93IGl0IHdvcmtzPw0KPiA+Pg0KPiA+PiBPciB3aHkgZG9l
cyB0aGlzIGV4aXN0Pw0KPiA+DQo+ID4gLi4uDQo+ID4NCj4gPj4+ICsJZHJtU2V0Q2xpZW50Q2Fw
KGRhdGEtPmRybV9mZCwgRFJNX0NMSUVOVF9DQVBfQURWQU5DRV9HQU1NQV9NT0RFUywgMCk7DQo+
ID4+DQo+ID4+IEkndmUgbmV2ZXIgc2VlbiB0aGlzIGRvbmUgYmVmb3JlLiBJIGRpZCBub3Qga25v
dyBjbGllbnQgY2FwcyBjb3VsZCBiZQ0KPiA+PiByZXNldC4NCj4gPg0KPiA+DQo+ID4gU28sIHBh
dGNoIDEyIGhhcyB0aGUgYmlnZ2VzdCBVQVBJIHF1ZXN0aW9ucywgYW5kIHBhdGNoIDMgbWF5IG5l
ZWQgYQ0KPiA+IFVBUEkgY2hhbmdlIGFzIHdlbGwuIFRoZSBjb21tZW50cyBpbiBwYXRjaGVzIDQg
YW5kIDggY291bGQgYmUgYWRkcmVzc2VkDQo+ID4gd2l0aCBqdXN0IHJlbW92aW5nIHRoYXQgY29k
ZSBzaW5jZSB0aGUgY29uY2VwdCBvZiBIRFIvU0RSIHBsYW5lcyBkb2VzDQo+ID4gbm90IGV4aXN0
IGluIFVBUEkuIE9yLCBpZiB0aGF0IGNvbmNlcHQgaXMgbmVlZGVkIHRoZW4gaXQncyBhbm90aGVy
IFVBUEkNCj4gPiBwcm9ibGVtLg0KPiA+DQo+IA0KPiBUaGFua3MgZm9yIHJlaXRlcmF0aW5nIHlv
dXIgcG9pbnRzLiBJIG1pc3NlZCB5b3VyIGVhcmxpZXIgcmVwbGllcyBhbmQNCj4gZm91bmQgdGhl
bSBpbiBteSBJR1QgZm9sZGVyIGp1c3Qgbm93Lg0KPiANCj4gTG9va3MgbGlrZSB3ZSdyZSBvbiB0
aGUgc2FtZSBwYWdlLg0KDQpUaGFua3MgUGVra2EgJiBIYXJyeSBmb3IgdGhlIHJldmlldy4gQXBv
bG9naWVzIGZvciBsYXRlIHJlc3BvbnNlLiBJIHRob3VnaHQNCnRoYXQgZXZlcnlvbmUgaXMgaW4g
aG9saWRheXMg8J+Yii4gTm93IEkgYW0gcmUtaWduaXRpbmcgdGhpcyBkaXNjdXNzaW9uLg0KDQpJ
IGhhdmUgZ29uZSB0aHJvdWdoIGFsbCByZXZpZXcgY29tbWVudHMgYW5kIGl0J3MgbWFrZSBzZW5z
ZSB0byByZW1vdmUgaGFyZHdhcmUNCnNwZWNpZmljIHN0dWZmIGZyb20gdGhlIGhlbHBlciBmdW5j
dGlvbnMuDQoNClBhdGNoIDM6DQpJbnRlbCBoYXJkd2FyZSBpcyBleHBlY3RpbmcgZmlyc3QgTFVU
IHZhbHVlIGFzIDAsIHN0aWxsIHdlIGNhbiByZW1vdmUgdGhpcyBsb2dpYw0KZnJvbSBoZWxwZXIg
JiBoYW5kbGUgaW4gdGhlIHN1YnRlc3QuDQoNClBhdGNoIDQgJiA4Og0KSW4gdGhpcyBjb250ZXh0
LCBmb3IgeW91IEhEUiAmIFNEUiBwbGFuZSBzdHVmZiBpcyBqdXN0IGEgbWF0dGVyIG9mIHBsYW5l
IGluZGV4Lg0KV2UgYXJlIGV4cGVjdGluZyB0byBydW4gdGVzdHMgb24gb25lIEhEUiBwbGFuZSAo
aW5kZXggMC0zKSAmIG9uZSBTRFIgcGxhbmUNCihpbmRleCAzLTYpLiBJIHRoaW5rIHdlIGNhbiB1
cGRhdGUgdGhlIGxvZ2ljIHRvIHJ1biB0ZXN0cyBvbiBmaXJzdCAmIGxhc3QgcGxhbmUuDQpJZiB5
b3Ugd2FudCB0byBydW4gb24gdGVzdHMgb24gYWxsIHBsYW5lcyB3ZSBuZWVkIHRvIHBhc3MgYW4g
ZXh0cmEgYXJndW1lbnQgdGhyb3VnaA0KY29tbWFuZCBsaW5lLiBQbGVhc2UgcmVmZXIgdGVzdHMv
a21zX2ZsaXAuYyBmb3Igc2ltaWxhciBpbXBsZW1lbnRhdGlvbi4NCg0KUGF0Y2ggMTI6DQpJdCBz
ZWVtcyB0aGVyZSBpcyBzb21lIGNvbmZ1c2lvbiB3aXRoIHRoZSBJR1QgY29tbWVudHMgJiB2YXJp
YWJsZSBuYW1lcywgSSdsbA0KcmVmYWN0b3IgdGhlIGxvZ2ljICYgdXBsb2FkIGEgbmV3IHJldi4N
Cg0KLSBCaGFudQ0KDQo+IA0KPiBIYXJyeQ0KPiANCj4gPg0KPiA+IFRoYW5rcywNCj4gPiBwcQ0K
PiA+DQoNCg==
