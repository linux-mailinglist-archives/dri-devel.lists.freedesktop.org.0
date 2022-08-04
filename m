Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 191AD58A0FB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 20:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62BAA3FE6;
	Thu,  4 Aug 2022 18:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448B411BAC9;
 Thu,  4 Aug 2022 18:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659639515; x=1691175515;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=yHlYznl2bw6mfVUvPGrbdcrEUkq2ACp9mBPFaqEWHPM=;
 b=RSp3fudIxgddSQosAV2Ni42RoOgjWLTBrQT0i5LmqLQw6DpO8wlfiBv3
 FCsF+e4i4kWUp7ifk3+taCMHmrMrr+bpYox5HVqevD6IPzAYKLBUM3hXY
 KFBW1TVRjK/bYHR4og7PMwVm9kLgwUy5UDhmUUNhNaOon5sSH/wKT4H3k
 wCmf6ZYcNGuB2GzrV/10iaOJr9ZwG3WJVva5uBeilbejiyxwLydEM30Y9
 hRl884kpmst3mVVKVVrOdmhksngNfywO/Zx/LkQ3v1po2W+RCIVqd8Eec
 kgeVsO5uANkYVGZmzBcom2JmVe1eQ8pml9wkDnLQyqjGxki/MqXvlvs1G w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="351732510"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="351732510"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 11:58:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="636204181"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 04 Aug 2022 11:58:32 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 4 Aug 2022 11:58:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 4 Aug 2022 11:58:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 4 Aug 2022 11:58:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 4 Aug 2022 11:58:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLRzYtkFFnXVlL0Jss6XhFS5nBnlNq1n/leSDz8O1qfv4Bf0DdDhRs/QLNdqzONUr43vx8MwKOH2FnidivhmRHGARCmKLamly2W/iBLyrdMmoF44cPTKcj0ruPgeXuFU9d89KdKF4gGx6F/v7n5p13+IWbIpSt0GAKkLy9IitvqZVzfB+8F1wwLwDQGenPSloIItNFhhG7TIXJvHQQra5yJg6jTKC1hlDhlYLHjHK6oGP/uajywgZLo5lYLIV00wrUYbJ+fD/Vr5z4neThFVort7H/3kIVXzX4OEx/Sqzjx5JX9pyZwomcqmv3yt0hR/iI6Zr6Wq5lJSOG3h3MKEFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHlYznl2bw6mfVUvPGrbdcrEUkq2ACp9mBPFaqEWHPM=;
 b=AD+UmP4IYX2I0GQogSFOfo2EtYpE+aANLH5cknjYp4ZZwU8oOehAvALIK8ENqWRbkB3dRK/jzeGOd1VIIad4ZmONbfO3abZThKKQMG9fN0DeQq7CCrFeRuVxE/MjogzOkbHq76ldvkeQ9H3a1KPTie/Dqjrg6/daMsWCB40el9655yfV0MjmXmS2M4oJRt0cZPLG+9r1OH6vNO76B3AYhhiCx7B9pgMVZQbEmap2G7OrO7J9MhLTDCuNBkOCxPxMchAvGvIgAIWrAC+K4Ceq8HEmzs1O2D9qf0/1c4PiIdpvDs+2ENYKkYoujAj0aXAJfegE9fTZrayDymd9cWwOdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CY4PR11MB1301.namprd11.prod.outlook.com (2603:10b6:903:30::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.14; Thu, 4 Aug 2022 18:58:29 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::e9a1:388f:dd93:5505]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::e9a1:388f:dd93:5505%3]) with mapi id 15.20.5504.016; Thu, 4 Aug 2022
 18:58:29 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "slark_xiao@163.com" <slark_xiao@163.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Deak,
 Imre" <imre.deak@intel.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm: Fix typo 'the the' in comment
Thread-Topic: [Intel-gfx] [PATCH] drm: Fix typo 'the the' in comment
Thread-Index: AQHYnNM2FPBEK24PjU23M5TyQdLZ562fLrWA
Date: Thu, 4 Aug 2022 18:58:29 +0000
Message-ID: <3b055408d931684dcf83d037f07a40996f8feca9.camel@intel.com>
References: <20220721062345.46842-1-slark_xiao@163.com>
In-Reply-To: <20220721062345.46842-1-slark_xiao@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6329e67-8a83-4d78-b369-08da764b51ee
x-ms-traffictypediagnostic: CY4PR11MB1301:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P0gu/c0okhdTFAsSgU3aERHubBOXF2J0hm74cyUVt7UYwkXYhkhjK/Jz7Q23Kf4kw5J1uhXG2uzN+wk4iv9lntNZ2JT9XkcMb6isIquBKN+pdLWfZrNjJ7a4C1HhzYKRHUhHWEZ72dau5a7jTm9zBXsX/XBpHd6ma15xUvUYKP6dfDtiqcB8vulPb0/3iN55mjozWzE5l8Zb/LdizslST3HZE+HtsgYmJgdbaZwOf3MP8/F6DjOFLZPBNYvZeq+mjQRCIqlfjwyroFxdHyUgrjh9W4uJrOw5vH9HunZqk/E0D9hQqlrPp4meS6de4FV5DUJ9eDi2vRi2AiuIaa2AUOru1H1913QYGfhWcRpjsb16beRDBpNDLruUvY6KaGTziIqxKz/FB7/RQHm6TTKPhzgwXPzfudnk5pRPzSJvmeXF4cIWzo8nqrWV65Z7rlYmy8ozqmriyGowM7fr5lCSH89/9qDueFGEiqn1gEhFjN93npZzLCe3DZFr/WQdblnh6gTWgFLNDlNA7aovPT8doB4RSf4KHIfDoCgVm/7U3Ss4Ee6Yc7kieWOqonL78SgdQiZRtwA4GWxS8RvgYnJX+zGuLl7bSl/2rDhSiZTDOTyL2Moe/QFsM33hcSubE4Kcn8qV0u5q3GTAF5PT2BqUDmLYT1LOFf+7Ynw9qFoMmVz7Pf8fMvJJYdvbzqxPLZgfNXR7gROP+EWhzkeXVEMfqNYG01Q0spPOn9VmcxOO+6cFY2odvXEVqUWCd4G61M1xG8RDEh/0AzF04U38cOexl8P2uV/PDKE9vxKz3PbB9YpdfjAbsgxltAc21hY4qwDWaVvJNHLYYGMwVbMBTcNy4HKwkP7vbTI4Pq6uSVdQwQk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(376002)(136003)(39860400002)(396003)(2906002)(8676002)(76116006)(82960400001)(66446008)(5660300002)(38070700005)(7416002)(921005)(66556008)(66946007)(91956017)(64756008)(6636002)(66476007)(86362001)(4326008)(122000001)(38100700002)(6512007)(71200400001)(26005)(316002)(478600001)(83380400001)(41300700001)(8936002)(6506007)(36756003)(54906003)(2616005)(186003)(6486002)(110136005)(473944003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlR4bmhlR0ZuVVU3c216MEdqY29FM3hDaGVmK2x3WWNyQlJJN0w2RmNKSmNz?=
 =?utf-8?B?cW4yS095MVQ1THVGaTVBZUxEeWVVVWwwa0p3NGxyUzNaclROc2xyeS8rN3FJ?=
 =?utf-8?B?eDd5ZGJwSDQ0V2tpdHYyWG41VU1BZXdqbUs2bUxvd1MwVWZwVnFGTmxtN3Y0?=
 =?utf-8?B?MnhONzg4RGhITnRUUm5kVFM4M1k0OFlwWHo1UjR4WFNvenNFZXJqRnNzdWE5?=
 =?utf-8?B?KyswN0FiNjF4WW91cGllbVMzVTJqaE8veWJReWxMdHdRNGRHVVI3YTdDZzlp?=
 =?utf-8?B?KzdvQVRGckZwdGZ1VHl5S2dUWlF1bWJKM3FOTlg0azUrZEdtSTNRMVE5cENm?=
 =?utf-8?B?bXpRclFQMk8zdjN5VjVrTE5MS2xOMlBHUm1hcU82Q29HbEJPNDJIRlRWWVZh?=
 =?utf-8?B?VVNCSFFBOEhXblF2MUhDeExqSlQ5VVNjWDBEaWhFdHh5dkUvUHAxMGVtTWZS?=
 =?utf-8?B?YTlzRUFLM25WVFk4WjRXRjVjZjI0K2M3UkRKa1ExYkZYMjJta05uaTJZSjV6?=
 =?utf-8?B?bytpZGE4eU84aWRMS0hrNlJLemNrVklha1gwbllPOGZpN2Q1ajNSc05MNzJn?=
 =?utf-8?B?eExTOE1yK2JBbXR0RVFGL2RVNUhQbDRPRTE1RWp5OWxWMDRRU1ZhZEwxcXpm?=
 =?utf-8?B?U2I4KzQ0VUMzMXI0dE1ZcDNPSzZxOGdyYXlYZ2k0NHpwQ2FRbTltNmIraytw?=
 =?utf-8?B?dUh6TTNzRVliOVhqZ0FIdVdDc042Y3NGbTh0VVB1YVpic2lBMDdvdkszMGYw?=
 =?utf-8?B?ZWxNUTlWREZiQ0ZxckNDWG90cUliTHlSR2drKzI2UXdhSHVDdWdkWC9LTnpm?=
 =?utf-8?B?NTNveC9ydzJvbm42aldzbFhTMDR4bEZ1Sms0VyttcFNsL2lxTHN1Y1FLeUtN?=
 =?utf-8?B?ekYyWkg4NkVtYm50OUdIOHlPTTR3b2crSFVHYnVNS3cybVZ4c3MzRkNCbCtp?=
 =?utf-8?B?ZnVla3VpaTJJL3hIUGVwRmVBVHo3THZTeG95NkQ3NWkzTHBwRE5vYWFRSDZP?=
 =?utf-8?B?dHUwcWc3aVJ2cHZHQ00wVzdMNU1DU0t2czVUelh5ODZVNzBBWXViWmtqUFEw?=
 =?utf-8?B?bEFPSis1S2IyUSs2SVMxOXh3NXJMMU5uRnF4N1JUd1ZhcmExcmp6N2pOTDF4?=
 =?utf-8?B?OTJUckZjWGVobmhJSEl5ZExYMHhzcHlvKzRGdmVCWlhjTURwRHp5UG9tU3dG?=
 =?utf-8?B?bVI3akc2MmM1OTBoZUErMFVLcWNraXdRcURkWFBub0Job0dUMTFrTC9xbzM4?=
 =?utf-8?B?emRkVllCS21rRUVadWFRaGVhcVFkUUJWUENVZjUrTVpNK1UyTm1LTmxUVUF4?=
 =?utf-8?B?ZE5EdHJRdllCR3pNU01lNTJpb21YTzJmaFpnTjdLWlR1L1RKQ2F3Q1RNN2sr?=
 =?utf-8?B?ZUlsTFE3RWNyRDZBUEFhWXdEdkY3ZDQ4TDhrWmJsVFQrbXZreUlrL0pSSDNN?=
 =?utf-8?B?NFduY1BQMnF2WVljVlduSm5jeFp6dmlYa0Yzd3c0b0MwU04zVGkxSVBQTXlD?=
 =?utf-8?B?OXR2M0ptUUNIQ3FPWS9IYURRTXAzdkZNdmxLWENnMW41MTRHYU1iYVg3bFoy?=
 =?utf-8?B?V0tmV0hFMGc5Sy9qcTBzUlhkNm5WOUVaUEwyREJ4QnlQOW5tTHBEOGIxU1V0?=
 =?utf-8?B?S2dBYU45bUhXNk9pVGZrKzJ2aGJXTThvbGpmTUU0UVBSTisyQSt5L3BSWi9s?=
 =?utf-8?B?TVd6YmJyME1VK0N0Qkk1TEhNSzZuYkdPWUZBd3JxUmU2UlVYVnRFL2c3WEJZ?=
 =?utf-8?B?Ym5MZVZMSHNSZTNHNS9IdnNZbDBzeEptSkcza0R4VWZLSjRSNGpsVm5BRjFx?=
 =?utf-8?B?THVMSGlta3RYbm5lUXZoNTRaekQyRENoS3RGTmFFcTlYQnNEM2t1Y0MxaEJS?=
 =?utf-8?B?TGpVNnNaSFpnVjJIb3pQRDU1cTRsZVJFcnVLdi9CMEZ3Z0ZySTJlZVBsWVZX?=
 =?utf-8?B?OERZUFVneTNzQU5EbmhMYTdDdTFBZnYwQnEyZks4YTN3cXg1MTlEalZhSy9v?=
 =?utf-8?B?Q3VmSmNOc2NMcVEwRnZJQk9FNTNNVlZOaGxSejcrcWQrcE1TMUhWRVd6S0Ji?=
 =?utf-8?B?dXJnS096RkVUNUlwTEQyTWJQTjhDVkYwQkdWQXJMMHRvWElJWUN2QzZDT1Nz?=
 =?utf-8?B?dUlieWNZTzVJSzBHdnFDSktwYU41VWIzRHZMelVUalhTcGYvUG5JSDhIQjRV?=
 =?utf-8?B?dWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <195859F893A0D041908FCCD34BC5B5E5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6329e67-8a83-4d78-b369-08da764b51ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2022 18:58:29.5100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FqkVoqYEq5lqwPoUemrIBayvbzQKeXGiyEbtv1xrP61ltUdvu1L67+tlagt3xAHUnXrSX4np1InJYXc7Pks7inbQdMsZo9N4WGzc0wGsyDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1301
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIyLTA3LTIxIGF0IDE0OjIzICswODAwLCBTbGFyayBYaWFvIHdyb3RlOg0KPiBS
ZXBsYWNlICd0aGUgdGhlJyB3aXRoICd0aGUnIGluIHRoZSBjb21tZW50Lg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogU2xhcmsgWGlhbyA8c2xhcmtfeGlhb0AxNjMuY29tPg0KDQpSZXZpZXdlZC1ieTog
U3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9kcF9oZWxwZXIuYyAgICAgICB8IDIgKy0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmMgICAgICAgICAgICAgICB8IDIgKy0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ub3ZhdGVrLW50MzU1MTAuYyB8IDIgKy0NCj4gIDMg
ZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9kcF9oZWxwZXIuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9kcF9oZWxwZXIuYw0KPiBpbmRleCBlNWJhYjIzNmIz
YWUuLjMyYjI5NTAwM2Y0OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkv
ZHJtX2RwX2hlbHBlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9kcF9o
ZWxwZXIuYw0KPiBAQCAtMTU5Nyw3ICsxNTk3LDcgQEAgc3RhdGljIGludCBkcm1fZHBfYXV4X3Jl
cGx5X2R1cmF0aW9uKGNvbnN0DQo+IHN0cnVjdCBkcm1fZHBfYXV4X21zZyAqbXNnKQ0KPiAgDQo+
ICAvKg0KPiAgICogQ2FsY3VsYXRlIHRoZSBsZW5ndGggb2YgdGhlIGkyYyB0cmFuc2ZlciBpbiB1
c2VjLCBhc3N1bWluZw0KPiAtICogdGhlIGkyYyBidXMgc3BlZWQgaXMgYXMgc3BlY2lmaWVkLiBH
aXZlcyB0aGUgdGhlICJ3b3JzdCINCj4gKyAqIHRoZSBpMmMgYnVzIHNwZWVkIGlzIGFzIHNwZWNp
ZmllZC4gR2l2ZXMgdGhlICJ3b3JzdCINCj4gICAqIGNhc2UgZXN0aW1hdGUsIGllLiBzdWNjZXNz
ZnVsIHdoaWxlIGFzIGxvbmcgYXMgcG9zc2libGUuDQo+ICAgKiBEb2Vzbid0IGFjY291bnQgdGhl
ICJNT1QiIGJpdCwgYW5kIGluc3RlYWQgYXNzdW1lcyBlYWNoDQo+ICAgKiBtZXNzYWdlIGluY2x1
ZGVzIGEgU1RBUlQsIEFERFJFU1MgYW5kIFNUT1AuIE5laXRoZXIgZG9lcyBpdA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9pcnEuYw0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2k5MTVfaXJxLmMNCj4gaW5kZXggNzNjZWJjNmFhNjUwLi43ODNhNmNhNDFhNjEgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvaTkxNV9pcnEuYw0KPiBAQCAtNjUsNyArNjUsNyBAQA0KPiAgDQo+
ICAvKg0KPiAgICogSW50ZXJydXB0IHN0YXRpc3RpYyBmb3IgUE1VLiBJbmNyZW1lbnRzIHRoZSBj
b3VudGVyIG9ubHkgaWYgdGhlDQo+IC0gKiBpbnRlcnJ1cHQgb3JpZ2luYXRlZCBmcm9tIHRoZSB0
aGUgR1BVIHNvIGludGVycnVwdHMgZnJvbSBhIGRldmljZQ0KPiB3aGljaA0KPiArICogaW50ZXJy
dXB0IG9yaWdpbmF0ZWQgZnJvbSB0aGUgR1BVIHNvIGludGVycnVwdHMgZnJvbSBhIGRldmljZQ0K
PiB3aGljaA0KPiAgICogc2hhcmVzIHRoZSBpbnRlcnJ1cHQgbGluZSBhcmUgbm90IGFjY291bnRl
ZC4NCj4gICAqLw0KPiAgc3RhdGljIGlubGluZSB2b2lkIHBtdV9pcnFfc3RhdHMoc3RydWN0IGRy
bV9pOTE1X3ByaXZhdGUgKmk5MTUsDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtbm92YXRlay1udDM1NTEwLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtbm92YXRlay1udDM1NTEwLmMNCj4gaW5kZXggNDBlYTQxYjBhNWRkLi40MDg1ODIyZjYxOWEg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ub3ZhdGVrLW50MzU1
MTAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbm92YXRlay1udDM1NTEw
LmMNCj4gQEAgLTIzMSw3ICsyMzEsNyBAQCBzdHJ1Y3QgbnQzNTUxMF9jb25maWcgew0KPiAgCSAq
IGJpdHMgMC4uMiBpbiB0aGUgbG93ZXIgbmliYmxlIGNvbnRyb2xzIEhDSywgdGhlIGJvb3N0ZXIN
Cj4gY2xvY2sNCj4gIAkgKiBmcmVxdWVuY3ksIHRoZSB2YWx1ZXMgYXJlIHRoZSBzYW1lIGFzIGZv
ciBQQ0sgaW4gQGJ0MWN0ci4NCj4gIAkgKiBiaXRzIDQuLjUgaW4gdGhlIHVwcGVyIG5pYmJsZSBj
b250cm9scyBCVEgsIHRoZSBib29zdGluZw0KPiAtCSAqIGFtcGxpZmljYXRpb24gZm9yIHRoZSB0
aGUgc3RlcC11cCBjaXJjdWl0Lg0KPiArCSAqIGFtcGxpZmljYXRpb24gZm9yIHRoZSBzdGVwLXVw
IGNpcmN1aXQuDQo+ICAJICogMCA9IEFWREQgKyBWRERCDQo+ICAJICogMSA9IEFWREQgLSBBVkVF
DQo+ICAJICogMiA9IEFWREQgLSBBVkVFICsgVkREQg0K
