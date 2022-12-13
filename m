Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A730D64B653
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 14:34:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F080910E315;
	Tue, 13 Dec 2022 13:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111D210E314;
 Tue, 13 Dec 2022 13:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670938420; x=1702474420;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=H2BeMRC6F/c9Z/N9jc5OK3HC3nemzA8V8++B6zXvi2Y=;
 b=YJ3MYSU0Gwcn8KSOSISNxOTgv/eWUo9/ZU3uKNLxmNRXOKU3affTVyc1
 uPWs6GHRvgl0AngJJOc0sSlsSqEC+mJ/1gWlLxY+GcXUiroAScEz3oZfA
 XvcS9aat7HWD07K5EXNjPYzTo1ajLJJEiYd0lr8W7bBWcTAgV0fsKlY7Q
 bbPGywGnTfEF2uSJDEt0hcQJsr0/mvYAItAlLFgSFfmialBygZvs6El6j
 ycBJOeeZ6LT1iQPj+tj1iuKeUtHDx2ga3hUw5XdjBv/uRZ1M23/DddbJK
 7np+IhGPI+VRAMmftZ+4VNWw8gv4pBIb1L3HBwwoG0XIzd1VrFK1CriHB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="315767685"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="315767685"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 05:33:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="717228975"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="717228975"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 13 Dec 2022 05:33:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 13 Dec 2022 05:33:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 13 Dec 2022 05:33:38 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 13 Dec 2022 05:33:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6NxVsIFNK5fzOwaTGIvOYuogdZVZ3aZpvjqkfBWdZYchtVzZMW/rIeI9x1/L+Mkc8mzLkAjG4QhU+qOScwJr9X9XFO6jm88kKqpndCLQ4FoN8iVljGq6XzvCaTt2rNAdxic2k6Cxa2OrK54T5Mjr8aW3KW2JVN6SsLzvBfiqW6X6RlRfh9f8HmT8T7sTWu9P8z/71i0pC/YJarZyS3vf15ygjkbgc1tu578G0CRtUm0VZBxPAjk7PjAjrSo3yWoy45WYe3AbFrUlvzOprY9SLbeBPQ9mvY1BdNl76OyT5oAfSiyHUwo5J3gUCnKTGch0v8ycowt61IuwOJrG/0cZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2BeMRC6F/c9Z/N9jc5OK3HC3nemzA8V8++B6zXvi2Y=;
 b=ZriM+DFu7IZZyzsa8kUmv1DMOhcrMFq8lXl46COr5Leoi+ApGPJLmyjuZm5SS+KwIAE+4S2XCoYv7TvsugRDeCd3kgpTaqNvhtOMa86zRAFpqmtFJpGuH1xKQGWzjoClxBQPGOmf3QBNwO+MSQ4D5K7NVLloY2gLdEqjXQEtRy7U3YDVwsmUj0z3TZNqpeEHbw/DCq/NRUa3QbzSDJlXQtWN2PTlvO4jYvzYaWFTdJTci2YO14i5+MVPU4p9Z1jg+jwvYX/DdyEcV7yfFvzcKIhPh/i49TRtMCqcJJ9SrlqIQLNLSVOIChrcRet35caRl0Ydds+8f0LPBuOJbEsFzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS7PR11MB7835.namprd11.prod.outlook.com (2603:10b6:8:db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 13:33:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808%9]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 13:33:36 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "jiapeng.chong@linux.alibaba.com" <jiapeng.chong@linux.alibaba.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915/hwconfig: Remove comment block
Thread-Topic: [PATCH v2] drm/i915/hwconfig: Remove comment block
Thread-Index: AQHZDrbZ3RiXeFVI7EKWJKclv4ySua5r0ZAA
Date: Tue, 13 Dec 2022 13:33:36 +0000
Message-ID: <3221542bbaf123525fa35a38bb1a4c5c1d0d292d.camel@intel.com>
References: <20221213055015.27968-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20221213055015.27968-1-jiapeng.chong@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.2 (3.46.2-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|DS7PR11MB7835:EE_
x-ms-office365-filtering-correlation-id: 2d65d0d5-747d-4f1a-5ea5-08dadd0ea360
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9MEe/YrdvRldVC8WgB52hXjAxBYJivotrYFsFqT9+lilmuGIafoa7orVtytsR0WKdaSUTD36rQAxK/pCfBt7d8hGCWspcKnchz8p5q6FnDXnSZgcJV/tfPh/ZHAXjT9sI+ZWY/18fB9KyAUUFGxcgsqyrPapnBqrm9CjmBr10HasMMEjuuYngbPpadhlHw+Il375Npq0C83t2RkXqg7nUJXGwIyvn5MWx8miH9TvWHF9hRDKuylvv/1a6UE1vPN/VA/tdZvLBSoeNf9I8ygnRyEZGb2YOWYdir7gObo+Zxgrq30cByedvyx0P29bhqqLrGhTJwsbrJGtLMjd5Y+p1dHRKkL/fahsixJjavVVm/vBxBGcBO2wM9uAy53K5BfPRhJUcc1DLUn3QYCifbWgZXj08lsMKiuBL9mPOaeGoRQgJ/CU+WWltwcmfcgUybPt3XcFndjQt+Zu3WEfHEQkksJSTHsSBZSmgfABL+8/+PJUqjBHO21HOJbNznP+tZ/wI2p05SUBsFnjTVj3DUh3+EH0ZZ0MyuU9rNyu60W0UvNdl7YgnPQ1zeLjI4wur9Fq1fywlvtyyz9/3P5tB9Pp5m1m+GrEwWe3GCNbhfwWEODksk2R6jO+9rjfIQpJUL0HuLMW3YzuGO/fuYSHIc0FgnAOEa9ZaZP4rTcwZpyAlQHLVzX2Aan1QlTguoVvBe4QYEbow2KsmljK10VKOvhEtjT4JDysXXq7eOsA0vJt7J0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199015)(38100700002)(122000001)(82960400001)(38070700005)(86362001)(966005)(91956017)(8936002)(478600001)(6486002)(71200400001)(4001150100001)(66446008)(66476007)(66946007)(66556008)(4326008)(110136005)(54906003)(76116006)(64756008)(316002)(186003)(8676002)(6506007)(83380400001)(26005)(2906002)(6512007)(7416002)(2616005)(5660300002)(41300700001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTZqWGFValFPU2RsTFpubWJ1ajBQSEFoclRYRFEzVjVQeWRLME13Ym90ODNt?=
 =?utf-8?B?aVZOUWJiSUJXa0p5V0k3T3hCc21RZkdleDVPKzNDZnBLSDBDK3BMcmtpNjY5?=
 =?utf-8?B?WktobFQzOGJidEFSUTY1ak5NYmgvTXc4MzZDd2R1ekVwV0hrL1YzcUpDL0F6?=
 =?utf-8?B?TDlNa0hsbnVKcHAzYkp6ODhvVWR4M0krU2JaYzJmYndWZktFK0ZKcThmcHhD?=
 =?utf-8?B?bWd1UmlCSE5UQytyVWZUazNQRzEwVTQxUkhuaTF4a1JGT2IvbGthc0hCZG45?=
 =?utf-8?B?eVk5NGQ2Rmx4NVIvVTI5WGg1a08zTStOYW55UGMxWTQxakw4L2VJQ0FSTmN3?=
 =?utf-8?B?SXc1UWdzQko5Nk5IMEZFMVVTcG5UTDRQQ2FWMWxCblFESFNqMm9FTFNmQXhW?=
 =?utf-8?B?eWpQNU1QSjdGMlVEa0luSXo0RzhHeGZWY1N4aHo5b3RuSTBNeVdWS0tUUFFT?=
 =?utf-8?B?WDloaDYzd3pUVkFsVWJ5Wk1Nd2M0YzhpZ0ZJT1hrT3RHN3BCSk1hdmExUGxZ?=
 =?utf-8?B?WVo1alpBaHFKVk41a01ZTlllQ1NVc0dDVjgxM09DTW41U0FHZkROQ0ZGRVF6?=
 =?utf-8?B?S2hlZWVwZ1NzUDRkMFFoM3VBVFdXcGt6eWxZcUp4aUtyUVNMQ3NwNEZSc3JU?=
 =?utf-8?B?aDRmTVh1Uk9YelNZRFVMTDNNMlNFamVZb212STI2WXpuSDFNdmtMdWhoS1E0?=
 =?utf-8?B?KzIwdlpYc0o2Z1JrY3dkTEhPalJuVENZemw2RnBISnE2MVJlSCt1M1VSYnJw?=
 =?utf-8?B?bUE3UkdhQ21pWnRQc3pXWVZxbW5HUmRpOHFhd3ptOTRUUHdxc1FWVTBlUlhT?=
 =?utf-8?B?QlUvcmF0aWl0YllXamQ0eUkxMHRNQ3JsY3lKS3UwWWxYdUdTa25ZZXBBRmR4?=
 =?utf-8?B?aFFXeVQ2RVVHZVNWaHBOSUpwUnpHaXZZZEZmVmJVOWVyaEl0QUxUM0pjSGNP?=
 =?utf-8?B?alJhUy92OXI3UFZHVFRFb2Z4dnU5QXVBODJaSDZUL0RRNkF5MHRXQk82dzFy?=
 =?utf-8?B?d1pSZkVSdnRWYWFkcU92M05tT1BNdy9Ia01IV0MxSGVPeXA1c2FkZlNwS2xD?=
 =?utf-8?B?bkFBUG4xR2FkcW1YSDh0b1NraGFmT1ljK0xQZGg0aFZtd3lEQldaempyQjFo?=
 =?utf-8?B?T3U5MzZVbzRvVU9uOWtIWnhHZ1dVdEs2YzcvVGozQ3ZOZFJrb0luOFBFQlFD?=
 =?utf-8?B?VlJ6WEtNcStmSXVQL1RqWDFrYVpSMTVQRFhpclhXZ0RybEphbmZyUTRVNENh?=
 =?utf-8?B?L0dyN0JyRkJ6K2JYTzgyZFlvRXV3TFQwcmlIL2F2TTlySHplN2c3ZzcyQ3FL?=
 =?utf-8?B?aXpQMzVUb3ljeVBlZEhpRzFzeHZzbEhlSnV5RkU2eFdZRTI1bkV1bVpVOTRn?=
 =?utf-8?B?cU9wYnUvSDFRQmk2akhDeTVSMW9PSmdkK2F0eDN2aWRFazlPY0FBQW1UbzQ0?=
 =?utf-8?B?VS9aU09yL05iMzBteEkxbTZyTHlaelcreVd5WEZOTDl4SVp4VGhFSWRyZ1J3?=
 =?utf-8?B?Yzc4Z08xVnVmcWtoc0o1QWdHUmNjQTRNeEdIeE03WnhzcVl2cG94YmRUK2k5?=
 =?utf-8?B?SURTMUZFd2ZJS1l0aWxBOGtKenpJZHJ1d09mOW9FR3BXcE45eit0Y2FQRjMr?=
 =?utf-8?B?ckxkdVd4cSsxZzcrb3dnbk5Qa0hMVDB5dVRNaTgzQzMrcmNSQ3lzUDRSaXc5?=
 =?utf-8?B?MFRFVmxqZGNQRlZpMm15MVNtbDdOYjczZUhQSGJvKzBpSzV0L3JqSXZqcDI2?=
 =?utf-8?B?RVV4ZmtmQjJZbkMyYXNZRWlNeXhUTm9YMFUyZkxxVUNSOUZSSkpTNktZeE5l?=
 =?utf-8?B?ZzNLSkp6eE5JV29rYTErYkVvazV4L0tBakh6QnlEa2tPdFlGMXJtamx0NVAw?=
 =?utf-8?B?YXo2SkloZG9RNDVJdDhFTGZSRDBjTkEvbDIvRi9EeGN5MG1ScnQ0QjhZUmZl?=
 =?utf-8?B?M2E1Ujc4ZUM2WmEzZWgwNmVlaExSM3NJeENOWmNDeWtEQk94SlZmK3FsN2VL?=
 =?utf-8?B?RG9iUXJaaEdDN2VBc3FtSFI2UzE3RHIxR0N4ME9WU2xXekdkUkhkM3MrZ2FG?=
 =?utf-8?B?dHIrSXVUS054TnhadkkrVjViMWxXeTYvQWNNcjhlUkRxN1hTWjJPU0ZFbjFZ?=
 =?utf-8?B?TFYzNlhLMG9wMlJ2cHJmMmhZVmlKM3ZsTnVoWWx2dWYvZE5YbG5sWHlWOGtu?=
 =?utf-8?B?T1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDF9DA5C4D886F4D9BE94ADCED35E38E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d65d0d5-747d-4f1a-5ea5-08dadd0ea360
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 13:33:36.6316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +6WhLuF2EpOZX2p479vUhkT29YzPkCceTaT3jwZAXlU/WodnMQxhi3c/OWpT3DelilAC+A5ph+cEkPbUP5cSBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7835
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "abaci@linux.alibaba.com" <abaci@linux.alibaba.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiBUdWUsIDIwMjItMTItMTMgYXQgMTM6NTAgKzA4MDAsIEppYXBlbmcgQ2hvbmcgd3JvdGU6
DQo+IE5vIGZ1bmN0aW9uYWwgbW9kaWZpY2F0aW9uIGludm9sdmVkLg0KPiANCj4gZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2h3Y29uZmlnLmM6MTEyOiB3YXJuaW5nOg0KPiBl
eHBlY3RpbmcgcHJvdG90eXBlIGZvciBpbnRlbF9ndWNfaHdjb25maWdfaW5pdCgpLiBQcm90b3R5
cGUgd2FzIGZvcg0KPiBndWNfaHdjb25maWdfaW5pdCgpIGluc3RlYWQuDQoNClRoYW5rIHlvdSBm
b3IgdGhlIHBhdGNoIGFuZCBmb3IgYWRkcmVzc2luZyB0aGUgY29tbWVudC4NCkJ1dCBub3cgdGhl
IGNvbW1pdCBtZXNzYWdlIGlzIG5vdCBleHBsYWluaW5nIHdoYXQncyByZWFsbHkgZ29pbmcgb24u
DQoNCkNvdWxkIHlvdSBwbGVhc2UgaW1wcm92ZSB0aGUgbWVzc2FnZSBzYXlpbmcgdGhhdCB0aGUg
ZnVuY3Rpb24gaGFzDQpjaGFuZ2VkIHRvIHN0YXRpYyBhbmQgd2UgZG9uJ3QgbmVlZCBkb2MgY29t
bWVudCBpbiB0aGUgc3RhdGljDQpmdW5jdGlvbnMsIGV0Yz8hDQoNCkFsc28sIHdoaWxlIGRvaW5n
IHRoaXMsIHBsZWFzZSBmaW5kIGEgYmV0dGVyIGNvbW1pdCBtZXNzYWdlLg0KVGhpcyBpcyB3YXkg
dG8gZ2VuZXJpYy4gU29tZXRoaW5nIGxpa2UNCmRybS9pOTE1OiBSZW1vdmUgdW5uZWNlc3Nhcnkg
ZG9jIGZyb20gc3RhdGljIGh3Y29uZmlnX2luaXQNCnNvdW5kcyBiZXR0ZXIgYW5kIGVhc2llciB0
byB1bmRlcnN0YW5kIGZyb20gYSBsb2cgLS1vbmVsaW5lLg0KDQpPaCwgYW5kIGl0IGFsc28gbG9v
a3MgdGhpcyBwYXRjaCBkZXNlcnZlcyBhICJGaXhlczoiIHRhZywNCnBvaW50aW5nIHRvIHRoZSBw
YXRjaCB0aGF0IGNyZWF0ZWQgdGhlIG1lc3MuIEVpdGhlciB0aGUgb3JpZ2luYWwNCnBhdGNoIGlm
IGl0IGFscmVhZHkgaW50cm9kdWNlZCBsaWtlIHRoaXMsIG9yIHRvIHRoZSBwYXRjaCB0aGF0DQp0
cmFuc2Zvcm1lZCB0aGlzIGZ1bmN0aW9uIGluIHN0YXRpYy4gZ2l0IGJsYW1lIHRvIGZpbmQgdGhl
IGN1bHByaXQgb3V0Lg0KDQpXaXRoIHRoZSBjb21taXQgbXNnIGZpeGVkIGFzIGFib3ZlIEkgd2ls
bCBhZGQgbXkgcnYtYiB3aGlsZSBtZXJnaW5nIGl0Lg0KDQo+IA0KPiBMaW5rOiBodHRwczovL2J1
Z3ppbGxhLm9wZW5hbm9saXMuY24vc2hvd19idWcuY2dpP2lkPTM0MTQNCj4gUmVwb3J0ZWQtYnk6
IEFiYWNpIFJvYm90IDxhYmFjaUBsaW51eC5hbGliYWJhLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
SmlhcGVuZyBDaG9uZyA8amlhcGVuZy5jaG9uZ0BsaW51eC5hbGliYWJhLmNvbT4NCj4gLS0tDQo+
IENoYW5nZXMgaW4gdjI6DQo+IMKgIC1SZW1vdmUgdGhlIGNvbW1lbnQgYmxvY2suDQo+IA0KPiDC
oGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19od2NvbmZpZy5jIHwgNiAtLS0t
LS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfaHdjb25maWcuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19od2NvbmZpZy5jDQo+IGluZGV4IDQ3
ODFmY2NjMjY4Ny4uNTU1OWQzOTg4MWVlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC91Yy9pbnRlbF9ndWNfaHdjb25maWcuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC91Yy9pbnRlbF9ndWNfaHdjb25maWcuYw0KPiBAQCAtMTAyLDEyICsxMDIsNiBAQCBz
dGF0aWMgYm9vbCBoYXNfdGFibGUoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUNCj4gKmk5MTUpDQo+
IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZmFsc2U7DQo+IMKgfQ0KPiDCoA0KPiAtLyoqDQo+IC0g
KiBpbnRlbF9ndWNfaHdjb25maWdfaW5pdCAtIEluaXRpYWxpemUgdGhlIEhXQ29uZmlnDQo+IC0g
Kg0KPiAtICogUmV0cmlldmUgdGhlIEhXQ29uZmlnIHRhYmxlIGZyb20gdGhlIEd1QyBhbmQgc2F2
ZSBpdCBsb2NhbGx5Lg0KPiAtICogSXQgY2FuIHRoZW4gYmUgcXVlcmllZCBvbiBkZW1hbmQgYnkg
b3RoZXIgdXNlcnMgbGF0ZXIgb24uDQo+IC0gKi8NCj4gwqBzdGF0aWMgaW50IGd1Y19od2NvbmZp
Z19pbml0KHN0cnVjdCBpbnRlbF9ndCAqZ3QpDQo+IMKgew0KPiDCoMKgwqDCoMKgwqDCoMKgc3Ry
dWN0IGludGVsX2h3Y29uZmlnICpod2NvbmZpZyA9ICZndC0+aW5mby5od2NvbmZpZzsNCg0K
