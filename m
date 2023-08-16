Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9F477DA99
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 08:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D9910E2E5;
	Wed, 16 Aug 2023 06:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99EE10E2E4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 06:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692168224; x=1723704224;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MQ/BQ6h0Z2PHSjv7ek36h/CCobcP/3DeBfa77K3TL4Y=;
 b=kMmTn/2Vuv/5GHTL3OjPhV2+IVxG69zss83W0zrE3EibDQk6l+20Vmn1
 C8cVU1hRTUuDxN1JpNgcjla7QtSGjo3IRAF7+hzds7xLq6pHVXd3QIYBK
 Fs9ZUCkIfLl5mIq1VLIV/cDMqSCSJLOQnBcxlvJGkuKwHQ5vv92Z+5w37
 /5pG/lagKw95GzFRtfYzYKp4KEGNeXZoPQBtxNXkOZUhzatqHaWeWXyUk
 ND+oGFFfqKzqcUKIe0dcOBKQbWO4e4ks6i1ezyM05CeIjttQ/+NC6W0RG
 bwm9/OGOAx3wX50s5GVWvAkohOyVwpJo8qfq5yKHOb5Z24NF4Mbk+UDuH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352783918"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="352783918"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 23:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="727652461"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="727652461"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 15 Aug 2023 23:43:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 23:43:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 23:43:29 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 23:43:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDdnrCdJNiji3P7tJns1EVv5+kzL6CA/ZAi9GrweRDPLP5kqmsvloFMf6YLJLb5qaXi9TKJ4k93jRlDvKrEJQ/Gw3pMaYDvAErWaO97CVr8w5h5RWf/09appBUtdoJ1FS5pXraOQmb1TrXzWNWmQqFwQQuIEFktEI+ALVc88miGLyf9dHc+r3JUJJARGQupV5Mb6JQ2YJxYKrWwB+Dvm5TXt7oWB09Crw9EEOVE86n7wT13/DrkGYlG2EAiOFTP0XL7Gnr6MfLa1Sf2g+wtRLNkdr6W5Y9BftTcFbfhiSCpVzc2s+0eQPl+iDXeYtxAIxMUqobNRkDSXevqqEqjfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQ/BQ6h0Z2PHSjv7ek36h/CCobcP/3DeBfa77K3TL4Y=;
 b=mRVABMhDCWr5ZVUyttR1lykaLjD77uZh+vhX+SbZ/32TU7qQ8d9c0dKTgXApR2rSD62dEPg6TyjELvBtk5MjK9aNSyn9tYae7xO98O2Os9vS8c0bkMFM5Qbn9mSReJ0K8xVZuuj51k0Jqdi5+EjZA3bBgh/fvCClg6yv/77234NdLVgBiP08eS6GbmrgVk2Jhz5uaIuHrf4xHL5U6yyBV/FmFzeHPSwBgR33QRvMuuH5pTdlg5qzpROG1C9iyKlCOCn5ENbQ9VNyLS3UZwLE7SubkQA6xnIuhpApijQFNVX8Y1a0a/i/IKlP5p9gZX9U2QKP7p4g2EvLiTvpYyH4NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CH3PR11MB8591.namprd11.prod.outlook.com (2603:10b6:610:1af::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 06:43:27 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b%3]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 06:43:27 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq/AWUSAgAGkBBCAAGFsAIAF9M/ggAChIwCAADi24IABSWKAgABl6ECAAEZHgIABcLAQgAD86oCAAQfUEIAEas2AgAGbU1CAANOWAIAAAN4AgAAASgCAAADJgIAAACaAgAAAiQCAAFefQIAACl6AgAICCrCAALzcgIAABQIAgADEKYCAAD264IAAlRIAgAVz8QCAANNhgIALoJuw
Date: Wed, 16 Aug 2023 06:43:26 +0000
Message-ID: <IA0PR11MB71857FDD99CAC23C88C9F27CF815A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <3427735b-2a73-2df7-ebd9-0d1066a55771@redhat.com>
 <IA0PR11MB7185CF1FDFA5D5EDE3B6AF08F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMlMoRIkPoO0gG3B@nvidia.com>
 <IA0PR11MB7185304345516521FA3005C2F808A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMuaQ4vpv03GTPbF@nvidia.com>
 <2aee6681-f756-9ace-74d8-2f1e1e7b3ae6@redhat.com>
 <87cz0364kx.fsf@nvdebian.thelocal>
 <IA0PR11MB7185974FA204015EA3B74066F809A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMzz2OKbmiD6SKPE@nvidia.com>
 <IA0PR11MB718593A011700F06BD6414E8F80DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZNI4KV+Z7CvffiHI@nvidia.com>
In-Reply-To: <ZNI4KV+Z7CvffiHI@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CH3PR11MB8591:EE_
x-ms-office365-filtering-correlation-id: 6a04b4e2-b00a-4f9f-a875-08db9e241872
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bss6PaOFMlC+UYc6TAy13DiA70AtaASTI3j8GjJP+OiuTsp26vDI3FEhpXn4d65DFEnJj5UC/QKRzuNN84nWJvQgF+g2VHipdPHCpTEzjMScYVBpopouUBUKMbHFJ3HOXjiiNPsw9LByCMTvuBJBjivmnWxN5gRBS4pOqG3GRW6QckCvytOKXbb1gUyKafpMW80wIZAvMang9zI7RZiATmJfob3yoF/RriTHSVGFuD4I46ivgwiDVBA/iuELZscc/wraj8cmLJsHScbkNmG+IZsVvKGEaaj6dm8wu3sqm+Y2xRdit1BrB+ty1zEjDwlQdIyh6WFRTkETy+j8eCy6jwYcAERFNBqwE0KwNB/jIrl/SBdBT2Yfaqc+bK2XTS7UB2vf6HY4grVw3XoteiWXD72Crph2oblZmCuXbEe7gsOIQgGZlGvTo31gY6x3z3luJQyRox+5KiAmpzqc87BAXb1X+ZvUDfrUUiOEO+MTEaJZVYiMsFLdTm0GPayXCtw8Gon1SYW6S792cTQovAQF4KbzguHaBA9f8EEH//SoUIHzuh/ck/hv6T/3gDj45fWbAp2qCeAnTxYRVLJLaYUV64NTusf3NUCG5ar9uM9LKQPJr+RbGLtK8WxY3bekG1rz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199024)(186009)(1800799009)(7696005)(71200400001)(6506007)(478600001)(9686003)(83380400001)(26005)(2906002)(15650500001)(316002)(41300700001)(76116006)(66946007)(66446008)(64756008)(66556008)(66476007)(6916009)(54906003)(52536014)(5660300002)(8676002)(4326008)(8936002)(33656002)(55016003)(38070700005)(86362001)(122000001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sIODO2M+h2eQLklFWtzd+Thw622yrza0ox1weGJKtjTbV90+BMJEbQD631qh?=
 =?us-ascii?Q?MqNFgvwWogvatg8AfIOEXr45/ke8H95q2DNf3rxrV4eepN9SG39b7haCR2Dd?=
 =?us-ascii?Q?qCY3iTl5kw9Fe+hLU7euI1yRIV7HkfsRQPzy8/LbZmv0U3G/cTSrvhGmGyl0?=
 =?us-ascii?Q?mj1dIm3lhzhUWsYsBHejDiZlXLCMVGR/dq1BOvp3W7Ol9kTrdiCRSknB0AoY?=
 =?us-ascii?Q?L27UuCcZ6KEBYeQQQsjm3m0W0FwJzKC+T7Yn589HPxatZ2D/bRbtcCUijl0M?=
 =?us-ascii?Q?bpmHtK/KYumBrBYbysEAINK2GGB2Pwj0auLxTiurnh+lpinDKWsjQA7pMkRq?=
 =?us-ascii?Q?uewtr4SqOfWN2YOm1lTZaMX7OkwLaXXBmfVkt2yAXmH8ZbXOBTK/ei7fZgrL?=
 =?us-ascii?Q?C7VByLJnP1cQm3Ag4afacVr+n8Ins04ICS/B33b7abT3pCMuzn325voyUWET?=
 =?us-ascii?Q?0GR1bcOlHFOkPkxOM1FQO/j7STwq6ExzJfkiDnXrqgRi5xWQOlw0Bv4DlBTH?=
 =?us-ascii?Q?8lrhMAzXChYXO8fOc8eGkYxNiDR1owJCN5Z1D9r1L2p8eob1hgSyR6c61mCC?=
 =?us-ascii?Q?OjIgYnwfjLGv9fstXF8ckXzrJo6TuPFzlnK+zuHsYxLznjMb+veB5WeRhNmg?=
 =?us-ascii?Q?JIyf9AsUG+vM+qeYuyEVNiQKhsT84xAPhtZc7eCxGdcpVQkS5PKyGFdc6WQA?=
 =?us-ascii?Q?78ljNfOWHa024GnYQPoPZzFux8RnTpYnXCm/AcZwmv+cpjvikhWG3fIswDjj?=
 =?us-ascii?Q?kltnRPDheD1yHLlF+IU6DrbOrkMsSb+myFQGwu7NIvf+PTbDF+MIuIuidtP8?=
 =?us-ascii?Q?RfUrekWSdxAWnB6KFnNxgcaHEAVbIFtKEqgTFvaxCacyI8XKZdWpnWiQ1yG0?=
 =?us-ascii?Q?RE7iJLvYpz11VFi37+Zbrr4Amhdt+pln7crMjRe8ZSgv05Ift0nYfzlaMYAc?=
 =?us-ascii?Q?H2lsiqoqUtbRSKa+dhGrtrE5or9QPqpx0PKYuPtxJ79l9irB0OlWVZbWif4z?=
 =?us-ascii?Q?sJSIOjfnDGlSZ+S62Mby5IdWYy24bY1ep91b0UVf5mbg2IEKuICdldG3DR+I?=
 =?us-ascii?Q?ZYIbMgqzRwD6kuWhZ1qduSsYj3tVKQDZwm71/MQWLJtDf9F45qQyAQyVEctv?=
 =?us-ascii?Q?h+YRW3xEF2R28hO3YTmxeNfeNxrtfBU7/yXGMjjx79aMbmQs1z3ChkZkLSxS?=
 =?us-ascii?Q?YzmiMt3B8PCwB84QSSqhu6DINmKAM4gNyLcZtKJS8mqx5wlEhaP59ddgghzX?=
 =?us-ascii?Q?WSI0gigx8iUWSs9esDa2Yq18ZyldrRPP3HN+8TI8a/umeBNkGvXIrGRdV4kn?=
 =?us-ascii?Q?KGYQbVJPHJEenyuUrKQ34dcK7TMunU6zOVf2xRN8wDwOFxiWTv5MArD4Na3n?=
 =?us-ascii?Q?kpFxOdSuLRsSaXbHpy9vBB/WKsFSoaqVGQCOgUYEkLh1N8r5l6XXePMz3pKB?=
 =?us-ascii?Q?eIGqX5GWyyazdrTd/2QmcKbRA44SQeWhqbDbZX1a7X/ovBnCFnSTqfn7Z297?=
 =?us-ascii?Q?BWd37YGxk8wY6d4Q1rwHckMeSKSN+6q1foTlyOmjMTlPvD8FFWzq5iyexsAw?=
 =?us-ascii?Q?grDdAQce1FmFvZwMPJ8bC/muLb0s7qV5wSNsBrSX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a04b4e2-b00a-4f9f-a875-08db9e241872
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 06:43:26.9228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2BoeI8IpsX7qqf8R8spLkb2jf/gsyhc6Laa+fUPR73vI1PRITjo1bDqaaP0YjIpiIl+QzgoIUUzYp3wclPTwMLLk4OVENWdIkd0+7KBmY1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8591
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Alistair Popple <apopple@nvidia.com>,
 Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

> > >
> > > > No, adding HMM_PFN_REQ_WRITE still doesn't help in fixing the issue=
.
> > > > Although, I do not have THP enabled (or built-in), shmem does not e=
vict
> > > > the pages after hole punch as noted in the comment in
> shmem_fallocate():
> > >
> > > This is the source of all your problems.
> > >
> > > Things that are mm-centric are supposed to track the VMAs and changes
> to
> > > the PTEs. If you do something in userspace and it doesn't cause the
> > > CPU page tables to change then it certainly shouldn't cause any mmu
> > > notifiers or hmm_range_fault changes.
> > I am not doing anything out of the blue in the userspace. I think the
> behavior
> > I am seeing with shmem (where an invalidation event
> (MMU_NOTIFY_CLEAR)
> > does occur because of a hole punch but the PTEs don't really get update=
d)
> > can arguably be considered an optimization.
>=20
> Your explanations don't make sense.
>=20
> If MMU_NOTIFER_CLEAR was sent but the PTEs were left present then:
>=20
> > > There should still be an invalidation notifier at some point when the
> > > CPU tables do eventually change, whenever that is. Missing that
> > > notification would be a bug.
> > I clearly do not see any notification getting triggered (from both
> shmem_fault()
> > and hugetlb_fault()) when the PTEs do get updated as the hole is refill=
ed
> > due to writes. Are you saying that there needs to be an invalidation ev=
ent
> > (MMU_NOTIFY_CLEAR?) dispatched at this point?
>=20
> You don't get to get shmem_fault in the first place.
What I am observing is that even after MMU_NOTIFY_CLEAR (hole punch) is sen=
t,
hmm_range_fault() finds that the PTEs associated with the hole are still pt=
e_present().
I think it remains this way as long as there are reads on the hole. Once th=
ere are
writes, it triggers shmem_fault() which results in PTEs getting updated but=
 without
any notification.

>=20
> If they were marked non-prsent during the CLEAR then the shadow side
> remains non-present until it gets its own fault.
>=20
> If they were made non-present without an invalidation then that is a
> bug.
>=20
> > > hmm_range_fault() is the correct API to use if you are working with
> > > notifiers. Do not hack something together using pin_user_pages.
>=20
> > I noticed that hmm_range_fault() does not seem to be working as expecte=
d
> > given that it gets stuck(hangs) while walking hugetlb pages.
>=20
> You are the first to report that, it sounds like a serious bug. Please
> try to fix it.
>=20
> > Regardless, as I mentioned above, the lack of notification when PTEs
> > do get updated due to writes is the crux of the issue
> > here. Therefore, AFAIU, triggering an invalidation event or some
> > other kind of notification would help in fixing this issue.
>=20
> You seem to be facing some kind of bug in the mm, it sounds pretty
> serious, and it almost certainly is a missing invalidation.
>=20
> Basically, anything that changes a PTE must eventually trigger an
> invalidation. It is illegal to change a PTE from one present value to
> another present value without invalidation notification.
>=20
> It is not surprising something would be missed here.
As you suggest, it looks like the root-cause of this issue is the missing
invalidation notification when the PTEs are changed from one present
value to another. I'd like to fix this issue eventually but I first need to
focus on addressing udmabuf page migration (out of movable zone)
and also look into the locking concerns Daniel mentioned about pairing
static and dynamic dmabuf exporters and importers.

Thanks,
Vivek

