Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3833D78CB62
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D50310E025;
	Tue, 29 Aug 2023 17:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887F610E025;
 Tue, 29 Aug 2023 17:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693330589; x=1724866589;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lrsyL4c6jaIWyEsDL9d8kLaoRsJM8gAsYDgGI1Z4o54=;
 b=P0rznyvmKd+jURBTEf8R1f0EGOFccpsD+IjNeFAMRXzxSVLnckVGNDBF
 9iZQtmFOWG58Fqz2P7kBR1Wd/JlwMAxUhspKEMigY1YKps4lkZX+E2Y1y
 O3d0S83akQbp5MpyDjnjuhcC1tjzBbYcRi30upcwEcuuC4sCMLYNI3Flw
 sPNF1BI0iAMrZlXQgF/mZsfnpK0m179swJQ9wRrv9kC5xw4Tg97sGhtNx
 lZuHS2GLwylvVAaxLH6jcFr6QPjtDpMX88g1jx7wjdVekyVriWep9aoYh
 aoWOqLLc5zxl6ss43AmDDmEZwasDO/+rUlKfCG5N40vqFxyeb09o9osoi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="374337460"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="374337460"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 10:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="804213468"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="804213468"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 29 Aug 2023 10:35:15 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 10:35:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 10:35:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 10:35:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 10:35:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GovHESIJDDO/hgXvOb86tek1lGu+Gz0ANVrHxZnow9Cl5VSQCKDXxhOuhMfefn3Xd1kclD5yE8vNFP/0/rGjmGKJQ3i35C7y/Qn3Kd5r2tc1Oi+qZlWfiSNYKGkVsWXq+G424AIQL4gLM3zGgY/F/WGx5hft8n7lOtu6mL+OkYwmtNK9RqrrhtudBdBz9UocrLzGFtVh/pYlylIiW5iiuSwuztR+ycAj7Dcba9tO22Pyrx6VAFJuR77MmYWCWz7nss63c3x5g4MoYXngwiTE5xBT6lNU4wrEpHW0klM/ipGNLsGip9cCCeH3U1QcWcL0sLH8uv6bBNoN+DExtGFyAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEOF2fUb3SyQrQSzMJQ7nflpXMDImgqJh2d/Moomf8c=;
 b=kFPoz/3mbXuwhwqZ1By4vp8QONN06EB+b9NE4Vz7CNUv6GvFtl1xg/5pKhWAtt4jk6fDIDrPcGx78/7rcuCIFXdIYUYZdA481Lta+b/IxWluiNLeTZZTRry3A3NycMrP/jo62p5F7cNIwovPqCG4a1k51t7v78CrLSqdQ88VVyAF5ccOHiFTAOiwHe6OP0DzmhytytggrMOsnHNiMhsndxq70ga79JR7AFmQGaZLGGCnygZ5olDxnH75zZzI6oORD62DfpK+STa1UJOSFLxh05CJ20xobbeJibwZzNBmbWjA099cvodfKou7SG8ORvhTYAjRNK6Lt6nnTprDQQol0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4660.namprd11.prod.outlook.com (2603:10b6:5:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Tue, 29 Aug
 2023 17:35:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 17:35:11 +0000
Date: Tue, 29 Aug 2023 10:35:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/4] drm/doc/rfc: No STAGING out of
 drivers/staging.
Message-ID: <7ikyjewddyvfkf4fasop7ehfrj7xrifzlhftp7vfr4twbggcky@2ozpnk7fg7co>
X-Patchwork-Hint: comment
References: <20230829163005.54067-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829163005.54067-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW4PR04CA0104.namprd04.prod.outlook.com
 (2603:10b6:303:83::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4660:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b21fdb6-ce5b-4fdc-8332-08dba8b64b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zHpE3765OwThEl1PkIL1uK30s5wzkDiq5GrN92HRzoa0YBL01IJakwsyQg4KCoH6EZJbUrcg71wUaIz6BhJ6mpEzBjHDlKKdj7T7U72Tt2NBdek7ivlYhT0SK89JnkzTsmYnojEdCqfqpv5Vqb4CbFKTvcP/vicssGa69KaeBdp9h4fGrhO0wfdA2hnQ+5EdhHQjmC9oHOwL79tcipk3QwyRkDevKP53yJIl7A9uCp1c9uGCrzy1X1knT0H6u1v7TwmyukSbHn74WvO67S4oUDBeN8Q3eEeIj+NPPEiKPFQlFa+n5zJNVVTlHQ4vHgBx3qqmpHUFMM0Fq0kOehhVi0M7w9CyEIBmcB3ylXmrPJzRypp34uGcbu/lEgYzyWUMrZ1DJ1vfcygEZ/nfBddRkBGJi25NJzNqw7i1/bUQA1oGolQQG5IXHlA7bG9x3Sfd4h9O7px2iu6JXiPDGKLmnG5B2wrjDQeUDjX1fnMl5musC41FjHV1A/A4+ixJfFkdyVMX9qbQPTeA6Bebe2lgnB+F6hjIWfoGxRHWjS5IAGY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(396003)(346002)(366004)(39860400002)(1800799009)(186009)(451199024)(8936002)(6666004)(478600001)(6506007)(66556008)(66476007)(66946007)(6486002)(966005)(6636002)(316002)(38100700002)(41300700001)(82960400001)(9686003)(6512007)(26005)(5660300002)(8676002)(83380400001)(2906002)(33716001)(86362001)(4326008)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjJmU2F4cHVybHlUaWdzN3ZCVzRUS1B0eEhGdEtGT21UUVFKN0dNSitUdUFj?=
 =?utf-8?B?c3liU1kwaWJmWHI3QzdOV3Y4TkRjTkYwRElNSDdGT1ZEV0xHSzZIdjFpNG5s?=
 =?utf-8?B?eVU4RmhUeVh2bG9YTDNQblVVeDdVZGFISkNaRzdMaWZQRDBQOHZ6Y2pwblRJ?=
 =?utf-8?B?OEI4OFBYMTFMNmNrYnQzOE1zNHR5UG9VUXBpb0ppUm5KVGx6SERxYUx4L3Fu?=
 =?utf-8?B?VjEyNGdkOGJNd2pZaTNwcnFFRWt2eEJQejFob2g0RWdmV1hIRzVZT0dQYXE4?=
 =?utf-8?B?cko0cW5XQkZtMmhUR2Fsc2E3SGJES1B4VUQ2OUVwZDcwOEZleWNtczlDQ1hT?=
 =?utf-8?B?UW1YY2NYZ2VEL0NnOCtZbFRRSmdkbzN0Y1ZMMEhwd3VhaWVmTlBVem5SbGxO?=
 =?utf-8?B?Q0QyM1I4NVNVaEZlbWk2bmhNTUowU1hxbTlPTGFDa3J1ZEx0S1R6WG1rYnhj?=
 =?utf-8?B?N3pvSkNkL29hNElwekxRbmNnSEdDZ3JVMmlETEs1a0xyTXY2amMwR3F0WmRx?=
 =?utf-8?B?TWxLb2ZzQ0REeVp5TDlPeFduaWo3T0lhaThmVnNPVFkzWEV3N1VHTFlyQ2NO?=
 =?utf-8?B?ZFVKOE4waVVaREx5NkE1TXdPd25VbXo1bTRCUVoyUUNndmtMYW9idTUrMWRC?=
 =?utf-8?B?K28xU3VCdzZHbmpDY3U3ZXZzN0RFT1lNWFUwK2tESno0Mk9vMzhHdVZpcmUy?=
 =?utf-8?B?cTdYUWtOZEhnZGczTWUzbmV4cGpGZjhLVVlsUjdEMHpmK0J2Q3B2b0JPZWZJ?=
 =?utf-8?B?SUJQTksvQ3AxWTIzTWxsVUR6cjdHSm0zTDJ5VjRnUncwdVRtYlQzUzNDbVV5?=
 =?utf-8?B?NDlRK2U5S211RnV1U296Y2txN2dHamxSU1RTSjBnZnpKUlEyUlhob3UzRC9O?=
 =?utf-8?B?MUZ0YUZjclFhNDF6QnNtQmtIRXorVVJkdXNtaUpGdUI4ZVB6UlZYd0ZsWEd3?=
 =?utf-8?B?OCthNysyUGV1djduYkJSWlIvbzJUTDlZcFVETkM5cWlLSDRXYS9IVERJWXVz?=
 =?utf-8?B?ZGpqdjNrelArOWYwd2dnVXNwSVdrZlRTTS8yZUdwdWc2dGJTREZldkJHODRG?=
 =?utf-8?B?UENrSzRNTzhYeFpsY1lvbWFRTG9jNnVCR3F3Y0xoamZJS0kyZW5FeUl2UUR1?=
 =?utf-8?B?TzN5VGRiUGpBUDNVK2lLTzhsVzVnMUJrSGNCSHh0azcvN1dmL3B3ZDdCa2xj?=
 =?utf-8?B?S0EvM2VUL2Rnb2RNMGhIZWFmUm50UTEzdDZwbE1sVmdQNDByTnl0OGZ2dk9m?=
 =?utf-8?B?b2lZWm1YRXFNZWp6ajd5L0JOL3RNZUdMMFVrOTVKOHcxeHR3bm5XK2ptTEZG?=
 =?utf-8?B?enk3UkVkSTRGU3RHMVVZYndid2VsdEVqU3FSUERLQnBEQnNNUGZndW52M2Ru?=
 =?utf-8?B?eldGU095cDdUZUlkQ1I4NXJrbkZMbHM4cUFaQVAxdXFOMUpxNnhYbG9wRnk3?=
 =?utf-8?B?ZjVpbTFIOFVGOXZuYWN4Nkh1TWlrSTBrZzczVXhlMW1jTDhSbWEvc0hYN0Fy?=
 =?utf-8?B?TC9sU1RPZTZNQnI2L2lzZm1UamNka3FTbUZrZEhhcW9yTHBHM1pIa3FXQjJ0?=
 =?utf-8?B?ZGxOWWtsMjNjWEJ4d0E0dFVLeHhMTk5IWW02YmduTjIxaVEwVzNYT2FLdFR3?=
 =?utf-8?B?TXJLaCtucml3M05wUGZsbEpVSXA5RTFnd0hEMitRSjl1T1FZa0RXdUtlbkhv?=
 =?utf-8?B?SWlKcjlIRGptbldyaldSUWVENEtBbXc2UG1adzdkWHFBN251Tk9wLzF1eU44?=
 =?utf-8?B?Y3BwNFZFcnQvMXFuTHBwRWNwUDJLa2g4eTN5cEtsb1pNblIxS0s0US9DVVFL?=
 =?utf-8?B?bkYxSGtyTm9mT053RGN0NTI0bHA4SkFaTUh2MVh4RXJoa2d3eUh4dHRxZStl?=
 =?utf-8?B?Q1p3VSt1KzFldGhlcHVVL2NRaUpwU3p6Y0kycy9jWWlrS3RmTmhhejJ5L09W?=
 =?utf-8?B?K2x1RENvTjc5Y0NGMkhxRmlVUk4wamp2Q3ZQUndDdlZVOGg4RVk3TnJuZmw0?=
 =?utf-8?B?cHhQa3kzUnJ2c2s1S082bGtsRlluUUEzWFJFL25sbVBMSWticUN4MXVqQVJq?=
 =?utf-8?B?dVhuV3FXSXdGbTM0Wk1rT29IczZtU284ZG9odlB2R3VVMXlBRlpwUDFURlVZ?=
 =?utf-8?B?Z1BmSEVwSGtqa0gxUHpoVkt2V0o4c1pSVTNxWDZiT29YVjVwcVpMYjMrVXhZ?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b21fdb6-ce5b-4fdc-8332-08dba8b64b99
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 17:35:11.0363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnbQZ41V+Ie/tz5QtwRf5CkLcraH5soCYoMJZnX4AX/i5B5GSDUTdByOJOc5oTlfAEMe2bBjcQ2WgtaSsif+PltpuKeQRMuJ0IrWhg+Bz9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4660
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
Cc: daniel.vetter@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 12:30:01PM -0400, Rodrigo Vivi wrote:
>Also the uapi should be reviewed and scrutinized before xe
>is accepted upstream and we shouldn't cause regression.
>
>Link: https://lore.kernel.org/all/20230630100059.122881-1-thomas.hellstrom@linux.intel.com
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Agreed. The STAGING config is something specifically for drivers/staging
as noted in the previous discussion. If other subsystems want to re-use
it, then there would be more to do to cause a taint.  It could also be
confusing to cause that taint for drivers outside drivers/staging.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> Documentation/gpu/rfc/xe.rst | 6 ------
> 1 file changed, 6 deletions(-)
>
>diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
>index 2516fe141db6..3d2181bf3dad 100644
>--- a/Documentation/gpu/rfc/xe.rst
>+++ b/Documentation/gpu/rfc/xe.rst
>@@ -67,12 +67,6 @@ platforms.
>
> When the time comes for Xe, the protection will be lifted on Xe and kept in i915.
>
>-Xe driver will be protected with both STAGING Kconfig and force_probe. Changes in
>-the uAPI are expected while the driver is behind these protections. STAGING will
>-be removed when the driver uAPI gets to a mature state where we can guarantee the
>-‘no regression’ rule. Then force_probe will be lifted only for future platforms
>-that will be productized with Xe driver, but not with i915.
>-
> Xe – Pre-Merge Goals
> ====================
>
>-- 
>2.41.0
>
