Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9668A9BC04B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 22:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8091610E4E3;
	Mon,  4 Nov 2024 21:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hPPQUyCV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEEB10E4ED;
 Mon,  4 Nov 2024 21:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730756926; x=1762292926;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FIPL1X7AllU4HCSOMzzX7i/kHJ1+AK69bQszfOs5suU=;
 b=hPPQUyCV0rALbqTjq1gtNvQT1B3wdtzgJPahKo974TQ2xquwHDiOF6ye
 QcAOE0Sp7Z2t6Igj5s7apR8YXtJczk4YJFpGNYnWPiepXjtAbfygRf86g
 wijMe0b0wthtFjd8aYqqdmZldy8YTE3QZZAIPE+YHQCKX9Ca6Daf3iITS
 a+LZfIFe0xjsAZXHq91E4p3UYb+BfngAq9PgVu7e28S7wd2V7UvFeVG65
 YnSnGre8Nu++goSqx6zuvptQWwNiqqwHORkiQzx59SEZSpJ8AtoCjIN2E
 +aQi4hEzQ19B3MKJzIwiuF8yxbWqCa3G934y5xKBP8/GmfPwt2wii8V8A A==;
X-CSE-ConnectionGUID: ITDn3aQ2Tyqmyn4sXGzPOA==
X-CSE-MsgGUID: q77vvua7TQm/RD2SIw0zzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="33314903"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="33314903"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 13:48:46 -0800
X-CSE-ConnectionGUID: GH8DUHzrTdameiVBz+VtGw==
X-CSE-MsgGUID: Oq8qERpQQsOYUx0OJtIvpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="88296170"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 13:48:46 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 13:48:45 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 13:48:45 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 13:48:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVWuDJiW+CLTPFPvOczahGzh2gC7V9jlegdgjWt2EeN84egwpYaqERsh1wzotcRdhVp5sKOFCKi9K7c97HJ6zKiPsScvkcaWZfeuFpsoJJ+XfdivpfsBgF0ezMlt+9iCxelZmdI3n7FN8Y8Dg4E007PO144W5w+PhNI7UIeRfWbk2DnZf+AP8Z9/cdmgvZZG2FSQ14VT7PAxMT9oixDzAOTYZ1gdKxiIh19GEwj7TsTFoDWqCD/tw7i8ms4yPJZA2CbEmRWu6BOORb6GqzaxgwfXriLVo9V8CN6m3qUfKiBCW45b4Mhm56rLBsoC4COEF4Xl0sBn7rddd9eZB1Okyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVI5nuw/EMomjWiwaBFTAr4rIU8ewHV+zI4h82ejC+4=;
 b=sEjodQFiN0rvLwijC9dS14J5mRzbmFEJCQsAEu5bRbbLMMC0T2iJu50xdGpfZAmWTqHFw/BjTGHl1fSeXUJlSCEXRXqK9EI52dNq+nb8Y16FNmnaw5wyoQyHAOVf4pXvMLcZhTmjZbc7i0J0IWhAmpaG8sR2dW7XqzX/H8wJfiE5AczGsbdyvfqbpt8SL49y8soqFDdnHhgUMWj7ntISrCHLa5GlQtlf0oWZKRdj1crUmLhZL2CNSZrj815Xd+aLVVfPsDlLG/klz/yuwUZ00F/0ykWncsR9ENmSrgPW2LD2xJ6lNwgMuJGIbdJeTqkm1uooHzFZKHwoOWv2SBvzTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6303.namprd11.prod.outlook.com (2603:10b6:208:3c1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 21:48:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 21:48:42 +0000
Date: Mon, 4 Nov 2024 13:49:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Christian Koenig
 <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
Message-ID: <ZylBWVjlW+GDYy5M@lstrano-desk.jf.intel.com>
References: <20241031181048.2948948-1-matthew.brost@intel.com>
 <20241031181048.2948948-3-matthew.brost@intel.com>
 <ZyQWF/k9VFo99tDB@lstrano-desk.jf.intel.com>
 <ZykFrJIx9M204Weg@intel.com>
 <02ec3d6a-4727-4535-a384-4c6789fa4ef4@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02ec3d6a-4727-4535-a384-4c6789fa4ef4@gmail.com>
X-ClientProxiedBy: MW4PR04CA0301.namprd04.prod.outlook.com
 (2603:10b6:303:82::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6303:EE_
X-MS-Office365-Filtering-Correlation-Id: 30590d41-9a10-4bcf-1470-08dcfd1a7324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?eMuUe2AtF79WNy7/e7I/ySgfShXfz+j/TGoVngXHxCKY3UqX6UQa6nHutF?=
 =?iso-8859-1?Q?O6EoMMklyrWrp1uhdEbjtRcuF5929v2U+nNzw8bteUsc85K9pGvwJQmmmm?=
 =?iso-8859-1?Q?A0sMeyjulQqPEjsNLx9P/Gud3/HOiyosgd/u7sfIby7t3XoSkI5bU69sL/?=
 =?iso-8859-1?Q?jBwGcYc11xcZvTYWczHSopDuaIce7hG+1Aa98kNxPprSW3TpINelHt3rp2?=
 =?iso-8859-1?Q?hbKyGCkrjSinqO5wGg5LpFXm3R9noi0e5dhcr7AJjzZSC0kTXesafGE1Ot?=
 =?iso-8859-1?Q?1mwLtkIvS7R44nro4JIUGjkG5vFf4JjvEkRJEeblovMTZAbiPWI0HJuSdB?=
 =?iso-8859-1?Q?B3xfmiplekLWc7+gT9/TOiVx625574QRXa4N845AN7sd9lGlPI1TOi5LG8?=
 =?iso-8859-1?Q?xI5VpfD3AjaMwvySP8Y/nmm77zFMEw0CF3OBAEkQ+nvpv70PBC2jHQsRPZ?=
 =?iso-8859-1?Q?/Kqfg8O/R9DMZn79FBhjtpY89y6vxjoH8KZ4m504wmfDFz6rY1nrK8Sz+u?=
 =?iso-8859-1?Q?Mnjle7uQnVI5HF9ryQdD6BPeOaT/+SzSzn/MfIPILCQSrwmDeZbSPjzO9J?=
 =?iso-8859-1?Q?hjf5SNU5POTesXhdvXTZGt8wkBK8m6gPbTzLJgc28MIfP2oZsh6vNidLQR?=
 =?iso-8859-1?Q?9x1FccsjpKFH3EzpzQ6On6Opn1DrI8kUJcgunTwa5RgtJcSt6ggbE1kEMl?=
 =?iso-8859-1?Q?TRGbhuUdWRXnCelLujiMMN+2rj9Uqywe+PeNGfA9LmAwEljRRQd+yla1ew?=
 =?iso-8859-1?Q?P+plSzQFlHnd0s41Vo9gxg/wXVPLuXNLgPLxAER+RvVmj/cM0HTIBmnzcA?=
 =?iso-8859-1?Q?VckDpG2RdE0gQT6yqYXJJ0M0pM7u1m5gMsyWjuuh+7i13iWT4YGAXLOkui?=
 =?iso-8859-1?Q?ywsd1OdsRYroUb/Rk15QPGkSZEtHPuxBq6dEXlgsz9E8b+YSNB/yBaAL1v?=
 =?iso-8859-1?Q?Bo6juzZzWHQWiSDBbgi6EeKem9g4arusGR6in3ISyGX9iLM6nQTMKe4X41?=
 =?iso-8859-1?Q?6DDhmCPbDysvTAOnKB09EhW9nXYI8PeNuQrZat603Y0bBF5IZzucv98cNG?=
 =?iso-8859-1?Q?K8KHPP/Xpm9CPBjK1MAIFgJ9Y3l6+gEu2f/yK7YQCWrZrJtil52azGYB7D?=
 =?iso-8859-1?Q?DugQZ0cbyPWJya9psWDTegyIsz8ZQ3mvcY9kPI3r7GsjJWk7Mk+1/VBT3e?=
 =?iso-8859-1?Q?dXzOUXdFHcUu2gDnxzT90fLPY2ASHKJ8A5Fnyhh/9NdksVAzXARizUuNgY?=
 =?iso-8859-1?Q?QxPSBv3ZYsRmPuIuvtp5Ns9u26tiCmb5ANBsnEUsIv3Ze5NyCgXwSOcEOO?=
 =?iso-8859-1?Q?be1a0ypBBiWJPjoEtYBBYFAsntZhUWj0i+/MbfJ9cr5JLeyhdM6Xc1ALfg?=
 =?iso-8859-1?Q?h/2mBtPddy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vB8ifDKg5UjE0Ao8dhNpZmmzxuYxTDAgfP1IveayBAYAIGv9uZd6hF8xXf?=
 =?iso-8859-1?Q?0wW6/4CaFi0fUJUrkqaIxnuVAOY9tXkAOfXHaJcA0hun8KKF/wm1OYEfo6?=
 =?iso-8859-1?Q?AbSmyyWBHfU+Ii8n/vf4JI1YqvYSx4qDsNVrHJ63l8fn1pyeaueDWHk1z9?=
 =?iso-8859-1?Q?rP+UP9taGgM/qsRZZhUBfsaR/Z3C0gGs6kwgMb5J7WxaR4IY71ds51AuMR?=
 =?iso-8859-1?Q?+Qpr9yK8teyrCiUsraeFsNfgbxLS7w0BNH/yRwRTT2VY9FXYa7Y1N84jZm?=
 =?iso-8859-1?Q?E6vAkYf0tm4jOwzSuEOaw09NKfHnqL7Q/2ryL/E7hR0NwQphaRWXi845PA?=
 =?iso-8859-1?Q?lHR09p6N/iOjRMMMAXsHbtuzoT+opFP9RqfhQG53NDsC7xDT0kz9IgZh0K?=
 =?iso-8859-1?Q?x2yy3gW0XE458b/7mKyeHkHYwXC2NABOKLEH5vHnpZLYUi1XDr6pTxzeb9?=
 =?iso-8859-1?Q?S0fGHLSr7lp23KKKGr5URBkwdSTg7MdqioaWffZZjUj0uJqbHd5fpU+lbQ?=
 =?iso-8859-1?Q?mtHJ8EwrfZY9vKEmLZiUSWx5M6DaeF6DXpVglGatnlpBNNb+LU02O33hZF?=
 =?iso-8859-1?Q?FoWMdCTkJ7g9b/cI0rDAOZRc9APwFVQoexDk++jFy84En36m7o7s3h27+M?=
 =?iso-8859-1?Q?p/viJQD2AdO40mOJ4tp1BEpRuHGHUej8y7R0+BQdX5Isv2xZUSd4V/qbqr?=
 =?iso-8859-1?Q?zo58VBxWAWCqJWiOVj861e0MxLhV2LWi74NEk+2YeqcRkUQLmdaINv6nZH?=
 =?iso-8859-1?Q?GNe1ns99b2FyL8Bmzl9r/X3XnpBDDjdwz9Ow3ZkRgTbVdV8Uwcedm+1RDA?=
 =?iso-8859-1?Q?xTIW3b4O/JAT4n3kekp/pb6VlJKERV7KudfuqNipFRzqvKltMHAoAG79GQ?=
 =?iso-8859-1?Q?t99vTXPmWm8D8CBMTLUiB/+zzJ+rpkaFdw/ZeGPRgQr7FvFsciqWoKWCbB?=
 =?iso-8859-1?Q?EpyDnR5il3Ukjdcy4jdFPm6ipwOMCmDZchXXaaJtH/hVCW+6I91+Vc8mm1?=
 =?iso-8859-1?Q?wDL9g3J1qgoXd1VW9i1LtMU9AxNkMCKCK45RCg/yF0hH0fK18U0egd/+vo?=
 =?iso-8859-1?Q?j9sdiG5iVRYKXbCVax3sg5OQ1N4hstF2CJW98eh1vufDibb/eoDi+63nlA?=
 =?iso-8859-1?Q?BWs+Q1I3kSQvlJARfy8IBgcpoTSj/zK29QWRCK5/S4lZgHoEeKAEyUFo0C?=
 =?iso-8859-1?Q?4ARnCB9ZG77j/OozU9UpDj4xiAl+BH8zJCXb/OuC7CAoms2QN4lDA8OW5w?=
 =?iso-8859-1?Q?FDTxysbHKaLNLvcqqXHkdypt9dZWe/HtdbqaiHNMNW2OQ2g0Ss1HZtrAPX?=
 =?iso-8859-1?Q?HlZXTxnu8rAiothWdEgXTFKOk4AA1fY53wXwCDSPbOv2+mus8+nl1NrcX5?=
 =?iso-8859-1?Q?UzaU7Q6xag7MbMU/U4UsxKhxmoiAdljgluE1nbT7/hBUFEcQ7qjzw6XNqy?=
 =?iso-8859-1?Q?AmbmQ+zsh+7hjQN7mGy5O2dNayBTvzVgJwTULdkd2rkJ6r+dnoX9ize05A?=
 =?iso-8859-1?Q?6dxt7LffHaBmEaOqJXQrmApghXCdoTf9Q61VA59vFXqj8lgnb1n3Ma7oa7?=
 =?iso-8859-1?Q?27GHoUG/XPXTWliHWIA3VTY96vINDDuraEMp0mjBr582IelyUpZa6E7AEt?=
 =?iso-8859-1?Q?SlZfjYkcku04HbmXJOPJtpM723W5XOAQZ9X0d5KUgEBdulcqPn127vaQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30590d41-9a10-4bcf-1470-08dcfd1a7324
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 21:48:42.4210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2Zsn+Xe/eGJh5XQRNPjQ0KPXXxklZut5KvtTWiQNPlZ84jUkHBykzB5Pn7LjM+TgmXdlSOxhhKdpgBSvusgeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6303
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

On Mon, Nov 04, 2024 at 08:28:34PM +0100, Christian König wrote:
> Am 04.11.24 um 18:34 schrieb Rodrigo Vivi:
> > On Thu, Oct 31, 2024 at 04:43:19PM -0700, Matthew Brost wrote:
> > > On Thu, Oct 31, 2024 at 11:10:42AM -0700, Matthew Brost wrote:
> > > > Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
> > > > VRAM easily be accessed. Add ttm_bo_access, which is similar to
> > > > ttm_bo_vm_access, to access such memory.
> > > > 
> > > > v4:
> > > >   - Fix checkpatch warnings (CI)
> > > > v5:
> > > >   - Fix checkpatch warnings (CI)
> > > > v6:
> > > >   - Fix kernel doc (Auld)
> > > > 
> > > Christian - Do you mind if I merge patch along with the rest of the
> > > series to drm-xe-next?
> > Ray, Christian,
> > 
> > ack on getting this patch to drm-xe-next?
> 
> No, we actually spend quite some time removing the single page mapping
> functionality for BOs.
> 

I don't understand this statement. This patch just adds a TTM BO helper
for access - it doesn't change anything wrt to single page mapping.

> You need a really good justification to bring that back.
> 

The use case is EuDebugger requires essentially the same functionality
as ptrace -> vm_access. 

TTM mapping non-contiguous VRAM doesn't work unless I'm blind. User BOs
which the EuDebugger accesses can be non-contiguous, hence the new
helper.

Matt

> Regards,
> Christian.
> 
> > 
> > > Matt
> > > 
> > > > Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
> > > > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > Tested-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > > > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
> > > >   drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
> > > >   include/drm/ttm/ttm_bo.h          |  2 +
> > > >   3 files changed, 89 insertions(+), 64 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > index d939925efa81..77e760ea7193 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > @@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
> > > >   	return progress;
> > > >   }
> > > > +
> > > > +static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
> > > > +			      unsigned long offset,
> > > > +			      void *buf, int len, int write)
> > > > +{
> > > > +	unsigned long page = offset >> PAGE_SHIFT;
> > > > +	unsigned long bytes_left = len;
> > > > +	int ret;
> > > > +
> > > > +	/* Copy a page at a time, that way no extra virtual address
> > > > +	 * mapping is needed
> > > > +	 */
> > > > +	offset -= page << PAGE_SHIFT;
> > > > +	do {
> > > > +		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
> > > > +		struct ttm_bo_kmap_obj map;
> > > > +		void *ptr;
> > > > +		bool is_iomem;
> > > > +
> > > > +		ret = ttm_bo_kmap(bo, page, 1, &map);
> > > > +		if (ret)
> > > > +			return ret;
> > > > +
> > > > +		ptr = (void *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> > > > +		WARN_ON_ONCE(is_iomem);
> > > > +		if (write)
> > > > +			memcpy(ptr, buf, bytes);
> > > > +		else
> > > > +			memcpy(buf, ptr, bytes);
> > > > +		ttm_bo_kunmap(&map);
> > > > +
> > > > +		page++;
> > > > +		buf += bytes;
> > > > +		bytes_left -= bytes;
> > > > +		offset = 0;
> > > > +	} while (bytes_left);
> > > > +
> > > > +	return len;
> > > > +}
> > > > +
> > > > +/**
> > > > + * ttm_bo_access - Helper to access a buffer object
> > > > + *
> > > > + * @bo: ttm buffer object
> > > > + * @offset: access offset into buffer object
> > > > + * @buf: pointer to caller memory to read into or write from
> > > > + * @len: length of access
> > > > + * @write: write access
> > > > + *
> > > > + * Utility function to access a buffer object. Useful when buffer object cannot
> > > > + * be easily mapped (non-contiguous, non-visible, etc...).
> > > > + *
> > > > + * Returns:
> > > > + * @len if successful, negative error code on failure.
> > > > + */
> > > > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> > > > +		  void *buf, int len, int write)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	if (len < 1 || (offset + len) > bo->base.size)
> > > > +		return -EIO;
> > > > +
> > > > +	ret = ttm_bo_reserve(bo, true, false, NULL);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	switch (bo->resource->mem_type) {
> > > > +	case TTM_PL_SYSTEM:
> > > > +		fallthrough;
> > > > +	case TTM_PL_TT:
> > > > +		ret = ttm_bo_access_kmap(bo, offset, buf, len, write);
> > > > +		break;
> > > > +	default:
> > > > +		if (bo->bdev->funcs->access_memory)
> > > > +			ret = bo->bdev->funcs->access_memory
> > > > +				(bo, offset, buf, len, write);
> > > > +		else
> > > > +			ret = -EIO;
> > > > +	}
> > > > +
> > > > +	ttm_bo_unreserve(bo);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +EXPORT_SYMBOL(ttm_bo_access);
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > index 2c699ed1963a..20b1e5f78684 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > @@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
> > > >   }
> > > >   EXPORT_SYMBOL(ttm_bo_vm_close);
> > > > -static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
> > > > -				 unsigned long offset,
> > > > -				 uint8_t *buf, int len, int write)
> > > > -{
> > > > -	unsigned long page = offset >> PAGE_SHIFT;
> > > > -	unsigned long bytes_left = len;
> > > > -	int ret;
> > > > -
> > > > -	/* Copy a page at a time, that way no extra virtual address
> > > > -	 * mapping is needed
> > > > -	 */
> > > > -	offset -= page << PAGE_SHIFT;
> > > > -	do {
> > > > -		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
> > > > -		struct ttm_bo_kmap_obj map;
> > > > -		void *ptr;
> > > > -		bool is_iomem;
> > > > -
> > > > -		ret = ttm_bo_kmap(bo, page, 1, &map);
> > > > -		if (ret)
> > > > -			return ret;
> > > > -
> > > > -		ptr = (uint8_t *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> > > > -		WARN_ON_ONCE(is_iomem);
> > > > -		if (write)
> > > > -			memcpy(ptr, buf, bytes);
> > > > -		else
> > > > -			memcpy(buf, ptr, bytes);
> > > > -		ttm_bo_kunmap(&map);
> > > > -
> > > > -		page++;
> > > > -		buf += bytes;
> > > > -		bytes_left -= bytes;
> > > > -		offset = 0;
> > > > -	} while (bytes_left);
> > > > -
> > > > -	return len;
> > > > -}
> > > > -
> > > >   int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > > >   		     void *buf, int len, int write)
> > > >   {
> > > > @@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > > >   	unsigned long offset = (addr) - vma->vm_start +
> > > >   		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
> > > >   		 << PAGE_SHIFT);
> > > > -	int ret;
> > > > -
> > > > -	if (len < 1 || (offset + len) > bo->base.size)
> > > > -		return -EIO;
> > > > -	ret = ttm_bo_reserve(bo, true, false, NULL);
> > > > -	if (ret)
> > > > -		return ret;
> > > > -
> > > > -	switch (bo->resource->mem_type) {
> > > > -	case TTM_PL_SYSTEM:
> > > > -		fallthrough;
> > > > -	case TTM_PL_TT:
> > > > -		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
> > > > -		break;
> > > > -	default:
> > > > -		if (bo->bdev->funcs->access_memory)
> > > > -			ret = bo->bdev->funcs->access_memory(
> > > > -				bo, offset, buf, len, write);
> > > > -		else
> > > > -			ret = -EIO;
> > > > -	}
> > > > -
> > > > -	ttm_bo_unreserve(bo);
> > > > -
> > > > -	return ret;
> > > > +	return ttm_bo_access(bo, offset, buf, len, write);
> > > >   }
> > > >   EXPORT_SYMBOL(ttm_bo_vm_access);
> > > > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > > > index 5804408815be..8ea11cd8df39 100644
> > > > --- a/include/drm/ttm/ttm_bo.h
> > > > +++ b/include/drm/ttm/ttm_bo.h
> > > > @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
> > > >   int ttm_bo_evict_first(struct ttm_device *bdev,
> > > >   		       struct ttm_resource_manager *man,
> > > >   		       struct ttm_operation_ctx *ctx);
> > > > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> > > > +		  void *buf, int len, int write);
> > > >   vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
> > > >   			     struct vm_fault *vmf);
> > > >   vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
> > > > -- 
> > > > 2.34.1
> > > > 
> 
