Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BE977389F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 09:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814BA10E06C;
	Tue,  8 Aug 2023 07:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B2B10E06C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 07:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691480250; x=1723016250;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZpFlhTOZ2/Wr3SyXe2tzJJrIn8xF9zIf/vQK3s4gX5w=;
 b=AWe2gI3av97egd8x9xBdxSzY4QzXkksLK+CYhXPIQC6vhLdx+4GNMviJ
 KHGa/Xt535jVmjq6R4QC291RWb5V50Bf1uM63t1lmVRPfIaFxR5AxdN9l
 oPqTdLdwme5YKysNHYCXGTUj2NbaDWyMhgs3JtapekyeqMlRhi0BFXOMS
 z0+yCkQ6LNT543846bhR9pPw4BqF+NAJUTEt9UjfJTysVUJeoGjPSbQrT
 dhPLHrjGDO2g6jEKFfHLr5iCFZZjoDcuHM3+bQ9Bi8n3uugLF5lAmGLkg
 c6sBbHWI+Wr2QCWOXx0brb4AtnFHezzdZjbiTKjOQ7gdSwX/KqyJzF+Gy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369645976"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="369645976"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 00:37:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="874624826"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 08 Aug 2023 00:37:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 00:37:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 00:37:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 00:37:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 00:37:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2I8zYPlh3RI5PIduLdn/j86tDTX/vEJ7VW9xAySHnCLm2LP/I7UwxHK3IJVnRrYNBrBh7F+HvhLGY4rzyrvB/1pGUPFO+1e1Lf4Ku91CgrsmKpCGu6nWTsyGVc2HphaSTdv9/1tROPgxxmLJXltYrEFAJ77vWWhG/9AG3ciH6//8dd5vbRbfqE2474QjmE06dKR48lKu3S7Tus4lnZ7JrziYdS9Y5oXlS0QDNZlepfG/7n9k3KeFdCyWoJ0cGJ5fHgT31vywpWsdyLD8DvhjG20JUpAOn3pXINtj1/bKKYjCQx3T+VzJj/rZsbour8TETl6tRE1cy2QSd0ey3orBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpFlhTOZ2/Wr3SyXe2tzJJrIn8xF9zIf/vQK3s4gX5w=;
 b=kiANGPSVgNxbWy08E/DhTbEl92tl0mW0QP5ddFoin90NZzuF6gUdlFy0Gi70MAA1nVJvqahR6Tsa4Imfy/C4jY3elNHdj2b8cU2+O4Ij1WKccxFkJfgP+cz20VCtrV4KDsBmPKzVY9cqszXbrKNIG0SXQlKxVYB6f9oxTpzcT4Lkrz7QFOIC7zyJs+mMOgnHwkepyDY6XE2mNjolv5AOQFLnSfdE1w1suxebHP2/Ugxfz9yM+qYrZc+RnUvASwi018o7xt2jGUUzHuWguVcs305ndQ/llAeDEhaOSZLNMxrtTiphygaLlMQl70jkAEXAnB9CiseN3w7DdDbmGeTvaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by BN9PR11MB5401.namprd11.prod.outlook.com (2603:10b6:408:11a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 07:37:20 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b%3]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 07:37:19 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq/AWUSAgAGkBBCAAGFsAIAF9M/ggAChIwCAADi24IABSWKAgABl6ECAAEZHgIABcLAQgAD86oCAAQfUEIAEas2AgAGbU1CAANOWAIAAAN4AgAAASgCAAADJgIAAACaAgAAAiQCAAFefQIAACl6AgAICCrCAALzcgIAABQIAgADEKYCAAD264IAAlRIAgAVz8QA=
Date: Tue, 8 Aug 2023 07:37:19 +0000
Message-ID: <IA0PR11MB718593A011700F06BD6414E8F80DA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <48f22686-2c1b-fd9d-91ba-da6105d410db@redhat.com>
 <ZMj5+7sgkPqHT5Vt@nvidia.com>
 <3427735b-2a73-2df7-ebd9-0d1066a55771@redhat.com>
 <IA0PR11MB7185CF1FDFA5D5EDE3B6AF08F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMlMoRIkPoO0gG3B@nvidia.com>
 <IA0PR11MB7185304345516521FA3005C2F808A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMuaQ4vpv03GTPbF@nvidia.com>
 <2aee6681-f756-9ace-74d8-2f1e1e7b3ae6@redhat.com>
 <87cz0364kx.fsf@nvdebian.thelocal>
 <IA0PR11MB7185974FA204015EA3B74066F809A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMzz2OKbmiD6SKPE@nvidia.com>
In-Reply-To: <ZMzz2OKbmiD6SKPE@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|BN9PR11MB5401:EE_
x-ms-office365-filtering-correlation-id: 5ff6b1ce-da6a-439f-6fcc-08db97e24c17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lhyb8rutqsHy/CkvhxiU0JFiQrLInRBmKsgqsNCl7TnvMCg5lxp8TUY99aAAlFgiztq4vyNEUNGPb58/Ea8pnNa7Lu+j04+1KjgpUnhmJvOIF68Pzzc/62cQrKMdWf8a6jJR6cxJ9sToxquGG463oky3TmBxIenGdtFX1MxmSWR0zC388K9OAGAHlCGy/bMOatXU+0nc3S74rVgYxWX7WcaNMjQgcLLe+mAsHp0P+n6G8RaVyDciPmrRKoXC+yVGw4Q8RLVFLiNN9C/D+5gD2Yi7FPehNXJ4OxwvZJ6A5W0tz32G9JDkkl9nMCTs9j5bx0+A29tJ6MoiIrtcG2K+gceOhsbS5LH1SmFLkFT5zxMEANwGT8JXXgmcfm6TxcblDHqALuFWMggWZviNYBS40Kb5zH89Sd1AaT4OrwLnHAK0CdwykCV+k3QJpvGc+AZ8APEHrqnmw2nfSAAyAR9lp+XQ/re7BL5Urq6wexAWOb8m65R81ICpMJGFa8NFKvztALlxbpNO/OtdacfkgZw/I8/AsFsbsqhmaTJNNoQSHwCyC8GNjFo2a0xf6c5lS0/roiMgM3YpBMn66cKsq0qozboMMGctcpyEZdOeU9UxuSyerIcx9XFM8d6d0WZBJKNQv8JXLFICKqPgaolAU09gTVdlbvfLTgThQc53wXOQyekF2j7lFO/3WKnAITxoKr14
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(346002)(136003)(376002)(39860400002)(90021799007)(451199021)(186006)(1800799003)(90011799007)(2906002)(55016003)(83380400001)(41300700001)(15650500001)(52536014)(5660300002)(8936002)(8676002)(38070700005)(33656002)(86362001)(54906003)(82960400001)(122000001)(478600001)(38100700002)(9686003)(26005)(7696005)(71200400001)(6506007)(66476007)(66946007)(66556008)(66446008)(6916009)(4326008)(64756008)(76116006)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vbWdwH1cKMiPmmVgx6nl6Qga3wIG9TXhn/qXAvh3mn4HEyEzifex+S4KHDLW?=
 =?us-ascii?Q?cELkvQEM0T+NtwT9ybZo8oHIQydw34hUmPcANhJyieu0qybBIclwfynhDlnx?=
 =?us-ascii?Q?R/vJuJ0kzwl00uNwXqo/naDTJfY0LYAiZ58B28qJRk/ZB7AkSFMbOUVurdzK?=
 =?us-ascii?Q?kh2g2lrJSYRqY2FLN9n1DFphUttbkLg3uthlZnAiTFV8KCQeBxvS1lT0TULV?=
 =?us-ascii?Q?sLDQyD3TPqTYP1pqk0TERZNzxF+ht+j3qVy0Sp7AM70dMc6fxDv11bVAJTUf?=
 =?us-ascii?Q?Et29joAc6mUQYntlxia1FH2/tMw7DLKQ+NuycLWBcoI5w/ZpAtCrJWGna9dO?=
 =?us-ascii?Q?DnKc/Rs409KyjaWciIkj9NFMA+vs8P36l7x2WvNShJReZQJ/QeEMVAwUh5pq?=
 =?us-ascii?Q?TCxUp8ofEAwOP+VQYlB/pb52jd4RHUp7C6QroyMJo9Fo+T5x2/lszq1u3qwN?=
 =?us-ascii?Q?Ce/kcDKL2zGdM8zJcLwwbN5z3E/zggNRM+EHPgb6F56PIt7Wm6waxLAeSLXd?=
 =?us-ascii?Q?rILdKhkjKVof/5Oi6x2BY8jvmmP8zBYBq4Uz3TuQZZzma1mw/ikjAipibQuT?=
 =?us-ascii?Q?MQ5VFVgnXI1NrzrX8/Fz5yrQvA/KObuU3Q37xLqde2Fq4Tp2lO4mbQH0aFnh?=
 =?us-ascii?Q?Ltkkvl87rRgLKdyUC4gXwmzUztaXoDd5nEqbrv9KjFcwAmeAxDaLh1GTLSuL?=
 =?us-ascii?Q?7Pv4f5rXNDNZcIclrKYx92JZjJOkhxEkBcXWE7i7uaFE8kHXgcX6ddt6mM84?=
 =?us-ascii?Q?fA04B1NahPQUG4ur/S1PIzMpnrisXyqHpa5wsIQkiv85cRouEya5YUYYwwfE?=
 =?us-ascii?Q?GpCMD9wOUC3GnXTyoReEXRuQ+BiPTflXK3rpi8dwLAgKlm4iV0+LyVq1PrP9?=
 =?us-ascii?Q?8srwJ4XvM8hl4bdJ2nu7435VCXSpyKHpzVEtfim9fnXRwDavVg+1fbsB4DDQ?=
 =?us-ascii?Q?uwsTkKzEcSExCOuhMVlp5/Vxs3h/cAc8tMAxRzgH4vWfScXxQ3NZIAYoCbwh?=
 =?us-ascii?Q?Sro3L23XAV2qrA+Z1y52I/BSH2o+dTb/jmnKI3xKKBwTp45QcNQVChjRQpbs?=
 =?us-ascii?Q?vQUnH9IY2xu2/GyAq8mt38f49/cTyTJTopUUpItJUKucq82JaMIZZBKGGAbg?=
 =?us-ascii?Q?hri/g5ae+Ee3ArFy5+8gRz2S5VSIMjDKQ5VJpRM7nwrZH+U7FsIsfhWtRnWb?=
 =?us-ascii?Q?f/RdgMPnOe9E8VGfXab/XWYXNNtyCBr8CAEzckpxvAvGNVjghxuLOrgA177S?=
 =?us-ascii?Q?K39eplXDoNvGctqiYIiwYkVCYj6avn1LzTHTm7Mwtw5wWFNOb5EzyjcV4/vi?=
 =?us-ascii?Q?Mxcxaj9siinCHt40D7PPyIIIJuG3BrCCAQLDDR/QkTkSd29eCg5L0uVIWhTt?=
 =?us-ascii?Q?w4wB5IifO8BSxFqqDMaKIEPGy4ljG3yBn8jEmdP0TYJmQVWsaVf+Pz5h0x22?=
 =?us-ascii?Q?helAbelkJ9BBuptLMspL3nUP8r41oXY1pEXHD3Zu7XGi9XncowY96fwl0pfi?=
 =?us-ascii?Q?0mgp91J8kvvTbA4uXJG+D3AibpWS7ZpDisLmC/6mMIN0U+MA2Cz/STzvCvUw?=
 =?us-ascii?Q?sLbHEd6e5hcM/B0tDjR1NKGAGVfi4x7zvsMxHULj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff6b1ce-da6a-439f-6fcc-08db97e24c17
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 07:37:19.7618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zz4UbV210ZpLjYE1mt2tbSSNCgfqQq1UDF/pIaqer3Mwb3TI9w1DIAhBAHSUhz5y4xLSod6uVs5HY2U8zsyrYKvPzXhPTscY7GheOR1XzQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5401
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

>=20
> > No, adding HMM_PFN_REQ_WRITE still doesn't help in fixing the issue.
> > Although, I do not have THP enabled (or built-in), shmem does not evict
> > the pages after hole punch as noted in the comment in shmem_fallocate()=
:
>=20
> This is the source of all your problems.
>=20
> Things that are mm-centric are supposed to track the VMAs and changes to
> the PTEs. If you do something in userspace and it doesn't cause the
> CPU page tables to change then it certainly shouldn't cause any mmu
> notifiers or hmm_range_fault changes.
I am not doing anything out of the blue in the userspace. I think the behav=
ior
I am seeing with shmem (where an invalidation event (MMU_NOTIFY_CLEAR)
does occur because of a hole punch but the PTEs don't really get updated)
can arguably be considered an optimization.=20

>=20
> There should still be an invalidation notifier at some point when the
> CPU tables do eventually change, whenever that is. Missing that
> notification would be a bug.
I clearly do not see any notification getting triggered (from both shmem_fa=
ult()
and hugetlb_fault()) when the PTEs do get updated as the hole is refilled
due to writes. Are you saying that there needs to be an invalidation event
(MMU_NOTIFY_CLEAR?) dispatched at this point?

>=20
> > If I force it to read-fault or write-fault (by hacking hmm_pte_need_fau=
lt()),
> > it gets indefinitely stuck in the do while loop in hmm_range_fault().
> > AFAIU, unless there is a way to fault-in zero pages (or any scratch pag=
es)
> > after hole punch that get invalidated because of writes, I do not see h=
ow
> > using hmm_range_fault() can help with my use-case.
>=20
> hmm_range_fault() is the correct API to use if you are working with
> notifiers. Do not hack something together using pin_user_pages.
I noticed that hmm_range_fault() does not seem to be working as expected
given that it gets stuck(hangs) while walking hugetlb pages. Regardless,
as I mentioned above, the lack of notification when PTEs do get updated due
to writes is the crux of the issue here. Therefore, AFAIU, triggering an
invalidation event or some other kind of notification would help in fixing
this issue.

Thanks,
Vivek

>=20
> Jason

