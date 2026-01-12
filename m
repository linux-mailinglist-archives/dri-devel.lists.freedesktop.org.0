Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3C8D11BA2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 11:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F48810E328;
	Mon, 12 Jan 2026 10:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ADDuwjnw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013049.outbound.protection.outlook.com
 [40.93.196.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7166010E0AB;
 Mon, 12 Jan 2026 10:08:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imF5LU5fVGpfsmtRUTMExMkgTXPgqRVgHgp7QeFHG8D26iSwmo0kh7c2SofVaJOe2QyFxUBzlWbNWsTPKqWLDBSpK3ySM+GxjmZ6f2vFLa0W9kX7Mo5cjZXfl65j8LHNg7BT5lnzSaboXNkS4k436RI8JAGkcnzReu1eM27XgvqyD2RaeaIoIClu8OlmhJBADjct7sPp2MMucMjsPN20zHjg61AWluaz6hYQOTZzBjn2NKGpJp65T3oJKBpIE4/jSXG9OLa94QuxJEnBmjwIe4aW11U8Oh/sBLNoc5s9hKC857N6P9wUh8t1MgGE7FqyUeUV5u1u6gvkoRJG6MZyTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7nUYHRrBgr5w9JezPKcDYmhDd3xY/cOZJZ6H0T4TOU=;
 b=njcjZV8OuJEIwT0QN+KGck4D2BI/kvClhlxFqeslzHk1zoGdWcEreWblDaciz+NYQ1/xk8nHr6EPrzxJIV6cEHd8AVtgAOYJQpUuTHFR8edI6nywoKwtTVCIf1+VFXfmWQKjS/D3382FbkMCNIJcObfNuuymHJ6qAxORpHvHkITGHw7OlJR8sQ4hY0pwvyqFis/GIQvy2upOvotXik3nNKQdXKRqyF0XckqOdq+KISD3y9Z00r/QRR7vVTmOg4Hy+VFAncdMwbQSSkkWiCsPc/Z+YGw3/WPw/fd2EtY0HiQTi86noUmlnFe6vCf7e6XGuYBbH1ewUEFGo1nY6myImA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7nUYHRrBgr5w9JezPKcDYmhDd3xY/cOZJZ6H0T4TOU=;
 b=ADDuwjnwc1bER6433rnQvIpAxmRkyLOtieL0UAB1WfeBdPm2esw+7ymLH+6VNP59x4hgoQRF5vnHt9pz95FWO5UDx9dFbC8KcXME/MFEV0QJvcAXdy85H9v4ISzy0nfWMpahoGBGmmuxPGcgDHLaMiTQphBUmiSbhQb6+6aykpE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4043.namprd12.prod.outlook.com (2603:10b6:5:216::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 10:08:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 10:08:47 +0000
Message-ID: <7d1f9c33-1d5e-4b8a-aefa-8180efc2009b@amd.com>
Date: Mon, 12 Jan 2026 11:08:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: drm: add maintainers for DRM buddy allocator
To: Matthew Auld <matthew.auld@intel.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, airlied@gmail.com, simona@ffwll.ch
References: <20260112072447.299685-1-Arunpravin.PaneerSelvam@amd.com>
 <4d76d9f8-0cf1-46b0-bced-8d6e71ff322b@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <4d76d9f8-0cf1-46b0-bced-8d6e71ff322b@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0352.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4043:EE_
X-MS-Office365-Filtering-Correlation-Id: 7089e97b-8ac7-492c-200f-08de51c2936a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlFVZWJjaTdrZDJ6UFFsVDYrSFBvSVV2MG12RzY2Q0xUUE4wZ1VEa0h6WFFU?=
 =?utf-8?B?cGo0N0svV282S1UydXdsa3NxTHR2MWhrV01sM0lLQURpWkI5RFhoMVBHbnVn?=
 =?utf-8?B?bWtWK1k0NnAwQ0RhaHhqQmJjekJQZVpGNkZPU0dwT2cxUGNsN0o0VTdKc3VM?=
 =?utf-8?B?RFVWVnhzWjJSa2dCZE1zWlBQK3E5Rmx6VG40VmZmVFZyMFBPbGFWVzEwWVd0?=
 =?utf-8?B?OURrVFFXQmk0bWc1SnR3cElYaGROV3FZVTBSOVdsMzdOdHgvdDZEclN4RFhk?=
 =?utf-8?B?MkdhZC9CdHR5b2dnSmFKWlBwN3ZhakxXTXEwRUtWTGVqWmR1MldhZDJzSzc3?=
 =?utf-8?B?cWlXSjZqUFUrbkJtMmFPS2UwSTB2QTJwZzlVNVIvREJPa0dTcVdGZVNUWXNX?=
 =?utf-8?B?VzIrbGZjczJFRmNEUFFMS1B0YmI3QlRpRVY1bVRYclcrQ0lWaE1BVkFKM0E5?=
 =?utf-8?B?c2ZqQjFKNGlnVnhOMGRCSW85WmU5Y2Z4QnlwaXJHdHZrN2FWeHFoTnRGMXFt?=
 =?utf-8?B?ODdUWU9NVSt5RTZZTUNvZ0hIMSt5bGlxYTgySHJxK2x1bDBiWC8wZXBLVnpx?=
 =?utf-8?B?dWRGeDNoY01HNmJUWGl6ZkdKUTl3ZmlqeGxqbUpEbXlBWXArTm12QVk2dVpI?=
 =?utf-8?B?Y3JDeEZUR05MMTJzRXZKOGtwbjZURG5aVzZuZmt3ZG8walpQUmVUcFlOZ0Fv?=
 =?utf-8?B?SHJ3QlZQZWc0VHdrbEFqcU11WjFCUWpIL0puNzFBV1Byd0VDYUNlNmFhT1VC?=
 =?utf-8?B?SndoeER3YUJkQWEwcFFQNTZWb1lxVmVJRHpYZmUvUDRFa2JCRHFIUEpJd3Nh?=
 =?utf-8?B?WVRYa0FCNHZGRTVuc1BzYW9meENqZ2hnOVQ3bGtEd1Jrc1lxN3YvRVlFcHRx?=
 =?utf-8?B?RjdoU0NxZ29pMTlXbGFCZURIdE1yUU1CSTk2VnhIb0lqVzBhSC9wdGdUQUkv?=
 =?utf-8?B?eG53WDkrZmFEMTV1Lzc1VFFrUnZhVE5ZNmluL28wL3BoWDhVYjB1bm1nTS9k?=
 =?utf-8?B?ZElPOFZzY0ptSEY0QTY2N0tjbTBKRzY0OHhVdnRLaHR4eTVDQmx0OVFSSmF2?=
 =?utf-8?B?WGJ1cGEwQmhyMlJpQjBPVHJrR0Z0NE9Ha1VMSjVpcGRsK3prTldjc3JESmZr?=
 =?utf-8?B?WWtYL3Bwa24zekFITVpOMUVPQlNyM2Z5UENnNzlqV29KdWZDdFNHdEVMVS95?=
 =?utf-8?B?UU9mZlFuZ0lGMzU0VVlzSDRBblltcjVLOFhyR2VqSXFYTk9Pd3JLYVhaUnhx?=
 =?utf-8?B?M3gyMjNhaTQyVmFQV1c1WnpOY3BvS3E4eVIrMFVpMEttVzlLRU0rMmdwSHZI?=
 =?utf-8?B?VVZoVHNaVDdUK2loL21iZUZzNk0wbUxhRlFJU0t2dU1nMUZpOUY3UmJ1YndE?=
 =?utf-8?B?MkU0WUdEYjVvamg0QjcrTEh0dUpVamwxWHZJQ0o5bWNFYyt4RkhUMHZ6UWRa?=
 =?utf-8?B?Nm42cnFDbUxwUGRadlMrNTh4U1JPWWxKdmVETm5nL24yTDVidmRMSWJJcGlj?=
 =?utf-8?B?eHRqRHQ5aElPZ2Q1bytmRGxRRkdYMW43OFZZZXZNUDc1aEpVaUVPZVVpaDhI?=
 =?utf-8?B?dTZuc0hGMHdETGRuSTFFbGVKR2NmbEppOXIzSC9lMDAxYzErbmh1UGRvWFkz?=
 =?utf-8?B?RWg1eXN6T2dlUnY2Q2dPWnhzaG9zQzAvbnJaLzlFUjJyR2NUOHVod0xXOSs1?=
 =?utf-8?B?N3B4bFJQU0N6S09MVCtycWlDZFlOV2ZiTUViY0E1OHRBQnB3a0VuMDcxQXAr?=
 =?utf-8?B?b2U0b1JZanplcDV1UmFJQks1ZjBweldQb0JFRHdpWnFUOEZ0Yi9xbWpzemlY?=
 =?utf-8?B?U1A5MDFEdlI4Mlp4WUJxdkdVazFRVFBBVCt3RUFhSlUrNUtobkQ0QWJTYXpI?=
 =?utf-8?B?WkUrbklMOUN2MElnMjRLbkZ6d2VyMWR4akc4Z3RPL05YRkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHo5SmRwWTBWNzVIVG9kMzhYS1lKaG9vWENvSjlOcEMrRzNicDd4Ty9vQy9S?=
 =?utf-8?B?VHRENXFFKzVaTExJQkVucGg2aFdialhVZTRzYy9ybVhoalpMZnp5cDBld3dD?=
 =?utf-8?B?dTZlU3VFV3lYaWhPOTZ3L3dPbDJWSldXLzhLTW50ZjhjY241RnZlandXdGtF?=
 =?utf-8?B?dGpocmg5QWptMm5JN3ZTVDRrSTEvd0xkTG02ZFFGMHJBRnRmMkxDY1QwUTJs?=
 =?utf-8?B?MWx2QUtFN2FlWVorai8vSk1zNndjdDFtU3I0eEJtb1FNUnJ6aUpJand4QU9G?=
 =?utf-8?B?R1RLVkIrbEVuNFBWdlgrV2pPMW15VzUrdlBBeWdjOWRmK0E5YzVyd1RQWXRk?=
 =?utf-8?B?MlFwVlZ5Tk9IZk5ick1TbWVxc1FNRE5mL1J2Z0RzaHhQemZaYUZPc1lERmxZ?=
 =?utf-8?B?cWhkQ09KblZZNjVTOFBDVFVUb3VzTmNhb3pEajZBMFhiV1k0TXNHdWJ0ZTJR?=
 =?utf-8?B?NlkvVmVJQ1BjUzhXVlRYaGhieWlheHkyMkJPWi9HVTBDS0NDTkVvYzNQMlM4?=
 =?utf-8?B?Q0VWVHprWjhzaVRsWm13M3ZmbFNySVBRQWZBWGtsSXZ1VFc0M2V4ejdudEth?=
 =?utf-8?B?K29LOW1RSWg2aFdac0xwRytDOVJIUEhIUkUrbi8wTEtRNkZzZ1RsQlFpYlRw?=
 =?utf-8?B?THppbmZlUEl5bHRLK2FTcmFCSXorMWZZUjhPQWdLbDYyekFjaWZHR3FLaWdE?=
 =?utf-8?B?cmRpaiswY2k1MVNmSVJPaldNdjRNTEtvaUxWN3VJWHA2NUtZd0REazZWMTIy?=
 =?utf-8?B?cUJXUm5zWGZuREt3TGZwOGhOVGhRVSt0Qko0dTQrV2pIS3BLRUd6K05QUi9i?=
 =?utf-8?B?azRaUlZXVElXNjR2bDVjVWNpcHJ2MHNmOHg0YVVBSm5ka2FKWDk3L2JaM1dS?=
 =?utf-8?B?Vk54MWRERVJiVEhwbDQ3amZ0NStOQ2d5RTdCK215a2pVR1dEeWRHdFhObVhF?=
 =?utf-8?B?R2wwYUNzSmt1ekQxM3lNK1lGemxEcFpnS3d6cDI2ZHlTdVhQSWIyQ2RzdElh?=
 =?utf-8?B?YTJWQWJncVI4OVFyTTR5c2dlOWxvME5RWlZKcCt5bHQ1dFRGSlpXUjFodWpv?=
 =?utf-8?B?cXd0aFFGNzRoaGcvSVU5Z2t2dTM3MmdOUXNsT1Zla2VRVEJXM1lKZW5qeEt6?=
 =?utf-8?B?OXZjNURHU3JwUW56U2pCMm5mMjFWd09mTWloQzZCZTUwSUlWRGpYKytlZjA1?=
 =?utf-8?B?S25QSUsxWUM0bDhKMlZSLzFrUUZQbUg0OGlFUkY0QVY2aHRHWHJHYzdlRDhV?=
 =?utf-8?B?UDlJTFVDbWVrcFNQSnliUU1ad0tWMUFXU2JjQWY3TFZSYXZWWWRIUUpXK3B0?=
 =?utf-8?B?azA5OGEyNVdoek1yOWFXZzdEVmszaXBmeG1jUUMxTjZkSGUzWEFMUmVHcktz?=
 =?utf-8?B?dXFSVjJLalR1NXV3MXorQmRqMnV1TW4ram9Na1RXRi9NZVdZZUhyeWM4Wm1r?=
 =?utf-8?B?SnFneEVuTXVtRjUwc1djRkFxV2lzRjNUQXhkTUJNNEswUTVQcmVrMU1Ra2l5?=
 =?utf-8?B?SVdoQXJheitMNVVBWHJyNkFIdmx4YnNvYWU1QkFJUThTZkxIRmdlQUlYRDA5?=
 =?utf-8?B?MEI1ZVl0dGEwSnhMNWVOaVVIVkswUlQ1STBzU1haRTJXQWk0UU8vQ1hZVEwv?=
 =?utf-8?B?UzZCUm9iV205cHVjWHZGMjhrTlV6Z015U1pHN3JnWGh5NHB4Y1JsNzM0ZUcy?=
 =?utf-8?B?c1pOT0ZkcS9rZ2NyWWRrYkw2R28zUjBoK09naWdPY0JPVHRDd2pJZmJWSWZF?=
 =?utf-8?B?NXVoa25yZHJmRGx2c2hGNjJEMFNoNGlsbGthS3hYckJhaitVUFI1SzNmb2pr?=
 =?utf-8?B?STdYTDVvdmhEcGVUeEpabE56R2pmSEp4bVBkYnQraWNUWHdiYjVmYndteFI0?=
 =?utf-8?B?cWlQblFBemZHRkN1TUtKLzdDd3dpQTJVZVE3WDNZS0tlTU1DbTRLcWg1cXB1?=
 =?utf-8?B?QVBqWTFvZXd6Y1dKZm1BaGhsWUl5MWJuR1lnWmRNT3FuZC9lYnJ3dlRudzVL?=
 =?utf-8?B?TWEwaXlhdGdtdlRuc0liT3oxaHcvNXp4czhCS0h1S2s2RzRlSytmNjFoeld6?=
 =?utf-8?B?SjY1M0I2UWZWVjlhMVV1aWNqbXU0TndwemZSKzYxUUNDanJnc281VFc0MUNV?=
 =?utf-8?B?SjdVcUNjcm1zYVIvSWhKVUl1bUd4WGtuNDZYc3NrZGRoOTdXdGZXQ2pjLzRN?=
 =?utf-8?B?SzJ0R3FIZVU0TDhUMUYyb1RzNmMxMWJjcitWNVBRMVdxM1V4cHJ4ay9GVjQ0?=
 =?utf-8?B?YzNUelhMVmlrTTVJdDZNdHRFclpUcUhPL1VRa3RvZ2NIV0xCK2JBSThCTU1Y?=
 =?utf-8?Q?2L3BqUzbYp9sBe10zZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7089e97b-8ac7-492c-200f-08de51c2936a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 10:08:47.5247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: khzubBG3fZg42EWgwkY2jCs/os5l/k6ppCkkspHNq6kpUUsV17/bIWjb/2nrIe3P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4043
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

On 1/12/26 10:43, Matthew Auld wrote:
> On 12/01/2026 07:24, Arunpravin Paneer Selvam wrote:
>> The DRM buddy allocator is a shared DRM memory management
>> component used by multiple DRM drivers.
>>
>> Matthew Auld and Arun Pravin have been actively involved in
>> maintaining this code, including patch review and functional
>> changes.
>>
>> Add a dedicated MAINTAINERS entry to reflect the current
>> maintainership.
>>
>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   MAINTAINERS | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 6169bd4d7bac..3cd69f6905ae 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -8780,6 +8780,16 @@ T:    git https://gitlab.freedesktop.org/drm/misc/kernel.git
>>   F:    drivers/gpu/drm/ttm/
>>   F:    include/drm/ttm/
>>   +DRM BUDDY ALLOCATOR
>> +M:    Matthew Auld <matthew.auld@intel.com>
>> +M:    Arun Pravin <arunpravin.paneerselvam@amd.com>
>> +R:    Christian Koenig <christian.koenig@amd.com>
>> +L:    dri-devel@lists.freedesktop.org
>> +S:    Maintained
>> +T:    git https://gitlab.freedesktop.org/drm/misc/kernel.git
>> +F:    drivers/gpu/drm/drm_buddy.c
>> +F:    include/drm/drm_buddy.h
> 
> I guess we should also add:
> 
> drivers/gpu/drm/tests/drm_buddy_test.c
> > ?

Good point, completely agree.

> 
> Acked-by: Matthew Auld <matthew.auld@intel.com>

Acked-by: Christian König <christian.koenig@amd.com>

> 
>> +
>>   DRM AUTOMATED TESTING
>>   M:    Helen Koike <helen.fornazier@gmail.com>
>>   M:    Vignesh Raman <vignesh.raman@collabora.com>
> 

