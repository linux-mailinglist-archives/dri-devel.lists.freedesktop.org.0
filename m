Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C6079D412
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 16:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE1510E424;
	Tue, 12 Sep 2023 14:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE40A10E0C5;
 Tue, 12 Sep 2023 14:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694530346; x=1726066346;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qOyh8uq/7mBwgXlQWCaFAYAoX64m0KAgUJvPjowAAew=;
 b=IDIAbEA4Kpaej8nY/WxW6SoYYnIVP1OvriJ/ekMmhVtiYt2xBdLGawcU
 n57W78OIdtZLoxrhYO0EWuVskeKeih2Wh3oBHpZ3Fn33VHHtuaZZ0ltHO
 7B06kACm599k/CwW/FDODkcUf12OgP5qnwTcY7dM0H8FlM9LQcjZqTbvc
 nwsQkKGXOmBHA7JRy758nBeb/ydV+v8TzwID+jwknUkK0/t54IYtXhjaq
 w7It+j7HzZqTH7pT2e69Kvm442TxTd4ZdBSJR5eZq32YU9AT+UmmQ9Lu+
 LWf7nh5fl/kXxc3ACUNY0BbAagk93A2LbNVf7H2ogn+mhOEqW6C9ZqQtC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="375724875"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="375724875"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 07:52:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="693507083"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="693507083"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 07:52:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 07:52:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 07:52:24 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 07:52:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVbKAJyc4FVuqGG/s1YKi5JhbYttdCDpSWTro4XeHxM68gWkAJ4Z8LvlR/20TkCgzSEK9u3msdMA+5szjwDWFPr8A5niGWZiQTVn1W8/RqhgihllBbZC9SwdvdHnDVEXhpy4uLkMWNAiRXFUG3AhF/KA8RRLIaydBjAjevWshXuP+oN1cGUrnjoyZy9lox7iN7ZbLrS9ezwCvQta5oCzpGPYehBPzkZWiKhdjAGHXPc5q3kmKtm6bHmUwD/Z9j/8cOpMjupLPm7YdOLmDsWL5qCImFxe+L4e71TeWc5B3WkSxAZcqQpIaV8cQj7Yn4ZCGYZ7JfBtoT67mE2/4acZgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sk6OjcEK3L15u4hv+JdNPW31vT6wXqUTVLyaeD5hhOQ=;
 b=ZzdD4goZALcGgJrjK/+znVIqr1ITgf3iQuuI//k8NfeX1i+VERimmvXoDJq4emlIO2SbqCI46Oo7qAtSevLiBAXRpeyWKMdCZAorKdNuCXb2KhZxPeRURjLPd90g1zIiVf7GCG03W77z9pSPkZBeTsvJy4upZpWhdClHrrrR2kYZJTtrudoh+fAWtGycJ++9LSBTxOujs8uLu6vT4G7Ivg1b1bkoBvjzJ/cJqEvDmAfDw1MliZEmDqAQ/D28WLNv8ENqXl0/YMM+9Lg+eoFO82aNSrPYmWiiYHsNyziJKRxMaEp2j8cwBLTTpzBCSnIZtNr610k9NNBjxq1XsF0ZHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB8076.namprd11.prod.outlook.com (2603:10b6:806:2f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 14:52:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.035; Tue, 12 Sep 2023
 14:52:23 +0000
Date: Tue, 12 Sep 2023 14:50:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 06/13] drm/sched: Add generic scheduler message
 interface
Message-ID: <ZQB6vm8f7XkqaBUH@DUT025-TGLU.fm.intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-7-matthew.brost@intel.com>
 <20230912102302.71d798a8@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230912102302.71d798a8@collabora.com>
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: cc2cfb91-2367-44f7-77b1-08dbb39fdf48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DIvaF63KQJFsKg2JdfqTtN4qFWJyo96JSmJ5Pybxi/6ffTl04oV17n/qPRcWx0a2S2HYU6SC21oHbN+MfjNl7oQHCxm7Zp6eml075ZuvKSpWYm/QinobdG06JA24ah4T2PkpmxheemRAGCLl9s0xkeSYwAJOya6hTur1uyCDCtvtAnX5MpcbCw+XEKZcC0OhuAYPgbtalm+pHdjd2Ty74wieQ4pw52XfBSR6yXZ1zHGTF00akD3rkU9hIpzyJ7K6GxYJKrpvkE64dINtz1ULiauwAE2uE3vC77uOHCOBpuXjLNyvs3UGTH8+ICRD7ubqU69SKbLwUp9NY6d91nsWTzF38caHDKcsMvdrIo81yPcbjg6fpeg0TASFdI5tCYf7QN6CHYFg9s8hy68jWtiB70m7+dOvGkahwvbTkOQ7afEYspv8J3ELR+ioxOUCld07DkE+xhvy5ZgO291motse6/K/DQmd4ZKAq/f5AgMe7giY6yq2CPcqyNEX1lnUYgudXUnr3yAds27oI3Yu1823jx23Cv/jb3hhQsQxtVgFTvUGgKtQX2Inq0xEv5/oVfvAm4qaE5/6HjJAzfeh5PZ3fpn41B/VqeC/mwsPO9B7sV4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199024)(1800799009)(186009)(2906002)(26005)(41300700001)(66946007)(15650500001)(316002)(6916009)(8676002)(66556008)(44832011)(66476007)(7416002)(478600001)(4326008)(5660300002)(8936002)(6666004)(6512007)(6506007)(6486002)(83380400001)(38100700002)(86362001)(82960400001)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9qwQzNvZb/YXbFiTCCdKDdn1bT6wVMk4mER00AdUfv0/eqDmiJbCsWRYJ/BM?=
 =?us-ascii?Q?WznCnFPfTAhBbs6COx49nHvJ/Jh1P8FqXacMvbika3nq9KtcNd6g5tN+kqRt?=
 =?us-ascii?Q?FP2Hd9iGSdbmuygXqzvnZfDv8MQMn9dyM+Bu+gjUywN6ftB1XIaRVHrP8OBH?=
 =?us-ascii?Q?8anmsSZULUIJUD0v8Lm+L96lLRFuguJsmA6m8R+7xrtWTGJ/SnbnbOxvcWdR?=
 =?us-ascii?Q?TSe3KvrKzk2g5ALGwCOUZGDApjVMRbRg9QpaKjxLJyduVmQym6ZIcQKPUQUz?=
 =?us-ascii?Q?39A8dlO/lwhom6oBzJ4T2rojZSPmkjaqUx65CzLyMDihTsMRLW6wTYvzNXKu?=
 =?us-ascii?Q?mYpXvqGXYjbAf424NXdb2pz55bOiHWGPiuDBHIQ4dkzbBtQT9/B9FFe4h47t?=
 =?us-ascii?Q?1xZlJ93l2MmSZ6X+dk/uUMW05U8sRMsGyGclUi1M4yCRg6vg5Uj9WJksdDZh?=
 =?us-ascii?Q?Q7q2q6qhwB3/Kijsr+LCt93iE0pREiK5qgD5PntqnVoXkfW48a+Jr9ev9iH7?=
 =?us-ascii?Q?zxJlQKGgoss5Te+Mj4ZwVRJdvc5v7vrC/QQySwqi6bfjPK8EiPcb2pMk5Jxq?=
 =?us-ascii?Q?7BqQ5VOc9scHfZqSEoiTeIwqyubQVDUtepAWrXcWVX7duvbpEUZVAqq2DpAY?=
 =?us-ascii?Q?xINX4MY8AxsJhYx24Aer8L7dlDN6romfrSaJEorYsG68AaSYzcXU7N9Z+q99?=
 =?us-ascii?Q?76oX3OJ5RXiLHBge3GDAu7BxqJJ/RuB1YmHlBXg9BL7K/OMQcBG4fjNbwjAE?=
 =?us-ascii?Q?gMweudoqsXHSa+241fPEEfjNhdLyfLIK15RdHDbo8oyUSCy/FoiiufvXpvmq?=
 =?us-ascii?Q?/JNG7TrVLtMyPrVfEMYFXGmuh4sz9oTUufG5Yap5Dmd84ZOrrwTfHrfedGAU?=
 =?us-ascii?Q?jW+4vnO0dKv22tdORuGxvt8IJw9dNE9YWxPsfeD5RCa3g4BvA7Z1xTFchCMa?=
 =?us-ascii?Q?QXyLnfw8i8VJz0wKYmJS9baBL1WipX6Db66BVIqCJ5qiVdT5EpI/8yhdwiD3?=
 =?us-ascii?Q?V7zqD0aLkEWMj4EmqPIh8qQ2lmPXkz3pWF1Rxkt58SUnGZKum8yCN16fHsc0?=
 =?us-ascii?Q?hXRPk12cRk8TjQ2TRxfTmxMvTjbpem1nkk0h80TdtQlxgore98PDkKCNhe4z?=
 =?us-ascii?Q?fbJ+2ECGXfk09O8pW4WvNA5S3MA4if98nkJRT3Kl1WlviYtneVt6bgLmvDix?=
 =?us-ascii?Q?YP7OGlMjJxSCGxE2alMZfoqH92gxZkouFzc7Bx8SzAjzEx1H8oRibqygF6n6?=
 =?us-ascii?Q?gqJG73CsSNGQ9ZKsTpBBEw6s+nq2wQDBvcB1LEzVZDBKTOHVCotemjOZTgg1?=
 =?us-ascii?Q?82YS9DHIwBDipOH2xWwjfY6gskIk0JFHRF6c8jNPS93VqOXknO5/vavA1MqU?=
 =?us-ascii?Q?2FJ9FVCuiY3aqOqthMUDxfI0DpLXw2iESnpLNo5lK6EAgzI9Wd/RVVEXzy2z?=
 =?us-ascii?Q?jidXANCzd4q85mcnThFadgqVu99V5pXRSh+nD1ejirR05/vuNeBNFWABoUCk?=
 =?us-ascii?Q?4tzD5mfA8/Y6G8vNkdWIYpEV6qDhymz/6oyByzLx4ZND0ieloxeLQLePF7hU?=
 =?us-ascii?Q?x2SjGs8KLYCtdv8sw/ZhGRcDMT2nqk3m63/NrynI0XUBtzfk/9j9/G6UPqtZ?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc2cfb91-2367-44f7-77b1-08dbb39fdf48
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 14:52:23.2784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: quiE+QntGnD9oaJ0vJL7CjaNVPJhi/0a0dzp++7F6cWA7xO8uD9/z56cisXi9q9JBV0uZQdkqT1oQbolaPNpKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8076
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 luben.tuikov@amd.com, donald.robson@imgtec.com, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 10:23:02AM +0200, Boris Brezillon wrote:
> On Mon, 11 Sep 2023 19:16:08 -0700
> Matthew Brost <matthew.brost@intel.com> wrote:
> 
> > Add generic schedule message interface which sends messages to backend
> > from the drm_gpu_scheduler main submission thread. The idea is some of
> > these messages modify some state in drm_sched_entity which is also
> > modified during submission. By scheduling these messages and submission
> > in the same thread their is not race changing states in
> > drm_sched_entity.
> > 
> > This interface will be used in Xe, new Intel GPU driver, to cleanup,
> > suspend, resume, and change scheduling properties of a drm_sched_entity.
> > 
> > The interface is designed to be generic and extendable with only the
> > backend understanding the messages.
> 
> I didn't follow the previous discussions closely enough, but it seemed
> to me that the whole point of this 'ordered-wq for scheduler' approach
> was so you could interleave your driver-specific work items in the
> processing without changing the core. This messaging system looks like
> something that could/should be entirely driver-specific to me, and I'm
> not convinced this thin 'work -> generic_message_callback' layer is
> worth it. You can simply have your own xe_msg_process work, and a
> xe_msg_send helper that schedules this work. Assuming other drivers
> need this messaging API, they'll probably have their own message ids
> and payloads, and the automation done here is simple enough that it can
> be duplicated. That's just my personal opinion, of course, and if
> others see this message interface as valuable, I fine with it.

Good point. I am fine deleting this from the scheduler and making this
driver specific.

Matt
