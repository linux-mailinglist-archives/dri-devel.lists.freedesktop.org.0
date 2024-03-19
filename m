Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F73187F97E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 09:23:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E6310F68D;
	Tue, 19 Mar 2024 08:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.b="WT++PErI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Tue, 19 Mar 2024 04:07:49 UTC
Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com
 [68.232.159.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879CB10E41C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 04:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1710821269; x=1742357269;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HOav4htRFpyN8xHPpncWE8WGOWcgxUTR3m9ZVVLHeP4=;
 b=WT++PErIxKOi11NWPmNA9gBKFr+0TEvvE1nouSZoCRSNdmCjjMO7JJTN
 aZHigJjKQG+UcLxl9L0fcShQqiwFVQR7Y4UZRQMZ2+CCb4qcpOIjmc/AD
 ewV3cV55rkIN/+cKvf4zkYXDRWsGspz8cEsNGqYX+oyI7yZUnCnFjPWYZ
 dDxbIPVQ5I0IbVqwLwdHWxDmojuXiG09PzdU5XCipRnT8bYLKWG30w83Q
 R+lZUO/uWOwkugzN7xXo6DJ9KNQO+hYaYjQVg7vu96sn/jb/I1W/n4Pns
 uCrih56xHWtgXjUlpQObdn3pJCaIZW2dGC9DZWgQAeClIWCVTpnFcInm5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="114714800"
X-IronPort-AV: E=Sophos;i="6.07,135,1708354800"; d="scan'208";a="114714800"
Received: from mail-os0jpn01lp2104.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.104])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 13:00:33 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcNlOjZNg7hsjnDSEtJJ1FD2sr4EE1Q854EjO/qdmN2QWO+fGjn8OEGrpCKKD5tYpso04BM+mAi2v2/P7CXc/DrdQU4caxQ+NWi8XCAw8s+w9MBQuSf6krE+wDrgeP8fZE////RMCo3oMhVmY1KMIM2D65KjYv3Z7mEI7JAvGFtmAxszyiV/SuqvsoDTkL85gfQ67euDzOFG8vB1A/zA6eo0HZhzHCpL7ntDf0aaEkX2mqDIlmN3Cx9Dn7lT9/OJNk13L8gV32sOoAXBFXRvDiLODO98fZ7WVte4hAt3ujsX182oyTOnUdpXChrj0UETQIQmRmire8f0nXeBMdOEQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOav4htRFpyN8xHPpncWE8WGOWcgxUTR3m9ZVVLHeP4=;
 b=nj7U1112qedCGyefNAxUbeSyianeQj36D8M+MxBVcBT4e48QrcJrfCpH+PRAQN7XfUZMv6qL/zEzDS/4j37KSjqC+TFrgb0a517t/n6yT3b0HEn8Un9x5AowUowOwzZpXplKCetiznf7MRh40HbjPps6mRpK2y/km/xNHsAibfkmZickm9CIZZ/hVUnh3p4qj1OsOy6WDx+OGhCPTxTygUoOnXr8Ob/Tnfrnbp8uvPkH/7u3D3i+uoZ8VtY/QWcnEbMQ8/J1DEuc8wJoUlkZ1ktlR1nEIhsOZ0s+9Oy0LTp1uE76Mo6MZbVslDOFx6fzYcXqQZzhlczmO+1boad14g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYAPR01MB5818.jpnprd01.prod.outlook.com
 (2603:1096:404:8059::10) by TYWPR01MB8479.jpnprd01.prod.outlook.com
 (2603:1096:400:174::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Tue, 19 Mar
 2024 04:00:30 +0000
Received: from TYAPR01MB5818.jpnprd01.prod.outlook.com
 ([fe80::c52a:473a:a14f:7f0e]) by TYAPR01MB5818.jpnprd01.prod.outlook.com
 ([fe80::c52a:473a:a14f:7f0e%3]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 04:00:30 +0000
From: "Zhijian Li (Fujitsu)" <lizhijian@fujitsu.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Helge Deller
 <deller@gmx.de>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm,fbdev: td043mtea1: Convert sprintf() family to
 sysfs_emit() family
Thread-Topic: [PATCH] drm,fbdev: td043mtea1: Convert sprintf() family to
 sysfs_emit() family
Thread-Index: AQHaea+VGVvcfa54F06u5KyxHIAVcLE+cJSA
Date: Tue, 19 Mar 2024 04:00:30 +0000
Message-ID: <6ea07a1e-39ca-42d8-85fe-a03f388a8d2e@fujitsu.com>
References: <20240319034310.1574349-1-lizhijian@fujitsu.com>
In-Reply-To: <20240319034310.1574349-1-lizhijian@fujitsu.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYAPR01MB5818:EE_|TYWPR01MB8479:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vyLjDdCi9cfca6gHQhP77DU5/DIUdp4PMKv/vxqfv8sHokXW1lB41nfZP5SzfYzBZLLiq6dOhVSh4eqMuyXfkljF4ns0Y6Rm5CmHLwtLTLwZIeUPJaQauAT90mgizVkf5srfITG9DCIZ+bDCi6KXAn9a/jJ7M3fB+VMAmdpi7kyiEbqapBwKjVsg92fpSu0pQEZHgAib8pWlJJnhIPZhZk+cp0pORnQsTdCG98HrS7LZo7+djZTjCF3DqliOJjl/HMCExSt0JPX14w45b/tg6uLKwffzFANMHuaVxXT9kWuo9hYv1FN/P4TK1I41XkLfdfvmg5t7pitS+BY4/UdfqWX2TOAXG8PTTsyumXkHAy7WQg6ZjKhWxIKqUNCH1IjQtgLjBEly/CnTTvJNb34k81+PsgcbqEteo9kyVpF58cNUQyHdpbLM/XaofEgqgjy46DM1ARY39aLzak8G3yQeV+Z3sakV0VOdO0cx0xic2Qg8t1pzD8EfBAmJDxFH4TCXFOafnbTnWTKfnR+4GNprfdaV7k3Pe4lFr0Sylyu0HrGmbqLRVQxwmdh0hxuHLN/mtzUNscsRY8KgRtpOq7caT25BMzpoSs+4RMtJaPjIWYALtC/qX9ypdjix/Up+ToiQwsOtCN4PuaN4UPtTaQWopZ0Za5ppmIbf9KcSb+uoiAnqUIrZK75xVtWDqObNFe1CCtpsGclwBI7+G3gjmnmIiw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYAPR01MB5818.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(366007)(376005)(1580799018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cnZMTysvMDF0UVJCVVhmMEdvNEFXUkZmUE5iMnB1MVN3SGlaQWNldkNVcG9K?=
 =?utf-8?B?WHJjWmRGekNnVTF2R2tKaFU1QjY4bDJoUUpNSS9VdVdiWjRZampsR1BBcHFP?=
 =?utf-8?B?SmdiRzlGd3IxUFk4RU95T1FZYnRmS3FRWEhJcXIzQW5VN1IxVnAvZzNGbHlI?=
 =?utf-8?B?VjRYTHluaDJiRTlqc3pvbHFtR2t5UW1FU05UTm9SbGtackRocVAxS1pWWXM4?=
 =?utf-8?B?UStRRno0OEpZZ3BkRmxYVExBWlJDQUJWc2poUjByWjl3M2NsaUFmL1BLOHFZ?=
 =?utf-8?B?S3luTzJXcW5mUzFmL0ZUeTVlem43Vzh3QlJ1ZDhMMFpwbUJaZTNWa2Y2WU9n?=
 =?utf-8?B?d0N4UkJta0tRMGRLenF6SDRkUS9NUjA2U29wK1Izb3hNOGhBUjl1RGhvR3ht?=
 =?utf-8?B?M1RYWDdjTnNweXJOcjhMYmZ5VE9KNXhBNUVTbEUrbC9QQ3RHV3I2N0QzdTM0?=
 =?utf-8?B?K1hUdGRHUEEweHV4WmR6ZkRTd0NiVnhPdEJPUWhZMmJacUxhM216QytwVFl0?=
 =?utf-8?B?amZLeEgwQ0VFMC9BOHRlc3VqOFltRGFpMDd0TGhyelhaenBQam5oSGxaQTdn?=
 =?utf-8?B?Z0pDM3dSZm9PY3lMdkJZZElUTC9IcUU2RlJSNmpXU0hZeUtxb3JQc2NsbzNu?=
 =?utf-8?B?RURudzhodHppUi9hMlVXN2d5eTFtRTNFWnZ5QUJRWkVla1A4TnpNZDlGYU5v?=
 =?utf-8?B?WTVpdGdiWm9oQ3dINW05Y2p4SGhFMWIyakR1ZWpXVnNtdlQ2T2FCRHIyOHA1?=
 =?utf-8?B?cHBBZk9DL0xSWXF2b0xkUS85NHdBblhybGZiazFvQ3Y3TU1OOTdVQmFVdFpO?=
 =?utf-8?B?OG85R0NiaWFvcHFoOGJLeW9pNnlYUHR0ZWQ5N3ZDZXJiWmtzTTVVSmVIcUdk?=
 =?utf-8?B?bGtqRStVYnllbzlJUnF5aW5ObjV6anNLTEw4Yndqa1NKOW5ia3BmYWNzd0NO?=
 =?utf-8?B?bThVY2d4amo5SlRLWTlGM0Jub0RLTlQ3cko3d0pRN09JcFg4blhKT1ZsY0k2?=
 =?utf-8?B?RE1ScFErdjYzeEZxMEtteWdMNE1lelpzdHBaUVk2S1JjWVdSd3kwOVhZMitK?=
 =?utf-8?B?V1lGQWs4ckFUZm9YN1h1RmxIQVlPVWY1ekZkcUFSR2pObTFGZFlnbkxQQmp3?=
 =?utf-8?B?RG04anlaZHdYeS9YNEcvWm95VWJ5VHRRcGx6RGM4d3JlVmdKeWxkQTM0TUpQ?=
 =?utf-8?B?TXdjTVZLbEp4d3hlNDFXYnFvUWM5ZFhia1ZSOWhjZ0NmSmJnQU52TVdRMUw3?=
 =?utf-8?B?T2lNRTFOWTJLaVJlYklSbzc0UllqZExHcE9oWXRKc3JlK1dDWnpLV01vVzM3?=
 =?utf-8?B?akxBOGpLYW1zUHdBYW5LeS9DWjJ2aElqWVBJYTcraW1ya3NWYlBZTTJBbkR2?=
 =?utf-8?B?K0RrTzI0UmNHZTZVQ0NHSEZMOUtnNHZNZzZMVWpTVitlVmw3OVpRNTFhSDVV?=
 =?utf-8?B?SDZjRjk5WjZIRlJSNVlqc0QwTUs2VHZwR3FuM252cEVCbnd4TDZHNXdrK0V6?=
 =?utf-8?B?OWpNR0xiTk5SMkFEUFNUVC8rS2ViL2dQNUl3MUErdThmSDhWWnFSMmxiK3V0?=
 =?utf-8?B?NER0cXZMM0xlNTZ4UVNTVkFxV3ZraTZiWERhNktNQ2RJbW5Rb21jc2VxYjNE?=
 =?utf-8?B?cjA5dHhDZ3lBL05KRXdlMjY1VUNvNjhVVzFWUTBJbFlSeUtYN1pJcng1bkp1?=
 =?utf-8?B?c25aOTFtaHhKNUhhVzFmN0NCa0tyUmJUUXRJRGVFdDNCSlIyM3dENmZoWUxt?=
 =?utf-8?B?cVFObHF4VUlqak9XVlBjek5yTU9HVGJyaWJQUVdyMU5jYU5KUWx3ZFRvZUVQ?=
 =?utf-8?B?aG9yNnZYaFpYWWtpWFlUc2prTjR5b2pDODJ6ZEg5aUJrNnFwMFRlMGI5RDFZ?=
 =?utf-8?B?citOekFEenB5Z2s5RWRKZjVvQm0yNUdMcUZXb1lHd05keHJFVW9qUjZNbnVU?=
 =?utf-8?B?WnlMOXA2YkRJUm5keGFxR3Rmbi9YY2cxQ1ZudmFLZEhzT04xRk5mWnlQTi9o?=
 =?utf-8?B?S2h0Y0FjOEc0U2hwMVFVeHVIbHlrRVVodUUzSVcvOW9RNTZCZzdGUkY0WjJu?=
 =?utf-8?B?L3Q2cVp5bUhVZkZvUHB5dUpZN1hKZWpNeFdhWXFTb3B4UTcwOC9vK0Z4enBl?=
 =?utf-8?B?U1gxanA0SEpYM00wN0N6M2RwcUFLbk9MYTFpc3FKck5STFI2eXdqT094eXRs?=
 =?utf-8?B?bUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F86E7AEB0A07948A90C92B7E3666436@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 2MTbTOXkiBt1x5Kbsc9RYaAnOI1tZqCJrjZyd6HuZhmZDZCGTJqsRhO3vMkDHb/rwzz1VaiHzWuH1qaGLkeeir7JAFIljNGY9Ca2xMDJJNHrhf+iqd4HxRGKcEJbU/pqJAfQcwXzwykCZR0gKTrTA/MTmz97Enxrs5aS1tXn1j7aXUnwM4S/zuA5eNbOy1mW7pUulhe7GE+r+YB6LuNXk/VS2fDWwcD6kHCGEiWVX/WEdNkf7B85FuvQx1+OedlAYWur2SXzr2UHnN6aR2JvXGSDHwKu5v6pfagB2TZSMV8RfnWycR/13YMdgbS47UqiilRN0q3UHBlgRIEB6LrPDFa3XajQvCkwjN6iWlsEsPDTbZxPkpNM7vrKWwv0juBoFnYdTockM0Hmwl3KPOBQ10IMdQj+YzP/MKPNSQyKn0IOwLwOtwxN0ObsmSk8wLvj69O1LQE2YOXLGW+8GdOUGv78MKmSKSlQVB6NEyK/xrnrKVqjayWwr4bupoCi37lyHOC9Q7rxHxqSqrxMwUV/EopWrGQyQVoWVpVyLym1nlxGc5fXDbKUPx7u9NjRt5h0d3yA0y2Av75/olNWB/dS6+W3uvb/YKw2ik9iVy34vAT0qc0IaudtOULKwEpIMZfb
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR01MB5818.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 602e4ae1-5bdb-4ef8-b1f9-08dc47c91e57
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 04:00:30.2794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +PhTsqUNVYYyyFIyp5Z3YY8btB+OjgXS2uupITwncXHQpAaLsHYqQQXxnxqWb9zrKDLWhsoXZMYK0AQ6U9W1Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8479
X-Mailman-Approved-At: Tue, 19 Mar 2024 08:23:06 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDE5LzAzLzIwMjQgMTE6NDMsIExpIFpoaWppYW4gd3JvdGU6DQo+IGRpZmYgLS1naXQN
Cj4gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9wYW5lbC10cG8t
dGQwNDNtdGVhMS5jDQo+IGIvZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZGlzcGxh
eXMvcGFuZWwtdHBvLXRkMDQzbXRlYTEuYw0KPiBpbmRleCA0Nzc3ODljZmY4ZTAuLjA0MGExN2Ew
NWJhYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZGlz
cGxheXMvcGFuZWwtdHBvLXRkMDQzbXRlYTEuYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L29tYXAyL29tYXBmYi9kaXNwbGF5cy9wYW5lbC10cG8tdGQwNDNtdGVhMS5jDQo+IEBAIC0yMjgs
MTQgKzIyOCwxMCBAQCBzdGF0aWMgc3NpemVfdCB0cG9fdGQwNDNfZ2FtbWFfc2hvdyhzdHJ1Y3Qg
ZGV2aWNlDQo+ICpkZXYsDQo+ICAgCWludCByZXQ7DQo+ICAgCWludCBpOw0KPiAgIA0KPiAtCWZv
ciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGRkYXRhLT5nYW1tYSk7IGkrKykgew0KPiAtCQlyZXQg
PSBzbnByaW50ZihidWYgKyBsZW4sIFBBR0VfU0laRSAtIGxlbiwgIiV1ICIsDQo+IC0JCQkJZGRh
dGEtPmdhbW1hW2ldKTsNCj4gLQkJaWYgKHJldCA8IDApDQo+IC0JCQlyZXR1cm4gcmV0Ow0KPiAt
CQlsZW4gKz0gcmV0Ow0KPiAtCX0NCj4gLQlidWZbbGVuIC0gMV0gPSAnXG4nOw0KPiArCWZvciAo
aSA9IDA7IGkgPCBBUlJBWV9TSVpFKGRkYXRhLT5nYW1tYSk7IGkrKykNCj4gKwkJbGVuID0gc3lz
ZnNfZW1pdF9hdChidWYsIGxlbiwgIiV1ICIsIGRkYXRhLT5nYW1tYVtpXSk7DQoNCkl0IHNob3Vs
ZCBiZQ0KCQlsZW4gKz0gc3lzZnNfZW1pdF9hdChidWYsIGxlbiwgIiV1ICIsIGRkYXRhLT5nYW1t
YVtpXSk7DQoNCmp1c3QgcG9zdGVkIFYyIHRvIGZpeCB0aGlzLg0KDQoNClRoYW5rcw0KWmhpamlh
bg0KDQo+ICsJaWYgKGxlbikNCj4gKwkJYnVmW2xlbiAtIDFdID0gJ1xuJzsNCj4gICA=
