Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AAD6CF7F9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 02:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11EE10ECB8;
	Thu, 30 Mar 2023 00:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6AB10EC94;
 Thu, 30 Mar 2023 00:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680135028; x=1711671028;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AYdBAtVir68IDhILvhH7rZcV4A2Pp1Nl6HWYoTEqePY=;
 b=k7iO44qLbwj1tzq/ZRhvUHPWYSPERn+Vde55AtjyCSK+xhfjHyeFKdlP
 SXD8RFn3oqcRjo+2ZDaISZf3U+oGOqogNeE5uettzSyVNtKyMlxbEc5eu
 J7v5vwQwk0G3+OFH9BegIHFZthgc2nV3OZ9uZcRWhOkVA9CfI2fTnQZmT
 yjG2k0cGZ2TVA7J7jDKFoqp7LqLtmC9O3aidsceHw6EhegzyRLBrAdeeQ
 vsgoYs6t21M3SFwAveSSxh4rg+/6JLB2+/yYWVGN4ybK3BVJS1L56jtSW
 K4w/E2aUJGgWftg80AhMS+N16JJVPe9LmVrJPkEBmbEEcPow0uOaMONAt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="368808113"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="368808113"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 17:10:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="1014230317"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="1014230317"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 29 Mar 2023 17:10:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 17:10:27 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 17:10:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 29 Mar 2023 17:10:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 29 Mar 2023 17:10:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AG4mi5slMrXiRedId/yLVRbEDm2PDnErn6qqMJRnIBodtp4zsde1bPeTr1imA18CFYhAjc77L6W5ErmnlcNjaz0f8qjqelFjnv7lT/ZI2kU+AsYd++kPhCb4xA0WRxTFNb9cS/5yC5mCkQzACEgme1q9bWabsojwwc8NIN2HmURLOORs08BesXi7s9HrVkbRtBDyzM7n5UJ2g2HV7GxdPmJSwWK6MbNh/LJ1Rd7w27itYS/eaTIX6fYK/Zxz7OPh59fRSs+7EyyvDJdpmNhMmOC36AI82xHlgkTFst0FgLMmpGHNXP3Regy3CH6wcTEjpS5b6RZVU9DkOsYQ1RMuzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYdBAtVir68IDhILvhH7rZcV4A2Pp1Nl6HWYoTEqePY=;
 b=TYkSGpz4iA2sytM2Tl1kgzmGk5mdLfYk3qoH0w4kb8q5yj6DlzJ9cZGhx42g9mf5qmPzdpUqz99F94OK/7arHXqndCPdY0c+PR85Ik6G1buhf0s0xGc5auxQyM0E3siN73F/Y8JRZC2WEJvhCo/12psLBF2ucWEqW5uxc6vrQSYRQeqnjOj7/0/QBsBR8av/KZKLg22RwiZZyzd+WOgUvi58rJSYH5FJrh+DpAvdASEkkF/rFxmyTNiOHcfFAh1Ysj8SANv7U7Z3QBBDqN0un8d4kBbMW3p4f1veQF8+o3cqIHCghf3kZWFWjohfWjhm9AfQv3MjgCfAIVR1cjDKOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ1PR11MB6178.namprd11.prod.outlook.com (2603:10b6:a03:45b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 30 Mar
 2023 00:10:23 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%4]) with mapi id 15.20.6222.030; Thu, 30 Mar 2023
 00:10:23 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v6 5/8] drm/i915/pxp: Add ARB session creation
 and cleanup
Thread-Topic: [Intel-gfx] [PATCH v6 5/8] drm/i915/pxp: Add ARB session
 creation and cleanup
Thread-Index: AQHZSxtxSfUqWny+hUmFCBmRtOC0Wq7p3LIAgCFQjwCAAeX0AIABTCEAgACZHYCAAZ87gIAADjoAgADoKICAARPBgA==
Date: Thu, 30 Mar 2023 00:10:23 +0000
Message-ID: <f87c39a243d84e53d6c292c63d032b30c89adb3e.camel@intel.com>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
 <20230228022150.1657843-6-alan.previn.teres.alexis@intel.com>
 <fabe4123-53cc-005e-e0af-7683e0d45896@intel.com>
 <3b8091c51677878b968d1d275b9b16e5088d913d.camel@intel.com>
 <ZCAqDlUIp0YmCkyu@intel.com>
 <fef256a6-3027-8beb-0ef8-fddf972db441@intel.com>
 <cf63d62b-3e2d-f8fe-82b6-95e71e376cc2@linux.intel.com>
 <3359c9d371a25710891352061693637b37679734.camel@intel.com>
 <ZCMpXMj7GwDIp6Ll@intel.com>
 <118981ef-260d-4c1a-5ca5-ad435d5edbc7@linux.intel.com>
In-Reply-To: <118981ef-260d-4c1a-5ca5-ad435d5edbc7@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ1PR11MB6178:EE_
x-ms-office365-filtering-correlation-id: 90dc1507-813f-443a-7406-08db30b3284b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ISQW+DqxZc1AVeZ/3xVHhjfLtx6rty7XKZcvzH1wIPubP90FbSADeNM0MmwcDdlqdB5Y0ktKVQLDugXZSZtYfGzIMwinqVaHjY3MafmsQUbVQ0+wPLQSXOZHleBFtsKjgVe/pcDo44s5R/0ufCM0UoFcdayriKIbGACLu8E64E7CX/8rddq9nJXxCr1YchNjKQpRj5RYiHONCfE8TE81JtPUlhbNrsa6jcpTl1J2Ddz4tLr3cYiaWLpdjunY4wEfh59kZXXjweBAGZvTs0u0dyRiHl/53CnAbAk0HHNdpcV0WltfTe8z1kV7d2WeuLyPB8v5v7IYVb5EOWnu8EzNvd06+fy6TWHJwq7JnSKCCSFbjjUhuQh+FuB6WSgnXPfsxCigSbkEgBltZI/wq5dznqtxjXcMFXxYpYu5Ogv4q642BQY5LwbwW5SFDXqdt+FhPo+pDcA8IFbyxqZGVFP/MRXTUz3XjchNxubuhj1pOxojVBbc2JOu7vHIJdm2Hsw/yiF47JQf/vxS4iyN3lov4RNttbn311vI1Qj9U/3KYrWQ9fI4pfWuKpnVGclYDcRmg3o2133r+RJa9VExy4eHgtSceCiPbuS1aknnZ8NuK7xBswjFZNUsxf9UUSikupz1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(91956017)(110136005)(38070700005)(36756003)(86362001)(26005)(82960400001)(38100700002)(66476007)(76116006)(122000001)(2906002)(83380400001)(6486002)(71200400001)(54906003)(4326008)(64756008)(2616005)(66446008)(66946007)(6512007)(8936002)(5660300002)(41300700001)(66556008)(8676002)(186003)(53546011)(6506007)(478600001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVliNkZxdkVVMUs0Nm5xOFFCakhKTk9ObU1yeVNwOCtWancrcnMrNHpoaWFN?=
 =?utf-8?B?L2ppRVRrbFNKb0VEL055bWZPTWwvc0J5dFhsOXFHWUhMUXlna1Q3bTJ6M1J5?=
 =?utf-8?B?VktvclNTUGFNNlNxcC9KcE91dThqb1ZNKzFuWFFBTDRhdVBKN0hENnozWWFx?=
 =?utf-8?B?Z1gxdmYwN2t0R3ExMENuZTB4TmFkVEVnSG0xSVJUeGdub0xpRXdQa2JlMW1Z?=
 =?utf-8?B?c29iaG1TK0FtczI1K0FGTDd5ZGJOa0w2NnkwWjllVVRyVy8rM2dSckY3YURD?=
 =?utf-8?B?eVNYcEJyNWVpVEk1Z3ZDTExOaDNrZnFaVDFXU0dyYXpOcTVFdmdnK2RNeUFL?=
 =?utf-8?B?Wkl6TmVFWjc4ck1kaVpxMlJwa3l5b0RFdkZ3cnBVNUh3SVhUWTQvSUNGUExr?=
 =?utf-8?B?OWtDRUNTYlNCS1ZZbG5wZjU5dGZORmppZ0VxRUhXVUJZUmtwZmNseGFTci9t?=
 =?utf-8?B?TXhSd1dtaGxIa09Dbk5JNXd0b3o1SzJZOWsrQXBwS0ZmZjdJVUhhc3Avam4r?=
 =?utf-8?B?a0pSQTNqTnpvNmVqazJsWDdIenlWSXdUUU5HTlM0Q21YVGE2QXNsUk02QnYz?=
 =?utf-8?B?UW5KbmpXQkJxamVRZ1VGSnhFc2pPMGdoRjI4eVUvVWFGa251akp5RzlnaEFD?=
 =?utf-8?B?a1llV2hMYmtzYmNqVkVSL1k0eHBSKzhReEoyeTZaVHRNOGtDUUF6cjg0em5p?=
 =?utf-8?B?d3lsQjJpeHNyVTI1VDBRSE15N08yeGJHVUFUNk5SN05DZVRsRkJ4Z2R5NW5Z?=
 =?utf-8?B?c1A5U0JmRlJER1puWkM4RThLNWZLakpFRUowOHJlRURSNnJPUXBSWVBPNm1Y?=
 =?utf-8?B?WktKc256N0F3RlhNTGtNT3F2aG5xczZiNUpCeVk3bElRMWFyNjVXcXQrcGNF?=
 =?utf-8?B?dXNmVEpUbStiWnlMYUZqYWJLRE9SM3UzQWF3eWNzSGpKUmNWWEF5Uzc2d1h6?=
 =?utf-8?B?RVhQQnpyWHREN2VBNjNTUHlha3BiQlNpeFh6bzZMQzlHamtoRVhtM0s1bXNG?=
 =?utf-8?B?cnVxTS83bUFMQmpRdzM5bkRVQndMdjJoTjNXcUdVVXQ1YjZMckJ3Yk9UQ1Bu?=
 =?utf-8?B?dmxIeWxkbjNlU0hVajdhVkNpSmhiNVMwc1REMlppay8xWk93T3F3Sm1kNmlm?=
 =?utf-8?B?c2h0UUFUanpTeG9pWW9ObEY2UWxzbTBiQ1dNWThYQys2SU5jWUIwSFRsVFVR?=
 =?utf-8?B?ZnRmNHp4bGFFZ1RkL1ZXL1Jnd3VSWHltL04wNlo0bitXQW5HSURLTlJBUERs?=
 =?utf-8?B?RWEvak1YdEdWRlVWZ2wwM3ZuL2hTbzFIc3laOUFUUU5nQUk0U1JUc3pSL3Jm?=
 =?utf-8?B?aWpEemZDUlZFaTRuQzFKMktjRjhWK2d1V1Z4VXNXMDBjcnZTMTh5Z2hmakk0?=
 =?utf-8?B?VXFMMUtFNUVrSTNLbTJubmZmemwvdUUzOTNrbUlobEZjK2dWWUJlcDhEQWN4?=
 =?utf-8?B?dDZ4WU1DUkVyODdnQ1dPL3pjUzVtOHIzajU2eGRjNU5zNGJoMkVCcVF1eTFz?=
 =?utf-8?B?anJBWlI5YUJUZUZrWHdUdkRPeVpQeDN2WVI0OWdJK2gzVWMybUN0Sy9PQmI5?=
 =?utf-8?B?RGhyZE9Qbis4L3c4ZGd1MS93OHV5QzFpWEZ3ZHYySm83SEl1M3dSWWhzaWJH?=
 =?utf-8?B?V05LWHRlWmV6Rlo1aEFxbld3Z2lURXVPajJYMjZhR0JCZE9nUEU3QnpjNEhB?=
 =?utf-8?B?WGRnT2RCUTRpNE4rUU9VOTg4c2N0SmxTa25Sd1dGbG5OQUZrS1NZZCtjdVNW?=
 =?utf-8?B?b25TYkx1dkVkaWR4cDB4dlc3TTViQjhhY1E2N2x6c0p5b1NRWWpOVmJHdUdl?=
 =?utf-8?B?WUJkdW1yRnpBYkhyRFo1UEdubzlhVExKcDVISm1mUmJ5YUhmSmRNY3lpRUpD?=
 =?utf-8?B?UUJEMTdTdStqa0RFbWFXZGRmdkxEUzFjelUyZkdoWjRCZ1RubHM0VC9BS05t?=
 =?utf-8?B?TjhSc3VILzF1MUFGMGxlTHZRRVJtK3hIM2paWkpHOUY5WVoyakQ1SitoUDNt?=
 =?utf-8?B?YU9pVGZ6eUVVNTA3b0orVFZpNzk5MTRlQ09GbkZsb3liVFRickJTS09md1RU?=
 =?utf-8?B?MFB0RWU5VzBZeDc4ZGtEdlJVZFEvWTRMWGt2aU81eGtaM2R2S0NDMnpsUUNY?=
 =?utf-8?B?QWZpRUg3eXBDTm9HYXNxQlB0ZnRqcjhVdVYzRU5BR1YvQXRUNUVuenhpL09p?=
 =?utf-8?Q?vEojueEtCz8hhdsHf33949Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF233DBC7730614FBADD5A133D641D97@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90dc1507-813f-443a-7406-08db30b3284b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2023 00:10:23.5967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jW/rkpbxWy3ts78pfIhq+DozOlxs0k/xIxuly8QqFEH56DFIyf7IZ1F2cE2Y0uF7MulfDVYP4SreNl8TT45S9YzTeIwPc5vAouUgBxDp6hEIVA4Znrss/v9xQeg9HuxW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6178
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>, "Lahtinen,
 Joonas" <joonas.lahtinen@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Harrison,
 John C" <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiBXZWQsIDIwMjMtMDMtMjkgYXQgMDg6NDMgKzAxMDAsIFR2cnRrbyBVcnN1bGluIHdyb3Rl
Og0KPiBPbiAyOC8wMy8yMDIzIDE4OjUyLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+ID4gT24gVHVl
LCBNYXIgMjgsIDIwMjMgYXQgMDU6MDE6MzZQTSArMDAwMCwgVGVyZXMgQWxleGlzLCBBbGFuIFBy
ZXZpbiB3cm90ZToNCj4gPiA+IE9uIE1vbiwgMjAyMy0wMy0yNyBhdCAxNzoxNSArMDEwMCwgVHZy
dGtvIFVyc3VsaW4gd3JvdGU6DQo+ID4gPiANCmFsYW46c25pcA0KPiBIb3cgd2lsbCB0aGUgY29u
dGV4dCBjcmVhdGUgcGF0aCBsb29rIGxpa2Ugb24gdGhvc2UgcGxhdGZvcm1zOg0KPiANCj4gMS4g
QmxvY2ssIHRoZW4gcG90ZW50aWFsbHkgZXJyb3Igb3V0IGlmIHRoZSBmdWxsIGluaXRpYWxpemF0
aW9uIGZhaWxlZC4NCj4gMi4gRXJyb3Igb3V0ICJpbiBwcm9ncmVzcyIgd2hpbGUgaW5pdGlhbGl6
aW5nLCBlcnJvciBvdXQgInNvbWV0aGluZyANCj4gZWxzZSIgaWYgaW5pdGlhbGl6YXRpb24gZmFp
bGVkLg0KPiANCmFsYW46aSB3YXMgdGhpbmtpbmcgb2YgdGFraW5nIGEgcGFnZSBmcm9tIGh1Yy1h
dXRoZW50aWNhdGlvbidzIGdldC1wYXJhbSB3aGVyZSB3ZSBjb3VsZCByZXR1cm4gZGlmZmVyZW50
IHZhbHVlcyBiYXNlZCBvbiBzdGFydHVwIHByb2dyZXNzIC0gaW4gYWxsIGNhc2VzIHdlIG5ldmVy
IGJsb2NrOg0KIDEuIHdlIGRvbnQgc3VwcG9ydCBpdCBpbiBody9rZXJuZWwgKGkuZS4gbm90IHB4
cCBpbiBkZXZpY2UtaW5mbyBvciBub3QgZW5vdWdoIENPTkZJR19mb28gLSByZXVzaW5nIGludGVs
X3B4cF9pc19zdXBwb3J0ZWQ/KQ0KIDIuIHdlIHN1cHBvcnQgaXQgaW4ga2VybmVsIGJ1dCBpbnRl
cm5hbCBkZXBlbmRlbmNpZXMgYXJlIHN0aWxsIGluIHByb2dyZXNzIChpLmUuIHdlIGhhdmUgbm90
IHlldCBjb21wbGV0ZWQgaHVjLWxvYWRpbmcvaHVjLWF1dGhlbi9wcm94eS1pbml0IC0gVUFQSSBz
cGVjIHNob3VsZCBpbmNsdWRlIGhvdyBtYW55DQptYXggc2Vjb25kcyBkZWxheSBwZXIgcGxhdGZv
cm0pDQogMy4gd2Ugc3VwcG9ydCBpdCBpbiBrZXJuZWwgYnV0IGludGVybmFsIGRlcGVuZGVuY2ll
cyBmYWlsZWQgKGkuZS4gd2Uga25vdyBodWMtbG9hZC9hdXRoZW50LiBmYWlsZWQgLi4uIG9yIHdl
IGtub3cgcHJveHktaW5pdCBmYWlsZWQpLg0KIDQuIHdlIHN1cHBvcnQgaXQgaW4ga2VybmVsIGJ1
dCBwbGF0Zm9ybSBoYXMgbm8gc3VwcG9ydCAoYXQgdGhpcyBzdGFnZSB3ZSBhY3R1YWxseSBhdHRl
bXB0IHRvIGNyZWF0ZSBhIFBYUCBjb250ZXh0IG9yIGNyZWF0ZSB0aGUgYXJiLXNlc3Npb24gZnJv
bSBpbnNpZGUgaTkxNS1nZXQtcGFyYW0gYnV0IHdlIGVuZGVkDQp1cCBhIFBYUCBmdyBlcnJvciBp
bmRpY2F0aW5nIHNlbGVjdCBsaXN0IG9mIGZhaWx1cmVzIHN1Y2ggYXMgZnVzaW5nIC8gQklPUy1j
b25maWcgLyB3cm9uZy12ZXJzaW9uLg0KIDAuIHdlIHN1cHBvcnQgaXQgY29tcGxldGVseSBpLmUu
IHN0ZXAgNCdzIGF0dGVtcHQgdG8gY3JlYXRlIGFjdGl2ZSBQWFAgc2Vzc2lvbiBzdWNjZWVkZWQN
Cg0KSSB3YW50IHRvIGRpZmZlcmVudGlhdGUgMyBhbmQgNCAoYXMgb3Bwb3NlZCB0byByZXR1cm4g
eC1tZWFucy1FTk9ERVYpIGJlY2F1c2UgaSBoYXZlIGFtIHN1cmUgaXQgd2lsbCBzYXZlIGRlYnVn
IHRpbWUgd2hlbiBmYWNpbmcgY3VzdG9tZXIgaXNzdWVzLg0KT2ZjIHdlIHdpbGwgaGF2ZSB0byBv
cHRpbWl6ZSB0aGUgY2hlY2tpbmcgc2VxdWVuY2VzIGFib3ZlIGJ1dCBhdCAjNCwgd2Ugd291bGQg
YmUgY3JlYXRpbmcgYSBzZXNzaW9uIHdoaWNoIG1pZ2h0IHRha2UgdXAgdG8gfjIwMCBtaWxpc2Vj
cyBmb3IgdGhlIHJvdW5kIHRyaXAgcmVzcG9uc2UgZnJvbSBmdy4NCldlIGNvdWxkIHN0b3JlIGEg
ZmxhZyBpbiBpOTE1LXB4cC1pbnRlcm5hbC1zdHJ1Y3QgdG8gaW5kaWNhdGUgaWYgd2UgZXZlciBk
aWQgc3VjY2VlZCBhIHB4cCBjcmVhdGlvbiBhZnRlciBhIGZyZXNoIGJvb3QgLi4uIGludGVsX3B4
cF9pc19yZWFkeV9mb3JfYWN0aXZlKCk/wqANCi4uLiB0cnVlIG9ubHkgaWYgd2UgZXZlciBkaWQg
YWxsb2NhdGUgYSBzbG90IHN1Y2Nlc3NmdWxseSBhdCBsZWFzdCBvbmNlIHNpbmNlIGJvb3QuDQpU
aGlzIGFsc28gZW5zdXJlIG1lc2EgaW5pdCB3aWxsIHJldHVybiBhbG1vc3QgaW1tZWRpYXRlbHkg
ZXhjZXB0IGF0IHRoZSBmaXJzdCB0aW1lIHdoZW4gaGl0dGluZyAjNC4NCg==
