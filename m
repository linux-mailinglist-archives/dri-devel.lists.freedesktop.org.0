Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37028482DB4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 05:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE9989D86;
	Mon,  3 Jan 2022 04:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAB189D86;
 Mon,  3 Jan 2022 04:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641182781; x=1672718781;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zz1143oQ1BFE8TjC8GYSlEm8KcLDEcqSYkWCVjH+z4s=;
 b=QrvWCCuvBh6qu8H6hZpzA7Gd8lwu3PHESrF0z3a63JhjAO6C9M3cDGBe
 Bf1HuajhQsNHLqbIGPCJYzi6z+MOKH7XyLXecufVxB7uVzHZ0PiwVdzPO
 DL23VLf4cOFRAeUbRcEhCHvhP1FjnQrEtINIDYZK7HMs6xS2HY/ZyRhLU
 HFNUIBfhU825vyPugCJIJrdUl7C/uzPl5uu/2IsXPtmcCCfIyANxn4J1/
 AaDszpUGqZaKYw/W2nYoIgCdDb7+XzXq2ppQdpCFTT0K+gtR8Y76oAqSL
 r8W8RHD2s1bPuL9S7aYitV0SNlck1ZciuOROEDzlGc09QzC5n0FxmgMwA A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10215"; a="228833544"
X-IronPort-AV: E=Sophos;i="5.88,256,1635231600"; d="scan'208";a="228833544"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2022 20:06:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,256,1635231600"; d="scan'208";a="525392824"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga008.jf.intel.com with ESMTP; 02 Jan 2022 20:06:20 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 2 Jan 2022 20:06:19 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 2 Jan 2022 20:06:19 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Sun, 2 Jan 2022 20:06:19 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Sun, 2 Jan 2022 20:06:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbyLTLAs7l9AA1Bd7Boc43rv+3FVt4QNIHp125YNYqJ2N4Wu6pKjBDy3rBVWUvnT0DXkJgaefnrAhcKJNN3iVsIWTCVoW9W5Ms1se6EQhQvJm0zU+Uooi73cW0XQQIysiABuMb0xJijvf3v4/EpCPCDK9GiK2aGd23E5tZCRebejbzrsG6zIyJYfYCWF2EfCOCVyrwvzB39mdDcsKzzdbetzyb66Gyhfij/1CgRoQaoY9eNOZ7H3Ye/TZTqqkjuXEWIIJZi9TEj14fPTSGVqdHYPtjg81ycWDsWXGaVOrvC/ugPYUnbfGn2pJtdcc4axTfxVG337ynf9jVWpU6zZbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zz1143oQ1BFE8TjC8GYSlEm8KcLDEcqSYkWCVjH+z4s=;
 b=k53Ith4PztUGDxnc6CcVy/MJPODx9GorEMSL7brWLYtJcCMlTfSFBcWsWP45vGhrxPdlK+OZJGc6pI2hA+t3asPvTw8C8GuHhJQD/KLDEVqahv0ThY0eDKEhL/ka9RdfMJ0YNtSEh31Eu+qAcL3Z4m+UC79eaKs8AE5We2yw65ce6TDFUrY+TZAvON4MsCOlM+VhrOyyAW4IvZ/vJH+kcJ2sJ7ocd23WsMiLWNxg+Huq1UDqkBZUjlJg1xnoGMjhEyrtUjQnB7m1W53r+qoVHj0Atig1kwR4bULhenAYdPS88Zz6bvJ8QwGTeL+J9KfVNyqRPIF4DmYesKUu9VUEJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 DM5PR1101MB2204.namprd11.prod.outlook.com (2603:10b6:4:58::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.13; Mon, 3 Jan 2022 04:06:17 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::4c47:45d4:7870:1c79]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::4c47:45d4:7870:1c79%5]) with mapi id 15.20.4844.016; Mon, 3 Jan 2022
 04:06:17 +0000
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: RE: [i-g-t 08/14] tests/kms_color_chamelium: New subtests for Plane
 gamma
Thread-Topic: [i-g-t 08/14] tests/kms_color_chamelium: New subtests for Plane
 gamma
Thread-Index: AQHX2gZF5xJQlm+pIkmOwei4msR08KwJCjwAgEIvFCA=
Date: Mon, 3 Jan 2022 04:06:17 +0000
Message-ID: <DM8PR11MB5719F4B2AC4433C3BA2EDC118D499@DM8PR11MB5719.namprd11.prod.outlook.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211115094759.520955-9-bhanuprakash.modem@intel.com>
 <20211118113202.0ff5dcae@eldfell>
In-Reply-To: <20211118113202.0ff5dcae@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81ec5a0b-f678-4b77-9603-08d9ce6e6434
x-ms-traffictypediagnostic: DM5PR1101MB2204:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM5PR1101MB2204B6DC3592C365CC252A768D499@DM5PR1101MB2204.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XJxWN5QwGZ22ef9loHPt6biC8x2njNHXB18KtdyDRg/hF7qvjiIQyuAnzPbbucefao0RlLO86E6QQiIubQ/qwk8OUD8eJH5nPRavgGJ7yHy4zzj/GohFbO8l/Izem3ZpnIF4VlgeBxsgz/nEj9pStaksmftZyKIofmJw8Zfwd1KHDCzj4i6aC7iE2nINBo32u8NfnSUoyuWFMDK6iNPnconegyanAFq8BlWvYnwo9Rv4cmkvo2D0Fcs1cH4vzMqIS9AfaVHIEWudUA9iR4i6q8sMPXr3bO+NXhQ1l6+7jE/6WVBqptt+uN2xNx5raiykuUAmtQonbGJbJu7FE7B+PBchTNQg4305CURMCIXxW/mSR8nTafG6AKpRvkuIoM2P41KGGsVJ4pVvu40vtBboXbBTiMJCnQC4MPzAbKm68mRHna694m7qc742cWb7IiBN3w/UaGFcOvSp0pXYw+TqY8I5V9hfuUTnEmMeS72igQzyVr1hNLZYJqrOwn/OeDTatwAxAC0jmkCYZ8OuRsmaHf2tS2u6pTY4zQNzc6ICqutE8VB8ZSm+MdZTUARCMa6a5nyRQ9facDPlrUzI3zFoclclAbelz6clzJ14xW3/ilB7g44KtuK1705ZdsL7RF98NxFikX/1hzD7jmulS/ACUocX2x/LBJpBLXSK2C/N3KbG88Oewj+fbK+ZxozhFpQGw6TYsCQ0V2USOqwb5Zso7g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(71200400001)(52536014)(38070700005)(82960400001)(8936002)(8676002)(38100700002)(122000001)(33656002)(6916009)(55016003)(54906003)(186003)(64756008)(66556008)(76116006)(66476007)(66946007)(4326008)(66446008)(86362001)(508600001)(7696005)(53546011)(316002)(6506007)(9686003)(26005)(66574015)(5660300002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bU94R3JPeGJTSGl2R2lQRHNZdkgzamhlU3lBYVByYndZK0JFQTRrcWJDTTcy?=
 =?utf-8?B?dk1NTTZCSFNlKzZBU0dkS2ZRMXpVSWhNV1JkMFZ2T3dOM2tQbHUyMUErb3dj?=
 =?utf-8?B?UXNLb0gxV1Q5eGp0djMyUkVDbGNvKzJRNjFUOXJQSlNxNE5tZmxHdlpxNFNG?=
 =?utf-8?B?YUlhZ1pSbnF5alQ5Tm8wQmxOdThRVXRvcUdaY1Vkb0hqMjQxQ2NwYVgvams0?=
 =?utf-8?B?Ty9DK3dQMWl5VTNjMVdEdHplR2d1QzhQY01FTzdPOS93UEhLU2VsSW1KNTY0?=
 =?utf-8?B?aWpFdXROV3ZEdEpZeUc2TXI1OE9EUzBOK3ZlTFJUUHBFZWRnYjFYcFk3cm11?=
 =?utf-8?B?VzVJbjRpY1hZREg1QnZWMUdxMVVPTGZEMEJiRDdSTnBwSFFYTUNkNEdnbHNT?=
 =?utf-8?B?NjlqZnF4ZmMyUmxmMmtWTnQ0UVhSZVFhcmhOTS9jLzduSmJObjlsVHdrQUVH?=
 =?utf-8?B?cUQwa1M0aDNRelNtS280SEtUeUQ3VTN6cG5hSlBtcDFsbEZBUnNZRHR3QTNl?=
 =?utf-8?B?OVZIWEd0MElVMjJsVHQ3ZGcwaGN3MDhua283bU0yOTcvc1ByR3JhZ0VjUWhZ?=
 =?utf-8?B?TitHc2JQUjJ0QjlKeTFnS3VLWnErVTdLaHQ0Y0lWb3hoODVQdXUwSWRFVE1q?=
 =?utf-8?B?SG83aWo4R2lSMGJxbm5EaXZqaVE0NkxrL0M2UGdWQU1OK0Z3ZUY2RldEbUZJ?=
 =?utf-8?B?Um1sWFJaQVNRQ3F2bUl3MWdBQk01MDVjL0piTXlEYnpSTEROMTlOQVY0cTZS?=
 =?utf-8?B?S1EvUVB6R3JCdXJHNmFzYjR1MUsvdEZhS1BRZnJ6emZQdE1OSGtWdW5vOVNU?=
 =?utf-8?B?Mmo0M2JDYXRZRTEwbUhEd2pXcXJCSFVvdTUvZUhEVU92LzNPL0NZc0FWTDY3?=
 =?utf-8?B?MTRIRERWeVlmL0xKVzExV1pCV3RUdGQycGtDaGtPRm5ISGJTZnUzcGRrc2ht?=
 =?utf-8?B?QTRsM3BwZ1NwMDUxb3V0OFZOMjc4QWRnZkFGOFdwQjlOaHBnSjdpT2s1Y002?=
 =?utf-8?B?em1hSTZ0Q1JGNG5Hc0JGYlRHdmRsSE8rcGFRTk9MRHJ0Mjkzc3B1NlZRdlZM?=
 =?utf-8?B?RDgzSFpxKzJzdVlEa2RWeWNOd3A5aGRONTU3TXpQaWo1NzZDblJYUHpjZmNv?=
 =?utf-8?B?a2JTaXdMQWg4RXB1Y0FDaGt0c1dtY0lZSE1EQUJHOHcvaHpYY1FSenkwUkgr?=
 =?utf-8?B?QmY0WVFZa3Q5RHRuSE9hdjZKOVoyQzdIUzREWm4rREpCNENmVzNjcU5hMGJ5?=
 =?utf-8?B?V2hRbTlsMWhSdkdMUURJc3l2N3ppWXlMNko3TE00THVKaG5Ham83ckRQdEZi?=
 =?utf-8?B?MlVwZkV5ZTFyd3ZJempVeDJWcnlRZUhISTRtRUh1RGVXYUJsZytUVUlvZHVW?=
 =?utf-8?B?ZEFNdnM5RXBvd0twYWV4Wnlzd0gySkxwYWNmNlFDckFUb3ViVWVlQjVneS81?=
 =?utf-8?B?WitrTzRjNWZnV3o3NDN3SXFLcVM5RE9SL0ZFM0NtSTlsTzNVVERPcjdwR3ZM?=
 =?utf-8?B?K2VwOEkrRW5aNWY4aTBENlZ0bGo3azJkYTl6QSsyUklpbCswdGtDdEduYUty?=
 =?utf-8?B?ZW5hODZPRU9iNzhSWlRnMllMY2hIZllTSEVjWmhVcEI1MVBlSVRScGZRdWNz?=
 =?utf-8?B?dHVib2xZTjBFTFRoWjkrWEZzK3dKNmVFK1NnYktoMEo4YzBlRmd4bjFYd25p?=
 =?utf-8?B?YTJvVVdBQlk2OGdaM05xRkZDWmVoZUZRc2NzVkkvZnM1QTNxdkhJUWhxUFFP?=
 =?utf-8?B?aEcySWtuU29lZTQ1bEsxTzNKVjZGTTFzQ0tYM01ZSURtYTcybEU4a0lDOStH?=
 =?utf-8?B?dEt2SEpxYTYvUHEyQVdnZDRhaWZZcGNHR1FKMGNQYi9peENoYWI0T1lhb3VV?=
 =?utf-8?B?bmU3VUNIdUtuRk5YVGQwR0hRRE45NEhoeXFkVmdlUzRlNllseWttMnBtQlBs?=
 =?utf-8?B?bEE3OHVqd0tNMnUyblNnYk1hKzVIUkNjS3JUbkRQNXRkZldGZ0FEM1ZpeXA4?=
 =?utf-8?B?b3Y2TFlodnE5OGhPcTBFbXowWXlnQkx3RGdwQWJTR0ZzbW5SNURHS1lrYUdz?=
 =?utf-8?B?L25sWDdhWXowMmRmU3pLOFFPelRJVGJJcXFvOFFQbnR4QThMOThHV2RyMmJD?=
 =?utf-8?B?cFVZTmVpZldTMGhFblBWbHBPNm1icE94VFBqdEZEbjZmN09sUERVaHVDRlk1?=
 =?utf-8?B?VWxsTldwRkkyMzJ6MWYraGs0QTBwLyt3UVNZcHpXb3A1czRQNUxlODJHMDhJ?=
 =?utf-8?B?TmNrWnVYczB1UWMrN1Q0SlBMcVpBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ec5a0b-f678-4b77-9603-08d9ce6e6434
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2022 04:06:17.1903 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8OdlUxAC48ke+4nbvcUo2stWjIciqCrTTY6iT1BkvfjWbx/S66brrMfxo7YHpeR8ITOehYxxqXyOzgkHFORLyDXJfLEoiaFdgTPOE7YVRZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2204
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
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Joshi,
 Kunal1" <kunal1.joshi@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBGcm9tOiBQZWtrYSBQYWFsYW5lbiA8cHBhYWxhbmVuQGdtYWlsLmNvbT4NCj4gU2VudDogVGh1
cnNkYXksIE5vdmVtYmVyIDE4LCAyMDIxIDM6MDIgUE0NCj4gVG86IE1vZGVtLCBCaGFudXByYWth
c2ggPGJoYW51cHJha2FzaC5tb2RlbUBpbnRlbC5jb20+DQo+IENjOiBpZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgSm9zaGksDQo+
IEt1bmFsMSA8a3VuYWwxLmpvc2hpQGludGVsLmNvbT47IEp1aGEtUGVra2EgSGVpa2tpbGENCj4g
PGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+OyBTaGFua2FyLCBVbWEgPHVtYS5zaGFua2Fy
QGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtpLWctdCAwOC8xNF0gdGVzdHMva21zX2NvbG9y
X2NoYW1lbGl1bTogTmV3IHN1YnRlc3RzIGZvciBQbGFuZQ0KPiBnYW1tYQ0KPiANCj4gT24gTW9u
LCAxNSBOb3YgMjAyMSAxNToxNzo1MyArMDUzMA0KPiBCaGFudXByYWthc2ggTW9kZW0gPGJoYW51
cHJha2FzaC5tb2RlbUBpbnRlbC5jb20+IHdyb3RlOg0KPiANCj4gPiBUbyB2ZXJpZnkgUGxhbmUg
Z2FtbWEsIGRyYXcgMyBncmFkaWVudCByZWN0YW5nbGVzIGluIHJlZCwgZ3JlZW4gYW5kIGJsdWUs
DQo+ID4gd2l0aCBhIG1heGVkIG91dCBnYW1tYSBMVVQgYW5kIHZlcmlmeSB3ZSBoYXZlIHRoZSBz
YW1lIGZyYW1lIGR1bXAgYXMNCj4gPiBkcmF3aW5nIHNvbGlkIGNvbG9yIHJlY3RhbmdsZXMuDQo+
ID4NCj4gPiBDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+DQo+ID4g
Q2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+ID4g
Q2M6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+DQo+
ID4gQ2M6IFVtYSBTaGFua2FyIDx1bWEuc2hhbmthckBpbnRlbC5jb20+DQo+ID4gQ2M6IEt1bmFs
IEpvc2hpIDxrdW5hbDEuam9zaGlAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJoYW51
cHJha2FzaCBNb2RlbSA8YmhhbnVwcmFrYXNoLm1vZGVtQGludGVsLmNvbT4NCj4gPiAtLS0NCj4g
PiAgdGVzdHMva21zX2NvbG9yX2NoYW1lbGl1bS5jIHwgMTg4ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTg3IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfY29sb3JfY2hh
bWVsaXVtLmMgYi90ZXN0cy9rbXNfY29sb3JfY2hhbWVsaXVtLmMNCj4gPiBpbmRleCA3NmY4MmQ2
ZDM1Li5iNTA2MTA5MjcxIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ttc19jb2xvcl9jaGFtZWxp
dW0uYw0KPiA+ICsrKyBiL3Rlc3RzL2ttc19jb2xvcl9jaGFtZWxpdW0uYw0KPiA+IEBAIC0yNCw3
ICsyNCwzNCBAQA0KPiA+DQo+ID4gICNpbmNsdWRlICJrbXNfY29sb3JfaGVscGVyLmgiDQo+ID4N
Cj4gPiAtSUdUX1RFU1RfREVTQ1JJUFRJT04oIlRlc3QgQ29sb3IgRmVhdHVyZXMgYXQgUGlwZSBs
ZXZlbCB1c2luZyBDaGFtZWxpdW0gdG8NCj4gdmVyaWZ5IGluc3RlYWQgb2YgQ1JDIik7DQo+ID4g
K0lHVF9URVNUX0RFU0NSSVBUSU9OKCJUZXN0IENvbG9yIEZlYXR1cmVzIGF0IFBpcGUgJiBQbGFu
ZSBsZXZlbCB1c2luZw0KPiBDaGFtZWxpdW0gdG8gdmVyaWZ5IGluc3RlYWQgb2YgQ1JDIik7DQo+
IA0KPiBOb3cgdGhhdCB5b3UgYWN0dWFsbHkgY2FuIGdldCBhIGNhcHR1cmVkIGltYWdlIG9mIHRo
ZSByZXN1bHQgd2l0aA0KPiBDaGFtZWxpdW0sIEkgdGhpbmsgdGhlIHRlc3RzIHNob3VsZCBiZSBt
b3JlIGFtYml0aW91cy4gRG8gbm90IHJlbHkgb24NCj4gaWRlbnRpdHkgY3VydmVzIG9yIG1hdHJp
Y2VzLCBub3IgbWF4IExVVCwgYmVjYXVzZSBub3cgeW91IGNhbiB1c2UgYQ0KPiBkaWZmZXJlbmNl
IHRocmVzaG9sZCBwZXIgcGl4ZWwgd2hlbiBjb21wYXJpbmcgdGhlIHJlc3VsdCB3aXRoIHRoZQ0K
PiByZWZlcmVuY2UuDQo+IA0KPiBVc2UgdmFyaW91cyBub24tdHJpdmlhbCBjdXJ2ZXMsIGRpZmZl
cmVudCBmb3IgZWFjaCBvZiByZWQsIGdyZWVuIGFuZA0KPiBibHVlLiBVc2Ugbm9uLXRyaXZpYWwg
bWF0cmljZXMgdGhhdCBhY3R1YWxseSBjb21wdXRlIG1peHR1cmVzIGluc3RlYWQNCj4gb2YganVz
dCBtb3ZpbmcgcmVkIHZhbHVlIHRvIHRoZSBncmVlbiBjaGFubmVsLiBVc2UgbXVsdGlwbGUgcGxh
bmVzDQo+IHNpbXVsdGFuZW91c2x5LiBVc2UgZGlmZmVyZW50IGZyYW1lYnVmZmVyIGZvcm1hdHMs
IHBhcnRpY3VsYXJseSB3aXRoDQo+IGhpZ2hlciB0aGFuIDggYml0cyBwZXIgY2hhbm5lbCwgYW5k
IGNoZWNrIHRoZSBjYXB0dXJlIGhhcyB0aGUgc2FtZQ0KPiBwcmVjaXNpb24gYW5kIG5vdCB0cnVu
Y2F0ZWQgdG8gOCBiaXQuDQo+IA0KPiBUaGF0IGtpbmQgb2YgdGVzdHMgd291bGQgaGF2ZSBtdWNo
IG1vcmUgcHJvdmluZyBwb3dlciwgYW5kIHRoZXkgYWxzbw0KPiBoZWxwIGFzc2VzcyB0aGUgcHJl
Y2lzaW9uIG9mIHRoZSBoYXJkd2FyZS4gUHJlY2lzaW9uIGlzIGltcG9ydGFudCB0bw0KPiB1c2Vy
c3BhY2UuDQo+IA0KPiBUaGVzZSBhcmUgYWxzbyB0ZXN0cyB0aGF0IHVzZXJzcGFjZSBwcm9qZWN0
cyBjYW5ub3QgcmVhbGx5IGV4ZWN1dGUsIHRoZXkNCj4gZG8gbm90IGhhdmUgbGFicyB3aXRoIENo
YW1lbGl1bSBib2FyZHMgYW5kIG5vdCBhbGwgZHJpdmVycy9oYXJkd2FyZQ0KPiBzdXBwb3J0IHdy
aXRlYmFjayBjb25uZWN0b3JzLg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcgUGVra2EsDQpXZSBh
cmUgcGxhbm5pbmcgdG8gYWRkIHRoZXNlIGtpbmQgb2YgQWR2YW5jZWQgdGVzdHMgaW4gbmV4dCBw
aGFzZS4NCg0KLSBCaGFudQ0KIA0KPiANCj4gPiArDQo+ID4gKyNkZWZpbmUgTUFYX1NVUFBPUlRF
RF9QTEFORVMgNw0KPiA+ICsjZGVmaW5lIFNEUl9QTEFORV9CQVNFIDMNCj4gPiArDQo+ID4gK3R5
cGVkZWYgYm9vbCAoKnRlc3RfdCkoZGF0YV90KiwgaWd0X3BsYW5lX3QqKTsNCj4gPiArDQo+ID4g
K3N0YXRpYyBib29sIGlzX2hkcl9wbGFuZShjb25zdCBpZ3RfcGxhbmVfdCAqcGxhbmUpDQo+ID4g
K3sNCj4gPiArCXJldHVybiBwbGFuZS0+aW5kZXggPj0gMCAmJiBwbGFuZS0+aW5kZXggPCBTRFJf
UExBTkVfQkFTRTsNCj4gDQo+IFRoaXMgaGVyZSBhZ2Fpbi4gSSBndWVzcyB0aGUgcHJldmlvdXMg
ZGVmaW5pdGlvbiBvZiB0aGlzIGZ1bmN0aW9uIHdhcw0KPiBuZXZlciB1c2VkPw0KPiANCj4gVGhl
IHNhbWUgcXVlc3Rpb25zLg0KPiANCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGJvb2wgaXNf
dmFsaWRfcGxhbmUoaWd0X3BsYW5lX3QgKnBsYW5lKQ0KPiA+ICt7DQo+ID4gKwlpbnQgaW5kZXgg
PSBwbGFuZS0+aW5kZXg7DQo+ID4gKw0KPiA+ICsJaWYgKHBsYW5lLT50eXBlICE9IERSTV9QTEFO
RV9UWVBFX1BSSU1BUlkpDQo+ID4gKwkJcmV0dXJuIGZhbHNlOw0KPiA+ICsNCj4gPiArCS8qDQo+
ID4gKwkgKiBUZXN0IDEgSERSIHBsYW5lLCAxIFNEUiBwbGFuZS4NCj4gPiArCSAqDQo+ID4gKwkg
KiAwLDEsMiBIRFIgcGxhbmVzDQo+ID4gKwkgKiAzLDQsNSw2IFNEUiBwbGFuZXMNCj4gPiArCSAq
DQo+ID4gKwkgKi8NCj4gPiArCXJldHVybiBpbmRleCA+PSAwICYmIGluZGV4IDwgTUFYX1NVUFBP
UlRFRF9QTEFORVM7DQo+ID4gK30NCj4gDQo+IA0KPiBUaGFua3MsDQo+IHBxDQo=
