Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4949A7848AE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 19:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A75A10E3C0;
	Tue, 22 Aug 2023 17:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7407510E3BC;
 Tue, 22 Aug 2023 17:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692726644; x=1724262644;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WuIs3eF1c5YuS/4hclrkmQZI3srL6haCU4qMA/0cC8s=;
 b=GdWx4rX2zquLn8uL3O9fSpAteob8XJDZwxR1yJnL1ICyFyKcfLut6lmo
 q0O+FjzX0OeRfr82O5t5Cm9MXbuuMnxTLIzjMKrr1ULaK56q7ODe6ifu1
 e6PdoKtV7zxMLWIqZz5Y4GhTrWoVZeiyAm1p0Dencmugg2NjUPZRE2u2m
 wanoMSwBfNB4pfXWomlD8rGccKDvaJLgTDdZ7ED6GBHj3t7f0nD/lDQur
 MOTvTU4wAIwU5dgc5i/s0FCatV2X8caKLbuGcrfriRblVZMy4h10xdVao
 7yjdLrXLW26TvdIoW0SKNvwYRHsUiJSGu5VeZe7wn80syyB5HRNYdWSR1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="404955392"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="404955392"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 10:50:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="850712530"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="850712530"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 22 Aug 2023 10:50:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 10:50:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 10:50:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 10:50:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YedpkldaEtmCupFpecaa0Cnpq8H+kMduvlDsgcP8eRso0d+VPdwTiSZ/fUv0GH79Ipe//yjltrF0+sY+HXxp1syAEp6Je8PglPcDMZCQapWS23bSSa2mOt6NPjB1vkNahsI/6aBzOGSX09tk/pv1uwoIq2BYQCQJaJHSBgJpnpX7PxBMvFZLpjFY55Z4JWrL1Z9mRH3epkdhSR+MkanrVdoMTLFX6y14wtMBi7Ai6P+DfWeRvW5Pr2TDNbK6iNXCF5c7SbJkAMajtoT6Ud3rZ2rCz41VAj+sAhxF8S2TC7IT1oCA3hs8HnzMduD8y8/PCxNFDpvSiATG6SGbMR/PtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuIs3eF1c5YuS/4hclrkmQZI3srL6haCU4qMA/0cC8s=;
 b=VfWK5H/Er1JrJxd1qbQp2qAFki9UUm4YEO+HkxxMekJ9aDAxtMfHRqjUNL9al0Gmpzhl1SoLhqw4ccxpIR+jX0PigjZwsKUsvLbFrSC2tis/uLEJBvfS3XxIVWc6xLyKO9ZvlSdJ9Iw00BuY0akw9SvWGOyCx6XfDhWnJSO/ju8sa/xqtCBRXWm9FIggbF8F8ZBRLKmrE0kL/rDhEvpEJyFa6Sf0QIKoIfKPyQOyWCprwuRiqjyNrwLKeeUDs6nwOtovXbuenef8WyPFeXdV2Zx1g3adYZW7MTQq8PSCBvsYxQ/hbvFmTe/utXhWm435oFA4lsatCZmadHlNP+LPsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA3PR11MB7487.namprd11.prod.outlook.com (2603:10b6:806:317::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Tue, 22 Aug
 2023 17:50:39 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::18a2:59e7:4541:b61c]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::18a2:59e7:4541:b61c%3]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 17:50:39 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>, Felix Kuehling
 <felix.kuehling@amd.com>, Dave Airlie <airlied@gmail.com>
Subject: RE: Implement svm without BO concept in xe driver
Thread-Topic: Implement svm without BO concept in xe driver
Thread-Index: AdnPImk6MOYV1wEITTKbUW99JKTN8AAlN1TAAAO9foAACdAN4AAGjR0AABKlsyAADoTWgAAB+b6AAAYiLxAAwfeKgAAgzF1wAAJu8xAACKUJAAAAOz8QAAM9wgAAHvSWgAAJBtTg
Date: Tue, 22 Aug 2023 17:50:39 +0000
Message-ID: <SA1PR11MB699153926D727A15F5C0F539921FA@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <SA1PR11MB699192A66D7A2CC7305A59569214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB6991F9E3107C963BDF95E04E9214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <e0d7d6a2-5c9d-6e17-4b4b-be03deb6c130@amd.com>
 <SA1PR11MB69918E5603E286961789DE6D9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <3c125b60-df60-2037-c23f-918734e4973f@amd.com>
 <SA1PR11MB69916E51CE5A9217D447B91C9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <7ae5f112-d0e9-cc52-2b22-7265ea435cc2@amd.com>
 <CAPM=9tyots9C8wEU0TgGnFmLOkfqn62ngaYYjV2yuTf7jwDGFw@mail.gmail.com>
 <SA1PR11MB6991D7E239EAB23CC8A9A36B921AA@SA1PR11MB6991.namprd11.prod.outlook.com>
 <CAPM=9tw3wGhZ3ByfizM8+G4Ny5wQLwf4fw8pD4sySVk08355tg@mail.gmail.com>
 <SA1PR11MB69911D8AB895EEC13A64EBCE921EA@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB69912B9C5363E40A50B74B35921EA@SA1PR11MB6991.namprd11.prod.outlook.com>
 <637ce3f5-a7a9-6a1f-812a-5987211f84f7@amd.com>
 <SA1PR11MB6991E632AFE2684CEC231321921EA@SA1PR11MB6991.namprd11.prod.outlook.com>
 <a9d08612-c402-68fe-b625-3148e4ce3841@amd.com>
 <IA1PR11MB64181677E779F3541701FB15C11FA@IA1PR11MB6418.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB64181677E779F3541701FB15C11FA@IA1PR11MB6418.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA3PR11MB7487:EE_
x-ms-office365-filtering-correlation-id: 42df806b-3d39-4380-dbae-08dba3384c4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qves7aAzTcGSZLN/47G0gmX9R+gK3m6dSE5+LyzdBFIv+50mBn06O9AUoCvOYuhD/JKGGSgMn+tM1FC/ppv7ceocSBDTtfsVPSLDjY/TSdBnm096JO3FPR52JbWyZ28x1Hm77WSgo9NqSwmJreOANMnlr483hFOrOz0nRSgm5BhsqlTjFJocuRDqPi9XHBge2Fp4w1PLKLf9kl9gxXxJyRMRpAQTicmpYMelMVKvzO+izmYv8piPiQsHb0aPaQa12fo+CHbScCXw5LfsGAetOSXRQ9xlZUnx51b69pwX3D/NPYSYOytdHksVwYj4DKdCYE5EHzLNSPxkDQOejDqdOqkeLCZyE49XYDnCosYjgtvCRWlkak4ytxK7Td3bPnMW0sSH/WY9Wg8qeFJkDIzefibHz7n9CvKSA9oI0BziX6jl0msiaBiCmAAtsf4is0T1bAAQ2gV7MFtS+WWEXDstzBBBWipvQgzo68PfZP4n5BY3i/0b2r4wP1dRH9/3+hS6ZC5iokDY6pgdyHGdDD3VsWwMOSGJKM3kcP3KXkXTyIKrcSjHQ3WM1ap85GSjPoCtBjZaHv6/pyiNUVFi/Iws+c9OnSp39ILmR+FxpLGRH9sHUe+MN1kmrrUzBKF61EQY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(186009)(451199024)(1800799009)(2906002)(83380400001)(26005)(86362001)(478600001)(6506007)(7696005)(53546011)(71200400001)(9686003)(33656002)(55016003)(5660300002)(66556008)(41300700001)(52536014)(64756008)(54906003)(66946007)(110136005)(76116006)(316002)(66446008)(66476007)(122000001)(8936002)(4326008)(8676002)(82960400001)(66574015)(38070700005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WW9IbUltZXZJYzg4c0FDSzhtMHB2MW1MeklNQm1mVGI5cm52bDZUS21wTjUz?=
 =?utf-8?B?dmNVZ2JDRmIwRHozUWg5ak9Na0w1UW1BWnd1WVFzMDB5MEdZZDZxTXd1dGgw?=
 =?utf-8?B?K3RDWXhKajZseHpvLzJtaEhQS3MzaVVOUlgySnRiTTl3d0hEdE9TTW4yb3RZ?=
 =?utf-8?B?VTcwSHRrc0lyZWlzUUVYR25wdk4veFFXbFYvVDVUMS96SkJzNFZSYi8vZTNT?=
 =?utf-8?B?SHBGWjU2dDNWK21qR0FKM2YrUGF1cm5sUmwvNFEwTndGNFpQQkUvM01OUXhD?=
 =?utf-8?B?SUhNYjJMWlhmTW9EUDd5ZndGbkdLQzFOMldGY3h6d3NGWmhVSDlnNFNmU3VQ?=
 =?utf-8?B?Z2sxd0NPck5aUTZCbGZZaytnUjdwdUl1M1IwME5rcWkxTTNXS21leC93UFNr?=
 =?utf-8?B?MmdoNXdxVEdIYmRCMVIyUnhRUVVFYUlYMUxyY2d2OUxnSVRnWDF1TUV5ZFh3?=
 =?utf-8?B?T3FmMUhOaSszdlI0S2lnUUpOL1BTaUQ2ZjdtWGZiRExTd01JNFFxQ1ZKSXRh?=
 =?utf-8?B?NDIvRkpuU3NqSEZBRlg5Q0V2aXJFL1NCb1JCK25DTU1LemN0TlVSOVpudytK?=
 =?utf-8?B?TUZ6WFRKakllZFpSdUtDOWh4OXlZMXhhN0FuNUdBQTBOZ1czVEJxbU9XZjBa?=
 =?utf-8?B?dnA4MzdZbW0wcUM5QzJ0OFE3VUNHdWw4UW5qN1VJM2h0Nk1MclcyQlBlUDN3?=
 =?utf-8?B?VWN2NXcrc2lwbjVpSnZWODB1ZVg0Q3drWUNtN0xjT2J1Rmh4VXE2QlVwSXFy?=
 =?utf-8?B?UzhxYUhobEhXY0Fvb0pOUDYwQ2llMmNnSm5iSzZTcGdQaStOcXhyQUhZTms1?=
 =?utf-8?B?K1FQandydmZYbnlJckdHK0JJSGduWWxmRjdERGdqTVdsSi9CZjYwZTVlL29z?=
 =?utf-8?B?Uk1zQ3dBbis2SkZxNGpHcjNaaWxwME9tZ2FZSTZoZ0Z0NDJlL2U1a1FQMmZY?=
 =?utf-8?B?TndFS3dLZFM4VytCQ2k0SVBUYzBpSnpjbjBPYkFxU1BNZlRvUkJPcjJOS1pF?=
 =?utf-8?B?OSt5aC9JRk5CYlNNa1FWMXhtcjA4TzlXUUZBQTVnaVdGZU16YVorOCtPUHRR?=
 =?utf-8?B?Z1VZaG5UK0NHWmVKUVZ0aEVESXFIRUxTVlRPK3BJRTkvdU9aemdSbzFWN1dG?=
 =?utf-8?B?bWk2YXNKT1hLaXZ2dThNK295bUw4RzlpMi9WL1lSSlZEOEJmcUErY2RSekJO?=
 =?utf-8?B?a1JuRkpuOVVXZXlDV1RqQk9xb1dWZ25QTXhnSzRzU0p2OFJpeURVSW1neGph?=
 =?utf-8?B?OERkRXVTUHArVXBlT3hkaUg5cXdGRDZrLzlmb0c1RnFkSUFYNytuVUM1NHZW?=
 =?utf-8?B?dk53WUNWK1FHN2dMWVZlWlRGdStlQVhsSGRQR3YyVHJ4UXN5YTk3ODdaUkJr?=
 =?utf-8?B?Y0JXUVhXQUpaTFZhRUdXbHU5YnpLUEcwWXA1VHRCMEhsTFJndzY3NXVVYjlw?=
 =?utf-8?B?TDhZTEJBZkVrdXAwQjBqb09GMDJSaHhvTmROdThCMDliaGt4N2J6T0lxT3hL?=
 =?utf-8?B?RjNLc1BUaVFxRnQxSXNsekZjTUNncVJjajJwMmpHWEVET0swdXFuTFlBQ0E1?=
 =?utf-8?B?VmxkQ0ovWklob25hTkdXNUh5Z1FxcHkwY1BQcVVadmMrRGVEVlpITHBpOXhu?=
 =?utf-8?B?TEk0OSs2Sm9nc1BydTdPanhDQW11a2kvOFNyNXZNRTVqb212QUdtRU95MUdP?=
 =?utf-8?B?dlNnZklvcHpRbkpUTEJmMzFOMDJzTktMOGliSWFZUEg0YW85YlVMZlFCdXp2?=
 =?utf-8?B?MWpJd0NvQW1QTXljN2dGeHdKRVMrY1lKNlgyR0poNFdMdTl2SXdFVTI1VFRy?=
 =?utf-8?B?MmxReDUwWU9tYWlOMEZGUVJwSVg4eldocmhYUWJYM1krVkFKdmdBSk5pUnRE?=
 =?utf-8?B?cUNDNVVRNFRQanVyQVFLM0hBZm9lVDZyTEVXZkthMGNaTGt3bmdlMk9XaHl5?=
 =?utf-8?B?QXFiRFpnK0ZnbG00UHpzTk1JMmxZQ3lQUGlyQjFid0VGeWZlZ1JpMU5Mb1d0?=
 =?utf-8?B?OWF0VEJrU281U2gwRGYzTHd4dk43YlNwRG1udkdwZEZoRjgxMVdqbFN4bWVK?=
 =?utf-8?B?Y201MEdKMnlMZUo0aDdBU0ZrQlkvTVUxU2hPdjg5ZlJHaWRjZ056NHlhQVZl?=
 =?utf-8?Q?z5qU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42df806b-3d39-4380-dbae-08dba3384c4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 17:50:39.6094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kgLnnr1KCrS+39RSmyXZLHJ2TSO7dB8olhHg4rhupIpnygszpdxwy8nAvZtjSfCLQXINDWkeaKn7EUAYu+dcjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7487
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 Philip Yang <Philip.Yang@amd.com>, "Welty, Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJ1aGwsIE1pY2hhZWwgSiA8
bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPg0KPiBTZW50OiBBdWd1c3QgMjIsIDIwMjMgNzo0NCBB
TQ0KPiBUbzogRmVsaXggS3VlaGxpbmcgPGZlbGl4Lmt1ZWhsaW5nQGFtZC5jb20+OyBaZW5nLCBP
YWsgPG9hay56ZW5nQGludGVsLmNvbT47DQo+IERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNv
bT4NCj4gQ2M6IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47IFRob21h
cyBIZWxsc3Ryw7ZtDQo+IDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT47IFBoaWxp
cCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPjsNCj4gV2VsdHksIEJyaWFuIDxicmlhbi53ZWx0
eUBpbnRlbC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBDaHJpc3RpYW4N
Cj4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+OyBWaXNod2FuYXRoYXB1cmEsIE5p
cmFuamFuYQ0KPiA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+OyBpbnRlbC14
ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUkU6IEltcGxlbWVudCBzdm0gd2l0
aG91dCBCTyBjb25jZXB0IGluIHhlIGRyaXZlcg0KPiANCj4gPi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID5Gcm9tOiBGZWxpeCBLdWVobGluZyA8ZmVsaXgua3VlaGxpbmdAYW1kLmNvbT4N
Cj4gPlNlbnQ6IE1vbmRheSwgQXVndXN0IDIxLCAyMDIzIDQ6NTcgUE0NCj4gPlRvOiBaZW5nLCBP
YWsgPG9hay56ZW5nQGludGVsLmNvbT47IERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4N
Cj4gPkNjOiBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyBUaG9tYXMg
SGVsbHN0csO2bQ0KPiA+PHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPjsgUGhpbGlw
IFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+Ow0KPiA+V2VsdHksIEJyaWFuIDxicmlhbi53ZWx0
eUBpbnRlbC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiA+Q2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPjsgVmlzaHdhbmF0aGFwdXJhLCBO
aXJhbmphbmENCj4gPjxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT47IGludGVs
LXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gPlJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5q
LnJ1aGxAaW50ZWwuY29tPg0KPiA+U3ViamVjdDogUmU6IEltcGxlbWVudCBzdm0gd2l0aG91dCBC
TyBjb25jZXB0IGluIHhlIGRyaXZlcg0KPiA+DQo+ID4NCj4gPk9uIDIwMjMtMDgtMjEgMTU6NDEs
IFplbmcsIE9hayB3cm90ZToNCj4gPj4+IEkgaGF2ZSB0aG91Z2h0IGFib3V0IGVtdWxhdGluZyBC
TyBhbGxvY2F0aW9uIEFQSXMgb24gdG9wIG9mIHN5c3RlbSBTVk0uDQo+ID4+PiBUaGlzIHdhcyBp
biB0aGUgY29udGV4dCBvZiBLRkQgd2hlcmUgbWVtb3J5IG1hbmFnZW1lbnQgaXMgbm90IHRpZWQg
aW50bw0KPiA+Pj4gY29tbWFuZCBzdWJtaXNzaW9ucyBBUElzLCB3aGljaCB3b3VsZCBhZGQgYSB3
aG9sZSBvdGhlciBsYXllciBvZg0KPiA+Pj4gY29tcGxleGl0eS4gVGhlIG1haW4gdW5zb2x2ZWQg
KHVuc29sdmFibGU/KSBwcm9ibGVtIEkgcmFuIGludG8gd2FzLCB0aGF0DQo+ID4+PiB0aGVyZSBp
cyBubyB3YXkgdG8gc2hhcmUgU1ZNIG1lbW9yeSBhcyBETUFCdWZzLiBTbyB0aGVyZSBpcyBubyBn
b29kDQo+ID53YXkNCj4gPj4+IHRvIHN1cHBvcnQgYXBwbGljYXRpb25zIHRoYXQgZXhwZWN0IHRv
IHNoYXJlIG1lbW9yeSBpbiB0aGF0IHdheS4NCj4gPj4gR3JlYXQgcG9pbnQuIEkgYWxzbyBkaXNj
dXNzZWQgdGhlIGRtYWJ1ZiB0aGluZyB3aXRoIE1pa2UgKGNjJ2VkKS4gZG1hYnVmIGlzIGENCj4g
PnBhcnRpY3VsYXIgdGVjaG5vbG9neSBjcmVhdGVkIHNwZWNpYWxseSBmb3IgdGhlIEJPIGRyaXZl
ciAoYW5kIG90aGVyIGRyaXZlcikgdG8NCj4gPnNoYXJlIGJ1ZmZlciBiL3QgZGV2aWNlcy4gSG1t
L3N5c3RlbSBTVk0gZG9lc24ndCBuZWVkIHRoaXMgdGVjaG5vbG9neToNCj4gPm1hbGxvYydlZCBt
ZW1vcnkgYnkgdGhlIG5hdHVyZSBpcyBhbHJlYWR5IHNoYXJlZCBiL3QgZGlmZmVyZW50IGRldmlj
ZXMgKGluDQo+ID5vbmUgcHJvY2VzcykgYW5kIENQVS4gV2UganVzdCBjYW4gc2ltcGx5IHN1Ym1p
dCBHUFUga2VybmVsIHRvIGFsbCBkZXZpY2VzDQo+ID53aXRoIG1hbGxvYydlZCBtZW1vcnkgYW5k
IGxldCBrbWQgZGVjaWRlIHRoZSBtZW1vcnkgcGxhY2VtZW50IChzdWNoIGFzDQo+ID5tYXAgaW4g
cGxhY2Ugb3IgbWlncmF0ZSkuIE5vIG5lZWQgb2YgYnVmZmVyIGV4cG9ydC9pbXBvcnQgaW4gaG1t
L3N5c3RlbQ0KPiA+U1ZNIHdvcmxkLg0KPiA+DQo+ID5JIGRpc2FncmVlLiBETUFCdWYgY2FuIGJl
IHVzZWQgZm9yIHNoYXJpbmcgbWVtb3J5IGJldHdlZW4gcHJvY2Vzc2VzLiBBbmQNCj4gPml0IGNh
biBiZSB1c2VkIGZvciBzaGFyaW5nIG1lbW9yeSB3aXRoIDNyZC1wYXJ0eSBkZXZpY2VzIHZpYSBQ
Q0llIFAyUA0KPiA+KGUuZy4gYSBNZWxsYW5veCBOSUMpLiBZb3UgY2Fubm90IGVhc2lseSBkbyB0
aGF0IHdpdGggbWFsbG9jJ2VkIG1lbW9yeS4NCj4gPlBPU0lYIElQQyByZXF1aXJlcyB0aGF0IHlv
dSBrbm93IHRoYXQgeW91J2xsIGJlIHNoYXJpbmcgdGhlIG1lbW9yeSBhdA0KPiA+YWxsb2NhdGlv
biB0aW1lLiBJdCBhZGRzIG92ZXJoZWFkLiBBbmQgYmVjYXVzZSBpdCdzIGZpbGUtYmFja2VkLCBp
dCdzDQo+ID5jdXJyZW50bHkgaW5jb21wYXRpYmxlIHdpdGggbWlncmF0aW9uLiBBbmQgSE1NIGN1
cnJlbnRseSBkb2Vzbid0IGhhdmUgYQ0KPiA+c29sdXRpb24gZm9yIFAyUC4gQW55IGFjY2VzcyBi
eSBhIGRpZmZlcmVudCBkZXZpY2UgY2F1c2VzIGEgbWlncmF0aW9uIHRvDQo+ID5zeXN0ZW0gbWVt
b3J5Lg0KPiANCj4gSGV5IE9haywNCj4gDQo+IEkgdGhpbmsgd2Ugd2VyZSBkaXNjdXNzaW5nIHRo
aXMgc29sdXRpb24gaW4gdGhlIGNvbnRleHQgb2YgdXNpbmcgdGhlIFAyUF9ETUENCj4gZmVhdHVy
ZS4gIFRoaXMgaGFzIGFuIGFsbG9jYXRpb24gcGF0aCBhbmQgYSBkZXZpY2UgMiBkZXZpY2UgY2Fw
YWJpbGl0aWVzLg0KDQoNCkkgd2FzIHRoaW5raW5nIHNoYXJpbmcgbWFsbG9jJ2VkIG1lbW9yeSBi
L3QgQ1BVIGFuZCBtdWx0aXBsZSBkZXZpY2VzIGluc2lkZSBvbmUgcHJvY2Vzcy4gSSB0aG91Z2h0
IHRoaXMgc2hvdWxkIHdvcmsuIFdpdGggRmVsaXgncyB3b3JkcyBhYm92ZSwgSSBsb29rZWQgbW9y
ZSBkZXRhaWxzLiBOb3cgSSBhZ3JlZSB3aXRoIEZlbGl4IHRoaXMgZG9lc24ndCB3b3JrIHdpdGgg
aG1tLg0KDQpBbmQgYXMgRmVsaXggcG9pbnRlZCBvdXQsIFBPU0lYIElQQyBhbHNvIGRvZXNuJ3Qg
d29yayB3aXRoIGhtbS4gVGhlb3JldGljYWxseSBkcml2ZXIgY2FuIGRvIHNpbWlsYXIgbWlncmF0
aW9uIGIvdCBkZXZpY2UgbWVtb3J5IGFuZCBmaWxlLWJhY2tlZCBtZW1vcnksIGp1c3QgYXMgd2hh
dCB3ZSBkaWQgd2l0aCBhbm9ueW1vdXMgbWVtb3J5LiBCdXQgSSBhbSBub3Qgc3VyZSB3aGV0aGVy
IHBlb3BsZSB3YW50IHRvIGRvIHRoYXQuDQoNCkFueXdheSwgYnVmZmVyIHNoYXJpbmcgd2l0aCBo
bW0vc3lzdGVtIFNWTSBzZWVtcyBhIGJpZyBvcGVuLiBJIHdpbGwgbm90IHRyeSB0byBzb2x2ZSB0
aGlzIHByb2JsZW0gZm9yIG5vdy4NCg0KQ2hlZXJzLA0KT2FrDQoNCj4gDQo+IE1pa2UNCj4gDQo+
IA0KPiA+UmVnYXJkcywNCj4gPiDCoCBGZWxpeA0KPiA+DQo+ID4NCj4gPj4NCj4gPj4gU28geWVz
IGZyb20gYnVmZmVyIHNoYXJpbmcgcGVyc3BlY3RpdmUsIHRoZSBkZXNpZ24gcGhpbG9zb3BoeSBp
cyBhbHNvIHZlcnkNCj4gPmRpZmZlcmVudC4NCj4gPj4NCj4gPj4gVGhhbmtzLA0KPiA+PiBPYWsN
Cj4gPj4NCg==
