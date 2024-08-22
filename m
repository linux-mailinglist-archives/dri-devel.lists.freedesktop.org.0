Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDD595AFB8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 09:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3C510E154;
	Thu, 22 Aug 2024 07:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sO6Eq+hQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD9010E154
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 07:56:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9VxRKe9dDq/55r44btPVLZqJpshN14ibjLTsbUA1roHSwDk6+/brnvlbGskbqCFzLBu7i6g/aUn/fwohVMYGYZgHdLNnsBAGcWoAcaMFqdGc2mAQylkD5d1aUwEcCePFk/ml5cKTONxvJygDvT90XNxjgaz2Fc0h3+Ych2YMUy3LZnJxivn7CE9w2lIeNOTkCoyS/jujAXqqLu7XCxDaKT/TS9xaRK89MpGPjdK4dJjc5jKiJGwwuWuyiooI2mF1Ryo6yxdwQARMdwyh327pvx4M21rPbCuaDs3P6Rnx1JvMqXROxlnSOabgT8S0/cO2N2ODy29qJCoaWJnOf0i+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvzoB3gyfZIyEwW+IeN/yC7DEZr9WYIcGaT/ZvFv/58=;
 b=AYuei4KmxMULz9MzZZVTRboWU+uiZy4UOSi2hwoD4v6BGsqdWk2TL1DULQgo2dthv4/WrH27UYxnfcVJT+Cpv9VBDILYCA+oad4HUGBwJn7c+gASd8cw6w38209TPFGxu/HuJb0J2N/l0sxEfb9sVJb2SH7Dt6QATGswdUrMdMGrgoqeUaAaAIsP7dIpD1AmA3KmlgCu3iNtpUiuBIPiv/RsyJWGfciVi9hBm7YPDqlDkL7BBBi+7GnAlUORmfbDEE/4MNol4oJHNC6k635gumzS4ufVShtA9NvCCm0k6NO/Z+SXZUd+2lCsTfNXyp4lM8c9UxRI3/ZApkiokJRINg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvzoB3gyfZIyEwW+IeN/yC7DEZr9WYIcGaT/ZvFv/58=;
 b=sO6Eq+hQ0a8OjLpudhkOZ3Bvwxh9iNgI3wDpaEMwA7cQf3JXuibaX2T+2lR9gp/2TyWjuB84sUttIrItESsDsgR5tHDmurabc6SH6EBD9lWt44LOrlVrAGVWCuIEaxlLAznQA9E5sAWy0y9X07Xwo599uOsCuf9eZg4rE/xj1X8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6232.namprd12.prod.outlook.com (2603:10b6:8:a5::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.25; Thu, 22 Aug 2024 07:55:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 07:55:56 +0000
Content-Type: multipart/alternative;
 boundary="------------uIR9jSYjZvgKCSpqEY0cHhs7"
Message-ID: <8b479754-ea3f-4eb9-a739-26ee38530a23@amd.com>
Date: Thu, 22 Aug 2024 09:55:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 David Airlie <airlied@linux.ie>
References: <20240710124301.1628-1-christian.koenig@amd.com>
 <20240710124301.1628-5-christian.koenig@amd.com>
 <Zo7QpJKtVNw4RvUd@DUT025-TGLU.fm.intel.com>
 <14b70a4d-dc65-4886-940c-ffc1a8197821@gmail.com>
 <77995ffc6de401bc8ed2f4181848dffb18540666.camel@linux.intel.com>
 <20bceb24-8cae-4f0a-897e-326dbf8dc186@amd.com>
 <7d3c647a2df19aa0f8a582b7d346ba8014cf6ca3.camel@linux.intel.com>
 <ZsNTTCfBCpZNrSQH@phenom.ffwll.local>
 <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
 <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
 <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
 <d065806d-1d72-4707-bc5f-4da311809295@amd.com>
 <13a47d22fb6753e20046a983126c6fea675beed2.camel@linux.intel.com>
 <006ba26a-48ed-43e7-8213-72ca0ae553e1@amd.com>
 <fe3a72942e558af26f1b2794f946920a33d316ab.camel@linux.intel.com>
 <e3716526ae9b530adddc815ca12c402b4cf7678b.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e3716526ae9b530adddc815ca12c402b4cf7678b.camel@linux.intel.com>
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b7fdeb5-f000-4926-e580-08dcc27fdad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXRPaVJzdUpqN2xldlo0cDhpVEh0U0xpcHlJcitVL3c0VkZzRFZzcDBOS0x2?=
 =?utf-8?B?cHRldnpmdVdtRGVDckpwMGRTZnJKeEJzbFNKNXVoMnhjYUptNzJobjhBZmh2?=
 =?utf-8?B?Y3VnOVhhQnpKdXBjRmY1VmdCOEE5eXo3L3RXeTNiWllVRHREVkttd0RLQWxz?=
 =?utf-8?B?V3JzYS9qRTdvbnV2N21ia3Yvb0xiQm1SeDQ1cWVyMCtSQWd4dGdNbFNTMllJ?=
 =?utf-8?B?VzZQZXlKaE5RR2FnOENSMG9oRkEzZUJBQ2g4KzVyWlcvWHFZQkFJOHJxYkZU?=
 =?utf-8?B?djNnOCs5L2tKUEw2bjNNUDJCUzBkS3hPa25rSmpQZFcrZllCSTVoOGNNbFJ1?=
 =?utf-8?B?M2dFT2tTVWYrYW1GY1BzbWlpbUZ0YVJnS3BSZlpjOVNMWkhRVUdSVzRiNXl0?=
 =?utf-8?B?bnhjMGJZd21Fb1piUVc5SW5CSkwwamRLcEIvL1FzYWRKWFJJb092SEh2VWlC?=
 =?utf-8?B?V0lEUUFEM3VJSmFhRXZCZFVMTUFuTmJnL2dQcVlpcDUvc3Q3WkRYbG40Rnlj?=
 =?utf-8?B?SGdVZWxpcUNtRHdaQXora2g0aVhTbU8vTmEzajMyNjNFT0FUZXdiZzY5bzlT?=
 =?utf-8?B?aXltTDRlTTRQOW15Z1cxQXBON2ZzUmZiRUVUQ0JuY3ZycWxsTUZFYkRsUy81?=
 =?utf-8?B?enJGNjFOdncxeWVaeUtSVmJwTzZlTWJ1OVRLWEx2czM2bGhUQlZTbEVXaDZO?=
 =?utf-8?B?dHVkcHRnYVR0UldCOUxEbFNDUE9MU01QL3FmQVMyQWY0YktKMWxFaC9wM1VB?=
 =?utf-8?B?VndKQTVLeFFZNlRMVWhqZmNTVEdEbGVEcGtXcGwxNmJvNVkwMXlGMVFEUndS?=
 =?utf-8?B?YlQ5aTFzK2dXcW5kTTFlQUZSUDBkbzBiYmxQU01MTEszUEs4RVRiZTVvRUht?=
 =?utf-8?B?aUtKdll5NEcyL3hLaUdjZ2dUQm0wRDJPUmZPbjhTajFGNjluMFR3MkxIVkxn?=
 =?utf-8?B?K3ZEZ2I5TGZWeWl5V1NoVHRNUGVvMjJabWNPRkpOOHR3UDVycjdxOE9IRG00?=
 =?utf-8?B?UDRRcC9QNEphVmFYMVF4OVlBR3B3YzAzSTVrL0xaZlFxU2ptMHo3MitmWnBr?=
 =?utf-8?B?ajJydTVZcGgxTElCSjNENHFuaVo2MVV4dCs3eWF5ZnFKMUhQNDBkRHhwTkti?=
 =?utf-8?B?eUthYjYzTVpLeEFIM2p3Y0taSlliK2NoWmNET2U5eFo5amRndXZLQUNqeHJ3?=
 =?utf-8?B?MUt3cHhBcWoyVW1lbWkzeElQSmg3RVN5MjBtUkZ0VHUxaVk4Y3phcE42YUZh?=
 =?utf-8?B?c1N3SEhNL1pLTlhVVkJ1WTczVmRYd0NjbEpacjMraG9rY291d3BrRXYwNm9h?=
 =?utf-8?B?bG12K0dPbzlNbnFtb2VtbTIwUStVdHVmQ3ZyK1RIaVBKNSs2S0hoczV0WmQz?=
 =?utf-8?B?b295UGsyVEhoY2JxUDY0Y1ZXMHFia09Dc3hqOWpGd3dkOTBIaWFKMk5KRzE0?=
 =?utf-8?B?cmY2QkJIRVV0QzFvZWp6ZjhmZDl4YnNLQytuZHhPUjQ2T2VzY0VYVm1hLzdC?=
 =?utf-8?B?WmhhSEFyTU5raGZ0UmY4bGIycUh1YmR5NjhodmpxS1J3ZXJuK0lGOHYyWTYz?=
 =?utf-8?B?K3JCYzluRGVrcUFLMHpQUXRLMjhDUjIzUWNGcVMwdFpZY0d1YmVkdG1CcEw3?=
 =?utf-8?B?WTQrNHgxalpWQ2ZreFNNNzlvckZoai9yRk0wUzkxUjZoUEZIMENoM3UySmpq?=
 =?utf-8?B?eGxoTXFZUWoyWExMdG0wT3c0aHpyMEpuQlRNU1dxMi9rOFUrVHhmVkRmbStC?=
 =?utf-8?Q?mx5qbtmpCZkG7cQUe4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTREWUtXY2w1WEZoekFtTFB6OU1pdy9yaTZ6STF4Mzc4TEVVYldpMVRYNmQy?=
 =?utf-8?B?Tlh1TGNhbHRGcHJVTW9XVXErZGQ1VHVQcE5jUG9HVithdlVDNFhkZ0ZhRHNU?=
 =?utf-8?B?WFhjQzBFLzloYTZGN3haMmpTVDhkSVIrclpuRGZyNU1ybldzYWs2VmprSWJi?=
 =?utf-8?B?MDZTSk82U1ZoaUs5aTJVNHV0LzZQZU5wQ3FBeGJrUmpIVlVLN2xTOThZa2pL?=
 =?utf-8?B?dlBuMENDY0thZW5jVFpYWnNUZGkwWkNvbzVCd2pmcWR6c211aytYRU0zbm50?=
 =?utf-8?B?NVQxV0ZxS3FCNkRBdVA5VFJ6bnM1Z01ldGZZOFdMME5KUDBvcW5OLzBmb0t3?=
 =?utf-8?B?RUxLNXpqVG8xdnE4U21pNmw5bmpZcXJTRW05Uld5VThyUGQwT3JoNlFBUkVm?=
 =?utf-8?B?REUzNVo5TkhvTzBqcFovZmpmb2t2akFtaXBJaWJtb3c5dXJQbit1WnRUWXUv?=
 =?utf-8?B?N1o5M3dSTm5WNFdZL1k2b2ppV1orSXQ5cjRXdW5tbmhGOVJyNHgwTXc4L05o?=
 =?utf-8?B?TjU2K1ZVYWdvUDhPaldQeXBmdjF5SlZxbVBNRXZWUG1sc3dSdk5CWnoxV3pI?=
 =?utf-8?B?WURlSGhIazN1WS9sTWpnLzFmOEl5WExUKzd5eC95M096Z1F5eWZJeWlDdXla?=
 =?utf-8?B?bmR6cWdtd2tEaXBvNEN1NlY1Wkl0cVVGeTcxL2UwRUNhZTk5Z0F6OU9hZjVz?=
 =?utf-8?B?UDlsSmlCK1YxUFdSaHJ6Y3d0cWppK2xBbzYzTUY0ZXlRSXlrcFZFMUpHcFps?=
 =?utf-8?B?clhWdnphbnNOMmJkbkVxbS8wbGdwRTAzQWIyMXFYNjRVNUZPSmNEOFRybGwv?=
 =?utf-8?B?Uk5MZ0xiR3YxYzNCdDlNeVpoTVc5eGZ4NGEwc0d6ZmJRSUZjcjJOT2ZHK01n?=
 =?utf-8?B?eFRmWjRGK2dOVFlwd25UUTMyMGxtYitmUlhRc0lvWWNQWUFINFNLMzZnd2NL?=
 =?utf-8?B?TnpoRFJoLzlPNWJqWUYxd0hGVDIwU3MwR3pDN011VDRtZ1VVSTlqdFNLU0lQ?=
 =?utf-8?B?TVljcmFIcVBpNnIzdU40ckJCeWNzeVdHUEkxOTFXbTg0SjV3aThDVjltYis4?=
 =?utf-8?B?eXlucmJnY3VwaVJRVUdkVkRQcTNmMEVjRGNaTG5OTXVQZWpqckFoWTlTbThm?=
 =?utf-8?B?SUQrNTBpa0VlVmtwS1pmclR4cWxJRE9aVWxMYXJpeXdIVjJlTnJHQklORVBG?=
 =?utf-8?B?MW10MFJDbXdmTnZCZUxzbS9PdzlSc1Zmd0JsbDhaMHNtTHJXM2R6djYwT1V0?=
 =?utf-8?B?QVZKRWQ4dmlQWkNhU2pqWEttWEJ6TDFBWnJtVXRGamMxMjQxei93REN3WXZN?=
 =?utf-8?B?MWZnS0plcERlc0VZVURJVzVIQjhMb0tnTzlPWFg5eVFvOWo3QU1iR0YzWHJq?=
 =?utf-8?B?RDBZaTBLcFc3QUlCQzIyQmRtdFFqa2pPWUdPc0ovMGR6VzVxb1I2anlQTnpr?=
 =?utf-8?B?NjlJZHQ0RTRvV0FhY2RIQ292SUhvbk5EV3QxUFpaNkRac2tqc2h4ZXJnUkhI?=
 =?utf-8?B?YkRkUWM4RUxGYTFubVoxNmlFRGRDN3ZCTDhGb0JKOWVrem92UnBTdEJNWSt3?=
 =?utf-8?B?V2MrL3JucURqeEZNbjdURXpuajdDZTVvaHVJSmpCUlRCeCt2N1JTYlFiUkNX?=
 =?utf-8?B?RHJHTDlZZ1lLcTNRWGdpdGxJM3BoUEprNzJnOWJCN1VpQjlsRUcyZ3BMbWxS?=
 =?utf-8?B?Q2JTL2tKOEh2S2ZVdGd3V0xhbVNTZmRaYXkyMTUwRjdaMFRCUGRXVXdXNWpY?=
 =?utf-8?B?dnVNd3FwQm1wYUJuTW5pRS91TXQwaDliamQxZWVlNlBvWW1CYnd3TXh3dGpj?=
 =?utf-8?B?QzBLMXpWcHdha0FuRWdiSXlRZ0ZENm9XVVBrWGFLV1pPVXlaM3kwWEdrdzdY?=
 =?utf-8?B?WEZXayt4Ty8zendsS0ZxbFRHM3E3NDRjdDRrRTh4a1ZUNUkrcWFJMVZHd1V6?=
 =?utf-8?B?OEU1TlpjYUpSVkFReDJZOVVqVTlRUGJUSHF2M1VjR0ltQk5qeEFCYmE4aDFJ?=
 =?utf-8?B?aG1hVjgwalE5YTdnUnBsVFV6bnNJOVc3TXVVQVRqMW1nc2Y5YVZqNzJFdy9y?=
 =?utf-8?B?Z1IwVEFVVXVBeW5wZ1ZvS2Y4Wmp4VWwrVm5kTHNRYVZKY1pjR3hGQ1MvWGth?=
 =?utf-8?Q?35j6yuzNZF6iBXeCE+bw8TZq0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7fdeb5-f000-4926-e580-08dcc27fdad7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 07:55:56.8824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IE1cUNj6nVZ8MTOZgNAu/Tw3CXxeWKEhG0v5dkbRV57n4TPzWEiFYtJAkOAflvI8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6232
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

--------------uIR9jSYjZvgKCSpqEY0cHhs7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 22.08.24 um 08:47 schrieb Thomas Hellström:
>>>> As Sima said, this is complicated but not beyond comprehension:
>>>> i915
>>>> https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c#L317
>>> As far as I can tell what i915 does here is extremely questionable.
>>>
>>>       if (sc->nr_scanned < sc->nr_to_scan && current_is_kswapd()) {
>>> ....
>>>           with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>>
>>> with_intel_runtime_pm() then calls pm_runtime_get_sync().
>>>
>>> So basically the i915 shrinker assumes that when called from
>>> kswapd()
>>> that it can synchronously wait for runtime PM to power up the
>>> device
>>> again.
>>>
>>> As far as I can tell that means that a device driver makes strong
>>> and
>>> completely undocumented assumptions how kswapd works internally.
>> Admittedly that looks weird
>>
>> But I'd really expect a reclaim lockdep splat to happen there if the
>> i915 pm did something not-allowed. IIRC, the design direction the
>> i915
>> people got from mm people regarding the shrinkers was to avoid any
>> sleeps in direct reclaim and punt it to kswapd. Need to ask i915
>> people
>> how they can get away with that.
>>
>>
> So it turns out that Xe integrated pm resume is reclaim-safe, and I'd
> expect i915's to be as well. Xe discrete pm resume isn't.
>
> So that means that, at least for integrated, the i915 shrinker should
> be ok from that POW, and punting certain bos to kswapd is not AFAICT
> abusing any undocumented features of kswapd but rather a way to avoid
> resuming the device during direct reclaim, like documented.

The more I think about this the more I disagree to this driver design. 
In my opinion device drivers should *never* resume runtime PM in a 
shrinker callback in the first place.

When the device is turned off it means that all of it's operations are 
stopped and eventually power to caches etc turned off as well. So I 
don't see any ongoing writeback operations or similar either.

So the question is why do we need to power on the device in a shrinker 
in the first place?

What could be is that the device needs to flush GART TLBs or similar 
when it is turned on, e.g. that you grab a PM reference to make sure 
that during your HW operation the device doesn't suspend.

But that doesn't mean that you should resume the device. In other words 
when the device is powered down you shouldn't power it up again.

And for GART we already have the necessary move callback implemented in 
TTM. This is done by radeon, amdgpu and nouveu in a common way as far as 
I can see.

So why should Xe be special and follow the very questionable approach of 
i915 here?

Regards,
Christian.


>
> /Thomas
>
>
>

--------------uIR9jSYjZvgKCSpqEY0cHhs7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 22.08.24 um 08:47 schrieb Thomas Hellström:<br>
    <blockquote type="cite" cite="mid:e3716526ae9b530adddc815ca12c402b4cf7678b.camel@linux.intel.com"><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">As Sima said, this is complicated but not beyond comprehension:
i915
<a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c#L317">https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c#L317</a>
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
As far as I can tell what i915 does here is extremely questionable.

&nbsp;&nbsp;&nbsp;&nbsp; if (sc-&gt;nr_scanned &lt; sc-&gt;nr_to_scan &amp;&amp; current_is_kswapd()) {
....
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; with_intel_runtime_pm(&amp;i915-&gt;runtime_pm, wakeref) {

with_intel_runtime_pm() then calls pm_runtime_get_sync().

So basically the i915 shrinker assumes that when called from
kswapd()
that it can synchronously wait for runtime PM to power up the
device
again.

As far as I can tell that means that a device driver makes strong
and
completely undocumented assumptions how kswapd works internally.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Admittedly that looks weird

But I'd really expect a reclaim lockdep splat to happen there if the
i915 pm did something not-allowed. IIRC, the design direction the
i915
people got from mm people regarding the shrinkers was to avoid any
sleeps in direct reclaim and punt it to kswapd. Need to ask i915
people
how they can get away with that.


</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
So it turns out that Xe integrated pm resume is reclaim-safe, and I'd
expect i915's to be as well. Xe discrete pm resume isn't.

So that means that, at least for integrated, the i915 shrinker should
be ok from that POW, and punting certain bos to kswapd is not AFAICT
abusing any undocumented features of kswapd but rather a way to avoid
resuming the device during direct reclaim, like documented.</pre>
    </blockquote>
    <br>
    The more I think about this the more I disagree to this driver
    design. In my opinion device drivers should *never* resume runtime
    PM in a shrinker callback in the first place.<br>
    <br>
    When the device is turned off it means that all of it's operations
    are stopped and eventually power to caches etc turned off as well.
    So I don't see any ongoing writeback operations or similar either.<br>
    <br>
    So the question is why do we need to power on the device in a
    shrinker in the first place?<br>
    <br>
    What could be is that the device needs to flush GART TLBs or similar
    when it is turned on, e.g. that you grab a PM reference to make sure
    that during your HW operation the device doesn't suspend.<br>
    <br>
    But that doesn't mean that you should resume the device. In other
    words when the device is powered down you shouldn't power it up
    again.<br>
    <br>
    And for GART we already have the necessary move callback implemented
    in TTM. This is done by radeon, amdgpu and nouveu in a common way as
    far as I can see.<br>
    <br>
    So why should Xe be special and follow the very questionable
    approach of i915 here?<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:e3716526ae9b530adddc815ca12c402b4cf7678b.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">

/Thomas



</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------uIR9jSYjZvgKCSpqEY0cHhs7--
