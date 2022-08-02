Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2063C587CDB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 15:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CF010E45B;
	Tue,  2 Aug 2022 13:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45D510E805;
 Tue,  2 Aug 2022 13:05:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvcZoGtMptKY1KNTh/g4wZ8krMQwf4OPhkg1Xa+crH7YDGFV4o9BrpLBMrInq7CjfIiD0fxCvp7udHg+TPBucU31pyCn1X0TSlA1m2ESsGzsr6UnI/fhXIRQPKzz/sT1fG3vQRvOpGGdXbInkTJhw/xIC3+7/SQNdXSbIzMJaAf1Gd/WxGOVObfHenD6d4Og65BT7DVsKRnFkL1TqV7JCr1KGPq2tDWuBGdRscYSRdi7diHyp7fKyplA0k9s2hWdMBuS1m+TM0WpHs6srUzWVBa8O70J6WTeXGk9IV0tCUW7YVejd90cW7eF/RfX/B6SH3ThMNhX9a9lZb1OLhJ9lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14qSWdshOlp3GFqQa7rqJu0+ePS41XTnkUtLUJVBXVg=;
 b=ir9tgahl1l05pSxsIYUEkgWSO7DHDWHICwd9SrdFkkECLsRYMk6lIotLT7kN5mlceXZpHpUgfZdNHyDr6Y73nDMy13JNtPQL+SfwVryLym51hZ0YD/z/ihoGI52K5k/1pHOGj8dJWN6EnqkItfg09mIpnDzQl2lIuiwyAkU4bgvW3CP535y9N3nGxb/JpeauLKnMRZ0GyBNfnUlxNs5okLaqaR8LfJo6ePgEbQazGIRO1EXckeHHMJh82uHPPV8Vgoa8ZThpbcehU6oo6+RJcXcuYUPmomxPcjTAEAE98Z9FvHU4xQ4NmBocVUqz68xf+a6hYsVYreSofe34k2m5pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14qSWdshOlp3GFqQa7rqJu0+ePS41XTnkUtLUJVBXVg=;
 b=lHNxo9jITALresbVq3srILYBRxFOr6qDdjWXgQIri5dRqI1EKLptncZh3tOzIbr0b8QnrFf9ximr0WSHmf3eigiUG5K9vfu9uJIhmSDFKY8qsvGMnNtbWIFCDTavuTlo7f08q3QOLgplPIJ6+bJle+HrRXuiS1zX46JUtUNYAug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS7PR12MB5885.namprd12.prod.outlook.com (2603:10b6:8:78::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 13:05:27 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6999:13c9:d124:418a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6999:13c9:d124:418a%8]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 13:05:27 +0000
Message-ID: <a79c4c60-6179-1cdf-77ff-6c45d6b7cd87@amd.com>
Date: Tue, 2 Aug 2022 09:05:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amd/display: remove DML Makefile duplicate lines
Content-Language: en-US
To: Magali Lemes <magalilemes00@gmail.com>, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220802120406.88845-1-magalilemes00@gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220802120406.88845-1-magalilemes00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0070.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::9) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 143dc0a2-7645-45cf-2749-08da7487ab8c
X-MS-TrafficTypeDiagnostic: DS7PR12MB5885:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TcAWLkWScJ365YANNiYWyEA7OkbEqpAH9odElB4fhKVTxQL36JM5/qfZ+YKjehO/oyZP4/QGu7IqTUJdOk2ykszAF3qV08eFvzm0J0jFMmkk73O1EOjDCLCWv8ErMAj3AZ0ltyw6dR+U6PeYQQ65sk2Y2UhQe4WRcu6uBhgAF1vtE7+5oUjjswXoK9Ks+PBoE6yqAFZRQcLiJZp/sj9Nr8C05dFCsZHvFDLdresRCDEGOa492F8RZdAn7zAw1ihx8gqm//DIwfLPh+NZYmydckQW94stne7hmo3/WiqEQv4rmL76yzMbIVBTQ6eisYnHyrE4CQ8sudPwhCVL7kK4VF6g4XBvHOTCbFdDPq0hpZB66KEVC/fb3E9FlazfqvYahZp8zOxKKShI7Jx2MCwOOV/jtjtawsES/IyiY78t2laMtA5TjmgvUxMdSCSuFdq8Dx9jPqRkrnhKALEuNnE/q+sjDqBCBQoM7Vo5kfUpmRrt1zL729iw8fIElZkKVObCp3Y3VqybPFrOh4XmaopV2C61VOeZR8jmVSMVsdi7PWyGCeMPU8+15DPyd7bl/AqaMxKjwbuflPXj0dx6HtHnjW9vkZffRMAa1RX6OV/L1Ni57PjshYs0u7h+rS3iTWaBS5XewfWEmJHooQsb+EuQ478XczmdhtJ8KavkETOt7CjuemWMYzGZrh514oFiRpi3zCQegrSKK8mvrVEyscfhhBthVDKF5JgE78hnyFa94Shx86JUpfmVQXANgfQaaOkDEUOiV9dLiB2upxGD5jzk7+LkS3NyJYeLYo3Y1dKnfUpSYlZfZfH9D90sdjmbX2JWYq64LWTHSalC8FJkAn2HkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(66556008)(66946007)(66476007)(8936002)(4326008)(8676002)(478600001)(7416002)(186003)(38100700002)(5660300002)(6486002)(31696002)(316002)(86362001)(53546011)(6666004)(6506007)(41300700001)(31686004)(83380400001)(2616005)(2906002)(36756003)(26005)(6512007)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkhxQzZwdG1WazBybVBhbzV0OHZ0dHEzdm8vLy9LRHZRUmllR0NqeFhjNS8r?=
 =?utf-8?B?c1pBa2xuRWNTd3BWNUJMc3dLRnRCMXg4ZEpISmpZUXkzNTdoRS9XTlNKbmVV?=
 =?utf-8?B?S0NpK1FvOE5CRnp5ckdORWt1WFdFVVdBNUFjQmlmWHFyNlVIdm5JRDZ6ekkw?=
 =?utf-8?B?NUM0SW83Q1ZNOUVjVDUxa2lwME0zelkvSmVudUJuTW8rSVBtS3dNVlVvT1No?=
 =?utf-8?B?a0UybmlMZldNSGh6R2F1a2wyRzBnYUEySVRXdStYM09WVml5b3FwblowYlBT?=
 =?utf-8?B?NzduNUF1RnpOMEhwSkFqOFQwRUt3dE9MdW9yamthMHdaVzBMUk54bEptSzJq?=
 =?utf-8?B?dHhsM0M4cVkwcUdGQ2hOU2xMYWxGR1U1R3k1YU8xejZuYitNT2pTM0FUZGNS?=
 =?utf-8?B?VDNSSDVpb1JUNWpndW9WTXlUM1dscTVmbWIwM2d1ZnRMNEo5NHByNlp2NEZP?=
 =?utf-8?B?Qi9FcXZXakJ4MkdFbFlWYmZBT0NCNjlSSUx2aDlEMzlDQUxqM3BvVkFIRGl4?=
 =?utf-8?B?MUJXVEJ5cmFjS0J4VklNNDVnSlI2WHJSNDcvS2xtRGdFbUpscENtd3lzN0l1?=
 =?utf-8?B?MStaMGl2QjloVmF4WEptUnJYazNEQTlacTQ0ak93dFg0NWFUeW91KzVmWnVr?=
 =?utf-8?B?UlI0Qm1EZ3lZT1ZNTlBNak5HaStLajl1eEFHend5Yi9GbnRnbnVNNWVvRU5S?=
 =?utf-8?B?UGpCQkZKc05wQkJsVzRnUHJ4aGdLUFpQNStoYVFmUTJwb3B6RU40TElpMnNj?=
 =?utf-8?B?STZPODN3anphOHFveUtId2lsdUFZamhkdXBnSUVtUEhyU3paR2s2MmRKVkhx?=
 =?utf-8?B?NlZueXNxVks4MW9GcjV4eEFuM1ZaN0tDemdaejhKa3pRTDJBQk9LQVlWdU5E?=
 =?utf-8?B?Q0lwcHQydzJmNStpUEEzQ3JIR2wvem0zRUJxT2ZXQTBacFJLVVVmbXN1NHBW?=
 =?utf-8?B?SUFLUTZMVllNVlM2bE9RbG5ub3d0WDl4L0ExcldxaERiZDFhQXBVbm9qNVZk?=
 =?utf-8?B?d0tsU0VoOUJ0a3NVTUZWRnlSNFVBQTlacSt4SExHY1k2d1VFbUFKcWZEUVdr?=
 =?utf-8?B?U3Q3M2Q1Rko2MWpFSXdlbXovNXFScEFDcjBVMzJ3RTEzdlZZZERySDVBeFhU?=
 =?utf-8?B?QWxGSXNZcjJsTEpINmhsaU9HUm80WkVCZGtrV0ZnSTBaM0sxNFpDYjhQOWNi?=
 =?utf-8?B?WGdMQmVsWDhLaVVya1NJbGFJN3hOVW92Ulk4QkJLNVhCNXo4R2MvVW93K3BG?=
 =?utf-8?B?R3NiNXVDUVM3UGR3WnB1WXd0TDNud3I5dVZJK0hiVHFXeUM1aGNBN29iYTZT?=
 =?utf-8?B?bjBHbkpNdGRDMWl6cDAyNEl0VDdqRVZwUXBuNEtHUnJiUlFGVVppcTVDVGg3?=
 =?utf-8?B?RXlza0lwZzJYWDBrSkQzOENMbUpINXFTYzFGNG9ja2YyeGtHNDlpbGhKbzcx?=
 =?utf-8?B?TlR1Nlo0TzhGZHYyS25GKzhhOWxqODVsYWVZOTJkRzgyRGZ1aHVqbXJWMGlB?=
 =?utf-8?B?KzlieXh1YWs5U2JFN2ViMm1ZdVdqd0NVYkFoL1dEVUpIWDZOMEdNVWxRV0hK?=
 =?utf-8?B?WnVCRFlpYzM0Ulh2MThWcGxHRy9MaFhlY05pYWVsVVZUUUtKd3hZamM4RlJz?=
 =?utf-8?B?U0NjWUpuWXRhNERTaXNrMTFWUmxuUVdXME1QNFA4bGhtSVMyVXh4ejVCeGtp?=
 =?utf-8?B?VHBXSjVVdFpRdkFOUWVqVG42c3RONkVEQi8vWGFydmtWT2RhaVk1cmpQWXdq?=
 =?utf-8?B?VlR1OGZiRUxyUjFJWjh1b2t3YWhrUnhCSVhLZXd5YWFXT1IwbEZwdUU0NzA4?=
 =?utf-8?B?SE1pRVRKRGEySVc5SVlrcXBscCtmTHpvVXg2SzBVTG4zSHBLWlFtNklONWh1?=
 =?utf-8?B?WENsTFB5Q0FuNjJWQkZ6WHdZS0lhTDRjc2x6SXpGbDkweGhQelZrYXZDNnZE?=
 =?utf-8?B?KzRKYm5hbjNiSUNaOXJlS25LZDhlVmZIQXhtTUlhMWFkRVN5dHpReitHVU5M?=
 =?utf-8?B?eWZkMEZlZllVK2dqUUxXeGhPY3dDL2xCdmJ6aUplRmYyK2VIODRZSTdoSHVM?=
 =?utf-8?B?L3Rub2RRTEp3bE1TWCtSdEN5UVpQVExrcFVsczJaWG53Z0ZhMU8yUk1wU09G?=
 =?utf-8?Q?nz2sShW8zcogv8G2Qrc7ApAl2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 143dc0a2-7645-45cf-2749-08da7487ab8c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 13:05:27.5092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C6aXzy3hFNTuLFRSIPAEKUNKpkAZOnMApHCgFes6Yd3rTCHx85/3Osbz+klEZPyrEjLpqxaHrXhy1sh2nh8usg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5885
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
Cc: siqueirajordao@riseup.net, tales.aparecida@gmail.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 mairacanal@riseup.net, dri-devel@lists.freedesktop.org, isabbasso@riseup.net,
 andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-08-02 08:04, Magali Lemes wrote:
> There are two identical CFLAGS entries for "display_mode_vba_20.o", so
> remove one of them. Also, as there's already an entry for
> "display_mode_lib.o" CFLAGS, regardless of CONFIG_DRM_AMD_DC_DCN being
> defined or not, remove the one entry between CONFIG_DRM_AMD_DC_DCN ifdef
> guards.
> 
> Signed-off-by: Magali Lemes <magalilemes00@gmail.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/dml/Makefile | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index 359f6e9a1da0..41bb6c3cc2d8 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -61,7 +61,6 @@ CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_vba.o := $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn10/dcn10_fpu.o := $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/dcn20_fpu.o := $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o := $(dml_ccflags)
> -CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o := $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20.o := $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o := $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20v2.o := $(dml_ccflags)
> @@ -82,7 +81,6 @@ CFLAGS_$(AMDDALPATH)/dc/dml/dcn301/dcn301_fpu.o := $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn302/dcn302_fpu.o := $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn303/dcn303_fpu.o := $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dsc/rc_calc_fpu.o := $(dml_ccflags)
> -CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/calcs/dcn_calcs.o := $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/calcs/dcn_calc_auto.o := $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/calcs/dcn_calc_math.o := $(dml_ccflags) -Wno-tautological-compare

