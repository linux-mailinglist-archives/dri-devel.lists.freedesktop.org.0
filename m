Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 058E975BD3D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 06:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9DE10E61B;
	Fri, 21 Jul 2023 04:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8BC10E613;
 Fri, 21 Jul 2023 04:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689913741; x=1721449741;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MmlmhZoTC2G87YoKpF/IdQJVJtj2KMDajhDlG10m76o=;
 b=lvhjWJ5prHPxS6yGEE11mO9zB9MjBuizeTV0okyzH8JA0GiYrNjokhM6
 p1Y8ZiWw2fcXamreyUYZMvc1aFgRDXObduxTAvhyNpyl4ZdNWx5xFoi4r
 6NaGF1m390htCOn3Gnqq4BIEkc1UT9QCvxQCI+iCvo7dRnCgpybL4atYe
 NLM9oNhCEJf7SVeb27ntnbSLlWRAII7ZDEjpoAstZcaqIJjMj5fR8p0sV
 lO6Jw8Vo6m6nnrT4056Y0lVwqfV5RVlw2zyH6Jzc2/NXtAWQgG1pYbuaH
 vty5+YlMfBzzH7aRrVZ8/af2XOJmKXE6NyJj+gvpxCe2d0Ipwuc6LsE1v Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="351813735"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="351813735"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 21:29:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="1055431888"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="1055431888"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 20 Jul 2023 21:29:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 21:29:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 21:29:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 21:29:00 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 21:28:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mo8iTj/p/2OA5dxLiUcbLXxMwwenfbRFTNuvCqeWoCfmBEm+5foMrGyFvzlmoAw4JhJkcYRFxQkZ7qNzvGYTwu1qz+XX/GnwK0Nw0pDXsDng0sUPKCJphrb6L1gp4BB657K9dm+J6Ybua0bSgDHIRbFGKY5bXTjj34BWDgkCZChG9ZZ2NcHi31XH4q1QyWWcVC/GCM+lA1mFh/kpRvTYFNGoVQkWocZtTWjGuI3LdPgEASk03TjrbSwuZXPAJbEW1U8TNtMRjiyBCOOFgSqUkRYvaDb43ol+s3aY5Yrdqlt1V1wy9GU4P6TQan5dr8dDXV0h9SRHYGraezT4lHfLqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmlmhZoTC2G87YoKpF/IdQJVJtj2KMDajhDlG10m76o=;
 b=G1fVnfAbCHf9y4oWorDkl04yewhD6+Wv0dc3Ex11y4N/KOjwLV2EkMQyDu6hBnI1jFBcS5de9R+ZV8lFqWoWdsfM9gfz+xa7Rfo+4It1B8F5C33rirCUVGhr5sO99jYQK5cQtrOZsiBGpczEMhOCFs2PaIsEIhS09fnmL+KHJx6/NN7Ebv6JS+JRPd0e92SL8LWAV298cyN/1nKZmPTibBmak/utGaTUBDrqe07FlvIEAEPSZarFyMrj99cX/m+8Mn3mt1adQPMWXgMY4bIPNi34C7m3KkXsQY0kH3ieaUE2q7+kqmc9Zrof3tks96w2PK/WLIEgL11VaPBqYk6QsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by PH0PR11MB4949.namprd11.prod.outlook.com (2603:10b6:510:31::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 04:28:57 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::ca92:81a9:39f7:933b]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::ca92:81a9:39f7:933b%4]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 04:28:57 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH v3] drm/i915: Refactor PAT/object cache handling
Thread-Topic: [PATCH v3] drm/i915: Refactor PAT/object cache handling
Thread-Index: AQHZuj3S3fKOcuZYgEmEIa0jSNqDGq/BrRqAgAACt9CAABwjAIAA3qWAgAD3shA=
Date: Fri, 21 Jul 2023 04:28:56 +0000
Message-ID: <BYAPR11MB2567836F0A56371CC86111739A3FA@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230719123730.1094726-1-tvrtko.ursulin@linux.intel.com>
 <20230719223143.GP138014@mdroper-desk1.amr.corp.intel.com>
 <BYAPR11MB2567588886FB6EC3F357586B9A3EA@BYAPR11MB2567.namprd11.prod.outlook.com>
 <20230720002208.GU209733@mdroper-desk1.amr.corp.intel.com>
 <51198371-0943-e4fc-41d8-4c3ac07409cf@linux.intel.com>
In-Reply-To: <51198371-0943-e4fc-41d8-4c3ac07409cf@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|PH0PR11MB4949:EE_
x-ms-office365-filtering-correlation-id: 69c827d9-21b1-47db-e68b-08db89a2ff91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tObTqY8BtTq64h7fgcL49ErTVypRoCSrUyphC7b2hjp8NizYX3CZmr7dse9kHsFZpmlxy+HvhzJobtQ00THTFGfYGsqGoEXVb3gMEFO7WGJ7qY7+SS5OGkUJMbV4omUt21Vkb8XXp3QJ/Y4VCpn0HwHF4UJwABpHmWtznX5h9VpANnUxxJgUo2o/c5grAOOmV6u+X888fnuq2cNsbcDtQ+AzeLtZM3/A0jbmU4wugpi8rTgL46zNjliOy/CcVJqlfUGLXsZQwyPSRb/8kC3/WQ6gA+jotRPdhFJeejRRLf9yYI0jyW43XYGTSHnDN7g6KCEmA7WalVeS1DLfjLryqSZ7TVJ/x9MCwTfX6Ox36ANkK0LdhEVlIqI/r50mHso20nGD0RvgAsUgZ+xjxzVTAGk2HXzGNGI8LQrHJp3VSIiwNmqQQ2wyUgFDmClJdd0LFYyj7EgB7znBq/nLQpiuJT77XfWOQiGdPzy8qnb49PZ/vOqzG4WJPuwrfUDzaq/MT8QQ/iJlSd9QdswMPXoZCiOUXJY59i5Sl6yCPNZT7QN1B7Kgy2IcD3TM6XUclPfdMs1Kgwmaaz3SBnS5Lput0WhAcTVHXzRyx5HuGdwKJzzt2zMIrJSDwLUwDKZ8Mk1Z
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(39860400002)(136003)(396003)(346002)(451199021)(55016003)(26005)(186003)(71200400001)(6506007)(4326008)(64756008)(66446008)(66556008)(76116006)(83380400001)(66946007)(316002)(6636002)(52536014)(8936002)(41300700001)(5660300002)(8676002)(7696005)(66476007)(9686003)(478600001)(2906002)(54906003)(110136005)(86362001)(33656002)(82960400001)(38070700005)(122000001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHQ5VzhOM3puV0NqTysxeGZzc1JXc3REaUR4UXhaZ0tEZFdWbDNxUTRVY0NV?=
 =?utf-8?B?UEV5ejVLa0h6YnUxTFk5K0k2YUVEMFVhOEhWeTc4UGI4OG1zNFJhWStFcHBM?=
 =?utf-8?B?ZDFXeHJFMTI1WFNBTGlPNkY5S251UCtjemJ6b2pqK2kvMFJldzVUNG01N2FH?=
 =?utf-8?B?SEVCN3VxYUFTOXNsOGpTUTZkRWliU0NLZGNnWnM4UDVEd3ZrRXRiMTBhdjhC?=
 =?utf-8?B?NFJna0R4U1ZObUVhUGNKZTNNSHNaYWZqdGREcjEzOGNnNDNvSlZpSzBsQ0Rv?=
 =?utf-8?B?YkxzNGZackIzSVZEak8vVksydXluRXZWRkNlVURaeHJKQTBiVlR6L1ZEYmZQ?=
 =?utf-8?B?RTNsUXBHTEVwQm9YQ1ltOUJyTUlFWXBod1JUR01VOFZaQW03bEdRU3FFcFJ1?=
 =?utf-8?B?WWJqV3kxeGlHNC85Z0Q3TWdocUllQXJhMmlsZHVyWHZMOEE1b3ZwQkUzOTNV?=
 =?utf-8?B?Y0hUVXk0QmR0NjBvV1JDNlRiOUhJWnV5a21uL2Y1M3hpZWdsUEtraExXbUhk?=
 =?utf-8?B?Rkd1Tyt0QWhlZ3Y5Zy93YysvOEkzRzM0RFZ3ejlKZ2d4eGpkYmdDM3Bhc01F?=
 =?utf-8?B?U2s0b29SOGd2RmxyT0JndzFEeVJjL0EvL1U3dUZmUHcyVTltMUQ1bXRka1BX?=
 =?utf-8?B?SVRLRGN3Y0hlYlJFdXlsTjd3NzlYb0NMR1pXdWFxUmxyVnpLZGxFQ1l6dVlZ?=
 =?utf-8?B?cTFEeVIvSGdLak93T3VBOU1rdVRWbEVpeG1GeXNySXlSUGY1K0x4akdGeUpV?=
 =?utf-8?B?UFQ1OVFkaE01djZnd1V3TFNLdStreU1FeXJCQTBhWllxK1hSM2Erb09qM0NK?=
 =?utf-8?B?YmRndHkrR1JkL3FyWkdVMElJeVZ6ck1JOG40cEZqTFpBc0w1TUdwRW1DS0d3?=
 =?utf-8?B?cTZEbVdWT1ZBOWI1dFV6dVQ2aDg2RmNzcHpGbTNrRVBXb0xLbjRtZXp3Zlg0?=
 =?utf-8?B?TG1SbVVkV1N0cXFrbFZrOEowY0pvcmsrZWtHQUpQaEhGRXExdUVUK3EzQW8z?=
 =?utf-8?B?YnpVN2lhTXhNTy92alFmL3Jpb1Q2bFRTUUJ6REhyVnVkbldZY2lFNVBvY3VK?=
 =?utf-8?B?Smo5djVZSmtJUVNnUFNILzVYaktaSjVnQVpaN25BRkZkK0M5dldvSVVCUDc2?=
 =?utf-8?B?TkV1RmFpekxsN3pmTEc0aDJLNmJpcnJQOU9oQTV2b0tTWnJ0K1g2R2VWdkJl?=
 =?utf-8?B?c3RFUExoTFB0dHhxZVJ6eXlrSElFUkFVZm9nMUMxalI4ZlB1WVExRldKMUNF?=
 =?utf-8?B?RGlHMHhUVWgwWnNGMk04bWt5bHQwMmlDV0RnMTFQUmRxbHo2WFpQSFhqVmg3?=
 =?utf-8?B?TkszY2l4eXdBRXNyMXZUbWF6clV1dURra2VHd3d0eXUwaThsdmNpRnRsZ2ph?=
 =?utf-8?B?clc5dSszMS9wVkJVWWNuQXB4bGl5L3UyQUNTdFh3R3FwUTRpc0pDaVdqalhw?=
 =?utf-8?B?d2d5eGR6MXFid0FlYTJSZi9TdkRJc1A5M2RDREcrNklCQU5oY2dpZ1g2QnFK?=
 =?utf-8?B?SkhQcG03ZEUxWXk1Mzd5amJsQU5yVnE3aFRLNnpOL2EzKzhPbUtteFp3b01p?=
 =?utf-8?B?ZnhCSHhKMXdnNU5SZTlKd01WRlZxTEtBU3d1TWZneWlXc2dqZXBYK0tOV0lw?=
 =?utf-8?B?YXVNYTh0YWhCb2grVmM1TkNDdStmbTc0cHEzcFFtL3BMWU1wc0dxN0Q1cFY1?=
 =?utf-8?B?djgveE0ydzNWa1BVUlZITXRxUEdrbzFWTTBPUVRvNzNVc3pKYm9JRUREc0Uy?=
 =?utf-8?B?QUluck1SS3BCMGFPYmU4bnNRaVlEVmVVOWRTc0pIaGw2d1MrM2pOWlRua3Vt?=
 =?utf-8?B?UFkrdElPc3NBYzh3QnZSbVlDeFRzZEptYWcwTWVDdmhNZ3BjSkZmMDhJUTA5?=
 =?utf-8?B?UEw0RWVmWnc1NmYzTDN3NjJGWUhIbTZ6MmZiV1EyVjVpd1JwR2hHQis3RTRC?=
 =?utf-8?B?MFZHZXRYUjgwSHREZlZyeXE4YjZjR0xjdnBTRU1KOGxXS0hBVjRpSmxrRUxQ?=
 =?utf-8?B?NEk0RmlWVmx3RmlyRFkzdXpvY1VzR2xTWE9SUThPV2FYQjNEbWNYdHBxWFJQ?=
 =?utf-8?B?U1h1NnJUU2VnK21aaUFqSFMyNTd3Y2c0YjBhVDNNWDczWDQxbDNPNzE3Mlpw?=
 =?utf-8?Q?+yM0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c827d9-21b1-47db-e68b-08db89a2ff91
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 04:28:56.8458 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /CkyLFHpxLHBsFA/FjGpXc1a9b1M/ZPTQCQ0dEXswiUXIP2/zBC0WvypeT5DgueXIztm6Y4RoVGazTpfvWA78A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4949
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
Cc: "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pj4+IFtzbmlwXQ0KPj4+Pj4gQEAgLTI3LDE1ICsyOCw4IEBAIHN0YXRpYyBib29sIGdwdV93cml0
ZV9uZWVkc19jbGZsdXNoKHN0cnVjdA0KPj4+Pj4gZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqKQ0K
Pj4+Pg0KPj4+PiBUaGUgY29kZSBjaGFuZ2UgaGVyZSBsb29rcyBhY2N1cmF0ZSwgYnV0IHdoaWxl
IHdlJ3JlIGhlcmUsIEkgaGF2ZSBhDQo+Pj4+IHNpZGUgcXVlc3Rpb24gYWJvdXQgdGhpcyBmdW5j
dGlvbiBpbiBnZW5lcmFsLi4uaXQgd2FzIG9yaWdpbmFsbHkNCj4+Pj4gaW50cm9kdWNlZCBpbiBj
b21taXQgNDgwMDQ4ODFmNjkzICgiZHJtL2k5MTU6IE1hcmsgQ1BVIGNhY2hlIGFzDQo+Pj4+IGRp
cnR5IHdoZW4gdXNlZCBmb3INCj4+Pj4gcmVuZGVyaW5nIikgd2hpY2ggc3RhdGVzIHRoYXQgR1BV
IHJlbmRlcmluZyBlbmRzIHVwIGluIHRoZSBDUFUgY2FjaGUNCj4+Pj4gKGFuZCB0aHVzIG5lZWRz
IGEgY2xmbHVzaCBsYXRlciB0byBtYWtlIHN1cmUgaXQgbGFuZHMgaW4gbWVtb3J5KS4NCj4+Pj4g
VGhhdCBtYWtlcyBzZW5zZSB0byBtZSBmb3IgTExDIHBsYXRmb3JtcywgYnV0IGlzIGl0IHJlYWxs
eSB0cnVlIGZvcg0KPj4+PiBub24tTExDIHNub29waW5nIHBsYXRmb3JtcyAobGlrZSBNVEwpIGFz
IHRoZSBjb21taXQgc3RhdGVzPw0KPj4+DQo+Pj4gRm9yIG5vbi1MTEMgcGxhdGZvcm1zIG9iamVj
dHMgY2FuIGJlIHNldCB0byAxLXdheSBjb2hlcmVudCB3aGljaA0KPj4+IG1lYW5zIEdQVSByZW5k
ZXJpbmcgZW5kaW5nIHVwIGluIENQVSBjYWNoZSBhcyB3ZWxsLCBzbyBmb3Igbm9uLUxMQw0KPj4+
IHBsYXRmb3JtIHRoZSBsb2dpYyBoZXJlIHNob3VsZCBiZSBjaGVja2luZyAxLXdheSBjb2hlcmVu
dCBmbGFnLg0KPj4NCj4+IFRoYXQncyB0aGUgcGFydCB0aGF0IEknbSBxdWVzdGlvbmluZyAoYW5k
IG5vdCBqdXN0IGZvciBNVEwsIGJ1dCBmb3INCj4+IGFsbCBvZiBvdXIgb3RoZXIgbm9uLUxMQyBw
bGF0Zm9ybXMgdG9vKS4gIEp1c3QgYmVjYXVzZSB0aGVyZSdzDQo+PiBjb2hlcmVuY3kgZG9lc24n
dCBtZWFuIHRoYXQgZGV2aWNlIHdyaXRlcyBsYW5kZWQgaW4gdGhlIENQVSBjYWNoZS4NCj4+IENv
aGVyZW5jeSBpcyBhbHNvIGFjaGlldmVkIGlmIGRldmljZSB3cml0ZXMgaW52YWxpZGF0ZSB0aGUg
Y29udGVudHMgb2YgdGhlIENQVSBjYWNoZS4NCj4+IEkgdGhvdWdodCBvdXIgbm9uLUxMQyBzbm9v
cGluZyBwbGF0Zm9ybXMgd2VyZSBjb2hlcmVudCBkdWUgdG8NCj4+IHdyaXRlLWludmFsaWRhdGUg
cmF0aGVyIHRoYW4gd3JpdGUtdXBkYXRlLCBidXQgSSBjYW4ndCBmaW5kIGl0DQo+PiBzcGVjaWZp
Y2FsbHkgZG9jdW1lbnRlZCBhbnl3aGVyZSBhdCB0aGUgbW9tZW50LiAgSWYgd3JpdGUtaW52YWxp
ZGF0ZQ0KPj4gd2FzIHVzZWQsIHRoZW4gdGhlcmUgc2hvdWxkbid0IGJlIGEgbmVlZCBmb3IgYSBs
YXRlciBjbGZsdXNoIGVpdGhlci4NCj4NCj4gW1RyeWluZyB0byBjb25zb2xpZGF0ZSBieSBkb2lu
ZyBhIGNvbWJpbmVkIHJlcGx5IHRvIHRoZSBkaXNjdXNzaW9uIHNvIGZhci5dDQo+DQo+IE9uIHRo
ZSB3cml0ZS1pbnZhbGlkYXRlIHZzIHdyaXRlLXVwZGF0ZSBJIGRvbid0IGtub3cuIElmIHlvdSBk
aWQgbm90DQo+IGZpbmQgaXQgaW4gYnNwZWMgdGhlbiBJIGRvdWJ0IEkgd291bGQuIEkgY2FuIGhh
dmUgYSBicm93c2Ugc3RpbGwuDQoNCk1hdHQgd2FzIGNvcnJlY3QuIFF1b3RlIFJvbiBTaWx2YXMg
ZnJvbSBTVyBBUkNILCAiTVRMIEdQVSBkb2Vzbid0IHdyaXRlIHRvDQpDUFUgY2FjaGUsIGl0IHNp
bXBseSBzbm9vcCBDUFUgY2FjaGUgb24gaXRzIHdheSB0byBSQU0uIg0KDQo+Pj4+IE15IHVuZGVy
c3RhbmRpbmcNCj4+Pj4gd2FzIHRoYXQgc25vb3BpbmcgcGxhdGZvcm1zIGp1c3QgaW52YWxpZGF0
ZWQgdGhlIENQVSBjYWNoZSB0bw0KPj4+PiBwcmV2ZW50IGZ1dHVyZSBDUFUgcmVhZHMgZnJvbSBz
ZWVpbmcgc3RhbGUgZGF0YSBidXQgZGlkbid0IGFjdHVhbGx5DQo+Pj4+IHN0aWNrIGFueSBuZXcg
ZGF0YSBpbiB0aGVyZT8gIEFtIEkgb2ZmIHRyYWNrIG9yIGlzIHRoZSBvcmlnaW5hbA0KPj4+PiBs
b2dpYyBvZiB0aGlzIGZ1bmN0aW9uIG5vdCBxdWl0ZSByaWdodD8NCj4+Pj4NCj4+Pj4gQW55d2F5
LCBldmVuIGlmIHRoZSBsb2dpYyBvZiB0aGlzIGZ1bmN0aW9uIGlzIHdyb25nLCBpdCdzIGEgbWlz
dGFrZQ0KPj4+PiB0aGF0IHdvdWxkIG9ubHkgaHVydCBwZXJmb3JtYW5jZQ0KPj4+DQo+Pj4gWWVz
LCB0aGlzIGxvZ2ljIHdpbGwgaW50cm9kdWNlIHBlcmZvcm1hbmNlIGltcGFjdCBiZWNhdXNlIGl0
J3MNCj4+PiBtaXNzaW5nIHRoZSBjaGVja2luZyBmb3Igb2JqLT5wYXRfc2V0X2J5X3VzZXIuIEZv
ciBvYmplY3RzIHdpdGgNCj4+PiBwYXRfc2V0X2J5X3VzZXI9PXRydWUsIGV2ZW4gaWYgdGhlIG9i
amVjdCBpcyBzbm9vcGluZyBvciAxLXdheQ0KPj4+IGNvaGVyZW50LCB3ZSBkb24ndCB3YW50IHRv
IGVuZm9yY2UgYSBjbGZsdXNoIGhlcmUgc2luY2UgdGhlDQo+Pj4gY29oZXJlbmN5IGlzIHN1cHBv
c2VkIHRvIGJlIGhhbmRsZWQgYnkgdXNlciBzcGFjZS4NCj4NCj4gV2hhdCBzaG91bGQgSSBhZGQg
eW91IHRoaW5rIHRvIGZpeCBpdD8NCg0KSSB0aGluayB0aGUgc2ltcGxlc3Qgd291bGQgYmUNCg0K
ICAgICAgICBpZiAob2JqLT5wYXRfc2V0X2J5X3VzZXIpDQogICAgICAgICAgICAgICAgcmV0dXJu
IGZhbHNlOw0KDQpiZWNhdXNlIGV2ZW4gY2hlY2tpbmcgZm9yIGluY29oZXJlbnQgV0IgaXMgdW5u
ZWNlc3NhcnksIHNpbXBseSBubw0KbmVlZCBmb3IgdGhlIEtNRCB0byBpbml0aWF0ZSBhIGZsdXNo
IGlmIFBBVCBpcyBzZXQgYnkgdXNlci4NCg0KPiBBZGQgYSBjaGVjayBmb3Igbm9uLWNvaGVyZW50
IFdCIGluIGdwdV93cml0ZV9uZWVkc19jbGZsdXNoIGFzIGFuIGFkZGl0aW9uYWwgY29uZGl0aW9u
IGZvciByZXR1cm5pbmcgZmFsc2U/DQo+DQo+IEFuZCB0aGVuIGlmIE1hdHQgaXMgY29ycmVjdCB3
cml0ZS1pbnZhbGlkYXRlIGlzIHVzZWQgYWxzbyAhSEFTX0xMQyBzaG91bGQganVzdCByZXR1cm4g
ZmFsc2U/DQo+DQo+Pj4+IChmbHVzaGluZyBtb3JlIG9mdGVuIHRoYW4gd2UgdHJ1bHkgbmVlZCB0
bykgcmF0aGVyIHRoYW4NCj4+Pj4gZnVuY3Rpb25hbGl0eSwgc28gbm90IHNvbWV0aGluZyB3ZSBy
ZWFsbHkgbmVlZCB0byBkaWcgaW50byByaWdodCBub3cNCj4+Pj4gYXMgcGFydCBvZiB0aGlzIHBh
dGNoLg0KPj4+Pg0KPj4+Pj4gICAgICAgaWYgKElTX0RHRlgoaTkxNSkpDQo+Pj4+PiAgICAgICAg
ICAgICAgIHJldHVybiBmYWxzZTsNCj4+Pj4+DQo+Pj4+PiAtICAgIC8qDQo+Pj4+PiAtICAgICAq
IEZvciBvYmplY3RzIGNyZWF0ZWQgYnkgdXNlcnNwYWNlIHRocm91Z2ggR0VNX0NSRUFURSB3aXRo
IHBhdF9pbmRleA0KPj4+Pj4gLSAgICAgKiBzZXQgYnkgc2V0X3BhdCBleHRlbnNpb24sIGk5MTVf
Z2VtX29iamVjdF9oYXNfY2FjaGVfbGV2ZWwoKSB3aWxsDQo+Pj4+PiAtICAgICAqIGFsd2F5cyBy
ZXR1cm4gdHJ1ZSwgYmVjYXVzZSB0aGUgY29oZXJlbmN5IG9mIHN1Y2ggb2JqZWN0IGlzIG1hbmFn
ZWQNCj4+Pj4+IC0gICAgICogYnkgdXNlcnNwYWNlLiBPdGhlcmVpc2UgdGhlIGNhbGwgaGVyZSB3
b3VsZCBmYWxsIGJhY2sgdG8gY2hlY2tpbmcNCj4+Pj4+IC0gICAgICogd2hldGhlciB0aGUgb2Jq
ZWN0IGlzIHVuLWNhY2hlZCBvciB3cml0ZS10aHJvdWdoLg0KPj4+Pj4gLSAgICAgKi8NCj4+Pj4+
IC0gICAgcmV0dXJuICEoaTkxNV9nZW1fb2JqZWN0X2hhc19jYWNoZV9sZXZlbChvYmosIEk5MTVf
Q0FDSEVfTk9ORSkgfHwNCj4+Pj4+IC0gICAgICAgICAgICAgaTkxNV9nZW1fb2JqZWN0X2hhc19j
YWNoZV9sZXZlbChvYmosIEk5MTVfQ0FDSEVfV1QpKTsNCj4+Pj4+ICsgICAgcmV0dXJuIGk5MTVf
Z2VtX29iamVjdF9oYXNfY2FjaGVfbW9kZShvYmosIEk5MTVfQ0FDSEVfTU9ERV9VQykgIT0gMSAm
Jg0KPj4+Pj4gKyAgICAgICAgICAgaTkxNV9nZW1fb2JqZWN0X2hhc19jYWNoZV9tb2RlKG9iaiwg
STkxNV9DQUNIRV9NT0RFX1dUKSAhPSAxOw0KPj4+Pj4gICB9DQo+Pj4NCj4+PiBbc25pcF0NCj4+
Pj4+IEBAIC02NDAsMTUgKzY0MCw5IEBAIHN0YXRpYyBpbmxpbmUgaW50IHVzZV9jcHVfcmVsb2Mo
Y29uc3Qgc3RydWN0IHJlbG9jX2NhY2hlICpjYWNoZSwNCj4+Pj4+ICAgICAgIGlmIChEQkdfRk9S
Q0VfUkVMT0MgPT0gRk9SQ0VfR1RUX1JFTE9DKQ0KPj4+Pj4gICAgICAgICAgICAgICByZXR1cm4g
ZmFsc2U7DQo+Pj4+Pg0KPj4+Pj4gLSAgICAvKg0KPj4+Pj4gLSAgICAgKiBGb3Igb2JqZWN0cyBj
cmVhdGVkIGJ5IHVzZXJzcGFjZSB0aHJvdWdoIEdFTV9DUkVBVEUgd2l0aCBwYXRfaW5kZXgNCj4+
Pj4+IC0gICAgICogc2V0IGJ5IHNldF9wYXQgZXh0ZW5zaW9uLCBpOTE1X2dlbV9vYmplY3RfaGFz
X2NhY2hlX2xldmVsKCkgYWx3YXlzDQo+Pj4+PiAtICAgICAqIHJldHVybiB0cnVlLCBvdGhlcndp
c2UgdGhlIGNhbGwgd291bGQgZmFsbCBiYWNrIHRvIGNoZWNraW5nIHdoZXRoZXINCj4+Pj4+IC0g
ICAgICogdGhlIG9iamVjdCBpcyB1bi1jYWNoZWQuDQo+Pj4+PiAtICAgICAqLw0KPj4+Pj4gICAg
ICAgcmV0dXJuIChjYWNoZS0+aGFzX2xsYyB8fA0KPj4+Pj4gICAgICAgICAgICAgICBvYmotPmNh
Y2hlX2RpcnR5IHx8DQo+Pj4+PiAtICAgICAgICAgICAgIWk5MTVfZ2VtX29iamVjdF9oYXNfY2Fj
aGVfbGV2ZWwob2JqLCBJOTE1X0NBQ0hFX05PTkUpKTsNCj4+Pj4+ICsgICAgICAgICAgICBpOTE1
X2dlbV9vYmplY3RfaGFzX2NhY2hlX21vZGUob2JqLA0KPj4+Pj4gKyBJOTE1X0NBQ0hFX01PREVf
VUMpICE9IDEpOw0KPj4+Pg0KPj4+PiBQbGF0Zm9ybXMgd2l0aCByZWxvY2F0aW9ucyBhbmQgcGxh
dGZvcm1zIHdpdGggdXNlci1zcGVjaWZpZWQgUEFUDQo+Pj4+IGhhdmUgbm8gb3ZlcmxhcCwgcmln
aHQ/ICBTbyBhIC0xIHJldHVybiBzaG91bGQgYmUgaW1wb3NzaWJsZSBoZXJlDQo+Pj4+IGFuZCB0
aGlzIGlzIG9uZSBjYXNlIHdoZXJlIHdlIGNvdWxkIGp1c3QgdHJlYXQgdGhlIHJldHVybiB2YWx1
ZSBhcw0KPj4+PiBhIGJvb2xlYW4sIHJpZ2h0Pw0KPj4+DQo+DQo+IEhtIG5vLCBvciBtYXliZS4g
TXkgdGhpbmtpbmcgYmVoaW5kIHRyaS1zdGF0ZSBpcyB0byBhbGxvdyBhIHNhZmUgb3B0aW9uDQo+
IGZvciAiZG9uJ3Qga25vdyIuIEluIGNhc2UgUEFUIGluZGV4IHRvIGNhY2hlIG1vZGUgdGFibGUg
aXMgbm90IGZ1bGx5DQo+IHBvcHVsYXRlZCBvbiBzb21lIGZ1dHVyZSBwbGF0Zm9ybS4NCg0KVGhh
dCB3b3VsZCBiZSBhIHByb2JsZW0gaW4gdGhlIGNhY2hlIG1vZGUgdGFibGUuIEF0IGxlYXN0IG1h
eF9wYXRfaW5kZXgNCnNob3VsZCBoYXZlIGd1YXJhbnRlZWQgdGhlIFBBVCBpbmRleCBpcyBzYW5l
Lg0KDQotRmVpDQo=
