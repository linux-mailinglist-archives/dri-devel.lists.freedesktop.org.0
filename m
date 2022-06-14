Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9568A54B4CA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 17:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED856112735;
	Tue, 14 Jun 2022 15:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC745112735;
 Tue, 14 Jun 2022 15:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655220917; x=1686756917;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=pz7OTfgQTfDGR9CguN0XPn7YtjtXAYShCyupEsSHlis=;
 b=S3Y4xxrwxmtU/2OjboZpCdhWi1xs+YQJ9S3oQFFH9Z/8r2uBHLp4Yubn
 ICci8XooUey2m1RHocFgMQuuxg6fnPCOnoOBHCyCp8HD/dCHAt9dxddba
 QBi8N+l8adP1U4bflKqAFvnu94aS0ocJt4+jOB0rbjLp7Qfy1j/f63+z6
 muLUbw2uzqZTBMV1uEoX0DDTBLyzF0fBP8jbpW+5hIvaacBnB6NRBq3Ql
 t65aDKb6hQhNOu7n8XAKZGIXiLkv7qsoDjAvrVQBY+WejD8A1urqgV2ex
 Uw/AM9gCwM8+oLRBPP2Y3q0HKFo1ZjzF2bUdH9kbKVi0V5B5Qzc6cx9KS A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="277439615"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="277439615"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 08:35:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="652102505"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga004.fm.intel.com with ESMTP; 14 Jun 2022 08:35:17 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 14 Jun 2022 08:35:16 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 14 Jun 2022 08:35:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 14 Jun 2022 08:35:16 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 14 Jun 2022 08:35:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6PrE33yioa5EDR71vzTLlfp/5G9TrtDOsLe8QK5xG8d34h4ir8CDkgJNtYE7NcvoXVMqOm18cpuNts5+8hzdeU61+lZWgT28ntNICEvul9i3o+DhpCqY+jS9GN1EvGSI5Wx1hjIY+kR6zI/0icIhEC/W+FlRFMR+iuQUJBbTshvC5a3rvNEQMcVpfJhWHB7daYdVKj7/6SmYv3GgIh9YIXnWiig79GJ5a4nB1T48g/juBu9GtBYwgNnT5WG9lgpGNKVSBqLZxtUwl3hvx16lTNphTToO4cbRM2mr1rF7astvrl6wkti9RM6OnjA+dY2zpMJ9teCFhZhxBrTaRf6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pz7OTfgQTfDGR9CguN0XPn7YtjtXAYShCyupEsSHlis=;
 b=AQ5OT5pNItRLkbx52skFXh0j5K+sdpC1s3N6FZLPs281H+VMlDrO6ClOVh1MILTCuNiKzAVUGHmRYAnK5mD9uefUgvwAI/ThsIvlHbj12Ry3+j1ArU4Aw4UIOu0KvgeNpIU0vZyBMmXJOLxCANUmgn1l97Er8vYMWlueYF1p4eaZr0vKwhhG3cPxY13eUDVI3z3mvCRrzYJhLrRGUQS29SC+PdJQe6Ma/NKDG4EUBd7GF1JIOBfjKnC+VHTzEljRYaaaPaDVGDsV709OiEpCbfRI/yfBIm8y+5F0EK6+epCN/xUCfLbpSz0bUC1qKm9BEWvCnCVoUm4h13n2EE1gxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BL0PR11MB3171.namprd11.prod.outlook.com (2603:10b6:208:62::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12; Tue, 14 Jun 2022 15:34:59 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::61bd:a251:1543:93d7]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::61bd:a251:1543:93d7%5]) with mapi id 15.20.5332.023; Tue, 14 Jun 2022
 15:34:59 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Check ctx while waiting for
 response
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/guc: Check ctx while waiting for
 response
Thread-Index: AQHYdqVQk1+fUItLJk2o9+HAOcjZDa1PG3qA
Date: Tue, 14 Jun 2022 15:34:59 +0000
Message-ID: <987fa3d7ae7e494b65dd7e017c4c20a1c9f72fd4.camel@intel.com>
References: <20220602172119.96324-1-zhanjun.dong@intel.com>
In-Reply-To: <20220602172119.96324-1-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f8cf420-1c11-4892-4186-08da4e1b7149
x-ms-traffictypediagnostic: BL0PR11MB3171:EE_
x-microsoft-antispam-prvs: <BL0PR11MB3171EA5F271817EDA00084AE8AAA9@BL0PR11MB3171.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p2AviWhZ62H6+3Q1qf2mJYqedNCs5Bo8CdezXtCBhR0EekZc/mfiPMJHOaTlBe8ACm2GorTv07yGZnBSXkE8o9Zczs55dDPKvBtjHKrsQUHNzo/K7M8nRJONgk71DZ4hwvXTsWWwpexnv15eNQSUL43gIVhKawnt1hFQsxkA2/TciB4BrS9EW8A1/eRA/lFVJ3qD8hF9tihNxjkdMcqSYkrbKTuzMfv53dPCKY4KG8Xs6nleo7AVzdC7VP5uKyXJ8r+ilNPpOJl1nawW9toa01lPDlJ1eQPOGsu8oa/S9BuYZMMqf6o2BFlXfqMXMlAwZxhsamgY7HNaHoCJzZ4eVeABXuUwWHHgMck5lmjD+9FuYMgRW9Cmf7MF3NnZnrKiE4wOW948xtt+rqOPte0M5Ane7psjXA0VMoSeDQbi7lqRmy9MM4LAX2B0yMei6DhIRyuu6LPjl6Tm9zzoygoLaIMUFpczFMKTgCJ7G/x7pAbjDP4EzreFd1N2jcXnjOXPs6zU/cqieqQUgE5iRNvZpk7w8DbLvpHAAgZbevWySfo7t4Ec/wHUuIsEisBzEimFBNITtVjMS/cFCpO9mABqzbfcB23tx/cIewVtPq1x1w3lkxl07bFBejVml1XGJeZqO7IKcubj6zdXOBXp9FEWg7B38B17uZKybdIJCFDDbCSvhwlq/V6UPx6kriEHlZ+rqPToJ20Zn6RfUFsfU3aue4QoGucnVvlVs3oDeEJnAoJ2qLp2fcwoq4X5yKhf1Zx8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(2906002)(5660300002)(36756003)(38070700005)(6506007)(86362001)(38100700002)(82960400001)(26005)(110136005)(122000001)(6512007)(83380400001)(508600001)(6486002)(2616005)(71200400001)(64756008)(66476007)(450100002)(66556008)(66446008)(186003)(76116006)(8936002)(66946007)(8676002)(91956017)(316002)(69900200002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnhPbkNjQ2NCOUo0TyttTFJEV0Q0NjFUTFo5V3R3dnJyRWlXRUp6SlNPUUZo?=
 =?utf-8?B?ZFc2eU10aE9VV0FqZE5XemtPZytxQXQxWlExYzZyeS9IVGZlOUtNZ1dnbkx3?=
 =?utf-8?B?RmsrT3FEalBEcHdSSjBFNDJzZ21WTmREOVMzd0g3TG5JK1lJSlU1Q1dWVE1P?=
 =?utf-8?B?OFRLZXJ0aWUwTng5amNaaHlCR0NhSWxpZGUrVVlGYktpc2JsYjZqMklIUW50?=
 =?utf-8?B?TVYzVW9aeTZHNTJhNUNWRGd0RDdRWDQ3dGVQTlo5Rm85SzNSY2pIWW01RFRZ?=
 =?utf-8?B?U0xzU0dWa013UkVsb2FNdGdFbFU3N3h0bFpUajdyNnBRV01qVGhQRkZ3eDVY?=
 =?utf-8?B?SElWQ0tUYllpUXI2aVl2Ry9pM1FFcmM4UitpOUhBUDcrZEJHOWw0Y0pzMUNh?=
 =?utf-8?B?K0czczJHNXMyQjhiSnpJS1ZZekZWNk4vWWtRZE5zYjNYbWFMZXZLbUh1a1J5?=
 =?utf-8?B?dWJlOUpCKzZkbEpxbS9FM1VLYUJxdFFQN283RkFORUFpS1loRjZORWZqMWI3?=
 =?utf-8?B?Ry96WUpQNXhrK2NDWTZNU2RLUkpWZTVPY1VDaDVHSmczKzk0cHMwSDVXY1Uv?=
 =?utf-8?B?aTF1aWd5T1BjUTFFRUtxMkROYTI5Mkk4WVJTenRwNFVvOFlBcXErRTlJVXQr?=
 =?utf-8?B?Z2VPZkZUM3VZa0Y1THV6TTdmcE9lNlRWTzkvSUlEVVkzbzlaNUNWeWhuREhu?=
 =?utf-8?B?LzdEb1ZJOFhtejFrR0ZSNUJ3NVk2ZmszejZkNXR6a3ptZDlZOGdrTHlqQlBj?=
 =?utf-8?B?ZjFMQWNPQXE1Y1AydTJLZHo3aXJtbFZsc3I0UlVKOXFiN2xUOTZuV2tXKzNm?=
 =?utf-8?B?NEFtdkZUeGZtTktiVEVOSE11TGtNQ25OQi84WjlLOFZ4dUkzcEpmaE1nakRQ?=
 =?utf-8?B?dkM3djJtcnFZeWhxQndQc1gwWHFMRnFRa2I5T2ovYmo3VDhabERtc1ZTTk5l?=
 =?utf-8?B?Rm1BMUFEck12NDlIM3plWDhZR2V2RlVxcXplWmVtMDAxdy9XYysybWNLYTBF?=
 =?utf-8?B?blJ3MTFNVnh4T3FpY1hQeVgzWFlzOEtmb2JGSWt4dkR3eXlkRkVwRzRVa2pr?=
 =?utf-8?B?RHJEMUFvbmZPT0cvcnF4UXJZWUl3OVFPY1IvYURRT2VLYmRuU1JoaWVSWVlI?=
 =?utf-8?B?MGRlWUY1THhTMVBzZ0FmRDY0aDRyRi9vdU5CNm5oWmdRMjZBU0FZaFNqVW1y?=
 =?utf-8?B?MzB2eXgveERpUjl6U2dDMUljQUh5RG1SMVFiRy9xR3dyR3JBbnUrNmd1UmUr?=
 =?utf-8?B?UngyeHNyWndZeHplKzVKSGxLQ3VKOVp5dGxpQ09pTmdCUVUxSEFEQUlIaXli?=
 =?utf-8?B?Umd0U05lZURsUG5XbUc0cXh6MHNOUFdFZUMrNEJFOGZyWDFUK1o2elNsQnRM?=
 =?utf-8?B?dURMUXhkRFFRejhtdHpkVUFORkVYbUVwVFdGMmVkU0NtTTBRZmVpMnNMM3I2?=
 =?utf-8?B?anFkSmxjQXc2RTNTaXlHTlVjT284THZRQ01jelFCL2dpMUQxR29IZEZEWnJV?=
 =?utf-8?B?SjFvL2VmaVNPbUpTQVliUThmU2hVdlVHeDBtUFlvTzRKZDZMVWIwZXhSaTFZ?=
 =?utf-8?B?dnJkcW5xN0ZNVGFDZjg2T1RNcEJ5NnNWTnBqS1lFeFdPR3NTcGx0SFdheWxJ?=
 =?utf-8?B?SDlMTXBVR0NSRlJVWTlJdGVTMHEyRm05TW40U2RsenlxU2hOckdNV1F5Z0lp?=
 =?utf-8?B?RnMzSlRtWEwrR3lLV2dIYXc1ckUyRnVCTVgvTy85ekZXOEhuakZ3NDdxaUJu?=
 =?utf-8?B?dkhpTWdSVUtMSWFCMGRBVE04YmlpWWxHN2pkMkN4VFBOK2JvYlFYb290YnBi?=
 =?utf-8?B?REwrWjlaVUllS0J6azM0UnYzNmQ4Mnd3VldCSXFqRVpQcW9PdUUxbnVWVU9J?=
 =?utf-8?B?ZXRycnhyOUhXdGt2OU9zdS9NL056Y0Evc0V1aUlvZVhoTGR5RnJPOWxSS0k3?=
 =?utf-8?B?cmJTZDJ2L0hjK1BvT25zQjlIdEZmdmJPaTRrRUh4b25RbE1jVjM1N2s3Vm1C?=
 =?utf-8?B?bjM0SHVpUjJEbHJqekpzZG15ZDhCKzJwbWkxNjZHbzBaTDV5L1Q1SmN1TUs5?=
 =?utf-8?B?WElldmJ1LzFIQWdxWlQraXVZWVVOZlhtZHl5d3Q1dXM2UzNKYkZQOUsvNlAx?=
 =?utf-8?B?L2w3TUNNbEVycjJtOVNWcmkrZHVxZDl4MDExOFVwRk1GWHlOVFUyNU50dUZr?=
 =?utf-8?B?aXk5WmJ1SDFrcEt5bmEvZ3hnakMydGQzM3JBc05lMXhwV2RTNmdZN0NrQTNL?=
 =?utf-8?B?Wk9veGNhMW5ldTZVTW1FMUI4K1Yxcnh5TDQ0L3JSNGFVQXV1K0o5SVl3NnNT?=
 =?utf-8?B?Z25rRFIxWEJZc2w4RFBYeStFUVBqTmp5K2pBU2RvMGVNTHhtNlY3cm5xb3ox?=
 =?utf-8?Q?W57BAEHIktmsL28+bIM90AUfGaBs/6yAt5xuZi8Y5jHZX?=
x-ms-exchange-antispam-messagedata-1: nzYnQL3n85oX5g==
Content-Type: text/plain; charset="utf-8"
Content-ID: <33656C699AFC37429772DEE3675F497F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8cf420-1c11-4892-4186-08da4e1b7149
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 15:34:59.7587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9qGNrRE30YeLq8hrLgzDMDWZOM2N3udh0cWOqpzqQ+94yf62ZJYW/c7aF3v20QL2+PRmkS1iyj3CXljrl9mdxGGSnGfpgClXnMc+KIKK/7QGMv14JThR7lR53EtpI2K5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3171
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2FuJ3Qgc2VlIGFueXRoaW5nIHdyb25nIHdpdGggdGhpcy4NCkkgY29uc2lkZXIgdGhpcyBvbmx5
IGEgTklULCBzbyBmZWVsIDogbm90IHN1cmUgaWYgLUVDQU5DRUxMRUQgaXMgcmVmbGVjdGl2ZSBv
ZiB0aGUgImN0IHNlcnZpY2UgYmVpbmcgdGVtcG9yYXJpbHkgZG93biINCmFzIG9wcG9zZWQgdG8g
dGhlICJyZXF1ZXN0ZXIgY2FuY2VsbGluZyIuIFBlcmhhcHMgYSAtRVBJUEUgb3IgLUVBR0FJTiAo
aWYgd2UgZ290IHRoaXMgZmFyLCB3ZSBrbm93IHdlIGFyZSBwcm9iYWJseSBtaWQtDQpyZXNldCkg
Pz8gKGlmIG5vdCBhbHJlYWR5IHVzZWQgZWxzZXdoZXJlIGFsb25nIHRoaXMgY2FsbHN0YWNrKS4g
RWxzZSA6DQoNClJldmlld2VkLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxl
eGlzQGludGVsLmNvbT4NCg0KLi4uYWxhbg0KDQoNCk9uIFRodSwgMjAyMi0wNi0wMiBhdCAxMDoy
MSAtMDcwMCwgWmhhbmp1biBEb25nIHdyb3RlOg0KPiBXZSBhcmUgc2VlaW5nIGVycm9yIG1lc3Nh
Z2Ugb2YgIk5vIHJlc3BvbnNlIGZvciByZXF1ZXN0Ii4gU29tZSBjYXNlcyBoYXBwZW5lZA0KPiB3
aGlsZSB3YWl0aW5nIGZvciByZXNwb25zZSBhbmQgcmVzZXQvc3VzcGVuZCBhY3Rpb24gd2FzIHRy
aWdnZXJlZC4gSW4gdGhpcw0KPiBjYXNlLCBubyByZXNwb25zZSBpcyBub3QgYW4gZXJyb3IsIGFj
dGl2ZSByZXF1ZXN0cyB3aWxsIGJlIGNhbmNlbGxlZC4NCj4gDQo+IFRoaXMgcGF0Y2ggd2lsbCBo
YW5kbGUgdGhpcyBjb25kaXRpb24gYW5kIGNoYW5nZSB0aGUgZXJyb3IgbWVzc2FnZSBpbnRvDQo+
IGRlYnVnIG1lc3NhZ2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaaGFuanVuIERvbmcgPHpoYW5q
dW4uZG9uZ0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMv
aW50ZWxfZ3VjX2N0LmMgfCAyMSArKysrKysrKysrKysrKy0tLS0tLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19jdC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2N0LmMNCj4gaW5kZXggZjAxMzI1Y2QxYjYyLi5hMzBh
Mzg4ODc3ZTIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVs
X2d1Y19jdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19j
dC5jDQo+IEBAIC00NjcsNyArNDY3LDcgQEAgc3RhdGljIGludCBjdF93cml0ZShzdHJ1Y3QgaW50
ZWxfZ3VjX2N0ICpjdCwNCj4gICAqICoJMCByZXNwb25zZSByZWNlaXZlZCAoc3RhdHVzIGlzIHZh
bGlkKQ0KPiAgICogKgktRVRJTUVET1VUIG5vIHJlc3BvbnNlIHdpdGhpbiBoYXJkY29kZWQgdGlt
ZW91dA0KPiAgICovDQo+IC1zdGF0aWMgaW50IHdhaXRfZm9yX2N0X3JlcXVlc3RfdXBkYXRlKHN0
cnVjdCBjdF9yZXF1ZXN0ICpyZXEsIHUzMiAqc3RhdHVzKQ0KPiArc3RhdGljIGludCB3YWl0X2Zv
cl9jdF9yZXF1ZXN0X3VwZGF0ZShzdHJ1Y3QgY3RfcmVxdWVzdCAqcmVxLCB1MzIgKnN0YXR1cywg
c3RydWN0IGludGVsX2d1Y19jdCAqY3QpDQo+ICB7DQo+ICAJaW50IGVycjsNCj4gIA0KPiBAQCAt
NDgxLDEyICs0ODEsMTQgQEAgc3RhdGljIGludCB3YWl0X2Zvcl9jdF9yZXF1ZXN0X3VwZGF0ZShz
dHJ1Y3QgY3RfcmVxdWVzdCAqcmVxLCB1MzIgKnN0YXR1cykNCj4gICNkZWZpbmUgR1VDX0NUQl9S
RVNQT05TRV9USU1FT1VUX1NIT1JUX01TIDEwDQo+ICAjZGVmaW5lIEdVQ19DVEJfUkVTUE9OU0Vf
VElNRU9VVF9MT05HX01TIDEwMDANCj4gICNkZWZpbmUgZG9uZSBcDQo+IC0JKEZJRUxEX0dFVChH
VUNfSFhHX01TR18wX09SSUdJTiwgUkVBRF9PTkNFKHJlcS0+c3RhdHVzKSkgPT0gXA0KPiArCSgh
aW50ZWxfZ3VjX2N0X2VuYWJsZWQoY3QpIHx8IEZJRUxEX0dFVChHVUNfSFhHX01TR18wX09SSUdJ
TiwgUkVBRF9PTkNFKHJlcS0+c3RhdHVzKSkgPT0gXA0KPiAgCSBHVUNfSFhHX09SSUdJTl9HVUMp
DQo+ICAJZXJyID0gd2FpdF9mb3JfdXMoZG9uZSwgR1VDX0NUQl9SRVNQT05TRV9USU1FT1VUX1NI
T1JUX01TKTsNCj4gIAlpZiAoZXJyKQ0KPiAgCQllcnIgPSB3YWl0X2Zvcihkb25lLCBHVUNfQ1RC
X1JFU1BPTlNFX1RJTUVPVVRfTE9OR19NUyk7DQo+ICAjdW5kZWYgZG9uZQ0KPiArCWlmICghaW50
ZWxfZ3VjX2N0X2VuYWJsZWQoY3QpKQ0KPiArCQllcnIgPSAtRUNBTkNFTEVEOw0KPiAgDQo+ICAJ
KnN0YXR1cyA9IHJlcS0+c3RhdHVzOw0KPiAgCXJldHVybiBlcnI7DQo+IEBAIC03MDMsMTEgKzcw
NSwxNSBAQCBzdGF0aWMgaW50IGN0X3NlbmQoc3RydWN0IGludGVsX2d1Y19jdCAqY3QsDQo+ICAN
Cj4gIAlpbnRlbF9ndWNfbm90aWZ5KGN0X3RvX2d1YyhjdCkpOw0KPiAgDQo+IC0JZXJyID0gd2Fp
dF9mb3JfY3RfcmVxdWVzdF91cGRhdGUoJnJlcXVlc3QsIHN0YXR1cyk7DQo+ICsJZXJyID0gd2Fp
dF9mb3JfY3RfcmVxdWVzdF91cGRhdGUoJnJlcXVlc3QsIHN0YXR1cywgY3QpOw0KPiAgCWcyaF9y
ZWxlYXNlX3NwYWNlKGN0LCBHVUNfQ1RCX0hYR19NU0dfTUFYX0xFTik7DQo+ICAJaWYgKHVubGlr
ZWx5KGVycikpIHsNCj4gLQkJQ1RfRVJST1IoY3QsICJObyByZXNwb25zZSBmb3IgcmVxdWVzdCAl
I3ggKGZlbmNlICV1KVxuIiwNCj4gLQkJCSBhY3Rpb25bMF0sIHJlcXVlc3QuZmVuY2UpOw0KPiAr
CQlpZiAodW5saWtlbHkoZXJyID09IEVDQU5DRUxFRCkpDQo+ICsJCQlDVF9ERUJVRyhjdCwgIlJl
cXVlc3QgJSN4IChmZW5jZSAldSkgY2FuY2VsbGVkIGFzIENUQiBpcyBkaXNhYmxlZFxuIiwNCj4g
KwkJCQlhY3Rpb25bMF0sIHJlcXVlc3QuZmVuY2UpOw0KPiArCQllbHNlDQo+ICsJCQlDVF9FUlJP
UihjdCwgIk5vIHJlc3BvbnNlIGZvciByZXF1ZXN0ICUjeCAoZmVuY2UgJXUpXG4iLA0KPiArCQkJ
CWFjdGlvblswXSwgcmVxdWVzdC5mZW5jZSk7DQo+ICAJCWdvdG8gdW5saW5rOw0KPiAgCX0NCj4g
IA0KPiBAQCAtNzcxLDggKzc3Nyw5IEBAIGludCBpbnRlbF9ndWNfY3Rfc2VuZChzdHJ1Y3QgaW50
ZWxfZ3VjX2N0ICpjdCwgY29uc3QgdTMyICphY3Rpb24sIHUzMiBsZW4sDQo+ICANCj4gIAlyZXQg
PSBjdF9zZW5kKGN0LCBhY3Rpb24sIGxlbiwgcmVzcG9uc2VfYnVmLCByZXNwb25zZV9idWZfc2l6
ZSwgJnN0YXR1cyk7DQo+ICAJaWYgKHVubGlrZWx5KHJldCA8IDApKSB7DQo+IC0JCUNUX0VSUk9S
KGN0LCAiU2VuZGluZyBhY3Rpb24gJSN4IGZhaWxlZCAoJXBlKSBzdGF0dXM9JSNYXG4iLA0KPiAt
CQkJIGFjdGlvblswXSwgRVJSX1BUUihyZXQpLCBzdGF0dXMpOw0KPiArCQlpZiAobGlrZWx5KHJl
dCAhPSBFQ0FOQ0VMRUQpKQ0KPiArCQkJQ1RfRVJST1IoY3QsICJTZW5kaW5nIGFjdGlvbiAlI3gg
ZmFpbGVkICglcGUpIHN0YXR1cz0lI1hcbiIsDQo+ICsJCQkJYWN0aW9uWzBdLCBFUlJfUFRSKHJl
dCksIHN0YXR1cyk7DQo+ICAJfSBlbHNlIGlmICh1bmxpa2VseShyZXQpKSB7DQo+ICAJCUNUX0RF
QlVHKGN0LCAic2VuZCBhY3Rpb24gJSN4IHJldHVybmVkICVkICglI3gpXG4iLA0KPiAgCQkJIGFj
dGlvblswXSwgcmV0LCByZXQpOw0KPiAtLSANCj4gMi4zNi4wDQo+IA0KDQo=
