Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93337D0024D
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 22:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF28210E665;
	Wed,  7 Jan 2026 21:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dHjayqDi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011032.outbound.protection.outlook.com
 [40.93.194.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FEFD10E659
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 21:20:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwYvJrq9ET1loXkcoCvL0g3pRXC/K8S9oZ6DVcae/p8dsGP+/X1Q4TZQdV4BwYV66uk0a8siG5fMZBzBV63yH6sCpSB+uhRVUsxE6jwMHuI164YYSesim5dk6dc2A+7fViqFG6aMAKjAema8OEx4aXGUlIN/bZHwQRI1dkQBY8otr324DzIo9GWl0IvsjlTFtzoJG7FabJsOukWSuLjqmH3PLiTT25jKTrr7muaJk2GHc/lvv3KywOkyvYvIMQd6UNYIQ9gBC2Ib3RU0UFSRGIwW4bHgnGcIJivmB9+m1PTvUOPgb5PmjifctME/jUQ2RIJQqDLnQgk/lm0I9/yaRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5QH2t/cI12XByXzliklVaSiqbHzpoShETe+UPwglZY=;
 b=LdSGGTsemjwtqdO1WlscVejWMbLoQn6p1jMuwuO+D8e8mdVw+8kZD5mLCNzAx1bttyYJHqOtvG7RE1PdD3VvcwRsCEpwrspcamfJ7o1isOrYUlsbWUyZuMFuYOiA2sawD9PtWRlXrbyIge4xexffobesE4Luu/YnjXjRi36/vi2P/yfitVaY/xRrR4uloAMZ/8CnqwP4yblp1JRhh/zURnsRgyDn4I8H7oZy4ZeHvj7nUlkoFomYRw/Tv9L4GBKwhmwuspfDe3gKFJwHbYUJFbp5KTypzCediiY4SCGXtHxP7PBTBzoABlWTHFGC0i2L4fl3j6zSljGkeOmemc4GQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5QH2t/cI12XByXzliklVaSiqbHzpoShETe+UPwglZY=;
 b=dHjayqDiRLEk52FKi+RmMpHLrpRTBwnZYrkiUtODyajn1n8/Au4/iJvHiVf5ZpKawuFVZR8kWa/awHfndv7N6TzFdKhaWGfkKNvWcqCYDptuAYJvO4MzQW3+Sft9tDVINXpeCdEhK5fIgcu2rWqdoKmC7/C4WCJFJnbn3iYn3t8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB8573.namprd12.prod.outlook.com (2603:10b6:8:162::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 21:20:52 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 21:20:52 +0000
Message-ID: <0eb1b06c-72be-409b-b49a-e340bf49453d@amd.com>
Date: Wed, 7 Jan 2026 15:20:47 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/2] accel/amdxdna: Update firmware version check for
 latest firmware
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251219014356.2234241-1-lizhi.hou@amd.com>
 <20251219014356.2234241-2-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251219014356.2234241-2-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0037.namprd04.prod.outlook.com
 (2603:10b6:806:120::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: ef2b74b0-71f8-49ef-ba75-08de4e32a2b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWVQeDlhbUVRUFJVbTViY0dwWnY4Si9jU3J4QXBjNGU2RXlVUWtWN1dMNzlS?=
 =?utf-8?B?Nm56Y2Jja3NOa284eXovSEZmTzM2TVJXNDhFeWNOZ1drUjFycUtjbjNGQlpR?=
 =?utf-8?B?UUdoM0RPNnRpdWVBQnVPOFNHZHMyWkRoc3pocUpudkxORVRJV3VGRHQ3dHlR?=
 =?utf-8?B?eG85QXdISkhFUEJudjM0YjZqckdCdHAxZ2N5a3BOQ2JtZnRFVE9aNkV6d0F6?=
 =?utf-8?B?VHQvVXZJZmhvaW1MOGV0WnE2L0NlNm9BYUZXLzFqU29mMDZXcGtodmM1N3ZZ?=
 =?utf-8?B?ZUljaHV6b3R6VXFEeXJVVVdhaDlVR3NlRmJMS2pEbkxSVnBJdWIxbTJTSktu?=
 =?utf-8?B?dGhKUFBJc0MzOXlLRHk4K0Ezc1lmK0k5MDdGb2ViSVZDblpaQkhEMXhEQlQw?=
 =?utf-8?B?UWVGSjJDMmFwZWRSN1N0K3dtMnhpVUdySnkyZHhnWWdHeE1jQU5sR2J6a09G?=
 =?utf-8?B?OGM0djlmQk5VZnZpbWFGb3FLZGNWOG1kcEUrS1hhYi9YRVVZWHUrSlAwdEFv?=
 =?utf-8?B?T2Z1cm5ZalRZVkdUSG8ybUs0eFExMVBSdzdRelliU2owdjA0TlZ6bGxpWDU3?=
 =?utf-8?B?d1NVV1ZwQzZESnFRRDR3ditMb1ZoNWdxTlY2dGFrYy9SR2F4dGQ1aGp2WFNa?=
 =?utf-8?B?OE0yVWt0MHBNbDd2Wm9wRnMwMVFiZzdMV3BLNWQ2aC9MT1VlYllzcDU4WkdO?=
 =?utf-8?B?dUY1SFhmTzY0WlA2YkhjbDhGb1ByVlluZHVDQ05rTVlqWm5jb3hlbm5SY1pv?=
 =?utf-8?B?dWZuS3dYY3FNQnhzU1FabE40VWpXcWJncTA4TFJXanVnaWZjWVU0bk9xcnRB?=
 =?utf-8?B?ZXVSSHVEUm1XV1hPY0FjT0NCQmZ6M1UxSExiMFpySWNvUy82aVY2ZnFvTWRz?=
 =?utf-8?B?MGJyaFk1RmhyOW9vSzMzYmluK0thUFFmV2RnWlIrRUk0ZElYSnF1MnRNait6?=
 =?utf-8?B?Q3czZEhQT1VuUGFWUmlNa2UzYjdXcnorR0VjRkZYb3NjY1c4WWRNc3IvSTRJ?=
 =?utf-8?B?QnVKZTVOQWlqMmdoTjVOa2JPSDVwaGpHbnNqeDVQRm9kSUdVWmE4SlBQZGdX?=
 =?utf-8?B?eFB1YTNLaGkwbGhmUGNtZjZDWHZNS1Q5NzJpUlZmMlN1bG80UUNNNHBMZ3VI?=
 =?utf-8?B?Z29nQW5Zc2JHRUQ3TXJTUG5STnQ2eGxTbnI1cFBFMnFNUTVETmo4eno0WStF?=
 =?utf-8?B?SlozNTIvR2p0d3FDendCd3JHazFzZ0dtVzdzRUVMUVRaSEpLV1ZQVjYzVTI1?=
 =?utf-8?B?R3A2c3lsRVZPQ0FETktoaG9sVmplQ0E2dW80SGdzUjFiNmgwNzRUemE2bEx0?=
 =?utf-8?B?ODFuV3Z0eFQ4NzZQWUhzN0FHTER1dE1WdkxFTXVVRHVjMXVSejUwNnpiRk1T?=
 =?utf-8?B?VHFQaXFhL2VoMkJ6WVJWeWR5TTkxU3VQTkUyempKbG5FeG5GaVYyZ0NibVk3?=
 =?utf-8?B?YktGODBUR3VnREhWZUZ5NGZNbGFST1FjbWNvTElKWUVST1FMMmZJUGRrY2RE?=
 =?utf-8?B?b01RQjc3dDZ4L29CcFVkQmUxNUdvRWRhaDljL1dOSnhVTzVxM2N6SW9SblhN?=
 =?utf-8?B?L0lvZUExN1NkaVYvdHFNYlBYdmcveTZzZ1A3MmxtVE03UU5GbFpTNEUyL3E5?=
 =?utf-8?B?Y2VTMUVmdWJDUTdoT3o2THMyT1ZBNk5wU3lsYlFiTlIyWmQ1NS82Zm01anBW?=
 =?utf-8?B?bmJ5d2c3ejFIeEVGQ0tOMW4vQjVUMzZaaUhlQ3ZENUphQmNXQ1krZkJxeU1D?=
 =?utf-8?B?c0E5V05qeHZsclZJblVIZGM4ckwrWXNkS1hFcjZtNEJRNHpoUFNNZXhPOTRm?=
 =?utf-8?B?NHJnQVV2MkRaQisxZStLTklYQndPUG9EbFppTHhjVmZZWHhjRUVUWG9sWjYr?=
 =?utf-8?B?WnhvVHp2RHlxUTJueXVZeWh2UlRLRkM4UTJadWRLbzFPMjJkZkI0UkhiV1Fl?=
 =?utf-8?Q?/1fBKD3IpBERAwlDlVSpcnND/nYenLGe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T21ReXQ5djRraE00eDRxT1oyajJVYXVlOHplckViejNhSzNwbkpwM2pGRU45?=
 =?utf-8?B?NzlpMCtPT2J5d0RVUGREekNqdDZ4aXBlN3crRm8xeFB3L3kydkFzeCs0RmNR?=
 =?utf-8?B?N3Y5N0UyRXhWN0pua3phNWNXeDMwTGdEY0s5eWVJUDlLVXcxMnBub0Z0U2ZV?=
 =?utf-8?B?Y2t6Z2ZUNm41eWN5a1RzYUllTlBacDNCUXk4NnJjaGd5NlNxd1BXQmphRDZm?=
 =?utf-8?B?M25WWWlhaFlFRDRVeFV2a2ZhUndjQ0w5S1BCZjZvY2FFNmRYWVltZUVWVHN2?=
 =?utf-8?B?WFpJRnN0d1NQbEYrY21GMmtmZ1VGTld1alJEajhmSUgrL1BKWGpzMXlKb2xr?=
 =?utf-8?B?N0hOR0UwN0NKNytESmxlbldyMGs3a0ZmM0MzQk81MjN2WkdXZ3dPQjBvbE5x?=
 =?utf-8?B?d2tHcnRXRExtdk9iLzFaSXJUejBRNjFMMTRSS2tML3VKWnAwbVBoazZsQzNa?=
 =?utf-8?B?UXlDUTNCbWlTdkMyNjJnWGhLdkQ5ZTJxWE9rdzlOdDR6K2tib0pLUHBSdUYw?=
 =?utf-8?B?OFl6dldjb1BxcUV1UmhhOUYrWVh4cUt6bU10bVc2SnNSVGlCMlI3WWFydTM5?=
 =?utf-8?B?Z0N5b3poQ2RCMlRPVmtBQnlJUWduZytERFA4Qlo2UlNqUUxEUC9nNEZDNnFT?=
 =?utf-8?B?TnF3RGcwZERUV2FGVFRQZWdJVS8vdWE2NVB2c0VHV0Zmb0MrR0R6dFN1NFNR?=
 =?utf-8?B?ZUVYekdoWGV6cU1ObUl0SmhPbkI2WXhWM3JIMVN1NGxsZWw0Wi9rVHVTUUdW?=
 =?utf-8?B?a3FkMVFyMXdKNXpGNnNkc3FGMGhDOHdvNlg0R0lxbldXVklXYk1xOXJTaHhi?=
 =?utf-8?B?TjVVQitRTk11MHJ1ck9NRVdsKzdiUTRNNTNKS0dkaDFTWnpWSXMrWjZ0dVBE?=
 =?utf-8?B?cnVyQzQ4cGZKcGFOdHU4R0w0VzNOSUNOOXNJUldiTmxPOHFYY3dmZys4TmNl?=
 =?utf-8?B?aVNZaHlBYkVNN2h0WngwS1pCa1I0eGZybU00VTNmMXNrdVV4aEdoZVd6T2t6?=
 =?utf-8?B?aEFzaHlOaFRiKy9XVTlSTDJXeUIyT0hoblNPZGFIaEZ5VWN5SXhjNDNtVHk1?=
 =?utf-8?B?MTNBNHA3WVRPd2JmRE13enZEOHQva1lrSmZsWWRjS2srWVJkU2ttc3BtaGFq?=
 =?utf-8?B?SFZ2d1RHcjdTOFRyODIzLzZUbWd2K05uZkdKWHVUeU1QSjErOEd4V0Zhakp4?=
 =?utf-8?B?b1RkWnlaYmFJS1pFNWdDalVqd1AzSmwraThZRjVvU21udWhKMUROUGNRdGxr?=
 =?utf-8?B?NmlleXhzUjQ5TU1hWmQ4Z0ZGN0ErRWlZWXdYTEtrTDZhQ0dUanhxMW0wT21R?=
 =?utf-8?B?dkZlajd2N3ZiY1ZaSHlWQWFET3BlZlBFNEt5MUl1OTZUWG45c2JMa1ZVSXAr?=
 =?utf-8?B?c0RiL3hIay9UbVN4RU5rUjR2aDN0NzFJN2JDTGh0VmNzLzhwMWJ0TjFDdllL?=
 =?utf-8?B?TFh5bTd0YURHN2RGRmt0TmVKdzd0Mm1TNnJBNlRBV3RpeVJDRlBBd2VzU2JU?=
 =?utf-8?B?S2tTUG5leW81RFZSeHBkMFBLNHFsOVpqdVg1bVExWHFDa2Q4ZHNoZ0ZseXZu?=
 =?utf-8?B?NDl3SVlGUnI5clExWktuR3U1VHF2VWtta3ZLUHRRQ3BBaUpYWHFQbnRHUmp3?=
 =?utf-8?B?TVFoaHBwOWYwUitFSUJJQmk1TWpNYTFnenI2d1JnWjR6aHFBa3h5Q2QxTXU0?=
 =?utf-8?B?SnJ4V1RMdGJIN1BYTlFJdmFia0w1bXRZc1VXdExJNy9VMTdESmZWV2d5eTVJ?=
 =?utf-8?B?dWtlb3RwOTJwVWdIdVJSMUN3dHQwVXVQZC9TYlY2d1hSNXM4NzBQUUxXcHd5?=
 =?utf-8?B?Qjc4MHlGd2NlaFZRekZ0NXUyelptOVZxTmsvSDgzUFdWR0tVTFBSMG5qVk9L?=
 =?utf-8?B?Z3I5NCtiN0JIbEhjRi9oYXZLbndXM1ZGREN5a3VLM3NOMkF3c3lsc3lvSHE3?=
 =?utf-8?B?cjIwZHBWOFZmVVQwbkRTQUZaMitZR0hwMUZqWGYzSTNMYTB4N0dsYUJ3NDBO?=
 =?utf-8?B?Uy9nTWpDYzlvSUdNWEQzZTI4L2JmamNCN1BTYlg1OXJJZFZaNEJpOCtEZm5Y?=
 =?utf-8?B?c2pwbDA1cEV5ZkpPcVlWM3FpOG04YjQ0eDNubERHM1Z6em5YSjh6UnE2UmI4?=
 =?utf-8?B?RnNsZHZqMjNCUkU3VERTQ0t2YS9rVVdUQ1htU21jVlpLcFNFendIaUM1M3Rj?=
 =?utf-8?B?TWppdkFjdmViUXlObUdDbXg0WkQ3UUlyUTV2bk5CNWZ4bUpCOHdQbVJ0cHFI?=
 =?utf-8?B?bUtuMHprenBrdkl5aG5YWDNYdWZoLzN6YkplVWlMbEZpczQ5K3BiMzMycXpt?=
 =?utf-8?B?dHR4QWoyTFRrY00wTTRsSm9mWEhCdjhxbjZ2ckxwTnNkcjVaRG5TQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2b74b0-71f8-49ef-ba75-08de4e32a2b1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 21:20:51.9348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SEqDal9jnPU07L4nbNafHUkhO4rAzaJIXLNHvoDVL/X8xMncDfrKsa4PwQrAz6rRH4r7xgRVQu/3DN6yIPDkMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8573
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

On 12/18/25 7:43 PM, Lizhi Hou wrote:
> The latest firmware increases the major version number. Update
> aie2_check_protocol() to accept and support the new firmware version.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

I know it's painful and tech debt; but I suggest you add new paths to 
handle both versions of firmware at least until the next LTS kernel.

> ---
>   drivers/accel/amdxdna/aie2_pci.c  | 36 ++++++++-----------------------
>   drivers/accel/amdxdna/aie2_pci.h  |  5 ++---
>   drivers/accel/amdxdna/npu1_regs.c |  6 +++---
>   drivers/accel/amdxdna/npu4_regs.c | 11 +++++-----
>   drivers/accel/amdxdna/npu5_regs.c |  2 --
>   drivers/accel/amdxdna/npu6_regs.c |  2 --
>   6 files changed, 20 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 81a8e4137bfd..181fdbc10dae 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -56,41 +56,23 @@ struct mgmt_mbox_chann_info {
>   static int aie2_check_protocol(struct amdxdna_dev_hdl *ndev, u32 fw_major, u32 fw_minor)
>   {
>   	const struct aie2_fw_feature_tbl *feature;
> -	struct amdxdna_dev *xdna = ndev->xdna;
> -
> -	/*
> -	 * The driver supported mailbox behavior is defined by
> -	 * ndev->priv->protocol_major and protocol_minor.
> -	 *
> -	 * When protocol_major and fw_major are different, it means driver
> -	 * and firmware are incompatible.
> -	 */
> -	if (ndev->priv->protocol_major != fw_major) {
> -		XDNA_ERR(xdna, "Incompatible firmware protocol major %d minor %d",
> -			 fw_major, fw_minor);
> -		return -EINVAL;
> -	}
> +	bool found = false;
>   
> -	/*
> -	 * When protocol_minor is greater then fw_minor, that means driver
> -	 * relies on operation the installed firmware does not support.
> -	 */
> -	if (ndev->priv->protocol_minor > fw_minor) {
> -		XDNA_ERR(xdna, "Firmware minor version smaller than supported");
> -		return -EINVAL;
> -	}
> -
> -	for (feature = ndev->priv->fw_feature_tbl; feature && feature->min_minor;
> -	     feature++) {
> +	for (feature = ndev->priv->fw_feature_tbl; feature->major; feature++) {
> +		if (feature->major != fw_major)
> +			continue;
>   		if (fw_minor < feature->min_minor)
>   			continue;
>   		if (feature->max_minor > 0 && fw_minor > feature->max_minor)
>   			continue;
>   
> -		set_bit(feature->feature, &ndev->feature_mask);
> +		ndev->feature_mask |= feature->features;
> +
> +		/* firmware version matches one of the driver support entry */
> +		found = true;
>   	}
>   
> -	return 0;
> +	return found ? 0 : -EOPNOTSUPP;
>   }
>   
>   static void aie2_dump_chann_info_debug(struct amdxdna_dev_hdl *ndev)
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index e1745f07b268..b20a3661078c 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -237,7 +237,8 @@ enum aie2_fw_feature {
>   };
>   
>   struct aie2_fw_feature_tbl {
> -	enum aie2_fw_feature feature;
> +	u64 features;
> +	u32 major;
>   	u32 max_minor;
>   	u32 min_minor;
>   };
> @@ -246,8 +247,6 @@ struct aie2_fw_feature_tbl {
>   
>   struct amdxdna_dev_priv {
>   	const char			*fw_path;
> -	u64				protocol_major;
> -	u64				protocol_minor;
>   	const struct rt_config		*rt_config;
>   	const struct dpm_clk_freq	*dpm_clk_tbl;
>   	const struct aie2_fw_feature_tbl *fw_feature_tbl;
> diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
> index ebc6e2802297..6f36a27b5a02 100644
> --- a/drivers/accel/amdxdna/npu1_regs.c
> +++ b/drivers/accel/amdxdna/npu1_regs.c
> @@ -6,6 +6,7 @@
>   #include <drm/amdxdna_accel.h>
>   #include <drm/drm_device.h>
>   #include <drm/gpu_scheduler.h>
> +#include <linux/bits.h>
>   #include <linux/sizes.h>
>   
>   #include "aie2_pci.h"
> @@ -65,14 +66,13 @@ const struct dpm_clk_freq npu1_dpm_clk_table[] = {
>   };
>   
>   static const struct aie2_fw_feature_tbl npu1_fw_feature_table[] = {
> -	{ .feature = AIE2_NPU_COMMAND, .min_minor = 8 },
> +	{ .major = 5, .min_minor = 7 },
> +	{ .features = BIT_U64(AIE2_NPU_COMMAND), .min_minor = 8 },
>   	{ 0 }
>   };
>   
>   static const struct amdxdna_dev_priv npu1_dev_priv = {
>   	.fw_path        = "amdnpu/1502_00/npu.sbin",
> -	.protocol_major = 0x5,
> -	.protocol_minor = 0x7,
>   	.rt_config	= npu1_default_rt_cfg,
>   	.dpm_clk_tbl	= npu1_dpm_clk_table,
>   	.fw_feature_tbl = npu1_fw_feature_table,
> diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
> index a62234fd266d..a8d6f76dde5f 100644
> --- a/drivers/accel/amdxdna/npu4_regs.c
> +++ b/drivers/accel/amdxdna/npu4_regs.c
> @@ -6,6 +6,7 @@
>   #include <drm/amdxdna_accel.h>
>   #include <drm/drm_device.h>
>   #include <drm/gpu_scheduler.h>
> +#include <linux/bits.h>
>   #include <linux/sizes.h>
>   
>   #include "aie2_pci.h"
> @@ -88,16 +89,16 @@ const struct dpm_clk_freq npu4_dpm_clk_table[] = {
>   };
>   
>   const struct aie2_fw_feature_tbl npu4_fw_feature_table[] = {
> -	{ .feature = AIE2_NPU_COMMAND, .min_minor = 15 },
> -	{ .feature = AIE2_PREEMPT, .min_minor = 12 },
> -	{ .feature = AIE2_TEMPORAL_ONLY, .min_minor = 12 },
> +	{ .major = 6, .min_minor = 12 },
> +	{ .features = BIT_U64(AIE2_NPU_COMMAND), .major = 6, .min_minor = 15 },
> +	{ .features = BIT_U64(AIE2_PREEMPT), .major = 6, .min_minor = 12 },
> +	{ .features = BIT_U64(AIE2_TEMPORAL_ONLY), .major = 6, .min_minor = 12 },
> +	{ .features = GENMASK_ULL(AIE2_TEMPORAL_ONLY, AIE2_NPU_COMMAND), .major = 7 },
>   	{ 0 }
>   };
>   
>   static const struct amdxdna_dev_priv npu4_dev_priv = {
>   	.fw_path        = "amdnpu/17f0_10/npu.sbin",
> -	.protocol_major = 0x6,
> -	.protocol_minor = 12,
>   	.rt_config	= npu4_default_rt_cfg,
>   	.dpm_clk_tbl	= npu4_dpm_clk_table,
>   	.fw_feature_tbl = npu4_fw_feature_table,
> diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
> index 131080652ef0..c0a35cfd886c 100644
> --- a/drivers/accel/amdxdna/npu5_regs.c
> +++ b/drivers/accel/amdxdna/npu5_regs.c
> @@ -64,8 +64,6 @@
>   
>   static const struct amdxdna_dev_priv npu5_dev_priv = {
>   	.fw_path        = "amdnpu/17f0_11/npu.sbin",
> -	.protocol_major = 0x6,
> -	.protocol_minor = 12,
>   	.rt_config	= npu4_default_rt_cfg,
>   	.dpm_clk_tbl	= npu4_dpm_clk_table,
>   	.fw_feature_tbl = npu4_fw_feature_table,
> diff --git a/drivers/accel/amdxdna/npu6_regs.c b/drivers/accel/amdxdna/npu6_regs.c
> index 1f71285655b2..1fb07df99186 100644
> --- a/drivers/accel/amdxdna/npu6_regs.c
> +++ b/drivers/accel/amdxdna/npu6_regs.c
> @@ -64,8 +64,6 @@
>   
>   static const struct amdxdna_dev_priv npu6_dev_priv = {
>   	.fw_path        = "amdnpu/17f0_10/npu.sbin",
> -	.protocol_major = 0x6,
> -	.protocol_minor = 12,
>   	.rt_config	= npu4_default_rt_cfg,
>   	.dpm_clk_tbl	= npu4_dpm_clk_table,
>   	.fw_feature_tbl = npu4_fw_feature_table,

