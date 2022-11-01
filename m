Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FB56154F6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 23:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D0D10E431;
	Tue,  1 Nov 2022 22:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9593210E431;
 Tue,  1 Nov 2022 22:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667341772; x=1698877772;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NCE8c7HWCU3CXBHMh1c2JJcAjxFvtAdX0jDYCV0/zqU=;
 b=ig22NgCyxsvlr9/uErOazja3CGHfE9Wu/qPSuBtguT29g44xYZmg0HgE
 1jBqBghfWM3el6t3a0NMTywUmI9yyUjiL2tOiPaJ3GPFgit6hHItfRPaj
 VDaSJqMzNGRrqpu3xo8rrWe+/l/3GGZgYvE59maEvonY68KzjSyoQuAGS
 8ozAHRoTHSWysuEWXJT77H3Xe0zVfsTadSKggcShquXNTQd4BblUE9xRb
 6KW/zZxSxAA9bqSS2OfGHk5bdnQviLMXgDpJnXW3vjYpYRBUbdc7ewyoO
 hu/pvuThwPsqB++LAo3ej3OvP4Z/VbWPnEtXDKlTBOtw547paDEG7mn15 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="289643952"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="289643952"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 15:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="636558816"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="636558816"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 01 Nov 2022 15:29:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 15:29:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 1 Nov 2022 15:29:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 1 Nov 2022 15:29:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWc89+pOO6/sfxYHiY6AyB+C5N2xIgfNjwK5cU23SflL5RRQbBgOCMfKfbHBtRlu/hmfuVm8pZY+WImfB8607nwrffvuJi4000DZ6jg1tYgmsMHuMI/3zoIbQrqKtm83I7LHMuJmGvCpHMC9lJvf/Quys1rx6TxkxTKi7gqboV+NQ07IAmxRyJz2DxyB/pJHHoANIYPXamcf/ZFq8NJXl94BbhxsF/j9kri4XC3dWSx/oEGvDDtxBEgc6mk/CTFEPizrsQrf9sS1fEyvOVmrNV0l4GrRjcdSpAHTB7TrcD9M14tLZn0lgTWaMK4IyEvezBcpz9Db7s4waoUtd8+isg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCE8c7HWCU3CXBHMh1c2JJcAjxFvtAdX0jDYCV0/zqU=;
 b=EEIzpWDLAYEquMHBP6eRxPA1xzBi7BtBGk3xeorabPVj/FYTuu24+OTfR11Vv7opIzE86IPuPhLvb+c688LHFRjrmfc2K8LcZVZoJQW2HSFEbsA7XIpD9NP7CItyMO9WxmoGpIdaLgdg+jmG5Q2RluBgR7H4/NIUSx6TmES6GoabVxophyqZQUJ3Oprxj6mIIjjuFA2igTxD5lRa8UogcVv7BmyoB0JM0l3elzE1MfUBAIW5DEeATNK6uD1o6Nj7y13MbpOsNA9xNSxlhK1+/DXO2Mc8qWn3eFm/F+DFi6FZtuCueCg3ILMjQOyVAl6eixcC4Q9WgJ1d5W6/0zOdvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5383.namprd11.prod.outlook.com (2603:10b6:208:318::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 22:29:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::29e1:56c3:823b:45d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::29e1:56c3:823b:45d%5]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 22:29:24 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PULL] drm-intel-next
Thread-Topic: [Intel-gfx] [PULL] drm-intel-next
Thread-Index: AQHY6vpC1Y0UoG8RykaDuBR4aAgH9K4kd5eAgAY1PYA=
Date: Tue, 1 Nov 2022 22:29:24 +0000
Message-ID: <d97f246025eefa859708b1923a81bd15a9fda179.camel@intel.com>
References: <Y1wd6ZJ8LdJpCfZL@intel.com> <Y1xonYqg5qrbTFA/@intel.com>
In-Reply-To: <Y1xonYqg5qrbTFA/@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|BL1PR11MB5383:EE_
x-ms-office365-filtering-correlation-id: 41e21542-0ffd-4ccc-ff48-08dabc588786
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gC5JGi6luD0BeaPPtqLHFoErKxroglM9AM7Wp8FmfHJYd8uUMJ59komDrEVSJ7cQBGCpw148rRrL6n8HnqNVzZlndAc/9qlXS/hnQjhDhxHRjO4bsCobfNh8LqMeICTtLFwG09pXqG4Lhb9o4+PLV/nanptTFbTA+O4GRN7bD44aZZ5JsgyMTa/3BUxOLhkDwOmN7BrNTIsvf7klRYhv2oEGYCDdq2UeMfRhXsQQxWM8+yfM7YQZkKwph9gS6mbRM0hchkvaJrX4417S/2DgBUqehF6t2nRmBn24OGqCho1SQc3R3ePTh1rMRiMnT53fGbyZIyI3IJml2YORhFyuWjE0Sjpe8HqoMf2YZGTomHXdBNGPuVcTdO586SoN/bT4rQ9LjWSDZn5wKgQ5LUV4HM89Ps8sbdzTROTJ3VszW9hxbJqIFe6vADGfSBISvUKrqBkhMZ7ctyI4pCJ4PU0oOHI8T9vhk8Dz35AEmOkZt1TxO5wSMRgd5ZwWRIkc/F0qTDDCctc++ozIp4bkGTtBdqjZNGYq9Z/qm0woosU8KhetCJF5aB7xWm2j4qeghX4Smnv1NjLwznGDd9wgJkhjInvB3MqlADg/h2lDTxDr9+r9UB57DPGr2WJ8srSsnLXEDnFfyd70lVsvR1+F/DwEmZVRMEynlRCsIaInqkk3Xs3kUBVpn2YPDHUBigsQKRSPQP1v1BCAbE9OSuXDEBFYo6z2Q92blzihyFLzyriQ/E8Obh4xfhcHiRkmI2QrnDDy4wNtdzY6csnh4mlqbWSueA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199015)(8936002)(2616005)(4744005)(5660300002)(83380400001)(2906002)(4001150100001)(6916009)(66574015)(6486002)(54906003)(91956017)(316002)(36756003)(38100700002)(478600001)(86362001)(26005)(122000001)(6512007)(71200400001)(186003)(8676002)(41300700001)(66446008)(6506007)(4326008)(82960400001)(66476007)(64756008)(66556008)(38070700005)(76116006)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHVIQ3I5L2cvRGdxcmhPclhiT2ZNczF0anJKNEV4aC9ndnI3SVpQQnJxSFN6?=
 =?utf-8?B?UytRZ1BodXZzeVhMUy80Wm5Fa25UeGhQZk1GVlZraTN1dWp5Y1lLd1VDdDRU?=
 =?utf-8?B?UmlCaDBUMEJoTnhPUEY1VG5na1puK0FzQ29PY0FObVFGQVBCaFl3K2hYYXFO?=
 =?utf-8?B?TjNrdWxyenF6VC9teXMzWXhRQkVrNDZGN3VrdERRNkRuQmNvNUhCQXhmWHhv?=
 =?utf-8?B?TzlOZU15bmk1OS9EaTFYaGszQ1hES0lVSkk5Sm9tM1hrakgyVFFNT2Y0OG9s?=
 =?utf-8?B?L3JyNHdoQS9qVnF2OFJGYW9mM3JOa2E5Mmw5WDlYM2JIY29SR0RrNkQvNngr?=
 =?utf-8?B?NXcvQjg4bGtuNWFsWWNOMlZBS1g5OHdOR0VYY29UdTlBZG84N0NvZERxZm40?=
 =?utf-8?B?czNKQ3gzaGY1UU5rZDVydlNhckVzOUlZRG03bHhHbkFEVEdKdzVQNlk2ZEdC?=
 =?utf-8?B?ZEM3d0R2VW1DdWFhclVxdVJTUzNGbmJDWEZQMFczTXZnUHZybmd0SUF6bWRz?=
 =?utf-8?B?dHM0K1pGdVlrOHlZN1JTckFhYklRQjFwK2ptWUYzMjc2V2UwUWFWL05DWGhl?=
 =?utf-8?B?d2lndXNBckt6Qm5ZcGhOcCtZdTNXNVNBbi9WM2JoRkdvTWMxMWpSV2taVWlY?=
 =?utf-8?B?YVdSZjBPTjVyTGNrZkJpbVpmM3R6MExGWDB3L3JrTG5lYS9pVC9ja01pOHNC?=
 =?utf-8?B?Tk9TQVZiWFJweHBySTVobmdlNnNMajQrSHVyQlpWYjhGN2FhTkt4ZzA4Y0lK?=
 =?utf-8?B?S1oxWFJ1dlY4MFNLR3ljRG4yN1hvRzNYVDBhMExRbVQxWVBtN3Bubk9EeHZF?=
 =?utf-8?B?Wk0zNGJnZGY4K0kzS01iQTBDMTB3R2dDM3orcVlzdlNOdWg2czQ5eTROQnFT?=
 =?utf-8?B?VkpCSENib2JaMHFMN0trNWtpL3gyeFk5bTJXUjJnVXl0S2srOHRIWmQzZUVo?=
 =?utf-8?B?VGlqSk0wUjE4alc3ekJ4cDluazFyc1I1QjBlVUV1T2o2YjQ2L2VNU0lpWUVY?=
 =?utf-8?B?b2N5OGtJcUcxc21JckowNmRnSzFDbnFHdWw5U1NIbTJLcDh2cEZqZlJJWGhF?=
 =?utf-8?B?alZzd3dKSVlmWFcvTDVmSzNoTkRWOWlDVnpYSStuMVZINjc0U0pRRUg3Z215?=
 =?utf-8?B?UzNPNitobG54REMrQWhRQlFkayt4NVpVOVQzL3ZUVjV3aHU4TFRlOGdpMktG?=
 =?utf-8?B?K052bjZGQzNMOG9uUGlOK083WUdod3A2VlVJNXRnQWpDYm1qWENWZUFMdjNW?=
 =?utf-8?B?UlZqOVlqVjZJK1I4Z2I0Q25HWjZNK0llcXQ5czdyNXd0Z1dRUGdUdWlpNTZl?=
 =?utf-8?B?dlVOR3NPMTdMRWZlbTlucGtnMnB1TENMdjBxalViZFh4ZURXcExFRHlFY200?=
 =?utf-8?B?RkMreE8yb242L3NjQUk4OGtJQlc3SXYxeEFsbFhHNEhlWnVtcE1lMFYrTEJU?=
 =?utf-8?B?ZjJRZVlHU2hlNER2ZUxadlQwSjZjRUczc1FwQks4aUx2Z1BRUENoZFFXVDRG?=
 =?utf-8?B?RmUxajdNMHJJUjZwbWx1UUlmeTNPYS80ZUtyN08wSzNPWmJhZlEwTUJmdEZJ?=
 =?utf-8?B?WHRBUGhuOVVnRjM4WWpVVDV2dDVGdzl5c2NDL1VQV2tZdVNabFQrZzFnUlA4?=
 =?utf-8?B?MXJXQ1ROaVdLay93czU2TDBTUmRYSzJmejlLMDdjN2RoUGJab3pOYTJIa2xh?=
 =?utf-8?B?eTVvVk1PZS9pNWhlcmdYeE5pbDdLWWJQclFid2FjUUg5WEtEeER0aW5pRVdC?=
 =?utf-8?B?MzhmM1FGN284L3NNcThpSEFtTzdYVEhseG9TNHU0U254Z3JpU1dIYkZEWVpj?=
 =?utf-8?B?bnlvMVlsZW9MVFFiY1Z2T0tpdWJYbHVGRW40NkZLUHhPQjVSUDhSK2JGZGhR?=
 =?utf-8?B?eGQySFJkQ1diR3RiSThaTTd1YjljOVU0K0QwMnJiYzI3N21FSGdxUE5vU0tD?=
 =?utf-8?B?S3Jxei91VXIrVTRNMnJlL0hIMWl1dUhZb1l0cGplN2RUdVNScmUyTjZwWVdY?=
 =?utf-8?B?QXlhR3Bza3pVc2VNblYydCtNeTFLemtNMjBXNWxXclBFZjJJdnFOaE85Q3dO?=
 =?utf-8?B?cnNtck84TzFUWklSdDFqMHE1Ym9Xb2xJVWlTS0lWemYzSEZDOXRhMjdneFU4?=
 =?utf-8?B?bE9uUi9EVkJEbkJucXNwdUpDczV0V0VXcU5lWEJFMXFhcTIvUkh2SDBKZm9V?=
 =?utf-8?B?aGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90F15062EFA082459EBE0D586864C37C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e21542-0ffd-4ccc-ff48-08dabc588786
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 22:29:24.2949 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WJVZsyJwKWNMXCjhn1BXUqTp2hjl/29Med1TfBIgPP/SpFCjc2bbCLp0RlV7sxoQVbSLK/A9UIKjxvGPaiEudw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5383
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
Cc: "dim-tools@lists.freedesktop.org" <dim-tools@lists.freedesktop.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDIyLTEwLTI5IGF0IDAyOjQxICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIEZyaSwgT2N0IDI4LCAyMDIyIGF0IDAyOjIyOjMzUE0gLTA0MDAsIFJvZHJpZ28gVml2
aSB3cm90ZToNCj4gPiBIaSBEYXZlIGFuZCBEYW5pZWwsDQo+ID4gDQo+ID4gSGVyZSBnb2VzIHRo
ZSBmaXJzdCBjaHVuayBvZiBkcm0taW50ZWwtbmV4dCB0YXJnZXRpbmcgNi4yDQo+ID4gDQo+ID4g
VGhlIGhpZ2hsaWdodCBnb2VzIHRvIFZpbGxlIHdpdGggbWFueSBkaXNwbGF5IHJlbGF0ZWQgY2xl
YW4tdXANCj4gPiBhbmQgaW1wcm92ZW1lbnQsIHNvbWUgb3RoZXIgTVRMIGVuYWJsaW5nIHdvcmsg
YW5kIG1hbnkgb3RoZXINCj4gPiBmaXhlcyBhbmQgc21hbGwgY2xlYW4tdXBzLg0KPiA+IA0KPiA+
IGRybS1pbnRlbC1uZXh0LTIwMjItMTAtMjg6DQo+IC4uLg0KPiA+IC0gRUxEIHByZWNvbXB1dGUg
YW5kIHJlYWRvdXQgKFZpbGxlKQ0KPiANCj4gQSBzbGlnaHQgY2xhcmlmaWNhdGlvbiBzZWVtcyB0
byBiZSBpbiBvcmRlci4gVGhlIEVMRA0KPiBwcmVjb21wdXRlK3JlYWRvdXQgaXMgaW4gZmFjdCBu
b3QgaW4geWV0LiBUaGlzIHdhcyBqdXN0IGEgcGlsZQ0KPiBvZiBjbGVhbnVwcyBhbmQgbWlub3Ig
Zml4ZXMuIFRoZSByZWFsIEVMRCBzdHVmZiB3aWxsIGNvbWUgbGF0ZXIsDQo+IG9uY2Ugd2UgZmln
dXJlIG91dCBob3cgd2UgYWN0dWFsbHkgd2FudCB0byBkbyBpdC4NCg0KU29ycnkgZm9yIHRoZSBj
b25mdXNpb24uIEkgaGF2ZSBqdXN0IHVzZWQgdGhlIHN1YmplY3Qgb2YgeW91ciBzZXJpZXMNCmFz
IHN1bW1hcnk6IA0KW0ludGVsLWdmeF0gW1BBVENIIDAwLzIyXSBkcm0vaTkxNTogRUxEIHByZWNv
bXB1dGUgYW5kIHJlYWRvdXQNCg0KU2hvdWxkIEkgY2hhbmdlIHRoYXQgdG8gRUxEIHByZWNvbXB1
dGUgYW5kIHJlYWRvdXQNCg0KPiANCg0K
