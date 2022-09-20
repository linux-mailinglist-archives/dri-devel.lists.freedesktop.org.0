Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CD65BEE2D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 22:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7296810E777;
	Tue, 20 Sep 2022 20:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491D110E776;
 Tue, 20 Sep 2022 20:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663704176; x=1695240176;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XBjQV4Za+1SXnA2WP4RM+wktntWZbphOdeKl/9RD+hs=;
 b=NyfGfzAxeMItIOQtawTsU3U69gV8hqFaobv3PsvlRumS5CO8JBcR44sf
 ytzDGzbkp+THcC8ZcwfdRq8myOC6BVcAdjc+VO2Rzaz9bJvKxqDkL2wUM
 5iTofCv21DfXO7jyLRvNLQsLPl5XzIXr3JpNs0rS+s8cvIpUMxq6F6G9i
 rEru1HQiIKwVIIjvEG856w5cGPFCY4jkzlR0+WfLqL1iZpcY7qjz9j+bb
 LIYOC58iuzyTgiAgzW7L6tOGkUPKr8LnrCSFprgFitAWmrjX7+aekdvht
 a49gGUd8GwYPuv29sC3km8kfYS49K6t6pz2rpcRwRRNRKxHrPR42Ohk9H Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="298528141"
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="298528141"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 13:02:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="570229832"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 20 Sep 2022 13:02:55 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 13:02:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 20 Sep 2022 13:02:54 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 20 Sep 2022 13:02:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kt8u0VndtD65gIPOggDdPVAIAvpuK+lTsaM9te2rnHpwhCRzZC/rNWL/319Mx8h/pDO6Ohlw5jGN7b/z0fHO4ZiCd5Z9nt/SoMPjS7ibatb1x5Mx45m4A3qfh7kiG56Uinxu0ZrgJO5TkjuqFeCrESlDug7FF4qZCRT3LHyK2jFaDHkCXrkhWphJwZuso7Y+J+arDMel+LSbSkb2GXoAc9AuZF2tA1z6EdkcAKi8IUYpxaBqSR+AEcc+Wvkt+yq5DFHC66/rXpk+f0hAYeDBxj/tXqZ9OFTRKRsHNpEzfgH4zv+SB+7SiwL5TG5CblvDxxu/kWjZgqEuxttTyCAD/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIkWh6o2af/Mk2uMJ1xEqdq9Ltnb0sTpsWtI+4PHUHE=;
 b=BcHgAbY00td9Gt8Q4XJ5l7bS7ySzyxerGfya6T5SqpBCB6OSWIjbYPUdJ/MiBwy6/QFSDXwziojt+Xw60t3E4TFTtVX3IWbJAR4HYRsoLPSgp2eDLjw4QHXJi9GnlL3xxNIssEp+H5Af0bn+Kc0hcjvHXR5UdKB5ZpufjzF1R1oi3kWtzCHzCNskydyzqUlpm3BQqaSPJ5Qow28+7RzzoAT0C6buz1p9kFGNb7dxmlosfUg30sMqF6roru2lhj5RkyKpmkMBiFUQ4HfS+qt5BefaKDIZBsivFtan9CxgOjUHpmkJ6dcENLcQL+IAKaeUnp2iAA7VQsWgL6wgcsEBjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5615.namprd11.prod.outlook.com (2603:10b6:a03:305::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.24; Tue, 20 Sep
 2022 20:02:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7b64:871c:564d:91fa]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7b64:871c:564d:91fa%6]) with mapi id 15.20.5632.019; Tue, 20 Sep 2022
 20:02:01 +0000
Date: Tue, 20 Sep 2022 13:01:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/mtl: enable local stolen memory
Message-ID: <20220920200159.jjy7fdrslajxtl6s@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220920071940.3775059-1-aravind.iddamsetty@intel.com>
 <YynxCp0OGTJ/hu3J@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <YynxCp0OGTJ/hu3J@ashyti-mobl2.lan>
X-ClientProxiedBy: SJ0PR03CA0147.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5615:EE_
X-MS-Office365-Filtering-Correlation-Id: 98ebb3d5-68e7-4fad-1122-08da9b42fb82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4+1QxcE7v18V5JZdn5zJQhhnRfZhj6y/to9I4K9fDLIEnIhMUBrKe9ncH6OCjtHzGT96qBPZqFl5ld7sVXPNEkCVjWinCZKGf03/8F0XDF9dk2oS2Cd4OAYXmX0OqtT9b6QpOslvqBmuhfISRamm9+GcyP24AX/YBjo2E2tAFo1gojN3HOWn2D8zfi59QElktpoiAs85odSF3pIVyWHCQa87uXbchB/0ALrXILSJDVccfQO4WvZklhVRk8O0FSM7Kco7hYbleRhDTuxjCcpqrU1q6szQjCfL9E9rR66yxwe8Tk+HB3tNjYuvU2men8zF2YqeHAMPUyxahvIFm/OGdLftrs9fTnSBiv3HCRVyVo/Lyzuxp/NCWa00+pBfXgpG1Hwd3cyZDUz8KP4dPiXzuOkK1sBhX9Q7DblOnsGTBoIOXhJsYAOpbQcogmQFZ5iojGzU2AS96ZRH5yR/qjuASMEe4aifddu/ke/j2H28gaMK3ydxBHKrs0obDIszlQntk1iBmP5DWljzNadP4NW4yfUkueyGQZI1VKEYKyJoOY81O5cGm3kQqOABoG+7SNY0Zu4bqoi/Ux0hPiZa1T5GMLXFG7T8Arcl6sFnUaE64M3SQlEZkTS1pVXEm6ZxW9oV/KMpIksR25xDcabjzctyy574+5M44Zf5wH+Ndm1H1TkjoeJxNYwSGwBOiM4MFPrRKDP9m9Mm64CLon85TA48rA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(396003)(366004)(376002)(39860400002)(451199015)(41300700001)(478600001)(86362001)(5660300002)(36756003)(4326008)(8676002)(4744005)(66556008)(66476007)(66946007)(8936002)(82960400001)(6916009)(2906002)(38100700002)(6486002)(316002)(1076003)(186003)(26005)(6512007)(9686003)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ua01nBo2t4ZHTaDJhqqxOsNv/fqt3Rlq8xsz8kw+bP+Qz0HDfCF4A61ojVuy?=
 =?us-ascii?Q?e/xM05mXXZWOcKm6PvCJNw3Xt0aauc59jpRVjW5K+vRCRaQwBtBSaH/TMuLd?=
 =?us-ascii?Q?4BBQ4JJer1nNXZNVWx9o59Y9iqt/jmSZ29+fWRG2ot2Q9WrJrUoOszaeqBuy?=
 =?us-ascii?Q?pI6sVHjfzvd0l+4Knl1ff2h49X1gxuSHF5awO+5yXC3ycWWUBWeLAEup5Dtr?=
 =?us-ascii?Q?kEre6T3grVI7tMDBkzVqhtLDGpkapjLBksBKHe5nLukiIeM8rWk4erNNchCK?=
 =?us-ascii?Q?8vrToVBOb6xOqplR8YI7CWd8q3xxPyIpcVDnehuAcxEI2cjya5CXq/7jtSEe?=
 =?us-ascii?Q?A7dXa+yWPPKhfOwN097VvzJyxN7DGDdNYfTAGFl/h373YXgGx+aOy1edb2JW?=
 =?us-ascii?Q?bGA1lb+A5+1eWAWtSI5jY8kbJXndp84/vXBlFzaGdgUgR0zpUguJ37TK0oKs?=
 =?us-ascii?Q?Ex3cWrfvghv5GwOqoUZl13Qkh3j0PXROTRf8JPfP66FdXPRN/zW6kWkkSrJO?=
 =?us-ascii?Q?COKn9cCXZhqfAIBBG4aLbu89PqEOy9hFtQTgyus1LszCmf8400Q4GbnVTQPW?=
 =?us-ascii?Q?Zn1sXlyd0gG8DQ71GHCNcRjnAjOQUnz+YT+xI7cCE7VNYGj2fE3x8NsjH+Mv?=
 =?us-ascii?Q?DnqwmjKpHSsD27q5AMAD5mUilbtGYIToxL2txduEAM2DiUS3o0WknDqJhuRn?=
 =?us-ascii?Q?mNC7WFf3SQaP3mzW20hKBpU3Ao0ziHucbRc8c2yu0dKACg1Pw8AhaWIYbyMa?=
 =?us-ascii?Q?OOcAZGlErAJj5qR1hoSZlX2eA5Jovf3f0cAjnsSptTL9jJBPcz01ZyXE4Ca8?=
 =?us-ascii?Q?pAJ5y3GlcX/NgN5/dQLmQutoa5f4RsDE702lfc9SCzkUVWU7VS4/hb9nzTK6?=
 =?us-ascii?Q?S+XCkf9y6Y205WGaDpTzq0LHVzSPbc0QesWfVu6hR3fA0/Q8BXE1UXCxghUf?=
 =?us-ascii?Q?BO1o0pe1yOHfz8FrFUHE+J3Okch14RF4PkpzptOTwv389TV4/72Da5ZRFqKY?=
 =?us-ascii?Q?YIEzsHqOhXKfW2O3BTYdbPOp0sKreCRTq+2qSBSlnh5Cn5cOHv+VtYgMi0Yh?=
 =?us-ascii?Q?4r5xuy3u4Rcqtf3bw+JripgGv4QrM+I0reYv9buVOl1vijMq7wBC7K+OT7zF?=
 =?us-ascii?Q?3cHuqdVHKu/3KeWFToGk0kQSdzkB+7iTCF6k6HB6kbtPSLZFDianv5MBogLy?=
 =?us-ascii?Q?CVKpYkSPlgy7/wH+Nfu4tz/WrvjqGG9vec4mBgAVzwxzoHKKP5WVFAlbm+/h?=
 =?us-ascii?Q?G6MRr/XXnng6nLewOee5rUH8SiMIBZl0bSkUKkK4Z3KV8/nziI11fBgL+z+2?=
 =?us-ascii?Q?TbxQ7pO31hX4p9rsaLdFvfG261qd9Q6E8U8jm05P8UUyMW5MctIyDPRvRYKF?=
 =?us-ascii?Q?xHvvTPjB6sOilzxNteeUFQdWXIl31p41pZLm1pdGpQLL552wIbGCkob8V53b?=
 =?us-ascii?Q?lrDJoFZ/vEPhJ+u5NySnpgyznGQGokJhpa4+4w8pzpbIJt8xIaEMIQvkVfUi?=
 =?us-ascii?Q?whGMlKsF0lpMu3Wyl9yCG4cwzJBlwVDuddq1dc5grRSmiFw7OHP6GDAtVPd+?=
 =?us-ascii?Q?AF6NIk4rphaGeLEgLc5EH3IXYJ2CO2j2oMDovKla7rv5Klb0zM3AWd4NkdLZ?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ebb3d5-68e7-4fad-1122-08da9b42fb82
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 20:02:01.9066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FOwLuqTtxUZYarRkGVxRFHhojOXPtCOTKNX2LTt5l9KtHyMR3acHW1nG1gnEiZMFHqtgOOife/Pd+nTjbE3vAgfeZIzvo2usLsoZgnRPolE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5615
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 20, 2022 at 06:57:46PM +0200, Andi Shyti wrote:
>Hi Aravind,
>
>> +static int get_mtl_gms_size(struct intel_uncore *uncore)
>> +{
>> +	u16 ggc, gms;
>> +
>> +	ggc = intel_uncore_read16(uncore, _MMIO(0x108040));
>> +
>> +	/* check GGMS, should be fixed 0x3 (8MB) */
>> +	if ((ggc & 0xc0) != 0xc0)
>> +		return -EIO;
>> +
>> +	/* return valid GMS value, -EIO if invalid */
>> +	gms = ggc >> 8;
>> +	switch (gms) {
>> +	case 0x0 ... 0x10:
>> +		return gms * 32;
>> +	case 0x20:
>> +		return 1024;
>> +	case 0x30:
>> +		return 1536;
>> +	case 0x40:
>> +		return 2048;
>> +	case 0xf0 ... 0xfe:
>
>just a bit puzzled by the fact that case ranges are not standard
>and are supported only by GCC, unless, of course, I miss

clang also supports it and can build the kernel (or a great portion of
it).

Lucas De Marchi
