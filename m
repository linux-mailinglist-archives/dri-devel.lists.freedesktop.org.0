Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA0F692682
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 20:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B225F10EDDF;
	Fri, 10 Feb 2023 19:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2087.outbound.protection.outlook.com [40.107.95.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88A410EDDF;
 Fri, 10 Feb 2023 19:37:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BS4zUoVh02A3392qZKiocPeX6wRsocq3E3gS3Hvk82MmUEM24lQ0wKiU9TlwfugUR7WTeqxIzD8+LzdCfCf+7JmW7IRyMfhAGJOG1NQXhkTvy73/AZ2tR1/YfTnpmv/rnhL0jzDGOW/QW2bEvYEJvrRA5QcUVr6JQrgponz8aHkWfVBRy8vojMZA5x0dDFykB1TeMQW7u1vmF8EhP9pNdktaBbovfqYLb+g1kz1mu1PsmWzO1bhWzGV5PQVm/dyYQt4Ewwi+KMxZ/Lwbo4fiYfI18PKRxGMqSzZqdrO6YNWjpqvi9n/+6bKxsscjV8neswuc2dJok7WnDqyYzvsVdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cnVrRSW3rGsG32a7JWOiWWsAlct/31s8DgvaGvI1rk=;
 b=l545VmsbuZquYOfphaTOpGYYvzD1ld1o7q76pPIdEF+M30Je5Tj61kJnufzc2hiEwm3YOMFWoXiuQsSE/c1USge3gkdP/OAA+57kRiBZVvlg5utImiRNQYR447IRmuKWLefMHp/yL9u9PHHoNzPzSs4Q/f1me7Aianill2fyyPPzciVhaSqbwVBppg2zMiDnaMZfTHO18oOLkjaEd9peBXaWF7+zalTXuUWZyxcbC/hSxqtzAEnUbO/3bMX/Qqb1hj9TFzM2rEzAXUTgNvMdMfbtJWFWHhMeIjgSG1bZdzyo0qDbeHd2OM0HXAuNaZf0oRkBo+DOsvooR5QkzkpowA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cnVrRSW3rGsG32a7JWOiWWsAlct/31s8DgvaGvI1rk=;
 b=YXp/4R77GgzoGy3oCmcbjHnvQXZ8LkMv2BLpMDNdeRfo61yr7EQoUD24sEXtTQsmhIVhuAs5IkPnYMOZIfTkz/i19C9jGQwQ6yDqw94cw9RRVB5sajQcJitWqxjAZQBrR4gXcaFwTgLMkM+aLYIDDtaXvsHW9/J2gl8QC/2awFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ0PR12MB6711.namprd12.prod.outlook.com (2603:10b6:a03:44d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 19:37:00 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%8]) with mapi id 15.20.6086.021; Fri, 10 Feb 2023
 19:37:00 +0000
Message-ID: <49a3244a-1416-12c4-9dfa-661cf5b5d569@amd.com>
Date: Fri, 10 Feb 2023 14:36:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/amd/display: Remove duplicate/repeating expressions
Content-Language: en-US
To: Deepak R Varma <drv@mailo.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <Y+YVy7RaxnXokJ3l@ubun2204.myguest.virtualbox.org>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <Y+YVy7RaxnXokJ3l@ubun2204.myguest.virtualbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0309.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::27) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ0PR12MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: fe8e3f35-3bd8-4f59-557c-08db0b9e2daf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ihX/UOdpAEEfYcNkOhGrrWDb/stmLGWlXjhc7DuBcc0eK9WYUTrlebkU1WtyXb0dEU3IoNPVgSxdjygytBDBB+ZEAR3dqxtf7Y15qh1JmMxXBplCN02S4Y3djBsshvmhYaEOjxVSKkNisQUqXcml5+e+IuclK6rmUzKRdiPs+S8gHnK/6rj6g+TtLrq8LwIg/YraNcEvrPPVRgJcMcY5uQfRSZVjAMjNHLcw5QxTu4YP8iiubPOKbY0leYjnlndsv+diPy3hOwUykJ9IO9uDjcCw5NJ2VhejsWudAQK9rWrYabHK2LxKIgMHKLI1H8UpWkPAssbZbCgSpD1qGMLezTVv7DuR5WLqacc8BeEq1bhSbXrV/gibWDOKyBl92GRJT7Gc/0z3vVPIuJ9IdrQzx/KxkNVc/QzvDZXZKPjxATU/0bqsl+EfMm/QV8QuJKMVQ2ET2PVbrLaU+l13LARYG58T/P5G9M4ClIpCFeY9gBOCpyte98Da2XZQpFhFvH9OW/3dbxTfJ6Ozx2lgzZXLluL2jJINL9udbB4cyhb6tkIzQRoy6XQCwfZEqYJrj50F0C4jkcfX0mkQdmw+VnBlkj0x3uXwbXs7YtTY+PLTDRDviC4zitkh/jpEb3Yv5ve3XreRJ/oRvWQdzWCh6husX7k8BMpF1gqFbZfbq7G0s2TfqK7o2VomB2YSkN+j/MsuDY3CwK/YPyoGX49256LNljYynNP3zqEAArXoB33mKw8aEKhL/GOTunPx9y2O5QJ9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199018)(31686004)(316002)(2906002)(110136005)(54906003)(44832011)(5660300002)(8676002)(66556008)(66476007)(66946007)(8936002)(36756003)(4326008)(41300700001)(6666004)(6506007)(83380400001)(53546011)(6486002)(2616005)(478600001)(31696002)(86362001)(186003)(26005)(38100700002)(921005)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU10enpwOG5CY0RNUnQxOUtjYlE2TjNyRXJYeE1IUXhPWXdxV3VMaHh0ZDFl?=
 =?utf-8?B?SmJRbzVHakxjVkEyN05Rc2xxWURHUGR2MHJDbUE2QldtaWV0WHBQaWhnSDhy?=
 =?utf-8?B?QUpzdlhXTGV4Mmp3a2xKckozc1pFTGROaWUvdWNSdjlLWm52bGNMZnFiOU1y?=
 =?utf-8?B?T3RTZ25xb1hKNzBiOENtdGJINXRWWnQ5QTZYOGhQQ0tFb2hMNGVQc1d0QVpJ?=
 =?utf-8?B?bEdKb21YZS93ZGh3RTU2Z2VoQkJYbFp5dkhpQWpjcDJTVDZJV21RQ1Qwb2ZK?=
 =?utf-8?B?bWVWRnlFVUhpWER5TXVpRnBNaXg0SjN4eGw5TUNiUGtiUG9oeE9oYXdGaE92?=
 =?utf-8?B?cmk0dnJvTjAycFE1MW4zNmhLVURDOVUxbWN0OWdFN29kdDdNai9tNExwY05u?=
 =?utf-8?B?S2xnbkRKMG5LQmprZS9qUzFGb0c3YnBHWVl4WXlrV25lN2gzWERRK1dZakRj?=
 =?utf-8?B?WkNBTGlCMnNIbTh0aU5KQXltaXVROUdQSlJ4OXdDWldUODVscGEzOVFMUEFD?=
 =?utf-8?B?SlZRRSttVjFTVXhWSnl1NERuVE03WXh6Y0lZT2RNczVNeE9rTmFtVlRQdWFR?=
 =?utf-8?B?TlptRVRiNmZ3eDVKb2RZZ1A2Y0J0MnZzL28wSmc4QXdNRnZFT0RWOFlIaS8w?=
 =?utf-8?B?YTVlU2pFOWczc0J5a0ZaTmw5aks2MkxqVEJHelh0YlJXaDBkNUluVEtkNnFL?=
 =?utf-8?B?UTQ4Myt3RFQ1YXcyVGdRRk11Y3daTFkxWTVMeG5lZXU4SHE4MC9WOHNZd1BJ?=
 =?utf-8?B?UHhnZThGZ3J2QUhvenFnQUZvb1dXM1VCWWRpb1NiaUw0ZlVrNXVlQ0wvQU5y?=
 =?utf-8?B?Sm1YcHVkSDBCV2FRS3RBZnF4MTRMODNXd2x1cGVoTW50cmJNQVRsalg1TU1B?=
 =?utf-8?B?U1kvWkxiOFh1MUxKcnFSbnNIMlF3aXUzbnk3czFFOGRXcExqc2thM1gwLzNR?=
 =?utf-8?B?YVZvTTErcnNlbFVXVTAyd0dic2I2WG4zUGJlRERPKy9UQlFFNFNESEd4c2lo?=
 =?utf-8?B?bEUrSTVSRmhiaGcyQTB3Z3dkVExYWk10Q2dVMTZKMUFJVWwzcWlMNlVvbnhT?=
 =?utf-8?B?Y1B0Q1JTbWVDV3lLWXR5OGhQdUNtR2E4Skl4MHhhT3FTcVFhT0lSSHJrUDRJ?=
 =?utf-8?B?TGQvZ2JhYjVad0JYQVhVdXhNZWdUOUtEOWdPQ1hqdTRnTEM1cTZENmJMQnlD?=
 =?utf-8?B?K2hoOUpwaVFuKzRWVFM5UE85ZjNHZkRiY1JhYWZvL3hVaVBlc1h3ZExNS09Q?=
 =?utf-8?B?U1Y0MzJvQTMzalU5VUdOdmFTSDZCQkY0QWtBaHJqbmNiZXlGNXpNclpiTzdi?=
 =?utf-8?B?NVpyTWY1Rk0wNXNrejRRdUplK0VtNDgyeGJ6RHR1VlBzRko0NWQxdmxWa2VY?=
 =?utf-8?B?d0hlWHBYZTFqWSs2Tit1NllUZ2FhQ0hNRkZFaW9YYUpOdXFycHVyYkYzZGx0?=
 =?utf-8?B?S0FPTk1oYWZkMDVUN1Q1M2NuRWRQcURLMzhQNFFjYU9Cd1MrRit2ZitCL0M3?=
 =?utf-8?B?WkFMTEhBQ1JONUFWTzY2c0ltS1ZtUW1PeTdKc2dzbU5RY0RXODJMRHpZM2tT?=
 =?utf-8?B?Yzk0dnYyU2thUklVYmp6azRPaWswSElDdnU0eTlFeEtlYld4MjIxTHZ6ZUZ4?=
 =?utf-8?B?Nm1INWhpbEo3ZzlvamdRYlovV1RBME0yQTh6RkVROTFDQXc5SHdncEczSXhn?=
 =?utf-8?B?RFZkZGN3OWFXOFZ1bDhiNFEySTRJaXJGc1R5TVdRM1ZpTzUyWVoxZHhFYTh5?=
 =?utf-8?B?b1JuUlgybWl1MzdTdUxaRzZ6WXEzYlRkKzVqV1pFSXRtZ2JlbFdKZEZ2TnpW?=
 =?utf-8?B?Snp4UUJIbDFTMjhOVGpyR09rZ3BwWHhDZDhGdDVwUjlUTjh2U25nRlAzcE5G?=
 =?utf-8?B?WGtJQTVmckJITm9LWGQ5b0JCeVl4N29BeHdPQVo2dlVvdFhzUFJGTVhZby9T?=
 =?utf-8?B?b0dLK1RDeFRxWFlBTjZtSmhWQWUyOUdJZCs3Nlk2K3Y2WWsybU9zS2JKTWFO?=
 =?utf-8?B?UlliaUptZTV2dWt3WU84dE4zQjk5RWY2anFXUVlsT3FHZTlhWm05WGNSdEU2?=
 =?utf-8?B?ZVJtZDBVd29EMUZxUSs4VW0vMHBjM0gxU2N4RENaaXRRYzZIamkrZDVILzht?=
 =?utf-8?Q?iOPFwT7D9NDCF9EY74DTUWvz0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8e3f35-3bd8-4f59-557c-08db0b9e2daf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 19:37:00.6322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/1o44RoFqMhoaFWFuqrCx48bS+aMnCQYh8BrR9rWp/zTStjEILy5jYw4q9zq2yAxqHWqMXMpDGnXo7rtgWeHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6711
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/10/23 05:00, Deepak R Varma wrote:
> Remove duplicate or repeating expressions in the if condition
> evaluation. Issue identified using doubletest.cocci Coccinelle semantic
> patch.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  .../gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c    | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
> index 4b8f5fa0f0ad..ae89760d887d 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
> @@ -2335,8 +2335,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>  
>  			if (mode_lib->vba.DSCEnable[k] && mode_lib->vba.ForcedOutputLinkBPP[k] != 0)
>  				mode_lib->vba.DSCOnlyIfNecessaryWithBPP = true;
> -			if ((mode_lib->vba.DSCEnable[k] || mode_lib->vba.DSCEnable[k])
> -					&& mode_lib->vba.OutputFormat[k] == dm_n422
> +			if (mode_lib->vba.DSCEnable[k] && mode_lib->vba.OutputFormat[k] == dm_n422
>  					&& !mode_lib->vba.DSC422NativeSupport)
>  				mode_lib->vba.DSC422NativeNotSupported = true;
>  
> @@ -3639,7 +3638,6 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>  			if (mode_lib->vba.SourcePixelFormat[k] != dm_444_64
>  					&& mode_lib->vba.SourcePixelFormat[k] != dm_444_32
>  					&& mode_lib->vba.SourcePixelFormat[k] != dm_444_16
> -					&& mode_lib->vba.SourcePixelFormat[k] != dm_444_16
>  					&& mode_lib->vba.SourcePixelFormat[k] != dm_444_8
>  					&& mode_lib->vba.SourcePixelFormat[k] != dm_rgbe) {
>  				if (mode_lib->vba.ViewportWidthChroma[k] > mode_lib->vba.SurfaceWidthC[k]

