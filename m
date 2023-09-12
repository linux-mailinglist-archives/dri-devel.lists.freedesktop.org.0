Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF59B79D497
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 17:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C7B10E433;
	Tue, 12 Sep 2023 15:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206D410E434;
 Tue, 12 Sep 2023 15:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694531812; x=1726067812;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iDNovd5Hag14GXyF+TkLyrKdd4iUS4foRm1ssDoavq4=;
 b=Zv+aqzawiI5K5BdaC6aVLElME4Dw8yiR6F8UI+K8FqJlXDZC3BcMVchS
 2a5bHSnF8aa7+gxVv8lA3voa819U80l8CieQTmiCh+Z4JnIAZJcrzCy2C
 o+FaOEEAauF81kgEi5DYbodDP+cQIugnak5+QTRIVDddIv6H+1O6QpFkf
 xzbq/bXuy8D+mICT3mLAakTW5CYsdYuVsAQjDP6kPG5/ZZ4AYMp38WvrA
 kMhHsqRfbmlETfDv4g3+hP5Ds0O1/hc5fnDyneY2DAfPx3rZsmYZ4UYsG
 +VFL4AFoMBpLiswMVQX+QJlsFas6InYm8HWP/sNjOuJELBdBZ5YxoBrTE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="363438459"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="363438459"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 08:16:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="778841216"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="778841216"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 08:16:50 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 08:16:46 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 08:16:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 08:16:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 08:16:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtH/sWLPIqmCvPD9uJwPjx0owNXuD0P4f/8GRUR2qW4Tzz6812mj7ICWyETMb9wacwsU/Rgn9wBewaEK6ujaDMJs7YdodINGxMI8eRySRs78zCFzhRpkN7V87hdpV7xhS5ybFIjTzkYOojA7DxkLNKwTyq7/SwxLA9WOhfwgq9ki00mxVCcBMbOaeaUXG4WX3pwMqw0R+FSgSI9s/XneP2eLbZdxSx3M05qp4tST/qbHforTKL8gOJTM5Jxe0169P6xJfr1ymzjFD9GCUOLKm8hujjDzssnbWC2OmvYoOtwkdHLtFFQWkX0Snfw9ivr8l4MZBghgpA/49wMsyTL3iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bjn9KWhGfW2OW0usmN9+owaBdMpLuZ3yjLBwYbLd3iw=;
 b=gl9Xg3bpjhuvcvijYFhUJR/Iw5pFCyUzxhW6z3NUyPidGnvjYEeO2bntK/rxqOL7iR04fCSxUOAhdVqCWRgZaV9H4x+cdeJ4CVnuqzUVUU4T+Yl0DCO9C5c8X6CaA26LWGmW11Gzn7GT1TcX87u7MQZPvzFwXbbOIno2aBVzzRHaslADo9uvlHu94YpNOe7G/kFp4mGzTkQKc4p519OzCzO4Iofbryf266h4AM4oZDlSg/4xdHGThevl3EvXPWT4gWc/yNQQF6lix6FekHIBrNZJC2sUYJOLotFC8Kd2oDhxG0SjLBIkn+52qZWlmWn8rIHfUzDK4RctFqpDoSN+gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Tue, 12 Sep
 2023 15:16:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.035; Tue, 12 Sep 2023
 15:16:39 +0000
Date: Tue, 12 Sep 2023 15:14:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 03/13] drm/sched: Move schedule policy to scheduler /
 entity
Message-ID: <ZQCAbuVh1uhFQ6be@DUT025-TGLU.fm.intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-4-matthew.brost@intel.com>
 <20230912093706.54d3af77@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230912093706.54d3af77@collabora.com>
X-ClientProxiedBy: SJ0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c613bae-d02d-40eb-0162-08dbb3a3435b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yKWHJyD5Aq1VvWKHTeaMt/U2u8Fdx5kWthRypuwPIdwBl8ZVGR0WmV5xz7ZcszBw0+ZG5uJS3bwJ78HPhv+coWXspj2att64WPmfx7JWM+28x255PJPiFLyg5+a4WDchib9E7k/QDVtIvFqSKVoLAHX4fC/XA1OEJseyMpo5suX/w1/qa3so18IlH0iMfcsd4YEmuySRhrOInsbENrAd/uClzQCg+aywUPtPITBLrz+RP9I7F3A1/avYY6B7iTOSsk7GkmElTg+5JVvGAWnXs2zZhPrjsA4vwZiaKlvTDSe/w5cKUNq1x1ok3ZeXDzGx3jb1jW095HL3jamWtenl/cgHmJDxbpvr7Hm0Vufi5p0ms+4HalSXLs7slrDZdsD9FAWbi4wagGdqsba6AQwln7CLbUpEH7WvgbQ0S3KOz2ArpW66Vu/fGv8auYXTwZSXtyF94tJWBLKvpq/r09fRvGqCJoYgo5JaNsvAmX7/61VwmEjbgKCphHgfMHd7zzvTPQF3Db0CY8u6EPIrJHa+HPfbCZb5Yauc2vXBzaf4d/1tXDDQLF3+kYRS/RAYxwUX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(396003)(376002)(39860400002)(451199024)(1800799009)(186009)(8676002)(86362001)(8936002)(4326008)(7416002)(5660300002)(44832011)(4744005)(2906002)(6666004)(38100700002)(82960400001)(83380400001)(6506007)(6486002)(6512007)(6916009)(26005)(478600001)(316002)(66556008)(66476007)(66946007)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+lEg9BsdaKIQ4XssGPH1VHxI/HeQZi64GOsSyx24SWDBZEwte3aiQqiZZV4I?=
 =?us-ascii?Q?immJsOxzV7u0SNu1pG8E7sIc8137zaICVLLUm5g2ftpqI3R84qXVOTLWTdj0?=
 =?us-ascii?Q?zERDtjJsfNlL9rj29jO/YriEBBl2wAplA0ZuDYaF37d0Cu5WsSgc1S+19aAN?=
 =?us-ascii?Q?Kda1oh4G3+dG6sfrPUs77urmwYIXM7JlMV3mVF7tfltvLNp2IbtdZk3lk26N?=
 =?us-ascii?Q?bDQWyxnldmppagVk78/UPcQQbPuMndqi95m4BC/mm6AOQAMGTDQHamE9Z7Ha?=
 =?us-ascii?Q?T4TF0DSTKVXlwfxq3me1sKCU87106cHFBsVZgbNMIIDiS1yib3ATn5fIofI6?=
 =?us-ascii?Q?r9P6XtQ8BO9H14UAlLn85QerNil4KdeP7q3zl/HA7MkzPWK7/2NW17pSXyIK?=
 =?us-ascii?Q?FdzVNXYxi9Ee2cEmqh4nRUNLQNB57rKBN6YKf5vRmQ8MoEzLM4cBj226lpeU?=
 =?us-ascii?Q?gl2qV4e3zcDckjbJTLnE5PBM5u42mFPkTKVqqJ2PYWbbveyMNJV8gLH3qCUB?=
 =?us-ascii?Q?WTQ7LP5EYvTacHFjmbSr9q10dNQCupAqr2p0pSwIr9d/UpiWQPtZZUaoDbAc?=
 =?us-ascii?Q?bdP2zTWwnhRs+fg3PM+dN/yvgRWNt5lvoBpMqkfAgXxE7Pvc/3U0PCDggOFP?=
 =?us-ascii?Q?Ho+Uw+sTAXAu0BNgyp6jIXM/F5ZSbOsijGjQVkV3qSFqaYbzgKyBtKft8+nf?=
 =?us-ascii?Q?TjlHy04yn7FbvDvruxJFkf4s8X67FgJcFoMaUBEXVp61em1j7CaCqqMUxK3/?=
 =?us-ascii?Q?UpfqxlsSqXe1XLlSUJPMaUONIwPaAT5A9FPYarsKRovKNKvPL6lXBbk93cUh?=
 =?us-ascii?Q?n/bo1FXn451rZkRErPQtd3ZYLMmDA6ADwI81OA8ETodBY1IlxDwU+0g+glUO?=
 =?us-ascii?Q?3u3fwcMq5D+AT5mjenrJwizCRQcPnwF19lQIV/nSpZ38nZdZ7sDWhXO4TpMG?=
 =?us-ascii?Q?TOK0+CdMLCmXvg9yuvtjbjqwZiTiQpFCUVwj74o9SGXglJmPO6RwxGY4vjup?=
 =?us-ascii?Q?YS7BAd2ljQXTS4AlmhPuHPdRzWO6afInGILgeSfNv5i0JmFJrrjbuaD6QEMg?=
 =?us-ascii?Q?x5S3C2Wxn0aKx3CNWDq3x/WxTLs1qTGD0R860PRw5HfTfbItQcg25ujpY5oq?=
 =?us-ascii?Q?W9DFwctKdqyX23CrdHI3xSLX+c0hUFGebX+mD4wZyl5Tp3RX1CxS5s8+dUHC?=
 =?us-ascii?Q?UDqxlDyBKk6Xsw445Y53B0aQqgy7KJseSnA36Yl7lWcQAAFFjHxnBrUxZCTh?=
 =?us-ascii?Q?jKFDUq3fmYM011R7yB1XSLEY+yVJZXv8P4xPA1i6gZJEqHQHEzEtQWfk29yC?=
 =?us-ascii?Q?oPMVVJrNd2x3+PJC3N6w5QziljQZ/2x4bXvJLoZA6KxppPfA3hqU/93lvefH?=
 =?us-ascii?Q?VIAQ3NP2RHA5k22YXMyg51Xh3SnWBisshcYaSHmjmjjs2AgXUhBGWksQwsNe?=
 =?us-ascii?Q?uABZOCb4/9GOXiQpRj4+LnPfwCriQjm0LMMaoMnnSWdq8U/HFdoYT1SMK19p?=
 =?us-ascii?Q?4SunbiSpyeQ2oz6J9SSSKmJzZfRfJRld8mUMnnFEOhf3Gqk5rizoKw/Hxqu8?=
 =?us-ascii?Q?UEW79FL2Pv+2pp8xn/5Me76dSK4FXULIKGPse2Ev0O1zJJaeBcPUPL6DXBTz?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c613bae-d02d-40eb-0162-08dbb3a3435b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 15:16:39.6586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1Kioj2KhHwpEQejAV/fBgslwFbyQCO7ahT8cvCGCq1UuDtnHWtzf3WEh7dbW9Bfxwg0yPkAnHfDPrbq5k2k5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7038
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

On Tue, Sep 12, 2023 at 09:37:06AM +0200, Boris Brezillon wrote:
> On Mon, 11 Sep 2023 19:16:05 -0700
> Matthew Brost <matthew.brost@intel.com> wrote:
> 
> > Rather than a global modparam for scheduling policy, move the scheduling
> > policy to scheduler / entity so user can control each scheduler / entity
> > policy.
> 
> I'm a bit confused by the commit message (I think I'm okay with the
> diff though). Sounds like entity is involved in the sched policy
> choice, but AFAICT, it just has to live with the scheduler policy chosen
> by the driver at init time. If my understanding is correct, I'd just
> drop the ' / entity'.

Yep, stale commit message. Will fix in next rev.

Matt
