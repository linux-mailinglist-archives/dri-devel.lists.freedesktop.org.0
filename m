Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C54776AC1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 23:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE1210E10F;
	Wed,  9 Aug 2023 21:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94C510E110;
 Wed,  9 Aug 2023 21:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691615355; x=1723151355;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QSHWia4CXRe/Zqa2OARmD3eiHzVvk+ZjJGMpph6La/Q=;
 b=gpQ4i8g4b5f65U5AS6nc2J++n1SQR2kXkI39gt11s+maCCrdImA+AhJv
 oDG6Z6w9GM4x/WwjFM44K8966w4t9Nwamn8EGIDf7B2a5V9+VG3pGu+nI
 u7RDLpue3INlKolGnLJGHRiQ06m5XDHJ7XS6gzDW0CYnKHNePyGEyPIS7
 uF49HNZM74Gxeu7uXAJiqxpPsjcG52Vz61Yc19shIsIQqrCX1Zt2TOvsl
 RKad8q+2IE7F4GuITnZZrbaQIgk1QAe7/XcyI6H595Ewy4+UFuozVS6xV
 Thu3SLx86mOjUNLcPSzzBWaKGAzBMOqgFViB0/GX7UDGzGVjhPOEKMsLL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="370133429"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="370133429"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 14:09:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="846128386"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="846128386"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 09 Aug 2023 14:09:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 14:09:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 14:09:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 9 Aug 2023 14:09:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 9 Aug 2023 14:09:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZILbavvnWIVAAqSqvOVywX7UZL6bq+83KQH+1l1Un0SBqS2CJ0VoA1jzMFXogODioJTvvEzAio7Cb5l4IePNSH47uFhhl7Dv7dw8R395ZbT5sh9F1H0NqxmwWhhuCFa1epG0AOB3HU764k8NRJgGnUrWbYAVLIeqHr4AKakJlmJb4uJflZmChquL2mx2RQM0L9ofH+JOA7ZyfZDnVOzsyfLYuspux6xPV8taRwzWxFpS62F+dS2uiqRUyud0vqKhduxUFx4tE2vfDcGwDfxSARelLMwdo14Z2MfNrhMp0QDB3IM3np1xLcKJk+jBhDCBsWMc/IIhfQQSSndelcTS/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSHWia4CXRe/Zqa2OARmD3eiHzVvk+ZjJGMpph6La/Q=;
 b=fpfO/C9Ilx5z6Wb2nw9Qpz1YQRIGk9TBRnI4q8RVfjhhUkR/SJo1kGlec1phY1Dn+kG9QwwYmixNV9mZE4ryRzrpJbNqmExD/c0cIZr01fJjbpXjpvKFxGmpnCpWhR81kqbJEi7Z8HNA5sdTY1gnrnrYtYbwY6e5OjsnSKK72Tcwg+pD/pLY1fSnHOB7B2haZcLYP4/GwWJK4Xd8YBOb6z33XMPi+N4HeWNBgql+r129om0lQ0SP+v6NSYQtmVomF8tB2tdh9nPbwWjJgTsQyjnmnSlNhDYGf5P5u2dNZ8ZADoMHsma3QElAH02yvrqyELL935BkfY+ka46zsJpJTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by PH8PR11MB8286.namprd11.prod.outlook.com (2603:10b6:510:1c6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Wed, 9 Aug
 2023 21:09:01 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::9ff3:209f:a79f:a504]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::9ff3:209f:a79f:a504%7]) with mapi id 15.20.6652.029; Wed, 9 Aug 2023
 21:09:01 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v1 1/3] drm/i915/guc: Flush context destruction worker at
 suspend
Thread-Topic: [PATCH v1 1/3] drm/i915/guc: Flush context destruction worker at
 suspend
Thread-Index: AQHZxZn8zkAN8JKfO0eiHeQDrcMMeK/fJIkAgANbsYA=
Date: Wed, 9 Aug 2023 21:09:01 +0000
Message-ID: <d3231f39c1ff7d5899d4fd194ebed480e1cda1af.camel@intel.com>
References: <20230802233501.17074-1-alan.previn.teres.alexis@intel.com>
 <20230802233501.17074-2-alan.previn.teres.alexis@intel.com>
 <ZNEvQqeZgvd1XHPV@intel.com>
In-Reply-To: <ZNEvQqeZgvd1XHPV@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5758:EE_|PH8PR11MB8286:EE_
x-ms-office365-filtering-correlation-id: 545a9f72-4324-445f-4975-08db991cdb01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tfaZPNC55JooZtJhXFH+fu3cvjK8fcQ16H2TdMpwb3muHcci0w7sQUVOT3VdYL5ftEb/9cTTx/gLlReh64qswfq42oGdyYuAeNUB6WMKiiowJWOZ8FxZ9niPiTbLaPMUoYwXev7un1kTZdPFLUHgFTTlbX4O2HODAqmZUtCzumNPAvONBYmwTtfcshwFnBovsElMKSV2mqUKapelggACWbuFBAcCriIuXXVbD9/RTt6gBUQFtlu8W/iTeHQRibU3PvkcivzWNk7Lts8KWDgtVBCOEm6PuoHzpRfb0iQKxeExgZ3LpcOi5Z9tu8XWHVQ5sMh3ErFoV6l11NrGcrWhJic7UZdAgTyzYne6/23ph35eywQPBZO6QEhpovs5mOnwcR9le3U9MsFhb2Ca8DFhthcHM7HVB2YoHQdvEfMisSr+qeEE4fkwsN8wRlmf1nX3XFJpv4HeoUZ5iz3qy6coZ9lgprU73yqdqfYVOu0zsIs9o+zbSDc5gbUQUOBdiW9xvB6sPULBpN3xlCab6KqUJe0HFc62iiEIRAw1PpfvVxqHkCooLTa5LRf2S7wEax3wwHp6+wFiZOokVTMpvIUOvfMEE3kQuEVWLxi3WMFkc2uwsllVzeDdbQfd6RJcebfT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5758.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(136003)(376002)(39860400002)(366004)(186006)(1800799006)(451199021)(2906002)(15650500001)(5660300002)(8936002)(316002)(41300700001)(8676002)(6862004)(37006003)(66556008)(64756008)(66476007)(54906003)(66446008)(66946007)(76116006)(36756003)(71200400001)(6506007)(107886003)(91956017)(6636002)(450100002)(6512007)(4326008)(478600001)(38100700002)(122000001)(6486002)(83380400001)(2616005)(86362001)(26005)(82960400001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWpVR1dSOTNFMnZRZWJyekcvRExJelJCakNTWjI5aFlRQVR4ek5pS2YrbXBi?=
 =?utf-8?B?ekx5RnFad0M2UWxsTnptM05MWm13V1kxdDlqeU04cVM0UHFxU0RrTUZLeURJ?=
 =?utf-8?B?TUJJZVdLek9XR3VKVCtlcThYeVFrMDJYL3dyWXorYkt5NzNpeDBqRE5jcVVV?=
 =?utf-8?B?ZWNNSHhJOHp0dVlDYzNaZUJSdGVBaHlwS3NoWFpSMkJuNjBLbWxnWGpyVDU0?=
 =?utf-8?B?b2RGdmpSSUVFK0Zya0pjOHlMREFteVJUZ3NwLzlYbEhTNUg5WUp4T2Flbmlr?=
 =?utf-8?B?Z3U1UUNnRm1jVXdtOERHcTZXNGxMT0loTU1PaWZNSVRvOG80TEx5VmUrajdV?=
 =?utf-8?B?dVhGTytGa1VWdzRRM21rTFN4Yzl0Zm5taW9xVm1ETnlaTWsxZHhMR0lkV0hU?=
 =?utf-8?B?N0J2VmVMTDVqdUd1WUl5UStZaXJraHVJalJpUVhGSzRadGF2d0lsRUVWMVdV?=
 =?utf-8?B?ZXRPOGY5OXN2OVQwTDVHbzlFejJNdlFxY0wvakY5SEFZbUMyaERaNnI5TFVJ?=
 =?utf-8?B?N21qYXNWK2J2eExZRUZpTUJJV2hRTmdRS0NaUUQzamgxcjZzcXIzZDg4Njd3?=
 =?utf-8?B?NzV0RzBvcTNHcEVyMWFTY2NKbDRrSkhGMXR5dTdGd3FpUWNjRjdGUlNNR2Vy?=
 =?utf-8?B?RUxJOVVOL0R0T3YvY3UxUDdaZCszV05CUjNldGsySVczVmZyaUZkbXAxTkJL?=
 =?utf-8?B?M2ZITDVUZ01aWmRYZXlNYmwyWkIrZjBJUmczUkZCS3c1TlI5bFBKdE1PeStn?=
 =?utf-8?B?bDkvelEyamowRm8wajIrdFAvblJxR3NrOFN6ZWJHQ29JQk1FWWxPUFBFUEkx?=
 =?utf-8?B?czQrbUR3b1lxcEt6THBzajAxZEYvTEpPZ2tENGZJdHdkNE9nWGpMMmtMeXZz?=
 =?utf-8?B?RklreWtJRnVTdEZHelFDTm9KMEg4elFiQnhRbFFNNVBDaGUrMDMzYTNzUzll?=
 =?utf-8?B?MSs2Mmd5K3FoTGxHSWpTQ0h3Q0w0K1lveTNNVHh6Ykxlcy9Ga1Nlei9yOWo3?=
 =?utf-8?B?WFpkRTJnUUdiYnhBK1FFRnRQSWVndTEyWjFidkJZRkRtWVNsRlpZQ0RDbTBV?=
 =?utf-8?B?WWw5VFdrZllvYzF6RmRoRjJzT0lBR3ZZWWJTbTRGcGdPbnkrYmlUeDROcTdC?=
 =?utf-8?B?ak4xbnA3eFBTUXBHSDhzZVhwZnBEOVBJMS9ZcnJ3ODFIZVNLZnE1QWp3a1dw?=
 =?utf-8?B?U1YzdnE0K2hHb21oWWREVkd4NDQxZy94THh5d3dPOERSeUIxYmZNY2dnQkF0?=
 =?utf-8?B?bmdCbnhSUGM5dTYvdFBBWW5kcVAxV3hhcXMxZUVicmlQNXBlT3YyanNZaUtK?=
 =?utf-8?B?a215akQwRnM4V0xzSWFSanhlZzExa0c5M2E4NVFrcC9MZzRTM3AzdjhUR21p?=
 =?utf-8?B?QWd0Q1dyT1ptb2dVU2ZCNytUSDM4bGhkOVNPcDdrMHk0bC95YTMraWluUml5?=
 =?utf-8?B?NVlYS29PSHpzN2JNYzMrMXpoVU5STG5zWGd2KzdHT0RYVzdTcVFhcGUwVC90?=
 =?utf-8?B?dzBqVmhXcy95ZVlOZDVSenpqd2cxYlordVk5L2hYQWJQRWFYTVN0c0NEZ2VP?=
 =?utf-8?B?Z0FxZ3ZSRjM5d2xLQVViT1d2VjFQWEQ4Q1V5S2IrQk1IWEpEUEg2Sms4QzlX?=
 =?utf-8?B?cTZxZlN0bndZU3FnZGFnMnp3WGRTQ1pOK2RFRFIyWmNLUkV0NStsL1hMelQ0?=
 =?utf-8?B?bCtiZ0hMQm84eWg3YVBQS1ZUeWRvNW1Rb1VkWGEzaGczdEx5YWtGOXloeWFB?=
 =?utf-8?B?YjFONDJpWFdhMWcwN0s3UHhCMjhoSzFDdUtJb0trSE5oL3pkaVExbGc0MXJG?=
 =?utf-8?B?aS95bzg4M0JDemVMVlJQd3NEWUJPQ0N3dndzcXg5WW1zZjV2ZVJWUnd6UUFE?=
 =?utf-8?B?eld3NUlnTk9GcVpZSGhIOVZXUE1hMlZGQWJjQ1YyUk9lUXFRTWNpR3Myc2Ey?=
 =?utf-8?B?YW43cFdrOVl5S3dpZ2ZFK054dXVHWTNSQ3ZZSXpxelI1TVRXd0N5SFVhRXpM?=
 =?utf-8?B?MHRwR2Nia0MrVFEvaElIaXZiSDdsSTduR01EQmlOZVFGLzJNYzNoVms1MUxZ?=
 =?utf-8?B?d043UU1UK1ZPVlFJUzFhb2E1VGpRNmE0Y050KzFiazhBOExxazg1MWJPd1pD?=
 =?utf-8?B?ZnZBUGNJMkUxR0dqUURydjBra3BuK0szd25KM3hUK1hwbkI3dXlzMkttOFox?=
 =?utf-8?Q?ULphlU5O0T+vSV6hmz3UrYU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C13ACB1E24E6C4D846651F96F7BF618@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 545a9f72-4324-445f-4975-08db991cdb01
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2023 21:09:01.4904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ve0qSJCled8AaA1ceh3IxfN9JM/806KKFx1hInIKz9tp33uovKRh0bzod4GKT7KT9VSodE6/clTEYtJ2tg10CtnALDcH4v2o4kLN9vEn/+xSzEYNK/2th/G8UG5nWZmS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8286
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
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIFJvZHJpZ28gZm9yIHJldmlld2luZyB0aGlzLg0KDQpPbiBNb24sIDIwMjMtMDgtMDcg
YXQgMTM6NTIgLTA0MDAsIFZpdmksIFJvZHJpZ28gd3JvdGU6DQo+IE9uIFdlZCwgQXVnIDAyLCAy
MDIzIGF0IDA0OjM0OjU5UE0gLTA3MDAsIEFsYW4gUHJldmluIHdyb3RlOg0KPiA+IFN1c3BlbmQg
aXMgbm90IGxpa2UgcmVzZXQsIGl0IGNhbiB1bnJvbGwsIHNvIHdlIGhhdmUgdG8gcHJvcGVybHkN
Cj4gPiBmbHVzaCBwZW5kaW5nIGNvbnRleHQtZ3VjLWlkIGRlcmVnaXN0cmF0aW9ucyB0byBjb21w
bGV0ZSBiZWZvcmUNCj4gPiB3ZSByZXR1cm4gZnJvbSBzdXNwZW5kIGNhbGxzLg0KPiANCj4gQnV0
IGlmIGlzICd1bnJvbGxzJyB0aGUgZXhlY3V0aW9uIHNob3VsZCBqdXN0IGNvbnRpbnVlLCBubz8h
DQo+IEluIG90aGVyIHdvcmRzLCB3aHkgaXMgdGhpcyBmbHVzaCBuZWVkZWQ/IFdoYXQgaGFwcGVu
cyBpZiB3ZQ0KPiBkb24ndCBmbHVzaCwgYnV0IHJlc3VtZSBkb2Vzbid0IHByb2NlZWQ/IGluIGlu
IHdoaWNoIGNhc2UNCj4gb2YgcmVzdW1lIHlvdSBhcmUgdGhpbmtpbmcgdGhhdCBpdCByZXR1cm5z
IGFuZCBub3QgaGF2aW5nIGZsdXNoZWQ/DQoNCmFsYW46IEkgYXBvbG9naXplLCBpIHJlYWxpemUg
SSBzaG91bGQgaGF2ZSBleHBsYWluZWQgaXQgYmV0dGVyLg0KVGhlIGZsdXNoIGlzIG5lZWRlZCBm
b3Igd2hlbiB3ZSBET04nVCB1bnJvbGwuIEkgd2FudGVkIHRvIHBvaW50DQpvdXQgdGhhdCBhdCBp
biBpbnRlbF9ndF9zdXNwZW5kX2ZvbyB3ZSBkb250IGFjdHVhbGx5IGtub3cNCmlmIHRoZSBzdXNw
ZW5kIGlzIGdvaW5nIHRvIHVucm9sbCBvciBub3Qgc28gd2Ugc2hvdWxkIGFsd2F5cyBmbHVzaA0K
cHJvcGVybHkgaW4gdGhlIGNhc2UuIEkgd2lsbCByZS1yZXYgd2l0aCBiZXR0ZXIgY29tbWVudCBv
biB0aGlzIHBhdGNoLg0KDQphbGFuOnNuaXANCj4gDQo+ID4gIA0KPiA+ICBzdGF0aWMgdm9pZCB3
YWl0X2Zvcl9zdXNwZW5kKHN0cnVjdCBpbnRlbF9ndCAqZ3QpDQo+ID4gIHsNCj4gPiAtCWlmICgh
aW50ZWxfZ3RfcG1faXNfYXdha2UoZ3QpKQ0KPiA+ICsJaWYgKCFpbnRlbF9ndF9wbV9pc19hd2Fr
ZShndCkpIHsNCj4gPiArCQlpbnRlbF91Y19zdXNwZW5kX3ByZXBhcmUoJmd0LT51Yyk7DQo+IA0K
PiB3aHkgb25seSBvbiBpZGxlPw0KDQphbGFuOiBhY3R1YWxseSBubyAtIGkgYW0gZmx1c2hpbmcg
Zm9yIGJvdGggaWRsZSBhbmQgbm9uLWlkbGUgY2FzZXMgKHNlZSBmYXJ0aGVyDQpiZWxvdykgYnV0
IGZvciB0aGUgbm9uLWlkbGUgY2FzZSwgaSBhbSBza2lwcGluZyB0aGUgZmx1c2ggaWYgd2UgZGVj
aWRlIHRvIHdlZGdlDQooc2luY2UgdGhlIHdlZGdlIHdpbGwgY2xlYXIgdXAgZXZlcnl0aGluZyAt
PiBhbGwgZ3VjLWNvbnRleHRzIHRoYXQgYXJlIGluZmxpZ2h0DQphcmUgbnVrZWQgYW5kIGZyZWVk
KS4NCj4gDQo+IFdlbGwsIEkga25vdywgaWYgd2UgYXJlIGluIGlkbGUgaXQgaXMgYmVjYXVzZSBh
bGwgdGhlIHJlcXVlc3RzIGhhZA0KPiBhbHJlYWR5IGVuZGVkIGFuZCBndCB3aWxsIGJlIHdlZGdl
ZCwgYnV0IHdoeSBkbyB3ZSBuZWVkIHRvIGRvIGFueXRoaW5nDQo+IGlmIHdlIGFyZSBpbiBpZGxl
Pw0KDQpCZWNhdXNlIHRoZSBpc3N1ZSB0aGF0IGlzIHNlZW4gYXMgYSB2ZXJ5IGxhdGUgY29udGV4
dC1kZXJlZ2lzdGVyIHRoYXQNCmlzIHRyaWdnZXJlZCBieSBhLCBvcnRob2dvbmFsIHRocmVhZCB2
aWEgdGhlIGZvbGxvd2luZyBjYWxsc3RhY2s6DQpkcm0tZmVuY2Ugc2lnbmFsIHRyaWdnZXJzIGEg
RkVOQ0VfRlJFRSB2aWFfX2k5MTVfc3dfZmVuY2Vfbm90aWZ5IHRoYXQNCmNvbm5lY3RzIHRvIGVu
Z2luZXNfbm90aWZ5IC0+IGZyZWVfZW5naW5lc19yY3UgLT4gKHRocmVhZCkgLT4NCmludGVsX2Nv
bnRleHRfcHV0IC0+IGtyZWZfcHV0KCZjZS0+cmVmLi4pIHRoYXQgcXVldWVzIHRoZQ0KY29udGV4
dC1kZXN0cnVjdGlvbiB3b3JrZXIuIFRoYXQgc2FpZCwgZXZlbnRob3VnaCB0aGUgZ3QgaXMgaWRs
ZSBiZWNhdXNlDQp0aGUgbGFzdCB3b3JrbG9hZCBoYXMgYmVlbiByZXRpcmVkIGEgY29udGV4dC1k
ZXN0cnVjdGlvbiB3b3JrZXINCm1heSBoYXZlIGhhcyBqdXN0IGdvdHRlbiBxdWV1ZWQuIA0KDQo+
IA0KPiBBbmQgd2h5IGhlcmUgYW5kIG5vdCBzb21lIHVwcGVyIGxheWVyPyBsaWtlIGluIHByZXBh
cmUuLi4uDQphbGFuOiB3YWl0X2Zvcl9zdXNwZW5kIGRvZXMgYm90aCB0aGUgY2hlY2tpbmcgZm9y
IGlkbGUgYXMgd2VsbCBhcyB0aGUgcG90ZW50aWFsDQp3ZWRnaW5nIGlmIGd1YyBvciBodyBoYXMg
aHVuZyBhdCB0aGlzIGxhdGUgc3RhdGUuIGlmIGkgY2FsbCBmcm9tIHRoZSB1cHBlcg0KbGF5ZXIg
YmVmb3JlIHRoaXMgd2FpdF9mb3Jfc3VzcGVuZCwgaXQgbWlnaHQgYmUgdG9vIGVhcmx5IGJlY2F1
c2UgdGhlDQp3YWl0LWZvci1pZGxlIGNvdWxkIGV4cGVyaWVuY2Ugd29ya2xvYWRzIGNvbXBsZXRp
bmcgYW5kIG5ldyBjb250ZXh0cy1kZXJpZ3RyYXRpb25zDQpiZWluZyBxdWV1ZWQuIElmIGkgY2Fs
bCBpdCBmcm9tIHVwcGVyIGxheWVyIGFmdGVyIHdhaXRfZm9yX3N1c3BlbmQsIHRoZW4gaXQgd291
bGQNCmJlIHVubmVjZXNzYXJ5IGlmIHdhaXRfZm9yX3N1c3BlbmQgZGVjaWRlZCB0byBudWtlIGV2
ZXJ5dGhpbmcuwqBIbW1tLi4gYnV0IGkgZ3Vlc3MNCnRoZSBsYXR0ZXIgY291bGQgd29yayB0b28g
LSBzaW5jZSB0aGUgbnVrZSBjYXNlIHdvdWxkIGhhdmUgZW1wdGllZCBvdXQgdGhlIGxpbmstbGlz
dA0Kb2YgdGhhdCB3b3JrZXIgYW5kIHNvIGl0IHdvdWxkIGVpdGhlciBydW4gYW5kIGRvIG5vdGhp
bmcgb3Igd291bGQgbm90IGV2ZW4gYmUgcXVldWVkLg0KV291bGQgeW91IHJhdGhlciBpIGdvIHRo
YXQgd2F5PyAoaSdsbCByZWNoZWNrIHdpdGggbXkgdGVhbSBtYXRlcyBmb3IgaS1kb3R0aW5nL3Qt
Y3Jvc3NpbmcNCmRpc2N1c3Npb24uDQo+IA0KPiA+ICAJCXJldHVybjsNCj4gPiArCX0NCj4gPiAg
DQo+ID4gIAlpZiAoaW50ZWxfZ3Rfd2FpdF9mb3JfaWRsZShndCwgSTkxNV9HVF9TVVNQRU5EX0lE
TEVfVElNRU9VVCkgPT0gLUVUSU1FKSB7DQo+ID4gIAkJLyoNCj4gPiBAQCAtMjk5LDYgKzMwMSw4
IEBAIHN0YXRpYyB2b2lkIHdhaXRfZm9yX3N1c3BlbmQoc3RydWN0IGludGVsX2d0ICpndCkNCj4g
PiAgCQkgKi8NCj4gPiAgCQlpbnRlbF9ndF9zZXRfd2VkZ2VkKGd0KTsNCj4gPiAgCQlpbnRlbF9n
dF9yZXRpcmVfcmVxdWVzdHMoZ3QpOw0KPiA+ICsJfSBlbHNlIHsNCj4gPiArCQlpbnRlbF91Y19z
dXNwZW5kX3ByZXBhcmUoJmd0LT51Yyk7DQo+ID4gIAl9DQo+ID4gIA0KPiA+ICAJaW50ZWxfZ3Rf
cG1fd2FpdF9mb3JfaWRsZShndCk7DQphbGFuOnNuaXANCg==
