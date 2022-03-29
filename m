Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6F24EABB4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 12:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0657310EFDB;
	Tue, 29 Mar 2022 10:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B8110EFDB
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 10:55:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rld5Dw/oHxx10UnKP74OdYsCmvcbW8+DS/S52UwrjssOxaWHSV/b0YsDJCLGw/C34jgYn0IZm1M0jHRqXXZdu5J8/b1/Y2yu6mNhwTT5p2uKlAcz9UQRvVrbcXrn2YeU7YEn/7fMTWUqU+DCob1eQgzJibkx2a0TFb58UZTKO22Zfqavn2BfqP7OCaPq09OKi/7118JagzJQ0J0ARXEQUDG1uaFyI5nUOFepzdfoupLMwfMtOXgQslwiMYOm/kPbEcmFsuoSrCMlw//qMg8tE8nlPZjGHYC1/rM4xoiMx1oNEjgrvVYwvlKxjbd4Q1rIwJiRJIOrEqS3JoW0/3BEVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+rxYqEwZWmRmCTwl/UKEaXhHn1OmSOhZ/DVpDT5RIE=;
 b=FL4kRS0fckiEz+0UFz/ZMUoguPmZDIv/Ao9sTlmwQY4DNSdY3FNAYBzHA5J/pSqD5pFgKn7AJSDY/TGnAGBtBOqJE+LTj8sPChpDXSpeDKxqzL02Pp9TrP1YPXFK1Q5tGuBkCDD1cEOoaDdiDUMS8zcK7TfKhiDSPvtRgkGlXpk5sdsLP3sK/goPz7LP/bR2J+rjqsMmubDBPUvcSSJqQEjQUERzS628BPjVTZfF2c2BjI2yjKUUwu4MLnm61UX9T5bQYsAWPimMVf6Cufj6NahudPgFZEwsIvAtlOr1ef3ARC9s5PsTnO2QxH6oHYzU9layv1HjT/FmfttzW2CHIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+rxYqEwZWmRmCTwl/UKEaXhHn1OmSOhZ/DVpDT5RIE=;
 b=bR7uFOTuMEi8FDIL+tsr4tkq/Wkcs/5ihMzd/xf/xovhT+cZm/2KbREyWMvaiPg05QKpR44IE0wWHUNO0bztY5+xsicynMplXUVYi4bvNdVZ18GBt4vsQy8rJ5QLxZE99rfyvWUgWa+x39ayF80XsZIRJO5NHes0eSqV6ckqjtj2eVCbdd4Qkiw9myoFVq5l5Ms0Xl4VjFHpZKT0pDQYerGR8iM//dV979lxzWhy8ic/Vd7f3nMN1UUspGjasLMKsR3yc4B9whX0ZySuuRpbV+0fL9HelZs2XO3WeOaSb3Sq33Hqk2iIOuzijOHVVG+W2kpqDOgqpWzCl9uH4I2KFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5445.namprd12.prod.outlook.com (2603:10b6:8:24::7) by
 MWHPR12MB1534.namprd12.prod.outlook.com (2603:10b6:301:10::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.22; Tue, 29 Mar 2022 10:55:44 +0000
Received: from DM8PR12MB5445.namprd12.prod.outlook.com
 ([fe80::e0d3:d505:3bd6:e79]) by DM8PR12MB5445.namprd12.prod.outlook.com
 ([fe80::e0d3:d505:3bd6:e79%5]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 10:55:44 +0000
Message-ID: <b70d47e7-5e1b-a23f-80af-eaa255a103e3@nvidia.com>
Date: Tue, 29 Mar 2022 11:55:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm: tegra: fix memory leak in error handling path
Content-Language: en-US
To: cgel.zte@gmail.com, thierry.reding@gmail.com
References: <20220329103747.2376753-1-lv.ruyi@zte.com.cn>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20220329103747.2376753-1-lv.ruyi@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0324.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::13) To DM8PR12MB5445.namprd12.prod.outlook.com
 (2603:10b6:8:24::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e21cb0ca-87d0-4060-74aa-08da1172ac24
X-MS-TrafficTypeDiagnostic: MWHPR12MB1534:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1534AFD7D2F944D3233C790CD91E9@MWHPR12MB1534.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JGfQ75pO55O3K2G0R6Nv+c1ireSbQQ9ojAWjrfbgd8JnM5Gcjr6iolnZ4zKTWjzcmTNKzmC+6fI0gmL7Z79q50j3lttN7mf7wgvYE9GMQ3DzOEoN6Ba4IkzN++fchoGukNKdJl9pPz27FA1EPH+nAMRYaLo+1Wuu3AyFsvHqnOj4z8ZsUcr2CyGntFDplBviWfADiqWUsfmheaZhy+Ze5Qdgs8tjryLdWvo0EPO08pz21MoRo9iuI0jFpgZc84N/zAns+zPTNBZNZztvYiUKfxYpiulJD3Xc/HoDyUxijnN7GF6mFMi5cajYD9Sz32+rUlP1GbW2EkrRc39sh1XA50/U6fx73nqw0f4qRocMUFij4gd2xID5b/xrzredEIkP6cmuPBSKuOHyIAdlRSiXWp3kQNR+lv9ZC1cPEPZ0sMeiV4pomwp42qO3rO+cN/V1uy446qRMEhRQviYNoVAa3SYGV6qRzDYH8WdhUPzGRjcc1K8b+mrdMdzW3kakplnXq0HFdr2kK91Fq1Tm0lIHJrQN6bdP6BWZ44lMLc4fvyv68igPLvkj9W/ZLLRiFuc3g+Kois43W+HtNM4/0OmVlpDuEDLl96+K83JrW1qVENACOYr+m/lwx1uD8Q9liBQNLQloQ7AxNyTbUPKAB2CKR7m1TSREuoXNevCQnyRJ3b3TULHPjXIctlBDWMCPoleY8CL7QFg1u1urCF2mS0GyBSlMbzXcbwqjRTmqCWA5A+O3dmMy2Zm3VFXvqBBvSXH5bxM2VJPcktGTJLATTZ5R9zK7C5RD/LIAEy0zFThsrB48i6Xdv1TcNOtdwmmJQO6s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5445.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(2906002)(53546011)(6512007)(6506007)(2616005)(6666004)(31696002)(55236004)(86362001)(83380400001)(66946007)(508600001)(186003)(36756003)(26005)(66476007)(6486002)(4326008)(54906003)(316002)(5660300002)(966005)(8936002)(31686004)(66556008)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djFEQU1ZOVN3Um9JbTNETzNMY3RRUS80UUpLOWVNNCszWndIRitBd0duOThR?=
 =?utf-8?B?ZUp5ME9tOWl4VUtseGMrN1NFckl3TTlXemtxVjk3UC9NdUI2Z282cmU1VGdI?=
 =?utf-8?B?aVMwR3BuSWxiajArU0QrTTJuUVlVckJUN0doQ3RiRTJVeVZQUEkwMW5NMkZo?=
 =?utf-8?B?U3cvMzFobDExbEwrcXdldE84L0FMY0wvQzNWdDBaajZIRGs5NGlPSlhHcmZt?=
 =?utf-8?B?Y3hIWCt2Q2IwR1owenpzeUVZR1FUYndaVlFlOTR6eitoMVpZVCt4Z1RzMVZI?=
 =?utf-8?B?SVlWZ3E2eTdHU0N2Ynd3UFBNaXQ1L01walpaS1lzcHVSZGlXN2poN2lHRUJT?=
 =?utf-8?B?L1J5eVdzdW1wOEhIcUZRMWllMnpvK1FpUWdiZlNTV1NmY1dkVkR6eGEyZFV5?=
 =?utf-8?B?QWxCQVJaYTZ4NFFidHZqK0NqMnAwamZVTXNJbHZzcS9MMmVsa0g3dEZwTFBY?=
 =?utf-8?B?bFBGK1NwQWxmVFZ3THIrSFR6Yy9xZEdrVi9lM1pMN0FmYXpSczAzMWkxclVG?=
 =?utf-8?B?a1BTRG5QZXNvNGRyK3BzaVFySXYyV3VWQWRnTVBUb21iTjd5TGVXUVY0QlVI?=
 =?utf-8?B?akRGclh3ZE9lT0phM3ZkZDNmMk9GVHF5VWdyV1hZMHBGdGp0N29xazdSWCtZ?=
 =?utf-8?B?WjcxWXhvRytEcHdDL0xCZ0JsbmVBRWpqTHhhT3ZrdzJrUk16SHRKSHRFMEF2?=
 =?utf-8?B?L2FJWnhQTzZTei9QVG5UdFZ5c3lBbUlubzJoYURYUVJINEpacC9Td0pNd01l?=
 =?utf-8?B?emkwME0yM2prQzdlR0ZXY3dRWTZ5VTZzb1hhY3QxK1NzTTRmNStiNFZsLzNs?=
 =?utf-8?B?MWJ5RURZM1JxZ1RVd3dIdE4xQlJmUnI1QVQ0WkFJa3ZadTJuM1IrdkJnb0pq?=
 =?utf-8?B?WFQzS1JRTkZCdGs4Y3NRZ2loL3lrY3VhdVRxU2ttYnRtQU1reGhDcnlGNU12?=
 =?utf-8?B?VjcxQUNVOUlUZndMZDc4SXRuamY1WDJuSE0rbnFtdTV1Q3I5TS8vbGtZWjlt?=
 =?utf-8?B?N1NVODVCc015WUJFY0tJdnhGVThIQjQ4My9LVFBMZkZWajROelRIN3h2STJx?=
 =?utf-8?B?N3ZJS1hiVEN5MjFNM2NwZjd1UGkzQUc4WXJuaURJU2dQM0RucUMwWVZyMERS?=
 =?utf-8?B?S2hwSkhiT3gwNWRSbkc4Mm11emZ2TGJyVHFONDBCRXVMWDNYK2ZJOHU4dm11?=
 =?utf-8?B?eHkvTkNnNVdUcWdvbnMxOFBtNUczOVJsWUY3cE1BT1ZTbnNDVGxRNVFyQVNy?=
 =?utf-8?B?TVhUQmgrMGMvTWZZbWJBcmwrcldGVE5RcWpCalh2V2hHak92MWF6VEpUNG9O?=
 =?utf-8?B?RGxaR005SUJhNVIvdFJSVVBtbW9pTkNLRUZPdlJpUUtMV2ZxYUtJejRCUDhQ?=
 =?utf-8?B?VTIxTmdTUEcrTTRYbE9SOXZ3OEFMcDFNQnEzZDdZUlhKY3hQNWJUR3J4SGQy?=
 =?utf-8?B?c3doYUxJdXpVTjFhTkl2RitKWWNNUDlIWEROUWo0ZTR1S3lmSTFhSm1hWEJU?=
 =?utf-8?B?YXNtT3BUbkVBcmx5UllwK0Nhbi9NYWZlSWxGeFIrUHovZGNVcm9qZWloZTJE?=
 =?utf-8?B?QVRNUno2Y1VpMXBGdmVVTHM0Q0VwMlpVdi9QbDZPVGVzNDlwMVpmQndyV1A2?=
 =?utf-8?B?RkNKRmphWXd2M2FIdjZiZXJsMWxjYU9UR1NFTWdWWDBBYk1xdCtxSnk3a0FF?=
 =?utf-8?B?K3ZDV0R4NFRNL21KVHhzejg5eTRBQWlDRSthNStyK29JM2dQYTNjeVFLM2c3?=
 =?utf-8?B?S1VLT09hUDJIWmVHQlFIejFTeG5QWkYzVkIvbjdpSGduUXdXdHlyK1kzZHg4?=
 =?utf-8?B?UTdOT3AzNmtCdEhDU2JXOUFvbW80ajVqaldVWXpUOVFSL3JmVEd6NXBCSlNt?=
 =?utf-8?B?TEcycnJyMFRsbC9IOHJGenBSamQ1Z05uMmN6VE5xR3BmQmdOaDdEN3N6K1d0?=
 =?utf-8?B?TmJ5d0xnMWNYNFk3Nk9ScFZYQzJlOUZibEtuVG51ckNhRFhTLzkxYW0xU0JN?=
 =?utf-8?B?eXFBcHVqRTJWNXNybU9kc1hDZ0FabWtyV3lFUzhMZjdrR2xacXVkeXB2bEx4?=
 =?utf-8?B?TS9qVEpUYVJ5aVN0NzFWajlYV1NSWnFzN3U3eGJtL3NtNEZXK2NFVWttL0Y3?=
 =?utf-8?B?c0pVVFBNWXFyNW5uMU1iYWUwL0E0RlNwYnBuT3krMG5kSjJsblZHaWtrRk9U?=
 =?utf-8?B?d3psNzFtQkk3VzFCMUhLQXBpZ1ZGVHdmdzFkRER5aXNydTIxOEgvNFYvQ2xn?=
 =?utf-8?B?amF1MnVyNGpGbXdUNjVWRnhrV2J0dUZGVDlFT0dRSUZmZnJFZ01nWVNiSXh3?=
 =?utf-8?B?OG05aTV3L2oycDJYSHUyd3JXeGdLVFRmaXF1a0lwQ0N0Q1lJc1JHUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e21cb0ca-87d0-4060-74aa-08da1172ac24
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5445.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 10:55:44.1016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5ZGJRUQHUA3j12PVIqOjnjY7d4r08nfUp533DiBedoGlj6YSxDvjlKcOe1keEpCYGfx5fCVyuGIuUNzY5B28Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1534
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
Cc: airlied@linux.ie, Lv Ruyi <lv.ruyi@zte.com.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 29/03/2022 11:37, cgel.zte@gmail.com wrote:
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
> 
> Before leave the nvdec_load_firmware, we shuold free virt which is alloced

s/shuold/should
s/alloced/allocated

> by dma_alloc_coherent, so change "return err" to "goto cleanup".
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
> ---
>   drivers/gpu/drm/tegra/nvdec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
> index 79e1e88203cf..a14863346bfa 100644
> --- a/drivers/gpu/drm/tegra/nvdec.c
> +++ b/drivers/gpu/drm/tegra/nvdec.c
> @@ -209,7 +209,7 @@ static int nvdec_load_firmware(struct nvdec *nvdec)
>   
>   		err = dma_mapping_error(nvdec->dev, iova);
>   		if (err < 0)
> -			return err;
> +			goto cleanup;


Actually, I think that the correct fix here would be the same as what 
was done for VIC ...

https://lore.kernel.org/linux-mm/6b86f6e530b504a5eee864af10e2ae1570d7b645.1639157090.git.robin.murphy@arm.com/

Jon

-- 
nvpublic
