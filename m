Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 899E97FE50B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 01:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263DA10E376;
	Thu, 30 Nov 2023 00:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A499010E21A;
 Thu, 30 Nov 2023 00:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701304883; x=1732840883;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=EUbdBS2anUyM1A4KaVxnuN2Mw6eCHbCiEe3jURrieME=;
 b=coED8mKiPu97AyxxFNCbjB3llM+kh9VgdGoZ3yyZG5IIhW99BiVQZfHT
 SKxnqtlFfE4w3KbsfI0A7cEwfuCQFklX1pwUq98B3DDw4rXAV1zmWg30j
 mKVPniVL1K288GRAy4mISLTvhJX9Spg4hgn/m6pZGDNJQS2/5CVobGChK
 dl6VGAgMqCCplBH6Njim9HFOzfOKvcBZNwo7cxKMymI0E10/pGG0kTdKe
 hoW49nCw3+g/a3cQ/SaiJL/DOAHxVnh8B0wn1m/SfeH7BedHnXmGNwoqR
 HGRf2VJp7Z6kZyqGW1DsGCy6Ho+ooSHow4vmVoAncFBQRfqghiAAcn/sA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="479448699"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="479448699"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 16:41:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="892629236"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="892629236"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 16:41:22 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 16:41:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 16:41:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 16:41:21 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 16:41:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NfxXHpk8JZwWHWVPremD2HI69f2aB6tHfujlwv9FUs+NZ0F7nUU8XsXRSPijuIUxW/2TJGNkEYgiknf8fSUd3Vlhlj9wzKRdOfioztJgD2xcqWCIcgzkSudJycXaH/6D75MdoKgCSl6XAPUoLc/e25VNfCkEPjN92HSHkgqLXjJ63gKzIu6gI6LINzAadh4FlTEytJkyPT6ht+xzc6enax5XgXzIwuOJjAeMgk/U2X71DzzqBW+4IQIrZEia8mnqUvShClgVQiRlToFmb2SoBetuhngJyc35vkLwEYslS/8fwBXFnshRGJksLWNK63QD1UYTgMRVfXCeDP53tn+IoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUbdBS2anUyM1A4KaVxnuN2Mw6eCHbCiEe3jURrieME=;
 b=Zdwb51x39WfsFhjyYWOca5o5JTwGcjfPt1aF4M+VmS5NoXCGXYqswsBZn0Bzu2MUCED/WaNHyv4hqHdWAmR5JtQDSqlCy/mjOivkiNI6nzlP/Hzw/ePqc+UZ0VPZWXXGdg0ymd4CvPE0GNgqbo/xgLcNNhcweDMMjer52hLt59L/RmuQ9wQu6Zb2VVVrw15Ei4lqFqQnsoZhC+oiWlwyhBU3fz/NTffe1Cs+qBHrRM+Y7Ygy2/uD5oygFIH5AStc+0d71ErPrUqZFc3hCp8XP4q0soozrhChCndKne/mbzn3LNpawinhqeVjXbylQvOrUwdBFjMRGgH1wjfWIwF3dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA1PR11MB6869.namprd11.prod.outlook.com (2603:10b6:806:29c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Thu, 30 Nov
 2023 00:41:18 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 00:41:18 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/1] drm/i915/pxp: Add missing tag for Wa_14019159160
Thread-Topic: [PATCH v2 1/1] drm/i915/pxp: Add missing tag for Wa_14019159160
Thread-Index: AQHaHYK6hL0AgLMvsk6RiwIyyLCmr7COpH+AgAMyYQCAADnzgA==
Date: Thu, 30 Nov 2023 00:41:18 +0000
Message-ID: <6f50e997920c5ed4a08d30296c73dabeb2e7ee27.camel@intel.com>
References: <20231122203003.65735-1-alan.previn.teres.alexis@intel.com>
 <ZWT7DeeS4svpw4PQ@intel.com>
 <c38b5486ed98e04ce2369a0dc29c14ab9c7d3961.camel@intel.com>
In-Reply-To: <c38b5486ed98e04ce2369a0dc29c14ab9c7d3961.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA1PR11MB6869:EE_
x-ms-office365-filtering-correlation-id: 811a28bd-6354-4e94-9a8e-08dbf13d10e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E8e+qEjZDhVfnV1b8lrB55JVGS9648SEuP8YnnF6FOL40Ab38FGDNBL2socS0rF6Ae9fvsW6nugkTE8HwhK99E+ze6+w7x5/v4aTtLG6czE1kGhqJ4CxajZX6qluC4PAENWgnpVaTYMciUflyMBpP7K955r5KId8VJs1PVeROuJo/IjUoqPDuD1FEpaEkgsadEtmf4gs4g4vfH2+9/RDZRfnqRjhQHlNI7BmI97tHh2Dqu91/UK9b9JqMI7iKj4rtid1mgCUB1lDp6GVFAgUHq9KITcNLTX13Iah+QBsTxuswEtJ8Xhzaej3GCnqUAZgnbPAzs+u2PP92UO4+t0yFufqxrmrTGojmnkiALICWfGyekiLIW+kTgBLgIKyo+Ii3A5EK0OhHb2H+Mmo2/pGkhqH4Ir1xrGQ/zLD+4ijaLof7gPd1Smq1GdobzGCoaiLRzSO5jefY+ZV+fVn7ZAetI4eT7PGOHaH6x9Wy3NPiM2cP42/Pe7JhJIG5LnZHNNDod7wzimW5esRVcbbA9gYJDQ4QFVRm2bppBFvbA0yusVMOfBKAHElFwqtdG6cIPftMyEjV3hwXP0esNwRONQzV7Ay7/zOz0weDCshgSxXnhheFEaHzfq0oFS6P21vFhZNHLe4zIMVbNLtBin/fOt7nOBXz91jUsEydLxUOWm1Uj8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(396003)(376002)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(38070700009)(26005)(86362001)(2906002)(5660300002)(4001150100001)(478600001)(2616005)(82960400001)(202311291699003)(6506007)(6512007)(71200400001)(38100700002)(66476007)(8676002)(91956017)(76116006)(41300700001)(64756008)(316002)(6636002)(4326008)(450100002)(122000001)(66446008)(36756003)(8936002)(66946007)(66556008)(6486002)(54906003)(37006003)(6862004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjJBL015aW9VTTJjeFh2bDZRZ2tidXk0eWFlUjlUNkFOTjRBNThKdFZSTWJL?=
 =?utf-8?B?SnorcFVTY3o2MVhJTWhwbHBrNElxODZuL0N3cTlKcS9XMzZadVBCWU5BbzRy?=
 =?utf-8?B?cVpnMCt6VVFvK1BvWG9wL3JhZ05MS0lJdnlza1kvT0NHTS9XTFY1M3lYZG9M?=
 =?utf-8?B?L1hmdEk3UWN0bFlVd045b3BwbTZZUGxjWEN6NFNlRXZzTVlDZlBQWll1by8z?=
 =?utf-8?B?UVF3NGhPOWdOYzIvamNIcmM4STNmK1ZsMG8vWVY3SEx6L1FFbG5QMExzNndG?=
 =?utf-8?B?UTdJYURiWEZFdFVrWUNiekpLaHg1d01tck85RmZqMlNFblVMS2h6eHR5RWpB?=
 =?utf-8?B?bDZhMHFhUUF4UW54QmNHWC9JdVRtZFRoYWYwNDVNdk90bWIxMHoyd0JpUHBi?=
 =?utf-8?B?TWZNNUp4bG1zMWRXV3FyeTVSelhOSHBVMDRvcW5MYWFuWGtHd1hOYkRKUmVF?=
 =?utf-8?B?L1dRaXpnQXBGcmFjOXdYbG9ia0VibTk1ZGFDbDdQWGFNTzRjU0RiSW85cFg1?=
 =?utf-8?B?RG5lS1FkNkhHS2o1S29kMlJab3FTMTE1ajhsVzBCWVpsaVR6VXFQY1hXUUJu?=
 =?utf-8?B?czZUMmVzS1hOOUFxanVtMFFYNi9jckUrTVNQaHNCMzd0SEs0eEVGNmUxTDVJ?=
 =?utf-8?B?aDlkOFBCZVYrQXBvREZRQ1ZycE4zZThRdXY4aStpY0pidnFnWVA4NVV2RmZM?=
 =?utf-8?B?S2FFd0M1bmlNd0E1T3JGYkRuUkhORlJnUkVRWENDRVJjM05qWm1MWDVoRCtJ?=
 =?utf-8?B?UE9pcXYvNlhLQytZN3FkcUQvV1ZsN1d2ODNaWWFsN1d1MDkwTEdUMy8ra1FH?=
 =?utf-8?B?V25NVHBNSEN1ZHlaZkFJc0ZNbEY2WWt0TUJCcllxSU1LT2VJdnRGSXZnN3hv?=
 =?utf-8?B?b3RFNXBZOGFlbHNNMVVITlQ4Yk56L2VUWjVMbHFYbmFkbEx6am11anRIRHVp?=
 =?utf-8?B?czlreHRRcGRYL2k4VkpJcURBeDY1QmEzbUwrV1hsc3JFVnhzaSs4U3pTdlV5?=
 =?utf-8?B?QzdZRTAvaC9wOHBFZEpyUDQrZmx1MVBFc2N0YWNHemk5VzY5VXRMLzQyS2sw?=
 =?utf-8?B?WmYzY1FmTm5qcFJqWUJWbXpUYVkwWEJGcjhIVHpML3cxa09Mc2x5YUZMa2gx?=
 =?utf-8?B?YlRaR0pmakJwR1Z0NFl6dS9BWVB6YmxwK1h0cEJ3ay9qbDF5Tjk0Z291YTQ2?=
 =?utf-8?B?K3hhQTg4Q3RsUkRYaWdZejNoQVd4Nll5amxIVUdGSGRDd1pLUTlSTjY4UVkv?=
 =?utf-8?B?VnMwdkx5d1laUE85OEdNMndOS1p1WHRLSTdrN2QyaUpvV3A2a01VNDdINjFO?=
 =?utf-8?B?TVRtV1lXaS80R3paWHZQV01rNHp1dDBmZmI5RVlNU3ZnNXdrRXowYWg0M1l6?=
 =?utf-8?B?NzZ5U1RTYmx5RzJYWTV5TmdkQ25hSTloVU5SWlB4K3BTalhNcWhoUlhWeklC?=
 =?utf-8?B?OUhLaUxSRmY0Z1pVS0hvbGk0M0hocWJJeGJDOXh5Q1pCZjJtVmIxcmxjazhj?=
 =?utf-8?B?Sy91T09peTc0WmhSbkxvOE0ycHArUUxGVkVySm9hclROOFBkSlEySG9SbWZy?=
 =?utf-8?B?cWpjVkpQWWU5dnlleHFIUGNBUzlhbjNiUWk3dU8ra2F1aVl1cUpMUE9Uci9t?=
 =?utf-8?B?dElUZlR1Uy93TktnNks1ekdVd0Q2L012RTFUZ1ZNTjVIT3drSXVIU3gzSVBw?=
 =?utf-8?B?UWY5V2tjYkYxUWZkNDJHZ203R0d6d1k3b1lSeWdHK0xsc21NVFYzTWN4UmxE?=
 =?utf-8?B?SitqMUxaaUtEOTl6SkZTUE1GZzNoQ3FSZyszeUxHd1FROVB0T3VObHFrK0xp?=
 =?utf-8?B?OERIY1FVQjlVR1ZvTGFScmFkR21yL0VRS2xqWlFqZXJIVmE3Zm1DcGM5S3Mr?=
 =?utf-8?B?TVhvTGlhV3BmeUQ2SlpwNjNlSTUvZjUrdWcrYUlWWkJqa0JVZCtOaEM4QWZw?=
 =?utf-8?B?Yk5qaUY2YlVLa2tlSTAyWVpVd3dTOTJnSGFoQ1RlSENwVTFoVVBSZWZlbm5u?=
 =?utf-8?B?Z2ptRWRXMVNUZktIQUtXejlpVmk0Q25qQklpcTM3c29Kc3QveVhTdTZrZUp0?=
 =?utf-8?B?TnlQcVpNSkJOQW5BZGJ3czFoWjRPc1ptTGVtQzFkMjA5U3NRR3RDM0V2bnlx?=
 =?utf-8?B?dEdKdUdxak5oK0dyNzBvZFh5L3lLNkl0RUV1dDFvbG1zK0NrYTE2dHNITlQx?=
 =?utf-8?Q?clhunYdWHgYC+EqCmREqMPE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5449AA7F171C7642BABC115E46C313D1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 811a28bd-6354-4e94-9a8e-08dbf13d10e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 00:41:18.1584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FeobgT76P4Jg7fPF7g+IJLNWS7jNbUbMLJJE2dYCrOhsPsw12GLtD0znXh9Qyd6779xFn5cMp/uIhRRbHNUxEZs1D+BffG1qkToZ/zek/8OMbtRA0A/Z1SCmykRO/XnS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6869
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
 "Harrison, John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTExLTI5IGF0IDEzOjEzIC0wODAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBPbiBNb24sIDIwMjMtMTEtMjcgYXQgMTU6MjQgLTA1MDAsIFZpdmksIFJv
ZHJpZ28gd3JvdGU6DQo+ID4gT24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgMTI6MzA6MDNQTSAtMDgw
MCwgQWxhbiBQcmV2aW4gd3JvdGU6DQo+IGFsYW46c25pcA0KPiBhbGFuOiB0aGFua3MgZm9yIHJl
dmlld2luZyBhbmQgYXBvbG9naXplIGZvciByZXBseWluZyB0byB0aGlzIGxhdGUuDQo+IA0KPiA+
ID4gIAkvKg0KPiA+ID4gLQkgKiBPbiBNVEwgYW5kIG5ld2VyIHBsYXRmb3JtcywgcHJvdGVjdGVk
IGNvbnRleHRzIHJlcXVpcmUgc2V0dGluZw0KPiA+ID4gLQkgKiB0aGUgTFJDIHJ1bi1hbG9uZSBi
aXQgb3IgZWxzZSB0aGUgZW5jcnlwdGlvbiB3aWxsIG5vdCBoYXBwZW4uDQo+ID4gPiArCSAqIFdh
XzE0MDE5MTU5MTYwIC0gQ2FzZSAyOiBtdGwNCj4gPiA+ICsJICogT24gc29tZSBwbGF0Zm9ybXMs
IHByb3RlY3RlZCBjb250ZXh0cyByZXF1aXJlIHNldHRpbmcNCj4gPiA+ICsJICogdGhlIExSQyBy
dW4tYWxvbmUgYml0IG9yIGVsc2UgdGhlIGVuY3J5cHRpb24vZGVjcnlwdGlvbiB3aWxsIG5vdCBo
YXBwZW4uDQo+ID4gPiArCSAqIE5PVEU6IENhc2UgMiBvbmx5IGFwcGxpZXMgdG8gUFhQIHVzZS1j
YXNlIG9mIHNhaWQgd29ya2Fyb3VuZC4NCj4gPiA+ICAJICovDQo+ID4gDQo+ID4gaG1tLCBpbnRl
cmVzdGluZyBlbm91Z2gsIG9uIHRoZSB3YSBkZXNjcmlwdGlvbiBJIHJlYWQgdGhhdCBpdCBpcyBp
bmNvbXBsZXRlIGZvciBNVEwvQVJMDQo+ID4gYW5kIHNvbWV0aGluZyBhYm91dCBhIGZ1c2UgYml0
LiBXZSBzaG91bGQgcHJvYmFibHkgY2hhc2UgZm9yIHNvbWUgY2xhcmlmaWNhdGlvbiBpbiB0aGUN
Cj4gPiBIU0Q/IQ0KPiBhbGFuOiB5ZXMsIGkgd2VudCB0aHJvdWdoIHRoZSBIU0QgZGVzY3JpcHRp
b24gd2l0aCB0aGUgYXJjaGl0ZWN0IGFuZCB3ZSBib3RoIGhhZCBhZ3JlZWQgdGhhdA0KPiB0aGF0
IGZyb20gdGhlIEtNRCdzIHBlcnNwZWN0aXZlLiBBdCB0aGF0IHRpbWUsIHRoZSBjaGVja2luZyBv
ZiB0aGUgZnVzZSBmcm9tIEtNRCdzDQo+IGNvdWxkIGJlIG9wdGltaXplZCBvdXQgZm9yIENhc2Ut
Mi1QWFA6IGlmIHRoZSBmdXNlcyB3YXMgc2V0IGEgY2VydGFpbiB3YXksIEtNRCBjYW4gc2tpcCBz
ZXR0aW5nDQo+IHRoZSBiaXQgaW4gbHJjIGJlY2F1c2UgaHcgd2lsbCBlbmZvcmNlIHJ1bmFsb25l
IGluIHB4cCBtb2RlIGlycmVzcGVjdGl2ZSBvZiB3aGF0IEtNRCBkb2VzIGJ1dA0KPiBpZiBmdXNl
IHdhcyB3YXMgbm90IHNldCB0aGF0IHdheSBLTUQgbmVlZGVkIHRvIHNldCB0aGUgcnVuYWxvbmUg
aW4gbHJjLiBTbyBmb3IgY2FzZTIsIGl0cyBzaW1wbGVyDQo+IHRvIGp1c3QgdHVybiBpdCBvbiBh
bHdheXMgd2hlbiB0aGUgY29udGV4dCBpcyBwcm90ZWN0ZWQuIEhvd2V2ZXIsIHRoYXQgc2FpZCwg
aSByZWFsaXplZCB0aGUNCj4gd29yZGluZyBvZiB0aGUgSFNEcyBoYXZlIGNoYW5nZWQgc2luY2Ug
dGhlIG9yaWdpbmFsIHBhdGNoIHdhcyBpbXBsZW1lbnRlZCBzbyBpIHdpbGwgcmVjbGFyaWZ5DQo+
IG9mZmxpbmUgYW5kIHJlcGx5IGJhY2suIE5PVEU6IGkgYmVsaWV2ZSBKb2huIEhhcnJpc29uIGlz
IHdvcmtpbmcgb24gY2FzZS0zIHRocm91Z2ggYQ0KPiBzZXBhcmF0ZSBzZXJpZXMuDQphbGFuOiBi
YXNlZCBvbiBjb252ZXJzYXRpb25zIHdpdGggdGhlIGFyY2hpdGVjdCwgYSBkaWZmZXJlbnQgV0Eg
bnVtYmVyLCAxNDAxOTcyNTUyMCwNCmhhcyB0aGUgZGV0YWlscyBvZiBjYXNlLTIgdGhhdCBleHBs
YWlucyB0aGUgcmVsYXRpb25zaGlwIHRoZSBuZXcgZnVzZS4NCkhvd2V2ZXIsIGFzIGJlZm9yZSBp
dCBjYW4gYmUgb3B0aW1pemVkIGFzIGV4cGxhaW5lZCBhYm92ZSB3aGVyZSBQWFAgY29udGV4dA0K
bmVlZCB0byBhbHdheXMgc2V0IHRoaXMgYml0IHRvIGVuc3VyZSBlbmNyeXB0aW9uL2RlY3J5cHRp
b24gZW5nYWdlcy4NCg0KDQo=
