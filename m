Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C887C7E3497
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 05:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE6810E4AB;
	Tue,  7 Nov 2023 04:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D48010E4AA;
 Tue,  7 Nov 2023 04:45:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4cO3ScXTQqGLZJLdVqg2HqTQcZEVvscq520SLpA9CFmu91ICcSrZskl7h39H2B8aHzNlybp4UBGfnS3MLhO8iP3iJR3Kn2BGknQVRyJomW7SsG7quIF1LXcByp/O845X/VPLUYLmBMtwCl/p7a0DRQujjL77NCKou9JwlvI5DovfVDM3UzFwEHke2Dt9iuRBUy68xG0BCTDawtGROGoXP5T1fbHqmoxydnHnar6woy1LZaQKEC+YPMnzh6nOrlv4DbbCe3t+azU10gCiQSgvj/lQARc7dbfdLwkvp28reMNtaa67q9704/W+1aygN6mmXW0KVV9wYJoZAfglhtJmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBJqiXb5quAMaV4OK3wIkVWeHlBKk66b0oLyLpQOqXk=;
 b=Jsnkx1UvAXxCmR3Ef5UxHJiMeHvnfFHPko9MdclejJvjcm2YylpA2BKu9J1GO8Ccmwg3bEkVizTEGHo/mD2AVQybMBMEeC3NZsxk0UZTNiEqdhJWdCwL2MNV0Q7tvFzGc4FHEHqdWsaD9nZ7k1sqEWXNep6/q+MuxSNmR0TRyB66ey97HUps1nKMuIAgGUJTjkcauSOHq15IIUSiEzcO8AKq8O3FSlVZOJBmziIFQqeJboYsLtB01ARqik6eAxC4AdKNNJxwMoXIkiIAdoASBbB9f56KxzwB/bLF/OSdltURgJGjbPkDUhiUNzYY3LxaVi+l1Zkx9+eUuQ3gIyx0iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBJqiXb5quAMaV4OK3wIkVWeHlBKk66b0oLyLpQOqXk=;
 b=lzG+h6QMVGqDlRt1ZtD7N95ONNSLD4V2alReEse+40KduyEZrzWyCs4LNR4xqHox/NBFAr+hG0Iuy6IzqWyJ321NGAs3m9KXvUwDu7aE3PSKKXC6LRrJSjtEifWT31OzJJKwefGdF8jbHtFaoFd5Xnv6T+PtjHL7cSQmhq0jU5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by PH7PR12MB6563.namprd12.prod.outlook.com (2603:10b6:510:211::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 04:45:35 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::ce36:81fc:9c50:c892]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::ce36:81fc:9c50:c892%6]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 04:45:35 +0000
Message-ID: <6bd4f6d9-07c9-9ac1-2f3f-bb083b9c8085@amd.com>
Date: Tue, 7 Nov 2023 10:15:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2] drm: amd: Resolve Sphinx unexpected indentation warning
Content-Language: en-US
To: Hunter Chasens <hunter.chasens18@ncf.edu>, linux-kernel@vger.kernel.org
References: <20231106201739.29507-1-hunter.chasens18@ncf.edu>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20231106201739.29507-1-hunter.chasens18@ncf.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::8) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|PH7PR12MB6563:EE_
X-MS-Office365-Filtering-Correlation-Id: 920f9335-4f17-46ac-b2a0-08dbdf4c60db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YtOBkitK64/ik9BaRTOtnngxbaqS/eXhgiRVEG10qGk3X7z9aQy5C8+zmr3WU2vP9W4N1+w9j7igd+BWQd4u5Q7tYrs+0trpLVfcx+VqeMH9rsR0TbPBXUDMijwWoha7OH4sBMI7BNSWVS38NxGJqxyTUdyPY4pyw7E/OAVhDj32qdwwFZMomgOYJN/VFV4qI+mUGaLRydVaEkytlZPB4dXIZTvh76hi2UIvcJqI8nPfhlvL8C3k9x0leb2US/XWWpfHchfJ6rHofnnQU1X3hG0OCMMPLzuji86tKkIYIU5uqjVpDnw4x9eI58hBRUdGe1/CjgGegeO8TbZQ9WlwbRk/UEkPbO1MzqCSGsXnuC/7yQCReqDvl92NUTZ+CEasSOmjmRzL+GAae/ZL9IwAsDdjDjILwUMqvxRik3HCOGaC9mKzjuV81Juh2uUZaEv9u1BTRhzIaMVSyg3kuUZRNL8CuESxKv3enXWOslaQQcsKMXxAmJnr6AMN8IrjfLRyLRdI1xQ3y/AqQu+UZm1S1wZlXzXdllHL5J24O/d7ZB4oU7M1CvgwjNmj0Pea9jDZsmdtmZXt82DGjouuwd9EklrCfif42dWoUNbUE+5C1uFH5gZAV1WKsn7LkyYWSHomGgofW535D3ZX2r8s7YLY4vJGPzDvIWc4GUW6lehsW9xKY9drPbslxCkB+h+xV8as
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(136003)(346002)(366004)(230173577357003)(230273577357003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(4326008)(8676002)(8936002)(316002)(41300700001)(36756003)(2906002)(38100700002)(5660300002)(31696002)(53546011)(6486002)(66556008)(6512007)(66476007)(31686004)(86362001)(66946007)(83380400001)(26005)(2616005)(6666004)(478600001)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2oyS0I3alZ6aDREeDJNc2YzdkJPTU5qcUszWUtKRHd2ZlpMSTNRc3dXWml3?=
 =?utf-8?B?Zm1lVzV0VHYxRU9VczdJcTFCM1ZiUVRQUjZpcnlFNkx6NVRrRndRaXVqdVcy?=
 =?utf-8?B?RGM5YzFmYkhQREhpaUQ3TWNialZtc0FGd3l3ZVI2dHVrOWtWYjJUUVRON1Iy?=
 =?utf-8?B?U0VQb3ZQL3dpMjhHTSsyZkVGazI2TE9CaU93ZXM4TVp4d0dsZFZVUHR3VTRW?=
 =?utf-8?B?a3lxVHBxeWpxc3JLN1dNRFRrL0xZOXNmaXI3U2JQMTBzamhZaklwR3N5OFBS?=
 =?utf-8?B?eGVOcUNqam5ZTTYxSGJweU45N2xSR0htbnFNK2szdXM2N0xzaFJZcHZqZFZq?=
 =?utf-8?B?OEhrNGtDVm04OVRrbUhsUk45WEMxd09vUXBUSUZCcmNKS04wbVBZR0NLK0tQ?=
 =?utf-8?B?aTdaLysyWWFudXRlUEVsQVcrUUFGci9wN3MwUFlZRkIzMlI0RHpnR3kzeXpB?=
 =?utf-8?B?WWJsSGx6RVRhWGtjNFBIMEVIbHhsU3lrb2d1YWlsRGNwcTdPRG1jRlYwWEVv?=
 =?utf-8?B?aThlSXVQam85K21MYllnVUViNkpIZmVlMUh1Q2J2K2YxclZ0bmQ3OHRycWkr?=
 =?utf-8?B?SFVnejR1SGY0YXZBblJUVzNrejJERXRZMXZqU09Ua04yTW95dEpVNElHSG1j?=
 =?utf-8?B?N21EVSt6SGpJYUZBcW4vMlNIaS9zcnZ6N2tDbHRCaTU3ejBhT29ZNVQveWVh?=
 =?utf-8?B?RFAvd2JxUWVCZWRTRmZEcWJydmV1MkFMVW9VaGhxcmU0RjZ4UXJWWFN5UEVv?=
 =?utf-8?B?MEhhTjAxNUpvSHVtbjZXZGlnQzFrUi80dUxlMThYM3R6SzI1eXd3WUFFZjdP?=
 =?utf-8?B?bHRWMG5WQVhqWTRUdFpxeW5ZWldBbjdjUzVBQmkxZnlBc1RJL2FLeWhRUFBh?=
 =?utf-8?B?bkdmWjhFL1VmNE1KK2RsajdFWk94cnBGT0RLN1ZBRHhkamNHVjhmVzZYSFFi?=
 =?utf-8?B?MkYyUDdnNFUrWTBIelFkaDFJSnhicHBsZnZvS2NhM3ZPSEdPeklTYk92YTc0?=
 =?utf-8?B?dnNUeko1aXRvYkVsUVprc2NJR0szYWhPdVA4aUEvdGxQTytXQ3pWejdOc2hk?=
 =?utf-8?B?WkY4V2RnU0xuME1ubXc0cWNIY1lSNTFIVWsvU01QY0xoaGlRdkd5TjVCT0hi?=
 =?utf-8?B?SHpHUTdITTZQaTAwOGtCUGhuODFqWUcyT1R0elEyZVI4emJUL2ZqS1ZPL0lR?=
 =?utf-8?B?QUplODRmVFBiYloyTWwrR0ZYTjVuNFM5Q2JRWU1PRE9pR3lkRXdoYWk1dkor?=
 =?utf-8?B?N0ZFMXFJdm9VNEhaOThmNlpRb29DVU9kM1o5RWRUS3VDNWkwSG9KS3FGOHNG?=
 =?utf-8?B?bmFHbmNxTGpJV1REZXRTdFpZdHJqdm1yeFBONG9wRjVqUk83bzY5R1BLSUVU?=
 =?utf-8?B?czE4L25xZ0tEKzNpRHRIMlErVmZkVjRiWmFUL1l6bW1nOTRwTGtkeS9PcGlr?=
 =?utf-8?B?YWpGcWlOVkdkVjNJNmJrckpSUlEvWnpHbnh4S1JQVHVEREtYSFk5Ym13OE56?=
 =?utf-8?B?aVAzSENHY0NyZ3kvbENuT1ZYd25uazIwT0hDOW9tcC80RHA0cHprV09CMVN4?=
 =?utf-8?B?TVFud3pkN0hZc2RERDNMV09BOWJRNG8rb2RDalBuWVZjb2o5S0x0SjB3TWh1?=
 =?utf-8?B?VkRhN0hwY1ZsMVByWmc5b05qRHQzaVZTVTkxSGRXemhtcWpicDdRcHQycDFW?=
 =?utf-8?B?NnBKYitGd3lTaVMzODhUYnoyL0Z6SEErR1RhYUlSRnEzdmpRaDdHQWZ3cjNW?=
 =?utf-8?B?a1pTbzhJVjJBQXBFUm5QL3BmL0oyRTRDbG5VWVZkU0RwK1ZrTERHU0NHVlhM?=
 =?utf-8?B?UnVwMUFITGF1c2tOdi9OTjhRQXhGWFJrV3oySWhOa1RLbUQvMzkyVTFuSk1z?=
 =?utf-8?B?YjBhd2FuOVNrUXBFd2dvR0xTUHprWDRwYzdMWUlwWjZsamd1dU1xNGZXNW5Z?=
 =?utf-8?B?bWtvd2U3UGtwNmhleTVnVmlBdzJIa1Zkc3B6akJYNS9WUjBoanpLZHUwVmw3?=
 =?utf-8?B?WEtJd2kzTmJHOE5jYkZuUDRxZXU4QXN2cXprRXlWZVd3QXg4NktHTktTczgy?=
 =?utf-8?B?MXgyaXNDa3d4cm9jUkdMa3FMd0JXTmtIT0owUkVLMUZqUG5JcG1KZlNOcGdT?=
 =?utf-8?Q?1vNrlLYl21vPcJ0KZB1PNbD6y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 920f9335-4f17-46ac-b2a0-08dbdf4c60db
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 04:45:34.5723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbDNt8cnBRHIcp1R2DLXcohAcS1BiSGfJx2SdcywaDVCuVF/ACieSaEYREicAdSR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6563
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
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/7/2023 1:47 AM, Hunter Chasens wrote:
> Resolves Sphinx unexpected indentation warning when compiling
> documentation (e.g. `make htmldocs`). Replaces tabs with spaces and adds
> a literal block to keep vertical formatting of the
> example power state list.
> 
> Signed-off-by: Hunter Chasens <hunter.chasens18@ncf.edu>
> ---
>   drivers/gpu/drm/amd/pm/amdgpu_pm.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> index 517b9fb4624c..81b8ceb26890 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -989,12 +989,13 @@ static ssize_t amdgpu_get_pp_features(struct device *dev,
>    * Reading back the files will show you the available power levels within
>    * the power state and the clock information for those levels. If deep sleep is
>    * applied to a clock, the level will be denoted by a special level 'S:'
> - * E.g.,
> - *	S: 19Mhz *
> - *	0: 615Mhz
> - *	1: 800Mhz
> - *	2: 888Mhz
> - *	3: 1000Mhz
> + * E.g.::

This will be like E.g.: Could you keep it like E.g.,<space>:: so that :: 
is taken out?

Thanks,
Lijo

> + *
> + *  S: 19Mhz *
> + *  0: 615Mhz
> + *  1: 800Mhz
> + *  2: 888Mhz
> + *  3: 1000Mhz
>    *
>    *
>    * To manually adjust these states, first select manual using
