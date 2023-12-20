Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B686881AAC0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 00:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE44210E61B;
	Wed, 20 Dec 2023 23:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E607910E61B;
 Wed, 20 Dec 2023 23:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703113744; x=1734649744;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ipcyPZr2R8+pHJXwvBKoqggPob4+UTqTpdmwPw/IcLQ=;
 b=HGc0WyF65OLkIiC+S1095b6J5R6+QBWKDJ31kY37SD97fJ7znGPV0aK9
 5XwRIWDoh73AkVKprv4NZf351YGon939EGv+vucB5ods00b6nE+1bSIw9
 GCSM7EgpKEv3onoH45GEn7Dg6AhRS19FgptZznw2z5V3h8WGCXwOTtLPj
 3NmFSREbxHuS5a0MMjUrZ5+IrE4qh9djicXmkLgxyHNGB0fdewxjDWNRB
 I+SFDvEFLIYwLPgGG0QbHxY9FQlMS6YFao4qiRJP6jQfYev3KVjaDLjsq
 ZMbXwNB1prnqyo5QEgxElov1T8sKUWau70pCcyhZmaq4as4RbyB9GnL9Y g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="2713605"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; 
   d="scan'208";a="2713605"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 15:09:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="776500575"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; d="scan'208";a="776500575"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2023 15:09:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 15:09:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 15:09:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 15:09:01 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 15:09:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZU3244M4ENV56zqx1o/bxipx7uxDQarJGim927E0QNclHowrXORKl5KXcLx/BvoP+VLqw3rITeVdjH/ac3SQ/M8tjio3X58ILDAryqK+jZoyk1+OyqmpndcdF8amDdKdKnQy4jMjleckhxybNQl3egIsASMKUQEMgphw4UZDVrdPrRHaz5fIdtGPpia9UWXRemwjp3dHO+wgc4fcvjkpKu9/hxE7P+mWbT7D8CQwwZwIeOVsDNXg7/702ufEMxctc/1U/LnFvE5MdA+cic5LTlpXPZvNDPDE8VJgHzUYliHLAAGxAuYFm9xZ877gL6lFrt3lnHHh+QukCpYi3HcxwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipcyPZr2R8+pHJXwvBKoqggPob4+UTqTpdmwPw/IcLQ=;
 b=hCcYX9KFSFy48w51Z22E/4ELZ7FtgQa+XrYFc4N3v0+722hwv9LBM9GWLvMlJoBpgw5CwnKc+vOxPS4MpSnI+pKuVzaOCwZxzaLu8uDuIQCkV/8I/jgcp14hPsHFUsh0982MxJK2+drwYsmgOQN7zQSHxINUKpkZxZkUYvMSVcGZ7uVz9V2eEtuUK9PGOyTDtj+9zP2QNmIEQISvhnUNUVEv2TCqOAvBYUG3fJKn0HhYShSDmBxHgHwC4P9U4ATssa0QRzv0VXi3gdjX8C9Rl1g0RVH0s9nEM+knqGO1HVPWzIo9Xv668fDIXaBZhqc6iMamBkCrwZhR+dsEKl7CcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH7PR11MB5916.namprd11.prod.outlook.com (2603:10b6:510:13d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 23:08:59 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::da85:3d5:65fd:4a21]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::da85:3d5:65fd:4a21%7]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 23:08:59 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v8 2/2] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Topic: [PATCH v8 2/2] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Index: AQHaLRxNa0FKa5oy10+TCB+P30+R9rCnuu2AgAsd34A=
Date: Wed, 20 Dec 2023 23:08:59 +0000
Message-ID: <b89b77629fa2c54a7bef358eb66d89cfe454ba5e.camel@intel.com>
References: <20231212165716.57493-1-alan.previn.teres.alexis@intel.com>
 <20231212165716.57493-3-alan.previn.teres.alexis@intel.com>
 <ZXogv_iKOSLXnb8b@intel.com>
In-Reply-To: <ZXogv_iKOSLXnb8b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH7PR11MB5916:EE_
x-ms-office365-filtering-correlation-id: d159686c-06cd-46fc-e13e-08dc01b0a643
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FUDwGxKJsuQYVQM7FlhCBxghHqb/FVrg2R/rZ8GaARDhoZmxjeTAaQ/ttztsDkXzrsVbVK+C4kP87GtZSiyZIIuxIblEFQxwLmI+j4urSkfAP6hE33egnVFpf2VF9y/ouwcTLXWcl0hQ/g261qftE+/NwJFkn1o+jhLKZqmXrCqplFRY6UgT5T4v3u+VDLDGvCA3XhDrnmVZ/SQ6N9yOl8gZP3pnatzjwh6HzkJW5Mjuug0+dbeI51sJtOG/ADSUNAl6voLJLrZ4n1fgpoQQ0phXZ7ai+SnwrlZvQ75PzgGPHZKkQeyVojglIoOw8uCDGZ/XSiJGv2sq+bmgIjiUUGQItDgg1lixtvS4M/ld2cqQtxafPiULg1s6M7iFIS+f7QOZP7hHlRLBZS/7sWQwmvYOT/hnnK/d2MhngC9ikrSlUCHjTfWXQbeh84AZNJO9WyofjhIDOJiYM0LdaeS7sIDo9s7Pf0uJ0QVGVdPHvZScqGwZR7odW7qh5YwT1o/4GyG/AgwXd6hhTEpRXxF6KMoB81kgD7ixUwWKo9FJk+eIJ0nPyt3Z6W+ixfyTlMQpK6mTogazePzfINcLm7R17GaPpLFQzceQN70tM82LLrj/gW8xAT5zzEt1tn81P2/+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(376002)(136003)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(2616005)(26005)(6506007)(107886003)(6512007)(71200400001)(122000001)(37006003)(54906003)(83380400001)(41300700001)(8676002)(8936002)(5660300002)(4326008)(6862004)(2906002)(6486002)(64756008)(316002)(478600001)(91956017)(6636002)(66446008)(66946007)(66556008)(450100002)(76116006)(4001150100001)(66476007)(86362001)(36756003)(82960400001)(38070700009)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZElFR1JsenJTQktmTHBOOXhkbkVyeGRlN1NFeW1PdTZzNHZEL2J1dmg4elo3?=
 =?utf-8?B?MFFaS0IxNEp4a0pXclF5OWZHV3IvOHBKdWpLZmJORXdDL01QZ2xEc1ZNQ09s?=
 =?utf-8?B?d0RiZnd1SWUzQlRkL016T0h0aEsxbi9XbWkxZmRjOFpsa2tyMzV3VkxEdHdp?=
 =?utf-8?B?OXBwTzVkeGo2ZnFwRm5NVytoS2EwTGtKcEY2eVhLL05uQ0VSWDJHWXAwUVRq?=
 =?utf-8?B?ZGpRMVJ6VGkvRmJJTk1UOStmbU5KeU1BWmxwOTBDU0V5MlZDeGNmeXJUcWNV?=
 =?utf-8?B?ci9VdzVtUHpRMGNoeEhBQjAvMVoxLzJsVUFIbCt5T1FjMVEyL3Z0OXI4b3ZY?=
 =?utf-8?B?SElCcHFYQzBlS0J3QkNWOFBVNlM2WVhmeFRMbC9jUlJGS095WHZYTmpkdlBx?=
 =?utf-8?B?dE5lc3llWHdIYTkremVobUVjSXF1VDlYMlhuRzdaUGlqQmhyRmcxOElnYlVR?=
 =?utf-8?B?SkhuNm1pZlpIaW1TamwyRE1uREYwSVh0T3pCMm15SnFEWG00bVh1YlpEaWoz?=
 =?utf-8?B?NkRUWDBPODJCdHFLc05hV2tlUk1QWGlVZk02TnFtOVNQZXAzQ1R0cWN0WGxH?=
 =?utf-8?B?QVE4ZUs1c0UwMmk5Y2prYTY1TFhBcjJ3Q1lWRDlvVk5UUEh2K1JXM2RKbGZq?=
 =?utf-8?B?TDZ0anZ2bVdybHpEMXpEc05PVEcrcXJPUGkzVjBveWhic0Z6dCtwdHpEYU1S?=
 =?utf-8?B?UEhhMUxwS0dxY2JKRUpUcW92cUVNTFZVMU5pRmxIRkJyQ25WbmFBWVNKQlZV?=
 =?utf-8?B?cXB2ZjI5YWhGZkZNdlJXQzMyZXJzcWdQeWc5eXdvYzZXc01hWFZlOWJrU3RS?=
 =?utf-8?B?N1NYUUNFNWhMSkhsK2lUSWh0cHFmQm4vbnJWNVU1N0wxWHJ4UVNKWUNrZ2Zj?=
 =?utf-8?B?NTNTckplWURUbi9TV0pSOHNsZ0xOVDM2Nmt3cGtyWVEzakE5M0FGTnVPZ21q?=
 =?utf-8?B?em9VcmJYbEhxeGxlZzY0REZ0dkREc0pCSjlwWGtvZFEwVC9RclREK1NlbUwy?=
 =?utf-8?B?aHB3dmx3aHFjNktzbmhFTG5QQ3g4S2hZOFcyaHVCV2hPeEs1ZTYwMjZCcWJJ?=
 =?utf-8?B?eFNDWC9CZW4wSGJPVzBwYlFwVGhybVdzbzkyZUVlWHIzM01GcjhoSjZ6djF2?=
 =?utf-8?B?OTVYcTZ1TTFvS2lJdDIyOGp0SmxMYXU1S3VlbWRtSWRzaVNuRzk5YXluejBa?=
 =?utf-8?B?VjU5MFVWVXYreWNacnlQUFdYVVdXdTFNNHlFUlpOV09YWHNWRW1PZVRoMVRU?=
 =?utf-8?B?NlRadGQ3WEFkY1VEZlQvRG9UMm9wWFdzUkM4dllUaTk1Z3hpUWhhbENiVWJu?=
 =?utf-8?B?QlJBakxIQk92TGRsVWFVZTJjdTIvK3grMzdYSERFdGcwMlpLa1dVOWJEMnpi?=
 =?utf-8?B?Slo0NlpZYW5Ea2o5ZEk0cWFqMm1vQnZtUXQxTTJVWjJidXlaTUdDQzd6akpz?=
 =?utf-8?B?cUJvRzJidEk4YjRuamFzQTBid0NyZHBSMHo2OEZUd2dUSURLN3Z4SGF0dFh0?=
 =?utf-8?B?Mm5uZlQ0WTFwendEZ1JhYkgwQzNNekZ3MXZXdTFuWVRtTEQ4amZ4SmJwcHlt?=
 =?utf-8?B?OXdyZnhCK2JhNWEvdHk2N3NrV29yUnFnWVBZZW41UmlFaFdmY2FVR3g5dHhK?=
 =?utf-8?B?bFlhMXhYNEttcU52RVM4UDArM2cxNGNaQkVrNnlQQ3Y5VUJpVi9BOEM3Z0pp?=
 =?utf-8?B?R3FuQlZjOVZqT3VnY1dyK1ZWS3c0TkI5K09NSUFKLzVpcFNMd3ZtRVBLTGpT?=
 =?utf-8?B?ZDhNR040UWtqYWQ4MjZiOHBlUFBmazA1RnQxbzhHMVNqNG54djliVjV4d0Y4?=
 =?utf-8?B?dnJRUVhyTzlBcmJHTHQ5NHZ4M3JRWkJqdXBHNytIckQ1TnUrZyswdHFWcGg0?=
 =?utf-8?B?bDBFNkZQdjV5RTRiMnk3SC9DaGRJRWR3SWIyS3RxdlZIMktRSUo1aC9Xb3pj?=
 =?utf-8?B?MHVzb3IyZGxreDZxK2YyaFo5Y1lRc0RPbmwvNkFCYmQ3TzB2QU1hWnRlSGxV?=
 =?utf-8?B?TzlWSkpoZkpuUytuTndEMVoxcmFpaVQrcVA3bWhpaHdqTDdPZy9KWFRUc01i?=
 =?utf-8?B?NGhCbWU2aHpBbjhRM0gzcVJRbjhYMDE0U2RRRDllZTNhTEIvUHpoSUF6Mm50?=
 =?utf-8?B?NS9KWVVQdVVqN1I2bEJ6VEo0ZTRFWk1xMFphdFlRMVlqM0pGQnpHNFZHMGlD?=
 =?utf-8?Q?ObJgkZG5+VlT/5VsZLER+tI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6E2AB4742EFD646BEE7E858BCF09FA9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d159686c-06cd-46fc-e13e-08dc01b0a643
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2023 23:08:59.4968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RpgK4GKj6E4OTpVb7aVcIrnjnWc75YfQOuRrIc8Y9mDr4ORGXDrMGMN2aQIoX5V21Sm3paJ2XcNgShXpuOONA1Nat6xDcnafRs6Mig1aVx+ZE8ten3NY7yCH084NF76w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5916
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Jana,
 Mousumi" <mousumi.jana@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTEyLTEzIGF0IDE2OjIzIC0wNTAwLCBWaXZpLCBSb2RyaWdvIHdyb3RlOg0K
PiBPbiBUdWUsIERlYyAxMiwgMjAyMyBhdCAwODo1NzoxNkFNIC0wODAwLCBBbGFuIFByZXZpbiB3
cm90ZToNCj4gPiBJZiB3ZSBhcmUgYXQgdGhlIGVuZCBvZiBzdXNwZW5kIG9yIHZlcnkgZWFybHkg
aW4gcmVzdW1lDQo+ID4gaXRzIHBvc3NpYmxlIGFuIGFzeW5jIGZlbmNlIHNpZ25hbCAodmlhIHJj
dV9jYWxsKSBpcyB0cmlnZ2VyZWQNCj4gPiB0byBmcmVlX2VuZ2luZXMgd2hpY2ggY291bGQgbGVh
ZCB1cyB0byB0aGUgZXhlY3V0aW9uIG9mDQo+ID4gdGhlIGNvbnRleHQgZGVzdHJ1Y3Rpb24gd29y
a2VyIChhZnRlciBhIHByaW9yIHdvcmtlciBmbHVzaCkuDQphbGFuOnNuaXANCj4gDQo+ID4gVGh1
cywgZG8gYW4gdW5yb2xsIGluIGd1Y19scmNfZGVzY191bnBpbiBhbmQgZGVyZWdpc3Rlcl9kZXN0
cm95ZWRfLQ0KPiA+IGNvbnRleHRzIGlmIGd1Y19scmNfZGVzY191bnBpbiBmYWlscyBkdWUgdG8g
Q1Qgc2VuZCBmYWx1cmUuDQo+ID4gV2hlbiB1bnJvbGxpbmcsIGtlZXAgdGhlIGNvbnRleHQgaW4g
dGhlIEd1QydzIGRlc3Ryb3ktbGlzdCBzbw0KPiA+IGl0IGNhbiBnZXQgcGlja2VkIHVwIG9uIHRo
ZSBuZXh0IGRlc3Ryb3kgd29ya2VyIGludm9jYXRpb24NCj4gPiAoaWYgc3VzcGVuZCBhYm9ydGVk
KSBvciBnZXQgZnVsbHkgcHVyZ2VkIGFzIHBhcnQgb2YgYSBHdUMNCj4gPiBzYW5pdGl6YXRpb24g
KGVuZCBvZiBzdXNwZW5kKSBvciBhIHJlc2V0IGZsb3cuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1i
eTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQo+ID4g
U2lnbmVkLW9mZi1ieTogQW5zaHVtYW4gR3VwdGEgPGFuc2h1bWFuLmd1cHRhQGludGVsLmNvbT4N
Cj4gPiBUZXN0ZWQtYnk6IE1vdXN1bWkgSmFuYSA8bW91c3VtaS5qYW5hQGludGVsLmNvbT4NCj4g
PiBBY2tlZC1ieTogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlv
QGludGVsLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgYWxsIHRoZSBleHBsYW5hdGlvbnMsIHBhdGll
bmNlIGFuZCBncmVhdCB3b3JrIQ0KPiANCj4gUmV2aWV3ZWQtYnk6IFJvZHJpZ28gVml2aSA8cm9k
cmlnby52aXZpQGludGVsLmNvbT4NCg0KYWxhbjogVGhhbmtzIFJvZHJpZ28gZm9yIHRoZSBSQiBs
YXN0IHdlZWssIGp1c3QgcXVpY2sgdXBkYXRlOg0KDQpJJ3ZlIGNhbnQgcmVwcm9kdWNlIHRoZSBC
QVQgZmFpbHVyZXMgdGhhdCBzZWVtIHRvIGJlIGludGVybWl0dGVudA0Kb24gcGxhdGZvcm0gYW5k
IHRlc3QgLSBob3dldmVyLCBhIG5vdGljYWJsZSBudW1iZXIgb2YgZmFpbHVyZXMNCmRvIGtlZXAg
b2NjdXJpbmcgb24gaTkxNV9zZWxmdGVzdCBAbGl2ZSBAcmVxdWVzdHMgd2hlcmUgdGhlDQpsYXN0
IHRlc3QgbGVha2VkIGEgd2FrZXJlZiBhbmQgdGhlIGZhaWxpbmcgdGVzdCBoYW5ncyB3YWl0aW5n
DQpmb3IgZ3QgdG8gaWRsZSBiZWZvcmUgc3RhcnRpbmcgaXRzIHRlc3QuDQoNCmkgaGF2ZSB0byBk
ZWJ1ZyB0aGlzIGZ1cnRoZXIgYWx0aG91Z2ggZnJvbSBjb2RlIGluc3BlY3Rpb24NCmlzIHVucmVs
YXRlZCB0byB0aGUgcGF0Y2hlcyBpbiB0aGlzIHNlcmllcy4NCkhvcGVmdWxseSBpdHMgYSBkaWZm
ZXJlbnQgaXNzdWUuDQo=
