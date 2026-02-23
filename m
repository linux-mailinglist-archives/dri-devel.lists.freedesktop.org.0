Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ANFM08xnGkKAgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:51:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1BE17526A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6454C10E2F0;
	Mon, 23 Feb 2026 10:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fe5r2ay+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011043.outbound.protection.outlook.com [52.101.62.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032D710E2F0;
 Mon, 23 Feb 2026 10:51:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5d7hN62J2pjYhdNE1A3/pABxt2eBb+5SbFupMqOSOWF6u/RSLZDen5OGXDCT9pAPJJczTZBqi44Up1OFC7cLLKcvxJY3Zw6F4A3+6qGlhAgz7JWS3lm/y7GQSAbT8kfiitpXOYXvhKCc2Y1cW5yfPhRkGs0Mx/BYPqoK0rv4jRR/G31+ZMm0wcg9airqUpSub/CBAZ28a9i705YPpFdvNOegzX/bLApR3HiQWHLl2L9bROuTnFwVLgI5coiAyG+y8Qsvi/DL82ZKgQXO5DhnuocG0h/RVeBy6Z2IAEP88D4biCl619TtFAoO1SKiDknCiHt9+O0d2Z1BtnYqqePsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vg3wbzVWXUiOf9ol69+U0E89bBCEi7N5cw5G025qK2k=;
 b=NDtA2zx0xRIcYAwFY7+0wy1dljj9I2mHokt297uB/pOQNO4rlDkp9Sgwx0W8kLcO7nQNrYYeUAv5H/dXE0xJnxhyzKlVHfT2jL5WeOzYI/36KM2akBk+srW+fovybHGUbLBj7V4bpVKSRbrWOVvlH7gg/+eOGEihubSMNyikfjib4U2aDtpwPmb8Um2nMgF8xtsVUPkR+8zdCBtJLF+ds7eRpWQJ7Dp3zuddDal/t6TIn9igYNtZ6mQHUvzoliMaQBHrE5Kce3wzm4WcwbFQz5NCOOoppQswhSIunzDEtBKCGdonhQaJPrCGz2AC+BZj9nUu7OlIpWHuWFZlJ6w2DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vg3wbzVWXUiOf9ol69+U0E89bBCEi7N5cw5G025qK2k=;
 b=fe5r2ay+FxxEVA1DPuPuL8mgwjFe0M2dQqYvjJYATGE3Sf+esAd6rgT/x9yRA1l6d/8fRUbNzqvD3lTIHBJ9lL0i4jxMM0mnzZ+v9VtF9E0T0tCOIoBjcD0HZV4jUGC07IqC+33Iuj3icLxehMhM6PlLiKX9H1acELLjGHV6+v0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6725.namprd12.prod.outlook.com (2603:10b6:806:254::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 10:51:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 10:51:52 +0000
Message-ID: <50e3d83a-c90b-40a4-85d4-f5b0b474ab97@amd.com>
Date: Mon, 23 Feb 2026 11:51:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Replace old wq name and add WQ_PERCPU and
 WQ_UNBOUND to alloc_workqueue users
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philip Yang <yangp@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>
References: <20251224144708.61167-1-marco.crivellari@suse.com>
 <CAAofZF5XSUVn+XW75rC76-Amibc3rZnG3QQhWxPtk7K6YMQx4w@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAAofZF5XSUVn+XW75rC76-Amibc3rZnG3QQhWxPtk7K6YMQx4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0893.namprd03.prod.outlook.com
 (2603:10b6:408:13c::28) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: cc565515-bbdc-4f6e-94f9-08de72c98d9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFZTZHFOYkowQTJIbktYamdTa3E2SmVlS3Z0UDlrdm1lNElneWJldG9aYzhv?=
 =?utf-8?B?VXdacWoxVzcxdUNJc0tKUjJlMFpvWEV3R3l5UlV0QUkxZ1Bzb3RVdXh3SFZT?=
 =?utf-8?B?N2VBT3o3ZXZPYklQZHl0aWs4N1gvbG9kQ0FMQmdZTUFtYmx4NHNXcS92bitt?=
 =?utf-8?B?ZjBZcklnL3BHeCtDSjdpcXp5dmJwc201Q0lsSDB2Q1hzZVAxQkdKZHhIS2lh?=
 =?utf-8?B?YzJwTDAyY0FEbE9wZlozc2s2Y1FFZ3NrazdkTm9aWFNiVWpDWmcvQXdEMlRy?=
 =?utf-8?B?bDBxQllTY0RMdnhqU0NRRUNnZnN4OEYxbXBsRUc0c2lyQXEvQndyQXBjUzhV?=
 =?utf-8?B?SUdEQnoxUXNiR2dUUFRPVVBPTjYxa2lKY1hiRmtaRGVydmFCQXJka21oT3VY?=
 =?utf-8?B?ZmhsMkZ6QW5mRTc2Y25QRXlrSEw2blArUmUxRUxQdWIxZEhmZ0VQOURnZ0I5?=
 =?utf-8?B?WEhydldTbFJYTWl0aDNRUVRsZm9wOXlEVGt3NmRVd3dSVEpydHloRGlYbXVv?=
 =?utf-8?B?a2k1Uk05Z2J2Tk50Y2NaTW5HUjFnYTZaTC9HZ3pHSUx1WHE5bXFtVDFCREJY?=
 =?utf-8?B?aWx5Z1pEZnFXMGRmSTFUSUpPbXQ2K2JoRDN3NCthUHp5YXl1VUhpaVRQMk13?=
 =?utf-8?B?U3RSUDBmaitMSHEzek5pRXBsQWV4OGM0Tnd3eEh5TFRTeW5FU1EyQjFEMmxR?=
 =?utf-8?B?MXhtaG0xT2p2d3VoaUhpc3ZIaDNxWENHSG1NQVlSSExXZENOR0wwaUxkcy9E?=
 =?utf-8?B?b3p6ckcxakNzRU1MRFVQSVJrY0pmSmJKOG15b0tiV3ZnMDlrSnlEWVVSUHFu?=
 =?utf-8?B?VWV2d3BnVkM2TmFWSWRDZE1OTTBLUUtSWnA5TVN2ODJQd3BlbVZZdGVVcmJn?=
 =?utf-8?B?dzhmM0s4RGRxTXNYdzNRTitqVXVQNGpTbFQ3dGR6WDA0WmZVSWxST1BhaUNs?=
 =?utf-8?B?RVNsZkFZdGJXV1VMME0xVVlhMWJKeE9WclJzUkEyaFMvK1hlL1dVZy90QlRK?=
 =?utf-8?B?YW9wK1hpME5Xa0ZndzBkcjh1QmE5Q2QxQ0xtZ3NsN0pubmpnRVYyVzZaUHRZ?=
 =?utf-8?B?U1ZEQU85SXUvNm1YUzA2TWV2YzQxT2xmSWU2T3l6ZnFYRHFqNVVxRGtDd2F6?=
 =?utf-8?B?VDJubUNWY2s4dElVeDJlbUdUZ0pDOGdpZlpMb0huK2JZaGdET2NkcnliamxV?=
 =?utf-8?B?dzBkR0NldFVIS1V2T012KzczYnlMYzVJVXk4aWlnc0dPRGc1VTlSOUVqam54?=
 =?utf-8?B?MWVKSFZ2NlczdEVSZ0xKZi9SZ205WGVWVEJGcjFjWmFXeitTYm9mUDhaTitH?=
 =?utf-8?B?bXoxNVJXSE41YUp1L1pSN0EzSlBXelBTRGtkbFJhQ2hNVnF3eHNQcjhObUda?=
 =?utf-8?B?MUsxbFBsWG9IcEhod0M1cWJtSEdHUW9IcGhsUnJ6bldIOWs1ZmVpQUh6cW51?=
 =?utf-8?B?bERRUFFucWN6WWVEdThJSk9BdzBXenBDVGxZMTFOMEFSR1c5WU1RS0lLeWhX?=
 =?utf-8?B?YW8va3g3VVBGaWU2SVpkT0JIeWRIUzE2aGF4V1EzOTdWRFpzQ01KOWZSYjJ4?=
 =?utf-8?B?SFdhdWlseThNNXlLNHYwU2N6RGYxUThKb3YyZTdPZGtpb2tPSktaWXlJR2dK?=
 =?utf-8?B?NW4yaEpycnp2ZUNmZXZ1TTRhMFAvL2lZb2d5ZFIzMjRoV3dlUU9TbWMvK0Fl?=
 =?utf-8?B?Sk9MZW9tN0ROenVKM3phZ0ovQmF4Q3g3TmFMSmpkSmFaMHdwUzQrWW9zUENX?=
 =?utf-8?B?eWNXVFNQRVdLRnJ3dDA5WVlNR0liTHhtUEY4QVZ6UkZLRnFzUnVoTE1BOERV?=
 =?utf-8?B?KzFNMTFKcEk1YUw4WEVjT3hKaUJ4VTgzamdKeWdYM1pQVUtHRDFJMXdYcEQx?=
 =?utf-8?B?WFVvek1JbTVlcUhhcjFUOStTb1M2VmVJUTkxUDk0dWhvbUhBOGlTdzFZTEtZ?=
 =?utf-8?B?TjJKWU03aFN3eklCc29hUE1hN0ZqSU5TTG9LTFloWnNPV1ZHcGkvYXFHUjI2?=
 =?utf-8?B?dXA2SHU5cjYzYWI5Yk02NDRtV3paMkpBcG8xcmhIeFR0dGNIMWtoa3N2QlBt?=
 =?utf-8?B?ZlZjS2lqb2dkZ0pJRURRV2U0UzdhUTZaeExCN1lEZ3pDZDlTSmJKZzBtL09E?=
 =?utf-8?Q?676M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1BscWo0cytzQTdsOUFNdGIxZzRDais3NXA5b1RtMURJRzZnS1IwM2RPSDdt?=
 =?utf-8?B?MGd2QlhubHJ4ZUZjY0RneVAybjJnVVFaQzNrUXNYTld3d2xhUm5QRzJQcVdH?=
 =?utf-8?B?Ty9lWXY3WExvWGVhN1NaMnprMHZISHNXR29RbURzNUxaamFqZTgrQjErdlps?=
 =?utf-8?B?Y3VNbjB5Q1JieDBqUzNYMzl6YndISXJpQWRpTmw3bEYwWi83VTRJZ0lsV1Mr?=
 =?utf-8?B?UGdodnRkdXpvVGl3UEFRbU9CRUs4ZmlleU42dzBydEdoQ1QxeDZRZzdhRlFu?=
 =?utf-8?B?RjcvS205YTdtYXJROEVtZjMvVXNwbVpzd2l3RmNaWk9nclFMRjgyR3FHOGpN?=
 =?utf-8?B?elNEbEZiTkFOb2kxa2Z2b2x6dmhiaXlMRytDc1lEYy9vWGhxaEFzbU5ja3J3?=
 =?utf-8?B?K1pjcW83c1lYeEZ2VVVreVFRMUlhaE5XT3lPaVlXSEE2cDhKazVGYThKTDJ1?=
 =?utf-8?B?OU5sV1FpSmY4YjZHbFVSZ0dNVGg4c05MbjM4QVdXUHU0dUpNczhNRGR6YThi?=
 =?utf-8?B?V3ZnVlo4VGR5b2t2YUJYZm01V1g0K3luNDJqVW1sY0JoaTdtK2MwMzRwSzZS?=
 =?utf-8?B?OU5hcmpzQmdMSXkvSURxVjlxelpHcTdaYnRVSmdDQWE5d0FkWmhpQ3JiV2hm?=
 =?utf-8?B?UjM3aWxiY05HYWVCdEVUSVZkY0dxQ2dlWmtJUmoxWnEzUW8yUDB3c1M3Rzdx?=
 =?utf-8?B?bXJhTmZiTmtHVEM5M1NmeG1aUHVPcEpWVnJRVk9vRkNrKzlXM2pDSEprMms5?=
 =?utf-8?B?YTNIZG05dml6U05HMGxCOEtVVVhPZENmdTZPUHNHV2FRNXVDRnFCNmp4UVhF?=
 =?utf-8?B?QS94eVZEUnhhSm5EYUl4d3gwdzcyWGMyNGRuUWk1REJ4d3hXdzBKdlF6Q2dq?=
 =?utf-8?B?SzhqR1pOcDhNeWhuTnlwa1B1N2tPUTNrR3VwMC9iT1VlSHNsQjBZZzlIRGxu?=
 =?utf-8?B?S0RQd2dQWWI1THpCQ2NhVlpzUUU0QllxWTFWM3QzcTNJaVloakc2SmJxZFh0?=
 =?utf-8?B?ZE84b3JaQURNeUtMeGZNdTA3WXFDUUVOVUJwL1prUTlOcXFJY2tGYzZMUmFj?=
 =?utf-8?B?dy9WYnRVYkZlQU02cXlPUU5hVmVicHBIMlFoc1ZjMHhKd2FsdjVHdUM1bUtY?=
 =?utf-8?B?Yjc0U3hPS252NjhtbzlDK3JkRUJrdi9NVUhmRmFGNUlEQXQveUFJTXA5am91?=
 =?utf-8?B?cFNlTmJkN3F2cVNiZVBRM3JXMkp2dEJpK3pyS3djNDZtNGVQcDFiVFQ0UExy?=
 =?utf-8?B?WGJyU25MYi9XQmtCVlhYandXWHg5S0FxamhYK0pLMEx3UjRKT0xQL1UvUkNF?=
 =?utf-8?B?STVud0FyZlFrQzArNkZZWkFQTlFLTTI1YjlRdG9wanVnL3pZM2s4cmY4NUV3?=
 =?utf-8?B?OWNZMFlkWXE4c0IycWdCVmNwSTM0WVJxckRFdldJNFpJWWxTZFR2OFpBNlJ1?=
 =?utf-8?B?UzBicGpWQVVBS0pSN01JK0tOU0pkbksyclhlSTkwOGVzUUVYTUxTY2V0NmVi?=
 =?utf-8?B?aVJUcU92ekk1ODhlZFhjaWxWNEk0dkhBZCsyQVoyVlg5WnJYeWhVR0UxUjc0?=
 =?utf-8?B?N1BiR0kxa1dFMURKUU05bXV6ZVorSTVSTVJiREV6TDBaVWkyNmp6aWp4ZnNB?=
 =?utf-8?B?LzkvUUl6NWJMRXFWSTJNRzdlWjlhYXQyeFFxVUordDFpenNSVmprVUNGeVN2?=
 =?utf-8?B?NDFqTFZIbXJWVUVoSlF4QUR5ei9QQmh4SFVxNldqbXEzVHhCdzN5d2tjWUl6?=
 =?utf-8?B?TXMrMVZFUVM5bGhvWXhPRGJ2WFh0YXdlUXFWMktLSkh6cWp4U1pKZFBSczJn?=
 =?utf-8?B?S2FUNWxvb2xjaUd1TDhCSENuMm9FYUpjY0YwTXRzM3ovL0tSbkZlQUZoOHF0?=
 =?utf-8?B?cHdLZjA4ZmdZaTJlam1PZ1BPSVUzbkpvUEdyY2s0Q2tDbVZzK1RSUDVmeXNI?=
 =?utf-8?B?Ukd2L3hZSnRaVW9kV1NtdFVlRlV3NC9Uc1dyNDltVTQ2dXcwV0k0eWdLSkl3?=
 =?utf-8?B?NWh3bXpsUGw2T2VwblBsWFdJM1pNN3dOUXpvdzJYQVIzU292M2hISlV0WHp4?=
 =?utf-8?B?QjdSNmlGZWdkTTdDQ0lOUDYvNHU3S1ppWUJYWWxwb2ZyclU4RTZtT0pLWnor?=
 =?utf-8?B?OWdDTXBQYW1MNkZTVTl1TktPdGJOb2pJRG9TSHlqaDZ4WlFZcEppbW5KdUw0?=
 =?utf-8?B?N3hXQVFRd1VUNnQya1F5cnE2Tmswa09adlhEend4Q0xhMlJBSkptSStqdkpz?=
 =?utf-8?B?UVdZUGd1b1N3TWF5K1NoZVNqeHZZdjVyZHFUdXRQa2Q2dERNbEhCNXNHNzA5?=
 =?utf-8?Q?RNfQEFM//xkGvk46sw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc565515-bbdc-4f6e-94f9-08de72c98d9f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 10:51:52.5750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2HClXNHON1BzTzvSH/T01dsV3awHiJQ6G0qHpoMZlt6DUPvZf/FnczNQxkUVw+q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6725
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,amd.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,suse.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3F1BE17526A
X-Rspamd-Action: no action

On 2/23/26 09:52, Marco Crivellari wrote:
> On Wed, Dec 24, 2025 at 3:47 PM Marco Crivellari
> <marco.crivellari@suse.com> wrote:
>> [...]
>> Marco Crivellari (4):
>>   drm/amdgpu: replace use of system_unbound_wq with system_dfl_wq
>>   drm/amdgpu: replace use of system_wq with system_dfl_wq
>>   amd/amdkfd: add WQ_UNBOUND to alloc_workqueue users
>>   drm/radeon: add WQ_PERCPU to alloc_workqueue users
>>
>>  drivers/gpu/drm/amd/amdgpu/aldebaran.c     | 2 +-
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 +++---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  | 2 +-
>>  drivers/gpu/drm/amd/amdkfd/kfd_process.c   | 3 ++-
>>  drivers/gpu/drm/radeon/radeon_display.c    | 3 ++-
>>  5 files changed, 9 insertions(+), 7 deletions(-)
> 
> Gentle ping.

I don't have time to go over that again in detail, but skimming over it looks good to me.

Feel free to add Acked-by: Christian König <christian.koenig@amd.com> to the radeon and amdgpu patches.

Felix or Philip might want to check the amdkfd patches.

Regards,
Christian.

> 
> Thanks.
> 

