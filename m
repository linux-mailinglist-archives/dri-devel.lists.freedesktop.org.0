Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E149FA5FBE0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 17:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3600310E8F0;
	Thu, 13 Mar 2025 16:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BwWg2O6J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89A410E8E9;
 Thu, 13 Mar 2025 16:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741883749; x=1773419749;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=w+iU6yuh8nOFCfVg+v+H5LjlqLVwLA7DMWwRMVz2eiE=;
 b=BwWg2O6JYyHpI/+a5gDFlglGvS3U/UETIjsdpW+QAZQI5aYAYijxcljn
 O3bZEv+4+nBP4pZRHNH6JlbIT3C8CNN5t1NuIglKxZP6vNwU1DVp9O6gf
 U7S+yjS8BrAsQjQ61pg04UrZljl4J9TwYd2SL5H1Nbda4rf3Axv2aAIIv
 Up7jO2WzCsyYdrjqP97xxo8QNTFE1s2g+N4cXH86JNYnIjZlK1WqnOyrq
 lxm7ekgJhuiA6/sg65nSscn+jmSA76RvsRkJzW954WF1oaQLCRPFQDAmh
 kQqBa9YhzD4q1G9DTClj6uIt5AODIrTf8NRd2YBWz2Pmp5EQ6bCZEZuOU g==;
X-CSE-ConnectionGUID: 801Q2nY4RCu483TUeOKU5w==
X-CSE-MsgGUID: +dMR1nm7QPyigDtqoWjPqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="30604862"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="30604862"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 09:35:48 -0700
X-CSE-ConnectionGUID: AxSACT44RliTk630MNpudg==
X-CSE-MsgGUID: p2KrXdexTMyo+HqUqiZ1VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="151864985"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2025 09:35:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Mar 2025 09:35:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Mar 2025 09:35:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 09:35:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkH5t4Xm+dhDUXJZTDZitQxtYCOZ7JZfeshlepDUMZPal/HgkzR0g5rGT0rUt7jNsufYO5cVmsOJAlSpq5S6JpDPA2iS/Vi2emBnTeIl37E31oAi/TfFxv2sxB2HRSKToeNrkglaJMtWgzA5ZzdMNYk/6+4KOK8A4MpVqcYLaYA2eRc2UuDdih8cZJdwCZWpGewGKfa49KPw0Cj9+TNcp+PsUcZET2tx0EAGIHvmzXkOwzRilivRJ5TilXG+r8LSeFqrzjXbX30MBzAHNgAqzbXARjDdblUGUKLlDhf/6hu8xDiHrHr1ygwfe69cYvvuzqxGYbZogRDaNb7cCgSE/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqSkVw5PVGfFnTIiv+LjzfRbqyExRDSidL2FgHXKLCA=;
 b=drhjOegAZ4X+u6GY5WCa/W45PoBt++kCMOuGo2B5ougqGa4hqXBHELjNSbCU6jbfvy9sQvsx7yXIurg1qj4fV9mtgbTKlZgtW0B7J1R9Bxphuy/Z8MKsShQY8LBZjHfjFUlwntPaKXlzG0ZZquuBUixGLEN0zjm4gVR1b7zmtY+tv3eR6jiQaoigb5SLbsuv1E0PUSizBAvHZGemRmruja/orfPofN4/ewI1/0V+e1W4EIn4Ff7csAFKGCwG/IvsCzR2oYYzbnvSd1uK++iG3wEh0NRD5Uq8PQ18aSEYwrypbXr3uTt2+h4pGYGIDq4tlfEKyn0e/uN6onfRxy/X2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB7075.namprd11.prod.outlook.com (2603:10b6:510:20e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 16:35:43 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 16:35:43 +0000
Date: Thu, 13 Mar 2025 12:35:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <Z9MJWeIlZPuvXZ_G@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0154.namprd03.prod.outlook.com
 (2603:10b6:303:8d::9) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f20cb35-ab2e-4e4f-b567-08dd624d192e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?n96cSgpcQJmfqwyFo0WciNauaqB8G6sFnXBKe8emAGWXB7kM5ohSzmuW9Y?=
 =?iso-8859-1?Q?6aCuZbbLA5yuBzXbFSw7vLnEvSRqY2KVVkwSgZInpQ3AlkoHJv8YU8Wzc5?=
 =?iso-8859-1?Q?v5RP+I91cG7PCp8J3GuplWAbF1rJ7kcSR2oGdGd9uQ5j83MKVIlYA90/qy?=
 =?iso-8859-1?Q?kioKWr30w2o/t0o1714cpkEIH3JQkck9otZWUfRtFdhqKvgSFIS/qRBrmY?=
 =?iso-8859-1?Q?PrSRKOtu9K5NGtkjzjS/V45LeAYlebuqsl0mEWoojYv9lkAIkm2qkv2DF+?=
 =?iso-8859-1?Q?OmlFnfKAxbR4BDsF+g4A+dmObsjv4qjyvjcPAbPS/8idZoOFiufYjIdWnp?=
 =?iso-8859-1?Q?uhpwHhn82m9/5AaM+dNWJ8GEAsck/+yNPj33zaaIF4Sjlo/x7SmPMlJERb?=
 =?iso-8859-1?Q?Fi20W7ELue7xPRp4xFh4tkUmf6CKKzzCcAqJLMPmwGFCsPEHsrG3GduUya?=
 =?iso-8859-1?Q?c2jTXpfEiDQEYKlUa6D/6X7YKPUWuQO3e5Zkf1yRBn1WVOHe2rNVT1DYja?=
 =?iso-8859-1?Q?Le5BC+uPurVTjq0g5Y9MURYNsnT5ICFEPHwq7oDaGpYFOs6nODbQm3fRCG?=
 =?iso-8859-1?Q?nZGZNzy/whwblx6R/a49jW6ZlEC8DBHH6s37mxrLgbVXZ1Tf0/3j1ygRNo?=
 =?iso-8859-1?Q?ILVRlAnx+noTIo4KnQb3aPVmzqzlct21Ds/QQAYrZ6czp1wh81wLCw5lOD?=
 =?iso-8859-1?Q?kra1w9SprPcaBrmLOhkqtijUuVi+NwU04LOhSAIeYsoKLO81xLoAXGnDjr?=
 =?iso-8859-1?Q?PJiIDuw14ERI7snqBNCOrSQ/6R+9TOTnYlGPEVj/M/9OlfX0Otw+2f0a/K?=
 =?iso-8859-1?Q?bUWY6c3DakpkJ0gpiflXq3jMXkhSRgIv+TwwEpg4FwbED7xtONL8GEuNrw?=
 =?iso-8859-1?Q?pnZen96LeurGoM6eP8KZwoF7b+bdVoc9Sq21I0KR7XBGOz2A5R3LQ2cpxN?=
 =?iso-8859-1?Q?QB6UtExUSQ/oOmhbTmPZdGS7wQLd65wuhs9d1HGRCnzKK7MsxrqxsG+wqZ?=
 =?iso-8859-1?Q?CLXTO/pW6s8F6Utq8lRImlakaxaoyZ35Q1mWC4LMCoSxhq7DkdHga2a7uS?=
 =?iso-8859-1?Q?8KKQcsbHiSDUgfExaP7wkH9lBFe//7wHTbx2FspQR+EzYW+Sle0TDl+ZKF?=
 =?iso-8859-1?Q?14IjKeMfTbXl+CgguzCvwIrE1nDRxeyTDXfd0J9HelZVWFEykx9FUqV5Ao?=
 =?iso-8859-1?Q?PoR3JOGKL/xwR6BgG1ocaYNiFPblqfzWQ6joikdIkWqZh5zlSDBXRLT+9V?=
 =?iso-8859-1?Q?CJ7wiUfnABWVHqVvlM5JLpR4CnvSO8hLaki5tNxLRkSCegmE7Q441ocOa5?=
 =?iso-8859-1?Q?tAqDATGc1uslueo9qKW1yp2OlmZM4Yg7QxbWmIrM8jKkuIwo/8U5m0bhCj?=
 =?iso-8859-1?Q?vCh9hMRoo2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zHfXgVS4WUlokA2z0qX+mAj7e6sWF7pr9wv6kbmjJf5eEAbwoKgpJiTchF?=
 =?iso-8859-1?Q?zVauGfsKLkzf6WJU6oTMh0be8zd31AW/9gb1l8Ljm4nLIa6yjGehOFVORQ?=
 =?iso-8859-1?Q?3bP4/+Lr2b8IFGr1PsJvihP7lxFckxLCgKWRahDwwdWpnuldP3hUUJ+zJ9?=
 =?iso-8859-1?Q?N5SsdYsam8sDGGdDYNSSUWZH98kD+O1BEMhNVUSDljo+z0IXXveSlzbfKT?=
 =?iso-8859-1?Q?qFx33bikG1HNEqmTQBjngGy9Ao6ypPOtEeH/wvDjjdpWrXVns+SmhIeoFt?=
 =?iso-8859-1?Q?5bzsKgHO7w7NWQjZMB34Q+8M4Fpytk/nk9XljQ7Xj4bHwbJ3sRXwwV43ZV?=
 =?iso-8859-1?Q?QTyaLmeJ2HmUoLGzWYnyTcpd7rwr/WvtrOewgy9zHbkJ5kuze3xYzFe3AL?=
 =?iso-8859-1?Q?lFGkaTltza0w1DbCi9payYBYCLXYxJLBilBV9FJ7kDh+67tKRt2JburrpO?=
 =?iso-8859-1?Q?kzFW9MYZvXXNEP3i4zEoGx5gOVe+x8L6IZ+eT+99P9R14R9a1gtcWTBANO?=
 =?iso-8859-1?Q?eYKluzHexSAMNpRYjSeTjWJkhUCqMq8oOv1SDThhrDSJVRp80LfbL9+SuG?=
 =?iso-8859-1?Q?IgxD0UDZsydoHBaywlKN6Yp6iS3VDSFLaPjzsmhscL4t286VXbEhG98YYj?=
 =?iso-8859-1?Q?q2lGpbo+bTpBHaFWW+qm+cPJnP3Zm8mjzUpe9U2T76BjTMuKFEjx5T7Rmk?=
 =?iso-8859-1?Q?xKPhpo9wyWkM9MWIt8V3Dgy8O5MQvy+SXcFUa3pul+/NFNh88GNjSnuDNM?=
 =?iso-8859-1?Q?lyV0hnZp1nObKGx2zuH74ilNcbUJHqLrWTl/7a+3f+XPgovqF333TGpoGY?=
 =?iso-8859-1?Q?UAqzhT9Pb2p44k/5cYvmhcAySyExxc8mEtAxp7uHB2qfRJLjcfUNIUyzYI?=
 =?iso-8859-1?Q?6gAs+le0iq9ETMZj6Bdk1OLA1JJkgp6JIo07THjZD0kjWmISKQh0QjS3Fd?=
 =?iso-8859-1?Q?BhIxaUN2yBxTLVrOba5+y74Fe/TeLdY7amva36R9H7rIf3Rr17xKCmxHMc?=
 =?iso-8859-1?Q?Zj3BDp11+tpT5xAP4u37/+07TYFSXoDuixj3kqs48M6fK1NwNLwu30DKWU?=
 =?iso-8859-1?Q?X/pwNt7tAKLgCyAFrUKx5h/ZUIQqGsG4aOVklAvzG6krc9Ww1ho2iu2XYT?=
 =?iso-8859-1?Q?th4Gza2Am3dA8eN7fa60e7V4/fwZ0j/Z+yA8nAY645KNeR4uJwsnTlrK5/?=
 =?iso-8859-1?Q?uhCtaGE2LcRr362O0e+u8ttys/rc1d1hgJEm4NahyTTr5y/mEaDRAsNHxR?=
 =?iso-8859-1?Q?IkEznnWdDeB/fa88DXwWcZkW0or0wCk5cwtaogIpJ2cEchCly4ld1R6IJs?=
 =?iso-8859-1?Q?21QOF3XBno9lzcKmawGjMiI/ryhZkk9t/02Saw5z6LhIteKTFjkFRWsG4T?=
 =?iso-8859-1?Q?ReTBxVcu4ttxN85Swe73xcSN1xahzXahob+0FO3p7OfIDN2OII2m5u6kyM?=
 =?iso-8859-1?Q?aBFaOZjux7yWFm1zzQ82KoQkawb5cScUnWZyo2L0wt4cNU8yTPH0lBUMFB?=
 =?iso-8859-1?Q?gvRhzP1XSJ6DaG5CVYjUaj9Vap5TkpgkCoOpuOrlt53NNz6E0h5jOjvUeX?=
 =?iso-8859-1?Q?q8QpEjhKWRG8JHUmDhU+boiXuNwedm2rjomfN5kYrXG4LUCN6/i9OmO1dv?=
 =?iso-8859-1?Q?AKPp1h65ph8Qr8P7yYFWeeHuth4C0O3L9G0Z5Xi+zkJD9xaBsWai5T4A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f20cb35-ab2e-4e4f-b567-08dd624d192e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 16:35:43.3157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rsAA2Z1RsMXoxm/ugYnz9D7jBeJnaCh9MBHFmZayEBECqfkI2fqGq/aM33mPfwgRVAPWeWGByFnOZYMVyER3+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7075
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

Hi Dave and Sima,

Here goes xe fixes for this week.

It is worth mention that we are disabling D3Cold on BMG because
we found some bugs where depending on the combination of BMG
card and the host, the PCI upstream port link port re-training
might fail on D3Cold -> D0 blowing things up. But while we
work with that and propagating this protection to the end
users, we are not disabling in our drm-tip to ensure that our
developers and CI can continue working with D3Cold enabled.
Everything we disable behind flags for developers will likely
be forgotten and regressions will pile up and be harder later
to re-enable it.

So, topic/xe-for-CI re-enables D3Cold. If developers ends up
having a bad combination they can workaround it by boot
parameter pcie_port_pm=off or with
echo 0 > /sys/bus/pci/devices/<bdf>/vram_d3cold_threshold

Also, the topic branch solution helps us to avoid adding the
controversial module parameters. But if there's any concern
or issues with this approach, please let me know.

Thanks,
Rodrigo.

drm-xe-fixes-2025-03-13:
- Release guc ids before cancelling work (Tejas)
- Fix new warnings around userptr (Thomas)
- Temporaritly disable D3Cold on BMG (Rodrigo)
- Retry and wait longer for GuC PC to start (Rodrigo)
- Remove redundant check in xe_vm_create_ioctl (Xin)
The following changes since commit 80e54e84911a923c40d7bee33a34c1b4be148d7a:

  Linux 6.14-rc6 (2025-03-09 13:45:25 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-03-13

for you to fetch changes up to f5d4e81774c42d9c2ea3980e570f3330ff2ed5d2:

  drm/xe: remove redundant check in xe_vm_create_ioctl() (2025-03-10 14:01:43 -0400)

----------------------------------------------------------------
- Release guc ids before cancelling work (Tejas)
- Fix new warnings around userptr (Thomas)
- Temporaritly disable D3Cold on BMG (Rodrigo)
- Retry and wait longer for GuC PC to start (Rodrigo)
- Remove redundant check in xe_vm_create_ioctl (Xin)

----------------------------------------------------------------
Rodrigo Vivi (2):
      drm/xe/pm: Temporarily disable D3Cold on BMG
      drm/xe/guc_pc: Retry and wait longer for GuC PC start

Tejas Upadhyay (1):
      drm/xe: Release guc ids before cancelling work

Thomas Hellström (1):
      drm/xe/userptr: Fix an incorrect assert

Xin Wang (1):
      drm/xe: remove redundant check in xe_vm_create_ioctl()

 drivers/gpu/drm/xe/xe_guc_pc.c     | 53 ++++++++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
 drivers/gpu/drm/xe/xe_hmm.c        |  6 ++++-
 drivers/gpu/drm/xe/xe_pm.c         | 13 +++++++++-
 drivers/gpu/drm/xe/xe_vm.c         |  3 ---
 5 files changed, 58 insertions(+), 19 deletions(-)
