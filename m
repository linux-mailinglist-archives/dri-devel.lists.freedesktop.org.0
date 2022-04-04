Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 387C94F1833
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 17:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DECB10E1B8;
	Mon,  4 Apr 2022 15:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7268610E19B;
 Mon,  4 Apr 2022 15:22:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sibsid0gJPHtWzSwfqfyjlOB0mO0NiMzZXcM4ulbm6we0IaX+cAaM2o6SvgJJW9uheQMBu8c7bi4YhhQ/6fdk5omqUTxfdZyBulmLkI54aiw6I55Sf75mDkvoASQUCcB8lLWLAnmiQzhNSDOwj43DhEzxUnn/iz570YLu27HXuj5A2J12E4GdCWX8E0zrUjegDNF7YxqQ1ZEYiY+gbzNAcUpzLwir+4iA3Cx1lmDFJ8vSXA7kgPRfVIWGxv5YlEDvO20P1k6hyrxpdAhZm3m/fPiVacs8PA+0WGLq2L94Oyb0X/5Rwcip2uSX4zqDKpXYa5XEUgpsWulatItZna39w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tXInFfD6mDByD2oA52qUvBFzZ8tsPDzugWau4UoZB8=;
 b=fLs/T/YbhiVybOWSgy4g29XGaqYWGar4wk60KgKDHGpbjBYwccIGvSj0tIOzlQJqnuN06CqiKAh8ne9ESFQ32U9v794tQDWQGw2IkLMkxcGo1lwTpmM3yJBepOSxh2tdZq3P3w70T/VFOwnXj7aD+xoSIH6rOI00/uQUbvcKEpwVj6xTt4cJ+BVizrTJR3xej2mPgcNxUo48DWpX76L0EBnn/VBHciwxZTiIAk4HBwmsA8t2HebCl2h6VvBrh3fhMZrRRUakFXMk5BV2VwH+R2Wl65Qxo7W/IgXIwychmconOC04TTtVACXqE/pQMboOkgyRPzXzsHN4TK9NtaPMXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tXInFfD6mDByD2oA52qUvBFzZ8tsPDzugWau4UoZB8=;
 b=a3X3IxhLRYv0fQo92FDSmxW7tQphd+BGLhb16+44N5apXr/CUFR+OPnbg7ZfzjcqlB0OMmsUgb49noR43XoQFzS6R/ySLH/diGrcRjjHc0CttJWS2aMYog2swUEYojUMLJc8bOKBL3eQTcNzN9Wxhqiv91LR/su++XcTNmHc86c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM5PR12MB4664.namprd12.prod.outlook.com (2603:10b6:4:a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 15:22:46 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::61e4:a6bf:9444:31f9]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::61e4:a6bf:9444:31f9%5]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 15:22:46 +0000
Message-ID: <513a5993-2cc5-54fa-2d6c-f4162d76ab0e@amd.com>
Date: Mon, 4 Apr 2022 11:22:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/amd/display: cleanup extern usage in function
 definition
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, wenjing.liu@amd.com, waynelin@amd.com,
 Anson.Jacob@amd.com, Yu-ting.Shen@amd.com, keescook@chromium.org,
 nicholas.kazlauskas@amd.com
References: <20220403142137.2234322-1-trix@redhat.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220403142137.2234322-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::9) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3002dfc9-4fc2-419d-0473-08da164ef87f
X-MS-TrafficTypeDiagnostic: DM5PR12MB4664:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB4664E6F74A6DB046911D0F008CE59@DM5PR12MB4664.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k2BM7QiFZtkEi3sk0xePTsn3XS4FpBRMFZnMGQa1tE5Le+41QQB4CGqmgUnwloafsDt0OIjzvgTw6OK5/Oo0bEV2+GrlVmxf9u1Zh++dH+Dv4E1gRdu/XV7SnKAupoNJ3GawpPhvEv4nXXqp4rsjUi9WWdVmj7U2h4vID0iuJLkP0fVg/4j0BlOOxo80XP2KpuMKdKCoVHMTn9Tj7NG9ke8sZqWo24YpW3g3yBZ4SWfAIIMIQMYEU4VyL4Twn8JNhnv9/e4o0lRiXC4DxVWiL0U0lNsRFjZmvzyBNk40NlspDuXqUQDJZxec7M5F1R9LEmneccbM+NTQv+44k57x0fDsm3rST9nTZGnp6sh7wHzBmf3exheZ2vAiomMcF0mPJ/OVYTL1MyF1XIFRoIHZ8wTAxmrk50J9g7hhauOACfuYihav4VIaT0pjAGy+Kl9y6ZUPXFFeNMHlj7e8MPzAIcWQ16U1F6JVJSaVkaGet8Wb5eznqGWelY771IZ3vB51qRsgTQs4zOYj+5KIDQpkC6wc45ZiwV/0x3ewajJp9LvS5GvXfL4Pw/03aQ1XWTtZ7BB0kVNPbAh1RrpvxSZBXChmo7s2NoFZlOJsxkQ1+UD7Zisf9VJ4MHYrXQqICeURDlOsZg9/VQqLfSdlZn7y1Ap8k3dLQSLBH8ErsrXQrsM+VdywFWCfhWsZFMbIn2KNStO0vudyHnO5haPFczO9XdqQCsOqljJb/0cnp7bmjW71Lrm6XQ5i+uPsHE9owb9Lj7W+3DOfUSiNm+kee2SCtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(66556008)(31686004)(5660300002)(966005)(6486002)(921005)(6636002)(66476007)(8676002)(4326008)(508600001)(36756003)(6506007)(316002)(53546011)(31696002)(186003)(2616005)(44832011)(2906002)(6666004)(26005)(86362001)(83380400001)(38100700002)(6512007)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlV5VlM4dG15OVkzRDIrcHJhZ1I4cEpJL0lRakV2Y2RKYmI4NzVIbG9kYzlW?=
 =?utf-8?B?cjNVZUxmTWM4MHBUeUoxN2dGWGVVYXNsVFFtYnRSOGVvNkc5UXNoUlNDcTht?=
 =?utf-8?B?aDFvandzV3hhVi9scnY2bEtFVWxYNEdZV3hEcmVjbE9WazR2bC9NY2JtTDhN?=
 =?utf-8?B?RnNkQkJ4WlZFS3QvOVNjbmRmcEhXYUlzbnlCNDlpWjVBQmJNVGRLNlhaUmUv?=
 =?utf-8?B?MjByemZjZys5TmlaZFI2Y0s2KzdTU0JMUUFvSkR1SGFVSXZONlpBYVlXeDdq?=
 =?utf-8?B?cHpGOHVkMStwWklORDFzTmZBTkt4eUExK2tPSWpicWJwSmZmbThhQy9Ia0hO?=
 =?utf-8?B?NU1PQ01CcDVuMXhuZVRDMThVUGJBZXVDd0dERnE5MU1EZDFLdEhwVEJMUUtQ?=
 =?utf-8?B?eXp5Y016WTNEeWVxa0NEY2grbkJWczEyS0s0RkVvdnphNEt1UVh2amFERi85?=
 =?utf-8?B?WnowUjd2UUR2dVpHUkI4UFFuUDg4aHRqd2Q4L2pjTDFyOXdBTzUvYlB0Ym5Y?=
 =?utf-8?B?QVEyVG4zZ2N2b0VMdnQ2UzVTUGZBMjl4SFpKZVBSK0g2Rkx0S2I0STJsMEp3?=
 =?utf-8?B?aUE4NWRSeWpFVEpkTkFwaS9QdExrUkhwMWtSakE2RDZML3ZJbmtkTmNzdVFv?=
 =?utf-8?B?UVlvTkovNHl4ZlRVemZFWDZURzJrY3RYVFpWMEQ5b1hIYk1yS2lvZm85MVR3?=
 =?utf-8?B?Q0tzeDZCc0tDd3lxbElXT2l4VFRFTSt6TWh0R1hrZThVYjVKZ2lwWE5Jc21q?=
 =?utf-8?B?cStaeiszOGNKS0Q4TnRRTGVscmQ0Snh4U1lzamw1OTR6TVY1MzBMYXdSK1Ev?=
 =?utf-8?B?ckphZ2Y0NmNqYVpIZDBzbVMwdE16N0M3YVVaOE1JQXYwSHRpeWxadG5iS0ND?=
 =?utf-8?B?ZEtxUllrM0lscGpCL3poZlplbTM3Z3hha0JlS2pMSXVpM2hnVUJnNDcvMklI?=
 =?utf-8?B?QkovZEpyVDdqQW9pNDc1SFNXTDMyU2tpMHlnc3VFbkNCZGE0YVNDM2dHVnF3?=
 =?utf-8?B?M052dUx2OGJsazdOajYrMWxZVGhDRHRkZHRGSDEwQWZOYUdDc2hncW00U3lj?=
 =?utf-8?B?Q3hLRXdMNEVIaEtucEdiT0gxc21pRk1JSGZXY2RLbk5ubEo4TmNLM3YxSHdo?=
 =?utf-8?B?MFB5RlNjdWs1QWxPU2E1UENaUHExd0ZlVGZwMWhZVEFuT1ZObUVjRlNtbzJs?=
 =?utf-8?B?dmRuaWlEdTlKbmF4VW9xWG1POE41VWRDaVliNmVLM20vVTJ2OFVSbzZUMzE3?=
 =?utf-8?B?YzA1VFpCVXJRMG5vWW9objVDcWZ3KzlENGgrN2xXZkg1Sm1mVFpPZWl2cDV0?=
 =?utf-8?B?cjhkY25kYjl3VDJCcHR6NnJ4VzNnQjJEVU9xNXdyek9qZHh3Ny9VVWZoRzRa?=
 =?utf-8?B?ZCsrVTFCaHEzcW1XTjVKMGU1QllCWmh2OHBPYUFicFZjWE9teW54RmZwUGhU?=
 =?utf-8?B?YjdNWXRIeVd5UENUOWF4a2F0aTU5dUFUUDRHbFI1OGlYYjQ2UXNCY1FueUEy?=
 =?utf-8?B?aDY4SjNpMUZQTkRqckpHQWYxWGhXUmx4VWp4VHRVZisrOUl5QzNveHZCWVVF?=
 =?utf-8?B?aHl1YTF2aWpoZW96ZURqalVLR1lNWHhEbTBwVDl6NUx6VnpPM29pbVV4UElJ?=
 =?utf-8?B?ZXNNZEdTYUgyTXdWL3RUeDZGRHN5Qmp5RHBKZXd4eTZsUUdIamJ5TUlUb2JR?=
 =?utf-8?B?ZWErUEZIQUwzVjZ2OHc1K0VDT3hWZHJBVERiUzVRc3VtKzFqUFE4dlRFQUlp?=
 =?utf-8?B?NnUyckMvUmJha2kram5tZ2RTY0F5OUhyS3QxQm9lSGE0eHhxTi9UVlpZSER5?=
 =?utf-8?B?V2lRay92UXEzc0NWY1MxSWorOGlvZUFyVXlsSDNJeGsrOHlqY3M5RTdpYllo?=
 =?utf-8?B?RjJIcCtreHZSMUhmRFFQaW1UMDI5QkNRVncxSDBpYWZCYXMvbW9nWkJGb2ZE?=
 =?utf-8?B?aXE5N3FFYjJoYUwxMlFpREdZY1VacWZ4enVOUE13MHdBeHk3QUExV2tRbjNJ?=
 =?utf-8?B?NVlhNHZmeFQ5L2tqT3Rhcy9MWGdESmRTL2p1VUtIZS96S1k4U1k3MlNUZUls?=
 =?utf-8?B?bFVWUU1zbkY2WXR6ODdqcGdmN1VSNzE5bG9iZTFDQndVSUxRRDVLTTB0VHJ6?=
 =?utf-8?B?YTZaZEJHVmVhM0VQMU0xUUViNWVQd3RHWWxCc1p5ZTByaUZnMGdzamU2d2ZL?=
 =?utf-8?B?cWh2VG8zeHlvLzBqZVZDeDlGaTIyczNrODlGS2JlS1luMzV3ZEJGMVp4WUg3?=
 =?utf-8?B?TmZCSE5uWFV0aGU0MnkvbmExTDkzUjBuOXBDZ3lqVE81VEtxVW43bEE2Mkcv?=
 =?utf-8?B?STlacHV4Mm5JNUkwaDlDUFN6MjhOOHFGNFpUZVlITXoxQjBscUxKUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3002dfc9-4fc2-419d-0473-08da164ef87f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 15:22:46.0867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqi8BQ9jpsZiwJCJByxt0NKYHAlFELZzGMqsNFmwtYLdioPyB1QL/nr6g27SndD+sKNU+HxuQxP8ISnE7s74EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB4664
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



On 2022-04-03 10:21, Tom Rix wrote:
> Smatch reports this issue
> hdcp1_execution.c:500:29: warning: function
>   'mod_hdcp_hdcp1_dp_execution' with external linkage
>   has definition
> 

Which branch are you using?

I don't see the 'extern' on
https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c

Harry


> The storage-class-specifier extern is not needed in a
> definition, so remove it.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
> index 6ec918af3bff..1ddb4f5eac8e 100644
> --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
> +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
> @@ -497,9 +497,9 @@ enum mod_hdcp_status mod_hdcp_hdcp1_execution(struct mod_hdcp *hdcp,
>  	return status;
>  }
>  
> -extern enum mod_hdcp_status mod_hdcp_hdcp1_dp_execution(struct mod_hdcp *hdcp,
> -		struct mod_hdcp_event_context *event_ctx,
> -		struct mod_hdcp_transition_input_hdcp1 *input)
> +enum mod_hdcp_status mod_hdcp_hdcp1_dp_execution(struct mod_hdcp *hdcp,
> +						 struct mod_hdcp_event_context *event_ctx,
> +						 struct mod_hdcp_transition_input_hdcp1 *input)
>  {
>  	enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>  

