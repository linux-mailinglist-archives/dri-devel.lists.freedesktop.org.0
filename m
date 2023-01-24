Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8D9678DBE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 02:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A8410E5EB;
	Tue, 24 Jan 2023 01:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8315A10E221;
 Tue, 24 Jan 2023 01:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674525223; x=1706061223;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=R3a7GtWCmyaraEedlrdAbnNcQsnN+SNB3+bYudGmsxc=;
 b=XrsZHHvGlIA5Klbt+jUbQl2tG3HB675u8rrWy71XBeCp/LwFu/YudJO6
 wJA1zxEOKUP4Ky+hdXO4Gol7WzOAJ1yAo+5X7o8JC2sS1A8eVfZSqmOyG
 fbYSh++a21ceSkTwulcLiSRU/KxdIwF6kGtkuJQzgV3+rpQGIzwz6jUxX
 Xlyev/jYQoZ4fvbck8d47xjC5dN/5mhZbYfrZ9V7m3LS2WMrWnMoTb1Q4
 EAbfNPobHPQlMMJwkc6B5o3c1r9vySAUzVkrjSMzCJ8KdRne4sxupqbOd
 Mu5U9BsgXfW2+8R4UEAZ82RknYu5zh0OFt7pG0EJViYmk7bXYM5xDR32x g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="324887450"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; d="scan'208";a="324887450"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 17:53:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="804412725"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; d="scan'208";a="804412725"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 23 Jan 2023 17:53:42 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 17:53:42 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 17:53:41 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 17:53:41 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 23 Jan 2023 17:53:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOf30vYLd6s6N4Wopay0s/BgOJK+Kntm4ZwGWyMvhdVQJw3pbs1eGJiqc3hdFn/xp4yAoXlhCKzPAsubf5QY1VOS5r6Jmg2BoKQcW0AG/x/MQ6KunASQTooV5caV9V6ElreKQL2XAsRkYOlezjGiOi4xt2AfLJFRXd60I4Sz4Pf/ag88RSYBd5nOt/v950mwb7R1ujKOi2TrGyAF6BwGdGIrvYOjtWHIzINPvaHOJMDR8YsNDiTAAv1Yeuwseod3J9+IZwdIsESFb19/iSE+3eV2tNU3Yx8RxbPwu+IRTLz9IX25uSNvG4lHSU///YZqIwQdvJDP9aV74iCPfGRjWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3a7GtWCmyaraEedlrdAbnNcQsnN+SNB3+bYudGmsxc=;
 b=CZdhFebjNaZSgv+t2TycTROk7nMakdg9j6n9EH7tO4n8VbZQ/Inme3cGM22XMbrS31KtevxjHDgwmKJcCqhC8Qst0Cqr0gdEWYnFM/bNOpQ6WSNsdPSB2jf3/V2VHnplsIamYtkHFQX8xH/JuILkZ0hwtkBXEVrWMXy335MDZPEvtfgXBjwFD0stCdNLFvzdRqQZtU0doCr4spuYAx0n6kqoGwXDEo3hIqlDJmtt1noYtHHn5eP/GYpMAtgM3yhtGQICkRDPjxvg99AW8qTuDIeuvn2o89N5erKL9SEpViAy7ailk5IzanBXD1+Vzh7qL9/6HspzdG+kyO5ccdlmoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM6PR11MB4707.namprd11.prod.outlook.com (2603:10b6:5:2a6::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Tue, 24 Jan 2023 01:53:39 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%4]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 01:53:39 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Usyskin, Alexander"
 <alexander.usyskin@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 2/6] drm/i915/pxp: add device link between
 i915 and mei_pxp
Thread-Topic: [Intel-gfx] [PATCH v5 2/6] drm/i915/pxp: add device link between
 i915 and mei_pxp
Thread-Index: AQHZJu0FeGW+oFwq0UW9nnZ4ggCTja6mKaUAgAPmEACAAhEmAIAAvqGA
Date: Tue, 24 Jan 2023 01:53:39 +0000
Message-ID: <c173735b1b3182515424a440f31c5d2ab2210259.camel@intel.com>
References: <20230113011850.1463965-1-alan.previn.teres.alexis@intel.com>
 <20230113011850.1463965-3-alan.previn.teres.alexis@intel.com>
 <Y8mZGMjjlTW3U0jA@intel.com>
 <CY5PR11MB63660409E141F1D0E65A9B95EDCB9@CY5PR11MB6366.namprd11.prod.outlook.com>
 <Y86aNv0G6qC+DNHx@intel.com>
In-Reply-To: <Y86aNv0G6qC+DNHx@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM6PR11MB4707:EE_
x-ms-office365-filtering-correlation-id: 0fb43010-a1f9-4415-f873-08dafdadd062
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JqdgnIceEOuxG07xxUK18QT+LC+AWWZ9n0wu+TXtRYxPYA24PkWD7QCbgBkmS0mrvDDV2ByH15ha7fQI0dKpNBTwS9CCDe/GrEfq73XbTS/rHUlXOSYXr4z4j6mbDG9ejXGatHA/H3INkN2TfPoqJe/tFfJrmkJ69FAHg9VT+UYLeY8chx+zTo7TWYLbRJQbbM3gP+QpkHo5qmGbr/x2w6Z89pkZPAL4mER9cZTTCq0IzztxeWMDgYblpCiYDA22F8kNILmPhDkO1GGpJjtCMB6Ifl9zR1TFg5QYPQ1Zoe2Xn5w1pn06SJuQ44fc64ZTU1n/uwYAGHveiAZNhv9wbdoXm08iltup+OIHZdRVmNEogkaGYzBDcUbb/VVRu46gSQ3S2G7VDlScwIlq7a5ffefPXW7Havac7zRSTE75/llXiUufkY2ceQGZfZSCvswslz6Yl4rwodsSTwRE8ltZCD5wnBUE4kUUd31dLapwq5IuUyDuE+ZqMmZsqhCggs17xbF1Q5+pwI2uLiPqi2V/if6s6K3X9mqA8dnuYRm4bn4H0ElFaD8E8wQ7V9ApzUoNdSdMxaeeDKwpK5YUj9XBE6O0ieO1/At+3XxkHDKKnYvMYv8BcnBLMMeKaEuYz1te4mZTHCcpJRNTa3bffDyTFHAybfSRgQchtcd3LfejE+gTS0sgNdu5FCXZI1D1MJPdT5frFwFGNtSysX8KXvzgBg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199015)(122000001)(38100700002)(82960400001)(38070700005)(2906002)(41300700001)(8936002)(5660300002)(4326008)(66476007)(110136005)(6512007)(26005)(6506007)(8676002)(186003)(66446008)(66556008)(66946007)(316002)(54906003)(2616005)(64756008)(76116006)(6636002)(71200400001)(91956017)(478600001)(6486002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFo4MzNsRVZJM2krQjcydVRqOCtrRVp2emUweVJ3L0pnV0RLK2cwa3JVTS9v?=
 =?utf-8?B?V2NLMHFWYTF3dlNISzFNdlMyaFVqam9xdmtEVHcxZlFlemZPZHluTlluZTdT?=
 =?utf-8?B?aVhZOHZCMm1EVXozRld2dnAwL3owSHNPaEhST3J6TllabUZMN0dzK1dudHRT?=
 =?utf-8?B?Sk04SkVKaDgzcEU5dDhUbXl0RStGRHVmU3VqRHpLc1dQMnlncitlN3pwMzZq?=
 =?utf-8?B?Skd0SXc2dTUxZ3l4Y3RZNW9DNmNOQUVoY3d1cTE0TXN4cFl1MDlYUlREdER4?=
 =?utf-8?B?RmhFb01QVzlBdGVOSFdmWmxaYVQxRSs4VklQZlFGWWNLS3FnR1kxL3pGMzc3?=
 =?utf-8?B?cHdNSm5MbnRXZmpjWkdncitJOUkvTFRvWEYva0d5QnR2aVJldW96Yi8yWG1I?=
 =?utf-8?B?UGVEOEVTTExWVzIzL2lwSzNxeElXZXh5UnBib05OVlduT3dIVGRkZlFaZHVF?=
 =?utf-8?B?TFl2UnFYRUZyYlJMd2g2WlNNL3NBaDVjc01zTlZFdE9Fd05NNDNqdy9VSTc0?=
 =?utf-8?B?cy9TVjBYaW1DVVY4d3kwK0UzaUtkdW1VdkNlOEpsWm55R2ZRWkhFczRSY2hS?=
 =?utf-8?B?Yi9SRnI1NjBtYjN4a0NMcTA0aWRkZURxdzJ3N2UzS1ozMkZ4OGR1blNiTEdp?=
 =?utf-8?B?dXBKWk5yTm5IWUtwTWI4TFNHVWM5RFYvYVpLblpjVnE2U3Q5ZCtBc3AyRFRa?=
 =?utf-8?B?MUVSdjJ6ZzRnZVF2Q1FPQ3pmaWo4aXB3R1laMmRHK1lVVm9jRVEzZzBlSFFF?=
 =?utf-8?B?VzRPZ3RsVzlVOUNyQlZYRkNYeTZuTnltM0l2T05PcllUOCtuNE1zanBJbktq?=
 =?utf-8?B?MURYaHJhOGV1VVZhNXJ5Nms3ZDd5UzJvcm1SN2RtbHZvMkZ0WTM3ZVNCNHJn?=
 =?utf-8?B?ZUFkNW5Xb0gyMHc0ZFhESkMwYzhRbWhjYm5TVGdxdU4vRVZ5Z1pubThXZHBU?=
 =?utf-8?B?VWkzdlJmK1lJeDBEMTlVNkN1ejhKbmNrMStrR0tHd3RiN0VnUkcwajVqUm5l?=
 =?utf-8?B?QVZpeGVIWGY4Nm9SOVcydzdHd3FkOEpnRVpISjVCNXpnV2NJQ2U2WThoZVI5?=
 =?utf-8?B?WFlVN0d6MUxNMVJHUTEzQ3RVT3k1UWJCQTJXcTUxSElRZXVxT0ZlWG8yRnUv?=
 =?utf-8?B?V2VvT3QzaVBndW03NzE4MWpqaVBSWkZXbGllNmNkS1l5TlJOZTVwY0h1enh6?=
 =?utf-8?B?RnlNOE0xc1FTTEROQ1U4Z1lFRFdlWFZkZDQzRmoxZzcvUGNOZU9KSDFTZzZp?=
 =?utf-8?B?TnM1dm83ZEg1ZERGNEQ1ekxGdS9pMldReGJFbnYwQm1TbnY3S2FhSHFyN21z?=
 =?utf-8?B?MThxWWhIME4yWU5XenAyQmtHR01Lc1lhQWtDMFRST2RDcmVvamIyQ1h3eTF3?=
 =?utf-8?B?NU1LeGhvV3FSdU9tclpOWVFwbGhmSXJBN3I1amZlNy9SWUhlNDFEeWFTWUFi?=
 =?utf-8?B?cHVYeDdlS0xidDJRT05VYkU2M010b05zSW9kZmp0S2o5VitoaXJaSWlibWVj?=
 =?utf-8?B?YWxQdktmeWhyZUV5MlloYmhIRDZYRzZuQVE3MFlzUzJaZVd1b1dFYzFLMjlJ?=
 =?utf-8?B?QUNOdFJqaHNVbVlrN0xuZFJ0NmhVSVNLalA0d2Q5WWRzeVFaREcxTk52eE12?=
 =?utf-8?B?MUpPTVVadk9xMk1Ba2ZKK2tUa1p4RVlCb1lPRWpXWUZ5bkZNS2MyWHdvK1lU?=
 =?utf-8?B?QTRYWHFndFJIUDY3c0JDcDRrNEgvRDRJTlBGYUxTWDRCR1BrSHM1eEp6S1Fm?=
 =?utf-8?B?bTRweFZ1dks3VjA4THRxNjg2QTVZT3RndDJhUmdlcjRzRUpHZmVrbU1qQnpl?=
 =?utf-8?B?VFdIL3JSL3NlM3lva1o4N0FzeUppcmpYdDBPWm1TQWxsTk5uS1VuazV1RU1F?=
 =?utf-8?B?ak55dTVSN2R4QklHVFArQnB0bEh5OVFlZ0FIOXZQaUNXcnoxU1BRVU1OZFNu?=
 =?utf-8?B?Yk9lMEoxYmtwL3l0clc2UUgxTGVsSmk0WERTblB2azhKWU1KalRkNUcxdE1W?=
 =?utf-8?B?c2F2dE9qMmJwcUNKKzBIMnVrNlJ1RUJoRkc2eGMrakxROG9XYUhWa2NuV2R3?=
 =?utf-8?B?UkE1cHZqdU8vY1JUcU5uZDRKWmp6SUkzMlhZbnJvOEd1Q3FCRml5azAxeWdl?=
 =?utf-8?B?NUtFZlEzNlFDbGJYRG9GajBsT1BMQTVKeXo0MmZwRHo1R2UvU2tjTlEzK3Yw?=
 =?utf-8?Q?XJeHjh317QSOhSwR8K1uxYM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA51301C78628641950F881607BA7DC4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb43010-a1f9-4415-f873-08dafdadd062
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2023 01:53:39.3193 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lg7qj8QZUkl8/nTwegebDK3iZtIsHeeowT+d8BNpQsYE3ZqLndqC+J+mvpZxJwjS79wYMjqxm5i8GCuv0LT1945t/b5+9uY1YJUthMFaUHzsCAesG1sNOMkf3M15mTkn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4707
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
 "Vivi@freedesktop.org" <Vivi@freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Winkler,
 Tomas" <tomas.winkler@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiBNb24sIDIwMjMtMDEtMjMgYXQgMDk6MzEgLTA1MDAsIFZpdmksIFJvZHJpZ28gd3JvdGU6
DQo+IE9uIFN1biwgSmFuIDIyLCAyMDIzIGF0IDA2OjU3OjI0QU0gKzAwMDAsIFVzeXNraW4sIEFs
ZXhhbmRlciB3cm90ZToNCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L3B4cC9pbnRlbF9weHBfdGVlLmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2lu
dGVsX3B4cF90ZWUuYw0KPiA+ID4gPiBpbmRleCBkNTAzNTRiZmI5OTMuLmJlZjZkN2Y4YWM1NSAx
MDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF90
ZWUuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX3Rl
ZS5jDQo+ID4gPiA+IEBAIC0xMjcsNiArMTI3LDEwIEBAIHN0YXRpYyBpbnQgaTkxNV9weHBfdGVl
X2NvbXBvbmVudF9iaW5kKHN0cnVjdA0KPiA+ID4gDQphbGFuOnNuaXAuDQoNClRoYW5rcyBKYW5p
LCBSb2RyaWdvIGFuZCBBbGV4LiBJJ2xsIHJlLXJldiB3aXRoIGFsbCBvZiBSb2RyaWdvJ3MgcmVj
b21tZW5kYXRpb246DQotIHdpbGwgYnJlYWsgZG93biB0aGUgaW5pdGlhbCBjb2RlIHNvIHdlIGRv
bnQgaGlkZSBkZXZpY2UtbGluayBiZWhpbmQgZHJtX1dBUk5fT04gDQotIHNpbmNlIGkgZGlkbnQg
aGVhciBhbnkgaGFyZCBvYmplY3Rpb24gLSBJIHdpbGwgc3RpY2sgd2l0aCBSb2RyaWdvJ3MgcmVj
b21tZW5kYXRpb24gdG8gc3Rhc2ggdGhlIGRldmljZS1saW5rLg0KLSBkb250IG5lZWQgRExfRkxB
R19QTV9SVU5USU1FDQotIHVzZSAtRU5PREVWDQoNCnByb2JhYmx5IGxpa2UgdGhpczoNCg0KCWlm
ICghSEFTX0hFQ0lfUFhQKGk5MTUpKSB7DQoJCXB4cC0+Y29tcG9uZW50X2Rldl9saW5rID0gZGV2
aWNlX2xpbmtfYWRkKGk5MTVfa2RldiwgdGVlX2tkZXYsIERMX0ZMQUdfU1RBVEVMRVNTKTsNCgkJ
aWYgKGRybV9XQVJOX09OKCZpOTE1LT5kcm0sICFweHAtPmNvbXBvbmVudF9kZXZfbGluaykpDQoJ
CQlyZXR1cm4gLUVOT0RFVjsNCgl9DQoNCg0KYWxhbjpzbmlwLg0K
