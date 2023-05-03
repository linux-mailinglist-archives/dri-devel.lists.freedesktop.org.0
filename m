Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3CE6F6039
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 22:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239BB10E046;
	Wed,  3 May 2023 20:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC50810E038;
 Wed,  3 May 2023 20:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683146397; x=1714682397;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cAhzrPLSlpfFp7pmKQQLXjii8Ar+eTyXLpZ8Z9LL9zY=;
 b=JZv4TpojcH4LpRUdsUPVYNSUjRNXhJSNCLlKfPGe0MbWaX67i+XcD2Jx
 VS0LAztYRlEh9Y9LHxlU9ZFDV02gjRc3Ke5HIsd4vUz8To+lkxOuBovIu
 laTFCBJjAC9sNozQzLdQJQmF1EkSnd5dJ4LarGxSWcuJg03ul4Jvm6X4k
 ueCaJnbc9DAsSShX/YNuOhUZj7MTxELWrQQkL62c83gxL05Iry51EPNav
 SxllmNdjbwXzyMbHHCS4TpjmHeznymqqSGoaESRU3VY4XRwTPOCMVFRap
 8I4zF0vfxnxMFSq/YYZAnl/VMocxlhDjNQsJTQhcBJnfh6Om8zZaiaeJt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="414221121"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; d="scan'208";a="414221121"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 13:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="647053521"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; d="scan'208";a="647053521"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 03 May 2023 13:39:56 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 13:39:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 13:39:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 3 May 2023 13:39:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 3 May 2023 13:39:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4wF48CufdajzMw0i+SLcddayycOUopqJ8zz6b3f9xA5MUsjW4ZPGAg9XeXpOmONGE3r25UWr7dkeBVuhLz7LKU/VwOtW/L4MN1nCKFfB9c6RuqhmYadlezE6b9Mytxb8CrSvjmQnS/xrWuRSBQje76P9MO2OM1SOXuyRrfdj7Cc9NHMvywNcbkW4vtypdvIFdtR4C5ZjnASyMU8b3SXfrj7EaQS7J7pYpz4npH2aiPqwyGaoEL8t3jpjcRT25OlhUyY4PoZKG+0qTiJe7YWgMpRVxRYGJnZgO2IuZ3OcULYfzzRRuXKT+OkUDIf8sv/bWm1r/5LItW58MVEj91MSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAhzrPLSlpfFp7pmKQQLXjii8Ar+eTyXLpZ8Z9LL9zY=;
 b=Oq7elBvAplVd5XT7V57tv94j+ZzxTQcsJq7sIpA+jiY9yTow8juNiV1ObLE/y3e0fjmlb5n1hTx7+MKjNVw/9owRbywUlOsROlHJ1NOyWVPfnBPgyZZrgR6GgLfdQ1fIXOwWJL1ZGKRdVzA7BT6xTnDCOfUNJyp/JTBzv+RK4li2kk93QSP5uzkbUBM9w6o/4UKpOJGsP2IHjzM4vF/Bo+W+jrzM+58fX3UOGDueT2JyciRver/VmnxXmmdFz+oRO8BW753tQ3voQTV0QYhBPRwXyegofLrdJ6SSzEkdrw35wSdLetyXaX8/jSTFBu6T+a3sNAKBlpnbQa5coAVoHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 20:39:52 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::37e2:bdec:585b:383c]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::37e2:bdec:585b:383c%3]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 20:39:52 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v4 2/3] drm/i915: use pat_index instead of
 cache_level
Thread-Topic: [Intel-gfx] [PATCH v4 2/3] drm/i915: use pat_index instead of
 cache_level
Thread-Index: AQHZfKwgmsXBLGbbOUajfej1H9RrZ69IkEiAgAB0RqA=
Date: Wed, 3 May 2023 20:39:52 +0000
Message-ID: <BYAPR11MB256767693CB508F40A2B17DD9A6C9@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230502041200.2170424-1-fei.yang@intel.com>
 <20230502041200.2170424-3-fei.yang@intel.com>
 <f0e0df9a-2913-dfc3-042a-867e536c3ceb@linux.intel.com>
In-Reply-To: <f0e0df9a-2913-dfc3-042a-867e536c3ceb@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|BL3PR11MB6410:EE_
x-ms-office365-filtering-correlation-id: 5ac8bd82-b226-4641-a0de-08db4c168c22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j+9/3CdAa2Op+GfD0SGT+dIOQvezWQfZhCoIj5yddm6NqAsMP3ThxLLzfsn3b+EFZg6tgcsvBuNp0yWLr4yNF9W7ejKgLu+vU942/c1Y1sMGyXHD7d6UukangoAgKznNkJRuXi86XbpwiO7rdisYDYda4Wp8OQHU7shWvjx/RiZNhfvAEYR9Qeelrz/cilGJYYWPVgSLNuuDEI0IlQpfQe5CPJVkfwbwVggiut/wXLaPOxq3U10Q5L+3hLnMTqziQf6VrVsdKTEwOJyXaTZhr4eLdUS3GmH+G/kR8laCYP27l7c6WrdCv+MWxJNMVXeHjnsvSSj99stvbX423WbYR94ZclcK9SQ2kBbmZh4bEy3+AOXo1+1Tabbjr68octBhdhKl5QBNRRacISJPBNQWHav4rX3H1fwR3m6OTVBHB7/khkjXbVMAPWRm7FjWyWNQMXUcH6tHQEdxjlPe4G5ymGWdnVKfLR4Qt3P353ZTlmRUggXjC5MS1V/AUqcS1p93A4cMOqpjIrjvySoG+0qcMJX+EAVSVgpEDWcg0u9IOYRPkRaEWyBR50+Th9ZOSsNa2+YAnccFIg4KYfVerZCkzwYKlx/05ZseRM+GkYOFD6K1sjj16Wurbs1xIhwg6aqX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(136003)(366004)(346002)(396003)(451199021)(66446008)(76116006)(64756008)(66476007)(66556008)(66946007)(82960400001)(316002)(4326008)(7696005)(478600001)(71200400001)(110136005)(54906003)(86362001)(186003)(33656002)(55016003)(6506007)(9686003)(26005)(5660300002)(38070700005)(83380400001)(38100700002)(8936002)(52536014)(8676002)(41300700001)(122000001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFZVN1QrTEZBelU4T1lYaUpXeW9TdVNTd1ZVRjZTelg4ZnJPTm5zNE5MaW9P?=
 =?utf-8?B?TnJCd00vNmoxdi9ieGt6RlVSbnBpd3RIT0QrTVp3YW45OGVpZDQwZ1BneGtn?=
 =?utf-8?B?MFBrRzhZM0txb09YQnV0VUc0OXlFU2pzYkJ0VUdWL0haN3pBVm1oRzBuTDRH?=
 =?utf-8?B?dEdLRy9rNkFHSTlHMzd6Z0ZyYXVDZVErUnhERHhMOXpISmRxSHFhZVAvM0M3?=
 =?utf-8?B?TTY4TjVkL2x6NlJ0TFB6RjFEaWJSdEFDV1pRK0pwTis2WXhrK3lBKzVneVJM?=
 =?utf-8?B?UzFUOVloMEo5NXdOMzZVSXpOY2tydk5WMTZWYlVKUGpTVEN2TGtCTEEydWk3?=
 =?utf-8?B?VE5kaEtPcjJhNko4QXpnU1Q1SnEvYnoyVGdkM0ZvdkVFdnRjWGU5enJoZ3dU?=
 =?utf-8?B?cThOZ2hYZkRrMnV2RFJkZVBrVkFMVWU5QzBvejNvcmVUUXFFVHkwUmtnMDhi?=
 =?utf-8?B?VEtBdmZ4STJXTkNXZWErUTZtZThwMnJJQTZlczF0MUFoSXhCRTZOTjVSN2U5?=
 =?utf-8?B?ZzJsOU53NXpteldYOVpidkhWRnRPOHYxSUJ5MERMZGdoQmpwUDIxTkVtNHJV?=
 =?utf-8?B?NDhtVzZOQkNWM1diZ2ZkS3JERkpLVi9CemFTSytzMkxjUzFQN2dTbHBqRzNR?=
 =?utf-8?B?cUVHUTRqeG9BVWxybS9qMTRnak9uclZ1RE0yM3hnc21JNThKcVltQXVWeWhS?=
 =?utf-8?B?U2NvSDdsSmNRd1Y2UkVkdUFzUVhPSTZvdGNtVGlRMWRIQTZNbnVrdmJUeWxQ?=
 =?utf-8?B?Y3FpY0oxYVBuNVV1Y29adXZnSlJVeSsxMGs2ZUMyS3pVL0xmUzhYNmo5K042?=
 =?utf-8?B?emdGYVZIVy9FYVY0dmZtZWJOVVhtMFJVOU5RYUk4RkF5aU4yNmUwVnQ0eGt2?=
 =?utf-8?B?cXl0NVdWWXJXTUxtdjZDWW1WKzM1Z2xvZC9heVlwZ1JHNTk5R3piZ3VYTUJW?=
 =?utf-8?B?YmRIdWo1TFFaZFB3WlpNU1I5SFhyUUlBNzJDV25PV2xQRG9Ec2hCTjR5a2NY?=
 =?utf-8?B?WEtuTHJzbjJuNXNlZVFlWWgybENIekYxOGtYK1hGQlhhRVNsSmJubERHOE50?=
 =?utf-8?B?a0ZzRXhSQng0c09JUnpwM05ISUdVK0lKd2JscE4wVmV2QTVmOFZWanc3bEVF?=
 =?utf-8?B?Y3VVMnhBT0s4VnZ2M0hXcCtaWnF4V0E2Q2pGS3JKWStWQjRlcmFxMWRkSERC?=
 =?utf-8?B?WGRhanFzeEkyL1ovVTdCaDlaNHFuVkNLclZDUEFPd1B3cmNZbVR2SG9ha0pP?=
 =?utf-8?B?MnFRdTJ6RlorWktwYlB1UDVuWmF5c3RNdXdERVduQ3pKdUVDYWJLdlovakRL?=
 =?utf-8?B?ZllvdGtPTWZxUUFoRml5M09RVlRuUXlMbCtxTXl4Vi9lbVF0ZFlud2xBTnZa?=
 =?utf-8?B?TnZxMGE2WW1yM0JmT052Z3FqVy9Qc3FXUlVTSXFMS2dlMDA3L3NtdDF2Wjli?=
 =?utf-8?B?b2ZQYm5YT1V6NS9RaFF1cXJRVExOUmNNTXl0bXdyVTdIaFN6azZRalQzb2hS?=
 =?utf-8?B?R1VISXR5UVBVU0VsTm9tMW1rdUE5dm1KM013QmxlQVI4TXFicGF6d05mY0s4?=
 =?utf-8?B?cmZJb3FwaWFPTitXWm81Vm9rZEpId29oc3d5ZTlZWmluVGlZYzUrbWpMSnEw?=
 =?utf-8?B?VEQ5Zyt2VTZGZ1JxM3dZcG0rTk11cWFGdVdjczkwSDM3VTdEM0pGM0JGdTZl?=
 =?utf-8?B?OWRHcFpqc1o2dHVUYmwyWk1Rc1hYNzZkbTRqVHc3VWdKUmMwQW91Uk91QXRS?=
 =?utf-8?B?SFgxR09hb1pMS1VhRHRsQjlRVFNiaTgvbEtpZis2RGRvaGtCYThGNnZiTUNM?=
 =?utf-8?B?UnkyQlRiQnpQSDVuN09od3RmOGk2MGY1cFY3UXJ4VGNhR3hKMU9LQ09SZWVn?=
 =?utf-8?B?UmVGUEFCM2x3aVhxTVV1NjlIS1cwVGVYcTVIUVV6R3paUm4ySnhrQnAvb0xQ?=
 =?utf-8?B?SHdtTElSYXUxRHMzTmpXNC9zSFpDbDBVVm1IMXhHOHZTMGRjaWhCQW9hOTJI?=
 =?utf-8?B?Tjlva3pXNVFhNHltcWpSVHNQUkNLMjJXMGN5Q3BER2packprUDFaVi9WV25B?=
 =?utf-8?B?SEhuRkJYTkNTQjluNHFjdkJydThkV3dpUTlOenFiZytyRWs3ZlcxamV1SUlD?=
 =?utf-8?Q?Iurc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac8bd82-b226-4641-a0de-08db4c168c22
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2023 20:39:52.6594 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FhJMtfaNT1fKynJ27QNFiyRZElIKSau32XEhbp9HfWXKOH/QEwNnDGj507Z0PxNB4Br3uRQwp//qPWmP3ja1aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6410
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

Wy4uLl0NCg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dl
bV9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9vYmplY3QuYw0K
Pj4gaW5kZXggOGM3MGEwZWM3ZDJmLi4yN2M5NDgzNTBiNWIgMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0LmMNCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9vYmplY3QuYw0KPj4gQEAgLTU0LDYgKzU0LDI1IEBA
IHVuc2lnbmVkIGludCBpOTE1X2dlbV9nZXRfcGF0X2luZGV4KHN0cnVjdCBkcm1faTkxNV9wcml2
YXRlICppOTE1LA0KPj4gICAgICByZXR1cm4gSU5URUxfSU5GTyhpOTE1KS0+Y2FjaGVsZXZlbF90
b19wYXRbbGV2ZWxdOw0KPj4gICB9DQo+Pg0KPj4gK2Jvb2wgaTkxNV9nZW1fb2JqZWN0X2hhc19j
YWNoZV9sZXZlbChjb25zdCBzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqLA0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gaTkxNV9jYWNoZV9sZXZlbCBsdmwp
DQo+PiArew0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBjYWNoZV9sZXZlbCA9PSBJOTE1X0NBQ0hF
X0lOVkFMIGluZGljYXRlcyB0aGUgVU1EJ3MgaGF2ZSBzZXQgdGhlDQo+PiArICAgICAqIGNhY2hp
bmcgcG9saWN5IHRocm91Z2ggcGF0X2luZGV4LCBpbiB3aGljaCBjYXNlIHRoZSBLTUQgc2hvdWxk
DQo+PiArICAgICAqIGxlYXZlIHRoZSBjb2hlcmVuY3kgdG8gYmUgbWFuYWdlZCBieSB1c2VyIHNw
YWNlLCBzaW1wbHkgcmV0dXJuDQo+PiArICAgICAqIHRydWUgaGVyZS4NCj4+ICsgICAgICovDQo+
PiArICAgIGlmIChvYmotPmNhY2hlX2xldmVsID09IEk5MTVfQ0FDSEVfSU5WQUwpDQo+PiArICAg
ICAgICAgICAgcmV0dXJuIHRydWU7DQo+PiArDQo+PiArICAgIC8qDQo+PiArICAgICAqIE90aGVy
d2lzZSB0aGUgcGF0X2luZGV4IHNob3VsZCBoYXZlIGJlZW4gY29udmVydGVkIGZyb20gY2FjaGVf
bGV2ZWwNCj4+ICsgICAgICogc28gdGhhdCB0aGUgZm9sbG93aW5nIGNvbXBhcmlzb24gaXMgdmFs
aWQuDQo+PiArICAgICAqLw0KPj4gKyAgICByZXR1cm4gb2JqLT5wYXRfaW5kZXggPT0gaTkxNV9n
ZW1fZ2V0X3BhdF9pbmRleChvYmpfdG9faTkxNShvYmopLCBsdmwpOw0KPj4gK30NCj4+ICsNCj4+
ICAgc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKmk5MTVfZ2VtX29iamVjdF9hbGxvYyh2b2lk
KQ0KPj4gICB7DQo+PiAgICAgIHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmo7DQo+PiBA
QCAtMTMzLDcgKzE1Miw3IEBAIHZvaWQgaTkxNV9nZW1fb2JqZWN0X3NldF9jYWNoZV9jb2hlcmVu
Y3koc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaiwNCj4+ICAgew0KPj4gICAgICBzdHJ1
Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IHRvX2k5MTUob2JqLT5iYXNlLmRldik7DQo+Pg0K
Pj4gLSAgICBvYmotPmNhY2hlX2xldmVsID0gY2FjaGVfbGV2ZWw7DQo+PiArICAgIG9iai0+cGF0
X2luZGV4ID0gaTkxNV9nZW1fZ2V0X3BhdF9pbmRleChpOTE1LCBjYWNoZV9sZXZlbCk7DQo+DQo+
IG9iai0+Y2FjaGVfbGV2ZWwgaXMgb25seSBldmVyIHNldCB0byAiaW52YWxpZCIgZnJvbSB0aGUg
c2V0IHBhdA0KPiBleHRlbnNpb24/IERvZXNuJ3QgdGhhdCBtYWtlIGl0IGEgYm9vbGVhbiBzbyB0
aGVyZSBpcyBubyBuZWVkIGZvciB0aHJlZQ0KPiBiaXRzIHRvIGhvbGQgdGhlIGVudW0sIGp1c3Qg
dGhlICJwYXQgaGFzIGJlZW4gZXh0ZXJuYWxseSBzZXQiIGJpdCByZWFsbHk/DQoNCldpbGwgdXBk
YXRlLg0KDQo+Pg0KPj4gICAgICBpZiAoY2FjaGVfbGV2ZWwgIT0gSTkxNV9DQUNIRV9OT05FKQ0K
Pj4gICAgICAgICAgICAgIG9iai0+Y2FjaGVfY29oZXJlbnQgPSAoSTkxNV9CT19DQUNIRV9DT0hF
UkVOVF9GT1JfUkVBRCB8DQoNClsuLi5dDQoNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9pOTE1X2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZGVidWdm
cy5jDQo+PiBpbmRleCA0MTM4OWEzMmU5OTguLjlhNDkyMmRhM2E3MSAxMDA2NDQNCj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZGVidWdmcy5jDQo+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X2RlYnVnZnMuYw0KPj4gQEAgLTEzOSwyMSArMTM5LDU2IEBAIHN0YXRp
YyBjb25zdCBjaGFyICpzdHJpbmdpZnlfdm1hX3R5cGUoY29uc3Qgc3RydWN0IGk5MTVfdm1hICp2
bWEpDQo+PiAgICAgIHJldHVybiAicHBndHQiOw0KPj4gICB9DQo+Pg0KPj4gLXN0YXRpYyBjb25z
dCBjaGFyICppOTE1X2NhY2hlX2xldmVsX3N0cihzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkx
NSwgaW50IHR5cGUpDQo+PiAtew0KPj4gLSAgICBzd2l0Y2ggKHR5cGUpIHsNCj4+IC0gICAgY2Fz
ZSBJOTE1X0NBQ0hFX05PTkU6IHJldHVybiAiIHVuY2FjaGVkIjsNCj4+IC0gICAgY2FzZSBJOTE1
X0NBQ0hFX0xMQzogcmV0dXJuIEhBU19MTEMoaTkxNSkgPyAiIExMQyIgOiAiIHNub29wZWQiOw0K
Pj4gLSAgICBjYXNlIEk5MTVfQ0FDSEVfTDNfTExDOiByZXR1cm4gIiBMMytMTEMiOw0KPj4gLSAg
ICBjYXNlIEk5MTVfQ0FDSEVfV1Q6IHJldHVybiAiIFdUIjsNCj4+IC0gICAgZGVmYXVsdDogcmV0
dXJuICIiOw0KPj4gK3N0YXRpYyBjb25zdCBjaGFyICppOTE1X2NhY2hlX2xldmVsX3N0cihzdHJ1
Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqKQ0KPj4gK3sNCj4+ICsgICAgc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmk5MTUgPSBvYmpfdG9faTkxNShvYmopOw0KPj4gKw0KPj4gKyAgICBpZiAo
SVNfTUVURU9STEFLRShpOTE1KSkgew0KPj4gKyAgICAgICAgICAgIHN3aXRjaCAob2JqLT5wYXRf
aW5kZXgpIHsNCj4+ICsgICAgICAgICAgICBjYXNlIDA6IHJldHVybiAiIFdCIjsNCj4+ICsgICAg
ICAgICAgICBjYXNlIDE6IHJldHVybiAiIFdUIjsNCj4+ICsgICAgICAgICAgICBjYXNlIDI6IHJl
dHVybiAiIFVDIjsNCj4+ICsgICAgICAgICAgICBjYXNlIDM6IHJldHVybiAiIFdCICgxLVdheSBD
b2gpIjsNCj4+ICsgICAgICAgICAgICBjYXNlIDQ6IHJldHVybiAiIFdCICgyLVdheSBDb2gpIjsN
Cj4+ICsgICAgICAgICAgICBkZWZhdWx0OiByZXR1cm4gIiBub3QgZGVmaW5lZCI7DQo+PiArICAg
ICAgICAgICAgfQ0KPj4gKyAgICB9IGVsc2UgaWYgKElTX1BPTlRFVkVDQ0hJTyhpOTE1KSkgew0K
Pj4gKyAgICAgICAgICAgIHN3aXRjaCAob2JqLT5wYXRfaW5kZXgpIHsNCj4+ICsgICAgICAgICAg
ICBjYXNlIDA6IHJldHVybiAiIFVDIjsNCj4+ICsgICAgICAgICAgICBjYXNlIDE6IHJldHVybiAi
IFdDIjsNCj4+ICsgICAgICAgICAgICBjYXNlIDI6IHJldHVybiAiIFdUIjsNCj4+ICsgICAgICAg
ICAgICBjYXNlIDM6IHJldHVybiAiIFdCIjsNCj4+ICsgICAgICAgICAgICBjYXNlIDQ6IHJldHVy
biAiIFdUIChDTE9TMSkiOw0KPj4gKyAgICAgICAgICAgIGNhc2UgNTogcmV0dXJuICIgV0IgKENM
T1MxKSI7DQo+PiArICAgICAgICAgICAgY2FzZSA2OiByZXR1cm4gIiBXVCAoQ0xPUzIpIjsNCj4+
ICsgICAgICAgICAgICBjYXNlIDc6IHJldHVybiAiIFdUIChDTE9TMikiOw0KPj4gKyAgICAgICAg
ICAgIGRlZmF1bHQ6IHJldHVybiAiIG5vdCBkZWZpbmVkIjsNCj4+ICsgICAgICAgICAgICB9DQo+
PiArICAgIH0gZWxzZSBpZiAoR1JBUEhJQ1NfVkVSKGk5MTUpID49IDEyKSB7DQo+PiArICAgICAg
ICAgICAgc3dpdGNoIChvYmotPnBhdF9pbmRleCkgew0KPj4gKyAgICAgICAgICAgIGNhc2UgMDog
cmV0dXJuICIgV0IiOw0KPj4gKyAgICAgICAgICAgIGNhc2UgMTogcmV0dXJuICIgV0MiOw0KPj4g
KyAgICAgICAgICAgIGNhc2UgMjogcmV0dXJuICIgV1QiOw0KPj4gKyAgICAgICAgICAgIGNhc2Ug
MzogcmV0dXJuICIgVUMiOw0KPj4gKyAgICAgICAgICAgIGRlZmF1bHQ6IHJldHVybiAiIG5vdCBk
ZWZpbmVkIjsNCj4+ICsgICAgICAgICAgICB9DQo+PiArICAgIH0gZWxzZSB7DQo+PiArICAgICAg
ICAgICAgaWYgKGk5MTVfZ2VtX29iamVjdF9oYXNfY2FjaGVfbGV2ZWwob2JqLCBJOTE1X0NBQ0hF
X05PTkUpKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgcmV0dXJuICIgdW5jYWNoZWQiOw0KPg0K
PiBUaGlzIHdpbGwgcHJpbnQgdW5jYWNoZWQgZm9yIGFsbCBsZWdhY3kgcGxhdGZvcm1zIGlmIHNl
dCBwYXQgZXh0ZW5zaW9uDQo+IGhhcyBiZWVuIHVzZWQsIHJlZ2FyZGxlc3Mgb2YgdGhlIGluZGV4
IHNldC4NCg0KV2lsbCB1cGRhdGUuIFNob3VsZCBqdXN0IHVzZSBvYmotPnBhdF9pbmRleCBoZXJl
Lg0KDQo+IEFyZSB3ZSBva2F5IHdpdGggdGhhdD8gSSBmaW5kIGl0IHF1ZXN0aW9uYWJsZSBhbmQg
d291bGQgc2F5IG5vLiBJdA0KPiBkaXZlcmdlcyBmcm9tID49IDEyIGFuZCBzbyBpcyBjb25mdXNp
bmcuDQo+DQo+PiArICAgICAgICAgICAgZWxzZSBpZiAoaTkxNV9nZW1fb2JqZWN0X2hhc19jYWNo
ZV9sZXZlbChvYmosIEk5MTVfQ0FDSEVfTExDKSkNCj4+ICsgICAgICAgICAgICAgICAgICAgIHJl
dHVybiBIQVNfTExDKGk5MTUpID8gIiBMTEMiIDogIiBzbm9vcGVkIjsNCj4+ICsgICAgICAgICAg
ICBlbHNlIGlmIChpOTE1X2dlbV9vYmplY3RfaGFzX2NhY2hlX2xldmVsKG9iaiwgSTkxNV9DQUNI
RV9MM19MTEMpKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgcmV0dXJuICIgTDMrTExDIjsNCj4+
ICsgICAgICAgICAgICBlbHNlIGlmIChpOTE1X2dlbV9vYmplY3RfaGFzX2NhY2hlX2xldmVsKG9i
aiwgSTkxNV9DQUNIRV9XVCkpDQo+PiArICAgICAgICAgICAgICAgICAgICByZXR1cm4gIiBXVCI7
DQo+PiArICAgICAgICAgICAgZWxzZQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgcmV0dXJuICIg
bm90IGRlZmluZWQiOw0KPg0KPiBBbm90aGVyIHRoaW5nIGlzIHdoeSB1c2UgZGlmZmVyZW50IG5h
bWVzIGZvciBjYWNoaW5nIG1vZGVzIGJldHdlZW4NCj4gImxlZ2FjeSIgYW5kIHRoZSByZXN0Pw0K
DQpGb3IgbmV3IHBsYXRmb3JtcyB0aGUgc3RyaW5nIG1hdGNoZXMgYnNwZWMuIEZvciBsZWdhY3kg
cGxhdGZvcm1zIEkgdGhpbmsgaXQncw0Kc3RpbGwgYmV0dGVyIHRvIGluaGVyaXQgdGhlIHN0cmlu
Z3MsIG5vIHN1cnByaXNlcyBoZXJlLiBXaGF0IGRvIHlvdSB0aGluaz8NCg0KLUZlaQ0KDQo+IERv
ZXMgdGhpcyBibG9jayBhbGlnbnMgYmV0dGVyIHdpdGggYnNwZWMgbmFtZXMgaWUuIHRoZXJlIGlz
IG5vIG5vdGlvbiBvZg0KPiBVQy9XQi9XVCB0aGVyZT8NCj4NCj4gUmVnYXJkcywNCj4NCj4gVHZy
dGtvDQo=
