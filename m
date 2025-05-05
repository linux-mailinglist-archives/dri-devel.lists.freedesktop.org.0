Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BD7AA972A
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 17:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D24510E400;
	Mon,  5 May 2025 15:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Bue22Hvp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2045.outbound.protection.outlook.com [40.107.212.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C935810E400;
 Mon,  5 May 2025 15:17:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p03lp9VeLU0oJliKxHKoc4s4B3bzTKeExqo0L9yl1jWvj+SXfY2K6kTGRzNkqB1Mbj4+biN/3pZsXg3Gl4U0qGOcaQIJKe85Tc8zOKo3ESfd56SVzOsyMJsQc0GpKFnDHBZ+pnWbUyfQnqw4VDLziFIIjAV6hBJkbCNh+zC0zkuNqJbvVQheqXQNvdomds/XwqyyPX6VxtDaTdOj0K9HAQhWqmfkoZNlPAfwEp/jM/sRhWuzVZscB4DVuq9nGgtYMkP6xcWJz/+2LX5TgSzmdaYT6pestA+VY+hAVMzUGr34K+dUIz4q0IAl/tEpCHCoxQtiDvMaSbYuyhIekz7NfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Au/xRYS0c43rEWFg2NQq2lo6HUW4cukDDrM+Ji8GiUU=;
 b=feRKw/p2gb3udedbdLucB6j5ROJcaxU/NqEMuDEJBsUJMWf4amsfE4VxSt9LmY2h/FK4OGK9ZJpcMc0YCcXS89FhTLHeofp5ixNekAG8bHfXYqiyQmyiiqr/Xq3JkQvvCZ6fUJIgOtB6GkP8j7TVQK/SWzWZFzhsicLaE22MHGOZOoQ04d09Z6RwnTtrznje2mgFCMCK/O57VH4krniWUyhyMx4CgFFqrfhCdVTNOkY5w/M++CyWcljBh2FiKlWVMskrGgepAi5qkwxzwFG112ZM00WA+G4WPDfBJ9Rv3dmARHfGwwQqzxLciVdD4BWKZefwQoYrn2T9jqUl2o/UQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Au/xRYS0c43rEWFg2NQq2lo6HUW4cukDDrM+Ji8GiUU=;
 b=Bue22Hvpxernv6knqGhU3eIsfGjuE+s3aDNRgSIm30sOGBmTI5JzeB9BCi68vMSH3/o9Uc3qHEVU7JEjNWKv16IB1ybdGzvKFI+xTGJwrPNCFcs2J595qfBttq6ukUlZNK3D2bsrm9Cracdx7VvCfVa1RFMHaMtZ7skEcim1QDU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB5663.namprd12.prod.outlook.com (2603:10b6:a03:42a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Mon, 5 May
 2025 15:17:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Mon, 5 May 2025
 15:17:27 +0000
Message-ID: <5f940da3-a32d-4ca7-966d-8b1df78c0d68@amd.com>
Date: Mon, 5 May 2025 17:17:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/33] drm/msm: Add _NO_SHARE flag
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robdclark@chromium.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
References: <20250502165831.44850-1-robdclark@gmail.com>
 <20250502165831.44850-22-robdclark@gmail.com>
 <3a4297fd-4554-4727-ab05-feaddaf63ea5@amd.com>
 <CAF6AEGtmjLM-tK9Y=gT5XupW62X_eY2fiBJCYUnKqO9A9C4xFg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGtmjLM-tK9Y=gT5XupW62X_eY2fiBJCYUnKqO9A9C4xFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:208:335::26) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB5663:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d96eaaa-1687-43d8-1a3b-08dd8be7f1bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGs1b0EwL25INnJuZHhxU3IwNzBlRktDSEc5a1VQcTRHOGw1aXVqM3lwMEtX?=
 =?utf-8?B?eVd6cVhLZC9iM2p5VTNweTYxK1dGOWVJNXhEcGMxWU1CbGw0eUhsdHVqMm1n?=
 =?utf-8?B?UFZoZEM3RlVlMDFjQ0txWDlmYXRUZzJXaDhPcVdLdUM4ejNIVTZTUzJ3UGFH?=
 =?utf-8?B?YVVtNnJLNmV4aUtBWE11UUdvM3VLcjV2dnREWU9VYnR6M0Rwb2hhRXVVUmNr?=
 =?utf-8?B?UDAybUVyUUdUc1Q0Q1hLaXloUDBGRGM4NkpvZDdOVVZudExGV09vbzRPMGlm?=
 =?utf-8?B?eTFiK1JiMlZrMnhXUjRnSVVsUWdpdXZpeVFjZU9zeGdsRG1ibU1LRFhHNzFP?=
 =?utf-8?B?QklxeXVRNW5mOW5NK2ZEQWNTdEJyQWRpTFNrWlJ2ZzNuNTVjb3AxYmp6RmN4?=
 =?utf-8?B?bjZtb01ITTk2Z2pyazVQNVVqNnJKYVhMR3VrSHVjNDFBRVVRSXhsOFIwMEZR?=
 =?utf-8?B?RXVyM1lmanpaMkthWlFxNzJXL1QvRDZ4R2tYZUJFZE8wSVhVZjd4TFF6VXJ1?=
 =?utf-8?B?aExrS1JhSTF0c2Rjb3pVOUZlK0tuNUJDb1BwRjRQWjNlVnhDMzBEaWZVWVBo?=
 =?utf-8?B?Vk0zajRpYjN3VENIZCtmand3Y0gramJncUxTcHJlenhvV1hSOHJBWVk2TmFN?=
 =?utf-8?B?LzQ5UGR2ZCtBbm5LenNibDN3WVhsUlRwcDZSSXlUKzR1VGxwd3BoNFJoR203?=
 =?utf-8?B?RnhyMGlEZmlpYnBpV25lSVFPWFRVbU1XLzE1VVl0NkU5VURETDZqNStrSVA3?=
 =?utf-8?B?TmVLVlNWTXl4dzFJa200OGpZUkFrSzFYK1dKQ0xYM0lzczVnVWR2a1VhVzVa?=
 =?utf-8?B?MGdWOUJKcGx2Sks3OUFURGpKM3gxWUdWNkF5a3JOcHdzb1ltMTI0cTVNOE5S?=
 =?utf-8?B?Nm5UY1oyRjVFQVVRVWtKdGVhTmJoVHJGRVB4Ym1ZRVF3aTg4Nzd1Q3VTRDZI?=
 =?utf-8?B?NGhyNjNqblBWN3NjVDljQ2JCK05rb0R5STR5WmxmWjZWNjBTUGVNeWpCcStu?=
 =?utf-8?B?RVBUNHp0Vm52Y1dVNStCN3dDUEtzUUlITjNxUUVjelhibUo5Yy93T2swZjkw?=
 =?utf-8?B?Q2FYMHF0ZWJHcWo2cmZPZ1ZZN0JVd2FtZFpZTlptS1pSZEFWVXJpSDFYTzIv?=
 =?utf-8?B?dG9FQ3RIcE50VWFQZVB4djFzYmY3S2dhcVZLaFQ1TXJpcVFOMGt6MDBHYWps?=
 =?utf-8?B?UHFkN2FXUDc3cS9BQUlkMENBU2pFellJN0d5L3N6cEhUTFVBSzJwbkpqY25o?=
 =?utf-8?B?anI4TWVSeDA1QzM2QTRwa01FMnBQT2JXaHNBSmFuQWZUdS9uNXViUVVRaFN1?=
 =?utf-8?B?Y1BqN1BMVDU4S3ZNY0pmdG9lcjByZ1dpaFhQNFcwcksyMGZUMXVpOUhGMkh5?=
 =?utf-8?B?QVJqOGN6L3NTS1F3TWVuZU0vR1diUCtpYVQ1OTFHUjY0R2dTTlBNb2J5d0to?=
 =?utf-8?B?bXdUNVpkT3d1akZZMnJwVEFVQWMvMVIrVkFyUmRsVlhJKytxWHJVUE94d0lr?=
 =?utf-8?B?YnhqWnNycVNEcVNuaEluYWJPMTZqOWZ5a3dDTUUxZ2V2bkpKMXlzajYzM09I?=
 =?utf-8?B?aTRSdk9NL2gyYnF5TzlrRXA5dzR0K3hIU0JxL2djamZ1M2t4ZGJkN25JSTRI?=
 =?utf-8?B?UTdIMk5sZnJUajFBTm5wQllYcWRHWmYxbEp4YWVONnhpUlJUQytTN05BSVVu?=
 =?utf-8?B?bTVvRkxMOUpFaklvRWd2eEFSeDZEWFlsTG5XbCtRbXhPendSeWdtdjNLMlpD?=
 =?utf-8?B?QXlHdUYyeWRzckZEeWlpd21oVUpqYjd3RHc0dVFuenFhb1hDcy9VTktvQkQr?=
 =?utf-8?B?NzZ6d2tHb3BwNTNWQ1pPNlVhYzQ2ZXhXZFIyei91RUl3ZW1jL2VldkZhUG1m?=
 =?utf-8?B?Q3ZqeUtndmkvL1h5OUwwVXZ3bWxiMzg0SXZpWXBhWU5yRnNHWDdWLzJlWjV3?=
 =?utf-8?Q?8pENW+gB3p0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE5XZ0xHVGJIMGt5T04yQWtBN0EwemxzOTVXc1Fmb25WaklucmtNZkpsOVdo?=
 =?utf-8?B?NldQSGhsUm1ha1ViVTVVSzNBMFRIS0hSeVVScmNSS1NIVDJOOUpqN0VMYlkw?=
 =?utf-8?B?MVNWN3BvTjk1QVdlc0ZENHdvdXJuckVsbnNLdHFvMWwwRnNud2w0dUNzY25z?=
 =?utf-8?B?SlhyR1BXSUplOW52eHBHenlEVjA4YXNtTFBLa29TdDUycGE0K2lMVDAwd0k1?=
 =?utf-8?B?d1NaYnluZXBoTXRWYlNIWUt0OEFTTzZHM3I4NW1tWXNPYmdGQndUL2pHUG8v?=
 =?utf-8?B?UVZuZ3lOWUN4VFZtbWlML01zS1pzdlp6OW9FZFFVUU1yMENLYnBCUUo5dVFX?=
 =?utf-8?B?NXRzcXRWdUxvdnF1aVBDUk5salZZVzk2Z0o4T0pLRUN0eXJVN3ZZM1plY0JN?=
 =?utf-8?B?V3R3eVZ4WEpPV05SdW9VYjN6VTYvREpjMk95MmJCejQ3UTQ0cnE3UmI5R3lD?=
 =?utf-8?B?SVlCR3E1ZCt2TlIwRS90SE1LZmlOcnRMUWYyaGx1aW1iRkU3MzA5UXpUWkxE?=
 =?utf-8?B?ZGJsMllTbUs2dURyOG9Ia0ZPMW9NVmtubG5LcmxTTFY4b0pHTUExM2pSbTRk?=
 =?utf-8?B?WkhBZ0lJWTB6TkRsUmRFL0NTSmhWRGxvTHhBTDNLMGVGS1lnQlR6ejNKVnU0?=
 =?utf-8?B?andzOW5jNjZEVDB3OHY5TlllZ0ppREY2VklNM2pNSFEyNWJWTkl2VnJsVUVz?=
 =?utf-8?B?ZGl4R1h4NWVEdWlDYW5JeGpwZWg5MW16ZW9SSnprQnNjUkcwa3AwSW5FeTFR?=
 =?utf-8?B?eGlPMFh2M3NIVWw1SmZDby81dTExdU9DTFJkOG1oRlgxTkh5RDJReVdGUC90?=
 =?utf-8?B?Y3lKNkJlOVhLckVTVk0wVmtaQWhDQnNyVHpabmd6NWZ4d0pwTFMyUkg4UWxE?=
 =?utf-8?B?NHhDc2hBZUZNODlrMHU5ZjVaMHJsWTUxWUdZUDM4azFTcnlRbDY5MzVmaWxQ?=
 =?utf-8?B?NXhKSVlrTkdFa1FqSUg0TktBRDdEMDNBYVZneXozZkRKWkNlSUdlbWt3a2Fw?=
 =?utf-8?B?UmNYUUswRjFnb2ZaeFlYTzl4VTU1YVg2cHo2SDFQQ0hBclUzYmJQdW5id1ds?=
 =?utf-8?B?QkU2U2dodnhheVM1bUdJcEJLMFEyd0lkVUE5VGhlRWFNbkxCR0JkZURET1Mr?=
 =?utf-8?B?UTE3bGF1UHlHTFd0T2xreHRacDh1cmRwaVExaHZMUFJsZlNNSFNjQUw2anFk?=
 =?utf-8?B?RHYyMUVFTXVNbnNkVHVnVDM0Y0FUUjdTcnV2bVdnakR4YU9XTFkyM0UzdEVy?=
 =?utf-8?B?UkU1ZldhNE40WjBlVisxczRrT2x6RUJWV1NuTk1CTjZrMlRkbmUwUkE3aEhx?=
 =?utf-8?B?bGlaTlBGSGluSlF2WXV0TWhRbVdBOFF6Uk5aRElWcVptMlFlUXl4eUVEaVJJ?=
 =?utf-8?B?WGtpRWoyd0RqYnArSU9LVzZicktDSGpjN3ZuQzNDWERDeTh6dUZQL1UyRXR1?=
 =?utf-8?B?N3V1elM5Y2FodGlmQ3NpV0dGd1BSZTBuRDBsNDEzd211QWFQcUMvckJBK1Qv?=
 =?utf-8?B?V09nYkhyUExKL1BVMmhkbGpvOFFtVURudjZ6S2F4Y3NOdXFuTEpWeldkUDZ5?=
 =?utf-8?B?SGdYTFo3WmkyaHcwUTUvbjFaNnBTaGNWSlNyQWpRMnp5UGJ2eUlkajAzWkRl?=
 =?utf-8?B?dnFBc2FGNlFseXJoMVIwS3VucS9WbE15ZE9zUUdoNUs5a21RUGEyS1ZPLzhO?=
 =?utf-8?B?NkdHT3cwNXVTUzQwYUlHK1FFOW45S2hCMy81ek1wVDk3cUNQK3l6UlZWSEdP?=
 =?utf-8?B?UFF4RzdTWTI0aXhtZCsyQXRPckgvdEZRcXBUa041c3FLZldkOFJZbzYwMFUr?=
 =?utf-8?B?b3c1bmE4R3drQXorY1lpUzBKcjcrL1EwTzRCUmorYmRSWkUzcGRwVzFXTnV4?=
 =?utf-8?B?UVRKQ3NUMTBZenRIVWduQXQ4MnBlT2V2NlkzMGVYbkE5UDlaeUZzekkwdFZk?=
 =?utf-8?B?V0VVdWpzNVB6ZWdMZ25vbndpamcyQ29lUGxhOFhDcktSYi9UZHRoRk5hN0ZP?=
 =?utf-8?B?dy9RZVFlOSs4Z1RYV3NZcC9pakpMUFlyZ3c2SWJtb3JLMGRMbUpWL0w3ZG5v?=
 =?utf-8?B?bEJ0Ym11bjBRamdTSno4Q3k1WWgxeFBtYU81YThhaWhLdEpIcGNXSFg3M1RX?=
 =?utf-8?Q?JhVukguyI3uLgFl5SR4Mg3twW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d96eaaa-1687-43d8-1a3b-08dd8be7f1bf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 15:17:26.9036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJGU10OQXODCWW2x9AgQNjkNhlSMMZeM/KbDqlRZEGt/DsAMOuKQxp+QSSqcNpGg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5663
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

On 5/5/25 16:15, Rob Clark wrote:
> On Mon, May 5, 2025 at 12:54 AM Christian König
> <christian.koenig@amd.com> wrote:
>>
>> On 5/2/25 18:56, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Buffers that are not shared between contexts can share a single resv
>>> object.  This way drm_gpuvm will not track them as external objects, and
>>> submit-time validating overhead will be O(1) for all N non-shared BOs,
>>> instead of O(n).
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>  drivers/gpu/drm/msm/msm_drv.h       |  1 +
>>>  drivers/gpu/drm/msm/msm_gem.c       | 23 +++++++++++++++++++++++
>>>  drivers/gpu/drm/msm/msm_gem_prime.c | 15 +++++++++++++++
>>>  include/uapi/drm/msm_drm.h          | 14 ++++++++++++++
>>>  4 files changed, 53 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
>>> index b77fd2c531c3..b0add236cbb3 100644
>>> --- a/drivers/gpu/drm/msm/msm_drv.h
>>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>>> @@ -246,6 +246,7 @@ int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
>>>  void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
>>>  struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
>>>               struct dma_buf_attachment *attach, struct sg_table *sg);
>>> +struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags);
>>>  int msm_gem_prime_pin(struct drm_gem_object *obj);
>>>  void msm_gem_prime_unpin(struct drm_gem_object *obj);
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
>>> index 3708d4579203..d0f44c981351 100644
>>> --- a/drivers/gpu/drm/msm/msm_gem.c
>>> +++ b/drivers/gpu/drm/msm/msm_gem.c
>>> @@ -532,6 +532,9 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
>>>
>>>       msm_gem_assert_locked(obj);
>>>
>>> +     if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
>>> +             return -EINVAL;
>>> +
>>>       vma = get_vma_locked(obj, vm, range_start, range_end);
>>>       if (IS_ERR(vma))
>>>               return PTR_ERR(vma);
>>> @@ -1060,6 +1063,16 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
>>>               put_pages(obj);
>>>       }
>>>
>>> +     if (msm_obj->flags & MSM_BO_NO_SHARE) {
>>> +             struct drm_gem_object *r_obj =
>>> +                     container_of(obj->resv, struct drm_gem_object, _resv);
>>> +
>>> +             BUG_ON(obj->resv == &obj->_resv);
>>> +
>>> +             /* Drop reference we hold to shared resv obj: */
>>> +             drm_gem_object_put(r_obj);
>>> +     }
>>> +
>>>       drm_gem_object_release(obj);
>>>
>>>       kfree(msm_obj->metadata);
>>> @@ -1092,6 +1105,15 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
>>>       if (name)
>>>               msm_gem_object_set_name(obj, "%s", name);
>>>
>>> +     if (flags & MSM_BO_NO_SHARE) {
>>> +             struct msm_context *ctx = file->driver_priv;
>>> +             struct drm_gem_object *r_obj = drm_gpuvm_resv_obj(ctx->vm);
>>> +
>>> +             drm_gem_object_get(r_obj);
>>> +
>>> +             obj->resv = r_obj->resv;
>>> +     }
>>> +
>>>       ret = drm_gem_handle_create(file, obj, handle);
>>>
>>>       /* drop reference from allocate - handle holds it now */
>>> @@ -1124,6 +1146,7 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
>>>       .free = msm_gem_free_object,
>>>       .open = msm_gem_open,
>>>       .close = msm_gem_close,
>>> +     .export = msm_gem_prime_export,
>>>       .pin = msm_gem_prime_pin,
>>>       .unpin = msm_gem_prime_unpin,
>>>       .get_sg_table = msm_gem_prime_get_sg_table,
>>> diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
>>> index ee267490c935..1a6d8099196a 100644
>>> --- a/drivers/gpu/drm/msm/msm_gem_prime.c
>>> +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
>>> @@ -16,6 +16,9 @@ struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
>>>       struct msm_gem_object *msm_obj = to_msm_bo(obj);
>>>       int npages = obj->size >> PAGE_SHIFT;
>>>
>>> +     if (msm_obj->flags & MSM_BO_NO_SHARE)
>>> +             return ERR_PTR(-EINVAL);
>>> +
>>>       if (WARN_ON(!msm_obj->pages))  /* should have already pinned! */
>>>               return ERR_PTR(-ENOMEM);
>>>
>>> @@ -45,6 +48,15 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
>>>       return msm_gem_import(dev, attach->dmabuf, sg);
>>>  }
>>>
>>> +
>>> +struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags)
>>> +{
>>> +     if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
>>> +             return ERR_PTR(-EPERM);
>>> +
>>> +     return drm_gem_prime_export(obj, flags);
>>> +}
>>> +
>>>  int msm_gem_prime_pin(struct drm_gem_object *obj)
>>>  {
>>>       struct page **pages;
>>> @@ -53,6 +65,9 @@ int msm_gem_prime_pin(struct drm_gem_object *obj)
>>>       if (obj->import_attach)
>>>               return 0;
>>>
>>> +     if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
>>> +             return -EINVAL;
>>> +
>>>       pages = msm_gem_pin_pages_locked(obj);
>>>       if (IS_ERR(pages))
>>>               ret = PTR_ERR(pages);
>>> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
>>> index b974f5a24dbc..1bccc347945c 100644
>>> --- a/include/uapi/drm/msm_drm.h
>>> +++ b/include/uapi/drm/msm_drm.h
>>> @@ -140,6 +140,19 @@ struct drm_msm_param {
>>>
>>>  #define MSM_BO_SCANOUT       0x00000001     /* scanout capable */
>>>  #define MSM_BO_GPU_READONLY  0x00000002
>>> +/* Private buffers do not need to be explicitly listed in the SUBMIT
>>> + * ioctl, unless referenced by a drm_msm_gem_submit_cmd.  Private
>>> + * buffers may NOT be imported/exported or used for scanout (or any
>>> + * other situation where buffers can be indefinitely pinned, but
>>> + * cases other than scanout are all kernel owned BOs which are not
>>> + * visible to userspace).
>>
>> Why is pinning for scanout a problem with those?
>>
>> Maybe I missed something but for other drivers that doesn't seem to be a problem.
> 
> I guess _technically_ it could be ok because we track pin-count
> separately from dma_resv.  But the motivation for that statement was
> simply that _NO_SHARE buffers share a resv obj with the VM, so they
> should not be used in a different VM (in this case, the display, which
> has it's own VM).

Ah, yes that makes perfect sense.

You should indeed avoid importing the BO into a different VM when it shares the reservation object with it. That will only cause trouble.

But at least amdgpu/radeon and I think i915 as well don't need to do that. Scanout is just separate from all VMs.

Regards,
Christian.


> 
> BR,
> -R
> 
>> Regards,
>> Christian.
>>
>>
>>> + *
>>> + * In exchange for those constraints, all private BOs associated with
>>> + * a single context (drm_file) share a single dma_resv, and if there
>>> + * has been no eviction since the last submit, there are no per-BO
>>> + * bookeeping to do, significantly cutting the SUBMIT overhead.
>>> + */
>>> +#define MSM_BO_NO_SHARE      0x00000004
>>>  #define MSM_BO_CACHE_MASK    0x000f0000
>>>  /* cache modes */
>>>  #define MSM_BO_CACHED        0x00010000
>>> @@ -149,6 +162,7 @@ struct drm_msm_param {
>>>
>>>  #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
>>>                                MSM_BO_GPU_READONLY | \
>>> +                              MSM_BO_NO_SHARE | \
>>>                                MSM_BO_CACHE_MASK)
>>>
>>>  struct drm_msm_gem_new {
>>

