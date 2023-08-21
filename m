Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60A5782CFD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 17:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9578A10E289;
	Mon, 21 Aug 2023 15:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7D710E285;
 Mon, 21 Aug 2023 15:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692630733; x=1724166733;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WIUKLjoGQwBCPO/2GnMhjWZ/vSDFnmKpL4ukT5rqdr4=;
 b=akaBO4n1ViF5RqSwX3hcOshrTfd1QVwUFbRWzx31AR+g/ZVo9TOWQus+
 FtWm4oQslZhPpklGr7HF6iv+riqELQ+KBZLdJq8ct8RMazelzoW4GC+WO
 fhBVe2vA24TjVO+WhR9SehSSrQSj9Ts49DA9Uegf8o3O7GYSCazCYhTGg
 /aCLrx4iieuEdIJ/72zDpIRW7P9d8UMEsiN5wt1Pv3fC/dRh2JRgUuAj2
 OFs/UVNfJTcwFS0LiMCCBq2KhlKa0BeeKjb1sbi0IjMnianx9B7vXCt6i
 gfGnrvR+BGDod498H+vSRQW8l6laoFB6YZ6fVfNj0W4I5F6h6qVDtvn2r g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="437544340"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="437544340"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 08:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="685689356"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="685689356"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 21 Aug 2023 08:10:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 08:10:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 08:10:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 08:10:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2L+dKd1KXtnh1tZMyJXOmShGDrsjpIlpkaSDTJDs/H++/k2FX95zwLlGudVo8gSVY7wxHrT0jdWLPHOeN6jYt/3BBH6Yg+F3tzVG5R/6PCDiZQbxXZ+4uxfodHXgbIxK6bCXObsOT5C/vcgperd47o6I7MqVYTyhXoim1sfVAQC/bx8biJNhU4EY3MnHFzp5tQOkylJzod3JFUwiG1vn62NB/A8pLRBNg3ZJkBIBAYuIYmdKshnyusNKumddx7MIlrFWaqZ66Mk1/exfChiw77HM2O/PEdJ88A9G+2n4tCGAOOj2rbaTcxvQFTV6QNLKgwL8sRPkkKdDiHn+qyHLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIUKLjoGQwBCPO/2GnMhjWZ/vSDFnmKpL4ukT5rqdr4=;
 b=AWEVaIxT7aT3nqavH48ebaQZ3dTVupqYjgUMFW70LiLpwU0cpr14u2AqmA2E9qeJqLh960Lyk1/9UdUiRkTvIifbzUrYDINLVxc9hAb9pDWRs/pVHa0rvi25JVBFdJU8bF0CGAzVNXryNdH+osg53QtXQ44/oi0nlUAVsFQFphbe+JRP8EtdHNE38aXW5i8krdLQZ/qZ43lgU1/Kb7Gr13HlGp1CkRfvhE4z8f294zRRgA2P49yX9HXPBA9z9tQbUUQ092fYbyXGPfbfdmAcBEaFkg9AJvr9UOn8kFWH/AKcJKVBcUzsCBMPbdQYwQ0463DrEcmLAjz8xMHeaBvQ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by MN2PR11MB4744.namprd11.prod.outlook.com (2603:10b6:208:263::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 15:10:40 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99%3]) with mapi id 15.20.6699.020; Mon, 21 Aug 2023
 15:10:40 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: Dave Airlie <airlied@gmail.com>
Subject: RE: Implement svm without BO concept in xe driver
Thread-Topic: Implement svm without BO concept in xe driver
Thread-Index: AdnPImk6MOYV1wEITTKbUW99JKTN8AAlN1TAAAO9foAACdAN4AAGjR0AABKlsyAADoTWgAAB+b6AAAYiLxAAwfeKgAAgzF1wAAJu8xA=
Date: Mon, 21 Aug 2023 15:10:40 +0000
Message-ID: <SA1PR11MB69912B9C5363E40A50B74B35921EA@SA1PR11MB6991.namprd11.prod.outlook.com>
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
In-Reply-To: <SA1PR11MB69911D8AB895EEC13A64EBCE921EA@SA1PR11MB6991.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|MN2PR11MB4744:EE_
x-ms-office365-filtering-correlation-id: 7cd935c3-f4b5-436a-f72f-08dba258c826
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G6Fd2EFdRTRAtxEdfiil2BniIj+pou4Be+ZdnuHdHU0rF3v3iqXlwzV0GgTEMH9y7WZc2EOTm9RHBi0hb1ZnjJ8Vjjxu9xSYFrKr/vLXV7zGwL81xkItZwA5+F+OsbheeBL7CaGJYsYGS8Ju84oiwU0G+gXX7rDCxe42AAX5PnhW7kqi05fO7YNQgtymkf7iSjPTj0KSJ23TzkBU3VmPLKDPP5gZ3cESeMD3q/d+nmVOeoh7GLK8mH53GUko1nNGtObUIUkh0fm0KoWU+SL1SW4nXLQ4Eedohb91+V707m52rFN6zwsOLGw3EBPifkyhAd8naa1iWpHK4aExo2onpkSZSl4jmDaIeyi7EHPyP6uOfEEATsGNno+uvpLixaPzDEpTvnVW5S/JBza96xZdsxHginzw5/ebRkRkbqroXIbFIC36boQn3F+9C5SRQBFMtMhd5OylYA+85ZnckPkhPIRP9uL1RaPp7tIsAU3Ne+w3DXVXGSLsXcN2hUxq0zu3+Ew0n91L+9LbtvcrQsZRxlXpPyTV0EHeIVRKjB4+ZhdySRRGRfbaKR1Ef1Bc7mPZ/vLyPwYFgrIyheSndZSDXD+VjVyQxG87wf+6l1JXddEJZgzyFFEFi6uQh9+O+Scj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(66574015)(2906002)(53546011)(38100700002)(38070700005)(6506007)(83380400001)(5660300002)(52536014)(33656002)(26005)(7696005)(86362001)(8676002)(2940100002)(8936002)(4326008)(316002)(9686003)(66946007)(64756008)(54906003)(6916009)(66446008)(66556008)(76116006)(66476007)(82960400001)(478600001)(122000001)(55016003)(71200400001)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWF6L3VTMEI3NUN6THExUExHYnp3ZzVSSmNJRXBheFNCTnMzdndMdlpHZGlh?=
 =?utf-8?B?bGhJbXJiMi9wSHNBZ0Jac05KSEh4bVlnNmUxQWh2RDJJOXd0djZMdDVOMWxN?=
 =?utf-8?B?WTBmamVDcktYbFJSSGxlblRTZTRMLzFhSG9ZTFJYaVhHVkJJalZRdjZLd09C?=
 =?utf-8?B?NERheFNUeityTjFIenNZdTZheCtsUDNNeWJNS1BNVlB1UHdLTkViV2drNjdn?=
 =?utf-8?B?d3dndE9uNGF3dFd3L1dFQWZPTzJqUTlnbENBTTZsOStlTVVxc1I1S1paWnJN?=
 =?utf-8?B?cU1ORDlLUmJSdVExM205RHh3bERTWEFHZDk1VjFpOGp1UFQ1SFpMU05qb0l2?=
 =?utf-8?B?RHRyakpwT0kybU10UUFCSG41YnBVdnJMYWJ5TE9iSjlFTzhIZnQ4UDFSS3Rp?=
 =?utf-8?B?cXdJd0RHaU1tbDhzUVRPSUY4ekR2SDdqa213cnB0a0JlOXQ2NnlvbVFkanVH?=
 =?utf-8?B?RzVrdWN2ZGRDTHh2ZWI5TmR0TmExcC83RXJpcEJWN1U1ZDRwWjZWWGdwTVA5?=
 =?utf-8?B?QmZnR1ZMVnJiTXRZbVdKQ2Y5Qkx0SUU0V3YzVkZEaGI1RTJaVjYzQlc3d2Jw?=
 =?utf-8?B?enZPMy85NmlUZldPSEttamExaHp3YkJ0UnFDRFN5OGN6NzRSN2NRV2JFSm9a?=
 =?utf-8?B?TUV1eEIyVXFWVjFSeGRuUnFVc0VSMll6WUxLTHdOeVVCUXV0VERpdkVhZVha?=
 =?utf-8?B?eUtyVHJ4THRndkNEWGE5V0ljckxHR25hRitpMHc3d3RzSXVKK1o1dWFMTDhF?=
 =?utf-8?B?SllPL3BsbWNKVGJnNGE5NDdINW9HR1ErbnBFTVlqemZBSlU1cUFQaWlBaWNi?=
 =?utf-8?B?Z3YyYjBnYktibXhYeW5yZFRndmlwUHZ2VWt1TzJoWFZnN0Jsb3VXRk1VYzVM?=
 =?utf-8?B?NVZuUnJPc1I0ZnVSODJrY280azNwWUlRVGNXL3A5Y0IrckdDeUpCNSthVDdi?=
 =?utf-8?B?T2hub3ZNUjNmNHU4eDJzZ3VwY0xHVktnaU13RlUxOXlmNUxRSk5tZGo2TFBp?=
 =?utf-8?B?YWRhYkNRVGt2T0lHNytpM1JCTXJ3Y3BOUUZ2NFpBczE2NC9rUEdWK2wyb0sr?=
 =?utf-8?B?Zk9na0dKS1IzdzVDcTljcmdKV0VJZ3oxMHBMMzZrdHlYMzFhTCtCRUQ2cHdh?=
 =?utf-8?B?KzRLaWxWM3ErRDIvRFBjR0h4NWNvK0ZVUHF6Y3Rrb3k1Unh1V1NzWnczRXBC?=
 =?utf-8?B?SnZkZzUrMDlqOVV0NlhRMUIrL1BlbWdGdkhDbGdaT1QwaVdTbnRkTFk0WHk0?=
 =?utf-8?B?VFBlNFJYRGNRNHQ1TUhzcko0MHdrL1JUN2U3bmdJWFFYaitrQVcwdVlGbjQx?=
 =?utf-8?B?ZURmWWFBaTU2Tk5EUTNzazEwV3VTYUJ3Zk1nVDlwWWRKUDN6akZaRFExbFor?=
 =?utf-8?B?Y1JsamdRQ2RzNnM0dXgxQkwyRE5ZVGpqaUlyNFZtd1MyMTFZbjVoK09zSDZq?=
 =?utf-8?B?R2NMb0JtdzZrSTFhUkFKYXYzY1ZhVFloaVZBMWVOc1JNSG5nRUUxYUtXUkxp?=
 =?utf-8?B?aXg2RUV2K0dvbHBGUkFjWFJ5dk4zdmVCcnFrTFdsNjJQeElqcUZBUkVERkxz?=
 =?utf-8?B?dTEzcDd3eE1LQjhqK1dXSkNTSmo5SHZXUHlsVkhKb1pKKzFsZGRFK3M3K2lS?=
 =?utf-8?B?K09xeXpUNWFtNVc5ZzlITVY5eFhXTkV3MU9hUlBJZ3l0d0dJOEdXM0NhalVr?=
 =?utf-8?B?Z2pVd2trQVZBSjRyTFdjejVjZmdaV3owcHlUREJlQkxuRmE1Q01hTzZXcjJ2?=
 =?utf-8?B?SHIrM0NwaEZVVVVPOTJ5WnhkOTJZVzZuU01XUXBKVDhId05xVkIwOGhKdVhu?=
 =?utf-8?B?N3FhcEZQbnowa1BtZHJFZkdNdzVkQWlJVkh4QmNFeTFWRFdHaTlDenJjQzhB?=
 =?utf-8?B?YkkyVjlyRzB4QnBFSVIrVEREa3lZbU5QNEZJMlJJUktTUUVTRGJFS1JhRkJU?=
 =?utf-8?B?NjhpNGNCRVdSTFBOZXFoOUd3QlNjMllhZFd4VjJHSzJMUnVLVlJYOS9RTzcy?=
 =?utf-8?B?WEwvTldUdnFBWEJ0OWVHZWFEOUdLVll4c0w5SlVTS0FucmVWOS9vTldESlRz?=
 =?utf-8?B?R0p3Y0t6UGdDWXFaN0Q5VHgxeEpPSlRseXp4b0cyV0V4Y1hEVS9YcnhzV29u?=
 =?utf-8?Q?VC74=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd935c3-f4b5-436a-f72f-08dba258c826
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 15:10:40.1653 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pbKlhHHlpM6cKDj9tp/rHZfdjOz/ETkBZzZw0vpWw3iZuBx6eNgJBNsWBDvTc6LNOzJ1RjL1w3ILzowDweFIxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4744
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
 Philip Yang <Philip.Yang@amd.com>, Felix Kuehling <felix.kuehling@amd.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWNjaWRlbnRseSBkZWxldGVkIEJyaWFuLiBBZGQgYmFjay4NCg0KVGhhbmtzLA0KT2FrDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWmVuZywgT2FrDQo+IFNlbnQ6IEF1
Z3VzdCAyMSwgMjAyMyAxMTowNyBBTQ0KPiBUbzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwu
Y29tPg0KPiBDYzogQnJvc3QsIE1hdHRoZXcgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPjsgVGhv
bWFzIEhlbGxzdHLDtm0NCj4gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPjsgUGhp
bGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+OyBGZWxpeA0KPiBLdWVobGluZyA8ZmVsaXgu
a3VlaGxpbmdAYW1kLmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVs
LQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFZpc2h3YW5hdGhhcHVyYSwgTmlyYW5qYW5h
DQo+IDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT47IENocmlzdGlhbiBLw7Zu
aWcNCj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gU3ViamVjdDogUkU6IEltcGxlbWVu
dCBzdm0gd2l0aG91dCBCTyBjb25jZXB0IGluIHhlIGRyaXZlcg0KPiANCj4gPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IGRyaS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgRGF2ZQ0KPiA+IEFpcmxpZQ0KPiA+
IFNlbnQ6IEF1Z3VzdCAyMCwgMjAyMyA2OjIxIFBNDQo+ID4gVG86IFplbmcsIE9hayA8b2FrLnpl
bmdAaW50ZWwuY29tPg0KPiA+IENjOiBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRl
bC5jb20+OyBUaG9tYXMgSGVsbHN0csO2bQ0KPiA+IDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4Lmlu
dGVsLmNvbT47IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPjsNCj4gRmVsaXgNCj4g
PiBLdWVobGluZyA8ZmVsaXgua3VlaGxpbmdAYW1kLmNvbT47IFdlbHR5LCBCcmlhbiA8YnJpYW4u
d2VsdHlAaW50ZWwuY29tPjsNCj4gZHJpLQ0KPiA+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBWaXNod2FuYXRoYXB1cmEsDQo+ID4g
TmlyYW5qYW5hIDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT47IENocmlzdGlh
biBLw7ZuaWcNCj4gPiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiA+IFN1YmplY3Q6IFJl
OiBJbXBsZW1lbnQgc3ZtIHdpdGhvdXQgQk8gY29uY2VwdCBpbiB4ZSBkcml2ZXINCj4gPg0KPiA+
IE9uIFRodSwgMTcgQXVnIDIwMjMgYXQgMTI6MTMsIFplbmcsIE9hayA8b2FrLnplbmdAaW50ZWwu
Y29tPiB3cm90ZToNCj4gPiA+DQo+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gPiA+IEZyb206IERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4NCj4gPiA+ID4gU2Vu
dDogQXVndXN0IDE2LCAyMDIzIDY6NTIgUE0NCj4gPiA+ID4gVG86IEZlbGl4IEt1ZWhsaW5nIDxm
ZWxpeC5rdWVobGluZ0BhbWQuY29tPg0KPiA+ID4gPiBDYzogWmVuZywgT2FrIDxvYWsuemVuZ0Bp
bnRlbC5jb20+OyBDaHJpc3RpYW4gS8O2bmlnDQo+ID4gPiA+IDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+OyBUaG9tYXMgSGVsbHN0csO2bQ0KPiA+ID4gPiA8dGhvbWFzLmhlbGxzdHJvbUBsaW51
eC5pbnRlbC5jb20+OyBCcm9zdCwgTWF0dGhldw0KPiA+ID4gPiA8bWF0dGhldy5icm9zdEBpbnRl
bC5jb20+OyBtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb207DQo+ID4gPiA+IFZpc2h3
YW5hdGhhcHVyYSwgTmlyYW5qYW5hIDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNv
bT47DQo+IFdlbHR5LA0KPiA+ID4gPiBCcmlhbiA8YnJpYW4ud2VsdHlAaW50ZWwuY29tPjsgUGhp
bGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+OyBpbnRlbC0NCj4gPiA+ID4geGVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gPiA+
IFN1YmplY3Q6IFJlOiBJbXBsZW1lbnQgc3ZtIHdpdGhvdXQgQk8gY29uY2VwdCBpbiB4ZSBkcml2
ZXINCj4gPiA+ID4NCj4gPiA+ID4gT24gVGh1LCAxNyBBdWcgMjAyMyBhdCAwODoxNSwgRmVsaXgg
S3VlaGxpbmcgPGZlbGl4Lmt1ZWhsaW5nQGFtZC5jb20+DQo+ID4gd3JvdGU6DQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiBPbiAyMDIzLTA4LTE2IDEzOjMwLCBaZW5nLCBPYWsgd3JvdGU6DQo+ID4gPiA+
ID4gPiBJIHNwb2tlIHdpdGggVGhvbWFzLiBXZSBkaXNjdXNzZWQgdHdvIGFwcHJvYWNoZXM6DQo+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gMSkgbWFrZSB0dG1fcmVzb3VyY2UgYSBjZW50cmFsIHBs
YWNlIGZvciB2cmFtIG1hbmFnZW1lbnQgZnVuY3Rpb25zDQo+ID4gc3VjaCBhcw0KPiA+ID4gPiBl
dmljdGlvbiwgY2dyb3VwIG1lbW9yeSBhY2NvdW50aW5nLiBCb3RoIHRoZSBCTy1iYXNlZCBkcml2
ZXIgYW5kIEJPLWxlc3MNCj4gPiBTVk0NCj4gPiA+ID4gY29kZXMgY2FsbCBpbnRvIHR0bV9yZXNv
dXJjZV9hbGxvYy9mcmVlIGZ1bmN0aW9ucyBmb3IgdnJhbSBhbGxvY2F0aW9uL2ZyZWUuDQo+ID4g
PiA+ID4gPiAgICAgICpUaGlzIHdheSBCTyBkcml2ZXIgYW5kIFNWTSBkcml2ZXIgc2hhcmVzIHRo
ZSBldmljdGlvbi9jZ3JvdXAgbG9naWMsDQo+IG5vDQo+ID4gPiA+IG5lZWQgdG8gcmVpbXBsbWVu
dCBMUlUgZXZpY3Rpb24gbGlzdCBpbiBTVk0gZHJpdmVyLiBDZ3JvdXAgbG9naWMgc2hvdWxkIGJl
DQo+IGluDQo+ID4gPiA+IHR0bV9yZXNvdXJjZSBsYXllci4gK01hYXJ0ZW4uDQo+ID4gPiA+ID4g
PiAgICAgICp0dG1fcmVzb3VyY2UgaXMgbm90IGEgcGVyZmVjdCBtYXRjaCBmb3IgU1ZNIHRvIGFs
bG9jYXRlIHZyYW0uIEl0IGlzDQo+IHN0aWxsDQo+ID4gYQ0KPiA+ID4gPiBiaWcgb3ZlcmhlYWQu
IFRoZSAqYm8qIG1lbWJlciBvZiB0dG1fcmVzb3VyY2UgaXMgbm90IG5lZWRlZCBmb3IgU1ZNIC0N
Cj4gPiB0aGlzDQo+ID4gPiA+IG1pZ2h0IGVuZCB1cCB3aXRoIGludmFzaXZlIGNoYW5nZXMgdG8g
dHRtLi4ubmVlZCB0byBsb29rIGludG8gbW9yZSBkZXRhaWxzDQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiBPdmVyaGVhZCBpcyBhIHByb2JsZW0uIFdlJ2Qgd2FudCB0byBiZSBhYmxlIHRvIGFsbG9jYXRl
LCBmcmVlIGFuZCBldmljdA0KPiA+ID4gPiA+IG1lbW9yeSBhdCBhIHNpbWlsYXIgZ3JhbnVsYXJp
dHkgYXMgb3VyIHByZWZlcnJlZCBtaWdyYXRpb24gYW5kIHBhZ2UNCj4gPiA+ID4gPiBmYXVsdCBn
cmFudWxhcml0eSwgd2hpY2ggZGVmYXVsdHMgdG8gMk1CIGluIG91ciBTVk0gaW1wbGVtZW50YXRp
b24uDQo+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IDIpIHN2
bSBjb2RlIGFsbG9jYXRlIG1lbW9yeSBkaXJlY3RseSBmcm9tIGRybS1idWRkeSBhbGxvY2F0b3Is
IGFuZA0KPiA+IGV4cG9zZQ0KPiA+ID4gPiBtZW1vcnkgZXZpY3Rpb24gZnVuY3Rpb25zIGZyb20g
Ym90aCB0dG0gYW5kIHN2bSBzbyB0aGV5IGNhbiBldmljdA0KPiBtZW1vcnkNCj4gPiA+ID4gZnJv
bSBlYWNoIG90aGVyLiBGb3IgZXhhbXBsZSwgZXhwb3NlIHRoZSB0dG1fbWVtX2V2aWN0X2ZpcnN0
IGZ1bmN0aW9uDQo+ID4gZnJvbQ0KPiA+ID4gPiB0dG0gc2lkZSBzbyBobW0vc3ZtIGNvZGUgY2Fu
IGNhbGwgaXQ7IGV4cG9zZSBhIHNpbWlsYXIgZnVuY3Rpb24gZnJvbSBzdm0NCj4gc2lkZQ0KPiA+
IHNvDQo+ID4gPiA+IHR0bSBjYW4gZXZpY3QgaG1tIG1lbW9yeS4NCj4gPiA+ID4gPg0KPiA+ID4g
PiA+IEkgbGlrZSB0aGlzIG9wdGlvbi4gT25lIHRoaW5nIHRoYXQgbmVlZHMgc29tZSB0aG91Z2h0
IHdpdGggdGhpcyBpcyBob3cNCj4gPiA+ID4gPiB0byBnZXQgc29tZSBzZW1ibGFuY2Ugb2YgZmFp
cm5lc3MgYmV0d2VlbiB0aGUgdHdvIHR5cGVzIG9mIGNsaWVudHMuDQo+ID4gPiA+ID4gQmFzaWNh
bGx5IGhvdyB0byBjaG9vc2Ugd2hhdCB0byBldmljdC4gQW5kIHdoYXQgc2hhcmUgb2YgdGhlIGF2
YWlsYWJsZQ0KPiA+ID4gPiA+IG1lbW9yeSBkb2VzIGVhY2ggc2lkZSBnZXQgdG8gdXNlIG9uIGF2
ZXJhZ2UuIEUuZy4gYW4gaWRsZSBjbGllbnQgbWF5IGdldA0KPiA+ID4gPiA+IGFsbCBpdHMgbWVt
b3J5IGV2aWN0ZWQgd2hpbGUgYSBidXN5IGNsaWVudCBtYXkgZ2V0IGEgYmlnZ2VyIHNoYXJlIG9m
IHRoZQ0KPiA+ID4gPiA+IGF2YWlsYWJsZSBtZW1vcnkuDQo+ID4gPiA+DQo+ID4gPiA+IEknZCBh
bHNvIGxpa2UgdG8gc3VnZ2VzdCB3ZSB0cnkgdG8gd3JpdGUgYW55IG1hbmFnZW1lbnQvZ2VuZXJp
YyBjb2RlDQo+ID4gPiA+IGluIGRyaXZlciBhZ25vc3RpYyB3YXkgYXMgbXVjaCBhcyBwb3NzaWJs
ZSBoZXJlLiBJIGRvbid0IHJlYWxseSBzZWUNCj4gPiA+ID4gbXVjaCBodyBkaWZmZXJlbmNlIHNo
b3VsZCBiZSBpbmZsdWVuY2luZyBpdC4NCj4gPiA+ID4NCj4gPiA+ID4gSSBkbyB3b3JyeSBhYm91
dCBoYXZpbmcgZWZmZWN0aXZlbHkgMiBMUlVzIGhlcmUsIHlvdSBjYW4ndCByZWFsbHkgaGF2ZQ0K
PiA+ID4gPiB0d28gImxlYXN0cyIuDQo+ID4gPiA+DQo+ID4gPiA+IExpa2UgaWYgd2UgaGl0IHRo
ZSBzaHJpbmtlciBwYXRocyB3aG8gZ29lcyBmaXJzdD8gZG8gd2Ugc2hyaW5rIG9uZQ0KPiA+ID4g
PiBvYmplY3QgZnJvbSBlYWNoIHNpZGUgaW4gdHVybj8NCj4gPiA+DQo+ID4gPiBPbmUgd2F5IHRv
IHNvbHZlIHRoaXMgZmFpcm5lc3MgcHJvYmxlbSBpcyB0byBjcmVhdGUgYSBkcml2ZXIgYWdub3N0
aWMNCj4gPiBkcm1fdnJhbV9tZ3IuIE1haW50YWluIGEgc2luZ2xlIExSVSBpbiBkcm1fdnJhbV9t
Z3IuIE1vdmUgdGhlIG1lbW9yeQ0KPiA+IGV2aWN0aW9uL2Nncm91cHMgbWVtb3J5IGFjY291bnRp
bmcgbG9naWMgZnJvbSB0dG1fcmVzb3VyY2UgbWFuYWdlciB0bw0KPiA+IGRybV92cmFtX21nci4g
Qm90aCBCTy1iYXNlZCBkcml2ZXIgYW5kIFNWTSBkcml2ZXIgY2FsbHMgdG8gZHJtX3ZyYW1fbWdy
DQo+IHRvDQo+ID4gYWxsb2NhdGUvZnJlZSBtZW1vcnkuDQo+ID4gPg0KPiA+ID4gSSBhbSBub3Qg
c3VyZSB3aGV0aGVyIHRoaXMgbWVldHMgdGhlIDJNIGFsbG9jYXRlL2ZyZWUvZXZpY3QgZ3JhbnVs
YXJpdHkNCj4gPiByZXF1aXJlbWVudCBGZWxpeCBtZW50aW9uZWQgYWJvdmUuIFNWTSBjYW4gYWxs
b2NhdGUgMk0gc2l6ZSBibG9ja3MuIEJ1dCBCTw0KPiA+IGRyaXZlciBzaG91bGQgYmUgYWJsZSB0
byBhbGxvY2F0ZSBhbnkgYXJiaXRyYXJ5IHNpemVkIGJsb2NrcyAtIFNvIHRoZSBldmljdGlvbiBp
cw0KPiBhbHNvDQo+ID4gYXJiaXRyYXJ5IHNpemUuDQo+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBB
bHNvIHdpbGwgd2UgaGF2ZSBzeXN0ZW1zIHdoZXJlIHdlIGNhbiBleHBvc2Ugc3lzdGVtIFNWTSBi
dXQgdXNlcnNwYWNlDQo+ID4gPiA+IG1heSBjaG9vc2UgdG8gbm90IHVzZSB0aGUgZmluZSBncmFp
bmVkIFNWTSBhbmQgdXNlIG9uZSBvZiB0aGUgb2xkZXINCj4gPiA+ID4gbW9kZXMsIHdpbGwgdGhh
dCBwYXRoIGdldCBlbXVsYXRlZCBvbiB0b3Agb2YgU1ZNIG9yIHVzZSB0aGUgQk8gcGF0aHM/DQo+
ID4gPg0KPiA+ID4NCj4gPiA+IElmIGJ5ICJvbGRlciBtb2RlcyIgeW91IG1lYW50IHRoZSBnZW1f
Ym9fY3JlYXRlIChzdWNoIGFzIHhlX2dlbV9jcmVhdGUNCj4gb3INCj4gPiBhbWRncHVfZ2VtX2Ny
ZWF0ZSksIHRoZW4gdG9kYXkgYm90aCBhbWQgYW5kIGludGVsIGltcGxlbWVudCB0aG9zZQ0KPiA+
IGludGVyZmFjZXMgdXNpbmcgQk8gcGF0aC4gV2UgZG9uJ3QgaGF2ZSBhIHBsYW4gdG8gZW11bGF0
ZSB0aGF0IG9sZCBtb2RlIG9uDQo+IHRvcGUNCj4gPiBvZiBTVk0sIGFmYWljdC4NCj4gPg0KPiA+
IEknbSBub3Qgc3VyZSBob3cgdGhlIG9sZGVyIG1vZGVzIG1hbmlmZXN0IGluIHRoZSBrZXJuZWwg
SSBhc3N1bWUgYXMgYm8NCj4gPiBjcmVhdGVzIChidXQgdGhleSBtYXkgdXNlIHVzZXJwdHIpLCBT
Vk0gaXNuJ3QgYSBzcGVjaWZpYyB0aGluZywgaXQncyBhDQo+ID4gZ3JvdXAgb2YgMyB0aGluZ3Mu
DQo+ID4NCj4gPiAxKSBjb2Fyc2UtZ3JhaW5lZCBTVk0gd2hpY2ggSSB0aGluayBpcyBCTw0KPiA+
IDIpIGZpbmUtZ3JhaW5lZCBTVk0gd2hpY2ggaXMgcGFnZSBsZXZlbA0KPiA+IDMpIGZpbmUtZ3Jh
aW5lZCBzeXN0ZW0gU1ZNIHdoaWNoIGlzIEhNTQ0KPiA+DQo+ID4gSSBzdXBwb3NlIEknbSBhc2tp
bmcgYWJvdXQgdGhlIHByZXZpb3VzIHZlcnNpb25zIGFuZCBob3cgdGhleSB3b3VsZA0KPiA+IG9w
ZXJhdGUgaW4gYSBzeXN0ZW0gU1ZNIGNhcGFibGUgc3lzdGVtLg0KPiANCj4gSSBnb3QgeW91ciBx
dWVzdGlvbiBub3cuDQo+IA0KPiBBcyBJIHVuZGVyc3RhbmQgaXQsIHRoZSBzeXN0ZW0gU1ZNIHBy
b3ZpZGVzIHNpbWlsYXIgZnVuY3Rpb25hbGl0eSBhcyBCTy1iYXNlZA0KPiBTVk0gKGkuZS4sIHNo
YXJlIHZpcnR1YWwgYWRkcmVzcyBzcGFjZSBiL3QgY3B1IGFuZCBncHUgcHJvZ3JhbSwgbm8gZXhw
bGljaXQNCj4gbWVtb3J5IHBsYWNlbWVudCBmb3IgZ3B1IHByb2dyYW0pLCBidXQgdGhleSBoYXZl
IGRpZmZlcmVudCB1c2VyIGludGVyZmFjZQ0KPiAobWFsbG9jLCBtbWFwIHZzIGJvIGNyZWF0ZSwg
dm0gYmluZCkuDQo+IA0KPiBGcm9tIGZ1bmN0aW9uYWxpdHkgcGVyc3BlY3RpdmUsIG9uIGEgc3lz
dGVtIFNWTSBjYXBhYmxlIHN5c3RlbSwgd2UgZG9uJ3QgbmVlZA0KPiAjMS8jMi4gT25jZSAjMyBp
cyBpbXBsZW1lbnRlZCBhbmQgdHVybmVkIG91dCBiZSBhcyBwZXJmb3JtYW50IGFzICMxLyMyLCB3
ZQ0KPiBjYW4gYXNrIHVzZXIgc3BhY2UgdG8gc3dpdGNoIHRvICMzLg0KPiANCj4gQXMgZmFyIGFz
IEkga25vdywgQU1EIGRvZXNuJ3QgaGF2ZSAjMS8jMiAtIHRoZWlyIEJPLWJhc2VkIGRyaXZlciAq
cmVxdWlyZXMqIGFsbA0KPiB2YWxpZCBHUFUgdmlydHVhbCBhZGRyZXNzIGJlIG1hcHBlZCB0byBH
UFUgcGFnZSB0YWJsZSAqYmVmb3JlKiBHUFUga2VybmVsDQo+IHN1Ym1pc3Npb24sIGFrYSBhIEdQ
VSBwYWdlIGZhdWx0IGlzIHRyZWF0ZWQgYXMgZmF0YWwuIEZlbGl4IHBsZWFzZSBmaXggbWUsIGFz
IG15DQo+IEFNRCBrbm93bGVkZ2UgaXMgZmFkaW5nIGF3YXkuLi4NCj4gDQo+IEZyb20gaW50ZXJm
YWNlIHBlcnNwZWN0aXZlLCBpLmUuLCB0byBrZWVwIFVNRCB3aGljaCB1c2luZyAjMS8jMiBjb250
aW51ZSB0byBydW4NCj4gd2l0aG91dCBtb2RpZmljYXRpb24sIHdlIG5lZWQgIzEvIzIgdG8gY29u
dGludWUgZXhpc3QuDQo+IA0KPiBTaG91bGQgd2UgZW11bGF0ZSAjMS8jMiBvbiB0b3Agb2YgIzM/
IEkgZmVlbCB0aGUgQk8tYmFzZWQgbWVtb3J5DQo+IG1hbmFnZW1lbnQgYW5kIHRoZSBzdHJ1Y3Qg
cGFnZS9obW0gYmFzZWQgbWVtb3J5IG1hbmFnZW1lbnQgYXJlIHF1aXRlDQo+IGRpZmZlcmVudCBk
ZXNpZ24gcGhpbG9zb3BoeS4gVHJ5aW5nIHRvIGVtdWxhdGUgb25lIG9uIHRvcCBvZiBhbm90aGVy
IGNhbiBydW4gaW50bw0KPiBzZXJpb3VzIGRpZmZpY3VsdHkuIEZvciBleGFtcGxlLCBob3cgZG8g
d2UgZW11bGF0ZSBhIHZtX2JpbmQgb24gdG9wIG9mICMzPw0KPiBSZW1lbWJlciBmb3IgIzEvIzIg
dmlydHVhbCBhZGRyZXNzIHNwYWNlIGlzIG1hbmFnZWQgYnkgdXNlciBzcGFjZSB3aGlsZSAjMw0K
PiB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UgaXMgbWFuYWdlZCBieSBrZXJuZWwgY29yZSBtbSAodm1h
IHN0cnVjdC4uLikuIEl0IGlzIGEgaGFyZA0KPiBjb25mbGljdCBoZXJlLi4uDQo+IA0KPiBUaGFu
a3MgYWdhaW4gZm9yIHRoZSBncmVhdCBxdWVzdGlvbiENCj4gT2FrDQo+IA0KPiA+DQo+ID4gRGF2
ZS4NCj4gPiA+DQo+ID4gPiBUaGFua3MsDQo+ID4gPiBPYWsNCj4gPiA+DQo+ID4gPiA+DQo+ID4g
PiA+IERhdmUuDQo=
