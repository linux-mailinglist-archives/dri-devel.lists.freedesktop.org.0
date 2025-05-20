Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B43DCABDEFD
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 17:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817F610E3D1;
	Tue, 20 May 2025 15:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e7CMR+KC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF3D10E3D1;
 Tue, 20 May 2025 15:28:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywoP3gTK70YzVp4Ge7Ss5vrED10LhLxAchAD99rqX9IscDH+y5at0ste6GHKpppn9YvoE/9/MDL/XNNlaWT7VM1N3fDGdF5U5pIu6LGdHR/BUCqSQRMx/OuqhU3+l12f3eCeNkO69NkgIhbrVZPOfBm5Kf9IpvGRSvBPWaS0UDy8BUX+5vdoL2wC4tWKKbVybaYVrEYnif4MIho1Gb1OVPMI3S+zI8YkceRClE8JGzQvCjXX+9m0vMv1kIf6k3YZCiocgsPaEWgQ/+WwZ+RQ6EUzC81/vCgcsCy7E8LZ0yc2f4RfUt5zwDZikMfKo4ZYE5cfuYuGHabBk+g+MiCW3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7H8q5NUAYWuYFyCjn62t03YlBbCt9r8BvmJYcnBxig=;
 b=yYQ7Zggf9ypuzrJnmuGtXWgTwEArLrcZj7gROMMk6rvqz0GOQwpr+VidkcRTlaDaiv79DnNwzq3i/6JjCrVIYfiRkdRmmN8+VY+isq/LI/U/qgR2pIuQ8e7tJWeYuLzpapPXTxSRPLNlnaMlI8JSgAhDrciCLLVjmiPerGWbByv/o5AG/O/eufPelWhEr2vIf5cQ9VcqAtsSZFB/YBmkM3gqX0DGZkpxD35E0zkGbLF4GibBLx4VfwjHI3FK9sCzE9fQkER2Y8icgy+7hUcGTAMV3/h264QavVxT2qlVLDcIZ77i8c/w2KZI0CtNkORIIWQcDHgHdxthWJ5aqAVaQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7H8q5NUAYWuYFyCjn62t03YlBbCt9r8BvmJYcnBxig=;
 b=e7CMR+KCrq25npQdy4d3z6gRknRXEisuLNEdSpWPtJvKx/XTkr8U299Kp0QFFi5v7suzQimcLlR/vlbrWKaeM2QE7ewT0L5XrOI+KBEjdRAcAMCZpB6iFtqwTRsJe3ruZE9wqlcr6IpK5qookwWaNcOUV3eHhZu8w2kKRiNrgAo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH7PR12MB5656.namprd12.prod.outlook.com (2603:10b6:510:13b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 15:28:14 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 15:28:14 +0000
Message-ID: <9d80b11c-99db-432d-a9ff-d9e2a7b463bb@amd.com>
Date: Tue, 20 May 2025 09:28:05 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: adds kernel-doc comment for
 dc_stream_remove_writeback()
To: James <bold.zone2373@fastmail.com>,
 Harry Wentland <harry.wentland@amd.com>, sunpeng.li@amd.com,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 airlied@gmail.com, simona@ffwll.ch, alvin.lee2@amd.com,
 zaeem.mohamed@amd.com, Shuah Khan <skhan@linuxfoundation.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20250503211902.70141-1-bold.zone2373@fastmail.com>
 <53d0e162-da9d-4fea-aba3-b96a9da844f2@amd.com>
 <458ee98c-872c-44eb-81a4-cb1fabcc4704@app.fastmail.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <458ee98c-872c-44eb-81a4-cb1fabcc4704@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::18) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH7PR12MB5656:EE_
X-MS-Office365-Filtering-Correlation-Id: bcebb660-7902-463a-22cd-08dd97b2efac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bW5nNEtNY1Fkc3JSZ3ZOUUxqSWJ4N3dkdmZBejlOOUtHeXRERDhiamdBRDhW?=
 =?utf-8?B?L0dmc3hMNjJsV0lIOGlPLy9RU3dRSlM3cnpvRXpxVG0wTEsrVWUvbWlLSzZs?=
 =?utf-8?B?OHpIS04wZnFNNmhBOWlMMm5vbWd1Zjk5a1krZXZtUmd1WUp5SHpBR1FzclNy?=
 =?utf-8?B?WTBpNlh2K2RkaHIvdTBTeXVZNHg5QnlaVFlVK1NxdU1HbDZlZURRVlcvc0gx?=
 =?utf-8?B?Tm5meEdweVJSVDJVdGl4MEd5WnRUNFlsZE9NZFJEaE5FYStoRmUyRXdrcGpo?=
 =?utf-8?B?bWd5WHQrc2ZBUmdjdFFSdjU1cGluV2xaWWxZL0xRbmNZaTFaVmpSM3Jadk9V?=
 =?utf-8?B?Ry9UU3ZNbW5uaVpwOHlybWxxdXRpemladVVuaDE0UzZVeHpNaXo3N2xQNGFJ?=
 =?utf-8?B?NDNWREQrMW94NUlJdTVaUGNNWWFvUkdMS0tPMUMydTR5QkwrdWV0WXIvVG5R?=
 =?utf-8?B?TnEvd1FvTVUwcENYU0pUT3ZPNWxwVHd4QVQ1S2lKVG9wRWVLRXlubmV4SDVm?=
 =?utf-8?B?YmFjQ3I2aXNrS2hDSWhLc3B1SW9PVGpZdjEzV3c3d2I4MlF4cUJGTHYxbHYw?=
 =?utf-8?B?dnJxUXJPbThCei9aNFdGa3grNUpmUm1XbmM3bWRwdWR0ektqRk1ab21ZclZL?=
 =?utf-8?B?VkwwTi94Z2lpRVpTY3hUY3lKdU14Ri8vSjJjK3pKRG5NQ1dXV24vYUZiU25O?=
 =?utf-8?B?WW1GQzhKZXFtc0lXSkpZc2kwbTY0d0ZFdldzSjlQUUJqRFRFSFFZMUZDQVpa?=
 =?utf-8?B?ODgvVm1oMzVpNzdqaDNnVG43eFlPUHpTNzhCSkJKVE9BVWVSU0ZselJaVWta?=
 =?utf-8?B?d3hQdERKNkZDVVV4YU8vM0hqcG1NTjBrM2FybE40UXIwR1pZNldmNHlOdXZR?=
 =?utf-8?B?VkFFL3BKUWZpZUFEK1FFMUxzWHNJS0tJSlltNFZGRXE4WkNFSkI0Qkg0aHow?=
 =?utf-8?B?eUhrRTJCSVVQYVlsNDlQcW13Y3hiY1k3a0x3UXJGaXI3M3lWTmNOL3dsQVc5?=
 =?utf-8?B?bEZqbTBOTjIzRUx6TGVCYmJBQldwclVrdnYzYzZKVkp4YWRPVFJTRVN2YmxX?=
 =?utf-8?B?NEExcS9PTFFVNnQySnE0NlRZZzZ5TFF6UnZGSGY3SmtYdWZ1Zm1MeUUvdzBq?=
 =?utf-8?B?MGgrVFk4dDl3bThnMXNsWStReHUybUZ3dWZuUi9NaVNTZGM5MnY0cnVrcUhH?=
 =?utf-8?B?ME53STN3TmNONE5mQXRPSmIrWmxZc3VvT2NFVFlkZUxHeFJoekpUWnhlQ3Zv?=
 =?utf-8?B?UGNpMnJtdFl1emprTFpUSlpUVTN5K295TytHem1pejBPL0hrWCtnOFB6MFBX?=
 =?utf-8?B?SE1nZW1ZZWpwOHpmaG9TbWRqZDE2RFVNdGpVWXZ5ZzNwYlFiTTJwRmFqMllQ?=
 =?utf-8?B?MmlqTno0Y0I4VnVQaUoxaExaUW54Q05USHZWTDhvMFNwWE1GenJJRnRDRklM?=
 =?utf-8?B?VkNmZVl1YWdxS251NjhrdDdWK2hGaWNvK1BOekZGSjIxT0pkUWRYeVZzVU1j?=
 =?utf-8?B?TW55RjVHSk9zT2xoMzd0MUplc0d1eHJINkljcHhlK3VXS1V4NFFlejZndU5q?=
 =?utf-8?B?cVlNRFJjNysxaExDWTdpUmorMXd2eERtZ1VtK1ZvaGtGQWg4YXB5anhUOTBE?=
 =?utf-8?B?V2NIQ3JhRGZhdDVpTG40NkdjRzNMU2o2b20vcUlkTzJlRlp6K3BmTXg5eEhB?=
 =?utf-8?B?MjhjdWROb3crQWJ1eWZ6RWZTR1VaS2xiQWYvakIxUnoxT0dVelBTYU1rSzRU?=
 =?utf-8?B?eWtCM3ovcDZwa0M2OTNlRmMxL001blN2ZkdKRjY0ZlJIMlhMR1RzQXcyZHYz?=
 =?utf-8?B?cE5kQ2lWdlFTNXBxNG9hRVpYQ04zRktwT3BMQlNSK3pZaEdmT0hjMkVBR3B3?=
 =?utf-8?B?bkl3WXVTSmVLSS9RK3B0MFR3K0gxVUdLdG9HRXd6NDhpQXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHVpc0hEYWV1VlhWZ0tkWERJYXI5RWRsc1NteTUxK25yR21mSTVuSTVKdzZX?=
 =?utf-8?B?UU5VMHhFbnlLWnJkY0VzaVREbEpjKytCb0JGclZ2OUpmZGJwREUwNm1USFJt?=
 =?utf-8?B?SGczL0JpeittempXSmJ2S0UrUnR3T2FJNitGZGhRTS9JZ3BYVWhlRlMvZXMw?=
 =?utf-8?B?andkSjR3Y0FIZy8zK1ErQnYzc0FkWGdFZFM0c0lqQ21vbU1mVzdVK2l2NXpa?=
 =?utf-8?B?SVErbEViOHc0WGNVQk53QTBrcGlkUUtpbDhiYjVBcG1IbmRvZHN6UmxzTHIz?=
 =?utf-8?B?Nkc5cEt5S09lSWZVN3pKMFVjb2hjREUxYm44VVdSU0RyTWFOSUNRWUF5Wmo1?=
 =?utf-8?B?Y0QybmxXbExmcDJ2a1VZWlJ5Vnc3aHl5aEFjUVdwangrZGYrbXRCZXhPd1Vy?=
 =?utf-8?B?RDhnT1grdnZ2aDB0OTlNOFptTlRKOFU2RDBrQ2tlRjNKV1VzcElrOXhMN0do?=
 =?utf-8?B?TEljbnhZYmhOL2lYWE8ySlc3LzlDZXRtREh0Ykw3WEFpajBEdGQ2UkcwL3hr?=
 =?utf-8?B?TGdWdklncHJNQ3hscVVaZTdPSG5oVk5Ca21Nc3hqS1dLZmhyYkJEYzhjM2Jw?=
 =?utf-8?B?aFBDRjRBUFhyUUg5cklwNU80dUVoQlVRZ2J0bjEwMnArMzgrWXNrbkQwVHgw?=
 =?utf-8?B?VFZlbkwyckFta2pFNlpOU3ZobnR4VUU1QlJhc296S0pNK3dwY0lvLzE3SmZZ?=
 =?utf-8?B?T3oxTUlVN1BzbHVLN2ZxNUlhaVVtV2R0YUJNUWZFRHlGTFFaSzZwVnZpUm1z?=
 =?utf-8?B?dFM4L2tIaG54cGNPZ29iWW1yK2VIWFUzbG9OeXhtYmNWT1h6V0k0VVVkcWRM?=
 =?utf-8?B?NHM3WXlxUDJPYkRvL0RMSzd2MmYxbjM5L1EvZlVvNDNXcFFjRytRTGtHaDFz?=
 =?utf-8?B?VGd0UnVVcmgwaU5MOE5lM0JRMVFHODZpOHBibld5dUpDTzBXN21KQkJ2MUxk?=
 =?utf-8?B?VVlJRzllL3h5cU03dmN4bC9DSmQzRVhSRmZNbldrcXRYTzBFeEU4MW45MUZ2?=
 =?utf-8?B?NUQrNVZYUmVzb0YwT2tMOU1vdHRTRHZlVTVTaWJaNlZTTW9YVk5EV3QrUzlU?=
 =?utf-8?B?aGRLcHYwcjI5ZXV4emkxN0VISFdvWFhBK0RNaUVpWGhFakwxb29MdGNZdHZu?=
 =?utf-8?B?ckxBSGR5Z1FUMUU3MFpmM3NiQXlTZzdOdmdBWFIrSU5DVFFNRzgvN1loSEh6?=
 =?utf-8?B?MDZJYTRRL0JrMEd5RERJL2hsUDFOQlAvNnIvRzdkd3ZMT0FvVkE4TncvZGxV?=
 =?utf-8?B?QjRCY3A3NCs4S1JINWl2c2lOQmhxK2FONUNkQmY0Y21HNTNqRHlQc2hoRGFR?=
 =?utf-8?B?aWVHOXp6OUpwb2phSmgwTWFGemJvd28zQ0FWMFRBeHJCYU1XUTZsNzhTKzVL?=
 =?utf-8?B?S1oyKzdJTXJiVUcwR0lPdEtCaDB6ZUg0WDhkbndmS25rQ0p2ZDgrcWw2Skpt?=
 =?utf-8?B?ejQzV3QxTDFEaVNjelhiOHhncEdNdlFxOSs1ckVJVlpHaTZyTlkwQlVCeDRj?=
 =?utf-8?B?dnVIWVVEclhnQ01BL3dtODFwRnZmVlhYSGFXTnV4SE9VSnAyQ1plYkQyNjl5?=
 =?utf-8?B?OWVNNC9LK213N0t6ejZreFJGNjlKcWRyZm5qRGk2YVN3RkxSYVEyNU5oVXpY?=
 =?utf-8?B?TzY5MjNUbFNsR1A2UURRRnA0SW5RQWp0TVVJUW1uLy93b2ZOMmlJcGlkOGhM?=
 =?utf-8?B?M0g0bGN5OTJvOHRMYWlEUElxVk5DcHYrSDNJZHJKeE0xdFRhaWxNWEx3aEJN?=
 =?utf-8?B?YjIrTnhwanpxcFFUcGZNRCtJV1hxdEZjZUZwS0gvZ2F0eUtjVlNhVm5RMEJP?=
 =?utf-8?B?Zkdyc0xmVFNOaXcvWnU2em8yMVMyMU1Cd0ltYXlJNUNoOHI5cUJHaXRmTHBH?=
 =?utf-8?B?Ri8wMWRrTlE4bmZHTi90bWdiMXloYUZ4UlAvRUpmUEMrT3lybjJXdmYwaXVa?=
 =?utf-8?B?dGlGaXU5all6R2ZyWXF2cFZFZENDejhHZ1pLWjZzcC94Z0tKU2FJd1RxZitV?=
 =?utf-8?B?Q2pubWhDdDNuYUE0bk1Gak5XNE9mSzRISFVqa1EwblVqcXNPQ0JtNG9obWRO?=
 =?utf-8?B?OCsweFBtV1FGRHdJa2FtZm5WamlFMmlBTWN0c1FmWTVObFMrMFdNbHl6RWhl?=
 =?utf-8?Q?8NX89dnvuDzYnipF+vVNP7Hyq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcebb660-7902-463a-22cd-08dd97b2efac
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 15:28:14.0175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCgX0tMob7vOYBIqHarhXotrbHX3Ckc/I0i9hji2PnG0yE05tCnM1Jr0Uq2WZ2uHstGQ5145ZGmEq2hV4KQzPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5656
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



On 5/19/25 20:06, James wrote:
> 
> 
> On Mon, May 5, 2025, at 9:02 AM, Alex Hung wrote:
>> Reviewed-by: Alex Hung <alex.hung@amd.com>
>>
>> On 5/3/25 15:18, James Flowers wrote:
>>> Adds kernel-doc for externally linked dc_stream_remove_writeback function.
>>>
>>> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
>>> ---
>>> V1 -> V2: Corrected checkpatch warnings and errors
>>>
>>>    drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
>>> index e6e41678525f..b883fb24fa12 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
>>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
>>> @@ -569,6 +569,14 @@ bool dc_stream_fc_disable_writeback(struct dc *dc,
>>>    	return true;
>>>    }
>>>    
>>> +/**
>>> + * dc_stream_remove_writeback() - Disables writeback and removes writeback info.
>>> + * @dc: Display core control structure.
>>> + * @stream: Display core stream state.
>>> + * @dwb_pipe_inst: Display writeback pipe.
>>> + *
>>> + * Return: returns true on success, false otherwise.
>>> + */
>>>    bool dc_stream_remove_writeback(struct dc *dc,
>>>    		struct dc_stream_state *stream,
>>>    		uint32_t dwb_pipe_inst)
> 
> Hi,
> 
> I am just following up on this to see if it’s been applied, or if any adjustments are still needed.

It's in amd-staging-drm-next: 
https://gitlab.freedesktop.org/agd5f/linux/-/commit/04abe7201d51a094d0edd3e00399a8afa2cd2d4f

> 
> Best regards,
> James Flowers

