Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E73079AA19
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 18:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B7210E334;
	Mon, 11 Sep 2023 16:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5188010E330;
 Mon, 11 Sep 2023 16:20:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=em7sX2PfJ8Ptj1vQp6IcHt1ysrGIZOYsKmkOciikSafjIFgq656HcZnH+cZO2/8sR1AYv51Cg2Yovxs0+8oQhLdh1pPWg4n+dX4F19X1eS8iEZ/tFSyU5x3M1bYLADnOS7aM12bwp4NHLorxtUKA8qYUiOfiL6TNU1Ip8n4TLN9Wv4fuqxFDtOr0+TUEAa3zT6cqiIe5WYKpWqwb7QswXGGV/1YgoKjFoWpKpQjbi4Z5PQqrNc+sKJHy0otn0q+NFMrUzyHR9Y58q5cXCDA/WTZas5J9SKoDkpPJlmlfb7Lult67ClCbyEzDRBg8ofMdmHz8+VmIo3Grbrcdg1709g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQCFYc1t/h61X0LCmLE5dmLPKp9sz79uS2p+dFKj5kY=;
 b=BhC1lji+FgApg9hqcwoglD/FxW1L4dZ7h5UJXdcoXbbe4t0SxBQhHfkx+B3MmMzXlinHYbSDH6ekuQLpfA1oVgacSvtPQfVYW2ytGHhGEPTrfZXGJEsmm6pW0zOb8pJz/GAUg9tRgjQuWXbiHB+AGSgeueNaThSTWdv3NTk1B8TJ43GtYcrc3eEhWP+hJGmx91xcQoQLMwyieLc2Fr4ZCfz5XGam34qcwUTf1Ol+4/zk/1jPgWUxpZJtw+E890bb3p3f6ABLAijVc0VRPQbvguRBtwk9mHE2dBAfZbkQ+7vGZcJk0R+d+89hmugEDS7o+Y11GqVZ7Bo+JD7NquagCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQCFYc1t/h61X0LCmLE5dmLPKp9sz79uS2p+dFKj5kY=;
 b=OeuGM9ZCwQsBXjZZk3v7I3l4a53Xo1pAkgEnFYWF2K4LlATMtW1hFlwZMl5owfjQ5ehn80lE5ZjqQLG4XG534b4YCAo9WwbLSjSAeNDUdxeqS9xJa6N0zFSNB6EAGfofq7Ygvu0B3ktII+BcpZwbQgrptVtoIPjNLgrtnnYlavk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SA0PR12MB7090.namprd12.prod.outlook.com (2603:10b6:806:2d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 16:20:42 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079%3]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 16:20:42 +0000
Message-ID: <fb96e7c8-e153-4cdc-b7f2-6cb9eb0102e9@amd.com>
Date: Mon, 11 Sep 2023 12:20:41 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: fix replay_mode kernel-doc warning
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20230910234450.15962-1-rdunlap@infradead.org>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230910234450.15962-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::18) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SA0PR12MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 594e4b54-cf24-477e-2c34-08dbb2e30b7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dp4frathtFd7ll3ZopttNgBpuv8mQFPmLYYyeRelGh5UA2b9E9ZWItRyTvGpfrf6JeI++bxF8C1yTF/qsY1NfV7ld/1nVHpsjuxRlW6BMj4yEo+8w2FxvoCTLeqohWErpHk5165wiI0IE5hMBW9CPovH2m0Y2hr9mZODVjv2eBi4wvt7qsHTobFDHXANQ0M6JSO0XnuqV4/12n4bkw8NHbDdl3tImNhIJbKdUq6rwiOCQMHcbzWFzn5bWd2ZDJTQFl1eznqAVLMD1vXiMSgzrELOHGrZCdwtWketxgpA3Xqn0sMOeoXlS+xR5lo2g3PGAWDQJTtNzmHE6wRtYPOoQJe0IwamslvU+ntbT5Lv0alGfa+fHwtug1jpXd2XdDdAAHhUuHcnpvdHirV8oaw210zsCeXAF20ZzaHWf56rbpXt3vswTFeyvl9gka5SQ/akJQiRJCe4/rz/NA8sYDPBo3lb5Z+boIciBqMj/H0BVe0PLLsg19Y9FfbHyi62mRDgsAosKEKK/toShcj33Htz6EMzmzI8v+M6+dTMOHEnTMX1mG41fsP0t2i7Qi6hMGUAnjIcM/9D0PxAZMpsCXEO9AaNNYUg977SRYuaYZviY40AMGOdTXHHCA+EflC6eF3SX1y1KqZyAHbD7pfkebn6xg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(1800799009)(186009)(451199024)(6506007)(6486002)(53546011)(6512007)(478600001)(83380400001)(2616005)(2906002)(44832011)(66476007)(54906003)(66556008)(66946007)(26005)(316002)(4326008)(5660300002)(8676002)(8936002)(36756003)(31696002)(86362001)(38100700002)(31686004)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTVibm9PSkJzT3RZWTcwZ3U0aGtETi9BUC9wN0cwZ3lTcGdhWldFbEY0MHNp?=
 =?utf-8?B?TDV1UW5xdU9zSllvZHJUZDZIWDZWUVVKemtTVnJPYStmK2p0RFNZWklaUVhr?=
 =?utf-8?B?UUxzaE1WemFzN2g3SUl4TzJ0NTc5bU1yWkFiYVVTbG85eVUrVHNxZUcwWEFu?=
 =?utf-8?B?RnA0bGc3TlI5cW1aOWFPYzMxdTFhRi9mZDJ3djl1ZlRvaFNVT3Bib3FCU1lW?=
 =?utf-8?B?RGJXaVJkRnJjT0lRVGNtc3J3bjlwL0pBaEtudldsWEJqNEF6WE1CVzNQd3Rs?=
 =?utf-8?B?MFQ4VWhRZW91b1lxMTBqWG9kTmxnL056bmdTOVhpNVFlckVEU2pSL2ZQeTNC?=
 =?utf-8?B?N1VmVXM5TGZ0dkFsMkFGd3EvRmV4aS9EVklqMEVyTnZLckduZXdkaVZpdnZK?=
 =?utf-8?B?SGZYZUE1SS9TMXBwTXpIZTAwU3dNTDIraFFmTzhRMFdOTjlHRDdxeVYvRU4x?=
 =?utf-8?B?NFQyOFh5MmMzOHVlSTVVczhHTklxczJrbkF2TTF5dnRWUy9GSE5KSWtKLyt5?=
 =?utf-8?B?K1hJQldDVkNvWDJNSVVlcGhLSVA0RGJqa2huMDVHcjZuOU1BdHVRaFF6SWlO?=
 =?utf-8?B?SS9MblhhZkpkcnFISDBXK3h4VFdZRXVzRFpESjNoRXVVVndyaWVZVVVVNUxL?=
 =?utf-8?B?N04zdzZ4RlNDdThFT1p4R0E1YzJNN0J5dXpEcFNPRExSdjdzS3dVQkN3bXBD?=
 =?utf-8?B?bDg2d1NVTUZqUlJBSjU3U3ozSUVRcVV0WXNHclhUM2xxWWdTVXpqWUxOb3FI?=
 =?utf-8?B?WlE1WEdtOE9EUGVTWmtnVHNtQUJjdFRkQk10aXVjREJqTElpQTVsSE1TRm5X?=
 =?utf-8?B?eTNiRDB4L05ZNDJJR200RmkzVkh3TTg4aDVoTldkT0Jlcm9hWEFOc3V4Z0tB?=
 =?utf-8?B?WThYdW11NURkSkZkUkZMTDgrRlc4bFFCL0pRN1ZCQmdVd0RIeVo0MUlGT2d1?=
 =?utf-8?B?eHBia2NwZ1BxLzh5WDhNSmM4ZVlualY5L05hWUpWV0dYbVNySG5DeFJoSkIx?=
 =?utf-8?B?ZG9BbEJtLzlhZUZyanFhZW5nanlpM2RWdndGeHV1QlBVbks4YWtxTU9uenBv?=
 =?utf-8?B?emdwQzRaVmhOVjhoOXZ5dEN2SlpyYkFqVW5uamM3ekZKWG5sY3M2MFJKaFM0?=
 =?utf-8?B?elp1R3Q1eUlXM0ZmODJoWEY1YmplUFhMcnlheGlTUTZ2ZG4vcE1sdlBIbWVq?=
 =?utf-8?B?TUllaWp4amZDZm11aUFjS0l0OEhsa3RPdmFpVjFpTjArNS9CR2ZHeTh5V1lo?=
 =?utf-8?B?ZEFhRmVpMUQyL05vS0ExWmFEVm9uRCtFaXFTUHp4SmpPbmJmOUwxQXdHUGRB?=
 =?utf-8?B?OHlwWVZjU2phN1dubmdFc0t0cVdlUG1VQllkZ2ozaTcwakIrS1hLcXN4OU90?=
 =?utf-8?B?K3QxY1A4eHlCSXBhR3orUWxhQVlVZWZyUGFUUlVTYjQwQlA5aEx0UGU1M29S?=
 =?utf-8?B?VzJFdDBicmZFSVJra2RwS1F6RGdYNHM0NTE5bCtsdmtaeVBIcTJ4MGtHZzlu?=
 =?utf-8?B?dTBleVBTQXFtem9qZjdRL2N0ZzhvRjZJem9hc205MmdJNzQxVlhheE84UWx2?=
 =?utf-8?B?OHAyUW1XZGI5Yll1dW5FdHZwZ1YxVS9VRWdNeFRCY3ZTcGFsMUpJMmNwRHJZ?=
 =?utf-8?B?RVZMK2NmS2NyUUQ0dUVMblBuc0NjdDdIUXF1Z29wR3dHY2NtdE1LZktwa3J4?=
 =?utf-8?B?WldpL1hsTnMvZEtWN28zbUM0cExhZ3ZHcnJSTFpLYlo5d245TlhWT0N1QU1V?=
 =?utf-8?B?bjBoaVpVOUxud2xHVTh3ZDVHRXpzVUhJWUNUL0NraHZZNzNENkpMc0x2U1ZI?=
 =?utf-8?B?ZE5aSFNVRk91dzR4Y2kxeXR3QzBoalpralpkSDh6dFdHcGxqUGpOWGoyRnN3?=
 =?utf-8?B?Y1doaDlpQ3JxWUY1T005eU54TkxqZVR0TUxNUktkcnpXL0tOZkM1dHhWUzlY?=
 =?utf-8?B?Y2NCS240VXBTeHg3eUgrK0hXc3ZwTmFuSHNXUFdaOHZrblRERzVhdnVBT050?=
 =?utf-8?B?aVluN2hHR1hxb2VsandTcnJvek1tUmhJeHJvTjRwZmdhUHRBUmMzT0twY0x1?=
 =?utf-8?B?OWI5c3NlTXg4c2F1eHF6akFPR2ZYdDhBOEFhWEtDbTJLTmVoVjhMMy9QQ0ZX?=
 =?utf-8?Q?rYVhgYda+Ze3yRkvtQZrA8UMw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 594e4b54-cf24-477e-2c34-08dbb2e30b7f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 16:20:42.6140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSIv2hAN4uwZgK3uchiMcNB576K7u9+PnfBEqQyGEH3TUJUwwneGJdPFpA40HvCBdwuPj9HSA+6FgbAoNt0LGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7090
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
Cc: kernel test robot <lkp@intel.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/10/23 19:44, Randy Dunlap wrote:
> Fix the typo in the kernel-doc for @replay_mode to prevent
> kernel-doc warnings:
> 
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:623: warning: Incorrect use of kernel-doc format:          * @replay mode: Replay supported
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:626: warning: Function parameter or member 'replay_mode' not described in 'amdgpu_hdmi_vsdb_info'
> 
> Fixes: ec8e59cb4e0c ("drm/amd/display: Get replay info from VSDB")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff -- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -620,7 +620,7 @@ struct amdgpu_hdmi_vsdb_info {
>   	unsigned int max_refresh_rate_hz;
>   
>   	/**
> -	 * @replay mode: Replay supported
> +	 * @replay_mode: Replay supported
>   	 */
>   	bool replay_mode;
>   };
-- 
Hamza

