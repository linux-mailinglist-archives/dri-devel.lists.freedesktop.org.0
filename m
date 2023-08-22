Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAA17839C7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 08:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DBB10E2D6;
	Tue, 22 Aug 2023 06:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0A510E2D6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 06:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692684895; x=1724220895;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mOBYRrsN3r1VEs+L++uygfjeYTltxD9EC2cC62arMh8=;
 b=n6Ab2SO0LFUUgZ/NdfzU8i7tbg2hpO36X8cuLQ5RMuBZJwPwgu+5M8VQ
 O08B6U8f65qM/JfAIHS3UtnQxTJ+6ySvqYSbmaFEMuy2ubiA8yaILAEVQ
 5KvC7o2J6HFoxgS4D9o4jWD1EFuwaJRgqwPiHXqkZg21yqJovAGrWIby+
 F5sVsp6BA7E+KxBKLjhlb4lN2srlnp8US52739dXRu7W7M+I8ICIYZrIB
 HKVuQS5sbzLCdydtuY2s9zZR3qUYnjLnH7FaIBVoMMdcZUEaEGPz23oUQ
 qYX4IHKLH0vINagTASnu8k2Dic6DEpTE9QqQSzTc3ZS8muLxQTG23pZeR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376523214"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="376523214"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 23:14:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="771235921"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="771235921"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 21 Aug 2023 23:14:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 23:14:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 23:14:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 23:14:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 23:14:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QeTwP/dEYuuM5Kl3xx/45Y0QpUAPq0gjXcDB4zzXDUpqvPdnl5/KYKspRp8PIjoKuNg3sgr7fpo8YL0Q7AMcHnedBb3eZgOUjIAJGdwDP1FcDu6KDXx1pmwN9gyTGI1+NG8FuRdPo5rEkSgcsub85//p/yIqf8s+nCXMYaPQIFa994HNgGORlN1NE9iaFqVmo+d+fY7Z/SzJGjqWS8M7iTcZwGvfsK5C8Qkx6xEYylCH1S8TKdNdusIQ+va1g9eDtJth5L2kQliLH23xlOvNeSx5nZTg/JhDlCSy88VOFnp02u8C7OPpIGWFKsk0WYuNg6lJG+b2iTN+AWW+xaFnsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4U1DK7fi8tmv4fDWkILNhRX4KNUifUNg13/oC99k8w=;
 b=aNOwlHfsQLGbo3WIEoRjA2KUoYk0KiZJxyA+QOh+d6DQMx2Yg77JPVEPpLMA3bgwbiwtjUh9NAKgrHnWuci1KiPHUexiMwpQyDdjw9EAs5KaOXNj2MdVEuJNRpl19Lub9L1VAtbwSLV3naxQjyC3sv2+mmS5J57Cqr2EQ9v2x/b3OKT0VFr4Y3/E75hDHtbuyMcq3CoqW2xkkMdEUPcBpsfIP2MWnHHh0D9xgBuJKl0y6n1AnG4HolcfALzF1hM4R2gPHiw7UsgWPjyfH+Y5c3mjK82uWltvizt32kzV2cH4YhijNoGTQC1eMjGw5XBbCpD9/ktQC8DnFL1wGF8/VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 06:14:44 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b%3]) with mapi id 15.20.6699.020; Tue, 22 Aug 2023
 06:14:44 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq/AWUSAgAGkBBCAAGFsAIAF9M/ggAChIwCAADi24IABSWKAgABl6ECAAEZHgIABcLAQgAD86oCAAQfUEIAEas2AgAGbU1CAANOWAIAAAN4AgAAASgCAAADJgIAAACaAgAAAiQCAAFefQIAACl6AgAICCrCAALzcgIAABQIAgADEKYCAAD264IAAlRIAgAVz8QCAANNhgIALoJuwgAiQSQCAAMiegA==
Date: Tue, 22 Aug 2023 06:14:43 +0000
Message-ID: <IA0PR11MB71853FB79625A4F2399FFD79F81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
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
In-Reply-To: <87h6oswysm.fsf@nvdebian.thelocal>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DM4PR11MB5533:EE_
x-ms-office365-filtering-correlation-id: 8b8e9caf-2ad6-477b-fd7b-08dba2d71407
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B8urnUlR1ZEODo3E02xcJihOjl2BSl873Vg+2PT2KrxR1+omrEOgyCDqYo3UpJGG6qkNwTieU6tTP7HvUUSeXb6gQEqx1QEMG1YY5A5u6OXPTJqviJPjV9dSGQaK6s3bYfLLb79cDhDKhLVhc+4U+IbhuOuvhVR+N4TezNegHvGHiMdK6Fsz7ozn8Oq05j6HzSRLnFsTrBarlZREkZfBS/QK6Cpnyc35/nn7Km5BqjFbkO4B7ssFCk2lFxvDfVB7ufQPzmvgDndDm5CDbK9ZDflfEXnH5INQOZqPjAhK+lpA3UJcq1KdbZ7byTwq02XAzjAZaTswlspdbsrjwBAa5HsFNq6fWgR2T9Tf6q/N2bC+lV28/LtUhVgu1QCF/GUyhWyAoDymvajbqRmYfZAMgmb+CIVyR8WlciCdemhtoybOVpKxxe8FTjYPDMHG2/15TvaLSU9ZdvtjS+Y++Vx+aWM8XEhiJ8eW0b96rTUqxUyyVYYtikQ1u2QAabSeijiJ2jYqIrIEwMX5k75wnRVd+AyqCTBdR/DU3UI0heVCl0RmcGwgIQIG99eVZDl2zjq3fZalYgmPvyow5dZmBJGc2vrrNawzEUBiVqOlmP7bwRgYoowuFnGgNVui9imfKYHn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(1800799009)(186009)(451199024)(66446008)(54906003)(38070700005)(66476007)(76116006)(9686003)(66946007)(64756008)(316002)(6916009)(66556008)(82960400001)(8676002)(4326008)(8936002)(41300700001)(122000001)(478600001)(71200400001)(55016003)(38100700002)(6506007)(15650500001)(2906002)(83380400001)(86362001)(7696005)(5660300002)(33656002)(26005)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?itMyZv69hxtKyKigP3AY1F4dnaf7xxI7v7KkUkwz7ChXqowqToKnN4qrBckN?=
 =?us-ascii?Q?9GHhkXBqOvNl6Lnh2QQXuAcjbRO56+JYOTR6NoB+Iqq9CmlG/7vM7hEpmnly?=
 =?us-ascii?Q?UOrZ7CEF+0qPLxWauYDMFjOM16dWjvRX7VL2kn+s9o/pnYQlBm9APiYeQaac?=
 =?us-ascii?Q?en0RMLww5LsPDZ15b6VMqiNPCeOSX4DRgP4auHUVSrofE9mrraYv/eOnv7eM?=
 =?us-ascii?Q?+2toKgMWdwEFj0OnXB9q8SyBSEcTXxVUr0fK2xSRWD6qWbY1mJEWBRJkJRxF?=
 =?us-ascii?Q?tbRJyUmCzbpm9DrK/Pe3InUTqlaTofLRq6fhJGMKiaknMrBE6g71cQoiL9Kq?=
 =?us-ascii?Q?hldk4m18m+7zJtN2ZugZHU4MXYBpRpPIs5yOF0Fqpm10Z1Ryq3ygXBiomqo6?=
 =?us-ascii?Q?w/6rX63cozu2/HS2far7mmdlNhRTfYnH12FKLL7bwKTH7mvJQCA36Z8NChD4?=
 =?us-ascii?Q?ld7Qdg72HcvNnp6k/d/a3tepuoJ/cR/542GYqwlko8d5qFd5Z7j++98vDgtv?=
 =?us-ascii?Q?w4C6KocNH+6W233aSIABgtkAEbl2B6JuhI0IqvXXt7m0lpRZTMCtu2HTLAHO?=
 =?us-ascii?Q?taRIP5eXc0N/yvvioXArEbMZDtzsvie4SVN4jix2qeP3cP+w8TFTqcD8TIXz?=
 =?us-ascii?Q?rl7B+DFuPHdYimK9p1NxjvXvW8vTs0SFQ+fKNbgsswwG3u+z45Kk9NTv9p6P?=
 =?us-ascii?Q?LFQTRxPtrWGjIa7qtpxCqtz5Tx/l2JBX+j12uRUydrNBFe/UoM6+IwTB1HTh?=
 =?us-ascii?Q?ryzqng02SsZ/mLqIhRXgQxvL+s6DeLd7e0nnPw26NQRU0+I+hqYArfyM4clX?=
 =?us-ascii?Q?pPRtXjjksRPDwnleE/CJQqqFmhtOYuuV3oRR8GsXzDVfiXXKN7D6C0/WSrCv?=
 =?us-ascii?Q?0uJmhjelHmVcYFPNXYmws7qAaRXj8UAVSBV2Gid28Urzer5+V7wBmuzaORwT?=
 =?us-ascii?Q?veEyhcyi4oaoo6zgB4R9Uvg9gWAR+TPOXGPUs6/C7cSuUUgm5YZrIHSgmxa1?=
 =?us-ascii?Q?CFSd/mFxkMD6lADFudlVBmQxvnmOnTGCMWIhZ5vYxt947VAvnCBb/09ZNGwb?=
 =?us-ascii?Q?+ls+TvLScyqS/1DdakdsLKfD9cU+nAGyuVeiy/6fZvOio4nzBBd0erWHFkwx?=
 =?us-ascii?Q?Yf2Ep7i24T7Ak5sRaECwl9WORqGGYt/gxLoElXdqxxbKHJdRo7+YpKUEMGfc?=
 =?us-ascii?Q?AjIjeJPK5vC8/YpL5EVC6LULPchQdKZhfuw10zyqyHgsDi5gh46S6mAWgu+e?=
 =?us-ascii?Q?upz+IE7ZIdF8TSi152/55zKuqmSVv/cZcwjJoNrbkur+pAkDE7srolgf5O6w?=
 =?us-ascii?Q?eRYm0EGXDkSN6Uj0PUwkQFleEe6b8syTQo+anrJe9GJv8qjY+KbNKWeT0QYZ?=
 =?us-ascii?Q?NhSRe1+bjeYr2EVQIfZRad9KFeGq/1pY4l29PApg1mcVk01DNDw5UBMfk17w?=
 =?us-ascii?Q?ryHqVuGYxTZ1fpzQbnJEarUqArCQTVjN6+mUccV0kShMQmIs4rLuP4QjN2Jk?=
 =?us-ascii?Q?QK05uqTmm/LTpO+BzHFT+QOrhQBvhxKZxwn4nGrfuuhjZPKh9b0VP+iKN3+1?=
 =?us-ascii?Q?J30X6mqG7mZjTVMoDHfbSaSvBVSFbgYH5yUMLh16?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8e9caf-2ad6-477b-fd7b-08dba2d71407
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 06:14:44.0273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V3shv8AzS6VuZ/5lBD1NfvWxg3oy8NckAaOvG8yr4k0/9LtjACtnJsvqhsPl4ttkOkM87b9UyMUTJutjlzOuOx9+hiRnsD0y0+Tg3fsp+/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5533
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alistair,

> >> > > > No, adding HMM_PFN_REQ_WRITE still doesn't help in fixing the
> issue.
> >> > > > Although, I do not have THP enabled (or built-in), shmem does no=
t
> evict
> >> > > > the pages after hole punch as noted in the comment in
> >> shmem_fallocate():
> >> > >
> >> > > This is the source of all your problems.
> >> > >
> >> > > Things that are mm-centric are supposed to track the VMAs and
> changes
> >> to
> >> > > the PTEs. If you do something in userspace and it doesn't cause th=
e
> >> > > CPU page tables to change then it certainly shouldn't cause any mm=
u
> >> > > notifiers or hmm_range_fault changes.
> >> > I am not doing anything out of the blue in the userspace. I think th=
e
> >> behavior
> >> > I am seeing with shmem (where an invalidation event
> >> (MMU_NOTIFY_CLEAR)
> >> > does occur because of a hole punch but the PTEs don't really get
> updated)
> >> > can arguably be considered an optimization.
> >>
> >> Your explanations don't make sense.
> >>
> >> If MMU_NOTIFER_CLEAR was sent but the PTEs were left present then:
> >>
> >> > > There should still be an invalidation notifier at some point when =
the
> >> > > CPU tables do eventually change, whenever that is. Missing that
> >> > > notification would be a bug.
> >> > I clearly do not see any notification getting triggered (from both
> >> shmem_fault()
> >> > and hugetlb_fault()) when the PTEs do get updated as the hole is ref=
illed
> >> > due to writes. Are you saying that there needs to be an invalidation
> event
> >> > (MMU_NOTIFY_CLEAR?) dispatched at this point?
> >>
> >> You don't get to get shmem_fault in the first place.
> > What I am observing is that even after MMU_NOTIFY_CLEAR (hole punch)
> is sent,
> > hmm_range_fault() finds that the PTEs associated with the hole are stil=
l
> pte_present().
> > I think it remains this way as long as there are reads on the hole. Onc=
e
> there are
> > writes, it triggers shmem_fault() which results in PTEs getting updated=
 but
> without
> > any notification.
>=20
> Oh wait, this is shmem. The read from hmm_range_fault() (assuming you
> specified HMM_PFN_REQ_FAULT) will trigger shmem_fault() due to the
> missing PTE.=20
When running one of the udmabuf subtests (introduced in the third patch of
this series), I see that MMU_NOTIFY_CLEAR is sent when a hole is punched.
As a response, hmm_range_fault() is called from the udmabuf invalidate call=
back,
to walk over the PTEs associated with the hole. When this happens, I notice=
d that
the below function returns HMM_PFN_VALID | HMM_PFN_WRITE for all the
PTEs associated with the hole.=20
static inline unsigned long pte_to_hmm_pfn_flags(struct hmm_range *range,
                                                 pte_t pte)
{
        if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
                return 0;
        return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_V=
ALID;
}

As a result, hmm_pte_need_fault() always returns 0 and shmem_fault()
never gets triggered despite specifying HMM_PFN_REQ_FAULT | HMM_PFN_REQ_WRI=
TE.
And, the set of PFNs returned by hmm_range_fault() are the same ones
that existed before the hole was punched.

> Subsequent writes will just upgrade PTE permissions
> assuming the read didn't map them RW to begin with. If you want to
> actually see the hole with hmm_range_fault() don't specify
> HMM_PFN_REQ_FAULT (or _WRITE).
>=20
> >>
> >> If they were marked non-prsent during the CLEAR then the shadow side
> >> remains non-present until it gets its own fault.
> >>
> >> If they were made non-present without an invalidation then that is a
> >> bug.
> >>
> >> > > hmm_range_fault() is the correct API to use if you are working wit=
h
> >> > > notifiers. Do not hack something together using pin_user_pages.
> >>
> >> > I noticed that hmm_range_fault() does not seem to be working as
> expected
> >> > given that it gets stuck(hangs) while walking hugetlb pages.
> >>
> >> You are the first to report that, it sounds like a serious bug. Please
> >> try to fix it.
> >>
> >> > Regardless, as I mentioned above, the lack of notification when PTEs
> >> > do get updated due to writes is the crux of the issue
> >> > here. Therefore, AFAIU, triggering an invalidation event or some
> >> > other kind of notification would help in fixing this issue.
> >>
> >> You seem to be facing some kind of bug in the mm, it sounds pretty
> >> serious, and it almost certainly is a missing invalidation.
> >>
> >> Basically, anything that changes a PTE must eventually trigger an
> >> invalidation. It is illegal to change a PTE from one present value to
> >> another present value without invalidation notification.
> >>
> >> It is not surprising something would be missed here.
> > As you suggest, it looks like the root-cause of this issue is the missi=
ng
> > invalidation notification when the PTEs are changed from one present
>=20
> I don't think there's a missing invalidation here. You say you're seeing
> the MMU_NOTIFY_CLEAR when hole punching which is when the PTE is
> cleared. When else do you expect a notification?
Oh, given that we are finding PTEs that are still pte_present() even after
MMU_NOTIFY_CLEAR is sent, the theory is that another MMU_NOTIFY_CLEAR
needs to be sent after the PTEs are updated when new pages are faulted-in.

However, it just occurred to me that maybe the behavior I am seeing is not
unexpected as it might be a timing issue that has to do with when the PTEs
are walked. Let me explain. Here is what shmem does when a hole is punched:
                if ((u64)unmap_end > (u64)unmap_start)
                        unmap_mapping_range(mapping, unmap_start,
                                            1 + unmap_end - unmap_start, 0)=
;
                shmem_truncate_range(inode, offset, offset + len - 1);

IIUC, the invalidate callback is called from unmap_mapping_range() but
the page removal does not happen until shmem_truncate_range() gets
called. So, if I were to call hmm_range_fault() after shmem_truncate_range(=
),
I might see different results as the PTEs would probably no longer be prese=
nt.
In order to test this theory, I would have to schedule a wq thread func fro=
m the
invalidate callback (to walk the PTEs after a slight delay). I'll try this =
out when
I get a chance after addressing some of the locking concerns associated wit=
h
pairing static/dynamic dmabuf exporters and importers.

Thanks,
Vivek

>=20
> > value to another. I'd like to fix this issue eventually but I first nee=
d to
> > focus on addressing udmabuf page migration (out of movable zone)
> > and also look into the locking concerns Daniel mentioned about pairing
> > static and dynamic dmabuf exporters and importers.
> >
> > Thanks,
> > Vivek

