Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B26B3B422C4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 15:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80CB10E8A2;
	Wed,  3 Sep 2025 13:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0ppkd+Am";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D9210E8A2
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 13:59:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdm1QsAwmt22DUWYpIhhRulzORF6sTSf+VCbcLTSG77gFa06P/nXlOeuZhSjm3b2U3SDPQnHQw+xd2ZHRi1NhcTqkeXGnn6YWkofjUvEsbcPLM5OO2nsdnan4HHRsJmo2TyUiD7gbvfeouBtRNrWVoMPSB/ZsR5z+sbj37b53TiW6gbjqEEVAlO4PxSDVTtaPKJZzQU8WM1BFqr9IEW2cFwtb6RH9VO0ubGYeUuolIJhPRBMWejWSkPclb6BoDmXupZtSIvW+yYbnDp6fbNHWhoc815j4u5OZ5wKsiJv/u84e3yZGt/54sddQTer62hAwyzHvqONMdufWNcM1KFf7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQF+8qo08L+sudQeTqLLeNsslPh2TZlggqxw4AOewjY=;
 b=yKe2gPzCP8fuGAEnpbDD/wrEK6rAAh6OLZTtwYbbDgW9brkumYTNSiMxGfMXVg0BWBYCa+2Ucp3tlZx4+BSfytM/9aaFHcXKFVl9iKKzfd7wLhNaeYMuOcXe7lfv85Nqo0ldcV4jXJbT940OMCZSwCfQ8stmF1y0q+KRiPESgFaol/dPRMVdBPU7/JOFWzgvOHZSlQHMdtb77MMp/HaiWzfcgrbfSQUcAlyDWzKa8SJxFs4AIyff44XvsdKQ1ClGGum+xS5a9AIf2Yfx0i3rVQkunMXvzKTxpDJXUYEk42Hn7He0EhmHnUGqp0OFn5Ujue5LtFUrgGkfk/DUCf9OMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQF+8qo08L+sudQeTqLLeNsslPh2TZlggqxw4AOewjY=;
 b=0ppkd+AmcgplYMjsnPNmcbxGgVSbGiMbV93SONkl4GP+pVcBiLK3Bt0lmfqIPBnoKnR9RBDcxjcc5Aip/Ddv/U4VxPgH5AybmJ6sNbCgk0+HgeXZili3gqJTrMkm/84frzkU9v5exlR5kt1F4yiCgBlsXNcIG6H2x5YibNodsuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5969.namprd12.prod.outlook.com (2603:10b6:208:398::7)
 by SN7PR12MB7154.namprd12.prod.outlook.com (2603:10b6:806:2a5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Wed, 3 Sep
 2025 13:59:45 +0000
Received: from BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::1ac7:adec:34f4:86d1]) by BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::1ac7:adec:34f4:86d1%5]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 13:59:45 +0000
Message-ID: <e6318d2a-474b-48c8-8902-41b622a90e4c@amd.com>
Date: Wed, 3 Sep 2025 15:59:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/11] drm/fourcc: Add DRM_FORMAT_Y10_P32
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
 <20250425-xilinx-formats-v5-4-c74263231630@ideasonboard.com>
From: "Sagar, Vishal" <vishal.sagar@amd.com>
Content-Language: en-US
In-Reply-To: <20250425-xilinx-formats-v5-4-c74263231630@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::14) To BL1PR12MB5969.namprd12.prod.outlook.com
 (2603:10b6:208:398::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5969:EE_|SN7PR12MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: ce7cb20e-b02b-4f4b-8a0b-08ddeaf22353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXJFU2xUT2ZxQ0piK0tZR1VPVEdIVmVmY1ZHM3dtR1VyWm80ZlNlTy9aM2VQ?=
 =?utf-8?B?UWpncmdWZmVEZE5WTVQzbmR5QzF0ajRUY21udCtqMngxdFgyT0Z4bXNJdjh2?=
 =?utf-8?B?SmZ5MHhuYnhjQVNWdTRNeDNyRDduaFpiejIwTUY1Z3NuTlhaOUlYdkl5MHhN?=
 =?utf-8?B?LzlpZzFWOEJMMTZnbDFYVm1uTHBGMThjMnR5RHgxSGRSbzRKM1FqdnY4Um4x?=
 =?utf-8?B?VUZEZ2JoWU82dU0wbFc3TW1nNERlOFljMHZGUlVpZTBUOTFheFliR2lhdlM3?=
 =?utf-8?B?dFQyMzJTZmVzTjFQTFZkdGxOUmNnWkxpK2NlYkdjZ1Z3VmhYQmRROHNqL05m?=
 =?utf-8?B?V3RNNjBFQ2hGTDF2YmhmMENBckl6TE94dkJVL0FCNFlLVmMxWXBKbGpoaTdD?=
 =?utf-8?B?ckovWUExZEhSOU9WeUc5ZWI2c2pvcHB4T2h0eGx3NGczMU1GUFU5a1NxWkQr?=
 =?utf-8?B?YzBDd1p6NXpVdGVXdWp3VWExZ1d1MXZnYi9jWnpaUUpyK1JjZUk0ZDdFL2gz?=
 =?utf-8?B?K1hDQXg4V2tPa1NlUjVKa0RXUDF0RkJhZGdWK0xDeUZmdVVBVWxOSFFoZlBi?=
 =?utf-8?B?Qjc4UmE5MHlrcmVMbC9KQmdBRnpjVGJqajBkQ2tvREo3OXdYWnNmWFpCVFFY?=
 =?utf-8?B?M0s5U3l5blZYSG9UdDR1eFVQT1NuUUdxNVFWQ1RncWliSjMxYURwODlqV2U1?=
 =?utf-8?B?U25ZLzdqRVl5NzJrQVZzK0h3RGtpZnFmVXhIM2QwZytxOWl3Rm5OVDd4bFFm?=
 =?utf-8?B?WWRBaEJQSVQyZ3pQUWpJWi9yRlRPeEVjeENuWERGNWNLVmJWb2d1YjU0M2NK?=
 =?utf-8?B?Y3lrOSt4b3poMXVwRlBKL3U4ajRWeG1SUzVhUEtkZjZuQUQxNi9Sb3hiUG5y?=
 =?utf-8?B?QVdaVkhOb0JuTmdZeHprSDd6QUFORFlmd282dWRFZzBCZ1VpUWVRdW10MmtX?=
 =?utf-8?B?UlkzVXl5MENtTnNjVWpVdUROSWExQldscmJLQkc0UHFDYks1Tm1Cakp4ZTJL?=
 =?utf-8?B?SkgwTVE1dGk3eFV2M3FIcm5RK0FDTUxCRzNXWm5HVjhReW5ONkxVYzVxNW10?=
 =?utf-8?B?NWQ0RGRnTU5YOGJPQ3EwYzlpU0doZVB3aldRcGRUMzlFYlBpeHl0YnM1dDg3?=
 =?utf-8?B?RUFOQkErb3p0SEVHTWR1MWo2dExmYnpBazdKNllaTVIrVUc3cTlWcFp1TW5J?=
 =?utf-8?B?RTN6eDdiVHBUYjcrQVhqenlzK0VQa2F3V1dSV0V1bmd2R0liSFlGbkJvRjRx?=
 =?utf-8?B?T0Z4OEh6ZkpYV3JBMHlnU1B0bkgvMXdvZU9teitFUlNvaEdMSFdxeFdzNHBo?=
 =?utf-8?B?bzdYMGk5ZXVBRlFYUmFmTzR4WkhpUThxdVdVdTBlN0JNYXFDN2pNMDNRUXJu?=
 =?utf-8?B?OTA1RHNEZnJRYnJOWUdnOERHdUl2SVllOVAraTM0SWVSdTFOZ0k3cnI0ZHY0?=
 =?utf-8?B?SkxuODFEZVZKRHFhcUtjUGlXckZBQjlSMnNRb3ZEbGM1WFppeElLNThRQ3dp?=
 =?utf-8?B?b3lpZzczMnVVbXJEZXhKaldwN3VnaXU2RmR2Q24yVllJbk1vcVg0R2VlZlF1?=
 =?utf-8?B?U1luRG9LTmc5dW1HbHl1U0Z1Nm9CQzRYM0tjVm9kZkttVmtBQ1J6MFFXclZw?=
 =?utf-8?B?VndIdFVlb0FUZ2dNMUFVdFJ6dm5SWDhxcTQ5RVlaTHRYZXpXSnExMFFMWlli?=
 =?utf-8?B?d0JzYnpkMEt6NDVKKzJ4dm9tV0VORDhqN3B5NnUrN09lTnRqTTc4WTl3V3Fi?=
 =?utf-8?B?YUN0bERvTS9NQWdwbzNOdVgwQjlobTJmRDZTV0FnclFHUnRkOHpXYXh3NGx2?=
 =?utf-8?B?WnNvdy9MVXlrWDRQN1M3RXVNWjFodHp3VFE3cDc2Z2pZdzJja0hoamRDUXFY?=
 =?utf-8?B?elNpc2puZHZYMVlGMktIb2hzMnIzRVdUeTk5dHpicHRnWVNLcE1HMnBqSUNj?=
 =?utf-8?Q?2vt4EuslIME=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5969.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlJFbE9ucWRqaWMzVkdpdG1meEJidmJtTTR6T0t0R2cvUjc3bWVyV3U0Qlhi?=
 =?utf-8?B?Y2t0dmhrWk0rZFMvMk5Pc0VNU3p3dzVzbktOak1abTFxWmEybWR1Z3NmTjlp?=
 =?utf-8?B?dVFrUEhjanJFUGRjbFU3SkRaV0phMUk2cjZWLzBWa253WjVPUTV6YTRWa3N0?=
 =?utf-8?B?VTRFNVdsL25kcjUvVnVJVndmTFV3b0xPQUk3V1N4cWxDRjREVlJOTDBVWkxZ?=
 =?utf-8?B?bWNWY0xqUjZCOFp6OUpsOWM0UjJrUWoxSS9tOS9ORFFINHhIbWllekNxTm02?=
 =?utf-8?B?NVBDSFdUUENLVzU2ZWRsY1NjbmdnTkpNaUNKMVJRUjV4eHA3ZGlKeUprbTgw?=
 =?utf-8?B?OXMxdFQzb3lLd1NzTDlwbXg4ajdqOTVMcjFaVWtJV0ZZM3UwQi90MEQ2MWlG?=
 =?utf-8?B?a3VBS3VQUUp2RlR2ZmVBNHB0UklDeDRJa21ON3FTZGdhQ1BTcFI4Mm94Z0Y4?=
 =?utf-8?B?cVVyVG1BU3UvWndRcGJwT2h6OExhZDNWT1ZTL1ljdkhKeHdaRENveXNzYktB?=
 =?utf-8?B?bGY2Ry8rZ0tMYkY1NG5zTUJ3anN0aHVudW13T3NKaGpnbGR3LzZOYmlvMXBw?=
 =?utf-8?B?VCs1RUZNSytlZHZYY3JvTHIrRjczdTZXM3hGYmdxMHY4M2UwazZtMlNuTlU2?=
 =?utf-8?B?aDE3SFhlSXh6aURlSVNTTmQ2cWZNWWlaOVRHVXc0RGQwSktwYjVGb0xvTk1U?=
 =?utf-8?B?MUR6MFQwRXZLbUpCN1JVdk94K0VDMlRscWNwNlUvdjd6NUpMNmdZd2VKVkpH?=
 =?utf-8?B?ZHZ0NCtZSnFNWGc1MnpEb1NEZ2V2TERndTR0VUprRytmRFdZV0ZXUFNyZEt6?=
 =?utf-8?B?YThiWVJiM1A4L0RKYmpBZEtrUXFNdFFueDA3MEV3NVBtNk5UUVl3SDF1aGxQ?=
 =?utf-8?B?NHlReGRkRHltUHlpekZsZnY1dHBFV2R4LzdJM3c0WGpPWVVMRWNLbklqdVo5?=
 =?utf-8?B?TjV6c1NxbEtLSDFrWWlCVjVqeGdOeEpVSERObTVJWDBnQytYSG9sM3JpdHY3?=
 =?utf-8?B?bG5KUmJEcjlaM0x4cnJoTmNSVW8yMzBoSDI3SFJsYk5xMFQ5K21SRjV0dkd6?=
 =?utf-8?B?a3dvSjY4ZGUrQ3dZSEJPMWdXc1NIL3orcVZBcDA4ZGMra25QTFZhN1lSclRt?=
 =?utf-8?B?MXo4SGo2SGIvb3FPL3c1ak92VFZPdENzVktvc3lEdmJQMXRUQTNJeVAwNnA3?=
 =?utf-8?B?cEY3UXdkZDh5a2RCYnFtYzhDaU5YZ2ZXNEVtWkt3SUFjeFVPYTc0OFRzaDBy?=
 =?utf-8?B?NTRlMGNyWkMvZGpxU1k5RExRaEgxODdNSXdHejJhZTJta3YzVWc0cU9NQm9o?=
 =?utf-8?B?T21GN0UrOGxxV2J2YThpTWFPMG8rdE5SVW5GSWJaYVRRaUQxV3BiQnk4RE9z?=
 =?utf-8?B?Nmc1RGpMdkRwUHZDNmVKajVIWHh2bUp6UzBRUjhBbTY3a0N1MTgxbHVaOERH?=
 =?utf-8?B?RGJrZGlsZlJuSUFaSy9ScTZ1VlhNOU1QVnFSYWtQSGZrdHFTaDQ0MmlPUVB6?=
 =?utf-8?B?SGZxdHhGNVdlRmc0RW9KRnVKWFlmWGVLaE02cFBLWFprWFNKRTdWczFveTlH?=
 =?utf-8?B?Zlk2SDlKcGpsTjVwaUFkcHEvaXFWbnhzOEhYMUZnRzUzNktLYmlKbitxT1Y1?=
 =?utf-8?B?cExsdUlUblFGMngzWG4vNFZKbGw3ejhtamg2eHpMSno2eVg2blR2dmo1akpz?=
 =?utf-8?B?cmFvcWVoU2NOTnpsUE5ScUg1eU84RDFtMERBQ0tEOWxKN0xxM3BneTZiNFVz?=
 =?utf-8?B?Z2dUUGtuanRjU0dVQlZBdEpSdTE5MXZFeERFYUZTN2lWOXAwOTI4Snk1a0V5?=
 =?utf-8?B?VnVsaThWT2JmRU83aWQ0WVRTYmxiWDdYU2lQUmZzV1dZU3pLazNvcEtnWVMx?=
 =?utf-8?B?NFRYWGsvRCtqdzBUR3Y5TU03c1BmcldVRmY1L0wxNEFlQlU2UW9Fd0tFd3VI?=
 =?utf-8?B?T0E1UXV3THgwNVM5V2ZTNVRZVks0NnlhOGk2Tmp1QWw0NFpVVXlwYTJpOXl3?=
 =?utf-8?B?MEE5SW5kQytTZ2Z0VGM2dzZUQi82c3d1OFJHYUFQSjdxTVVldFVnb3Nkb3lS?=
 =?utf-8?B?Z1orMitXUklaTmhhUjBGM0RmUWUrSVlVSWFWWGtFOTgyUlFOR1lFUHNKd3Jw?=
 =?utf-8?Q?KK/PfI/Eep9zAbfti0kFUEIyr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7cb20e-b02b-4f4b-8a0b-08ddeaf22353
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5969.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 13:59:45.4231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNBulNDnIguxyfHIU1MgRwLTK0svYDZfdPqS/dPX6ISkkOl+RagzvN3PV6na67gj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7154
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

Hi Tomi,

On 4/25/2025 1:01 PM, Tomi Valkeinen wrote:
> Add Y10_P32, a 10 bit greyscale format, with 3 pixels packed into
> 32-bit container.
> 
> The fourcc for the format is 'YPA4', which comes from Y - Y only, P -
> packed, A - 10 (as in 0xA), 4 - 4 bytes.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>   drivers/gpu/drm/drm_fourcc.c  | 3 +++
>   include/uapi/drm/drm_fourcc.h | 1 +
>   2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 355aaf7b5e9e..e5f04f7ec164 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -353,6 +353,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
>   		{ .format = DRM_FORMAT_XV20,		.depth = 0,  .num_planes = 2,
>   		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
>   		  .hsub = 2, .vsub = 1, .is_yuv = true },
> +		{ .format = DRM_FORMAT_Y10_P32,		.depth = 0,  .num_planes = 1,
> +		  .char_per_block = { 4, 0, 0 }, .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 },
> +		  .hsub = 1, .vsub = 1, .is_yuv = true },
>   	};
>   
>   	unsigned int i;
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 5af64a683dd7..fceb7a2dfeb4 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -415,6 +415,7 @@ extern "C" {
>    */
>   
>   #define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
> +#define DRM_FORMAT_Y10_P32	fourcc_code('Y', 'P', 'A', '4')  /* [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian */
>   
>   /*
>    * Format Modifiers:
> 

Thanks for the patch. This looks good to me.

Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>

Regards
Vishal Sagar
