Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E0BA6A475
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 12:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4231B10E5E6;
	Thu, 20 Mar 2025 11:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iR2nrKnm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD9210E5E5;
 Thu, 20 Mar 2025 11:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742468982; x=1774004982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ekCQgO9lCFpsXza+3seCULH6HQkdNXXsZrNKbO3l4Ig=;
 b=iR2nrKnmtbVJLXws5JSe4O6lYvN+g+Y7Z8M2XQSLGRBm7CgBhaOIH2tv
 LnufSsOhK6dAwghII92xln+xKlR8ZqfzeyyYb7NbyTvbJKZ0beb0DQeBJ
 2lsADZSpfhZOckaX+EsVjzi/5cxVb6NYscd8LOpBLPqbx2wTFpEcEexnB
 EikXOsMRfjPJhNNbISU68bm67Bb9VLfJb+oLv0gHOGQs7bW78HJIGzHYQ
 smMobeP9Nn51hr2+miURF6Uo63xmIyzkg+0dl01H9iLQEm3tvlpzQqMQ/
 dIe+2k9wQvi9FCshByg077px8r9ku8uLKJf+z8qX/FD5mqRc9Dx7PGl8G w==;
X-CSE-ConnectionGUID: 39n/TN8qTu2cKNYGd8cSAw==
X-CSE-MsgGUID: i940n9TXSqeeBsVFuIcMwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="55070822"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="55070822"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 04:09:41 -0700
X-CSE-ConnectionGUID: mw3l8HyIQ1Oj8CGVyJqRcA==
X-CSE-MsgGUID: B4iyALuNTZunFHaR4XRPOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="122785029"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2025 04:09:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Mar 2025 04:09:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 04:09:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 04:09:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EwbYRSmwmP3zSBDUrzhZB7KIqq6heZCjGt0urS2nDqR27dM9tu87zhSuvxDFmHb9HyBJes/gC8aanGoUhL0Qd4Cha50ajI56dhXE4GdHpKYpKTaVOlTY1X4Csarfz1Yrt1pbiTVMK8yeU+r/yaI/vcK1H9rBmUEiT3PIKcTJzTRlbYtirPvmtB/kmKcp6vHF2CvCxcV8/E2/HVy41iaySaV8E76y/z54miFyasPjuZb6DOiJiicu9SUPmW4cKLiXXjYhZb/YxelRerH/1SjomhPg0N7MDPpipgXB0p+P3NHO7kP51V09I78CnD2J6QHcn71xdJVvW7VDfH9IChoqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vhqoj3NyjngsQs5wE5hzQZVK+3P++t745Q3Nd/M8vWo=;
 b=YlMxTUxwe3kfM206lC22N8LQTXZE6RW6E76Q6OIGqPiBgmcXHMC5Ofl1+5fNBBQhTGNNRaEIAXaS5QKai2NmATtmQJ6f9D7Ap4iV04U/w+ATEPB888BoCsFVxmk0ZP2Ka24IsLs/41vfLJ1LgDqXBbdykEdIg2KnyBZpJz/rGOSzyT5iEMP+oWFpXYEWS1Wsxk8sc0qlyANWwY3manPJMdg1fa/KOp7k/m4UysAylh+Nf+FwjAvutMLYF1gpZHC/Btc3eTf5klRT81g3/c+MLox3ZhBt2zDFBi2m9lAyc96QgtjEv7sQ6JvMd9+BlJHd/tRfMBwF8bZ98iZ+E4QarA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SN7PR11MB6875.namprd11.prod.outlook.com (2603:10b6:806:2a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 11:09:38 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%7]) with mapi id 15.20.8534.036; Thu, 20 Mar 2025
 11:09:38 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v6 1/6] PCI/IOV: Restore VF resizable BAR state after reset
Date: Thu, 20 Mar 2025 12:08:49 +0100
Message-ID: <20250320110854.3866284-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320110854.3866284-1-michal.winiarski@intel.com>
References: <20250320110854.3866284-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0089.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::30) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SN7PR11MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c8272c-cc60-47b4-a478-08dd679fb4a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blFUTjRGVzZWRVdJSmVpRWFsd1VuK2s0WGtjVWxnbDUzR0JFTzliR0lEcGts?=
 =?utf-8?B?Mjg4akR1MUMxK2xrZ3huY0FGSUV5NE1ybXoxdHVIdkI0aTRHZ3BDOVdTaGFM?=
 =?utf-8?B?VFdwK1h4ZS96dEVBUjVLSDJvQkJCNFp6SksyWXQvTHo4NHplTGZ4RnEwUGlR?=
 =?utf-8?B?WEJzMTlTQzJId09QNHByY0tXUDlqN3dzMzVpSG5WY1FhUzhPRUw1dmFBTzhv?=
 =?utf-8?B?NHNCcmMzL3pWVDhlQS85bFNFT0IzLytycnRkcGNNVEZ3by9HdzJKaHpPYXlr?=
 =?utf-8?B?S0hLUnQyWTRzNkVzUCt5R1lJcHJSTTBmMVppMU5OYnBoeFlPbitrVUtra0Zo?=
 =?utf-8?B?UHlyZUdtdVdlS1dobk5LaDcxUHRQK1h3RVhlbjQyaUFGRzlRajkwTGxiTzly?=
 =?utf-8?B?c3ZkK21Zd1kwODhaVGJ2OHhDS3RUT1Y2elQ2NmpFRy9McnJSb3Y1VmZpQXFH?=
 =?utf-8?B?UFBHVzM1RGxsVjFQd3J2SWdzRU5UMXlTOU9wTUlZSFg4M3BoSlIwems3N0Fq?=
 =?utf-8?B?Rk8zM0d2cEx5b3RlcCtFYkFIUGI1dzZMV0JDSHhjSmRraFNtMzNBRWt3UG93?=
 =?utf-8?B?UTR4L3dERFdBOTFSSGhpVVFrMkMvQTYzRVk4dVZmT240WXlQUE9Hc3N6TWRV?=
 =?utf-8?B?cHZsbW5KeWVkVzBYMTdwWU5PWFZwbEVvNWZBMVRnSGkzZlAyK0lFWVBaM3R2?=
 =?utf-8?B?QkRwY0FEYkE5RmhDUWJORFlEbHM1czhYbGJBSzUxaUxhSTFxbGZlV0NqYUF2?=
 =?utf-8?B?dm1ORWZ2UUo4aUdTcmhjQTNEOXB3U2k4bnZJSFBuN3FEWUlNcWw5VERhUXdF?=
 =?utf-8?B?MWtMYmdDbVprSFdEdmtKUTFoSnlSN1IxUnYwK1JyRmQrREpQR0JpaUxENmF0?=
 =?utf-8?B?YnJhT0FuOGJEc1R5TDIrYUJWZUkvOHFsejNPNnJUZlhJZzRCZXo3RXNoMkIy?=
 =?utf-8?B?TmNYK3cyeGpSMFlBYkQxN3JybHlWbyswdC9VSUhCWjVNOXowRVJFQlQyN0ds?=
 =?utf-8?B?aElTdXg1dVhKeHAvZWJnbC9iYklvVEE1NUd2R1VPM0VGTXZVR2dTTjk0Z0dh?=
 =?utf-8?B?bU5EZzMxeVFMT0pSSnlYM3BGWkZyRnc1L1lGV3NYOUJjTW5mRUxFNy9kcHh2?=
 =?utf-8?B?Z29OdFhJMVVVaXl6b1hxbXJXVk5VdCtNMmxjdU16K3dYWXRsUExhWnFEdHR1?=
 =?utf-8?B?TEF6bUcyaGNhalMzdytIcWZvMWFCN0xqbFJvbTZ1QTNOdFdIdVF4NjEwdVpK?=
 =?utf-8?B?aFFnc2RvUGpGbnNqMHU3NWFnb0hKbTdNdVNGUlJZa25IdkZhN2pmWXVPSnh2?=
 =?utf-8?B?b1ZnclBkNGN6a2dFVDJiR1lCMTJza3RrSTlsZTBXSjJxcHUvc29kdFp5dC9R?=
 =?utf-8?B?NkZmU1RpalFnK1cvSlJUanFnUjdvT3pXdXJLMkRMVFFSUUFPaTJvYlVnQ1lE?=
 =?utf-8?B?NEdGaHB5bk9WMU54MDlCSmkzSzdOdEJ5ajdUWm5Hb21hRWRtTks0Z25hV1lo?=
 =?utf-8?B?VHg1SHpSbnF3NDhhQWxxMlc4NUxqQ0RvaklBZld1L0ozWGZrL2N6TTNBQjdG?=
 =?utf-8?B?ckl5TStEYXVoZk5WNnkrb1hoOGR3V2IvVW53bk9jeVlNT3F5cldsYkZnamly?=
 =?utf-8?B?SGkvVm1tVW90MnoyU0FvbGdjdWZTMDZ0RndYeGxVUGhHWmVSTEZQZW80WExM?=
 =?utf-8?B?ZzdYZ3UxdTVvNnpMaEc4U2dpeDRqbFZocGFJOFFFWGhOOGFUeTlwWjVNUGdq?=
 =?utf-8?B?eXN0a01ZYkNKUms2Rnp6WFpGOVh4b2FiVzB3KzJLSk9pTUdkQWRVTzl0S0Rl?=
 =?utf-8?B?UlFtUlZmRWZpZFJQZm4rVmV0V0pOZmEzWXhZSnYyTnUweEo0TStINENzTkJr?=
 =?utf-8?Q?kii/QgRfcqPlb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjM4Y3diK0NYb3BZdnBydDRBU3RUeG9tZEVrR3lMTEYvMDEvSytZZnVKZ0Z5?=
 =?utf-8?B?M0ZLRHhSNEp0bjJjdGhTUStvRS9VMC9GV2RRQWtMYldaL1VLckdFcmNnRXJw?=
 =?utf-8?B?UUJTc1BZZThubDQwZHJqdTdQRWRhd00waTE4bTlXYW44emVhb0Y0MnhBSDRs?=
 =?utf-8?B?TVpvakpPTGJoYVNzS2d4U3pjU3lralpRNlZyU1oyOGJERUVYZ0VaZDFweDlK?=
 =?utf-8?B?NUVpRlh0YUJheHFHMGNRMDBZVTVsQWtjTkcwSW90QjM4RW8xTHFEWGMrcXpC?=
 =?utf-8?B?Z2Jjdm9nQ0xoYWN6RFE2YVROQSszNGdIZnlyQ3A4V3NBZVNhTEE2QUhiNEFS?=
 =?utf-8?B?ZTdvWDJzOS8rblYrSHFMTVFmb2Nha2pPcENNQ2R2L2VmL0Fxd1lVaXlSQ1o4?=
 =?utf-8?B?bnorTFVpdnlqUlJoOXA2dG9wNy9naFgzcWxGcmFMMEpLZTFyR1NyWjhQMkd6?=
 =?utf-8?B?YWdkWnExZ2R4c2FrM2l2d3BrK1o0U09RYmR4OFhEYXpNS3d3bHhCYkx4M3ha?=
 =?utf-8?B?aDdZUTh5QUVKRzZ4di90cnpRcEhmT1loVzk3Mm10dlZlc0M0cDhsd0szRUk3?=
 =?utf-8?B?WUk0c1h5SGRKSW5YbElBRmlQTHllT0kvWTJUbW1jODVSdUNwS3FCVzNSUzFa?=
 =?utf-8?B?RzJQdGFMbzFrOHRHcUgvaG5LemtreHpyeGJPMEtFckxpQ0FORm9DS3hXdEow?=
 =?utf-8?B?OEhYTUdhNHZxTjhsbU5DTjRia1JLY3hCaE5qWFNYd09helQ2THREb0FGcExn?=
 =?utf-8?B?R3lrMkU4eUFaVDVZNXJpYk0wVnBPRU5UekQwQzEyTkFpa1VQalhzV3Y2Z2lY?=
 =?utf-8?B?ZUxzUkFnL0xZbDZQNlFWQ3EzMEFCME1zM25SZlhKZ0tJZHdvVDhEb2tQNGVp?=
 =?utf-8?B?K2UyZUhPR0hERU85dzR3UEppNHMzVjBmVEp5MGZLUTd4Z0hEdUhPQWV5WjZq?=
 =?utf-8?B?REtwbXo1RHh0N0p4VytRa3lld1NKaFZkTXV4bkxpMlAxOWJaQmNQb2VySE12?=
 =?utf-8?B?QjZuNDFFd1Z2TUJQQzVoOWRydFZLSFdHTXMwY1pWcUhQVkZqZEZpU3lKQ3Bm?=
 =?utf-8?B?MkZOby8va05IbGdsdWNYeHdTbGdza3dIOGJVeDFDZFdWdGJrWVQ4OWtSNHdO?=
 =?utf-8?B?bjhoNE5Za1dlRkZSWnJ2Uzc2eGxmS0JuWHNTMUpTZCt3ZG8yanRZVmQ4Q2lK?=
 =?utf-8?B?bHUvcGRQc0FRL25mQ0hmTDIzRHUxdVloTXhHTHkxeEVRdXg3WEZWaTE3NzJV?=
 =?utf-8?B?ejVPVnhjSXRqU3dSWmQrc1BUT0F1dDVudDZ1STNXeUJUcytEaDhRRFROdGNn?=
 =?utf-8?B?bnpucGFDaEVGWFgxT3JsYlFqTE5tbi85UlVUUEtyUklXd2JMVWVlemZnSVdG?=
 =?utf-8?B?YkJaaVFsaXA4SWtrRWRBTUVzS3M4ZDZVU1F5VnVVcnI0RUNYQ2xhTWsxSmJZ?=
 =?utf-8?B?bjhlT09RUklrTURuYlpQUGlMU0tJOHVYQ1o4YmZjUmhybG5tNFVtOVpQcVNG?=
 =?utf-8?B?bmtCK3ZjODBXVC8xcVpqUGZHVTJXTDd0OXFNZkJ2SkliZityZXMwN2k5UG92?=
 =?utf-8?B?YW5XNVY5ekMyZGNTSWJnZkkrY2c4elczMTFjMkdZYS9WQkxQNnF5Z3VMb0Fm?=
 =?utf-8?B?OWNVdzVsQVM3Qy9YZ2dUS2JqUFZzK1NFUlJKRUhkYnF6Vm5MalFsMnBQQytn?=
 =?utf-8?B?MXdPSWdlREZJeHZYelVNenFkbk9hYytIZmRLa2IvWERRRWZ2VldXNis3YnlD?=
 =?utf-8?B?NG94NUhDR1laMUtnN0hhNVprT3dLYmE2NFNCVjJFUHd2Z2VYVVFBTTJDM1c1?=
 =?utf-8?B?M2c1QXNVWFgwS3FjaFY1SytBUFRjVU5OenEySlFVRm90LzFRR3hyOUtzYk5Y?=
 =?utf-8?B?RDZuUkUwZDVlUk5pY2JMaElXM1RuMlV4aTJMNXM1WTcxNDZ6bkNGR3k4Qm1T?=
 =?utf-8?B?d05lZWxscUFFek5CbFhEU21MOGR0U1d2YU1ncUU2SWo1NnNIUE9sdWJ1UkRh?=
 =?utf-8?B?Qk85Y0FSbzZDcnF0YnZvbU9BeWtFLzBROEZpU1RwNHF5VVZKcTBDK0FsQnpJ?=
 =?utf-8?B?cXh2eUx1T0ZLbTZHQlgvMVVZVzFhY3Q1TmdhSHQzRW5MWWVPQ0o4d1o1cjFv?=
 =?utf-8?B?bUpBRzRFZVY2elloay9RYURHbmhIWTY3UlVkUjRpZXBpdXkwaFZycEN5akwy?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c8272c-cc60-47b4-a478-08dd679fb4a8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 11:09:38.5892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yeru6Y/TihAFiVy+ZiRoXSoLswXw5ZmywiEUV6EoXIjDdKGPicw2ROcwifQCC7ks8cV5npN1oiZo53gl4ROTWJdSTFPQ1LRN9itJioplLqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6875
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

Similar to regular resizable BAR, VF BAR can also be resized, e.g. by
the system firmware or the PCI subsystem itself.

Add the capability ID and restore it as a part of IOV state.

See PCIe r4.0, sec 9.3.7.4.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/pci/iov.c             | 30 +++++++++++++++++++++++++++++-
 drivers/pci/pci.h             |  1 +
 include/uapi/linux/pci_regs.h |  1 +
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 121540f57d4bf..bf95387993cd5 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2009 Intel Corporation, Yu Zhao <yu.zhao@intel.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/export.h>
@@ -830,6 +831,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
 	pci_read_config_byte(dev, pos + PCI_SRIOV_FUNC_LINK, &iov->link);
 	if (pci_pcie_type(dev) == PCI_EXP_TYPE_RC_END)
 		iov->link = PCI_DEVFN(PCI_SLOT(dev->devfn), iov->link);
+	iov->vf_rebar_cap = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_VF_REBAR);
 
 	if (pdev)
 		iov->dev = pci_dev_get(pdev);
@@ -868,6 +870,30 @@ static void sriov_release(struct pci_dev *dev)
 	dev->sriov = NULL;
 }
 
+static void sriov_restore_vf_rebar_state(struct pci_dev *dev)
+{
+	unsigned int pos, nbars, i;
+	u32 ctrl;
+
+	pos = dev->sriov->vf_rebar_cap;
+	if (!pos)
+		return;
+
+	pci_read_config_dword(dev, pos + PCI_REBAR_CTRL, &ctrl);
+	nbars = FIELD_GET(PCI_REBAR_CTRL_NBAR_MASK, ctrl);
+
+	for (i = 0; i < nbars; i++, pos += 8) {
+		int bar_idx, size;
+
+		pci_read_config_dword(dev, pos + PCI_REBAR_CTRL, &ctrl);
+		bar_idx = FIELD_GET(PCI_REBAR_CTRL_BAR_IDX, ctrl);
+		size = pci_rebar_bytes_to_size(dev->sriov->barsz[bar_idx]);
+		ctrl &= ~PCI_REBAR_CTRL_BAR_SIZE;
+		ctrl |= FIELD_PREP(PCI_REBAR_CTRL_BAR_SIZE, size);
+		pci_write_config_dword(dev, pos + PCI_REBAR_CTRL, ctrl);
+	}
+}
+
 static void sriov_restore_state(struct pci_dev *dev)
 {
 	int i;
@@ -1027,8 +1053,10 @@ resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno)
  */
 void pci_restore_iov_state(struct pci_dev *dev)
 {
-	if (dev->is_physfn)
+	if (dev->is_physfn) {
+		sriov_restore_vf_rebar_state(dev);
 		sriov_restore_state(dev);
+	}
 }
 
 /**
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index b81e99cd4b62a..adc54bb2c8b34 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -482,6 +482,7 @@ struct pci_sriov {
 	u16		subsystem_vendor; /* VF subsystem vendor */
 	u16		subsystem_device; /* VF subsystem device */
 	resource_size_t	barsz[PCI_SRIOV_NUM_BARS];	/* VF BAR size */
+	u16		vf_rebar_cap;	/* VF Resizable BAR capability offset */
 	bool		drivers_autoprobe; /* Auto probing of VFs by driver */
 };
 
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index ba326710f9c8b..bb2a334e50386 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -745,6 +745,7 @@
 #define PCI_EXT_CAP_ID_L1SS	0x1E	/* L1 PM Substates */
 #define PCI_EXT_CAP_ID_PTM	0x1F	/* Precision Time Measurement */
 #define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
+#define PCI_EXT_CAP_ID_VF_REBAR 0x24	/* VF Resizable BAR */
 #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
 #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
 #define PCI_EXT_CAP_ID_NPEM	0x29	/* Native PCIe Enclosure Management */
-- 
2.49.0

