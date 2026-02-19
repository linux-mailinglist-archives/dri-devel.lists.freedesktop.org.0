Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBM9Iucsl2nmvQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:31:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FB6160302
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBB710E721;
	Thu, 19 Feb 2026 15:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tbwEGKS8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010069.outbound.protection.outlook.com [52.101.201.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E10E10E6F9;
 Thu, 19 Feb 2026 15:31:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tue/G/NvD02iMw/rj0s1Jxb31jwSHxMNBqLuf/LwrLe6LMT0aeG/12Fd9/45xnc3bIp46NQ8avoqtbH7vCPCfnI+rKmpCxj2gda8sL5/xlrK9ieOoiS1duO2qOFaDwZ1MdQ8oRL21SaBCqe85VKG6kOhI1haFxuizrdJ2tkMrhhYWrl8bhy9IRTxX78BJwekWat4AGYlOyi31BfzUa4MMRbIIOzjerrNYC4s7tFVwp0Wu6hiOrvHYoFLTBN6ZFIlzKR30PoAYMpZ7kLBnhXvHYoSe50fF7JT6ohtL3x2bVLKg2r4KPoZw7e7GBS8AfOsUeBRTN36D+cqw7jxgYJRnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WkcC0Qp/NjXsnq2oCHbcJJc/867ubhZKGcHtbnLhHio=;
 b=mbsqrPBoXlhklFDauv15+IEg4IA1jOjX9LYiXEme+kjeGTn5F+tRxnzxQ1mYSxhdJlVo8a3zggz/WyXDssG4OZobuLZK5bK7weI2x5c2+Afhqj3bzRT2dDrVUo8vsn0UO8z9Jem7xnLKN23AZI5t+9pj+FZUPmuk2+UGCojpkql4HESj9bszT5DhayhSwNBsisYtPWsJgh5CQSbHd4k104RMXGRC7mi7qN3MrCqHt8KY72tnf0OPNRiAEyRZcljcEVQsjddqETBaTzf8t9IxCAq5AvOBdjnKvSrE2Tf5hsKEw9IR6S1ueEjG85KvmoW1EkBiFaSKjyieW0pbeaDK6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WkcC0Qp/NjXsnq2oCHbcJJc/867ubhZKGcHtbnLhHio=;
 b=tbwEGKS8lv5BrLc/LahbPR/1rhp8YYtNqcleqHfhwIUnJk9R4Ipa62dwsyBuPopgCMRicHRvVjrFTNXIzliuxDc7n9QvmZDe5JXcnXYKeCNBOcAMbtBpI+0WQdTwmRk7wbnwOZPLR/zFWZki3MM9V4oNbjBbBffAVuv6+C3FvoWTGkjuicRMVTxz2L/DaKijtmoZxqn3TdM3yvxtBsd4aHBgbdudGkN1d9DFCVQ/QSx/rd1971FAwlNY4UmILXQuaih68OzAkVgGrOTmovtoqkMnSqcHiyZgyI2X6GxB2EoXeUMGezPd++7AT/oduc4l8pV2TNLTn0RZ57fYPE56RQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SJ0PR12MB6989.namprd12.prod.outlook.com (2603:10b6:a03:448::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 15:31:39 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 15:31:39 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Gary Guo <gary@garyguo.net>, Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
Subject: Re: [PATCH v10 7/8] nova-core: mm: Select GPU_BUDDY for VRAM
 allocation
In-Reply-To: <74911663-f4d3-406d-b58e-50cd4bb865d2@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-8-joelagnelf@nvidia.com>
 <DGIITNWQG26Q.VN7FUL89C5D5@nvidia.com>
 <74911663-f4d3-406d-b58e-50cd4bb865d2@nvidia.com>
Message-ID: <9c02b381d691e13b9fc0310e9329b3d6@nvidia.com>
Date: Thu, 19 Feb 2026 10:31:37 -0500
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0145.namprd03.prod.outlook.com
 (2603:10b6:208:32e::30) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SJ0PR12MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: f612cee9-b32d-4084-d1ca-08de6fcbf9b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wks1Y0kzczZObTYyU09XdzQyK0E3bHBxUGh1d0ZKNTd1S1ppT3NQL1REdUNL?=
 =?utf-8?B?MG9HYWEwWkxXekVMZTBWMkhVbVh5MitCWFJmMEtZQWYvaWZlcGNtL1ZNSEV2?=
 =?utf-8?B?bnBpTDRxVktKRElERVBRQkd3TVlTNjduWkdhcVdxbnlzRGpaaFJ3a0NpQmtr?=
 =?utf-8?B?V0VxZldBN3JpQ3dRcC90cnJjZ0VDWVVaTlN5Y0UzSGRIM2lRczNmZ0Q0MmZK?=
 =?utf-8?B?SmFzZFJUODh6Z0lhbHFPTzhJWXJQMG1Wck52QXlmajExWDRjUHgvYmJDQ3R6?=
 =?utf-8?B?UklqNW5OMENyaXBXalA2enROdkVtV2tSUlpWRWRRVG0rbkNFMkhnbmR4ZW8x?=
 =?utf-8?B?MHBMbHRiVEVaUmJoSUtWZFhmNG0xdnpxR21BSzZzdGtwRTFCeHhrMnBGNW9j?=
 =?utf-8?B?QVRGbWMzR2Y1SEtoUCt1bFRLOXY3NWVuWkxKeHlPMXdVT0FOdGEvUnB0ZlpY?=
 =?utf-8?B?djRmcXM1WTZFclhQYkwzQmNPK3BLRFZTdnpmUnBva2hrRTg0MG9ZKzNZRGts?=
 =?utf-8?B?NWR2UDhrR1ZGN25jMGpObGE4azFqQ09VbVdlRlZNZDdiUFJ4OFNkU1pPdGdZ?=
 =?utf-8?B?SEN2THdUS1pRWDJLMUkxMWF2MkZJVWUrWWFta0JKV2dCbHNPTjhXaDA3VENJ?=
 =?utf-8?B?L0JocGh4Yi9Jc1AxMVJRdjBiLzZNNE5yMGVnV1M1M3ZwOTNCbmJhNDVkVDNH?=
 =?utf-8?B?M1I4OFJJMDFFbHBQcUlaT202NzQzcU0vdTE3V3hQdFRvUksrZHQ5Q3RrSEIr?=
 =?utf-8?B?UEhZZ3JsdEJ4ZVhlWGxEemtoNHM1MnVCcEgvT1FkQWtpZ0RaMytKcHdETURx?=
 =?utf-8?B?UW4vdGtyMHhpNzJEVk5zWnpGVWFDMlovN2E3Y1BaeENRY0RPcHNrRzZocWdW?=
 =?utf-8?B?WVFINU1RT0wvZXJZY2ErUmRpV0FiNTc1R2loakhIVDQxblVaWlhORkFCL3Ji?=
 =?utf-8?B?Wm5URHBtdFYybVY2Z29hazJvWllYWjVjMkVqTGNOOWo5Z0gxcTQrc2QwNUZ6?=
 =?utf-8?B?eXRXK1ZrTHczNUVIcmVuSnJaeVJwdW85Sk54VHRldlhnTk9VMUs1d2J3elVy?=
 =?utf-8?B?ekJSbERmZDE0U2oyT1k0R3BybHNUSGNIT1dnOEpyZmJ5L0JIaUFSVkxwdE00?=
 =?utf-8?B?Znp0TzhjZzJxWXFsSlBwNGl5ai82VXhSaTh4TVp6bzVMWWtiNW40Qk56VnZI?=
 =?utf-8?B?bmRDQ21uaUJGWXB2OEF0WHZucUkvNWlnVEs5ZDR2TE9adUxZU3JiT1NOcnVl?=
 =?utf-8?B?ZGVhY0ZzN2gycTdlTExSY1NXcWJscWx0RzA2M0JCa05vT3hRMWtLbnhQQnFK?=
 =?utf-8?B?bDE1SSt1emg2ZE91bGJwYm5KOEltRC9sblo5c0Y4aVlYZks5M3oyVmt1azE4?=
 =?utf-8?B?SUhqLzRZRkJqKzgxREhtTUthbDRSTEJsbStjdXo2bmhUZ3NlaDYrU3gwbUw4?=
 =?utf-8?B?QnZiTHdpZHpGUlBXbENIU2poMFR0Qy9pUUNWMldaSXRUem9qZ0ZlNGtJN0hv?=
 =?utf-8?B?NVZsTUYyWDdZWEtGNmtaTERYOGdFbThSSU1aUG9nSUxJK1A4MTV3NFJDTTNF?=
 =?utf-8?B?WWlIREFWUHdISGQxY1JpVnM5OG40cWNyMVprQ3hOQW4xWDhPZ0M0ai9ma0NJ?=
 =?utf-8?B?UVoxS3pqL1FtdHozWVdXdmhZYm5GZytvUUlzQ0RyMmd3S3ZOMFA1aXhQQXZP?=
 =?utf-8?B?eHV1d3ZNSGhNdzJIQTZ5dG1kRFZ4V3NNNEJ6WXFqUytpQ2J3T1lnSlpsUVVl?=
 =?utf-8?B?cENzRjI0UTF4MGpGSXF6RitlSjRiQURTaHg4T0xQbTBZaGJoY0VrV2FGamc0?=
 =?utf-8?B?WXk0Y2lORFpuZ2hPZEhKbzg0MnQxK29sNldKYzhWRGpKSTJNa1NZaWJkb0Q5?=
 =?utf-8?B?Ly9oOUtMSDF2dGZVb1hBWnVuSGV5MUtSY2VHZWFGdjdkZW15cHY3NTY0NHFk?=
 =?utf-8?B?a2VTMzFDUnE4M0hJOG1LbWkxK0hzYkh0TDZ2UlFyZzR4TXo1RVhrbm1wM1Zz?=
 =?utf-8?B?aUFXRHdtZ3NWckl4L2htL0hjSldXSHhKSlRjVlZVMWxkbzgyZld6WU9PYVl1?=
 =?utf-8?B?UXZ1M214Ni8zcmFvQVZHNlFJN0xiSVBRL00rZnlxbzlNck1aSkQvZnBpZUh1?=
 =?utf-8?Q?LkCc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTNMOFpFVmd4RXFsQTRQVVhmTFB5elIrOThkbGE4V0xhZWFIZXhXOSt2V3FH?=
 =?utf-8?B?MGI3b0NvYVdaUkZ1blRxOEs1MzBEem1YbFQ3WTQrY09TT0ZhRWJmVlc5VmU2?=
 =?utf-8?B?cytIU0gvaVgxdDdOSElMYkoxc2x4K25ZdnBGcEhvZ29ySm5Zb1N3OUNxQmNq?=
 =?utf-8?B?a3R4ejhqakJkWEp4RmFkRlFJSnNGOUVwMWo2YXM3WnBES2hSMTlEYmc3V2Vj?=
 =?utf-8?B?ZjhSZkhKQW9TQ2p0UTVKMG45TE5tdEUwQWJnU1BnV05IZExUZVJPOTdxLytr?=
 =?utf-8?B?Skl5VElxS3h2OC9aRmgzMk1hUkZybndTcUJldzBlWW9XdlJ5UFFnZ3RwS3ND?=
 =?utf-8?B?NXVlTXJFMS83OVVjVU9lV0luQzJvNmdiTldYR1BvSjV6T2gxUDRycGlRWFBV?=
 =?utf-8?B?TWh3blZYOVY4eTQ1bVBTcW9MWUFNWUxSWlFFNE5Fd2lRU1B4Zk40QXZWVVZj?=
 =?utf-8?B?YlpjdDc5VTNRVlkvWEkrZDREamd4RDB4amRTSWlxY3QraUtXdTRkZUIrckhU?=
 =?utf-8?B?SDNsM2lUNXBCUitiWU9SblEvYjF3WkZOb0YybHFIeEM0QzlsSEg4TmlXdTF2?=
 =?utf-8?B?K3YrSHBsRkJ6STE2VFlWaUd4V2ZyUWxZWVJyd2JJeEFINGl2bERncWZSZmdJ?=
 =?utf-8?B?bWZxVnZIeFpsRFhFRFd4cW14NkFWOTVNTFY4WEl2Sm1NbnpENjAvR2Z0eTVl?=
 =?utf-8?B?OTk3dlRlT2xOQThHRTFNSUlmdklHRkFGdXVvNDdCY3dYOW9hYWpGd1NzUFNR?=
 =?utf-8?B?V1pPRzVENGZtOHFjaHBWQmxkbkhvajIvN2Zac2thT2JjbVdqcE9kWWlsRlps?=
 =?utf-8?B?SEJDK2ZLb3l1VGNhZ29xdW85RGcrYk9sdEI5NCtUTUd3eDBiOUNtMFd6LzNE?=
 =?utf-8?B?dk1OYnFzOU9wQklkUmc0aDlyc1RnaENMWE1GVFB6eCt1Mnp6SHkwRWJHQUx3?=
 =?utf-8?B?eEk3RHZrVkl5bkY4MGtMNStmQWd2Z3MvZFZ1UXpoZndsU3hlNUZSR09Ka1JW?=
 =?utf-8?B?Y09aN2djbHduSlR3SHlUOEl6NHMwTU1kS1dxNnlMOTBPSkxNeGFud3pwM3N6?=
 =?utf-8?B?b0IxLzBoQjRVc3JnRjBOeHNDTkEwRms2THRLSjdOTWZOZVpMaUlsMWw1UWVO?=
 =?utf-8?B?Y3JBMmVVMk81Qk92c21VL09JaWxsQXM2eUh5Vi9SNUVUUklaN1NMVVhTK0Zt?=
 =?utf-8?B?K0ZIVmFLekJBbzNmUVBqcnpNNzJZWVBzK0cyY3RZRzZIUGNVMnpZQnV0enFJ?=
 =?utf-8?B?NnZvR2VNUTVXd0tEc0VvRkJJZ0ZYVlRjcDhDejZSZ3hoQWZTcmloWnRUbm1t?=
 =?utf-8?B?WGxob1diYkh4Ly9XWTE2MkNFM2prRFltL3JHZmNOUFh4YllnZnQzVDl1N0RI?=
 =?utf-8?B?SklYVDBkZDlHWi9WakhVbXhseFRUZG9WNElVQnFjbkRmd1FNajJ6cUlmemU0?=
 =?utf-8?B?OWpkNmoweTFoVW8rK25Kb0krUlNJa1VXQWdWOWpUeUI4c0tBT1pjZXBPQWxM?=
 =?utf-8?B?Nk5XMjREaHNzMkQ2ZldPYTZ4a3JpbmlwUmFsREw2M21Sc1hxeHFtaXM3L3Zm?=
 =?utf-8?B?YitxaFV6WjhQVktPZ0ttSVB4LzBBMU5Kam50YUxoanl2NUxLcXhscnZxK3BT?=
 =?utf-8?B?YU8yM0oydVU5VDkrSWVYejVnL2hvSVMvYWR6SERGWXBldzRvdmZGQm1EYjh4?=
 =?utf-8?B?dUZPOWRpM3pXL1FQbE5wSVBkK2dDOG9SUE5tUFozQVFzOU56SXJXS3dRUGZF?=
 =?utf-8?B?SzI5bkk1eTV2RUt5anA5NXZSNFFzWVJpZWpaVTRPbGdFVzNmdkRkR1FjU2R3?=
 =?utf-8?B?b1BzYnhDQTZNc1N1RFU5c1pIUHRUakJ4bm9uaVdweXl3Y3dSdklCOVdWMGFI?=
 =?utf-8?B?b3RJQUVvamJhY2JrS3ZmVjZvcmMvZTc5eEdVcDcwSnI4ZnZSM3psaG54bEcz?=
 =?utf-8?B?UzdJSE1Jb2xKN2dPalFEcW1wbW1PeDlQVDRyOFRVdlJvQzErbFZNOFRjVm5F?=
 =?utf-8?B?dmUzNmtDb2VscG1xWjVJT3k2WUZYOTVGTmRWY2JzYkFaZTRncGhTdG5PVkVy?=
 =?utf-8?B?TjVWV25EdDBFcGN0VityQXZIczR3WlQ3cUZvdXJvODFwZU13ZDdVUEc3WWs5?=
 =?utf-8?B?R0ltbGc0b0VmaDJ2ZFJ4Ylhya05jczg2SGVpZGtMRmpJb0d0UzJxRDAyUlMw?=
 =?utf-8?B?UmxqY0k4bjJJMzhHOHhhWmVrTkxsOU0rNUFrWFJLTkRyWk5yemdET01ieGpD?=
 =?utf-8?B?SktaZy9VMWxXNlZkOWxaVkVDSzJZOXIwM0lJYkVZNkt6bGhYd1poQWgvUDg0?=
 =?utf-8?B?VWpoZDEybWt5TWZjLzNNcWZVb3hVb2lMb2E0elhLUXdzRWI0b29MZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f612cee9-b32d-4084-d1ca-08de6fcbf9b7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:31:39.2840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58S0OW+pwWwc3rtDZ1uru8fPfLXbNgobEDrF0E8YQp9tJhi6RYxWSaOPIdBZJOb8O15ApzMZfd32pU+Yd3XlEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6989
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
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 37FB6160302
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 05:14:18PM -0800, John Hubbard wrote:
> Or "gpu: nova-core: ", actually.
>
> That's the convention so far, where applicable of course.

Thanks John, will use "gpu: nova-core:" as the subject prefix.

Joel
