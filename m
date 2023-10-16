Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 925167C9E35
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 06:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0208E10E117;
	Mon, 16 Oct 2023 04:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1369610E113;
 Mon, 16 Oct 2023 04:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697430386; x=1728966386;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2g5W2s79L5ZHQPCZgmOTVO4QswKCASX1P81+W4VFyCU=;
 b=K2OHtjM7TYbR+wAzaljZ0TAWfpbdHVRN0aSEtRsGoyf7ucKWwKXn2+AW
 1UldGx9v9cgs8qzvnuExQoZDlofcdZgUjYPhC2L2pvWENtj6/is5DGKzJ
 yB/+QEfyZgkdRkfV4TWldK2dsr5thD7hPNUU8/BNkWFU5+Q8VdaAN+Xwj
 dw6M5tkmaXzRZoup//QrcJsMiSP4MF2yQ8CKy/tqOYEyVBRZaTJj/X9g+
 TpfhIJD5d45OHQ3kIoG/dka9sj+PHxWkVN9r+8/iB1Tcb+LE0Y9eZ/63u
 0riwFxhIrHHgdfzGxlnT6YjsWFCeyOKCQe0F6TpCCbn4MvQ+evIpayDlq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="388308779"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; d="scan'208";a="388308779"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2023 21:26:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="846253003"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; d="scan'208";a="846253003"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2023 21:26:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 15 Oct 2023 21:26:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 15 Oct 2023 21:26:24 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 15 Oct 2023 21:26:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lt8Ta6GlCYq5MSRA3bpVZpV4N3L+dtoifNYjG4VrXoSpgIk1TtVrjJ0BvvB/ZtfWZqmRu43Qp6zaryCHnfY9ALXtA/Gq04mEQAzoawCzQXAZF85hcir0hNnTisPW5FaMS3ekV6XQw4HhTmGu/ACXbs0ExiFcq3TIiWrUp2QxwP94QynU/kMWUsyGY5TIdzfOUw7C5L2ff0oodFZdfztMy7taWZ8RlBcpipVLiRbb7f6gwnyBwqSiZ53JOqHKISkaFbE42oRCK6MmcZPoKoN00zChlgq5XbhepCBV01FHBTTJmhtomtUZ36z2l1T6BKe3eRwPUofA3/hZmsLlR0Y4iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2g5W2s79L5ZHQPCZgmOTVO4QswKCASX1P81+W4VFyCU=;
 b=JwpdbqU/vl2RG8+AATfoxraexCUw8YXGGSMWRpHyR7nr3XzuD2xiSz3Qu+HliWWgwWhgiZy1+94//tEY4qHgRoZlL2z3WSyJM1SBfm4KtawGRdOLe65fOLhRUIcUkjZabrAY6WsKw2XbwrBklUg3iD7YIB9FMHGd420aMQdDhZ6wq0LGhqQLM/LcG7lgDJzfJRfsWn7TPGTG3GWKu1+UVM18VONbe4ux8oMzOCYXqViINXqlOxUgV5JlWBhsgGXfP4oFvKgzrDPvKNJZxnhe1ex+vFXLrE1hurERflHA8ZH6AIZKcfl7ebKJqaSE20YvggxIZPbOPyAk+EOGhxgsog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3177.namprd11.prod.outlook.com (2603:10b6:5:c::28) by
 MW4PR11MB5911.namprd11.prod.outlook.com (2603:10b6:303:16b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Mon, 16 Oct
 2023 04:26:20 +0000
Received: from DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::5e19:26b4:2262:6de9]) by DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::5e19:26b4:2262:6de9%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 04:26:20 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v7 4/6] drm/i915/panelreplay: Enable panel replay dpcd
 initialization for DP
Thread-Topic: [PATCH v7 4/6] drm/i915/panelreplay: Enable panel replay dpcd
 initialization for DP
Thread-Index: AQHZ/DUgWy70CGYF006sAYrMUHAkxLBL2NJg
Date: Mon, 16 Oct 2023 04:26:20 +0000
Message-ID: <DM6PR11MB3177BB6B336FA437EEB4EF3CBAD7A@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20231011110936.1851563-1-animesh.manna@intel.com>
 <20231011110936.1851563-5-animesh.manna@intel.com>
In-Reply-To: <20231011110936.1851563-5-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3177:EE_|MW4PR11MB5911:EE_
x-ms-office365-filtering-correlation-id: 1f34203a-7a1a-45ad-083b-08dbce000c2b
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XXdREaOww8ZzmHTfyYbG6wWSUf1HybrG0ad+zMVxefXv2nToBtfxq7JLY09142FjY0AltYXiI5xBPaheNSwvCj+ZkTO6mRoCkD3eyP6YTZ6YZRiqX3O3YrZYo5VRJ+zlQFf6uLo/nqvvl4mZCIgjOU+zT9CX5zvTFoLHXa4m1qBOaoNLuhh19MmupuGOufiM4efVJt1oSZ+qvavjTWWV8olpvwOX90bQXxQtSaZK9E92G/c5mdLD+Cj9+boSPS8CsAOIo59a8+SGstum/eiiK9xYVkJ0/PAmtG1k3+DAc7kd6YbLcjw1fp7qcOcrRMZGUcwPkN9fDJGK8J/ekRnhvBAxNbVyLt12pRY9D5ixrf+GpgdF30MTPKQyNsmDfH7W1XrNH0njmj96wU4oRaAwntEertz/lQ67aTXUTfANad6nyiC1mMzhXBSRXmlTAL7/X2ZZw4baJdgCDMj9lKQKnL1zF1ANTMXuqbonuVWiSyGYWEZOQVV9H2dnRSl3SSFc/bBrsqNRg4ieNdqH3A4MWqriquAjdcaeNJ1wPhOzlCyT9L87urkp8qjigFnsDrfrOmIVPl85p/2aHTV8n2OrDvKR/f1VXbOg9pyEe7beyKu41WMgKWj9/YsyhpSKoZy9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(55016003)(5660300002)(9686003)(7696005)(450100002)(478600001)(55236004)(86362001)(33656002)(6506007)(53546011)(82960400001)(52536014)(8676002)(38100700002)(4326008)(66946007)(38070700005)(122000001)(66446008)(54906003)(64756008)(66556008)(110136005)(316002)(66476007)(2906002)(41300700001)(76116006)(71200400001)(8936002)(26005)(107886003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDZocHoyN1dCdENMd3hiVGNSOU5KRUkvektBTzR3L2JjenpZNm9uMTRGd0d0?=
 =?utf-8?B?Z1phMzNzUWx1aGpaZzJ2ZEVjYS81TTlqNlg2UzZRZ3dLUnJucFZhQ3cxTnhi?=
 =?utf-8?B?Zi81RE53RUthVnJjTDBsb0UrVUNoRXNST3JQK0FQbFJKUEE2TlhUblE4cE9F?=
 =?utf-8?B?WjdhQm16ZTVibDZYSWN5bWU4OWVndy9BMFp4SytEUmhHcy9sZjhGaTVUWTBm?=
 =?utf-8?B?d3NML0tra04wUFBjVzBHZHpaOENDamJ1U1NtQkltelowdkVPdm0ybmNSSlVF?=
 =?utf-8?B?dE1kYU9YaWdJZnpHNk9tUTBzUFdsYlR1RzkxVFR6RktvbUhIMVJEVmE3cUdN?=
 =?utf-8?B?cEtxRitjR2crUGZKMmVWL0ROVklRYUEzYzJkSXFuVjl4M0pkSzNwekFMRlI1?=
 =?utf-8?B?TGhPZFNoMmhDeVc4OTk3djBHQlV5ZzRCeVdEbzBiVlNiTk84dEpGOW1qRnRh?=
 =?utf-8?B?bGYxa3d0K1cwTlZQbXFkb01kSXNCNzZLTGh3WkNrSFFOdmtpRm02NjZOYVd2?=
 =?utf-8?B?T1ZBdDFRMDhFRlBmKzBsMkVJek4zeXEraklTa3hhLzdBMXl0OU02VnNXTFVU?=
 =?utf-8?B?MkhSSnY2S1pmd1hZT2tFZmNXcFVsL1BKem5haU1QRDNOMFErWS9QaEU4V0pR?=
 =?utf-8?B?T2QvZDFCMmJFR1Z5aDVMMEVBTzI3Zm1iTTBHV1VzYVpJbVNpc05VMkw1WDJL?=
 =?utf-8?B?SzNXNUJybVJmRE9YOElMRnZ5aGhUT09FNDNUeEFKOWE5U0NaS25OOGg1YnB5?=
 =?utf-8?B?UXRxa2dLTW5nNXcwTVFZVmYxSlRKR2JUZnJSZ2xEWUR3RlNubDhlQzdpSEsx?=
 =?utf-8?B?M1ExY1ZmdXB6bzZXZGZRUkgvVjk3SjBDYUJrVjZxb28ySE5XQ2xYUy9xWVB0?=
 =?utf-8?B?R29UMlhMbHM4NkJ3Vkc4NjluVE5OZ2RGRE9wRGhvZHpHMVEyY2hEQ0xnZHFk?=
 =?utf-8?B?MS9tWXdseVluOHM0U1NGNVk2b2UraHhEck04MlF0WnhST1hockV1RkwzTS9w?=
 =?utf-8?B?RHdid3FSa3Q3MjlveEZyd0hXTU9qN0p1bTBMa1JEV0prOUVKN3ZoQm5FS3Rl?=
 =?utf-8?B?NzYwcG95N1JrM2VlL3BNUG42MkdlREYzVjFjVFlRSW15Lzl3ZVZoOE9MelNG?=
 =?utf-8?B?SkZGMzl3cCttZDZVeXVITm5hVmJXUmdzL0RBbmE5dkxjd05pdjN5TGtnTU9h?=
 =?utf-8?B?QkdzaHNLUG9JUjYrR1hWZ25odkQrZml5bml5WDgraHAwbG5mei9YeVdPMzI3?=
 =?utf-8?B?NnlUSSs3clYyUWpxcW44eUYyYkUyaWl6MDVNL1J5MTNYOEdQZ0FhRjBTU1V5?=
 =?utf-8?B?cVRGcjlDa2lZckllWHp4ZGc5R2lpMzlpSXBrbHorbnBHelh0SEJKaFF0bVBa?=
 =?utf-8?B?S2U0ZGppb1c3ZFFydU1VdGt0M1FVK0FDbDRtc3ZNN1ZmcHpicXQrWG1qQzQ1?=
 =?utf-8?B?VVBLSmhYSUFuNUVZZlVuNERYNmk3OTZFVWtWVU1ubnNlS0NxU2xyaEQyWi9Z?=
 =?utf-8?B?RWRUWE9xYkI3Q2NxQlg0L2lzUDdKWWhkYWx6WFd2TDdXU2tlZ285dlBrenZE?=
 =?utf-8?B?a092TXVzc3V5YjI5RWJycStGWmE4VzdnK2hvRzRlWm04TXZkUmgrQzJiaXdP?=
 =?utf-8?B?YTVaRlhrZ2NkREwyNWV2TmhUTTVzcExST25lNTViWDA0TGNJWjUzMFRsTjNK?=
 =?utf-8?B?T3ZxSENhR1o2MzNlcWlmSEp2TTYyY3JONm8rM1hpZWtYdnB6ZzJKcjRkUlZS?=
 =?utf-8?B?L1c1cWM1MlBFQlZDbDJramxQQys3cjRycERqUjhnTWFENE1IUDRMOTgvYmtZ?=
 =?utf-8?B?bWVXK09aTndVVXdJWWdrd1pLTUV6dmF0WEZaenZGMHh5akFWZThDOHZxUTU0?=
 =?utf-8?B?SXpOT3MvTzl5eEl2MTVKd21Jd244MVMxem9BemNaK2pzZVh6UVZsRVA3UWhM?=
 =?utf-8?B?T0pVNUI1NmxHcFV0OXZYVTZHb1RGZHdWd1JlL1dXZTNhbkpjRXEyUUxHMURw?=
 =?utf-8?B?c1ZDVXZIdHVNVFAwSGlPRnY4TXNJVG9FRStTRzVST1N3YS8wbzhzaStjYUVZ?=
 =?utf-8?B?bWlyVFBqWlJ4QmxDUG4yMm1aa3o0OGNGMjQxWllNalVqZ1Z0OEJ5WVZtYjBJ?=
 =?utf-8?Q?3J+sHk/LD2Ik2iF5fK7KW/WVD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f34203a-7a1a-45ad-083b-08dbce000c2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 04:26:20.2299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zXv+ON0E69hDiGO4j75oSie43WSyPoW+WZejm0VW3id8Uc5z5Fs+oSmYGFFY7ic1OZXhK+tUD67Bs8LsNLtbwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5911
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
Cc: "Hogander, Jouni" <jouni.hogander@intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hbm5hLCBBbmltZXNoIDxh
bmltZXNoLm1hbm5hQGludGVsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDExLCAy
MDIzIDQ6NDAgUE0NCj4gVG86IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IE1hbm5hLCBBbmltZXNoDQo+IDxhbmlt
ZXNoLm1hbm5hQGludGVsLmNvbT47IEhvZ2FuZGVyLCBKb3VuaSA8am91bmkuaG9nYW5kZXJAaW50
ZWwuY29tPjsNCj4gTXVydGh5LCBBcnVuIFIgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPjsgTmlr
dWxhLCBKYW5pDQo+IDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2
NyA0LzZdIGRybS9pOTE1L3BhbmVscmVwbGF5OiBFbmFibGUgcGFuZWwgcmVwbGF5IGRwY2QNCj4g
aW5pdGlhbGl6YXRpb24gZm9yIERQDQo+IA0KPiBEdWUgdG8gc2ltaWxhcml0eSBwYW5lbCByZXBs
YXkgZHBjZCBpbml0aWFsaXphdGlvbiBnb3QgYWRkZWQgaW4gcHNyIGZ1bmN0aW9uIHdoaWNoDQo+
IGlzIHNwZWNpZmljIGZvciBlZHAgcGFuZWwuIFRoaXMgcGF0Y2ggZW5hYmxlcyBwYW5lbCByZXBs
YXkgaW5pdGlhbGl6YXRpb24gZm9yIGRwDQo+IGNvbm5lY3Rvci4NCj4gDQpJZiBwYW5lbHJlcGxh
eSBpbml0aWFsaXphdGlvbiB0aGVuIHdoeSBpcyB0aGUgZnVuY3Rpb24gbmFtZSBwc3JfaW5pdF9k
cGNkKCkgPw0KQWxzbyBpdCBpdHMgc2ltaWxhciB0byBQU1IgdGhlbiB0aGVzZSBkcGNkIHNob3Vs
ZCBhbHJlYWR5IGJlIGF2YWlsYWJsZS4NCg0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KQXJ1biBSIE11
cnRoeQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KPiBDYzogSm91bmkgSMO2Z2FuZGVyIDxqb3Vu
aS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IENjOiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5
QGludGVsLmNvbT4NCj4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+
IFNpZ25lZC1vZmYtYnk6IEFuaW1lc2ggTWFubmEgPGFuaW1lc2gubWFubmFAaW50ZWwuY29tPg0K
PiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMgfCAzICsr
Kw0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+IGluZGV4IGY5ODM3MDAxYWE1Zi4uYTJl
MDYzN2M1M2ZiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX3Bzci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNy
LmMNCj4gQEAgLTI3MzgsNiArMjczOCw5IEBAIHZvaWQgaW50ZWxfcHNyX2luaXQoc3RydWN0IGlu
dGVsX2RwICppbnRlbF9kcCkNCj4gIAlpZiAoIShIQVNfUFNSKGRldl9wcml2KSB8fCBIQVNfRFAy
MChkZXZfcHJpdikpKQ0KPiAgCQlyZXR1cm47DQo+IA0KPiArCWlmICghaW50ZWxfZHBfaXNfZWRw
KGludGVsX2RwKSkNCj4gKwkJaW50ZWxfcHNyX2luaXRfZHBjZChpbnRlbF9kcCk7DQo+ICsNCj4g
IAkvKg0KPiAgCSAqIEhTVyBzcGVjIGV4cGxpY2l0bHkgc2F5cyBQU1IgaXMgdGllZCB0byBwb3J0
IEEuDQo+ICAJICogQkRXKyBwbGF0Zm9ybXMgaGF2ZSBhIGluc3RhbmNlIG9mIFBTUiByZWdpc3Rl
cnMgcGVyIHRyYW5zY29kZXIgYnV0DQo+IC0tDQo+IDIuMjkuMA0KDQo=
