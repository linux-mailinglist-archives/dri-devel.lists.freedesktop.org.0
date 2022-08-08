Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 984E158CA9D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 16:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDA290BB3;
	Mon,  8 Aug 2022 14:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83ADE90AE4
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 14:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659969382; x=1691505382;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fmeZTjfgs4eZF5t7T3PM5i96lpqQxIPhzGO5evQQA1Q=;
 b=QqQVY235bpqBX7QA/RCxM6r5x9sKDhjCvJ6YuXAYJBp7Z9uvmkGXeY6a
 v9isjMYUYEZIREZPLgZPd6J/UTTX1mtebhhBmQH+s0rRGATDeK8+Gr/2p
 gPyM0aGUjgnD5HbCNema1nG69q0mRT8C/+J93m7HaOSxxMmKgLi9ukyMS
 EpWqmqZXqON6UlMkMjT4VidGRPciFPta0ebyhyZhEtdkNd7H0oQYHGhNp
 N7r0FLMD+F6UPph7Silmh1ZzDXNuHwHHdDKX5zlshGhCMzFTD4JTRseSn
 BdpDFoYPBTTTLB9HDzrawF7Hd/X6ywhzf/VoiJvruGabvS5+WrUCw2/aN Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="290614471"
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="290614471"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 07:36:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="746662826"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 08 Aug 2022 07:36:21 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 8 Aug 2022 07:36:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 8 Aug 2022 07:36:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 8 Aug 2022 07:36:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLiRoz4RurB3evpPM68N/+dTn0oDL3bk59/gRJiz6X40tP6/1rpPlTN3ej1XCEGmB+jwZrJiwK42Nf0Qpv3WN+C5BVn4NQlbMpFSTkfKPAMq0KEssI4x9M1HPOCYWgMfloY0JOCikr7AZ3zEKOPnEdgApxxBRx/iiRUkbJMeeAQiBfoYyPCQWtomVZKutKfWY3bLxRhP/V8YZ2ES3bd6nLjfMd4wqNTX3K1Q+XZYp8SWPzhX9n7+Xgb7Y2liA0BtHC8V2uJ87VqyAKdn4wKIemUKcqdhtUAEj1WEAx9ldqm7I6ZQM8uRG3vNjqEeFHFb+pSzMGYvXXb4XeD9iOfCjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAUrB4q5NNDSZKWxPRYLEZz9ujF/e8psHroXj9w879U=;
 b=WZzpaovLrToXmTr5Eo/mGApyn5daKUSYvtRnhDDzUGmyzf6Hw6AM38uTlOOwTuCStFZxav0I/4tcvkEqiWJaMaa5ueHg9ZSeiB73rn7Vdg2EsXQlXOIC69c5Q9ETU6mScP7G/S2zpzktKy8odwnlmBQZ8GcNK6N8hQkOtqqtGHZaC9vPnaLNVl37z7ApogNPjSOTeA6a8inVPX8tbX7Zm/RpGT0RBPwUwNlVnejzfCA4ela6BRSW1YxgvgV4w5PGHLI+LO1V0MBk/wg1Q2uyKDvmPKGQQ3bxo3psYpi7a1lz513TK8nA1SYtnj5tga8c+alFmuidYjTiIdlyO94ANg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6782.namprd11.prod.outlook.com (2603:10b6:806:25e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 8 Aug
 2022 14:36:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::a012:82da:5edb:513]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::a012:82da:5edb:513%8]) with mapi id 15.20.5504.019; Mon, 8 Aug 2022
 14:36:18 +0000
Date: Mon, 8 Aug 2022 07:36:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 01/14] iosys-map: Add IOSYS_MAP_INIT_VADDR_IOMEM()
Message-ID: <20220808143616.2oefccxjntucfun6@ldmartin-desk2.lan>
References: <20220808125406.20752-1-tzimmermann@suse.de>
 <20220808125406.20752-2-tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220808125406.20752-2-tzimmermann@suse.de>
X-ClientProxiedBy: SJ0PR05CA0150.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c12f9ab-9fbb-47bd-2c87-08da794b5b20
X-MS-TrafficTypeDiagnostic: SA1PR11MB6782:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sXIBxcmNaIAKcySNPXBvdYWeMhvEzTGT4Hh1qT8luSR0F2/nle1BBtAJYgC1ysyWABbFDI5PzSjhP7MJlUxyuYnXBsvlo1jsS/4MApjprm6rm9bpQw5hk8vz7/4V2Ip+V/kMrsOvRQ2oWM2FHzoAqp8v1ZVXdHQCaftFgEqvkOJA5L+tSyj09wmHrCf9VwItgIkLVj2cMjarrv9FMoFlTPOODcSHoZRdFelf9bz+L3x1bbEZiIpWYA+fygAJjPoB7cxXQz2FgnEhVb0jJJ11O3+XhUCU8Vd9geAhS9JkstzbZzxKSptgxSI6tcODIjnvAN1l+K3vrb1MayeyIUDeRFyIejNXAUpd8p6Ah2hNGHfghf7qfJ5V9WsiSNHymBcKP5QKqYkHgX2OCyA+fSGnBR5u6TOQuEWXwdXinU0ybqK+ejdWOTVnNpg8FgwqUv5t3jlOjWh2HWDMYNaw/G8PDeYUjyen1mHQ9dIpnJVXU7Tv9HAmzm+kNznPWNN8OeYifSOZW5Tw+hE4DWcu39ZsYXvQ676CjaZ+sJQsttOaDIgs2D+bSnDevn5eQNQMUWlRLbiqDOtfhPd0bUkz0ygSnFGIvgXhCpFuWrzNnPXPuWkOuYNeeQ+flZ2FKycZ2mpewpz9RioVYu3w2l6gm6Dc/15mrxYIs0WCV6eQQllJw9ii9HUjwnNwVVgb0ZEuqrQtFVq+0tJxHcrz72nBNB2iqE9hA42j/ApB8djPOXeaT2GlZEjn9Q/osZY3USBdpjnR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(39860400002)(366004)(136003)(376002)(346002)(83380400001)(6916009)(316002)(82960400001)(1076003)(186003)(26005)(9686003)(6506007)(6512007)(86362001)(41300700001)(478600001)(8936002)(7416002)(5660300002)(4326008)(2906002)(36756003)(66946007)(38100700002)(66476007)(66556008)(8676002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3BtHBb/pqX4UNq5zrkjAD4y+YXTunGmtacokiJF1ZkLoMNtTxeUc0x2yOQwc?=
 =?us-ascii?Q?DPw72U2bI/+uKEaXv3QdWTTqXPfJMsGyRxU2y28Hs/PWh+k9hgaNdf/Qa89g?=
 =?us-ascii?Q?GMR7Qhc7wXQ4AozOlhxyljSk2o2ovHL2ngRhWnvIMf8dXfxZhd/7SxOUvALe?=
 =?us-ascii?Q?RSTMlixsJdi/en8vEhyIfHEKO2yAIOoZgNWLejJzvrj0CvXFL08RoowOVdet?=
 =?us-ascii?Q?fW+FlzNZb5LiCJjURx4yvwjAHwKto6M/OdZabo2Z1dipmVQnupjT2ufHdlZg?=
 =?us-ascii?Q?imS8P6PbsKXLci5DTGD4x+ypOKairjH8SKPl+8NkvFQTNwgB4DecRVlMeeBd?=
 =?us-ascii?Q?boNKOwU20P8oXNnrAt0bS9+JVvtOrtECr+LYoGezXqZ3AAsJBl4P483roj5I?=
 =?us-ascii?Q?b1u3W5ycbby9/CzL6Fyk+ib+847FK1tkj8fZHLsx67FFYkUEE512gJQ/dW32?=
 =?us-ascii?Q?bUpD+805++l3MAJ1hfzXaEu1fp2I+08U4bXCa/3kQ98Aja03qpelcvWRBhhq?=
 =?us-ascii?Q?QbYqlb9pGiMG0s2RJzzMDenepasFDqJCw+mdtbeb1r7tyfhLoh3VXEw4HvPE?=
 =?us-ascii?Q?mn+Cs7w9HuI1X/uIgh9yq90yqRQO2w7N4xmzm/4xFFKw+G/quxnoMTl8id3m?=
 =?us-ascii?Q?+v12Sal/2ETnB3FCq4OaAFZ9k/5I5Gq4hponkOCNIjeRTWI8IL86geJTsAkI?=
 =?us-ascii?Q?EhLDtJXS6EDZQ0hHR2yZ8jupobLJV1NvEMhcs1LuBrpCmRunQa+TzFktz9CB?=
 =?us-ascii?Q?ZMksw7Hg3Nhp6DHJXH5TIA8+h+HmIYUJIN0aW+rl24yTwSoDkJDdsYnJZ/ux?=
 =?us-ascii?Q?k5v56NjLNgMeQMGfULcxzDILy/vuVW76x3lUJkueom6DwMxrmaYeammBiQZj?=
 =?us-ascii?Q?nesquumsUwY291wGf5Tw+Ow1RS056rPsaIp1Gx0VLFPRLc9ZXapeI/IX/P/Y?=
 =?us-ascii?Q?BiZ7Kk00tqlrDKfNpzPvym+YpR/JAu084xhmiMOr9ZVh7riDzhPuM49GlfJ0?=
 =?us-ascii?Q?kKt9ZP7q77GvkYA2o9ZWZ6S4IKbrMTL/Lnj3MnStf5MOiukSBqSO8wzVwW24?=
 =?us-ascii?Q?vZ7UmtoccZFq9spfXQ80bPrAKdK9eUOkQpekADA1Jr50ZGKLPDj8v0IBNru0?=
 =?us-ascii?Q?3LVYRW7oBTjWxnL0hNTCnSTzzZdOh14W93awuCmgFk1sRu1xQVYFaPq9wPVE?=
 =?us-ascii?Q?V3FV4o5PFpP+VxXtTT+27znEQXZ+SFx4mJP04CkB+hICF8RXLMIhsUA4A9yM?=
 =?us-ascii?Q?xrcSXtGRTS+KGnOZBict4eRZ0uPhGOW6/8IRU3lcTXankkoXPJdDnFbD0obm?=
 =?us-ascii?Q?70QJaABSuH4ahc/uH5E5gaoTiy5BQqAUZ8+cDHU4yrB/BR+aL02OM3ZyW+TU?=
 =?us-ascii?Q?JORr7rOIA6bk6FewthwlkiIT750N8Gs0HY3d1PdkkPAw3UxFUtjwDUznHa6E?=
 =?us-ascii?Q?ZNd3/kfKSrvKTc2hKBl9HhhQwelCfFpIFoOrjbRkqLDdwFAXlwi6UQr9m+85?=
 =?us-ascii?Q?w3Ljxf1YQ8cLj9SWCzwsoZK3syoE9gEre77wuEG+quHe4FAC1X2dblh2RYHV?=
 =?us-ascii?Q?GoZp3f2SIhbl8GnPYt/TPsh4VQkHT+UV/SlcKWf1ixgaX/mhrZXCK0gqRi1/?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c12f9ab-9fbb-47bd-2c87-08da794b5b20
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 14:36:18.5939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UrNMURFLSevJkbkPPJxdMI0Fscv+4PDI1L13l/gUaqz3eslokFQxQYotZdt4/wEiwT4Fo87vOBsrZC5Qm1nzGsAI+Xskx2AnStp/LK2n6v0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6782
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
Cc: linux-hyperv@vger.kernel.org, david@lechnology.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, javierm@redhat.com,
 virtualization@lists.linux-foundation.org, drawat.floss@gmail.com,
 noralf@tronnes.org, kraxel@redhat.com, jose.exposito89@gmail.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 08, 2022 at 02:53:53PM +0200, Thomas Zimmermann wrote:
>Add IOSYS_MAP_INIT_VADDR_IOMEM() for static init of variables of type
>struct iosys_map.
>
>Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> include/linux/iosys-map.h | 15 ++++++++++++++-
> 1 file changed, 14 insertions(+), 1 deletion(-)
>
>diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
>index a533cae189d7..cb71aa616bd3 100644
>--- a/include/linux/iosys-map.h
>+++ b/include/linux/iosys-map.h
>@@ -46,10 +46,13 @@
>  *
>  *	iosys_map_set_vaddr(&map, 0xdeadbeaf);
>  *
>- * To set an address in I/O memory, use iosys_map_set_vaddr_iomem().
>+ * To set an address in I/O memory, use IOSYS_MAP_INIT_VADDR_IOMEM() or
>+ * iosys_map_set_vaddr_iomem().
>  *
>  * .. code-block:: c
>  *
>+ *	struct iosys_map map = IOSYS_MAP_INIT_VADDR_IOMEM(0xdeadbeaf);
>+ *
>  *	iosys_map_set_vaddr_iomem(&map, 0xdeadbeaf);
>  *
>  * Instances of struct iosys_map do not have to be cleaned up, but
>@@ -121,6 +124,16 @@ struct iosys_map {
> 		.is_iomem = false,	\
> 	}
>
>+/**
>+ * IOSYS_MAP_INIT_VADDR_IOMEM - Initializes struct iosys_map to an address in I/O memory
>+ * @vaddr_iomem_:	An I/O-memory address
>+ */
>+#define IOSYS_MAP_INIT_VADDR_IOMEM(vaddr_iomem_)	\
>+	{						\
>+		.vaddr_iomem = (vaddr_iomem_),		\
>+		.is_iomem = true,			\
>+	}
>+
> /**
>  * IOSYS_MAP_INIT_OFFSET - Initializes struct iosys_map from another iosys_map
>  * @map_:	The dma-buf mapping structure to copy from
>-- 
>2.37.1
>
