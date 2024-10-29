Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0639B4605
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 10:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0EA310E5F8;
	Tue, 29 Oct 2024 09:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZrH+TJrY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A764D10E246;
 Tue, 29 Oct 2024 09:51:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjlPixaoJZA2rJNbNAPPfEOqnYuwZKydB3Lz2Z/8P1QhVtcX+6Qx/F5NqijnsMVlNy9M/4a9Eil44ye0qux92BjCysCK5e1LyWhgmniWG81YzPh3bfHdMGhB5gifVJX1w5U7Tk8lhozfvW6ys71zx+W4lfxTldjgH3IQol6ZdQ7MmVb07mkt+8T9EbwVy9ZOMZ/EffZzVv18ugeo/p49mOZRWjLFQj3NTW4oE3F09g8cDxKg5xWoVZ7CeQmJnXyoBYQsT4mXEakMJy94n3FUWy07c1a7kxzBXaUxEp7eeZTJIv5CYztXEng7ULNUIvASbCETbtn4ACln540xhUgDHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1a9nceOfty++7jcuzA75uIDGh8TwXJHV+AfrWKZi6s=;
 b=CRPcJiAHvmv2JQ+Uanlxk1qCIDUgvthw4FZXpVn34lyTIiwND/8uR7kdQu35MipyDBlDv8/wbX6RgvY922axrNEzPv9HOzQj6hwdGvgI71igfkjhf4cNhQ9vPVwfQiL8D/7TYmx4gei9jWb0ZmwCfOoK9J9YWoVC7YAXb4GEpc24b3LT337Ox04DGjweUHZEcedr0vo7osPsfQve8cP5vI6e6B/s/ARw07vUizSVXaKnoRIBnkNsDtTnW0xZJ2ZZoiEjtdEhkNQ3tFcRguNl3CLBTrGW7xK7VBXyE8nFCN5XqyMjdRAG65Dr4JW9788sl0TPi9ssfRAFqHMMqwk1+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1a9nceOfty++7jcuzA75uIDGh8TwXJHV+AfrWKZi6s=;
 b=ZrH+TJrY7H+8BjYD3dkQZffy/IK4U23Kf71K8m3UUh4I0ikKvLWIDHci/iN/VWoChosDG4ZAzMxzTs8j953NVlts4UhgvGtPmLa69Hs3JhkjfQQJJclh+eEOkCtiNlAml3TARnNVNkMyYjWpuEPWoJF/FL5epBs7J7xMCtdkHXg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7027.namprd12.prod.outlook.com (2603:10b6:510:1be::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 09:51:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8093.021; Tue, 29 Oct 2024
 09:51:41 +0000
Message-ID: <69b81f6d-203b-451e-935b-085216dfebd1@amd.com>
Date: Tue, 29 Oct 2024 10:51:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] drm/doc: Document device wedged event
To: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241025084817.144621-1-raag.jadav@intel.com>
 <20241025084817.144621-3-raag.jadav@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241025084817.144621-3-raag.jadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7027:EE_
X-MS-Office365-Filtering-Correlation-Id: d924e4f0-90a1-47fb-8a33-08dcf7ff4a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWswVGNnR1FhQ2d2Rm12cnhoVHVYRW50NTd4ZDhxMFQ1UnpFY0U1NWdoVVpW?=
 =?utf-8?B?cFdsa3ptVk42NzJuUWNxNU5maW96b0xqMUxIakpza3RNZCt1TEFtc2VPN3Vr?=
 =?utf-8?B?M3R0NjRXNnJzZktnL1ZkcFdGSE1NNTMzZmVyOWtkSnltOUorMlFaQUszS0F4?=
 =?utf-8?B?Z2J5UThjUmVLYXVmWERqazhRTVNiM1B2N1Y5MUk0cjlPTXN3T2VuNk92Yi8z?=
 =?utf-8?B?WW9sK2pCSSs5bk9iRm1nbjFHeGE0UkFHcXp3ZlZsZ2ZGdzFQRlF4L0o4VVJ6?=
 =?utf-8?B?RTJRS1YxWkJkc3lIaFZSN2t0K0ZuOHgveG0xU0pPVE5CTGlNOW0yZ2s1dFVo?=
 =?utf-8?B?RnJLR3lySTg4ZmhjbXlhQ0hCUHBQNHVLam5XL1BMWjRJeGVqWFl3MFJ6cEJM?=
 =?utf-8?B?KzhOZElGR3BsYVRvUjkzaXFYQXVQRDZob0JaNmNacVJBNFJsQkRXUlJrc3Bl?=
 =?utf-8?B?S2tYTUQrdGpIMFZZdmVEQXN6UElVWTFDZDRNR1FMM0JJMmlDeHRCL05JRkJp?=
 =?utf-8?B?ODF1UG1KQmxnY1BkYVczSytoU0xiYzE4elpUY3ZxOC9mV0JTTG1xVWhjMUFy?=
 =?utf-8?B?N2IyTzA5VHcwMWszMm1vREN1Q3pFOEV4TEhrM3A1elB3anVmZjY2bWVrcGlk?=
 =?utf-8?B?WUVEcU9WOTVLWmNsVjBtUjFsMmVjT1FNcVRYM3pPclhBSVlaUy94YVNGckZx?=
 =?utf-8?B?ZmZzaFpySkV5Q21Fbm0vTU9DSmUwbHJ3R3NGZmtUWUV6TFJzem10RHErbFN5?=
 =?utf-8?B?cHNVUXozd0ZmdVZ1ZU9RR1lNcURqbjM2U09xZUxoTWJkMnFWNmtOckl4NVow?=
 =?utf-8?B?OE1uYXhMcUYxaDJZU1FjMmJzcWh3c05QNE5FZkhrYXhHbDB4dVZidDJyd3Fu?=
 =?utf-8?B?QkFVVHY3RVJwOC9td3kvL0xtdmZraHNLdE5lU2VZR3RuZURnaVJpcTF0RGo4?=
 =?utf-8?B?MWgvQ3l1ZWhESVZhZllicnh0TktNdUoyVzArREExdVAzWU5OaDJlNjlWSGk2?=
 =?utf-8?B?bWMzdEJsNXBKNDE2dndyRjV1bkZrUGRzVk9CdXE3OFhzUUxPUzVJZ1FHbzYz?=
 =?utf-8?B?ZXpOY2xtS1VHaDY5WE82Z1pwbEY2QjdwTjlmY1RxMUtEaDNjNnVkcE42bzJh?=
 =?utf-8?B?MWJqNm1XMTZJejlNSTR4WlNFYnNXQXJLZC9vUkdBMkNVd2Noa3BtZE1OT1Vs?=
 =?utf-8?B?NVBpWVd6emhTa3Q4RXBFeW9VUEFFbm5DdWdYeEI1Zjc5c3Y2VjgrajA1NVBS?=
 =?utf-8?B?eXN4cnZHL2JGUFQySW0vSlZ1WEZyUUdhR0t4RjQyQ3VKcThycE91ZHkyMWNL?=
 =?utf-8?B?Mzl1UXBCcTZJbkc5WDVSL0JEdS9ZdlpiNXJmbkJPbUxCNmZGb1hvRkJtbXBH?=
 =?utf-8?B?cDlCRWk1TzNPcGptbloxUjZNSVQxNHkrSGVhcDF3UmNFNTM4Y0ZSYWI2dHFM?=
 =?utf-8?B?TERJRUx3ZTVxY1JEbFdXNUdwKzBMdmNXK2wrNFhUUUVieE4zMWtCZWhWc2ZT?=
 =?utf-8?B?b0ZySnllVHorVC9laExuQmdiVUJxWVdJeVlLVzhaRGVjZ1ovM1k1OGRiSUlx?=
 =?utf-8?B?MVJPRDlueFphRzFiTEZUaDZFS292NitlMlJ5b3ZIWk5JQnBLeE9yZno3TGhW?=
 =?utf-8?B?N1BXOEd3THFOQ0x5VnpHVVZoTVIyWitKMGJVVUtOa1dDbmJaT2FrcGl4b2Vw?=
 =?utf-8?B?bVNHYXRNTkQ3K2QrSjBYdkt0TkJWSDBLY2JneFN0clU1QjFKcGEvaEZLSGJp?=
 =?utf-8?Q?566p2N46+zFh6BTyQ+qarP4qcRDNlUx+2T30vWW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVo1RFJHS2krMTltUkZuK2lLSGg1czhQNVF0cG9uZGViWDNkdVdEWEM0cENu?=
 =?utf-8?B?T0VHbU4vc2NhNXg5ZjIzZUE0andmRXZBVlk2M3lVVzczZ1c5T3NhMU5DOVJI?=
 =?utf-8?B?VXNGTm5CUmc0bUx5RFoxaVVDd0FYcWpucmlIQ3dCSXA3bjJrUktDbkVLNllD?=
 =?utf-8?B?czh3bHFPVTM3bjltYXdVUEJEdEY5cmpudnF2Tm9IeDNIVE5qM2dyQXFUZlJn?=
 =?utf-8?B?Qm1icVlBU3lCblRIVXdkRFF3ZmlNRDduTEtSQm1YQ3RZOFZsb0xuaitaNHor?=
 =?utf-8?B?dUZFK2diVzY4WlA2azdJaWtSZjA0YzA1bGdLcEtlMDBmdDVPUi9adGJ6dlFX?=
 =?utf-8?B?SGZ3MVh4ZDVlcSt6dTMwZVpabTBsYUt3RmFaN29EdmxWK1dEQzV4MW96aGZ5?=
 =?utf-8?B?RlNuamF3bTNuSzkwNG53dlA5TGRVWG01bGJtRUtqT3VpNWFFby8zbk9SeVVM?=
 =?utf-8?B?a3VIeGc3ZmZZMURINVFseXBQcFhJVFB1aWIxZklJY2RtWXp1anpYMSszcGFH?=
 =?utf-8?B?OWxHOUt2ZmF3MHp2ZnlWMEcwcGdoVjA1WVkraXRGUFhsRXZybDQyK2VzU0xw?=
 =?utf-8?B?THFJNS92dFdLaW1RU0svWmxQOE1nT0d4cG9EMEFJdDUzNzIrano2WHgwYlZp?=
 =?utf-8?B?NnpsSWVqVTI2dnF5SkdrZHhhNXp0b0k5WEI2Vmx4cFhuYkRidmt0SlYrbkQr?=
 =?utf-8?B?OS92c2xBSWZMc3VOTXo2QmtqZEJNSHdxYWI3T2dmT2MxOCs3czdvZzFtV3JC?=
 =?utf-8?B?U0prTExTL0lHUk5wNWRzaXZYOHFRbldHcDdXRmZIcUxTcFpZd3hpc3lSWFZM?=
 =?utf-8?B?RmZwUEFZNWhHNjIzVTZaSXp0emNwR2txcnZTbXEwRHhub3dLZytNbGhSMGsx?=
 =?utf-8?B?TTV4Zkd2TzR0WWpLc1dvTFF6eEkyS1FjblJQTHlneDFEUENuQXZsdDh2TUQ3?=
 =?utf-8?B?VGh1MDhSeTlPbDZVczJwRFhuRE9KbDEra3RxZVJvMnppOGh2OVMyeFVPNXdO?=
 =?utf-8?B?Y3czL0NTdG9iNk5YNzlabnZaNmVjQ0UvQ0NPNlc3eUI3dTZheit3eHdKZ09M?=
 =?utf-8?B?c1VxeG02VGlLWVE4V21rWlRsaldUdE5JemNtbGVkRER1azhSUUZId0FFR0l1?=
 =?utf-8?B?VlorMW9jbTg1ZXFiYVhKQVRBUDFGTEpGaVpCdmJiQUZLK0hYamY5NUljWUtF?=
 =?utf-8?B?SHRKNk5JWHp0ejNrc1djT2RKUEpuZUxJbUNURUZWaW1NblluMWo3R1NLQk9r?=
 =?utf-8?B?VFRrbXUrYldPQzBtYnlsYUFPMnk2MmJPTGdmT29WNEo3WXB5cEorK0pGdXVn?=
 =?utf-8?B?eUJQV1QxZ2UxaXJldjFlZVZEUUtLaUN2c3dBdFBHZ2hJNDlMS3lFaGpEN1BQ?=
 =?utf-8?B?K0JuYWlPZWt3WWRFR0VtUUs5cnQ2UUpUaWNWbUgzaVZyaXhDSEtRUWd0MFFL?=
 =?utf-8?B?QTNhb0hOK2pwQU9pL0lWWWxrOWEzaWZXajVONjZlVXMvZ2xRRVN2cUttR3ly?=
 =?utf-8?B?L2w3TE5RVnk0VTRwYm5kaFYvcktKdWJob1VLY3Z2MW85a1cxMXFKSUgrTHQ5?=
 =?utf-8?B?QmdxMEVHdEVFcHU3WkJhOUwwQWE0dko3UndsbzlhODJQVFFHdXAya0F2OHZs?=
 =?utf-8?B?UGVJbExBdTNpelg3TThPOEJ5cDNNajZLVUU1N3VPL2hVL2oxWXZvck9Hd2JM?=
 =?utf-8?B?Nlg2b085WlJ2by9VcnQxSVBpNUl6bFlRTWViM0VzbTBXSngvRUoxWWZWYzYy?=
 =?utf-8?B?MitXRG5vZ3FUTFpwUmt2blhna0RTMldQeXNlUFJXSTBVMDlwKzZMeU9zZnJt?=
 =?utf-8?B?bGxKY1ByMnh5NEw5VDZJZTVHeEFwODlLcVJueVphVndCQWlVWUhyWlR2ZTdj?=
 =?utf-8?B?TGowd05PVkFDWjVrRkxxbzJlczF2d0xVRDBjeXE3OUtFVDMzZThBbkxxczNR?=
 =?utf-8?B?bGFaYUZBbktETTNUZGpHVjlSUWY1YjdmL2x6ejVpZnRESmJDZFdsVTJkNWRC?=
 =?utf-8?B?Y0tqT3pQbWJFUmNhbzFaQllUNHFHalNHQkVDUWM4ZmFSK1daeDJLRGlyZkJW?=
 =?utf-8?B?S2FFM01OMFFMbytOWHBSUWh5VG9tL3ZJZGVXdWZWQ3R3RjV1Umt2UzhBcWVs?=
 =?utf-8?Q?Wbs1mlPwD2RdLq44amivt2TgY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d924e4f0-90a1-47fb-8a33-08dcf7ff4a17
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 09:51:41.4492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQ120UbbIWXTuG7W/ZfoWT35PIDce7ZvWotUa4Lbqdumjb1ZHvnPi1mTuzERceW+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7027
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

Am 25.10.24 um 10:48 schrieb Raag Jadav:
> Add documentation for device wedged event in a new 'Device wedging'
> chapter. The describes basic definitions and consumer expectations
> along with an example.
>
> v8: Improve documentation (Christian, Rodrigo)
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   Documentation/gpu/drm-uapi.rst | 75 ++++++++++++++++++++++++++++++++++
>   1 file changed, 75 insertions(+)
>
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 370d820be248..11a7446233b5 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -362,6 +362,81 @@ the first place. DRM devices should make use of devcoredump to store relevant
>   information about the reset, so this information can be added to user bug
>   reports.
>   
> +Device wedging
> +==============
> +
> +Drivers can optionally make use of device wedged event (implemented as
> +drm_dev_wedged_event() in DRM subsystem) which notifies userspace of wedged
> +(hanged/unusable) state of the DRM device through a uevent. This is useful
> +especially in cases where the device is no longer operating as expected even
> +after a reset and has become unrecoverable from driver context. Purpose of
> +this implementation is to provide drivers a generic way to recover with the
> +help of userspace intervention without taking any drastic measures in the
> +driver.
> +
> +A 'wedged' device is basically a dead device that needs attention. The
> +uevent is the notification that is sent to userspace along with a hint about
> +what could possibly be attempted to recover the device and bring it back to
> +usable state. Different drivers may have different ideas of a 'wedged' device
> +depending on their hardware implementation, and hence the vendor agnostic
> +nature of the event. It is up to the drivers to decide when they see the need
> +for recovery and how they want to recover from the available methods.
> +
> +Recovery
> +--------
> +
> +Current implementation defines two recovery methods, out of which, drivers
> +can use any one, both or none. Method(s) of choice will be sent in the uevent
> +environment as ``WEDGED=<method1>[,<method2>]`` in order of less to more side
> +effects. If driver is unsure about recovery or method is unknown (like reboot,
> +firmware flashing, hardware replacement or any other procedure which can't be
> +attempted on the fly), ``WEDGED=none`` will be sent instead.
> +
> +It is the responsibility of the driver to perform required cleanups (like
> +disabling system memory access or signalling dma_fences) and prepare itself
> +for the recovery before sending the event.

That needs to be more like a warning and should have a bit more text. 
Maybe even a separate section.

Something like this maybe:

Prerequisites
------------------

Drivers needs to make sure that the device won't harm the system as a
whole by keeping it in a wedged state. Necessary actions must include
disabling DMA to system memory as well as communication channels
with other devices.
Further drivers must ensure that all dma_fences are signaled and other
state the core kernel might depend on are cleaned up.
All ongoing waiting for hardware state changes must be aborted and
new accesses to the hardware sufficiently blocked....


I'm not a native speaker of English, so feel free to re-phrase that. But 
the general approach should be like don't do this before you have made 
sure a, b and c.

>   Once the event is sent, driver
> +should block all IOCTLs with an error code.

Better define which error code that should be. I think -ENODEV similar 
to a hotplug case would be appropriate.

>   This will signify the reason for
> +wegeding which can be reported to the application if needed.
> +
> +Userspace consumers can parse this event and attempt recovery as per below
> +expectations.
> +
> +    =============== ==================================
> +    Recovery method Consumer expectations
> +    =============== ==================================
> +    rebind          unbind + rebind driver
> +    bus-reset       unbind + reset bus device + rebind
> +    none            admin/user policy
> +    =============== ==================================
> +
> +Example for rebind
> +~~~~~~~~~~~~~~~~~~
> +
> +Udev rule::
> +
> +    SUBSYSTEM=="drm", ENV{WEDGED}=="rebind", DEVPATH=="*/drm/card[0-9]",
> +    RUN+="/path/to/rebind.sh $env{DEVPATH}"
> +
> +Recovery script::
> +
> +    #!/bin/sh
> +
> +    DEVPATH=$(readlink -f /sys/$1/device)
> +    DEVICE=$(basename $DEVPATH)
> +    DRIVER=$(readlink -f $DEVPATH/driver)
> +
> +    echo -n $DEVICE > $DRIVER/unbind
> +    sleep 1
> +    echo -n $DEVICE > $DRIVER/bind
> +
> +Although scripts are simple enough for basic recovery, admin/users can define
> +customized policies around recovery action. For example if the driver supports
> +multiple recovery methods, consumers can opt for the suitable one based on
> +policy definition. Consumers can also take additional steps like gathering
> +telemetry information (devcoredump, syslog)

I'm really wondering if we shouldn't standardize successful resets with 
this event as well?

E.g. like there was an issue with device X, please collect the devcoredump.

And then as a second step have the WEDGED property to indicate:
a) reset successful, no actions needed.
b) detach and rebind from the bus
c) bus-reset
d) impossible to recover but system as a whole can continue to work.
e) it's on fire! Run sync and shut down power immediately.
....

Regards,
Christian.

> , or have the device available for
> +further debugging and data collection before performing the recovery. This is
> +useful especially when the driver is unsure about recovery or method is unknown.
> +
>   .. _drm_driver_ioctl:
>   
>   IOCTL Support on Device Nodes

