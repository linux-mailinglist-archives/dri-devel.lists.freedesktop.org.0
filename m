Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B46725F01B2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 02:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012B710EC3C;
	Fri, 30 Sep 2022 00:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16F310EC34;
 Fri, 30 Sep 2022 00:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664496639; x=1696032639;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D9wGp9/6KRZ1de8Ip7HwVsLCroDKC7m3tL7Ge54uvJE=;
 b=mKUV8IQZxB8/46gnhowK8NfM+ybNdWnVUuy1N2jmdSYho4qHCt+Y7cea
 6fgFalRODpY4GlBsNGayQ3PP0gLn4WHOdmclVotN7LO9hHZLQLxmi0bwD
 +4Gy1oMSrBkuc2H1nWi4gmFBK87BJciGbRBsWmmExWb/WASUxkDn3XfNu
 2WK0QUVt5FQGjA4pJP+PJymHT3+2L+vybOxRtiAQSsoudpO1v2tB+SubB
 1fzd6t1gWOKX48ssnb6oXQ8KTUEIqv2E0fU0mOLRFMQqjNsb4HVp5gHXK
 GeDWTCnOIU8ein3GS5xCYOlHZzlP2CKiw4MoRxie9en0CTmGBZJ862Y5A Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="366112081"
X-IronPort-AV: E=Sophos;i="5.93,356,1654585200"; d="scan'208";a="366112081"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 17:10:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="617809019"
X-IronPort-AV: E=Sophos;i="5.93,356,1654585200"; d="scan'208";a="617809019"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 29 Sep 2022 17:10:38 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 17:10:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 17:10:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 29 Sep 2022 17:10:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 29 Sep 2022 17:10:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHa6mDnNedx8aCg8RdkCSMFkidZfVC2SXE+SVDMD0tFC/iWDtzpmxS5CimhTwbzbBOUAcFS0SXYruKDQeBgrdiedbKpjCiCvpgXt4Je2F54A9/eDn1Ocf2tehSBRNPANt+GaadbXNtT898u298eqoi2IcdOsK+t3xfkY3fuTZpeAs8Lof5Z+E6t1wRSUTbHjnrdEVvfDL1erVr0FDLpOWFNsdOpwpanjv0HGZ4yGzhm/NVMAEJoUdgUFYfXeXKR8dGLYGsJo7lt5a6GOfjaLQRXPM8T6R6VetCKeD1r6S0L2x4E6vOi68R+/iAvFbW0Z4ID8bXIsh5o7igkXGrvWuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9wGp9/6KRZ1de8Ip7HwVsLCroDKC7m3tL7Ge54uvJE=;
 b=VxkQAZvyLF61y4FY65rNzkp5858mlYtJzSnjQNows9qCWrJOXhbqHsLgUUfGZh64ot/0AjrGBWovh2LqSxbdxgXVd5oHBxENAacO4UIE5UW2uUayfboGF7xPGNBxLvgWBYOxzsAsvw7moU5TSpzPtbX4mUwyFS7bicOYMesrhS8xu2R2pGooZgLMymHCxh15V/a8ya4JEDRyR1BEBn0k2rpS3Nu0Z1nBPjLzuvB7CCMyHQ+oM7zhIGsiidI6HPqhoQUVQSTHDvhXsp/o1ktIsnM0eMVVVsKf5WqmmWJwS9KO7lraFuGcRQLXU2u6QKz9K3bBPzW8CfE7DEKmA4ZG5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6797.namprd11.prod.outlook.com (2603:10b6:806:263::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Fri, 30 Sep
 2022 00:10:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10%3]) with mapi id 15.20.5654.025; Fri, 30 Sep 2022
 00:10:35 +0000
Date: Thu, 29 Sep 2022 17:10:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v4.1] drm/i915/mtl: Define engine context layouts
Message-ID: <20220930001031.35cnjng7txadie5b@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220928155511.2379663-1-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220928155511.2379663-1-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: BY5PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:a03:180::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ed2f20e-8d90-4103-23d2-08daa2783257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jMqgY3yNgv969jiC0WNwVMCzsfbzmRxMJ8re/wJ5Dya9FRq9GadaELLpa/CcPCprELG5wRsWqre8YKN07M65bOGGJ2jQ1Z+2UJkfFiJ2G5/bOyAlMy2Cbh+fcTXUvABdVjNxPCdAOVsfMZChFmEJfu7wsWi5Q68sDi1X+Xa9h5+I8Ve9+WE0qnbarZWHtxSstwlQSpio4O4GWXDtKrVdwS4qq5sNMs7HQHmr6c9XujJpAIFp/P2/1mCoFXyyStFYWXLPK7iATeCAPSo2N+H+XAGuovkKC9/FJ7Vrqohef7TYnRKXSMeW6XR3Ml0vUvtT8xA4v0PBzrFZt1UCYEig0FuDcN9oylF4phO6+q+JHV13KYlbPRbFQGAyxiqwsUe+/DlZIt/VAtLDczLzEf8s7ru4BDDiA1x0KeETsvpnZWskEe5/p/StTWP8hdzSSuGN6xw37iSEo8vytv6NjfTVEdnPtH0KMfbRLgZJb1SgLGsD9Z222aUdK5O4Qui+jMq8vN3qeNDOVZdoneyDmcBraWXsn8jJy5+Th+YVMJhFfiotMAEm7SPVbXiOBMyH9gikG1sWfZbaimTVAOoenlLIns3MMp/uUDgQxbcM8RPb9ZcXJD0CAV+tBlJN9IuFk1IiUik7DX22IeqMUIRTH+3HMwOOHFMmaoarlOzKJB1Tj2ueaeQ/k3KmZ4G1a0TPQCW25bETq1m/RK1CXUFnzoLnMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199015)(450100002)(8936002)(316002)(41300700001)(6636002)(83380400001)(36756003)(26005)(478600001)(9686003)(6506007)(6512007)(6666004)(2906002)(6486002)(86362001)(5660300002)(186003)(1076003)(6862004)(82960400001)(38100700002)(66476007)(66556008)(66946007)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kdaFVD1Jo5Mi0rkjLxH6NYeIUsctqwp2IsfYh/ywDu/bDXwHQ8foh41SwiCD?=
 =?us-ascii?Q?49KXhNvIqxtBrsVU3nRq65Ho+Ru07FWwMqhJ8Mj3uI93goKvP49wQuryGndZ?=
 =?us-ascii?Q?IHu+VZAmf7OYNr+9DgLLTkI4EVDr+Q9dJaz2Fc7FU6sRS5gUeXaJnO+Hygiy?=
 =?us-ascii?Q?cyz0iKnhlFhcXZXPX/augnBHl+ZzqlllELAOt08pURrvZnOlJxpcM+Tw/nIE?=
 =?us-ascii?Q?h8Qh5XDqZAiDMfx/F0q1oajQRCqFfSX2WGm73GV5i7nfsE+aN9o9p7BOhLvJ?=
 =?us-ascii?Q?mhoA7Xb9Ge9HJdMhuDcPlj3dEfJUe2Qm1Nf96v3zuDDI42nQ7o1QOJp0Ejbz?=
 =?us-ascii?Q?+ndtGP+cLhqaVjq89R8iEx5RH8HeCYI9YQ2JrRlauCs6USM9b8ust0+sHv9c?=
 =?us-ascii?Q?+yrZ8Q4nNIUBc+/Dpk1GkKUx/C0MCQQWe69U0oramd0Bi605OtHESxevxsUZ?=
 =?us-ascii?Q?0GJZq8e0JjUC9ZS3aTXun8JRMm/Gv+kKHwdyjbTSbbf53G5zF+dUTngPOHoA?=
 =?us-ascii?Q?MI4idf4Zn+cKRPqh0gFTK7njBcWk38D3n4szA4WvexpQluDx0JAHKYAkn+9x?=
 =?us-ascii?Q?QwR4uB3yQNdh79YiC/FhiDK4NtMofLKG6yNc8hfC4dYOGTeO1IRobJkmwQNA?=
 =?us-ascii?Q?38QJAraAVUDklfW3iFgxRYnqDCC1qlSvGt6UfPCrkDH05DXOJgb787kYV5lu?=
 =?us-ascii?Q?q0IlK6Zj3ycZDG9pdlpKLxrsWimPUUl/oRFVDt1PU+kiWwidAszSWITXgmoF?=
 =?us-ascii?Q?/rxR2MZVLceZNYn1YhtyeB7VPzf5bjcMSe7WFWjiePLJKiikiOb8QZHwRZ1y?=
 =?us-ascii?Q?jLQhGMkSt0N0dXw4cQNBKBAwfUTQIAdN/g/LwAt2XpeQ18uJo5U1/mI19Tld?=
 =?us-ascii?Q?ubv361n4RQa/j1gFRqx7ubYZS3VDojW0XJwuHNL6JrABrtvmPyUDrZBBvFEc?=
 =?us-ascii?Q?K+aBUZtHyz4FKkS/kDxWIbeOUqfqOzouAGabMEUJazfuqYQ2ehAxnese57O0?=
 =?us-ascii?Q?wnUBGySGFV93vcMeGdR8yO+MdV8eU9hhJVlCvbWXp0NT5lYCmtFR+d6xzp2F?=
 =?us-ascii?Q?CY+QXTr4M/88Q0ByqDGnsgRKtskDVIOO8XPeZnvfQwhlN2OpvJQbqmTtEIEx?=
 =?us-ascii?Q?1eA1gw7IjvkLnC7f7M6WjPuVLzu5yagWjbaYDkbFQmt2Y8WWNC55B6z+aCla?=
 =?us-ascii?Q?uuOfBFs6de1XX+7enyaBALyEajfXYPA8J4L7RCqrjbdw9xjotqReQDxo/BHA?=
 =?us-ascii?Q?FrvlzPry4LDfqsAP4MiVn4aguWaAegave1jwcOCIzMaqDSZVGHK7+ziY03/5?=
 =?us-ascii?Q?u7OlsxRKVRkiZbFWh+LrXvYyg2l7No4ftAB1brVR2kWKJVSGImjjyaf8mulj?=
 =?us-ascii?Q?WdLCL5Ys0dnSG8gxZ1VVL7hYf7XawjNmpNafFe9QjUuYcPV+aogfSFDjwOPD?=
 =?us-ascii?Q?pcThTUbXAfkN/mYIwgTEJQGJ3KJMSScXLys3R7tY+GSVZxVKXdphgi453Zd0?=
 =?us-ascii?Q?CC4PaJhn205yHr1iM8W1jm9jOcIiyzCyehiLPxaJDCZHMsz/xKoZRlDdsEek?=
 =?us-ascii?Q?L7FEZD4/J26caHteUerYD3+fW7gaJJfhg7kDJzN9xjtB0TpqsbT5tI0upGEc?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed2f20e-8d90-4103-23d2-08daa2783257
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 00:10:35.2880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgY0SklDxO6C8LTzH/gzUZgBHf14Oz47yhA7s9EtakkhufeIc35g89xY6rF8nzpMEmanSARIPpgSeLpRkr3LJ7rnPfpHVkUCugXB4RocuYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6797
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 28, 2022 at 08:55:11AM -0700, Radhakrishna Sripada wrote:
>From: Matt Roper <matthew.d.roper@intel.com>
>
>The part of the media and blitter engine contexts that we care about for
>setting up an initial state on MTL are nearly similar to DG2 (and PVC).
>The difference being PRT_BB_STATE being replaced with NOP.
>
>For render/compute engines, the part of the context images are nearly
>the same, although the layout had a very slight change --- one POSH
>register was removed and the placement of some LRI/noops adjusted
>slightly to compensate.
>
>v2:
> - Dg2, mtl xcs offsets slightly vary. Use a separate offsets array(Bala)
> - Add missing nop in xcs offsets(Bala)
>v3:
> - Fix the spacing for nop in xcs offset(MattR)
>v4:
> - Fix rcs register offset(MattR)
>v4.1:
> - Fix commit message(Lucas)
>
>Bspec: 46261, 46260, 45585
>Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>Cc: Licas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
