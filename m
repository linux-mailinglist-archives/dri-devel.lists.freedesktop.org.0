Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFED67EDF8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 20:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5342D10E1A0;
	Fri, 27 Jan 2023 19:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C5610E19E;
 Fri, 27 Jan 2023 19:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674846503; x=1706382503;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wAKPn7BnjVW2pAHHTQr4R7TOOlIpocFopjV2tFD8kbU=;
 b=nFd3mfxNaAqpqN/yFvUOPw3oMBFIrG2+k9SKBksG8XB7wGfg2gUXRQKf
 TGoXU2NDKa/Q1L+Q/HNZJyRzCA1hYcs0DmprvlSuLS/f9qsuXYLXhrjiP
 XIO6NiMkZ6SvtQKAtTzI5DBFUQ5oBsxlKgFDtTsIl0AZm6cC9EMQWF5s7
 rw8+gOF/mSZj/ec+KIdcqNwAkcK9lWC5yQF0BknORH2S3OHbRzzufU4Zg
 0Lcj823Zn56lxMgN5eXGWBM+3kd6FVcvGVORlS/7dXoB3K/Ag+y4Qtyy0
 S5d9Bp4TXsnKHhl9jJrOc0RU9O5HGnJ2zA7EpoFyAZR3P6JQw0B2b+5fO g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="315119479"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="315119479"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 11:08:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="752086978"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="752086978"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Jan 2023 11:08:00 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 11:08:00 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 11:08:00 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 27 Jan 2023 11:08:00 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 27 Jan 2023 11:07:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jn+9AdzWg0X8+LduihaI6fDuSpdo2JFGnBWkEo/POxzMV8a3y00iYnB/i+NjHIzwF4bADfzKYq8Tk34a2DbWyLBhdQHlO7SDGqtcg3Y9wPp/M7mI0REiojglnuwI5QktIbWGA2U8R5/z+cCrIVLf/qnZZjvLqdtkY8CI7dC9JFnubenm2baOX/yci0QEPEIJDlp9RvlwBaWcaynIHxmCRztKPwXJKAyy8w1Q2p32An7m+7omiQsK0AXcnCS37XcH1Wc2YLpCNs3ieHpcAxRoKZ4IGIALgwhV2H+bNzedzWZbuKM/jsf9CEoJOkIdTa1cZMitRrnHOyqnEm2BWaH7hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAKPn7BnjVW2pAHHTQr4R7TOOlIpocFopjV2tFD8kbU=;
 b=eVveJVZNRFkcwMdQE2f3jtPL5qx/KD+VmBnnFJ0xBxDWjOe5adPFGKCeFthu7iZhL8Xe8K9SEp3UKyMmsT0WqHEpW5iu0h2WU5k3IL05aa2OCJ1l5fM0aj8h8WEUsz80qUdvdyyrgnF35ZCLVW4Vb9ru5KWrkglZ4tqpThh57fqRKgP30KKjYgGkbARyesGYsxK8281ZXVEgX1KeaDi9EL7N0Ys/wWs4QDoyOcjEDCTqVsztQMnOv5pz8EiyHL6nzwsS4b0qum7waSGYvB4xUBeLS5cLrcQuiJGXNGIgutVZbmrwkTXeVm0fxZebU9dSLHIrwM46JK5pAi/5MCkCQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MN6PR11MB8172.namprd11.prod.outlook.com (2603:10b6:208:478::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22; Fri, 27 Jan 2023 19:07:53 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%5]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 19:07:53 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v7 3/6] mei: clean pending read with vtag on bus
Thread-Topic: [PATCH v7 3/6] mei: clean pending read with vtag on bus
Thread-Index: AQHZMJbEmBw+lSLIjk6A4oD1u0SZ166vY7OAgAKZQICAAKcqgA==
Date: Fri, 27 Jan 2023 19:07:52 +0000
Message-ID: <8cdac3698378b8380b94bd657b8f459b301185b9.camel@intel.com>
References: <20230125082637.118970-1-alan.previn.teres.alexis@intel.com>
 <20230125082637.118970-4-alan.previn.teres.alexis@intel.com>
 <Y9FmvUujJeijwZXi@intel.com> <Y9OUy2Ygq2EBzdDV@kroah.com>
In-Reply-To: <Y9OUy2Ygq2EBzdDV@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MN6PR11MB8172:EE_
x-ms-office365-filtering-correlation-id: 4a8a0a3c-24a8-4ea1-9981-08db0099ca7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HwbsFUWyUAJ41jy5ZGJfsM532nBItiupeYMGJ1YPNybJET3PiU+HZQLgCWf/TmkzKUfhjFVMSVBG9V31az7ik/G1OZtU/fJg4vK1Auh7+AE1p5/12lUU4HAbRVBOhZvhX0TNggrPogZ9fR74jg46mfPrHnJMVfm2xanhkTuKyEzOeR38TMxFkosdQiUtjxqCyq9K7T0fEPmIAY0wtGBIiZdaQCRK1D8m5diGtGdAsD5MmI7oW4lHI24gswm8xYPX/T3bUaaC0KSyjbZUvMzPXPlbKsYvYfwABLc6i550oBGHpvkzmKrHQ8B0KUb4UuioDkBHBjES/sxn3+gE2v4QlloO+/WPiQzU0Z0b4aHhl4B1Chu6ZRFw5j5dAd0shMlmjfVvcYBthHkzcKyQITq1YCGQLs8Mi2LWEToQdaIH8e2uPFitnRv6aduItq9E2ZBbhzp7E9VMlOBlfrgpdtSJNdOBJaspILnoOPsuqlLQ/d/jJvg2/gR8LQ43XYfqzoFhG4EBLm/Rf+VazMQGV6mFcF3hFJGnl5Pav1976518aTQIEHwD9WgfhU8JsOZva1FqTwcJutk3zfKGPG3wdsheV2w2j1O7/0MlAdU5uftVpcXG3BkMMYnAPPkXuP6Aud1DphI/lGAZfflRGi59PXR/SIz97xJIsDdqi5aLtMucqgyNvjcO/dRxI+6QbOjNJu9g/csFiOclwTVUu+peBIeqLQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199018)(122000001)(64756008)(316002)(54906003)(38100700002)(41300700001)(8676002)(66476007)(36756003)(76116006)(91956017)(4744005)(8936002)(66946007)(38070700005)(66556008)(4326008)(86362001)(5660300002)(2906002)(66446008)(82960400001)(6506007)(110136005)(26005)(478600001)(6512007)(186003)(6486002)(107886003)(83380400001)(71200400001)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVZ2QU1wemFpNkdPOTFkT1VuV2Jib2xpVTdwbjRwQ3pKUGloelQ5QXRRWUM0?=
 =?utf-8?B?N0tjVHBVWlBReVErc3QzWGp3YlV0ZFB6YWFnRTQwTytrZ3daTFluSkFnWnRF?=
 =?utf-8?B?Z1BNWGQrQVBzWXNIWUlHUVlkcFU1ODFlMThrKzVhUFpWelBBOWpBSzhLdkRF?=
 =?utf-8?B?d0NSYTJvYnR1ZDRYWEVZQlBjRk1BTEpZN0MwcHBaNURvWXlybDAyemV6Y3Yz?=
 =?utf-8?B?bEQvc0RmTWZNNWNQMWVvV2cySEozTUowUHMzM1VmRlZCbFdGbzEzaUhVRjc2?=
 =?utf-8?B?MnlEcmVWbVZ6K2FhUElIUk1lc2Y4L2IranFCR3djcTNuTnNPb0crRlQvbXNX?=
 =?utf-8?B?UTdLbXN6Z094S0RjWXNrS0t3U294Qlh0WUhKNlBTamFtekpRT2VLMEpucW5U?=
 =?utf-8?B?MXNIRCtiQ3pqbERMSHVhUlMzSFkrTytLOVRaVTc2SWlHK1pza3hUYjgyOC9t?=
 =?utf-8?B?REFHS3VyYnJ4Y1l4VThvYTMxNzhlSWNYeG1tYVhOTWhUbkRCWHVrcnp1dkVk?=
 =?utf-8?B?L3c3S3E2OFJHUG9zS0xMUDBWUHkvKzlxOWY1eEFUbjZsNXgvSk5XSGxmclFr?=
 =?utf-8?B?YkVmbEE3R2tFbVhjMVo1WWhaYUR6azBFUE94VkIxMHNjSFdZblBWdDNGNmFR?=
 =?utf-8?B?a2R6SXgyQ2R2MWVUYkhnZjlRd2w5YUREMkJLSE5HdFlJUlR3N2JLaVczQW8x?=
 =?utf-8?B?SGpjOGNYYUJyalp3OCtOMTdtTGZYRFBtYms4b3VsYWJ1bWxZSUtISWUzbjZw?=
 =?utf-8?B?ZUM2UmMwb0lqTnJ2dDdiWHN6cTFDRjVrZk5ZV2Z6c2lHeTA0SUZuVTcxVkV2?=
 =?utf-8?B?VlFiUSswdjU3bkJjZGVDaEZwRkg4MTVrRllucDZFTGMxdDZBT1pTOGtUbUJI?=
 =?utf-8?B?WmhKeUE0Rm82QXB3TisyZVo2dGE1WHRaWldhcmhTWG8wbWZkK1RPMVQzanpk?=
 =?utf-8?B?Qnkxa1FMaklFSDFiMWlETVYxU00xVnF6U01uOEtjV1NLc2M2Rzk4b1h0L2xq?=
 =?utf-8?B?SEZGRGZEZGJab0c5S2ROdHU0YUV3ckdEVFlnc0hUdE9ybjc0L28rL1ZTTEpi?=
 =?utf-8?B?V0xXYUREZTFON0VsZlFzbWF0MEhHK09TQTFQZXJ4Zjlpd2U3Qyt3VEFjYUhO?=
 =?utf-8?B?ZVRWVnN3NWRCRVRQU3lqVWJjR1NHWXY2VmF6Wkc2djMxZzBwV0VjZXZSazA0?=
 =?utf-8?B?VHo4Yi90SkVmbHg4MDJaTTIxTy9NK2Z2VjFCYlhMbUpRVmI5eElKK0xJclZU?=
 =?utf-8?B?bHQ1QWpmNFlBZmUwT3JRM2lPRkdwYkk5N0g4NHorU0Z2bk1LZlZWdll6RlNT?=
 =?utf-8?B?RkhlaHcraENTYnVVaEl1dE4vVW1RSHZBV3RKSm9xMTduZm1BNEdLQW95bUt6?=
 =?utf-8?B?SVVMNHhENVhSbm13L1lyVE1IdlNlRlk5R2ZLVlRsc2ZPRXBxRHlCM0tPYTdG?=
 =?utf-8?B?bEFnbHdlaHU1RzJiTWZMQzUvOWZCZWwzSmhCR2JjcWhqNkFKRzczRUZJNCsr?=
 =?utf-8?B?cXdXemdZdS9QckdoN1ZCd3JFK2RyR3VvdjE5ekJka1JneEppQW5aVVFNSFFE?=
 =?utf-8?B?K3g0NDdNS3ppSStiMEhGcDZzMy8wQnI4VG91NERORHNDbjVJWW9JQjBxcmFl?=
 =?utf-8?B?YnkySWRsakdrRTZtRFRlQk85VHNnQkJUWU9KUjNWeHdHTW41ZUdwQVVVbWt1?=
 =?utf-8?B?TVhCdkhZUVg0ZzRZOStoRitmZ3ZPcWVBdnZFaEQvamZXL3FkdFYrM1FGYzBw?=
 =?utf-8?B?M3R1elNyQTMvbjc3S2FJMjd6REpuVEtpSUdEaXhibmdlRzI5aW8wazBrN3Ew?=
 =?utf-8?B?WjVveWVLT25ocmNBY1NHc2p5ZnFCVFcxWGhNRlNEUHFlZVppYzVtSy9wT2Nx?=
 =?utf-8?B?MU1BL3NQR3Z6aWZZNDlzaWFDM2lOZkFGMjc0Tlk3aHdvdnQrMGpyNUNZRkNW?=
 =?utf-8?B?eGdjN2dLRkNBb1hFMVhiem5YU1VVSmVROGJjUW8zYjJBVWRSa0k1T2tKRnBO?=
 =?utf-8?B?QTFMWFIrQ2trZXorOXZtSmd1SWkrZVJUa0RVbHJzZmxaN3pqNUhpZDhsQ0xD?=
 =?utf-8?B?WXlvNENqcXFKYlJzUElDOFp0S3RUOHhJQ2FNTkJyR0x4RURKdkg3SHd2SkNM?=
 =?utf-8?B?b0lOT3lPbnhodnRRL2M1U2l6OHRvemdKZVdtS25vZyt1TU1mTmVXR0s2aGxZ?=
 =?utf-8?Q?MSuDKJzOFMwl29csy+EyUKgamfkdMsLDkRx1QeIUaqWs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCE1CFC38107494CA73AEF961C8583A5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8a0a3c-24a8-4ea1-9981-08db0099ca7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2023 19:07:52.9657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0+SrnyPTeRBLaqZM9kpGjhw9uiWVcNilxLY2sW/Z9OBmsmfsKWQ6ST8Vlx+rQ5GwMn9m1NhPlzbmEnJEr4lvubPXlINGDM2tD79Ms85y5eMRI3VtKlLUIrPXbBuRlf+A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8172
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
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "Vivi@freedesktop.org" <Vivi@freedesktop.org>, "Winkler,
 Tomas" <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3JlZywgYXBwcmVjaWF0ZSB5b3VyIHRpbWUgb24gdGhpcywgDQoNClBhdGNoICMyIGFkZHMg
YSBkZXZpY2UgbGluayBiZXR3ZWVuIGk5MTUgYW5kIG1laQ0KKGF0IGJpbmQgdGltZSkgc3BlY2lm
aWNhbGx5IGZvciB0aGUgUFhQIGludGVyZmFjZQ0KdGhhdCBpcyBzdWJqZWN0IHRvIHRoZSBpc3N1
ZSBiZWluZyBmaXhlZC4NCg0KQ2hhbmdlIGlzIG9uIGk5MTUgYnV0IGltcGxpY2F0aW9uIGlzIG1l
aSBzdXNwZW5kLXJlc3VtZQ0KYWxpZ2ZuZW50IHdpdGggaTkxNS4gUm9kcmlnbyBoYXMgYWxyZWFk
eSByZXZpZXdlZCBpdA0KYnV0IEFsZXggYW5kIGhpbXNlbGYgZmVsdCB5b3UgbWlnaHQgd2FubmEg
dGFrZSBhIGxvb2suDQoNCi4uLmFsYW4NCg0KDQpPbiBGcmksIDIwMjMtMDEtMjcgYXQgMTA6MDkg
KzAxMDAsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToNCj4gT24gV2VkLCBKYW4gMjUsIDIwMjMg
YXQgMTI6Mjg6MjlQTSAtMDUwMCwgUm9kcmlnbyBWaXZpIHdyb3RlOg0KPiA+IA0KPiA+IEdyZWcs
IGFjayBvbiBnZXR0aW5nIHRoZXNlIDMgbWVpIHBhdGNoZXMgbWVyZ2VkIHRocm91Z2ggaW50ZWwt
Z2Z4Pw0KPiANCj4gSSBvbmx5IHNlZSAyIG1laSBwYXRjaGVzIGluIHRoaXMgc2VyaWVzLCB3aGF0
IGFtIEkgbWlzc2luZz8NCj4gDQo+IHRoYW5rcywNCj4gDQo+IGdyZWcgay1oDQoNCg==
