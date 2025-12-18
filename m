Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FECCCDE43
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 23:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6931A10E47A;
	Thu, 18 Dec 2025 22:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W1KcGgnZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE6110E47A;
 Thu, 18 Dec 2025 22:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766098779; x=1797634779;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9zytzwhZPauykx+oVRY2cQXJh1N+B9Z68Pe2tzm4crk=;
 b=W1KcGgnZ0rjJvBSSIaZV6+5m3B4CMk8sLOvQ1AHzR4U6sFKF19Upaexs
 uBlnEf4WauxbsutaSodfUAF8QSSqHHpfyq4hC8BwNJlOTXygkhgGgbCKV
 07sUvXxIsf38GqayltS2lMT9IG5zAzRjswoQlll2DPFlKvIxKXEGDsDy7
 fkV3CmKKpi8FL3rU4XJl4qdQMalnQZvWgGTWwF5zLxpt5wV/6TH59Zfkq
 k6ljJJl5db/z++GpCDGWfWLBWQiqfg2xGgCh//zu9XpK1yDy+YuuunKzv
 Mwm9SZ62XK+3VjAttE/tYnqnpgbiwgf0zslYvww9VeM9QU8HMbimjlrQ2 Q==;
X-CSE-ConnectionGUID: LXcKofsPRqG5cv1+qRIFWA==
X-CSE-MsgGUID: eTie6mD4SImkw+n8AhIyyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78775972"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="78775972"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:59:38 -0800
X-CSE-ConnectionGUID: 9kH49MhOSse3FumdaaZFVQ==
X-CSE-MsgGUID: ZYfd71RBSwyDP1KXXV0HqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="203791522"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:59:38 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 14:59:37 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 14:59:37 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 14:59:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEm/Ak9iXW0h24bgAlVK1O0z3ALj4JWPzAVRjy0wOURUk14RiqYMxoeltj1bbNAhfiWld1gCA1MTPY03KgAEG50mAZuWcXNCK8pO3Tnms4oyL1B09D6gT5S0zBGjfv4R62gJTWQgidGyu972tkwse7tzR6lQMYiiuuzZgXKKbRNKLwuxo9mHa1aubV5As3RFtG/DWVqEygYOrbLj57fVjhGLTHSV9UcIRxYPnyJaSum/sKxHTlW32mBqNuoyx3eU98VQskBxtkhGkdvEmvfj8bwjg1oOcgnmakM7kBcdRysbEjkuTaiRW5e7UDgbEvNtf7v8ZaJ5+9PozE6ECBL0iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6WWAOG7jHPz/+iKvahf0i38OqxV0Ns67RjiDyowC6E=;
 b=QMCTVjygnNXj9Iv/CCjh6M098vpcswHkrzBdeTm17Tlt6Yj1wPTy0wC7hEtYHq3pK/cFfpiBJ0a7mkqxkV8zjFJJkprzAbADpDs9XBHFJRUnr4/mXnSljHT/DtEp58WsIGedVafOBN0QtT23+z9D8T/FUjrpxkT0ymrocfj6deeMtVswepCGz3V0tNmfvB1UGUUMA08quuco9lB4OT4ztpamQzqvnFWBxWVMBFhFalbafhZ6m7Q3BWEHJgIuoQGnVWte0elnpE3C46UwultBq4l1qjXsFvlZ4Kgo2PYeUo3LrP/I1ZpMhGzxWXvuiQSW7zutthGg33DMlsr2IhQbXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7299.namprd11.prod.outlook.com (2603:10b6:610:14b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 22:59:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 22:59:35 +0000
Date: Thu, 18 Dec 2025 14:59:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stable@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <apopple@nvidia.com>, <airlied@gmail.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v6] drm/pagemap, drm/xe: Ensure that the devmem
 allocation is idle before use
Message-ID: <aUSHVJRWZhWfgyPK@lstrano-desk.jf.intel.com>
References: <20251218224400.30246-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218224400.30246-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY3PR10CA0015.namprd10.prod.outlook.com
 (2603:10b6:a03:255::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a3867e-5e8f-48e7-aecc-08de3e891d37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?zilTkKR7oorLJlgEBwOWjj9NVELyfqvrWM4eOURWXvFvrEsQxftBRAOZwM?=
 =?iso-8859-1?Q?ytCrP7Yc1m1E7dcslNweXFs0F1qNaA+X990fRkEHQNrmq1XxgvKFB1XmFl?=
 =?iso-8859-1?Q?ee91uKj4vEYlUE0IMykx0dYqOKrtip8taXOIQHqNtSFtT4GyQBdrs+vHuP?=
 =?iso-8859-1?Q?CCHwFk8a/dVnd9srbQ9SVlKGyMrhCN7OjBC05/iSKEmiyd70Em83nA807Z?=
 =?iso-8859-1?Q?kKDyYXa8zzLfmkrNdcZ1ZrXwxEotkmoHKfUqNlTpWL8Y18wFaxhBP1TNkt?=
 =?iso-8859-1?Q?NU30+Xt1jr2bZem2PEcd+dcfA4LH2E3AT85lQ9nEytIrjw5ZUFrYEcK4I4?=
 =?iso-8859-1?Q?A4GoJ9QtBinCgxxACkAzOk0bXpkUxrWu705Cc0gAWGhbCI9SThASs+1+XT?=
 =?iso-8859-1?Q?j8l8siFiViyhFTroiJAlfXdOeyEE6CWa+TPK2iEnvBflV9CPyWGcNbIT9c?=
 =?iso-8859-1?Q?yehNdHfQbtNKAOwP4gH8CcE/eVnwH0Xgyc51sr6E4rI1hUcZVabb/R88jw?=
 =?iso-8859-1?Q?Ic1lK3MkKusXJkFUe2gz4Z6Npm2d/Cx7tS9a1RGM01fDC31NscQLeNF9/V?=
 =?iso-8859-1?Q?2I8SIPO7QuET5rGabU1CXieRphYW2/pBVCILKln2MbicAUFkNGSw+Qe7rc?=
 =?iso-8859-1?Q?5S2++wq3KBqultvdadpQPGW1ByZXJctYGfTepX03ZO29+z9REDRr+OfXet?=
 =?iso-8859-1?Q?ideGlw5tPkDzZEDCEIhwMm//Piz9sI+F3ig3aLFp6BnGmA3r7C8TnH1yHo?=
 =?iso-8859-1?Q?U9SCu/j4l6p9TPjv8fuMGqM4vne7leFMrEr+u3Hi3V8lTgNvXtuTaunV1i?=
 =?iso-8859-1?Q?iDGOnYAcLH5R6Ddr/RPLTDgq1LIVyF90hXXJ/r4TZQfg9T+MDOohlenLt/?=
 =?iso-8859-1?Q?wXDnVUP1pFBIEqTvLPic7LghjDSrw3ksjWKPoTHNG9IQFLjZ7slcsYtevh?=
 =?iso-8859-1?Q?oG6ga/ymDzj3j7vKGQbbWat1dBzmBQyu48vfr+y+ZPxdDIN671yaQQ3voK?=
 =?iso-8859-1?Q?2l2lysjM7NU30LOn+2k161nLCrQjoBBD95H6pTEo/fjnregOQEj9L2d+Kc?=
 =?iso-8859-1?Q?VFrFp0TWpp84IueTE6WpNOl1Vocj+wMPjQtqgskCjYZKuH7f4xcOkPkU+g?=
 =?iso-8859-1?Q?ETazmNuNIWaHoLKK/3rswmRdD9Dtfmzu6vNzXBO9KV4E7lCgO8WSLzYLhk?=
 =?iso-8859-1?Q?CHSM+cvvM8K2xN9RQqvakRqIWy6rna8Q358/gui2KeZU+tjdwfl97mQbax?=
 =?iso-8859-1?Q?aI4DhTVquSiYlLKZ6ox/LEVU8hrpLTwD7NoJ96ywOd3qZ1nORLT7Cxt7R2?=
 =?iso-8859-1?Q?jHrRPM60/F6TmOQsFoqyxgkmzIHJDMrvEdNIVRTTvk4ksCogKgj+XyiCpJ?=
 =?iso-8859-1?Q?qNfgZ3Tutcep6O5Z9IekMJxso9AnNn+QpisCrwg8k5dc5W+rntxiJdUvhq?=
 =?iso-8859-1?Q?Cn9PzCMF5uS8LqH8akQGXh+JVilWlEidZNLPT29zK95CaG3JCvRXAInxlR?=
 =?iso-8859-1?Q?4YieJE41xnfrvL6+iVC6iR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GVgDzFc2UvzxYI9QyUPaWiV9kLM9becdSwF8FRcls6B1SEKn4geNZNBiZT?=
 =?iso-8859-1?Q?X4EJwP1SX952I/MQz5dZ/RnohptNAZ4HqhSyRGj/ZP3xKRI6H3FMqmkcZK?=
 =?iso-8859-1?Q?EP8kQeDlWA9gBsypr3A/I2dHBQDqL2J0o/8+k6h5UDrWUJj4g4k/LsWzLl?=
 =?iso-8859-1?Q?eFLFRKx7a9nLNynuaO9f2dhV+hh3yypaxRoxTlyZ5l9y5AEQ5c3YRVxofA?=
 =?iso-8859-1?Q?6SbOrvwC6NXFLLRMoFjfIF4eJrSgQMfeb17HSSvU+AjUPHiRhYY0BDOYVv?=
 =?iso-8859-1?Q?RN/YQEoadqZU3bebXaO5f6/iDf3JJMAcj9CvrTy+a5b2EJmkKUsVvn6cNe?=
 =?iso-8859-1?Q?ucxrfeDFazpi1aH7kc9tPz1X35qlxzI7dCz2iLAvtusdo9GMB0fTasusLJ?=
 =?iso-8859-1?Q?RnOstE2nrnfNDykwLM4YT4PWX+Kqo90ExG8vsVnDMg3TIRayQvDmMPH6SJ?=
 =?iso-8859-1?Q?Z62U4ioOcN0ghkCo4lOgi0LWbeeSaAH875/JEwsMqbS+89zfYQ+jdlbq5g?=
 =?iso-8859-1?Q?BrGBwcDZwWAIpUjmshI6iGt3taGSlj/xTlmfwwY8K5RBjWV/u0OW6Puxon?=
 =?iso-8859-1?Q?KI9JMJwOHYpGo2BekxaqfR9z3aYghhFm9SGExlCnK/1yFOhXLXcI9PYc5F?=
 =?iso-8859-1?Q?YvDwZKG97E48S332aZifn2EkXiQStA1eP7uF3p4mvRhOyJ2Egaqm3Q6dqO?=
 =?iso-8859-1?Q?QTR5Hi4fJs/Fk40Szl1rZrx3dMAKNMurWZZhLxfdpbjqEU2piieqHn6066?=
 =?iso-8859-1?Q?//LkepSovhlj8nc+RkGhadjFGFy2RuOcDpYDYu4mNVSPSNgpbhTUiP3XfC?=
 =?iso-8859-1?Q?hRHhcx4d4IyoBkk96XOLtcwmfmroQjTbj6lLtJL3scR9dVkiu+Me9OkiZD?=
 =?iso-8859-1?Q?LW91xxVLndRKiT8cn8QrLUg+xaMJ4y/nbq635m6/usC1Hht6alSPco/t3h?=
 =?iso-8859-1?Q?03xuQ+ylsIB2Dli7hD0rA+APxWfaNfmB6xYMe/O1IU4iN7oM+ubiX+pcpP?=
 =?iso-8859-1?Q?1+h0eZjtFlkmFeggKUO8rU+XGFIdcBV1NI4smJJk1ni4Co/5dkQvDYC1uF?=
 =?iso-8859-1?Q?D3H01UqvABdG56uHk+k3AxRJ/QW1WyBL6JkspFpNJJP066OZAZMhpa9rxz?=
 =?iso-8859-1?Q?SbEFvdamEJgh+ghOGno2bDWMB80P0b7UdR31GddFJ48NSGu+3F6lWOVUtT?=
 =?iso-8859-1?Q?r/7819ZwCTOGJOCgD1/m3BlsQYogTLnMXWyLiFbtkwRofcMTuFFo77OErd?=
 =?iso-8859-1?Q?2IWmO0uTHuwu0l/p/J4NWsV2wlij4PNNFxJh49tIyyngpkeqzJ1vkurjfj?=
 =?iso-8859-1?Q?MqZOKgW+ROg8EYl8IOzLdORZJ7oZup1StvMfaRRPnSIpSgQMBmOQtPHlyD?=
 =?iso-8859-1?Q?FIOZ+UMubTnHkZa4pSV5lOHnFupemc/CwZTSz9tT+ePOnbSN3ADABbn04T?=
 =?iso-8859-1?Q?W0iw6XNoXUj/r9MaQ5X7jfygs6sFLIPDq+8xdZmRwIm+nFTPxEE8L03sST?=
 =?iso-8859-1?Q?Iz9glK8p+fIyQJOUb2YH/FTCtellZcra1BRhSMgyoYNIEmr5WT73GIxqT7?=
 =?iso-8859-1?Q?P1S10sbZ/rUJNT2qTb0ehW3O0tMmOZwO9kjy6bugGN/zJ2gB/U87t97oZG?=
 =?iso-8859-1?Q?C76gP7ev/ZHlzKXa43AhscAE+4f0m+vTMy63ovUKp1lzlykLaiILam8A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a3867e-5e8f-48e7-aecc-08de3e891d37
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 22:59:35.6437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNUJ73DBGcoSsEXid0nG6BcneD1FrXmNMnj4HEkVr34f501Q3/k8mmJlWkhY8iM+XGy4TMVjMGJU3ip7cJmKKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7299
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

On Thu, Dec 18, 2025 at 11:44:00PM +0100, Thomas Hellström wrote:
> In situations where no system memory is migrated to devmem, and in
> upcoming patches where another GPU is performing the migration to
> the newly allocated devmem buffer, there is nothing to ensure any
> ongoing clear to the devmem allocation or async eviction from the
> devmem allocation is complete.
> 
> Address that by passing a struct dma_fence down to the copy
> functions, and ensure it is waited for before migration is marked
> complete.
> 
> v3:
> - New patch.
> v4:
> - Update the logic used for determining when to wait for the
>   pre_migrate_fence.
> - Update the logic used for determining when to warn for the
>   pre_migrate_fence since the scheduler fences apparently
>   can signal out-of-order.
> v5:
> - Fix a UAF (CI)
> - Remove references to source P2P migration (Himal)
> - Put the pre_migrate_fence after migration.
> v6:
> - Pipeline the pre_migrate_fence dependency (Matt Brost)
> 

Thanks, this is what I had in mind.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Fixes: c5b3eb5a906c ("drm/xe: Add GPUSVM device memory copy vfunc functions")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org> # v6.15+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c   | 17 +++++++++---
>  drivers/gpu/drm/xe/xe_migrate.c | 25 +++++++++++++----
>  drivers/gpu/drm/xe/xe_migrate.h |  6 ++--
>  drivers/gpu/drm/xe/xe_svm.c     | 49 +++++++++++++++++++++++++--------
>  include/drm/drm_pagemap.h       | 17 ++++++++++--
>  5 files changed, 88 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 37d7cfbbb3e8..06c1bd8fc4d1 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -3,6 +3,7 @@
>   * Copyright © 2024-2025 Intel Corporation
>   */
>  
> +#include <linux/dma-fence.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/migrate.h>
>  #include <linux/pagemap.h>
> @@ -408,10 +409,14 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		drm_pagemap_get_devmem_page(page, zdd);
>  	}
>  
> -	err = ops->copy_to_devmem(pages, pagemap_addr, npages);
> +	err = ops->copy_to_devmem(pages, pagemap_addr, npages,
> +				  devmem_allocation->pre_migrate_fence);
>  	if (err)
>  		goto err_finalize;
>  
> +	dma_fence_put(devmem_allocation->pre_migrate_fence);
> +	devmem_allocation->pre_migrate_fence = NULL;
> +
>  	/* Upon success bind devmem allocation to range and zdd */
>  	devmem_allocation->timeslice_expiration = get_jiffies_64() +
>  		msecs_to_jiffies(timeslice_ms);
> @@ -596,7 +601,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  	for (i = 0; i < npages; ++i)
>  		pages[i] = migrate_pfn_to_page(src[i]);
>  
> -	err = ops->copy_to_ram(pages, pagemap_addr, npages);
> +	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
>  	if (err)
>  		goto err_finalize;
>  
> @@ -732,7 +737,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	for (i = 0; i < npages; ++i)
>  		pages[i] = migrate_pfn_to_page(migrate.src[i]);
>  
> -	err = ops->copy_to_ram(pages, pagemap_addr, npages);
> +	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
>  	if (err)
>  		goto err_finalize;
>  
> @@ -813,11 +818,14 @@ EXPORT_SYMBOL_GPL(drm_pagemap_pagemap_ops_get);
>   * @ops: Pointer to the operations structure for GPU SVM device memory
>   * @dpagemap: The struct drm_pagemap we're allocating from.
>   * @size: Size of device memory allocation
> + * @pre_migrate_fence: Fence to wait for or pipeline behind before migration starts.
> + * (May be NULL).
>   */
>  void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
>  			     struct device *dev, struct mm_struct *mm,
>  			     const struct drm_pagemap_devmem_ops *ops,
> -			     struct drm_pagemap *dpagemap, size_t size)
> +			     struct drm_pagemap *dpagemap, size_t size,
> +			     struct dma_fence *pre_migrate_fence)
>  {
>  	init_completion(&devmem_allocation->detached);
>  	devmem_allocation->dev = dev;
> @@ -825,6 +833,7 @@ void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
>  	devmem_allocation->ops = ops;
>  	devmem_allocation->dpagemap = dpagemap;
>  	devmem_allocation->size = size;
> +	devmem_allocation->pre_migrate_fence = pre_migrate_fence;
>  }
>  EXPORT_SYMBOL_GPL(drm_pagemap_devmem_init);
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index f3b66b55acfb..284b575346ee 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -2113,6 +2113,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>  					 unsigned long sram_offset,
>  					 struct drm_pagemap_addr *sram_addr,
>  					 u64 vram_addr,
> +					 struct dma_fence *deps,
>  					 const enum xe_migrate_copy_dir dir)
>  {
>  	struct xe_gt *gt = m->tile->primary_gt;
> @@ -2201,6 +2202,14 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>  
>  	xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
>  
> +	if (deps && !dma_fence_is_signaled(deps)) {
> +		dma_fence_get(deps);
> +		err = drm_sched_job_add_dependency(&job->drm, deps);
> +		if (err)
> +			dma_fence_wait(deps, false);
> +		err = 0;
> +	}
> +
>  	mutex_lock(&m->job_mutex);
>  	xe_sched_job_arm(job);
>  	fence = dma_fence_get(&job->drm.s_fence->finished);
> @@ -2226,6 +2235,8 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>   * @npages: Number of pages to migrate.
>   * @src_addr: Array of DMA information (source of migrate)
>   * @dst_addr: Device physical address of VRAM (destination of migrate)
> + * @deps: struct dma_fence representing the dependencies that need
> + * to be signaled before migration.
>   *
>   * Copy from an array dma addresses to a VRAM device physical address
>   *
> @@ -2235,10 +2246,11 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>  struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>  				     unsigned long npages,
>  				     struct drm_pagemap_addr *src_addr,
> -				     u64 dst_addr)
> +				     u64 dst_addr,
> +				     struct dma_fence *deps)
>  {
>  	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, src_addr, dst_addr,
> -			       XE_MIGRATE_COPY_TO_VRAM);
> +			       deps, XE_MIGRATE_COPY_TO_VRAM);
>  }
>  
>  /**
> @@ -2247,6 +2259,8 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>   * @npages: Number of pages to migrate.
>   * @src_addr: Device physical address of VRAM (source of migrate)
>   * @dst_addr: Array of DMA information (destination of migrate)
> + * @deps: struct dma_fence representing the dependencies that need
> + * to be signaled before migration.
>   *
>   * Copy from a VRAM device physical address to an array dma addresses
>   *
> @@ -2256,10 +2270,11 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>  struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
>  				       unsigned long npages,
>  				       u64 src_addr,
> -				       struct drm_pagemap_addr *dst_addr)
> +				       struct drm_pagemap_addr *dst_addr,
> +				       struct dma_fence *deps)
>  {
>  	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, dst_addr, src_addr,
> -			       XE_MIGRATE_COPY_TO_SRAM);
> +			       deps, XE_MIGRATE_COPY_TO_SRAM);
>  }
>  
>  static void xe_migrate_dma_unmap(struct xe_device *xe,
> @@ -2435,7 +2450,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  		__fence = xe_migrate_vram(m, current_bytes,
>  					  (unsigned long)buf & ~PAGE_MASK,
>  					  &pagemap_addr[current_page],
> -					  vram_addr, write ?
> +					  vram_addr, NULL, write ?
>  					  XE_MIGRATE_COPY_TO_VRAM :
>  					  XE_MIGRATE_COPY_TO_SRAM);
>  		if (IS_ERR(__fence)) {
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 464c05dde1ba..1522afb37dcf 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -116,12 +116,14 @@ int xe_migrate_init(struct xe_migrate *m);
>  struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>  				     unsigned long npages,
>  				     struct drm_pagemap_addr *src_addr,
> -				     u64 dst_addr);
> +				     u64 dst_addr,
> +				     struct dma_fence *deps);
>  
>  struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
>  				       unsigned long npages,
>  				       u64 src_addr,
> -				       struct drm_pagemap_addr *dst_addr);
> +				       struct drm_pagemap_addr *dst_addr,
> +				       struct dma_fence *deps);
>  
>  struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  				  struct xe_bo *src_bo,
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 93550c7c84ac..a985148b6820 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -472,7 +472,8 @@ static void xe_svm_copy_us_stats_incr(struct xe_gt *gt,
>  
>  static int xe_svm_copy(struct page **pages,
>  		       struct drm_pagemap_addr *pagemap_addr,
> -		       unsigned long npages, const enum xe_svm_copy_dir dir)
> +		       unsigned long npages, const enum xe_svm_copy_dir dir,
> +		       struct dma_fence *pre_migrate_fence)
>  {
>  	struct xe_vram_region *vr = NULL;
>  	struct xe_gt *gt = NULL;
> @@ -561,7 +562,8 @@ static int xe_svm_copy(struct page **pages,
>  					__fence = xe_migrate_from_vram(vr->migrate,
>  								       i - pos + incr,
>  								       vram_addr,
> -								       &pagemap_addr[pos]);
> +								       &pagemap_addr[pos],
> +								       pre_migrate_fence);
>  				} else {
>  					vm_dbg(&xe->drm,
>  					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
> @@ -570,13 +572,14 @@ static int xe_svm_copy(struct page **pages,
>  					__fence = xe_migrate_to_vram(vr->migrate,
>  								     i - pos + incr,
>  								     &pagemap_addr[pos],
> -								     vram_addr);
> +								     vram_addr,
> +								     pre_migrate_fence);
>  				}
>  				if (IS_ERR(__fence)) {
>  					err = PTR_ERR(__fence);
>  					goto err_out;
>  				}
> -
> +				pre_migrate_fence = NULL;
>  				dma_fence_put(fence);
>  				fence = __fence;
>  			}
> @@ -599,20 +602,22 @@ static int xe_svm_copy(struct page **pages,
>  					       vram_addr, (u64)pagemap_addr[pos].addr, 1);
>  					__fence = xe_migrate_from_vram(vr->migrate, 1,
>  								       vram_addr,
> -								       &pagemap_addr[pos]);
> +								       &pagemap_addr[pos],
> +								       pre_migrate_fence);
>  				} else {
>  					vm_dbg(&xe->drm,
>  					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
>  					       (u64)pagemap_addr[pos].addr, vram_addr, 1);
>  					__fence = xe_migrate_to_vram(vr->migrate, 1,
>  								     &pagemap_addr[pos],
> -								     vram_addr);
> +								     vram_addr,
> +								     pre_migrate_fence);
>  				}
>  				if (IS_ERR(__fence)) {
>  					err = PTR_ERR(__fence);
>  					goto err_out;
>  				}
> -
> +				pre_migrate_fence = NULL;
>  				dma_fence_put(fence);
>  				fence = __fence;
>  			}
> @@ -625,6 +630,8 @@ static int xe_svm_copy(struct page **pages,
>  		dma_fence_wait(fence, false);
>  		dma_fence_put(fence);
>  	}
> +	if (pre_migrate_fence)
> +		dma_fence_wait(pre_migrate_fence, false);
>  
>  	/*
>  	 * XXX: We can't derive the GT here (or anywhere in this functions, but
> @@ -641,16 +648,20 @@ static int xe_svm_copy(struct page **pages,
>  
>  static int xe_svm_copy_to_devmem(struct page **pages,
>  				 struct drm_pagemap_addr *pagemap_addr,
> -				 unsigned long npages)
> +				 unsigned long npages,
> +				 struct dma_fence *pre_migrate_fence)
>  {
> -	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_VRAM);
> +	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_VRAM,
> +			   pre_migrate_fence);
>  }
>  
>  static int xe_svm_copy_to_ram(struct page **pages,
>  			      struct drm_pagemap_addr *pagemap_addr,
> -			      unsigned long npages)
> +			      unsigned long npages,
> +			      struct dma_fence *pre_migrate_fence)
>  {
> -	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_SRAM);
> +	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_SRAM,
> +			   pre_migrate_fence);
>  }
>  
>  static struct xe_bo *to_xe_bo(struct drm_pagemap_devmem *devmem_allocation)
> @@ -663,6 +674,7 @@ static void xe_svm_devmem_release(struct drm_pagemap_devmem *devmem_allocation)
>  	struct xe_bo *bo = to_xe_bo(devmem_allocation);
>  	struct xe_device *xe = xe_bo_device(bo);
>  
> +	dma_fence_put(devmem_allocation->pre_migrate_fence);
>  	xe_bo_put_async(bo);
>  	xe_pm_runtime_put(xe);
>  }
> @@ -857,6 +869,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  				      unsigned long timeslice_ms)
>  {
>  	struct xe_vram_region *vr = container_of(dpagemap, typeof(*vr), dpagemap);
> +	struct dma_fence *pre_migrate_fence = NULL;
>  	struct xe_device *xe = vr->xe;
>  	struct device *dev = xe->drm.dev;
>  	struct drm_buddy_block *block;
> @@ -883,8 +896,20 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  			break;
>  		}
>  
> +		/* Ensure that any clearing or async eviction will complete before migration. */
> +		if (!dma_resv_test_signaled(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL)) {
> +			err = dma_resv_get_singleton(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
> +						     &pre_migrate_fence);
> +			if (err)
> +				dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
> +						      false, MAX_SCHEDULE_TIMEOUT);
> +			else if (pre_migrate_fence)
> +				dma_fence_enable_sw_signaling(pre_migrate_fence);
> +		}
> +
>  		drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
> -					&dpagemap_devmem_ops, dpagemap, end - start);
> +					&dpagemap_devmem_ops, dpagemap, end - start,
> +					pre_migrate_fence);
>  
>  		blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
>  		list_for_each_entry(block, blocks, link)
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index f6e7e234c089..70a7991f784f 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -8,6 +8,7 @@
>  
>  #define NR_PAGES(order) (1U << (order))
>  
> +struct dma_fence;
>  struct drm_pagemap;
>  struct drm_pagemap_zdd;
>  struct device;
> @@ -174,6 +175,8 @@ struct drm_pagemap_devmem_ops {
>  	 * @pages: Pointer to array of device memory pages (destination)
>  	 * @pagemap_addr: Pointer to array of DMA information (source)
>  	 * @npages: Number of pages to copy
> +	 * @pre_migrate_fence: dma-fence to wait for before migration start.
> +	 * May be NULL.
>  	 *
>  	 * Copy pages to device memory. If the order of a @pagemap_addr entry
>  	 * is greater than 0, the entry is populated but subsequent entries
> @@ -183,13 +186,16 @@ struct drm_pagemap_devmem_ops {
>  	 */
>  	int (*copy_to_devmem)(struct page **pages,
>  			      struct drm_pagemap_addr *pagemap_addr,
> -			      unsigned long npages);
> +			      unsigned long npages,
> +			      struct dma_fence *pre_migrate_fence);
>  
>  	/**
>  	 * @copy_to_ram: Copy to system RAM (required for migration)
>  	 * @pages: Pointer to array of device memory pages (source)
>  	 * @pagemap_addr: Pointer to array of DMA information (destination)
>  	 * @npages: Number of pages to copy
> +	 * @pre_migrate_fence: dma-fence to wait for before migration start.
> +	 * May be NULL.
>  	 *
>  	 * Copy pages to system RAM. If the order of a @pagemap_addr entry
>  	 * is greater than 0, the entry is populated but subsequent entries
> @@ -199,7 +205,8 @@ struct drm_pagemap_devmem_ops {
>  	 */
>  	int (*copy_to_ram)(struct page **pages,
>  			   struct drm_pagemap_addr *pagemap_addr,
> -			   unsigned long npages);
> +			   unsigned long npages,
> +			   struct dma_fence *pre_migrate_fence);
>  };
>  
>  /**
> @@ -212,6 +219,8 @@ struct drm_pagemap_devmem_ops {
>   * @dpagemap: The struct drm_pagemap of the pages this allocation belongs to.
>   * @size: Size of device memory allocation
>   * @timeslice_expiration: Timeslice expiration in jiffies
> + * @pre_migrate_fence: Fence to wait for or pipeline behind before migration starts.
> + * (May be NULL).
>   */
>  struct drm_pagemap_devmem {
>  	struct device *dev;
> @@ -221,6 +230,7 @@ struct drm_pagemap_devmem {
>  	struct drm_pagemap *dpagemap;
>  	size_t size;
>  	u64 timeslice_expiration;
> +	struct dma_fence *pre_migrate_fence;
>  };
>  
>  int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
> @@ -238,7 +248,8 @@ struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page);
>  void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
>  			     struct device *dev, struct mm_struct *mm,
>  			     const struct drm_pagemap_devmem_ops *ops,
> -			     struct drm_pagemap *dpagemap, size_t size);
> +			     struct drm_pagemap *dpagemap, size_t size,
> +			     struct dma_fence *pre_migrate_fence);
>  
>  int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  			    unsigned long start, unsigned long end,
> -- 
> 2.51.1
> 
