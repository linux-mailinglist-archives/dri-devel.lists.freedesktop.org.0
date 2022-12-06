Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FF664490E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 17:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E33F10E14D;
	Tue,  6 Dec 2022 16:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4410610E14D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 16:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670343608; x=1701879608;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uYHKCq4y/okUa0Akl0i9lCgRXA4SyrjPFIQelZQ3C7o=;
 b=bEjPlGpL9rLzo7ns0Ki4jRfZb8xFlHIIol9t++fdjtMDRxENL7kH8gQR
 TXf8iRgNfahzJwng5sggb1nkoHjbxD7Ph1LtAJCXLIhV+a5lNAYrxX1hR
 7KO6kiGRtGJ/rN8OjoJsCFN1g5ppWofGxox1VSH9OHX/oFVX3X/XkThy4
 Ckfh0eg/YNdJd3Wcf7BeDmYaScPq4I0Nr09xsl5Rwc3I0QumJNoI3iSHN
 wPZ22JFqo1S/BWqMbpciu6Y3GP6EnXz1Vp4/cNgoK/scLozlh8C5N5x4e
 sVP3ki2SgQ+mX1FzMEo2A70zzxlLI7uSdayFT2ri++hup6CUwpKU5oJA3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="300081380"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; d="scan'208";a="300081380"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2022 08:20:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="648387947"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; d="scan'208";a="648387947"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 06 Dec 2022 08:20:06 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 6 Dec 2022 08:20:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 6 Dec 2022 08:20:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 6 Dec 2022 08:20:05 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 6 Dec 2022 08:20:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVWk7ACwYTnDZMUfd7YcRB7cGMyTVFO4N5Nj0Li5fTs64Ymju/lepdEtHFlbJ1sxVQz4z2mzsYLHI2Qy8hcVeeTheTLpWq3NG401VTqeX/UED1PhtemLFJGGiWF3+phEdqcbrS+vNMqLaklmM9bttRLdePlrhOLwK1EGDzEzZpwQ+aeYhqmXqyLO3y90dFDxHDtiR1e3WKTxnEEMy2r2GMnGo3q73TLL4Q1t3bNztRzPnn4J8TMY16TcA72yJBk5mWrPEKqp1Niok6vnKkJj62uMdomfq96TRMzlfjFe53cJhFuCzdiKtZ7AkFKNVdUZqhD4eC2vv2bxTM6ONv14Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYHKCq4y/okUa0Akl0i9lCgRXA4SyrjPFIQelZQ3C7o=;
 b=IKaV1Sf6eJU4aRvSNUtDDqBWVcGk7Dylcb6Ji1kBvxWAI+HKCfDk8J4Txp+B+eADnAK9H23Bsaxng+WZYij9Vu2I1kl6cqnGfDlJ9w5QgQDoXUBcxJAdremVbbfc4n0x+TeXPl4Q28T/j4ZRDxhZ26K/kzGa9W8KnKY7oueH1Vb8GaTpPV4M7U5ZDSIry+A82t7YOHKyeF5KORgtX7M2N8Wma2Alt5mVSktKq3Nl4AwwZsbD1RN+G3CfP5Dptk7UzqTanarIW7H6xB5TptTmY51qrskXyWvdqeboj+L8bAiO8PNgvugziu7fetuZqlLgHpO5Ev2uM0SynMw9iZ6jIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 DS0PR11MB7684.namprd11.prod.outlook.com (2603:10b6:8:dd::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14; Tue, 6 Dec 2022 16:20:01 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::d9e7:a3d2:e99:632a]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::d9e7:a3d2:e99:632a%8]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 16:20:01 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "quic_charante@quicinc.com" <quic_charante@quicinc.com>,
 "cuigaosheng1@huawei.com" <cuigaosheng1@huawei.com>, "tjmercier@google.com"
 <tjmercier@google.com>, "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
Subject: RE: [PATCH] dma-buf: fix dma_buf_export init order
Thread-Topic: [PATCH] dma-buf: fix dma_buf_export init order
Thread-Index: AQHZCYUzJT0mdg6wYkWWO6n+GE5xFq5hAwkg
Date: Tue, 6 Dec 2022 16:20:01 +0000
Message-ID: <DM5PR11MB1324F5F49A28EFDA67B1C258C11B9@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20221206151207.8801-1-christian.koenig@amd.com>
In-Reply-To: <20221206151207.8801-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR11MB1324:EE_|DS0PR11MB7684:EE_
x-ms-office365-filtering-correlation-id: f502a3c6-5876-4269-c3be-08dad7a5ba16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A/XuPubBrpUsC9IMBMKU4oG7Nf/uyktENkugRMTiG/QBMWEFEE9GIeJacalAV8bYac6rsDA+8RPvn/q1W9A8TcvCdsT5R6M9Y/WxkD+b4EOXrAA3PVDwjmLXPxxdLllwr6rOChd6N8RnipbG93vYy2ynRLdmqCmPrkwSxPeKHJ1pua90vGLPoS7lm+f5clKzDPRRxI0TaeQBVzu2Cuhuyo5Q8/tpQBFTdL/KfxVwGb5GhNuWkW2sQn1N5hEeJO91ttSoN7ySD8amJbk8sQU2N0a9ufL/Ft/dxmd2FLwo8zXk4DyV+RxhQECvgrgM1LuWKRXf2rN6Qsb/ierAoHY7Dz7Dsk2vV7gPGXsJrBpBFy7b1+qriWPiUarmEU5jCvLFzCkbRTwmwjz704BnzLPqUbyvOxm+ptY+GTu+yNox3LGGEKFE8L3XfRD9UPKsRqP5BEkkU2YtdyFa9tIT4TZ+2Cb/XAJDOtgb+e+GoDhi8odewEZRTZevVdhkaBiX7CpBWsijdymw9+r79dLnhVMax5ORJs66EganrlazQZohp0AVysUl5c3hw/rSVcreQA3+nDHvIsIaVIAj1l2bjUqXD/9t8br2tKfHzM6dBwn7LwHclYZ7TuX1GEuv+N+12WFyT7rc+ybbxUp3cEprOzzMJetrsesJ3rXgXHYAajgvJxAlWXiOJ83gy3FfkVgWXi6kGHc/xbR9GOGEMI2C0KTRmg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(366004)(39860400002)(396003)(346002)(451199015)(38070700005)(86362001)(4326008)(8936002)(2906002)(66946007)(66446008)(66476007)(66556008)(76116006)(41300700001)(8676002)(64756008)(38100700002)(122000001)(83380400001)(33656002)(110136005)(316002)(82960400001)(54906003)(5660300002)(52536014)(478600001)(186003)(55016003)(9686003)(66574015)(6506007)(26005)(7696005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0k5aElyT1phRWdEeSsxR1dGdGJta05nWnFaRkRxNXdyNkpwdldnbkZIbks0?=
 =?utf-8?B?REQyMFRPeDMrdy9pMTFSbG05Qld2ZTZ4d0hTSVZ4STBJRDdaKzYvZ2NtcjB5?=
 =?utf-8?B?eUNadm8ybmhXOGZGUTh0SW5HUnhBb21rZTRVdkFoMURnRG9iR0o0Y01WVGNG?=
 =?utf-8?B?akRrVVQ5RlVHRkZyL2N6SlFaRWc5WldmVEx2SmFHYjRVTFliTzJsMnRwZFc5?=
 =?utf-8?B?UUIxYkJPemp3M2xuQnd6YXgreXgvTWgzWWFreXJJaUZ3WjQ4OXVZRkhEWWhZ?=
 =?utf-8?B?eFJVaFRTbCtTZG5zN09kTkJZNWhtWVNBWmp2NGIzbjhtRXNSQWpUOUtwSFNJ?=
 =?utf-8?B?eEVSMzEwQmtkYzFUKzVXSUJEc3NBYTNvdTMzTUFodEVwVTJ0aDFYZnEzV0Yz?=
 =?utf-8?B?SHorYzlhUklQR01GaTRLdS8raHZYc0xPc3lQWHV5cFpwTmRKaTFIVEdyamd3?=
 =?utf-8?B?djZMdVZvWHcrVWJWemo3UlJURlRVRW1JMnZ3T2Q3WVlHRloyTVN2UjhtRHRz?=
 =?utf-8?B?eFZMM09LVmZBZjVjanR0WmhiZ0N1MGlWTDdQWGpzeXkzM3puU3k0Q1hQNEN2?=
 =?utf-8?B?M1pKam9MSWxaMVZsWG5BYm0wTjNKTFFHYlFGQ1V0MG9NRXlKYlVQQ3V6ekw3?=
 =?utf-8?B?b2Z3VnUyYnpiRWg4Uy9xWVIva1JWU0ZUVmxhU250eDBDSkZzQlZndmxvUEZM?=
 =?utf-8?B?bzdiMncrUHh2RWdIVEtEQVp1c3ZTMTg5OHEwMW5Wem0vWXA0UHZReEhoYTZ5?=
 =?utf-8?B?RXl0YXhMQjNGY2R3a2hMSk9ucUJxZjBjNUIzZ0VCSHUvS1M3UGs5bTNiUUZK?=
 =?utf-8?B?aWgwL1MrakpKS1k3aXlmd1BVYXg3OWpXVXoyVHJ3SS9ueWR2REtHcFFTckpH?=
 =?utf-8?B?TGVBS291MFJ6S0dZeXdmRG5nMHBFSEJrekxqWTIxNGZGRU1EbUc1ODdSVlhq?=
 =?utf-8?B?OHhESTYva0ZCTnNjUXZIeWU4cTRCako4RFN1eldlYVRlT0ZBODVYK0V0N0dM?=
 =?utf-8?B?OVloRk1jL0N3dlgwZmVlWlhaa0o1TnFvZ2VpM2kra20wQ2laTDVhekRRaHJ3?=
 =?utf-8?B?dnB0QU5MRkVRcElDTE1seXIxNiszOUh6ays4dnl2SFpqYWoyR2lzNFowVUF1?=
 =?utf-8?B?WWVkMVV3amdIdTJIYW1BdlBEQjArMFFiNEVmM0FSQ1Jta2I4b1NxOXRKVmc4?=
 =?utf-8?B?dEN2T2VmNkVJWHU2M2g5OGdsVnNyRlN1dDJmRHdUOEljVU5vQmxKWkphNjBl?=
 =?utf-8?B?SjVMcm5tWmFab3VaYWVvMS9IbThGalp0bXByQUhhT3pDL3l1ckN2eWNKNm9o?=
 =?utf-8?B?emJaa1Boa2tqKzNTMFB2eEZYZzdIV3VkWnpCT0lNRHd2b1pxYityV3BOcHpw?=
 =?utf-8?B?U25RRFVieUsyZzF6SE9KdFcxR2htYWtqUy84bkw0Vi9SNTY4V1plSVd1eGtC?=
 =?utf-8?B?bG5aY3pNTEIwVXh3bmFlejJIZkZmZ0Uyajd4VmRDU1FheHp3QnhwQ09VTVdT?=
 =?utf-8?B?YUkyK3RtejE5MGhmRFJuTXhPZ3RoR0JwTnhES3hXSUtpMVBlTGJYNjhpcUNC?=
 =?utf-8?B?bmZ2K3pjaFFiUkkzaWRmaEdZYWVRS3hPY1pYdU0yTXBXVWhsRFEzTEwzZWxV?=
 =?utf-8?B?Y2NmKzJZYXY4MEhBUGR3cW91UUd2MlRjOUtHL2RaeUxXMzhCQ3kyMDJyaWta?=
 =?utf-8?B?bzh3bTkrOHlxb0Y0SThHRHRvWERoa1puZW9nZVIzSXBDZWEwb0RCcmJya3Zo?=
 =?utf-8?B?Q3Myb0lQYVJHTC9NTXVGdkF0UHJuOUFZZEpHK3AxZUdRU2lxKzBrT3NZdlhz?=
 =?utf-8?B?azNMajZEaS9pR3EzVDNCVzg0amxwN2VFOERucGtWUVRxK05pUlk1VlR4WkdS?=
 =?utf-8?B?UU5ZaUZBQ2xabXNsUXFDeWVENlQrL3RQeTkyeDBhbGFuQ2dWWGZGMWxoT0hM?=
 =?utf-8?B?dk8vd2hZRXBjeUh2Y2FtQ09qajY3bVh2NmFCMXhVZU8zaVhiRWREc2JsdlVB?=
 =?utf-8?B?MzJMbWw0aXRGTGU1bWtDV2ZvclVqZk00YUlGY2JobXRaazllUWdKcEFndE9Z?=
 =?utf-8?B?ekZlUVRhWWpkMGt5MDRlYWYyQ3FtUHA2MUlsK2hJbHlCVmozczM3OVFkVWVJ?=
 =?utf-8?Q?lUGLYk4bTehmPb2VtzyiU2EMM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f502a3c6-5876-4269-c3be-08dad7a5ba16
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 16:20:01.7351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oHF3oXzVSPCKUF3aX+albwtkG3U+yycc3cgK9p5LtTN95wTmhX2pR1Md7xozFsa/wd1149XzFOB2h+3o0ryxh+rycBSdAmQVmkyLqnJbEJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7684
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPkNocmlzdGlhbiBL
w7ZuaWcNCj5TZW50OiBUdWVzZGF5LCBEZWNlbWJlciA2LCAyMDIyIDEwOjEyIEFNDQo+VG86IHF1
aWNfY2hhcmFudGVAcXVpY2luYy5jb207IGN1aWdhb3NoZW5nMUBodWF3ZWkuY29tOw0KPnRqbWVy
Y2llckBnb29nbGUuY29tOyBzdW1pdC5zZW13YWxAbGluYXJvLm9yZw0KPkNjOiBsaW5hcm8tbW0t
c2lnQGxpc3RzLmxpbmFyby5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxp
bnV4LQ0KPm1lZGlhQHZnZXIua2VybmVsLm9yZw0KPlN1YmplY3Q6IFtQQVRDSF0gZG1hLWJ1Zjog
Zml4IGRtYV9idWZfZXhwb3J0IGluaXQgb3JkZXINCj4NCj5UaGUgaW5pdCBvcmRlciBhbmQgcmVz
dWx0aW5nIGVycm9yIGhhbmRsaW5nIGluIGRtYV9idWZfZXhwb3J0DQo+d2FzIHByZXR0eSBtZXNz
eS4NCj4NCj5TdWJvcmRpbmF0ZSBvYmplY3RzIGxpa2UgdGhlIGZpbGUgYW5kIHRoZSBzeXNmcyBr
ZXJuZWwgb2JqZWN0cw0KPndlcmUgaW5pdGlhbGl6aW5nIGFuZCB3aXJpbmcgaXRzZWxmIHVwIHdp
dGggdGhlIG9iamVjdCBpbiB0aGUNCj53cm9uZyBvcmRlciByZXN1bHRpbmcgbm90IG9ubHkgaW4g
Y29tcGxpY2F0aW5nIGFuZCBwYXJ0aWFsbHkNCj5pbmNvcnJlY3QgZXJyb3IgaGFuZGxpbmcsIGJ1
dCBhbHNvIGluIHB1Ymxpc2hpbmcgb25seSBoYWx2ZQ0KPmluaXRpYWxpemVkIERNQS1idWYgb2Jq
ZWN0cy4NCj4NCj5DbGVhbiB0aGlzIHVwIHRob3VnaHRmdWxseSBieSBhbGxvY2F0aW5nIHRoZSBm
aWxlIGluZGVwZW5kZW50DQo+b2YgdGhlIERNQS1idWYgb2JqZWN0LiBUaGVuIGFsbG9jYXRlIGFu
ZCBpbml0aWFsaXplIHRoZSBETUEtYnVmDQo+b2JqZWN0IGl0c2VsZiwgYmVmb3JlIHB1Ymxpc2hp
bmcgaXQgdGhyb3VnaCBzeXNmcy4gSWYgZXZlcnl0aGluZw0KPndvcmtzIGFzIGV4cGVjdGVkIHRo
ZSBmaWxlIGlzIHRoZW4gY29ubmVjdGVkIHdpdGggdGhlIERNQS1idWYNCj5vYmplY3QgYW5kIHB1
Ymxpc2ggaXQgdGhyb3VnaCBkZWJ1Z2ZzLg0KPg0KPkFsc28gYWRkcyB0aGUgbWlzc2luZyBkbWFf
cmVzdl9maW5pKCkgaW50byB0aGUgZXJyb3IgaGFuZGxpbmcuDQo+DQo+U2lnbmVkLW9mZi1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPi0tLQ0KPiBkcml2
ZXJzL2RtYS1idWYvZG1hLWJ1Zi1zeXNmcy1zdGF0cy5jIHwgIDcgKy0tDQo+IGRyaXZlcnMvZG1h
LWJ1Zi9kbWEtYnVmLXN5c2ZzLXN0YXRzLmggfCAgNCArLQ0KPiBkcml2ZXJzL2RtYS1idWYvZG1h
LWJ1Zi5jICAgICAgICAgICAgIHwgNjUgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tDQo+IDMg
ZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pDQo+DQo+ZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLXN5c2ZzLXN0YXRzLmMgYi9kcml2ZXJz
L2RtYS1idWYvZG1hLQ0KPmJ1Zi1zeXNmcy1zdGF0cy5jDQo+aW5kZXggMmJiYTBiYWJjYjYyLi40
YjY4MGUxMGMxNWEgMTAwNjQ0DQo+LS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYtc3lzZnMt
c3RhdHMuYw0KPisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLXN5c2ZzLXN0YXRzLmMNCj5A
QCAtMTY4LDE0ICsxNjgsMTEgQEAgdm9pZCBkbWFfYnVmX3VuaW5pdF9zeXNmc19zdGF0aXN0aWNz
KHZvaWQpDQo+IAlrc2V0X3VucmVnaXN0ZXIoZG1hX2J1Zl9zdGF0c19rc2V0KTsNCj4gfQ0KPg0K
Pi1pbnQgZG1hX2J1Zl9zdGF0c19zZXR1cChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmKQ0KPitpbnQg
ZG1hX2J1Zl9zdGF0c19zZXR1cChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLCBzdHJ1Y3QgZmlsZSAq
ZmlsZSkNCj4gew0KPiAJc3RydWN0IGRtYV9idWZfc3lzZnNfZW50cnkgKnN5c2ZzX2VudHJ5Ow0K
PiAJaW50IHJldDsNCj4NCj4tCWlmICghZG1hYnVmIHx8ICFkbWFidWYtPmZpbGUpDQo+LQkJcmV0
dXJuIC1FSU5WQUw7DQo+LQ0KPiAJaWYgKCFkbWFidWYtPmV4cF9uYW1lKSB7DQo+IAkJcHJfZXJy
KCJleHBvcnRlciBuYW1lIG11c3Qgbm90IGJlIGVtcHR5IGlmIHN0YXRzDQo+bmVlZGVkXG4iKTsN
Cj4gCQlyZXR1cm4gLUVJTlZBTDsNCj5AQCAtMTkyLDcgKzE4OSw3IEBAIGludCBkbWFfYnVmX3N0
YXRzX3NldHVwKHN0cnVjdCBkbWFfYnVmICpkbWFidWYpDQo+DQo+IAkvKiBjcmVhdGUgdGhlIGRp
cmVjdG9yeSBmb3IgYnVmZmVyIHN0YXRzICovDQo+IAlyZXQgPSBrb2JqZWN0X2luaXRfYW5kX2Fk
ZCgmc3lzZnNfZW50cnktPmtvYmosICZkbWFfYnVmX2t0eXBlLA0KPk5VTEwsDQo+LQkJCQkgICAi
JWx1IiwgZmlsZV9pbm9kZShkbWFidWYtPmZpbGUpLT5pX2lubyk7DQo+KwkJCQkgICAiJWx1Iiwg
ZmlsZV9pbm9kZShmaWxlKS0+aV9pbm8pOw0KPiAJaWYgKHJldCkNCj4gCQlnb3RvIGVycl9zeXNm
c19kbWFidWY7DQo+DQo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLXN5c2Zz
LXN0YXRzLmggYi9kcml2ZXJzL2RtYS1idWYvZG1hLQ0KPmJ1Zi1zeXNmcy1zdGF0cy5oDQo+aW5k
ZXggYTQ5YzZlMjY1MGNjLi43YThhOTk1Yjc1YmEgMTAwNjQ0DQo+LS0tIGEvZHJpdmVycy9kbWEt
YnVmL2RtYS1idWYtc3lzZnMtc3RhdHMuaA0KPisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVm
LXN5c2ZzLXN0YXRzLmgNCj5AQCAtMTMsNyArMTMsNyBAQA0KPiBpbnQgZG1hX2J1Zl9pbml0X3N5
c2ZzX3N0YXRpc3RpY3Modm9pZCk7DQo+IHZvaWQgZG1hX2J1Zl91bmluaXRfc3lzZnNfc3RhdGlz
dGljcyh2b2lkKTsNCj4NCj4taW50IGRtYV9idWZfc3RhdHNfc2V0dXAoc3RydWN0IGRtYV9idWYg
KmRtYWJ1Zik7DQo+K2ludCBkbWFfYnVmX3N0YXRzX3NldHVwKHN0cnVjdCBkbWFfYnVmICpkbWFi
dWYsIHN0cnVjdCBmaWxlICpmaWxlKTsNCj4NCj4gdm9pZCBkbWFfYnVmX3N0YXRzX3RlYXJkb3du
KHN0cnVjdCBkbWFfYnVmICpkbWFidWYpOw0KPiAjZWxzZQ0KPkBAIC0yNSw3ICsyNSw3IEBAIHN0
YXRpYyBpbmxpbmUgaW50IGRtYV9idWZfaW5pdF9zeXNmc19zdGF0aXN0aWNzKHZvaWQpDQo+DQo+
IHN0YXRpYyBpbmxpbmUgdm9pZCBkbWFfYnVmX3VuaW5pdF9zeXNmc19zdGF0aXN0aWNzKHZvaWQp
IHt9DQo+DQo+LXN0YXRpYyBpbmxpbmUgaW50IGRtYV9idWZfc3RhdHNfc2V0dXAoc3RydWN0IGRt
YV9idWYgKmRtYWJ1ZikNCj4rc3RhdGljIGlubGluZSBpbnQgZG1hX2J1Zl9zdGF0c19zZXR1cChz
dHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLCBzdHJ1Y3QgZmlsZQ0KPipmaWxlKQ0KPiB7DQo+IAlyZXR1
cm4gMDsNCj4gfQ0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIGIvZHJp
dmVycy9kbWEtYnVmL2RtYS1idWYuYw0KPmluZGV4IGU2ZjM2YzAxNGM0Yy4uZWEwODA0OWI3MGFl
IDEwMDY0NA0KPi0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMNCj4rKysgYi9kcml2ZXJz
L2RtYS1idWYvZG1hLWJ1Zi5jDQo+QEAgLTYxNCwxOSArNjE0LDExIEBAIHN0cnVjdCBkbWFfYnVm
ICpkbWFfYnVmX2V4cG9ydChjb25zdCBzdHJ1Y3QNCj5kbWFfYnVmX2V4cG9ydF9pbmZvICpleHBf
aW5mbykNCj4gCXNpemVfdCBhbGxvY19zaXplID0gc2l6ZW9mKHN0cnVjdCBkbWFfYnVmKTsNCj4g
CWludCByZXQ7DQo+DQo+LQlpZiAoIWV4cF9pbmZvLT5yZXN2KQ0KPi0JCWFsbG9jX3NpemUgKz0g
c2l6ZW9mKHN0cnVjdCBkbWFfcmVzdik7DQo+LQllbHNlDQo+LQkJLyogcHJldmVudCAmZG1hX2J1
ZlsxXSA9PSBkbWFfYnVmLT5yZXN2ICovDQo+LQkJYWxsb2Nfc2l6ZSArPSAxOw0KPi0NCj4tCWlm
IChXQVJOX09OKCFleHBfaW5mby0+cHJpdg0KPi0JCQkgIHx8ICFleHBfaW5mby0+b3BzDQo+LQkJ
CSAgfHwgIWV4cF9pbmZvLT5vcHMtPm1hcF9kbWFfYnVmDQo+LQkJCSAgfHwgIWV4cF9pbmZvLT5v
cHMtPnVubWFwX2RtYV9idWYNCj4tCQkJICB8fCAhZXhwX2luZm8tPm9wcy0+cmVsZWFzZSkpIHsN
Cj4rCWlmIChXQVJOX09OKCFleHBfaW5mby0+cHJpdiB8fCAhZXhwX2luZm8tPm9wcw0KPisJCSAg
ICB8fCAhZXhwX2luZm8tPm9wcy0+bWFwX2RtYV9idWYNCj4rCQkgICAgfHwgIWV4cF9pbmZvLT5v
cHMtPnVubWFwX2RtYV9idWYNCj4rCQkgICAgfHwgIWV4cF9pbmZvLT5vcHMtPnJlbGVhc2UpKQ0K
PiAJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0KPi0JfQ0KPg0KPiAJaWYgKFdBUk5fT04oZXhw
X2luZm8tPm9wcy0+Y2FjaGVfc2d0X21hcHBpbmcgJiYNCj4gCQkgICAgKGV4cF9pbmZvLT5vcHMt
PnBpbiB8fCBleHBfaW5mby0+b3BzLT51bnBpbikpKQ0KPkBAIC02MzgsMTAgKzYzMCwyMSBAQCBz
dHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1Zl9leHBvcnQoY29uc3Qgc3RydWN0DQo+ZG1hX2J1Zl9leHBv
cnRfaW5mbyAqZXhwX2luZm8pDQo+IAlpZiAoIXRyeV9tb2R1bGVfZ2V0KGV4cF9pbmZvLT5vd25l
cikpDQo+IAkJcmV0dXJuIEVSUl9QVFIoLUVOT0VOVCk7DQo+DQo+KwlmaWxlID0gZG1hX2J1Zl9n
ZXRmaWxlKGV4cF9pbmZvLT5zaXplLCBleHBfaW5mby0+ZmxhZ3MpOw0KDQpIaSBDaHJpc3RpYW4s
DQoNCmRtYV9idWZfZ2V0ZmlsZSB0YWtlcyBhIGRtYWJ1ZiwgaGVyZSB5b3UgaGF2ZSBhIHNpemU/
DQoNCkRpZCB5b3UgY2hhbmdlIHRoaXMgZnVuY3Rpb24gc29tZXdoZXJlPw0KDQp3aXRoIHRoYXQg
YWRkcmVzc2VkLi4uLg0KDQpUaGlzIGNsZWFudXAgbWFrZXMgc2Vuc2UgdG8gbWUuDQoNClJldmll
d2VkLWJ5OiBNaWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4NCg0KTQ0K
DQo+KwlpZiAoSVNfRVJSKGZpbGUpKSB7DQo+KwkJcmV0ID0gUFRSX0VSUihmaWxlKTsNCj4rCQln
b3RvIGVycl9tb2R1bGU7DQo+Kwl9DQo+Kw0KPisJaWYgKCFleHBfaW5mby0+cmVzdikNCj4rCQlh
bGxvY19zaXplICs9IHNpemVvZihzdHJ1Y3QgZG1hX3Jlc3YpOw0KPisJZWxzZQ0KPisJCS8qIHBy
ZXZlbnQgJmRtYV9idWZbMV0gPT0gZG1hX2J1Zi0+cmVzdiAqLw0KPisJCWFsbG9jX3NpemUgKz0g
MTsNCj4gCWRtYWJ1ZiA9IGt6YWxsb2MoYWxsb2Nfc2l6ZSwgR0ZQX0tFUk5FTCk7DQo+IAlpZiAo
IWRtYWJ1Zikgew0KPiAJCXJldCA9IC1FTk9NRU07DQo+LQkJZ290byBlcnJfbW9kdWxlOw0KPisJ
CWdvdG8gZXJyX2ZpbGU7DQo+IAl9DQo+DQo+IAlkbWFidWYtPnByaXYgPSBleHBfaW5mby0+cHJp
djsNCj5AQCAtNjUzLDQ0ICs2NTYsMzYgQEAgc3RydWN0IGRtYV9idWYgKmRtYV9idWZfZXhwb3J0
KGNvbnN0IHN0cnVjdA0KPmRtYV9idWZfZXhwb3J0X2luZm8gKmV4cF9pbmZvKQ0KPiAJaW5pdF93
YWl0cXVldWVfaGVhZCgmZG1hYnVmLT5wb2xsKTsNCj4gCWRtYWJ1Zi0+Y2JfaW4ucG9sbCA9IGRt
YWJ1Zi0+Y2Jfb3V0LnBvbGwgPSAmZG1hYnVmLT5wb2xsOw0KPiAJZG1hYnVmLT5jYl9pbi5hY3Rp
dmUgPSBkbWFidWYtPmNiX291dC5hY3RpdmUgPSAwOw0KPisJbXV0ZXhfaW5pdCgmZG1hYnVmLT5s
b2NrKTsNCj4rCUlOSVRfTElTVF9IRUFEKCZkbWFidWYtPmF0dGFjaG1lbnRzKTsNCj4NCj4gCWlm
ICghcmVzdikgew0KPi0JCXJlc3YgPSAoc3RydWN0IGRtYV9yZXN2ICopJmRtYWJ1ZlsxXTsNCj4t
CQlkbWFfcmVzdl9pbml0KHJlc3YpOw0KPisJCWRtYWJ1Zi0+cmVzdiA9IChzdHJ1Y3QgZG1hX3Jl
c3YgKikmZG1hYnVmWzFdOw0KPisJCWRtYV9yZXN2X2luaXQoZG1hYnVmLT5yZXN2KTsNCj4rCX0g
ZWxzZSB7DQo+KwkJZG1hYnVmLT5yZXN2ID0gcmVzdjsNCj4gCX0NCj4tCWRtYWJ1Zi0+cmVzdiA9
IHJlc3Y7DQo+DQo+LQlmaWxlID0gZG1hX2J1Zl9nZXRmaWxlKGRtYWJ1ZiwgZXhwX2luZm8tPmZs
YWdzKTsNCj4tCWlmIChJU19FUlIoZmlsZSkpIHsNCj4tCQlyZXQgPSBQVFJfRVJSKGZpbGUpOw0K
PisJcmV0ID0gZG1hX2J1Zl9zdGF0c19zZXR1cChkbWFidWYsIGZpbGUpOw0KPisJaWYgKHJldCkN
Cj4gCQlnb3RvIGVycl9kbWFidWY7DQo+LQl9DQo+DQo+KwlmaWxlLT5wcml2YXRlX2RhdGEgPSBk
bWFidWY7DQo+KwlmaWxlLT5mX3BhdGguZGVudHJ5LT5kX2ZzZGF0YSA9IGRtYWJ1ZjsNCj4gCWRt
YWJ1Zi0+ZmlsZSA9IGZpbGU7DQo+DQo+LQltdXRleF9pbml0KCZkbWFidWYtPmxvY2spOw0KPi0J
SU5JVF9MSVNUX0hFQUQoJmRtYWJ1Zi0+YXR0YWNobWVudHMpOw0KPi0NCj4gCW11dGV4X2xvY2so
JmRiX2xpc3QubG9jayk7DQo+IAlsaXN0X2FkZCgmZG1hYnVmLT5saXN0X25vZGUsICZkYl9saXN0
LmhlYWQpOw0KPiAJbXV0ZXhfdW5sb2NrKCZkYl9saXN0LmxvY2spOw0KPg0KPi0JcmV0ID0gZG1h
X2J1Zl9zdGF0c19zZXR1cChkbWFidWYpOw0KPi0JaWYgKHJldCkNCj4tCQlnb3RvIGVycl9zeXNm
czsNCj4tDQo+IAlyZXR1cm4gZG1hYnVmOw0KPg0KPi1lcnJfc3lzZnM6DQo+LQkvKg0KPi0JICog
U2V0IGZpbGUtPmZfcGF0aC5kZW50cnktPmRfZnNkYXRhIHRvIE5VTEwgc28gdGhhdCB3aGVuDQo+
LQkgKiBkbWFfYnVmX3JlbGVhc2UoKSBnZXRzIGludm9rZWQgYnkgZGVudHJ5X29wcywgaXQgZXhp
dHMNCj4tCSAqIGVhcmx5IGJlZm9yZSBjYWxsaW5nIHRoZSByZWxlYXNlKCkgZG1hX2J1ZiBvcC4N
Cj4tCSAqLw0KPi0JZmlsZS0+Zl9wYXRoLmRlbnRyeS0+ZF9mc2RhdGEgPSBOVUxMOw0KPi0JZnB1
dChmaWxlKTsNCj4gZXJyX2RtYWJ1ZjoNCj4rCWlmICghcmVzdikNCj4rCQlkbWFfcmVzdl9maW5p
KGRtYWJ1Zi0+cmVzdik7DQo+IAlrZnJlZShkbWFidWYpOw0KPitlcnJfZmlsZToNCj4rCWZwdXQo
ZmlsZSk7DQo+IGVycl9tb2R1bGU6DQo+IAltb2R1bGVfcHV0KGV4cF9pbmZvLT5vd25lcik7DQo+
IAlyZXR1cm4gRVJSX1BUUihyZXQpOw0KPi0tDQo+Mi4zNC4xDQoNCg==
