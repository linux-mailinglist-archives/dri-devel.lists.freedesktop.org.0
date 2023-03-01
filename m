Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DA96A7015
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 16:45:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1592F10E2E4;
	Wed,  1 Mar 2023 15:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D53A10E2E4;
 Wed,  1 Mar 2023 15:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677685555; x=1709221555;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HALYZ5RApAHiIybmWCnZ5z7c/iEqci06ilTQtGBRxfQ=;
 b=HGSyrbUMjen15Ils3XBa5CEkhtlbzUI9Uaqm8YIdKni/ghelqmqJ/fR/
 hwmscr/6MSdRZgV7FuJw7XdyhF9tw+pWx9gFywcAz6Zud0L4KJ2MMulz0
 qMVqGwu884NYJqfh0ud1dFPQeXYEPp07eTKaZGouLPoC2Sfi1E9n2+Kwa
 XULllsKqnEw0mEcAr18/uBJxF9nF1I/mgJgbvE2POvH5vQN2VlxRbRaio
 MPT76r64uHadjYRlompSM367IJKMsTOSoGuG4EOULUYoh97N9n/m0ENbE
 enIDsQKxuzI5MdFtJKsVJR1Qr2ZAALTXlc7l/J5j+RM8Fgso20MIcClj9 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420702633"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="420702633"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 07:45:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="848683598"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="848683598"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 01 Mar 2023 07:45:53 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 1 Mar 2023 07:45:52 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 1 Mar 2023 07:45:52 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 1 Mar 2023 07:45:52 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 1 Mar 2023 07:45:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAT1yd+NNsANZeNAvHWr6QcAoz/zhwzZLwIvvyZv5zNyPxKIqGiFoRko/IH8Th5QFPNWjdBa/63t7YOuXZR2rpkuAS8kNoWi4Zpbd8AOqRCoMC+5jlsFceOBpZLC3q0gcKWnIoYJ7T6AaueEsal3ecO/2YPyMaIjUrK7dJhX3oEzZ8zKr+C+NJvjGygwLwD4t1hrklHSoAPKAKm5FDaaFE/QSFPz7LwxCHx5l4On04zsYY1anucxbZ1wPbeuL6php4UxvH+HQqzXxE4a9lzZJeutn9GgZdDqTg0dUceQlDgmk0hAMrljznagH2E82HgIIZPej7c99L2cT3T02/v28Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUWM0jV50k+2EWjTOAeN9KaA9fVzNHWerwgJtkq6yko=;
 b=hTra7rI36aZwK2itj5AariynuqVfUkYqumLfgbAHadPKwaLyVNp6Pm7ut01SJ5hdxwZIxMmYtwGc3r2xgAJS/SRUkPvtmZ7rW1txiTIx8kcGStDJ4jLkJdWb1gZoSkz+p3aDo/vXPcRrh1JFyQ3w1LTatwSrdps2LEh6reJ2MQbZMlHzC0N976+MB6UgqyltkvfTJBP08axjh7GaiXssXmhcMERd5yQw3RyMvGIzl42XSVCAy8+MQPgHbbKiQ9nOtHepahLpogp43mcPD7rpJgwG6URDHtXovoQRVTaaIbL+DCs2sMtBVMkA+EKT9m8yF5LUMjlI2csNyPGAhDPR6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN6PR11MB8244.namprd11.prod.outlook.com (2603:10b6:208:470::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Wed, 1 Mar
 2023 15:45:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6134.027; Wed, 1 Mar 2023
 15:45:46 +0000
Date: Wed, 1 Mar 2023 10:45:40 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
Message-ID: <Y/9zJNO+reFI1FvG@intel.com>
References: <20230224112630.313d7b76@eldfell>
 <a47e2686-1e35-39a3-0f0c-6c3b9522f8ff@linux.intel.com>
 <20230224122403.6a088da1@eldfell>
 <582a9b92-d246-fce2-cf39-539d9a2db17f@linux.intel.com>
 <20230224130053.3f8939e2@eldfell>
 <c5d046d6-ab8e-2bc7-5110-dba78b91348b@linux.intel.com>
 <74e409dc-b642-779e-a755-b793c378e43a@amd.com>
 <CAF6AEGs_yzEj81yNP3KhmVP9Yo3rwTc5vntEVrm9tHw6+w1G_g@mail.gmail.com>
 <Y/0iM+ycUozaVbbC@intel.com>
 <CAF6AEGtXSEyyjELjGtPvnAN7mX+NwzngmB0PbKHsZqjTm-xYsg@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAF6AEGtXSEyyjELjGtPvnAN7mX+NwzngmB0PbKHsZqjTm-xYsg@mail.gmail.com>
X-ClientProxiedBy: BY5PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:180::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN6PR11MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: 6649e655-3713-4220-252d-08db1a6c05ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MoPPaYUlPBQi8owykp8OjHiRbuEQ1u9RTM2tGcQYdnKwQy4sfoupXN3Rv7LqVXkLYqQMR9Q6L9xR4miYBCNoLvSRB5EV19KLiiECjd9B6sNhqwMF1qnw4hxJzDpBq7uP2m8lUl9rjIueHDJTI27xj+s8qivXpTfwE4eHeNthD2T1dYw5qFqa8xyOBJaeO/pwShBodMyYGDOg9NJFOJWpGUoD/OF7r4Zac81nU3ZE0oS/1bBiiFyoeCDe9LW6J4iwFlRvnIhbzHhoT610zu6jz9xGPhhVX8kdZMCFWxMjvdIp6Wo2hM5mGh/vmfv4o7XI/+luA8V1ZHPyzMd5rwgDBK1PQ/0D1JapXHoNxpTTq3rRGqD6Fa01TnAmm1Wmb7y61JThYTTlfZjowfu4AqYmyQy7uWXHd3KiUjIONut1yeD+769vLXEmc1B7vPRWoeUwcY8ZcFxoH65Ez4AdEph3ugURafJyvt3rw1Z1tZh3duhQVvaSs1zYn93ufkUKo/OHyGSJnqUw8HajIRtPqZknuHNqea46d3bl5659YAaTcVyGd6jSxhV54aRZyiuqGDD8WeR5Gg2BC+HKg/Bpaj7HpLhQqHj+d74E4RXpkDH2NRG1aexEuivKPZ2bIQtmSHDin7bUyMwrZ5loSXRQITZrMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199018)(66899018)(36756003)(66556008)(66476007)(86362001)(44832011)(66946007)(5660300002)(8676002)(6916009)(4326008)(7416002)(2906002)(82960400001)(8936002)(38100700002)(41300700001)(6486002)(6666004)(54906003)(316002)(478600001)(83380400001)(186003)(6512007)(2616005)(6506007)(53546011)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/hFHDlruugQsebWWQc0VCtmh/gGcQIaJUGdVf762AT7uQVEZs9MAqRYcM63R?=
 =?us-ascii?Q?1vrdsc1sq+5LpzAQ4Kc+FM/wZbUq4Mq/KOJ/JXZ2HbZ7qtVvbhFQNGO9fSCp?=
 =?us-ascii?Q?GTbJbz/YyLiVHejr8EeKYa8H86IJmHAlDEz30yp7+YB0f7jN5iD+oUNmnXqP?=
 =?us-ascii?Q?hy4eN/Rgul7U1kg76I3WPalVWEqZ/RnRs3JVSxn1oXMTXoa+OyijaqpNOcZs?=
 =?us-ascii?Q?T3OfeLz26rrX7e1DwsRRz9m4HvdXFI03nxPNvt7+Fc68ZgH/CuIMv59ATbpT?=
 =?us-ascii?Q?jRvYaI49Q/E0N1KUUBlYfV/T6o7BYj9oKhdX0nC/QhU3ywtr6+fxPzUiL0ww?=
 =?us-ascii?Q?77HSONGgwL7QIeq1pOVDc70TDrz2/wjkppACcvx9owGV/521geFV5BErSku3?=
 =?us-ascii?Q?LTK4eN5pwviHHS7T9zMn0RT2n1aiTCrJhhYFxY48EIax8s8Gy9kht1Ipn74K?=
 =?us-ascii?Q?4K9WizzL78SO97/WPLupgASugqQWxFU7WKTS2LaX61gcq2gfmE0L/kH/fZHi?=
 =?us-ascii?Q?++A250igEyRkjF7e7l3GNnNyH5j6M8ckeVYowNdM6RiHIhvGraZOQtl9cjwN?=
 =?us-ascii?Q?spFBWBntBdfBNKJPiHftap2V88WqZFcAi4d4JIA/9HB8ISx4aKEWLpYsVfNq?=
 =?us-ascii?Q?ZDQY2DF5bqxLlC4DjWLC9e/hBQuU9h1K+HVD87TxKPoHp0XYSbsDwNDH6LFF?=
 =?us-ascii?Q?j8AiPmXWbB8qP9XscHTpTKyr60XQH1Plo+U2rmTs4BZqYPRtojgkAUj7gA8V?=
 =?us-ascii?Q?Qn2P8qQMtaSUpE0gFqL1jmEbmJNmZXMWIstS0UQcAnm62fWmKetvNtb8RVUG?=
 =?us-ascii?Q?jPXgy8SeHuBMzLrfdD3dvtPrH3fEHDzFbWzY8iOrR09u2iTLrH2guyRcHLHb?=
 =?us-ascii?Q?MQfDRP7Lu3TXs/g9Yt4/oB03IFzFpQtFgWncK63RHqT5tixM/81N1uYRGS+P?=
 =?us-ascii?Q?CGmxypcEYjTCUZjCRVl9GwUeiJJAymTx4r1Db54xt+H4JEgDU61XpvLKk3dX?=
 =?us-ascii?Q?OoROQm++bj0sjUDFukQVeEy9GZQ6s68I6VmXi5CMCQjBYS3MZeMxBmrKv6HJ?=
 =?us-ascii?Q?Gzi+Xcm6nUQJswT1JaIMizMPxiqh+MUJ6X/fskIPwS2YesXkgcZES0+j8Tgt?=
 =?us-ascii?Q?CSo1NGtT7IrrrBCU0sstV/Ikru8HmwHpADjwisSIFngDP9VTFG3ResD3YXOc?=
 =?us-ascii?Q?aMIeaAvX5Ff/ecYgdK5/R2nIF3+Sp18tYUPILVMz8a9Lq6+mOBi+MgOBvpfA?=
 =?us-ascii?Q?84qTcm0kax0+1kjUqwKQT8O4DZQSqS7CC5K9D/aMBdwVbfcNRSqThQjnmuy5?=
 =?us-ascii?Q?0SyDM85QSFgR/Y3o3e0GD7y3cf+jBvEpZun7arZJLmBz2sS0J43oqOYj27zG?=
 =?us-ascii?Q?cU/zrEOmnEYXBEFk0rQwyczE1sBDTYzGBqOFUwhh5UrH1+718NxwnSCH/gM4?=
 =?us-ascii?Q?4MVAPWReg4hX5lrhjQKsWlhc3ZnNpKl9ikfeVUOee5VAHqTBG1+Y4LPFlCuY?=
 =?us-ascii?Q?jlchh21mbPlajNWpBsHFBZjXfZvlFA3jfcPZlaHUxh2RmP+CxeNlpUojVQsD?=
 =?us-ascii?Q?sgW/JdiNWVfDUgT0Y32OqO82My2v7W3EQdPZosD+knGVKTLBIDGPufQBf1+1?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6649e655-3713-4220-252d-08db1a6c05ca
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 15:45:46.4761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y9pm502xMLinOMbxF9+QNYjCpI5r4zei0Qhz97CbbWnhck5iG4GwUGm49qvA+Wx47OlvUcj4r7YBZL7CE+B1Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8244
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
Cc: Rob
 Clark <robdclark@chromium.org>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 27, 2023 at 02:20:04PM -0800, Rob Clark wrote:
> On Mon, Feb 27, 2023 at 1:36 PM Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> >
> > On Fri, Feb 24, 2023 at 09:59:57AM -0800, Rob Clark wrote:
> > > On Fri, Feb 24, 2023 at 7:27 AM Luben Tuikov <luben.tuikov@amd.com> wrote:
> > > >
> > > > On 2023-02-24 06:37, Tvrtko Ursulin wrote:
> > > > >
> > > > > On 24/02/2023 11:00, Pekka Paalanen wrote:
> > > > >> On Fri, 24 Feb 2023 10:50:51 +0000
> > > > >> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> > > > >>
> > > > >>> On 24/02/2023 10:24, Pekka Paalanen wrote:
> > > > >>>> On Fri, 24 Feb 2023 09:41:46 +0000
> > > > >>>> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> > > > >>>>
> > > > >>>>> On 24/02/2023 09:26, Pekka Paalanen wrote:
> > > > >>>>>> On Thu, 23 Feb 2023 10:51:48 -0800
> > > > >>>>>> Rob Clark <robdclark@gmail.com> wrote:
> > > > >>>>>>
> > > > >>>>>>> On Thu, Feb 23, 2023 at 1:38 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > > > >>>>>>>>
> > > > >>>>>>>> On Wed, 22 Feb 2023 07:37:26 -0800
> > > > >>>>>>>> Rob Clark <robdclark@gmail.com> wrote:
> > > > >>>>>>>>
> > > > >>>>>>>>> On Wed, Feb 22, 2023 at 1:49 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > > > >>>>>>
> > > > >>>>>> ...
> > > > >>>>>>
> > > > >>>>>>>>>> On another matter, if the application uses SET_DEADLINE with one
> > > > >>>>>>>>>> timestamp, and the compositor uses SET_DEADLINE on the same thing with
> > > > >>>>>>>>>> another timestamp, what should happen?
> > > > >>>>>>>>>
> > > > >>>>>>>>> The expectation is that many deadline hints can be set on a fence.
> > > > >>>>>>>>> The fence signaller should track the soonest deadline.
> > > > >>>>>>>>
> > > > >>>>>>>> You need to document that as UAPI, since it is observable to userspace.
> > > > >>>>>>>> It would be bad if drivers or subsystems would differ in behaviour.
> > > > >>>>>>>>
> > > > >>>>>>>
> > > > >>>>>>> It is in the end a hint.  It is about giving the driver more
> > > > >>>>>>> information so that it can make better choices.  But the driver is
> > > > >>>>>>> even free to ignore it.  So maybe "expectation" is too strong of a
> > > > >>>>>>> word.  Rather, any other behavior doesn't really make sense.  But it
> > > > >>>>>>> could end up being dictated by how the hw and/or fw works.
> > > > >>>>>>
> > > > >>>>>> It will stop being a hint once it has been implemented and used in the
> > > > >>>>>> wild long enough. The kernel userspace regression rules make sure of
> > > > >>>>>> that.
> > > > >>>>>
> > > > >>>>> Yeah, tricky and maybe a gray area in this case. I think we eluded
> > > > >>>>> elsewhere in the thread that renaming the thing might be an option.
> > > > >>>>>
> > > > >>>>> So maybe instead of deadline, which is a very strong word, use something
> > > > >>>>> along the lines of "present time hint", or "signalled time hint"? Maybe
> > > > >>>>> reads clumsy. Just throwing some ideas for a start.
> > > > >>>>
> > > > >>>> You can try, but I fear that if it ever changes behaviour and
> > > > >>>> someone notices that, it's labelled as a kernel regression. I don't
> > > > >>>> think documentation has ever been the authoritative definition of UABI
> > > > >>>> in Linux, it just guides drivers and userspace towards a common
> > > > >>>> understanding and common usage patterns.
> > > > >>>>
> > > > >>>> So even if the UABI contract is not documented (ugh), you need to be
> > > > >>>> prepared to set the UABI contract through kernel implementation.
> > > > >>>
> > > > >>> To be the devil's advocate it probably wouldn't be an ABI regression but
> > > > >>> just an regression. Same way as what nice(2) priorities mean hasn't
> > > > >>> always been the same over the years, I don't think there is a strict
> > > > >>> contract.
> > > > >>>
> > > > >>> Having said that, it may be different with latency sensitive stuff such
> > > > >>> as UIs though since it is very observable and can be very painful to users.
> > > > >>>
> > > > >>>> If you do not document the UABI contract, then different drivers are
> > > > >>>> likely to implement it differently, leading to differing behaviour.
> > > > >>>> Also userspace will invent wild ways to abuse the UABI if there is no
> > > > >>>> documentation guiding it on proper use. If userspace or end users
> > > > >>>> observe different behaviour, that's bad even if it's not a regression.
> > > > >>>>
> > > > >>>> I don't like the situation either, but it is what it is. UABI stability
> > > > >>>> trumps everything regardless of whether it was documented or not.
> > > > >>>>
> > > > >>>> I bet userspace is going to use this as a "make it faster, make it
> > > > >>>> hotter" button. I would not be surprised if someone wrote a LD_PRELOAD
> > > > >>>> library that stamps any and all fences with an expired deadline to
> > > > >>>> just squeeze out a little more through some weird side-effect.
> > > > >>>>
> > > > >>>> Well, that's hopefully overboard in scaring, but in the end, I would
> > > > >>>> like to see UABI documented so I can have a feeling of what it is for
> > > > >>>> and how it was intended to be used. That's all.
> > > > >>>
> > > > >>> We share the same concern. If you read elsewhere in these threads you
> > > > >>> will notice I have been calling this an "arms race". If the ability to
> > > > >>> make yourself go faster does not required additional privilege I also
> > > > >>> worry everyone will do it at which point it becomes pointless. So yes, I
> > > > >>> do share this concern about exposing any of this as an unprivileged uapi.
> > > > >>>
> > > > >>> Is it possible to limit access to only compositors in some sane way?
> > > > >>> Sounds tricky when dma-fence should be disconnected from DRM..
> > > > >>
> > > > >> Maybe it's not that bad in this particular case, because we are talking
> > > > >> only about boosting GPU clocks which benefits everyone (except
> > > > >> battery life) and it does not penalize other programs like e.g.
> > > > >> job priorities do.
> > > > >
> > > > > Apart from efficiency that you mentioned, which does not always favor
> > > > > higher clocks, sometimes thermal budget is also shared between CPU and
> > > > > GPU. So more GPU clocks can mean fewer CPU clocks. It's really hard to
> > > > > make optimal choices without the full coordination between both schedulers.
> > > > >
> > > > > But that is even not the main point, which is that if everyone sets the
> > > > > immediate deadline then having the deadline API is a bit pointless. For
> > > > > instance there is a reason negative nice needs CAP_SYS_ADMIN.
> > > > >
> > > > > However Rob has also pointed out the existence of uclamp.min via
> > > > > sched_setattr which is unprivileged and can influence frequency
> > > > > selection in the CPU world, so I conceded on that point. If CPU world
> > > > > has accepted it so can we I guess.
> > > > >
> > > > > So IMO we are back to whether we can agree defining it is a hint is good
> > > > > enough, be in via the name of the ioctl/flag itself or via documentation.
> > > > >
> > > > >> Drivers are not going to use the deadline for scheduling priorities,
> > > > >> right? I don't recall seeing any mention of that.
> > > > >>
> > > > >> ...right?
> > > > >
> > > > > I wouldn't have thought it would be beneficial to preclude that, or
> > > > > assume what drivers would do with the info to begin with.
> > > > >
> > > > > For instance in i915 we almost had a deadline based scheduler which was
> > > > > much fairer than the current priority sorted fifo and in an ideal world
> > > > > we would either revive or re-implement that idea. In which case
> > > > > considering the fence deadline would naturally slot in and give true
> > > > > integration with compositor deadlines (not just boost clocks and pray it
> > > > > helps).
> > > > How is user-space to decide whether to use ioctl(SET_DEADLINE) or
> > > > poll(POLLPRI)?
> > >
> > > Implementation of blocking gl/vk/cl APIs, like glFinish() would use
> > > poll(POLLPRI).  It could also set an immediate deadline and then call
> > > poll() without POLLPRI.
> > >
> > > Other than compositors which do frame-pacing I expect the main usage
> > > of either of these is mesa.
> >
> > Okay, so it looks like we already agreed that having a way to bump frequency
> > from userspace is acceptable. either because there are already other ways
> > that you can waste power and because this already acceptable in the CPU
> > world.
> >
> > But why we are doing this in hidden ways then?
> >
> > Why can't we have this hint per context that is getting executed?
> > (either with a boost-context flag or with some low/med/max or '-1' to '1'
> > value like the latency priority)?
> >
> > I don't like the waitboost because this heurisitic fails in some media cases.
> > I don't like the global setting because we might be alternating a top-priority
> > with low-priority cases...
> >
> > So, why not something per context in execution?
> >
> 
> It needs to be finer granularity than per-context, because not all
> waits should trigger boosting.  For example, virglrenderer ends up
> with a thread polling unsignaled fences to know when to signal an
> interrupt to the guest virtgpu.  This alone shouldn't trigger
> boosting.  (We also wouldn't want to completely disable boosting for
> virglrenderer.)  Or the usermode driver could be waiting on a fence to
> know when to do some cleanup.
> 
> That is not to say that there isn't room for per-context flags to
> disable/enable boosting for fences created by that context, meaning it
> could be an AND operation for i915 if it needs to be.

Right. It can be both ways I agree.

> 
> BR,
> -R
