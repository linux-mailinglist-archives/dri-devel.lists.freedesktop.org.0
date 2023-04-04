Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3192F6D6871
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 18:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C8710E6F0;
	Tue,  4 Apr 2023 16:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A953E10E6EE;
 Tue,  4 Apr 2023 16:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680624560; x=1712160560;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dkDGBjzjAI/VGxWsnstjeVAYbMlMle+EjSkoPRbMdCE=;
 b=JWR2gBZqBn2iKI78wS5xobQ0+ODsEMp1GqMbJg7/Vz2DdDUFPkSoBf27
 QMfvRNW/AWAEZeyOUxLhYNSJWsY4wHpcJQChQOqZyjMtdwI/wXNz6Cv1d
 vz1nUKyhktdb8IbKAxc2/PgetQwts6EhK8vKKD2/bVSMbUy42sG01XBty
 mqy+MMb2KFORmCjuJTPA0qfeRj5ZrP5gXkur7b1nIednlPWnGnAbC0fzx
 RXVm1N6oXbi/CqzBRq7zZpXUrc8Jie2JNXI+lRBq9nkRt0A6yCIKbyYOC
 ZAk7/7MvTyfARpJZ13muQE+8rAsjs1Wb3m0jU09rW51GstL2ADwaPCAR8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="428516710"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="428516710"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 09:04:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="775692358"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="775692358"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Apr 2023 09:04:28 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 09:04:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 09:04:28 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 09:04:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0v2EZ15Rr6mx2vy9Gw+dOWOgC0JFwuAFwU1Br+mm0HanLbLBUqsprN5HHipSriA2FXT5vfxQ9g0bwGrvBB1okhg0a5qxXOCefpWG1mhr2N2LQnGp5wfs5UPv/URME301WARUamjlEd7AI4sK32Kg9kvWKYukUQHwvJjg0snaktKcAGDBOWvAJoZzXxIXb67dLU15Oz6hbHDSDPOD8hX4jV9U8bgz5jmWPMevRyg/fdel38tQMizUIoja2UelYvbTKHVyHB77o8H0eeDxxnKBUI2Pn0sROqjRVjxdzV/RU2Wi3jrVairS7Ti6L+NgC9kaX61DF53UgEJPIkvQI98qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkDGBjzjAI/VGxWsnstjeVAYbMlMle+EjSkoPRbMdCE=;
 b=fCQicqz7xnJp3lPsA2p/ttkOw/PI1sbCf4V6BYiKjIbODr4+J0H/N7FbFo8lavdSLF4IJfwEBHglk/ARMf/FWesKs0Bm2RTh5JVDVM0mGMNJ8kJize2DZfa+wkdnNijeXc9ewh+HBtM3TpmZJzCAGRBq6UKi9q2KntYnfbT72fBZR+4hH1cKfSJbAUJDh3LTs9w45zLya+GHjozgkzeKXZwJotbwMqEsNjKpFv0J8j0zGYmlputPT1bGPvturjIHR3H20SFIIIKP6BIYyucW77q0OWqj2U6CkzytKbcX1vXDFHYVbuVW/gQs52918R2JwULx9v4ovcHc6kBuDENdZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by SA0PR11MB4703.namprd11.prod.outlook.com (2603:10b6:806:9f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 16:04:25 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee%6]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 16:04:25 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 7/7] drm/i915: Allow user to set cache at BO
 creation
Thread-Topic: [Intel-gfx] [PATCH 7/7] drm/i915: Allow user to set cache at BO
 creation
Thread-Index: AQHZZGRiuuNpc8BVKEecHbCKjiVefa8axZGAgACOQHA=
Date: Tue, 4 Apr 2023 16:04:25 +0000
Message-ID: <BYAPR11MB256790AC5BDC891F186E000E9A939@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230401063830.438127-1-fei.yang@intel.com>
 <20230401063830.438127-8-fei.yang@intel.com>
 <7aa541f8-55e3-a182-5390-6ca161edb70b@intel.com>
In-Reply-To: <7aa541f8-55e3-a182-5390-6ca161edb70b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|SA0PR11MB4703:EE_
x-ms-office365-filtering-correlation-id: a174c39c-68ee-4dd1-4c29-08db35264352
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZJErLyyDPH6Na7Bg/y6xPeR7UnV1ktb9HNAw/bv9RtEGQyLs3yMI7aaenOMT2Kblz2STQ2Z/amvIZAnh463vR+RKXedMPo4LzCBbNYZiqM5Y0dRMfZyT3Q9G9JdSERk7aFnYTt5yNpC0qTTNQHDcFvJkaWSkyIrrXl1r+8u+neCaCul3FzSFMwOWweF0HEXLQVtXzc1OxY9B8d/6pMHdORAcNnbdi/cvxfcHQQWTC4ql1e24rD5QxTWPL9AwosiwXODpJK2yXUU2vZZJOpfQUNGTWzWrSfUY8SRgOUuD4s4DBJQIaDHA1BWFo+BQHhLENqOmOg3N+k98LKKudd59WMN61IQHMyqQ0iihaN70Wu3ALsMThINtSHl7gn7ZKtl1Q/akjlgjhDBnEW/tErkg1CfO+rljKDzc5UkwwlEBm6nS9DEPsFUAAsNN8QvXms/huRFztZvof9CoSFazwxctAcYlaprpemO25YFu16ah5TEtmJ26XTK8AJy+quHZltdwAazsNw/MJiO7qjwb3VVT5E/Vz3kMvNsp2AxKOb0FMtja6t9vWatUCvqpPfksge/UkzB1Hs8d2MIHFCi4tR7nm9F0g98upgAlqW+rN2qEu5U40BhVNR5FGkkMsaNHZfIP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(376002)(396003)(346002)(366004)(451199021)(55016003)(41300700001)(66476007)(66446008)(64756008)(66556008)(66946007)(76116006)(8676002)(316002)(478600001)(4326008)(52536014)(8936002)(122000001)(110136005)(82960400001)(5660300002)(38100700002)(54906003)(186003)(83380400001)(7696005)(966005)(71200400001)(6506007)(9686003)(53546011)(26005)(38070700005)(33656002)(2906002)(86362001)(66899021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjNMSGtXVzI4VW1lMlBsdmNIejRPejVHZ3V5blFhc2tLWUF3cmh1VTJSUEFS?=
 =?utf-8?B?em9rcmtncVl6RERhRUJlODdzaCs2bFdwZ0hWdCtDLy8vRjVnWFhMdTNiRytz?=
 =?utf-8?B?U0dkeVZXbG80V25XankvdXlEQ0pkSlByTGdzWmVtdGlJUmZXUDRBYTFGd2d1?=
 =?utf-8?B?Y0xvNDBOckZtRXJ2RjQ3UWcvSDFoSFA0UTJzT004cGNRNlpwRVlCNHFmTU1o?=
 =?utf-8?B?UE9NTXdtMm1reis2UUpRVnRnM0dOZC9GR3NaTTAxYmJwYXRpVTU3Z2dtSmJP?=
 =?utf-8?B?UWNSTnZ5U2VUbmV1TEJpSHNySm1zUzY3QmE0NHhBQit1b3IzaFZ4MVdjejVQ?=
 =?utf-8?B?WUZEdmhhUStKd2c2eFVvR0lGQjhKT3Jhd1pXUTRUUk53VUpZUWdmYiszNzR6?=
 =?utf-8?B?aHhxWUFIMW9xRFdlVkgvNkJSbHZBNDhSVEl3UDl5MXJGWFhFeVZkT2VFTExK?=
 =?utf-8?B?L3ByYTlHa1M4L1l5anBDdTROdjRLdkZzbFBCdVgzbmdOT3ZwWGlaRHJtQ0VN?=
 =?utf-8?B?Q3JnSmFiUkRMaVZVVU1PUW9ES0c0WFVubzNvVHpCZHd1NTY1UGlEN3E5R3dH?=
 =?utf-8?B?YWVuc01ZOER2VTB4U2I5R3U1cnA2NW9Vc3YxN292N292VGNXMzdRQXFKaWp6?=
 =?utf-8?B?NHJaZEdXS3k0OXhLc2NQdE1UMzBNeExlT3dLYUIzWHJ2dEJISEhkc0pGK3RE?=
 =?utf-8?B?TDlrYWN5Yk04b0JxaEZnWkpMUjZDOTlhQ3I5b3kzMnJUMzVMVmluUzdkcUVT?=
 =?utf-8?B?N0NDTTdJd2FaMkFVWUJ0T01lMkgwa3g0RklUd3RwYUcyZnN0aVZEd2ZVVEtx?=
 =?utf-8?B?ZlZIUGZtNlRQSHNNdVNRQkRHazY1SzlvbTc0eVArcFlIc0hMSG9mYjZ3Nmg2?=
 =?utf-8?B?b0dNM0tiWEN5azFDaTE5OWZ3K0JoNjZSTFRuZ3lHdEk0ekdvTXQ1MmpYdlFE?=
 =?utf-8?B?eFc1bVdBcEwycWhrQWY0V3V4cGxQNkhLaFFPQnFnbEdsbytGak41d0VuZTlk?=
 =?utf-8?B?RmNscHhsUkltUlNRcVNONlk2UFFzWkFleEh4WHg3T0FZUUlobHhUTzZJTzJY?=
 =?utf-8?B?QTcraXRhcHhCUW91aW5aZXdXR0d6UXkzQXRWN2dxcndGSkhDSW04QUFLTWo0?=
 =?utf-8?B?WGZJeXk3MjRTL2t0M0R1RmJoaXYyRW1saHJydDJFZXRRSzF2SHZsVjgySVFT?=
 =?utf-8?B?b1QyTUNuMGdjKy91YTNONFJ1cFRnNnFubVcxUU9CRndQclh2TzJNYmVla0Fw?=
 =?utf-8?B?d05oQWoyd253cjkxOVJBQkM4bEpXVXFjVklNaGlRS0toYXdXRStjV0FLcUh1?=
 =?utf-8?B?SUx4OFBTeUJVYVhtYVVPOUk4dm9hSG9RWFRCajduYTgvRndzZUNOZlZEbVNZ?=
 =?utf-8?B?aFpzWnp3V3NQTlhpU2RoU3ZYSWZYZXNhMWo5VnJPdWJtM3EzMkxXYTlSQ3U2?=
 =?utf-8?B?NXRzQVlzUU5DNlFQRi9BTWM3elBWNlV1SHZWUVZoaE5vbFhLcFVUTU1JV2J4?=
 =?utf-8?B?SHlBTUtWVFRuaVhOTVpsVytsRjYyS21TM3Z2emFLdkxpb2hRL3lVZDFOcG5k?=
 =?utf-8?B?ZUFDVEhRMmo1amNIVEFVK2lHUjdBak9hRlJYR2tCL0hIYVVCTEF2WmJwYkwr?=
 =?utf-8?B?WHRoRW53WTNJSlB4UGsyemttZCtTNXFyakZ0R2UxcVNHYVV5WTdtQ1g0RmlK?=
 =?utf-8?B?YlFDWmFCRFBKYVE2OFcwS3llOXc1cnRBM1ZobUsyaFRGNjFYT2FqeThYV0VC?=
 =?utf-8?B?dHdZUkxwckUrQ2Z2VkwxMG5LWnE3b0EwUXhKcnoyRGdXSkd5bUdUOXppZVBm?=
 =?utf-8?B?NEZ6bDI5d01ldURDSnBHSUIzKzVDU0p1WGhrTmh4WnViNDNWTEpvaFZQL3p0?=
 =?utf-8?B?MmtwdTJ5R09FWERDVldyaVRtSC9sdldySDVieTlKd2hZcFVtVnFLTDhSdlMy?=
 =?utf-8?B?d0VpRURrYUYydmowcXp5YWYvM3F1WWxqWk9SVXlmWnF4ZERoeTVlR285SDlk?=
 =?utf-8?B?YytySUgweHROaUtmd3VnQUF0N2svQkpIUytMVGxTUGRvRkxqM1RRQlUwRVhF?=
 =?utf-8?B?bHF6eTI2SUFOWlg2Y1lLUHlZdU9sNzFad1dFUk8waTQvNHVIWjJYdmlhWjZs?=
 =?utf-8?Q?uzYE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a174c39c-68ee-4dd1-4c29-08db35264352
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2023 16:04:25.7157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ulg8PbOtdZ17x5yL8TDVZxMoTEHFgkfdA2DpDyXU5d/60HXUadZLg5x+/rfduIzVSSttbbFUOIhPtD7lJvtoqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4703
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBTdWJqZWN0OiBSZTogW0ludGVsLWdmeF0gW1BBVENIIDcvN10gZHJtL2k5MTU6IEFsbG93IHVz
ZXIgdG8gc2V0IGNhY2hlIGF0IEJPIGNyZWF0aW9uDQo+DQo+IE9uIDAxLzA0LzIwMjMgMDk6Mzgs
IGZlaS55YW5nQGludGVsLmNvbSB3cm90ZToNCj4+IEZyb206IEZlaSBZYW5nIDxmZWkueWFuZ0Bp
bnRlbC5jb20+DQo+Pg0KPj4gVG8gY29tcGx5IHdpdGggdGhlIGRlc2lnbiB0aGF0IGJ1ZmZlciBv
YmplY3RzIHNoYWxsIGhhdmUgaW1tdXRhYmxlDQo+PiBjYWNoZSBzZXR0aW5nIHRocm91Z2ggb3V0
IGl0cyBsaWZlIGN5Y2xlLCB7c2V0LCBnZXR9X2NhY2hpbmcgaW9jdGwncw0KPj4gYXJlIG5vIGxv
bmdlciBzdXBwb3J0ZWQgZnJvbSBNVEwgb253YXJkLiBXaXRoIHRoYXQgY2hhbmdlIGNhY2hpbmcN
Cj4+IHBvbGljeSBjYW4gb25seSBiZSBzZXQgYXQgb2JqZWN0IGNyZWF0aW9uIHRpbWUuIFRoZSBj
dXJyZW50IGNvZGUNCj4+IGFwcGxpZXMgYSBkZWZhdWx0IChwbGF0Zm9ybSBkZXBlbmRlbnQpIGNh
Y2hlIHNldHRpbmcgZm9yIGFsbCBvYmplY3RzLg0KPj4gSG93ZXZlciB0aGlzIGlzIG5vdCBvcHRp
bWFsIGZvciBwZXJmb3JtYW5jZSB0dW5pbmcuIFRoZSBwYXRjaCBleHRlbmRzDQo+PiB0aGUgZXhp
c3RpbmcgZ2VtX2NyZWF0ZSB1QVBJIHRvIGxldCB1c2VyIHNldCBQQVQgaW5kZXggZm9yIHRoZSBv
YmplY3QNCj4+IGF0IGNyZWF0aW9uIHRpbWUuDQo+PiBUaGUgbmV3IGV4dGVuc2lvbiBpcyBwbGF0
Zm9ybSBpbmRlcGVuZGVudCwgc28gVU1EJ3MgY2FuIHN3aXRjaCB0bw0KPj4gdXNpbmcgdGhpcyBl
eHRlbnNpb24gZm9yIG9sZGVyIHBsYXRmb3JtcyBhcyB3ZWxsLCB3aGlsZSB7c2V0LA0KPj4gZ2V0
fV9jYWNoaW5nIGFyZSBzdGlsbCBzdXBwb3J0ZWQgb24gdGhlc2UgbGVnYWN5IHBhbHRmb3JtcyBm
b3IgY29tcGF0aWJpbGl0eSByZWFzb24uDQo+Pg0KPj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXMu
cC53aWxzb25AbGludXguaW50ZWwuY29tPg0KPj4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5y
b3BlckBpbnRlbC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBGZWkgWWFuZyA8ZmVpLnlhbmdAaW50
ZWwuY29tPg0KPj4gUmV2aWV3ZWQtYnk6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAbGludXguaW50
ZWwuY29tPg0KPg0KPg0KPiBKdXN0IGxpa2UgdGhlIHByb3RlY3RlZCBjb250ZW50IHVBUEksIHRo
ZXJlIGlzIG5vIHdheSBmb3IgdXNlcnNwYWNlIHRvIHRlbGwNCj4gdGhpcyBmZWF0dXJlIGlzIGF2
YWlsYWJsZSBvdGhlciB0aGFuIHRyeWluZyB1c2luZyBpdC4NCj4NCj4gR2l2ZW4gdGhlIGlzc3Vl
cyB3aXRoIHByb3RlY3RlZCBjb250ZW50LCBpcyBpdCBub3QgdGhpbmcgd2UgY291bGQgd2FudCB0
byBhZGQ/DQoNClNvcnJ5IEknbSBub3QgYXdhcmUgb2YgdGhlIGlzc3VlcyB3aXRoIHByb3RlY3Rl
ZCBjb250ZW50LCBjb3VsZCB5b3UgZWxhYm9yYXRlPw0KVGhlcmUgd2FzIGEgbG9uZyBkaXNjdXNz
aW9uIG9uIHRlYW1zIHVBUEkgY2hhbm5lbCwgY291bGQgeW91IGNvbW1lbnQgdGhlcmUgaWYNCmFu
eSBjb25jZXJucz8NCg0KaHR0cHM6Ly90ZWFtcy5taWNyb3NvZnQuY29tL2wvbWVzc2FnZS8xOTpm
MTc2N2JkYTY3MzQ0NzZiYTBhOWM3ZDE0N2I5MjhkMUB0aHJlYWQuc2t5cGUvMTY3NTg2MDkyNDY3
NT90ZW5hbnRJZD00NmM5OGQ4OC1lMzQ0LTRlZDQtODQ5Ni00ZWQ3NzEyZTI1NWQmZ3JvdXBJZD0z
NzlmM2FlMS1kMTM4LTQyMDUtYmI2NS1kNGM3ZDM4Y2I0ODEmcGFyZW50TWVzc2FnZUlkPTE2NzU4
NjA5MjQ2NzUmdGVhbU5hbWU9R1NFJTIwT1NHQyZjaGFubmVsTmFtZT1pOTE1JTIwdUFQSSUyMGNo
YW5nZXMmY3JlYXRlZFRpbWU9MTY3NTg2MDkyNDY3NSZhbGxvd1hUZW5hbnRBY2Nlc3M9ZmFsc2UN
Cg0KVGhhbmtzLA0KLUZlaQ0KDQo+VGhhbmtzLA0KPg0KPi1MaW9uZWwNCj4NCj4NCj4+IC0tLQ0K
Pj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fY3JlYXRlLmMgfCAzMyArKysr
KysrKysrKysrKysrKysrKw0KPj4gICBpbmNsdWRlL3VhcGkvZHJtL2k5MTVfZHJtLmggICAgICAg
ICAgICAgICAgfCAzNiArKysrKysrKysrKysrKysrKysrKysrDQo+PiAgIHRvb2xzL2luY2x1ZGUv
dWFwaS9kcm0vaTkxNV9kcm0uaCAgICAgICAgICB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysN
Cj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxMDUgaW5zZXJ0aW9ucygrKQ0KPj4NCg==
