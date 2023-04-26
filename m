Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 800976EF8B4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 18:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7698310E123;
	Wed, 26 Apr 2023 16:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E01010E123;
 Wed, 26 Apr 2023 16:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682527817; x=1714063817;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ENxqtSvInnh4lTgHFQOt9WsAK8WcCts2dyrti+bt6CM=;
 b=l7poFGeMz5HoPYrhAXl1/GX03b7n09QSEVrh06ZxMT/4GZrqWWMV9Wzw
 V6W9qQBEncgxfql7UxjQGw6KPBIX05xSImfHX96VcPDaZRxu70U0YVyBL
 n+VuxSwYBvc0XPiuo0IUgtlY+8Us43uSBAXQFORRPsNIuOj9Re/bDnMrK
 OYgNYjPpE2+ON746Y2ZM2sxacF1Kram+bHfeGhXxQfVu3um5RSIegCz2h
 yk1k21iB4P8B/OquOqIWR2b19RokZTdK0OJig17pD7tGz3+NYz6086fpC
 di6KyagPw+E4azZBhSBshPzRawinw2KRxjtX0ZhJawv72ePJpVDEa1t2M Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="347192626"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="347192626"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 09:48:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="783383836"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="783383836"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Apr 2023 09:48:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 09:48:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 09:48:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 09:48:48 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 09:48:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRNI/pjWbLyAKDzoEhtjpFS8oJcrkJu6/eBUV94V+rVH1lI34OrFmpCgT4LJjwEZdwPR4+vSpfGx0T9FyO/VWaBtNTYpHhejvODDApJuRsAUGJ+XQI0FDV06Y2FCUGFqZjJdzGSU1+IaZDrl1gpySj370mSetr9jg6l9F0WRQ+cEzUO+BWFeQ2qc7LNh7iNrEB+9sWdJaj50qMTfWKVpX/0PPlXYZ08qoZ/hAhwoUn3Hw9Vrh424gHwTErgTRSNePDWPJ6BClnmCOyjsAjfWXD9uKAF1kvhOVZ9xMByHLMGL00srpt8mUPfgfJ6wumW4tHLkoP4xZpuw66vhjEwhRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENxqtSvInnh4lTgHFQOt9WsAK8WcCts2dyrti+bt6CM=;
 b=YaHIuoV9hPiDLz0KwC/plmYBN9fukaFTfs5QXTLs9h3iNGgg8pznj4IP5GpUPJw9rwf6p3GcQ1s240JkmAblUG6GTa/kcyEohu5KURV56wbYLVviqkHCH0QlnUu1pVHTxAwH0w4HELNagt7C8HWCrqNpNamiXcUKmJtQSw7GpJj+qrV7dH357Pz9c1Mw9smdIf45K2l6p0QYNqVL7SyULUr3z7OyysbFWVVdso4KPR65UPFtun8a88+v1+cnXWPCx4Y7Cp1YBQGRz6oV4EY2CFZjPU79F/Ow8Pryy6/nwnVKSXqE9eiTGQ9d7K4yehPpvIB5weh6kAUo53+G/3jMcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 16:48:46 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%6]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 16:48:46 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>
Subject: Re: IOCTL feature detection (Was: Re: [Intel-gfx] [PATCH 8/8]
 drm/i915: Allow user to set cache at BO creation)
Thread-Topic: IOCTL feature detection (Was: Re: [Intel-gfx] [PATCH 8/8]
 drm/i915: Allow user to set cache at BO creation)
Thread-Index: AQHZd3u8h/qAQW/4RUCvrZVJA5FVuq89fECAgABStIA=
Date: Wed, 26 Apr 2023 16:48:45 +0000
Message-ID: <a05b4a926fc84158476c59a7c7d39651d0ff1d9d.camel@intel.com>
References: <20230419230058.2659455-9-fei.yang@intel.com>
 <ZEEkV3XOdmtYWnMv@ashyti-mobl2.lan>
 <471addf7-1670-32cd-9d2e-3f94d6825eab@linux.intel.com>
 <BYAPR11MB2567A1A450448AE17B38ED1C9A639@BYAPR11MB2567.namprd11.prod.outlook.com>
 <168211012988.392286.16107510619704913123@jljusten-skl>
 <BYAPR11MB2567F03AD43D7E2DE2628D5D9A669@BYAPR11MB2567.namprd11.prod.outlook.com>
 <168232538771.392286.3227368099155268955@jljusten-skl>
 <5d0e2cf4-a487-1a1e-dae9-4fbe8c2fe649@linux.intel.com>
 <168235638024.392286.14697291321034695564@jljusten-skl>
 <168243011485.13318.1376529380245430200@jlahtine-mobl.ger.corp.intel.com>
 <ZEkQi6Zrb6lR4DEm@phenom.ffwll.local>
In-Reply-To: <ZEkQi6Zrb6lR4DEm@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH7PR11MB7051:EE_
x-ms-office365-filtering-correlation-id: 5e874191-4460-43b0-4edc-08db467619d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tf92y1Sjdr5RUiidpT/BYSSrnVWBIIf7ayLGXGi33B608wne5DdFaxDXKFDyXH09HuywctYHsrIgwkvIxxmRcLowkwnJawY58NcLpySy+g9zoIIAdM0vws7EG0xPzbJBB38FINZpBWdkvoNaJpNguL9+QOALqK2Fl164AV8T8BCunhPMMp7blC5PatLYsj3/AVq8buRxHuVFSQ24dhPxWuSGbEIkgK1q1pzvsscKTMX0s8JZhERGYNqZMNgHnhxLPmAP5nLoW/zAeVmUv2ixg+uahVsfhbXsRGrm8ojBHE/lA+14GV0NEXewxB2fbINa+NcVTmqywRLDpxzlmajsM4P08JCz/VBiJafDMMkSRCSPzBBQ2TrU2iUqImu6/uZv41RggxMPhpOXxKSIZL6crrcdA6L1slEkQ1ul+Ap7Mbvkj0hSZ4+J4Us/gcFkH0rd8iDuUzjqdDptK0Ov8htTap8qeqCuJIU9vPRtg8Z6mbKtn46KpNAtmuZwMJdfdfxzZ5z9l9vxEChSgfJBPR1hgWPWFPUQzRz+7iI0BTDaMXjifg7L5O01cagA84pf7VqeoYp0C6QPuo0R2U8z7pR48MjNg3YfKKKDagT3VAZLI2KXxbLtA1b1A9FmkYRWTe1Z
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199021)(54906003)(110136005)(478600001)(4326008)(5660300002)(8936002)(38100700002)(8676002)(2906002)(86362001)(38070700005)(36756003)(66946007)(64756008)(316002)(76116006)(82960400001)(66476007)(66446008)(66556008)(122000001)(41300700001)(186003)(91956017)(2616005)(53546011)(26005)(6506007)(6512007)(6486002)(83380400001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NklhK2JuNlRzbThrMmkrNDFtZ09nUmJjeWFFdjdyN2RJMU1YTXRQMFBOT01N?=
 =?utf-8?B?ZmRmSmxRSDB3aFJqZWd5SVRKZlZWZHpvVnJ4ZmhJR2c1RUZZSitRa3poT2Yz?=
 =?utf-8?B?NUhwUlpCUnpmNGE3Q3l4alJSRkRUNGNmLzQvcUxFZFpWTXF2VUR4bCtXYWo4?=
 =?utf-8?B?NHZSU2RVbTNpRmZCM3hxT0ErM08xc1RHZE8vY2xPZGhnZURLZ1MzaElsbSth?=
 =?utf-8?B?c0FiSEhHYngvRnlhT2NkWW11Yk1ncE91bFhhQ1VmRm56Ym1CWnBERENKcTQ3?=
 =?utf-8?B?N002cGpzeXlhMVdPQnUrYXJLbW10b01TWWtReDRodHdwbzUrMnMzNnF4bmw3?=
 =?utf-8?B?V2lBNWU4UjJXU05RS29URkV1WFppeVBBSnVONWxnbzFQQ3F5d0g4QkxPdEhn?=
 =?utf-8?B?SDJmRkh3UDg0cS9KTmtJSndiMzloT0dacmxjV0JmeWs2cjdKU3p5VmI0QXQ2?=
 =?utf-8?B?c09XS0cvcHZ4WFhaVFBrbHJ4NE5MQ3NkOEFlYnpHQ2dqNy8xVnNPSi85WnFo?=
 =?utf-8?B?VjFnelVocGU0R1ZDdTBCbFdQYlM3Y1d2bVdSbHg3UFUvd1gwNlZSQisvc3RE?=
 =?utf-8?B?N2lJS3RvckpxK3hFeDhLUCtkelVidFRzMDd0U3pTbDZuY2gvTThWQ09rWHZS?=
 =?utf-8?B?TE95L05MbVJwV2d6eFN5emRSSHFhaTJwZ1ZaK2xiaEU3dGo1SlBXR3RtZUhP?=
 =?utf-8?B?T1laQVYrWUdySEZkTWZRVzIrM1JHN2dmNnp5SHUvSzBtVFRySGpoalVKMHlx?=
 =?utf-8?B?OFhCL2pPUjhFeVdCV3Q0dXpLL1RrL2tIdkt2bS84emlpRFJCR20wT21FQzdT?=
 =?utf-8?B?SUpoSks1WTB5dGt2dllUNnJqWWZCR1dvY2ZVYWtHYjVtR3M5L3g0cWdLU2hJ?=
 =?utf-8?B?R1hxcEV0VEU1aDBQdUFCNlp4U000Tk14QTc4N3h4M1NQYXJkbHNRN1Blc0tB?=
 =?utf-8?B?Zks3THNNOWJ5OVFSNjc1SWhrZmVhMUhOZm9ONlBvb1VQNWV4K2tzTk9Deisr?=
 =?utf-8?B?cElPUjhKaFBzcDJFN2JqaWI0TnFIOWhkMUVKNnJEMDZ5Njc2S2J1Q3VVNC9L?=
 =?utf-8?B?ZzkreDdjU3RaRXhaNjhPakxENHVpOXpGTmxKUUZFaDZmZjIzcE5JNTRpVzY1?=
 =?utf-8?B?RVFEVmdVR0ZtOFloYlo3c0ZwQi9MdmNOaXhZOEN0emhXMTNLandhdjU4SzhN?=
 =?utf-8?B?RjdWWDBneWNCNld4MVlZRjlmb013clBETUptWEY4STkyMW5qYzJJQjF5TjF2?=
 =?utf-8?B?bFVpM256YUM0M0t5bHBWeTNDdGFQc1MrWEZ6WmQyQVc5Q2dINWpVelo3R0RR?=
 =?utf-8?B?YUJtc0F0SU05aS9tcGNYOUlySldUdWRIT29nOXVPWFlLb0pTWk1wVGhRWCtZ?=
 =?utf-8?B?UUNiUlV2KzY2ZFNZbjB3N2wwZFJqSytJc3VPc0wxM2xKWitTRVpWd3I3YjNm?=
 =?utf-8?B?RjZSSjBwU2NUaDA2VHlFYm01L3U0bjg5c09kTjd5NmxJa0pldjl6R1g1K2tP?=
 =?utf-8?B?UitLQ3BGb2E4YkNVdnZmRm9sVHIzQXNRNnRGTG5kT0xjVlhNc2VjakpyZ2RU?=
 =?utf-8?B?Tk9MR3cxZ24xTXpXbTMyL2JOTWhndEZJV1gyOFRCY283cHF6T1Z4b2pQd05r?=
 =?utf-8?B?Qm41ZGNVbkE1V3dKYVhxRFNReUk5emRabUpzb0h4bUZmZUVhRS9aeW1mVjRW?=
 =?utf-8?B?WHkxdW80aGswSHBzMUJNWndMWUlLRkVsNVpiV0JxZXErbHBQOEk4YnBNcThG?=
 =?utf-8?B?UDNtOTZKQmNSL1pRU3lmakVnNmVJVGpCblZCcHVVRUN4NVh5VUw1SEVwYWJ2?=
 =?utf-8?B?MnRHMzJxZFJYTnFxaTQ5N2JLWGpFSnBmRTRaNHFUa0YydFNxRElPTGgzTzRm?=
 =?utf-8?B?UDBad2NPdHpUOXR0bVJZazFhSTJDYzE1c1kzajNXei9kT0tjM3RnTUFwOGFa?=
 =?utf-8?B?a0lkU0pTSFg2Q2tjZlM3eUJmeTI1cXVKWU5vVzNHMWJhUkxjVU8wS3VVei9S?=
 =?utf-8?B?YUlrR2cyamFyczdtM2FkNVgzY3JFdmlJeW5SaUtWNG9DRERNWTkralpJZkMr?=
 =?utf-8?B?RXFlMlowWlo1NzYxU0ZHWHRWRy9pMXM5bHNFcG1yZGdnSXF6VmcxRGc0bi9u?=
 =?utf-8?B?RkJyekpKdDNZeGd6UGI1cWExNXl4Kytybm5nQXZqRmtONis0RytoS2pVZ0ZU?=
 =?utf-8?Q?IIUzUAQsKvT+iqvqaHc6mmE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C58E7AF076D194F96A8F68E2A85839D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e874191-4460-43b0-4edc-08db467619d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 16:48:45.6673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FsXm7UMUdNETZiEckYVn3G1sCPye9lj3dl3lY+ExN56bQsSKAZHc62cyy+MNFlq7YWo9aX2XF2TAWhAIpylHvze5F/aHCl7PAiWZ3i85Vd73YTxBgnocBPH0Azh/m5Y8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>, "Yang,
 Fei" <fei.yang@intel.com>, "Justen, Jordan L" <jordan.l.justen@intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
 "chris.p.wilson@linux.intel.com" <chris.p.wilson@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>, "Das,
 Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA0LTI2IGF0IDEzOjUyICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0K
PiBPbiBUdWUsIEFwciAyNSwgMjAyMyBhdCAwNDo0MTo1NFBNICswMzAwLCBKb29uYXMgTGFodGlu
ZW4gd3JvdGU6DQo+ID4gKCsgRmFpdGggYW5kIERhbmllbCBhcyB0aGV5IGhhdmUgYmVlbiBpbnZv
bHZlZCBpbiBwcmV2aW91cyBkaXNjdXNzaW9ucykNCj4gPiBRdW90aW5nIEpvcmRhbiBKdXN0ZW4g
KDIwMjMtMDQtMjQgMjA6MTM6MDApDQo+ID4gPiBPbiAyMDIzLTA0LTI0IDAyOjA4OjQzLCBUdnJ0
a28gVXJzdWxpbiB3cm90ZToNCj4gPiA+ID4gDQo+ID4gPiA+IA0KPiANCmFsYW46c25pcA0KDQo+
IC0gdGhlIG1vcmUgYSBmZWF0dXJlIHNwYW5zIGRyaXZlcnMvbW9kdWxlcywgdGhlIG1vcmUgaXQg
c2hvdWxkIGJlDQo+ICAgZGlzY292ZXJlZCBieSB0cnlpbmcgaXQgb3V0LCBlLmcuIGRtYS1idWYg
ZmVuY2UgaW1wb3J0L2V4cG9ydCB3YXMgYSBodWdlDQo+ICAgZGlzY3Vzc2lvbiwgbHVja2lseSBt
ZXNhIGRldnMgZmlndXJlZCBvdXQgaG93IHRvIHRyYW5zcGFyYW50bHkgZmFsbCBiYWNrDQo+ICAg
YXQgcnVudGltZSBzbyB3ZSBkaWRuJ3QgZW5kIHVwIG1lcmdpbmcgdGhlIHNlcGFyYXRlIGZlYXR1
cmUgZmxhZyAoSQ0KPiAgIHRoaW5rIGF0IGxlYXN0LCBjYW4ndCBmaW5kIGl0KS4gcHhwIGJlaW5n
IHNwbGl0IGFjcm9zcyBpOTE1L21lL2Z3L3dobw0KPiAgIGtub3dzIHdoYXQgZWxzZSBpcyBraW5k
YSBzaW1pbGFyIHNvIEknZCBoZWF2aWx5IGxlYW4gdG93YXJkcyBkaXNjb3ZlcnkNCj4gICBieSBj
cmVhdGluZyBhIGNvbnRleHQNCj4gDQo+IC0gcHhwIHRha2luZyA4cyB0byBpbml0IGEgY3R4IHNv
dW5kcyB2ZXJ5IGJyb2tlbiwgaXJyZXNwZWN0aXZlIG9mIGFueXRoaW5nDQo+ICAgZWxzZQ0KPiAN
Cg0KQWxhbjogUGxlYXNlIGJlIGF3YXJlIHRoYXQ6DQoxLiB0aGUgd2FpdC10aW1lb3V0IHdhcyBj
aGFuZ2VkIHRvIDEgc2Vjb25kIHNvbWV0aW1lIGJhY2suDQoyLiB0aGUgSSdtIG5vdCBkZWNpZGlu
ZyB0aGUgdGltZS1vdXQuIEkgaW5pdGlhbGx5IHdhbnRlZCB0byBrZWVwIGl0IGF0IHRoZSBzYW1l
DQp0aW1lb3V0IGFzIEFETCAoMjUwIG1pbGlzZWMpIC0gYW5kIGFzayB0aGUgVU1EIHRvIHJldHJ5
IGlmIHVzZXIgbmVlZHMgaXQuIChhcyBwZXINCnNhbWUgQURMIGJlaGF2aW9yKS4gRGFuaWVsZSBy
ZXF1ZXN0ZWQgdG8gbW92ZSBpdCB0byA4IHNlY29uZHMgLSBidXQgdGhydSByZXZpZXcNCnByb2Nl
c3MsIHdlIHJlZHVjZWQgaXQgdG8gMSBzZWNvbmQuDQozLiBJbiBhbnljYXNlLCB0aGF0cyBqdXN0
IHRoZSB3YWl0LXRpbWVvdXQgLSBhbmQgd2Uga25vdyBpdCB3b250IHN1Y2NlZWQgdW50aWwNCn42
IHNlY29uZHMgYWZ0ZXIgaTkxNSAofjkgc2VjcyBhZnRlciBib290KS4gVGhlIGlzc3VlIGlzbnQg
b3VyIGhhcmR3YXJlIG9yIGk5MTUNCi0gaXRzIHRoZSBjb21wb25lbnQgZHJpdmVyIGxvYWQgPC0t
IHRoaXMgaXMgd2hhdCdzIGJyb2tlbi4gDQoNCkRldGFpbHM6IFBYUCBjb250ZXh0IGlzIGRlcGVu
ZGVudCBvbiBnc2MtZncgbG9hZCwgaHVjLWZpcm13YXJlIGxvYWQsIG1laS1nc2MtcHJveHkNCmNv
bXBvbmVudCBkcml2ZXIgbG9hZCArIGJpbmQsIGh1Yy1hdXRoZW50aWNhdGlvbiBhbmQgZ3NjLXBy
b3h5LWluaXQtaGFuZHNoYWtlLg0KTW9zdCBvZiBhYm92ZSBzdGVwcyBiZWdpbiByYXRoZXIgcXVp
Y2tseSBkdXJpbmcgaTkxNSBkcml2ZXIgbG9hZCAtIHRoZSBkZWxheQ0Kc2VlbXMgdG8gY29tZSBm
cm9tIGEgdmVyeSBsYXRlIG1laS1nc2MtcHJveHkgY29tcG9uZW50IGRyaXZlciBsb2FkLiBJbiBm
YWN0IHRoZQ0KcGFyZW50IG1laS1tZSBkcml2ZXIgaXMgb25seSBnZXR0aW5nIH42IHNlY29uZHMg
YWZ0ZXIgaTkxNSBpbml0IGlzIGRvbmUuIFRoYXQNCmJsb2NrcyB0aGUgZ3NjLXByb3h5LWluaXQt
aGFuZHNoYWtlIGFuZCBodWMtYXV0aGVudGljYXRpb24gYW5kIGxhc3RseSBQWFAuDQoNClRoYXQg
c2FpZCwgd2hhdCBpcyBicm9rZW4gaXMgd2h5IGl0IHRha2VzIHNvIGxvbmcgdG8gZ2V0IHRoZSBj
b21wb25lbnQgZHJpdmVycw0KdG8gY29tZSB1cC4gTk9URTogUFhQIGlzbnQgcmVhbGx5IGRvaW5n
IGFueXRoaW5nIGRpZmZlcmVudGx5IGluIHRoZSBjb250ZXh0DQpjcmVhdGlvbiBmbG93IChpbiB0
ZXJtcyBvZiB0aW1lLWNvbnN1bWluZy1zdGVwcyBjb21wYXJlZCB0byBBREwpIGJlc2lkZXMgdGhl
DQpleHRyYSBkZXBlbmRlbmN5IHdhaXRzIHRoZXNlLg0KDQpXZSBjYW4gYWN0dWFsbHkgZ28gYmFj
ayB0byB0aGUgb3JpZ2luYWwgdGltZW91dCBvZiAyNTAgbWlsaXNlY3MgbGlrZSB3ZSBoYXZlIGlu
IEFETA0KYnV0IHdpbGwgZmFpbCBpZiBNRVNBIGNhbGxzIGluIHRvbyBlYXJseSAoYnV0IHdpbGwg
c3VjY2VlZCBsYXRlcikgLi4uIG9yLi4uDQp3ZSBjYW4gY3JlYXRlIHRoZSBHRVRfUEFSQU1zLg0K
DQpBIGJldHRlciBpZGVhIHdvdWxkIGJlIHRvIGZpZ3VyZSBvdXQgaG93IHRvIGNvbnRyb2wgdGhl
IGRyaXZlciBsb2FkIG9yZGVyIGFuZA0KZm9yY2UgbWVpIGRyaXZlciArIGNvbXBvbmVudHMgdG8g
Z2V0IGNhbGxlZCByaWdodCBhZnRlciBpOTE1LiBJIHdhcyBpbmZvcm1lZA0KdGhlcmUgaXMgbm8g
d2F5IHRvIGNvbnRyb2wgdGhpcyBhbmQgY2hhbmdlcyBoZXJlIHdpbGwgbGlrZWx5IG5vdCBiZSBh
Y2NlcHRlZA0KdXBzdHJlYW0uDQoNCisrIERhbmllbGUgLSBjYW4geW91IGNoaW1lIGluPw0KDQpU
YWtlIG5vdGUgdGhhdCBBREwgaGFzIHRoZSBzYW1lIGlzc3VlIGJ1dCBmb3Igd2hhdGV2ZXIgcmVh
c29uLCB0aGUgZGVwZW5kYW50DQptZWkgY29tcG9uZW50IG9uIEFETCBsb2FkZWQgbXVjaCBzb29u
ZXIgLSBzbyBpdCB3YXMgbmV2ZXIgYW4gaXNzdWUgdGhhdCB3YXMNCmNhdWdodCBidXQgc3RpbGwg
ZXhpc3RlZCBvbiBBREwgdGltZSBtZXJnZSAoaWYgdXNlcnMgY3VzdG9taXplIHRoZSBrZXJuZWwg
K8KgDQpjb21wb3NpdG9yIGZvciBmYXN0Ym9vdCBpdCB3aWxsIGhhcHBlbikuKGkgcmVhbGl6ZSBJ
IGhhdmVudCB0ZXN0ZWQgQURMIHdpdGggdGhlDQpuZXcga2VybmVsIGNvbmZpZ3MgdGhhdCB3ZSB1
c2UgdG8gYWxzbyBib290IFBYUCBvbiBNVEwgLSB3b25kZXIgaWYgdGhlIG5ldw0KbWVpIGNvbmZp
Z3MgYXJlIGNhdXNpbmcgdGhlIGRlbGF5IC0gaS5lLiBBREwgY3VzdG9tZXIgY291bGQgc3VkZGVu
bHkgc2VlIHRoaXMNCjYgc2VjIGRlbGF5IHRvby4gLSBzb21ldGhpbmcgaSBoYXZlIHRvIGNoZWNr
IG5vdykNCg==
