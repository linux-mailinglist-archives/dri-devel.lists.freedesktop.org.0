Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E10860689C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 21:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B55D10EF38;
	Thu, 20 Oct 2022 19:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5923010EF1B;
 Thu, 20 Oct 2022 19:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666292764; x=1697828764;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Bd5GJVenw60HbgfIfHeDybGv2S3LEBD6Hc/fzcQ8ZS8=;
 b=j8ZDpkKIvfywW8dGikQcdGnvTFKIiAQ2zrCsfhgFT7c1ZlE1ZMNQhpeS
 u1hoHGj3mSXPRBCsTNrrX//TBYjJ7Ujt+s8Kb54yaZ7a+6klI7BrkLYo/
 IrQk7HEUwq25TS2Nlov5soYYIU4aEcsc2tNIEt0x97faB3dYfB0Y1U7p4
 SAAK7Kgr+BVJUC6iw2bKVestQkKoMBoW4Rvw61GN3nZJLwVzKxgNAzGwE
 auri7RxqZREEyPTfJ2MpdxySJL6/S6ixpgJoo2VZD3Al7Ib+qda+OpN0i
 l8meAMdchymnu437edn+BFAJeVkT8i47rSpT7rdca1qxFOCeR1RW2QLcq w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="290119575"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="290119575"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 12:05:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="755332516"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="755332516"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 20 Oct 2022 12:05:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 12:05:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 12:05:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 20 Oct 2022 12:05:48 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 20 Oct 2022 12:05:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKbrcymLE7X6iJVlkmSa5VVIX81WOyslP3KZ3JSHprDQ49FrEYpqFkGgXfNZBJ0DrPghRbzxgb11cEPm/fZ0vL3sDqVByaDcCyeaoeNRqdPdrktvMa3PBzFhWDIvcmJ8yYrevCqKpMdIEygeAinx1/7O9IYHItejIp8+izWriyTuPT/NRJURYPSA6I6veRAdRFeLBF24GUOFZSFqftwoxaQ00zRpEhhUHzGe/HRFcScfigpXsd3PGS5Ye5BLGSUUT9JktD0s9f1/WOugqDw2pmW1Kt86lVolVJAC4FxdulQM4IY2tOwS4sbFDkIYjMVR8ntvxukXspaD9HAnws/XWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09H3Wopq66GYoI8HUFaTILVkzXauaQToikKU6/EjOnU=;
 b=YDz37rbxQj3hLzsQwQ2XlTzLul4+9X9RoWH3qnqaG5C2+wYY9DRYzBrzQRrLvsRu8NPIQ5oBFO7qcCFR7086Pt45C4XmUsDtz4r3bGnSNna4VpuHILH/pkBqPkuwXHz/8rRFIBa7055l5sZzUpsI7tWV2/TpJ28kGcK+aairwCOHsrIZT4ZjshZatDAuh+HaidWXm0KSauJZUTADtQ9g7lf0YVJgTlkHfEK5t5Ag0hupt9sSJ9AOSlKSYtyOFQj3XuNM/efxU9mOXw7Szb/SBp4UpwJMJ0AVFZ9yLT2KWi5fElhobeoUTrFUgpibL+GJpvaZIAKD0s3tmGyvhxSGhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA1PR11MB6917.namprd11.prod.outlook.com (2603:10b6:806:2bd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 19:05:47 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d%3]) with mapi id 15.20.5723.033; Thu, 20 Oct 2022
 19:05:46 +0000
Date: Thu, 20 Oct 2022 12:05:39 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v4 16/17] drm/i915/vm_bind: userptr dma-resv changes
Message-ID: <Y1GcA+BdZUTwZl7i@nvishwa1-DESK>
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
 <20221018071630.3831-17-niranjana.vishwanathapura@intel.com>
 <Y1Fa2k/Xk4s5V1ip@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Y1Fa2k/Xk4s5V1ip@ashyti-mobl2.lan>
X-ClientProxiedBy: BY5PR20CA0024.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::37) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA1PR11MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 1181fa05-8d18-4dad-aeb3-08dab2ce182f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dQirHAM2bvcSoTh0vCF6TUnmzR5URi0WLgV/WRYwMRH9p1ZrQbO0k5OqyBYDb/M/DBy5Wxb8i1LEjssQUf4LtJXxPhDkuCU9ztimk6lzmWrHQQUaNCnN2rVl3Ca/j3HfcBFpaMQWuvMvViKLEaaKULQLMGglH05jGcHK0nc7d+cZ1+u3o9E9AHgCYwdTuQ6iIzDtn4LgU14zl5DfCLDd1HwK8M2Dlo/0mMCgaVKeQDzDbOottEAmrcVA2Xq+Z9Px2HtJDOlpglpn9eUjV96PlH+4ZZc44tU6xtnlKVWjLAhcUvkd2qFMsuZrvZCLJr1BNdhKOI7BDIHuy61RRl0YfCXLdxXdoE8qbgeXeIyG+LI+Oc4hw5YLMpIrJEQOu4H/VYc4Jq1e6MNBWHPF9N8Ne2IuwGUthD1nis4rRvy7c5JN3PMRqZg8fDdMAFpr0s0k3MMPUg3CCtKaVXB4B5hfgr97OzD6WjPdIYKYTrWWOl8UILjA8g5v1See7Qf2J3m3dFYC7WkMcyKJTc9WDIfRn2CidegF6m72nBx+WC2dC28Lk/Q6/jBiiVnLFlNLRyK7tth/zUPAIX7L9nh03R9oCLRuzHV1kIY2z8VQw4t52u14+CmG7T8b7NZUbnr7BEuroHwAPvXg0BRM5J+TNFm/q6UYfTn6qv2iXBb+6l5+DmK5LVR0kS9knCOrw0PxCzKu+39rodGGeER1A3rJ2ysBMnppAirvPStJtaE7E5EL0O7c+CzD5k/QyLWg0EtLUCztLZ49UavqIYTE0f1Abh8Pqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199015)(83380400001)(26005)(86362001)(6506007)(6512007)(9686003)(4744005)(44832011)(4326008)(41300700001)(6916009)(66476007)(8676002)(66946007)(66556008)(5660300002)(8936002)(6666004)(316002)(33716001)(82960400001)(6486002)(38100700002)(2906002)(186003)(478600001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h+m/yVtfx/0vMgOkiqA6eKMA7aT4HkhlWv6vGOcdvfQbqMOMa2iq2Ueug+pW?=
 =?us-ascii?Q?ADVwW5OlePoiNp52rr1JvJuYgyrPAaSU/tyMlYkV2JfhXI5io1XvUwihKsMk?=
 =?us-ascii?Q?MaZSiPA3sPKgmtJqttKfQGgyMaj5I6/l5UrKig26YU6uD8tnV3NGh1BNN7tm?=
 =?us-ascii?Q?+Dd4hc48Xq5lq6lhHAz2rheWeTdylZf/LiKzHvOAg+5vhROE2ji/Y3rDSZF7?=
 =?us-ascii?Q?y7Idf5cZ6RZhLsOMfesPs45ZFthhdwSIHL4n4LByQYu4PBBS1b+qRF/BP5BM?=
 =?us-ascii?Q?+j1xvuR3xfB3M2rTCxs40NDAcmHQQB3WQTT44e1vZWSzt6awG7x6rpzWTkG9?=
 =?us-ascii?Q?haAfryvlDQGQ51tNrkIk5CdVwqZgx8cH6mrjNCze81SqaoTsODHNijrPfbdw?=
 =?us-ascii?Q?tEZtfodnaS2i/Ajdeb82Y3elBby476SFPWTSWnnKxpZtXlpQjF3OQCWFGvJv?=
 =?us-ascii?Q?6sZD7DUI+qVscxwmstZn8f77IPaCCvmcPFFzrYp+wbfw+LMG2UilvLGyBJu5?=
 =?us-ascii?Q?IutDDkHUsJ0Gy7/jeU4hbHylPymg+HVGtdK89komLtJhrbcs/PwdDh0X9av7?=
 =?us-ascii?Q?SGv5Cv8rEKfROk/Q526RpZaxVEAFLBjevhODHwvOrRMzySyqwNOsmgNIjfBZ?=
 =?us-ascii?Q?zubpABLLVY7aPLzjLKO17A2bYvdO2LsNLCPLaGwlgRQrvhS1p18CPGpNJ1U5?=
 =?us-ascii?Q?EkzBoFsJ14vJNKcGZr+Sk6jH2EMoWUIPX1nvj0qPcw/ewglcYpkGXU7nuPbg?=
 =?us-ascii?Q?D3C5WydFb8DTZzsCC+bX3IGzvBHVJjcH0NC7idNRzZEAigDm0Ee+VUXAfNW3?=
 =?us-ascii?Q?q2giw4GAOyf/QsWJc6/rI35emB1u0cAfnYfjEg+NUgxXqUd9rHTplJNTaiSP?=
 =?us-ascii?Q?u/NJYcN1PNlpfh2ls+KNQsCznaK4ngbTVrOoAnDmkejssLmeZGJSaoJ/D6Jk?=
 =?us-ascii?Q?p60JQxuKB2Qff9LA9XsqJQ6rE3Zgl5M0MbVkYGG4l1fGUJMSTVhI+8HUahRE?=
 =?us-ascii?Q?Z6+3d6GofCKUE7yUPnbFW2Seq5I8qYAHREXGdseIZ1HjKBMqAd6Y4qOB8yhG?=
 =?us-ascii?Q?SOO9X0x3bokY6dAoMxxgsoTNTO4IuUo7JA72iIUqU2Rb487Yy53/3pyLreGw?=
 =?us-ascii?Q?GVLMTBqwAzNJsC5QKO14iriReu/aTEOvosFWKZi0CPeH/BPr94M4TjwUrt/F?=
 =?us-ascii?Q?o8k2scQnjwHmB8IukoZ8FK2WRHdsXtUGMuwa4SumJ7p+ff7BGnXcN2G2+Yku?=
 =?us-ascii?Q?DBcuWAl3060VfnD3bzbdXQfVligPdAIo4+vtQRpkDEH3NQDTzgmZ/p5LyPdU?=
 =?us-ascii?Q?A8Czys6OCHDI5Cq8+LcIqAT8iYhR0gjAIqwnMzLdMb8rm41PLwCkwC9xz/dW?=
 =?us-ascii?Q?sr3KdZ/3NLUmJGwKsjQz5dgQ4jNjD4GD5/ZG0PLd86qxS4sW/C3xaGnoPCHH?=
 =?us-ascii?Q?vahO5WaHuSy48EZKtzfzZA2JURCBBWCbhIYfGuaBeHTjLbSGpTOqDxHquySy?=
 =?us-ascii?Q?DgGARMZCipTRPeshe8ejY0mwwD/y/jYLaMutrkuJa3XsCrPn+VvTxZi3EMrE?=
 =?us-ascii?Q?2h2qp+Hq/vt6SUIeNJXTxWRe1EcLlPklXwrw0TnbHIta8namjyIL1gQLFoge?=
 =?us-ascii?Q?xOFUkI3aw3wsXDStpxhukA0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1181fa05-8d18-4dad-aeb3-08dab2ce182f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 19:05:46.7006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zhl2Ue4tAPY3Eb5deDXiWyd53tleWGg4JMCh13skM5XfNCOdlanxCy2UYOCjxj7KDpUzTEXCFiuUWZgA0fzk9X/x2djndN0psmXxAgMg1x8V3lErUAlJ6KnGbmTUsq3C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6917
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com,
 lionel.g.landwerlin@intel.com, tvrtko.ursulin@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 04:27:38PM +0200, Andi Shyti wrote:
>Hi Niranjana,
>
>[...]
>
>> @@ -307,6 +307,8 @@ struct i915_vma {
>>  	struct list_head non_priv_vm_bind_link;
>>  	/* @vm_rebind_link: link to vm_rebind_list and protected by vm_rebind_lock */
>>  	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
>> +	/*@userptr_invalidated_link: link to the vm->userptr_invalidated_list */
>
>nit: add a space here
>

Andi, I am keeping all vm_bind related fields together here.
Just following the other examples in this file.

Niranjana

>Andi
