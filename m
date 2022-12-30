Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCCB659BA5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 20:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B1C10E073;
	Fri, 30 Dec 2022 19:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492C910E073;
 Fri, 30 Dec 2022 19:32:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Blz/MNdgMpW8PczZYzLKQMtddcigFvBi6NQviny6x81v6OxHNgx2hjP4yqDIW0gaFXDGjNGIXvllkwNwRWGAbl8xzBhGH1lhGvgB9XnjzJdwWKdu2pJaYiPV7hvzTiIwVr6oyPs4FYlV6p7Z+PwrhN+wSEVzOtAJiaa1yejPr1Is/VJoWZra8b5RBL/udGD9Fm4luMtcuvyRSPaE79Hk73vZUwbNl/7AxRhw65QGESUxn6kQq4bOYBamcUHP4ou9iai51cx6CHIy264oIdNH5IanUPGGYdAZMFfwPpUxWhY4vd5NQZryycnifF4gKNb4aTqrqjtOCpZy0Vdau3fIBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsjVeAK8lWNIqjqKJYsX3dxC78CH4xfI20+vI3fdeWA=;
 b=TyJH2qLFAG/M44y3gwisb6tLCNaSd7gqBUDfCkkqMJbnUw4fUSDU/6gN1ugof4W6/xeO3OsFo/vB91ud2MJSVqCQcBdYTmgY0dd+zsJRkFSIF5gr/pJ8IiE63l8aGkmeffSSSZQ2qvAaUfmeBzG/QrfUv/k9ZaiLj2Qu+xZmZn4OsKUSpliW1/8p9NDCnHxb/JEQQSTzKUlS9YYEKemX3jgJrVfnAsLYFDe/j2RU4Vfd1M/r/wPeyX1AQjrOhWWDQ9JpCLSgxFXuauKy/uccvvPVdrbtVBz3+V9dEkgISv4mEG7MN+WKlWZiS+zbXrYwilphu0QLeuwxQxdgozqmAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsjVeAK8lWNIqjqKJYsX3dxC78CH4xfI20+vI3fdeWA=;
 b=HegFqSoFYVFsHJ6FccgReALT3bbFrQRvMX2mmB7pO2eoX3TQeLyvGZFJRRiHYMwbcIyJ+L1XY5+OGcuLMq+9IXVKGVVy0ZsjMBdVIVekF9ig/KZkxfihaEj1OGSVSWN2SagsfYm8vJmrT9UyyEAVxA4fL9EfAQuS65sKlH1U3Cc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SA0PR12MB4494.namprd12.prod.outlook.com (2603:10b6:806:94::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.16; Fri, 30 Dec 2022 19:32:43 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5935:7d8d:e955:6298]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5935:7d8d:e955:6298%7]) with mapi id 15.20.5944.016; Fri, 30 Dec 2022
 19:32:43 +0000
Message-ID: <bc7c869b-3de5-b113-6064-79024c04c388@amd.com>
Date: Fri, 30 Dec 2022 14:33:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] drm: amd: display: fix dc/core/dc.c kernel-doc
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
References: <20221229010051.5397-1-rdunlap@infradead.org>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20221229010051.5397-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YTBP288CA0015.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::28) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SA0PR12MB4494:EE_
X-MS-Office365-Filtering-Correlation-Id: e58d2729-2197-4539-2a25-08daea9c9ed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gbihoPKUoxezt050T6J4Qv/IkC1iYMN4JmWABnAJ16JiJ2i/Gx+uFIUYRRO/3IlEW3C1c/pPTa4HZ+Hva46VSmJeJS2S+T1hVkGEZrBC8/Fk+MQAdvv1SsnMjljkBiDROPm6shnY+Kjqj+WywFbYQC6HtSP1GgejpAMTrkgEMxdsiqQ+TrQix0KHI+AeCnWt7Xnn7+5YeAnhV6OvPuPKj0QV6DOVDzhMdjIay3aa0oTB9DDMEV6N+zUnyR/T/1C5RAJABZiVofoQ/3D1af1A4yxWFLefmPhClUsx8hkutO2x7uBMJpe5zoCsiEgLT4nBwg9BcrO0yOo9oj2JKrIpJfYoo5CkN/Rvn/gReOefKP5QnPe/LJeQqKtg1jGhcTcOaE87Ir9YD6kyqCcGd5uJrxvj0SmONewYCfo0v2dShGC07eLfRZMJyO904WhkMTy1rqMJMcJVqgaMvqEEzI9tvrAkWb7whIOUTwqFBGUKNyQycAqQ/nAa78Wb9jPAOl1ElrrxhTLJJnkpJa6y2uUazHZ2BWw9kpSEn01U4dQFY6iUitaxZuc7YveJ85tPPCnPQVk9LowPO0nMZSK/OWUAJGs31Ea9NhpmYiUhQbiuE1CEUjZ0hYCTQ8I4sloGXl+LwQjhSMA1qai4rrMM1nDpIATUvy3pFJHpSN0xdBDWHyI7pqE3QeK7l/vgnlW/vBHm1b+E2q85jfM7AUliH9/XWxFYny8x1mc+IcxjNWmUaL0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(451199015)(31686004)(6512007)(5660300002)(41300700001)(66476007)(4326008)(66946007)(8676002)(8936002)(66556008)(26005)(44832011)(54906003)(2906002)(36756003)(186003)(316002)(66574015)(478600001)(6486002)(53546011)(31696002)(86362001)(6666004)(2616005)(6506007)(83380400001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1BrUE1RR1d5TVJBSFUvQS92ZmJ6L2g4clZONVpoenB6Y0VoTUFIUVBKdzRV?=
 =?utf-8?B?dXkwRC8vVHdHcE1XZUZ0QkFpWmFRd2RlelBaQitsM2UzbjlacjJDV2d4RUw4?=
 =?utf-8?B?dmZ0VVltMGNKL1FaWGFDQW1la241Y1dqaXlvVS96dzBUK3lmUlcybXlESXFZ?=
 =?utf-8?B?MmFZRmJJZk9zMk1DMjVneElLdWx0RTBJbDNiU3lFR2NRYnJHSjdDRGVQRjF4?=
 =?utf-8?B?SFQ3THk2clhBRXJheVd3YkQxK3dicFJyZXd6c2dXM3BaaDhoNUdIU1F2eGxv?=
 =?utf-8?B?QWMxMk9rVnBhd3dGZC9vTWwyUEpSdmhYR3NFZzlTNWJiZHhGMXJuSm4rR3hC?=
 =?utf-8?B?OStkaURlYWYxSFhXQ0ErdUVVSzB0NHpuUHZ5SjBuU2hEZWpXR0lLWHJ3TlBt?=
 =?utf-8?B?bldkT2lmOWFCTmljY3Q1aXNIeWc4d09QMGJaVWlOSm9oODJrSkp2MkZNRTY0?=
 =?utf-8?B?d3RxdEZ2MGpCaW8vSFE2UEt6QUdtdmdPdGdTZzVWTi9pT0dTbUljTStaT3Ro?=
 =?utf-8?B?L2lrbld6bjlZUDJQVzlMMFhEODR6VVFHTFZ5Mnh4Q1kyVHczcisrcy80aHNh?=
 =?utf-8?B?Szk4VzRBd1NtVHliT3VsTkxkMjU2RUZ3SGRWOGRHQjcwNm0wTVNEMi9DL3R3?=
 =?utf-8?B?dS9wMk5NSWFEQUpqOG5QQ3prT1p1VjdGMklDRzJWUnZ5RSs3OEw5TERaNVpR?=
 =?utf-8?B?L0tibVpjQnNTNjd6TXcxMWR0eHIvbCt1bk5DcWtxREloSUxud0hld2RMY3dh?=
 =?utf-8?B?c1RiZHphVWhIanJiakFLd0ZJNGtWVU9kMnNUVmtsYVhmM2UvbklKNEVuVEN3?=
 =?utf-8?B?VHdBY2NEWGRKTTMxQ2YrY1FZQmRyN2V1NXYwVnVYS2d2Ti9sNjI0T1psZm1O?=
 =?utf-8?B?MURscDZzejVoV0R2UGt6bGJlbkZwbU1Ma0RlTmYwZlBCSm41UUlZdUFqak1P?=
 =?utf-8?B?UlM4NnRSREsvWjZzUmxFcWMwQzhlcFRoTVA2TGRCckNpMEZMeUxPMnRPMUt5?=
 =?utf-8?B?RVVCcXljb1E0aUduV1hQcUV1SmNXRDZYa0Q2RHB4UlBEVlNQTjFUZWRBYjNF?=
 =?utf-8?B?TStiYTRnUzU0NXVqU2crcEpISVpoY3RqUnBETGY5SkJlMk5EaHM1c0J5b1Bk?=
 =?utf-8?B?ek5WVXNrYlhSVEloR3puS0tpOEFLN0xuOTBkTmlZUVB3SHNYMGxsSG0zMnU5?=
 =?utf-8?B?TUpTcU1LTXI5bmZKcHJuajRWZnlKZGw1ekdKQmYwQXB0a3BIbjBMdVlYOEI1?=
 =?utf-8?B?VEVnNE1mTHhXWWFFYmJqSTdyd0xkaFZBTUFoRWljaWUxWWZFU25KREY5Um5F?=
 =?utf-8?B?azhRTURYa2tzYkwva0Z0WWduQm9XaTNVZGdVdWprcktTckMzL1VTNktOL0Rp?=
 =?utf-8?B?YVNPS2t4ckZ0d05rT0RVbDF6d3loOExaMUxLMVYwVVpiNzVGOTFNYjJDamo4?=
 =?utf-8?B?cmF3V1RBbVQ0K213cmswN3hFMHpsajdlaUxFWkJPOE1Ienp0d1dBRTdEYWx0?=
 =?utf-8?B?Y2hQMWVFMllKd3MvZFhtTVcwS2RuajlmN0prVDBJY2NQVks0LythcWhtZnN4?=
 =?utf-8?B?Y0lnMWhPM3VXYnhFMnJuMTZJWUIvMEFvSDcvdFBJMWRMblJSSUNkaEVJazY5?=
 =?utf-8?B?dDhGQ1hhOUx2K1BrOHRqeWFPMHM5N0Y5RnpsRDFUQ0tkMEFGdHBKU2s4K20z?=
 =?utf-8?B?ak1RUXlGTWZRQmRPM2NSaEZpMU12WFl3ZnNmaGNVZU04ZndhMXJIdjd5aWN5?=
 =?utf-8?B?b2F5RE1CUkJaZTFNY1RCR1JTSElHamZyMWdLMDIyMEVxSWNUTi9iWTEwQTVT?=
 =?utf-8?B?M2pNVzEyOUp1RTFhQS9XeGNqYmxpV1Q1NjBLRVgvTHpwQjROY25tL3NKVjFE?=
 =?utf-8?B?cU1tM2hBUGZWREVkWmlFakJpSHhLSGo4QzZjSWVHcDVPQmJ1MktBNk5JSzJM?=
 =?utf-8?B?SmY0b2N0am1KdGZ3VW9FUWRST01aYzN0T0lHR0pJQ0NZNDJ6UnIzaFRQT3lu?=
 =?utf-8?B?akErVllaVmNYY1FYNDgvUS8xQlVqVFRoTWgwOW5TbzJVL3NDSG9xSzlvanhs?=
 =?utf-8?B?TDBRWFhqdGRXSXNCSDlQWFcvWmMyR0JxVE80Rklqajlkenl6Y2tpWWI5bkRp?=
 =?utf-8?Q?W+I6JZf88tgLgA9eCraV9Qgql?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e58d2729-2197-4539-2a25-08daea9c9ed2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 19:32:42.8436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1m/tYBPAlQVJlMa3/JGNzoBn4ZfTrcWMH58Gb4ItsB0duzScICH1PJtD/7GhMm/ThrLT1q4wZKm2Zz+Orab8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4494
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
Cc: kernel test robot <lkp@intel.com>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/28/22 20:00, Randy Dunlap wrote:
> Fix all kernel-doc warnings in dc/core/dc.c:
> 
> dc.c:385: warning: missing initial short description on line:
>   *  dc_stream_adjust_vmin_vmax:
> dc.c:392: warning: contents before sections
> dc.c:399: warning: No description found for return value of 'dc_stream_adjust_vmin_vmax'
> dc.c:434: warning: Excess function parameter 'adjust' description in 'dc_stream_get_last_used_drr_vtotal'
> dc.c:434: warning: No description found for return value of 'dc_stream_get_last_used_drr_vtotal'
> dc.c:574: warning: No description found for return value of 'dc_stream_configure_crc'
> dc.c:1746: warning: No description found for return value of 'dc_commit_state_no_check'
> dc.c:4991: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>   * dc_extended_blank_supported 0 Decide whether extended blank is supported
> dc.c:4991: warning: missing initial short description on line:
>   * dc_extended_blank_supported 0 Decide whether extended blank is supported
> dc.c:4723: warning: Function parameter or member 'dc' not described in 'dc_enable_dmub_outbox'
> dc.c:4926: warning: Function parameter or member 'dc' not described in 'dc_process_dmub_dpia_hpd_int_enable'
> dc.c:4926: warning: Function parameter or member 'hpd_int_enable' not described in 'dc_process_dmub_dpia_hpd_int_enable'
> 12 warnings
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org

Applied, thanks!

> ---
> Based on linux-next-20221226 but also applies to mainline.
> 
>   drivers/gpu/drm/amd/display/dc/core/dc.c |   40 +++++++++++++--------
>   1 file changed, 25 insertions(+), 15 deletions(-)
> 
> diff -- a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -382,16 +382,18 @@ static void dc_perf_trace_destroy(struct
>   }
>   
>   /**
> - *  dc_stream_adjust_vmin_vmax:
> + *  dc_stream_adjust_vmin_vmax - look up pipe context & update parts of DRR
> + *  @dc:     dc reference
> + *  @stream: Initial dc stream state
> + *  @adjust: Updated parameters for vertical_total_min and vertical_total_max
>    *
>    *  Looks up the pipe context of dc_stream_state and updates the
>    *  vertical_total_min and vertical_total_max of the DRR, Dynamic Refresh
>    *  Rate, which is a power-saving feature that targets reducing panel
>    *  refresh rate while the screen is static
>    *
> - *  @dc:     dc reference
> - *  @stream: Initial dc stream state
> - *  @adjust: Updated parameters for vertical_total_min and vertical_total_max
> + *  Return: %true if the pipe context is found and adjusted;
> + *          %false if the pipe context is not found.
>    */
>   bool dc_stream_adjust_vmin_vmax(struct dc *dc,
>   		struct dc_stream_state *stream,
> @@ -419,14 +421,17 @@ bool dc_stream_adjust_vmin_vmax(struct d
>   }
>   
>   /**
> - * dc_stream_get_last_used_drr_vtotal - dc_stream_get_last_vrr_vtotal
> + * dc_stream_get_last_used_drr_vtotal - Looks up the pipe context of
> + * dc_stream_state and gets the last VTOTAL used by DRR (Dynamic Refresh Rate)
>    *
>    * @dc: [in] dc reference
>    * @stream: [in] Initial dc stream state
> - * @adjust: [in] Updated parameters for vertical_total_min and
> + * @refresh_rate: [in] new refresh_rate
>    *
> - * Looks up the pipe context of dc_stream_state and gets the last VTOTAL used
> - * by DRR (Dynamic Refresh Rate)
> + * Return: %true if the pipe context is found and there is an associated
> + *         timing_generator for the DC;
> + *         %false if the pipe context is not found or there is no
> + *         timing_generator for the DC.
>    */
>   bool dc_stream_get_last_used_drr_vtotal(struct dc *dc,
>   		struct dc_stream_state *stream,
> @@ -567,7 +572,10 @@ dc_stream_forward_crc_window(struct dc_s
>    *              once.
>    *
>    * By default, only CRC0 is configured, and the entire frame is used to
> - * calculate the crc.
> + * calculate the CRC.
> + *
> + * Return: %false if the stream is not found or CRC capture is not supported;
> + *         %true if the stream has been configured.
>    */
>   bool dc_stream_configure_crc(struct dc *dc, struct dc_stream_state *stream,
>   			     struct crc_params *crc_window, bool enable, bool continuous)
> @@ -636,7 +644,7 @@ bool dc_stream_configure_crc(struct dc *
>    * dc_stream_configure_crc needs to be called beforehand to enable CRCs.
>    *
>    * Return:
> - * false if stream is not found, or if CRCs are not enabled.
> + * %false if stream is not found, or if CRCs are not enabled.
>    */
>   bool dc_stream_get_crc(struct dc *dc, struct dc_stream_state *stream,
>   		       uint32_t *r_cr, uint32_t *g_y, uint32_t *b_cb)
> @@ -1741,6 +1749,8 @@ void dc_z10_save_init(struct dc *dc)
>    *
>    * Applies given context to the hardware and copy it into current context.
>    * It's up to the user to release the src context afterwards.
> + *
> + * Return: an enum dc_status result code for the operation
>    */
>   static enum dc_status dc_commit_state_no_check(struct dc *dc, struct dc_state *context)
>   {
> @@ -4705,7 +4715,7 @@ bool dc_enable_dmub_notifications(struct
>   /**
>    * dc_enable_dmub_outbox - Enables DMUB unsolicited notification
>    *
> - * dc: [in] dc structure
> + * @dc: [in] dc structure
>    *
>    * Enables DMUB unsolicited notifications to x86 via outbox.
>    */
> @@ -4906,8 +4916,8 @@ enum dc_status dc_process_dmub_set_mst_s
>   /**
>    * dc_process_dmub_dpia_hpd_int_enable - Submits DPIA DPD interruption
>    *
> - * @dc [in]: dc structure
> - * @hpd_int_enable [in]: 1 for hpd int enable, 0 to disable
> + * @dc: [in] dc structure
> + * @hpd_int_enable: [in] 1 for hpd int enable, 0 to disable
>    *
>    * Submits dpia hpd int enable command to dmub via inbox message
>    */
> @@ -4988,7 +4998,7 @@ void dc_notify_vsync_int_state(struct dc
>   }
>   
>   /**
> - * dc_extended_blank_supported 0 Decide whether extended blank is supported
> + * dc_extended_blank_supported - Decide whether extended blank is supported
>    *
>    * @dc: [in] Current DC state
>    *
> @@ -4997,7 +5007,7 @@ void dc_notify_vsync_int_state(struct dc
>    * ability to enter z9/z10.
>    *
>    * Return:
> - * Indicate whether extended blank is supported (true or false)
> + * Indicate whether extended blank is supported (%true or %false)
>    */
>   bool dc_extended_blank_supported(struct dc *dc)
>   {

-- 
Hamza

