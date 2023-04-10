Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 662DC6DC803
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 16:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C659C10E3AC;
	Mon, 10 Apr 2023 14:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9312610E3AC;
 Mon, 10 Apr 2023 14:47:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzUoLWoPTlU9B2RA1NHl6aLRpUe3Ra0BydvfZTdiRafzZxH42stIKu44lujWsTwm88R9pAkJsfIrWuUxemSk8GqRbWzVAD8LHI3OsO6SaYO3IQEUZ9s8AO29ux/eT6KpIqQujAEcgj6qyZ/b+IT+/WgMkWG2+8ZMBHBp5bttBR08m4KLUD7euoLW886popIXdburx03jqx5FfWMmneH53YNWsY15JlkCtGSwvp2Ww3bfhRZf5rbxokLuGPMiVtRrSzEQw/WSvtvcLDfME3Frdq7IN9TdZ0+mP5M8Kr9KEb60wOee8iJIO7pmBynOh9CcGeCELTd6AGGYxnEro2UW3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkFSxEic8xsfLIYgltX15dKUbFbR+SKJentlVzVu4vo=;
 b=Ko7l2icfX8BjizsZYwgriUauBkcmiCzJQylTds5IZmRtpfLvYQtIFknSagMb3zdf14QoA+a/ODNdHxYHe+bJ3rzcSvrkGFCEfMd4QuFPBHaYPdYVozU8S7ZLQfhvilFrjzGfApFnqP5c3rkv/hbQNPQyy8VJmxoJ3dov00/QWEEpJdXtFoAS09LuKrju1gw8mXqR9RBcfKtDU1wBkL6c8muUbjWPBzRQ3nxxPvzCdQKPDka7TZqe9IamRty3BAInPJzEIdmJJCRYNW0MWnGVz+b6+1H1dUntNanPuZcfj+gR3djXxaByyePXkUCTlH9xRIMlMo4+NiAx42KyJX+cOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkFSxEic8xsfLIYgltX15dKUbFbR+SKJentlVzVu4vo=;
 b=HdmpltIyYemn2E7ybFwyR3g+7cCj4seFuj97G+pmkH4aZkhdBUXiJ9Xx3cOpa0xoH1hzetiD91dPfze/44FBI4aD4ZZk8Xj85a249Al6Btxl74nwm/CVWlHlvirAafSTE4qxTtYkxr2EU/EBVh84WVKYaW7XYkz4t+t2NZVc1ao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Mon, 10 Apr
 2023 14:47:07 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6277.038; Mon, 10 Apr 2023
 14:47:06 +0000
Message-ID: <9599a873-000b-5d97-b022-dfad04583caf@amd.com>
Date: Mon, 10 Apr 2023 10:48:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/amd/display: set variable dcn3_14_soc
 storage-class-specifier to static
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, nicholas.kazlauskas@amd.com, Jun.Lei@amd.com,
 Pavle.Kotarac@amd.com, chiahsuan.chung@amd.com, duncan.ma@amd.com,
 Charlene.Liu@amd.com, muansari@amd.com
References: <20230406184434.1956813-1-trix@redhat.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230406184434.1956813-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0480.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::20) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|PH8PR12MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: 85af1689-3b3f-4497-3a82-08db39d27484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pnMybp9D/bUw3cyiTHWeExk6KJD1rJLlbbVW69VrltC9gz54TntEVcT93I+KW6NWr3OPaszRbEMYEiaHI8HbUjNMfKmNcqssL5IlBerbSZaIHLY7YW4r5Gx5aTlGXhaiaaZmKVB4PyLu0bBrr5dAakWWUTfC5aQab8dmZHR3PdNiKzxhcNkXnGXRhMBeNW/sBqzL27fRuRJrGHh4qVBiSGhlmHPX2wf5wjF0xgCXw7xngJMScuCsj3B6zWP+Uxm4Dd1/hXqyJOFJfqqswmjmkPXHVhwCUeRKBiJgWhBFlLEGQKWxfHuO47uCkha7TRPEobUvrrR7dDyfNguWOGijkFNLTdSEdX6eHflBcMamMz5jDAOZnNEbqvJmJ/zheAIWiYePGVd4UTw5r5/l5Jl0d5Oy/7reMLjZbG4t93P+YJPDwoQZ5QrTP2lheijFSRmRsRR+VuyiyUWhpW87iqYHsj7PDv4YRjG8O9DTh9iyTSrJRYfG3bg+MUc+P86BV/4Xv7tjkllj81V6ytrUCEPYylLqUasVrWLqG9Qd96zs+/XHNDPJ6LPMXs0zbRt2NlfOT+qB/aANxuJ/eWy0PjkTuH4vzYOLdH0F3XXnAVNeJVE1+XBUiPFT5FpVhfVz9A96OO84nc1JT2ziDVnZiRDSx16Un5AW8V/FXvKlWgf/RPQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199021)(86362001)(31696002)(36756003)(316002)(41300700001)(8676002)(4326008)(6636002)(66946007)(6486002)(478600001)(66476007)(66556008)(5660300002)(2906002)(44832011)(8936002)(921005)(38100700002)(186003)(53546011)(6666004)(6506007)(26005)(6512007)(2616005)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTh2bFFCYzdKNW93a3NSczNzZE1MTGNZU04xSWdGQ2JRd0VjV0MrSWRSUzlO?=
 =?utf-8?B?TDJCYU8xaHJWRkN5THRlRFQ0UkcrRVlhdk5qTng4d005MjVBOUxqNEdMbi91?=
 =?utf-8?B?SXFKa082dkdIYXJFRm81SXUwRU1tdjRKVS91ZXkrMUJrcjB4Nk9ub3FPRFFj?=
 =?utf-8?B?Szd6UW12cyswZENUME80bmJYMktWRjRLc3dsczJkSWJVckw0MGpMTm9La1BP?=
 =?utf-8?B?c3ZMNXlEZ1RwMk9CUlpVZFZqRU92Si9QdG9QSzdHWEVWUlVFdmFqeFR4am4z?=
 =?utf-8?B?TTdtZU92VTdVOE53OW9PbmRWRmc1Q09XQWxaU3R0QzFRMUhjTG5KQXVIaXpm?=
 =?utf-8?B?MnV1V3BPV001bG8ySzRENUwvazI0alR4NXloSEdSdEdlUmlGRW13K2g2OEQ1?=
 =?utf-8?B?ZVE1UjQxSzRtTE52cHRoU283L0dRR0Rsc3Q3Q3ZNTERSMHpIbXBQL21LZU85?=
 =?utf-8?B?elhzK2xraGsvZUZuRE51MGs3QmpzNVR3dTd4elU0RXM5T2g4dzBNa04zVTZv?=
 =?utf-8?B?cmJWYUhwK211NlE3WitJTnRVWjUwTkxjWTdEWm1oOHAvbGQ2WlVTSWZTN2gv?=
 =?utf-8?B?VUtnNnp0ZkdPWUVOUnpKODF2QjR1WDV4eWFrQTFiN0RQZS9GWnZyQ3lRMitE?=
 =?utf-8?B?Y1kzcjhhcHltN1pkZDhSS1doMGJVZlY2ZlBhTmh3RUZKSFhRMGlHSU5tTFJH?=
 =?utf-8?B?SGlOVjhiVENNKzRRelMyK0dScU9JMlYwNjdEVjdSL3k3TVlTNDlrdkRYMTFq?=
 =?utf-8?B?Y1l4T1E3MDg4c01SbHo2NGc0UEhiRTBROHZaVGFscUR0TWVXdUl3TFA4ZkEy?=
 =?utf-8?B?ZUdObmlSOUNINjBUbkt5UzUzeGs4cWV0ZEIvZGFsVnlFbDRtOTE2Q1Z1aDRp?=
 =?utf-8?B?UlhBRFdIVGV5VzdKQUljTHBVd1lETmlYUldjWDIrS0VlWm5JTTRyeGh0eldK?=
 =?utf-8?B?dHR1aTdSNDJnQkphcm8xcTBiVU9qZjYvUVJqeTBuclIxMmFrSDdRSXFlc011?=
 =?utf-8?B?SUQzUjh6SVNwZXgydVFNWjhBdERSNW9qc1BNM3Z1ckFmQUE3QTMzVndFa0Jw?=
 =?utf-8?B?MDltRWtLbWF1KzN2Z21iNnhvK3RXQjA1cFRYcXQ0TG5Iajc0cjdkdkZCZ0pM?=
 =?utf-8?B?aHdCZmlrbDE2QWZYbWl2OGVRQjB1d1kwang5ZjBySG9JRE15bTlsRUhicVp2?=
 =?utf-8?B?dTlGMG1XVE5lOXZWeitwOEVYdXpueTN5VFhLNFJEZTk2U2NueHlTOWlaSHRO?=
 =?utf-8?B?RjdETzRDME1HRVY5MVdUY2lycFFOcXp3UWtZcGF6c0VPZG1lVGpEUEFJS0M5?=
 =?utf-8?B?WU4rSzJhVGw5NTdwc2ZXTjZqU0FhQW1STmNmMlBlQXg1aS9ESlY1dlU1NHZC?=
 =?utf-8?B?S0dzWmN0V2w3MTRMWE4xa0FWM0FPdDlyMFdTcmRDSXpUN0xXaGI0SXZ5RVNE?=
 =?utf-8?B?YURBOG5sYWhnZ2x6eHd4amNmSmJjK3ZmM1hScVBjaElzQ1NPNElHSkR0ZXNT?=
 =?utf-8?B?L0JJRjdhblovQmZlOW1kV2k1aVpzQmVTUFZONDFFdVkySUROTE5SRnV0Nkh2?=
 =?utf-8?B?Qm10TzdHTkgvWXJnWG5NbG9DQzN1T2RqZGJFWWNnTDV1dGtkcWdaa3IvdzMz?=
 =?utf-8?B?NHdXcFJmM3RrVWtzYm1hUkRtMjRrdHU0KzRPcVRpTitkL1ZDcjJLNkM3dzBO?=
 =?utf-8?B?M2drbzNKN1pEdHE4OWVGazNoY0E1TGpObUQxMkt4ZU5KaDF6cWJuSkI3SjFT?=
 =?utf-8?B?Z2tmMDRVUkoveUJScStlOHFaN3NISzJ2VHc3Zm4vVVZxU1ZQajVpUlhBVzlT?=
 =?utf-8?B?UHovNzZ4cUROUWdHblg5M1VNdFZVVkg4anU0Z1psbVhFUDh3NEV5aWUveHJw?=
 =?utf-8?B?R1Q4NlBseGRRY3dLVk5xaDdabytOVXk1WU9qS08waUkxaTV6c1pjU3VNM2xm?=
 =?utf-8?B?YlRSNjdoT2tIRUl3dngzWGwwbXp4emtTOVhTNjlHWC82M2JNTGhKM1RRb1Yw?=
 =?utf-8?B?MVVydVBKbG9UQk1jTjJhUURWMmJTRjBXdWtUQzRTd3FHN1hqVWpwTC9pYTRa?=
 =?utf-8?B?ZldQL0ZLOXdrdTNlcnhDYkpIbm5JU2Yyd1hSVEZNT2cyOUVUQ0ZNTjF0R0Zx?=
 =?utf-8?Q?xA1SezruSVXrjrzjOTdNspMjD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85af1689-3b3f-4497-3a82-08db39d27484
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 14:47:06.5877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zOLnUqSwaG9pJbdUMGuYh+kJnbI2f3eAM28CscWxyALEQzlrk/kvWbYlREEULAA7pC5PHNXEvNPF3gKVJLoDhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7110
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/6/23 14:44, Tom Rix wrote:
> smatch reports
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/dcn314_fpu.c:100:37: warning: symbol
>    'dcn3_14_soc' was not declared. Should it be static?
> 
> This variable is only used in one file so should be static.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
> index c52b76610bd2..44082f65de1f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
> @@ -97,7 +97,7 @@ struct _vcs_dpi_ip_params_st dcn3_14_ip = {
>   	.dcc_supported = true,
>   };
>   
> -struct _vcs_dpi_soc_bounding_box_st dcn3_14_soc = {
> +static struct _vcs_dpi_soc_bounding_box_st dcn3_14_soc = {
>   		/*TODO: correct dispclk/dppclk voltage level determination*/
>   	.clock_limits = {
>   		{
-- 
Hamza

