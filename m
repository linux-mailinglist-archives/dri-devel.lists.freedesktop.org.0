Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1B5A852C6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 06:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A7210EAB4;
	Fri, 11 Apr 2025 04:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VcVD7BsP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C7210EAB4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 04:51:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nqkOGwTxzopmAwHclfHFsOqT6GVeEMTIzV1QdiZ38yTSBQ3AwLTKJIW1gN5/t1O5xdb+9lBdTBDjpO80RILh4s230QWGIZocQcztspagJuMY27XGlVnwijqEgvgUqFj1nbR21Ygst48B2EKwdocSgtZOGxrnM9KJnoeDnRrHgVFTciQ7e79Y+q+ki2nIti1sEvR+LfNDwP+zkUA73VDfHdtYTeDBQbw91XDoMFjijafkEuweSGE/UxvP51CO1EGIBw1XbnKneNUjGh3J0OauzQCvoNeHUkaOxaDseleAKpvb9eU+x1fEGHqG8eXjv0e0CFEECo2O40c6PhWqOYU2nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SibUX0cRVul7jPAIuqOCOKgRCqnRXQa+jsszI65VxOE=;
 b=gsU+urxbpA8ovHpRj9mjjFQRh+OkEdFDKrnjyacuw8NGfiJampnIbo1KPgpyw2E2cI6XzOZF73Q66g3LYyfyzTrh43/g3q09obeJjTn5FrUAJUlWllKvs/D64WwjwSCCI6ve99342kU+NTy+ZoobcBHmIu/GeqVSEOnm4BC0ofnHI/mzA+JjSQu+00R116VGdVwiwL+ElSg2Vt2gJkcELzRdI+V5DZVnX447W2Q8dUPHJHU3djz7dDfMG/L2Bobx3zzjLrfmkQ1AuuN9o0tWSTf7Zq3/hN4FZLRrdseWywsKYj057ngZxWUC2EBLRSFd5ceYiJGjkH3/JdyhpkG7rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SibUX0cRVul7jPAIuqOCOKgRCqnRXQa+jsszI65VxOE=;
 b=VcVD7BsPKsD1PiZIjg755pnBVfMbl8o3eDU8+vqfnVGlt8ZjdBZvkOkdFJ4doMEsdZqqNqQn87l9PIk1JOIlZvUaMx1iIkYJS2Pd7UKqUI8DXpHFmah+OH7DhwqzqNhFweqLJw24u9XJKrlNk+k9U1GT4rXDTJRLygfI9Xu2G00=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9193.namprd12.prod.outlook.com (2603:10b6:610:195::14)
 by SJ2PR12MB8692.namprd12.prod.outlook.com (2603:10b6:a03:543::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Fri, 11 Apr
 2025 04:51:14 +0000
Received: from CH3PR12MB9193.namprd12.prod.outlook.com
 ([fe80::7818:d337:2640:e6c7]) by CH3PR12MB9193.namprd12.prod.outlook.com
 ([fe80::7818:d337:2640:e6c7%5]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 04:51:14 +0000
Message-ID: <bf851be7-74a5-8f9d-375b-b617691b6765@amd.com>
Date: Fri, 11 Apr 2025 10:21:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/3] accel/amdpk: add driver for AMD PKI accelerator
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, herbert@gondor.apana.org.au,
 davem@davemloft.net
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
 ogabbay@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 derek.kiernan@amd.com, dragan.cvetic@amd.com, arnd@arndb.de,
 praveen.jain@amd.com, harpreet.anand@amd.com, nikhil.agarwal@amd.com,
 srivatsa@csail.mit.edu, code@tyhicks.com, ptsm@linux.microsoft.com,
 herbert@gondor.apana.org.au, davem@davemloft.net,
 linux-crypto@vger.kernel.org
References: <20250409173033.2261755-1-nipun.gupta@amd.com>
 <20250409173033.2261755-2-nipun.gupta@amd.com>
 <20250410-sly-inventive-squirrel-ddecbc@shite>
From: "Gupta, Nipun" <nipun.gupta@amd.com>
In-Reply-To: <20250410-sly-inventive-squirrel-ddecbc@shite>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::13) To CH3PR12MB9193.namprd12.prod.outlook.com
 (2603:10b6:610:195::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9193:EE_|SJ2PR12MB8692:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc59814-2d44-4850-9aca-08dd78b47d02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFRpdTFRQmlpR3dOelpKc3kwWXFvT2g3YllXTmwxbE5UcjdmYjRCYkdnTjEz?=
 =?utf-8?B?Mlg2MkxHaTFtM0YrT21YUHJrU3BpVWpZREIxRkhMZTU2MitPSER0UEZmeFMx?=
 =?utf-8?B?Q0VnT2dlN2xvbTA2cEVLb1hLWjNLUTNoeGRFN2szVkJhQXh5SzdxS2hMN3k1?=
 =?utf-8?B?Y2lHb2MwZ2ZydkMvb3RrU2Uzd0FLU0dOQ09abmRwSnlSUndkNzYxYUFjcHVi?=
 =?utf-8?B?MjlWUHNTMVRIKy9BaXhsRHR4eWxvei8yUkhsL0VEY1phWkIyYTRSR0E0NVY5?=
 =?utf-8?B?MFF0eGZoeWhpSit5M3VvM3NmVUhHZWJwMVY0Mzh1VGFPUjRlaThUTDdzbHdQ?=
 =?utf-8?B?Y0toQ3NndzBmd1daWm9PdmgwWU9nNjdBdkpXb2hQQVRZYVp0alpaTEY1OGxC?=
 =?utf-8?B?SlNnOVd5cDJqRmdQYXdaaXVxc0FBaGVQME5DMTRva0pHdU5NeEdoS3pPUWhU?=
 =?utf-8?B?LzFRTndKWExpVjZiQUxjcVpHV3p5R2tlTjNJZWNQcUo0Qm1uTnlFNXkrVzUx?=
 =?utf-8?B?SjNYa2RhRnYrcFVDd1NDWldCSi9waU9IeTVuaERvakFLNTBhNDZ1TUlTOFF0?=
 =?utf-8?B?N3NSeXUyaGNoRVM2M29BZDhMZCtMTXNIZTBJSlBtNmdqU2tjcktlV2dGNmNo?=
 =?utf-8?B?VUpUOENxUEs1ZjVUSVJpWVBIWS9sNHBjRjl2TTFIY1RtVXJrUzFyK2NQNmtj?=
 =?utf-8?B?Y2ZqZTZocW1QN3YrOW9PM3B1SCtrNlE5bE1tYk5jQVhPQ2M0b0J6K0g5NVh6?=
 =?utf-8?B?M1pUNUowelFjblJlTCtiZlJhV1o5aDI4NEFMZFhLSzB4U0hlem5ETXpzcUY2?=
 =?utf-8?B?M2xpblJQTGJOenRKZGZGSWo5dUVaWEw4Vkc5WmNTUS9UQkc4c21oSnQ5d010?=
 =?utf-8?B?dGQwaGJYWVZXSlBuMzBwSnNCOEkvM1dCN2VEODAzNkNwUlB0N1Zkby82RDVV?=
 =?utf-8?B?dHJHZlgzNjlJRGI4NDBab2Naa2FaMlh2d1RQY0dsZm5JZkQ4eWV3TDczWDBJ?=
 =?utf-8?B?a2FjcTRIVDY2aWMyWmN4dVlxNjVEV3RyQmN3U1U2a2YvdWROYmcvWXJqL3F6?=
 =?utf-8?B?Y3k5UURqTFhobVpUaDZVM1VIZmFSZ1RhQzlWaWtBWXd2WjBtMXdrWHg0dTNn?=
 =?utf-8?B?Nkd1Yk44UnptbUxEN2MvNEhKc2ZwU3NjeGhrbVJWZnppZ3FES0pVY3VtUTIw?=
 =?utf-8?B?N2RVZnRTSTRjaEpsbXFsRTd6Sk5mZHJ5b1FSNnYrSGFmSWxOMS9DemhRQWtD?=
 =?utf-8?B?RnRLUFZBRHNQb3FXT0hjWG1SV1c2Z0ZnQUhWVnRrR1pwKy9pQit3c2wraER6?=
 =?utf-8?B?K0NMMGZkSTBRUm84N1loVWdJYW1aRTFNT1c0MTdMOVE5bVJ3aktCRVRjK014?=
 =?utf-8?B?YWhONE10dDJlVjhXK0phOEZXTlc2ZHJEcVVqRzErOWNDMi9kOVB2dmY2d3d3?=
 =?utf-8?B?WEM1V2duaVJ4NktEcEhRdGdoM2Z6aS9rNStTZnlTREtSSU51UXhiY21GTTlJ?=
 =?utf-8?B?R0FwNkdzWjVVRVNLeE1vcVlaeXhNR25IRnh5RXFIYTRXbjdrZFlFSjJpaTBL?=
 =?utf-8?B?eXp3ZDdXY0JmV2lPUVVzSDU1TzBYeFJlMkFlT1FFdEhsUzJ5OUJZdHk1RzR0?=
 =?utf-8?B?ZkUrcnVnbCtlb3RzUHA3endaRXNvZ2kwVXAvZXZBR1V3amZxNWFFcVU2ekg1?=
 =?utf-8?B?dzkzK1hjSVMrbVRXeEJMZUlSOTVkU2hBUEtZcjA0ZVhqVFdKTkFWR3g5ay8x?=
 =?utf-8?B?Qm1zQWJ6ZmZrV1EzbVdwVkdTZVBxbDJsVHozUVcrdmxWVTdWRnQ3aklScnBO?=
 =?utf-8?B?WEFlOXh4Q0xPdmJ0ZHZKaDBYWnlvMUZIaUVXdCtpZ3VQUHFaR0Q3eFFxUkp6?=
 =?utf-8?Q?LEiJwpFENRgpp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9193.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHBOU1FzTjdKVUhhaDM3THd2QmFiRVRxMlNqMXJlSVpwcEhySytkMnlxV1Vi?=
 =?utf-8?B?NDUvZHJicUxCVG9Id2t3OUlidENISWhZcllzZTlkWXJHSjNFOURLK3N2Mll1?=
 =?utf-8?B?TkFYRUJ2UVJGbElBSFl6NnFsdGJTRHB6Y1BZWm5RK2ZKQ2FtYlFISmhiUjB1?=
 =?utf-8?B?M3VveWo2Y1JaU2xZT1ZzSWdlRS9oQWRoYmdQT2ZrVzJnaE9MRThlVjlUZXRC?=
 =?utf-8?B?cFBPTnE3cTgzakVvZ2Y1eEdFTDRTdG1DaXVnZXZhZE1zajNQb1lJZTR4Z1hN?=
 =?utf-8?B?R1FkaWUyaUpXWHJ3c0pnajR2Tk9sdVA5SkhOMEhZTXRYbmhsTXQyQVIyMG4z?=
 =?utf-8?B?Wlo2V2tiMjlZRC8zc3RMSUpUNkcrUkRlMzJwWGxjTW9tQjZTellNaGNYRzdX?=
 =?utf-8?B?eVNrL3o1VFF1czZuZHJMNjZ0WFFVaytBMVVleldIMklBYTJqakJwMmJ5OWE5?=
 =?utf-8?B?VTBybUFyanFycEY5aGVGUVlPVHlsWEdNR1A0VVFqeVp0cHpwMzJlbmxRaUY0?=
 =?utf-8?B?QzZxWklvVmlxVmt2LzFnNW1sY1NWcDBIV2Y5OFgwQlltSHk4eVZubEFQaVhH?=
 =?utf-8?B?NTFxT1hseWlDZlRvOUE0bStBcUVGRVlpSmdjVERGTDBtamg4TXREem1ycWhP?=
 =?utf-8?B?QlRMRWJqR1VRei9mbFovQ3RlbUFSNUNkc0J4YjRtUkNxMkh3R3F5Mk10M2xa?=
 =?utf-8?B?ai9iRk9aRlloR2NidEJqTGJTZHN6MVdQeG1vbHpwSVVRSW95cW9UakVzelBB?=
 =?utf-8?B?eHJaNDFnbWU3VEN1NlM2TlFXd1BnREJPWXZHODhGaDB3R2FHVFZrRmhxdzA1?=
 =?utf-8?B?TVVydUtGMWErTElPeENXREFYVzhVOVdrcnhITWlZNHJjVmVRSmJEOXQyYUR0?=
 =?utf-8?B?b1FNYStQcVQ0UW1ZalNqcFRGUUdJRy9zWWdkTXhaZktqNWdrTmxrQTA1ZGxI?=
 =?utf-8?B?OG5qamZTU0JiekRicHZhQVN6TjJGMmpiRFBrUG5XOGZ2YVdnQjN2cmxucmgz?=
 =?utf-8?B?Z2s2RDlrby9INWpQU1RYMFV1ZEtxcHYxV01uclYzYUtIZTBPZkhGdzREWUEv?=
 =?utf-8?B?bFJVNFRhS2ZtSkl3dUFYRUlzZnFtQ2JSYm5odDZ3Y203VWZzTEs4V1Y2bkts?=
 =?utf-8?B?RkllTXNFK3JLZ25vbFE4a0FKdkxVNkRZSnNuMWtXV1V2Qk5kcGdZUzVwckIz?=
 =?utf-8?B?cS8xdTdyU041ZFVONDd5YlM2Y24rRC9wTkhwN3lGWnlCdiswZkdjTkJic01u?=
 =?utf-8?B?VktpYXVXeC9YTUEyVFpVb2JqNi9NNmF3ZGN0bUY4WjU0UEc0QWo5QU03NlNT?=
 =?utf-8?B?dHdrOHkwZ0FsUnYyeTI3OVhWcWxyTnR0L2RBeDNLcHlYalZkZE5yeUFsQk5F?=
 =?utf-8?B?dnI0RjdLTkdoZHVDVXd2aXNtVzNkdkR6b0xaY2lLb3A4a1cwallxRlFXZmtN?=
 =?utf-8?B?RCtzSHBST042OUxPd0tBSngvUHJiVitLbFoxY3Q5QWlxajlLK0lmckNtcUVh?=
 =?utf-8?B?Mk5DSFpNdEp5MEpQZmwzZWM5STM2d1dKM2d1QzJ4UmhiK3J1VWpuVXVjdmY3?=
 =?utf-8?B?blAvR2lsUmQweFV4bksxZExVWUpiSyt5UGt2cE9lWkIzU2htY2VmZDVBWG5i?=
 =?utf-8?B?ZkhIdGJnSHh0eFM0K2tFTTc4M1ZtVmU0Yks0Vmp2MTdQUFZzd1B0U0p2eVVl?=
 =?utf-8?B?SFFOK1hQVUxpcVhlb3ltRG5zeXNaUHBCaDI4b2ZzQUIrNDA4QktCTmFWSzZW?=
 =?utf-8?B?ZGlQSnh3UWpKTW5EZVAyU0Ywc0RyNFBSVnZXdEdsa1Rtcmp1R1NkWnk2eEta?=
 =?utf-8?B?ZVk1OGsrTVBrVjUwSmprcWdqcm9WQmpJZnBmRjF2L2lGTkRpOWJ5MDNrVHpR?=
 =?utf-8?B?NzdYcTkrTkZ1bWtsYitINDh3VDMxc3VIdElTZzJoSkpwUVA3WnVEeXhEcW50?=
 =?utf-8?B?ajgyQitlRWMrZ2lnd1dnb0lHYXZycmFpcXZHOVNJaUxPOUJoRTRzS2psd3Mx?=
 =?utf-8?B?QVBVTXRUSlJNc1hTOVZGUXhEZ2VoWmdFM09WRUkrenRZMDVFUHlZWkoyRVM5?=
 =?utf-8?B?L2FTTEdZQ2NGa0hsVTgxdmgyY2g1bTNQVGdsaWFvWiszNXJwVU82djFBU2ZT?=
 =?utf-8?Q?idBZtD35iVOvu9RlX+rWal/Bi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc59814-2d44-4850-9aca-08dd78b47d02
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9193.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 04:51:14.7315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xz07HWcAUu91MmdBlHqHfyMIt77zQX4y29kedzmb0DaJdvOsVRkQgEjAWc9neGE1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8692
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



On 10-04-2025 13:06, Krzysztof Kozlowski wrote:
> On Wed, Apr 09, 2025 at 11:00:32PM GMT, Nipun Gupta wrote:
>> The AMD PKI accelerator driver provides a accel interface to interact
>> with the device for offloading and accelerating asymmetric crypto
>> operations.
>>
> 
> For me this is clearly a crypto driver and you are supposed to:
> 1. Cc crypto maintaners,
> 2. Put it actually into crypto and use crypto API.

added crypto maintainers for comments.
IMO, as accel framework is designed to support any type of compute
accelerators, the PKI crypto accelerator in accel framework is not 
completely out of place here, as also suggested at:
https://lore.kernel.org/all/2025031352-gyration-deceit-5563@gregkh/

Having the crypto accelerator as part of accel also enables to extract
the most performance from the HW PKI engines, given that the queue
assignment is handled per drm device open call.

Regards,
Nipun
