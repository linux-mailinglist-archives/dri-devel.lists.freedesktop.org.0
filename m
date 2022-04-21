Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4940C50A0F4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 15:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1424B10E32E;
	Thu, 21 Apr 2022 13:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA3210E209;
 Thu, 21 Apr 2022 13:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650548253; x=1682084253;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=A0Qr76f6lis5u9/tTGi4rul5RbLOcOsvVQiG4CTwkMc=;
 b=FcsknOwsTx/+wRz1LPMfDBlDKtT05QaMjiXCkcM8JGVYE1zBuJQkq+jP
 rj/Re6JGiC8e2gHBCu4ZiBOVUOvgLhI/09PdhY6AgEkbHL8b/DpH7vBq5
 Zs00dFYbV5ziZ/tAtUB6ZX5ElZxAAecElWgOWKBixPdSWXtgfgMkYEebo
 L+S52+izF7GQDtDskKq3DXA/fHllUi+9eUNUjV9FOjG2HsuNFzqHG+Aeg
 rsskSo/MYWKy1nQ/Dv76wN/Dk4e2kxrj6l9oTjRO5Pu1eohUiH83t1Ndy
 Q8PEYZM5taJzmYkg3cICEurLFRtt7zlUstOAgzn9zFMYHPQiEW/vlda3U w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="244927351"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="244927351"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 06:37:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="511068737"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 21 Apr 2022 06:37:32 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 21 Apr 2022 06:37:32 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 21 Apr 2022 06:37:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 21 Apr 2022 06:37:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 21 Apr 2022 06:37:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXFvGS5XiaNxQXNSrtgens7FWSxmXlUoBb5D2XNrtCoPFh1lX7FrTCXnO6JghV8r8czrgU5e+KuHa5yU+KUiEHXRLf+mGpePygZ5cieN8eezRuFBL2EO8fzdyhwmExrIkcvLOcSnAAosSh4CyxQUyVEhBIU2+c5770KuFk0SEfQiyneRjj1s0eKnzV0V/hH2QEfsk05iNd24Ct2tfZKi4rnEcyENCshOEIheVfnCdQJ3NgGNa+xOSbPlDgYvD08lMUCBYrYW8ZCAsQXJfImSvctABovU4e626tYwKpaUC5RB6EDopsXb2Y5EC87UWrHgQJfQ8BZLfXeZdKNyEmLbDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0Qr76f6lis5u9/tTGi4rul5RbLOcOsvVQiG4CTwkMc=;
 b=Lo53maTxajvuhgRTNqKSIf4lFBDlH7UMBn/3u/owu2blRFVk2PlVMxsMoGVZWJLYEesx6RD55BT6i/cNt8djXYj6Avczol2mb4EFXXbR2Pqg8rDykHgQy8q9Xr7tOz2LBu+Pc3o8P/ubCBfKgteHbP4D2+zBRjibkzYGwj6XTMTaQL+o3y+/SDDA+4yohAG7Od+/cIyzBPw66FNP5fVD+ErNi06HxFjEEsbeUQ24P5zS+1CjsdWQN2HtMD7rSSSaHXvlKRMVEJia9HxJyvMSlroCVIzYwruS0Fa9R/ppIaR56rDIT1oHXZYA3vFyKlZ6yKq6+GS+xxDfeyfPQYal1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 CY4PR1101MB2245.namprd11.prod.outlook.com (2603:10b6:910:1f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 13:37:29 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::588c:b026:fe27:2553]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::588c:b026:fe27:2553%7]) with mapi id 15.20.5164.025; Thu, 21 Apr 2022
 13:37:29 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "C,
 Ramalingam" <ramalingam.c@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/i915/gt: Extend doc on Flat-CCS obj eviction
Thread-Topic: [PATCH 3/4] drm/i915/gt: Extend doc on Flat-CCS obj eviction
Thread-Index: AQHYVXQvaRMUzzvuTEav+RAxM5d7SKz6XvcA
Date: Thu, 21 Apr 2022 13:37:29 +0000
Message-ID: <249408791057852ef445c0a8795f3486ef45b151.camel@intel.com>
References: <20220421113813.30796-1-ramalingam.c@intel.com>
 <20220421113813.30796-4-ramalingam.c@intel.com>
In-Reply-To: <20220421113813.30796-4-ramalingam.c@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-3.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f87fcd32-05fb-4838-01f6-08da239c1485
x-ms-traffictypediagnostic: CY4PR1101MB2245:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR1101MB224584258725DA2317242EE697F49@CY4PR1101MB2245.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kgBnkbOkZwbTcUGORTGQTWpN/J3euiHI8U/a5jzWhidM4qteUChxTu/xSr0Pt2UT7tJzoLx/aWgoXRzCbTDDgYCFWcSVnR0mZlXJIuuWurW5wQl+TCqXYbuGK87SxK2DOdY7W08eSnfuS/Gq08aBQjh8QeFTerXoSr/Muz5bH0awZmYBdNxys1aWRO8WNyjdA/v19DMnvwBLOttV7BEeIw/11nnugcNubEa6XXbo6qNs6hcmFUAJ8h7diJNRHP/ZWRo32sFN2RZGJijT+UwwBa3VTvXAO2qWHQ9hxRRohUnLvu/BIgDpB5+hQjkl4CcWGoyXEqGgFQ8NxSRcrBwMG3/Ri0EwNcmoXGc2HBTxTLOFCC6L879tvD0750p1vpuYYVK8exFd6r8vN7xxh/gKPJ6HEvnwwCC7hEUEqlV8hvRmxAzs0a7G7hcUSEpS6LiBRGQubiA64sHsfbDm+s8FfTB9WS86J7/5A1ZkhsSRL9RnaVFP/uNLdqvkQjYpHRcEHaKJRyBXvCteGKDaNJ+Vjsq3gpJKMGA8V6oG0mUSo2T0YABwklkNJF8MhQ/5f2SxVIwLrrx4IE/7EOGSIpQhrIqYR0QCfXH8gmhaTwUqeLBxvKaUcTamnMRmvkY8QjndUs8fg0w9G4ghGtAp3NRqDIhiKOUyOOV+V9rjcwXQ8lXkd3XwfO79Sy2MKX4xf8XV3diiIZ3g5q8o5oqLSe+6fQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(450100002)(91956017)(82960400001)(122000001)(508600001)(107886003)(66946007)(64756008)(66446008)(110136005)(76116006)(186003)(71200400001)(2616005)(86362001)(36756003)(66476007)(66556008)(6486002)(6506007)(316002)(4326008)(6512007)(83380400001)(2906002)(38100700002)(26005)(38070700005)(5660300002)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UURXUXlGclVHNnJVUmlNYjJFemFseHYzTmNqcU4yNkcwVW5BUkQxa2hubFh5?=
 =?utf-8?B?ampTNERBUmVveGIza0JTOWpNTm81QXg5aEdiTld5ODJIT3gzaE9UdXhXMUc0?=
 =?utf-8?B?NE0xTTVYMG5nR1YyOXY5SmRtVzFDNXQ4T2UvTTFkd0N4amJJQ0s2dkNtK01Z?=
 =?utf-8?B?b2FvalRYWTFGSVZEeThITUthTXF2MFc1UTFpSWlmQlF3bjhGTGRwM0crVGo2?=
 =?utf-8?B?TFRpVXNRb25RM2lzYnFrYno3S2ZSWUlobXFWUG9iYk1Xc1N4ZEEyZk41NkFj?=
 =?utf-8?B?SVl5S2tBMmFia211WEpzR2FBWFlMRnlycHJ3ckJ2c0NTdVFoOUhIbVQ2OTMr?=
 =?utf-8?B?WDNlcUhGQUlSdEFGcFdYeW14VWNYZ2pQdGh4R29zN0VGdk1PTTJFa1JybTFa?=
 =?utf-8?B?UG5GQnlpUmt5SndFektkeHREZzNVeE9qUjlKbGVBME15dGw1RmFUYTkzNzd3?=
 =?utf-8?B?UGpIbDc1T09EVTFQa0pmQys3Y09WNVNOVXNZbUJLSUF3WmJzVC9yRkN4d0ta?=
 =?utf-8?B?cm1Lb3lBR1J2ektLUXB0V2JrYVAyUFpMZFFidE1SK3VaK3paT0dseUFjRUYw?=
 =?utf-8?B?Q2V0NkVSRzF6TlVabE5kd0RWallOVWlEdTRXWVNmSlhFeGFKbTAzYi94aGFq?=
 =?utf-8?B?eTNjYmM3Z0VoY3FTRS9pcDFRUGdRUVA5UFhYd1F2SmcvL3cvQmM2WUU1SmFh?=
 =?utf-8?B?dElNQjE4UmhIbFlKU2hpVUk4U3dTdDFmcFNwV0hhMTdRTC9sSXo2MXZsbVd1?=
 =?utf-8?B?N2Jvb2RqM2JJZDYvQUl6enA1ZDc2REVrdTBZSmwyQ3VlKzhxRlJxZlU5YmNq?=
 =?utf-8?B?TmYwOEZFRkxXMmtINktHRm50RENya2RwZkF5UDBXM1lBbEdjdXlRbG43V3ls?=
 =?utf-8?B?V0dZSXBnTGRVcWRzL3Qzb0svVkVvNGNXOHNJMExaNFdYY1F4QmdOWnY0SWJF?=
 =?utf-8?B?UnNaU1pTeDFQK3BtOTVYVVhvWEN2ZUJyd0xIbGdEdWtqNzIwTlVzNElTeEMr?=
 =?utf-8?B?UFhlMDB6eldESzNSaHE5VXc4aXFxZk91UlhCUDJ4TXJMNGt5anBwaVh4dnZY?=
 =?utf-8?B?MkxzOHY3ekRjcUZUcGszSDBER3BQWjU2OU9xU1p4cldkc1RmeGUwQXltV25z?=
 =?utf-8?B?Z0p3OGN1Q3hLeFZmQ1ltZUxRWVg3RmM1aE1kb3ZRMEgrVWxnV1I1cVloUklC?=
 =?utf-8?B?Q1oyTDRtSUVIT3VNSGtydHNaWkVHbk9zZExNQWYwRFNKclFHVkYvNWZYcWtl?=
 =?utf-8?B?dnBhUVVpbG8rSWovNFdyY21OeHlVQ2Q5TTllRnhoWWgrbWRxRWVlQmFuRjZQ?=
 =?utf-8?B?WmJydWVha2tuWWpTZWFqT1JNS1hvWTZLRTQ4cHRhb3hRYkZNbCtDd2hTUGpC?=
 =?utf-8?B?aTltby9KMHB4dis3Z01BN3FwdDJoNGhqSjRuWU9IQ1lHb1F2U3l2U0daY2xw?=
 =?utf-8?B?WW1yNWNUYzlSRktNZ2xiNGJycHk4RlRLUldzNDg1QnpXdnMxQTBKWWhpQzJt?=
 =?utf-8?B?Q0V0WHExYU5HdVc5Wk1NZU44TmRDSytoUnpzVkhyR3NocFZpWXNUSVBrU09m?=
 =?utf-8?B?YTA0S3hBbDBJdFFUdVU0bk5iZHlBOC9DRDY2VnRmZUU3cEhMUHF1SStDUFdF?=
 =?utf-8?B?cXNuTjNQWXlBSWplY3RVV2YyVlRKTXVqY2Rhc1pzcWZrY25OQjhvMVJCWEFi?=
 =?utf-8?B?UDQzVGgrblNjSlBqdTBiN25FQzcrYkRnZ21BYXpaRHpaemtQaUFWSzc3RUFN?=
 =?utf-8?B?L3lmU3dDbmpxaG1TRzl1RWVvK0h1M0xUN2lIWTVVMnNjYWYyZUlqR1lhenIx?=
 =?utf-8?B?dE9MWDIzTDdDMmlEOTZMWExOZDhwZm5WeG5DUm92OFV6bzFrbHZBY0Y0aDFE?=
 =?utf-8?B?ekV1c3JoSTNReTMwY01XQ3d2Mk05YjcrZVFKT3k1NDIwcXF3TEduWVNkVmtJ?=
 =?utf-8?B?OC9HVlRiQkZwenB1a29FczJUS3BrNDc0b1VIcllmQU40TW9XN3RqLzFmTHBU?=
 =?utf-8?B?bEJtY1BmYU02aW5kMlNGSHJNVkZmK3JLb1Znc2YvdDBiR1lISzZ6OENFMHNa?=
 =?utf-8?B?SDFVRDNOZkxtTWhneStSRkhHNHdwYTJVam10amFmODdiVVRFQ3dmQ0JCVERv?=
 =?utf-8?B?a1VDZTNTUmQrZnJKdVNSaDlHU1ozSjFlVVlCZkJ5QkozZjlYSDc2eGxUQ2Vy?=
 =?utf-8?B?MnBiaEh1Z1NrTCt3MTNoZUZrTnk0VTAvdXVTMGpKcTBDV0ZtVVZtMXNpUlk4?=
 =?utf-8?B?STZPNkkvdWFYNWc5ZnZRczI2RnFJQVVlTVFiM3VBNTYxNTY5Y2RsRDFTWWhN?=
 =?utf-8?B?dURJVDlyRjZJYm9rL0ZabjJBY2xsV1dmWVBvditNNVNYNE9wKzAzZTMwL3Q1?=
 =?utf-8?Q?QUy9WDhjfkLa9hxU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <27A037BD6D153947903658A26BFE5751@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f87fcd32-05fb-4838-01f6-08da239c1485
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 13:37:29.1696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fhxFbQDfNl0xldfCHqiUWWyOd8tCgqpl/86vo5CmBsZqdhy93RXMczUjwD0pNhYAV/7uVuhHJGCGpopR9BTVDDLP4If8ST1I5z5WxrrdVrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2245
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIyLTA0LTIxIGF0IDE3OjA4ICswNTMwLCBSYW1hbGluZ2FtIEMgd3JvdGU6DQo+
IENhcHR1cmUgdGhlIGV2aWN0aW9uIGRldGFpbHMgZm9yIEZsYXQtQ0NTIGNhcGFibGUgbG1lbSBv
bmx5IG9iamVjdHMNCj4gYW5kDQo+IGxtZW0gb2JqZWN0cyB3aXRoIHNtZW0gcmVzaWRlbmN5LiBU
aGlzIGFsc28gY2FwdHVyZXMgdGhlIGltcGFjdCBvZg0KPiBldmljdGlvbiBvbsKgIG9iamVjdCdz
IG1lbW9yeSByZXNpZGVuY3kgYW5kIEZsYXQtQ0NTIGNvbXByZXNzaW9uDQo+IHN0YXRlLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogUmFtYWxpbmdhbSBDIDxyYW1hbGluZ2FtLmNAaW50ZWwuY29tPg0K
PiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9taWdyYXRlLmMgfCAzNiAr
KysrKysrKysrKysrKysrKystLS0tLQ0KPiAtLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L2ludGVsX21pZ3JhdGUuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0
L2ludGVsX21pZ3JhdGUuYw0KPiBpbmRleCA0NjNhNmExNGI1ZjkuLjlkMGQxODk1MGU3NiAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfbWlncmF0ZS5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX21pZ3JhdGUuYw0KPiBAQCAtNDg1LDE2
ICs0ODUsMzQgQEAgc3RhdGljIGJvb2wgd2FfMTIwOTY0NDYxMV9hcHBsaWVzKGludCB2ZXIsIHUz
Mg0KPiBzaXplKQ0KPiDCoCAqIEFuZCBDQ1MgZGF0YSBjYW4gYmUgY29waWVkIGluIGFuZCBvdXQg
b2YgQ0NTIHJlZ2lvbiB0aHJvdWdoDQo+IMKgICogWFlfQ1RSTF9TVVJGX0NPUFlfQkxULiBDUFUg
Y2FuJ3QgYWNjZXNzIHRoZSBDQ1MgZGF0YSBkaXJlY3RseS4NCj4gwqAgKg0KPiAtICogV2hlbiB3
ZSBleGhhdXN0IHRoZSBsbWVtLCBpZiB0aGUgb2JqZWN0J3MgcGxhY2VtZW50cyBzdXBwb3J0DQo+
IHNtZW0sIHRoZW4gd2UgY2FuDQo+IC0gKiBkaXJlY3RseSBkZWNvbXByZXNzIHRoZSBjb21wcmVz
c2VkIGxtZW0gb2JqZWN0IGludG8gc21lbSBhbmQNCj4gc3RhcnQgdXNpbmcgaXQNCj4gLSAqIGZy
b20gc21lbSBpdHNlbGYuDQo+ICsgKiB3aGVuIHdlIGV4aGF1c3QgdGhlIGxtZW0sIHdlIG5lZWQg
dG8gaGFuZGxlIHR3byB0eXBlcyBvZiBmbGF0LWNjcw0KPiBjYXBhYmxlDQo+ICsgKiBvYmplY3Rz
IGZvciBpdHMgZXZpY3Rpb24uDQo+ICsgKsKgwqAgMSkgbG1lbSBvbmx5IG9iamVjdHMNCj4gKyAq
wqDCoCAyKSBsbWVtIG9iamVjdHMgd2l0aCBzbWVtIHJlc2lkZW5jeSBvcHRpb24NCj4gwqAgKg0K
PiAtICogQnV0IHdoZW4gd2UgbmVlZCB0byBzd2Fwb3V0IHRoZSBjb21wcmVzc2VkIGxtZW0gb2Jq
ZWN0IGludG8gYQ0KPiBzbWVtIHJlZ2lvbg0KPiAtICogdGhvdWdoIG9iamVjdHMnIHBsYWNlbWVu
dCBkb2Vzbid0IHN1cHBvcnQgc21lbSwgdGhlbiB3ZSBjb3B5IHRoZQ0KPiBsbWVtIGNvbnRlbnQN
Cj4gLSAqIGFzIGl0IGlzIGludG8gc21lbSByZWdpb24gYWxvbmcgd2l0aCBjY3MgZGF0YSAodXNp
bmcNCj4gWFlfQ1RSTF9TVVJGX0NPUFlfQkxUKS4NCj4gLSAqIFdoZW4gdGhlIG9iamVjdCBpcyBy
ZWZlcnJlZCwgbG1lbSBjb250ZW50IHdpbGwgYmUgc3dhcGVkIGluIGFsb25nDQo+IHdpdGgNCj4g
LSAqIHJlc3RvcmF0aW9uIG9mIHRoZSBDQ1MgZGF0YSAodXNpbmcgWFlfQ1RSTF9TVVJGX0NPUFlf
QkxUKSBhdA0KPiBjb3JyZXNwb25kaW5nDQo+IC0gKiBsb2NhdGlvbi4NCj4gKyAqIDEpIGxtZW0g
b25seSBvYmplY3RzOg0KPiArICoNCj4gKyAqIGxtZW0gYmFja2luZyBtZW1vcnkgY2FuIGJlIHRl
bXBvcmFyaWx5IGV2aWN0ZWQgdG8gc21lbSwgYWxvbmcNCj4gd2l0aCB0aGUNCj4gKyAqIGF1eGls
aWFyeSBDQ1Mgc3RhdGUsIHdoZXJlIGl0IGNhbiBiZSBwb3RlbnRpYWxseSBzd2FwcGVkLW91dCBh
dCBhDQo+IGxhdGVyIHBvaW50LA0KPiArICogaWYgcmVxdWlyZWQuIElmIHVzZXJzcGFjZSBsYXRl
ciB0b3VjaGVzIHRoZSBldmljdGVkIHBhZ2VzLCB0aGVuDQo+IHdlIGFsd2F5cyBtb3ZlDQo+ICsg
KiB0aGUgYmFja2luZyBtZW1vcnkgYmFjayB0byBsbWVtLCB3aGljaCBpbmNsdWRlcyByZXN0b3Jp
bmcgdGhlDQo+IHNhdmVkIENDUyBzdGF0ZSwNCj4gKyAqIGFuZCBwb3RlbnRpYWxseSBwZXJmb3Jt
aW5nIGFueSByZXF1aXJlZCBzd2FwLWluLg0KPiArICoNCj4gKyAqIEluIHRoaXMgc2NlbmFyaW8s
IG9iamVjdHMnIGJhY2tpbmcgbWVtb3J5IGNsYXNzIGFuZCBGbGF0LUNDUw0KPiBzdGF0ZSBkb2Vz
bid0DQo+ICsgKiBjaGFuZ2UuDQo+ICsgKg0KPiArICogMikgbG1lbSBvYmplY3RzIHdpdGggc21l
bSByZXNpZGVuY3kgb3B0aW9uDQo+ICsgKg0KPiArICogTG1lbSBvYmplY3Qgd2l0aCBzbWVtIHJl
Z2lvbiBpbiBpdCdzIHBsYWNlbWVudCBsaXN0LCB3aWxsIGJlDQo+IG1pZ3JhdGVkIGludG8NCj4g
KyAqIHNtZW3CoCBieSBkZWNvbXByZXNzaW5nIHRoZSBjb250ZW50LiBJOTE1IGRvZXNuJ3QgaGFu
ZGxlIHRoaXMga2luZA0KPiBvZg0KPiArICogbWlncmF0aW9uIGZvciBGbGF0LUNDUyBjb21wcmVz
c2VkIG9iamVjdHMgeWV0Lg0KPiArICoNCj4gKyAqIEluIHRoaXMgc2NlbmFyaW8sIG9iamVjdHMn
IGJhY2tpbmcgbWVtb3J5IGNsYXNzIGFuZCBGbGF0LUNDUw0KPiBzdGF0ZSBjaGFuZ2VkLA0KPiAr
ICogYW5kIHVzZXJzcGFjZSBpcyBub3QgYXdhcmUgb2YgaXQuDQo+ICsgKg0KPiArICogSW4gc3Vt
bWFyeSwgd2hlbiBhIHVzZXJzcGFjZSB3YW50cyB0byBiZSBzdXJlIGFib3V0IHRoZSBvYmplY3Rz
DQo+IG1lbW9yeQ0KPiArICogcmVzaWRlbmN5IGFuZCBmbGF0LWNjcyBjb21wcmVzc2lvbiBzdGF0
ZSwgdGhlbiBwbGFjZW1lbnQgbGlzdA0KPiBjYW4ndCBoYXZlDQo+ICsgKiB0aGUgbG1lbSBhbmQg
c21lbSB0b2dldGhlci4gSW5zdGVhZCwgb2JqZWN0IGhhcyB0byBiZSBsbWVtDQo+IHJlc2lkZW50
IG9ubHkuDQoNCkZvciAyKSBJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IHdpdGggZmxh
dCBDQ1MsIHRoZXNlIG9iamVjdHMNCm5lZWQgdG8gYmUgYWx3YXlzIHVuY29tcHJlc3NlZCwgc2lu
Y2UgdGhlIGtlcm5lbCBkb2Vzbid0IGhhdmUgdGhlDQpuZWVkZWQgaW5mb3JtYXRpb24gdG8gZGVj
b21wcmVzcyAvIGNvbXByZXNzLiBPciBoYXMgdGhpcyBiZWVuIGNoYW5nZWQNCnJlY2VudGx5Pw0K
DQovVGhvbWFzDQoNCg0KDQoNCj4gwqAgKi8NCj4gwqANCj4gwqBzdGF0aWMgaW5saW5lIHUzMiAq
aTkxNV9mbHVzaF9kdyh1MzIgKmNtZCwgdTMyIGZsYWdzKQ0KDQo=
