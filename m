Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E1265F448
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 20:20:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514F410E0F3;
	Thu,  5 Jan 2023 19:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9581B10E7F9;
 Thu,  5 Jan 2023 19:19:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GG6bAXwpiTdyFMuGDLChg3NyUmxrPzpp82xP2ovmv1YAM3sjOX859/MBcSUrLnxtsWBATCM68z5dIneQcZuGDD9T1SKxAxv+T7AQqGkTLamt1nOO3A7R6Q8AwjjA5DN7ZzoVSQsYe4nRd6+azIT0jQhxCtzCvE7N1IhX7Dqb0m80GMxQy2g8+1EiUpl8xOmwrm0FmuTrp7ujBbn026KeWY8qcKWkTjgCRBoLEFUI1lluWKWlCNTmh91gajDPuJx6U0HzbG6URWw9UpfOb4V1ECjpTLG8yJOzcFBGs8i1S7x6qUnWyHW5SkCBC+mVcP9IMZLYIIljDz8jtgW3mctLvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+ZUB9bM17pY8+LpVjvUZqOIgq0C6KnC7HE+QwN8Gc4=;
 b=JgQX95rWYek+j7yxsZ438vB3ulD25JYoe87QLItEtxzJT8/8YpudWr3o/f11gf9QGitzLXEzeVQpZdF9fybvtvZ0weYSs5Cyzu9xLxrOdp0DID+vqJ1JvCWAEHspPIHQjkUm20fGVx+Cd/liVZXypZu78QN1C4PaNDoyfcBawO+RrmlJZBbXcTFQs0ATPn4BoOL8PCSgT4XSYyMDwAWJnRyE1B4SikGYOpuNgNvJY8qHd8KGuI9nCNKEIJs7t+DmhGJ/yPcU0jkoggZXaXKjZckzy93sIb4EDMxkQ6QC9e2eVceSQ4Jfyqx0gHJ+uQyyixqoi2YH9umaBHG42p12yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+ZUB9bM17pY8+LpVjvUZqOIgq0C6KnC7HE+QwN8Gc4=;
 b=IjYkJifWh1LfanKcROGYvC9yDPQAIQmOCjXzPVfbNcuyjNdI3Ikyam1n7gsTgALKr/tfQWW2J6UzzMvFgxQ4/BcbAO9Pd9DUaTPIctVYCtdL2UXsI9n9vLFLW4voX/+sKzDpr4rJJyAetNmnCHOrgyY3R1ozO65Zfq26qQMZrFQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA0PR12MB8303.namprd12.prod.outlook.com (2603:10b6:208:3de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 19:19:54 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0%4]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 19:19:54 +0000
Message-ID: <1800775a-5788-b60b-87cb-9b09c7e7c177@amd.com>
Date: Thu, 5 Jan 2023 14:19:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH -next] drm/amd/display: Remove redundant assignment to
 variable dc
Content-Language: en-US
To: Yi Yang <yiyang13@huawei.com>, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20221216102318.197994-1-yiyang13@huawei.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221216102318.197994-1-yiyang13@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0081.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::27) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA0PR12MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: bc94b235-ca50-481d-23c7-08daef51d373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: piJ2z0sFr84pozjN8MiKioJUPPfqmNAoqaW1Z4dMMyfQg61A7OcXCs6n3RfSU+n1BTZ0AGIpb+H2+iYqHOtpIm0cNJbIz1dxg5HrkZm9XCuAYdVr5zs4RTBxM7jtY5fHmVaWylQwxEWnzu6jVhaeohZGRdtMfs8mWTUCYbtwWAMK4udGMl6zbMXixtWjCho/HRMeuc3rt2SJvdjlJSmVaKM+9nwP0eKYUk6G5eogqCzrrQ6TDxcU+FQ44GcpT0cMtSNtf2JB+p/KZfrMNUpVEMqvo7xO28fk46iTImbp1V0TY/UbItr//TbP27uaYXWhyY1oz+O91kxtODjip1Mru9FwOtFO38dkn7aiqrqUcFFHGthvRuqS1GDmhxoaWjbS3Q5Zxl22EKT7MbvJSg8YD20MgTIfzVT9L7od2GGnKYsb3Dk7oALIcFJ5y1xCCtHFuEmYUWFaoLe/ysPQMkjt3XIWnmPi1uD2z3fGZSbajqOa2V2boT0VtQ/lqw4zK2Eu8009HgTGCI45a32IK3RSaAEqsjc4jEmXccgrLFGyHNoocR+tuzbNTdfg8zuoK8z/FDRiFoIjKdrvFIp4Qv+L9PsCNd0IhGoXrebZHhSI9EjkyXVsbwggGjOgQFOXsjGiv4anWWiRQnZtovXWpZ6iCGGBaHPNFqWsX5iGFmharzX6umAKLDjUMrce/bdQSPmex403Bk8kkXuJjegNULy6Nd8p5Ix/WUIWdOAfs8tr69s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199015)(6486002)(478600001)(6506007)(36756003)(86362001)(38100700002)(53546011)(316002)(31696002)(41300700001)(4326008)(66556008)(66476007)(8676002)(2616005)(31686004)(2906002)(5660300002)(6512007)(186003)(26005)(66946007)(83380400001)(44832011)(8936002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFBDYjBYMFBaRW1KUDJGRDM3bGNCZjZTYXJRbU8wNjVRbGRRQmtUK0l6Q2Yy?=
 =?utf-8?B?QlpTV1h6VkMxVXhBbXJrNXBnY0pxZnpRQ0VBM1o2NDVCQkQwcllTSWgwWHJG?=
 =?utf-8?B?MUlIR0h2MHBBRyt0QkZOR0VkMnorT2RIdnFRcnBqbWxBNENBelhXQldRSEF0?=
 =?utf-8?B?TEpMcUYvU2w5TFpHMEROTzFBV3duUXBETklHMkRva05iQWpLM1oxZzdhUDQ5?=
 =?utf-8?B?eFhNcmx1L3U4Uld5a0xZNmE2bW1EVkJML05UMVlPbVgwMVRPT0lZSnY3ZTBp?=
 =?utf-8?B?eTB2aXYzTDYxbFRqUUh4MURoQmNmQmxra0g1WDJ0SGthcEdtZzlOQ3NjenJy?=
 =?utf-8?B?Tk1sYzcyTjJDdndtVlRjRmN5cHdwaXk1aEp4aFNSNEo4MFRRdVpFZk4vS1JK?=
 =?utf-8?B?ZGxwcXdFMnhZTUlsY3o3NGdqNXNHTnlDNk9mQk1yaktsQkQvYTJBWjg4SGhP?=
 =?utf-8?B?bWhnRnJiRndXWXkzVFF5Z3l5TmRZZHVCTWVoRWc5dG4zUDJTaTVjRnpTSDhB?=
 =?utf-8?B?Tzg5dFUrR1lyMVdDRUdvc2U2MUkxOFRyaFp1RHVyQmNCY004eEhvRk1reDVt?=
 =?utf-8?B?bFJLSTkzSFV6K001RnRlUTBseFZLSERsTjhNQXJmUmFrc25OVU1pZENkRXhn?=
 =?utf-8?B?bDdscXREZzlwbWd0QTNoRWFEU1RxOXJUZEVqQ05vOXZFZ1RhWUFRQWdlSHl0?=
 =?utf-8?B?U3JxdVU5MGFSazVJNklhNnNPQ2tqTHlNYmVFTEMxYW5FQUJSR3preHNEWDRv?=
 =?utf-8?B?ZzA0QlJnMGxqOXV5WE1XMHJxSkZJR3JMS215cWhvcHIrRytUelVmeEwrK0U3?=
 =?utf-8?B?c1BOSzdVOVpFUmJZOW56QUIvODd6N0QrU2FLUWRjRU53VDVtcEEweHY4bm9J?=
 =?utf-8?B?TjNoejJMQ3BoS01uT0sySUk1WnppSGFBVjloTUU4Qzc4cEVsckN5VElkYXo3?=
 =?utf-8?B?UUxHeVNMZDcrY29zRVZyb1ZXTVVxNERCdkhTdHVKaXVZTTJnK1NRWXpBalNJ?=
 =?utf-8?B?S0lOZUVsNElVV2N1d3h0UGJCbGdLd21UL3BMTk5KRUJtZ3h3bTNwWjVZRzcz?=
 =?utf-8?B?U0crbmZ2Rmx6dGM3bVJPejJXTDdUNUNwak4yVUZ0Vm5mME9HeklTd0lyQU4r?=
 =?utf-8?B?bkljWGU0N0hVZllXbDhYdFl3MnZqM0praHk3WEhac3pIRDVENnZFRlVsRzd4?=
 =?utf-8?B?UkYrQnk2YjZXT010cnhrbVA2L3pPelNwZ3FFS01nNFk4QzQxSFV3QW5LRVQr?=
 =?utf-8?B?QmliaUZNTU5WRDhWNDFzRzlhOTNjMkZ0K0tnVHptT1ZoMHhwL3Z5TS81amYv?=
 =?utf-8?B?d01VUlZwaTN1K3JiM0ZaUnMyTEgrbXFpV1lYOVpLNmVPVllQZmJXbUk2YlJ6?=
 =?utf-8?B?ZzMrNzdhSEJtVWdDNk5pbkZRcU1BZ2JqZGxUVS8yYUJDT2g1WHBZcDhFL3Fn?=
 =?utf-8?B?S0JVZU90ZE1TTXJ3TTlsbU4rZHA1TzFQNU5IQ2lTcmlaWTlKeVFrQ0VxdSs1?=
 =?utf-8?B?MTFUUmJqWnN0dlFVQkhtalp5Nmw3WGtJMVdZRFViWnJUa3FCZzA0bExqRzVX?=
 =?utf-8?B?bjdZeiszNkRXTzBnSndQTFpRSUlQMk5oMkErbHNyOWQwUEZXZ2VOcTA0TlZl?=
 =?utf-8?B?YTJLWnkvbVFaYUZCT0E1NXM0STdDWmJQTVQ1Z3p5aGdYMlp6VUQreFl3ZXU5?=
 =?utf-8?B?VnorcVNSS2JzRnQySmdKTjNubmRCbjZzazNHbUxiTVU5WkFjZ2NRUEwyYzdm?=
 =?utf-8?B?R0RRRjlTQVlURGhVNWEvVlhkMDdtN0VaMVlLVncwSlFwdHc2d3ZXbWtPUlJY?=
 =?utf-8?B?a2d0aXdIWkM2b0xEYjkrSkQ0dzZjQ0tpdEZ6MmVSdU1HSUUyNDRiTEl4bU1H?=
 =?utf-8?B?ZGZoWUFkMEVmSFV0Yzc1TFJpai9WNENXa01ldkFTVVcvT0VaeHF2bjdYeU45?=
 =?utf-8?B?ZzZmRDdqY2thTEk4QmliWkJheXRSRGg5bXZpUWU4anN0cmtxZ1RaemhjWHZP?=
 =?utf-8?B?VjV0cTl0WGFialV3YUFRUlRiRXNGRmIwVVFaditYY05yY3hIdGV2QkJ6ekxk?=
 =?utf-8?B?OGQzekQ3bzd0U0pqYWpPMlBnZ3hsWTVtWkVSWnY4dzMyN2lPYmV4VVN4cHdr?=
 =?utf-8?Q?x/Ubs902ALdl6mHY6xzfF5Aje?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc94b235-ca50-481d-23c7-08daef51d373
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 19:19:54.6992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzJBthEVMus+ig4vzPoqh8z8/WXAYCy+LlQ0OZAclavMJJl9192350REhjF1QcAdDE1BIc4pIuq/7Rkg92i6hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8303
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/16/22 05:23, Yi Yang wrote:
> Smatch report warning as follows:
> 
> Line 53679: drivers/gpu/drm/amd/display/dc/core/dc_stream.c:402
> dc_stream_set_cursor_position() warn: variable dereferenced before
> check 'stream'
> 
> The value of 'dc' has been assigned after check whether 'stream' is
> NULL. Fix it by remove redundant assignment.
> 
> Signed-off-by: Yi Yang <yiyang13@huawei.com>

If this didn't blow up until now we might not even need
the NULL check below, but either way this is correct and

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> index 20e534f73513..78d31bb875d1 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> @@ -408,7 +408,7 @@ bool dc_stream_set_cursor_position(
>  	struct dc_stream_state *stream,
>  	const struct dc_cursor_position *position)
>  {
> -	struct dc  *dc = stream->ctx->dc;
> +	struct dc *dc;
>  	bool reset_idle_optimizations = false;
>  
>  	if (NULL == stream) {

