Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C99DBB0CF29
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 03:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F406610E5C3;
	Tue, 22 Jul 2025 01:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k3g2EwXI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED2B10E3CE;
 Tue, 22 Jul 2025 01:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753148318; x=1784684318;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yvICW4FP8ClCmduelFfqnLXgYvJ6QJDQdwNqDy03asQ=;
 b=k3g2EwXImOlpnMhhZ9JtTyWn3Jg2o3+yK9aQZzM2sStohHwN37bhwMdc
 APsG/PMvgUznzY6jbQi1m+sIx864DyuTppO0sa+iElFjjlZCLY5CiQxrY
 81QgXl2DfDYuWwGgk2BrtBXgItXgKrQSiVyyJLBlkx9GY68NAkKwM5qXL
 Hx4cmXXiBPflBqQkQ7z42lczsttLNPhsYaO0zyv6rRX8LPVj/o5IV4T7g
 JZXoadrvfdEubf7bA5R1brn+ksfHnuOvQTM7W7tZCwHJTMNhUzcFhH1IT
 N3EgKyCHJQFQ/xjYFHlbhKoMAjE99Qoj9Lg6kPjyyM8aV0w7Q1gJX8SLl g==;
X-CSE-ConnectionGUID: x0/SdRvcQlCIMDY+hylPQA==
X-CSE-MsgGUID: XUdHJeyLQUO3uUdyH5etZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55532547"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="55532547"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 18:38:38 -0700
X-CSE-ConnectionGUID: 6siXHSS7QtyaCWbBJZtXYA==
X-CSE-MsgGUID: 4xJ2M8ohTdO1Ea1ni6v8HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="189945917"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 18:38:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 18:38:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 21 Jul 2025 18:38:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.45)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 21 Jul 2025 18:38:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iA91aBQVgyM9Fb4sWCy+B0TfMPKeYW35JPMpl6sbAt/FFpFq8hT/CXkPAqXkUStLmdzcHgZ49ewC1CYQii3f3k2G5jaNc6gk4+2QswdP1fG8Zf8EHMMyyudTiX9n3EhidTVI3lJKbkn6ncajrVx8qNetGtsmZJ+jvfeCXvfCsOyJTlOs86dYYkOirB8ScWlgdkRIjLxp+G3ltPViLgyv7PhkIdkmgJBSs+YYywgnX8yhZ7oflF9QyzVRUF+2bHiT+9aEeRKJhHA9zyFsn+SAQCZTA7Rum/yTilcpYZHXdqV5Tf4itxXn7zORhaCHh0Eg53d1rE4YopraeMIv2okxgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyzkzCIcwogHmz0YEP7kYRhiEZA9MZ8TPYNXCvD27hU=;
 b=FTPOu32GwahWieRFwbmk6HGso/YCoiWm/65rjGpCT2C9eJMdYZ90wYhNknhuA3lk+KZqf7tQuWHfoNWOoeILydJL5LrGwoRqShpMFQDIwB1jREjtwVQg/lJ1ZYrWLSqNqPp+MCNmbDFgn0PIrUIpbVmdaGmpVJe7V0KdIKknLkOAecRy/iYYQ4gDEte8exdrRYo/0AiY4zxS308EwI+oj3j5xK0ZIyEb6rm4Bef4H8iwOlYEJBEoHZhJCYqQ9hFEU7KzR392XNViAkv+FY0Sd9tKJ6hK++ztfcw8vBN6rG/kS40qIfIKyF2rQUuv+1KGSGldncFZvWh80D3RkxgAdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN6PR11MB8219.namprd11.prod.outlook.com (2603:10b6:208:471::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 01:38:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 01:38:35 +0000
Date: Mon, 21 Jul 2025 22:38:28 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, <linux-um@lists.infradead.org>, "Richard
 Weinberger" <richard@nod.at>, <intel-xe@lists.freedesktop.org>, "Linux DRI
 Development" <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: Tree for Jul 21 [drivers/gpu/drm/xe/xe.ko]
Message-ID: <esdm6jfdkdbaeaphyhtfsckiii2tptdpe6dffddp5sqyg2klhk@b5dtuayqqpht>
References: <20250721174126.75106f39@canb.auug.org.au>
 <70458c86-597a-4346-b18c-1fbd9a833a55@infradead.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <70458c86-597a-4346-b18c-1fbd9a833a55@infradead.org>
X-ClientProxiedBy: BYAPR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:40::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN6PR11MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: cd7b2db9-5c17-43ee-992f-08ddc8c0791c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1FVKFHHqnhQVLFJJjj0Dh/TTe4HcDVtA5eC7vDufalsBz+4fTTa+iuGPjbVh?=
 =?us-ascii?Q?mMej9LTjzCFd7Dpg9rDyAKjJ0BA+mTrocYOqOYC/rbjrKR4oETgfRcnDO0D7?=
 =?us-ascii?Q?2YxZkYoQR3UraPt0U2VdxwD6uibS146hZlry4nuT6Sp1qv8bNwhiZEBGPtj9?=
 =?us-ascii?Q?rgYXa84QnBVTr3mtMq1PtbMs3rs/73ISUUJ8d5iqh6rrvaNXMG9xvw7G4zz8?=
 =?us-ascii?Q?OJyh6XNVfMSHDtlWLOfA+rGpeE+KERmPk41UcK0j79DjqyweL466vDruSZou?=
 =?us-ascii?Q?1ZG1BgnmIKSbunVMGCt93KkqAOIzVHdPxkoBjnNdU7afbawIjI9YkeGF4Qtw?=
 =?us-ascii?Q?bLFf3vk9PPbRJgMGyhjlPR0xfB+PJCtnHrMFg2Be8vnusyXpzPGpbXtHmp8I?=
 =?us-ascii?Q?QkVuHRgYLbx00mFAHX7ThxAoVtsc4/zoi5dpaUe3z8/xUXLf81ggUJTD1MNN?=
 =?us-ascii?Q?ELoSy2JRvypiWG9JnfCl/IZ4fxWIF7YoDtamJo5TKbtNNhF5YXq4Ssn4AriZ?=
 =?us-ascii?Q?DnRsbjfe7aXXEBYP0lmBHJN/WusTLuqzf5k+kmRc1o5todzTne4JFMd2hJSE?=
 =?us-ascii?Q?OwGkfVxABD8AfSR1p8bCbmwriwxPYHKTQGmjhks0NNPICYOg2xTTXyfcqqI6?=
 =?us-ascii?Q?3IGQ9HNMHKmqjGjYpnSAmr7MawGepxs9XwzDvGZBSV5j3eVyvhgNVVk5w/7e?=
 =?us-ascii?Q?zKBpsaaLbu8UNeAKdHoCE75NrGTERMCHa1ptVhhHPCrPYpGbZ6kcKX5bFcU3?=
 =?us-ascii?Q?rk9kWu/K0Jbe0enxWP3Fje84maBwsn06c6ukPfeRoogx9clIkFGg5R2snFmZ?=
 =?us-ascii?Q?0SCkpKU9x8R1e9dg7Lqjx4jgA0V+ihx4NUYgu+5MB4F6FBZOwwHj3lzA3Z2l?=
 =?us-ascii?Q?M9MX5svO7Q5bOLLY7bJBaIcHACVG1rPmGAzn79qBg1mXiN+aXXZ9SxzxwaRW?=
 =?us-ascii?Q?0NuoPSwoEJDB6fqnfI0usX+r8iC7kI4832kw2OfQe6R/6toW8xgx/Sh0oJij?=
 =?us-ascii?Q?z6wLaNEY4mCDQNUwa5IELx7AyX+sKYEFCOLBsNgL7u5B390edCEjp6VY1jsW?=
 =?us-ascii?Q?2MsrL20Kte/b5wJKbften8OMqc+4OUQrQy/zEV7gLQpS0Lv2UBaEJudhkoH6?=
 =?us-ascii?Q?m+0V5aOJRX8SLZrB8B3w36D+rwRCQ+e28VQBA3cCTMkkIV1azZlg+zBqExLV?=
 =?us-ascii?Q?Nr1zSpTBmhp+5lbpp2VOyZ/CpUTpOoIq2Hcq0Fu4gxylvGkQqzVsNYCByByC?=
 =?us-ascii?Q?K31SJq4KF35kwjxOiYxFCm+UTZ/9iqpHqAcfSWN5YWBhkmcIEHBIbSBluVne?=
 =?us-ascii?Q?+gCEgJPOFOqs1LG94nsgEBfZG7/NP58v9uxKE7mwedDLXal4cHyRmbr35cj1?=
 =?us-ascii?Q?EICEc87VwCvKvmsjWtN+08614qgVvaB0MSiT3pYCXp+m7EQJ2IwUTE0QqiT2?=
 =?us-ascii?Q?g5N7sBK9Uz4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iW87jF8lLK1VaSVeG8SkLUannLqM3U5tMTiDufYdDA0HJm0Iy9P3OE4IZwVx?=
 =?us-ascii?Q?HqcL4r/JiyEGNhu+smU0VXh/StB0NQT7OadnZy4HEDiKf5S5i/Yly8qce4CX?=
 =?us-ascii?Q?oxVStGWShSAC3jJL33hA9Av29n5NR1j6tIUSolVoKA415RDdvAIM/bl38Sth?=
 =?us-ascii?Q?v0j4XOSFYaizPp+0WVM7bQbFei4dASf53xl0j+mK/0mXe4DgYBzdBnAifPdB?=
 =?us-ascii?Q?lUdRcpkLDcYj/VO3etUJfJC4XiKyULszox5u2qxavK6Y/aeyoBdfK8XPDXCo?=
 =?us-ascii?Q?s92JhmWb/Q0KPI7Rnh8BHpdM/z67jYizJxCuWoglWByixZlvUZbqHucr+Vmc?=
 =?us-ascii?Q?q/8uhrMzGnP8m2A345TjjSB6xLO0jJiDDUtT/YeFLaitHJMmqmMcnsrqMT1u?=
 =?us-ascii?Q?fLDRaJhl5fsKtYIltlhfSr4QvFZxEEuDLFgeXIwbqgMmTuq7JhRmPttCH/rk?=
 =?us-ascii?Q?VumI13eMfbQPzva4VqprqR+oWK/dpOoJf9S8Imxr6GxRQgX28t9kBWvg6Y3i?=
 =?us-ascii?Q?UYg+U5V50IyOqYnGA0M7oa2GDJzEVD/KUjbkDYo7G/3PI489PmN45n4JpZoj?=
 =?us-ascii?Q?6tWSffgFJuOG38iGNLVZSwHE4SOvfBz3xmRUg0dNemuKu4FuC/HA8n+3WKli?=
 =?us-ascii?Q?HaJLdHGugLmjrN+JJbx4wsdJBDnwKbDLQ4npWuoPdhtLtDUg7QYWMNTGSjZz?=
 =?us-ascii?Q?t2fQmEvI0PXTW2AapQpAnQTdRbAIWch9xpGsNNNczfrFXCK2ZcIDAy6djGAA?=
 =?us-ascii?Q?HkE0PhaEPtplt8NY2TGt3CQ/okPoJeiSQD6TT/2ajcIH3JBDuyiPzgwLjSKq?=
 =?us-ascii?Q?tOwR7rCtLoRJCd0ARuIR4aRCC1Cx1fCJNCAeci1Q12XyhOa8lUilFwX6AuGw?=
 =?us-ascii?Q?fogsWsZFfP156LHNEZyPJ7IcSd1T0o3tdwUok3ArQGMTcJnpn6bpYFXNg7U4?=
 =?us-ascii?Q?yzVdFeTLrVEzq/fI7jq8aC/JQvBSqQRM35lKNErWk1nwQinR7CQKFTMDaFu7?=
 =?us-ascii?Q?f5kyBba6NwFto+RRavdTb2jU3FxG8YWNkPxus2ZcER0xFGdI9+yDw2bs5ZKg?=
 =?us-ascii?Q?eA4fOxChKS7rfsgtmRXn38zF9T3Sd1QjtVDrsnAFGpByFZGvD8Uy218hwcst?=
 =?us-ascii?Q?Vktag5DNbriJkd6T5dQmWx3oCis/7mOTbmgXFO5vV2B+2kTt28gam0ibVGEW?=
 =?us-ascii?Q?ovjzfyChgdD/hp+TMjSn9gpM+ZHxEc01GsXwdsxTqV1mpiI7LnhQW7j4SKOt?=
 =?us-ascii?Q?80hs8vwrr4vSrvgF+KRg1JCvXtEAV+L+8mQDgn3pjJvREYRek3OphkJHadbO?=
 =?us-ascii?Q?WZGftdm2qknc1Gin3bnKT/fkk4MhiJ+GSc6kR5GGEJzpfzgd4V5FcmusphxY?=
 =?us-ascii?Q?xaavwSGFrM4QEKZYIkIQULDTUqW8VF1nDCJGDthaQDulzrFLPPBu4nL2ELd6?=
 =?us-ascii?Q?QZ5JrwLAO9I/LYRtiRbCSWNE/lZksdET8afoVEwgNh7k1F11KH2+zyfGEarK?=
 =?us-ascii?Q?akLg+XkNwMOodLEsy9aOAtRszs6WUc00zuT8aLXJ/eW74zv6XzlqzRJtMFZo?=
 =?us-ascii?Q?zgsrY7rZuEAx+7q9n5oT4AMXVYhWs4tPhQ9F4jubIPknjcy6GqTHt4Ib5Gso?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd7b2db9-5c17-43ee-992f-08ddc8c0791c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 01:38:35.1094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HyAwWra8aOTXYw6tpEy/j0WaDkY8Jf4ECf9I6/WzSBRbfnOV548EaB3VciAhn4BpCe3cdmwwkC3miBiwnbJG9sPlQoEM6NROdMoYeiBJdQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8219
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

On Mon, Jul 21, 2025 at 01:17:33PM -0700, Randy Dunlap wrote:
>
>
>On 7/21/25 12:41 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20250718:
>>
>
>on ARCH=um SUBARCH=i386, when
># CONFIG_DEBUG_FS is not set

can you share your entire config? I have all of the settings above, but
I can't reproduce it with gcc-13. Is this a regression from the previous
-next tag? I think the diff below should fix it, but I can't confirm on
my end nor I see how this would be a regression from a few days ago
only.

-----8<-------
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index e9ccab8aedbef..41880979f4ded 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -24,7 +24,7 @@
  extern struct fault_attr gt_reset_failure;
  static inline bool xe_fault_inject_gt_reset(void)
  {
-	return should_fail(&gt_reset_failure, 1);
+	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
  }
  
  struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
-----8<-------

thanks,
Lucas De Marchi

>
>ERROR: modpost: "gt_reset_failure" [drivers/gpu/drm/xe/xe.ko] undefined!

>
>-- 
>~Randy
>
