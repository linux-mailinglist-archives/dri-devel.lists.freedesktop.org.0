Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4P1nMqVZe2mvEAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 13:59:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDE1B034A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 13:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF4610E863;
	Thu, 29 Jan 2026 12:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Mgx+mEc1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012013.outbound.protection.outlook.com [52.101.43.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1138D10E862;
 Thu, 29 Jan 2026 12:59:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VxpwboVx2FAUZ3sPVdpb7X6FGsXzZCSuGy0k1NOg92enFThYg8rgWaDnSodAnjvfBFVAFX8KMrgKWbd6L3ZXEmFrLvoJTtoPrTJOtoOIBbQn21rfFV0RGGg1+iSkkOBr3IHa/lxf0dMx5/FfoOw/VT6JJiuj1qYYeMnNd+4Euy85StWaabv7vD8b5JYTrF0ox1sexUdhMYOBIyCpFBzw+A8bsmn5h1VzIWK15tI86BDjXMXz2WcM4xfNUs/jZf5wuMw44MiJCZlyN9tzOyu/kv1yuBldowXxcmWw0H+w0cHYySkFfIHSAAy2Mq8CaWq3VumBfsfv2HsqQdH2dmokgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Trr5meThhwO//guMNi8p2rSpKx0TyjADOLkMEZuBwM=;
 b=luhvgxf8cU7PITayycT8+z3WBD+iN6ABxc0ZcXxYEsw3D8FGg6oHrPtxCNTSMLrpz/tmZWCaCqbcIFiYU4v56vy7QezbsoaxrEALUM9MlJ58wSTDg0u9UlovshOv2qO23hGhgZhvSkPdm/5QdiX9DL+XMaSAIPsXtPm2bW3E8sNiKXu889Ny028Z6HgubPRu9DF8OFehSJSK/SCVhZnSgowUWLSCaCu3b3Cye0QCiqZpRumXN2hRX3RGEYl3pU3FPi0g5ZoTRrkCK2sqxLcG+oFrwwOPu0DF5NEc+SpjPkHTajAa39F+Vx7uPNuB5TaDN3Vu/o7l4sNaWSEI0/u9Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Trr5meThhwO//guMNi8p2rSpKx0TyjADOLkMEZuBwM=;
 b=Mgx+mEc1NSfIBA7AQqWz1jd1VA8GkNkYPmRkCN9JdkP4GY6u0wpfCADbr51/1LGxBZewIbAjR2m85JSVSIB7tdnCPJjBm9qleudm6WmGgRleVWqV4W55KfiMYAv1erR6n9GhTUQPQcJwPKisZghfglmRVaCnqNKxmQVFvQn/kBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by SJ0PR12MB7065.namprd12.prod.outlook.com (2603:10b6:a03:4ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Thu, 29 Jan
 2026 12:59:09 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68%7]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 12:59:09 +0000
Message-ID: <2f9bc706-02d6-4dec-a56c-53abc5d43f46@amd.com>
Date: Thu, 29 Jan 2026 13:59:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 Hamza Mahfooz <someguy@effective-light.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <2719069.vYhyI6sBWr@timur-hyperion>
 <30f2480d-016f-417e-9ddf-7805e4943e7b@amd.com>
 <2285353.hkbZ0PkbqX@timur-hyperion>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2285353.hkbZ0PkbqX@timur-hyperion>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::13) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|SJ0PR12MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: 766cd039-e10a-4b73-1d96-08de5f363129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzVKL2lBOWZ3dlYrc2RMTmZWejZjMDV4YS9uby9YUGFxSFdVSlhlbGFva0Rv?=
 =?utf-8?B?eElralVTS3kzUmh6SnB0VGY4YXN5QjMwU1ZibUNJaWk0SnFYWWlnUTB4dzV4?=
 =?utf-8?B?S2FzQnNXeklnNS92QTNWSTl5YzBrMHF3aURMMy9DYmRhZXlkRFluakJQck92?=
 =?utf-8?B?V0tDTXB0eFZFY2x3bVFFNVdGQmxQd24vODVtczAyRzMwQTR0MXIwNnZOL215?=
 =?utf-8?B?TmpXV3ZNbThnaEt4OUxqbFRoQ1d2cFAyY2tOMEU2ZVl3dTN4V01iM0c3Sm91?=
 =?utf-8?B?WjhwV3Jud1pvYXUvUllZZDE0eFQ0NDVOeTQ2bjIrbXRocHNNRmxjay8wenEy?=
 =?utf-8?B?byt1SGN2a0UrVTRFa1g2dGgyakEzUXU5NU81MGl0bzdhUmduUDJHd1ZzVzJD?=
 =?utf-8?B?bW1vUFlpSXUvSVhPdmxkaEVXak1QVU1tZHNjWU5DU2VueDUrM2daTnlHYVVX?=
 =?utf-8?B?WFhoRjV1WkRaWHpYa0dJWWowcW01MnlMS0lkbTRndWtlQ0ZWV1lJemlOWktk?=
 =?utf-8?B?emxrZnd1WFlyRENianVXL3QxNVhONHUyaUNaRVBKSllUOFE2TXNEdXFod21v?=
 =?utf-8?B?ZWh0bDlkNGFCVlJNUFJ5OEhqbnJpdC8vRXFrcENlekY0OEY2M3JBVVJrQVBF?=
 =?utf-8?B?dGV3Z3NXaEZWZStLbVJLejNiSk1LUnk0b0ZMMytpSkVVVGNOVk9ZRThkbk1Z?=
 =?utf-8?B?Rm5WSFRBN1lWb2FLVDExbU43SlAxK2QwSE13RDNKSmhxcUVVRXFCL3Z4RWZP?=
 =?utf-8?B?QjZwLzc5bHZhZzdUeFVBaW0vYUNORGl2U2hmVVBsMEl3OFBjbG4venUzMkc4?=
 =?utf-8?B?ZnBhcHAxdFgyRjM1K3BIK09oSGRTSGpnTTg4MXVDMHpuK3BPU1BPbUlGN09i?=
 =?utf-8?B?MEdoS08yM1I2SE1Oa3Y1UDhQbkhMSGZoZHk5UmI5cDZGd0M2VTRtZEpLUTNw?=
 =?utf-8?B?RjN4Y1lxK1dqVkg3VGlNSkhmVTh5Nk1mTFg2ejBZTHkrNmJwemhHeEJjenMv?=
 =?utf-8?B?SGhuVEgxL2x4NmtaRHM1anBJTGRRdVd0N3U3SXpvRWZORUZZR2R2Y1p1RHpQ?=
 =?utf-8?B?T0pyT2ZLcUFlN3J6SzQ0UmhYRVBTbEhLV3ROeXk1bXhpSnpVVlFpMS9NWWsz?=
 =?utf-8?B?R1NNRmcwN1dsVENXdXNUK0dmMEFSSlBvZzhzcnBVVW1pNGtxckJwS09Fd1Yy?=
 =?utf-8?B?aVpzVlZMSEc4WDliOTZlQTJOTk9aZGpZemdmaVFaR0E4S0p6Y3VSbDJHb0ly?=
 =?utf-8?B?Zll2ckZCM1lhUmFUczZhbk5PTVFPMTdMUktyMWp5cURYR250RTZiTy8zNWZx?=
 =?utf-8?B?VHJQQUN3ajlDNlNuL0gweUk0L2IxSkoyNmZ3Z25icjZ1UHF1emJyU3JjY1Yx?=
 =?utf-8?B?ZDd2VEtlMFFmTVN5WTAxNTdESG9ERXZBZ3BoNWRNeTNnWTBWbGkyM3VhZkVu?=
 =?utf-8?B?T08vZGNSQmtrbmt3eEFDcE9IOFg5UGVlWHZWYngvSXNZSGQrLy9rNkZDbnJO?=
 =?utf-8?B?RTZIUGVsc3FxazB3Ynh5VjlnbFpaWnY5b0NYQjRpUERZZTl4bXFDWllqQWtk?=
 =?utf-8?B?Q05iY0U3eHo2MmNFa293ZUkxZ01SZ1ZacHhGZ0FOSnJSalptQWtseVUwckEr?=
 =?utf-8?B?S1hUc3pxTkZKNVQvTzRNYlZWSGVXWUZCREt6eEErdEhLM05qSGhjd2lyTUtP?=
 =?utf-8?B?ZTRoNVlGWjFaZXlKdG9wd0U5VFY2cFFFUjN0eVA4VU51Ny9WK3lyNnVEZTh0?=
 =?utf-8?B?dmVFUmJadi9tVjQ2NUZQbmUyQnlkVWVUSlJhNG5aRTQ0YlJyR3MzTGJPcHE4?=
 =?utf-8?B?dEl0VU9NY1BQZXl6bDhVNXNlajNoSDVGUWUvbGFhSEdvZm1BTDcxZFMvTS8v?=
 =?utf-8?B?NWtjWVFYWi9PSGxZRnBRRG53ZmY4SE5DWUNWRXVSenBQeVJSMVZsNTRpTTl3?=
 =?utf-8?B?clIrRForTDhrblNGcVN2REZLbWJyU2hrZ1FvWnNVWTB6U2NvMks0VlNZK3Ft?=
 =?utf-8?B?ZjR0VHRSZHBQUm1adHcvWlY4b2hsclNYZU5oaDZUQjlidXMzV3hBOUhVenhq?=
 =?utf-8?B?Sml1UGU0V1J4dk5lbDhRb1FsREN2R1VzMEtuaE9hZW9nRDV3MVJ0b0FJT1NW?=
 =?utf-8?Q?TYHE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHFKKzhKM1B2Z3VteWVJTFYyYnczN1FPZWhsMzRhc0FhV0F5K0d4RmRpZlBj?=
 =?utf-8?B?UWJOMmFkMjhQQUt0OHpyYXhOR2xHRnN6TVM1RmlQdW1oaTdrWWpOY2U3WXg1?=
 =?utf-8?B?bWtIRXhkL1huR3hveXlRT3hLU1BkR3RjeHZyOXF2SGVWM21GaG1Bc3U0NHhV?=
 =?utf-8?B?VzA4eVoxNjJFalpoZFI2K0gya2oyK0lPSTh2cnBEancxc2twVXpyck52VTdV?=
 =?utf-8?B?SGQ5RXk0MXdWdTBiYTcvVHRnZzlKa1Nzd0NMd2xBVTErVGZhL2x6TG5SUnpQ?=
 =?utf-8?B?dFh0QVpHM1RJQ1lROWp1RmVpb3l0VVd1RmJ4MXk0bTZjeVZKUm9PSGp3bk04?=
 =?utf-8?B?KzdlMk41MC9DWWQvY2N5UEtEM0RYV2dhTnVJMUtocHlIQTBxS0lPZHRsYUpv?=
 =?utf-8?B?RWo1d1crMVVSZ3FvSXB6aUJwUWpUcnJ2WXRibnpWK2FqVENiSFd3T0tsMEhS?=
 =?utf-8?B?VG1Kc3FFRDAxWUcweXU3M0ZYcDlZS0F1U04yWlgxUjJCeUsyNEhmY0RtM29v?=
 =?utf-8?B?VXpvY3o2QitSbWRJRkkwY015V05zZitNbWdhQm9CSlRtSHB1TDlzeVVCVEl0?=
 =?utf-8?B?VDlhc2ZQcVUvOXlJRlRrNGdhaGVKbE1kSzRCcUtPL1VlSTB4aFhhdlVRMnVY?=
 =?utf-8?B?NFlYS1dXQWpST3k0Tk5scGpiVmEwUkV2ekc1TWsvQXRGNlR6RE80bWNiYVAr?=
 =?utf-8?B?VnAvVUcrVHRISSt3WCsxWDduaUVmS0kwYmRVTFh0WXA5TWVPRUpHNjdYUTFr?=
 =?utf-8?B?d0R1bWxQamhzKzUvemhhMlNSVXc5MkZSd3BQWkY3SThpOFFFWHhRUmdTa0E1?=
 =?utf-8?B?OGZYSHIvWU1TdzgrUDF3dUFUSXN6VzFRSE9yVEk4cjdUek9YM1Q4aVhjcjI2?=
 =?utf-8?B?cXVGOXNjRXR5bEpScmdQRVBYeFpwM2tJZmphQjB6U0RRUHZ3aTh2aUd1WmNP?=
 =?utf-8?B?YkluMkwzcjRmekVWOU1vZDAyM0lmb3NhaVBlclBVN0Q1NWpxVlRtcGhHMjJw?=
 =?utf-8?B?ckhpU0JzejF4Q0JiZmlNeHlWMzRKTS9QRk8yWlRQd2xyVEhjeTFrSlR5RUtr?=
 =?utf-8?B?YmhMZkEvSm5VTncrUXBZYXBsS1ArSFovOW9TdS9Wc1RRd0lPUE5HaUVBdGRJ?=
 =?utf-8?B?alNzQkIvVDNoVVB1MWpmTmVCTGFkU2VQVWxhQVFEbzMvT25DOGdxamNsT0VB?=
 =?utf-8?B?YUVoeTI3SGhWam9iUk9JZThtZytoZDA0VGtVbUxrT2NhckgwWWY0VnJTTm1p?=
 =?utf-8?B?Uys1OVVXT3RGa3hzWHVOUTdjUHpNZm8xeWRKTi9Uem9tTUpVMWpGdEJ3eGV6?=
 =?utf-8?B?TmVzdXlSb1UyMkpEeCtsbWN4ZTRsbCtuQU9mTm9xL0lOZVZrT012Z0pMblMx?=
 =?utf-8?B?UFUxRUdSZkFQU0lCWTlXZ0xmYU9KV2kvTHlQWDVrNmNwSFduNG1PbjlHN3l1?=
 =?utf-8?B?RXFKOFZObGEvRjVWMDljUWdYMzY4NXEyWkpIeUtJVTVhQk1hNEY1NldQS2U2?=
 =?utf-8?B?WHNFSTBuTG5vRHViQVdlb2V4N3YrRlNXZ05XcTcvak1CNm5tejh0RHpQV1ZE?=
 =?utf-8?B?VXJzRlkxdGYzT1BQTm0zVTlOUWRxaXY5ZXVXOXkvUGRZTTJpWEUvTXRFNjRj?=
 =?utf-8?B?bHR6b3IxYmlZOUsyWUYwOThZL2F6QlM4NUphTmFJRWM0UUJXbXRkRjREdUYr?=
 =?utf-8?B?b1ZTZG9jTFlXbU52Y0tXWW50azFYR1YxMnZleGdMcU1meG9PVkFNU0JqSHZJ?=
 =?utf-8?B?Ukw0R3RuQjBDNmh2SXVTeklCUGxoSXJMYzBkMEtmS0JDNi85TTBQM3o4WU1o?=
 =?utf-8?B?L00rN2dNUFp2YjZRUXM4WWJlWmM2ZVBrV2dUR0RIUm1DMVhjU2ljcnZoZWRB?=
 =?utf-8?B?enFqYTRGUWN1TE5pK3h4RjZ2WTM5YTcyTCtrZ21EU2NVZXc1aWVHdjlXam1U?=
 =?utf-8?B?Tkc3R2xlelk5UHpJSDhhaVlUdE9jZEcvTCtSZnVJZTBua0FXU0lkUXllL1A3?=
 =?utf-8?B?QlpwOVIraW1na3JvYWZpQnEzZkU0YytJVEZ0ZjhuN2ozTm1xTEdZeEdEM1pX?=
 =?utf-8?B?bEdjMzN2QXovYWVqWHZtOWlWSUJBQVhDeVN6QXZEREFGaWF1RUFjR2diRVhG?=
 =?utf-8?B?MDFEcTZqdk1Zb1R5cmNwRHJlNElvOW1JdDcrdjJtS1M2UFJRMC9wMHdKNktK?=
 =?utf-8?B?WGtVSmdzbE5LNmEzT2I1bXh3OE9EMHZxUURLNDNQbi9VUDVzS05zdTRMOXUz?=
 =?utf-8?B?WERqbVZ2L3lKNmJVdjZiWmV4dHBYTk9Odll6Mk9kTEVTSldGUFZTTW5oeFBv?=
 =?utf-8?Q?ZyBdVmCN01aybF3gDN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 766cd039-e10a-4b73-1d96-08de5f363129
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 12:59:09.4335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwMiqIEk2O52gzXADXLkM8yqKTOYZgcj0jveTGhgJ/j+/wsYnCknR4cxrxtRXeKd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7065
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,effective-light.com,mailbox.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,lists.freedesktop.org,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7CDE1B034A
X-Rspamd-Action: no action

On 1/29/26 13:06, Timur Kristóf wrote:
> On Thursday, January 29, 2026 12:38:30 PM Central European Standard Time 
> Christian König wrote:
>>>
>>> However, just like we do with ring timeouts, we also need to be prepared
>>> for the situation where a page flip timeout happens and we should try to
>>> recover from it. And if it isn't recoverable, fall back to GPU reset.
>>
>> No, that is clearly a bad idea.
> 
> I don't see why it's "clearly" a bad idea. It's not clear to me at all, please 
> clarify it for me.

The GPU resets are necessary because we allow Turing complete programs to be submitted by userspace and that in turn is then messing up the HW state and we need to reset it to get into a known working state again (e.g. classic reset signal in electronics).

But in this case here when you see a frozen picture on the screen then that means the CRTC is still working, e.g. power is there, clocks are running, hblank, vblank is happening ... this doesn't looks like a HW failure at all.

After the input from Michel I'm pretty sure that what we have here is just messed up SW state, e.g. the DC/DM code has no fallback handling and not only misses the HW event but also blocks all further page flip requests from userspace which would resolve the issue.

>> CRTCs are fixed function devices that GPU
>> reset helps here is just pure coincident.
> 
> Currently, the driver doesn't handle page flip timeouts at all, which means 
> that if it happens, there is 0% chance of recovering from it.

Yeah and I completely agree that this is the absolutely worse thing we can do.

> If the GPU reset improves that chance to non-zero, it's already an 
> improvement, and already more than what AMD did to address this problem for 
> the past few years. I just find it incredibly disrespectful towards the 
> community that AMD proposes a solution that they neglect to implement, then 
> when somebody from the community steps up to implement it, it's rejected.

Well, I've heard about this problem just a few days ago.

>> What we can certainly do is to improve the error handling, e.g. that the
>> system doesn't sit there forever after a page flip timeout.
> 
> Sure.
> 
>>
>> Let's maybe try a complete different approach. We force a page flip timeout,
>> and see if the system can handle that or not.
>>
>> E.g. every 300 page flip we just fail to signal and see if things still work
>> after the timeout.
> 
> How do you propose to do that?

I need to dig a bit into the DAL/DC code and see how the signaling path actually goes.

Going to give that a try tomorrow.

Regards,
Christian.
