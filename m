Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA246E4043
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 08:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF8710E35F;
	Mon, 17 Apr 2023 06:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::61f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3DD10E35F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 06:58:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUCIluitJhWinAylpgA25J/Fi70a2sJfdFBSlaqdRqpaI5s1bnbHN7kLzHm464tUxRDGYhIVYoe8Bv4/nNAqELI7LXMQXHtPAI+/TFqrADsoLFxPCUD375y2QXZ8+QUmhblDJ2ZigaxpPH25vQFrFwKTj1Qfb/CWPjWrZIM1kba8R3bK1TfBZWdp0KqRK1iC2hwhkyWxz3EgQYAmR9uIepkhLVRqnoD1M/7P7lCRmmrOtVAWboVG3Brj9jJ7WjoRrtV/ffOBmqebIth9IBH5CCr5TVOZ3IXz7m5gzuTa66QzFXu6O09k/OEwf2bgOA82T5Yx11Q64BAgbXVGqQiSHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=429hsLPc3da6ZTJs18unyxBe1692b1kDPIhbOLb53pY=;
 b=E7YkiZQFYNMXvJ0cBrf5tOgtko/NzXMlm+XlH/tX0aKQX1nwQgi8BS0P8R9B4CfJ2o0jqKcdvKMXIByKzO7pps9J3ltdzYAqtB1PTzpqnP/Nkxul1Pfntu1VT9Pi32oZ6TxU/d38OOlVsE7WmgAzQ+WthTU2pbUKdiY1Mt7q4xPq+uYu2pW66db0Q7BLLiUUixyb0qMsIV38stjfmN5anbjVU9dTQZC/ZnCYMgsUICtMuZvCg3KxG0+sN4x3QHw4rXYwR95YrQAQOOCCWQghELkl5YmQQVWbZHJrxijjVYLpn2u9NWEzpApWu47t9wHR26aKIF2vJE1JgWgf2zPyow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=429hsLPc3da6ZTJs18unyxBe1692b1kDPIhbOLb53pY=;
 b=E9bTqje8KQmMh8LJ/K+dtz2ebFfZ1dE7He1HQslAGKZKIiCmaPxokfOmLldTyByG98rUunnk0uBRH6fWgVPbS/2WhTjMNhbjl4CebxrAoSHoHil07Oy2R4nDYl37NM1j/y3Ih2a9OgT0hzsPUv64xAv/5ffDn5FietjoCvBCCdo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB6878.namprd12.prod.outlook.com (2603:10b6:a03:483::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.49; Mon, 17 Apr
 2023 06:58:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 06:58:34 +0000
Message-ID: <a8ca8691-5507-a80d-357c-43d45a44d799@amd.com>
Date: Mon, 17 Apr 2023 08:58:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] dma-buf/dma-resv.c: fix a typo
Content-Language: en-US
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Sumit Semwal <sumit.semwal@linaro.org>, David Airlie <airlied@gmail.com>,
 Li Yi <liyi@loongson.cn>
References: <20230416143849.1142779-1-suijingfeng@loongson.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230416143849.1142779-1-suijingfeng@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: de5763d0-a255-44d8-8ee9-08db3f1128e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 260tvEH3Qp+b3rnX4ZBROJb9stEAy+A5rw7SmmODpaMNPiGEQ5bt/WcSvCCTXEZivNmDNc4hIwEe4cXLiOWQSg7Ifkk+R3GYo1fNrsEKNX4mzcu84OqVzsKsla23/ftgjBtzI8SQOfmtiFBPnzcPjETvTxceP0FrmDzTgJWipFxubpTpd8JPwYanX0Qv5O666q2Xzma6B7R8H4I5hgkibipAQ8r/nf6h58gTBDayzFXkobBE5RNo6bFu4CBDwcEFFrxAEqFKbzjspSxkGTjulEY3TbUJDq0YI6SyS/Y96Ze9Wah4irAvMJ+SW8G62VO9OE3POjQLZo4OLWRLEFrDCaDpRvPAsSGSbXmKtnZHseFy58r8p3kAWOFvafzXo0T+DYo9XkqRPga6xsO9dvV7dY24Ia78HEkrTJxs8JY9sALNv8lSDnCdA4AH0ytYEte2A5ubKcQe9XAAiBY0yd1uzul+2AlkyexD6MkVHY99Dq91Qf80tlTyafMOnbKUYUf70yQvzC8EE7MP0ltlV8rbDTj5nMUkDp5gdTnMNq+uJA8LE5CzHvEDV+nrRJgonvKxM13IM+FhIVfxaffM+umpy562Zy7QjWQcht0yhNhfezNeTfSKYslh24JVCe8fhNLahAsdaXSnQXN9kF/beDLdeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199021)(110136005)(31686004)(31696002)(4326008)(66946007)(66556008)(66476007)(86362001)(478600001)(83380400001)(38100700002)(2616005)(316002)(36756003)(186003)(41300700001)(6666004)(26005)(6512007)(6506007)(4744005)(2906002)(6486002)(8676002)(8936002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmxKaHZDZ0dMeEIxUXJJQXpZNDVvVGp4aFpDaVJVQmNkNUl5MTR3cWVmbmRC?=
 =?utf-8?B?QjAxSzVIaGVEWGc3V3NwNUpsbGQzRVZoVG1BNlV6TXVOREhBSmlLUElGTWdL?=
 =?utf-8?B?azd0UG1VenFYcXJ1UmFlbjRDZzJQZmhXMzJYdE11dlBYTHJjNFRZZnlIc0l3?=
 =?utf-8?B?MkZRUWo3TFlTbG4yb2xudW9zUTI0TzZZL0VpMFlaT0pZeDA2eitpSEw4b1hK?=
 =?utf-8?B?WFllSEp4WUovMWNYY0JMRVMwQktLcW5GV2NLcnNuTis4UWc1K1JHalBzMG53?=
 =?utf-8?B?VDBYTHN3YkFEdUJ1a21iK3dTT3dsUDczUEo4V0J2YmlhSWVOVmo3SnFvaDhG?=
 =?utf-8?B?VE15K0xXZ0FzS2lXSVNlREQxT2luUjhWY2RCU1IydkNQVGVvK1lXNUxDalJa?=
 =?utf-8?B?Tkl3by8wUEQrMTZOWTAwb0o4TEF4ZzR0MjM3YkVhMXRGTmpJYUtwdG1SV0xK?=
 =?utf-8?B?bWVkbm5jeTAyai9LK1llb0NZOEJGRGs2Zkt3QzVxVjdUZEFoRERzd3hrTHQ5?=
 =?utf-8?B?M1dRSFZjTUErRklrSG1wTy9vejY1dUhhYjNWblcwNGUrN0cxTGdsUlR4VUFk?=
 =?utf-8?B?ajFrQk9aMU5XbktVRnZjTzNqNHNvaStiTlhjS2w1RHo1dEhHbTNVeGVrQ2cw?=
 =?utf-8?B?aFZiTGpUL2pYT0ZDOXRTbUZkU2NucDlXcEtTbXVjNmhsRk40Z0J2bUdXNERD?=
 =?utf-8?B?eHBpa08zZHFuYjE0SjI1czlHbGRlZUhxQjlUdUcwSnVFbDdaU1RrbFphVUh6?=
 =?utf-8?B?RUpmQngzdGNzUU9Jc1IyTmtpUlVud29sekNnc3h3WFRCRkNNZ0E2Q0FiNVdi?=
 =?utf-8?B?TVNPbFQ2dGFJZE0wNDI4T3BVbjE4emcyZVhnaEFVRXlYNU9FdXJHMEpkSThJ?=
 =?utf-8?B?OWlXd3N3NDQ5NlR0c1VhTnNlTmxBdThia3NWbDk0a0lXbWpxK2ZGQm1NYkpH?=
 =?utf-8?B?T053N0dHbE8ra2VXWG4wR1lrVnhFN2lGYmdYbzJFSGtCdngzN2gwV0lSSFh0?=
 =?utf-8?B?ZDdybldCeEpnNzN1SkMrVWhVRE5hYVprekh2OU5YV2FBVHRtWDc5aFdLeGxG?=
 =?utf-8?B?TjRObU54UVl3TVFTM3ZwWkFXY0E0L0RxS1ZsT1BpanNmWDU2ZU1yWkJsejZB?=
 =?utf-8?B?SFMvWlFoeVo3L3NnVEU2WnVOT0V6UFVRcE5QOTNQa1RCaGVNTG81UkNCMG9E?=
 =?utf-8?B?alorMzhlN3d5UWp3cDRKRUc2MUlKVnU1YjRLWm5mRU1UOVR4bTV4cW51WWFx?=
 =?utf-8?B?TVNSdTJSckl6a04xOE5RejlLTTVHYUtxS0ZZSHNFSFI5WWFFcGZFQzc0RmZM?=
 =?utf-8?B?MzNZcWplWlp5MGRIdHViMUpjYVpTZ1ZyNytFOU5HQ3JSOE5aWE9SNXFSeTlI?=
 =?utf-8?B?SWhBa3A4dGNMUUhldVdNYzJFblhDQmExMGY1RkVCaW54MExLeFpJU2diZGh3?=
 =?utf-8?B?VCsrVFNMa3lrUGJTSU5STjBNMlJMQ1VqbXFoZ1ZaTk5ueFFySGQ4Q21SQUdv?=
 =?utf-8?B?bWlLSzVzS2pqc3AvT1p2RVlmL284bnJiVldUMkJrSVJoa1c4RGl0REROQmZv?=
 =?utf-8?B?ZW1zWDcrOGdFZXZHK044S0I3U2hTQXQ1dW9seTdkMTBGUlZ3bGtDTUFIRU9y?=
 =?utf-8?B?Y0V0QzNrUEMwV3lmK1RhTUhCMjgwWXFEaUh4Znkwa1Exb2RPUGlsOENaU0FN?=
 =?utf-8?B?blZqVEl4MnZsWHhxZStXcisvSkx6bGVjN05yd2tUR3FpTjdkMnBPcmVTVzFE?=
 =?utf-8?B?aDRtS2w5Tk9GK096MG1JOW4rVFRQTDUzV2hKMEQ0Z1BJT29EQWpyeEZWTWNt?=
 =?utf-8?B?WXJpZDBWcG42RWYrVkF1YUd2VUFXOWxSeGtITzdjOVlZVlhwaWJHUEpQQWlC?=
 =?utf-8?B?S3RrTlVXSVNKa2dSYlduWE81VTY3SnJGaWViY0hWQVIrbjd3L0dUMmVjeFlj?=
 =?utf-8?B?YUF6aGF3SnBoMG02Z3REaGdiWnE2Mkc0bTJnOUNNSTVuR1Rmb0pka1JWVTJY?=
 =?utf-8?B?M2xXWWJVaWVjOGVXL0VIRUNtL09GOE4yVFgrckxvZTBON1RkamZOaFV1d3ZM?=
 =?utf-8?B?alZWYXh3VW52Z1ZLalJTQ1VrWldqTUJZUDBrcURpYzhPSXdHZG5zVFZweWxn?=
 =?utf-8?Q?9GcQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de5763d0-a255-44d8-8ee9-08db3f1128e1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 06:58:33.8757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I55xPpllG5rmV9m/CPEtsPTmM/BRJhsjmuI5a1N60gBjsNhybdI5UxDhBHhse/nP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6878
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
Cc: linaro-mm-sig@lists.linaro.org, loongson-kernel@lists.loongnix.cn,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.04.23 um 16:38 schrieb Sui Jingfeng:
> The dma_resv_wait_timeout() function return a value greater than zero
> on success.
>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>

Reviewed and pushed to drm-misc-next.

Thanks,
Christian.

> ---
>   drivers/dma-buf/dma-resv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 2a594b754af1..b6f71eb00866 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -660,7 +660,7 @@ EXPORT_SYMBOL_GPL(dma_resv_get_singleton);
>    * dma_resv_lock() already
>    * RETURNS
>    * Returns -ERESTARTSYS if interrupted, 0 if the wait timed out, or
> - * greater than zer on success.
> + * greater than zero on success.
>    */
>   long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usage,
>   			   bool intr, unsigned long timeout)

