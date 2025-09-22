Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6933B918D0
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 16:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B2E10E1BA;
	Mon, 22 Sep 2025 14:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S6I3CWSo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010031.outbound.protection.outlook.com
 [52.101.193.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A4E89B12;
 Mon, 22 Sep 2025 14:00:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypAq2CtF2I4ZLqbQAAfThTaLOO2dBaygNGskmseSNxNf44wybXrOPaS9GfLKp0KS5plWKClbnbSWCulPn+nIMBD89ueAfEyjAWApKKg2rTOlrHWEiKxAy//Jl/7IchrPn20dvo11fdoipg37QETjmq3WytxfDScibTA21UQMdwMsGA0e9GRjaNMZk0JwZBYpxU6OAPsg5Zu9pyXesIq51hKzEvT9yXqDjCALV39NXOQrPkimMzIOxGb46RaFvRCT7+nIjuW8IuA+uO6PoyccdU08wjFmvcMgkud7Dv3BL6ZDfqQawLnDulZogvGrNfXZpyfZyhTkePdGAh0X19XApw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etA3VhH9z2QoiwRLtz/c+JXnNKnxpnMhR/9FBsk+66k=;
 b=nsGza+YNN+/TiAu668bQgXRGLfPQcztRI4KH1KlaiB0Yer2EBKqL/SpZ9oOGpXDPLt2kFav1U6/WLJHJSb5cZKiNUvhGPFgfNGp5vundRnc8vdlOU/+mx0scIyVvDnSVrzUPGGxpMGBUsuFkeX2zloherkddCX/6nnirN5mow3dXsSGLt191JqGVhIi8oz8RW/DNmKZMt6szljA9qPWHTw4lfSr/1cl6/gj6kmJ6lkl6M5lsgGWxi2Id1M9ASBYIaTLv6JqvvmVZjKljWcfvEovdLbc7NatR+55UKgysvOZ7N0tBF9qrTbTxg/dj6Xe94m+qrsHsVYuBWiOMxt6gWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etA3VhH9z2QoiwRLtz/c+JXnNKnxpnMhR/9FBsk+66k=;
 b=S6I3CWSogx1HHHYDJ3A0La0/I4XgWNaC7ZQPMFVITEz4zrCXSIrcbzovuGxbD6Eng/j1IfJe+yNVbYeMKJ3xLHvIDB5OesCftJVYXuxYnldrzumJpW4XdSNNs95r8+qxWWzSGr5V1pT2bDBZCETVbBAQFYMIWjdUZT84YReFMZU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB6485.namprd12.prod.outlook.com (2603:10b6:8:c6::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Mon, 22 Sep 2025 14:00:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 14:00:27 +0000
Message-ID: <ff75c82b-a40b-40cc-bea2-8af6ac21343a@amd.com>
Date: Mon, 22 Sep 2025 16:00:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm: revert the remaining commits about dma_buf
 handling
To: Melissa Wen <mwen@igalia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250919155519.1104256-1-mwen@igalia.com>
 <6da0bdd3-0b93-45d8-a178-1fc202bd49c7@suse.de>
 <9c150f20-71d1-4af3-ba90-02a0a5b98330@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <9c150f20-71d1-4af3-ba90-02a0a5b98330@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB6485:EE_
X-MS-Office365-Filtering-Correlation-Id: 9043526a-d657-44b2-099f-08ddf9e06249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzNkSmhydUQvcWJxNDhzcjArTGhmS3RCT2NvS2lvSlJmUGNTbjFLMGZVV25Q?=
 =?utf-8?B?VTZiR25wNlhDMklyTmtpZ0tZcnFpc2wrWkY3Y1FvbHpGU1hWTjVUV2J0MXFW?=
 =?utf-8?B?T0tEQVNMSkZFS2FHRVdzditsL1BCNXRRV1hBM0NraDVPd25XODFVTXBHU0JG?=
 =?utf-8?B?c1pBbG96U3FPenJaV1pOMVczUmg2bFBUTjZubmQycWJzUW00TVVoeS9rbFl4?=
 =?utf-8?B?SUs0VDJUTDNueThSZFdmbElod1dSNVljUnBNNTBOc0VRZDVzNUEwaXdnVlhl?=
 =?utf-8?B?MlBQc3NTa3RKVEdIZkZxdlU1ZmVqbis1ZW1nUGtLN3BrTUQ1aCtwTFl2OXBR?=
 =?utf-8?B?ODNIT05nZHpDZW0wRzVYUTU0cTZhc3d2MXNOUXFhTDZxK1l5dzd6SW9PMUNQ?=
 =?utf-8?B?bkh6NGxobi9UNWw0UXBxWlJDRjBiNmZjb2JDbEdGcVBjOHVwQ3VibjBxeXBz?=
 =?utf-8?B?Tk4vY2lCakZKNnZrN0JhejNiRDlTSlBTMWZNMXNXV2dYckc1aUJ3Z1VYbWRD?=
 =?utf-8?B?ZDMvMTFjLzlZV21va3pkQ2ZiSVUybXNacVR1aG9HUmk4QUtOekRmL2dWb2t4?=
 =?utf-8?B?VWpyVkJSdml5NUJHN01vVjZzVVcyYU1ub0syV0NMYjQwdTZBZkVMeTZwMlZn?=
 =?utf-8?B?bWcydVBVdENTRzMrV25rUElqTEJ1U3YxNkJuc1VGYWRvTlVrSDJ6R1cxMndx?=
 =?utf-8?B?MnJmd0RXOUpybHY0aFVqaktuWTNhaWpZN3dhR3JFUzJIVklvQVZSM0h4Rktn?=
 =?utf-8?B?aDdZbjZMN2U5WWZpUWFNUU5wZ1VYRWIwUWpPYXg3ZnZJM0NRanpMMms1cXUy?=
 =?utf-8?B?dzlYY2FiNXB0cFZOdjZDc01DZlg2QXh6c2dFZEtlVlRhRHgyWmdzNmw5dENU?=
 =?utf-8?B?TWUrL3RFQ3hQQWduK2xGTXZDdlcwcmhDNkRPM2xua1hxTk5KWkt6b2NrSDhO?=
 =?utf-8?B?TzZyUUZ4YWt1SGozMEpOYTZzaDBWcThQNUhleWdVQWdiZFRoSTRzVnVoREJv?=
 =?utf-8?B?dW8zU0Z3cEpVSVV2QmJLeTk2RHRqZDRYYWFJRS83Q1Z3Tk1IcHRDQUJkS25x?=
 =?utf-8?B?WWpSekxYWHhrUnFFU3ZCMlY3ZkhYbTNmSVI4eHoxZktlRU9laDQ0bXBJd3RY?=
 =?utf-8?B?QUVjODZNSzVxWkJ0blVSTlJYRWtIYUpaMUFPU0hSWjh2YlRBcTdFaVM0Vlpa?=
 =?utf-8?B?dlNoMjhoSkxtK1U4QzB2U3UrNFVkM2RPSTNvUVExR2VINnFvcVFQNjUvRHZw?=
 =?utf-8?B?OE1vTjhDRnpaRVNoZ3pVRXpuaDBrTFFlTzI0U21zOW5BNzFSWEdNMXV2NFpZ?=
 =?utf-8?B?c1pPem9PNCs4NmFDUGhJQjF5dVpTK2NHSHdEck9yMVJTNFl0SksrQW1HUnhC?=
 =?utf-8?B?SHQwcTFYY1BSOVBGekxnR3dYMU5JalprSzVDdFpKMDBwTHJsQTlEYWY2ZmFB?=
 =?utf-8?B?NVJ1ZFpDRWNNU1JUbnUrWmo4eVFjOUlBZUpFV21HV2tBTFN6M0NLNUVGWGJS?=
 =?utf-8?B?TzJhVEhQL0FGUEpSZlJzWVg1RGJXdFNXQ1V2MS8yaUkyWXpPUTJJcUpxTTNG?=
 =?utf-8?B?M016REZxUlk1aEN4aG5vYU9uWWFrTnJIRnpFc0hmSkExeisrY0kzMmdoSGxQ?=
 =?utf-8?B?cUpERDVPcndCbSs3RklCcWVYRHFRaXNyNHVsQUVrdlBUNm1pNzNlOVUzS0lC?=
 =?utf-8?B?UkRjMEdsZkV6Vndxendhc25Md2IyZkZQa3IxOWNBTlpLMGFTSjh1STdESDhW?=
 =?utf-8?B?dzFHa3ZVdDhkMXRSTE9NK3dDUithTUpYTnRiWHIzZ1RzcHh3dVZGZHljUU1i?=
 =?utf-8?B?RGlqMXp0WHZtSE9Nek9qcm5xbFhFYmhwOWs0QXluYzNLeEl3UWVucVZvQXQ3?=
 =?utf-8?B?akszM3RiQkl2L0ZVbUtRREFxdFRDYzh3M25lVGZQSFNrNFVPajZ6eDJ3Yk4r?=
 =?utf-8?Q?PaBDPfLXhTk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZG1LN3BMV3hzSGpyVjEvbWlrWXZnVEc1WUwwUjh0MlE5SjNtZlpmRy80eWNn?=
 =?utf-8?B?RkdyaHVPbG80aTBiUi85QndqYWZmdk9BSjhYaG5WM1VOZjVYYThrejlSbW9r?=
 =?utf-8?B?OEFBdzlRQnV4ckhRWCtyalhSSTlVeWV3QXE3c3hsNGhac1h1TGphcW5JaS9J?=
 =?utf-8?B?dmdDWkF3TFNkeVRXSmpQVU53SitrRVowZGo0RnhScm5ydHBISDY3N1hCb3Rq?=
 =?utf-8?B?dmpXWWUySHZaSG5xaGhhSmtVZTVjc0N0dVlxcStuY3VkY1lDSWozNXlYQys1?=
 =?utf-8?B?Wmo2UWN2aUdNWDM2NDJjTWpZN1doUVBkd1VtK0JxUW51Rm11Y3lVbWdqd1hD?=
 =?utf-8?B?R1FZME12ZjFKYkFzWGRqK085WUVrV3Q1cXJaTElIQ3d4Rm00bVBQcHcyY1VK?=
 =?utf-8?B?SkVFZkI4eWE0blB5ZTdiYm1PMEFld1ZkWmROWTBjYjlhbjlXWEtkZVZ3U1pS?=
 =?utf-8?B?TUlRQzZHWmFORU9ieXM0MXlUOXFZV2hENWRYamJHS3IvOGJIck1IRGlZSHVK?=
 =?utf-8?B?NFBUOEFBVjhjMzZMMHhqMnBxS2l3MGJhMlFjU1RyVXZoQ09yZlZyK0NrMFRP?=
 =?utf-8?B?MVRFZlBGRHMvdGtGSFpaaXhFZ2VLTUhMZmJqN0dpRjBkdldtSHdHcVBId21G?=
 =?utf-8?B?SkNmVVBRQ3JyaTBsWklXaGMwM2tLb3RvWXZObXl5N2w4MmsveHpkWmJsQU9q?=
 =?utf-8?B?NWVDbzE4Vm11WUU5MVZuVkduZ05CT01rR1BpOXo1eHpZU0QwTWkzZ1U4bVpp?=
 =?utf-8?B?T3NLczFJa0oxeVZBeHlKQVRmbkdOYVpUdXpoczIxcU1xSDRSc2FsSlVoVkh6?=
 =?utf-8?B?UmRrV0NJUU9wS0pRdmhtRjdKMGlIamI0V2d5YTZjcjRMclpXQlFoY3pmcnlk?=
 =?utf-8?B?WGJLMWpPR1ZZL2ZXdTc3dTdFNjRyQ2hBS2l3K2ZxUHk0cGsrenlOdzVRUklk?=
 =?utf-8?B?U1dDbE5DTk5RT0doejBMd3R6TnlveHZsZFBDUGZrQzZGM0hESEtHZ1BFMXhZ?=
 =?utf-8?B?Q0VZSU13azI0MUNVWUlzc1g1ZTFBcDErU1BveEpXQ2NaWkx3S2YrZ1NqdE9E?=
 =?utf-8?B?NW5GR25YT016TG04RHlUYm9MK0NpaFZZUmRTVTluUlZEaHM4N0NLSjNwMVRt?=
 =?utf-8?B?c1RlNWxiT0hMR2xUL0FnaGJGVFJtZUZnVnRhejZsTEs2Y2FjNU1sMXNvNi9o?=
 =?utf-8?B?Sjl5bUpHWVF5K1BWR0dkK2hWZnhtZmp2cnNjOEdRSnh5WjJ5OW1Ob2pRczY0?=
 =?utf-8?B?N0MyWTA3Sy9XZ0ZnMEdsc0s5cW9MZ3krWkZzT0JqOGRmS3Y4Z2s2Szk2alFV?=
 =?utf-8?B?ZmhsdnpldGtSZnREMTZXMHYrZ3EySk9rdTRmVDBLQlUwOXpIS0FoYVlrbUxN?=
 =?utf-8?B?L3V3MjRMZkFQWHZYeFlvK2NreE5ld1dTc0NHQ3A4ajJVZmdXUUFFTW8yZFFL?=
 =?utf-8?B?TVdlMmVVbUw4YUJjSklxcGtMeVBmcWl3bzE2TUsrZEx5NWpEUzc1dStXbmNB?=
 =?utf-8?B?YzJaVU9Cd1RmUGhiV1dwa0pxdW1KQmpoWjNHT1FqbnpTNXMwRldwQ2JPSlI3?=
 =?utf-8?B?K3NGR01mTmVJeXd3WUJRM1MwNDFCQlVvVGJ5QVU2cDNrNjFwSjNKU3NObk5W?=
 =?utf-8?B?NmdDRzdUYitrSTEwRk5rZFR6bDRxZ0VpN0taR2p1STFydUY0M3FFNkVsOGV2?=
 =?utf-8?B?QnFNMU1DSWhEK3labzgzc0xvRGIrS2wxaUx3cWsvcE03WER6TzNUZmFWQTVH?=
 =?utf-8?B?MHpwSGd3UnlBeGdjRmxGekMxcTRQZlhaS2JjbDdBUmJicFdjeWF1SmFYWXlE?=
 =?utf-8?B?d0djMXVOL1p5OEZGNmhNKy9uOHVhR2N0M1BOWUJ2RHdQZEdrS2xpeHFVLzVq?=
 =?utf-8?B?YmUyUTBjMHFYaE9YaHZLV1IwZG4xZWlDTlhzN1lEUE83KzgyMnFaQVBLQll0?=
 =?utf-8?B?ajcwZUJ3Z0pKLzhqRTF5NUhhZ011NHcwTktRY3pIT1Z3QzJzUlV4UVhSSFph?=
 =?utf-8?B?QUErMEFGdkJLckdWQVlUVjF6aTdWRjNZUXZZUCtKSU1pUzQxdHE2ZWpuaTl4?=
 =?utf-8?B?YTlBcFRNS0lidEhOaDhraHRSNVhFc3N4akJHR3NzN1JTU25zeVF4SWEyTEcw?=
 =?utf-8?Q?OzxhPR7bQnzHbxROMaDKQPFzX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9043526a-d657-44b2-099f-08ddf9e06249
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 14:00:27.5594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZxsvTngx0mMr/AGc0OlhxrC4JURGNuARd4/xpid55D2Vkq/Dk91iXwiWX1U9XPDW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6485
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

On 22.09.25 15:42, Melissa Wen wrote:
> On 22/09/2025 08:54, Thomas Zimmermann wrote:
>> Hi Melissa
>>
>> Am 19.09.25 um 17:54 schrieb Melissa Wen:
>>> Hi all,
>>>
>>> I just talked with Thomas that these two patches are preventing amdgpu
>>> driver to be unloaded:
>>>
>>> `modprobe: FATAL: Module amdgpu is in use.`
>>>
>>> and there is no process using the driver.
>>
>> What's the exact STR for this problem? After Christian's comments, I tried to reproduce the issue, but it works on my system. I do
>>
>> - boot up with amdgpu in text mode (multiuser.target)
>> - login by serial console
>> - 'rmmod amdgpu'
>>
>> That last step turns my test system's display off and unloads amdgpu. The kernel is a recent drm-tip at v6.17-rc6.
> 
> - I booted up in graphical.target;
> - Connected via ssh, dropped the graphical interface to text mode (multiuser.target), and tried to remove the module with `modprobe -r amdgpu`
> 
> The issue happened in the latest 6.16 kernel version from Debian (I don't have the machine with me atm to check the exact version), but also with mainline kernel from last week.
> 
> I bisected kernel from 6.16 and 6.15 and IIRC git bisect pointed to `drm/framebuffer: Acquire internal references on GEM handles`, but as it triggers another trace and AFAIU fixes `drm/gem: Acquire references on GEM handles for framebuffers`, I reverted both pacthes and amdgpu loaded/unloaded as expected.
> 
> IGT amdgpu-specific tests for loading and unloading are also failing because it's not able to unload the module.
> I didn't run the generic test.
> 
> I'm using an AMD Cezanne laptop with a touch-screen capable display (hp envy x360 convertible) with Debian + Gnome.
> I looked for process using the modules, but I didn't find any.
> 
> BTW, I don't discard that this work uncovered a preexist problem, for example.
> Since those patches are addressing other issues, as mentioned by Maarten, I'll debug the amdgpu driver further and check the points raised.

Well could it be that the graphics target left a CRTC running and a framebuffer being scanned out?

Regards,
Christian.

> 
> Best Regards,
> 
> Melissa
> 
>>
>> Best regards
>> Thomas
>>
>>>
>>> We agreed that the best approach now is to completely revert the work
>>> done for improving DMA bug handling to avoid any loose ends. With these
>>> reverts we are just back to the old behavior and amdgpu loading and
>>> unloading will return to normal.
>>>
>>> Best Regards,
>>>
>>> Melissa
>>>
>>> Melissa Wen (2):
>>>    Revert "drm/framebuffer: Acquire internal references on GEM handles"
>>>    Revert "drm/gem: Acquire references on GEM handles for framebuffers"
>>>
>>>   drivers/gpu/drm/drm_framebuffer.c | 31 +--------------
>>>   drivers/gpu/drm/drm_gem.c         | 64 +++++--------------------------
>>>   drivers/gpu/drm/drm_internal.h    |  2 -
>>>   include/drm/drm_framebuffer.h     |  7 ----
>>>   4 files changed, 11 insertions(+), 93 deletions(-)
>>>
>>
> 

