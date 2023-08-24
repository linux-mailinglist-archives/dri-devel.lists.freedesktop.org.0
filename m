Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E474B7867BD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 08:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8BA10E103;
	Thu, 24 Aug 2023 06:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A59C10E103
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 06:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692859706; x=1724395706;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hfpHCjQ7QSf+jrnUyuXqNGbjr3/Zj6jT33YD8ITzGJQ=;
 b=IxmYstSc1e4V6NO+KamYJ7WIlLc3+cnWjn0Fa3X/YN9moy/IHly0bAsr
 +BTugTuOrRiH7FNh2YYHdsTDQ7INH6OupDvKxQssymfDKmb5oWP9GbCNq
 ilUGuPzCAlsCYoTf3jIBhiqz+hTxVy2ZrGH1A1j0z64gmWnCLwdMlM1Tg
 E6xKGUvg/9nyika9CRj0JmpVnwAaXJ6UVakDwe6DwmjAUhcbouhbjOpI4
 lt99X758ELnR8xP1T+oKW3sPTdVLUJ+xtfjud5JyOnvG+b8YoixNR62y/
 iycJS6r/8ZXiy+gShQtvVTnsqP+G66CnylPXkRNKW9/wA3KealokxTDMp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="377088061"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="377088061"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 23:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="880686248"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2023 23:48:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 23:48:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 23:48:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 23 Aug 2023 23:48:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 23 Aug 2023 23:48:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZsdqyZHtep6V3DZ1HuarVw0jV91/xnhW4R189zSAvt+wrX3CdrrNY6rYg4zF7z5ORCz0Ni1FnS2pTmg41T9sRzVT+WDKX51RCyWzkQhv/4xAl67dCyHiLp/qFAmh3ay+8P9l7jPH7j7UEje/9ZaNT5NkwlPhc8ByYDgLnoBPuCqKaaJgtHJ5bHvuhoIGTcup9jst8ymF8zCQqIohIF5t5/hBNtFqjpBZ/kOr3QTruBJS7x7oabemoUBgzzDgT7BdLCuTUi6M5HnyeloFBRYawXERZtvBOv6VqRv2Yc4nbeZAQHCr2+20GQEM35YCwhNOBqpkVTXy207dyvn0ljueg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8/7o4z/g+u12bjv3z9CNUpBWs4rMBd3ZnIPI6rGTq4=;
 b=bioefP5yXNJMRhiEs4yPuU+08q9ZHNL84/Ipp/xnZSM+WBEEOauIXMOgJ7h7VH8Ivi2ZRc5YG26t6uQ4dYikVuwNp5ygujILohR3Hx4HD/VxZtKy678W6C4rLWRmLxS33IxF7uPqLfNMmVjlsosGGi4Ijegvrwip27+KcF7/7nRSgcuo0ftpkAu836HNkMMxqiZNrEfLLH3kdKIeR+faGRtxZM5LzGkxJ4YyPiGjZE3GhyLLdvar8Kbq7Vc7pBbWHLy4wG7zUpljDUUeD3ZFcaVBp5k1EfOzIGyvMR0CSjRYDOYQrpcbVOVaw/ge4HN+1xN5mAsm+56CzuNN716mEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CH3PR11MB8519.namprd11.prod.outlook.com (2603:10b6:610:1ba::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.13; Thu, 24 Aug
 2023 06:48:21 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b%3]) with mapi id 15.20.6699.026; Thu, 24 Aug 2023
 06:48:20 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq/AWUSAgAGkBBCAAGFsAIAF9M/ggAChIwCAADi24IABSWKAgABl6ECAAEZHgIABcLAQgAD86oCAAQfUEIAEas2AgAGbU1CAANOWAIAAAN4AgAAASgCAAADJgIAAACaAgAAAiQCAAFefQIAACl6AgAICCrCAALzcgIAABQIAgADEKYCAAD264IAAlRIAgAVz8QCAANNhgIALoJuwgAiQSQCAAMiegIAAvHsAgAJ4umA=
Date: Thu, 24 Aug 2023 06:48:20 +0000
Message-ID: <IA0PR11MB71855031E9159C8DCB311702F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
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
In-Reply-To: <87o7izlcg7.fsf@nvdebian.thelocal>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CH3PR11MB8519:EE_
x-ms-office365-filtering-correlation-id: aabeaa95-0a2c-47f6-519a-08dba46e1adb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l6jhatNE2k3MYE8EDwaJvGe9L3pznKcvhmZ4nB3OzZYh+suU1p+hI+tAg+WyVs9eRwZ9SXKMxUikPxAj9xqnTVtYpOzJ/YZ1AsOCAEfbq/+fBaglYnBsICrDsX/uohp1vyydK3miBXGh26rO3U/fOeFlPTiIJjsEf9suK9+rl10pGHSvYHJVgBPopd1Fozd/9vqTXiVx+4KxqZt+6M4VZEeQTGS3xa/oeDEzi6yW/OY2NkSIxW2nQm7qy88svgQO8AfBZynikBWfxjTqzf1mCCX+ZI90ROFzFpYj2nB8GSuP3Q56AbjLgtVjvDE4cNpOEVWUWESPEwyZjGD6AQxI8ZyCk5VWSWhUJTsbkYx8glu/z6CX7paYC7UB26jwgTGpkB2ZB/ohoH7rEM2xIpDchN7oQBJHvFx90BxZqU/9lClWde5ZG4Nv19UtFs/1aAKqSyGvcdIg66DJBDcaaFMU6Av+qsIaEZgKw1eBLRgw79btAGmpNd4Ee27wImdq2Hp1uHJxTl6E+RKcwoFHcPwZFG566+33Bix3dWsfWI2MZPqFMJi+isI+aOrLowi0kUkiMdY1LdSb+TKJN7VvbIE6cvMVMiu0l51H10GSeJEfgAyCvpvbVZ5TwHbu7c/R/LNY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(346002)(396003)(39860400002)(1800799009)(451199024)(186009)(71200400001)(5660300002)(83380400001)(55016003)(7696005)(64756008)(54906003)(8936002)(66476007)(66556008)(38100700002)(2906002)(316002)(66446008)(478600001)(6916009)(82960400001)(76116006)(122000001)(38070700005)(66946007)(9686003)(4326008)(41300700001)(8676002)(26005)(52536014)(15650500001)(6506007)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?66GT5o1WFk19l9wpT511DhfMT3gUj7c5YMh4G3C9HMGfzwN4NgHO7LU7sIeH?=
 =?us-ascii?Q?KT4Myx+V37iMEuFLFxUJmu4ScZp+C4tDdjhjbL5D5GFn38oOosy95adC+xbF?=
 =?us-ascii?Q?8hWfBuK5MG+NGVR6YEKIJY2C/razZRZBnAKVCTwYZq3A752anELnix5h0tfr?=
 =?us-ascii?Q?NdFWLRQVwRCIr5Sv1gE+61yBT5OtGNr8IeR5AZ9OHGgsuW6+FSVSyUP1cstb?=
 =?us-ascii?Q?bXJr8gkfUxAh4QYgzQqBw86Kk8KlNd/xP6O1Z+o8tPa6OHsO8jE/WFi80zAi?=
 =?us-ascii?Q?rvC34DAuaJDwdObEUWZfgGaB0iQGa+H+3HqnzeesdTV7uFPyIO8ykwPWBZVs?=
 =?us-ascii?Q?fth0OIQXxZnwGKrsIIY6jc/KDZjmlqtq22Z7HKLdpag5HiT3Af2OMESUck3R?=
 =?us-ascii?Q?cDM4Jm8asl7j9nPVUIuQ6m/lO1iGpd7tUoKWKN7VEPe7cYkpbBMFisq+Eyfy?=
 =?us-ascii?Q?kdFd0eMLoWs5mSvq994StvEgHvPlH19+ODUaBHGaAyZoVkpWKoDlr+Ho0t4y?=
 =?us-ascii?Q?DqoNYL1Zd/x8fll3b9Rma2B5YoeT3gwGAJUclStGeu7lvnxJGecKa/46Njrm?=
 =?us-ascii?Q?WBu02DXa+61JmD71wMBnwGoDwWcW+umqJznmXyG/6u3/Avyd7i++LAAZUh0+?=
 =?us-ascii?Q?7fsIISaTlNTy9ULe5jjhE/z7eQnYRvlKLrAWLT5a5ME25NScD+Di21Mvx6PD?=
 =?us-ascii?Q?M21XFIoYOSAWUmhE0lEQ/BrvZ9tLjgV54djfh5GXU+W3T1J1b7UmwbfD0KZe?=
 =?us-ascii?Q?dN6qEyszDQ9LxJXyIEASflFewWHTiqKq0k80egXmX3msoSvk/7cXE+m3wCFR?=
 =?us-ascii?Q?cMjr+6uSYkZVCl02rYFLYbhKVGFRk4HStGp7arrvZQKgZNunMa5CSrCYpO32?=
 =?us-ascii?Q?wIBykS+4akydNUw8RZ1tcW+xpB9ouHUuHprjo1yHD8L628bzAa7/t06JwkFT?=
 =?us-ascii?Q?QXgtenOqDQWTN4ue+Y0sVInYtf8IN8BA8rtX71YS+pWUWJCtqKLMiH6iiJyp?=
 =?us-ascii?Q?rIqa6H6o+NTov1FQbaYpEeHwK+dZKdrJdJcFnf/SfOGgsuBHYWtNIrclYofx?=
 =?us-ascii?Q?FXu0OCucZej7i9sluI6nk3a7NDfMRn0qU+1lpOKdZ2n4ixswKOkF/h6+jCiq?=
 =?us-ascii?Q?t8MK/EB7+4+HALm7SHRP1oYeDBEU4kP2gDRMEYdhKQ20qbcOLd/gLki0jowk?=
 =?us-ascii?Q?xCimvzk5HfFek7L/9wZbvbWh3Sdr+fE+IXqCNTvGmYx8VLTlstc4THb05FbK?=
 =?us-ascii?Q?3RsG3i1ema0QMcbVFDCVF+n11v6u+T8Ici3zfGQlP5mYQCSnH/xkmeHSN73c?=
 =?us-ascii?Q?Mcn3upD7INEOPoQyhRHWehBOwgeCC3pXX1+EIvLClqa6jNfLlsJ6gnz5FPY2?=
 =?us-ascii?Q?kpuEMfHFJBEuW8gL9tCiSqt7kMj2VIApahhhcVI8Pshl0Vha7HUbXA8q5cMq?=
 =?us-ascii?Q?C6/PTFwopFc9E3K98cZgpYApAZdQnIbHBmOaJnM0rdhB3OkP+yJ622wW09l0?=
 =?us-ascii?Q?3/0TWXb6WcMqeI/fcDom8pYjDTZrPdVY+GO8ZcI1j4XvBiHZZDd6D6urz+Vn?=
 =?us-ascii?Q?Yj82+g+dOKJSOLDOu05Rkul2jxUL4I7LFqmtSUBS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aabeaa95-0a2c-47f6-519a-08dba46e1adb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2023 06:48:20.6508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qQTWUJWV2+Oxt0x69nk7fPCRYoBtydrkNVwnuwtnDzU5lYB/JuZNHOk2zLCL+CcwMG6xLUh5mCGMsc5ClPeLMK/l24tQWuKong5GAOSZxdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8519
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

> >
> >> >> > > > No, adding HMM_PFN_REQ_WRITE still doesn't help in fixing the
> >> issue.
> >> >> > > > Although, I do not have THP enabled (or built-in), shmem does
> not
> >> evict
> >> >> > > > the pages after hole punch as noted in the comment in
> >> >> shmem_fallocate():
> >> >> > >
> >> >> > > This is the source of all your problems.
> >> >> > >
> >> >> > > Things that are mm-centric are supposed to track the VMAs and
> >> changes
> >> >> to
> >> >> > > the PTEs. If you do something in userspace and it doesn't cause=
 the
> >> >> > > CPU page tables to change then it certainly shouldn't cause any
> mmu
> >> >> > > notifiers or hmm_range_fault changes.
> >> >> > I am not doing anything out of the blue in the userspace. I think=
 the
> >> >> behavior
> >> >> > I am seeing with shmem (where an invalidation event
> >> >> (MMU_NOTIFY_CLEAR)
> >> >> > does occur because of a hole punch but the PTEs don't really get
> >> updated)
> >> >> > can arguably be considered an optimization.
> >> >>
> >> >> Your explanations don't make sense.
> >> >>
> >> >> If MMU_NOTIFER_CLEAR was sent but the PTEs were left present then:
> >> >>
> >> >> > > There should still be an invalidation notifier at some point wh=
en the
> >> >> > > CPU tables do eventually change, whenever that is. Missing that
> >> >> > > notification would be a bug.
> >> >> > I clearly do not see any notification getting triggered (from bot=
h
> >> >> shmem_fault()
> >> >> > and hugetlb_fault()) when the PTEs do get updated as the hole is
> refilled
> >> >> > due to writes. Are you saying that there needs to be an invalidat=
ion
> >> event
> >> >> > (MMU_NOTIFY_CLEAR?) dispatched at this point?
> >> >>
> >> >> You don't get to get shmem_fault in the first place.
> >> > What I am observing is that even after MMU_NOTIFY_CLEAR (hole
> punch)
> >> is sent,
> >> > hmm_range_fault() finds that the PTEs associated with the hole are s=
till
> >> pte_present().
> >> > I think it remains this way as long as there are reads on the hole. =
Once
> >> there are
> >> > writes, it triggers shmem_fault() which results in PTEs getting upda=
ted
> but
> >> without
> >> > any notification.
> >>
> >> Oh wait, this is shmem. The read from hmm_range_fault() (assuming you
> >> specified HMM_PFN_REQ_FAULT) will trigger shmem_fault() due to the
> >> missing PTE.
> > When running one of the udmabuf subtests (introduced in the third patch
> of
> > this series), I see that MMU_NOTIFY_CLEAR is sent when a hole is punche=
d.
> > As a response, hmm_range_fault() is called from the udmabuf invalidate
> callback,
>=20
> Actually I'm suprised that works. If you've setup an interval notifier
> and are updating the notifier sequence numbers correctly I would expect
> hmm_range_fault() to return -EBUSY until
> mmu_notifier_invalidate_range_end() is called.
>=20
> It might be helpful to post the code you're testing with somewhere but
> are you calling mmu_interval_read_begin() to start the critical section
> and mmu_interval_set_seq() to update the sequence in another notifier?
> I'm not at all convinced calling hmm_range_fault() from a notifier can
> be made to work though.
That could be part of the problem. I mean the way hmm_range_fault()
is invoked from the invalidate callback is probably incorrect as you are
suggesting. Anyway, here is the code I am testing with:
static bool invalidate_udmabuf(struct mmu_interval_notifier *mn,
                               const struct mmu_notifier_range *range_mn,
                               unsigned long cur_seq)
{
        struct udmabuf_vma_range *range =3D
                        container_of(mn, struct udmabuf_vma_range, range_mn=
);
        struct udmabuf *ubuf =3D range->ubuf;
        struct hmm_range hrange =3D {0};
        unsigned long *pfns, num_pages, timeout;
        int i, ret;

        printk("invalidate; start =3D %lu, end =3D %lu\n",
               range->start, range->end);

        hrange.notifier =3D mn;
        hrange.default_flags =3D HMM_PFN_REQ_FAULT;
        hrange.start =3D max(range_mn->start, range->start);
        hrange.end =3D min(range_mn->end, range->end);
        num_pages =3D (hrange.end - hrange.start) >> PAGE_SHIFT;

        pfns =3D kmalloc_array(num_pages, sizeof(*pfns), GFP_KERNEL);
        if (!pfns)
                return true;

        printk("invalidate; num pages =3D %lu\n", num_pages);

        hrange.hmm_pfns =3D pfns;
        timeout =3D jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
        do {
                hrange.notifier_seq =3D mmu_interval_read_begin(mn);

                mmap_read_lock(ubuf->vmm_mm);
                ret =3D hmm_range_fault(&hrange);
                mmap_read_unlock(ubuf->vmm_mm);
                if (ret) {
                        if (ret =3D=3D -EBUSY && !time_after(jiffies, timeo=
ut))
                                continue;
                        break;
                }

                if (mmu_interval_read_retry(mn, hrange.notifier_seq))
                        continue;
        } while (ret);

        if (!ret) {
                for (i =3D 0; i < num_pages; i++) {
                        printk("hmm returned page =3D %p; pfn =3D %lu\n",
                               hmm_pfn_to_page(pfns[i]),
                               pfns[i] & ~HMM_PFN_FLAGS);
                }
        }
        return true;
}

static const struct mmu_interval_notifier_ops udmabuf_invalidate_ops =3D {
        .invalidate =3D invalidate_udmabuf,
};

Thanks,
Vivek

>=20
> > to walk over the PTEs associated with the hole. When this happens, I
> noticed that
> > the below function returns HMM_PFN_VALID | HMM_PFN_WRITE for all
> the
> > PTEs associated with the hole.
> > static inline unsigned long pte_to_hmm_pfn_flags(struct hmm_range
> *range,
> >                                                  pte_t pte)
> > {
> >         if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
> >                 return 0;
> >         return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) :
> HMM_PFN_VALID;
> > }
> >
> > As a result, hmm_pte_need_fault() always returns 0 and shmem_fault()
> > never gets triggered despite specifying HMM_PFN_REQ_FAULT |
> HMM_PFN_REQ_WRITE.
> > And, the set of PFNs returned by hmm_range_fault() are the same ones
> > that existed before the hole was punched.
> >
> >> Subsequent writes will just upgrade PTE permissions
> >> assuming the read didn't map them RW to begin with. If you want to
> >> actually see the hole with hmm_range_fault() don't specify
> >> HMM_PFN_REQ_FAULT (or _WRITE).
> >>
> >> >>
> >> >> If they were marked non-prsent during the CLEAR then the shadow sid=
e
> >> >> remains non-present until it gets its own fault.
> >> >>
> >> >> If they were made non-present without an invalidation then that is =
a
> >> >> bug.
> >> >>
> >> >> > > hmm_range_fault() is the correct API to use if you are working =
with
> >> >> > > notifiers. Do not hack something together using pin_user_pages.
> >> >>
> >> >> > I noticed that hmm_range_fault() does not seem to be working as
> >> expected
> >> >> > given that it gets stuck(hangs) while walking hugetlb pages.
> >> >>
> >> >> You are the first to report that, it sounds like a serious bug. Ple=
ase
> >> >> try to fix it.
> >> >>
> >> >> > Regardless, as I mentioned above, the lack of notification when P=
TEs
> >> >> > do get updated due to writes is the crux of the issue
> >> >> > here. Therefore, AFAIU, triggering an invalidation event or some
> >> >> > other kind of notification would help in fixing this issue.
> >> >>
> >> >> You seem to be facing some kind of bug in the mm, it sounds pretty
> >> >> serious, and it almost certainly is a missing invalidation.
> >> >>
> >> >> Basically, anything that changes a PTE must eventually trigger an
> >> >> invalidation. It is illegal to change a PTE from one present value =
to
> >> >> another present value without invalidation notification.
> >> >>
> >> >> It is not surprising something would be missed here.
> >> > As you suggest, it looks like the root-cause of this issue is the mi=
ssing
> >> > invalidation notification when the PTEs are changed from one present
> >>
> >> I don't think there's a missing invalidation here. You say you're seei=
ng
> >> the MMU_NOTIFY_CLEAR when hole punching which is when the PTE is
> >> cleared. When else do you expect a notification?
> > Oh, given that we are finding PTEs that are still pte_present() even af=
ter
> > MMU_NOTIFY_CLEAR is sent, the theory is that another
> MMU_NOTIFY_CLEAR
> > needs to be sent after the PTEs are updated when new pages are faulted-=
in.
> >
> > However, it just occurred to me that maybe the behavior I am seeing is =
not
> > unexpected as it might be a timing issue that has to do with when the P=
TEs
> > are walked. Let me explain. Here is what shmem does when a hole is
> punched:
> >                 if ((u64)unmap_end > (u64)unmap_start)
> >                         unmap_mapping_range(mapping, unmap_start,
> >                                             1 + unmap_end - unmap_start=
, 0);
> >                 shmem_truncate_range(inode, offset, offset + len - 1);
> >
> > IIUC, the invalidate callback is called from unmap_mapping_range() but
> > the page removal does not happen until shmem_truncate_range() gets
> > called. So, if I were to call hmm_range_fault() after
> shmem_truncate_range(),
> > I might see different results as the PTEs would probably no longer be
> present.
> > In order to test this theory, I would have to schedule a wq thread func=
 from
> the
> > invalidate callback (to walk the PTEs after a slight delay). I'll try t=
his out
> when
> > I get a chance after addressing some of the locking concerns associated=
 with
> > pairing static/dynamic dmabuf exporters and importers.
>=20
> That sounds plausible. The PTE will actually be cleared in
> unmap_mapping_range() after the mmu notifier is called. I'm curious how
> hmm_range_fault() passes though.
>=20
> > Thanks,
> > Vivek
> >
> >>
> >> > value to another. I'd like to fix this issue eventually but I first =
need to
> >> > focus on addressing udmabuf page migration (out of movable zone)
> >> > and also look into the locking concerns Daniel mentioned about pairi=
ng
> >> > static and dynamic dmabuf exporters and importers.
> >> >
> >> > Thanks,
> >> > Vivek

