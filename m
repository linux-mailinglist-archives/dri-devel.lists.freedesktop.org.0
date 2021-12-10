Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCD146FC68
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 09:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E840010E23F;
	Fri, 10 Dec 2021 08:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F16F10E234;
 Fri, 10 Dec 2021 08:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639123921; x=1670659921;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TU0d7XLOeTBJ/Laq2fhw3DL55Z21CXsP5ztOrSFMvBQ=;
 b=liiNe+fmqgqK9DxqN+sV8rfWrKpQd9yLBos27FsPa79LD/PsOJ7Ijop9
 MshNUPBmYdcCjTQ7G3unXAzo5fTI36VqjFO9dqB6K1dXmJ3oxmBMAPZA+
 gsi7i6MMIs2CHqJZKxSC0nt2+FIXPJcI/jr/+I+OWX+NskOEBjGDI/Coz
 ld/0k7MgvOzcyMzrmcXTC+uMDivqFJ5ZbEsEwvIU0srrfEjlfzk9Rpm1I
 NCvvATI/smuWoRRqWCVK+YJJu6QWWWk2iJwJrbS5WTrf+q4nnzLS8dNJe
 DS3iWPa7K9vghTRDU3H6myeq0FcauVksm4bzoTEzEtxgKlRs7fzgIiaQw Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="262410468"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="262410468"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 00:12:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="462460129"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 10 Dec 2021 00:11:59 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 00:11:58 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 00:11:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 10 Dec 2021 00:11:58 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 10 Dec 2021 00:11:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvCPFYSXnxqwGKNXKkdfCfLu/y6zRkwD3VUGMn9F60BXpciTP69Kfbg1Bh3vnW830QeP5ZpCGsoqVQXYUIiEEtt4p7R4H7SpV0IDe8gZGMQj8OOMCmMnb1tIpDVYyoTeazzI1epDd62507z6HU/P5ZXEFMy/DnaQg0w2BpS9Bbkf9Ldq1MSc0d8RszNBejViMO/DkOkcDJLHkj7QU6nO1qR+5cmGOtYbz2IGv4l3at0iAv71WWB1A3fy9bBbvC2jkcIdQCRzmP5IiD20Zmry+2YppAgBcgXSCEmXp/zY7RvVquxrMKOI5r5077bJWKe38OFiQtfQNE1FsaW30b5ncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TU0d7XLOeTBJ/Laq2fhw3DL55Z21CXsP5ztOrSFMvBQ=;
 b=UKd4aywtytH+d8A0UcdJkJnj642h1zsebYmKV5QxKLsagYeqpTsBHuLc8TizQHUgUGmrf4cUjzMcKaefwipjn8GjvoaURxQnuFYo1pKwLLYUBs+pjuoXFtI9ORHorDpHJwKXKVM/QThhu4w5FjsYEbed8ezryn3c6jQ++GwsJdr91dJ4YwGPa+A3dLMAKOi5mxCM/+zY3vv95OeJmZvI5cfXqi/A8trhHWWLKIa1s/jdGhDWNbtyBZNZDe20xpxa652mNlliVVF2rDhYMNilWPF7Wtrq+B1Bp2q9gsWfTl/8wmGfHLTU3fz4GYxVLQhEuFinVhXcHdokLfEvRgbcNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TU0d7XLOeTBJ/Laq2fhw3DL55Z21CXsP5ztOrSFMvBQ=;
 b=i+GGg4FlnAr2WYGGt8A+B79/jq7dbLR6tEOZARjyeg2hIc3/HMrcC/kke/RziwqvHks5BojiRYWrnaGCwZKZsrvpKuWGEGCv0Jndrh25HSCe+dIRbEG+gzPZ3BlDxAAajfbxnGi0eSb/yU4LnzOs1FCbK6KBk6ijMsShu5g3GHg=
Received: from BN9PR11MB5545.namprd11.prod.outlook.com (2603:10b6:408:102::19)
 by BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.15; Fri, 10 Dec
 2021 08:11:57 +0000
Received: from BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6533:7d95:6f60:aafd]) by BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6533:7d95:6f60:aafd%9]) with mapi id 15.20.4778.015; Fri, 10 Dec 2021
 08:11:57 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 4/9] drm/i915/gvt: Constify intel_gvt_sched_policy_ops
Thread-Topic: [PATCH 4/9] drm/i915/gvt: Constify intel_gvt_sched_policy_ops
Thread-Index: AQHX6P1/uYQTMFP1+ESHdcU1HmdX5qwraTYA
Date: Fri, 10 Dec 2021 08:11:56 +0000
Message-ID: <7b933053-5275-9d97-d667-8688e3a0cccb@intel.com>
References: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
 <20211204105527.15741-5-rikard.falkeborn@gmail.com>
In-Reply-To: <20211204105527.15741-5-rikard.falkeborn@gmail.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84b06375-f3c3-40d3-a615-08d9bbb4bbe9
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN9PR11MB5276F0EF4469FF106B915723CA719@BN9PR11MB5276.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:785;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PxLThwWH7m/u5v7OrKmBp2ATF4Jj2p165qMH0T+gaDFZ9LKHHx79cv+caLHEO2uckFOXtL/H5ZEG9BKp0eGR84HjnMDwjqioS5xejt928idJ17cBR6cB0JREGlQRiQibN0jAYPN7D+GrY/tJOqHcPpZp0xMyhB06DsTeErS1aWw4t5Qpq6tC3daDeyRdQAljrma5rDgHop/VrCVFQ6BZPD268cawVHWNUW7KG0Do2LbmewD4FiqYy0/mlFTg3qkUJTOc61eeyjIr4SiYQNYNSYfD5p396O3fEUgH0auqi6TnBuJQJppaNHRO5w0STO6y12/r3wSDORql9f5ysIEiClgr4YAZvcfRG6E6mRTA932JBr3M3jnZbDV3Uv69UFxXAk6qJ/GjO0Y7O1CqzCqXf4+2aOFhoRgo92i/fNNNzrGXw5L+tUt+sOxNEoOgXUs1VXuOXj1zqLbtjA+3A4GEh9okvE5Ean/49XCgzAgCin31mE1GcayrCTnoq3LUG7FUFu5UVe88BEYGZLLGsxDHAp5K/o0pRxJpyOE7CdSLC8p6vlb/NlUqgX9j6yA6zc+soWZTkJl4CJYlg7+3EoxZ1kufi7jKpbVU5fj2Rvj3Kkcc7VoGBEDE2eXLmhyqxhWDKYZzTQiMWOMXflj1qB+mcG3l4ilni2KgGxcHlxiQsJWUaUp1xPB+vFtwvvygxrZRRBb4uWuBOeFyUfmXJTTVj+dXbJEYQoi9D7b4z15TvjRxUGK6jPKuxh2fVJrFGz3fnMEx/YQOLjde36PlYWEtKA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5545.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66446008)(66946007)(2616005)(31686004)(36756003)(66556008)(64756008)(91956017)(76116006)(66476007)(6512007)(31696002)(83380400001)(7416002)(5660300002)(508600001)(8676002)(8936002)(53546011)(71200400001)(6506007)(38100700002)(186003)(6486002)(38070700005)(4326008)(26005)(122000001)(110136005)(86362001)(82960400001)(316002)(2906002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmF1dTFmYm9sZG1ERVRabmNkdElxTHZmQ2RwTVF1S2pBRGxyOFNVTGZwdGJN?=
 =?utf-8?B?NmdtOU9FQ2lSSDFwMGdzVWo2cmRNSEVGREh5S2xNZDdoQXVOSVJINThkdGtT?=
 =?utf-8?B?dzJuVEFhM3dpdDk5c2VYT29YeTF4djNCVlFES2tiV2p5SUJyK3VGbXRPcU81?=
 =?utf-8?B?c1FRa0Y0eElDeGh4c1ZyRFZSM2lIVEpTaTU5Y1padWJsdFRoZkZzVG9TYkY3?=
 =?utf-8?B?QWJWd0UzQy9lRmgzVTJsVmhWdWdiYU5jRlRna2ZVcVM0Q0RtakxmQk1ZUUlt?=
 =?utf-8?B?ZTJaSVRrZGpvTVJCczVjd0dNWUsrUEtwRE44Wk8zcm50cWZCeEtlRGJ6MHFz?=
 =?utf-8?B?bTE2cXEycGhYLzhMdERHSHpDdSsyYTJscjZTRVF6bXI4c2Jad0xIVSsrTC9m?=
 =?utf-8?B?ZWtVV3RmT1FQSXd4Qk12Vmw0SUFiSW1KSllQYUx2dEU1VFBhcC9ZZy9pSzV4?=
 =?utf-8?B?WmdHQit1azVMY2wxRmM4RzJqZ1lVNnR3U2lReE1OZzBFcUMwNi9yUTZ6MzVB?=
 =?utf-8?B?dW9iWDROYnNuR2V3c09rK2svajRZMkhld2h6aUhBemJnZ1V2V3NMY01pd3dQ?=
 =?utf-8?B?RWxCMmR3Q0lPNENBRW1mQmVMd2g4MnZnais5SG1HYWpOcjFNUWdqcWhQS1Ur?=
 =?utf-8?B?UUsrTk1GV2luZ0xYN2pKM0NMVXE5SURNY3N4YXFiNURSdnFyRzNEbTE0cTFO?=
 =?utf-8?B?VXJ0WXpIZWtBZGpid05KUktaYmJUNDM4VHUrbVl1Tm5zK1VvMzg2Q3lSWGdx?=
 =?utf-8?B?TFAwSlZsZkhleDl0MkF5TWNacW1uTVRsY3pGYWl4R1k0VGt4a3c3L3lRT2dx?=
 =?utf-8?B?d1ArOEQzSnByNHMvTWFwSFRXdEdiTzZtWHVBWURUdDBha2tUc2pmLzVXQWVr?=
 =?utf-8?B?V2pCL3Q4Z2hJQVVtby9EdGY3Mzd5MHpXWDZBbEpZVFQ0RnVabHhGRy9LUjY5?=
 =?utf-8?B?UzUvSEh0T21NSEZTWnB4V3dzU2JuSC9wTXdjazMySS80WktObXcrVVNJTThk?=
 =?utf-8?B?UjI0eW1lZWFFVGZKR0JwNnBiaERBUFhjMi9LaUh0dURvQ2dTSjd3a1ZITzFK?=
 =?utf-8?B?Q3dSM2tyK3VTZ1BOdm55N2haaWFyaEZnaktvUWhzVDNjTlM5a09pbFBHUFlQ?=
 =?utf-8?B?eUFhMk0wd1NUd2M5NTNKQXk4bTR2Q284N1Y4WFl0TXFHQndQclZDQ1c5QXYx?=
 =?utf-8?B?VXhXOHpraHVZVUtPMzNiUG53WndJSW13MGxRaG9handYT2N4TWR0MW1wZGhp?=
 =?utf-8?B?eUVWR3BkK3A0MndDNUV0cmJUTGRHZm9ubnc0UDF4b2ZCd3BtY3pBd0VqNFZC?=
 =?utf-8?B?eGpOTHBRMG1KcVJoMmEwYTNsQ3FROGVtSllYdkxZY0VsWUtiU2lZNWpKM3M5?=
 =?utf-8?B?TDQ3QXRyNWFUc3JGVTBBUk9mUkJJTjJVWTlNMFJselNqZUhVbDZ3NzRnS3VS?=
 =?utf-8?B?d0k4ZWQxT3owS1h5ZXR3ZHRXdE5Rays0My9PaEJkbmxQaXBVQWlMU3FMYU5X?=
 =?utf-8?B?clNhUWkydTVnMkxRcHJyM2VIS2hQZThZdkFDbzRFYlBFWXlGRkY3YVlnT2Jx?=
 =?utf-8?B?TGVzTXlBTWFyYVV5ZUxOMlV6a3RzSHoyOXFuYnF5TXE3eTZLR1p2UTQwM2Vv?=
 =?utf-8?B?dmNiTlZuaVhQQnZqSzJ3OTRLNjJkbTc3WS9DenNQM3lLRUQ2NUgxNDN6eE9m?=
 =?utf-8?B?LzNtdDJuNk9GaW9uYk1qZ21QRUUzVmdKa3NMVUFGZ1QyZ2FzQUFOQmNpdHJK?=
 =?utf-8?B?QS9TVDdkN0lJSGVxMHFBRjRFQ1JnVitzeWtvanQwaHR2QmQzakZhcnF2ZGVu?=
 =?utf-8?B?clVnam84NEZEZGhSYlYvUlpEcWlBalBrWG9Pd1NjWmlaZ0NOT1NHWTU3Vm5T?=
 =?utf-8?B?TFV5TFJ5QWxvT0d3a0N0aHZJUlpreU1xU2ZvNGhvT1E4YjNxT3NUaHNlWkRx?=
 =?utf-8?B?VHM3enBpSjN2WlB0Zy9QVlB6aWIySnlyTTJRM1hCV2pGaDlpbUU4V3VuMDhV?=
 =?utf-8?B?Vy9mcjhBOURPcWsyek9Cb3prdTN5SGlzUS9nVUFHRW9DUURCTXl5YXEwdFZ3?=
 =?utf-8?B?TklzckpnZUdqNWZ1OG9ObDlRVFdIZ2g3Z0ZVNXpvVmE3UFMzQWdNQU9YTHpU?=
 =?utf-8?B?TC95WVVuWHE0eHdBWXcwVW9VYXpDUDVFMVdOVW5kVjJweGVUZTdGQ2RmbW9Q?=
 =?utf-8?B?Rmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B26FA0484F23542812C530DEE92A0E5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b06375-f3c3-40d3-a615-08d9bbb4bbe9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2021 08:11:56.9421 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: anuZygIO9e6UFTGnJXAjdWBji0ikyfTwTGEfTB3w+0hbGZaVsnXiPFvm5NSL43KmLuvHBhmzhANiegNh4Q+PBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5276
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvNC8yMDIxIDEyOjU1IFBNLCBSaWthcmQgRmFsa2Vib3JuIHdyb3RlOg0KPiBUaGVzZSBh
cmUgbmV2ZXIgbW9kaWZpZWQsIHNvIG1ha2UgdGhlbSBjb25zdCB0byBhbGxvdyB0aGUgY29tcGls
ZXIgdG8NCj4gcHV0IHRoZW0gaW4gcmVhZC1vbmx5IG1lbW9yeS4NCj4NCj4gU2lnbmVkLW9mZi1i
eTogUmlrYXJkIEZhbGtlYm9ybiA8cmlrYXJkLmZhbGtlYm9ybkBnbWFpbC5jb20+DQo+IC0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZF9wb2xpY3kuYyB8IDIgKy0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmggICAgfCAyICstDQo+ICAgMiBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWRfcG9saWN5LmMgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvc2NoZWRfcG9saWN5LmMNCj4gaW5kZXggMDM2Yjc0ZmU5Mjk4Li5jMDc3
ZmI0Njc0ZjAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZF9w
b2xpY3kuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWRfcG9saWN5LmMN
Cj4gQEAgLTM2OCw3ICszNjgsNyBAQCBzdGF0aWMgdm9pZCB0YnNfc2NoZWRfc3RvcF9zY2hlZHVs
ZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSkNCj4gICAJdmdwdV9kYXRhLT5hY3RpdmUgPSBmYWxz
ZTsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgc3RydWN0IGludGVsX2d2dF9zY2hlZF9wb2xpY3lf
b3BzIHRic19zY2hlZHVsZV9vcHMgPSB7DQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGludGVsX2d2
dF9zY2hlZF9wb2xpY3lfb3BzIHRic19zY2hlZHVsZV9vcHMgPSB7DQo+ICAgCS5pbml0ID0gdGJz
X3NjaGVkX2luaXQsDQo+ICAgCS5jbGVhbiA9IHRic19zY2hlZF9jbGVhbiwNCj4gICAJLmluaXRf
dmdwdSA9IHRic19zY2hlZF9pbml0X3ZncHUsDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvc2NoZWR1bGVyLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1
bGVyLmgNCj4gaW5kZXggN2M4Njk4NGE4NDJmLi4xZjM5MWIzZGEyY2MgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuaA0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmgNCj4gQEAgLTU2LDcgKzU2LDcgQEAgc3RydWN0IGlu
dGVsX2d2dF93b3JrbG9hZF9zY2hlZHVsZXIgew0KPiAgIAl3YWl0X3F1ZXVlX2hlYWRfdCB3YWl0
cVtJOTE1X05VTV9FTkdJTkVTXTsNCj4gICANCj4gICAJdm9pZCAqc2NoZWRfZGF0YTsNCj4gLQlz
dHJ1Y3QgaW50ZWxfZ3Z0X3NjaGVkX3BvbGljeV9vcHMgKnNjaGVkX29wczsNCj4gKwljb25zdCBz
dHJ1Y3QgaW50ZWxfZ3Z0X3NjaGVkX3BvbGljeV9vcHMgKnNjaGVkX29wczsNCj4gICB9Ow0KPiAg
IA0KPiAgICNkZWZpbmUgSU5ESVJFQ1RfQ1RYX0FERFJfTUFTSyAweGZmZmZmZmMwDQoNClJldmll
d2VkLWJ5OiBaaGkgV2FuZyA8emhpLmEud2FuZ0BpbnRlbC5jb20+DQoNCg==
