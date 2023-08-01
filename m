Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C72F76BBB8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 19:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF57710E00B;
	Tue,  1 Aug 2023 17:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C278C10E00B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 17:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690912421; x=1722448421;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s9PLOMo0LZaVFsmMfPwY6qS7jpPZnacGk7ktIcHTgao=;
 b=nSGLCLsX1KAIHIvI8p/yWosG0GBC9DVtnpBBp9IoCqEnRLJIrre+lERK
 OK3kRMNzTVZyy7el3qKego4QUIKZLbY1S/SsnPmgIknvAvAFk5FuRSsWV
 kyQd7RpOFj4oWW7utencMgZN7+WqzFCVCGS9gj5BukUm8J6llPDOv3b8n
 jdSHPjMCJm4ypzDkQ6y+PIb59oraR2dhRJODu/A7I5LHyoB1zu/JAfRo4
 MOLLQnLx/FwXSRSMbFOqejrlcOVaNMGg+RWgF/srq6x94Yl7l4FTcEgFY
 VmEZTiLiG2VFbFJOiKHCUAz2zVcsgRL92r1tWyoyJNR6+Dmo4D4zBQkT2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="369369725"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="369369725"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 10:53:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="852572343"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="852572343"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 01 Aug 2023 10:53:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 10:53:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 1 Aug 2023 10:53:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 1 Aug 2023 10:53:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvbHIg4vcYZSYoLqsu2vUaz3Vw4289OJJr370XWmJzVHJLPPvwsLsjmyqPSZCHLplPuM9cKBMgowJjefj4xyCMDiFwrbVPeSTby2Oarzrumy5gQjefT0B3E9predumMoGtcTSI9mR+VIOKIFhXQIWOsXfZWczIl7uSEhhcvg86bklWY2CCoke4VeSfXbzrMH6aTWFgRcoiiKJg6D8C39f3E+NQJZ4ak4mvlu2Wh+Nl0sqDdx/Z2/DnWH3r28YDYv6P8w45qBYS8oxViNrb5vetYiMtq7jhgm2sqyfgnq1ZaAv2QNeEcJ7BzZv/TXNOLv+V2PGehgrqrWSyTQj926zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9PLOMo0LZaVFsmMfPwY6qS7jpPZnacGk7ktIcHTgao=;
 b=hb3LFThUuPcX8bC4dkbRizS2TwYNTk3EVlvJS8VD3E3n845IGVwSTVhQtxNwg1O0g04FL6uiODVOaHQC+SvG9riPo3oZ8toYxNR/8gLT6ZzI1Lmde5Dwu6LtUhl45DSSSIQHWkDIC4CKxSjrDj1w1L1/FX1qD4b9Xgc1MgYtAJsN3M831OywKyYhZLGlgJPcT+zzeqnhI2nk2RRHiaDXNbBO8RjPrE5aMjyCSk7JJAL6woCf7QPqw+F86lOOjWkKUg4Xsm0hRLts7HxpJFbV8L1dAlLU0hnUP1WMyn1H3+58+1jIkjFi5ubSJLzBPyUlncWpfhuqee38BfXbuYjOiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH0PR11MB5949.namprd11.prod.outlook.com (2603:10b6:510:144::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Tue, 1 Aug
 2023 17:53:32 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b%3]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 17:53:32 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: David Hildenbrand <david@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq/AWUSAgAGkBBCAAGFsAIAF9M/ggAChIwCAADi24IABSWKAgABl6ECAAEZHgIABcLAQgAD86oCAAQfUEIAEas2AgAGbU1CAANOWAIAAAN4AgAAASgCAAADJgIAAACaAgAAAiQCAAFefQA==
Date: Tue, 1 Aug 2023 17:53:32 +0000
Message-ID: <IA0PR11MB7185CF1FDFA5D5EDE3B6AF08F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <ZMBSWxYnWLlzG3+6@nvidia.com>
 <IA0PR11MB71853E11B6C419DC0D043953F801A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMJbywGYN0QLh3vF@nvidia.com>
 <CH3PR11MB71779C83F8A0EC6C2F3F4B0CF807A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMbtsY4O3Ho3B69J@nvidia.com>
 <IA0PR11MB71857E9D6C3AD311CF698D13F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMj4Og063T6T/okI@nvidia.com>
 <d4bae5e4-ff92-bee9-d585-9f30e34ef646@redhat.com>
 <ZMj5MvQGk2PQiJn+@nvidia.com>
 <48f22686-2c1b-fd9d-91ba-da6105d410db@redhat.com>
 <ZMj5+7sgkPqHT5Vt@nvidia.com>
 <3427735b-2a73-2df7-ebd9-0d1066a55771@redhat.com>
In-Reply-To: <3427735b-2a73-2df7-ebd9-0d1066a55771@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH0PR11MB5949:EE_
x-ms-office365-filtering-correlation-id: 985ec082-5466-4b78-9a93-08db92b83883
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NONEI3ZtQ1+HROH472lezC5c8lh1Fk1gVbH8ke730OgsMfBjjCVj6R8X5rh1HzcN9y/coi7qcsRjtkN9dg+e0O74yB/ED3Buo+du+NKP3gl9L1L9B7m1+LVflyIxhLLgfjrFT2gnL2dV+dZxc5LYfrfXmEgzBEPk6gBW5aEaVrcXuZavrSdUeXuhmJq9t1xuS3ZmKSDF+thzcZ48dMwJpsECyDZke0/TJMHx0AaqsXCDWXrk9lID9IGp9OSI0lDPCvbzFINBHitLhnpIiwk8mgqZsIeGOd2FQA8AxkVzj4fjaXlHsjz/zNCiMeG5yQ65H16x3zeVaALpxree3xWlmUzE6RBbnsognz90Qe9D8PTu0+Fn09IZwgKz6xe0j99GcnTLjLqoJKaISsQ1ZzC0wkCQev2CwUk5xwpZ0ZUIwu+eqs1uSEx9GcBFuxlGkzQXi2sQXoZS/g7b6IRgRmNmsRr3xmRW1QFFE5TNJPNKbIq1QyYzHofVTUWDs8zb2fzmFLlfpeS4i0Btp7WgCozOZ+hO6gAgo0cxu8xr8IwIPSCAgkFUd7YJOgrEFa+4iZcq2aEW7hf8YkTEXQkmtYgEOEY5tgKjWM19LlMWbrCv+N0kkLBfD3pnLs/KG+/njYUU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(39860400002)(396003)(376002)(136003)(451199021)(76116006)(55016003)(66446008)(66556008)(110136005)(38100700002)(82960400001)(54906003)(4326008)(9686003)(66476007)(478600001)(122000001)(64756008)(7696005)(71200400001)(8936002)(5660300002)(33656002)(2906002)(53546011)(52536014)(6506007)(66946007)(86362001)(26005)(8676002)(186003)(38070700005)(316002)(41300700001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czdjNGtLRzhlMFE3SWdacm1XcFdrbjBoOXlsWFEvSWhZWHUwMGVHblBiR2cv?=
 =?utf-8?B?OEhkNm91d1NLNjhzdEQrZ1laRHJ2NHk2anBZQXZOV0VUNXN4QUoyV010anVI?=
 =?utf-8?B?ZE01Q2o5ZmJwQTNab0VXRER4ZWMvV3prcGh3NkkrcUUvcXFkNUVWeHNZWUto?=
 =?utf-8?B?dXphWHgwM25ZMzFYcGZGWTAzcXFDTFJkOGxEdDJDdEo3NmhnYkp4Y2FyNFNN?=
 =?utf-8?B?R3FseGgwM2JRdHh2TlRWRjR6c3ZHdkl5TnNZOE0zNlltWWExV0k4NUdUdnA0?=
 =?utf-8?B?WkY5VVBXQnZBTU92VlBHajJ2RWQ1QmRLVS9TQ2JYSDRyWHl5Z1cwQnltRW5G?=
 =?utf-8?B?dWpHekxqaTIzTFRYS1FaQWc2bUxoNmUwUms3MklYRkhKTDhVVkRNMENKMngr?=
 =?utf-8?B?NUQ4emlKdWw3WWpQc3BFUm04enRuUnFOWE5xenFSdUczUlhHOHU2d3h6UGpu?=
 =?utf-8?B?MHlLVkcvU2RITXlWcVpRR0ZJcmtWVmtyckxTN1pWaFMrQ2pVRXlieFZSa3k1?=
 =?utf-8?B?Wm94ajg0cExRTnNueEUxa3NmRDBScHoyZ1Q3Uk5VbTVWUkF0Y0RVekZGN1RU?=
 =?utf-8?B?cUJmVDRLdk9FcmNpLzQvUG11bjFuMzZMMlpORXBRVDVyNVBwT1lWYVo3VW1U?=
 =?utf-8?B?a2w3blZ4YzB4dEtPMGJlbFZDYUZOTmtmZ2RxMTNFTHZZSk1TN1ZNV1dORlV6?=
 =?utf-8?B?RU9YRzBDV1VTcm1vM0RPV2NjMjJVdy8wL2MySXNDVGwzT3c4K2s3S0NKZGFE?=
 =?utf-8?B?QlhRZkFROHJUUTFaT1pyVVBHQWpHbEJnRm9KQnZMUFJadzNqZC9XS2YvaHpB?=
 =?utf-8?B?K2ZhVmVwc0NhcUh1NUpIUTB4NERRVWozbWljR0ZtR2Y3SnZ5Vkt4YVFEaFJP?=
 =?utf-8?B?cVllQi9XNGVkT2wyZUdPZ1owakRYQVBTUnRUYlVlQ25wVWF0eDZDam9TV2ll?=
 =?utf-8?B?TGZyUlhyL3RoZlRubVdRcEZtOUQyVEZJMXkwTFF2TU5aNS9mdkVZTzNkWk1l?=
 =?utf-8?B?YUhGUTRhSHhCUFpDTi9IWWphTDFibEFsOFBKeFBrb2IwVEEwWU02L01qYStv?=
 =?utf-8?B?b201SEl4N0I4Z1RqMDFsSFBSTmVNYUR3bktDVlhKWktVaGQyYVdrZ0FoR0Fp?=
 =?utf-8?B?cXRUcUNkU1BNSUkzMFFuNmhxMWhzZFVuZnp1S1p1YUJ5KythUDlBNkpFRFMy?=
 =?utf-8?B?QTJnOXY2eEZpZXd4cFNVTzJHckJ0SmdSTFBxTytLdVlvb0dQUFZMUzZmcEFM?=
 =?utf-8?B?Znc4eHB4NXJ0eUFDRjAxbDFUSVUwbi9FQ2RQcjN2RmlZL0F2Q2lKZXRrSTBz?=
 =?utf-8?B?ckNkaXh4VFNnNkJHQVc1T3c2VDVQei84SmNLNzFzdVpBakR3azdxWDRiT1FP?=
 =?utf-8?B?VFpqRVI3ZmFhOFN6SkdCcWpFOTZ4cEY3ZHFoSTIzSUh5aWNOanpIY2Irc0RD?=
 =?utf-8?B?SUp0VFNGcnRET1BWQU85Y1YrR2VNWUlyN2llbmhZdDZqRHJwNkdOY0dTZCts?=
 =?utf-8?B?SWlGWjFaSTlsL2YyK3NUNmhVQm1ZRDV1VjZta2ZiVWRxcGdBSUNkNjBvY0tr?=
 =?utf-8?B?M242WjhPcmJUVjhpOW1JT0R5S3dycVIybk9meHBlWWh0a3NKVnlrcEY4QnNF?=
 =?utf-8?B?alFjR21KOW9TZy9wS3FzQlY2VnArdUNhcnNZa2MydzliSktiaGo0TmVBKzlV?=
 =?utf-8?B?bWVUdTBpSVBteDVkTmFXNUtJRlNldU5Tby9SYmlqMFRuRW9oNENCVXlNNzRw?=
 =?utf-8?B?NklDTG1COVRGWjA0MVZCdE5vREUzY0laKzFwdFhSTm95N1dHcnNsRHZyTmxH?=
 =?utf-8?B?RWo4UUcxUC9tYlAwcGVhNmVTWGM4YXNGRVJaUURLQVJjcEhxOGVJVU41NHhl?=
 =?utf-8?B?TFRnbWR2Uk1adENlS2dkREdnL2RoOVZCWmJRSit2NUQ1OExaS1ZDTTRING4z?=
 =?utf-8?B?ZHJqbnAwMUxsWG5vTjdaaEw5QlFaMUJCamowM2V5L29RVVpCRStjNjNNUDZ2?=
 =?utf-8?B?SlhmenE4Ny84Z05TbFNhcU9KRnFTMjBjTXpVdTBEd0JGaFVlSHE4bXB3cW54?=
 =?utf-8?B?ODlydTRiR095dTVEa3RkNHpjbW5XRU0xczlMbWY5SWkzdlpHRTVIRlpXd05o?=
 =?utf-8?Q?kH4RhzTqu4cMClykivhgSSHXw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 985ec082-5466-4b78-9a93-08db92b83883
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 17:53:32.2352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jtOXWAnHr9kqgMhe99jLqncX1PPNE+p/XaZWF3iwDBkrkyy/qud6ZC8wcpbGYIbQROl/k0hDSfmSgCnPhxCxmIl0H+Ig3FrWwraE+boS+HE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5949
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Alistair Popple <apopple@nvidia.com>,
 Hugh Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2aWQsDQoNCj4gDQo+IE9uIDAxLjA4LjIzIDE0OjI2LCBKYXNvbiBHdW50aG9ycGUgd3Jv
dGU6DQo+ID4gT24gVHVlLCBBdWcgMDEsIDIwMjMgYXQgMDI6MjY6MDNQTSArMDIwMCwgRGF2aWQg
SGlsZGVuYnJhbmQgd3JvdGU6DQo+ID4+IE9uIDAxLjA4LjIzIDE0OjIzLCBKYXNvbiBHdW50aG9y
cGUgd3JvdGU6DQo+ID4+PiBPbiBUdWUsIEF1ZyAwMSwgMjAyMyBhdCAwMjoyMjoxMlBNICswMjAw
LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToNCj4gPj4+PiBPbiAwMS4wOC4yMyAxNDoxOSwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOg0KPiA+Pj4+PiBPbiBUdWUsIEF1ZyAwMSwgMjAyMyBhdCAwNToz
MjozOEFNICswMDAwLCBLYXNpcmVkZHksIFZpdmVrIHdyb3RlOg0KPiA+Pj4+Pg0KPiA+Pj4+Pj4+
IFlvdSBnZXQgYW5vdGhlciBpbnZhbGlkYXRlIGJlY2F1c2UgdGhlIG1lbWZkIHJlbW92ZXMgdGhl
IHplcm8NCj4gcGFnZXMNCj4gPj4+Pj4+PiB0aGF0IGhtbV9yYW5nZV9mYXVsdCBpbnN0YWxsZWQg
aW4gdGhlIFBURXMgYmVmb3JlIHJlcGxhY2luZyB0aGVtDQo+IHdpdGgNCj4gPj4+Pj4+PiBhY3R1
YWwgd3JpdGFibGUgcGFnZXMuIFRoZW4geW91IGRvIHRoZSBtb3ZlLCBhbmQgYW5vdGhlcg0KPiA+
Pj4+Pj4+IGhtbV9yYW5nZV9mYXVsdCwgYW5kIGJhc2ljYWxseSB0aGUgd2hvbGUgdGhpbmcgb3Zl
ciBhZ2Fpbi4gRXhjZXB0DQo+IHRoaXMNCj4gPj4+Pj4+PiB0aW1lIGluc3RlYWQgb2YgcmV0dXJu
aW5nIHplcm8gcGFnZXMgaXQgcmV0dXJucyBhY3R1YWwgd3JpdGFibGUNCj4gPj4+Pj4+PiBwYWdl
Lg0KPiA+Pj4+Pg0KPiA+Pj4+Pj4gT2ssIHdoZW4gSSB0ZXN0ZWQgZWFybGllciAoYnkgcmVnaXN0
ZXJpbmcgYW4gaW52YWxpZGF0ZSBjYWxsYmFjaykgYnV0DQo+IHdpdGhvdXQNCj4gPj4+Pj4+IGht
bV9yYW5nZV9mYXVsdCgpLCBJIGRpZCBub3QgZmluZCB0aGlzIGFkZGl0aW9uYWwgaW52YWxpZGF0
ZSBnZXR0aW5nDQo+IHRyaWdnZXJlZC4NCj4gPj4+Pj4+IExldCBtZSB0cnkgd2l0aCBobW1fcmFu
Z2VfZmF1bHQoKSBhbmQgc2VlIGlmIGV2ZXJ5dGhpbmcgd29ya3MgYXMNCj4gZXhwZWN0ZWQuDQo+
ID4+Pj4+PiBUaGFuayB5b3UgZm9yIHlvdXIgaGVscC4NCj4gPj4+Pj4NCj4gPj4+Pj4gSWYgeW91
IGRvIG5vdCBnZXQgYW4gaW52YWxpZGF0ZSB0aGVuIHRoZXJlIGlzIGEgcHJldHR5IHNlcmlvdXMg
YnVnIGluDQo+ID4+Pj4+IHRoZSBtbSB0aGF0IG5lZWRzIGZpeGluZy4NCj4gPj4+Pj4NCj4gPj4+
Pj4gQW55dGhpbmcgaG1tX3JhbmdlX2ZhdWx0KCkgcmV0dXJucyBtdXN0IGJlIGludmFsaWRhdGVk
IGlmIHRoZQ0KPiA+Pj4+PiB1bmRlcnlpbmcgQ1BVIG1hcHBpbmcgY2hhbmdlcyBmb3IgYW55IHJl
YXNvbnMuIFNpbmNlDQo+IGhtbV9yYW5nZV9mYXVsdCgpDQo+ID4+Pj4+IHdpbGwgcG9wdWxhdGUg
emVybyBwYWdlcyB3aGVuIHJlYWRpbmcgZnJvbSBhIGhvbGUgaW4gYSBtZW1mZCwgaXQgbXVzdA0K
PiA+Pj4+PiBhbHNvIGdldCBhbiBpbnZhbGlkYXRpb24gd2hlbiB0aGUgemVybyBwYWdlcyBhcmUg
Y2hhbmdlZCBpbnRvIHdyaXRhYmxlDQo+ID4+Pj4+IHBhZ2VzLg0KPiA+Pj4+DQo+ID4+Pj4gQ2Fu
IHlvdSBwb2ludCBtZSBhdCB0aGUgY29kZSB0aGF0IHJldHVybnMgdGhhdCAoc2hhcmVkKSB6ZXJv
IHBhZ2U/DQo+ID4+Pg0KPiA+Pj4gSXQgY2FsbHMgaGFuZGxlX21tX2ZhdWx0KCkgLSBzaG91bGRu
J3QgdGhhdCBkbyBpdD8gU2FtZSBhcyBpZiB0aGUgQ1BVDQo+ID4+PiByZWFkIGZhdWx0ZWQgdGhl
IHBhZ2U/DQo+ID4+DQo+ID4+IFRvIHRoZSBiZXN0IG9mIG15IGtub3dsZWRnZSwgdGhlIHNoYXJl
ZCB6ZXJvcGFnZSBpcyBvbmx5IHVzZWQgaW4NCj4gPj4gTUFQX1BSSVZBVEV8TUFQX0FPTiBtYXBw
aW5ncyBhbmQgaW4gd2VpcmQgREFYIG1hcHBpbmdzLg0KPiA+Pg0KPiA+PiBJZiB0aGF0IGNoYW5n
ZWQsIHdlIGhhdmUgdG8gZml4IEZPTExfUElOfEZPTExfTE9OR1RFUk0gZm9yDQo+IE1BUF9TSEFS
RUQgVk1Bcy4NCj4gPj4NCj4gPj4gSWYgeW91IHJlYWQtZmF1bHQgb24gYSBtZW1mZCBob2xlLCB5
b3Ugc2hvdWxkIGdldCBhIHByb3BlciAiemVyb2VkIg0KPiA+PiBwYWdlY2FjaGUgcGFnZSB0aGF0
IGVmZmVjdGl2ZWx5ICJmaWxsZWQgdGhhdCBob2xlIiAtLSBzbyB0aGVyZSBpcyBubyBmaWxlDQo+
ID4+IGhvbGUgYW55bW9yZS4NCj4gPg0KPiA+IFNvdW5kcyBmaW5lIHRoZW4gOikNCj4gDQo+IFJp
Z2h0LCB0aGUgInRoZSB6ZXJvIHBhZ2VzIGFyZSBjaGFuZ2VkIGludG8gd3JpdGFibGUgcGFnZXMi
IGluIHlvdXINCj4gYWJvdmUgY29tbWVudCBqdXN0IG1pZ2h0IG5vdCBhcHBseSwgYmVjYXVzZSB0
aGVyZSB3b24ndCBiZSBhbnkgcGFnZQ0KPiByZXBsYWNlbWVudCAoaG9wZWZ1bGx5IDopICkuDQpJ
ZiB0aGUgcGFnZSByZXBsYWNlbWVudCBkb2VzIG5vdCBoYXBwZW4gd2hlbiB0aGVyZSBhcmUgbmV3
IHdyaXRlcyB0byB0aGUNCmFyZWEgd2hlcmUgdGhlIGhvbGUgcHJldmlvdXNseSBleGlzdGVkLCB0
aGVuIHdvdWxkIHdlIHN0aWxsIGdldCBhbiBpbnZhbGlkYXRlDQp3aGVuIHRoaXMgaGFwcGVucz8g
SXMgdGhlcmUgYW55IG90aGVyIHdheSB0byBnZXQgbm90aWZpZWQgd2hlbiB0aGUgemVyb2VkDQpw
YWdlIGlzIHdyaXR0ZW4gdG8gaWYgdGhlIGludmFsaWRhdGUgZG9lcyBub3QgZ2V0IHRyaWdnZXJl
ZD8NCg0KVGhhbmtzLA0KVml2ZWsNCg0KPiANCj4gLS0NCj4gQ2hlZXJzLA0KPiANCj4gRGF2aWQg
LyBkaGlsZGVuYg0KDQo=
