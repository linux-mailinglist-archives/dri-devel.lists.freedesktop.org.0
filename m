Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB4D6746DE
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 00:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6CA10E285;
	Thu, 19 Jan 2023 23:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21ED610E26C;
 Thu, 19 Jan 2023 23:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674169395; x=1705705395;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=c2aw+U5nunNbFb6VKIRebFkufH6WjnzYScYwwnExTmQ=;
 b=eIehTcwxpETZnSbwumHyKaIuWTvPUiWetbMGnG2BJ6kZmGLZO3C/by1O
 9MdGyUcWfBRGRQTq49v/jbRUVIRxgb/925zZ6bawcA/YVShWHuwridewJ
 VK4ll2bsgevTijidPhAxu7LkYW3SVbg9Ig2lns1mbsnkB5o4IWzSjRJbG
 C51EExzhMN9evolkHllgC3t78VkRf7+RCCEJxOp2hZs7me8mIUkYXCAjv
 x9mPqEy7It5LBgq77d4ahKvU24kTeYH0fEPaRr8/xgD9IcEL3tfHbEYHt
 jwgC8BMzv/FOqKrLiNXtdxz77i05v/OhsCegF2RCSOFYWSuqeLZLGrBGC Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305128166"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="305128166"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 15:01:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="989177919"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="989177919"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 19 Jan 2023 15:01:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 15:01:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 15:01:16 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 15:01:16 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 15:01:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULI7ukWQpf5EO2W4nt289QbyUm/SJmBYkX8E8wqozzJ6kRQd5PmrvHvU0gkg7rwnD+sQw0FNcl9GIrjDMXKLabVc/tjiuMhEufJkSo5VLb01JT8wEZ+zSY0LqxcfiYxunFAPgNm8WxrmAThj8/xuyYbNUyO/1Zye/Q2SixQUcs/z9Tu5SffA9DvFII9GAA62ElmVpKCVNcGr6dQm8E02+7WUZtdDyKhnNYcGG4FDG5NWyPBG0IWmVQNPf+vvqV3hwqerXkmvWjsD9MbRK/gh8kxgZmE9dwWY1ydbmQwdzM6oh9wVk5SVAiBRdONMo4zPurKkXqghqvixMy52UI01/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2aw+U5nunNbFb6VKIRebFkufH6WjnzYScYwwnExTmQ=;
 b=K6vaMxic9I3MsLTeRnr7Ng2/k+hjTIvKhUWZe0ud/55ulrs8+HSxgqfJeu2m7vxjfhslG6J+n3e4pJIHfCSKGGX/gLVSaK/6FqZjQ77oO5Go+jVJ2S93iz2rwabecfCRLSAhuKRkOzfvFPzwz/5vbwl00R7kyXZTFUaP+e1zxG+ncLKK/C2ikwwHx3iUyqVKi+U4YGSjDOxPfd9wXnQ4HeCCxA4N+budWsW+wBbrdj/lpOagErwEPXOyD4i9MMHRN6wGHM2Gl04WZegFGuaMUfn6fqfGSTedd8INjzhfIm6IioYIiXSZ+YJag8hqJeI7I2VCNyeC4Es9lBGyrfnzqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DS0PR11MB6446.namprd11.prod.outlook.com (2603:10b6:8:c5::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.23; Thu, 19 Jan 2023 23:01:14 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%4]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 23:01:14 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 2/6] drm/i915/pxp: add device link between
 i915 and mei_pxp
Thread-Topic: [Intel-gfx] [PATCH v5 2/6] drm/i915/pxp: add device link between
 i915 and mei_pxp
Thread-Index: AQHZJu0FeGW+oFwq0UW9nnZ4ggCTja6mKaUAgAA8WgA=
Date: Thu, 19 Jan 2023 23:01:14 +0000
Message-ID: <f121bb857da18a50041328664397201587e66ddd.camel@intel.com>
References: <20230113011850.1463965-1-alan.previn.teres.alexis@intel.com>
 <20230113011850.1463965-3-alan.previn.teres.alexis@intel.com>
 <Y8mZGMjjlTW3U0jA@intel.com>
In-Reply-To: <Y8mZGMjjlTW3U0jA@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DS0PR11MB6446:EE_
x-ms-office365-filtering-correlation-id: 3db01f68-98c1-4ba5-3f11-08dafa7110c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iJbfoA2O6QfOUwm20ggwglwesBNkC/QweHIDggpKzdEHGARV6oGwGEv0GQjXCBUVtGIYifADmeebhq020VldM0dwrT0yX9/HEusbsmO4cfyGQCI4AxK20tqciF05gXhkFHgWS5TjaklanG+6HN0EX5nSD9T7A8xL/SdjdR7Zs5qc6iYyBfuvFrJlwu9pkhKDVFgWp4Ee7XiqWd4uvsHLV4a2XEkuDB6LUloik07iLGbMjq3+xvcHcjMmyBugGEG307VZk9D++01Wby29TAoaWa9fG8rMRXSWsFRPv0DvrRC3QG6+Z64JZUvy4oLwcX2IT2N0x+VCgcgRHoeFEoQ/dH1pPzT6lCdtCKrsxeJkbr6+nlaQ0WiULvqi/InOElOAUB6dBYCZifFxWrDoDNQ+Ek434ZBPiW9qu3PcV5yoQ68WrPsKxwQRa7sWmq4jzsWsM54o63hsPLslrpyvhCAphZw+wF2G3mYoLiHbQs6BbGHwviX4tuWOEHZ5gLrnPT3DRWql/sC8ck86yux43dF9D717lMsTBAXofKkfyatxksfl4v4NVG9zX0sKEd5od/1Af/hD3U4kBTwbOZGjRSBnSYETjgg0JU6AyBvEjZbmp/O31IEft6avzUN5mcxsTdBBfhS1qlYQcgM+ktlB2qjIlG3Q6BKjLlJW1DEadcr1GuaWf6+MuCF7nlvfLUawv0SlN5kyQc7NgwAIUezF3qH24Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199015)(2616005)(36756003)(64756008)(66946007)(8676002)(4326008)(66476007)(76116006)(6862004)(41300700001)(4744005)(66556008)(8936002)(6486002)(186003)(5660300002)(478600001)(26005)(107886003)(6506007)(6512007)(83380400001)(71200400001)(316002)(37006003)(54906003)(38070700005)(91956017)(66446008)(82960400001)(6636002)(2906002)(122000001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZzdFYjVhZTlBbFRhTTlDN1pmRjBDZGVPUmhRdEUrRVk2Lys0Y0xqNFpWRWNo?=
 =?utf-8?B?RHN4aFREMWRVRkxpWEpVSmwvM3JKbEhrWkxkREo3a1RDUFpjQ0FIYXdsZXJV?=
 =?utf-8?B?aE5VUEFhQkJuOFNhSS9xUzdvUzZ5ZEtJaVFsZUNEYWlUL1RtUmhrWG1UbDN2?=
 =?utf-8?B?SXdxQkp5MDVpaVgvd0VJZWl6QVNzVldUanptb253TnBkbEF4ZHFFQzlJeDFH?=
 =?utf-8?B?TU16U09pSjk4c2JFWVRHVmJ0eGNrUk80eTBZVGk2NTlNcEJDWlhBQWhPZGdQ?=
 =?utf-8?B?amw0amcxQ1IrK1ZscklGdExFYjdpbnhxVkZuL2hNR2w0NkxyamtQYjBYK3VP?=
 =?utf-8?B?Qk43SmdHejdIUWxyKzRUMDN1Rm9ZcytHUlloUEE0MXM4WFQvQUpYalducjl6?=
 =?utf-8?B?WDRuYk9FcjFQM0s3S2hnV3NuZ2FEczBPdS8xTSt2OGlhMDJVcGphcDVaeVZC?=
 =?utf-8?B?bVdHcm0weHBPNmliUU1mUVRyaVJ6NXJlR1RicUFpUU5kczFtcGtOWFBVMW9G?=
 =?utf-8?B?SEwrSXBYN2VkemduY3hxSUJLL0Y1M2RGN2hJRTRxMUszZURKM2RBYkpoUGt6?=
 =?utf-8?B?QVVJSjhGT1VNclRrZGQvVmxSSlVjUVh6SFR5ZWYzTDRLS2cra05TMzJXRzVy?=
 =?utf-8?B?VUlCSHFZUVVGVzRrS0tYeVJtOGRLSkZ0d29QTzU2b2JtdTlrUzh5VGwyYjk5?=
 =?utf-8?B?OVVZN0pSVmxpcmVqWFVWaGVYQTJiQUl6RWVPdGlzTVJHR1RkYWJFbXpzQklV?=
 =?utf-8?B?QkQ3Vm1GTlEyQ0xmS01HeHRWTjhKc3poWkp2MUw1THRERE9MSHB2TzFRMk1B?=
 =?utf-8?B?dW9jR2ZTMFNWU1M4VGlxb2lLU2ZtQW04WE5IaUNQLzJGS1VmcGRqSWdFbE9S?=
 =?utf-8?B?RmtmTFREQjJxbmxnUTRFVG9NWXAyeE1jd21IN2VpSEJBVVNHUCtOL3QzRmhi?=
 =?utf-8?B?dUFGeW54NHFrMzV1bHBhWHVLaEhBVFFZRnpxenpsQ0lmTzVtUytlZFE3QTZu?=
 =?utf-8?B?RVIyOGxpamlZTGdaQlB3NTVvajZkWE9heDdkQVZBNVJ4QkoyUkc2cHBDRHNH?=
 =?utf-8?B?THVubW9qbWVjbGxVUXFYSkZZL0ZpbXRWZnRpYWJ1cXg2ZEpTaG5Ld3I0NEVt?=
 =?utf-8?B?MjROTHo3V0FUOEppL0cwYVdJTm42V0dHdUtBL1E0NENJbmdrV1Y5WjZlYVBz?=
 =?utf-8?B?MkhUN0kzdXZYTjN1eEpHMnREczB6UDdJTExXakUzL3NQYjczdk83bEYzTEtP?=
 =?utf-8?B?aUs3U1lsNkZlNll3UkNPZTBXUjhLS0ZYL0Q3V2tZT0E4WEdqakVBOFl2anJi?=
 =?utf-8?B?VzNteDJWMnA4WUIwU0NnWWxybDlhK3hVVTlGM1dVVkpTSEN3RGdTclR1dUh6?=
 =?utf-8?B?NkU0VldRR08zakg5YW1pZlFRaUJ1eXdZMnFsMW0rRHFDRXBoTVpLU05SQ3Mx?=
 =?utf-8?B?RmlOWkdnVUVNVmlxSmlkS0NBK3lrV2docThwR2VRQmJuWXlnVUNEV1dLcGVK?=
 =?utf-8?B?Z1hQTVh1S0JFai9ocDcwSnFyK3hEazcyb3Nqa1orTjRDUGhpY20rVDVyaFhm?=
 =?utf-8?B?WFZBdFl1OTlaWWlHYjFqemVhQzBlZGdTMCtwTmRoM2RaanhwZFdlY2dTc1Y2?=
 =?utf-8?B?NjNDeVplRWt2cWExYUlwa2F4ZlB6ckYyNVdZMzdiYW9rbkoycTBsc3hOcDRU?=
 =?utf-8?B?ZktRVDFpMHpyOHp4Q0RHZzJlMnRuUUVFSmRwc05mR1lMNVdGTEtNakpZRVBV?=
 =?utf-8?B?YUt4bGNmSFB3Zm9RUTJydUpUL0NNbVNqaVp1UWdsRGxRU1hWZkJlQ0Y3cnhj?=
 =?utf-8?B?bjNaVUFENHJESDF4QjVGR1MxTWloWmtvbXdCSEJEQ3Vnbno5S21Ka3ROOXly?=
 =?utf-8?B?RVAyK0RoUEFXck5NUzgwZEFvSWVwYy9mcU0xS1g3bUVpRy9vYk5oaUlOd0d4?=
 =?utf-8?B?bzQ2ZEh2MXZlVkVrMW1zR284M1hEMjBXaXNxRkYwRHRtNC9vbVBpUmlLeCtW?=
 =?utf-8?B?K0k4d2Q5bkFEeXUwQ3JrU3FRaG5scGFYL0VaejY4ZkRZSGZ3SEZVMmYzVGRU?=
 =?utf-8?B?MkJ4YXlTdnRVdjdhU3hWeldVNjcvbUVBNU5QR3QwM3BLRlBsWGgrczIxdHRU?=
 =?utf-8?B?UUREaVJsTDd0NnltdnpZWkdjb3NKMlFyMkpDVGxKbE1obE5tSG9NbDRFLzJK?=
 =?utf-8?Q?ktc8gr/dBqv4vVfmSZkXNI9BOx39i2Nv+x51RSOGbkIv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10E0791BE0B41042BF3A1F93EA917B20@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db01f68-98c1-4ba5-3f11-08dafa7110c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 23:01:14.5685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PiowCQNI2aWV7Ih+0yF9eGAECvJLSCupO06rIhXBkarAk6jJDt6qIPaEnZ0kVfGd3VzkuHmknAHBZHzlnC52ShEBlbV0URE0z+tF556GZ1ai1/0Y1OkzeVmndXx1rNNp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6446
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Vivi@freedesktop.org" <Vivi@freedesktop.org>, "Winkler,
 Tomas" <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciByZXZpZXdpbmcgdGhlIHBhdGNoLiBJIHdpbGwgZml4IHRoZSBjb2RlIGFjY29y
ZGluZyB0byB5b3VyIHJlY29tbWVuZGF0aW9uLg0KSSBhc3N1bWUgd2UgY291bGQgcHJvYmFibHkg
Z28gd2l0aCAtRU5PTElOSyBhcyB0aGUgZXJyb3IgKGluc3RlYWQgb2YgLUVOT01FTSkuDQpIb3dl
dmVyLCBpJ2xsIHdhaXQgZm9yIEFsZXhhbmRlciB0byByZXNwb25kIG9uIHdoZXRoZXIgaGUgbmVl
ZHMgZHJtX1dBUk5fT04gYW5kIHlvdXIgcXVlc3Rpb24gb24gUlBNLg0KDQouLi5hbGFuDQoNCk9u
IFRodSwgMjAyMy0wMS0xOSBhdCAxNDoyNSAtMDUwMCwgVml2aSwgUm9kcmlnbyB3cm90ZToNCj4g
T24gVGh1LCBKYW4gMTIsIDIwMjMgYXQgMDU6MTg6NDZQTSAtMDgwMCwgQWxhbiBQcmV2aW4gd3Jv
dGU6DQo+ID4gRnJvbTogQWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRlci51c3lza2luQGludGVs
LmNvbT4NCj4gPiANCj4gPiBBZGQgZGV2aWNlIGxpbmsgd2l0aCBpOTE1IGFzIGNvbnN1bWVyIGFu
ZCBtZWlfcHhwIGFzIHN1cHBsaWVyDQo+ID4gdG8gZW5zdXJlIHByb3BlciBvcmRlcmluZyBvZiBw
b3dlciBmbG93cy4NCj4gPiANCj4gPiBWMjogY29uZGl0aW9uIG9uIGFic2VuY2Ugb2YgaGVjaV9w
eHAgdG8gZmlsdGVyIG91dCBERw0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBV
c3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTog
QWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQo+ID4gLS0t
DQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX3RlZS5jIHwgNyArKysr
KysrDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQpBbGFuOiBbc25pcF0N
Cg==
