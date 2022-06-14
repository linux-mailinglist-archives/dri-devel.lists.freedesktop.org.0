Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 626DD54BC92
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 23:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36DEC112F1A;
	Tue, 14 Jun 2022 21:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0B3112F12;
 Tue, 14 Jun 2022 21:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655241165; x=1686777165;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NKaONLNObt1/mT9zhKyQT1R6z18sMfrDGvpmLrJ0GEY=;
 b=VOfgjwqIZ01akfPV+5CnXp8zKFjmym+CRXaBGR2HChSZSX1YCuMnFKxt
 eTQ2kQNFcL3TQ2NGMeUTV+CwGivqkPHd+P9xfLB5C5ZEYqORQnpvDFQOJ
 EYLSYGnF7oIR17vRLOZefIAUZSmLdsW8s3c04M8w+qRD80B+SY3XFziYs
 Gmq2tfNerZT7WIqbSDZn3g8pUn3Zqo1weYTuOB3nxqvBT/g3KeKkeidHj
 hhRqQTZT8euO9V6tbbw6uqAavaxCliG4m9G9ACRoU/ZnHImKdrxHI7LOD
 5S7BzamKj54TWZeCO0Y+ojec37H48badUPjbXXVg1YNYe0vlFszkXNSRa w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="304167960"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="304167960"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 14:12:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="674109754"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2022 14:12:45 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 14 Jun 2022 14:12:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 14 Jun 2022 14:12:44 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 14 Jun 2022 14:12:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPwEZgtOZ6pv32u6tcDwc370dtNxO+UCnkesQztw8MSmJmGrbBM8/Mr0juh+tZ2ukC0IRTWiVLs9a10VrIFNm6vPsDZT5TvYxLRa/n4E5NV7m83yekCKIZMkuYMOUosbKFVobWIfdcrs1yegwRSzFd5HOzHzFxr6ub3cz0Jz2+ZniDf+JfEC5XpKFZe1FmWTzAjNfR3qWsSbElGNh38OhDbxJ/AfqgFgT2kd7pq+Y6UvkTT4zg4Q5bWB3vNGT+nZyHHAS/A1VAtuXZsqDxxmonhPRLsUkMfSE8pxZSocr83iL84cp5SVECOtmGEOW9xqmhu68HHYmJAqXN6EkWIrsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKaONLNObt1/mT9zhKyQT1R6z18sMfrDGvpmLrJ0GEY=;
 b=lASAC1jDBmepaL4TjeTuhGIi295WWC/vD1xc4UVKU3hsaMl6zYo7TjlqUEAkz3t+2xECGWlQeZ0vny5P6T8D3uhH0NZQ7Pq8kRsHhYph2N+9AsUQwsvj/7v1VOAyJENrK+yji0ecU5DiDUPELXiGev+Ai2iZJbrKO6+o9yLvTMDVrBGGNgufMU3L8C1mtTpNGu+JeSrdp7Tyu8Rv1Nn1NUSIKS4pH+8ZAGCEIoTMlSQSf2nBYz5XOmr0ZpnWx4rL7Sb0UK5P5pqy5sZYWFTXKkzN/xnKoq6btV9C4axF3R72GRijL/MMXzJ5529fHqZN/ajgj/qvijE3kE2mQZxz6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN6PR11MB1633.namprd11.prod.outlook.com (2603:10b6:405:e::22)
 by CY4PR11MB1287.namprd11.prod.outlook.com (2603:10b6:903:2d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Tue, 14 Jun
 2022 21:12:42 +0000
Received: from BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::98ce:859e:1d00:e639]) by BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::98ce:859e:1d00:e639%7]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 21:12:41 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>
Subject: RE: [Intel-gfx] [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design
 document
Thread-Topic: [Intel-gfx] [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design
 document
Thread-Index: AQHYahyHcBOgLgTuZ0CGbr/thXg7iK06ssGAgABlXACAAY17AIAABqkAgAC0T4CAART+gIAF2aKAgAASeoCAADYzAIAAp/2AgADtzACAAAMaAIABGy2AgABO/ICAAL5sAIAAERiAgAAGnACAAJ2pgIADjojQgAEuFQCAANpQAIAApvMAgAA3TlA=
Date: Tue, 14 Jun 2022 21:12:41 +0000
Message-ID: <BN6PR11MB1633E5E72A74D3E09DBB208392AA9@BN6PR11MB1633.namprd11.prod.outlook.com>
References: <CAOFGe97UDd2S+LdKeOWubFvc4cNy6KbRTtCPKUbwd8PnZPuvMQ@mail.gmail.com>
 <54fb6c28-7954-123e-edd6-ba6c15b6d36e@intel.com>
 <20220609193150.GG4461@nvishwa1-DESK>
 <891017f7-e276-66a1-dd9b-cbebc8f8a00d@intel.com>
 <20220610075434.GA376@nvishwa1-DESK>
 <df9795c0-3b73-fe79-134b-4bd9a3890059@intel.com>
 <20220610174228.GE376@nvishwa1-DESK>
 <BN6PR11MB1633E5329618944A94D5D0A792AB9@BN6PR11MB1633.namprd11.prod.outlook.com>
 <20220613180237.GJ376@nvishwa1-DESK>
 <e028b21b-a2bb-9649-06b0-9139462d107a@intel.com>
 <20220614170131.GN376@nvishwa1-DESK>
In-Reply-To: <20220614170131.GN376@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31b81a23-c7cf-4af0-b3c5-08da4e4a9e63
x-ms-traffictypediagnostic: CY4PR11MB1287:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR11MB12873EDD629088FB3430E8E792AA9@CY4PR11MB1287.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qG9qsI5GzTd3oBIfPDAL5Cy+5EBumBxm8OP7kQoSwO5Nj9Xpwc6geKTNqx/On/nHZGdXw+QSEsBWUEb4Jz8LZ8eQPscLwJIvxpE4ZWDNJG7OX13CGvfWwK2sanUOhudAmJCqUOXq8RcD/OpYi5WbCNEoz1fYWU+rTOR7gsKhOzU4etf9PvqY17qeMZHRbPNmktaTw348nmoANqW3k37R8I8pHlEtOeJufThMHD6koirEZKYmnPBkPGcAgp6HTzeKOMgmKTGcIcZ+o5kINUWutD2mukYbaV/IBE7tpRB9TtP1bAiDi2qkT1Vr5bTSMsWF7dBdQO2XTKnFFNh/JJDhaxrtL50z7bb/TOwiG4shRZuKEVhbEuLqVLah+0cX37KPYa8Rj1py07v+h+JEHjF/4FNMhLAX5Tk+7QwOeLQ77YjhNbP3KWpSN4XNhj8oDNE4zOuF5tzC2TS9CT7PYeqBoygXueqyOgkxntihzlpAqXQFjZZ+maVNQYdEn7vOZL6rcrDPeQMrC1GQgxJoOIg+AYXoGFGgW3opm7ahC7ptlR+InZof9JbcYLOvr4jTpLQk5ZCmU786IBaHyKSKHsZGr1I4vPF07n32oPxebPpMaIWfWnSRJOwgSLFgB2kGx17VffyhYBEgjfl9kOVfj4mkeFYsatToaqXeK6VR+krrsByGZRcJFUqlZkjljbZcOSBgpPz5+1NJB0QQgYdPCyk4vjbNxwemH/hiPOiNthwJTDpyug+rq+ugcqgamiXkVBIZ80lHEbF/lsKTJ1Q1/4YPMdxCZDG/Plnw8sKRRG+pM74=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1633.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(64756008)(66446008)(5660300002)(316002)(8676002)(66476007)(33656002)(4326008)(66946007)(76116006)(66556008)(83380400001)(8936002)(54906003)(6636002)(110136005)(30864003)(52536014)(2906002)(55016003)(508600001)(6506007)(7696005)(122000001)(86362001)(53546011)(26005)(9686003)(186003)(38070700005)(82960400001)(71200400001)(66574015)(38100700002)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TDBqdmlXQnhGVjJmTzFkSG0yc1g0RGErYlBkVHRFMERxbEhGRmxqSEZLL1Rq?=
 =?utf-8?B?RGVkejhET3JoVWU2ajNKRzJsZk5XdVhxREg2UGE5YVhyazAxd2JoWnBSUDZw?=
 =?utf-8?B?S0VpL09acTdGZzVpYnhVd1BwcmtuaUhCd0tvZHA3akxpOWxPN1hZVnVYWllH?=
 =?utf-8?B?VWlNS3hQTCtyRXI4TitRVlJtZ2NTbm9uemhLZ0cwK2kvdGYyMDdPaFBJY3h0?=
 =?utf-8?B?bkxEYW81WFkvZnh0S2JPbU84dm9qRkFmOVZlY0JZUUN0ai92Tll4akNYcm9s?=
 =?utf-8?B?OHhVQTRiZzdtdjV1UHVHbCtMY1c0WitDQktScGlDVlRQYmZXZjJDRTRwOWFh?=
 =?utf-8?B?enRvVEM1T0JFcnVOUE9vMGpRZm5ERjExOGhBREMvbWdGV3NDTlJXMjBQZFRa?=
 =?utf-8?B?cit6R1lHUFh3dW1Ieno0b0YxKy8rS0Jnd3ZBbWp2ekduVDF3bmt1ck1nWW1t?=
 =?utf-8?B?Z3puQ3QraktVVk05RDhwcU9JSThsZ2dJdDg1UTlBTkVycm9nMEpaWnY2QTNm?=
 =?utf-8?B?Wlg3NXlmZHBWdHF6UzRhSklqZDVpbHQ5Wm9GS3BZbHdNSmRpOGFSaVhHL0lj?=
 =?utf-8?B?Y0ZPa1U1Z2tQaFBzV1ViNmFQSGpUMkVteDgvLzFxdzV5QXNxR0NIQjhCcldp?=
 =?utf-8?B?d1A3b256Ym9pMFRkR0lRSkhtQlBZS2hGeGdQbWF4dTNCT3Y0ZkhIVVBKQmRQ?=
 =?utf-8?B?TWFoSmM2RU5tZ0RFYWRCcVlObndzT0NlL3BnMVY2YUdrODJBRTV0SEo1Z3Zk?=
 =?utf-8?B?SkVJOEJWSXJvbzBLYUFtemhZSFV3bU4wbGNORmV2Y3BLL1FzQ3JIUjM1S1Q1?=
 =?utf-8?B?cmtJZkg3Nm4xNWpmaWxGV3RjQkdvVERIanNJeDBzSjlsS1JkQmJsRGtpaW1o?=
 =?utf-8?B?Q0xGRk9HV0t4MFdmSGdhb25TU2QwcE1UVmNVcEdwQW5vTXpwSnhNNjJMUnV1?=
 =?utf-8?B?eUJTVnY0VExOSGZGdktLOTljUjliWDg1OUEvSDB0MThSQk5VMXdIODBYVjU2?=
 =?utf-8?B?eCtTY0E4ZUNkOVNsK1pTREgxWmJKclZxZmFyNlU2RFhpbS9IVXRrb2MyZVRi?=
 =?utf-8?B?L0pBTkpiQndyUmxRcVVRV3hHaTJDWGxLVlEvaTZUOHZsUnJlT1RGdXhla0Q0?=
 =?utf-8?B?SDZURTdmWEh6MHJFNnJmd2k4NEhKS0tldk1lVUIrckpDUTVkb1VGMXR3SWhv?=
 =?utf-8?B?blpFUG5PajVVTWpuZ3FTWVpmQlRzRGJOMDhVOHFobytQYktYTEFNVHV1TEZW?=
 =?utf-8?B?c2ZuNm5QakVDbWRpRkRPU3MwSlNaZ1FGSnVVT1NDYnI1S2NpVG13NUhaYlY3?=
 =?utf-8?B?RFl2YmNWOGI4RVNoTzdCVkNsL1Y2Mkl0Vkg5VHpHUHBiZ0Q0bXlUODRBbEM0?=
 =?utf-8?B?bVp4VnpjYW5pc1BkN2RFVklaNXdDR1pFZ282WGZrMlFxYlNNN1hlRmdKd3ZU?=
 =?utf-8?B?eXNMNWF5akdYcWJ3Qnduby9QRmhOamk4blRxMXdKa1ZCTFZIdHN2SXFQeExM?=
 =?utf-8?B?RWxWU0x2MzkvUWVKakV2aDJ2Z0pnUXpqRlo1Z0ZMMVg4b1dldU1tYXBjQ0N4?=
 =?utf-8?B?VzkvVHExc3NrNW8yb2NreXVNWGpPTnpGVFdQeXhjYXZiSndyaGR0Q1JSbkNi?=
 =?utf-8?B?VCt4Ylo3ZEZTWS9ESHhiN2tYT2F0ZnRqWm55bmZlTWluaTg4UzNNL1dLeWtZ?=
 =?utf-8?B?b1NZTzZTS1pia1ZNMnVsam9MUjYwc2NIWnI4d0JrYVRuUGFldi9qUGY5OWpY?=
 =?utf-8?B?ZzBBQVMrUjNXRGNRaC8xK0l1Tm9YOVkvcVZPQ2lHZWlsRnQrL3Uvc1V1WmFI?=
 =?utf-8?B?ZXBjeW13RldnY3RFN1kzdG0rZGpLRVlPT09oenJaK0tKUG5CNGIyZ2JrNkNJ?=
 =?utf-8?B?NWFKeVJ4dFlkY0pEVlJNSDAyaDgwSjVqR1dBUHh0cXE3MGx1WGs4RXRHdWta?=
 =?utf-8?B?TTNaVlk1ay9OZ2VjbGZ4TWcxaURUN1hqTURPbGJDVEF3MmJJN21zOUh5ODd2?=
 =?utf-8?B?M285LzN0L1gvSWhld0pNMjVWd3RMSjhubzJMYXBPdVVncGQzNkZPWEVBSlpk?=
 =?utf-8?B?VHVQT3JGdldZVWp6MXBWRW93MWdoMEVjZmhTNGZ6Y0tmYWU2akdVd2U4UURo?=
 =?utf-8?B?Uy8xd2lSSWZMTWNwWjBuVjMwai9zRGpkVEtzVmdEa0ZJZnVaUWlLVG1xRmQ5?=
 =?utf-8?B?Y1BMVFUxVmlMUGxlQ0JSM0pjNk0rYWtWQ0xUZkE3ZW5pajdreHlQMElxdGZC?=
 =?utf-8?B?WmtDWUpMUkI4MG9RMHJGaTRzQ2EyNjhDalJyZGVqUVcxN2ZGT2hrV3J6S2U3?=
 =?utf-8?B?NVdxb2tVY1NyL2pORk51WkszdjMrcWU1d0ljQTZGeDg3anlQSjU3Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b81a23-c7cf-4af0-b3c5-08da4e4a9e63
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 21:12:41.7758 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Git4UjEAYgPUkM4vOWQTkrJR1oncs/ZhBjAEoi+QAZEVzdLODe64J4jCYiHsixjjC+EZj13PvA9FRGmQlc0A8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1287
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>, "Hellstrom,
 Thomas" <thomas.hellstrom@intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNClRoYW5rcywNCk9haw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IFZpc2h3YW5hdGhhcHVyYSwgTmlyYW5qYW5hIDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGlu
dGVsLmNvbT4NCj4gU2VudDogSnVuZSAxNCwgMjAyMiAxOjAyIFBNDQo+IFRvOiBMYW5kd2VybGlu
LCBMaW9uZWwgRyA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5jb20+DQo+IENjOiBaZW5nLCBP
YWsgPG9hay56ZW5nQGludGVsLmNvbT47IEludGVsIEdGWCA8aW50ZWwtDQo+IGdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc+OyBNYWxpbmcgbGlzdCAtIERSSSBkZXZlbG9wZXJzIDxkcmktDQo+IGRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IEhlbGxzdHJvbSwgVGhvbWFzDQo+IDx0aG9tYXMu
aGVsbHN0cm9tQGludGVsLmNvbT47IFdpbHNvbiwgQ2hyaXMgUCA8Y2hyaXMucC53aWxzb25AaW50
ZWwuY29tPjsNCj4gVmV0dGVyLCBEYW5pZWwgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPjsgQ2hy
aXN0aWFuIEvDtm5pZw0KPiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW0ludGVsLWdmeF0gW1JGQyB2MyAxLzNdIGRybS9kb2MvcmZjOiBWTV9CSU5EIGZlYXR1cmUg
ZGVzaWduDQo+IGRvY3VtZW50DQo+IA0KPiBPbiBUdWUsIEp1biAxNCwgMjAyMiBhdCAxMDowNDow
MEFNICswMzAwLCBMaW9uZWwgTGFuZHdlcmxpbiB3cm90ZToNCj4gPk9uIDEzLzA2LzIwMjIgMjE6
MDIsIE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEgd3JvdGU6DQo+ID4+T24gTW9uLCBKdW4gMTMs
IDIwMjIgYXQgMDY6MzM6MDdBTSAtMDcwMCwgWmVuZywgT2FrIHdyb3RlOg0KPiA+Pj4NCj4gPj4+
DQo+ID4+PlJlZ2FyZHMsDQo+ID4+Pk9haw0KPiA+Pj4NCj4gPj4+Pi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4+Pj5Gcm9tOiBJbnRlbC1nZnggPGludGVsLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24NCj4gPj4+PkJlaGFsZiBPZiBOaXJhbmphbmENCj4gPj4+PlZp
c2h3YW5hdGhhcHVyYQ0KPiA+Pj4+U2VudDogSnVuZSAxMCwgMjAyMiAxOjQzIFBNDQo+ID4+Pj5U
bzogTGFuZHdlcmxpbiwgTGlvbmVsIEcgPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPg0K
PiA+Pj4+Q2M6IEludGVsIEdGWCA8aW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IE1h
bGluZyBsaXN0IC0NCj4gPj4+PkRSSSBkZXZlbG9wZXJzIDxkcmktDQo+ID4+Pj5kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc+OyBIZWxsc3Ryb20sIFRob21hcw0KPiA+Pj4+PHRob21hcy5oZWxs
c3Ryb21AaW50ZWwuY29tPjsNCj4gPj4+PldpbHNvbiwgQ2hyaXMgUCA8Y2hyaXMucC53aWxzb25A
aW50ZWwuY29tPjsgVmV0dGVyLCBEYW5pZWwNCj4gPj4+PjxkYW5pZWwudmV0dGVyQGludGVsLmNv
bT47IENocmlzdGlhbiBLw7ZuaWcNCj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gPj4+
PlN1YmplY3Q6IFJlOiBbSW50ZWwtZ2Z4XSBbUkZDIHYzIDEvM10gZHJtL2RvYy9yZmM6IFZNX0JJ
TkQNCj4gPj4+PmZlYXR1cmUgZGVzaWduDQo+ID4+Pj5kb2N1bWVudA0KPiA+Pj4+DQo+ID4+Pj5P
biBGcmksIEp1biAxMCwgMjAyMiBhdCAxMToxODoxNEFNICswMzAwLCBMaW9uZWwgTGFuZHdlcmxp
biB3cm90ZToNCj4gPj4+Pj5PbiAxMC8wNi8yMDIyIDEwOjU0LCBOaXJhbmphbmEgVmlzaHdhbmF0
aGFwdXJhIHdyb3RlOg0KPiA+Pj4+Pj5PbiBGcmksIEp1biAxMCwgMjAyMiBhdCAwOTo1MzoyNEFN
ICswMzAwLCBMaW9uZWwgTGFuZHdlcmxpbiB3cm90ZToNCj4gPj4+Pj4+Pk9uIDA5LzA2LzIwMjIg
MjI6MzEsIE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEgd3JvdGU6DQo+ID4+Pj4+Pj4+T24gVGh1
LCBKdW4gMDksIDIwMjIgYXQgMDU6NDk6MDlQTSArMDMwMCwgTGlvbmVsIExhbmR3ZXJsaW4gd3Jv
dGU6DQo+ID4+Pj4+Pj4+PsKgIE9uIDA5LzA2LzIwMjIgMDA6NTUsIEphc29uIEVrc3RyYW5kIHdy
b3RlOg0KPiA+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+wqDCoMKgIE9uIFdlZCwgSnVuIDgsIDIwMjIg
YXQgNDo0NCBQTSBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhDQo+ID4+Pj4+Pj4+PiA8bmlyYW5q
YW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+IHdyb3RlOg0KPiA+Pj4+Pj4+Pj4NCj4gPj4+
Pj4+Pj4+wqDCoMKgwqDCoCBPbiBXZWQsIEp1biAwOCwgMjAyMiBhdCAwODozMzoyNUFNICswMTAw
LCBUdnJ0a28NCj4gPj4+PlVyc3VsaW4gd3JvdGU6DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPg0K
PiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+T24gMDcvMDYv
MjAyMiAyMjozMiwgTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYSB3cm90ZToNCj4gPj4+Pj4+Pj4+
wqDCoMKgwqDCoCA+Pk9uIFR1ZSwgSnVuIDA3LCAyMDIyIGF0IDExOjE4OjExQU0gLTA3MDAsIE5p
cmFuamFuYQ0KPiA+Pj4+Pj4+Pj5WaXNod2FuYXRoYXB1cmENCj4gPj4+Pj4+Pj4+wqDCoMKgwqDC
oCB3cm90ZToNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj5PbiBUdWUsIEp1biAwNywgMjAyMiBh
dCAxMjoxMjowM1BNIC0wNTAwLCBKYXNvbg0KPiA+Pj4+Pj4+Pj5Fa3N0cmFuZCB3cm90ZToNCj4g
Pj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+IE9uIEZyaSwgSnVuIDMsIDIwMjIgYXQgNjo1MiBQTSBO
aXJhbmphbmENCj4gPj4+PlZpc2h3YW5hdGhhcHVyYQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+
Pj4gPG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPiB3cm90ZToNCj4gPj4+Pj4+
Pj4+wqDCoMKgwqDCoCA+Pj4+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgT24gRnJp
LCBKdW4gMDMsIDIwMjIgYXQgMTA6MjA6MjVBTSArMDMwMCwgTGlvbmVsDQo+ID4+Pj4+Pj4+Pkxh
bmR3ZXJsaW4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCB3cm90ZToNCj4gPj4+Pj4+Pj4+wqDCoMKg
wqDCoCA+Pj4+wqDCoCA+wqDCoCBPbiAwMi8wNi8yMDIyIDIzOjM1LCBKYXNvbiBFa3N0cmFuZCB3
cm90ZToNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+DQo+ID4+Pj4+Pj4+PsKgwqDC
oMKgwqAgPj4+PsKgwqAgPsKgwqDCoMKgIE9uIFRodSwgSnVuIDIsIDIwMjIgYXQgMzoxMSBQTSBO
aXJhbmphbmENCj4gPj4+Pj4+Pj4+VmlzaHdhbmF0aGFwdXJhDQo+ID4+Pj4+Pj4+PsKgwqDCoMKg
wqAgPj4+PsKgwqAgPiA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+IHdyb3Rl
Og0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDC
oCA+Pj4+wqDCoCA+wqDCoMKgwqDCoMKgIE9uIFdlZCwgSnVuIDAxLCAyMDIyIGF0IDAxOjI4OjM2
UE0NCj4gPj4+Pi0wNzAwLCBNYXR0aGV3DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PkJyb3N0
IHdyb3RlOg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID7CoMKgwqDCoMKgwqAgPk9u
IFdlZCwgSnVuIDAxLCAyMDIyIGF0IDA1OjI1OjQ5UE0NCj4gPj4+PiswMzAwLCBMaW9uZWwNCj4g
Pj4+Pj4+Pj4+wqDCoMKgwqDCoCBMYW5kd2VybGluDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+
PsKgwqAgd3JvdGU6DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiA+PiBPbiAxNy8w
NS8yMDIyIDIxOjMyLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhDQo+ID4+Pj4+Pj4+PsKgwqDC
oMKgwqAgd3JvdGU6DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiA+PiA+ICtWTV9C
SU5EL1VOQklORCBpb2N0bCB3aWxsIGltbWVkaWF0ZWx5IHN0YXJ0DQo+ID4+Pj4+Pj4+PsKgwqDC
oMKgwqAgPj4+PsKgwqAgYmluZGluZy91bmJpbmRpbmcNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+
Pj4+wqDCoCA+wqDCoMKgwqDCoMKgIHRoZSBtYXBwaW5nIGluIGFuDQo+ID4+Pj4+Pj4+PsKgwqDC
oMKgwqAgPj4+PsKgwqAgPiA+PiA+ICthc3luYyB3b3JrZXIuIFRoZSBiaW5kaW5nIGFuZA0KPiA+
Pj4+Pj4+Pj51bmJpbmRpbmcgd2lsbA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj53b3JrIGxp
a2UgYQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgIHNwZWNpYWwNCj4gPj4+Pj4+Pj4+
wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDCoMKgwqDCoMKgIEdQVSBlbmdpbmUuDQo+ID4+Pj4+Pj4+
PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiA+PiA+ICtUaGUgYmluZGluZyBhbmQgdW5iaW5kaW5nIG9w
ZXJhdGlvbnMgYXJlDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgc2VyaWFsaXplZCBhbmQNCj4gPj4+
Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCB3aWxsDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+
PsKgwqAgPsKgwqDCoMKgwqDCoCB3YWl0IG9uIHNwZWNpZmllZA0KPiA+Pj4+Pj4+Pj7CoMKgwqDC
oMKgID4+Pj7CoMKgID4gPj4gPiAraW5wdXQgZmVuY2VzIGJlZm9yZSB0aGUgb3BlcmF0aW9uDQo+
ID4+Pj4+Pj4+PmFuZCB3aWxsIHNpZ25hbA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgIHRoZQ0KPiA+
Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgIG91dHB1dA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKg
ID4+Pj7CoMKgID7CoMKgwqDCoMKgwqAgZmVuY2VzIHVwb24gdGhlDQo+ID4+Pj4+Pj4+PsKgwqDC
oMKgwqAgPj4+PsKgwqAgPiA+PiA+ICtjb21wbGV0aW9uIG9mIHRoZSBvcGVyYXRpb24uIER1ZSB0
bw0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgIHNlcmlhbGl6YXRpb24sDQo+ID4+Pj4+Pj4+PsKgwqDC
oMKgwqAgPj4+PsKgwqAgY29tcGxldGlvbiBvZg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7C
oMKgID7CoMKgwqDCoMKgwqAgYW4gb3BlcmF0aW9uDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+
PsKgwqAgPiA+PiA+ICt3aWxsIGFsc28gaW5kaWNhdGUgdGhhdCBhbGwNCj4gPj4+Pj4+Pj4+cHJl
dmlvdXMgb3BlcmF0aW9ucw0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj5hcmUgYWxzbw0KPiA+
Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gY29tcGxldGUuDQo+ID4+Pj4+Pj4+PsKgwqDC
oMKgwqAgPj4+PsKgwqAgPiA+Pg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gPj4g
SSBndWVzcyB3ZSBzaG91bGQgYXZvaWQgc2F5aW5nICJ3aWxsDQo+ID4+Pj4+Pj4+PmltbWVkaWF0
ZWx5DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgc3RhcnQNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+
Pj4+wqDCoCA+IGJpbmRpbmcvdW5iaW5kaW5nIiBpZg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+
Pj7CoMKgID4gPj4gdGhlcmUgYXJlIGZlbmNlcyBpbnZvbHZlZC4NCj4gPj4+Pj4+Pj4+wqDCoMKg
wqDCoCA+Pj4+wqDCoCA+ID4+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiA+PiBB
bmQgdGhlIGZhY3QgdGhhdCBpdCdzIGhhcHBlbmluZyBpbiBhbiBhc3luYw0KPiA+Pj4+Pj4+Pj7C
oMKgwqDCoMKgID4+Pj53b3JrZXIgc2VlbSB0bw0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7C
oMKgIGltcGx5DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPsKgwqDCoMKgwqDCoCBp
dCdzIG5vdA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gPj4gaW1tZWRpYXRlLg0K
PiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gPj4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDC
oCA+Pj4+wqDCoCA+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPsKgwqDCoMKgwqDC
oCBPaywgd2lsbCBmaXguDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPsKgwqDCoMKg
wqDCoCBUaGlzIHdhcyBhZGRlZCBiZWNhdXNlIGluIGVhcmxpZXIgZGVzaWduDQo+ID4+Pj4+Pj4+
PmJpbmRpbmcgd2FzDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgZGVmZXJyZWQNCj4gPj4+Pj4+Pj4+
wqDCoMKgwqDCoCA+Pj4+wqDCoCB1bnRpbA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKg
ID7CoMKgwqDCoMKgwqAgbmV4dCBleGVjYnVmZi4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+
wqDCoCA+wqDCoMKgwqDCoMKgIEJ1dCBub3cgaXQgaXMgbm9uLWRlZmVycmVkIChpbW1lZGlhdGUg
aW4NCj4gPj4+Pj4+Pj4+dGhhdCBzZW5zZSkuDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PkJ1
dCB5YWgsDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgdGhpcyBpcw0KPiA+Pj4+Pj4+
Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gY29uZnVzaW5nDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAg
Pj4+PsKgwqAgPsKgwqDCoMKgwqDCoCBhbmQgd2lsbCBmaXggaXQuDQo+ID4+Pj4+Pj4+PsKgwqDC
oMKgwqAgPj4+PsKgwqAgPg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gPj4NCj4g
Pj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+ID4+IEkgaGF2ZSBhIHF1ZXN0aW9uIG9uIHRo
ZSBiZWhhdmlvciBvZiB0aGUgYmluZA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj5vcGVyYXRp
b24gd2hlbg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgIG5vDQo+ID4+Pj4+Pj4+PsKg
wqDCoMKgwqAgPj4+PsKgwqAgPsKgwqDCoMKgwqDCoCBpbnB1dCBmZW5jZQ0KPiA+Pj4+Pj4+Pj7C
oMKgwqDCoMKgID4+Pj7CoMKgID4gPj4gaXMgcHJvdmlkZWQuIExldCBzYXkgSSBkbyA6DQo+ID4+
Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiA+Pg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+
Pj7CoMKgID4gPj4gVk1fQklORCAob3V0X2ZlbmNlPWZlbmNlMSkNCj4gPj4+Pj4+Pj4+wqDCoMKg
wqDCoCA+Pj4+wqDCoCA+ID4+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiA+PiBW
TV9CSU5EIChvdXRfZmVuY2U9ZmVuY2UyKQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKg
ID4gPj4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+ID4+IFZNX0JJTkQgKG91dF9m
ZW5jZT1mZW5jZTMpDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiA+Pg0KPiA+Pj4+
Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gPj4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+
wqDCoCA+ID4+IEluIHdoYXQgb3JkZXIgYXJlIHRoZSBmZW5jZXMgZ29pbmcgdG8NCj4gPj4+Pj4+
Pj4+YmUgc2lnbmFsZWQ/DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiA+Pg0KPiA+
Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gPj4gSW4gdGhlIG9yZGVyIG9mIFZNX0JJTkQg
aW9jdGxzPyBPciBvdXQNCj4gPj4+Pj4+Pj4+b2Ygb3JkZXI/DQo+ID4+Pj4+Pj4+PsKgwqDCoMKg
wqAgPj4+PsKgwqAgPiA+Pg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gPj4gQmVj
YXVzZSB5b3Ugd3JvdGUgInNlcmlhbGl6ZWQgSSBhc3N1bWUNCj4gPj4+Pj4+Pj4+aXQncyA6IGlu
DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgb3JkZXINCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+
wqDCoCA+ID4+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPg0KPiA+Pj4+Pj4+Pj7C
oMKgwqDCoMKgID4+Pj7CoMKgID7CoMKgwqDCoMKgwqAgWWVzLCBpbiB0aGUgb3JkZXIgb2YgVk1f
QklORC9VTkJJTkQNCj4gPj4+Pj4+Pj4+aW9jdGxzLiBOb3RlIHRoYXQNCj4gPj4+Pj4+Pj4+wqDC
oMKgwqDCoCA+Pj4+YmluZCBhbmQNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCB1bmJp
bmQNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDCoMKgwqDCoMKgIHdpbGwgdXNl
DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPsKgwqDCoMKgwqDCoCB0aGUgc2FtZSBx
dWV1ZSBhbmQgaGVuY2UgYXJlIG9yZGVyZWQuDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKg
wqAgPg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gPj4NCj4gPj4+Pj4+Pj4+wqDC
oMKgwqDCoCA+Pj4+wqDCoCA+ID4+IE9uZSB0aGluZyBJIGRpZG4ndCByZWFsaXplIGlzIHRoYXQN
Cj4gPj4+Pj4+Pj4+YmVjYXVzZSB3ZSBvbmx5DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgZ2V0IG9u
ZQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gIlZNX0JJTkQiIGVuZ2luZSwNCj4g
Pj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+ID4+IHRoZXJlIGlzIGEgZGlzY29ubmVjdCBm
cm9tIHRoZSBWdWxrYW4NCj4gPj4+Pj4+Pj4+c3BlY2lmaWNhdGlvbi4NCj4gPj4+Pj4+Pj4+wqDC
oMKgwqDCoCA+Pj4+wqDCoCA+ID4+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiA+
PiBJbiBWdWxrYW4gVk1fQklORCBvcGVyYXRpb25zIGFyZQ0KPiA+Pj4+Pj4+Pj5zZXJpYWxpemVk
IGJ1dA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj5wZXIgZW5naW5lLg0KPiA+Pj4+Pj4+Pj7C
oMKgwqDCoMKgID4+Pj7CoMKgID4gPj4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+
ID4+IFNvIHlvdSBjb3VsZCBoYXZlIHNvbWV0aGluZyBsaWtlIHRoaXMgOg0KPiA+Pj4+Pj4+Pj7C
oMKgwqDCoMKgID4+Pj7CoMKgID4gPj4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+
ID4+IFZNX0JJTkQgKGVuZ2luZT1yY3MwLCBpbl9mZW5jZT1mZW5jZTEsDQo+ID4+Pj4+Pj4+PsKg
wqDCoMKgwqAgb3V0X2ZlbmNlPWZlbmNlMikNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDC
oCA+ID4+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiA+PiBWTV9CSU5EIChlbmdp
bmU9Y2NzMCwgaW5fZmVuY2U9ZmVuY2UzLA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgIG91dF9mZW5j
ZT1mZW5jZTQpDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiA+Pg0KPiA+Pj4+Pj4+
Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gPj4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDC
oCA+ID4+IGZlbmNlMSBpcyBub3Qgc2lnbmFsZWQNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+
wqDCoCA+ID4+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiA+PiBmZW5jZTMgaXMg
c2lnbmFsZWQNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+ID4+DQo+ID4+Pj4+Pj4+
PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiA+PiBTbyB0aGUgc2Vjb25kIFZNX0JJTkQgd2lsbCBwcm9j
ZWVkIGJlZm9yZSB0aGUNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+Zmlyc3QgVk1fQklORC4N
Cj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+ID4+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKg
wqAgPj4+PsKgwqAgPiA+Pg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gPj4gSSBn
dWVzcyB3ZSBjYW4gZGVhbCB3aXRoIHRoYXQgc2NlbmFyaW8gaW4NCj4gPj4+Pj4+Pj4+wqDCoMKg
wqDCoCA+Pj4+dXNlcnNwYWNlIGJ5IGRvaW5nDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKg
wqAgdGhlDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPsKgwqDCoMKgwqDCoCB3YWl0
DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiA+PiBvdXJzZWx2ZXMgaW4gb25lIHRo
cmVhZCBwZXIgZW5naW5lcy4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+ID4+DQo+
ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiA+PiBCdXQgdGhlbiBpdCBtYWtlcyB0aGUg
Vk1fQklORCBpbnB1dA0KPiA+Pj4+Pj4+Pj5mZW5jZXMgdXNlbGVzcy4NCj4gPj4+Pj4+Pj4+wqDC
oMKgwqDCoCA+Pj4+wqDCoCA+ID4+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiA+
Pg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gPj4gRGFuaWVsIDogd2hhdCBkbyB5
b3UgdGhpbms/IFNob3VsZCBiZQ0KPiA+Pj4+Pj4+Pj5yZXdvcmsgdGhpcyBvcg0KPiA+Pj4+Pj4+
Pj7CoMKgwqDCoMKgIGp1c3QNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCBkZWFsIHdp
dGgNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDCoMKgwqDCoMKgIHdhaXQNCj4g
Pj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+ID4+IGZlbmNlcyBpbiB1c2Vyc3BhY2U/DQo+
ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiA+Pg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKg
ID4+Pj7CoMKgID7CoMKgwqDCoMKgwqAgPg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKg
ID7CoMKgwqDCoMKgwqAgPk15IG9waW5pb24gaXMgcmV3b3JrIHRoaXMgYnV0IG1ha2UgdGhlDQo+
ID4+Pj4+Pj4+Pm9yZGVyaW5nIHZpYQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj5hbiBlbmdp
bmUNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCBwYXJhbQ0KPiA+Pj4+Pj4+Pj7CoMKg
wqDCoMKgID4+Pj7CoMKgID4gb3B0aW9uYWwuDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKg
wqAgPsKgwqDCoMKgwqDCoCA+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiA+ZS5n
LiBBIFZNIGNhbiBiZSBjb25maWd1cmVkIHNvIGFsbCBiaW5kcw0KPiA+Pj4+Pj4+Pj5hcmUgb3Jk
ZXJlZA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj53aXRoaW4gdGhlDQo+ID4+Pj4+Pj4+PsKg
wqDCoMKgwqAgPj4+PsKgwqAgVk0NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDC
oMKgwqDCoMKgID4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+ID5lLmcuIEEgVk0g
Y2FuIGJlIGNvbmZpZ3VyZWQgc28gYWxsIGJpbmRzDQo+ID4+Pj4+Pj4+PmFjY2VwdCBhbg0KPiA+
Pj4+Pj4+Pj7CoMKgwqDCoMKgIGVuZ2luZQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKg
IGFyZ3VtZW50DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPsKgwqDCoMKgwqDCoCAo
aW4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+ID50aGUgY2FzZSBvZiB0aGUgaTkx
NSBsaWtlbHkgdGhpcyBpcyBhDQo+ID4+Pj4+Pj4+PmdlbSBjb250ZXh0DQo+ID4+Pj4+Pj4+PsKg
wqDCoMKgwqAgPj4+PmhhbmRsZSkgYW5kDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAg
YmluZHMNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+ID5vcmRlcmVkIHdpdGggcmVz
cGVjdCB0byB0aGF0IGVuZ2luZS4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDC
oMKgwqDCoMKgID4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+ID5UaGlzIGdpdmVz
IFVNRHMgb3B0aW9ucyBhcyB0aGUgbGF0ZXINCj4gPj4+Pj4+Pj4+bGlrZWx5IGNvbnN1bWVzDQo+
ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+Pm1vcmUgS01EDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAg
Pj4+PsKgwqAgPiByZXNvdXJjZXMNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDC
oMKgwqDCoMKgID5zbyBpZiBhIGRpZmZlcmVudCBVTUQgY2FuIGxpdmUgd2l0aA0KPiA+Pj4+Ymlu
ZHMgYmVpbmcNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+b3JkZXJlZCB3aXRoaW4NCj4gPj4+
Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCB0aGUgVk0NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+
Pj4+wqDCoCA+ID50aGV5IGNhbiB1c2UgYSBtb2RlIGNvbnN1bWluZyBsZXNzIHJlc291cmNlcy4N
Cj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDCoMKgwqDCoMKgID4NCj4gPj4+Pj4+
Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAg
PsKgwqDCoMKgwqDCoCBJIHRoaW5rIHdlIG5lZWQgdG8gYmUgY2FyZWZ1bCBoZXJlIGlmIHdlDQo+
ID4+Pj4+Pj4+PmFyZSBsb29raW5nDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgZm9yIHNvbWUNCj4g
Pj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCBvdXQgb2YNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDC
oCA+Pj4+wqDCoCA+IChzdWJtaXNzaW9uKSBvcmRlciBjb21wbGV0aW9uIG9mIHZtX2JpbmQvdW5i
aW5kLg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gSW4tb3JkZXIgY29tcGxldGlv
biBtZWFucywgaW4gYSBiYXRjaCBvZg0KPiA+Pj4+Pj4+Pj5iaW5kcyBhbmQNCj4gPj4+Pj4+Pj4+
wqDCoMKgwqDCoCA+Pj4+dW5iaW5kcyB0byBiZQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7C
oMKgID4gY29tcGxldGVkIGluLW9yZGVyLCB1c2VyIG9ubHkgbmVlZHMgdG8gc3BlY2lmeQ0KPiA+
Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj5pbi1mZW5jZSBmb3IgdGhlDQo+ID4+Pj4+Pj4+PsKgwqDC
oMKgwqAgPj4+PsKgwqAgPsKgwqDCoMKgwqDCoCBmaXJzdCBiaW5kL3VuYmluZCBjYWxsIGFuZCB0
aGUgb3VyLWZlbmNlDQo+ID4+Pj4+Pj4+PmZvciB0aGUgbGFzdA0KPiA+Pj4+Pj4+Pj7CoMKgwqDC
oMKgID4+Pj7CoMKgIGJpbmQvdW5iaW5kDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAg
PsKgwqDCoMKgwqDCoCBjYWxsLiBBbHNvLCB0aGUgVkEgcmVsZWFzZWQgYnkgYW4gdW5iaW5kDQo+
ID4+Pj4+Pj4+PmNhbGwgY2FuIGJlDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PnJlLXVzZWQg
YnkNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDCoMKgwqDCoMKgIGFueSBzdWJz
ZXF1ZW50IGJpbmQgY2FsbCBpbiB0aGF0DQo+ID4+Pj5pbi1vcmRlciBiYXRjaC4NCj4gPj4+Pj4+
Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAg
PsKgwqDCoMKgwqDCoCBUaGVzZSB0aGluZ3Mgd2lsbCBicmVhayBpZg0KPiA+Pj4+Pj4+Pj5iaW5k
aW5nL3VuYmluZGluZyB3ZXJlIHRvDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PmJlIGFsbG93
ZWQNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCB0bw0KPiA+Pj4+Pj4+Pj7CoMKgwqDC
oMKgID4+Pj7CoMKgID7CoMKgwqDCoMKgwqAgZ28gb3V0IG9mIG9yZGVyIChvZiBzdWJtaXNzaW9u
KSBhbmQgdXNlcg0KPiA+Pj4+Pj4+Pj5uZWVkIHRvIGJlDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAg
ZXh0cmENCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCBjYXJlZnVsDQo+ID4+Pj4+Pj4+
PsKgwqDCoMKgwqAgPj4+PsKgwqAgPsKgwqDCoMKgwqDCoCBub3QgdG8gcnVuIGludG8gcHJlLW1h
dHVyZSB0cmlnZ2VyZWluZyBvZg0KPiA+Pj4+Pj4+Pj5vdXQtZmVuY2UgYW5kDQo+ID4+Pj4+Pj4+
PsKgwqDCoMKgwqAgYmluZA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgIGZhaWxpbmcN
Cj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDCoMKgwqDCoMKgIGFzIFZBIGlzIHN0
aWxsIGluIHVzZSBldGMuDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPg0KPiA+Pj4+
Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID7CoMKgwqDCoMKgwqAgQWxzbywgVk1fQklORCBiaW5k
cyB0aGUgcHJvdmlkZWQNCj4gPj4+Pm1hcHBpbmcgb24gdGhlDQo+ID4+Pj4+Pj4+PsKgwqDCoMKg
wqAgc3BlY2lmaWVkDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgYWRkcmVzcw0KPiA+
Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID7CoMKgwqDCoMKgwqAgc3BhY2UNCj4gPj4+Pj4+
Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDCoMKgwqDCoMKgIChWTSkuIFNvLCB0aGUgdWFwaSBp
cyBub3QgZW5naW5lL2NvbnRleHQNCj4gPj4+Pj4+Pj4+c3BlY2lmaWMuDQo+ID4+Pj4+Pj4+PsKg
wqDCoMKgwqAgPj4+PsKgwqAgPg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID7CoMKg
wqDCoMKgwqAgV2UgY2FuIGhvd2V2ZXIgYWRkIGEgJ3F1ZXVlJyB0byB0aGUgdWFwaQ0KPiA+Pj4+
Pj4+Pj53aGljaCBjYW4gYmUNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+b25lIGZyb20NCj4g
Pj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCB0aGUNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+
Pj4+wqDCoCA+IHByZS1kZWZpbmVkIHF1ZXVlcywNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+
wqDCoCA+IEk5MTVfVk1fQklORF9RVUVVRV8wDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKg
wqAgPiBJOTE1X1ZNX0JJTkRfUVVFVUVfMQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKg
ID7CoMKgwqDCoMKgwqAgLi4uDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiBJOTE1
X1ZNX0JJTkRfUVVFVUVfKE4tMSkNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+DQo+
ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPsKgwqDCoMKgwqDCoCBLTUQgd2lsbCBzcGF3
biBhbiBhc3luYyB3b3JrIHF1ZXVlIGZvcg0KPiA+Pj4+Pj4+Pj5lYWNoIHF1ZXVlIHdoaWNoDQo+
ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgd2lsbA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKg
IG9ubHkNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDCoMKgwqDCoMKgIGJpbmQg
dGhlIG1hcHBpbmdzIG9uIHRoYXQgcXVldWUgaW4gdGhlDQo+ID4+Pj5vcmRlciBvZg0KPiA+Pj4+
Pj4+Pj7CoMKgwqDCoMKgIHN1Ym1pc3Npb24uDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKg
wqAgPsKgwqDCoMKgwqDCoCBVc2VyIGNhbiBhc3NpZ24gdGhlIHF1ZXVlIHRvIHBlciBlbmdpbmUN
Cj4gPj4+Pj4+Pj4+b3IgYW55dGhpbmcNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+bGlrZSB0
aGF0Lg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4NCj4gPj4+Pj4+Pj4+wqDCoMKg
wqDCoCA+Pj4+wqDCoCA+wqDCoMKgwqDCoMKgIEJ1dCBhZ2FpbiBoZXJlLCB1c2VyIG5lZWQgdG8g
YmUNCj4gPj4+PmNhcmVmdWwgYW5kIG5vdA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj5kZWFk
bG9jayB0aGVzZQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID7CoMKgwqDCoMKgwqAg
cXVldWVzIHdpdGggY2lyY3VsYXIgZGVwZW5kZW5jeSBvZiBmZW5jZXMuDQo+ID4+Pj4+Pj4+PsKg
wqDCoMKgwqAgPj4+PsKgwqAgPg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID7CoMKg
wqDCoMKgwqAgSSBwcmVmZXIgYWRkaW5nIHRoaXMgbGF0ZXIgYW4gYXMNCj4gPj4+Pj4+Pj4+ZXh0
ZW5zaW9uIGJhc2VkIG9uDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PndoZXRoZXIgaXQNCj4g
Pj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDCoMKgwqDCoMKgIGlzIHJlYWxseSBoZWxw
aW5nIHdpdGggdGhlIGltcGxlbWVudGF0aW9uLg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7C
oMKgID4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDCoMKgwqAgSSBjYW4gdGVs
bCB5b3UgcmlnaHQgbm93IHRoYXQgaGF2aW5nDQo+ID4+Pj4+Pj4+PmV2ZXJ5dGhpbmcgb24gYQ0K
PiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgIHNpbmdsZQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7C
oMKgIGluLW9yZGVyDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPsKgwqDCoMKgIHF1
ZXVlIHdpbGwgbm90IGdldCB1cyB0aGUgcGVyZiB3ZSB3YW50Lg0KPiA+Pj4+Pj4+Pj5XaGF0IHZ1
bGthbg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj5yZWFsbHkgd2FudHMNCj4gPj4+Pj4+Pj4+
wqDCoMKgwqDCoCA+Pj4+wqDCoCBpcyBvbmUNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDC
oCA+wqDCoMKgwqAgb2YgdHdvIHRoaW5nczoNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDC
oCA+wqDCoMKgwqDCoCAxLiBObyBpbXBsaWNpdCBvcmRlcmluZyBvZiBWTV9CSU5EDQo+ID4+Pj5v
cHMuwqAgVGhleSBqdXN0DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgaGFwcGVuIGluDQo+ID4+Pj4+
Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgd2hhdGV2ZXINCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+
Pj4+wqDCoCA+wqDCoMKgwqAgdGhlaXIgZGVwZW5kZW5jaWVzIGFyZSByZXNvbHZlZCBhbmQgd2UN
Cj4gPj4+Pj4+Pj4+ZW5zdXJlIG9yZGVyaW5nDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+Pm91
cnNlbHZlcw0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgIGJ5DQo+ID4+Pj4+Pj4+PsKg
wqDCoMKgwqAgPj4+PsKgwqAgPsKgwqDCoMKgIGhhdmluZyBhIHN5bmNvYmogaW4gdGhlIFZrUXVl
dWUuDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPsKgwqDCoMKgwqAgMi4gVGhlIGFi
aWxpdHkgdG8gY3JlYXRlIG11bHRpcGxlIFZNX0JJTkQNCj4gPj4+Pj4+Pj4+cXVldWVzLsKgIFdl
DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgbmVlZCBhdA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+
Pj7CoMKgIGxlYXN0IDINCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDCoMKgwqAg
YnV0IEkgZG9uJ3Qgc2VlIHdoeSB0aGVyZSBuZWVkcyB0byBiZSBhDQo+ID4+Pj4+Pj4+PmxpbWl0
IGJlc2lkZXMNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+dGhlIGxpbWl0cw0KPiA+Pj4+Pj4+
Pj7CoMKgwqDCoMKgID4+Pj7CoMKgIHRoZQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKg
ID7CoMKgwqDCoCBpOTE1IEFQSSBhbHJlYWR5IGhhcyBvbiB0aGUgbnVtYmVyIG9mDQo+ID4+Pj4+
Pj4+PmVuZ2luZXMuwqAgVnVsa2FuDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgY291bGQNCj4gPj4+
Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCBleHBvc2UNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+
Pj4+wqDCoCA+wqDCoMKgwqAgbXVsdGlwbGUgc3BhcnNlIGJpbmRpbmcgcXVldWVzIHRvIHRoZQ0K
PiA+Pj4+Pj4+Pj5jbGllbnQgaWYgaXQncyBub3QNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+
wqDCoCBhcmJpdHJhcmlseQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID7CoMKgwqDC
oCBsaW1pdGVkLg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj4NCj4gPj4+Pj4+Pj4+wqDCoMKg
wqDCoCA+Pj4+wqDCoCBUaGFua3MgSmFzb24sIExpb25lbC4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDC
oCA+Pj4+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgSmFzb24sIHdoYXQgYXJlIHlv
dSByZWZlcnJpbmcgdG8gd2hlbiB5b3Ugc2F5DQo+ID4+Pj4+Pj4+PiJsaW1pdHMgdGhlIGk5MTUN
Cj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCBBUEkNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDC
oCBhbHJlYWR5DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgaGFzIG9uIHRoZSBudW1i
ZXIgb2YgZW5naW5lcyI/IEkgYW0gbm90IHN1cmUgaWYNCj4gPj4+Pj4+Pj4+dGhlcmUgaXMgc3Vj
aA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgIGFuIHVhcGkNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+
Pj4+wqDCoCB0b2RheS4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+DQo+ID4+Pj4+Pj4+PsKg
wqDCoMKgwqAgPj4+PiBUaGVyZSdzIGEgbGltaXQgb2Ygc29tZXRoaW5nIGxpa2UgNjQgdG90YWwg
ZW5naW5lcw0KPiA+Pj4+Pj4+Pj50b2RheSBiYXNlZCBvbg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKg
IHRoZQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj4gbnVtYmVyIG9mIGJpdHMgd2UgY2FuIGNy
YW0gaW50byB0aGUgZXhlYyBmbGFncyBpbg0KPiA+Pj4+Pj4+Pj5leGVjYnVmZmVyMi7CoCBJDQo+
ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgdGhpbmsNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+IHNv
bWVvbmUgaGFkIGFuIGV4dGVuZGVkIHZlcnNpb24gdGhhdCBhbGxvd2VkIG1vcmUNCj4gPj4+Pj4+
Pj4+YnV0IEkgcmlwcGVkIGl0DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgb3V0DQo+ID4+Pj4+Pj4+
PsKgwqDCoMKgwqAgPj4+PiBiZWNhdXNlIG5vIG9uZSB3YXMgdXNpbmcgaXQuwqAgT2YgY291cnNl
LA0KPiA+Pj4+Pj4+Pj5leGVjYnVmZmVyMyBtaWdodCBub3QNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDC
oCA+Pj4+aGF2ZSB0aGF0DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PiBwcm9ibGVtIGF0IGFs
bC4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+
DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+VGhhbmtzIEphc29uLg0KPiA+Pj4+Pj4+Pj7CoMKg
wqDCoMKgID4+Pk9rLCBJIGFtIG5vdCBzdXJlIHdoaWNoIGV4ZWMgZmxhZyBpcyB0aGF0LCBidXQg
eWFoLA0KPiA+Pj4+Pj4+Pj5leGVjYnVmZmVyMw0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgIHByb2Jh
Ymx5DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+d2lsbCBub3QgaGF2ZSB0aGlzIGxpbWlhdGlv
bi4gU28sIHdlIG5lZWQgdG8gZGVmaW5lIGENCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCBWTV9CSU5E
X01BWF9RVUVVRQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+PmFuZCBzb21laG93IGV4cG9ydCBp
dCB0byB1c2VyIChJIGFtIHRoaW5raW5nIG9mDQo+ID4+Pj4+Pj4+PmVtYmVkZGluZyBpdCBpbg0K
PiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pkk5MTVfUEFSQU1fSEFTX1ZNX0JJTkQuIGJpdHNbMF0t
PkhBU19WTV9CSU5ELA0KPiA+Pj4+Yml0c1sxLTNdLT4nbicNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDC
oCBtZWFuaW5nIDJebg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+PnF1ZXVlcy4NCj4gPj4+Pj4+
Pj4+wqDCoMKgwqDCoCA+Pg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+QWgsIEkgdGhpbmsgeW91
IGFyZSB3YWtpbmcgYWJvdXQgSTkxNV9FWEVDX1JJTkdfTUFTSw0KPiA+Pj4+Pj4+Pj4oMHgzZikg
d2hpY2gNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCBleGVjYnVmMw0KPiA+Pj4+Pj4+Pj4NCj4gPj4+
Pj4+Pj4+wqDCoMKgIFl1cCHCoCBUaGF0J3MgZXhhY3RseSB0aGUgbGltaXQgSSB3YXMgdGFsa2lu
ZyBhYm91dC4NCj4gPj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj53aWxsIGFsc28g
aGF2ZS4gU28sIHdlIGNhbiBzaW1wbHkgZGVmaW5lIGluIHZtX2JpbmQvdW5iaW5kDQo+ID4+Pj4+
Pj4+PsKgwqDCoMKgwqAgc3RydWN0dXJlcywNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pg0KPiA+
Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+I2RlZmluZSBJOTE1X1ZNX0JJTkRfTUFYX1FVRVVFwqDCoCA2
NA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+wqDCoMKgwqDCoMKgwqAgX191MzIgcXVldWU7DQo+
ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+PkkgdGhpbmsg
dGhhdCB3aWxsIGtlZXAgdGhpbmdzIHNpbXBsZS4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+DQo+
ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPkhtbW0/IFdoYXQgZG9lcyBleGVjYnVmMiBsaW1pdCBoYXMg
dG8gZG8gd2l0aCBob3cNCj4gPj4+Pm1hbnkgZW5naW5lcw0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKg
ID5oYXJkd2FyZSBjYW4gaGF2ZT8gSSBzdWdnZXN0IG5vdCB0byBkbyB0aGF0Lg0KPiA+Pj4+Pj4+
Pj7CoMKgwqDCoMKgID4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Q2hhbmdlIHdpdGggYWRkZWQg
dGhpczoNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPsKg
wqDCoMKgwqDCoCBpZiAoc2V0Lm51bV9lbmdpbmVzID4gSTkxNV9FWEVDX1JJTkdfTUFTSyArIDEp
DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIC1FSU5WQUw7DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPg0KPiA+Pj4+Pj4+Pj7CoMKgwqDC
oMKgID5UbyBjb250ZXh0IGNyZWF0aW9uIG5lZWRzIHRvIGJlIHVuZG9uZSBhbmQgc28gbGV0IHVz
ZXJzDQo+ID4+Pj4+Pj4+PmNyZWF0ZSBlbmdpbmUNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+bWFw
cyB3aXRoIGFsbCBoYXJkd2FyZSBlbmdpbmVzLCBhbmQgbGV0IGV4ZWNidWYzIGFjY2Vzcw0KPiA+
Pj4+Pj4+Pj50aGVtIGFsbC4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+DQo+ID4+Pj4+Pj4+Pg0K
PiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgIEVhcmxpZXIgcGxhbiB3YXMgdG8gY2FycnkgSTkxNV9FWEVD
X1JJTkdfTUFQICgweDNmKSB0bw0KPiA+Pj4+Pj4+Pj5leGVjYnVmZjMgYWxzby4NCj4gPj4+Pj4+
Pj4+wqDCoMKgwqDCoCBIZW5jZSwgSSB3YXMgdXNpbmcgdGhlIHNhbWUgbGltaXQgZm9yIFZNX0JJ
TkQgcXVldWVzDQo+ID4+Pj4+Pj4+Pig2NCwgb3IgNjUgaWYgd2UNCj4gPj4+Pj4+Pj4+wqDCoMKg
wqDCoCBtYWtlIGl0IE4rMSkuDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgQnV0LCBhcyBkaXNjdXNz
ZWQgaW4gb3RoZXIgdGhyZWFkIG9mIHRoaXMgUkZDIHNlcmllcywgd2UNCj4gPj4+Pj4+Pj4+YXJl
IHBsYW5uaW5nDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgdG8gZHJvcCB0aGlzIEk5MTVfRVhFQ19S
SU5HX01BUCBpbiBleGVjYnVmZjMuIFNvLA0KPiA+Pj4+dGhlcmUgd29uJ3QgYmUNCj4gPj4+Pj4+
Pj4+wqDCoMKgwqDCoCBhbnkgdWFwaSB0aGF0IGxpbWl0cyB0aGUgbnVtYmVyIG9mIGVuZ2luZXMg
KGFuZCBoZW5jZQ0KPiA+Pj4+Pj4+Pj50aGUgdm1fYmluZA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKg
IHF1ZXVlcw0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgIG5lZWQgdG8gYmUgc3VwcG9ydGVkKS4NCj4g
Pj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgSWYgd2UgbGVhdmUgdGhlIG51bWJlciBv
ZiB2bV9iaW5kIHF1ZXVlcyB0byBiZQ0KPiA+Pj4+YXJiaXRyYXJpbHkgbGFyZ2UNCj4gPj4+Pj4+
Pj4+wqDCoMKgwqDCoCAoX191MzIgcXVldWVfaWR4KSB0aGVuLCB3ZSBuZWVkIHRvIGhhdmUgYSBo
YXNobWFwIGZvcg0KPiA+Pj4+Pj4+Pj5xdWV1ZSAoYSB3cSwNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDC
oCB3b3JrX2l0ZW0gYW5kIGEgbGlua2VkIGxpc3QpIGxvb2t1cCBmcm9tIHRoZSB1c2VyDQo+ID4+
Pj4+Pj4+PnNwZWNpZmllZCBxdWV1ZQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgIGluZGV4Lg0KPiA+
Pj4+Pj4+Pj7CoMKgwqDCoMKgIE90aGVyIG9wdGlvbiBpcyB0byBqdXN0IHB1dCBzb21lIGhhcmQg
bGltaXQgKHNheSA2NCBvcg0KPiA+Pj4+Pj4+Pj42NSkgYW5kIHVzZQ0KPiA+Pj4+Pj4+Pj7CoMKg
wqDCoMKgIGFuIGFycmF5IG9mIHF1ZXVlcyBpbiBWTSAoZWFjaCBjcmVhdGVkIHVwb24gZmlyc3Qg
dXNlKS4NCj4gPj4+Pj4+Pj4+SSBwcmVmZXIgdGhpcy4NCj4gPj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+
PsKgwqDCoCBJIGRvbid0IGdldCB3aHkgYSBWTV9CSU5EIHF1ZXVlIGlzIGFueSBkaWZmZXJlbnQg
ZnJvbSBhbnkNCj4gPj4+Pj4+Pj4+b3RoZXIgcXVldWUgb3INCj4gPj4+Pj4+Pj4+wqDCoMKgIHVz
ZXJzcGFjZS12aXNpYmxlIGtlcm5lbCBvYmplY3QuwqAgQnV0IEknbGwgbGVhdmUgdGhvc2UNCj4g
Pj4+Pj4+Pj4+ZGV0YWlscyB1cCB0bw0KPiA+Pj4+Pj4+Pj7CoMKgwqAgZGFudmV0IG9yIHdob2V2
ZXIgZWxzZSBtaWdodCBiZSByZXZpZXdpbmcgdGhlDQo+IGltcGxlbWVudGF0aW9uLg0KPiA+Pj4+
Pj4+Pj7CoMKgwqAgLS1KYXNvbg0KPiA+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+wqAgSSBraW5kIG9m
IGFncmVlIGhlcmUuIFdvdWxkbid0IGJlIHNpbXBsZXIgdG8gaGF2ZSB0aGUgYmluZA0KPiA+Pj4+
Pj4+Pj5xdWV1ZSBjcmVhdGVkDQo+ID4+Pj4+Pj4+PsKgIGxpa2UgdGhlIG90aGVycyB3aGVuIHdl
IGJ1aWxkIHRoZSBlbmdpbmUgbWFwPw0KPiA+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+wqAgRm9yIHVz
ZXJzcGFjZSBpdCdzIHRoZW4ganVzdCBtYXR0ZXIgb2Ygc2VsZWN0aW5nIHRoZSByaWdodA0KPiA+
Pj4+Pj4+Pj5xdWV1ZSBJRCB3aGVuDQo+ID4+Pj4+Pj4+PsKgIHN1Ym1pdHRpbmcuDQo+ID4+Pj4+
Pj4+Pg0KPiA+Pj4+Pj4+Pj7CoCBJZiB0aGVyZSBpcyBldmVyIGEgcG9zc2liaWxpdHkgdG8gaGF2
ZSB0aGlzIHdvcmsgb24gdGhlIEdQVSwNCj4gPj4+Pj4+Pj4+aXQgd291bGQgYmUNCj4gPj4+Pj4+
Pj4+wqAgYWxsIHJlYWR5Lg0KPiA+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj5JIGRp
ZCBzeW5jIG9mZmxpbmUgd2l0aCBNYXR0IEJyb3N0IG9uIHRoaXMuDQo+ID4+Pj4+Pj4+V2UgY2Fu
IGFkZCBhIFZNX0JJTkQgZW5naW5lIGNsYXNzIGFuZCBsZXQgdXNlciBjcmVhdGUgVk1fQklORA0K
PiA+Pj4+Pj4+PmVuZ2luZXMgKHF1ZXVlcykuDQo+ID4+Pj4+Pj4+VGhlIHByb2JsZW0gaXMsIGlu
IGk5MTUgZW5naW5lIGNyZWF0aW5nIGludGVyZmFjZSBpcyBib3VuZCB0bw0KPiA+Pj4+Pj4+Pmdl
bV9jb250ZXh0Lg0KPiA+Pj4+Pj4+PlNvLCBpbiB2bV9iaW5kIGlvY3RsLCB3ZSB3b3VsZCBuZWVk
IGJvdGggY29udGV4dF9pZCBhbmQNCj4gPj4+Pj4+Pj5xdWV1ZV9pZHggZm9yIHByb3Blcg0KPiA+
Pj4+Pj4+Pmxvb2t1cCBvZiB0aGUgdXNlciBjcmVhdGVkIGVuZ2luZS4gVGhpcyBpcyBiaXQgYWNr
d2FyZCBhcw0KPiA+Pj4+dm1fYmluZCBpcyBhbg0KPiA+Pj4+Pj4+PmludGVyZmFjZSB0byBWTSAo
YWRkcmVzcyBzcGFjZSkgYW5kIGhhcyBub3RoaW5nIHRvIGRvIHdpdGgNCj4gPj4+PmdlbV9jb250
ZXh0Lg0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PkEgZ2VtX2NvbnRleHQgaGFzIGEg
c2luZ2xlIHZtIG9iamVjdCByaWdodD8NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+U2V0IHRocm91Z2gg
STkxNV9DT05URVhUX1BBUkFNX1ZNIGF0IGNyZWF0aW9uIG9yIGdpdmVuIGENCj4gZGVmYXVsdA0K
PiA+Pj4+Pj4+b25lIGlmIG5vdC4NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+U28gaXQncyBqdXN0IGxp
a2UgcGlja2luZyB1cCB0aGUgdm0gbGlrZSBpdCdzIGRvbmUgYXQgZXhlY2J1ZmZlcg0KPiA+Pj4+
Pj4+dGltZSByaWdodCBub3cgOiBlYi0+Y29udGV4dC0+dm0NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4N
Cj4gPj4+Pj4+QXJlIHlvdSBzdWdnZXN0aW5nIHJlcGxhY2luZyAndm1faWQnIHdpdGggJ2NvbnRl
eHRfaWQnIGluIHRoZQ0KPiA+Pj4+Pj5WTV9CSU5EL1VOQklORA0KPiA+Pj4+Pj5pb2N0bCBhbmQg
cHJvYmFibHkgY2FsbCBpdCBDT05URVhUX0JJTkQvVU5CSU5ELCBiZWNhdXNlIFZNIGNhbg0KPiBi
ZQ0KPiA+Pj4+Pj5vYnRhaW5lZA0KPiA+Pj4+Pj5mcm9tIHRoZSBjb250ZXh0Pw0KPiA+Pj4+Pg0K
PiA+Pj4+Pg0KPiA+Pj4+PlllcywgYmVjYXVzZSBpZiB3ZSBnbyBmb3IgZW5naW5lcywgdGhleSdy
ZSBhc3NvY2lhdGVkIHdpdGggYSBjb250ZXh0DQo+ID4+Pj4+YW5kIHNvIGFsc28gYXNzb2NpYXRl
ZCB3aXRoIHRoZSBWTSBib3VuZCB0byB0aGUgY29udGV4dC4NCj4gPj4+Pj4NCj4gPj4+Pg0KPiA+
Pj4+SG1tLi4uY29udGV4dCBkb2Vzbid0IHNvdWxkIGxpa2UgdGhlIHJpZ2h0IGludGVyZmFjZS4g
SXQgc2hvdWxkIGJlDQo+ID4+Pj5WTSBhbmQgZW5naW5lIChpbmRlcGVuZGVudCBvZiBjb250ZXh0
KS4gRW5naW5lIGNhbiBiZSB2aXJ0dWFsIG9yIHNvZnQNCj4gPj4+PmVuZ2luZSAoa2VybmVsIHRo
cmVhZCksIGVhY2ggd2l0aCBpdHMgb3duIHF1ZXVlLiBXZSBjYW4gYWRkIGFuDQo+ID4+Pj5pbnRl
cmZhY2UNCj4gPj4+PnRvIGNyZWF0ZSBzdWNoIGVuZ2luZXMgKGluZGVwZW5kZW50IG9mIGNvbnRl
eHQpLiBCdXQgd2UgYXJlIGFud2F5DQo+ID4+Pj5pbXBsaWNpdGx5IGNyZWF0aW5nIGl0IHdoZW4g
dXNlciB1c2VzIGEgbmV3IHF1ZXVlX2lkeC4gSWYgaW4gZnV0dXJlDQo+ID4+Pj53ZSBoYXZlIGhh
cmR3YXJlIGVuZ2luZXMgZm9yIFZNX0JJTkQgb3BlcmF0aW9uLCB3ZSBjYW4gaGF2ZSB0aGF0DQo+
ID4+Pj5leHBsaWNpdCBpbnRlZmFjZSB0byBjcmVhdGUgZW5naW5lIGluc3RhbmNlcyBhbmQgdGhl
IHF1ZXVlX2luZGV4DQo+ID4+Pj5pbiB2bV9iaW5kL3VuYmluZCB3aWxsIHBvaW50IHRvIHRob3Nl
IGVuZ2luZXMuDQo+ID4+Pj5BbnlvbmUgaGFzIGFueSB0aG91Z2h0cz8gRGFuaWVsPw0KPiA+Pj4N
Cj4gPj4+RXhwb3NpbmcgZ2VtX2NvbnRleHQgb3IgaW50ZWxfY29udGV4dCB0byB1c2VyIHNwYWNl
IGlzIGEgc3RyYW5nZQ0KPiA+Pj5jb25jZXB0IHRvIG1lLiBBIGNvbnRleHQgcmVwcmVzZW50IHNv
bWUgaHcgcmVzb3VyY2VzIHRoYXQgaXMgdXNlZA0KPiA+Pj50byBjb21wbGV0ZSBjZXJ0YWluIHRh
c2suIFVzZXIgc3BhY2Ugc2hvdWxkIGNhcmUgYWxsb2NhdGUgc29tZQ0KPiA+Pj5yZXNvdXJjZXMg
KG1lbW9yeSwgcXVldWVzKSBhbmQgc3VibWl0IHRhc2tzIHRvIHF1ZXVlcy4gQnV0IHVzZXINCj4g
Pj4+c3BhY2UgZG9lc24ndCBjYXJlIGhvdyBjZXJ0YWluIHRhc2sgaXMgbWFwcGVkIHRvIGEgSFcg
Y29udGV4dCAtDQo+ID4+PmRyaXZlci9ndWMgc2hvdWxkIHRha2UgY2FyZSBvZiB0aGlzLg0KPiA+
Pj4NCj4gPj4+U28gYSBjbGVhbmVyIGludGVyZmFjZSB0byBtZSBpczogdXNlciBzcGFjZSBjcmVh
dGUgYSB2bSzCoCBjcmVhdGUNCj4gPj4+Z2VtIG9iamVjdCwgdm1fYmluZCBpdCB0byBhIHZtOyBh
bGxvY2F0ZSBxdWV1ZXMgKGludGVybmFsbHkNCj4gPj4+cmVwcmVzZW50IGNvbXB1dGUgb3IgYmxp
dHRlciBIVy4gUXVldWUgY2FuIGJlIHZpcnR1YWwgdG8gdXNlcikgZm9yDQo+ID4+PnRoaXMgdm07
IHN1Ym1pdCB0YXNrcyB0byBxdWV1ZXMuIFVzZXIgY2FuIGNyZWF0ZSBtdWx0aXBsZSBxdWV1ZXMN
Cj4gPj4+dW5kZXIgb25lIHZtLiBPbmUgcXVldWUgaXMgb25seSBmb3Igb25lIHZtLg0KPiA+Pj4N
Cj4gPj4+STkxNSBkcml2ZXIvZ3VjIG1hbmFnZSB0aGUgaHcgY29tcHV0ZSBvciBibGl0dGVyIHJl
c291cmNlcyB3aGljaA0KPiA+Pj5pcyB0cmFuc3BhcmVudCB0byB1c2VyIHNwYWNlLiBXaGVuIGk5
MTUgb3IgZ3VjIGRlY2lkZSB0byBzY2hlZHVsZQ0KPiA+Pj5hIHF1ZXVlIChydW4gdGFza3Mgb24g
dGhhdCBxdWV1ZSksIGEgSFcgZW5naW5lIHdpbGwgYmUgcGljayB1cCBhbmQNCj4gPj4+c2V0IHVw
IHByb3Blcmx5IGZvciB0aGUgdm0gb2YgdGhhdCBxdWV1ZSAoaWUuLCBzd2l0Y2ggdG8gcGFnZQ0K
PiA+Pj50YWJsZXMgb2YgdGhhdCB2bSkgLSB0aGlzIGlzIGEgY29udGV4dCBzd2l0Y2guDQo+ID4+
Pg0KPiA+Pj5Gcm9tIHZtX2JpbmQgcGVyc3BlY3RpdmUsIGl0IHNpbXBseSBiaW5kIGEgZ2VtX29i
amVjdCB0byBhIHZtLg0KPiA+Pj5FbmdpbmUvcXVldWUgaXMgbm90IGEgcGFyYW1ldGVyIHRvIHZt
X2JpbmQsIGFzIGFueSBlbmdpbmUgY2FuIGJlDQo+ID4+PnBpY2sgdXAgYnkgaTkxNS9ndWMgdG8g
ZXhlY3V0ZSBhIHRhc2sgdXNpbmcgdGhlIHZtIGJvdW5kIHZhLg0KPiA+Pj4NCj4gPj4+SSBkaWRu
J3QgY29tcGxldGVseSBmb2xsb3cgdGhlIGRpc2N1c3Npb24gaGVyZS4gSnVzdCBzaGFyZSBzb21l
DQo+ID4+PnRob3VnaHRzLg0KPiA+Pj4NCj4gPj4NCj4gPj5ZYWgsIEkgYWdyZWUuDQo+ID4+DQo+
ID4+TGlvbmVsLA0KPiA+PkhvdyBhYm91dCB3ZSBkZWZpbmUgdGhlIHF1ZXVlIGFzDQo+ID4+dW5p
b24gew0KPiA+PsKgwqDCoMKgwqDCoCBfX3UzMiBxdWV1ZV9pZHg7DQo+ID4+wqDCoMKgwqDCoMKg
IF9fdTY0IHJzdmQ7DQo+ID4+fQ0KPiA+Pg0KPiA+PklmIHJlcXVpcmVkLCB3ZSBjYW4gZXh0ZW5k
IGJ5IGV4cGFuZGluZyB0aGUgJ3JzdmQnIGZpZWxkIHRvIDxjdHhfaWQsDQo+ID4+cXVldWVfaWR4
PiBsYXRlcg0KPiA+PndpdGggYSBmbGFnLg0KPiA+Pg0KPiA+Pk5pcmFuamFuYQ0KPiA+DQo+ID4N
Cj4gPkkgZGlkIG5vdCByZWFsbHkgdW5kZXJzdGFuZCBPYWsncyBjb21tZW50IG5vciB3aGF0IHlv
dSdyZSBzdWdnZXN0aW5nDQo+ID5oZXJlIHRvIGJlIGhvbmVzdC4NCj4gPg0KPiA+DQo+ID5GaXJz
dCB0aGUgR0VNIGNvbnRleHQgaXMgYWxyZWFkeSBleHBvc2VkIHRvIHVzZXJzcGFjZS4gSXQncyBl
eHBsaWNpdGx5DQo+ID5jcmVhdGVkIGJ5IHVzZXJwYWNlIHdpdGggRFJNX0lPQ1RMX0k5MTVfR0VN
X0NPTlRFWFRfQ1JFQVRFLg0KPiA+DQo+ID5XZSBnaXZlIHRoZSBHRU0gY29udGV4dCBpZCBpbiBl
dmVyeSBleGVjYnVmZmVyIHdlIGRvIHdpdGgNCj4gPmRybV9pOTE1X2dlbV9leGVjYnVmZmVyMjo6
cnN2ZDEuDQo+ID4NCj4gPkl0J3Mgc3RpbGwgaW4gdGhlIG5ldyBleGVjYnVmZmVyMyBwcm9wb3Nh
bCBiZWluZyBkaXNjdXNzZWQuDQo+ID4NCj4gPg0KPiA+U2Vjb25kLCB0aGUgR0VNIGNvbnRleHQg
aXMgYWxzbyB3aGVyZSB3ZSBzZXQgdGhlIFZNIHdpdGgNCj4gPkk5MTVfQ09OVEVYVF9QQVJBTV9W
TS4NCj4gPg0KPiA+DQo+ID5UaGlyZCwgdGhlIEdFTSBjb250ZXh0IGFsc28gaGFzIHRoZSBsaXN0
IG9mIGVuZ2luZXMgd2l0aA0KPiA+STkxNV9DT05URVhUX1BBUkFNX0VOR0lORVMuDQo+ID4NCj4g
DQo+IFllcywgdGhlIGV4ZWNidWYgYW5kIGVuZ2luZSBtYXAgY3JlYXRpb24gYXJlIHRpZWQgdG8g
Z2VtX2NvbnRleHQuDQo+ICh3aGljaCBwcm9iYWJseSBpcyBub3QgdGhlIGJlc3QgaW50ZXJmYWNl
LikNCj4gDQo+ID4NCj4gPlNvIGl0IG1ha2VzIHNlbnNlIHRvIG1lIHRvIGRpc3BhdGNoIHRoZSB2
bV9iaW5kIG9wZXJhdGlvbiB0byBhIEdFTQ0KPiA+Y29udGV4dCwgdG8gYSBnaXZlbiB2bV9iaW5k
IHF1ZXVlLCBiZWNhdXNlIGl0J3MgZ290IGFsbCB0aGUNCj4gPmluZm9ybWF0aW9uIHJlcXVpcmVk
IDoNCj4gPg0KPiA+wqDCoMKgIC0gdGhlIGxpc3Qgb2YgbmV3IHZtX2JpbmQgcXVldWVzDQo+ID4N
Cj4gPsKgwqDCoCAtIHRoZSB2bSB0aGF0IGlzIGdvaW5nIHRvIGJlIG1vZGlmaWVkDQo+ID4NCj4g
DQo+IEJ1dCB0aGUgb3BlcmF0aW9uIGlzIHBlcmZvcm1lZCBoZXJlIG9uIHRoZSBhZGRyZXNzIHNw
YWNlIChWTSkgd2hpY2gNCj4gY2FuIGhhdmUgbXVsdGlwbGUgZ2VtX2NvbnRleHRzIHJlZmVycmlu
ZyB0byBpdC4gU28sIFZNIGlzIHRoZSByaWdodA0KPiBpbnRlcmZhY2UgaGVyZS4gV2UgbmVlZCBu
b3QgJ2dlbV9jb250ZXh0J2lmeSBpdC4NCj4gDQo+IEFsbCB3ZSBuZWVkIGlzIG11bHRpcGxlIHF1
ZXVlIHN1cHBvcnQgZm9yIHRoZSBhZGRyZXNzIHNwYWNlIChWTSkuDQo+IEdvaW5nIHRvIGdlbV9j
b250ZXh0IGZvciB0aGF0IGp1c3QgYmVjYXVzZSB3ZSBoYXZlIGVuZ2luZSBjcmVhdGlvbg0KPiBz
dXBwb3J0IHRoZXJlIHNlZW1zIHVubmVjZXNzYXkgYW5kIG5vdCBjb3JyZWN0IHRvIG1lLg0KPiAN
Cj4gPg0KPiA+T3RoZXJ3aXNlIHdoZXJlIGRvIHRoZSB2bV9iaW5kIHF1ZXVlcyBsaXZlPw0KPiA+
DQo+ID5JbiB0aGUgaTkxNS9kcm0gZmQgb2JqZWN0Pw0KPiA+DQo+ID5UaGF0IHdvdWxkIG1lYW4g
dGhhdCBhbGwgdGhlIEdFTSBjb250ZXh0cyBhcmUgc2hhcmluZyB0aGUgc2FtZSB2bV9iaW5kDQo+
ID5xdWV1ZXMuDQo+ID4NCj4gDQo+IE5vdCBhbGwsIG9ubHkgdGhlIGdlbSBjb250ZXh0cyB0aGF0
IGFyZSB1c2luZyB0aGUgc2FtZSBhZGRyZXNzIHNwYWNlIChWTSkuDQo+IEJ1dCB0byBtZSB0aGUg
cmlnaHQgd2F5IHRvIGRlc2NyaWJlIHdvdWxkIGJlIHRoYXQgIlZNIHdpbGwgYmUgdXNpbmcgdGhv
c2UNCj4gcXVldWVzIi4NCg0KDQpJIGhvcGUgYnkgInF1ZXVlIiBoZXJlIHlvdSBtZWFuIGEgSFcg
cmVzb3VyY2UgIHRoYXQgd2lsbCBiZSBsYXRlciB1c2VkIHRvIGV4ZWN1dGUgdGhlIGpvYiwgZm9y
IGV4YW1wbGUgYSBjY3MgY29tcHV0ZSBlbmdpbmUuIE9mIGNvdXJzZSBxdWV1ZSBjYW4gYmUgdmly
dHVhbCBzbyB1c2VyIGNhbiBjcmVhdGUgbW9yZSBxdWV1ZXMgdGhhbiB3aGF0IGh3IHBoeXNpY2Fs
bHkgaGFzLiANCg0KVG8gZXhwcmVzcyB0aGUgY29uY2VwdCBvZiAiVk0gd2lsbCBiZSB1c2luZyB0
aG9zZSBxdWV1ZXMiLCBJIHRoaW5rIGl0IG1ha2Ugc2Vuc2UgdG8gaGF2ZSBjcmVhdGVfcXVldWUo
dm0pIGZ1bmN0aW9uIHRha2luZyBhIHZtIHBhcmFtZXRlci4gVGhpcyBtZWFucyB0aGlzIHF1ZXVl
IGlzIGNyZWF0ZWQgZm9yIHRoZSBwdXJwb3NlIG9mIHN1Ym1pdCBqb2IgdW5kZXIgdGhpcyBWTS4g
TGF0ZXIgb24sIHdlIGNhbiBzdWJtaXQgam9iIChyZWZlcnJpbmcgdG8gb2JqZWN0cyB2bV9ib3Vu
ZCB0byB0aGUgc2FtZSB2bSkgdG8gdGhlIHF1ZXVlLiBUaGUgdm1fYmluZCBpb2N0bCBkb2VzbuKA
mXQgbmVlZCB0byBoYXZlIHF1ZXVlIHBhcmFtZXRlciwganVzdCB2bV9iaW5kIChvYmplY3QsIHZh
LCB2bSkuDQoNCkkgaG9wZSB0aGUgInF1ZXVlIiBoZXJlIGlzIG5vdCB0aGUgZW5naW5lIHVzZWQg
dG8gcGVyZm9ybSB0aGUgdm1fYmluZCBvcGVyYXRpb24gaXRzZWxmLiBCdXQgaWYgeW91IG1lYW50
IGEgcXVldWUvZW5naW5lIHRvIHBlcmZvcm0gdm1fYmluZCBpdHNlbGYgKHZzIGEgcXVldWUvZW5n
aW5lIGZvciBsYXRlciBqb2Igc3VibWlzc2lvbiksIHRoZW4gd2UgY2FuIGRpc2N1c3MgbW9yZS4g
SSBrbm93IHhlIGRyaXZlciBoYXZlIHNpbWlsYXIgY29uY2VwdCBhbmQgSSB0aGluayBhbGlnbiB0
aGUgZGVzaWduIGVhcmx5IGNhbiBiZW5lZml0IHRoZSBtaWdyYXRpb24gdG8geGUgZHJpdmVyLg0K
DQpSZWdhcmRzLA0KT2FrDQoNCj4gDQo+IE5pcmFuamFuYQ0KPiANCj4gPg0KPiA+aW50ZWxfY29u
dGV4dCBvciBHdUMgYXJlIGludGVybmFsIGRldGFpbHMgd2UncmUgbm90IGNvbmNlcm5lZCBhYm91
dC4NCj4gPg0KPiA+SSBkb24ndCByZWFsbHkgc2VlIHRoZSBjb25uZWN0aW9uIHdpdGggdGhlIEdF
TSBjb250ZXh0Lg0KPiA+DQo+ID4NCj4gPk1heWJlIE9hayBoYXMgYSBkaWZmZXJlbnQgdXNlIGNh
c2UgdGhhbiBWdWxrYW4uDQo+ID4NCj4gPg0KPiA+LUxpb25lbA0KPiA+DQo+ID4NCj4gPj4NCj4g
Pj4+UmVnYXJkcywNCj4gPj4+T2FrDQo+ID4+Pg0KPiA+Pj4+DQo+ID4+Pj5OaXJhbmphbmENCj4g
Pj4+Pg0KPiA+Pj4+Pg0KPiA+Pj4+Pj5JIHRoaW5rIHRoZSBpbnRlcmZhY2UgaXMgY2xlYW4gYXMg
YSBpbnRlcmZhY2UgdG8gVk0uIEl0IGlzDQo+ID4+Pj5vbmx5IHRoYXQgd2UNCj4gPj4+Pj4+ZG9u
J3QgaGF2ZSBhIGNsZWFuIHdheSB0byBjcmVhdGUgYSByYXcgVk1fQklORCBlbmdpbmUgKG5vdA0K
PiA+Pj4+Pj5hc3NvY2lhdGVkIHdpdGgNCj4gPj4+Pj4+YW55IGNvbnRleHQpIHdpdGggaTkxNSB1
YXBpLg0KPiA+Pj4+Pj5NYXkgYmUgd2UgY2FuIGFkZCBzdWNoIGFuIGludGVyZmFjZSwgYnV0IEkg
ZG9uJ3QgdGhpbmsgdGhhdCBpcw0KPiA+Pj4+d29ydGggaXQNCj4gPj4+Pj4+KHdlIG1pZ2h0IGFz
IHdlbGwganVzdCB1c2UgYSBxdWV1ZV9pZHggaW4gVk1fQklORC9VTkJJTkQgaW9jdGwgYXMgSQ0K
PiA+Pj4+Pj5tZW50aW9uZWQNCj4gPj4+Pj4+YWJvdmUpLg0KPiA+Pj4+Pj5BbnlvbmUgaGFzIGFu
eSB0aG91Z2h0cz8NCj4gPj4+Pj4+DQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+Pj5Bbm90aGVyIHByb2Js
ZW0gaXMsIGlmIHR3byBWTXMgYXJlIGJpbmRpbmcgd2l0aCB0aGUgc2FtZSBkZWZpbmVkDQo+ID4+
Pj4+Pj4+ZW5naW5lLA0KPiA+Pj4+Pj4+PmJpbmRpbmcgb24gVk0xIGNhbiBnZXQgdW5uZWNlc3Nh
cnkgYmxvY2tlZCBieSBiaW5kaW5nIG9uIFZNMg0KPiA+Pj4+Pj4+Pih3aGljaCBtYXkgYmUNCj4g
Pj4+Pj4+Pj53YWl0aW5nIG9uIGl0cyBpbl9mZW5jZSkuDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+Pg0K
PiA+Pj4+Pj4+TWF5YmUgSSdtIG1pc3Npbmcgc29tZXRoaW5nLCBidXQgaG93IGNhbiB5b3UgaGF2
ZSAyIHZtIG9iamVjdHMNCj4gPj4+Pj4+PndpdGggYSBzaW5nbGUgZ2VtX2NvbnRleHQgcmlnaHQg
bm93Pw0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj5Obywgd2UgZG9uJ3QgaGF2ZSAyIFZN
cyBmb3IgYSBnZW1fY29udGV4dC4NCj4gPj4+Pj4+U2F5IGlmIGN0eDEgd2l0aCB2bTEgYW5kIGN0
eDIgd2l0aCB2bTIuDQo+ID4+Pj4+PkZpcnN0IHZtX2JpbmQgY2FsbCB3YXMgZm9yIHZtMSB3aXRo
IHFfaWR4IDEgaW4gY3R4MSBlbmdpbmUgbWFwLg0KPiA+Pj4+Pj5TZWNvbmQgdm1fYmluZCBjYWxs
IHdhcyBmb3Igdm0yIHdpdGggcV9pZHggMiBpbiBjdHgyIGVuZ2luZSBtYXAuIElmDQo+ID4+Pj4+
PnRob3NlIHR3byBxdWV1ZSBpbmRpY2llcyBwb2ludHMgdG8gc2FtZSB1bmRlcmx5aW5nIHZtX2Jp
bmQgZW5naW5lLA0KPiA+Pj4+Pj50aGVuIHRoZSBzZWNvbmQgdm1fYmluZCBjYWxsIGdldHMgYmxv
Y2tlZCB1bnRpbCB0aGUgZmlyc3QNCj4gPj4+PnZtX2JpbmQgY2FsbCdzDQo+ID4+Pj4+Pidpbicg
ZmVuY2UgaXMgdHJpZ2dlcmVkIGFuZCBiaW5kIGNvbXBsZXRlcy4NCj4gPj4+Pj4+DQo+ID4+Pj4+
PldpdGggcGVyIFZNIHF1ZXVlcywgdGhpcyBpcyBub3QgYSBwcm9ibGVtIGFzIHR3byBWTXMgd2ls
bCBub3QgZW5kdXANCj4gPj4+Pj4+c2hhcmluZyBzYW1lIHF1ZXVlLg0KPiA+Pj4+Pj4NCj4gPj4+
Pj4+QlRXLCBJIGp1c3QgcG9zdGVkIGEgdXBkYXRlZCBQQVRDSCBzZXJpZXMuDQo+ID4+Pj4+Pmh0
dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2RyaS1kZXZlbC9tc2czNTA0ODMuaHRtbA0KPiA+
Pj4+Pj4NCj4gPj4+Pj4+TmlyYW5qYW5hDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4+
DQo+ID4+Pj4+Pj4+U28sIG15IHByZWZlcmVuY2UgaGVyZSBpcyB0byBqdXN0IGFkZCBhICd1MzIg
cXVldWUnIGluZGV4IGluDQo+ID4+Pj4+Pj4+dm1fYmluZC91bmJpbmQNCj4gPj4+Pj4+Pj5pb2N0
bCwgYW5kIHRoZSBxdWV1ZXMgYXJlIHBlciBWTS4NCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj5OaXJh
bmphbmENCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+wqAgVGhhbmtzLA0KPiA+Pj4+Pj4+Pj4NCj4g
Pj4+Pj4+Pj4+wqAgLUxpb25lbA0KPiA+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+
PsKgwqDCoMKgwqAgTmlyYW5qYW5hDQo+ID4+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKg
ID5SZWdhcmRzLA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDC
oCA+VHZydGtvDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKg
ID4+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj5OaXJhbmphbmENCj4gPj4+Pj4+Pj4+wqDCoMKg
wqDCoCA+Pg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKg
ID4+Pj7CoMKgIEkgYW0gdHJ5aW5nIHRvIHNlZSBob3cgbWFueSBxdWV1ZXMgd2UgbmVlZCBhbmQN
Cj4gPj4+Pj4+Pj4+ZG9uJ3Qgd2FudCBpdCB0bw0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgIGJlDQo+
ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgYXJiaXRyYXJpbHkNCj4gPj4+Pj4+Pj4+wqDC
oMKgwqDCoCA+Pj4+wqDCoCBsYXJnZSBhbmQgdW5kdWVseSBibG93IHVwIG1lbW9yeSB1c2FnZSBh
bmQNCj4gPj4+Pj4+Pj4+Y29tcGxleGl0eSBpbiBpOTE1DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAg
ZHJpdmVyLg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDC
oCA+Pj4+IEkgZXhwZWN0IGEgVnVsa2FuIGRyaXZlciB0byB1c2UgYXQgbW9zdCAyIGluIHRoZQ0K
PiA+Pj4+Pj4+Pj52YXN0IG1ham9yaXR5DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+Pm9mIGNh
c2VzLiBJDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PiBjb3VsZCBpbWFnaW5lIGEgY2xpZW50
IHdhbnRpbmcgdG8gY3JlYXRlIG1vcmUNCj4gPj4+PnRoYW4gMSBzcGFyc2UNCj4gPj4+Pj4+Pj4+
wqDCoMKgwqDCoCA+Pj4+cXVldWUgaW4gd2hpY2gNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+
IGNhc2UsIGl0J2xsIGJlIE4rMSBidXQgdGhhdCdzIHVubGlrZWx5LiBBcyBmYXIgYXMNCj4gPj4+
Pj4+Pj4+Y29tcGxleGl0eQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj5nb2VzLCBvbmNlDQo+
ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PiB5b3UgYWxsb3cgdHdvLCBJIGRvbid0IHRoaW5rIHRo
ZSBjb21wbGV4aXR5IGlzDQo+ID4+Pj5nb2luZyB1cCBieQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKg
ID4+Pj5hbGxvd2luZyBOLsKgIEFzDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PiBmb3IgbWVt
b3J5IHVzYWdlLCBjcmVhdGluZyBtb3JlIHF1ZXVlcyBtZWFucyBtb3JlDQo+ID4+Pj4+Pj4+Pm1l
bW9yeS7CoCBUaGF0J3MNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCBhDQo+ID4+Pj4+Pj4+PsKgwqDC
oMKgwqAgPj4+PiB0cmFkZS1vZmYgdGhhdCB1c2Vyc3BhY2UgY2FuIG1ha2UuIEFnYWluLCB0aGUN
Cj4gPj4+Pj4+Pj4+ZXhwZWN0ZWQgbnVtYmVyDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+Pmhl
cmUgaXMgMQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj4gb3IgMiBpbiB0aGUgdmFzdCBtYWpv
cml0eSBvZiBjYXNlcyBzbyBJIGRvbid0IHRoaW5rDQo+ID4+Pj4+Pj4+PnlvdSBuZWVkIHRvDQo+
ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgd29ycnkuDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+DQo+
ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+T2ssIHdpbGwgc3RhcnQgd2l0aCBuPTMgbWVhbmluZyA4
IHF1ZXVlcy4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj5UaGF0IHdvdWxkIHJlcXVpcmUgdXMg
Y3JlYXRlIDggd29ya3F1ZXVlcy4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj5XZSBjYW4gY2hh
bmdlICduJyBsYXRlciBpZiByZXF1aXJlZC4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4NCj4g
Pj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj5OaXJhbmphbmENCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+
Pj4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+
PsKgwqAgPsKgwqDCoMKgIFdoeT8gQmVjYXVzZSBWdWxrYW4gaGFzIHR3byBiYXNpYyBraW5kIG9m
IGJpbmQNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+b3BlcmF0aW9ucyBhbmQgd2UNCj4gPj4+
Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCBkb24ndA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+
Pj7CoMKgID7CoMKgwqDCoCB3YW50IGFueSBkZXBlbmRlbmNpZXMgYmV0d2VlbiB0aGVtOg0KPiA+
Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID7CoMKgwqDCoMKgIDEuIEltbWVkaWF0ZS7CoCBU
aGVzZSBoYXBwZW4gcmlnaHQgYWZ0ZXIgQk8NCj4gPj4+Pj4+Pj4+Y3JlYXRpb24gb3INCj4gPj4+
Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+bWF5YmUgYXMNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+
wqDCoCBwYXJ0IG9mDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiB2a0JpbmRJbWFn
ZU1lbW9yeSgpIG9yDQo+IFZrQmluZEJ1ZmZlck1lbW9yeSgpLsKgIFRoZXNlDQo+ID4+Pj4+Pj4+
PsKgwqDCoMKgwqAgPj4+PmRvbid0IGhhcHBlbg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7C
oMKgIG9uIGENCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDCoMKgwqAgcXVldWUg
YW5kIHdlIGRvbid0IHdhbnQgdGhlbSBzZXJpYWxpemVkDQo+ID4+Pj4+Pj4+PndpdGggYW55dGhp
bmcuwqDCoMKgwqDCoMKgIFRvDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgc3luY2hy
b25pemUNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDCoMKgwqAgd2l0aCBzdWJt
aXQsIHdlJ2xsIGhhdmUgYSBzeW5jb2JqIGluIHRoZQ0KPiA+Pj4+Pj4+Pj5Wa0RldmljZSB3aGlj
aA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgIGlzDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKg
wqAgc2lnbmFsZWQgYnkNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDCoMKgwqAg
YWxsIGltbWVkaWF0ZSBiaW5kIG9wZXJhdGlvbnMgYW5kIG1ha2UNCj4gPj4+Pj4+Pj4+c3VibWl0
cyB3YWl0IG9uDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgaXQuDQo+ID4+Pj4+Pj4+PsKgwqDCoMKg
wqAgPj4+PsKgwqAgPsKgwqDCoMKgwqAgMi4gUXVldWVkIChzcGFyc2UpOiBUaGVzZSBoYXBwZW4g
b24gYQ0KPiA+Pj4+Pj4+Pj5Wa1F1ZXVlIHdoaWNoIG1heQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKg
IGJlIHRoZQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgIHNhbWUgYXMNCj4gPj4+Pj4+
Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDCoMKgwqAgYSByZW5kZXIvY29tcHV0ZSBxdWV1ZSBv
ciBtYXkgYmUgaXRzIG93bg0KPiA+Pj4+Pj4+Pj5xdWV1ZS7CoCBJdCdzIHVwDQo+ID4+Pj4+Pj4+
PsKgwqDCoMKgwqAgdG8gdXMNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCB3aGF0IHdl
DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPsKgwqDCoMKgIHdhbnQgdG8gYWR2ZXJ0
aXNlLsKgIEZyb20gdGhlIFZ1bGthbiBBUEkNCj4gPj4+Pj4+Pj4+UG9WLCB0aGlzIGlzIGxpa2UN
Cj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCBhbnkNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDC
oCBvdGhlcg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID7CoMKgwqDCoCBxdWV1ZS4g
T3BlcmF0aW9ucyBvbiBpdCB3YWl0IG9uIGFuZCBzaWduYWwNCj4gPj4+Pj4+Pj4+c2VtYXBob3Jl
cy7CoMKgwqDCoMKgwqAgSWYgd2UNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCBoYXZl
IGENCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDCoMKgwqAgVk1fQklORCBlbmdp
bmUsIHdlJ2QgcHJvdmlkZSBzeW5jb2JqcyB0bw0KPiA+Pj4+d2FpdCBhbmQNCj4gPj4+Pj4+Pj4+
wqDCoMKgwqDCoCA+Pj4+c2lnbmFsIGp1c3QgbGlrZQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+
Pj7CoMKgIHdlIGRvDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPsKgwqDCoMKgIGlu
IGV4ZWNidWYoKS4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDCoMKgwqAgVGhl
IGltcG9ydGFudCB0aGluZyBpcyB0aGF0IHdlIGRvbid0IHdhbnQNCj4gPj4+Pj4+Pj4+b25lIHR5
cGUgb2YNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+b3BlcmF0aW9uIHRvDQo+ID4+Pj4+Pj4+
PsKgwqDCoMKgwqAgPj4+PsKgwqAgYmxvY2sNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDC
oCA+wqDCoMKgwqAgb24gdGhlIG90aGVyLsKgIElmIGltbWVkaWF0ZSBiaW5kcyBhcmUNCj4gPj4+
Pj4+Pj4+YmxvY2tpbmcgb24gc3BhcnNlDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgYmluZHMsDQo+
ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgaXQncw0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKg
ID4+Pj7CoMKgID7CoMKgwqDCoCBnb2luZyB0byBjYXVzZSBvdmVyLXN5bmNocm9uaXphdGlvbiBp
c3N1ZXMuDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPsKgwqDCoMKgIEluIHRlcm1z
IG9mIHRoZSBpbnRlcm5hbCBpbXBsZW1lbnRhdGlvbiwgSQ0KPiA+Pj4+Pj4+Pj5rbm93IHRoYXQN
Cj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+dGhlcmUncyBnb2luZw0KPiA+Pj4+Pj4+Pj7CoMKg
wqDCoMKgID4+Pj7CoMKgIHRvIGJlDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPsKg
wqDCoMKgIGEgbG9jayBvbiB0aGUgVk0gYW5kIHRoYXQgd2UgY2FuJ3QgYWN0dWFsbHkNCj4gPj4+
Pj4+Pj4+ZG8gdGhlc2UNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCB0aGluZ3MgaW4NCj4gPj4+Pj4+
Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+IHBhcmFsbGVsLsKgIFRoYXQncyBmaW5lLiBPbmNlIHRo
ZSBkbWFfZmVuY2VzIGhhdmUNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCBzaWduYWxlZCBhbmQNCj4g
Pj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCB3ZSdyZQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKg
ID4+Pj4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCBUaGF0cyBjb3JyZWN0LiBJdCBp
cyBsaWtlIGEgc2luZ2xlIFZNX0JJTkQNCj4gPj4+PmVuZ2luZSB3aXRoDQo+ID4+Pj4+Pj4+PsKg
wqDCoMKgwqAgPj4+Pm11bHRpcGxlIHF1ZXVlcw0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7C
oMKgIGZlZWRpbmcgdG8gaXQuDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+Pg0KPiA+Pj4+Pj4+
Pj7CoMKgwqDCoMKgID4+Pj4gUmlnaHQuwqAgQXMgbG9uZyBhcyB0aGUgcXVldWVzIHRoZW1zZWx2
ZXMgYXJlDQo+ID4+Pj4+Pj4+PmluZGVwZW5kZW50IGFuZA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKg
ID4+Pj5jYW4gYmxvY2sgb24NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+IGRtYV9mZW5jZXMg
d2l0aG91dCBob2xkaW5nIHVwIG90aGVyIHF1ZXVlcywgSSB0aGluaw0KPiA+Pj4+Pj4+Pj53ZSdy
ZSBmaW5lLg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDC
oCA+Pj4+wqDCoCA+IHVuYmxvY2tlZCB0byBkbyB0aGUgYmluZCBvcGVyYXRpb24sIEkgZG9uJ3Qg
Y2FyZSBpZg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj50aGVyZSdzIGEgYml0DQo+ID4+Pj4+
Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgb2YNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDC
oCA+IHN5bmNocm9uaXphdGlvbiBkdWUgdG8gbG9ja2luZy7CoCBUaGF0J3MNCj4gPj4+Pj4+Pj4+
ZXhwZWN0ZWQuwqAgV2hhdA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj53ZSBjYW4ndA0KPiA+
Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgIGFmZm9yZA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKg
ID4+Pj7CoMKgID7CoMKgwqDCoCB0byBoYXZlIGlzIGFuIGltbWVkaWF0ZSBiaW5kIG9wZXJhdGlv
bg0KPiA+Pj4+Pj4+Pj5zdWRkZW5seSBibG9ja2luZw0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgIG9u
IGENCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCBzcGFyc2UNCj4gPj4+Pj4+Pj4+wqDC
oMKgwqDCoCA+Pj4+wqDCoCA+IG9wZXJhdGlvbiB3aGljaCBpcyBibG9ja2VkIG9uIGEgY29tcHV0
ZSBqb2INCj4gPj4+Pj4+Pj4+dGhhdCdzIGdvaW5nDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgdG8g
cnVuDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgZm9yDQo+ID4+Pj4+Pj4+PsKgwqDC
oMKgwqAgPj4+PsKgwqAgPsKgwqDCoMKgIGFub3RoZXIgNW1zLg0KPiA+Pj4+Pj4+Pj7CoMKgwqDC
oMKgID4+Pj4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCBBcyB0aGUgVk1fQklORCBx
dWV1ZSBpcyBwZXIgVk0sIFZNX0JJTkQgb24gb25lDQo+IFZNDQo+ID4+Pj4+Pj4+PmRvZXNuJ3Qg
YmxvY2sNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCB0aGUNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+
Pj4+wqDCoCBWTV9CSU5EDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgb24gb3RoZXIg
Vk1zLiBJIGFtIG5vdCBzdXJlIGFib3V0IHVzZWNhc2VzDQo+ID4+Pj5oZXJlLCBidXQganVzdA0K
PiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgIHdhbnRlZCB0bw0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+
Pj7CoMKgIGNsYXJpZnkuDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+Pg0KPiA+Pj4+Pj4+Pj7C
oMKgwqDCoMKgID4+Pj4gWWVzLCB0aGF0J3Mgd2hhdCBJIHdvdWxkIGV4cGVjdC4NCj4gPj4+Pj4+
Pj4+wqDCoMKgwqDCoCA+Pj4+IC0tSmFzb24NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+DQo+
ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgTmlyYW5qYW5hDQo+ID4+Pj4+Pj4+PsKgwqDC
oMKgwqAgPj4+Pg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID7CoMKgwqDCoCBGb3Ig
cmVmZXJlbmNlLCBXaW5kb3dzIHNvbHZlcyB0aGlzIGJ5IGFsbG93aW5nDQo+ID4+Pj4+Pj4+PsKg
wqDCoMKgwqAgYXJiaXRyYXJpbHkgbWFueQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKg
IHBhZ2luZw0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID7CoMKgwqDCoCBxdWV1ZXMg
KHdoYXQgdGhleSBjYWxsIGEgVk1fQklORA0KPiA+Pj4+Pj4+Pj5lbmdpbmUvcXVldWUpLsKgIFRo
YXQNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+ZGVzaWduIHdvcmtzDQo+ID4+Pj4+Pj4+PsKg
wqDCoMKgwqAgPj4+PsKgwqAgPsKgwqDCoMKgIHByZXR0eSB3ZWxsIGFuZCBzb2x2ZXMgdGhlIHBy
b2JsZW1zIGluDQo+ID4+Pj4+Pj4+PnF1ZXN0aW9uLsKgwqDCoMKgwqDCoCA+Pj4+QWdhaW4sIHdl
IGNvdWxkDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAganVzdA0KPiA+Pj4+Pj4+Pj7C
oMKgwqDCoMKgID4+Pj7CoMKgID7CoMKgwqDCoCBtYWtlIGV2ZXJ5dGhpbmcgb3V0LW9mLW9yZGVy
IGFuZCByZXF1aXJlDQo+ID4+Pj4+Pj4+PnVzaW5nIHN5bmNvYmpzDQo+ID4+Pj4+Pj4+PsKgwqDC
oMKgwqAgPj4+PnRvIG9yZGVyDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgdGhpbmdz
DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPsKgwqDCoMKgIGFzIHVzZXJzcGFjZSB3
YW50cy4gVGhhdCdkIGJlIGZpbmUgdG9vLg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKg
ID7CoMKgwqDCoCBPbmUgbW9yZSBub3RlIHdoaWxlIEknbSBoZXJlOiBkYW52ZXQgc2FpZA0KPiA+
Pj4+Pj4+Pj5zb21ldGhpbmcgb24NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+SVJDIGFib3V0
DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgVk1fQklORA0KPiA+Pj4+Pj4+Pj7CoMKg
wqDCoMKgID4+Pj7CoMKgID7CoMKgwqDCoCBxdWV1ZXMgd2FpdGluZyBmb3Igc3luY29ianMgdG8N
Cj4gPj4+Pj4+Pj4+bWF0ZXJpYWxpemUuwqAgV2UgZG9uJ3QNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDC
oCByZWFsbHkNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCB3YW50L25lZWQNCj4gPj4+
Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDCoMKgwqAgdGhpcy4gV2UgYWxyZWFkeSBoYXZl
IGFsbCB0aGUgbWFjaGluZXJ5IGluDQo+ID4+Pj4+Pj4+PnVzZXJzcGFjZSB0bw0KPiA+Pj4+Pj4+
Pj7CoMKgwqDCoMKgIGhhbmRsZQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gd2Fp
dC1iZWZvcmUtc2lnbmFsIGFuZCB3YWl0aW5nIGZvciBzeW5jb2JqDQo+ID4+Pj4+Pj4+PmZlbmNl
cyB0bw0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj5tYXRlcmlhbGl6ZQ0KPiA+Pj4+Pj4+Pj7C
oMKgwqDCoMKgID4+Pj7CoMKgIGFuZA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID7C
oMKgwqDCoCB0aGF0IG1hY2hpbmVyeSBpcyBvbiBieSBkZWZhdWx0LsKgIEl0DQo+ID4+Pj53b3Vs
ZCBhY3R1YWxseQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj50YWtlIE1PUkUgd29yaw0KPiA+
Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgIGluDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+
PsKgwqAgPsKgwqDCoMKgIE1lc2EgdG8gdHVybiBpdCBvZmYgYW5kIHRha2UgYWR2YW50YWdlIG9m
DQo+ID4+Pj4+Pj4+PnRoZSBrZXJuZWwNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+YmVpbmcg
YWJsZSB0bw0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgIHdhaXQNCj4gPj4+Pj4+Pj4+
wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDCoMKgwqAgZm9yIHN5bmNvYmpzIHRvIG1hdGVyaWFsaXpl
LiBBbHNvLCBnZXR0aW5nDQo+ID4+Pj4+Pj4+PnRoYXQgcmlnaHQgaXMNCj4gPj4+Pj4+Pj4+wqDC
oMKgwqDCoCA+Pj4+wqDCoCByaWRpY3Vsb3VzbHkNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+
wqDCoCA+wqDCoMKgwqAgaGFyZCBhbmQgSSByZWFsbHkgZG9uJ3Qgd2FudCB0byBnZXQgaXQNCj4g
Pj4+Pj4+Pj4+d3JvbmcgaW4ga2VybmVsDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PnNwYWNl
LsKgwqAg77+977+9IFdoZW4gd2UNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDC
oMKgwqAgZG8gbWVtb3J5IGZlbmNlcywgd2FpdC1iZWZvcmUtc2lnbmFsIHdpbGwNCj4gPj4+Pj4+
Pj4+YmUgYSB0aGluZy7CoCBXZQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgIGRvbid0DQo+ID4+Pj4+
Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgbmVlZCB0bw0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+
Pj7CoMKgID7CoMKgwqDCoCB0cnkgYW5kIG1ha2UgaXQgYSB0aGluZyBmb3Igc3luY29iai4NCj4g
Pj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDCoMKgwqAgLS1KYXNvbg0KPiA+Pj4+Pj4+
Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+
wqDCoCBUaGFua3MgSmFzb24sDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPg0KPiA+
Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID7CoMKgIEkgbWlzc2VkIHRoZSBiaXQgaW4gdGhl
IFZ1bGthbiBzcGVjIHRoYXQNCj4gPj4+Pj4+Pj4+d2UncmUgYWxsb3dlZCB0bw0KPiA+Pj4+Pj4+
Pj7CoMKgwqDCoMKgIGhhdmUgYQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgIHNwYXJz
ZQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID7CoMKgIHF1ZXVlIHRoYXQgZG9lcyBu
b3QgaW1wbGVtZW50IGVpdGhlciBncmFwaGljcw0KPiA+Pj4+Pj4+Pj5vciBjb21wdXRlDQo+ID4+
Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+Pm9wZXJhdGlvbnMNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+
Pj4+wqDCoCA6DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPg0KPiA+Pj4+Pj4+Pj7C
oMKgwqDCoMKgID4+Pj7CoMKgID7CoMKgwqDCoCAiV2hpbGUgc29tZSBpbXBsZW1lbnRhdGlvbnMg
bWF5IGluY2x1ZGUNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+IFZLX1FVRVVFX1NQQVJTRV9C
SU5ESU5HX0JJVA0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID7CoMKgwqDCoCBzdXBw
b3J0IGluIHF1ZXVlIGZhbWlsaWVzIHRoYXQgYWxzbyBpbmNsdWRlDQo+ID4+Pj4+Pj4+PsKgwqDC
oMKgwqAgPj4+PsKgwqAgPg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gZ3JhcGhp
Y3MgYW5kIGNvbXB1dGUgc3VwcG9ydCwgb3RoZXINCj4gPj4+Pj4+Pj4+aW1wbGVtZW50YXRpb25z
IG1heQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgIG9ubHkNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+
Pj4+wqDCoCBleHBvc2UgYQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gVktfUVVF
VUVfU1BBUlNFX0JJTkRJTkdfQklULW9ubHkgcXVldWUNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+
Pj4+wqDCoCA+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiBmYW1pbHkuIg0KPiA+
Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+
wqDCoCA+wqDCoCBTbyBpdCBjYW4gYWxsIGJlIGFsbCBhIHZtX2JpbmQgZW5naW5lIHRoYXQNCj4g
Pj4+Pmp1c3QgZG9lcw0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgIGJpbmQvdW5iaW5kDQo+ID4+Pj4+
Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiBvcGVyYXRpb25zLg0KPiA+Pj4+Pj4+Pj7CoMKgwqDC
oMKgID4+Pj7CoMKgID4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+wqDCoCBCdXQg
eWVzIHdlIG5lZWQgYW5vdGhlciBlbmdpbmUgZm9yIHRoZQ0KPiA+Pj4+Pj4+Pj5pbW1lZGlhdGUv
bm9uLXNwYXJzZQ0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgIG9wZXJhdGlvbnMuDQo+
ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+
Pj7CoMKgID7CoMKgIC1MaW9uZWwNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+DQo+
ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPsKgwqDCoMKgwqDCoMKgwqAgPg0KPiA+Pj4+
Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gRGFuaWVsLCBhbnkgdGhvdWdodHM/DQo+ID4+Pj4+
Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKg
ID4gTmlyYW5qYW5hDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPg0KPiA+Pj4+Pj4+
Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gPk1hdHQNCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+
wqDCoCA+wqDCoMKgwqDCoMKgID4NCj4gPj4+Pj4+Pj4+wqDCoMKgwqDCoCA+Pj4+wqDCoCA+ID4+
DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiA+PiBTb3JyeSBJIG5vdGljZWQgdGhp
cyBsYXRlLg0KPiA+Pj4+Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gPj4NCj4gPj4+Pj4+Pj4+
wqDCoMKgwqDCoCA+Pj4+wqDCoCA+ID4+DQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAg
PiA+PiAtTGlvbmVsDQo+ID4+Pj4+Pj4+PsKgwqDCoMKgwqAgPj4+PsKgwqAgPiA+Pg0KPiA+Pj4+
Pj4+Pj7CoMKgwqDCoMKgID4+Pj7CoMKgID4gPj4NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+DQo+ID4+
Pj4+DQo+ID4NCj4gPg0K
