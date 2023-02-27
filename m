Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C83B6A4D52
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 22:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8221C10E3E4;
	Mon, 27 Feb 2023 21:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B74310E3E4;
 Mon, 27 Feb 2023 21:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677533768; x=1709069768;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T8JLc/GHdW60Ht8g76hZ7Lk0ykI8hJq75LktnPtvMrA=;
 b=nAMrH/qFr4txCDOg0yt5PAjMo83g0VCkZhBVh21LpjedYgGWonvJ1gtC
 V+XyD7d4a6AkM4DIZ30106ydguzovKbFDTY0WJTCcKh9i+u1QgShP5Kyz
 FhIgyC1U3GYOeAPC7Z9/nvBnacndzgcSnsBrUjo6Speh2plEik2aYRdxl
 sHBk1dEa7wOa2t8iaknDSvEpGuPuHD1ODxjqMQOgxULqBTuStxmAEqKAK
 33PByM/w6qOi2bxQG310S5xi3vxZmkFAX+KKJHnA2cDIs5feEcJlyjayS
 mSqWkdmpG4c00N8avxdQEw8afzvPzlbqjVA4juogipOvIgpzAITMrPfzI Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="322222137"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="322222137"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 13:36:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="673880320"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="673880320"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 27 Feb 2023 13:35:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 13:35:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 27 Feb 2023 13:35:58 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 27 Feb 2023 13:35:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOgcXy+PEX+18yHgGy8QxBcL/YxpmeK4ANUBUYjO1qE8oPMvvE+Q34DY3uBwgV5GoE4A/o9hNYLKCWYiagjfREn4UgA4sEUS76li9srxQGF1EjGXj6F+DkSro39dRy2belP/Pd5NPB8jKVUEoNmBcR50ev2EN32ETL3hg6cwQEAH/FD/KVmiD4Mf4SjCEgY+wzVPq2U9Pj0SONrcdsJKAVTxs1cyTUhix0bySZeANutaWRsH2SlJ30sdtj/b30JV41DiEQQ9zPRv0oH7SRXA4N2OjgPuJTcDgoFx7/zpbiJdyQp2qBa/YZ5H08d/OAXi6zivXYmLBsMIM2MqAYYmlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0DJktiPSZ7ozvr1FpHYUmp9y7nvWk+KXVgmtJcMkvU=;
 b=OwwscRqauoYdQf7av+WMO91zmx/7IDM2mUo1zcwm7vxYiy8yRK3eTeoty3e6LSX637x1RQ99K+KgNM2OMSpqtY9w9lOu2C6K5a2NvYa07Kxs2Ci7ww+N+LJsY1jTuU6/IWonIrixWnxH4oSl/HoOhvrgTbZ0iRduC3NLiWljfU5gtHSZWJed9EsmM0otyatxaDETiiB0brpzGj4Bp/zxt7i8RtLD1M/jq3woyz0LnLBwa73oDx7lgCSa662Wnz+WR8kq/0vl8PT+0NKbTUyWmM9Wap9Ma/ZkiqxAvfA/8zUVd32TzoG3G2kBD99flAD46EMUHRUs1cInDeYNN3lLzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7516.namprd11.prod.outlook.com (2603:10b6:510:275::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 21:35:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 21:35:54 +0000
Date: Mon, 27 Feb 2023 16:35:47 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
Message-ID: <Y/0iM+ycUozaVbbC@intel.com>
References: <20230223113814.3010cedc@eldfell>
 <CAF6AEGuE89kuKTjjzwW1xMppcVw-M4-hcrtifed-mvsCA=cshQ@mail.gmail.com>
 <20230224112630.313d7b76@eldfell>
 <a47e2686-1e35-39a3-0f0c-6c3b9522f8ff@linux.intel.com>
 <20230224122403.6a088da1@eldfell>
 <582a9b92-d246-fce2-cf39-539d9a2db17f@linux.intel.com>
 <20230224130053.3f8939e2@eldfell>
 <c5d046d6-ab8e-2bc7-5110-dba78b91348b@linux.intel.com>
 <74e409dc-b642-779e-a755-b793c378e43a@amd.com>
 <CAF6AEGs_yzEj81yNP3KhmVP9Yo3rwTc5vntEVrm9tHw6+w1G_g@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAF6AEGs_yzEj81yNP3KhmVP9Yo3rwTc5vntEVrm9tHw6+w1G_g@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0141.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: 655974d1-cf1e-4b31-de41-08db190a9ae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pf/Fd/nRh7KYtbMtnzCMpwEjqZ14mIyGdx48mfFFKa2G390WPjiO9szk+M/xJokro1OJGiimnWIn1DZs/Zud8/rEXwFyjT7JLTH8W9FumwBGjkgs0sfoTFqcKimUUAVbhckUEFK+fDVMRS9CSEtG/cvZ4OwsHKKac863NeboC5p5eCChqyNKF9CTJOYb/G0sRxbgJM2gqE/NH2xR2/PbzBTvcqnETkqOArCxwYblLewrBAfsCAN/ggyupUwincnLFdCIEyX47XNdwh6M6/aJFr4kWyFpaJC82RyyRIucMMGbFQgdutDy3PXVMhpN6UZbbAfJXASfIy/yTlPXYFR7pYb42LqPzVfAAZCJ62XziMe6dnMT1XW6l2FlW3jDf5t37jY8BJtVXKVhnLT8L24i2HGmJlWkocGT3tYgfhGuV8JVSv+IQ8LG3FAJeE8FSFe6rimmBVEtbvngo0RxgoFNA/kBe7+GTFf0EsjLuW5zrgJUcBym4v88XwATXUCvonIhP3zzztnYBBszOe5dYn5pISVBZ3dOJTKO/oQs9soBY+FZRsALyJG4GQnQ61VK5Cos09YPrx3+UyaFj1fBu26jdan8XyAH4Q4HJXQ2Dk3yJsevBK4Eb1J8DjBF47RSWIur91YCMu8NFEOzusGVxxLJjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199018)(66899018)(83380400001)(316002)(54906003)(36756003)(82960400001)(4326008)(38100700002)(8676002)(6916009)(53546011)(6506007)(186003)(2616005)(6512007)(26005)(6666004)(6486002)(5660300002)(66556008)(86362001)(66946007)(478600001)(66476007)(7416002)(44832011)(8936002)(2906002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2uJAc62M6XmHoUrZdu8YYt3xSVRf8sx9ivlTTLEoeFhDrQx7nkQ3yvFYx3mc?=
 =?us-ascii?Q?a4/kxpIdbOfEtgfcI43enW9uDp79d+IBu/VjFo32Vfm1ouGYGtZYk2rAbTut?=
 =?us-ascii?Q?xcv25fyy6bpRk5cC8tF/t5DMusCo5u5zTkFYvYQYYIFJII2FbCIAFdoetu/2?=
 =?us-ascii?Q?KVgU1tzGz7fRZcfQ6dP9xmq0Ig14wYcYjBD0rKkTprRK5nxXCDejzAvyUNNY?=
 =?us-ascii?Q?eri7n2khNw8W7GwqH7HLYK123hkna88DsjdcF5h21ZCBDHd/5sDzokylcHZ6?=
 =?us-ascii?Q?Op/alPIX/GWT2sPVHcqEEHIbsHxTQKLh1PRNG1KfI5OBvHSDiXQ7lmIDPHmY?=
 =?us-ascii?Q?awPNJS++H19/DngnoOi7+4VxISyWjDWZ1YolbGI2iQoCkczhyU8NbHvZ5zju?=
 =?us-ascii?Q?ui9Dt3fK6l8vNyAkZDAK9V/lnGkprQc/EgvX0pl2U2vm6C7Af2CrOr/XunaM?=
 =?us-ascii?Q?DovU5rQdcCPUrIVpPJG/Zs3BrilwxBOjh5NSNRlBv/P6nuiU45u9/gXV1qtK?=
 =?us-ascii?Q?U69TF8XNqTa0vzmFExcytVSBgigtaR2UjVR1oCBqTc1zAHt4N6r0N9PyfpdK?=
 =?us-ascii?Q?YI+tqY4xzhlZgxVZ146SsBC4nJWRMWUZITVMzS9olOkCdKSF4vdoqo7MauBu?=
 =?us-ascii?Q?6ITtdMlLw6BW1KIWUfR6CIj6r21tvOWkia/rqih+5ue9hUNOae/Yn5PJd1nb?=
 =?us-ascii?Q?0S94bwnq9zCsZYkbmTWyD+yl/EwJ8pz2ix73QOrVEskRQvnwNGIPAWXBmm09?=
 =?us-ascii?Q?nBC8OnmRL7k/L/+g+9z0GfgCchNdpsUwqAVxC0eVd9TKTd9c8MPXuhrX3d9n?=
 =?us-ascii?Q?yUwmfz5iXM6BtmagGILZVdD91QbXgU18BRAu9oQckE4m4A7IXSdq2r5ynv+x?=
 =?us-ascii?Q?4kt440p59Qijc1GLH6nGYkWbe+CMOv2dMcfGquFD2Xndok1nfbrdOL8Tjsxm?=
 =?us-ascii?Q?XvX6QFMRN4UPZ9H9fHr7Ti0ZQrWSC3nK9hq1zvo98baW1b3d0boXOHfuKpZ6?=
 =?us-ascii?Q?KiFJiTWFEhfnpynww7RsmhV4prHfeVg87OhICnFw6g5Dl5hTE1HfnSm6mG8b?=
 =?us-ascii?Q?7/8JbFzS1hNEO2UfiLeydwjh2yWJtUjINHiQDifp/weWFMrnZCn+8T4qXRZu?=
 =?us-ascii?Q?Qil3zcnsniWexdjBL2Cs087K/WdUk4sctwR2lgiMJLEzoLmMYhK/bA1vYWXX?=
 =?us-ascii?Q?lBebdwKD7wm/8ES4KqoaR8qgW6lAFeepwhtwAneF+DnJOp7qsjjdDCPMZ6+E?=
 =?us-ascii?Q?liby7DtKbRGvS+hIJKgFu9NHlMGT2UOl6qvI4jmyKGqme81YswkwAmEtLhNs?=
 =?us-ascii?Q?wFb8q84xbHSrJoWx3uFSZge+X/uLBZ3u4ggir8uQJ/B0DaaGvyy4NrVyVvbC?=
 =?us-ascii?Q?mW53VuPW30QFqxSEeMfNcmKzXKgQ5suGcww6q2BzLXjxXAuphAELeQMMwRbR?=
 =?us-ascii?Q?hBFHZPER+/C8yNy91sktW79/iXAVL2KwB5lD20rrHDMKXVsHMnnZS65hk+3M?=
 =?us-ascii?Q?5+ul0Rk120AIDYNPXo3P7eeTfmbDz5cc11kB3Fg14OJ9YP4xYSgAaHzFa4bo?=
 =?us-ascii?Q?vJt3ej12Xrz8BsNvdt9hELPlD8RfIH9tx35dMNA7e2jx4/nD4o5tjEQbRXTE?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 655974d1-cf1e-4b31-de41-08db190a9ae5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 21:35:54.5630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4+LinLNDQPg22EkXcUJ/2whKTe3eOBTiEXnM2d9QZxQyO1D4B/9+J7QMVHJWjeOW2bGI2JXWNgZ1RjZEGZc9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7516
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

On Fri, Feb 24, 2023 at 09:59:57AM -0800, Rob Clark wrote:
> On Fri, Feb 24, 2023 at 7:27 AM Luben Tuikov <luben.tuikov@amd.com> wrote:
> >
> > On 2023-02-24 06:37, Tvrtko Ursulin wrote:
> > >
> > > On 24/02/2023 11:00, Pekka Paalanen wrote:
> > >> On Fri, 24 Feb 2023 10:50:51 +0000
> > >> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> > >>
> > >>> On 24/02/2023 10:24, Pekka Paalanen wrote:
> > >>>> On Fri, 24 Feb 2023 09:41:46 +0000
> > >>>> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> > >>>>
> > >>>>> On 24/02/2023 09:26, Pekka Paalanen wrote:
> > >>>>>> On Thu, 23 Feb 2023 10:51:48 -0800
> > >>>>>> Rob Clark <robdclark@gmail.com> wrote:
> > >>>>>>
> > >>>>>>> On Thu, Feb 23, 2023 at 1:38 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >>>>>>>>
> > >>>>>>>> On Wed, 22 Feb 2023 07:37:26 -0800
> > >>>>>>>> Rob Clark <robdclark@gmail.com> wrote:
> > >>>>>>>>
> > >>>>>>>>> On Wed, Feb 22, 2023 at 1:49 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >>>>>>
> > >>>>>> ...
> > >>>>>>
> > >>>>>>>>>> On another matter, if the application uses SET_DEADLINE with one
> > >>>>>>>>>> timestamp, and the compositor uses SET_DEADLINE on the same thing with
> > >>>>>>>>>> another timestamp, what should happen?
> > >>>>>>>>>
> > >>>>>>>>> The expectation is that many deadline hints can be set on a fence.
> > >>>>>>>>> The fence signaller should track the soonest deadline.
> > >>>>>>>>
> > >>>>>>>> You need to document that as UAPI, since it is observable to userspace.
> > >>>>>>>> It would be bad if drivers or subsystems would differ in behaviour.
> > >>>>>>>>
> > >>>>>>>
> > >>>>>>> It is in the end a hint.  It is about giving the driver more
> > >>>>>>> information so that it can make better choices.  But the driver is
> > >>>>>>> even free to ignore it.  So maybe "expectation" is too strong of a
> > >>>>>>> word.  Rather, any other behavior doesn't really make sense.  But it
> > >>>>>>> could end up being dictated by how the hw and/or fw works.
> > >>>>>>
> > >>>>>> It will stop being a hint once it has been implemented and used in the
> > >>>>>> wild long enough. The kernel userspace regression rules make sure of
> > >>>>>> that.
> > >>>>>
> > >>>>> Yeah, tricky and maybe a gray area in this case. I think we eluded
> > >>>>> elsewhere in the thread that renaming the thing might be an option.
> > >>>>>
> > >>>>> So maybe instead of deadline, which is a very strong word, use something
> > >>>>> along the lines of "present time hint", or "signalled time hint"? Maybe
> > >>>>> reads clumsy. Just throwing some ideas for a start.
> > >>>>
> > >>>> You can try, but I fear that if it ever changes behaviour and
> > >>>> someone notices that, it's labelled as a kernel regression. I don't
> > >>>> think documentation has ever been the authoritative definition of UABI
> > >>>> in Linux, it just guides drivers and userspace towards a common
> > >>>> understanding and common usage patterns.
> > >>>>
> > >>>> So even if the UABI contract is not documented (ugh), you need to be
> > >>>> prepared to set the UABI contract through kernel implementation.
> > >>>
> > >>> To be the devil's advocate it probably wouldn't be an ABI regression but
> > >>> just an regression. Same way as what nice(2) priorities mean hasn't
> > >>> always been the same over the years, I don't think there is a strict
> > >>> contract.
> > >>>
> > >>> Having said that, it may be different with latency sensitive stuff such
> > >>> as UIs though since it is very observable and can be very painful to users.
> > >>>
> > >>>> If you do not document the UABI contract, then different drivers are
> > >>>> likely to implement it differently, leading to differing behaviour.
> > >>>> Also userspace will invent wild ways to abuse the UABI if there is no
> > >>>> documentation guiding it on proper use. If userspace or end users
> > >>>> observe different behaviour, that's bad even if it's not a regression.
> > >>>>
> > >>>> I don't like the situation either, but it is what it is. UABI stability
> > >>>> trumps everything regardless of whether it was documented or not.
> > >>>>
> > >>>> I bet userspace is going to use this as a "make it faster, make it
> > >>>> hotter" button. I would not be surprised if someone wrote a LD_PRELOAD
> > >>>> library that stamps any and all fences with an expired deadline to
> > >>>> just squeeze out a little more through some weird side-effect.
> > >>>>
> > >>>> Well, that's hopefully overboard in scaring, but in the end, I would
> > >>>> like to see UABI documented so I can have a feeling of what it is for
> > >>>> and how it was intended to be used. That's all.
> > >>>
> > >>> We share the same concern. If you read elsewhere in these threads you
> > >>> will notice I have been calling this an "arms race". If the ability to
> > >>> make yourself go faster does not required additional privilege I also
> > >>> worry everyone will do it at which point it becomes pointless. So yes, I
> > >>> do share this concern about exposing any of this as an unprivileged uapi.
> > >>>
> > >>> Is it possible to limit access to only compositors in some sane way?
> > >>> Sounds tricky when dma-fence should be disconnected from DRM..
> > >>
> > >> Maybe it's not that bad in this particular case, because we are talking
> > >> only about boosting GPU clocks which benefits everyone (except
> > >> battery life) and it does not penalize other programs like e.g.
> > >> job priorities do.
> > >
> > > Apart from efficiency that you mentioned, which does not always favor
> > > higher clocks, sometimes thermal budget is also shared between CPU and
> > > GPU. So more GPU clocks can mean fewer CPU clocks. It's really hard to
> > > make optimal choices without the full coordination between both schedulers.
> > >
> > > But that is even not the main point, which is that if everyone sets the
> > > immediate deadline then having the deadline API is a bit pointless. For
> > > instance there is a reason negative nice needs CAP_SYS_ADMIN.
> > >
> > > However Rob has also pointed out the existence of uclamp.min via
> > > sched_setattr which is unprivileged and can influence frequency
> > > selection in the CPU world, so I conceded on that point. If CPU world
> > > has accepted it so can we I guess.
> > >
> > > So IMO we are back to whether we can agree defining it is a hint is good
> > > enough, be in via the name of the ioctl/flag itself or via documentation.
> > >
> > >> Drivers are not going to use the deadline for scheduling priorities,
> > >> right? I don't recall seeing any mention of that.
> > >>
> > >> ...right?
> > >
> > > I wouldn't have thought it would be beneficial to preclude that, or
> > > assume what drivers would do with the info to begin with.
> > >
> > > For instance in i915 we almost had a deadline based scheduler which was
> > > much fairer than the current priority sorted fifo and in an ideal world
> > > we would either revive or re-implement that idea. In which case
> > > considering the fence deadline would naturally slot in and give true
> > > integration with compositor deadlines (not just boost clocks and pray it
> > > helps).
> > How is user-space to decide whether to use ioctl(SET_DEADLINE) or
> > poll(POLLPRI)?
> 
> Implementation of blocking gl/vk/cl APIs, like glFinish() would use
> poll(POLLPRI).  It could also set an immediate deadline and then call
> poll() without POLLPRI.
> 
> Other than compositors which do frame-pacing I expect the main usage
> of either of these is mesa.

Okay, so it looks like we already agreed that having a way to bump frequency
from userspace is acceptable. either because there are already other ways
that you can waste power and because this already acceptable in the CPU
world.

But why we are doing this in hidden ways then?

Why can't we have this hint per context that is getting executed?
(either with a boost-context flag or with some low/med/max or '-1' to '1'
value like the latency priority)?

I don't like the waitboost because this heurisitic fails in some media cases.
I don't like the global setting because we might be alternating a top-priority
with low-priority cases...

So, why not something per context in execution?

> 
> BR,
> -R
> 
> > --
> > Regards,
> > Luben
> >
