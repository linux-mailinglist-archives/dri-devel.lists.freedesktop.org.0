Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 008AF67A98A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 05:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FE510E335;
	Wed, 25 Jan 2023 04:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFC110E366;
 Wed, 25 Jan 2023 04:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674620023; x=1706156023;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=enCASpfHGVp5AH/C4wmDNOdFqaaMUEYzXl9+iPrpO9Q=;
 b=WwnaMzy0l9hcyZeI6J4BXxO3VukC0/DbtnHjEFjbtG8kxsEoZBqIUlZB
 CZIVKIE5TsydCopJPOKEArLiX4EvuX6fAbglnDpgAKokS7GpuAm61btuI
 nSRhlFE60xqai8p2n6X7Beds4rMFw7R+GHud2xjXrFuRGgw9FxQyFyXpF
 8Nv9CXvIRa4LK4wfdIPyHg5LsX8clbIy5zsCfWl8ckJjlLJ/Y7+V35ak8
 /aAJ6N0ONqJ2dR7oBsjkO56ik2clxwmvUzRIl+gx516y99g/lOxC9PLO9
 zOpBHPANDbcmoBVx6Xrq8R+4g4Xrzzp+WdvuXgo2JsXURRiV1D8kNcEzv Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="324176356"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="324176356"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 20:13:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="662375458"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="662375458"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 24 Jan 2023 20:13:40 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 20:13:39 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 24 Jan 2023 20:13:39 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 24 Jan 2023 20:13:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjdsDJDxCr8dA69CVOHL0ls6G5oVksMdKigKJVwtFWJa/dR2KgOgg2JpV8ueFcNwCrlhE62XGLavuWkmG1FWnHfKc4DUA7NbG4cfX5eRbJawnPDionhP+/16rLf37GsSjU57UwOPSRjqI/TXGVn5CkYElAuCTh7GcWeGhOFlGVlk7V+zHMghHLMOfI5H4ZjyWP2WSc8UUMW1wNZjZuMKzc0ubq0kBO9tThrV9qm9h9PBS00oNRiByupCHN6f9kDvyFe4uPhz1Gj4QL1DQeYy4fMKIq7CE5YKKlnRrrF1kFA4ig0Lo85aLw1lcNMG1tu6Fi2eX+R3YNOuFneLlQhUXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enCASpfHGVp5AH/C4wmDNOdFqaaMUEYzXl9+iPrpO9Q=;
 b=AbmQ883TxvtWb3fYL+Dl+soyqizlTjEeJuTiatj1gkW3JKtm6IyA08WWWKTj8Eg3Q85z2n8sFJbYX1P1Khs3vJK6JRdGY+GR5bZZ80fcmWoxvcKQIlRt5oefd/ureG4chU3ySwtHohGF/UUg8xedb6RV8ssttOPlWt0kGo07mMdOQAroXv9hr9c/wQ2zZZ6OJ9xDsdUuTGzRFWsYRxRliRJipAv6J0RPDeRCqQdkSFHQrCgsbmjpGcTHF4T9kWllHzadCS3SbExO+7462mg0OSMxfw0BIHmXRc5M4D2wUmG50gYI9pSmd0TB8pHNU2IF5IXh8NWf/DvoFHYANC174Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Wed, 25 Jan 2023 04:13:38 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%4]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 04:13:37 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 6/9] drm/i915/pxp: Add ARB session creation with new
 PXP API Ver4.3
Thread-Topic: [PATCH v2 6/9] drm/i915/pxp: Add ARB session creation with new
 PXP API Ver4.3
Thread-Index: AQHZJgWk9BPetdF/3kWowfaG1Xd3Zq6lBLMAgAmWCoA=
Date: Wed, 25 Jan 2023 04:13:37 +0000
Message-ID: <90245a93dd879ec5777dab26fafb8f6020c380fc.camel@intel.com>
References: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
 <20230111214226.907536-7-alan.previn.teres.alexis@intel.com>
 <913d9c30-daa5-debc-a8ae-25f085663c44@intel.com>
In-Reply-To: <913d9c30-daa5-debc-a8ae-25f085663c44@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA0PR11MB4719:EE_
x-ms-office365-filtering-correlation-id: b566eb84-c384-4fcf-852b-08dafe8a886d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aaJGNJn7rb3IWzYWXLbIevUb01hpftfqTKTU8aEKjfWhOkYxajgsUNlFmGuAjMWL24y9Wwl0257HyQGagfDYFDlPdnd3hfnMj4E39nm7oVgOEcpfm45WwxM221QA4f33uRTBU+809ecgAGI4M9j91zEIqV+fSyVrFfSfV3oRjalkViPPHg0fAOp9YvpCAhkIk9VpA/mjg1AThnMyjxT/UnxievqRQd/cJtyaHXit8VXrzw94yllZGRmU7a0xdnYXth7xOKSDodCpezMaIPB+fsyKXiEPyctoD6A8K3jEgvdiKc6SQvCWZj0vocvMBwhCeShimzELGE289iTew5B0jqOcwKnACjD5JoAfn5Lu2mlgHX6DukyDSGAGvHMH0T/yWcrT5feiAT5982nv8DiJboVFv2hKofxOEovnyMcrtIvu8Zp7nlfOf71EOhes+wQZpwyNdUo/vEqrvOSVe1izd4SivfPbqgoXPfQgJivwNc2yCclwMwFh5yxxlDOzCUL0picHI+UJ6q03UcQNz3GGUDp0r6iwYrKcMQN/+lDn/fXGXqp5b0dU6CgpSGwjj5Gd/LmpmFUz+tHGZsceUcR+IaFd4RAWLvCYbgX6kppBzHP0vW2LlhSwwEeUIuZy8E8TKrNipTr5vkm2/NWZDT7JIwcEjbzutwtiPYaS7vYRTFcJ0FOYSudB3XrsNHDTLpHVz+rGWysDul/xPwjktAR/8g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199018)(83380400001)(122000001)(41300700001)(38100700002)(4744005)(2616005)(76116006)(6506007)(66946007)(71200400001)(64756008)(82960400001)(6486002)(86362001)(66556008)(91956017)(66476007)(478600001)(110136005)(36756003)(54906003)(2906002)(5660300002)(38070700005)(66446008)(316002)(26005)(53546011)(6512007)(8676002)(186003)(4326008)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3QxYUEvZ0E0aUJrUWF5Qko1aVQyRnpHaTZ4WksrbFBxdkdoK3JDNElremdE?=
 =?utf-8?B?Q2VTTUhOcm1GNWM0b1lFTWExUDBMR1htUHNSV1VZdWNkUjR6cEhqRFhJc01V?=
 =?utf-8?B?dU5GbkxJVzBRL0V3c2x1WjJaYlhOL2NKV28yNEpaRUlVb3ZKTHp3cEs3S1l0?=
 =?utf-8?B?NjUwVjlqSHZTdlZBVkZkWXpQMS95dmNoUFlJUmlUTDg5bkkxb2M4WHladm5m?=
 =?utf-8?B?TTAwZDVKTkNOTE1TVUY1cTYwRFp0Sk5kVHNZV1pMM2hyNlJPL05CbmhUOGpH?=
 =?utf-8?B?SHFyWi82SWVYZ3RNckJrZjgzdllpS0ZuS0VPSllIdnJEc1YraGFLeGJKeVk2?=
 =?utf-8?B?VWFPSFBBZDBoRjRHRlhubStNdkJNYjRYemtQb0JaWFU2aGY4WWU0MFc4eUFw?=
 =?utf-8?B?V21BZ1NKT2pEcGt5MThkWTJHWUN0QU50QVZqdktyWFg4aVl6RDJIZmNULzhH?=
 =?utf-8?B?Q3hrdWdheGFtMkRGTWZzSXRheDZrQnhkVWJYQncwNHJsS283TzB4ckU4TmdO?=
 =?utf-8?B?bWREQTBENFBuZ2REeDFzVGp3YUdlU1R0Uk92TXVmMlJlMGJIQzhMMUt2ZzVY?=
 =?utf-8?B?R1pYUFY1Z2hHVGhlY1ZKc0t5YXFZRG0xenkwQ1F0eU9TMDF5eUJzMENGSkJi?=
 =?utf-8?B?aEhhSzJzL040UGRGV0RyYlcwMkRXZTcwUEI4eU4rTmR1eGNQMnp0VUFoNEVz?=
 =?utf-8?B?dUhxOHZMYTFYOHpaSmNKZ0Z2Y3g0TDc3ZFNXeFU2NG1kSGkwbzFqMlA0MElT?=
 =?utf-8?B?K0R4U3o4Ni83b2hZQ1BjYUNYQWh4UVZqWmc2N2xab3lraVp0a3IxWXl4U0pT?=
 =?utf-8?B?TTk1NVo3NlRqKzdEZWRBRXNCak5WOGRvbUZ6TDJRNUVNSEprM2RMQy9zUmNF?=
 =?utf-8?B?em40TDJYa1NWRFB1QmdWOTAxUStUVlJhMHFNWURJdHBDcDRqNWlsMElveHVi?=
 =?utf-8?B?eDBrVEJBbzRiQUFzcmRCQUdFK0swRk1YWWxwcHd6cVAyTlNGZzRHQThmSGxZ?=
 =?utf-8?B?VTZXOFlOeEpETmJHQVhwRlh2bTlxOVNnZTFIQjJDN29JVnM4SExhbmdaTmZl?=
 =?utf-8?B?SHZPaG53ZVhTMmg2Sk55U2pyRzdlUi8rejJhUFpKZkRtTFhvay9WclU3YnhV?=
 =?utf-8?B?L0ZSLzNScHVSQkh0RzJianBIdHNCZUhBQ2pjSUJIdFI5Q2g2Q1FFekJoVjVO?=
 =?utf-8?B?Rmh5eWVlWjcrUStuNzQvc0ZUaDJhZm55ZDZFTVBNTjg3Yk1rcEZvR3dObnJI?=
 =?utf-8?B?cGVVdE9BRFcvMEZ6T0RTRWFZQW1BbmVsZThtaXdHRjFBMWpBWDhISFVFMSsy?=
 =?utf-8?B?Z3VMMUk0WjhLOWV3Nk1Sa29aUWk3K29IZmpTQzBMb2JOdzFnRlR5ancrMDg1?=
 =?utf-8?B?aVFEZnNvR2FWTkgzdWZ6Yis3U1M5aGZPNG1UaTM4OTJrMzFGY3A5bHh4N2JK?=
 =?utf-8?B?QkZWekErMlZvcmZPUjNMbSt6QUl0YVFHSzIremtHVmdDVHJvT01yTm9OcTV1?=
 =?utf-8?B?RHlNclBjZ0pEWHB3bHRZMnh6Q0xQd3ZuY2FqcGVSV2EwS25QMEtCcno0UzRk?=
 =?utf-8?B?WFhrWFlZYjFLbmRKRCtxUmxFVnFwR1d5alRCelFSRzZpR2xUVDhoYStpK2tK?=
 =?utf-8?B?OW85MWdLRTJ1ZC9GWFNyaVlnZ0pBQjRNOUNHbXM3a1UyNXdrYWxrWVhEK2dz?=
 =?utf-8?B?QjVreWdBWkN4cGpWYXgra0VBTE9GcG10K0MwdlE4UFAra2FzQXlhYUJaRk0y?=
 =?utf-8?B?RkZEVDI3cU8wdjlmL2F0aUEzTWZZdFc0K0hwTkdKUWVsTXA1aFJycTR6ZkRT?=
 =?utf-8?B?emJwck1YQ0V0ajF4RTN1b2VUdzdnVEQzdG5mS2tvS1FtQWpNMm5zYnNSYVU1?=
 =?utf-8?B?VTduQy9HRGdtdXQyZ1VXMHNWYmg2V1JwaXNQTXlUZExEZy8vb2ZpYWJ4aE5Q?=
 =?utf-8?B?NkNrOW00dDZpR0NPSXVIclhKRUFnK0JXWnF5clhOSUJ6NllnMnNLNW1YQU1o?=
 =?utf-8?B?Mm9obS9Kb1Y5RXIvQUZYR0kyQStScmxFODlVb1NvZ1VwSzVZV3hsNWVQamR5?=
 =?utf-8?B?RUdzVzlwU3c1Vy9uQlVIY2sxWVA2bHlRUDN5OVhBNE5FWENGalU3TmFlU0Zl?=
 =?utf-8?B?Y3NMbDc2VGtDeDVYZUlYbzMxcWR6YzhEdTNJSlAvTU9SV3NmMWxrREkvSEhw?=
 =?utf-8?Q?aS65vH41Z21jX/qLdljkdGM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE017259B801104892A37C381141A1AA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b566eb84-c384-4fcf-852b-08dafe8a886d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2023 04:13:37.4010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UtFL5j/xmTbrq2t3qIND5mq5Gp7/1laZwXhnQDUv2Nv2LCJenT6OBIy4pNfH2VwRwuV2txT+kiuZRXGUNdWMzNR6dF7TW1NzeBQa8KExucsK81wbS1j+3wuXxSigxBnm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4719
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
Cc: "justonli@chromium.org" <justonli@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIERhbmllbGUgLSBhZ3JlZWQgb24gYWxsIGNvdW50cyAtIHdpbGwgZml4IGFjY29yZGlu
Z2x5IC0gYWxyZWFkeSBkb25lIGFuZCB0ZXN0ZWQgaW50ZXJuYWxseSAtIHdpbGwgcmUtcmV2IHNo
b3J0bHkuDQouLmFsYW4NCk9uIFdlZCwgMjAyMy0wMS0xOCBhdCAxNzo1MCAtMDgwMCwgQ2VyYW9s
byBTcHVyaW8sIERhbmllbGUgd3JvdGU6DQo+IA0KPiANCj4gT24gMS8xMS8yMDIzIDE6NDIgUE0s
IEFsYW4gUHJldmluIHdyb3RlOg0KPiA+IEFkZCBNVEwncyBmdW5jdGlvbiBmb3IgQVJCIHNlc3Np
b24gY3JlYXRpb24gdXNpbmcgUFhQIGZpcm13YXJlDQo+ID4gdmVyc2lvbiA0LjMgQUJJIHN0cnVj
dHVyZSBmb3JtYXQuDQo+ID4gDQo+ID4gQmVmb3JlIGNoZWNraW5nIHRoZSByZXR1cm4gc3RhdHVz
LCBsb29rIGF0IHRoZSBHU0MtQ1MtTWVtLUhlYWRlcidzDQo+ID4gcGVuZGluZy1iaXQgd2hpY2gg
bWVhbnMgdGhlIEdTQyBmaXJtd2FyZSBpcyBidXN5IGFuZCB3ZSBzaG91bGQNCj4gPiByZXN1Ym1p
dC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVy
ZXMuYWxleGlzQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoCAuLi4vZHJtL2k5MTUvcHhwL2lu
dGVsX3B4cF9jbWRfaW50ZXJmYWNlXzQzLmggfCAyMSArKysrKysrDQo+ID4gwqAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF9nc2Njcy5jwqDCoMKgIHwgNTYgKysrKysrKysrKysr
KysrKysrLQ0KPiA+IMKgIDIgZmlsZXMgY2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkNCg0KYWxhbjpzbmlwLi4NCg==
