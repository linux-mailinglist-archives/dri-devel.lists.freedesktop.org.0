Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F806D8AEC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 01:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B3810EA67;
	Wed,  5 Apr 2023 23:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D8C10E4D8;
 Wed,  5 Apr 2023 23:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680735991; x=1712271991;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ffYSUL2+zDCgmdspZCwrD4cjZuhmU3p9Za7kiJRgCm8=;
 b=TV0GYfCMMj2TXPbNhZh2ZIa+LAGMN/O5PSDVSVLqZk3kBulr6tXnENia
 DQDWC6XnP4lLJlptxhw2j0vkIp213i8qb1Hk8W92lotlC8/3uFjYnIbgE
 eNACZWGsDiQ+b6PFL5K8keFQFm+fUszFeuA9Eh6wg0eqA+Q0GYUlCgI5t
 LcaUC0zdjJ6N1BsRCgYuBU9nwCL9zzaOL9sw66DLRiXtSW2f1CXzZ81B6
 bbQj3a0+kY4v8YOEgo73wTZrXBoNozfqDXpmoRR36/u71nqgXC5iiAdV+
 8uV6RwKQjfuUQEozx+v2D99YCn36vWnz4YhMsGpuQPT/S9EMy/JUUr+Va w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="405373982"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="405373982"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 16:06:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="689447261"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="689447261"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 05 Apr 2023 16:06:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 16:06:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 16:06:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 16:06:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJp+NLCAbV7Ktdq/+1xopj5uI+mAFye87gAkZ3PKf13jGE5SqI7ChG/VDHt4gdASculRnfjYZ6yOt/j9UGcDeBtzcKSETuLnipbEZDtoD6cYPZRsBt2qm46txGO62/UcMhtElLA0zPXa05iEb6MWurER23RYIiOF73a5qrpRzkRGPshw7PbdwsPq8Lz4RizNK5Ac/O1faLAQvdaPwFXWW1V+SQHWVy8Jp1YennXK9O8OzT9BRGcYPF3O5kGerrfu3b6LnaRuaj2BeileHcmEgma9zKvvwcFZj2zbtqsHFBIKA+GFnhBYjj69Mdyk9hD/01jYGd8pzHwslJI2WMlbzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffYSUL2+zDCgmdspZCwrD4cjZuhmU3p9Za7kiJRgCm8=;
 b=Qjp0spE5uaEzqDlhEP8vNDvwYlRCMizkowg2/AZtxn5wcKtTqfeSf/unoMRmaiSEPqwS5wmWl0M3NowGpTGbMY0hIHb04NCTuew+5FWKUH6bIP9oYXH/ygOcTBDGFVOq+Q+y4Da/dYdTWUTzmhhcgNpz7H5AnS1obY6mlljAlVyPYY6JKSnGF0Q12S+UTcgFPu4HANez935P1tg50mSFhMu/mQaAwpl5YfFLn08HxAX+3royzVx+nBcRZKtla5T3GhqOvIbyY2WIz0WjxdbieOSGXJ+zlVgwwEibw5p0CSui2aTdv+KiiLVrC9FIvZve0ODpb+RG+or5K/OD4YvQ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by IA1PR11MB7812.namprd11.prod.outlook.com (2603:10b6:208:3f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Wed, 5 Apr
 2023 23:06:21 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee%6]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 23:06:21 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 7/7] drm/i915: Allow user to set cache at BO
 creation
Thread-Topic: [Intel-gfx] [PATCH 7/7] drm/i915: Allow user to set cache at BO
 creation
Thread-Index: AQHZZGRiuuNpc8BVKEecHbCKjiVefa8axZGAgACOQHCAAQiPAIAA/y8g
Date: Wed, 5 Apr 2023 23:06:21 +0000
Message-ID: <BYAPR11MB256714E8C0E4F2086B9133FB9A909@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230401063830.438127-1-fei.yang@intel.com>
 <20230401063830.438127-8-fei.yang@intel.com>
 <7aa541f8-55e3-a182-5390-6ca161edb70b@intel.com>
 <BYAPR11MB256790AC5BDC891F186E000E9A939@BYAPR11MB2567.namprd11.prod.outlook.com>
 <7fd9424a-678a-0d90-715c-f63179552093@intel.com>
In-Reply-To: <7fd9424a-678a-0d90-715c-f63179552093@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|IA1PR11MB7812:EE_
x-ms-office365-filtering-correlation-id: d1beb7bf-d780-474c-4fdf-08db362a5ee2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /irG9Cygk9U1hyrrX4jmi4kT/Ws1FZsyVHEnsn2OKbLbekKFa9Bdj6B1VP6y1o16S4CCddnsQ/KSgXQA7lo76LF4Q6qbVVKkV5BEA44+4ykbnOZ/qz/o6s69ocSdp0e2/stnu9ckh4OnUrgsMW4JKrERfo3VmauvqkLvhB0VyBf7zgvB94bXRXFPzcUB5pO3a27edjhe3aKexMUX+/f9vB2H3JmcelT7puDURy+YaiyJZlaPwLgHOIE9LBbKJVm8OZQCawEfdN51QhUxo8sVQlvcWcDJErTcAFyOBe7dgfBsfY49JSsfpnQ0IcrADaJJmE0bjyWvMSdW1YpzPA1+ZGvc8jB7Q+JCArwqY0RcvPVrP+TDuCtfd33ZWS5ZRo5zc0lnIPtWKZJSZ0etkxzeK0+hRHovZwHRNbFbp2exYrsFTIlIaxTaNGgAIXWJyFM9FRpPfpwtU4PKj5leARLRFKvvhlwhMWLujwlNiQloxJv78++HWNkRNhYKImqVzF9JROGw8foXSwpMjrrY7PGnN8QpekBPg7B3FnyJFHs+f+0Gyz2ejcluD3WfyyAeixxuZ3MPM0LnL/27aL7E7agyfph35CiHMCBGQIAAFzLVL6Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(396003)(346002)(39860400002)(136003)(451199021)(2906002)(38070700005)(86362001)(33656002)(66899021)(122000001)(55016003)(19627235002)(7696005)(71200400001)(83380400001)(966005)(186003)(53546011)(26005)(9686003)(6506007)(4326008)(66556008)(64756008)(66476007)(8676002)(66946007)(316002)(66446008)(38100700002)(41300700001)(76116006)(5660300002)(82960400001)(478600001)(54906003)(8936002)(52536014)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzFoeVgwUlErYjF4WW15R2hzVmY0SnRLWkdXZmhQUkNUdFNGZWxsQ3BuK2RC?=
 =?utf-8?B?ekxhZWFoR1c2UE8ybndxejN3bGNiaFNFcXV6TmViQllaN0hQalFTUTIvbTRZ?=
 =?utf-8?B?dnQ3ZG5hd0dSYU9NUWhVT3RCWGRMZWtFWldWK1Y2ZUs3a2J4Q0tpb2dqVzA2?=
 =?utf-8?B?amk2RTN0dWI2Q3RYaFZ4aStST2MyTTc3RnhPbDA3NXdteFlZWVBtcDlRUWZ3?=
 =?utf-8?B?cmt6VXZkY0VHZFNuV2FMaVZXUXcwbFR0a2NUTHJqaW5raHZQZGNxejk4Rmgv?=
 =?utf-8?B?M2w3RmNaSjM5QkJNMWZlbmJ0S2pta2QwNDFsRnVYQ2dITW9iVHRMcFZGaUZW?=
 =?utf-8?B?d0kwRW9zWFI1Q0lBTnQvbFR4Qko3S2IzWTVwRzc0ZzlONEdxUDZ3Nmw2WnNB?=
 =?utf-8?B?SXFOSkxCb1ltTndJTUhUQ1ptS3FrY21OZnNHVmhRYjdwVzFDMVoyZnFpeTZZ?=
 =?utf-8?B?T3NvTHVLSVpiRnV3Y1FCY3pJRzRuekFzay90TXlORWIyWHMrYURWTlJiUjN4?=
 =?utf-8?B?eTE3Ky8yazVyWnlqWDYvRitDZW10Z1MxU2tJL3FDUXRuV1JHUStmOUYyYUo0?=
 =?utf-8?B?M3JnN3k4SjV6VURjL0diZDcyMmF0Tm1PWHhxYUQrYUhkYXRhZmpObkxrdnpS?=
 =?utf-8?B?Z3FNSWZ5QVcydk80cC9oa0Y3SHpoQ3BWNWVqeFZiSGZRV2ROVGhJYzlBUGRq?=
 =?utf-8?B?WUpPenpZUWxhV2J6S2hsengwNUR3dkxoSktOV250M280c1N2RWVSalJiVnE5?=
 =?utf-8?B?U0JPdUNQd2hXbWpRMVQySXFEL2FudE1kM1dsY3BFUVRBZXJHNWRnRmhaTlNK?=
 =?utf-8?B?dE1GRUJtLzBSUmlMMVNlcVZHQjhiYmhuL0ZNRUd4UlBkYlIxa2cyR2g0T3NU?=
 =?utf-8?B?RTB3U3laL3RTcUhPbzk3d1dvNUJnOEFnK0NHb3lQcHNwTHpzZ1hpekU2K0V4?=
 =?utf-8?B?NVh6U0ZtNXk4WWdabWlEQkppekVRa3kzUUdUOFg4enpYcVJzYkthR3FaenUv?=
 =?utf-8?B?UEUwZmpxU0FqbG00WnA0WWlhUG9MNFFHVDRJUXdEV2hLSXdjeG16SUxvWkFU?=
 =?utf-8?B?cURkVnN6UEljSHJHTUwwYXQ1c3ltWDhFbGhEUktnSHdvL3l1a3pBQWtFMFRN?=
 =?utf-8?B?eFRWdkV0Q1pGTVV4ejZCNUU2MVJMa3ZBZTJLMVlpYjRxQlhSbFdseXVLR0Fq?=
 =?utf-8?B?RWpjRnNucG1UUXcvRTdCbUhnUGVVd3FGMDRtcHE0dVB1MEhzcVhyR0lodW9W?=
 =?utf-8?B?SVMzcTFDMGJHUkViS1VodE95bGxjNTB3TkV0bEt3M3FRL3p1dUVuUk1SYmRC?=
 =?utf-8?B?UW8waFRJU3NCR3dkQVVnVm9Bd1crZXNyeVJRd3pKVjRGdmF0LzlNUGZuQ1NV?=
 =?utf-8?B?Rk50V0hqcHV3RFIxYlFyZGpHTVMwT3JIRGtUOFNSUE14NXRSZmIwV3ZIdTF4?=
 =?utf-8?B?QjZLdDVKaUNOOHZVUkRYVmFNVVN3Z2s0ckNYZnRIMTdoWm95RWxaSGxVd2JK?=
 =?utf-8?B?bENhRFN1S2R3V2F3bm8zbmxaTDZ6RU5ENHZtRDJURTRSSUh6WGtDZTVOL0ZM?=
 =?utf-8?B?UEpyWFlpajFCaFg5Q0djZHNoRWdpSFM5WFFkU0djbnFGUG13NTB4bnJHWTVJ?=
 =?utf-8?B?YmN2NjR1Um55UWtrRTA4Zmk1TXFVZGJTeW1FL3ZsS2pxMUxnaXVDRjFBYVNa?=
 =?utf-8?B?NEh1Y01LVDU4ZU91WWRhaTRwS1B1S1RueENMc3h1OEhxNjA1ZXY2Q3E2R3pT?=
 =?utf-8?B?S0NxT1FxR2U4WkZCRGRYbGFFc1Rjdm5qWmMwa3k5dHFtbFp0NTR3YTA0QlVu?=
 =?utf-8?B?QmZMcGdHMCtHTWZQOFZzK1J3RlhkN1J2azZZUjVURy9kT1p4MzcxcGhVa0ow?=
 =?utf-8?B?MnZHUXFaRnU3b2thc1dOS0pMUk5RYU4zZzhmbSt6MktXS2FsUW9jY0MwaEhK?=
 =?utf-8?B?aUxLRkZnQ1dxUm1OWGFWaE9vTjAreS94N1FuVVR0VVdYVU5sN0hDbFY5WlF3?=
 =?utf-8?B?Tmcrb3lwRkJBUDN0RENpcjgvQkkzUG5ZcFBjN1JWcW5QSFNVM2Ixd2tIN2My?=
 =?utf-8?B?ajV1VkZzSEdkYnBoSU1ndHA1TjQvNHhmOUN1Unh4MUg2eC9sNkhxb1pyY29U?=
 =?utf-8?Q?3nu0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1beb7bf-d780-474c-4fdf-08db362a5ee2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2023 23:06:21.0879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sAn7v36gvJa1wmwSgJtwbilfjYM3wXKHw2Bl7FqcPICWc5BSTW00eP/POI7IXn12nEYzf/wyE0OMkFcQNV8QdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7812
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

PlN1YmplY3Q6IFJlOiBbSW50ZWwtZ2Z4XSBbUEFUQ0ggNy83XSBkcm0vaTkxNTogQWxsb3cgdXNl
ciB0byBzZXQgY2FjaGUgYXQgQk8gY3JlYXRpb24NCj4NCj5PbiAwNC8wNC8yMDIzIDE5OjA0LCBZ
YW5nLCBGZWkgd3JvdGU6DQo+Pj4gU3ViamVjdDogUmU6IFtJbnRlbC1nZnhdIFtQQVRDSCA3Lzdd
IGRybS9pOTE1OiBBbGxvdyB1c2VyIHRvIHNldA0KPj4+IGNhY2hlIGF0IEJPIGNyZWF0aW9uDQo+
Pj4NCj4+PiBPbiAwMS8wNC8yMDIzIDA5OjM4LCBmZWkueWFuZ0BpbnRlbC5jb20gd3JvdGU6DQo+
Pj4+IEZyb206IEZlaSBZYW5nIDxmZWkueWFuZ0BpbnRlbC5jb20+DQo+Pj4+DQo+Pj4+IFRvIGNv
bXBseSB3aXRoIHRoZSBkZXNpZ24gdGhhdCBidWZmZXIgb2JqZWN0cyBzaGFsbCBoYXZlIGltbXV0
YWJsZQ0KPj4+PiBjYWNoZSBzZXR0aW5nIHRocm91Z2ggb3V0IGl0cyBsaWZlIGN5Y2xlLCB7c2V0
LCBnZXR9X2NhY2hpbmcgaW9jdGwncw0KPj4+PiBhcmUgbm8gbG9uZ2VyIHN1cHBvcnRlZCBmcm9t
IE1UTCBvbndhcmQuIFdpdGggdGhhdCBjaGFuZ2UgY2FjaGluZw0KPj4+PiBwb2xpY3kgY2FuIG9u
bHkgYmUgc2V0IGF0IG9iamVjdCBjcmVhdGlvbiB0aW1lLiBUaGUgY3VycmVudCBjb2RlDQo+Pj4+
IGFwcGxpZXMgYSBkZWZhdWx0IChwbGF0Zm9ybSBkZXBlbmRlbnQpIGNhY2hlIHNldHRpbmcgZm9y
IGFsbCBvYmplY3RzLg0KPj4+PiBIb3dldmVyIHRoaXMgaXMgbm90IG9wdGltYWwgZm9yIHBlcmZv
cm1hbmNlIHR1bmluZy4gVGhlIHBhdGNoDQo+Pj4+IGV4dGVuZHMgdGhlIGV4aXN0aW5nIGdlbV9j
cmVhdGUgdUFQSSB0byBsZXQgdXNlciBzZXQgUEFUIGluZGV4IGZvcg0KPj4+PiB0aGUgb2JqZWN0
IGF0IGNyZWF0aW9uIHRpbWUuDQo+Pj4+IFRoZSBuZXcgZXh0ZW5zaW9uIGlzIHBsYXRmb3JtIGlu
ZGVwZW5kZW50LCBzbyBVTUQncyBjYW4gc3dpdGNoIHRvDQo+Pj4+IHVzaW5nIHRoaXMgZXh0ZW5z
aW9uIGZvciBvbGRlciBwbGF0Zm9ybXMgYXMgd2VsbCwgd2hpbGUge3NldCwNCj4+Pj4gZ2V0fV9j
YWNoaW5nIGFyZSBzdGlsbCBzdXBwb3J0ZWQgb24gdGhlc2UgbGVnYWN5IHBhbHRmb3JtcyBmb3IN
Cj4+Pj4gY29tcGF0aWJpbGl0eSByZWFzb24uDQo+Pj4+DQo+Pj4+IENjOiBDaHJpcyBXaWxzb24g
PGNocmlzLnAud2lsc29uQGxpbnV4LmludGVsLmNvbT4NCj4+Pj4gQ2M6IE1hdHQgUm9wZXIgPG1h
dHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEZlaSBZYW5nIDxm
ZWkueWFuZ0BpbnRlbC5jb20+DQo+Pj4+IFJldmlld2VkLWJ5OiBBbmRpIFNoeXRpIDxhbmRpLnNo
eXRpQGxpbnV4LmludGVsLmNvbT4NCj4+Pg0KPj4+IEp1c3QgbGlrZSB0aGUgcHJvdGVjdGVkIGNv
bnRlbnQgdUFQSSwgdGhlcmUgaXMgbm8gd2F5IGZvciB1c2Vyc3BhY2UNCj4+PiB0byB0ZWxsIHRo
aXMgZmVhdHVyZSBpcyBhdmFpbGFibGUgb3RoZXIgdGhhbiB0cnlpbmcgdXNpbmcgaXQuDQo+Pj4N
Cj4+PiBHaXZlbiB0aGUgaXNzdWVzIHdpdGggcHJvdGVjdGVkIGNvbnRlbnQsIGlzIGl0IG5vdCB0
aGluZyB3ZSBjb3VsZCB3YW50IHRvIGFkZD8NCj4+IFNvcnJ5IEknbSBub3QgYXdhcmUgb2YgdGhl
IGlzc3VlcyB3aXRoIHByb3RlY3RlZCBjb250ZW50LCBjb3VsZCB5b3UgZWxhYm9yYXRlPw0KPj4g
VGhlcmUgd2FzIGEgbG9uZyBkaXNjdXNzaW9uIG9uIHRlYW1zIHVBUEkgY2hhbm5lbCwgY291bGQg
eW91IGNvbW1lbnQNCj4+IHRoZXJlIGlmIGFueSBjb25jZXJucz8NCj4+DQo+PiBodHRwczovL3Rl
YW1zLm1pY3Jvc29mdC5jb20vbC9tZXNzYWdlLzE5OmYxNzY3YmRhNjczNDQ3NmJhMGE5YzdkMTQ3
YjkyDQo+PiA4ZDFAdGhyZWFkLnNreXBlLzE2NzU4NjA5MjQ2NzU/dGVuYW50SWQ9NDZjOThkODgt
ZTM0NC00ZWQ0LTg0OTYtNGVkNzcxDQo+PiAyZTI1NWQmZ3JvdXBJZD0zNzlmM2FlMS1kMTM4LTQy
MDUtYmI2NS1kNGM3ZDM4Y2I0ODEmcGFyZW50TWVzc2FnZUlkPTE2DQo+PiA3NTg2MDkyNDY3NSZ0
ZWFtTmFtZT1HU0UlMjBPU0dDJmNoYW5uZWxOYW1lPWk5MTUlMjB1QVBJJTIwY2hhbmdlcyZjcmVh
DQo+PiB0ZWRUaW1lPTE2NzU4NjA5MjQ2NzUmYWxsb3dYVGVuYW50QWNjZXNzPWZhbHNlDQo+Pg0K
Pj4gVGhhbmtzLA0KPj4gLUZlaQ0KPg0KPg0KPiBXZSB3YW50ZWQgdG8gaGF2ZSBhIGdldHBhcmFt
IHRvIGRldGVjdCBwcm90ZWN0ZWQgc3VwcG9ydCBhbmQgd2VyZSB0b2xkDQo+IHRvIGRldGVjdCBp
dCBieSB0cnlpbmcgdG8gY3JlYXRlIGEgY29udGV4dCB3aXRoIGl0Lg0KPg0KPiBOb3cgaXQgYXBw
ZWFycyB0cnlpbmcgdG8gY3JlYXRlIGEgcHJvdGVjdGVkIGNvbnRleHQgY2FuIGJsb2NrIGZvciBz
ZXZlcmFsDQo+IHNlY29uZHMuDQo+DQo+IFNpbmNlIHdlIGhhdmUgdG8gcmVwb3J0IGNhcGFiaWxp
dGllcyB0byB0aGUgdXNlciBldmVuIGJlZm9yZSBpdCBjcmVhdGVzDQo+IHByb3RlY3RlZCBjb250
ZXh0cywgYW55IGFwcCBpcyBhdCByaXNrIG9mIGJsb2NraW5nLg0KDQpDYW4gd2UgZGV0ZWN0IHRo
aXMgY2FwYWJpbGl0eSBieSBjcmVhdGluZyBhIGJ1ZmZlciBvYmplY3Q/IFRoaXMgZXh0ZW5zaW9u
IGlzDQpub3QgYmxvY2tpbmcsIGl0IGp1c3QgcHJvdmlkZSBhIHdheSB0byBzZXQgY2FjaGluZyBw
b2xpY3ksIGFuZCBzaG91bGQgY29tcGxldGUNCnZlcnkgZmFzdC4gVGhlcmUgaXMgYSBJR1QgdGVz
dCBJIGNyZWF0ZWQgZm9yIHRoaXMgZXh0ZW5zaW9uIChub3QgbWVyZ2VkIHlldCksDQpwbGVhc2Ug
dGFrZSBhIGxvb2sgYXQgaHR0cDovL2ludGVsLWdmeC1wdy5maS5pbnRlbC5jb20vc2VyaWVzLzE5
MTQ5Lw0KDQpJJ20gbm90IGZhbWlsaWFyIHdpdGggZ2V0cGFyYW0sIHdpbGwgdGFrZSBhIGxvb2sg
dGhlcmUgYXMgd2VsbC4gQnV0IEkgdGhpbmsgaXQNCndvdWxkIGJlIGVhc2llciBqdXN0IGNyZWF0
ZSBhbiBvYmplY3QuDQoNCi1GZWkNCg0KPi1MaW9uZWwNCj4NCj4NCj4+DQo+Pj4gVGhhbmtzLA0K
Pj4+DQo+Pj4gLUxpb25lbA0KPj4+DQo+Pj4NCj4+Pj4gLS0tDQo+Pj4+ICAgIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9jcmVhdGUuYyB8IDMzICsrKysrKysrKysrKysrKysrKysr
DQo+Pj4+ICAgIGluY2x1ZGUvdWFwaS9kcm0vaTkxNV9kcm0uaCAgICAgICAgICAgICAgICB8IDM2
ICsrKysrKysrKysrKysrKysrKysrKysNCj4+Pj4gICAgdG9vbHMvaW5jbHVkZS91YXBpL2RybS9p
OTE1X2RybS5oICAgICAgICAgIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKw0KPj4+PiAgICAz
IGZpbGVzIGNoYW5nZWQsIDEwNSBpbnNlcnRpb25zKCspDQo+Pj4+DQo=
