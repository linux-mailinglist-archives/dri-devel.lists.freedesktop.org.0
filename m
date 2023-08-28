Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B8F78A501
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 06:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DBB10E02D;
	Mon, 28 Aug 2023 04:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B953910E02D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 04:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693198041; x=1724734041;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jwIpFxeNDXbn/0N2i6WhHrTAXQsvWQRKvC5viAMrRBM=;
 b=X4x+7uUPf+yVay/Wp0DZ1SN4RZpuLUpe/MWVRo4KHlcnn0mptvCneVGP
 9eXhLWH3p05D6w+0oZEjMahVFt3DzFy0ZM7Goy5d3k8ywufL7PTje1OFR
 pb/ofqkBfRExFbugelfue/VVt5/0ZbNI6hoC3yHSivpg+3Lo40bIQlL7y
 f8kUQSYHUR/EV+nX1aOal8K5vDwKEZedqQU1MqOY1YxS+yUqGDccv3U+X
 YkXXiqRVj/M41DPTbFglcIjkeivObA/5kxdM5F89Uju4skfIMrtlZigmo
 c1I/jmnZO5qaTp/9Yl9BEFwCJOeLQOulBsRM0/vZz47DdmXdVcrk75pdi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="365214146"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; d="scan'208";a="365214146"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2023 21:38:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="738111660"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; d="scan'208";a="738111660"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 27 Aug 2023 21:38:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 27 Aug 2023 21:38:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 27 Aug 2023 21:38:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 27 Aug 2023 21:38:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 27 Aug 2023 21:38:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUQN/YvTy8XbCwCCLzU2Ao1sR4g88QLZgbGsuHWTCzq13BXU9pVnE+8pJIbH/u1PEXXsX9SHeo8LqVze9ehdUfSesSo6UwNIR88FSXjynQqEX1GgomKEZ7rcYAIUe2S2Zdsi+DZMpBnI0tRYZwr1ysTjvdeGY+L6rrsLxwdbIoq8Fxan/7/82qHLVAulVxKFBGRUe278ZK+l2RG6fPptHgRGFWZ4I+ogIMmJwqtYqGF1ZvwGF6tumQZbDX8sxdZiAAxyZKG/fmEnNJKy2T1ZDLJhxWKryL9PrFha9rU8RUB8cAzpyqEadgPWi1hPUKvSXjbnVEXf4C8cqmK+89/Vkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSY2riDdwbYXPLdwWCOyyRkz5GsZEXXPCM8EXBRkf/Y=;
 b=XSaQ3AHNK9xnXpcy4y8TEmOPk2vyFZ/f3zvfuq8qzOQj/jdHEqdFeHefoRegn7YGQvd7bdnbyHIGa5RCetii+zSWpKe29P3WrRHeGmFFdY6kbvsvFHV8dLn3zEZqth4aTzdqwh1Nw4Lm+AmfTklupOBfollJYNrV6ZKpOvMvuKmQ55xwJwfgpK7F10RuluDToBIprgF7+v1+rBFXTRzvJC4ngf1fcVyqZiDLuhL89GkOjrNsYNqJB4KfwtOnyH381kOXquRWrKihU6JcbT30/RSMVTdViQ9WSjFCKYMWl4UTYcRv5CNZJb7aECIfVIlqGhuxaUA2scnKmTqCSojOOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CY8PR11MB7266.namprd11.prod.outlook.com (2603:10b6:930:99::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 04:38:01 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b%3]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 04:38:01 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq/AWUSAgAGkBBCAAGFsAIAF9M/ggAChIwCAADi24IABSWKAgABl6ECAAEZHgIABcLAQgAD86oCAAQfUEIAEas2AgAGbU1CAANOWAIAAAN4AgAAASgCAAADJgIAAACaAgAAAiQCAAFefQIAACl6AgAICCrCAALzcgIAABQIAgADEKYCAAD264IAAlRIAgAVz8QCAANNhgIALoJuwgAiQSQCAAMiegIAAvHsAgAJ4umCAA10UQA==
Date: Mon, 28 Aug 2023 04:38:01 +0000
Message-ID: <IA0PR11MB71856D8161600A04427E5A87F8E0A@IA0PR11MB7185.namprd11.prod.outlook.com>
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
 <IA0PR11MB71857FDD99CAC23C88C9F27CF815A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87h6oswysm.fsf@nvdebian.thelocal>
 <IA0PR11MB71853FB79625A4F2399FFD79F81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87o7izlcg7.fsf@nvdebian.thelocal>
 <IA0PR11MB71855031E9159C8DCB311702F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB71855031E9159C8DCB311702F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CY8PR11MB7266:EE_
x-ms-office365-filtering-correlation-id: 5f51f7ec-3525-450b-398c-08dba7808fe8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: noNdnNSvkEGokyBHBlCZs7ZaoKp+zIrKiV+FyKznzQT3y6Xs5Cvjh03IdqeHPLTW/8mDBqw4XR/nPsYQ2CKfn2iiq8JMHXekO4cb3S0WNzUXERxyNVHTVWod5MIbnSwczMMC+VcerbsVYTMhm/K9xVS/5tKo8c4+/TdC/BEoLAmcLuJpy9rpFbqJibM51D8VmhOWBRBWEDRiE5MZiE6yAMRks7dhRdOUR6bZI8TnozFvCiAw1xaPB+nKdM1FsgKHnQzrug7N49QBLEJ2T0LGK5CVO7Yj9DifqWhjvd/jL0ibA2fnX9jyVraxD0pfwSymUqKL/t21bTv5v7tIT7IswoV1PQx+GEXPwZI3whAYOL3XBqjezpQT5FKE7pmA7Ecwh50MUifZzesS7iZeZqlDHaXKaKKrzDqUdMtDyIVsaICg3pLmV/Esp+4rKGpXB0eDWh+/WJnhCdJHzQprwfw20rF0FzPt2a0dF+gu7L+Z2JwuATta4wqu86jaZjtGIhKiesoU2WIYz+iL1azQlZdldpM/YlVp78sadd+xdfoNOKWKjrs2mzlXVW7j0NKR4+zdZfuVykce0QCCoeWqWKOVST+K6rARQFHWErpv2UrvT/46BRZvwdE5TN21MCLbsvDd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(396003)(39860400002)(346002)(186009)(1800799009)(451199024)(41300700001)(15650500001)(122000001)(38100700002)(38070700005)(86362001)(82960400001)(83380400001)(478600001)(71200400001)(26005)(9686003)(7696005)(6506007)(30864003)(55016003)(76116006)(54906003)(66446008)(2906002)(6916009)(33656002)(316002)(66476007)(64756008)(66556008)(66946007)(5660300002)(8676002)(8936002)(4326008)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fcWDIY6DaZmO6AkRRkFB6qOTmL8JEMPWjq6Ds+w6HponITbKuuMJ49dkd439?=
 =?us-ascii?Q?volDD1duqHU3SEw8+ONhq9qxz03BUBAwu4bTyZIw44AVdOCRQI9SeiGdo54D?=
 =?us-ascii?Q?NDtLOJrB/XR0ptkju4OoaVRWMgHUfrgcrMfstASpK3ELWtRa+XOIv0L5G7pB?=
 =?us-ascii?Q?Y02K7G3JGRZL19SSGmnzIjCw/WkkXWNqf1BKR/9/NG/zEuCiE6/jiuHTMPhu?=
 =?us-ascii?Q?Z9tPq8FCHlhbrCV2ZEB2N0zl6GO8xYeynjEXZlBE/tRfi4kXNhmHjYXWhoui?=
 =?us-ascii?Q?B0q2w2GsK302xtdBx+6CaZ+2tzaxQ0xJOKiItKQvgsL+FP8qfpapWUwWTV66?=
 =?us-ascii?Q?EEb1A+oh1koxOXt7b+lQdjGvMT3HOeOsIJpQsva+uhSDe7HgLPMJi6Mu6nys?=
 =?us-ascii?Q?MWwo8QhIxDOkIsaWd7k+QmrdEq2qP999bQlgmiLQUJC85dBtv5FjIrCyEMmI?=
 =?us-ascii?Q?ymtDDFnJ1yuBjixfmMxuWvDMWYTNjxKG4gU0VQcG0mUtWyfLoLGRvijxDOfi?=
 =?us-ascii?Q?SUCpX2BHQloPDJGD8Mzj3nGnqE9cl0iQo2T/sBuslg/hfQHdCJTi9h0Zaqpv?=
 =?us-ascii?Q?B52WSD2FS35xfy07NgbtX2bwFA6bT5/d/S0I+mdkyyCcfEBhgtQriobn9zYS?=
 =?us-ascii?Q?yuR6iWSBfBFo2ywObyb/ofMAHek8J6C3Y2favppJT0B0WTLQ1I9h3DCHxhAl?=
 =?us-ascii?Q?R9JX3iYqiLQo134lzDE80qPJRAQGebSyJfqJhyN0RrA4rwkKIaz5yDQ6udPt?=
 =?us-ascii?Q?baSyWERrg4iMhHLZIvqjCqVHq/pzafxcHyPNkMvd1zVLqpxgiRBH+Dgg7/oY?=
 =?us-ascii?Q?PZOsKIEPDJ4wJcor21vIqfZaPiRadaCnKe1ffRI2ofhoJZcdVDa64er1Uki+?=
 =?us-ascii?Q?+cIlK8KVqxb0jBmNWbB9GG9qb/WBVixwrIwxJpjsT7rRjv0nnRcRYjnbWQIU?=
 =?us-ascii?Q?WR6t3Oj6PhgJ4LCFwqFgIWs1/NfwYfCsg+fBmTNw4txqzlQ7vKHz1GYQmief?=
 =?us-ascii?Q?hSfT3P12nNEE4sqeOfsYaZ8IloLFOn8xhDdeu0t9Db1wo7WD0td9f3c99mHI?=
 =?us-ascii?Q?EUHqx97VHZH7jF8YKA/9wem1l89WqyJhv+rOQpYswpMWvQy5+AAiijspedxh?=
 =?us-ascii?Q?FfFgmPfOFdaLufwFEwzAZlhV68gHqn0S++KDSph/lOa0PhM0p1eS4vnzG5QL?=
 =?us-ascii?Q?7sjaaDUIzdB1tx4asGuaqm3/D0bchwOSaq7BQBlvHsXtNrgsRVgTRJHkpeqx?=
 =?us-ascii?Q?tSt5sDC6Rk48IGXsz1iGKj5kJh8yM6AZj3cm4wBWFKoyTPYe/PTBt3ctxJC1?=
 =?us-ascii?Q?eYzYBWvf+CpK/NkeaOzi0C4G1N2lkbpkzFhnx2NZFkpA+3NyN/OtTKjhmbFK?=
 =?us-ascii?Q?75Z6x/AdtMdVHj/SAkZWJXQ0o9BhX1Z9tz8oNsY6pYNvM/XcsZeki9WnV/LI?=
 =?us-ascii?Q?4ON08M5i0vMAg0It4eIYKbi8oMylqFTfO19MXmUaP3qpbR1Bb8MV2jOUsC8Y?=
 =?us-ascii?Q?TU29ez/3DHXXAVvzr1q+U5VUTX13O9m+kvEFpPEJwaDPB2JQ+7VSkfzwmzGC?=
 =?us-ascii?Q?yh8m9ESCNc0SktJQqF4CASojdeNoP3B6hRXGWLgp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f51f7ec-3525-450b-398c-08dba7808fe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 04:38:01.4548 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RnO83yvu5AwzVNLyE/XOD2TmNLvqpF8WELOVDt+/y8m3a9NltOTldS34htugkGa3CqPWRPn2+D9DWClWgySbCumhndW3japqst/UJgosYkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7266
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
 Junxiao" <junxiao.chang@intel.com>, Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alistair,

>=20
> > >
> > >> >> > > > No, adding HMM_PFN_REQ_WRITE still doesn't help in fixing t=
he
> > >> issue.
> > >> >> > > > Although, I do not have THP enabled (or built-in), shmem do=
es
> > not
> > >> evict
> > >> >> > > > the pages after hole punch as noted in the comment in
> > >> >> shmem_fallocate():
> > >> >> > >
> > >> >> > > This is the source of all your problems.
> > >> >> > >
> > >> >> > > Things that are mm-centric are supposed to track the VMAs and
> > >> changes
> > >> >> to
> > >> >> > > the PTEs. If you do something in userspace and it doesn't cau=
se
> the
> > >> >> > > CPU page tables to change then it certainly shouldn't cause a=
ny
> > mmu
> > >> >> > > notifiers or hmm_range_fault changes.
> > >> >> > I am not doing anything out of the blue in the userspace. I thi=
nk the
> > >> >> behavior
> > >> >> > I am seeing with shmem (where an invalidation event
> > >> >> (MMU_NOTIFY_CLEAR)
> > >> >> > does occur because of a hole punch but the PTEs don't really ge=
t
> > >> updated)
> > >> >> > can arguably be considered an optimization.
> > >> >>
> > >> >> Your explanations don't make sense.
> > >> >>
> > >> >> If MMU_NOTIFER_CLEAR was sent but the PTEs were left present
> then:
> > >> >>
> > >> >> > > There should still be an invalidation notifier at some point =
when
> the
> > >> >> > > CPU tables do eventually change, whenever that is. Missing th=
at
> > >> >> > > notification would be a bug.
> > >> >> > I clearly do not see any notification getting triggered (from b=
oth
> > >> >> shmem_fault()
> > >> >> > and hugetlb_fault()) when the PTEs do get updated as the hole i=
s
> > refilled
> > >> >> > due to writes. Are you saying that there needs to be an invalid=
ation
> > >> event
> > >> >> > (MMU_NOTIFY_CLEAR?) dispatched at this point?
> > >> >>
> > >> >> You don't get to get shmem_fault in the first place.
> > >> > What I am observing is that even after MMU_NOTIFY_CLEAR (hole
> > punch)
> > >> is sent,
> > >> > hmm_range_fault() finds that the PTEs associated with the hole are=
 still
> > >> pte_present().
> > >> > I think it remains this way as long as there are reads on the hole=
. Once
> > >> there are
> > >> > writes, it triggers shmem_fault() which results in PTEs getting up=
dated
> > but
> > >> without
> > >> > any notification.
> > >>
> > >> Oh wait, this is shmem. The read from hmm_range_fault() (assuming
> you
> > >> specified HMM_PFN_REQ_FAULT) will trigger shmem_fault() due to the
> > >> missing PTE.
> > > When running one of the udmabuf subtests (introduced in the third pat=
ch
> > of
> > > this series), I see that MMU_NOTIFY_CLEAR is sent when a hole is
> punched.
> > > As a response, hmm_range_fault() is called from the udmabuf invalidat=
e
> > callback,
> >
> > Actually I'm suprised that works. If you've setup an interval notifier
> > and are updating the notifier sequence numbers correctly I would expect
> > hmm_range_fault() to return -EBUSY until
> > mmu_notifier_invalidate_range_end() is called.
> >
> > It might be helpful to post the code you're testing with somewhere but
> > are you calling mmu_interval_read_begin() to start the critical section
> > and mmu_interval_set_seq() to update the sequence in another notifier?
> > I'm not at all convinced calling hmm_range_fault() from a notifier can
> > be made to work though.
Turns out, calling hmm_range_fault() from the invalidate callback was indee=
d
a problem and the reason why new pages were not faulted-in. In other words,
it looks like the invalidate callback is not the right place to invoke hmm_=
range_fault()
as the PTEs may not have been cleared.

> That could be part of the problem. I mean the way hmm_range_fault()
> is invoked from the invalidate callback is probably incorrect as you are
> suggesting. Anyway, here is the code I am testing with:
> static bool invalidate_udmabuf(struct mmu_interval_notifier *mn,
>                                const struct mmu_notifier_range *range_mn,
>                                unsigned long cur_seq)
> {
>         struct udmabuf_vma_range *range =3D
>                         container_of(mn, struct udmabuf_vma_range, range_=
mn);
>         struct udmabuf *ubuf =3D range->ubuf;
>         struct hmm_range hrange =3D {0};
>         unsigned long *pfns, num_pages, timeout;
>         int i, ret;
>=20
>         printk("invalidate; start =3D %lu, end =3D %lu\n",
>                range->start, range->end);
>=20
>         hrange.notifier =3D mn;
>         hrange.default_flags =3D HMM_PFN_REQ_FAULT;
>         hrange.start =3D max(range_mn->start, range->start);
>         hrange.end =3D min(range_mn->end, range->end);
>         num_pages =3D (hrange.end - hrange.start) >> PAGE_SHIFT;
>=20
>         pfns =3D kmalloc_array(num_pages, sizeof(*pfns), GFP_KERNEL);
>         if (!pfns)
>                 return true;
>=20
>         printk("invalidate; num pages =3D %lu\n", num_pages);
>=20
>         hrange.hmm_pfns =3D pfns;
>         timeout =3D jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT)=
;
>         do {
>                 hrange.notifier_seq =3D mmu_interval_read_begin(mn);
>=20
>                 mmap_read_lock(ubuf->vmm_mm);
>                 ret =3D hmm_range_fault(&hrange);
>                 mmap_read_unlock(ubuf->vmm_mm);
>                 if (ret) {
>                         if (ret =3D=3D -EBUSY && !time_after(jiffies, tim=
eout))
>                                 continue;
>                         break;
>                 }
>=20
>                 if (mmu_interval_read_retry(mn, hrange.notifier_seq))
>                         continue;
>         } while (ret);
>=20
>         if (!ret) {
>                 for (i =3D 0; i < num_pages; i++) {
>                         printk("hmm returned page =3D %p; pfn =3D %lu\n",
>                                hmm_pfn_to_page(pfns[i]),
>                                pfns[i] & ~HMM_PFN_FLAGS);
>                 }
>         }
>         return true;
> }
>=20
Doing the above from a wq worker func (scheduled after invalidate event)
instead of the invalidate callback lets hmm_range_fault() fault-in new page=
s.
What this means is that, at-least in my use-case, getting MMU_NOTIFY_CLEAR
indicates that the invalidation is still ongoing and that it is not done ye=
t.
Sorry for the confusion.

Thanks,
Vivek

> static const struct mmu_interval_notifier_ops udmabuf_invalidate_ops =3D =
{
>         .invalidate =3D invalidate_udmabuf,
> };
>=20
> >
> > > to walk over the PTEs associated with the hole. When this happens, I
> > noticed that
> > > the below function returns HMM_PFN_VALID | HMM_PFN_WRITE for all
> > the
> > > PTEs associated with the hole.
> > > static inline unsigned long pte_to_hmm_pfn_flags(struct hmm_range
> > *range,
> > >                                                  pte_t pte)
> > > {
> > >         if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
> > >                 return 0;
> > >         return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) :
> > HMM_PFN_VALID;
> > > }
> > >
> > > As a result, hmm_pte_need_fault() always returns 0 and shmem_fault()
> > > never gets triggered despite specifying HMM_PFN_REQ_FAULT |
> > HMM_PFN_REQ_WRITE.
> > > And, the set of PFNs returned by hmm_range_fault() are the same ones
> > > that existed before the hole was punched.
> > >
> > >> Subsequent writes will just upgrade PTE permissions
> > >> assuming the read didn't map them RW to begin with. If you want to
> > >> actually see the hole with hmm_range_fault() don't specify
> > >> HMM_PFN_REQ_FAULT (or _WRITE).
> > >>
> > >> >>
> > >> >> If they were marked non-prsent during the CLEAR then the shadow
> side
> > >> >> remains non-present until it gets its own fault.
> > >> >>
> > >> >> If they were made non-present without an invalidation then that i=
s a
> > >> >> bug.
> > >> >>
> > >> >> > > hmm_range_fault() is the correct API to use if you are workin=
g
> with
> > >> >> > > notifiers. Do not hack something together using pin_user_page=
s.
> > >> >>
> > >> >> > I noticed that hmm_range_fault() does not seem to be working as
> > >> expected
> > >> >> > given that it gets stuck(hangs) while walking hugetlb pages.
> > >> >>
> > >> >> You are the first to report that, it sounds like a serious bug. P=
lease
> > >> >> try to fix it.
> > >> >>
> > >> >> > Regardless, as I mentioned above, the lack of notification when=
 PTEs
> > >> >> > do get updated due to writes is the crux of the issue
> > >> >> > here. Therefore, AFAIU, triggering an invalidation event or som=
e
> > >> >> > other kind of notification would help in fixing this issue.
> > >> >>
> > >> >> You seem to be facing some kind of bug in the mm, it sounds prett=
y
> > >> >> serious, and it almost certainly is a missing invalidation.
> > >> >>
> > >> >> Basically, anything that changes a PTE must eventually trigger an
> > >> >> invalidation. It is illegal to change a PTE from one present valu=
e to
> > >> >> another present value without invalidation notification.
> > >> >>
> > >> >> It is not surprising something would be missed here.
> > >> > As you suggest, it looks like the root-cause of this issue is the =
missing
> > >> > invalidation notification when the PTEs are changed from one prese=
nt
> > >>
> > >> I don't think there's a missing invalidation here. You say you're se=
eing
> > >> the MMU_NOTIFY_CLEAR when hole punching which is when the PTE is
> > >> cleared. When else do you expect a notification?
> > > Oh, given that we are finding PTEs that are still pte_present() even =
after
> > > MMU_NOTIFY_CLEAR is sent, the theory is that another
> > MMU_NOTIFY_CLEAR
> > > needs to be sent after the PTEs are updated when new pages are faulte=
d-
> in.
> > >
> > > However, it just occurred to me that maybe the behavior I am seeing i=
s not
> > > unexpected as it might be a timing issue that has to do with when the
> PTEs
> > > are walked. Let me explain. Here is what shmem does when a hole is
> > punched:
> > >                 if ((u64)unmap_end > (u64)unmap_start)
> > >                         unmap_mapping_range(mapping, unmap_start,
> > >                                             1 + unmap_end - unmap_sta=
rt, 0);
> > >                 shmem_truncate_range(inode, offset, offset + len - 1)=
;
> > >
> > > IIUC, the invalidate callback is called from unmap_mapping_range() bu=
t
> > > the page removal does not happen until shmem_truncate_range() gets
> > > called. So, if I were to call hmm_range_fault() after
> > shmem_truncate_range(),
> > > I might see different results as the PTEs would probably no longer be
> > present.
> > > In order to test this theory, I would have to schedule a wq thread fu=
nc
> from
> > the
> > > invalidate callback (to walk the PTEs after a slight delay). I'll try=
 this out
> > when
> > > I get a chance after addressing some of the locking concerns associat=
ed
> with
> > > pairing static/dynamic dmabuf exporters and importers.
> >
> > That sounds plausible. The PTE will actually be cleared in
> > unmap_mapping_range() after the mmu notifier is called. I'm curious how
> > hmm_range_fault() passes though.
> >
> > > Thanks,
> > > Vivek
> > >
> > >>
> > >> > value to another. I'd like to fix this issue eventually but I firs=
t need to
> > >> > focus on addressing udmabuf page migration (out of movable zone)
> > >> > and also look into the locking concerns Daniel mentioned about pai=
ring
> > >> > static and dynamic dmabuf exporters and importers.
> > >> >
> > >> > Thanks,
> > >> > Vivek

