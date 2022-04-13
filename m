Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 604474FF431
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 11:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4316B10FC10;
	Wed, 13 Apr 2022 09:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C05210FC10;
 Wed, 13 Apr 2022 09:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649843604; x=1681379604;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3tQ30ra9aSJAnnVO30f2zcNujBpt4HdIoeq4GsWPlEo=;
 b=l/Nza0GXpM7TuCDu9El2LQ2eQjCHQiWq490P6DBrbMWVuLr8Ct4eKvKe
 t5n7zTzMfYuGTWk3Revi3ttfR3WW2UetOyR5yAV2fUve/YaUbI9bFVZ2L
 XTByQeQsbyuoseO9m+vIMVOnUhr3XC7L/srH/gkcCSL8nqfHlMJ1jHjs8
 Da57AAJ1A0l2U5IAhe9+E3GDHZ8bXQHKxJzFzf2285r0b7K8ajdDbLsZ6
 PXWiOly7+VkmxknDZ4FjCLQclo37LEJHUarqn9wgpq3X65h87UO5scloh
 p2DG4WZaUUIKupiv658GBEbtkHu368zc/7l2JIq8wzvoIRKq3EKWBF8h1 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="262068576"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="262068576"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 02:53:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="802628573"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 13 Apr 2022 02:53:22 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Apr 2022 02:53:22 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Apr 2022 02:53:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Apr 2022 02:53:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Apr 2022 02:53:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8jzbjSVCPaRq4R4WF95GywRovQ+0rjqEra0mgSAg+R+f5kPNuZUR9mxdryyoN0yDGcDM5UUaOdbHrUzLr43RdF62ohkgJqR7Uo5X5l7OrtRaxqGgL0ziafk1LH4FBohkr1NnQlNYUe9pnBCw5+31wJwPvrNbIxqll3u/SWY1QIUT3uw4Sx4MhlKTxRq0OFbsBRoK6f1et6OZDwSYHRcbRILpEYnshKDTEdK5UknxjOZWlxUTm+nq0XceLz11jYScdhqvNUnJBxIt13xC1cpkUb7N00UHM+3or9FTJhqZbsVYVKxWJBQI9+97tYJvCktBlzba4gkU37xI5rbtmsCTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tQ30ra9aSJAnnVO30f2zcNujBpt4HdIoeq4GsWPlEo=;
 b=bP2sc5szKuicj8oysgatp/bbq633jlvJO+dpvKt6NVW35BNLbPTV1h9yrGkmm+g9cuf1dz/w5OJ5bFxeUF1KCSqmUaIKc8cxPb0z6WOf1X2VW9wzZZ0xosFfwuVg6QhJwx4GspQgLch/VeDT3FibnvEn1mTL04Vi80E7MlEDT9f3X8p31BwaA/4sA6sFvvFxqEBdCmaOwQGyJZJ/GFNTOD4LXCVz5ryFxbU1fov6XQVDTVavx6tVC64/SM2FNEuhYzsV8Yc03ZI4ARaCnh9PhWoeH5J7XWiYMY+v2c9iP2g0Z5cXPSU3qTehHmB5tisX7e+5BVUAYuQq4TPjpstfRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 DM6PR11MB4027.namprd11.prod.outlook.com (2603:10b6:5:199::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Wed, 13 Apr 2022 09:53:19 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%6]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 09:53:19 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Zhi Wang
 <zhi.wang.linux@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v9 1/3] i915/gvt: Separate the MMIO tracking table from
 GVT-g
Thread-Topic: [PATCH v9 1/3] i915/gvt: Separate the MMIO tracking table from
 GVT-g
Thread-Index: AQHYSk/vDxh6otQMi0KsvRqKHUKM56zkjLIAgAGCyICAB45NgIAABjSA
Date: Wed, 13 Apr 2022 09:53:19 +0000
Message-ID: <60f369bf-c631-99e9-4bde-f5d200aa388a@intel.com>
References: <20220407071945.72148-1-zhi.a.wang@intel.com>
 <20220407071945.72148-2-zhi.a.wang@intel.com> <874k35541h.fsf@intel.com>
 <986b8ff0-d0de-437c-8a56-c54aafb6159a@intel.com> <87h76xgwis.fsf@intel.com>
In-Reply-To: <87h76xgwis.fsf@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 222f4388-a108-4f71-bdf5-08da1d3370a2
x-ms-traffictypediagnostic: DM6PR11MB4027:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB402706492AEB5E961F63BE1BCAEC9@DM6PR11MB4027.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YHFyHjviB1MVKUMnfVn1w60xqMGx2O9PRKCvai8F9TpE695sjc/CRVZ5rY3PyhdQGQIIsg1qpKNxQ0jhxJXRILqSWcj86qQRgWr21BsyenE7y8UIfLCSf/p0QJw0dJ1OaOmuyVz2xQCvJgc8/Vo7dvg0Ra3JsK9FzHvfYQbeaO3vGYyMgr+Qha3KngKpMRYogKeMXL1ZNM9V5xsJsr6Ry35eOVQINEii+zddrxy1Yn0BT9I7W6tvwWqzhX5MwQvfqRC1FcTYnVsWJlMDVAxdggF7q/OtcsE3S+AatZahW8lTfwpGYrxOmcq5z2oaz0ExvVwkJf2AjpmJAzjFyWsVs+MzxOtGeJuZIoGdDfsLScH1uE3FTOEhnSK2LQoVgMbb4MgZE7oDQxNRezoP9LNJo3pwWS/UoAOhn221PbY+Vjsme56bPBMbXA5y0R9tj2mNNcevxphNyLBC1loPEG2lp1xni00bl/nq3P1zLWqAeIrIjGJ+te3vqv3hqHnIldA1Vv2eC8eMsNDFdQjD9U34M3RZiHH1uWQHPrLGZP+JJZgxVwPO7WwDLBDXQ8to+rYZ9pg1rvugjaovjQriks+ciwgO8Q25rkLGKoU8vXd6f/YTqz0jOB0GbvqfjuQdrITIhO3xtdZJ1R4jdhdWYaBVYjLAM3LkClQ1SvQluUo3oq1REJVL3VBqtofNPPcCOCVVtvmStj3iq/NGpOj95aryFskNoTlO77P5fQi/qw+4gKCD5UQMkzBrXcRst2cT/aUHAXA8qLOSUShGKLQRFi0BUg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(53546011)(6512007)(83380400001)(2616005)(38100700002)(36756003)(76116006)(186003)(122000001)(8936002)(26005)(31686004)(5660300002)(71200400001)(508600001)(91956017)(6486002)(966005)(66946007)(8676002)(31696002)(4326008)(54906003)(110136005)(86362001)(2906002)(7416002)(82960400001)(316002)(66556008)(64756008)(38070700005)(66446008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NG5ST2lCMkZBQVhKV0dWTW1hTURod1pOZ2pxdmd3cytuREY0YjkybDRSQ2Zl?=
 =?utf-8?B?VldFaXB5VXQrWkJmemxTdklVMW1HLzF4ajh5M2M1MnlVSUhvVmVBeGxjU1d2?=
 =?utf-8?B?YzF5THJVZnpDeG9vUUhnKzdFQjBwMXJFQmFsbUhIQ0xWTDRxRlZoak92VmRr?=
 =?utf-8?B?enJYTStkSHNVK3ZaMDByWFlDSVc1RU9za2FjQ3ZuUk1uWnRKUDlqZ21jb1lF?=
 =?utf-8?B?Z3U1eDZqWERjeEZmcitITUFQLzVSaDJDMHJzS0w1WmdvYTloZHAzdVNyV2xV?=
 =?utf-8?B?Nk1WZG9qOWhWejA1RUpFV2ZGektHU0Y2b1NHZXpoZlZWeE5zOVh6T2RtWG1N?=
 =?utf-8?B?UFBGU0FHbVNSMUFGczlFSUtkZHlVYWgxS2wwZ1p5Q3FhSDIxTWkzNElQVkFn?=
 =?utf-8?B?Sjd3REJSNDVXd1JFUU52RSt4NXFCKzJsSmFDSStUNXQxVy83ZXlYd2hkQjZk?=
 =?utf-8?B?ZTRvNmF1eTF1WmRFUUhkclRVUkJHanRKZmo0bExTRHhnbytPaHNycCtxbUNK?=
 =?utf-8?B?NDF1b3h1akdKSHlURTFZNWJsUFIwaHVKR01mZml0alZ1cG9adE1QbjFtOFMy?=
 =?utf-8?B?aldCeko1SGZMcU1ReTR6YVlrQldmakdSemI5a1J0UVBsQlVka2dYSk5FdlhH?=
 =?utf-8?B?cmY0di9tMDQzcThLd0FjLytVVFFhQkNqN1UzRThGMEFiM3JSQUFhY0pRNUdN?=
 =?utf-8?B?aXMydEtFQXluKzhiVkt5N1NIZmtqMWRVQlN2UDgxMmxWSVJSRTBUd1BVSlE0?=
 =?utf-8?B?SW5VZzlJeFhrWngyNGVLc0JuU3BoV0gwMVpMSmRYVEw4ZFh0blRvOC84VTVB?=
 =?utf-8?B?WkErelE3WW5RM3lpeUw0NVZVbzY1VzdsQmhKcmQwTnVERVhUcFdjbXpWemFm?=
 =?utf-8?B?R0JiR1djMTR2cDJueW1Vb3N6MHNLTCsvak5BYktLM0M2UnlpWDNxS25XaXhM?=
 =?utf-8?B?eXdsWTFlQ1JETU1yZ1l4UWNkMW9Qak5WOFFKaHVnSEFkMzA3QU1xNTRLQ25I?=
 =?utf-8?B?V1NrK2kzN05Sd1gwU1FSbDIveitLUVpVTElZYVUvbmtLdytlSkdpeCtoRnkx?=
 =?utf-8?B?R3FnejUzTEpWRzBhNERGeGhuMXNrZjF4UnF6UGxubTJ0YjJYSUdZT2FLUExk?=
 =?utf-8?B?YU1EMndmcEg5SWlLVE5BZUtLVWNaME1sbWEralJmdmZHV1Z6Z21iWUQ3OWpO?=
 =?utf-8?B?ZmdmVVBwNjlrY1lEMGFmQWJQd3NRVWgvaGZyenhCQWRTQnJZNXFySHhSdmJT?=
 =?utf-8?B?MzJ2dVZVamsyWFQzRjZWMFNYenEvMjJHZC9haG4wbUFZd0NYTjAvS2hZbVNu?=
 =?utf-8?B?SkNMdlZwTmczWkFDd0h3ZUcrYWpkVytCRzBaV0xIWU10ckdHZFRQR0NJS0gy?=
 =?utf-8?B?d05pZG9LSkhWZDYrZFFmMWZzNUpLTmRxb3dGV1lYY1Q4czFYdkJMRFVPU3BJ?=
 =?utf-8?B?dDFkeGJZUHBxamRJWituMllCTFo0bVdQSjMyQkw0SGVObW1RNGlwNS9mRUI1?=
 =?utf-8?B?eTIxUWRHcU4zRkZtUXlYUXhrWGV0d0ROSllqQXBtTUJTT2x4NjNTZ01mdk9G?=
 =?utf-8?B?TG03Z0VuaXJPb2hIc3g2M0dQWDJ4cVo4MUtLMndIeHRwRjhobm9CQm9GNExp?=
 =?utf-8?B?QUY2M0pvQ215Yk9KQWNFL1liWDlobVN3b2plbzNRbVg4Vjdoa0cyK0JFUy9W?=
 =?utf-8?B?N1VOY0E2RGNLNVlXdnZ5UVBaRmwwc2NCRXYvd1ZYNzRtMDNOUVlwemduYXRs?=
 =?utf-8?B?dVdWNUVuUU4wYVlCbzhCaW5zYzRoQXhsbjM1Nmwwczk3SFRSanFrUHZzT3Q2?=
 =?utf-8?B?d0lYS3R3aWdSZVdiTm5XL2tvWTRJQmpRTTdyb2FVUEt5aitqdEFIK0ViS0sx?=
 =?utf-8?B?YlFjZnNFZ0NiNm5YUmxCTnViRDdLajJqMW5IbHlFc2tKV3hITDV2VVlqYXU0?=
 =?utf-8?B?dFRYRGlaaEdpUUJYaXRLYVU3bFoycVNVekl0dEJRdnFhZVlHbHFaQklCV2c1?=
 =?utf-8?B?c2d2YVZLWDNkK0UwdVBJdzBRZnYvVVFkQUZBeW96MWNBamJRT1E3MTBWMm8r?=
 =?utf-8?B?VTc3UXBWWVhsbFNPemxiY2hCcmJwNElhTFBwWmpRdjBoYmNSQjU5Rm9IWlhU?=
 =?utf-8?B?Z3ArbTRDN2xFcmlwV3lFYXdvY1F4clYweWhERXR5TWkrWmRLOUZhY3BTcU1H?=
 =?utf-8?B?d25iYWtuV2Q1N1k5REFhMTZxc1lvVm9lL1ljWW9MS3FUZGZVem5jVUl4YzNv?=
 =?utf-8?B?Wk1JVFpyNThxNmNGSE5iL3J3UnY3Yy9YazQ3VEdYaFZyK0hUVEtCRVhiMVBs?=
 =?utf-8?B?d204SzlNdU4wbDE5MXMxQ2pEZ3k5SEtNczVEbzlCcGZFSmJMd0Jldz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5775EEF13AA13343AA13EAB59E5F9DD7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 222f4388-a108-4f71-bdf5-08da1d3370a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 09:53:19.5816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TF+0XU5svT7FiUqey+l/7crtrEEI60vueID1p52Ka4ljrT9RTRHbO0eGpiFXFvMiAIbedYOzY89WGrNMtZOpjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4027
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
Cc: Zhi Wang <zhi.a.wang@gmail.com>, Jason
 Gunthorpe <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFuaToNCg0KUHJldmlvdXNseSB3aGVuIEkgc2VudCBhIHB1bGwgcmVxdWVzdCwgaXQgd2ls
bCBiZSB0b3Agb2YgYSB0YWcgaW4gZHJtLWludGVsLW5leHQuIFRoZSBmb2xsb3dpbmcgcGF0Y2hl
cyBtb3ZlIHRoZSBETUMgcmVsYXRlZCByZWdpc3RlcnMsIHdoaWNoIGlzIHVzZWQgYnkgR1ZULWcg
aW50byBpbnRlbF9kbWNfcmVncy5oIGFuZCBpdCBpcyBub3QgaW5jbHVkZWQgaW4gdGhlIGxhdGVz
dCB0YWcuIA0KDQpjb21taXQgOWM2N2Q5ZTg0YzdkNGEzYTIzNzFhNTRlZTJkZGRjNDY5OTAwMjAw
MA0KQXV0aG9yOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KRGF0ZTogICBX
ZWQgTWFyIDMwIDE0OjM0OjE3IDIwMjIgKzAzMDANCg0KICAgIGRybS9pOTE1L2RtYzogc3BsaXQg
b3V0IGRtYyByZWdpc3RlcnMgdG8gYSBzZXBhcmF0ZSBmaWxlDQogICAgDQogICAgQ2xlYW4gdXAg
dGhlIG1hc3NpdmUgaTkxNV9yZWcuaCBhIGJpdCB3aXRoIHRoaXMgaXNvbGF0ZWQgc2V0IG9mDQog
ICAgcmVnaXN0ZXJzLg0KICAgIA0KICAgIHYyOiBSZW1vdmUgc3RhbGUgY29tbWVudCAoTHVjYXMp
DQogICAgDQogICAgU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVs
LmNvbT4NCiAgICBSZXZpZXdlZC1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBp
bnRlbC5jb20+DQogICAgTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Bh
dGNoL21zZ2lkLzIwMjIwMzMwMTEzNDE3LjIyMDk2NC0zLWphbmkubmlrdWxhQGludGVsLmNvbQ0K
DQpJZiBJIHN0aWxsIHNlbnQgdGhlIHB1bGwgcmVxdWVzdCBiYXNlZCBvbiB0aGUgbGF0ZXN0IHRh
ZywgYWZ0ZXIgdGhlIHB1bGwgZ290IG1lcmdlZCwgdGhlIGNvbXBpbGluZyBvZiB0aGUgR1ZULWcg
bW9kdWxlIHdpbGwgYmUgYnJva2VuLCBhcyBhIG5ldyBoZWFkZXIgbmVlZHMgdG8gYmUgaW5jbHVk
ZWQuDQoNCkNhbiBJIHNlbnQgbXkgcHVsbCByZXF1ZXN0IG5vdCBiYXNlZCBvbiBhIHRhZyBpbiBk
cm0taW50ZWwtbmV4dCwganVzdCB0aGUgbGF0ZXN0IGRybS1pbnRlbC1uZXh0Pw0KDQpUaGFua3Ms
DQpaaGkuDQoNCk9uIDQvMTMvMjIgOTozMSBBTSwgSmFuaSBOaWt1bGEgd3JvdGU6DQo+IE9uIEZy
aSwgMDggQXByIDIwMjIsICJXYW5nLCBaaGkgQSIgPHpoaS5hLndhbmdAaW50ZWwuY29tPiB3cm90
ZToNCj4+IEhpIEphbmk6DQo+Pg0KPj4gVGhhbmtzIHNvIG11Y2ggZm9yIHRoZSBoZWxwLiBDYW4g
eW91IGdlbmVyYXRlIGEgbmV3IHRhZyBvbg0KPj4gZHJtLWludGVsLW5leHQ/IEkgbm90aWNlZCB0
aGF0IHRoZXJlIHdhcyBvbmUgcGF0Y2ggbW92aW5nIHRoZSBETUMNCj4+IHJlbGF0ZWQgcmVnaXN0
ZXJzIGludG8gZGlzcGxheS9pbnRlbF9kbWNfcmVncy5oLCB3aGljaCBpcyBub3QgaW5jbHVkZWQN
Cj4+IGluIHRoZSBsYXRlc3QgdGFnIG9uIGRybS1pbnRlbC1uZXh0Lg0KPiANCj4gU29ycnksIEkn
bSBub3Qgc3VyZSB3aGF0IHlvdSdyZSBhc2tpbmcgZXhhY3RseS4gV2UgZG8gdGFncyB3aGVuIHdl
DQo+IGNyZWF0ZSBwdWxsIHJlcXVlc3RzIGZvciBkcm0tbmV4dCwgYnV0IEkgZG9uJ3Qgc2VlIHRo
ZSBjb25uZWN0aW9uIHRvDQo+IGd2dC4NCj4gDQo+IEJSLA0KPiBKYW5pLg0KPiANCj4+DQo+PiBH
dWVzcyBpdCB3b3VsZCBiZSBiZXR0ZXIgdGhhdCBJIGNhbiBjaGFuZ2UgdGhpcyBwYXRjaCBhY2Nv
cmRpbmcgdG8gaXQNCj4+IHdoZW4gY2hlY2tpbmcgaW4uIFRoaXMgd291bGQgcHJldmVudCBhIGNv
bmZsaWN0IGluIGZ1dHVyZS4NCj4+DQo+PiBUaGFua3MsDQo+PiBaaGkuDQo+Pg0KPj4gT24gNC83
LzIyIDM6MDMgUE0sIEphbmkgTmlrdWxhIHdyb3RlOg0KPj4+IE9uIFRodSwgMDcgQXByIDIwMjIs
IFpoaSBXYW5nIDx6aGkud2FuZy5saW51eEBnbWFpbC5jb20+IHdyb3RlOg0KPj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZ3Z0LmggYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pbnRlbF9ndnQuaA0KPj4+PiBpbmRleCBkN2QzZmI2MTg2ZmQuLjc2NjVkN2NmMGJkZCAx
MDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZ3Z0LmgNCj4+Pj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZ3Z0LmgNCj4+Pj4gQEAgLTI2LDcgKzI2
LDE3IEBADQo+Pj4+ICANCj4+Pj4gIHN0cnVjdCBkcm1faTkxNV9wcml2YXRlOw0KPj4+PiAgDQo+
Pj4+ICsjaW5jbHVkZSA8bGludXgva2VybmVsLmg+DQo+Pj4NCj4+PiBZb3Ugb25seSBuZWVkIDxs
aW51eC90eXBlcy5oPi4gUGxlYXNlIGFkZCBpdCBiZWZvcmUgdGhlIGZvcndhcmQNCj4+PiBkZWNs
YXJhdGlvbiBhYm92ZS4NCj4+Pg0KPj4+PiArDQo+Pj4+ICAjaWZkZWYgQ09ORklHX0RSTV9JOTE1
X0dWVA0KPj4+PiArDQo+Pj4+ICtzdHJ1Y3QgaW50ZWxfZ3Z0X21taW9fdGFibGVfaXRlciB7DQo+
Pj4+ICsJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTU7DQo+Pj4+ICsJdm9pZCAqZGF0YTsN
Cj4+Pj4gKwlpbnQgKCpoYW5kbGVfbW1pb19jYikoc3RydWN0IGludGVsX2d2dF9tbWlvX3RhYmxl
X2l0ZXIgKml0ZXIsDQo+Pj4+ICsJCQkgICAgICB1MzIgb2Zmc2V0LCB1MzIgc2l6ZSk7DQo+Pj4+
ICt9Ow0KPj4+PiArDQo+Pj4+ICBpbnQgaW50ZWxfZ3Z0X2luaXQoc3RydWN0IGRybV9pOTE1X3By
aXZhdGUgKmRldl9wcml2KTsNCj4+Pj4gIHZvaWQgaW50ZWxfZ3Z0X2RyaXZlcl9yZW1vdmUoc3Ry
dWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KTsNCj4+Pj4gIGludCBpbnRlbF9ndnRfaW5p
dF9kZXZpY2Uoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KTsNCj4+Pj4gQEAgLTM0
LDYgKzQ0LDcgQEAgdm9pZCBpbnRlbF9ndnRfY2xlYW5fZGV2aWNlKHN0cnVjdCBkcm1faTkxNV9w
cml2YXRlICpkZXZfcHJpdik7DQo+Pj4+ICBpbnQgaW50ZWxfZ3Z0X2luaXRfaG9zdCh2b2lkKTsN
Cj4+Pj4gIHZvaWQgaW50ZWxfZ3Z0X3Nhbml0aXplX29wdGlvbnMoc3RydWN0IGRybV9pOTE1X3By
aXZhdGUgKmRldl9wcml2KTsNCj4+Pj4gIHZvaWQgaW50ZWxfZ3Z0X3Jlc3VtZShzdHJ1Y3QgZHJt
X2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYpOw0KPj4+PiAraW50IGludGVsX2d2dF9pdGVyYXRlX21t
aW9fdGFibGUoc3RydWN0IGludGVsX2d2dF9tbWlvX3RhYmxlX2l0ZXIgKml0ZXIpOw0KPj4+PiAg
I2Vsc2UNCj4+Pj4gIHN0YXRpYyBpbmxpbmUgaW50IGludGVsX2d2dF9pbml0KHN0cnVjdCBkcm1f
aTkxNV9wcml2YXRlICpkZXZfcHJpdikNCj4+Pj4gIHsNCj4+Pj4gQEAgLTUxLDYgKzYyLDE2IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBpbnRlbF9ndnRfc2FuaXRpemVfb3B0aW9ucyhzdHJ1Y3QgZHJt
X2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYpDQo+Pj4+ICBzdGF0aWMgaW5saW5lIHZvaWQgaW50ZWxf
Z3Z0X3Jlc3VtZShzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYpDQo+Pj4+ICB7DQo+
Pj4+ICB9DQo+Pj4+ICsNCj4+Pj4gK3Vuc2lnbmVkIGxvbmcgaW50ZWxfZ3Z0X2dldF9kZXZpY2Vf
dHlwZShzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSkNCj4+Pj4gK3sNCj4+Pj4gKwlyZXR1
cm4gMDsNCj4+Pj4gK30NCj4+Pg0KPj4+IFRoZSBDT05GSUdfRFJNX0k5MTVfR1ZUPXkgY291bnRl
cnBhcnQgZm9yIHRoaXMgaXMgaW4gbW1pby5oLiBTaG91bGQgYmUNCj4+PiBib3RoIGluIHRoZSBz
YW1lIGhlYWRlci4NCj4+Pg0KPj4+PiArDQo+Pj4+ICtpbnQgaW50ZWxfZ3Z0X2l0ZXJhdGVfbW1p
b190YWJsZShzdHJ1Y3QgaW50ZWxfZ3Z0X21taW9fdGFibGVfaXRlciAqaXRlcikNCj4+Pj4gK3sN
Cj4+Pj4gKwlyZXR1cm4gMDsNCj4+Pj4gK30NCj4+Pj4gICNlbmRpZg0KPj4+PiAgDQo+Pj4+ICAj
ZW5kaWYgLyogX0lOVEVMX0dWVF9IXyAqLw0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaW50ZWxfZ3Z0X21taW9fdGFibGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2lu
dGVsX2d2dF9tbWlvX3RhYmxlLmMNCj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+Pj4gaW5k
ZXggMDAwMDAwMDAwMDAwLi5kMjk0OTFhNmQyMDkNCj4+Pj4gLS0tIC9kZXYvbnVsbA0KPj4+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9ndnRfbW1pb190YWJsZS5jDQo+Pj4+IEBA
IC0wLDAgKzEsMTI5MCBAQA0KPj4+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0K
Pj4+PiArLyoNCj4+Pj4gKyAqIENvcHlyaWdodCDCqSAyMDIwIEludGVsIENvcnBvcmF0aW9uDQo+
Pj4+ICsgKi8NCj4+Pj4gKw0KPj4+PiArI2luY2x1ZGUgImk5MTVfZHJ2LmgiDQo+Pj4+ICsjaW5j
bHVkZSAiaTkxNV9yZWcuaCINCj4+Pj4gKyNpbmNsdWRlICJkaXNwbGF5L3Zsdl9kc2lfcGxsX3Jl
Z3MuaCINCj4+Pj4gKyNpbmNsdWRlICJndC9pbnRlbF9ndF9yZWdzLmgiDQo+Pj4+ICsjaW5jbHVk
ZSAiaW50ZWxfbWNoYmFyX3JlZ3MuaCINCj4+Pj4gKyNpbmNsdWRlICJpOTE1X3B2aW5mby5oIg0K
Pj4+PiArI2luY2x1ZGUgImludGVsX2d2dC5oIg0KPj4+PiArI2luY2x1ZGUgImd2dC9ndnQuaCIN
Cj4+Pg0KPj4+IEdlbmVyYWxseSB3ZSBoYXZlIHRoZSBpbmNsdWRlIGxpc3RzIHNvcnRlZC4NCj4+
Pg0KPj4+IE90aGVyIHRoYW4gdGhlIG5pdHBpY2tzIGFib3ZlLCB0aGUgc2VyaWVzIGlzDQo+Pj4N
Cj4+PiBBY2tlZC1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4+Pg0K
Pj4+DQo+Pj4gQlIsDQo+Pj4gSmFuaS4NCj4+Pg0KPj4+DQo+Pg0KPiANCg0K
