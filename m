Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 841F47E201F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 12:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF2010E2CB;
	Mon,  6 Nov 2023 11:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7442510E2CB;
 Mon,  6 Nov 2023 11:36:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDdhnEc0mdRhVOF0kZScvzLlsojNCShzpOcQBZ8ysExXIgiZAFZSOn4ysGwoLo/ehaxVSCbXleLEY3Z2B1Z3Tk2X97RKIdJk4RL/ph1nxnGNCnvFiYFUROWpWe5sTmZuM1U3s9aEn7r/UVLfIRc1iVT9j3ZLIe3GhHqRyeRV6zdN/riSbJXj/EBm/2F3HWXr6cZdRz9PDtfj5MHCdOFKAKkPBsPpqquwyqATRW8jydVffZRog4HR9xSj2OstvDBpNQ97cS9to9FsMu5TuYUmpLy2zGCvupZXv2DZp/jAefExBuGuBx6JChJT5LPrPx3ubqnv/wD3ZzajOTBtMkKAqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqTlQeBgbcIWowlcj0q5vh8XTUTb21oIVfbEgmfJk8k=;
 b=aRYF5BaeyVJtBYTvSn5FsKucnRnPght/3VsHDrk52FtgVwL880amU9JQyshZFQDqVqU7Cxl9iA7falHfqyEV08s8Ai/TrmMiqzKH4T7+uGrEEhfNtDTDzBMtGQRzGa5CyfE0BI1zEwoDyeVqWzIZeocXmN5HANHIWgUQzrq957daRYD44Nxuv4bV1NCxIh7mSibLWvpTbh84YaVlBTjwkQlk278XSoZisHyyU2AjFJjPxT1g7cQt1muxVKbVSK/nN2BKu3n2SOEQXNP3s8Lqj2d6XwYDjQ27BKkUYUU9uTl72c2FN1z7AVqG/iiAGWZyrRES8aHiaaYJkSC1KDmceA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqTlQeBgbcIWowlcj0q5vh8XTUTb21oIVfbEgmfJk8k=;
 b=MQ6t40LEFmdatmWfP/UStT2F/3YZlnvNWsN4u4IYollffhvI1U62Fd/tYgTC3o8Uyg7jnqcww+/71b8hiPrF0eKXxLqp5KMLoxCJTFNU5Jur6dMIWA2gtOcrWRVru0zsdEpREd5TiY+HKj21jIsyqnJfuolqxfldTSouXDMBdPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by DM6PR12MB4403.namprd12.prod.outlook.com (2603:10b6:5:2ab::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 11:36:23 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::ce36:81fc:9c50:c892]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::ce36:81fc:9c50:c892%6]) with mapi id 15.20.6954.028; Mon, 6 Nov 2023
 11:36:23 +0000
Message-ID: <29c3e90b-9e9a-b428-661a-bff5d2b034af@amd.com>
Date: Mon, 6 Nov 2023 17:06:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v1] drm: amd: Resolve Sphinx unexpected indentation warning
Content-Language: en-US
To: Hunter Chasens <hunter.chasens18@ncf.edu>, linux-kernel@vger.kernel.org
References: <20231105210044.70371-1-hunter.chasens18@ncf.edu>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20231105210044.70371-1-hunter.chasens18@ncf.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0197.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::6) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|DM6PR12MB4403:EE_
X-MS-Office365-Filtering-Correlation-Id: 8716dad4-c51c-4787-69a9-08dbdebc9a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +CuBxQQ2uDnf+8Ul6NoMb7Tr7HfvJZNIUi1yoqcA0Zgi5APwPKPQwGESjB4eNxKGQrYGPaHvw5y6IR1jrLoAyA88ixFWaZPsAvq6TW/QMJAvPLBNGTEH+XToITuQcuQOg8vJPDow03sBi3/pp7LrkLcUJAaDqeThprCcY05IS0EGe7/2vr/WELOdnV4oRRO/eBA0CAP/NETCSqk8chz0mZg2XVmOtCqTUWLbPf44Hz9qA40hUx1pkJ/NvQmry1e81fzeRo03vm+DyEqgM5bPY475VCQDDo9GEVEzV5ZA1vQe6ROnBa3vR0VfZfLNK97dyCKidyBxBztM0mnTPInBEARKRYeooPy/kwRgBDrReUubmyuYr4SkKmbkDL4zLtRDWNULaharmgVl/6cf298RK3oDCl3cagDmOoqV9LUltr4jlAB4jIe/ayiVjZGz0LaZuZywbxUa3s+YxNHgWeVnFBIcfG75m1JKqkuV49NSSmGOMy+8WBgj0C7WoN10dwfg42FMWSJCXiBLZGWny3+R8yabkWfsvC943L5qrluM+Udq1PKAFpudz3jQmKsNMDoAnGol8ysf5kNSdhwKxKCNMMRIlA545eM4NRPsUsND6Ikpkfx4YnxeWarG7PXH8rhBw/aRYz34v6RWQYdszJlrfY9u5tGhZncaXAhrQNtyRl8hEhjufHcFQZTavwKazgyL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(366004)(136003)(346002)(230922051799003)(230273577357003)(230173577357003)(186009)(1800799009)(64100799003)(451199024)(83380400001)(316002)(38100700002)(53546011)(478600001)(6486002)(6666004)(6506007)(66556008)(66476007)(26005)(6512007)(66946007)(2616005)(5660300002)(2906002)(8676002)(36756003)(31696002)(41300700001)(86362001)(4326008)(8936002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWtUam42NWRYalZqN05mWWtrM1dqejhMTktCZHRtNkhuekF3a3dKTXZjMkpj?=
 =?utf-8?B?dHhSeW1XMTZ4QU1Qa2x4eHRoeWlUL2Q4TnJNZWs4TjRsbEI3OGVQMkI4KzZN?=
 =?utf-8?B?U2k4QmliTkhjemlKYVVtZmUzOU9kVCszWlpac3ZpbnBjcC9sL3ZwMzRxZHY2?=
 =?utf-8?B?WGtFNGFsc1YwNVlvY1ZaeUhkeTlhbUVKVmUzNDdSNjAvSHQyNlIybnQrWVNr?=
 =?utf-8?B?T3JEYWFYNnZibjRIeE5xY2g0ZnQ5YTlMelg0dkExcHNsTWtDc1dVWDlUU1h4?=
 =?utf-8?B?a0kybEViV0FXaGIxTW1zM3UyeDFiaGU1MTkvZzAvNTFWc2RJdEltSXlWVERk?=
 =?utf-8?B?Y25mYTFxSHYydmF3cDZDN3JHa2dXUVNXajdpQU0vTjlJUldpSklLckpaY050?=
 =?utf-8?B?YjlRR2JocjJrUmE2SVI3amJhWHl3bXlwSlRFV1lmcWx3N1c1cEpZNjkxM2NB?=
 =?utf-8?B?b04wdDdNUitnS1U0aXVNbkptVHY3SFdkMU01bG5ybnRVRzVBUmM1akQzNnZY?=
 =?utf-8?B?TG01enBiZ0VvWjUrT2RCdk1VUHUxLzJKbmkyRnJpdmFVRHN4cDdUS0phaVI0?=
 =?utf-8?B?MXdXL3V3Q3pIZWZkYmFuTEZzVXpHQzhQdlVmVll0bXB6Z1dyUVNMUE8xUC9F?=
 =?utf-8?B?TTIxRHNVQ2lONkZob0JYdnJUMGZGMTBCTUQwWmR6aGhIbmlsSGNMcjlMaTRN?=
 =?utf-8?B?NGdMQTY4TGRCTVQwQjhLRDZKYnpXTVQ4eXo0dDlhNjJJNVByNENxMzF5Rk5F?=
 =?utf-8?B?TzBxb0JKZDBKTWNydVpxODhaZUR1eDhpYXNBV3VMQlZCcUFVM2M0NDI0REx4?=
 =?utf-8?B?ZUZwYXgzQUdqSGlIcDV6aW95Tk5rMkl1WjBSZHBFSHNWcnJCL3hveFdxZktP?=
 =?utf-8?B?STVONVJJak5jNzRQSXBKWnZDa3RRMmtxMlg4d2p3eVY5MzRLakRhTlBUOFZv?=
 =?utf-8?B?ZzF2aHFaY2kyTFNydUZYNE1EOGN5NkVQdFh6SDdKOUdlRHN6L25odVkvRXBQ?=
 =?utf-8?B?OUNlbUk3NmVDUmw5QkhyYlI2cTFYRXVQOHoyOUJ2eW5TZTR2ZTU3djdKWmJs?=
 =?utf-8?B?cGNSQUFiRDExTUNIL1RlUVg0ZTJnZzhOM254TjFTSVE1SmFQQ0VOcFozU0tV?=
 =?utf-8?B?RW1RSk1kNjR5YVJXbkJRQzJvekdWSk9TLzIwaGtjUGdGQVlsdlUrenY4QkJG?=
 =?utf-8?B?NVpLbkIxSXZCQTZMck41Vk8rWHo4TDRuR2xQSWljVDZJbFMvRVEyR3V5d1o5?=
 =?utf-8?B?TlpUcW94RmFVcjRPb2NrTUVZZmFHSVFtOXErdk5mQWRlNWIxMnlOZkozRkRO?=
 =?utf-8?B?WUt2c3M3RW5EUEV0NEJTdlhPeCs2ODIybFdjeTFZRGd6VGE5dVpEdE54THlC?=
 =?utf-8?B?TXhJU2VZdUVtV2YzaSsrQ0tUcVFrUnl6eE5janduNUg5b2NKdkFoY085WjRS?=
 =?utf-8?B?Z1ZKTm9RT3NwQ2NwK2xVYnVNUUtXT3dkR2NlNmx1Zm9MMStMTXFEYnk1WGpx?=
 =?utf-8?B?YmFURmFBckQ5aE9WT3Z2QVRqOU1ZV3VaV1hPdCtDeEFURzFoYy85VVRUSlZq?=
 =?utf-8?B?UVBqa0hCQTJPb29uMCtNc1lVamJCejFacjNERHAreHgxdDJtOWNOTHJOMU5z?=
 =?utf-8?B?dldTbmNjNDlyOFJRZUh0T2wzc0Y5MzdiRklaRXdjNndET1dZclR0QWtXNHp3?=
 =?utf-8?B?MUdaSm1kbWpvMnJyL3hBQTRURTJ4enFSRzZzNWFoaFl3enYrNG5jcGNUS1lr?=
 =?utf-8?B?WDhvSVRVYUh5NjdxaVlwVEY0RU5GTzAybk10bTdpN2toWkRMQlpKajBKazNV?=
 =?utf-8?B?cndLcDkwdWVrdGlPV2RtcFhORDZleldnRmFwZUFNTUQweTZPZTZpMUFmS0dj?=
 =?utf-8?B?b3dJdjRoZjN6TmxDa2ZtckFZN3IvSDcxSTRNeWV4R1NidDU1dlViYTdEMzJw?=
 =?utf-8?B?UXFKWE1yOFVsZ3ZyNWs2N1FhOFVPNEQ3TzQ5YnV5MHlNMlNDMm0vbXhJdTFU?=
 =?utf-8?B?dzBWMFJZR0UxQWZ1TjhISVhFVC96K3FZSlNYdjM4S1Q3cW5VRFpDSzQwSURW?=
 =?utf-8?B?Ni91WVJ2ZzRHR3R3VG85RFdMcjYxcHRBL0d6OVN4eUtMV3BvYmNGMVRqRzBE?=
 =?utf-8?Q?V2DWJ0yKVYh655JY4YaFmtWxP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8716dad4-c51c-4787-69a9-08dbdebc9a65
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 11:36:23.2838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ySbcIUKNkuHmTucnfMFw/4uNUAyriY2V570r+VAtySSQ1C0hW5jlQp3X1W5iz87
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4403
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
Cc: linux-doc@vger.kernel.org, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, evan.quan@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/6/2023 2:30 AM, Hunter Chasens wrote:
> Resolves Sphinx unexpected indentation warning when compiling
> documentation (e.g. `make htmldocs`). Replaces tabs with spaces and adds
> a literal block to keep vertical formatting of the
> example power state list.
> 
> Signed-off-by: Hunter Chasens <hunter.chasens18@ncf.edu>

Thanks!
	Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
> ---
>   drivers/gpu/drm/amd/pm/amdgpu_pm.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> index 517b9fb4624c..703fe2542258 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -990,11 +990,14 @@ static ssize_t amdgpu_get_pp_features(struct device *dev,
>    * the power state and the clock information for those levels. If deep sleep is
>    * applied to a clock, the level will be denoted by a special level 'S:'
>    * E.g.,
> - *	S: 19Mhz *
> - *	0: 615Mhz
> - *	1: 800Mhz
> - *	2: 888Mhz
> - *	3: 1000Mhz
> + *
> + * ::
> + *
> + *  S: 19Mhz *
> + *  0: 615Mhz
> + *  1: 800Mhz
> + *  2: 888Mhz
> + *  3: 1000Mhz
>    *
>    *
>    * To manually adjust these states, first select manual using
