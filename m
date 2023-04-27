Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102B26F0A64
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 19:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D711D10E2B1;
	Thu, 27 Apr 2023 17:00:15 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A7810EBC7;
 Thu, 27 Apr 2023 17:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682614813; x=1714150813;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=nbwD0lGsy5sNNYSuWAKPnjHCygvfKkamt41xm5t55lo=;
 b=bLssg4GYFJCWY5FXQriBTdILJcbX6GYPMDpwhhTh8zFkpUO60oxWadxP
 W7RN3bCc8uSfLC66P0zCbyJ35QvVlvXqQB+sqwEwJU3YqIgHkKfD2CspX
 nWuhJ0lICdd0DqjWYHukBAKYpXRl9bSrYbO9rcCm1kK6OsCYiV3UKkL2T
 w3frvFoF3YXONvTsSrLlH7SSR9/KtgFXYJvMgB/o9+RM5VVwbSpiNLSsc
 duQhjj0eoo0xBTVYvnbZJJNEtTT0to+oNmKQAxaWKNrBhj5iqm8QDlK2P
 xcz52lMm1qLaVso3f4noy+5+I4wIEF0w+9dsRvLQFKSrhRJYzoU3TlHc6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="344951806"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="344951806"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 10:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="783829165"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="783829165"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Apr 2023 10:00:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 10:00:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 27 Apr 2023 10:00:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 27 Apr 2023 10:00:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mX0upCP61V6U6FkcfzJ/wGqUHrXI8TwjCFv88Umt8CEdanYjhIdxZIDUaZM9Zja3UQPEn5mCv550418pwulG29jojqBqNyv7A3JWHmFPYzcQCraSRl+72He5/ZkwNCuFFTGzTeNq6IjGQa67ixTLtxChUwkMRz3U4QKIy37Gy1h+kOegMKai1C6LMQYvmj5PfIxyf0gHVST5NlcC+hYmx9szUFBWVeqLxgC/SEkM8IGEhxUyqpXlbBr2CTrGEP+6ypPBHJ9tu3KgIHYHYgoDzfH8iVKSA+Z8LaiZLQjox9KWgNeu2iLo0tcVZ4bJ+fI6V0mOTWpcwoYAe51tLyUgyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbwD0lGsy5sNNYSuWAKPnjHCygvfKkamt41xm5t55lo=;
 b=oJNCpZcd/F8ya3jSLAJZ5nGzOk9G4E+OHQSn/z1PbfsQbG+QEjVsVBw7QJ3U1xW4KbMKZLfIFTbzIxTU5HHBf/r8aA15RKE3OrdWlVZQgQGfvXDtjJTuOaFpxy4CHrR/eEkxhYldckst/QNIRb8IgHuIddkzoCKEj2bCucUp6ZO3ReFQZcw5m946HFdlN6gbjjDv8Yy9YYylAbJAeo64d1sbKVIrpaWppbDJVJiVucxmA+7paE3ks/dqdGDWhl41dN1QCH01UYImEt1axNe7qL0cduLwhB/76etTQltUqaIlTxUK4L1RMJnX0ChuubSVQ3JLTFcn+PVFNlTZnEGzgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.22; Thu, 27 Apr 2023 17:00:08 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%6]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 17:00:08 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Fix error capture for virtual
 engines
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/guc: Fix error capture for virtual
 engines
Thread-Index: AQHZbzEXIqvxmaJ1pkOhO/YKjsE6868/dQwA
Date: Thu, 27 Apr 2023 17:00:08 +0000
Message-ID: <174d334438e887a3a80f6442184cf2f51f8e6c83.camel@intel.com>
References: <20230415002710.3971019-1-John.C.Harrison@Intel.com>
In-Reply-To: <20230415002710.3971019-1-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH0PR11MB7424:EE_
x-ms-office365-filtering-correlation-id: 138c278b-08de-4e81-8b18-08db4740db07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /1FE6CpLGtP6AQOVDepEzniR4wg/UBvmcbJJP+4IVGVPaZIMeluxTIPh9mBwiqPkW9BVmonz+RgeXRJwnHVWKfDWNusSLaHl1LkLigR7m8cnT2hLf/cicZUNlMqIreURysIMGRe1KIvrQtO9nQ1Vy+ZQkSX0D9y/sDPHi8P1a8LRApEmk2PYecFDR7rXrFLINHgP2ptnvzuzJUUO6g5EAjaqqCfs53JdfUx1qu744SUz6KHJu1WmM9ejh+OSsqi2N4Tnrjta0z0r79SivXBMnBOLhej2IM5HYdxVi+EwTqo3tJklUeMpR5MFYC1kIPmcmOXLQwKufMvAOv5y64InQKYll6syyT4DBiT60n/bHtWLyjE3kcIeEvytM0T1bLCApGpeZ2GJZENV88DkPvh3+ggAKlRinOuriEafmYlEZzt6yAmm+wDuNxRXDjdSXKzlxIRJ27Xz6aU5s2+f2BAz4NImB+6cwdP5yLSHwV13rm3otdfcCbNWBCJUKVqD4AIRAbw5n2DKhpxxVjuPAxAORYSUGuPtZMQdxaDCuN1Wokm/S6lKGTDdNv06kX4O95PCL1OsW84vo9fv4ofwh1DDFZ22NF8cxiDuMYm4OIyVlEw7YL+lfg/ZIqByVQ8a6Xzi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199021)(8936002)(8676002)(38100700002)(316002)(478600001)(450100002)(41300700001)(82960400001)(122000001)(110136005)(2906002)(38070700005)(6486002)(71200400001)(86362001)(66446008)(64756008)(66476007)(83380400001)(66556008)(91956017)(66946007)(76116006)(5660300002)(4326008)(26005)(2616005)(6512007)(6506007)(36756003)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHFtUEM0bDduTVlJZTFJTnRRNE5DRHBQSnhKVkNPZDQ5M2R4UVNvR3JjMjRx?=
 =?utf-8?B?Mm9PalJoNzNxWDlLenNGcmczUjFITDFJMjNOSUx3UFVFWU5tbGxwRmVLSWkr?=
 =?utf-8?B?YVk2OHNvc3hXUmlsUHM0T1kzV1Z1Tm5mUXNVamMvYUFNMFRoUDBUeEExVG12?=
 =?utf-8?B?aFhvQjY5S2JaOXVKWWNwcTlOdEZCWGd1RmxSUHc3YUxFSEpveDF1bE5wWml0?=
 =?utf-8?B?N0ZiUVZ1OC95eFI5OUdsSENXM0Q3aVFWemkvdWRTMDBJcWg4bUdZUDkrV1Jj?=
 =?utf-8?B?UCtVd1lydFhLajdPTkFXWllwZzh6UlFXQXRoQ1N5Mkg1eE42Nk1pL0JRMitZ?=
 =?utf-8?B?d3lnWWpsVnl2M09qYlcxT29pWjBzYjhLQUpZMS9CVzNBUG1BME9SdENZQk5v?=
 =?utf-8?B?UXFoMlRCR0dBckZ6dm5CaXl6b2Y5cVBKa2FrVXUwNFZacGZyQU1ic2RreUx5?=
 =?utf-8?B?OEhIYVVjcC9Zcm9BZmczTWYxb0g0aTB5WWw4YW93TW8rQWNYT3pXOEVaVWFi?=
 =?utf-8?B?anJWZ3VjbGlTWjJDQ3RubnFzNkNUSHFKeTNKejJ2akFmK2FJd1l5T3VVWTZa?=
 =?utf-8?B?b095c3h2UjgxcC93OTdHVGpiRE9WdzJqT3h5SFFGMlZPeGRubjZjSUVRN1N1?=
 =?utf-8?B?aG5ZbFFxR2VQN0ZGbXEzeGptYUhROW10TDF6elhMMHdsdEhhOUNSMDFzOVh3?=
 =?utf-8?B?SXUxc3EvcmtWQ1YvZTViY2V0cDZmK2ZZT3NqWjlZanZMWS9KZEpDTnRjYVBm?=
 =?utf-8?B?eXJDZHh4SXJPRmxtM1FLWEs1MVZ4dVpKcUdFS0ttbW1kVGc2SmV5ZnoxUnN2?=
 =?utf-8?B?c0FOL3FGaGJMa0dISXZwT3VJajN2OE9LN1NwNlZWWlRFSkNHd29NVTU0RWRO?=
 =?utf-8?B?NWlLS1VqR2xMdkd3cVdvUmRBVGtFSmJkMmpDcjVrZjQwUHBsYUVEODBiMnpB?=
 =?utf-8?B?M1Z4bGYxZEVtNDVpQ3l2aU5UWXVOalUrTHlZaFFGeU1zOEhmdDZMREVLL0dw?=
 =?utf-8?B?eHEvcFpjR21BTWY4ZTZFMEtNNGthSUJNSktpVFlhbWQ4WnBZaDJtT0N4SlFC?=
 =?utf-8?B?MWR2TVhCNUlHU2w0UkloYTROUTJsbWd3NXF6bkVCWDJZejZoRXNUdVpWeHVJ?=
 =?utf-8?B?aDBzVHVaWTYrV2ZrZ0h0Qk9wZ011ZjhRbi9qUjUzajd0dTRyaU1jYXFDQU1C?=
 =?utf-8?B?ZW9CZHY3UUZrMlJ2ZjJDM2tueWNhTnI3YVp6UlZ3UjB1N1JXZ2JTcVRZamds?=
 =?utf-8?B?b2U0aG85QjAvSExpbDZ6NjBIMmhMZ050ZkZKREx0cU16VVdOUXp1Tkg5b2k4?=
 =?utf-8?B?dVF4c1NOQjVqZkF4dTdZZVYraFNQdUxsVnExbk03SW5qMWZOd3lFanBnNUdC?=
 =?utf-8?B?ZHpKek5nVlRWTzBiT0syTWhDdE5aTmJKS3NseW5NeEZvcmM1aVowaVlpSktE?=
 =?utf-8?B?UjJvL3JFemxHN2YydFZtTVVidXZ3VWRDYUFyRlcxcE5nMmJreFpBZ0pDMEIx?=
 =?utf-8?B?VTIzTGh5K3hSalRaMWNUWHRMNnErdE5jTlQ3WWh0bkhyV2JZL2tWTlpQWVo4?=
 =?utf-8?B?U3pIOVN3eTlaajNtRDRJU0lCb1pnZjE1Yk1MVW53SHlJTE04YUdzKy9mQkYz?=
 =?utf-8?B?S1lOUHlqM05Kc3ZFT2Z2VkRFRVMyN1JaMVNETlRrb3FOQzdEQklRMm5MRUJ1?=
 =?utf-8?B?QWc0Q3daVHFvNEhNQ0p2TkU0TnkwTUhsWlF6U3pEMFR3S0g1eVhkWXUrbGd2?=
 =?utf-8?B?Um1xZlhYTThzK1JpZGlVWTN3emF0bXkwNXc3cjM4bE1iRXk3RmZTLytHOXl0?=
 =?utf-8?B?d2NpTEI2a3ExRTF6MGtNendScldxMHBvZnE4SUhCMXJ5bDFrMys5dFZHZW1x?=
 =?utf-8?B?dTVRUlJYMHVDNDd2ZVd6blJGUUdBYUY1RGsyODgyMitMREZrcW1jM1YyM2w0?=
 =?utf-8?B?V0s2OFg5UDNrRUVPUnlLSzVLdGpaek5vOU8zVkwvdkw2RnFFUFg1Wnh1bnll?=
 =?utf-8?B?dDFQTE1qcmRVUmp5Qzk2MW1jS2FuVWRwaEtCdThXejlTbWNiNkVIVmx2WVpp?=
 =?utf-8?B?aDJjeVlDZ05VZ0xkS1Rjb0FPRmZBaVhkNGltbWs0K2t3My9JeWY5R0pCUXBO?=
 =?utf-8?B?aGtuTjEzZWd1NEg4dVVBMCs4YkdFQUhHdGZpbElqcHh2ZGdUeVZZZGh5VXZW?=
 =?utf-8?Q?CbfrRSIv6uRyixKiQSvlPEk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C82B717B14F464DA18F4DFE34402F48@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 138c278b-08de-4e81-8b18-08db4740db07
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2023 17:00:08.1116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EtkzXXUaGmRpgot5iz9TG3ZyRcCsWZ3AINx0FLu5ZYsC3XTdzSZfTmYfG3Q3ZWHfuM+eTORE4SIxGu+F+c4/ajjqiP10O/6KJnTtgtrMXR/BSiZwQLvRZn3sIrdoAhVD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7424
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
Cc: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA0LTE0IGF0IDE3OjI3IC0wNzAwLCBKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tIHdyb3RlOg0KPiBGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tPg0KPiANCj4gR3VDIGJhc2VkIHJlZ2lzdGVyIGR1bXBzIGluIGVycm9yIGNhcHR1cmUgbG9n
cyB3ZXJlIGJhc2ljYWxseSBicm9rZW4NCj4gZm9yIHZpcnR1YWwgZW5naW5lcy4gVGhpcyBjYW4g
YmUgc2VlbiBpbiBpZ3RAZ2VtX2V4ZWNfYmFsYW5jZXJAaGFuZzoNCj4gICBbSUdUXSBnZW1fZXhl
Y19iYWxhbmNlcjogc3RhcnRpbmcgc3VidGVzdCBoYW5nDQo+ICAgW2RybV0gR1BVIEhBTkc6IGVj
b2RlIDEyOjQ6ZTE1MjQxMTAsIGluIGdlbV9leGVjX2JhbGFuYyBbNjM4OF0NCj4gICBbZHJtXSBH
VDA6IEdVQzogTm8gcmVnaXN0ZXIgY2FwdHVyZSBub2RlIGZvdW5kIGZvciAweDEwMDUgLyAweEZF
REMzMTFEDQo+ICAgW2RybV0gR1BVIEhBTkc6IGVjb2RlIDEyOjQ6MDAwMDAwMDAsIGluIGdlbV9l
eGVjX2JhbGFuYyBbNjM4OF0NCj4gICBbSUdUXSBnZW1fZXhlY19iYWxhbmNlcjogZXhpdGluZywg
cmV0PTANCj4gDQo+IFRoZSB0ZXN0IGNhdXNlcyBhIGhhbmcgb24gYm90aCBlbmdpbmVzIG9mIGEg
dmlydHVhbCBlbmdpbmUgY29udGV4dC4NCj4gVGhlIGVuZ2luZSBpbnN0YW5jZSB6ZXJvIGhhbmcg
Z2V0cyBhIHZhbGlkIGVycm9yIGNhcHR1cmUgYnV0IHRoZQ0KPiBub24taW5zdGFuY2UtemVybyBo
YW5nIGRvZXMgbm90Lg0KPiANCj4gRml4IHRoYXQgYnkgc2Nhbm5pbmcgdGhyb3VnaCB0aGUgbGlz
dCBvZiBwZW5kaW5nIHJlZ2lzdGVyIGNhcHR1cmVzDQo+IHdoZW4gYSBoYW5nIG5vdGlmaWNhdGlv
biBmb3IgYSB2aXJ0dWFsIGVuZ2luZSBpcyByZWNlaXZlZC4gVGhhdCB3YXksDQo+IHRoZSBoYW5n
IGNhbiBiZSBhc3NpZ25lZCB0byB0aGUgY29ycmVjdCBwaHlzaWNhbCBlbmdpbmUgcHJpb3IgdG8N
Cj4gc3RhcnRpbmcgdGhlIGVycm9yIGNhcHR1cmUgcHJvY2Vzcy4gU28gbGF0ZXIgb24sIHdoZW4g
dGhlIGVycm9yIGNhcHR1cmUNCj4gaGFuZGxlciB0cmllcyB0byBmaW5kIHRoZSBlbmdpbmUgcmVn
aXN0ZXIgbGlzdCwgaXQgbG9va3MgZm9yIG9uZSBvbg0KPiB0aGUgY29ycmVjdCBlbmdpbmUuDQo+
IA0KPiBBbHNvLCBzbmVhayBpbiBhIG1pc3NpbmcgYmxhbmsgbGluZSBiZWZvcmUgYSBjb21tZW50
IGluIHRoZSBub2RlDQo+IHNlYXJjaCBjb2RlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSm9obiBI
YXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4NCg0KTEdUTSAtIHRoYW5rcyBmb3Ig
Zml4aW5nIHRoaXMhIDpEDQpSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRl
cmVzLmFsZXhpc0BpbnRlbC5jb20+DQoNCkEgc2lkZSBjb252ZXJzYXRpb24gLSBwb3RlbnRpYWxs
eSByZXF1cmluZyBhbiB1bnJlbGF0ZWQgZnV0dXJlIHBhdGNoLC4uLg0KaSBub3RpY2UgdGhhdCB0
aGUgYXJyYXkgImVycm9yLT5yZXNldF9lbmdpbmVfY291bnRbXSIgKHdoaWNoIGlzIGJlaW5nDQp1
c2VkIGZvciBlcnJvciBzdGF0ZSByZXBvcnRpbmcgYW5kIGFzIHNvbWUgdmVyaWZpY2F0aW9uIGlu
IHNlbGZ0ZXN0cykgc2VlbQ0KdG8gaGF2ZSBhIHNpemUgaW5kaWNhdGluZyBvZiBlbmdpbmUtaW5z
dGFuY2UtY291bnQgYnV0IHRoZSByZWFkaW5nL3dydGluZw0Kb2YgbWVtYmVycyBvZiB0aGlzIGFy
cmF5IGtlZXAgdXNpbmcgdGhlIGVuZ2luZS0+dWFiaV9jbGFzcyBhcyBpbmRleC4uLg0KbWVhbmlu
ZyBpdHMgYmVpbmcgdXNlZCB0byB0cmFjayBlbmdpbmUgY2xhc3MgcmVzZXQgY291bnRzPyBNYXli
ZSB0aGlzIGlzDQphbiBpc3N1ZSBvciBpIGFtIG1pc3VuZGVydGFuZGluZyB0aGF0LiBFaXRoZXIg
d2F5LCB0aGF0IGlzc3VlIGlzIHVucmVsYXRlZA0KdG8gdGhlIGludGVudCBvZiB0aGlzIHBhdGNo
IC0gaSBqdXN0IHdhbnRlZCB0byBnZXQgdGhhdCBoaWdobGlnaHRlZCBmb3INCmZ1dHVyZSBhY3Rp
b24gaWYgbmVlZGVkLiBJIGNhbiB0YWtlIHRoYXQgb251cyBpZiBpdHMgaW4gZmFjdCBhbiBpc3N1
ZS4NCg==
