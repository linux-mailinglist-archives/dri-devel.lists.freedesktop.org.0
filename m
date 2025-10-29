Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392B7C1D2FB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 21:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C26410E834;
	Wed, 29 Oct 2025 20:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="extVnCsD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A188410E835;
 Wed, 29 Oct 2025 20:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761769064; x=1793305064;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=edvBb2eCIeoPCOpK2r8ids254FGc/ht8Ol3isp3pRYs=;
 b=extVnCsDoZu56HWekTbrYsN8p9xpdEqqmH1ABoYlUo7kaYCV7p6R7Pqr
 a9LisnpAYejZkl+3TmGIyMOepf2iCs5iA13ReRUnhRaYry7FOyCOChbzb
 G3uaf/1swT4g2oU3ALSnm4s8F6cBFX8wIOps9XY0GpoO52em8orPyBAmq
 avcKFRZ56vm8nL2ctZKvF5CMIwOMXPPMvzzU1vPE/SBA+zf+fgv3Gg3dv
 F23RbaJVBTtUiG4XWIY7K41uK0jQPYBVJ9yFN1La5gNgwIU+Sbk2zE5xt
 /EpWOBxoE/wmdmrEEkl0BFI+XVIZfK9JqGxlcOniD4JpF9/8gcPSoMRxc A==;
X-CSE-ConnectionGUID: PHatwD2TTUi0WV4WUj2UQg==
X-CSE-MsgGUID: 5w6OxndaSv63L319m98q5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75247692"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="75247692"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:17:44 -0700
X-CSE-ConnectionGUID: h3Ix7iaBQzOz5gRjguW65Q==
X-CSE-MsgGUID: yDGt7JXwTGiJQrcsDYxq1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="190080707"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:17:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 13:17:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 13:17:43 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.17)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 13:17:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQ7KIH5VeZZweFoiUnNKoKu9uLRvfj/Cz791ApWcJ2ldTY3uoiO6eMiR64NuiY323/9Vl08z7Rpe7Plkkx8pNwycv59vYBkN3Skl2pMeOzFGk203rO1MIZXRd23k+WLxiL3wfhVxT1zDFmic6DS2g6Pvbw1gAvvFzzmLWBsi5mt4IOP5a7DHEzX1Z8zjhvpvLuMDtI2xiAF4nbW5Unv3Z4QtWSHA44O12ysBzJisZQHZrUU+nUkxmuXwtB0gIQofV+kpRcATX35D2n3uTOqSeBpat9S3VajJPDcSWK1QhOUmrjpihbahbT7aHE+o08l0pQE7v8PXJn7dLnT2wRRdsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5Hi63/J1gCpIhaHbc8LexCRNehOdR8FeDvCE89Bcg0=;
 b=Mc71n5dtBysPpwk0zFTSqcgyqTCqVktZQxgqKVADqIDwc8G+jNEhTeObvjOhkM/Wqi2D6lwigEf+1DnP55sfdOiPxWoAZlBKL3RadCmoGbjex9ewjoD8lfSgJrhKMgtpOeomrc5a3OslbDGWTCR3xEWXgW6YE4t/3CAJKv2r1Mhhfu9TnG3d3K3ZF0PlIh1jwwPv/115MOHLwrBWr0ZPY0KX/qCLNBD9PPlJ/tMhUpCQ7LHCjDHorDyLpIBy82V0U8FxfWvCtDAyEn85M9Lc4uxgig7jfYVGQ875m8syPRp7t80KR9VEf8/ArobwsxhKW5OCfNwcmiGXwsbXLS+9PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 20:17:41 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.018; Wed, 29 Oct 2025
 20:17:41 +0000
Date: Wed, 29 Oct 2025 16:17:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Nitin Gote <nitin.r.gote@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <chris.p.wilson@intel.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] dma-buf: Take a breath during dma-fence-chain subtests
Message-ID: <aQJ2YMGxh-foBCvx@intel.com>
References: <20250226155534.1099538-1-nitin.r.gote@intel.com>
 <2153999.KlZ2vcFHjT@jkrzyszt-mobl2.ger.corp.intel.com>
 <7a96d06d-54a9-42b4-84c7-0c262104ea5b@amd.com>
 <7836906.EvYhyI6sBW@jkrzyszt-mobl2.ger.corp.intel.com>
 <cf5d530e-6952-4e76-93e2-5c72b31b5c62@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf5d530e-6952-4e76-93e2-5c72b31b5c62@amd.com>
X-ClientProxiedBy: SJ0PR13CA0190.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: 363751a4-adf6-45bc-7b57-08de17283628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?p4H0+GfxGOxpAws36tmzQ/5yqnOHYvpD+DeLVgQhLi7NmY+94oVX5vlkGN?=
 =?iso-8859-1?Q?LhwLHfXeayS/dHD5s0uQBDHfRAcVqmQeLd96BFk4QLwSjruc/ex02injXN?=
 =?iso-8859-1?Q?za0jOtR1B2x7QKYToS3icSvq16HOsHiBQ0LniP4yU2TBgiPGhy96focxtO?=
 =?iso-8859-1?Q?DCmuQXRc5lElcKqpZfHkhbjCEUZYP0nhIlOGp6HZePGtBcPYkuMtjusELK?=
 =?iso-8859-1?Q?K4nQuM6X/HBU9rIOE9t+WsuzzvAQ+k70THegWLVVGYglTYi7zasqVd4Xdr?=
 =?iso-8859-1?Q?dDlzHDRejPYc/kJX3xRCGHv+U8WM3McNhNETj6fByFVn36znPMLN9mf6aa?=
 =?iso-8859-1?Q?XLjDPv+rtqQ0p+IfrAVOJBFEHM4jHvowS2MfsRtQ2AcsLTx0MvYaI8V/J7?=
 =?iso-8859-1?Q?SXbmRJ9fgMZgCpw9xjDk8ogvFwT+McuzaXsnqqyU2WCg07i9DMRBOjkF90?=
 =?iso-8859-1?Q?XgGYrkirrX0sHBzxrHa7dEJarvTHz6AkRsaBDPmZocNY/SIRP0GeqVWaat?=
 =?iso-8859-1?Q?rBiuMmpjs1HNlPinWYCKz+QPRWIGSywoRRynZElcqydmxin+NwFLL6Vbya?=
 =?iso-8859-1?Q?pxcLlLhuRFH8ifcpuQFIkygfcTWqqeRaVWjEFEBJFcpLLV9G5kR2wGAmIR?=
 =?iso-8859-1?Q?41SX4vsAWPGYJoBgP/YZGAWOjYiTuOqMoz14TZqJT3ArqVKMqdEQSTIX5Q?=
 =?iso-8859-1?Q?9kno6GLJgrr7mvUgG75pmoxBBW9mniN04ksxfvsqeB8nNkiDBf+9g9rcuE?=
 =?iso-8859-1?Q?RiFMN+uRQyf6gsmuyrAGfVYiM1YbwR+zcly/DD6YPolWJyM9mnqYUEwrf1?=
 =?iso-8859-1?Q?wCgpSrWUqkYHo3qd662wr11wfQ/1+Z8eV1C8EIo4gUoUoUizTKiYVsoXx9?=
 =?iso-8859-1?Q?8MwTZWGeJJDgcwxdVQBCe2R7KZ6P0dSzRKqc48Edm/S5yKcOAXEjXqvGIx?=
 =?iso-8859-1?Q?abzJh5r2WHzCKRTOQXUazCNZXhO8nNtnH5SG/rd3si9W1uEYHVDXyu6iHV?=
 =?iso-8859-1?Q?lw/ehG4MV1JszVONhlgPw6n11qjVFxH+8P/WD6Q5HXaZxpRNhMSz9EcdLI?=
 =?iso-8859-1?Q?oxc51aQVK7XFuNfCrJ4tH2r9O0thBTvYTx2ljcdimb2CY9G4U/0KRYUOmt?=
 =?iso-8859-1?Q?FTFSjin+bICP4g759divE0rarzGFpiUfH3a90w1T7KWR/RgEnoZwwmTmzK?=
 =?iso-8859-1?Q?AKk6e/wjqf/P/3Drq23DKM51Xu2yG9G/BNg9/1k5lVp7b2H4G2rHUZ2Itj?=
 =?iso-8859-1?Q?z+v38xeJs7/yQfX4nTkx+wCzb41v+iBrvtTN6rq4QXxj86rqF9c4i2ck16?=
 =?iso-8859-1?Q?2sAU5883xsSQn7BPU9b001AaCNqty07MlKIwoHrqSQFsYYzXhN7SZtkjHp?=
 =?iso-8859-1?Q?LXxGJhGJNvOjKWssQYh7uFeRAvoeW2SdWQLQgqwNVqUbBfwcrlCApDYanK?=
 =?iso-8859-1?Q?i/Ra+pikrbCYcbiUoOf52izCn03ud1LpZBAB/angmPQJGTV7YZpZKe4PEZ?=
 =?iso-8859-1?Q?TvTwyRaJbdMG1AEWspqAm6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/oG6l2HKIHFKYjjlLRUruOVpHc43ojxjDkDNEYHIsHNVrfMoaaemDlPBXv?=
 =?iso-8859-1?Q?o7Uqf0K8kc1Fh00Me17FGoO2N7SvIoKTarGdstIEztVdtEkfA62aR6JoQA?=
 =?iso-8859-1?Q?7aMROvbe/TlempbtiX0mIFIP5iLyXMqiZEqP5eSamAOYTCj2FDEcARQPtS?=
 =?iso-8859-1?Q?5yCxHhKI70bV8Md3hdFODbT3MZhIYOOftbNg67iH2ZxZbF1lUKrrQHPxgh?=
 =?iso-8859-1?Q?8LNx4gpN6TB+tw5+Tll/+xV3Op6ruF6APf67OZ982/oJxUNYcbNcXLV23Q?=
 =?iso-8859-1?Q?bIUbyE8eltIrnyPLAzwb4sBQDsMqtFQDGsHWZXYr1JvfA3FjeV0IBMuDxA?=
 =?iso-8859-1?Q?zru0Iv8uqpL3BkFeUA6hcT1lo2r4GXDek7Ur/6Gqf67zrk9PgqRc9H3n7D?=
 =?iso-8859-1?Q?iz0SwUKkQDmzX+fPURl+eyxD1faZDTVkWMIFcweKyRfIbkfnGXOeqOWZGR?=
 =?iso-8859-1?Q?EvB70gDdtRbNproDJ5rKRNBMCgzjz8YOVoZxT2mnghp6BAPsicqTATfkND?=
 =?iso-8859-1?Q?6mDEBQejnGj6t69xlKotuoODUT/y2xKytOdy/echqdZLuHYFx1rhSt08zC?=
 =?iso-8859-1?Q?quf/JkIw/Y2zOqWbDktESSJXNi1ylpKx6QgdSIKIFQxzKVpA7JARbiFwdh?=
 =?iso-8859-1?Q?qLrSHQ8sANOmPKiYMhEigpJjnHqHYOW1jg/kgXUPFuKJKYhBl8cwWIxTBz?=
 =?iso-8859-1?Q?Mk3vrTnW6Ty7tCmdGiMOv7xpI1A0t55owz7WU7knlZA3B276y8eBTaHOn2?=
 =?iso-8859-1?Q?jBX1lzpwDj2quDgHYU3d6H5kepYI+kXv6ezXCVkmm0idddPbAKkgYwaEOe?=
 =?iso-8859-1?Q?Q+alg73IyOSgIn+KdjNDO3XyATplSSKDWt96QuVu/fBs8aasFlhZ6Wrmzn?=
 =?iso-8859-1?Q?simsTTeBEjkHJMekbq9WNlzF4ebFlUByb5o1iOPFx+c9/5XzeabPm0FcWe?=
 =?iso-8859-1?Q?C5HOUgHUXPEOZA/qbAN+fsLTNZAdAIbflSR8ve51K7aI3oEC4X3D0ReJk7?=
 =?iso-8859-1?Q?Vg38fn0CIqNL1tP1ZkxZR3RK/T94EuRE1l1fz/spd0z4C2aEy2kSz3eyHS?=
 =?iso-8859-1?Q?TKvFzbKMdPd5PYtLY3DRW2m8ga0thnxqMTz1yfqxqEY2s5VUEo57ATMRbX?=
 =?iso-8859-1?Q?7MvNtBeDS9+ryFcTNLgST800/R3r18/CyPj3nAay4hacluQQcOtsJlh8DH?=
 =?iso-8859-1?Q?nMU/60cIl1gfPj1fNCE5jhssAG5wKYv2kLCoafgSljyE+l6IhsMXeDNkgP?=
 =?iso-8859-1?Q?MGkzIgFifq2m9h6+JPzLwvvhFIm1htlhKlAp8PubP0CKxr3BU1LittJ4qw?=
 =?iso-8859-1?Q?ZGbT+inwiUDaAwbQZdl9OYCkCXOKUpgQ7H0iXxoO/ziyjKje57xSJyxtQA?=
 =?iso-8859-1?Q?Btm837Kek7Q+qfF7xVM8DXRVsjkshg4XZYrCqeNMc5R07jGOWVus6oWf6G?=
 =?iso-8859-1?Q?JsDiqDaeVD0MfZrWQakQhamMhItlq2hSBL1zX5FDODyzfdELcLuzSdrrqn?=
 =?iso-8859-1?Q?GlGOAEbmJLX5nEVI0FWqW4Q8QXzS5ys7vRIYmtYFU2ji9Pjd9WHu/wsanf?=
 =?iso-8859-1?Q?v0HhKhLVtFNFiQCmk6yMlMJLaJFm8hjRNDViRiySOR694tWbWRSSxJtTzT?=
 =?iso-8859-1?Q?ieh7LIatwq1wLEjPXKU99hKhkNaW4v21kfbuqN+GKSpVtqMY76N8y7/g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 363751a4-adf6-45bc-7b57-08de17283628
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 20:17:41.0842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dvoNEc1BoqYC5VwvG8GE/Twu1TTwlC2L0ytWsDsCPliqJr2NAsM76M5IgwTtkkcaEwvoTPt8ssuMrvL4j0rYwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7605
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 13, 2025 at 03:29:39PM +0200, Christian König wrote:
> On 13.08.25 14:43, Janusz Krzysztofik wrote:
> > Hi Christian,
> > 
> > On Tuesday, 8 July 2025 12:09:58 CEST Christian König wrote:
> >> On 08.07.25 10:56, Janusz Krzysztofik wrote:
> >>>>
> >>>> There is no reason to test enabling signaling each of the element in a loop. So there should be something like 4096 calls to the dma_fence_chain_cb function each jumping to the next unsignaled fence and re-installing the callback.
> >>>
> >>> So how building a chain should look like in real use cases?  When a user 
> >>> builds a chained link of her fence with another fence then may she enable 
> >>> signaling on the new chain link?  If that other fence occurs a chain link then 
> >>> who should take care of disabling signaling on it so signaling is enabled only 
> >>> on the last link of the chain, not leading to a situation similar to what we 
> >>> have now in the test case?  IOW, what's a correct use pattern of 
> >>> dma_fence_chain?  I can't find that documented anywhere, neither in inline 
> >>> docs nor in commit descriptions.
> >>
> >> The dma_fence_chain container is basically a single linked list which allows to "chain" together multiple dma_fence objects.
> >>
> >> The use cases is to keep only a single fence even when multiple asynchronous operations have been started.
> >>
> >> So you usually keep only the most recently created dma_fence_chain and eventually ask that one to signal when you need to wait for all fences inside the container.
> >>
> >> The tricky part is that since the chain can get very long the implementation can't use recursion or otherwise we would potentially overflow the kernel stack. And that needs to be tested and made sure we don't accidentally break the implementation somehow.
> >>
> >> Keeping all elements of a dma_fence_chain in an array and asking all of them to signal individually makes no sense, for this use case we have the dma_fence_array in the first place.
> > 
> > I'm going to submit a patch that drops enabling of signaling on each link of 
> > the tested chain, as you suggested.  Don't you mind if I add your Suggested-
> > by:?
> 
> Sure.
> 
> Thanks for looking into that,


Hi Christian,

Okay, so the take is that that IGT case is non-realistic and that that kernel
change is not needed. We still have a problem with this patch here take so
long to complete in a few platforms in a way that the watchdogs gets triggered
and test case is marked as failure. While if we do the reschedule waiting a bit
longer it end up completing successfully as expected.

Since the goal here is not performance but compliance, can we go with this
cond_reschedule here? Or do you have any other suggestion here on how
to handle this test case and make it pass on those old platforms?

Or should we simply disable the tests for those platforms?

Thanks,
Rodrigo.

> Christian.
> 
> > 
> > Thanks,
> > Janusz
> > 
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Thanks,
> >>> Janusz
> >>
> > 
> > 
> > 
> > 
> 
