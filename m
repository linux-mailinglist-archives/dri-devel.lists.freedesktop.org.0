Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A961FA6A478
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 12:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0564610E5EB;
	Thu, 20 Mar 2025 11:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k6bRoHi2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB9A10E5EB;
 Thu, 20 Mar 2025 11:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742468993; x=1774004993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Py+C7U8AL8Mhwsx5wsAyiuW0d5Lr/DX4NyaGNQSGdRM=;
 b=k6bRoHi2zEqBaQRaa7bzTlg1e0PYbsvC/D/L+kM29h+JSUqqcQSD/WUe
 2Zqei3SmR9OWhoUVzXfBqon/JaIDpz8D1iln3OTzqyAwRlLaGeJ3Wxptj
 tnQ5Z6ghKrrhL196qhDv5dyTOc8bKptfYFO9qSUp8kWNCt86CXmOVZKr6
 M+kIenbHtCmunvlP3SXte8Jue1PWuuJEnfyZTv4f98EcOgjsjKaZ2obT7
 SQ6cjsojEhSTDNb7kn/GaphbW2stQxZ1D9uE6Ce/pde622Pm9fhNYLidV
 XMT7fampqFG06Ho1+RljsVk7g/jQ9NwWFAdzr1T1Gf4sIsxD5X68qcXx5 A==;
X-CSE-ConnectionGUID: QamcSOXNTp2nvrLg6e0/tA==
X-CSE-MsgGUID: E3RXFx8wSTa98XSmJMZmXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="55070853"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="55070853"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 04:09:52 -0700
X-CSE-ConnectionGUID: YcWybnwVRu+Ex7/RF8AW8w==
X-CSE-MsgGUID: ALZLpGlWR5yCb0ohY5LgxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="146265551"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2025 04:09:51 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Mar 2025 04:09:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 20 Mar 2025 04:09:51 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 04:09:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMyaebHywiYTGFmRz2DccbT0sMxS94jWeLfhtwhAxeb62xaoWtFZWYgFYtYoNtCcU8ZOcHQBGrwSdIxrrKZ7Tpx/uIAZ+TMmDxekqIDZda6zS3dCA+2rjTQc1IJMwvvpRgmzztf7OaeL73l3BEAaAwUFORVnlwMVMzQMN5ZTs4cnPYfAHBCLy9BP58hL+3wQvZH+YYSvufbg08Hv8+EaaHv1vwvCRImr0yjLWHCGsHBBgjU2qmFGxRcs4If2XYs8GBH9ShqlqNrq8tq1Tjvq862qXpN3ct44OA9kp7Q42w1Nr79QvG40lBK44gTfyuOUzwSy5YLAexeWvZCKZb7q1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LT2QoIDWpaGCsL+nS7tfdyFCxwyvZgbx2hTsMTk0fcM=;
 b=QXiAA8zsuG8XfR37V5xtedkHvKMz8fDGydU9PWz2tsWxnllT72RaX6Lhn+WiRz8iPa8YsUjFjVfaUAG4TH+1WuKqMIpqDfde+oPB+NcUfDE8btB3AMTqerHJaD/5q7dlrPVODL4pFytvsWPfQxrIC9vyHpetSw7no6D/69K1BDiBSx+Ra6JLjErfpBYFVKLnamOa56cK4ozQ6vSFQqWXnRz1Y5vAIOas8gayCF6afgwFy58DkhWf+x/Sg1O+EGS6+XMShIwGPXfktFEyTFZN3lXXzkEdvPQVm7XOPrGs41hwVHPgxqpTxzmLKghdxqjFAnzy5oNbsTXpUUx0sWCaGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SN7PR11MB6875.namprd11.prod.outlook.com (2603:10b6:806:2a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 11:09:48 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%7]) with mapi id 15.20.8534.036; Thu, 20 Mar 2025
 11:09:48 +0000
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
Subject: [PATCH v6 3/6] PCI: Allow IOV resources to be resized in
 pci_resize_resource()
Date: Thu, 20 Mar 2025 12:08:51 +0100
Message-ID: <20250320110854.3866284-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320110854.3866284-1-michal.winiarski@intel.com>
References: <20250320110854.3866284-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0134.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SN7PR11MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee32af5-afa2-403d-471f-08dd679fba81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUJzVUp1WitrY3djUjFQWWpKRHNGTmZucFRFWFZ2U25FMjJrbWhSQW0yekQy?=
 =?utf-8?B?bUhjenVnRUJ3K1VCbllFaW1FcXZBQi9ScFE0YmJlWjhxeFZzbDFLY2dPYnRL?=
 =?utf-8?B?T1JScVIwTFJuRkIwam1jbkpsWGRjZitxRnJzOGlXQWtIcVh0ZUR1VGhqUEtr?=
 =?utf-8?B?UU1ZYTdmbjlSVHFBVUpSUll1VDhQZGpMSnJkTmU5Nzl0aHkvdW85a0FPdjVi?=
 =?utf-8?B?eWh2Z3doM2l5MERUUnBrY2NESmJESjVZQ2VlZ204WlcrbCt5Y0poRnRFRUpD?=
 =?utf-8?B?cWRwMjJZVHJERHFnV2JnQ3RDekRVUUJiaVdhSlJ4WGRqREMxejEzOUp2ajZ6?=
 =?utf-8?B?SEorN2twb1pnbk5icHdMV29MZUc4SjBoNDFPR2x4TUlTMjhCSmx5K05oY0pG?=
 =?utf-8?B?aVI3VmkyUy9yYWJsL3RBaWFVQWk4RjBiRnk0U0UxaUI1d0ozRHNid1VOd215?=
 =?utf-8?B?V3pMTFFLQ3A1OHh5ZFNrUktQa2Q1MmU2WHRUeWhMVVFwdko5b3Z3NEI2RTI4?=
 =?utf-8?B?UXMrUHBYUFZQNlJjMzl6aUVoOS81cFQ3L2NUTG4wNGJMdnY0dXRBMW40d09C?=
 =?utf-8?B?NWJJU1dxZGRGUTFIOTh5bDJjNG4xTnRDelBIM2xkWlNVb2VTMEc4cFMwQXBK?=
 =?utf-8?B?NXEzL3FxcGF5eFc4WUd4emNrMWhTSmI3RXJCMHFlbVU4blFTSWZSWXFRM3JM?=
 =?utf-8?B?dm16MTFzRWxFdTROWVA3TlAvT3dFOGtVOVlFY2dzVTFrU002b043dkRKMXdN?=
 =?utf-8?B?dlJDNDF0dWxKY1VoM1dCU1hTTzJjUEpRWm9tN0RtVElMWVlHd2VKUWdXRUVv?=
 =?utf-8?B?U3pvZnlNKzRBeHF4SjRNRTRJN2RVUTlOZVpKUFNHNzlHUWwxaFh3NU9BU3FD?=
 =?utf-8?B?UjU4WlB6dlJIM1dsRjFnTm1KMXNoR05yWVQ0cHk1WFBoN051dEx3OTg3SG5y?=
 =?utf-8?B?MFIzMGNwcEhMT3I3R2xHSWFybWdkME1ONTlpNm5BWU13aGtTMEd4Y3QyMDJK?=
 =?utf-8?B?SEdtK3U0WkhBRENzNncxcmNrODhkSXFFNk1MSHBNQVlYbEdzNm91ZHhHbm5N?=
 =?utf-8?B?WlMwNHluLzVLNm0vODRZRGp2R2QrMmFGSHhHSzhBaXU0WjFmRzg4eUEyMStx?=
 =?utf-8?B?VTAwTXpzUTVlYW1jcmFZa1BXYzB5NncwU1RGUjloSnZwM1I1Kys3R1p2bTJZ?=
 =?utf-8?B?TUhuakU5WWFQQ2J3Z01DWStDbXhLZzFueU0zQkxMMjBjVkNIVGZsK3haTE1k?=
 =?utf-8?B?QUM1Ymp2a1pvYWZUMXpuN0p1TlJoUGx6WjRqZTVJY2pldDR4NEphS2pJY3Ir?=
 =?utf-8?B?Q0tya0kwUXl0NStJZVVCb3hITVY1Y0dqWGJkUjNIc0NHVHdTNkhMR2ZseWdz?=
 =?utf-8?B?T2RWamQvQXVtaW95REpiQktvR0tKc1RoMHdtVGR3Rjk3UUFVZldVM1lLUnpu?=
 =?utf-8?B?cCtEY0d3dkpPa2gxbUROeHFzc0tTeXhabjdQdVdzOTRDY2h6YndsU0FMVkt0?=
 =?utf-8?B?S2dEMktkbWRwMnphRXlMU09zOWhnb3JWTGJJQThHcC9BTjBMNS9JS2xrcXU5?=
 =?utf-8?B?WXJEaHJwajVubDB2V3RRZThQR1FkSEZUaU15NitsSmNicllvaDU4M1llcGVI?=
 =?utf-8?B?eTljMVBHN2hsRXJnWjdCVU9WZ2wwclFOMG1kZWt3VGJaUmx4TWZ0UXF6aFJ5?=
 =?utf-8?B?b21ieVhpNTRvTk5YWEJOOHQvVGhBcWdnWFhpUU5XRzQzTDVtTTRHdzhpa0x1?=
 =?utf-8?B?R0xrb2NRMFpvNEtjb0VVb29GWUJzNG1FelFWSnExYjZtb3FCanF2NG9hWDhS?=
 =?utf-8?B?cEw1bzVKUVZvazBSMmdJckRDRXpOWVhZOUhqb3V2c3Q3TjBIcTFUaFR5WEhP?=
 =?utf-8?Q?QAWb1Y6wUkSCO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnhiemJGT3FUeDhMQ01GNCtiOFhpUmVQQ1dQdGZyV1JhdmMxN2tCcTl3TTdT?=
 =?utf-8?B?M0kvcTl3S3JQRkltNGxtNzF4ak9yVFkvVCtQaFhrbnRuZTl0VnJjSHdKeUdy?=
 =?utf-8?B?bVI1WDJNbzhMUkVVYUU4OGRMc1N0VS82eHZMTWZnOXBuMURCU1cxUEZwZEQz?=
 =?utf-8?B?STBTRXoyTGV5Z01Pd1NKdmthUDZ1OWJyU0drMXZKZTZZQm1lT3JLUDM5YzJT?=
 =?utf-8?B?TjhVUktyNjF3T1FMK1BmZkd3L0F2dktXQytGWnc2a2M0KysxRE9UcVV5QWVr?=
 =?utf-8?B?ZWtJdmFJT0Era29kcklBREJ1SG5sQ2lNSmliTzlHS010amk4Y3hlT0UrYmZp?=
 =?utf-8?B?bmYvSXRDSDJyL2taM2lVcGJ1bjRUU3I1Ny9GQkUwUWRSc2pNOTdDSmFaMU1m?=
 =?utf-8?B?d1MrNURHZUlQelNLMmRyZnhobFMzNlNGTzdabXN6Z0ZCbE5IbU8zZzFpejZz?=
 =?utf-8?B?TkN2ZGVxTzduODZybk5nWnVlTFB3cU9XUEpqZklNYXpSTUhLMC85U1I5T0hQ?=
 =?utf-8?B?SmRWQkpjSkk1dExuaEpYSkVoZ1hXeWM0QTZzU24waFU0TWxZMkdEM01DUVUv?=
 =?utf-8?B?UmFTL29lL0o1S2drNU1yN1NJNTN4MUt4dHJDRk1Rek9JMk42MEp1WUZyN1Ji?=
 =?utf-8?B?eGFaS1FFWGIrUUcvTHJSSjdiQU5ZMzd2Syt4MFViT0RhYXAxd1FhZ2tBWTZC?=
 =?utf-8?B?cFdQdG5lSXd4ZUJyS3pXcE1iKzE2dWFSSCtUREdlVS9NY0x0aXFKTXRIY2pw?=
 =?utf-8?B?bzBibGdBL3dZdEF0T0s4aTF5SHg4UzB5cFpSWlM0d1NDcGN4ZDRaeEloZlIx?=
 =?utf-8?B?RUE5ckJKbVZUd0kvRkc4SjdPajJvQmN4cWJCaW5WNWcycDRPbGU1Tko0OUk2?=
 =?utf-8?B?VkRxRi9YNE9nM0tkN29DMjVTc0tyUmRqTDJDdjAvdk1hSEd4OHFpTHFocmRu?=
 =?utf-8?B?bEFqdndoVnBFbmxTcUpCNi82ZmloblJtYzd5SDRoaVd3V2xqeUR3cjA0YWRm?=
 =?utf-8?B?SVdQcEx5Vzg5S0ZsL1I1QXV3Ly9EZjNOMHpXSllLTGJ1TVZZU1hHTGlpZEwx?=
 =?utf-8?B?UWUvOFNONGNyWk5CRGU4dUhEOFkwNTBuRi9SR3lnQ1ZtOTBlcW1qYkF0ci9M?=
 =?utf-8?B?dldyRzZpUTRNNWxDSkZUeVdidlEyaFQzNXYwSHoxeG1qYkIyMkY0MldvT2hn?=
 =?utf-8?B?cEVnWHpjMjRJMlIxN0lFM0hwT2FNWWN5aXpFNlA0UHUzRHhTdkNBeVR6ai96?=
 =?utf-8?B?b1pMYTl0QkFrUU5MTjJ6T1Y1NkozSWJwcXFWVHRLWTRoR2ZFajVTTWpVZTY2?=
 =?utf-8?B?U29QS0RxcTNtcGQyZCtTZnlydDJHUnQzQ1ErNksvdnZLbDI0UUxjNG93M0tT?=
 =?utf-8?B?UGFuTnoyZks4TFRXSjdwM1RKcENsS2pPaVE5WXd0VzY0M1dYMUQ0THpaN1JM?=
 =?utf-8?B?TTZ5WWFQVmM0QnNTR1B6ZlhkdUxlNVBxcWRoS25uSWRNKzlqR04yZndNNTNk?=
 =?utf-8?B?NGJqb0ZhWFV1WStSd28yWlNweTcyQjVOazdIN0lsZ2tmSGYvWnczWU9wdTZ6?=
 =?utf-8?B?ckVqbmx1azQySm1GaU04VzJCQk52UDNYaG9TcjdtRzBldWQzTDVWblhoZDlL?=
 =?utf-8?B?RUhrNnNpaFFXSjljNHdVV1B1dGZXOHNyRTJBd2hjM2hoemZvRzV4SHlHaWhX?=
 =?utf-8?B?Y0lxZnRrNFBjZzg1Z3JtbUV4bUF4eG1HTzNzN3NydzZRWThxa2RHVW9FQS9L?=
 =?utf-8?B?aW5CU2xVQjRnUlU4Q0tsVEdxNTBCa0FMNlY3TE9wc1M1OWUxUFdyOVkwOC9z?=
 =?utf-8?B?VVV0VWIwNklGVHVkRFB3Rm5wVm5qQlhZOGhob1JmYXBWaGRIQnI3dTJpVGYy?=
 =?utf-8?B?djJkU0tJNS83NkcvTENxOU9YVW00Z1VZRmZweUg0OE05b1BNakxJK0JnMjJI?=
 =?utf-8?B?SURzOXNVVkhWeW9mZzkxaTUxMFdEdDJlamUvNmRGQkgrMjh0c1VZK0VRZ2RJ?=
 =?utf-8?B?OStFenNmUW5xeUxkU2VyeXZ1VkZVTU5QWGVlK3JGcE1rUFBDZmNQeDNReUJi?=
 =?utf-8?B?TmFncGV6VTdHQ05Vblk5bEJVZnZpcmg5a0FCeWV1MlNhUnBCdHhyMFlzMFNn?=
 =?utf-8?B?MjA2UTZ3bjNYWkVydmRKL2dUK2JrcE1TdGMzZWhIaWg3WlFPOEVjdlhpOXlC?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee32af5-afa2-403d-471f-08dd679fba81
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 11:09:48.4729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lm/qHd8jokjvsV7yYKr2XnMRBRoj+LG4ikxdZk7POSc2wJ8wzdfsHRoSwvQsztnVQe+ARbz1HqFEx0T8n5dbzBysd3ccLNjOowgfDuLn1iY=
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

Similar to regular resizable BAR, VF BAR can also be resized.

The structures are very similar, which means we can reuse most of the
implementation.

Extend the pci_resize_resource() function to accept IOV resources.

See PCIe r4.0, sec 9.3.7.4.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/pci/iov.c       | 21 +++++++++++++++++++++
 drivers/pci/pci.c       |  8 +++++++-
 drivers/pci/pci.h       |  9 +++++++++
 drivers/pci/setup-res.c | 35 ++++++++++++++++++++++++++++++-----
 4 files changed, 67 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 985ea11339c45..cbf335725d4fb 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -154,6 +154,27 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 	return dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)];
 }
 
+void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
+			       resource_size_t size)
+{
+	if (!pci_resource_is_iov(resno)) {
+		pci_warn(dev, "%s is not an IOV resource\n",
+			 pci_resource_name(dev, resno));
+		return;
+	}
+
+	dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)] = size;
+}
+
+bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
+{
+	u16 cmd;
+
+	pci_read_config_word(dev, dev->sriov->pos + PCI_SRIOV_CTRL, &cmd);
+
+	return cmd & PCI_SRIOV_CTRL_MSE;
+}
+
 static void pci_read_vf_config_common(struct pci_dev *virtfn)
 {
 	struct pci_dev *physfn = virtfn->physfn;
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index ff69f3d653ced..1fad9f4c54977 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3745,7 +3745,13 @@ static int pci_rebar_find_pos(struct pci_dev *pdev, int bar)
 	unsigned int pos, nbars, i;
 	u32 ctrl;
 
-	pos = pdev->rebar_cap;
+	if (pci_resource_is_iov(bar)) {
+		pos = pdev->physfn ? pdev->sriov->vf_rebar_cap : 0;
+		bar = pci_resource_num_to_vf_bar(bar);
+	} else {
+		pos = pdev->rebar_cap;
+	}
+
 	if (!pos)
 		return -ENOTSUPP;
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index f44840ee3c327..643cd8c737f66 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -689,6 +689,9 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno);
 resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno);
 void pci_restore_iov_state(struct pci_dev *dev);
 int pci_iov_bus_range(struct pci_bus *bus);
+void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
+			       resource_size_t size);
+bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev);
 static inline bool pci_resource_is_iov(int resno)
 {
 	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
@@ -722,6 +725,12 @@ static inline int pci_iov_bus_range(struct pci_bus *bus)
 {
 	return 0;
 }
+static inline void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
+					     resource_size_t size) { }
+static inline bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
+{
+	return false;
+}
 static inline bool pci_resource_is_iov(int resno)
 {
 	return false;
diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index c6657cdd06f67..d2b3ed51e8804 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -423,13 +423,39 @@ void pci_release_resource(struct pci_dev *dev, int resno)
 }
 EXPORT_SYMBOL(pci_release_resource);
 
+static bool pci_resize_is_memory_decoding_enabled(struct pci_dev *dev,
+						  int resno)
+{
+	u16 cmd;
+
+	if (pci_resource_is_iov(resno))
+		return pci_iov_is_memory_decoding_enabled(dev);
+
+	pci_read_config_word(dev, PCI_COMMAND, &cmd);
+
+	return cmd & PCI_COMMAND_MEMORY;
+}
+
+static void pci_resize_resource_set_size(struct pci_dev *dev, int resno,
+					 int size)
+{
+	resource_size_t res_size = pci_rebar_size_to_bytes(size);
+	struct resource *res = pci_resource_n(dev, resno);
+
+	if (!pci_resource_is_iov(resno)) {
+		resource_set_size(res, res_size);
+	} else {
+		resource_set_size(res, res_size * pci_sriov_get_totalvfs(dev));
+		pci_iov_resource_set_size(dev, resno, res_size);
+	}
+}
+
 int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 {
 	struct resource *res = pci_resource_n(dev, resno);
 	struct pci_host_bridge *host;
 	int old, ret;
 	u32 sizes;
-	u16 cmd;
 
 	/* Check if we must preserve the firmware's resource assignment */
 	host = pci_find_host_bridge(dev->bus);
@@ -440,8 +466,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 	if (!(res->flags & IORESOURCE_UNSET))
 		return -EBUSY;
 
-	pci_read_config_word(dev, PCI_COMMAND, &cmd);
-	if (cmd & PCI_COMMAND_MEMORY)
+	if (pci_resize_is_memory_decoding_enabled(dev, resno))
 		return -EBUSY;
 
 	sizes = pci_rebar_get_possible_sizes(dev, resno);
@@ -459,7 +484,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 	if (ret)
 		return ret;
 
-	resource_set_size(res, pci_rebar_size_to_bytes(size));
+	pci_resize_resource_set_size(dev, resno, size);
 
 	/* Check if the new config works by trying to assign everything. */
 	if (dev->bus->self) {
@@ -471,7 +496,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 
 error_resize:
 	pci_rebar_set_size(dev, resno, old);
-	resource_set_size(res, pci_rebar_size_to_bytes(old));
+	pci_resize_resource_set_size(dev, resno, old);
 	return ret;
 }
 EXPORT_SYMBOL(pci_resize_resource);
-- 
2.49.0

