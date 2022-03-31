Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A384ED0A9
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 02:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C1E10EE4D;
	Thu, 31 Mar 2022 00:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B5210EE4D
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 00:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648685177; x=1680221177;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mNO80SncKuh47zopZihDnrAoQQbv2FmgY0xnVCwHiPw=;
 b=LwcOOLeOdd0Wm8vFRX5v61u4OX/Rjf6q3hMkRVAywNSMB8nUdaq+24aB
 5qSM9YH/TY/ipCsTdImnrdwXeWbxA1DA+SITrB65cQJjkQXpZ3X/EDJr9
 hA7SUPUpEVvjPG5RhIa9ZNhdYGpmC8POTa1o43zPV6rFfXr+gMThoiyli
 /TGr5TnfwXehURZ2BEtf0ZkDu9ai9uYdB+UjZEto9mMXfoST6D1Rh4HFS
 9TLu5H+LPFS8U5gdysgVmvUDlne1kWhlHjsXrE2JvOEbd0oUTzmAje3Cv
 cX6RETWIusRi4GhtHh8rG3cqwuw2KyjnhHVnIGcxaoTxp04x7Rz8Wbpr6 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="284588183"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="284588183"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 17:06:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="650058685"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 30 Mar 2022 17:06:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 30 Mar 2022 17:06:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 30 Mar 2022 17:06:16 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 30 Mar 2022 17:06:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RihQulVkmTsg2Bd3PHZmETF0vnkxlIUUCuoodqnh8/QW43PyG3ktWyybug+1q/cI7fxAWPhStuSizBBjmqbPkY6RFaYjKvMfbmGhReYS38i/OStrUgXjTbV9pIuc+lFmIi4KB/bjNxDwvJH8HrozTH4fFlFzpQ3dUDcMGrkpOpyI0rNHpMmhjh97zzrAlsVRBhO+bfNp+Zlh7Dfi2255IA1JgiJL6sVnLW02rQn0OROObtX3/HYAZesZKZcuFHgucIxHp8i6NIbyHgO2syVUIvDVJjxeSaiXkRQ0pf41Ia0Ehyn8dKIra1Oe2ZUkHV8cJ8GcICpUa56QER2CQknJvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNO80SncKuh47zopZihDnrAoQQbv2FmgY0xnVCwHiPw=;
 b=TQXeZSj27fHEpb/baSdILQsoM0fO+ksek4E7hvhnWzgxKWM90oAW5O8vxbMASYNAj7vgIlUO4Lc3TfyzmVHnkJED2AivtJQ7Ag9Df6XFIVIZ6ObvumKDy2oQvH9MjKzfWttqBWwkUqeDxPOmDXee6mp46phjpw464bUAgZvVrFKUtKYvt6UwNyVa579NU4A++Ne6f+Wtdr8NYISmWp3MMyv4ku8eIKMEUGR0duK4vABooMjev/Tc4n2HgTLRP0dozTX0mDiAzvr8uy5A6fdRtl5RYP3at4EUxUHg92aUH2bno+j0rRgFUHcNqupOs/r/dYW8NFUeOagehmTBB2o/6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by SN6PR11MB3423.namprd11.prod.outlook.com (2603:10b6:805:db::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Thu, 31 Mar
 2022 00:06:14 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::55fe:1d31:4f97:9f92]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::55fe:1d31:4f97:9f92%6]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 00:06:14 +0000
From: "Liu, Chuansheng" <chuansheng.liu@intel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: RE: [PATCH] fbdev: defio: fix the pagelist corruption
Thread-Topic: [PATCH] fbdev: defio: fix the pagelist corruption
Thread-Index: AQHYOcSRnc9LTAQJmE6ZG+PF4wN6xazRXpEAgAKlKOCAAF8dAIABKG+wgAKsr4CAAHj40A==
Date: Thu, 31 Mar 2022 00:06:14 +0000
Message-ID: <BL1PR11MB5445633C68B3039320FE780E97E19@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20220317054602.28846-1-chuansheng.liu@intel.com>
 <c058f18b-3dae-9ceb-57b4-ed62fedef50a@molgen.mpg.de>
 <BL1PR11MB54455684D2A1B4F0A666F861971D9@BL1PR11MB5445.namprd11.prod.outlook.com>
 <502adc88-740f-fd68-d870-4f5577e1254d@molgen.mpg.de>
 <BL1PR11MB544534F78BE2AB3502981AE5971D9@BL1PR11MB5445.namprd11.prod.outlook.com>
 <baebc9c2-a8fc-9b36-6133-7fa8368a93d5@molgen.mpg.de>
In-Reply-To: <baebc9c2-a8fc-9b36-6133-7fa8368a93d5@molgen.mpg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d093141-24fc-49ce-d319-08da12aa453d
x-ms-traffictypediagnostic: SN6PR11MB3423:EE_
x-microsoft-antispam-prvs: <SN6PR11MB3423D5E517CA9B25B1EEE8F497E19@SN6PR11MB3423.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wvogt8sQdsCMzZk3m+K5q5iRgkJ0FeaEyMFtAwaAlfNXMpq8aU9Z0ES8fxdp5Jkc17AscMFEw3vVQGNzGmeeMKwdyEJGqJ1fl0x1QN/EDnIPqngGReqTjM3RTfC1G0EcSk1XeRtub5EVKVpJKi/JTc9GBdulhxOhCRHA44GR58+6P253Qp1RZ1aR4ksvUoQsA6YrlJ+QTfcdm3lU17g7cdp2jxNIitq5dIaKkA8ywfMhgW+vYF7w0AOJeCvh6/WX9KDTpnJK7EDod2toOyDs+VRXf9dANTllRjtmfKGgkxsdI4vTBjFUslSVaQSEvcy2ZunfEZu1172onaY5VqAjLoioR/iBXoao1urxTcVT7pTNlHyGSLwFdo3F8M+G9SxZAMbnVArllScn3gYdtRL7R9se97M9LA4e43XmDIGjimXGOmoDydRPv504GKCuR/+Wocrjrz7okYIjWBKYOE4ZD6smY1MGvPoIjiRUuAgQHiVnHjy2YkfJUJ9c0GRpm+b6RtcJIWrlCWSrkHlh07iYxOzRINml7NX55fdUdpAMXVj4D5WRdDgx8i0LCR/91RkZOUG9O7eAdBbUzz22gqY3ZTCFbhwXePrnBMl1+YRd/Rtteep6VSVn8MV5wXG6sdV+ouz515PaDzFq2eKpo4WgaHSjH3bZPxvUHTKN5/wJ+NKdTUk6JC1ws7KIMYiG1wKl97DDE9IKbKsFloC5Gau/Kw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(55016003)(38070700005)(33656002)(76116006)(66446008)(508600001)(4326008)(83380400001)(66556008)(64756008)(66946007)(66476007)(53546011)(186003)(8676002)(26005)(86362001)(7696005)(122000001)(82960400001)(2906002)(6916009)(52536014)(38100700002)(316002)(54906003)(9686003)(6506007)(71200400001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDYyQUZvVjQ5cktxS0Y5cjl0eldHeVUzTEQyMkQzY2NuVk9EajJ5Q1hOQlFW?=
 =?utf-8?B?UVhlOWFkMlloV1k0WDVFVmJORXlpVkJ6Z3hvMmRvbFg3OWVyS0V0SUpHVTVk?=
 =?utf-8?B?RGJHOGFYNjNrMndnUVdEbXZPNGFVb3ZIekoxb1RHWUhaSkkxKzRtV2Mvd2Nt?=
 =?utf-8?B?RXNOVmNMYk1OdWd4bTNNcUtoSWdMMkFkQ0dzaUMxNWc3QXVESWNTWFpJTEl1?=
 =?utf-8?B?MzAzM1ZBTVNJSEVabnphMEpGdXBiTHljckFWQkd0WngzdGZabCtWaDNuZE84?=
 =?utf-8?B?MzNybjBMNitFaDhlTmVyMjdrTVRSQ1hCZnZueWJZRERFdVVwdXhxSlBYRWln?=
 =?utf-8?B?WkhYWVMzeWtWc0M1WWFnVEVZcUl5bk5mR2d3Y1NScFJpVUY2QnNxR1ZOejFZ?=
 =?utf-8?B?ellkZmY0UEFsRXhIRlo5QkZaVFZscHdUakhUT21CSk1mZHIvVFM0VFU5SGRz?=
 =?utf-8?B?aGRteWVqemI2NGt0M1NxZUVka010TXZLaDlFeFVmS3J1Z3pEa3Jac0xxVlNm?=
 =?utf-8?B?T1J5dTdTRUVwdFNEWU5BWEVQRlNUdE1LUVpUSW9mZkM1SlZmanpFOWsvWU9U?=
 =?utf-8?B?cm05WFR3dHNSWWRFMjlURnpwbU5jS0MyQndDT3JzQXd2Q0ZDczVDN0lzR3Vr?=
 =?utf-8?B?QldXTHlBY0dSdTBUd3psT01QN2RSbGp4NFE5dzBsQXk0U1BHYkFZVU9uaXE2?=
 =?utf-8?B?YTFBdVBFWkc3empuUVFhRE02aUYwb2txUjlzcWY3KzN5dDlqS1J1TXFTZ09C?=
 =?utf-8?B?VzNvWHdNYUVaQlhIM0ovRUs5K3l4Z29WdUlVQzNybU9YekNkY0xjUkVSRUhJ?=
 =?utf-8?B?dGl3TTMwYWw0VUtKT0g2Y0VNL3BITVlhbmdoNjhOaysxTjNvRzd3OTJUQ3hY?=
 =?utf-8?B?UEszc3h6OXViM3pJZmRvOHdzTWRQemdoUXcrRUM3SGx3M04zd2QvN09NcmNU?=
 =?utf-8?B?bkg2UkVQeUQzWkM5NzlOOEFaSXZHUUxBMG16SDVsQWRhT0xONytMM25lMlhF?=
 =?utf-8?B?Qm1QS1h1ay9vRWFvR2xoVEY2azY4L0lDSWk4RHJHT3BVVllLOWlqaW1xYUlq?=
 =?utf-8?B?MWFjaGlGYXZtSm5OYTA1Y0tzU2IvZ1hRNDdqcWtleTZwZDJKSDd4UXQ0MFF5?=
 =?utf-8?B?MWtpRVYvazYvRXJjUEY1cmFaTlU3cEp1M0MxZm0raWpCQVRtdnpmL291RnMr?=
 =?utf-8?B?dGY5SnJRWm9JTTJrd29acUN4Z3ZaKzg3T3FnTW9EOWpzMzRDdldwTURxQmpG?=
 =?utf-8?B?M244TDlIM1dFNjd3SGVqblA0dDduelNBMFlwQ2hVT3hGTmV2ZlFYSGkzUkhp?=
 =?utf-8?B?T3VWazltRkFRNFpzck9EcjAwWDhHNjNhTytqRk9TQUluaVgvQ2UzWUNiQmRC?=
 =?utf-8?B?UTVCcXU5aklnai9WN1d1b1Z6MnhRTTZYem1lVStrbUROMUpiR2t0aXZaRjZK?=
 =?utf-8?B?ek51VUhnK3hhM0JPR1dPRkx5UHJLRzNTb0QwRUtEcHlrdjJjQVBZUTd5YnJT?=
 =?utf-8?B?YVFVZEhRMjEySitYQUhoRkNweVVEM1VmU0VSeUZEcVJ0dm9Hb210TGh0MWFa?=
 =?utf-8?B?enprbU5YZ3lnUGRRaTYwSFg2NUQ4bnFUWUhVT3I3RlhGdUwwdy9EUktQOGtk?=
 =?utf-8?B?Ym1BeEw5dDNoa2o0citha2xiV3NYck9ld1hRV2RyU2EzKzhHUFp0ck1hVm9C?=
 =?utf-8?B?d3h1QytlT1lpSmVpNFVmakx4bS8rSDBDNnRrYUt2MkFPait1dWdrME03VWFI?=
 =?utf-8?B?N3hJSkNSRlNwTVV6anBucXJEUVdBd0NaaDZwTlhwc2hGVUtmbC9qMzkrMlNT?=
 =?utf-8?B?R3k5SXBPK045TTIxQXN5dGFWUzd4TGtScDJMRFE1aHNZZTFEelpwck16SS9Q?=
 =?utf-8?B?YWtaOS9UQmxtWGxRL2FQL2dVU0U1VlNLMWYzMG5UWEFhUnlQMU5icytjTC84?=
 =?utf-8?B?UEhWK1RpMVUwQkJ0RXBTd2tMR21hQUYxWU56Mkg3NXZYQUlva0VjdnZEektO?=
 =?utf-8?B?M3pCVWpKK1RwN2lrSjNCQkhLbW15NEoxZkowSFV5NVdXMVJGZzdkNXdYR1Jx?=
 =?utf-8?B?Z3NXRjV1VUtheFBHZ1M1TlBVMnRjZDRwTlpxZjZPWFVwZUpPaGVyRktBd1dS?=
 =?utf-8?B?VjhXZUtHai84WWtiUnRNT0EvSmg4MUo2czZPTzQyS1pqRmlRRDhDU29MKytS?=
 =?utf-8?B?SXFGRlZ3RjdKYnNOR25STWU2cTJDVVBuSlZPQ25mWnJhZUQ3VStFN0N2UFIz?=
 =?utf-8?B?UUlCSWtmWGpwQXduakRkRGJYUktEYlA0blg4S3FubWJEZGNtOHZNaXVzUUU1?=
 =?utf-8?B?YXR6Q3QreDhPN25FYUY1Ri9SRUc5dS8yRFpadnRNaUx4L2NuRGdFdWZYMm8y?=
 =?utf-8?Q?XzA4Rrn3+rECEs/8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d093141-24fc-49ce-d319-08da12aa453d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 00:06:14.0672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xvGlIZQURns+jofNP45OkgVXkg/vh3gTBcjLX/ep8wFpv9JxzrXbBpj5U9vp3ELrMPNO6tXeiZ8v5x/rx2QPPsPVBU8JaKDSRCMRoUQ2wpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3423
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "deller@gmx.de" <deller@gmx.de>, "tzimmermann@suse.de" <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGF1bCwNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBhdWwg
TWVuemVsIDxwbWVuemVsQG1vbGdlbi5tcGcuZGU+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAz
MSwgMjAyMiAxMjo0NyBBTQ0KPiBUbzogTGl1LCBDaHVhbnNoZW5nIDxjaHVhbnNoZW5nLmxpdUBp
bnRlbC5jb20+DQo+IENjOiB0emltbWVybWFubkBzdXNlLmRlOyBsaW51eC1mYmRldkB2Z2VyLmtl
cm5lbC5vcmc7IGRlbGxlckBnbXguZGU7IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGZiZGV2OiBkZWZpbzogZml4IHRoZSBwYWdlbGlz
dCBjb3JydXB0aW9uDQo+IA0KPiBbQ2M6IC1qYXlhbGtAaW50d29ya3MuYml6IGFzIGl0IGJvdW5j
ZXNdDQo+IA0KPiBEZWFyIENodWFuc2hlbmcsDQo+IA0KPiANCj4gQW0gMjkuMDMuMjIgdW0gMDE6
NTggc2NocmllYiBMaXUsIENodWFuc2hlbmc6DQo+IA0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+PiBGcm9tOiBQYXVsIE1lbnplbA0KPiA+PiBTZW50OiBNb25kYXksIE1hcmNo
IDI4LCAyMDIyIDI6MTUgUE0NCj4gDQo+ID4+IEFtIDI4LjAzLjIyIHVtIDAyOjU4IHNjaHJpZWIg
TGl1LCBDaHVhbnNoZW5nOg0KPiA+Pg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4+DQo+ID4+Pj4gU2VudDogU2F0dXJkYXksIE1hcmNoIDI2LCAyMDIyIDQ6MTEgUE0NCj4g
Pj4NCj4gPj4+PiBBbSAxNy4wMy4yMiB1bSAwNjo0NiBzY2hyaWViIENodWFuc2hlbmcgTGl1Og0K
PiA+Pj4+PiBFYXNpbHkgaGl0IHRoZSBiZWxvdyBsaXN0IGNvcnJ1cHRpb246DQo+ID4+Pj4+ID09
DQo+ID4+Pj4+IGxpc3RfYWRkIGNvcnJ1cHRpb24uIHByZXYtPm5leHQgc2hvdWxkIGJlIG5leHQg
KGZmZmZmZmZmYzBjZWIwOTApLCBidXQNCj4gPj4+Pj4gd2FzIGZmZmZlYzYwNDUwN2VkYzguIChw
cmV2PWZmZmZlYzYwNDUwN2VkYzgpLg0KPiA+Pj4+PiBXQVJOSU5HOiBDUFU6IDY1IFBJRDogMzk1
OSBhdCBsaWIvbGlzdF9kZWJ1Zy5jOjI2DQo+ID4+Pj4+IF9fbGlzdF9hZGRfdmFsaWQrMHg1My8w
eDgwDQo+ID4+Pj4+IENQVTogNjUgUElEOiAzOTU5IENvbW06IGZiZGV2IFRhaW50ZWQ6IEcgICAg
IFUNCj4gPj4+Pj4gUklQOiAwMDEwOl9fbGlzdF9hZGRfdmFsaWQrMHg1My8weDgwDQo+ID4+Pj4+
IENhbGwgVHJhY2U6DQo+ID4+Pj4+ICAgICA8VEFTSz4NCj4gPj4+Pj4gICAgIGZiX2RlZmVycmVk
X2lvX21rd3JpdGUrMHhlYS8weDE1MA0KPiA+Pj4+PiAgICAgZG9fcGFnZV9ta3dyaXRlKzB4NTcv
MHhjMA0KPiA+Pj4+PiAgICAgZG9fd3BfcGFnZSsweDI3OC8weDJmMA0KPiA+Pj4+PiAgICAgX19o
YW5kbGVfbW1fZmF1bHQrMHhkYzIvMHgxNTkwDQo+ID4+Pj4+ICAgICBoYW5kbGVfbW1fZmF1bHQr
MHhkZC8weDJjMA0KPiA+Pj4+PiAgICAgZG9fdXNlcl9hZGRyX2ZhdWx0KzB4MWQzLzB4NjUwDQo+
ID4+Pj4+ICAgICBleGNfcGFnZV9mYXVsdCsweDc3LzB4MTgwDQo+ID4+Pj4+ICAgICA/IGFzbV9l
eGNfcGFnZV9mYXVsdCsweDgvMHgzMA0KPiA+Pj4+PiAgICAgYXNtX2V4Y19wYWdlX2ZhdWx0KzB4
MWUvMHgzMA0KPiA+Pj4+PiBSSVA6IDAwMzM6MHg3ZmQ5OGZjOGZhZDENCj4gPj4+Pj4gPT0NCj4g
Pj4+Pj4NCj4gPj4+Pj4gRmlndXJlIG91dCB0aGUgcmFjZSBoYXBwZW5zIHdoZW4gb25lIHByb2Nl
c3MgaXMgYWRkaW5nICZwYWdlLT5scnUgaW50bw0KPiA+Pj4+PiB0aGUgcGFnZWxpc3QgdGFpbCBp
biBmYl9kZWZlcnJlZF9pb19ta3dyaXRlKCksIGFub3RoZXIgcHJvY2VzcyBpcw0KPiA+Pj4+PiBy
ZS1pbml0aWFsaXppbmcgdGhlIHNhbWUgJnBhZ2UtPmxydSBpbiBmYl9kZWZlcnJlZF9pb19mYXVs
dCgpLCB3aGljaCBpcw0KPiA+Pj4+PiBub3QgcHJvdGVjdGVkIGJ5IHRoZSBsb2NrLg0KPiA+Pj4+
Pg0KPiA+Pj4+PiBUaGlzIGZpeCBpcyB0byBpbml0IGFsbCB0aGUgcGFnZSBsaXN0cyBvbmUgdGlt
ZSBkdXJpbmcgaW5pdGlhbGl6YXRpb24sDQo+ID4+Pj4+IGl0IG5vdCBvbmx5IGZpeGVzIHRoZSBs
aXN0IGNvcnJ1cHRpb24sIGJ1dCBhbHNvIGF2b2lkcyBJTklUX0xJU1RfSEVBRCgpDQo+ID4+Pj4+
IHJlZHVuZGFudGx5Lg0KPiA+Pj4+Pg0KPiA+Pj4+PiBGaXhlczogMTA1YTk0MDQxNmZjICgiZmJk
ZXYvZGVmaW86IEVhcmx5LW91dCBpZiBwYWdlIGlzIGFscmVhZHkgZW5saXN0ZWQiKQ0KPiA+Pj4+
PiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+ID4+Pj4+IFNp
Z25lZC1vZmYtYnk6IENodWFuc2hlbmcgTGl1IDxjaHVhbnNoZW5nLmxpdUBpbnRlbC5jb20+DQo+
ID4+Pj4+IC0tLQ0KPiA+Pj4+PiAgICAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlv
LmMgfCA5ICsrKysrKysrLQ0KPiA+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiA+Pj4+Pg0KPiA+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlvLmMNCj4gPj4gYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L2NvcmUvZmJfZGVmaW8uYw0KPiA+Pj4+PiBpbmRleCA5OGIwZjIzYmY1ZTIuLmVhZmI2NmNhNGYy
OCAxMDA2NDQNCj4gPj4+Pj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlv
LmMNCj4gPj4+Pj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlvLmMNCj4g
Pj4+Pj4gQEAgLTU5LDcgKzU5LDYgQEAgc3RhdGljIHZtX2ZhdWx0X3QgZmJfZGVmZXJyZWRfaW9f
ZmF1bHQoc3RydWN0DQo+IHZtX2ZhdWx0ICp2bWYpDQo+ID4+Pj4+ICAgICAJCXByaW50ayhLRVJO
X0VSUiAibm8gbWFwcGluZyBhdmFpbGFibGVcbiIpOw0KPiA+Pj4+Pg0KPiA+Pj4+PiAgICAgCUJV
R19PTighcGFnZS0+bWFwcGluZyk7DQo+ID4+Pj4+IC0JSU5JVF9MSVNUX0hFQUQoJnBhZ2UtPmxy
dSk7DQo+ID4+Pj4+ICAgICAJcGFnZS0+aW5kZXggPSB2bWYtPnBnb2ZmOw0KPiA+Pj4+Pg0KPiA+
Pj4+PiAgICAgCXZtZi0+cGFnZSA9IHBhZ2U7DQo+ID4+Pj4+IEBAIC0yMjAsNiArMjE5LDggQEAg
c3RhdGljIHZvaWQgZmJfZGVmZXJyZWRfaW9fd29yayhzdHJ1Y3QNCj4gd29ya19zdHJ1Y3QgKndv
cmspDQo+ID4+Pj4+ICAgICB2b2lkIGZiX2RlZmVycmVkX2lvX2luaXQoc3RydWN0IGZiX2luZm8g
KmluZm8pDQo+ID4+Pj4+ICAgICB7DQo+ID4+Pj4+ICAgICAJc3RydWN0IGZiX2RlZmVycmVkX2lv
ICpmYmRlZmlvID0gaW5mby0+ZmJkZWZpbzsNCj4gPj4+Pj4gKwlzdHJ1Y3QgcGFnZSAqcGFnZTsN
Cj4gPj4+Pj4gKwlpbnQgaTsNCj4gPj4+Pj4NCj4gPj4+Pj4gICAgIAlCVUdfT04oIWZiZGVmaW8p
Ow0KPiA+Pj4+PiAgICAgCW11dGV4X2luaXQoJmZiZGVmaW8tPmxvY2spOw0KPiA+Pj4+PiBAQCAt
MjI3LDYgKzIyOCwxMiBAQCB2b2lkIGZiX2RlZmVycmVkX2lvX2luaXQoc3RydWN0IGZiX2luZm8g
KmluZm8pDQo+ID4+Pj4+ICAgICAJSU5JVF9MSVNUX0hFQUQoJmZiZGVmaW8tPnBhZ2VsaXN0KTsN
Cj4gPj4+Pj4gICAgIAlpZiAoZmJkZWZpby0+ZGVsYXkgPT0gMCkgLyogc2V0IGEgZGVmYXVsdCBv
ZiAxIHMgKi8NCj4gPj4+Pj4gICAgIAkJZmJkZWZpby0+ZGVsYXkgPSBIWjsNCj4gPj4+Pj4gKw0K
PiA+Pj4+PiArCS8qIGluaXRpYWxpemUgYWxsIHRoZSBwYWdlIGxpc3RzIG9uZSB0aW1lICovDQo+
ID4+Pj4+ICsJZm9yIChpID0gMDsgaSA8IGluZm8tPmZpeC5zbWVtX2xlbjsgaSArPSBQQUdFX1NJ
WkUpIHsNCj4gPj4+Pj4gKwkJcGFnZSA9IGZiX2RlZmVycmVkX2lvX3BhZ2UoaW5mbywgaSk7DQo+
ID4+Pj4+ICsJCUlOSVRfTElTVF9IRUFEKCZwYWdlLT5scnUpOw0KPiA+Pj4+PiArCX0NCj4gPj4+
Pj4gICAgIH0NCj4gPj4+Pj4gICAgIEVYUE9SVF9TWU1CT0xfR1BMKGZiX2RlZmVycmVkX2lvX2lu
aXQpOw0KPiA+Pj4+Pg0KPiA+Pj4+IEFwcGx5aW5nIHlvdXIgcGF0Y2ggb24gdG9wIG9mIGN1cnJl
bnQgTGludXPigJkgbWFzdGVyIGJyYW5jaCwgdHR5MCBpcw0KPiA+Pj4+IHVudXNhYmxlIGFuZCBs
b29rcyBmcm96ZW4uIFNvbWV0aW1lcyBuZXR3b3JrIGNhcmQgc3RpbGwgd29ya3MsIHNvbWV0aW1l
cw0KPiA+Pj4+IG5vdC4NCj4gPj4+DQo+ID4+PiBJIGRvbid0IHNlZSBob3cgdGhlIHBhdGNoIHdv
dWxkIGNhdXNlIGJlbG93IEJVRyBjYWxsIHN0YWNrLCBuZWVkIHNvbWUNCj4gdGltZSB0bw0KPiA+
Pj4gZGVidWcuIEp1c3QgZmV3IGNvbW1lbnRzOg0KPiA+Pj4gMS4gV2lsbCB0aGUgc3lzdGVtIHdv
cmsgd2VsbCB3aXRob3V0IHRoaXMgcGF0Y2g/DQo+ID4+DQo+ID4+IFllcywgdGhlIGZyYW1lYnVm
ZmVyIHdvcmtzIHdlbGwgd2l0aG91dCB0aGUgcGF0Y2guDQo+ID4+DQo+ID4+PiAyLiBXaGVuIHlv
dSBhcmUgc3VyZSB0aGUgcGF0Y2ggY2F1c2VzIHRoZSByZWdyZXNzaW9uIHlvdSBzYXcsIHBsZWFz
ZSBnZXQNCj4gZnJlZQ0KPiA+PiB0byBzdWJtaXQgb25lIHJldmVydGVkIHBhdGNoLCB0aGFua3Mg
OiApDQo+ID4+DQo+ID4+IEkgdGhpbmsgeW91IGZvciBwYXRjaCB3YXNu4oCZdCBzdWJtaXR0ZWQg
eWV0IOKAkyBhdCBsZWFzdCBub3QgcHVsbGVkIGJ5IExpbnVzLg0KPiA+IFRoZSBwYXRjaCBoYXMg
YmVlbiBpbiBkcm0tdGlwLCBjb3VsZCB5b3UgaGF2ZSBhIHRyeSB3aXRoIHRoZSBsYXRlc3QgZHJt
LXRpcCB0bw0KPiBzZWUgaWYgdGhlDQo+ID4gRnJhbWVidWZmZXIgd29ya3Mgd2VsbCwgaW4gdGhh
dCBjYXNlLCB3ZSBjb3VsZCByZXZlcnQgaXQgaW4gZHJtLXRpcCB0aGVuLg0KPiANCj4gV2l0aCBk
cm0tdGlwIChkcm0tdGlwOiAyMDIyeS0wM20tMjlkLTEzaC0xNG0tMzVzIFVUQyBpbnRlZ3JhdGlv
bg0KPiBtYW5pZmVzdCkgZXZlcnl0aGluZyB3b3JrcyBmaW5lLiAoSSBoYWQgdG8gZGlzYWJsZSBh
bWRncHUgZHJpdmVyLCBhcyBpdA0KPiBmYWlsZWQgdG8gYnVpbGQuKSBJcyBhbnlvbmUgYWJsZSB0
byBleHBsYWluIHRoYXQ/DQoNCk15IHBhdGNoIGlzIGZvciBmaXhpbmcgYW5vdGhlciBwYXRjaCB3
aGljaCBpcyBpbiB0aGUgZHJtLXRpcCBhdCBsZWFzdCwgc28gSSBhc3N1bWUNCmFwcGx5aW5nIG15
IHBhdGNoIGludG8gTGludXMgdHJlZSBkaXJlY3RseSBpcyBub3QgY29tcGxldGVseSBwcm9wZXIu
DQpUaGF0J3MgbXkgaW50ZW50aW9uIG9mIGFza2luZyB5b3VyIGhlbHAgZm9yIHJldGVzdGluZyBk
cm0tdGlwLg0KDQpZb3UgbWVhbiBldmVyeXRoaW5nIHdvcmtpbmcgZmluZSBtZWFucyBhbm90aGVy
IGlzc3VlIHlvdSBoaXQgaXMgYWxzbyBnb25lPw0KDQpCZXN0IFJlZ2FyZHMNCkNodWFuc2hlbmcN
Cg0K
