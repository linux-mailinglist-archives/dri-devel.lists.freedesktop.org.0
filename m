Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA64495A634
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 22:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3550810E6E4;
	Wed, 21 Aug 2024 20:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sCx12hrR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2053.outbound.protection.outlook.com [40.107.100.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFFD10E6DD;
 Wed, 21 Aug 2024 20:54:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGHkHHZCMnog15K0ujQHAYp6sY+O+wr7SZp1pXr203CroArePyuHMll3ByJnZVLSVwFKJydmxoJmd3PyoBQWzhAN5mvWu36fJ6abAQyLCZ/Q41eDUfXzp47sl/mpv6a7CDAgOZOVl9YdAgKFCzij3EHbfnm/mGPive4I6B0NG9e3+kMb/bORyFpRzJJK/EoL7UTkGRrayRSOmjSNHTD62GZJRyzlLSuXAc0Qqg9iWolX7mhOOiSJuRpHL/7hfP05sa4DXmXhWYUkDlTclBAvhDhOUS0iujrk6r7KWh/ExHwi08yVqKGNiI+H/MrhkClWvi426NgA5kmzJCIvayzlRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaVzaqsovMuqUV/UmnOxDTVt0bTe0KOJMlkw/zGkr1s=;
 b=UAb+Tc4stW2fQ8JLWJeEl9tsD0hNgZ4QK/Ya/zcAR5MGeKhNsRhMKY272cY9reWKrJMDUhCxPmXVz+Rtyu8uREUMnrcyuaTHdd3qXi5C1xFEa1VIysGMkq8Qy4bDxJCyWCp0lArIMaheeaUcnIesZ0p0GiGGWuka/ck3LThcagkO2TzbjhOQyoji7CqAIpqjagAw+WsQd7aYEF0wioOFfXw04lOxy80GZyC5S3HyvB7Ws8suwf0Eh0ppC7+2Gz0CS8Dry08t2M9DxWD6ef1+/4nYdZyEiK/ujdV6s4lQdvoLWF4VxVW+yGzoiYbaB8eOR6lF3gExWd0SKaPG25POgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaVzaqsovMuqUV/UmnOxDTVt0bTe0KOJMlkw/zGkr1s=;
 b=sCx12hrRGVffFTU3MJ9PNPm24SX8/jUV0P5d11GNYrRufI/Ux25jsfFVCwqj6wlr2QIlrCEQqb5bQJhQq3PEwif9daton/pJGTnWeCKfVJMuzGxQu9vtpFtaMFLDBDyFfjwo30M+06eHz0VLQSgOCMvdTINW5SKDco1yd+ZHZZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW6PR12MB8707.namprd12.prod.outlook.com (2603:10b6:303:241::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 20:54:49 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7875.016; Wed, 21 Aug 2024
 20:54:49 +0000
Message-ID: <647ee875-f932-46a9-b4e2-fb037a548754@amd.com>
Date: Wed, 21 Aug 2024 15:54:56 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] drm: panel-backlight-quirks: Add Framework 13
 matte panel
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>,
 Hans de Goede <hdegoede@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>,
 linux-doc@vger.kernel.org
References: <20240818-amdgpu-min-backlight-quirk-v5-0-b6c0ead0c73d@weissschuh.net>
 <20240818-amdgpu-min-backlight-quirk-v5-3-b6c0ead0c73d@weissschuh.net>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240818-amdgpu-min-backlight-quirk-v5-3-b6c0ead0c73d@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN1PR12CA0110.namprd12.prod.outlook.com
 (2603:10b6:802:21::45) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW6PR12MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 01287c21-f00e-42e0-23b8-08dcc2237ef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXA1TzVyOVhNNGdRWitudUlyUlA1ODRxOU1pSzJIa0xkWU8zaGJmbCsxMUdv?=
 =?utf-8?B?RVQxbThkb2QxS1hiR0xOWXd2d0pIdFNrMGowcWxsdCt0WTRkQVZRVVVUcDIz?=
 =?utf-8?B?ajVCRW1JREtnUUd5NU9iOEFnZlBWeVpoNHAwcWlabUR5Sk9lVW9QWGtFODNw?=
 =?utf-8?B?Z1JZTW1GaGlHUmRvOWpiY1lkTTlwK0I0Z3ZCWXJ3NE0xZHgzZTFXT0N4VGRK?=
 =?utf-8?B?Vmw2emhwa09qa01XL2d0SFhIS3pPcTRmaG1XRllGMWxhQnJ2YkVSM0h5NUhU?=
 =?utf-8?B?dHoybnQvUjQrNGhXZWxNWnBUSjhyWEtPS2cyd0F3VU5YeWZmdWpua3BtK3dX?=
 =?utf-8?B?ZGJ6aDFKdk8zbUR5amVQMFl0bmJxeWhDcXgxN01JZFBVTVMxTGpSSjQwaVBx?=
 =?utf-8?B?anFLRllXckdVamVHblZrSW8zMUY5ajVGbkdqT1RvRTcrRzN6YWJxdFl6R2JB?=
 =?utf-8?B?bGpaSXpuSmZtQ2F5TGY0TXBlQkwwWVo0UG93cDNQMU5RSmhlcU5UN2ZDbVVZ?=
 =?utf-8?B?Nmw0RjJpZmhPazJyNEhTMVo1RzRwKzcyUFpiL0x1bkt0eW8vRSs2K2N1K3R1?=
 =?utf-8?B?RGUzT3BFNjVKSGRyQ28zTzlod09zbW9wNHZLSC8rTFpYOE5YUFk0cmYyNzRl?=
 =?utf-8?B?dnJyYllrWjkrQWsvWnloaEpZSUoxSTBLOVh4Ry96dFg4c1BGeDUzWE5scVNh?=
 =?utf-8?B?RWgyUWtxWUQzV21pTDlhaS9HaVB3OTlYajJwckNIWEdCQXhvV2ZEMEJ1WHdV?=
 =?utf-8?B?c2l5OCtNbVhCK3lUTDBXZ3A4a3hKYUZJS1FsRGdUMWxxR3BhN2JXWTBDRFhX?=
 =?utf-8?B?b21tMVF0bjZ3eUlPcmlKL2E1c1FPd080ZVFBUDA4RDJId2ppTVdtZUFsSU0r?=
 =?utf-8?B?Q3djcTYvWUtscThQRWlIQnZNWWVYT2d0L2V1ZjFYdTd3VzRKTU5ha2haODZn?=
 =?utf-8?B?UmdNMVJyYjMwS0NTS1J6ZHpKQlN0aUpkTmV3S2NObEo0eWhOUGIwNHFCSUFP?=
 =?utf-8?B?WlZ0NHRaQ1l0OUNBYlRWYVl0RWRSY3lwTWJFM0NrTGhPbnQzcGh4cnlDT1RQ?=
 =?utf-8?B?aUw0ZmxTelZhTFI3Mnc5L2k2WmdSNUdhVE1GcC9GYVl2cThBTGZJRElmWUtM?=
 =?utf-8?B?dW1oYWhGUU5pOXhFNTAxcTFoTDNVRHAxcGlVWDlXUGxnNTNTbXVudldydDdt?=
 =?utf-8?B?TmNZU3lQbElpU1p1cEpXaURoazBaMHNXRWJFZjhlanJXVTJ2NVZkRFA0dVd0?=
 =?utf-8?B?ZVpDYnR0ajlNc1lOUU4veW5FSHJjWjdSNGRNdlIwT1VvNXBKRGxLTkk4NEVt?=
 =?utf-8?B?bkl0MUd6S24zTCtsVDM2RUY0MFphTFBTQlE3cjljaVdpNXRJZ2ptTDdzckVq?=
 =?utf-8?B?V3NLRFZQL0ZDSlRIVlJvY0RsNndKOXFzMXlwUXEvdW1XaEZyWGliMlgxN0Z2?=
 =?utf-8?B?eG90Y1RZZ29sSjUxUnN4RFdSazk0RVVFUDNmWTNEMXlCbWZUa09ZVEVrSXF4?=
 =?utf-8?B?NFdsUC9BSUp1ZEdpdnNob3RFRDQyUWp3V3k3QTJpTUh2bHRadlZLaFVvM2Vk?=
 =?utf-8?B?cmplam5IdWUyRGlvbjNNZ0E0WE1VR2k1WTdBdFFYN3hMRTlVRVVMbVI3TERG?=
 =?utf-8?B?SWpxV0l4cmpoNklYZTFlS3U5YmFwR2FTVWJwbTROckh3T2VWWWRHSmoyMThW?=
 =?utf-8?B?cDVUMXpOaTlhczdMTmtKdUFxRUYwdUtIaDFpUCtVZ252T2ZGR0ptenFhTG13?=
 =?utf-8?B?WnFybm4wZ3Zya0xFSm1FQk1acmk2SzJvYVc2M003bEFZZkZxSE5CT3dMMTB3?=
 =?utf-8?B?VFdEUXBpbFpEQ1J2ektDQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3lZNFQzNVhlVHh6SkdaZHkxL0k4Y2J0cmtZa0Z4NFVJYWdSR3dPNmoxZm14?=
 =?utf-8?B?czd6VnhiSVgrTlRSUTluK1RlYXIvaEhqN3Z2ZDM0eWdNNmlhd3VrRm44UmRa?=
 =?utf-8?B?V09ySkJrdWZCZnEzTThJNERCV3BTVXRaM09sNS9qUncwNWVhL1lHanBrK1NU?=
 =?utf-8?B?K0wyY0Q0SktxRTJ5SE5GeTlJUEVBcmlWeVpvVlNraklQK1Zvam5KbURYSytW?=
 =?utf-8?B?QnBmcDZIaDcrY21IZlJTa3A1Z3lYWUNBYkU4dkxJcHpYd0pIVjFNbXhsWllP?=
 =?utf-8?B?c3llNktNWWp4ZVlvTS9LZTVrSm9jTXpEWjZwbElqZUk0cjBqeHhGWGZFQWtR?=
 =?utf-8?B?cFgwZmJ0SVo5Y1YzL1Q0WHZZbUZiMUI0SGNXc1J0bXZvdFFyUkM2T2xEVGQ5?=
 =?utf-8?B?ZVhvZDhVUmxaOTRGSEJyVElKRlZpZGhCOWVHMUJ6ODFLTkZwZ1BmNjIrbjlN?=
 =?utf-8?B?WkZ2b1VZV29UV2JTcm45WFBveVl2MWRLYkMxUUU1S2xoaXA2NmFZZGdZek9U?=
 =?utf-8?B?SW5mOWV6UHNhanFybXEzaFBNTEpmTERpYVk4NWNNbTlONFV4eitSaGhLRlpY?=
 =?utf-8?B?cE12OGV6eTFUeDl6ZjY1VzRqbm9uc3BQZjlrRDYvbVdzVzZ1TGxreW9LMGZa?=
 =?utf-8?B?S3RNMUI4TlhrOW85RUVmai9COTUrWWxjRk16STd3UU14ZjhDNExHL1JzYmpV?=
 =?utf-8?B?RVcvMTltNzJjQUliUmhPc0puUk1MS1FXUFRzK1JoQWpDUmZaNkJiY2NkeEh0?=
 =?utf-8?B?dWNpeldMU3liUStlanNibjI4aXRhRFQ2VTdhcVRDakhtZDdjWHZhSVVQTnZ5?=
 =?utf-8?B?QzVyRTJhblpONVJDUS9oMDJBN0hYWVVYM01nRUYyNUkzUkxhMVgwWXhCM3Jh?=
 =?utf-8?B?YmU4SlI1UFpDWHhCd3BYRkUrT0FPVkIrY1RQWmNEYlBmRFlYQndMMXJ2OFRY?=
 =?utf-8?B?ZTM0MUovY0J0T3NCYllRNWpNZlE2dkVFM0RlblNuMTI3a3Bkckc5cUtkN3pZ?=
 =?utf-8?B?eTJLbDNzcW9PY1k4V0Z3MHIzL3Fjd0FvNWJVbVhoazJqSytRakZCY1FTVThX?=
 =?utf-8?B?VXBMdW1lOVVYNHZPTEEwSnFnb0U2MWg1NE16cG9HbGlyZXhVSDNxUi9NZys0?=
 =?utf-8?B?NDNwblpoYVpYWHQ3OWFMbTZVdlQzR1p5aUduTmhrREdqTkdXclZBYTlTaVAr?=
 =?utf-8?B?ZmdxZDVoUXI4czNmcE9pVDdHVXZKN1VoMmtObjRhS3I4WjVzVlphZnNydEZY?=
 =?utf-8?B?anZmeDJOaTR2TUtGbVBjeFY4Qkc5aHhYR2xJWmt3UTg0WGxmTnl2ZHQ1NjNt?=
 =?utf-8?B?MkR4OW9sNlNwajk5ODhjSTliU2ZjRm1rTzZuTFRsTmtHNDVMK2JXZHU2WXBH?=
 =?utf-8?B?Y0pET2pqc2lYcWs2NkJGTDhHYkJvVCsxa3VxSm9CUCtnaGtneGYzSjFGWkVz?=
 =?utf-8?B?dUhXV3lRVVpSOURXT0dGSWNKKytvUzNCWkZMSWkzblpsZGF1YjRuZW5WTzU4?=
 =?utf-8?B?UnZUWTlOSG4xTzlMc1NBbjhacG8xZFNMYUhqMkYzSFVEdWNpVHBGTXd1M3JP?=
 =?utf-8?B?M2Vxc0VodEl5bXd3VnhWQ2xKV2l5dTlmYVRBcE5zR1BVQkRJajVnY21ibkp6?=
 =?utf-8?B?azExek14OWp4L2tYUGtpUFVtTnRjdW5kdzFOeHFqT0FYZlREV3lkMVpsZFJl?=
 =?utf-8?B?SFNRUGZWUkJHczBNeWJ6MXRsMnNZU0o1aVpueVdYQjlXUHdsQitNZGgvQzVv?=
 =?utf-8?B?RDF3SHlORXplU2UrNC9nZGdCOHFSaEZLSCs4cVdFa1pNZGd0Nld5MkZJSXJx?=
 =?utf-8?B?WkkrTXVYWXdyWXNPSDRwNTNJaUo2UXNQZ25hU1ZDSGpDYWsrdGpwZ1dQNnFo?=
 =?utf-8?B?M2Q0U2FvYjE3S2dlUjRTK1FUNHVJSkRUSE15NVZiZXhaeUFUWHdRNDFKc1Zh?=
 =?utf-8?B?WkdjbUtUL2JEOC9EV21aaXNCa0EzV0d5Y3RPWFJtOHFBRkZ6QkM3eW16bEhy?=
 =?utf-8?B?eDgxc2pKY1gyYldRVzdSSEpDTWR2cFBERitLUlpHNmhIMEd6OWRsZXN0VXFw?=
 =?utf-8?B?d25Wb3k0clBPQXBzNDdRY292NDI5V3VpSDN0eklMNUZNa2poMWZveXhPUnFP?=
 =?utf-8?Q?HMAWHMiWcJFuvVzd2c4CfKJ8p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01287c21-f00e-42e0-23b8-08dcc2237ef3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 20:54:49.0651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3BSxnPxt2D5vQKPLYdiC9usYawb+6mg3gEvIBuPWnnDJE+omNYl8Z2Dow3Ys6895jwbp+cRv9yYNCw0jOnhBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8707
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

On 8/18/2024 01:56, Thomas Weißschuh wrote:
> The value of "min_input_signal" returned from ATIF on a Framework AMD 13
> is "12". This leads to a fairly bright minimum display backlight.
> 
> Add a quirk to override that the minimum backlight PWM to "0" which
> leads to a much lower minimum brightness, which is still visible.
> 
> Tested on a Framework AMD 13 BIOS 3.05 with the matte panel.
> 
> Link: https://community.frame.work/t/25711/9
> Link: https://community.frame.work/t/47036
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> Tested-by: Dustin L. Howett <dustin@howett.net>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/gpu/drm/drm_panel_backlight_quirks.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> index 6b8bbed77c7f..f2aefff618dd 100644
> --- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> @@ -17,6 +17,14 @@ struct drm_panel_min_backlight_quirk {
>   };
>   
>   static const struct drm_panel_min_backlight_quirk drm_panel_min_backlight_quirks[] = {
> +	/* 13 inch matte panel */
> +	{
> +		.dmi_match.field = DMI_BOARD_VENDOR,
> +		.dmi_match.value = "Framework",
> +		.ident.panel_id = drm_edid_encode_panel_id('B', 'O', 'E', 0x0bca),
> +		.ident.name = "NE135FBM-N41",
> +		.min_brightness = 0,
> +	},
>   };
>   
>   static bool drm_panel_min_backlight_quirk_matches(const struct drm_panel_min_backlight_quirk *quirk,
> 

