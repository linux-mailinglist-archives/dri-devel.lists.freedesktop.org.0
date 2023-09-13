Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141B579DFC7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 08:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5390410E3D7;
	Wed, 13 Sep 2023 06:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB8D10E314;
 Wed, 13 Sep 2023 06:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694585663; x=1726121663;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w4DF5/LtHADyuF6r2weChluGpVW3fzmKM2JhxiX05kA=;
 b=b0kJTthUrR3Dh2RpfLyT/JEClO4NKNeyGMGrbmOP+BO85QTQvlJzZXKO
 Rcbqb10qbbyGg9Cv83SSXey0Lj9tt8ceTIYlfg2OOSzZavnkix4dbWPSe
 QW0lJfTQP5oT6J5jHpohovc/0AcpVNmkazfWmtlgN9S2/NCoMbBWH6zl3
 VZKOJJ98UdfVjZxPwLaN+XfSpIYJCH8S4DfsUOfKFqZj0eaLqs4uoSyNd
 oeoEyS2pA9oUMqCSuKDhAo54jtYA72MB5JBYRlQ/UKPtmReb/lKoJcHFO
 2Tso9FY3cN1sOBbzqHtreCauy0y2sa/0nd7L0iACMG06efq+ObbXPjoRu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="381272922"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="381272922"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 23:14:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="1074833367"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="1074833367"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 23:14:22 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 23:14:22 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 23:14:22 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 23:14:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arej26YZeoQJr8zNVsmQYfxUj8q4b1ST6L1tGmQaVS1Zsx8eBZSa9M8JqE8erUZaHklRNstEYglQbFILLfPViN/WXkAsL905OcWAbu4BUI3EKugJTxmXtZ6j30k2zclLVPzMeBKUP/3Jf+NJHYljHLeYZcnUu1SqTFkd+efljp+HDgwS9DITMGxuQQ/K/d8027fhvQMy+bdNt21rhnHCK2I93Z5GW3Ssosix7UYQaXxyAbbbrGYE9yKQA/4x3CvDHGYBUAS1W445+bv2uVJRhPmrL/hHmQYGP1bp3nukEmNiQjIYn0dHJ2d6p25++Unr1bG7USO8EZOnaFrJVG91pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4DF5/LtHADyuF6r2weChluGpVW3fzmKM2JhxiX05kA=;
 b=NAGxGUtQKWI/43o053kJkLVhsfyfZ7JCQMAvFzjqgm3ZgcfaQkmT5zFU+jqHAt9OiCS3ScgEmkuhUzTjHjwFbE5Zq0psYnMtIRNIoNync5Nq26VAKnYXtXEWGhR8/I6QN5vUwDtnP8rO39i2+cmtbMQBK8J/lzgIFI1g632sSypLO/mIC1neb2IOrIkQ2ja4ee8bXrE9Zdu+iYZH0D1tu3pYDILbnWir4dRPmBjcmgZWwHni8qMC6+x3USYI9nDCuLV0AGPZ25WTYJhbjnVSBFV6v0OGjD6EbkQlvfQHH9H5HYKUKJl1pQhdGcm2uotV/ZNDyoSt3h0rPfB8d610BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CH3PR11MB7390.namprd11.prod.outlook.com (2603:10b6:610:14e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Wed, 13 Sep
 2023 06:14:20 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::88b:6fa5:dca0:2419]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::88b:6fa5:dca0:2419%7]) with mapi id 15.20.6745.035; Wed, 13 Sep 2023
 06:14:20 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/8] drm/display/dp: Add helper function to get DSC bpp
 prescision
Thread-Topic: [PATCH 1/8] drm/display/dp: Add helper function to get DSC bpp
 prescision
Thread-Index: AQHZ5gklqUlKT5yewEWQ+PxHD6XYybAYRnOQ
Date: Wed, 13 Sep 2023 06:14:19 +0000
Message-ID: <SN7PR11MB6750887CCB89F8622AFB7011E3F0A@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20230913060606.1105349-1-mitulkumar.ajitkumar.golani@intel.com>
 <20230913060606.1105349-2-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20230913060606.1105349-2-mitulkumar.ajitkumar.golani@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CH3PR11MB7390:EE_
x-ms-office365-filtering-correlation-id: d294f5bb-436d-441f-3d19-08dbb420aaae
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bjtMj+jpTDyf4Zrrjqby+ipwx4VeRBsRJIvvnjOSv3lZOvkT+Acq9TAChwUK4NsS9iLcD2gtcBQSmYbQFqW2Cv0I34+W2zMeJ/sk1g4vlSbnz9fRhbT+MkmZ0rFd9lJ3/KJuBmIfhbO+zXjHUIKjboq0XSGDgF9wiBrWvN2TRPS1kpSJZZGI9Jo0L3Tg26dvfqlVyO6OIjNNqd9f14ntxQgI+bZEa7Wb630ye9g6bXczQ9DoZXK41f5oSY6fQdy2A8OayCwBIBPa0PpHp07XIQefmZ5/G0xBLQIl+VduFcnQacSzW9KCkv6FpzC5OCTI8NCQYksYt7NoB/DqL4X3K/POZ2ia4Jt1N2GLgovUYAZn3a4vqMLiir40OCY//Usuw4BRXuG4mMKmZoazpzVAMVgYuRwJtazJEMfzeKYrvxfO8T9IwnEf9yOULSZV8UCAzx/znrhzZT1hWTMq3Rbmx27tTMvIYK/ehyA+m2/WPFAz0QhydqA3R8rd1y6KGIkaqh3d0FNjiR6TpESgbxtkuls0ifAVRN+PcJOa051OzyyCT2UL+t2fg+o8TclkRUJ49bzDnwLeqObBHRw468IXxkXlAp9VgP4AFOA5CYZG9KtrNvxWPtDDdk3Ul5Z9/obU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(396003)(376002)(186009)(451199024)(1800799009)(33656002)(8676002)(4326008)(55016003)(8936002)(52536014)(26005)(6506007)(7696005)(71200400001)(82960400001)(5660300002)(122000001)(450100002)(38070700005)(38100700002)(86362001)(2906002)(41300700001)(76116006)(66476007)(9686003)(110136005)(107886003)(54906003)(64756008)(66556008)(316002)(478600001)(66446008)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEpYSElOY09ES2wrV20xSFN6M1FRelEwM2NJRmhmSzJFODVQaVZXVUVaeTN5?=
 =?utf-8?B?eS9JU3ZwOWFmL0k1VEdvb0RsMEdrRjFjbzVQUmM0cDdSTFdZK2dXc1NPOHRD?=
 =?utf-8?B?eW5ROVR5bnZJcUEzbmQrcVpLUS8rd0lLSFNLeFZnVlNzUUdOSTc4TXc4dDdk?=
 =?utf-8?B?WGVnZHQ0WHJnMkdxcVBEQ1M1ZVVUNkV2eldHaGJIU2daTFVsaEpGWVhuTnlz?=
 =?utf-8?B?NmhoN2JWZGFxQmpTMVRUMm9ES3g0bk9mSU1UZGI1cmtSMUliT2gwa2lPcnNI?=
 =?utf-8?B?dFdDYWg0a2dXOWlJM1RJT0RqSW1uT1dWZ3Z0Mm84RnVxbWozS0FzRWlaaFJF?=
 =?utf-8?B?V2NJNGZLRkFRWmJsaTFlb0Nib2pCNzNoVEl2TU9WZlVNTFdCTzVFRll6b2Nu?=
 =?utf-8?B?aEU2VEhUY2RveW95Vkc3aUxnd201YkcrY3ZFb0YvM1VMNXBrU0dOZk5Ddmx3?=
 =?utf-8?B?aTJLemJHb0QwUnU1U3IxMVBpVmcxb2czeWtudHVvU2ExQ3NKZm9DWDdrcjc5?=
 =?utf-8?B?ek5oMTdpSlVSNC95aXpBd1BvRVBUaFN0Qk9oeHdsTFNUWlBrUXN0a3R1M3VL?=
 =?utf-8?B?WHBNYy83SWFuVExKdnpJS21WbllyTytpUG9yYVRBa2d5cmtzWFAxYXg1Nzc4?=
 =?utf-8?B?UGkxOGJNbEs2cVp5S280M2haQWczWWxzZUtyVjhGd1NmNnFERE1URE1NNngv?=
 =?utf-8?B?bjU2WjdCSTFmM3MyckpjV0dtbHFGcXk4bForajN3bWZSbXBITTdZTGFWY2ZR?=
 =?utf-8?B?Z3pMazRDeEFEdDdELzNlbzlXR0x1WWpxUW8xZkVmdUpWS20vZjJ4eGtmWm1E?=
 =?utf-8?B?Q2QxbWVuTTA4QjJiU21nLzR1UGN3V3RIb0NHVmlCdG1DcG9hZURpbkF2UFh3?=
 =?utf-8?B?K0VGYkRxN2hrYnkzN2w1SlJDZ1puc0ZrSWkyU3A5dXpxL1U4b1RnREtJR1Bw?=
 =?utf-8?B?dDAzcG83eFFScGlnb1o1SzUzRU93SXV4VVhhWEc1OHdGOFFodjl1QkpmOWtH?=
 =?utf-8?B?cEdFa1BrblpFYlMwak5OZ2s4VHpOY0dlQkVqVW0wbU5nUkljNVdqTDZWbFVk?=
 =?utf-8?B?dkdwbGxpNksrRFVqbDgrZEVWY3d6NVliQUZ4Y25lQTRrV0xSa0loZ3VqK3li?=
 =?utf-8?B?eEVxZjBaSUZES3k5bm1HbmpvQXcyWnZlbGVYeTlwT3phUW9HUzQwTFNGai8x?=
 =?utf-8?B?djRZT3QzZ0Z3cHNIdXhoYXBxbERkNTZrWmM5aXZxTTI4Q213d1ZWL2QxdDJE?=
 =?utf-8?B?YzF0eTNkeVVUUG5BRFB3TXdBck9qS0VMdjkrdGNVMnpPQ3hqcTJBODdNbVpD?=
 =?utf-8?B?WTRmRGtia1ZCNGJJYW11cm9RR2NJb3JvYWVaSWtoL0t4UmQwbUJnT0hGcTEr?=
 =?utf-8?B?V2JST1NGamEvbWM2eGZ2RzFCb0swY1Q5R3hzYjRtMitGNzI4bXcvajBkRmdE?=
 =?utf-8?B?SVgzVmlKSWNyTnNEdmF6cWh1eWQzemtUNU9GUk00QURFOHhWUlI5L1FycjNB?=
 =?utf-8?B?ZjY1S2hVWGRkRDZNVVJrQUVjOXpXUHNhL1RmQkVTUHBrM010di80MnBXOVQz?=
 =?utf-8?B?OE9Rd2IzY2tSR3Y5eVVNSjkxc2Q1d3MzbDFuNVljTncyZG5YUmxFc2lVZXJX?=
 =?utf-8?B?N0lYV3BPclFZRlE5SWkzZXhKVndqT3JTVUxZeldjc0JnN1pwTHBuZm9YZ2Vs?=
 =?utf-8?B?ME5RV2lSeHJxSVhaNTc4bWpFZkZXendNWkZZeHpmRGtKK1dCcU51MFB2dHJs?=
 =?utf-8?B?QW1KRGlkSjhIT3ByYU9GRXdCS25ybFExY1l2Q0dsWEVIYnRFeGVqZUZTSytO?=
 =?utf-8?B?RW1QQlJGQWd1S1FoYlRKZ01BbWtRZUlEQ2tsUGNzek8zZmlGUTBnSXlBcHhT?=
 =?utf-8?B?MGVaRFFSZ2gzc2R3ZTZLNG5UQ0J1d1NyZytRanRSbU92RnhYR0lSMitQR00x?=
 =?utf-8?B?dUc1NWlvdVRtYU9OMkhjQzNHSjl3bmlYNi9Vd0FzRXBVUmtHSk1XWjkyU1VI?=
 =?utf-8?B?czkrM1p0cm5qVHkyQXQ4ZDBIWlVJaXNpWmp4YTFmTUtrdGdHbTVNRUU5K0FM?=
 =?utf-8?B?ZC9paGoydzF4OGlCOTRtNkxydEVaUkMrT1FtOVpOYlBSM0dhNHcrdjhYcVAz?=
 =?utf-8?Q?bJSmOdN1s90fpQ3QO93TjQ2hj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d294f5bb-436d-441f-3d19-08dbb420aaae
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2023 06:14:19.8076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qGiZ9BNAiEA8+urjP2JppwmYAcqMqsTijfJDFTG6HNM1dBSVgj+gd2T5J9ToKM52B4YyFRbrpZW5KSjbw5onQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7390
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBTdWJqZWN0OiBbUEFUQ0ggMS84XSBkcm0vZGlzcGxheS9kcDogQWRkIGhlbHBlciBmdW5jdGlv
biB0byBnZXQgRFNDIGJwcA0KPiBwcmVzY2lzaW9uDQo+IA0KPiBGcm9tOiBBbmtpdCBOYXV0aXlh
bCA8YW5raXQuay5uYXV0aXlhbEBpbnRlbC5jb20+DQo+IA0KPiBBZGQgaGVscGVyIHRvIGdldCB0
aGUgRFNDIGJpdHNfcGVyX3BpeGVsIHByZWNpc2lvbiBmb3IgdGhlIERQIHNpbmsuDQo+IA0KDQpJ
IHRoaW5rIHlvdSBmb3Jnb3QgdG8gYWRkIG15IHJldmlld2VkIGJ5IHRoYXQgSSBnYXZlIGluIHRo
ZSBsYXN0IHJldmlzaW9uIPCfmJ0NCkFueXdheXMsDQoNCkxHVE0uDQoNClJldmlld2VkLWJ5OiBT
dXJhaiBLYW5kcGFsIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCg0KPiBTaWduZWQtb2ZmLWJ5
OiBBbmtpdCBOYXV0aXlhbCA8YW5raXQuay5uYXV0aXlhbEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX2hlbHBlci5jIHwgMjcgKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPiAgaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHBfaGVscGVyLmggICAg
IHwgIDEgKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX2hlbHBlci5jDQo+IGIvZHJp
dmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX2hlbHBlci5jDQo+IGluZGV4IDhhMWI2NGM1N2Rm
ZC4uNWMyM2Q1YjhmYzUwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9k
cm1fZHBfaGVscGVyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX2hl
bHBlci5jDQo+IEBAIC0yMzIzLDYgKzIzMjMsMzMgQEAgaW50IGRybV9kcF9yZWFkX2Rlc2Moc3Ry
dWN0IGRybV9kcF9hdXggKmF1eCwNCj4gc3RydWN0IGRybV9kcF9kZXNjICpkZXNjLCAgfSAgRVhQ
T1JUX1NZTUJPTChkcm1fZHBfcmVhZF9kZXNjKTsNCj4gDQo+ICsvKioNCj4gKyAqIGRybV9kcF9k
c2Nfc2lua19icHBfaW5jcigpIC0gR2V0IGJpdHMgcGVyIHBpeGVsIGluY3JlbWVudA0KPiArICog
QGRzY19kcGNkOiBEU0MgY2FwYWJpbGl0aWVzIGZyb20gRFBDRA0KPiArICoNCj4gKyAqIFJldHVy
bnMgdGhlIGJwcCBwcmVjaXNpb24gc3VwcG9ydGVkIGJ5IHRoZSBEUCBzaW5rLg0KPiArICovDQo+
ICt1OCBkcm1fZHBfZHNjX3NpbmtfYnBwX2luY3IoY29uc3QgdTgNCj4gK2RzY19kcGNkW0RQX0RT
Q19SRUNFSVZFUl9DQVBfU0laRV0pDQo+ICt7DQo+ICsJdTggYnBwX2luY3JlbWVudF9kcGNkID0g
ZHNjX2RwY2RbRFBfRFNDX0JJVFNfUEVSX1BJWEVMX0lOQyAtDQo+ICtEUF9EU0NfU1VQUE9SVF07
DQo+ICsNCj4gKwlzd2l0Y2ggKGJwcF9pbmNyZW1lbnRfZHBjZCkgew0KPiArCWNhc2UgRFBfRFND
X0JJVFNfUEVSX1BJWEVMXzFfMTY6DQo+ICsJCXJldHVybiAxNjsNCj4gKwljYXNlIERQX0RTQ19C
SVRTX1BFUl9QSVhFTF8xXzg6DQo+ICsJCXJldHVybiA4Ow0KPiArCWNhc2UgRFBfRFNDX0JJVFNf
UEVSX1BJWEVMXzFfNDoNCj4gKwkJcmV0dXJuIDQ7DQo+ICsJY2FzZSBEUF9EU0NfQklUU19QRVJf
UElYRUxfMV8yOg0KPiArCQlyZXR1cm4gMjsNCj4gKwljYXNlIERQX0RTQ19CSVRTX1BFUl9QSVhF
TF8xXzE6DQo+ICsJCXJldHVybiAxOw0KPiArCX0NCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0K
PiArRVhQT1JUX1NZTUJPTChkcm1fZHBfZHNjX3NpbmtfYnBwX2luY3IpOw0KPiArDQo+ICAvKioN
Cj4gICAqIGRybV9kcF9kc2Nfc2lua19tYXhfc2xpY2VfY291bnQoKSAtIEdldCB0aGUgbWF4IHNs
aWNlIGNvdW50DQo+ICAgKiBzdXBwb3J0ZWQgYnkgdGhlIERTQyBzaW5rLg0KPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHBfaGVscGVyLmgNCj4gYi9pbmNsdWRlL2RybS9k
aXNwbGF5L2RybV9kcF9oZWxwZXIuaA0KPiBpbmRleCAzMzY5MTA0ZTJkMjUuLjY5NjhkNGQ4Nzkz
MSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHBfaGVscGVyLmgNCj4g
KysrIGIvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHBfaGVscGVyLmgNCj4gQEAgLTE2NCw2ICsx
NjQsNyBAQCBkcm1fZHBfaXNfYnJhbmNoKGNvbnN0IHU4DQo+IGRwY2RbRFBfUkVDRUlWRVJfQ0FQ
X1NJWkVdKSAgfQ0KPiANCj4gIC8qIERQL2VEUCBEU0Mgc3VwcG9ydCAqLw0KPiArdTggZHJtX2Rw
X2RzY19zaW5rX2JwcF9pbmNyKGNvbnN0IHU4DQo+ICtkc2NfZHBjZFtEUF9EU0NfUkVDRUlWRVJf
Q0FQX1NJWkVdKTsNCj4gIHU4IGRybV9kcF9kc2Nfc2lua19tYXhfc2xpY2VfY291bnQoY29uc3Qg
dTgNCj4gZHNjX2RwY2RbRFBfRFNDX1JFQ0VJVkVSX0NBUF9TSVpFXSwNCj4gIAkJCQkgICBib29s
IGlzX2VkcCk7DQo+ICB1OCBkcm1fZHBfZHNjX3NpbmtfbGluZV9idWZfZGVwdGgoY29uc3QgdTgN
Cj4gZHNjX2RwY2RbRFBfRFNDX1JFQ0VJVkVSX0NBUF9TSVpFXSk7DQo+IC0tDQo+IDIuMjUuMQ0K
DQo=
