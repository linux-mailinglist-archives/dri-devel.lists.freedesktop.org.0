Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AE24857D0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 18:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CB110E433;
	Wed,  5 Jan 2022 17:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4599810E433;
 Wed,  5 Jan 2022 17:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641405556; x=1672941556;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EClOlIMH82Nnp4+km+2kPx5Y8uDXr4LH7K/VshZ4bsE=;
 b=FKtpumkklQgUbH7RJUck7HYZFFsmK90i2y75oufN0pS9pWAfKBJSY+sG
 aCZ4QhxDrMmDR3fQbfiDW42z2SP4FEHUjbEeC1oDm2u3SGeArWOsqLQQz
 KUb48ywBhi0KT7WdL4XlCkRjSHrjZay35imxPyzMYbhpaOUq/Il4Xh8y+
 pLzP3ze9bWJseFP7tpXjsbfDgULtmozSXyuyrZ35IUPBjp5vcTHbb9nQw
 Uiu28dE0p7sVUfNxQHicIFrYQAvsFtlQjDGHxtiNUUdVP1xCz4t1HPEMd
 1ohTyP48cng3zisklRHA48i187PzgVCWmw3v4OjA8i9Y2IkcnTkcQxB2O w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="222492685"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; d="scan'208";a="222492685"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 09:59:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; d="scan'208";a="513061915"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga007.jf.intel.com with ESMTP; 05 Jan 2022 09:59:15 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 5 Jan 2022 09:59:14 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 5 Jan 2022 09:59:14 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 5 Jan 2022 09:59:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fk3UcsivxN8E/3carcjOQ5Qs9g08+Fd+iD+PeXEbCHiHvZ8XLxPVrURci6nAEcXfxN852CtbpP2lDtOdWW1/NCvzsmFQFP3JCKbIKKAQyntiX+aRoTNlYLQf/sKVDSWPCVJmavZGWv2sd00D9c5IvU74rFCHMMbpbC7MBOi7o32P6ZT3COqH+xLmTrucZEe/sU+ikLLi9QUWyG2tPIdndJXfaCbB1FV6JAcOMOhQbRITicm89AFlSPczK7WkRCF86L0h446MNuj9vszmdSjfcAnQb1prBVwwkXtd+BiURBpUydkQ1b1sXwYSYeyP47HmF1uTho73hx27J4qQWW1N1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EClOlIMH82Nnp4+km+2kPx5Y8uDXr4LH7K/VshZ4bsE=;
 b=GLtNXkX5ByaslwjhmQdYbavJ/D1EpMpux3YhQAIblzkvDGk8b44X5e/S3fP2ThWAcfdMip9WBLi2lAnlkGIPfESTqGRcO7chEIT6gKbNKx0qUunqj41O2IazNGhadT1HzqBvtsCk+yIDNhYlRiqNBj7RBCkU28/WUwyYMW1SbztVvozTJ2HpjzYcbloWDN3u4uiePXwa3fCSOh1SizAfePtKUleCmnWg0fsHtXM7xSCfHAfNnuwEd7Xt5BxPopnngQ9JyvYyToQ9L6XhLo05rAk9Vsd/sRc+HkuvKbdrAF4E2sDTl1Ff3ZBvv6Kh4zh777Sjpg5HeVPripsP1TL6Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN6PR11MB1633.namprd11.prod.outlook.com (2603:10b6:405:e::22)
 by BN6PR1101MB2164.namprd11.prod.outlook.com (2603:10b6:405:51::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 5 Jan
 2022 17:59:13 +0000
Received: from BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::a596:16ca:5cb5:c51d]) by BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::a596:16ca:5cb5:c51d%4]) with mapi id 15.20.4867.009; Wed, 5 Jan 2022
 17:59:12 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Bloomfield, Jon" <jon.bloomfield@intel.com>, "Vetter, Daniel"
 <daniel.vetter@intel.com>, "Wilson, Chris P" <chris.p.wilson@intel.com>
Subject: RE: [Intel-gfx] [PATCH v4 2/4] drm/i915: Use the vma resource as
 argument for gtt binding / unbinding
Thread-Topic: [Intel-gfx] [PATCH v4 2/4] drm/i915: Use the vma resource as
 argument for gtt binding / unbinding
Thread-Index: AQHYAJmRthuhDmy2bUeW15AsxzqtF6xRmrIggAALowCAAELn0IAAn/KAgABw1LCAAA8mAIABak+AgAAsnDA=
Date: Wed, 5 Jan 2022 17:59:12 +0000
Message-ID: <BN6PR11MB16331FA69B019FF60EC201DB924B9@BN6PR11MB1633.namprd11.prod.outlook.com>
References: <20220103115947.92688-1-thomas.hellstrom@linux.intel.com>
 <20220103115947.92688-3-thomas.hellstrom@linux.intel.com>
 <BN6PR11MB1633E8200E7999D439707F2392499@BN6PR11MB1633.namprd11.prod.outlook.com>
 <c501276b-58f4-9764-30d2-5da2ae00e7e9@linux.intel.com>
 <BN6PR11MB1633BB7DDA0486B79F6B6C2492499@BN6PR11MB1633.namprd11.prod.outlook.com>
 <f31472df-3239-5903-ea3c-60fd58b4e1d8@linux.intel.com>
 <BN6PR11MB1633C76CD53EFBBCFA843C8F924A9@BN6PR11MB1633.namprd11.prod.outlook.com>
 <b00e0f20-4398-f97d-5343-88f32828c468@linux.intel.com>
 <8ea33d30-7765-4c2a-8e19-a99e993d8b33@linux.intel.com>
In-Reply-To: <8ea33d30-7765-4c2a-8e19-a99e993d8b33@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7106de1f-495d-4855-37f0-08d9d07514dc
x-ms-traffictypediagnostic: BN6PR1101MB2164:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR1101MB2164B62D4635CA9B432ACB63924B9@BN6PR1101MB2164.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eD351vCq+MaqTvqiFWKKfDw8KKwWYbKeVveyh3CLIPCLjbNTOobbyo4W9mWLr4KqKY1aa6Vb21U9lwHvB4TOm2s7wufoAuz/WITS0CTYAbBMDWCYw7zyOTTI3pUj9sf28CApdry4Q2YhvlXLmt6lgPusTH6P4iguwauif7hnQ6aC52deecRDDst3hI8yLGeF+B+4VMkU9yF6OvKGqhkr8Va3SOWVP1zSUq81MXflN81767qkf0dSz4WAJ3VPbMTEX+N0CJV4XG9iZfTrZTyCd8R6hxa+VwOz9hwaED98zTgivdPeR03t58XFLHFhx4X5//PnISj3NxLbNElyoWh+tTQ26N/0gl3YdmffIZb4Fj4m9Pq9RQXG8RRLE+CrluMG0dRw97Z/lO3ZudiIjaWq0lZiJ7Nm2J6sHosHlb4+voSU0Dtnp88gujyAHHPjbj7uIQhQ4CB+xPmRep0MDn6L/kDwX3xRvtSuVQ1yQ1SZkdq+sBo6p/kco8B0U9LOxAjdid+kxPTtNjqbFG/zgNs4S2H1Vi12b/FDkHb2m6k25GDRbogQfGdQfdS7Z/SYOSQRTVCeBk+kfmKiCMT7uPPyTrVNrypUSsn4ny608RnDsXMX16KSdRw8IOXaUxpm+vACqs11HN+F/akSNvcDGxkt3s3WaL9BlZ452CTRs8TrXu2v1BuMDY0ApFxOH/s4Rn2E42gUfmoebZKXjqPxMxnkgg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1633.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(9686003)(38100700002)(83380400001)(66574015)(86362001)(33656002)(7696005)(316002)(71200400001)(122000001)(110136005)(5660300002)(38070700005)(6636002)(8936002)(82960400001)(2906002)(66446008)(55016003)(66556008)(64756008)(26005)(6506007)(66476007)(4326008)(66946007)(52536014)(508600001)(53546011)(76116006)(186003)(8676002)(45080400002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c1B0Snk4Y2traDRQZVQ3TVFUZ1pEQnhvQXI2MVBEaEdYSkgrM1FseGIzMjBC?=
 =?utf-8?B?RUh5Ky90OUJXV3M2anIzRXNhb3NMNndVSldEOWZXbVdLVG5mU3Ewd05rbHdF?=
 =?utf-8?B?VFBCZUI3VFlBWVd4WlBsYUZaOWQrVnFYM1FYZ0JrNlBVdWVNMk1FS2k4c3Rj?=
 =?utf-8?B?U1Z5dGxXaXBaUXBDR0FnLzZ6TmFwaGZjU3IvVVFJcEtuZmxiTk1tM0FuS2ZF?=
 =?utf-8?B?UTFEYjNEYjBtb3J0WFYxMytkNGJVRUF5WU55N3lHeW4wdE1pdmRITUZ4emlJ?=
 =?utf-8?B?UUFzd0U2b2lwRHN3Mi9QVDdDaHRnSkQzTkpHSFlpYktuUEVYNVA5cFR0ajRN?=
 =?utf-8?B?UU5TOTU5YzhwZFd3TVZFaW9QcTFjb2FFVUdTMStNYXNyTEVOL1VyQkJFSU1j?=
 =?utf-8?B?Qkl5d0pSMVZrVDhFU0hoYUE3dWh2d3hQMU44K2FyM1JxdkpYYWNiZWhxSTlK?=
 =?utf-8?B?MDdmdS8vaVl1ZnR0YWlxdEhZR1BWWEc1bFpQbFJNaDE4N1pWQW84N2FoSGxC?=
 =?utf-8?B?QWZoeVE4Vm0vdmFDL0dOTDJFVmhxQi80TUd3ZTgyaWpmWUpoMDFCY0xFcFRI?=
 =?utf-8?B?cE5OM3ZyM29vYUtySTBIYU8rQVJvaWtGbGZaUUlnMFc3cytJYTdkTlRKdnBt?=
 =?utf-8?B?Y1RnK3hYS0lTYTd1blBSSFBaN1p2UHg1NUt5NjZOalNuczFCcDFBeTBDUFRa?=
 =?utf-8?B?eHMreVhtK0JUcElIaEZ1M3ZUZm5DTUUxT1JTVXdiMHk0ZVljNXluNXJZc1p3?=
 =?utf-8?B?VHFMV2VqVm92amdJMGtVZTRZTnlrc0lBKy84NHdHUFBXODhpMmRpWmdDSkY4?=
 =?utf-8?B?dXVyZkkxdjJzVEFLK0xaNlJFNkhwdklGaFpPVEp0UzM1TDlWeGdyanZXTXRV?=
 =?utf-8?B?ZHEvSnpvQ213MjBmZ2dneHk0MHRVTUJYZ0NMQWtVR2YxbGVsZU8xSFRPV3FG?=
 =?utf-8?B?dVlJY3N2WWNLNlZmZXNqNXhhL0NtNDZ3aEMzSGhnRFZJYnBYb0hLN09JdENn?=
 =?utf-8?B?L2RtdEtiWFhocmZEaXRGZWVIZ1FOVXZ5MTd1ektFUFQwT2g5UlptV1d3OE5q?=
 =?utf-8?B?Njlzc1BNZ1Z5S0NTRWdKS3IyLzBjQ1RnOUI0YmE2VnVGTHJwNGpkV3lsYWJx?=
 =?utf-8?B?ZTFrekxYbTF4eDE1WVFoalpVT3JmWnZ4anhjZXVqTHZzSkZvd0hneXlQaCtR?=
 =?utf-8?B?dlZ0TWNwZzFscDlzK2NqbnpEaVJuSnBXYnYvZk1TVElWOE1TTUVYSFZPMG1r?=
 =?utf-8?B?YVdYaDJTdldqRytvZUl0WC96QjVkVUJhbzNGR2FwdjdpKzZJTUxRYitvRUZC?=
 =?utf-8?B?THg1V1VTT1pHOGgvZHRvdm5QUGp4c0ZhcjhEL0dGM1Z5VXNBWmk5T3FuNzRh?=
 =?utf-8?B?eGtyWDE0MDRnQUROZURoMFo0SzFYbkVLdGgvOUhmL01SeWgvaEU2NXVYRE9D?=
 =?utf-8?B?cGs2eXdTN3hoQmJzKzVOd3RzVkxvQ0RKaEdRaDR6ckRjUXY3Tko3OGNnMlJo?=
 =?utf-8?B?emhYQnZhbjZXZDg4RjVRVFFiZTF4Q1pJQlZ1bVNybEQ2RlNXa0Y5TmxaYisz?=
 =?utf-8?B?TnlvTCs5dmZldVFSclBlTU5Ta2ROQlR2eTQ1S25mMTBxZTFqdkxmS3g2RnZJ?=
 =?utf-8?B?SXk4QmhVaHlNOE9yRjJsQUM2T3ZjNzBmeEVUWGxlVzB0UWRtRGFFbCsxNm1I?=
 =?utf-8?B?LzVEaFp2MStaU2lGWHpLZ0luS21sMHJ5R01SQ05MYzZwM29yMTFhK3hkYXBw?=
 =?utf-8?B?NFN5L3VxcWNRMFQxV1BWOHdQc08yMS9hZVFHYXd0VzhIdmJkcHMrN2l0eWpi?=
 =?utf-8?B?S0VURGp2NWVkQ3FzRVhBaks1UTF6dDBuQWwwcmQxSXZZaXR5SU15c3lJNVJO?=
 =?utf-8?B?L1VieVNNZThHQ0RJME05WXcyRzhxR3pSaVpmbktqSUwwU0krdnJsckRHTXZ4?=
 =?utf-8?B?OCtZM1BkbUtJclA3c25nWFVkT21Reks1MDd2RzUzQTR3ZzlrdmxmdHZtaDJZ?=
 =?utf-8?B?VW01VW9BVmdvMXVMV0FFanVRUFAxVWNRbU9palZHYmo1QWlVOGd3YjdRUi9K?=
 =?utf-8?B?OEkvZUxFaGxXRnBrbC9KK2R1NUFUaG53QlQ5WHk5NmZjaUdGL1lwZy84dTZn?=
 =?utf-8?B?di9IRnNOMmZHdGRqdW9HbExsTEoyYS9pN3ArelNZVEhTZzZ5blpJWFJ4d3Qy?=
 =?utf-8?B?NHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7106de1f-495d-4855-37f0-08d9d07514dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2022 17:59:12.7488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GP5DWeb4N8zUzmPYZGxCamCQOxO/N/szFjTYWeaPYRtIz4CLZms+pTst6PbawgLmPH91SgOV9wuEJWXoLwiI2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2164
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNClJlZ2FyZHMsDQpPYWsNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+
IFNlbnQ6IEphbnVhcnkgNSwgMjAyMiA4OjQ0IEFNDQo+IFRvOiBaZW5nLCBPYWsgPG9hay56ZW5n
QGludGVsLmNvbT47IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IEJsb29tZmllbGQsIEpvbg0KPiA8am9uLmJsb29tZmllbGRA
aW50ZWwuY29tPjsgVmV0dGVyLCBEYW5pZWwgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPjsgV2ls
c29uLCBDaHJpcyBQIDxjaHJpcy5wLndpbHNvbkBpbnRlbC5jb20+DQo+IENjOiBBdWxkLCBNYXR0
aGV3IDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW0ludGVsLWdmeF0g
W1BBVENIIHY0IDIvNF0gZHJtL2k5MTU6IFVzZSB0aGUgdm1hIHJlc291cmNlIGFzIGFyZ3VtZW50
IGZvciBndHQgYmluZGluZyAvIHVuYmluZGluZw0KPiANCj4gDQo+IE9uIDEvNC8yMiAxNzowNywg
VGhvbWFzIEhlbGxzdHLDtm0gd3JvdGU6DQo+ID4gSGksIE9haywNCj4gPg0KPiA+IE9uIDEvNC8y
MiAxNjozNSwgWmVuZywgT2FrIHdyb3RlOg0KPiA+Pg0KPiA+PiBSZWdhcmRzLA0KPiA+PiBPYWsN
Cj4gPj4NCj4gPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+PiBGcm9tOiBUaG9t
YXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+ID4+PiBT
ZW50OiBKYW51YXJ5IDQsIDIwMjIgMzoyOSBBTQ0KPiA+Pj4gVG86IFplbmcsIE9hayA8b2FrLnpl
bmdAaW50ZWwuY29tPjsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gPj4+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPj4+IENjOiBBdWxkLCBNYXR0aGV3IDxt
YXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiA+Pj4gU3ViamVjdDogUmU6IFtJbnRlbC1nZnhdIFtQ
QVRDSCB2NCAyLzRdIGRybS9pOTE1OiBVc2UgdGhlIHZtYQ0KPiA+Pj4gcmVzb3VyY2UgYXMgYXJn
dW1lbnQgZm9yIGd0dCBiaW5kaW5nIC8gdW5iaW5kaW5nDQo+ID4+Pg0KPiA+Pj4gSGksIE9hay4N
Cj4gPj4+DQo+ID4+PiBPbiAxLzQvMjIgMDA6MDgsIFplbmcsIE9hayB3cm90ZToNCj4gPj4+PiBS
ZWdhcmRzLA0KPiA+Pj4+IE9haw0KPiA+Pj4gTG9va3MgbGlrZSB5b3VyIGVtYWlscyBhbHdheXMg
c3RhcnQgd2l0aCAiUmVnYXJkcywgT2FrIi4gYQ0KPiA+Pj4gbWlzY29uZmlndXJhdGlvbj8NCj4g
Pj4gTXkgbWFpbCBjbGllbnQgKG91dGxvb2spIGlzIHNldCB0byBhdXRvbWF0aWNhbGx5IGFkZCBh
IHJlZ2FyZHMsIHdoZW4NCj4gPj4gSSBjb21wb3NlIG5ldyBtYWlsIG9yIHJlcGx5IGVtYWlsLiBO
b3QgYSBiaWcgcHJvYmxlbSDwn5iKDQo+ID4+DQo+ID4+Pg0KPiA+Pj4+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+PiBGcm9tOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhl
bGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+ID4+Pj4+IFNlbnQ6IEphbnVhcnkgMywgMjAyMiAx
OjU4IFBNDQo+ID4+Pj4+IFRvOiBaZW5nLCBPYWsgPG9hay56ZW5nQGludGVsLmNvbT47DQo+ID4+
Pj4+IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gPj4+Pj4gQ2M6IEF1bGQsIE1hdHRoZXcgPG1hdHRoZXcuYXVsZEBpbnRl
bC5jb20+DQo+ID4+Pj4+IFN1YmplY3Q6IFJlOiBbSW50ZWwtZ2Z4XSBbUEFUQ0ggdjQgMi80XSBk
cm0vaTkxNTogVXNlIHRoZSB2bWENCj4gPj4+Pj4gcmVzb3VyY2UgYXMgYXJndW1lbnQgZm9yIGd0
dCBiaW5kaW5nIC8gdW5iaW5kaW5nDQo+ID4+Pj4+DQo+ID4+Pj4+IEhpLCBPYWsuDQo+ID4+Pj4+
DQo+ID4+Pj4+IE9uIDEvMy8yMiAxOToxNywgWmVuZywgT2FrIHdyb3RlOg0KPiA+Pj4+Pj4gUmVn
YXJkcywNCj4gPj4+Pj4+IE9haw0KPiA+Pj4+Pj4NCj4gPj4+Pj4+PiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+Pj4+Pj4+IEZyb206IEludGVsLWdmeCA8aW50ZWwtZ2Z4LWJvdW5jZXNA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbg0KPiA+Pj4+Pj4+IEJlaGFsZiBPZiBUaG9tYXMgSGVs
bHN0csO2bQ0KPiA+Pj4+Pj4+IFNlbnQ6IEphbnVhcnkgMywgMjAyMiA3OjAwIEFNDQo+ID4+Pj4+
Pj4gVG86IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+ID4+Pj4+Pj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+Pj4+Pj4+IENjOiBUaG9tYXMgSGVsbHN0csO2
bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+OyBBdWxkLA0KPiA+Pj4+Pj4+IE1h
dHRoZXcgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+ID4+Pj4+Pj4gU3ViamVjdDogW0ludGVs
LWdmeF0gW1BBVENIIHY0IDIvNF0gZHJtL2k5MTU6IFVzZSB0aGUgdm1hDQo+ID4+Pj4+Pj4gcmVz
b3VyY2UgYXMgYXJndW1lbnQgZm9yIGd0dCBiaW5kaW5nIC8gdW5iaW5kaW5nDQo+ID4+Pj4+Pj4N
Cj4gPj4+Pj4+PiBXaGVuIGludHJvZHVjaW5nIGFzeW5jaHJvbm91cyB1bmJpbmRpbmcsIHRoZSB2
bWEgaXRzZWxmIG1heSBubw0KPiA+Pj4+Pj4+IGxvbmdlcg0KPiA+Pj4+Pj4+IGJlIGFsaXZlIHdo
ZW4gdGhlIGFjdHVhbCBiaW5kaW5nIG9yIHVuYmluZGluZyB0YWtlcyBwbGFjZS4NCj4gPj4+Pj4+
IENhbiB3ZSB0YWtlIGFuIGV4dHJhIHJlZmVyZW5jZSBjb3VudGVyIG9mIHRoZSB2bWEgdG8ga2Vl
cCB0aGUgdm1hDQo+ID4+Pj4+PiBhbGl2ZSwgdW50aWwgdGhlIGFjdHVhbCBiaW5kaW5nL3VuYmlu
ZGluZyB0YWtlcyBwbGFjZT8NCj4gPj4+Pj4gVGhlIHBvaW50IGhlcmUgaXMgdGhhdCB0aGF0J3Mg
bm90IG5lZWRlZCwgYW5kIHNob3VsZCBiZSBhdm9pZGVkLg0KPiA+Pj4+IENhbiB5b3UgZXhwbGFp
biBtb3JlIHdoeSAia2VlcGluZyB2bWEgYWxpdmUgdW50aWwgdW5iaW5kaW5nIHRha2VzDQo+ID4+
Pj4gcGxhY2UiIHNob3VsZCBiZSBhdm9pZGVkPw0KPiA+Pj4+DQo+ID4+Pj4gQXMgSSB1bmRlcnN0
YW5kIGl0LCB5b3VyIHNlcmllcyBpbnRyb2R1Y2UgYXN5bmNocm9uaXplZCB1bmJpbmRpbmcuDQo+
ID4+Pj4gQnV0IHNpbmNlIHZtYSBtaWdodCBiZSBubyBsb25nZXIgYWxpdmUgYXQgdGhlIHRpbWUg
b2YgdW5iaW5kaW5nLg0KPiA+Pj4gVG8gb3ZlcmNvbWUgdGhpcyBkaWZmaWN1bHR5LCB5b3UgaW50
cm9kdWNlIGEgdm1hIHJlc291cmNlIHN0cnVjdHVyZQ0KPiA+Pj4gYW5kIHlvdSBndWFyYW50ZWUg
dm1hIHJlc291cmNlIGlzIGFsaXZlIGF0IGJpbmQvdW5iaW5kIHRpbWUuIFNvDQo+ID4+PiB5b3Ug
Y2FuIHVzZSB2bWEgcmVzb3VyY2UgZm9yIHRoZSBiaW5kL3VuYmluZCBvcGVyYXRpb24uIE15IHF1
ZXN0aW9uDQo+ID4+PiBpcywgY2FuIHdlIGFjaGlldmUgdGhlIGFzeW5jaHJvbml6ZWQgdW5iaW5k
aW5nIHN0aWxsIHVzaW5nIHZtYQ0KPiA+Pj4gc3RydWN0dXJlIGJ5IGtlZXBpbmcgdm1hIHN0cnVj
dHVyZSBhbGl2ZSAoIGJ5IHJlZiBjb3VudCBpdCkuIFRoaXMNCj4gPj4+IHdheSB0aGUgY2hhbmdl
IHNob3VsZCBiZSBtdWNoIHNtYWxsZXIgKGNvbXBhcmVkIHRvIHRoaXMgc2VyaWVzKS4gV2h5DQo+
ID4+PiBpdCBpcyBoYXJtZnVsIHRvIGtlZXAgdGhlIHZtYSBhbGl2ZT8gTWF5YmUgeW91IGhhdmUg
b3RoZXIgcmVhc29ucyB0bw0KPiA+Pj4gaW50cm9kdWNlIHZtYSByZXNvdXJjZSB0aGF0IEkgZG9u
J3Qgc2VlLg0KPiA+Pj4NCj4gPj4+IFdoZW4gd2UgYWxsb3cgYXN5bmNocm9ub3VzIHVuYmluZGlu
ZywgaXQncyBhbGxvd2VkIHRvIGltbWVkaWF0ZWx5DQo+ID4+PiByZWJpbmQNCj4gPj4+IHRoZSB2
bWEsIHBvc3NpYmx5IGludG8gdGhlIHNhbWUgZ3B1IHZpcnR1YWwgYWRkcmVzcywgYnV0IHdpdGgg
ZGlmZmVyZW50DQo+ID4+PiBwYWdlcy4gQW5kIHdoZW4gZG9pbmcgdGhhdCB3ZSBkb24ndCB3YW50
IHRvIGJsb2NrIHdhaXRpbmcgZm9yIHRoZQ0KPiA+Pj4gdW5iaW5kDQo+ID4+PiB0byBleGVjdXRl
Lg0KPiA+PiBJbWFnaW5lIHRoaXMgc2VxdWVuY2U6DQo+ID4+DQo+ID4+IDEuIFZpcnR1YWwgYWRk
cmVzcyBhMSBpcyBib3VuZCB0byBwaHlzaWNhbCBwYWdlIHAxDQo+ID4+IDIuIFVuYmluZCBhMSBm
cm9tIHAxLCBhc3luY2hyb25vdXMgc28gYWN0dWFsIHVuYmluZCBub3QgaGFwcGVuIHlldA0KPiA+
PiAzLiBiaW5kIGExIHRvIHBoeXNpY2FsIHBhZ2UgcDIsIHBhZ2UgdGFibGUgaXMgY2hhbmdlZCwg
bm93IGExDQo+ID4+IHBvaW50aW5nIHRvIHAyIGluIHBhZ2UgdGFibGUuDQo+ID4+IDQuICMyIG5v
dyB0YWtlIHBsYWNlIG5vdyAtIHNpbmNlIGluIHBhZ2UgdGFibGUsIGExIHBvaW50cyB0byBwMiBu
b3csDQo+ID4+IGRvZXMgYTEgcG9pbnQgdG8gc2NyYXRjaCBwYWdlIGFmdGVyICM0Pw0KPiA+DQo+
ID4gSGVyZSwgMykgd2lsbCBhbHNvIGJlY29tZSBhc3luYywgYXdhaXRpbmcgYW55IHBlbmRpbmcg
dW5iaW5kcyBpbiB0aGUNCj4gPiBhZGRyZXNzIHJhbmdlIHByb3ZpZGVkIHRvIDMpLCBpbiBwYXJ0
aWN1bGFyLCB0aGUgYmluZCBpbiAzKSB3aWxsIGF3YWl0DQo+ID4gNCkuIFNlZSBpOTE1X3ZtYV9y
ZXNvdXJjZV9iaW5kX2RlcF9hd2FpdCgpLCBhbmQgdGhlIGRpc2N1c3Npb24gb24NCj4gPiB3aGV0
aGVyIG9yIG5vdCB0byB1c2UgYW4gaW50ZXJ2YWwgdHJlZSBmb3IgdGhpcyBhdCB0aGUgc3RhcnQg
b2YNCj4gPiBpOTE1X3ZtYV9yZXNvdXJjZS5jDQo+ID4NCj4gPj4gSW4gZmFjdCwgd2UgY291bGQg
YWxsb3cgYSBsYXJnZSBudW1iZXIgb2Ygb3V0c3RhbmRpbmcgYmluZHMNCj4gPj4+IGFuZCB1bmJp
bmRzIGZvciBhIHZtYSwgd2hpY2ggbWFrZXMgdGhlIHZtYSBzdHJ1Y3R1cmUgdW5zdWl0YWJsZSB0
bw0KPiA+Pj4gdHJhY2sNCj4gPj4+IHRoaXMsIHNpbmNlIHRoZXJlIHdpbGwgbm8gbG9uZ2VyIGJl
IGEgc2luZ2xlIG1hcHBpbmcgYmV0d2VlbiBhIHNldCBvZg0KPiA+Pj4gYWN0aXZlIHBhZ2VzIGFu
ZCBhIHZtYSwgb3IgYSB2aXJ0dWFsIGdwdSByYW5nZSBhbmQgYSB2bWEuDQo+ID4+IEkgYWdyZWUg
dGhhdCBpZiBwYWdlcyAtIHZtYSAtIHZpcnR1YWwgZ3B1IHJhbmdlIGlzIG5vdCAxOjE6MSBtYXBw
aW5nLA0KPiA+PiB3ZSBuZWVkIGludHJvZHVjZSBhIGZpbmVyLWdyYWluZWQgdm1hIHJlc291cmNl
IHRvIGZvciB0aGUgbm9uLTE6MQ0KPiA+PiBtYXBwaW5nLiBJIGFsc28gdW5kZXJzdGFuZCB0aGUg
YXN5bmNocm9ub3VzIHVuYmluZGluZyB1dGlsaXplIHRoZQ0KPiA+PiB2aXJ0dWFsIGFkZHJlc3Mg
c3BhY2UgbW9yZSBlZmZlY3RpdmVseS4gQnV0IG15IGZlZWxpbmcgaXMgdGhhdCB0aGlzDQo+ID4+
IG5vbi0xOjEgbWFwcGluZyBtYWtlcyBvdXIgcHJvZ3JhbSBoYXJkIHRvIHVuZGVyc3RhbmQgYW5k
IG1haW50YWluLg0KPiA+PiBTaW5jZSB0aGlzIG5vbi0gMToxIG1hcHBpbmcgaXMgaW50cm9kdWNl
ZCBieSBhc3luY2hyb25vdXMNCj4gPj4gYmluZGluZy91bmJpbmRpbmcsIG1heWJlIHRoZSByZWFs
IHF1ZXN0aW9uIGhlcmUgaXMsIGlzIGl0IHJlYWxseQ0KPiA+PiBiZW5lZml0IHRvIGludHJvZHVj
ZSBhc3luY2hyb25vdXMgdW5iaW5kaW5nPw0KPiA+DQo+ID4gVGhhdCdzIGEgcmVsZXZhbnQgcXVl
c3Rpb24sIHdoaWNoIEkndmUgYXNrZWQgbXlzZWxmIGEgY291cGxlIG9mIHRpbWVzLg0KPiA+IEFz
eW5jIHVuYmluZGluZyBoYXMgY29tcGxpY2F0ZWQgdGhpbmdzIGxpa2UgZXJyb3IgY2FwdHVyZSBh
bmQgaW5kZWVkDQo+ID4gY29tcGxpY2F0ZXMgdGhlIHVuZGVyc3RhbmRpbmcgb2YgdGhlIGJpbmRp
bmcgcHJvY2VzcyBhcyB3ZWxsLg0KPiA+DQo+ID4gVGhlIG1haW4gZ2FpbiBpcyB0aGF0IHdlIGF2
b2lkIGEgc3luYyBwb2ludCBhdCBMTUVNIGV2aWN0aW9uLCBlbmFibGluZw0KPiA+IHVzIHRvIHBp
cGVsaW5lIGV2aWN0aW9uLCBtb3ZpbmcgZm9yd2FyZCBpdCBtYXkgYWxzbyBmaW5kIHVzZSBpbiB0
aGUNCj4gPiBzaHJpbmtlciBhbmQgZm9yIHVzZXItc3BhY2UgcHJlbWF0dXJlbHkgd2FudGluZyB0
byByZS11c2Ugc29mdHBpbg0KPiA+IGFkZHJlc3Nlcy4NCj4gPg0KPiA+IC9UaG9tYXMNCj4gPg0K
PiA+Pg0KPiA+PiBJIGFtIHN0aWxsIG5vdCBmYW1pbGlhciBlbm91Z2ggdG8gdGhlIGNvZGVzLiBJ
IHN1Z2dlc3Qgb3RoZXIgZXhwZXJ0cw0KPiA+PiB0byB0YWtlIGEgbG9vayBhbHNvLiBAQmxvb21m
aWVsZCwgSm9uIEBWZXR0ZXIsIERhbmllbCBAV2lsc29uLCBDaHJpcyBQLg0KPiANCj4gSXQgbWln
aHQgbWFrZSBzZW5zZSBoZXJlIHRvIHBvaW50IG91dCBhcyB3ZWxsIHRoYXQgdGhlIGRpcmVjdGlv
biBmcm9tDQo+IHRoZSBhcmNoIHRlYW0gaXMgdG93YXJkcyBtb3ZpbmcgdG93YXJkcyBncHUtd3Jp
dGVzIG9mIHBhZ2UtdGFibGUgZW50cmllcw0KPiBmb3IgYmluZGluZyBhbmQgdW5iaW5kaW5nLCBh
bHNvIGtlZXBpbmcgc21hbGwgUENJIGJhcnMgaW4gbWluZCwgd2hpY2gNCj4gd2lsbCBtb3JlIG9y
IGxlc3MgZm9yY2UgdXMgdG8gYWxsb3cgYXN5bmMgdW5iaW5kaW5nIGZvciBtYWludGFpbmVkDQo+
IHBlcmZvcm1hbmNlLg0KDQpJIGFncmVlIHdlIG5lZWQgdG8gc3VwcG9ydCBhc3luY2hyb25vdXMg
YmluZC91bmJpbmQuIE15IG1haW4gYXJndWUNCkhlcmUgd2FzLCBzaG91bGQgd2UgaW50cm9kdWNl
IGEgdm1hIHJlc291cmNlIHN0cnVjdHVyZSB0byBlbmFibGUgYXN5bmMgYmluZC91bmJpbmQsIHZl
cnN1cywNCkNoYW5nZSB0aGUgbGlmZSB0aW1lIG9mIHZtYSBzdHJ1Y3R1cmUgdG8gYWNoaWV2ZSBh
c3luYyBiaW5kL3VuYmluZCAtIGllLCBzdGlsbCBpbnRyb2R1Y2UgYSBpbnRlcnZhbA0KdHJlZSBm
b3Igdm1hIChub3Qgdm1hIHJlc291cmNlIGluIHlvdXIgcGF0Y2gpIHRoYXQgaXMgdG8gYmUgdW5i
aW5kIGJ1dCBzdGlsbCBub3QgdW5ib3VuZC4gV2hlbiBJDQpsb29rZWQgbW9yZSBpbnRvIHlvdXIg
cGF0Y2hlcywgSSByZWFsaXplZCBpZiB3ZSByZXVzZSB2bWEgc3RydWN0dXJlLCB3ZSB3aWxsIG5l
ZWQgdG8gYWRkIGEgbG90IG9mIA0KbWVtYmVycyB0byB0aGUgdm1hIHN0cnVjdHVyZS4gbWF5YmUg
eW91ciBtZXRob2Qgb2YgaW50cm9kdWNpbmcgdm1hIHJlc291cmNlIGlzIGNsZWFuZXIuDQoNClJl
Z2FyZHMsDQpPYWsgDQoNCg0KPiANCj4gL1Rob21hcw0KPiANCj4gDQo+ID4+DQo+ID4+IFJlZ2Fy
ZHMsDQo+ID4+IE9haw0KPiA+Pj4gVGhhbmtzLA0KPiA+Pj4NCj4gPj4+IC9UaG9tYXMNCj4gPj4+
DQo+ID4+Pj4gUmVnYXJkcywNCj4gPj4+PiBPYWsNCj4gPj4+Pg0KPiA+Pj4+IMKgwqAgSWYgdGhl
DQo+ID4+Pj4+IHZtYSBpcyBubyBsb25nZXIgYWxpdmUsIHRoYXQgbWVhbnMgbm9ib2R5IHVzZXMg
aXQgYW55bW9yZSwgYnV0IHRoZQ0KPiA+Pj4+PiBHUFUNCj4gPj4+Pj4gbWF5IHN0aWxsIGhhdmUg
d29yayBpbiB0aGUgcGlwZSB0aGF0IHJlZmVyZW5jZXMgdGhlIEdQVSB2aXJ0dWFsDQo+ID4+Pj4+
IGFkZHJlc3MuDQo+ID4+Pj4+DQo+ID4+Pj4+IC9UaG9tYXMuDQo+ID4+Pj4+DQo=
