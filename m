Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD447AD752
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 13:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E828D89838;
	Mon, 25 Sep 2023 11:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D556189838;
 Mon, 25 Sep 2023 11:58:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaNDnqzNgJWVS69v6aq2qw+4PMPcisXgTxqwMS1qDrPqmwgdilCjcD5hZrsJdSs90tlCT8rUv/8y4dA5wSa36jBK4WKsfr4brgADSEHx+mbuYoKHVrhe7OWnio32kmksjSu6fhsZtJEhoSoy2qEbjmvp/V+hsYEM+QQLJLaphv8/XYAaRBVaLh0SeFTpaChPC1slLwgAHrnNtgbiyOkrBBLSyTkRXNiatEJ5crCgHzF9eVN6xD9AQoulMb89jYXJj13z6f5wC0Q8eX4+oyVdCrsmAuJDiU09TV0mMzyTy0bLHjtJ3UQikdBLafyqlJhhdVoMQAbktE8bWYYYUlmKdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBZZwnt6SimeabteoCGXuErFJ99ERi05oYPAe0XwthM=;
 b=gUWfNGsfyqVETv39YfVu/VGumB5eshIXrpZzCwqi4tH4jdHJIw6J2JNNfuZRULHFvVaiaLvmInRS/n1l142tMydi/R40ynbjDE+4e9Ds3UfVCrh8JvaEg8DZBvhQO0wJKuHqfJW5ym6DqUDOmKOa13Dkq1VOQlce+q0RnRmyCod4HiPcWHjL8rKVKlmvm++u03CJ57mzdznJh7GS3G1BcpviKE4FvoCjDZRudIKkMnWQaqJM87oSMvreB9/h8ha7RJ4Yoj4jdgoTnlXx7qS8DHJ8Sn26oRXa2uZVj2f1ltEoAua1eAdgFmvAv+5zlaVoTCX06eAt7TxR9rZWCSMFZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBZZwnt6SimeabteoCGXuErFJ99ERi05oYPAe0XwthM=;
 b=oGz7ernSnUImW0VSvdSJhtXjoqMOghDPMlNaLHjP5poQHx6DFCAYilcQ0P/3WMO5WvfQ92RR15v61O3hdS8YjQ/AS6/Uow0dQNYUrO7ecgSFbB5DZR9//Yz5u/nZ5ZkOmj3xeV2h0kxNTJnDjz84Q5/oPob1TWnHMsYxhLEGUGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV2PR12MB5989.namprd12.prod.outlook.com (2603:10b6:408:171::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.33; Mon, 25 Sep
 2023 11:58:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 11:58:34 +0000
Message-ID: <8ad270e6-1fc2-385d-d7ea-02be4119e062@amd.com>
Date: Mon, 25 Sep 2023 13:58:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/amdgpu: Add description for AMD_IP_BLOCK_TYPE_VPE
Content-Language: en-US
To: Juntong Deng <juntong.deng@outlook.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 aurabindo.pillai@amd.com, shiwu.zhang@amd.com, Bhawanpreet.Lakha@amd.com,
 harry.wentland@amd.com
References: <VI1P193MB07528C2081A3A8BBDFAF2BED99FDA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <VI1P193MB07528C2081A3A8BBDFAF2BED99FDA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV2PR12MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a998d1-0163-4cf9-f66d-08dbbdbebe92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u/qQFri6RTHEh3/C850bQ40ADh7uMuKSKn/ykiMgOnbSt/8Q4g5RprrxiL3PVCs8khs+D8cYRaTNz4wv3BOQcSt4f473SsyvUHtLrD+ko5U6V5Mijgo0/u0N976sstmRSL+l0q1e7i07MhK2Uri29UiHrNuw+o94xXBEnLdt3/rFlm4z5lKWyJewfmHLMLAR0SXvVelWuGHj3y4ao9tSxOmASLXYqMb2T4IWn6g5RwlAWXY/01909b5zGo2bIp4qgW3bXTGlME/X+mh9I56g3EjBxiy4X3HYJN1LFmIvNilM2nmXaLWYNNlS+ZbO1ef7Cy95mqLLNTypjNRMqa1qsUklSb0ULO0wUs7Gx/P1RNne5r1MTIRJ4S31vLJ/CnBSVOofLnNWNHAR/RiAQowJHtDnc+tMWL8X0RovvqxxolksBVW8jBSSNuDsKchF5Vr18M3PYQiwGmRyE4mLyIDanNtWC3P8QULflQu5+lqJ28w7vT+h6UaHfYYzyvM+TnLcc5ZjoOsSVkP3HRrYqor6YdY/6P+t4q+MQwWK3joG2LDZa90jhihWgb7X9QAUGEQUJXnPVIdJwg43BVJRpT6cbH/d8GQm8YMZiN5xiwRPZU/PsljP09j6I2C5HD+XqdXESeeq2zxWEuDvkkGa44Y2/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(1800799009)(451199024)(186009)(316002)(31696002)(2616005)(26005)(6506007)(6512007)(6486002)(38100700002)(86362001)(36756003)(66574015)(41300700001)(6636002)(83380400001)(66556008)(8936002)(5660300002)(4326008)(8676002)(66946007)(31686004)(2906002)(66476007)(478600001)(6666004)(45080400002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHZ0U2oyT0JtWjlxbndDVTZkK01nWUhuK0ZkMWxKMHRUekdPMGlWUkY4NlEr?=
 =?utf-8?B?NHRPWWJLcFpRYzA0Sjl4b1UvbFJQMjVZTWJvRE1GSU9wRVVBeTVudjhBVEo2?=
 =?utf-8?B?NWR1RlBOU0ErV1hvQmRGa3BVajNIbGdRcWUwY3JYMkhydytXTnY2MGNsb3RH?=
 =?utf-8?B?aE01UGcxNStPdStZMUQwQTFPT3ozT0lDbG5IUCsrU3MvVW1hN0tuaThjUC90?=
 =?utf-8?B?aHJadGxTYmsxeW1RRFRwQlUraFl1YjR2c3dkUUN5azA5U05tdHhPN1AzSW1w?=
 =?utf-8?B?dnZqWEZIaWpzb2ZPVzBKeDRaVmFEVitoTm5rYU9NY1d6TC9HNGxubTNBd0x4?=
 =?utf-8?B?NDhibEFSdHA4cHBXRURiWnBVUjVvdXJFQnBNOUdUMWVSc1VOdklReXlPa1dx?=
 =?utf-8?B?V0dacUJKSEZaUlljOStZd2tueFBYR0VuSW1EeDk1SSs4aFR3eXBaQlI3WGYx?=
 =?utf-8?B?NkZoWndjNXptM2QxNzJSV01yV0VMTWZGV1ZRa21URzlib1pGaVdzekdCalMv?=
 =?utf-8?B?QXhUT01DZHpoQXVEYXBVT0ltcXJ5UmRDb1I2L0RneWRWVzIydWUvSkRHV2NT?=
 =?utf-8?B?VC8rV2xLS2dDL3ZVb1ZrZ25GcHRCcmQ3dHBFeUkxZWxXb1pWTGNHYTRxSk9q?=
 =?utf-8?B?S3AxZ3ZFVWdvem5HV2l0SjhlcXRXcWJzZmRUa04rKzI2UUo2OTdvd3pxMlBS?=
 =?utf-8?B?VHdQVzFBeGZ4ejVDMUREcitDUXA2cWhNMUU4S0RZaUVsYzdqdHpHRFpqa2Zh?=
 =?utf-8?B?YXdYTTQxQ1dicHJMQzVHeEpOb3lnMWpNTW5qaHpqTFpoN0lDWjI3RVJsb2ZP?=
 =?utf-8?B?RVhtSmd4b2dxSDVpU2NmbDQrUkhyakVLUmp2aG5aSStwNWhML2tPaUlvWERW?=
 =?utf-8?B?OFFHWkFxNUY4Q0Q0YlRtUFhaNFRPdmNZc20zekVQRExFdTVaNTZFcFZoZlFP?=
 =?utf-8?B?bEZtQXZiMUFlVFFHTTdHTXZLWlNvVkZlUFp5aUtPWksxcHRUZVp0ZUhsQWVo?=
 =?utf-8?B?L0s0R0NZNG1vQlo0UDI1T1JNdENTQVNZcEZvbjk5NDI5TC9tWVJnQXl2NUdw?=
 =?utf-8?B?elVvY1hsTDQ5amVTbFBqREo5d1MyYitjNnBzTTgvbWphdDlUL0ZrUWdGQXpY?=
 =?utf-8?B?V0Vwb0lrYldjRGRyQWpyakluL09yRU9aQVowY051OUNHU2t6ejdXVUVEYWFr?=
 =?utf-8?B?ZmliWElDdnJ4N2h2cURrL2dwT2JPWXkzN0tMbUwza1Q4cXh3cTlKQzROQWE2?=
 =?utf-8?B?THZ1c1NuQzNUNUdTcFJrOUZ2QkZNcHhOWTZWQitVbi9UUlRJLzFRV1l1OXgy?=
 =?utf-8?B?L0o1aEN2NVpJZmt1M2h1bEF4bXJqQVkxSWtkbmpyWVB5MEphTjF5ZHFBemZn?=
 =?utf-8?B?YzllNTg5WndqVGoyNkxGcVpxTWtTMGxWS1N4M1NIT1BPK3JuRlF0aDhHUno2?=
 =?utf-8?B?QktJdmZtSW1XQjlSVkRWbkZBRnY4ajFtbFBXN1R3MFBJMjUwcWJKdUZ6cDl0?=
 =?utf-8?B?UzZJQ3Zvbmpkd3ZxS21vZEVWT0lIclVJK2NoSzZLN0NHdkpyUEVqQzdFQ0xF?=
 =?utf-8?B?ZS9QMkpkVXNWYSs4c0dlK0xFRUtHRmtQMUNRNS9ra2NTVU5DUXdwMnNiRWFL?=
 =?utf-8?B?NzdLUUdYeEY3TmdEa3piZGJPbzRwRzZXY3FsdXdWQUp1Um16Z3V5QnJEb2Jt?=
 =?utf-8?B?TjBySDViOGJZRU5nYVU5d3dyM3pycUJab01qSnVJanQrQjI3RHkyMWw4MnJE?=
 =?utf-8?B?bGtiM3BLay9jNEo2ZHMvSkdmUnVZOW5OMGdaRlJRUDFNNU1IdmZmSEt6K01u?=
 =?utf-8?B?QlZYdFE4RUwyOHJUMGVpSVhUdzFCTStGTXNHV1hDZkZxMXlWUVFRMzM3cUpj?=
 =?utf-8?B?ckVDSTkzYW5oWDc1NjNQcGRFdTJCUUNkUFhMY0IrVFhvTnRmZFNJWkF0cmh1?=
 =?utf-8?B?SGV0ZW96ZitNNTVUZnVkbWRmRjhrN3ovUEtXU0pvOUt3TDI1OFk1cWVqOFlB?=
 =?utf-8?B?WW5aSHhyTWZNYlR0YTNXVzhhNEhBT3doeDdvRUU0UVRrUTZPYzBMdXV4STR2?=
 =?utf-8?B?d3dUOElWNHY0M0xZcHNVMkJNUW5GMkgrdzhYNlNqNnpxRU5SejFwa2ZCNHNv?=
 =?utf-8?Q?x2sM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a998d1-0163-4cf9-f66d-08dbbdbebe92
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 11:58:34.4199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpfXtMyWCkBq1ji6ZefRDSOcOaP5H/4BLUqKsHsWe4foqKz21D+H+HJCm8h1Q63W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5989
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
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.09.23 um 22:00 schrieb Juntong Deng:
> AMD_IP_BLOCK_TYPE_VPE is a new IP BLOCK type for Video Processing Engine,
> but currently lacks description.
>
> Fix the documentation warning:
> warning: Enum value 'AMD_IP_BLOCK_TYPE_VPE' not described in
> enum 'amd_ip_block_type'
>
> Signed-off-by: Juntong Deng <juntong.deng@outlook.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/include/amd_shared.h | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
> index 63e2153c00c4..314fd44ec018 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -83,6 +83,7 @@ enum amd_apu_flags {
>   * @AMD_IP_BLOCK_TYPE_VCN: Video Core/Codec Next
>   * @AMD_IP_BLOCK_TYPE_MES: Micro-Engine Scheduler
>   * @AMD_IP_BLOCK_TYPE_JPEG: JPEG Engine
> +* @AMD_IP_BLOCK_TYPE_VPE: Video Processing Engine
>   * @AMD_IP_BLOCK_TYPE_UMSCH_MM: User Mode Schduler for Multimedia
>   * @AMD_IP_BLOCK_TYPE_NUM: Total number of IP block types
>   */

