Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E1D7EA134
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 17:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D7010E16C;
	Mon, 13 Nov 2023 16:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD3910E16C;
 Mon, 13 Nov 2023 16:22:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ga/27YPqfCEMX73qIeVoFvWw9rSS9x2ZoH8cZC5OXg0hPgvLGdXvrqc836QhBmDtas5Aku03F1whn61ug5FJmCTk/FnMgZIRGVGy26t6Z5KI42hVFbL3QJGudH39Vy98ETZI5dy2JoAPV88t9A2GnTPhmgP4cD2eHRaOXdPUFxEKtz4Qi5fJK18RiQzUvgB61QBU9KnRG+rkF+7PUKVDbsL56otGFGVqcV6mPypDgt3nzE9QvVdwWop08YdM7pMqpFCP7iFHbbuy43uPGa2xTKpgWlZ4o+HijZpSgtcP8idIKGknlzKq+YW8Nqq49FZB9nASCP7xOCIx5b5ljLpf4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vImMuE39MMgKwrXpqB5aAA9UDbYJ6+tGFGOBFB30K00=;
 b=GCuemRxPcmbf9jIgxizvXuwFugc/81zv+C6ktYByBteUYovzzSjiE6gqgoYaZ2a3QeU9LYu0SdDPEDexgfErIlZ/5OBxl62v4ScWrdJPn6d8zFfbNaMTiwmcDjGovIC5yhBB6gcSGRANXYq7N0pdgp6phsyaxrD7nP/oZodrwpR+YniV5aZekiq+h6AaguecpXTq4lcyiS4FKnsxNXv3vWxfcOwK3v/ydWzagcs7F5lrKkeDoJXmrwaLbqyS9q8quM0HL9iGUsGliUvm3ioZd53i1XWJa7JYCvhu0jDA14/8JFY+nV6TVeQR/PeQGyyjj5YBMtSUZWI5E1Rk6v3BKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vImMuE39MMgKwrXpqB5aAA9UDbYJ6+tGFGOBFB30K00=;
 b=nDD7EQdG2Hn6E7T4gj5PI4cOPmKuzVQXM0ZzBAZR0yLgveGxj7nDx8rhAmZMUs/OtMzgar3MITmZDzrCx3U1fxFSsgs97IEDDGzshHAr3n6OL9cYiVzxtoZ/lCS1D+jeHkXmjPB/jzTcF7/5+fz1TWDzwZFEF6vNPeVVCRfsS1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by PH8PR12MB7111.namprd12.prod.outlook.com (2603:10b6:510:22d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28; Mon, 13 Nov
 2023 16:22:11 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::194a:56d:a41d:3c79]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::194a:56d:a41d:3c79%5]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 16:22:11 +0000
Message-ID: <37d00502-0942-ece6-815d-77eeba6ff68a@amd.com>
Date: Mon, 13 Nov 2023 11:22:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: add a debugfs interface for the DMUB
 trace mask
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20231113145608.20386-1-hamza.mahfooz@amd.com>
Content-Language: en-CA
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20231113145608.20386-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::29)
 To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|PH8PR12MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: bc2b2515-17fa-4f78-4d4b-08dbe464b05c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +FE4ahWtDHh5rt4wphwg6oZRHn2SLHd2C1Uunto3gcQ0OB7ApU3kPGXDiUA6tf9KdmZW1I/J5iAhDy+bFBSCvXPJqBef07gC3mq8mfW55rF3ZLjYXTfiOOeAcJ4eQwjlq8FuzxFTFFw7MM+GFyjuFVbxsrnvn1HLcsq1cAPDxE+bLmoQg3lahe3zaSVPfKKfobMpYTWQk0ZA/wOpldUH+ceWx4MF0lWVqn0fwY3KCR9+Evhhg6wCNSFVxJl0BTJeOTnCfklCzrFbrZ2Ud8wZ3iBKAmfpOx6AA0PVGTG1AUhev4K6/meVq3DA6/1SXIjp1E/a5snZkOeMGirTcvT5KnhILc6j61c8J4EtaT07U/3xCTbXdDe2VVdi7EhZF6YXSInIaRsNobs129tFzrWGSg/PL5oWA2k+V4T7ebyvohOsFbIto72kSHW5N+/z1k8xgMjB6kbOXL/7TmDu5pyH2PnUIXVzPayFNzzfcfuEbX3ncXVVW48hro4ssf9iLkY7P2MIGMRdZukhvuBtA0Jp4a4pPlipt9+SeMzZ7LAT9Tclg6ZGTD/U2OO3a1rL0ziMxd8+WsxZ4BFODgYMADUBijMNYZvMcrrPT1BqcajcSCBISi9me0Dg01tZGglNSRA26wwqPeeuwfjLkri4xRn8cQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2906002)(6666004)(6506007)(53546011)(478600001)(86362001)(31696002)(26005)(2616005)(6512007)(54906003)(316002)(66946007)(66476007)(66556008)(6486002)(38100700002)(83380400001)(5660300002)(7416002)(8936002)(36756003)(8676002)(4326008)(44832011)(41300700001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SG5KekVjS3Z0cjBJbTVQLytVb0tEU3NHRzltVitYYUtCcitZS1BsTlFuQlRw?=
 =?utf-8?B?Y1grdVdtY243OTZZaFlBSkxsYjVDTHZuTmwwSjJiNXBZS3JDOGtvU1FWZStu?=
 =?utf-8?B?UGp3amRFZHMweG1yQnVvQlVuSVR6L2JsQ0FpUEczY0xndnEzeko2NTRMcDBa?=
 =?utf-8?B?N0JSZVpHYTdJK2g4ZkJLamZYcjRlMXkrSTN5UWovZUg2QWFqNk15ckkxZG1a?=
 =?utf-8?B?Zk02UU5wZTloOFJKNEY5RStKSEFpSklyN3Rqdkh3Q1RPWlVROEI1dDNSMWFq?=
 =?utf-8?B?S3lTOTJ3RllFazFNTXNodDlZYnpnNzdCdnczVnJmNS9WRDlaNGRhck8zRTho?=
 =?utf-8?B?Z1dSbFBveXNKcCs1bFNzeHZCM0VYc1NLRkxyMXU5UXZuYmlqNXVFZVUwaEo5?=
 =?utf-8?B?UUpNS0V3OGxQRGEySnJrNE9oZDN4Y2hYYUFSVE9zOFptR2VTbTJOMklCbTZ0?=
 =?utf-8?B?QW1oNnh3UDBOL1FDZUF3QzhlWDdlVW9xYVM3elh0dkgyWlZoNEhGajVPWGFh?=
 =?utf-8?B?S1Bmd2VyMHpCazFtaGN6ZTVFMDlIVWMyeTlOUFhNc09CT1JIYXBqVHVQNjFW?=
 =?utf-8?B?blhqSzJmTndHVDE2TFVLbXJGQ1NSTk4vcjVmWU1zZWZYOENXc2d0Wnd4VmNu?=
 =?utf-8?B?YnpoUlVNZ1RFdUtnOHVQVzVJRWxkSnI4K0JabDBzelJHaS84OVg4Y0JSNmpY?=
 =?utf-8?B?ZnJoK3RSQi81TEdGSUVjbVR5ZmxrRFA0WGdtNWtIcUJ6cTRKTE9JeFpFYlVj?=
 =?utf-8?B?R1NUYzlyWCtVdHZvUzhkT2FzVkw3d3Y2V2RSSis0OTA1NkNSdkMzcnJDRUgx?=
 =?utf-8?B?cjhPR1pQTGw2WEIvUUFuUm5jWUhveGRicmE5WVFWM1duUVdEbGVWK2Q4WVY4?=
 =?utf-8?B?QVBqN1ppS2R2UTU4Ujl4ZUhYc2diaXMzTlY2YUxhWkIzVVNTMHRZV2pyRnFD?=
 =?utf-8?B?ZGt2SVpOZGN2TUhSQnBZekNFbWZwU3JXOU92MVlucnJ4WE4vQWlhWHI0eUgr?=
 =?utf-8?B?ci9Xb0hsS09XS3Q3R3laZFpvRmRERCtNalpIUzRUOGRWMWs0Nm9ZU2VCaENy?=
 =?utf-8?B?V1RLRFhnUmc0dDMwZDI2WGdRSnRSQ0F3YjVKVXEvSW9PNkIvRU94NXM5cFhF?=
 =?utf-8?B?MTdwQS9RZnlPcmlnbUVUdEVqV0JyWjNSVWoyYWZya0RsN1ZIVHduMEtTZWF6?=
 =?utf-8?B?VjVpUlgvem92aGcyRnlLL2NBK3dFWTgxTTFKM2tOWi83SC9rZmhXU1VtWU9L?=
 =?utf-8?B?N2xMdFNYYVJrazE4Mzl3UjZsTVpweWF0MUQ2U2xsSm5vODcxQUtGS3BkZU1i?=
 =?utf-8?B?UWNqczd0S1dXTHMvSk15Vk1JWkczWXhkMFdHM0lhcXBwYTVDVGZXVjB3QjVn?=
 =?utf-8?B?WjBxa1E3bDZXTjE5dHZRM0VYWXg1V0hxN0d4elB0TzFFbTdtdDVTQXVqRGNr?=
 =?utf-8?B?Y1ZvYm4yUk5ybndON0JOVE0xemJvN0UrZ0ZEU2lBaG9GeWFmR1o4d3N6c085?=
 =?utf-8?B?SjYycmM3OHVhZE5nTjJqcmljVGNoV1RrVlp4bE9meHhtdjQwTFViekxwRHc4?=
 =?utf-8?B?TDRwbFE4ZUd1WFcwS3hIWGVYLzFSdWNuaXdTcHptdWVrRDM1RytGN0lsRHhu?=
 =?utf-8?B?T3RFNWh0VlU2VXpDODhDYnYyTmFuNWtxbW5NUGgyL01acDZ4VVY1b29reWJM?=
 =?utf-8?B?UmxSdmU0ZFJtaDlBWlFpZmk1elVUcEJFbXpOVGMyazJmSTRkWFFodDIwcGlC?=
 =?utf-8?B?ZUlKdW9OREdjb1B5eUVwcmNVdnZGd1lWN2l1aHVyQzAvMVNveFJRWEFObFNE?=
 =?utf-8?B?UHRCcDhNRnJrbWpUUUdQQnJxNTlpWGd3aXAxNFdkeGRRZzFuczlKL3R1MTVt?=
 =?utf-8?B?cng2RnZsckdSNm9YQWZ5TndLOTR3d2VWcXdZZjBqNXJaMmVvSjA3Mk5zREY3?=
 =?utf-8?B?b1VMYkQ2WWVSMk9WMzNsdU0zL3dzeXA4WndZeVRYenNxV1VHemZ5RXNKWHZh?=
 =?utf-8?B?TXBZeG81djBZSklFaVhmU3ZJT1FCSEREQlgzTGJZajR4WjNOcXhtakRXWHpU?=
 =?utf-8?B?ekVNcXFteHlpekVMbEdKMzBOaXRkWG9uSjdzdGJReTVKTmV3Q09wMGRMQndp?=
 =?utf-8?Q?3myFSlQ7yNBkIcN+xcaAu9N8q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2b2515-17fa-4f78-4d4b-08dbe464b05c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 16:22:11.2028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Th7bUro2jNbLAnCA1iyIoBpUZUfv32LlcJj05rUCXy8leQtoQk4WbUdKdt4eYcwYVmxFQqPTWGv7tyrMK8VhCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7111
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
Cc: linux-doc@vger.kernel.org, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>, dri-devel@lists.freedesktop.org,
 Reza Amini <reza.amini@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Anthony Koo <anthony.koo@amd.com>, Mustapha Ghaddar <mghaddar@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, Wenjing Liu <wenjing.liu@amd.com>,
 Tony Tascioglu <tony.tascioglu@amd.com>, Fangzhi Zuo <jerry.zuo@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, Alan Liu <HaoPing.Liu@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Maxime Ripard <mripard@kernel.org>,
 Hersen Wu <hersenxs.wu@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/13/2023 9:56 AM, Hamza Mahfooz wrote:
> For features that are implemented primarily in DMUB (e.g. PSR), it is
> useful to be able to trace them at a DMUB level from the kernel,
> especially when debugging issues. So, introduce a debugfs interface that
> is able to read and set the DMUB trace mask dynamically at runtime and
> document how to use it.
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
> v2: only return -ETIMEDOUT for DMUB_STATUS_TIMEOUT
> ---
>   Documentation/gpu/amdgpu/display/dc-debug.rst | 41 ++++++++
>   .../gpu/amdgpu/display/trace-groups-table.csv | 29 ++++++
>   .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 97 +++++++++++++++++++
>   .../gpu/drm/amd/display/dmub/inc/dmub_cmd.h   | 40 +++++++-
>   4 files changed, 205 insertions(+), 2 deletions(-)
>   create mode 100644 Documentation/gpu/amdgpu/display/trace-groups-table.csv
> 
> diff --git a/Documentation/gpu/amdgpu/display/dc-debug.rst b/Documentation/gpu/amdgpu/display/dc-debug.rst
> index 40c55a618918..817631b1dbf3 100644
> --- a/Documentation/gpu/amdgpu/display/dc-debug.rst
> +++ b/Documentation/gpu/amdgpu/display/dc-debug.rst
> @@ -75,3 +75,44 @@ change in real-time by using something like::
>   
>   When reporting a bug related to DC, consider attaching this log before and
>   after you reproduce the bug.
> +
> +DMUB Firmware Debug
> +===================
> +
> +Sometimes, dmesg logs aren't enough. This is especially true if a feature is
> +implemented primarily in DMUB firmware. In such cases, all we see in dmesg when
> +an issue arises is some generic timeout error. So, to get more relevant
> +information, we can trace DMUB commands by enabling the relevant bits in
> +`amdgpu_dm_dmub_trace_mask`.
> +
> +Currently, we support the tracing of the following groups:
> +
> +Trace Groups
> +------------
> +
> +.. csv-table::
> +   :header-rows: 1
> +   :widths: 1, 1
> +   :file: ./trace-groups-table.csv
> +
> +**Note: Not all ASICs support all of the listed trace groups**
> +
> +So, to enable just PSR tracing you can use the following command::
> +
> +  # echo 0x8020 > /sys/kernel/debug/dri/0/amdgpu_dm_dmub_trace_mask
> +
> +Then, you need to enable logging trace events to the buffer, which you can do
> +using the following::
> +
> +  # echo 1 > /sys/kernel/debug/dri/0/amdgpu_dm_dmcub_trace_event_en
> +
> +Lastly, after you are able to reproduce the issue you are trying to debug,
> +you can disable tracing and read the trace log by using the following::
> +
> +  # echo 0 > /sys/kernel/debug/dri/0/amdgpu_dm_dmcub_trace_event_en
> +  # cat /sys/kernel/debug/dri/0/amdgpu_dm_dmub_tracebuffer
> +
> +So, when reporting bugs related to features such as PSR and ABM, consider
> +enabling the relevant bits in the mask before reproducing the issue and
> +attach the log that you obtain from the trace buffer in any bug reports that you
> +create.
> diff --git a/Documentation/gpu/amdgpu/display/trace-groups-table.csv b/Documentation/gpu/amdgpu/display/trace-groups-table.csv
> new file mode 100644
> index 000000000000..3f6a50d1d883
> --- /dev/null
> +++ b/Documentation/gpu/amdgpu/display/trace-groups-table.csv
> @@ -0,0 +1,29 @@
> +Name, Mask Value
> +INFO, 0x1
> +IRQ SVC, 0x2
> +VBIOS, 0x4
> +REGISTER, 0x8
> +PHY DBG, 0x10
> +PSR, 0x20
> +AUX, 0x40
> +SMU, 0x80
> +MALL, 0x100
> +ABM, 0x200
> +ALPM, 0x400
> +TIMER, 0x800
> +HW LOCK MGR, 0x1000
> +INBOX1, 0x2000
> +PHY SEQ, 0x4000
> +PSR STATE, 0x8000
> +ZSTATE, 0x10000
> +TRANSMITTER CTL, 0x20000
> +PANEL CNTL, 0x40000
> +FAMS, 0x80000
> +DPIA, 0x100000
> +SUBVP, 0x200000
> +INBOX0, 0x400000
> +SDP, 0x4000000
> +REPLAY, 0x8000000
> +REPLAY RESIDENCY, 0x20000000
> +CURSOR INFO, 0x80000000
> +IPS, 0x100000000
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 45c972f2630d..67dea56cf583 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -2971,6 +2971,100 @@ static int allow_edp_hotplug_detection_set(void *data, u64 val)
>   	return 0;
>   }
>   
> +static int dmub_trace_mask_set(void *data, u64 val)
> +{
> +	struct amdgpu_device *adev = data;
> +	struct dmub_srv *srv = adev->dm.dc->ctx->dmub_srv->dmub;
> +	enum dmub_gpint_command cmd;
> +	enum dmub_status status;
> +	u64 mask = 0xffff;
> +	u8 shift = 0;
> +	u32 res;
> +	int i;
> +
> +	if (!srv->fw_version)
> +		return -EINVAL;
> +
> +	for (i = 0;  i < 4; i++) {
> +		res = (val & mask) >> shift;
> +
> +		switch (i) {
> +		case 0:
> +			cmd = DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD0;
> +			break;
> +		case 1:
> +			cmd = DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD1;
> +			break;
> +		case 2:
> +			cmd = DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD2;
> +			break;
> +		case 3:
> +			cmd = DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD3;
> +			break;
> +		}
> +
> +		status = dmub_srv_send_gpint_command(srv, cmd, res, 30);
> +
> +		if (status == DMUB_STATUS_TIMEOUT)
> +			return -ETIMEDOUT;
> +		else if (status != DMUB_STATUS_OK)
> +			return -EIO;
> +
> +		usleep_range(100, 1000);
> +
> +		mask <<= 16;
> +		shift += 16;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dmub_trace_mask_show(void *data, u64 *val)
> +{
> +	enum dmub_gpint_command cmd = DMUB_GPINT__GET_TRACE_BUFFER_MASK_WORD0;
> +	struct amdgpu_device *adev = data;
> +	struct dmub_srv *srv = adev->dm.dc->ctx->dmub_srv->dmub;
> +	enum dmub_status status;
> +	u8 shift = 0;
> +	u64 raw = 0;
> +	u64 res = 0;
> +	int i = 0;
> +
> +	if (!srv->fw_version)
> +		return -EINVAL;
> +
> +	while (i < 4) {
> +		status = dmub_srv_send_gpint_command(srv, cmd, 0, 30);
> +
> +		if (status == DMUB_STATUS_OK) {
> +			status = dmub_srv_get_gpint_response(srv, (u32 *) &raw);
> +
> +			if (status == DMUB_STATUS_TIMEOUT)
> +				return -ETIMEDOUT;
> +			else if (status != DMUB_STATUS_OK)
> +				return -EIO;
> +		} else if (status == DMUB_STATUS_TIMEOUT) {
> +			return -ETIMEDOUT;
> +		} else {
> +			return -EIO;
> +		}
> +
> +		usleep_range(100, 1000);
> +
> +		cmd++;
> +		res |= (raw << shift);
> +		shift += 16;
> +		i++;
> +	}
> +
> +	*val = res;
> +
> +	return 0;
> +}
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(dmub_trace_mask_fops, dmub_trace_mask_show,
> +			 dmub_trace_mask_set, "0x%llx\n");
> +
>   /*
>    * Set dmcub trace event IRQ enable or disable.
>    * Usage to enable dmcub trace event IRQ: echo 1 > /sys/kernel/debug/dri/0/amdgpu_dm_dmcub_trace_event_en
> @@ -3884,6 +3978,9 @@ void dtn_debugfs_init(struct amdgpu_device *adev)
>   	debugfs_create_file_unsafe("amdgpu_dm_force_timing_sync", 0644, root,
>   				   adev, &force_timing_sync_ops);
>   
> +	debugfs_create_file_unsafe("amdgpu_dm_dmub_trace_mask", 0644, root,
> +				   adev, &dmub_trace_mask_fops);
> +
>   	debugfs_create_file_unsafe("amdgpu_dm_dmcub_trace_event_en", 0644, root,
>   				   adev, &dmcub_trace_event_state_fops);
>   
> diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> index ed4379c04715..aa6e6923afed 100644
> --- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> +++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> @@ -818,18 +818,54 @@ enum dmub_gpint_command {
>   	 * RETURN: Lower 32-bit mask.
>   	 */
>   	DMUB_GPINT__UPDATE_TRACE_BUFFER_MASK = 101,
> +
>   	/**
> -	 * DESC: Updates the trace buffer lower 32-bit mask.
> +	 * DESC: Updates the trace buffer mask bit0~bit15.
>   	 * ARGS: The new mask
>   	 * RETURN: Lower 32-bit mask.
>   	 */
>   	DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD0 = 102,
> +
>   	/**
> -	 * DESC: Updates the trace buffer mask bi0~bit15.
> +	 * DESC: Updates the trace buffer mask bit16~bit31.
>   	 * ARGS: The new mask
>   	 * RETURN: Lower 32-bit mask.
>   	 */
>   	DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD1 = 103,
> +
> +	/**
> +	 * DESC: Updates the trace buffer mask bit32~bit47.
> +	 * ARGS: The new mask
> +	 * RETURN: Lower 32-bit mask.
> +	 */
> +	DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD2 = 114,
> +
> +	/**
> +	 * DESC: Updates the trace buffer mask bit48~bit63.
> +	 * ARGS: The new mask
> +	 * RETURN: Lower 32-bit mask.
> +	 */
> +	DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD3 = 115,
> +
> +	/**
> +	 * DESC: Read the trace buffer mask bi0~bit15.
> +	 */
> +	DMUB_GPINT__GET_TRACE_BUFFER_MASK_WORD0 = 116,
> +
> +	/**
> +	 * DESC: Read the trace buffer mask bit16~bit31.
> +	 */
> +	DMUB_GPINT__GET_TRACE_BUFFER_MASK_WORD1 = 117,
> +
> +	/**
> +	 * DESC: Read the trace buffer mask bi32~bit47.
> +	 */
> +	DMUB_GPINT__GET_TRACE_BUFFER_MASK_WORD2 = 118,
> +
> +	/**
> +	 * DESC: Updates the trace buffer mask bit32~bit63.
> +	 */
> +	DMUB_GPINT__GET_TRACE_BUFFER_MASK_WORD3 = 119,
>   };
>   
>   /**

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
