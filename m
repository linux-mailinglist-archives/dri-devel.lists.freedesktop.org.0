Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A24728AFC
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 00:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E443410E0EA;
	Thu,  8 Jun 2023 22:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE96B10E0EA;
 Thu,  8 Jun 2023 22:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686262429; x=1717798429;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=RCqxG/vEcyVhW9Y5MDBr2mejhWmxUlgaIc163ehGqFI=;
 b=Xfi/1AOITePy2NPRIcZhsN2N51t5IxjHRni9PPR3Fxh9Ug0fsqNIlch3
 PqHgUqzpMlZiGmtaqPoScXsHykRrtiXkg77Vq1+dyTyCllJutrWXNDxxP
 /8POCw/3ofjsAho+iy4n6E9bsFvaWelkZei89bocyCzo1U8X0237ck55l
 aaGqaVepH33LuvAaMjXWO4KUuViTDLLdug6W6cyjzZl4rsUVwAndMkJ1p
 kcbGBnDlHcEMEUP/qOfxldktpuJdhzxzT8bXbJAf3MprCYolUxDc1HpIC
 WOR7qAAJj54Ix0OBxKG1sKgezaAbUtY6ODlpe5IOq1QqE5bVhNPIsTMfY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="342120843"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="342120843"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 15:13:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="704309440"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="704309440"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 08 Jun 2023 15:13:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 15:13:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 15:13:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 15:13:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 15:13:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSDDlYBfPOJVVzbcB88RI8kCyJgrtr2Tl1Gi2ag6thKlc9iwnUEFCTLf3llze1q3g0zykfQrNYG/DuoYVWDTtBAzMfJCVgNFUg0mWj8hZXrklvbGxaEKOL+ZwGDdjlDsZPE/bE4R7PJcq5mRCqFPtk3zTZtukHBQsdOSlZv+9iIFAe7YFJXWChCDMC8GGkX5hGWyF/H3WyvXDyn1bQeqATpHgkua+SbD29H80MyRVyHNl5NeQjTbCJt3gJkMn4UqZsYUbbOjCRdM9dxrvJjtUB4XJGwkiBvuqzIWyzh8D7C1KfVCMN+jqhMHEn9Vrt2S8jLE1RPy+vBYZp6IVMlAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCqxG/vEcyVhW9Y5MDBr2mejhWmxUlgaIc163ehGqFI=;
 b=Jy4dEiQCD2eBgF2lkaDwASNTXD7i08Eri2zjaIOTkyzoWkH8Xc2RpMVLwT1Wy2H1HjI73DIjTmYxX3LspGcuWvIfOGuOrmyzPGnlEanCwIikz1Si5vFW5iWFbrPiRSkF6DvNI/YsBFzJ9dVzuT2VpOkiZQOp8Alp8e8hkqXHtx8jFQPjMsobTx2dF50oBTozTym9ZN3MwmACZ7pjY/lkqU5+VbJuZ2Xl8CoiJXjb8nUOOd2BrMVcyw57rdTmaN3Bd4t4DD6enRqFRZcVVnp7/PCrPyumuBiZxaULebdPw7UMEfkIMc+mt1ttmN5VynKyf8pEdrCNc9q1ut6jVcVtnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA2PR11MB5147.namprd11.prod.outlook.com (2603:10b6:806:118::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Thu, 8 Jun
 2023 22:13:43 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::749a:b0c8:4930:5a2]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::749a:b0c8:4930:5a2%6]) with mapi id 15.20.6477.016; Thu, 8 Jun 2023
 22:13:42 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [Intel-xe] [v1] drm/xe/guc: Fix h2g_write usage of
 GUC_CTB_MSG_MAX_LEN
Thread-Topic: [Intel-xe] [v1] drm/xe/guc: Fix h2g_write usage of
 GUC_CTB_MSG_MAX_LEN
Thread-Index: AQHZmZ3c9bgLlQVOakmDZsIQZzED9a+BebiA
Date: Thu, 8 Jun 2023 22:13:42 +0000
Message-ID: <38292e1398ce2d9b11887a36e885ac8169665665.camel@intel.com>
References: <20230602185213.2635921-1-alan.previn.teres.alexis@intel.com>
 <ce74d3f3e041b30f268c367de81b759037eaedd4.camel@intel.com>
In-Reply-To: <ce74d3f3e041b30f268c367de81b759037eaedd4.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA2PR11MB5147:EE_
x-ms-office365-filtering-correlation-id: 96221c3f-08ba-4af7-7dc6-08db686d9eb5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zmtxMGavO61XCb85tvX0Uh9ATw7ORFGt7Es6SNdzUSqu7q0yjMd+AjXnr237RrGhtMduSj1t96/F7GlC4Xd2v7XWPk6gyE99tLRN3HphKbxf8L6x0PUgUrPRY4p3LyG6ewlso53Z0kzRNAqv3K9wzZUm8o5uAsDoRc/w3IPudgeX0RMEz9Fy9HSsG5/iOh/PArpquM5YmCAYshu92/51lYHfbxISRtG8DPPP3XzSvuWNGzkFAHLtgah/0/L6aej+aIjhSr9V/3QfPCF9ZibLLOsf2Othn9XiRT7mx0GKs4hgBhMWYyAS5ImujJMgfSnIa9nmw173a2C114wbpi40Sq7FRAoP0YayoUc07byY/ucXTstUI5QReTNRaYHjHkKpUrQ/n82YPObhdQC6B4Fv7Ox2rYlbmtcmVp7hfTvPXNTfIlJCFsPBz7y/1VqXIdazXHq2MQPt1GAMu56t4twBJQPlSZogJX7UvODJg0cFAEVJaOm9OfjvsSI9dmw0N1lPqcWgkN77l8WF5OxMRzTKoaxKHhSLowQ/xeBRi8AxGhE9qW+F3r99mWDyPSvw+BDec1M1Q0u4mm62UURSxi0Gy4+dllHtVJYXwvlKz3Xaz69OxP8LG245HYKgL/n9cOKB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199021)(6506007)(186003)(2616005)(478600001)(26005)(6512007)(6486002)(5660300002)(8676002)(316002)(8936002)(41300700001)(38070700005)(38100700002)(71200400001)(66476007)(82960400001)(66446008)(122000001)(450100002)(36756003)(110136005)(91956017)(86362001)(4744005)(4326008)(2906002)(64756008)(66556008)(76116006)(6636002)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFBpT0Z5L1RDekFDYU8xQ3JlbG41OUZwWnZRTDRkSk5Zcngzb20rYkpoZVJ1?=
 =?utf-8?B?WDhEWmVyZTRCTVJ4U3lVS1JvZWVUWDNTWE9rT0lpWDcyNDRIejZLVFNHMGRJ?=
 =?utf-8?B?eFdvZXZFclVKVmVYMHl1blExT2ZISERuRVh4aTVpK1NtVWloUHd1WUtLNmZW?=
 =?utf-8?B?SXZ3WS9SRTJ1dFh2L29GUzR1MUFNZUFIYi9PTXRXQ1ExbnBMK0I4Q2ovZTNB?=
 =?utf-8?B?YkhQc2tOTi9iRU1hWGtOWVU1T2xQdDJBSEFzSlJTUy90cFhIZjRzQ29EVEhG?=
 =?utf-8?B?ZUE0VkxjdGswSXFnK0R0T2Jla0s0VlRpQVBteUYvY3lWNUU1aVZpRzNUZnFz?=
 =?utf-8?B?dW80eGgyOEhLajlTODdTMW1YaFFCdUVtYmxrVVhFOXlCVmhNd0g0YjlBOXhr?=
 =?utf-8?B?YXVEODVCdTc1b1d3cHQ5S1pUYXFJd3l0d084TE9DMmpqaURNUlY4MzZRSVBB?=
 =?utf-8?B?RkQzdmI2ZUZUSzd5U05sVVAxYUJFaTlDQ1YzM1l2dWZLSUczTy9EUUpHRlNi?=
 =?utf-8?B?aW5yT24zZnhuenZQOU8yOVliUldtbUNhM21rdHVNN3g0UE1HNnZnOEZxSmtt?=
 =?utf-8?B?R2hrTU9QOWt4V0FTUER3Wk1VbW51Y2FhbXBTMHNoTXJMMzhmTVRrMTB0SVlS?=
 =?utf-8?B?RXdjM3RnSW1qRitJYnluWmVMY1ZNVlIzdkVtdjNnelhqbU5BNGFEZTE0MXRL?=
 =?utf-8?B?NDRMODR1c2wyZk5rK0hDcGxubGJiS0NHa2w3NmJKMDN5T0FuTDFDYURSRXV4?=
 =?utf-8?B?aFlZRElKTklvVUwvWHhESVZIeXN5NXhycXA2WElqOWRKaUx4dVIvNkJPbExV?=
 =?utf-8?B?TENBRlhsVWV6N2JxUUlxMkpIdzhvZ2hFKytYNHNNMnRQUFNIMjM5d2NITmJp?=
 =?utf-8?B?bTkwRzMyOWNtTjB2a0g0OE04UzM0M3NaSnljUkF5a21nNSs4aHNNSWQwNEdT?=
 =?utf-8?B?dW9LOWx4N20zY2k2Y3BHZEtCa3dvVXg5b040dTRrcFBlSGJSUnN2eDFCTXlM?=
 =?utf-8?B?a0JYSk9FcGtKb3FzL3Vuek9qNDNNK2dKYTBEbzdkTWdmeWdOMUpteWdwZ0Iy?=
 =?utf-8?B?THpOYkdobXhQNGJ0bEZ2QkZjUXZtS2pGd1BuQm9PSDh2UFlpVlZZODltbi96?=
 =?utf-8?B?MmdyUC9jN0drM1FtbG93OElUMVFVcGxoazA0eklUeXNkTkVadlN5SXpWaEdS?=
 =?utf-8?B?cldLcnBuT3IrQVhBNUdRcU16VCt2Ui9QTnh0RGpDR0RVMUNNaGZLQmlXYWRW?=
 =?utf-8?B?bEd1VXNDd3Fld2pPN3V6bVYzR0FWTEJBWkpyeWk2MkcxSzh6VVJZWmNZVDZU?=
 =?utf-8?B?ZlNYOTlOWHpIK0RQT1krd0JJczNCSDJGK2pYMk1TanhEVkpSMXJOcnZqLzhl?=
 =?utf-8?B?clYybjZRbXczMU5GVWM3SWZXZ1JjdmhXYXZXRGRqbldTL0ptdlVnU3JoeHlN?=
 =?utf-8?B?U3FONG9jZkxYbTRTVWJqN3BmbEpsaDFheFFiT2ZsMnhka3BMeXVlbW1NdlBH?=
 =?utf-8?B?R291cWorODZCVC9ESUdPdVhweEwxRmZuVUNJa1RjWXQ3L01NS0ZkK1R6Sk41?=
 =?utf-8?B?aW1zZ0dIbmFmL1FiKy9SVTh5SGNjZmJUNzdiRlhkcjJaam5qYktNa3ZTTC94?=
 =?utf-8?B?TlBscElaT0pucGE5QlpGOHFuNlJ0VXhDdEdPdzJLLzhvU0xPZDlqOUVUTW9o?=
 =?utf-8?B?TU1FS1h6elV4d1JGdEpqckJrdVJkc0V5WXNqZlZvVjZPK1lic0wyQlVKOUFM?=
 =?utf-8?B?aTBQcWgzT1dpQzg1RytEZGZRL1lIVzhmVlp2OVVOY2lTeG1sdHZZWDE2SFpQ?=
 =?utf-8?B?MDErdWRDMnQyZ1hHT24zSEpPUmJXWGFlNkllUFVDQVdrc0Z2bDlSL1NRU25N?=
 =?utf-8?B?V2pJT0c5SFlIZWpOY2VTaERrS2I2MDd4NjlmOUFHRzdoN2ZTMVc3a2k2d1o3?=
 =?utf-8?B?MTR1ZW9QNDRKaVFlbEV2d0xuWFVJaFo3WGlFb0RQNjRYYUE4TkJGMkIxVGFL?=
 =?utf-8?B?S0pUSjArNFJmdG1veXcwMWpCZWQwcUM2aC9tV2cveUJGbHVoQUlmWmxxNTBX?=
 =?utf-8?B?OEVFanZreE13SEdlanRwZFJyeGZZNnp1OE96cEdXMlhwTTQ1NzFob2hYR0hk?=
 =?utf-8?B?NVpjNFFNNnN2b08rNXoyS3oweXE0bk1FMUdibFVTa05OV1J3YWQwdlRmZjRr?=
 =?utf-8?Q?LBGLyBef9kfi0vslHUQZjUw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1F9AEC468E04F47A1D7439C7C965DB7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96221c3f-08ba-4af7-7dc6-08db686d9eb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 22:13:42.6363 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ksnEz9ne5yhgm66VHr9CtZN6w97EDbZ5ZGagoFkOJH7APFydiJ973SAYLdCiIgjW3ZEqrNCVpAkGY/zWhM6jDfQWI9M6UHoUZMkK5wYAzFT2ZOJMo17M/fpOnzFbUYMM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5147
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA2LTA4IGF0IDAwOjEyICswMDAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBPbiBGcmksIDIwMjMtMDYtMDIgYXQgMTE6NTIgLTA3MDAsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiANCj4gYWxhbjogZ29vZCBwb2ludCAtIGkgd2lsbCBnbyBiYWNrIGFuZCBm
aW5kIGlmIHdlIGhhdmUgdGhpcyB2YWx1ZSBpbnRlcm5hbGx5IHNwZWMnZCBiZWZvcmUgd2UgY29u
dGludWUuDQphbGFuOiBhY3R1YWxseSwgZXZlbiBpZiB0aGUgc3BlYyBhbGxvd2VkIHZlcnkgbGFy
Z2UgY21kcyAoYXMgaXRzIGludGVybmFsbHkgc3BlYydkIHRvIGFsbG93IHRoYXQpLCB3ZSBzaG91
bGRudCBjb25zdW1lciB0aGUgc3RhY2sgbGlrZSB0aGF0IC0gd2lsbCBmaXggdGhpcyB0aGF0IHdh
eS4NCg0K
