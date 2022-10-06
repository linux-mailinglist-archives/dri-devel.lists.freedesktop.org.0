Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C900B5F6B98
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 18:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23AF910E835;
	Thu,  6 Oct 2022 16:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2049.outbound.protection.outlook.com [40.107.212.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56F110E835
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 16:24:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZkG9y94q4mQKj2cwXbYsgHjfZqF2+MsPPibzpBQyK4QbYBq2+5UW7mQ6H4ArGL1hcGAQVl2jBAQbMrgHdl+q2i7TNKWSgGHCr1710nYtSL6ycQy9zxLS8NxFecG1+Jf+YjTUu5vbmkErP1ON9Jjz99KkHYJbZCygjnygwnkBkOmJfuN9ezUk6oFxHpRrKGl+EJxhXh5LDc8tahSc3EqMYmci372k3e2pvRtjglVFsnvBQazeGMQBdg/gr3BTCQwuNrsJYiKSgZc0cV5W+rqExOJTZAxgIib0i4sCVhTxjCuOsRl4vabjCEiVL5cPz8UNCmEMombUPUj5G0MqzD7iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5OJeSVkIZnnqIORV5lWGTBfb4OnRJCO1WlEpEW36GY=;
 b=dGBOxFj7rN8DvfDXv5WdHmqSAD1ixUAcdfL3Sxoa/FrwWW0d4vs7ocg2AShIXo7MZ9NKDIsHbJnX48h87Txgj9tEckL8hmTF3h0A8ohDRrtgC2XzDHzHUCazx+IJ0yDZE1t2a84BotMuIh0WRwHhT5Kbw2CSCxXHHDtiWLLNmcFtei0ejkdnpZr59LI3vW++LtL6xc3Nqi5wOpkzrwuRdhDByO9UBnAVUKMDtKp0blSUhgu23uL9AII6rds0eP7pc5eA1Td5+x93agIEkO2CuakUHhE6qP8yocYiTz+vF9AgT/3yyeuJTcf/F0uqP7fZoKBhlZAMKQRlw+nCY2qxzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5OJeSVkIZnnqIORV5lWGTBfb4OnRJCO1WlEpEW36GY=;
 b=Tnb8Ya44mBvVkYvoauancOfiJskdev8NnSgLFnQe0RbDNCfcLrpCmPqzkLI97UzFJoVL8V4DymDd9Pf8kDMPPH6HzVEK3j2ySt7UebDLbelbHqxhuPfdXljDHOsr7Cuq2RjHo102xYP16aUUEVszZ60IhHWABHhjcQnVNMdVuoI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 MN2PR12MB4360.namprd12.prod.outlook.com (2603:10b6:208:266::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Thu, 6 Oct
 2022 16:24:43 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::8d54:65c4:c1e5:8f02]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::8d54:65c4:c1e5:8f02%4]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 16:24:43 +0000
Message-ID: <a02ce536-0f45-212d-cb97-ae6aae6c567c@amd.com>
Date: Thu, 6 Oct 2022 12:25:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: linux-next: build failure after merge of the drm tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@redhat.com>
References: <20220930105434.111407-1-broonie@kernel.org>
 <20221004132047.435d42db@canb.auug.org.au>
 <CAMwc25oshRcJBoCT70B+b42bh5sPqgyoHuBx6K6ZLrwBMHnJzw@mail.gmail.com>
 <20221004140558.64f59f2c@canb.auug.org.au> <YzwbW4YQwQPsRPYw@sirena.org.uk>
 <CADnq5_PbPQPui1tOdUMB+OYbz6UBMKCgtwvE95oA+SfcN0RzNg@mail.gmail.com>
 <09cd11c5-2a15-3653-957c-88c751fa9029@amd.com>
 <20221006092810.0c3a2238@canb.auug.org.au>
 <20221006191245.11bb0e2c@canb.auug.org.au>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20221006191245.11bb0e2c@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR16CA0060.namprd16.prod.outlook.com
 (2603:10b6:208:234::29) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|MN2PR12MB4360:EE_
X-MS-Office365-Filtering-Correlation-Id: 16bf75f2-87f4-45eb-1064-08daa7b746bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q9mZrytLlP4ouhOMCecRpb8lZgVATE3POW3CjsOU35/AXgVMrx1Sz9PdXrmLOgQ8wfrtXcucvosYLm2FYXf16X2qVYZH3FDYFCl7RbyGwYutZAZPOv1NRD7r+VniyRgaEnZ6k81m2BWZVv4rv9UwA7peCh7sCoLv/QOEG6+jhqXGk3EL5W+HCFIM6kAeoUctCj4IkcwPfSEu4QdaB/2vpSZswf+XBZLIs1UG/liU5DVCYFJFR8WzIuox0lejS3HSA8p26YtEAj6o0NSPf/KDlFbR9KYjFoPLmN7KZpWRKc1jCgbC8dVixXR4/7roUhobZwCwtFE8dV19Uu1vlCQEWzvrh3JRptQOwzvv4LzuiupTSdJte6ezgqVJfqztMu/AwoPOO3dpjc3+LWOTPeE/Qp7JE4n+skOR0ffWBDGeCe+9J8RrioZ14dj6vo+Tx5DjeTmAb7EuFewiaFnvop6wZlu9mzWCZIiK9ixU0DOVRBG6Z8lDIcqCX+y03CcverTjpw0W8MkYkKBrD3n5bI7aC1ybnlglQMFMKHPR6pEBqjrTTvzmmvppwpQycclfHtqpBu6sLpnMGwiUDh0i3Ecu+WzdeMz+6K+NRqE7v/a64HwXY2DjbpuRzfcUrX5kkTXZvGTapZR/3rUPvaBMysKh1Kb1dpCXmkadfpGdk9q8JtVX2jYNdflMBFAVruP2ni2ZRIfghgLkn/42pygtAd15dyO/j43HJdDovf45tsy7MDg2USrY1GFUDua4thY5ugIu1cm15tiAE3+vTIr9vCi4qY9M/BieLE8p1Oqx+YRRQeg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199015)(36756003)(31686004)(83380400001)(38100700002)(86362001)(31696002)(186003)(2616005)(53546011)(6506007)(6512007)(26005)(6666004)(478600001)(6486002)(2906002)(5660300002)(44832011)(316002)(41300700001)(66946007)(4326008)(66476007)(66556008)(8676002)(110136005)(54906003)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmI5Vmw1WmpYb0ZscU5HOWlVNjE3ZjdkNEV3R1pJc3MrOUl1bndDNFYzbVlU?=
 =?utf-8?B?cnlPWGZxa3Z4amlyajBMRnRPa3dodm9QU2h1a2I0bGFFWWZBWUZrMU9hSWZK?=
 =?utf-8?B?MEFOQ0k4VmNiT2xvdXpFazFFUWNVVHNsQjJxQ3NhT1FXTU5ybFB0bDV1UGRX?=
 =?utf-8?B?bWljZXZ6Rzc4cG5wZUVSL0NEcGNkZVVIaitaZkhPd1c1T3RjV3prM1ZsZE5Z?=
 =?utf-8?B?czhmUnh0QjZleHR2L0NTeElqcUdGMTQ3MCt2Qi9KUGc2KzZhTFg5SDhJb01B?=
 =?utf-8?B?ZjExZ3czNkhCRnRNeEFFYWNMajBuYzVIaFhWeWI3S0k0MHJwNWwxUE1ieS9H?=
 =?utf-8?B?MVgvd0k4ZDZtMlZ5NDRwRWdVdndTQzZJeUR2VUpsL3V6MHRhNzNpNWR1ZXdp?=
 =?utf-8?B?TlJ1cWxkY0lRV2FNZm5wMmpiQXExK04ybm5WZm50aEh4djlXTmhqcVZWUW1N?=
 =?utf-8?B?dEFETFVNcEFUYllMTzNSUFI1cnV1bVRpNy9tdzVqS3FwTDgzMjc1ZnljZXp4?=
 =?utf-8?B?UDl1WkVIRkcybEJEeDdOSDVuQXVqYm4ycjZ0WDZGZllsTkV4cGkzTkFmaXRx?=
 =?utf-8?B?STMwRzJGRmZvYjJ5eGNEdXNpU1k1RUtKMVNndXVpYkdJNmNzNG5zL1JXd09S?=
 =?utf-8?B?TUMzUTdFUGZVd05ML1dHaUR2ZHBuM3I3WGMrTWxKOGplOG5GQnRDb2thSUMr?=
 =?utf-8?B?U0hRamFPcjJTR1VqaDNtU1hDQTY3K3lhWE50MWM3UHhOTzU4MlE0aVNLWW9p?=
 =?utf-8?B?c3ZVKzRzTGxma0twZjYvUk5WUS9NMmI4aXRBb1Z5NjZLTlJPNW9DN0srcGl4?=
 =?utf-8?B?R1JUc3daMXYwUHRtNVIrdGNSblpWYzAwTVkvYTFLMkhwb2pVK09pOUluR3lH?=
 =?utf-8?B?dUMwSjI0eWQxdDhtUzN6RG5kUXZDb1NiUmhnMkFNNWhzV28wb3pBYmF5Vjdr?=
 =?utf-8?B?L25tSDlTOXpJZEhwQUc1Y1cwMmJ5WVUvNW1Gb2xKTzlNUGtwNjRBNi84UVla?=
 =?utf-8?B?c2xGQzJMK2tSSFlTS0NjSVgxUERPOW9ZNmIrQkhZSm9JTFgxakNoWVdoQlFG?=
 =?utf-8?B?QU90cDlwdjVjaWtuVGx6M2tQM2RmajR0dGxqVGhsSm9DVElvZG9FTWpwYmZP?=
 =?utf-8?B?d2NrZTJGeC96dWd3bW40WXBEVzZobllrMTlvYUhKL0Z1UUoxTzlLSXA2Skpp?=
 =?utf-8?B?UnJXNlJrVXhPVDNpcmwwT01RMzRaalQ1MVVGU1dUdDJXLzF5b2pZYVNEakFx?=
 =?utf-8?B?V0lYQndjM3cyVnRkZ1dFZmRqUW0zL2x2NkR0L2JLV2o5Y1Z0R1BTQ1B5MWZn?=
 =?utf-8?B?ZTdjYnFKMnJjNHdic2xieFNENkdHZmlPOFJwWlZKR3FRaWlCckZPWlJNZmVW?=
 =?utf-8?B?YWRFbE5SWkdUT3YrVHFDOEhRanhWY0I0L2k2YzRNUzRlOS9zbDlHZnJZUzdi?=
 =?utf-8?B?VU1VV0lSbFFZdGtZVmthcWpSTlB6aytVWnd6QXh5VEVNRXdhK1dFMGdtOTVu?=
 =?utf-8?B?a3FBUjBWeG1MUzlFV3ZYR1VqaUloMW44dGlkbTM1bjJyQld5ajZjNkx0b3Fm?=
 =?utf-8?B?Y0lBam1oU0UvUXp4THhBUDZaZktxSjk4bjVIbVlhOGtGR09KcnZHT3pNak5O?=
 =?utf-8?B?bVFIcHN6R3NjRFptMitVL0lNUFdmYjJCZjJ4S04wQmVmZHJlc1RSV3pXM0sv?=
 =?utf-8?B?SG1TeXZjWUNWZ0JoZUhkMitNRCtGb0pLZmtuUVZSSklXM3B6K2pnMDhDQ0tX?=
 =?utf-8?B?QzUxVW9sTGI0RGpuS1RSYUFEa3JzVENWbHVERk9yYmUrQlA4RWllSnVPSGF1?=
 =?utf-8?B?QUJzN0pYSzZzc3JNMkJmR2IrVWlscEEvU1BtaWVyeWF2SnFiWUhXTlRMeUpE?=
 =?utf-8?B?R0IxQU1vM295eWh3NlBpSWlzNXdhZlZDU28ySmNOR280T2sxYkYzOE1GOFpo?=
 =?utf-8?B?YWE4V1p5QS9sa1BnQjNwKytuQ2JsZ25Va1dZVXM4dnRxVGZhMHpYY1k4cEJt?=
 =?utf-8?B?aEUyZVRCdkpFNHhvSWhOZkpHMzFkMWtCSzVGRHlqZVZsZUFJSXVnbE9VckYz?=
 =?utf-8?B?bFh4OEU3UHgzaks0YnJSYXFvSUViS0xuNGRtRkkxODBnb2RuTDdwanBWQnVr?=
 =?utf-8?Q?6AaGfPcZPFGe6fUrJtOUbAyix?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16bf75f2-87f4-45eb-1064-08daa7b746bb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 16:24:43.5427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TugPX+kKsTJ3DFYguk2Q6dtvOS/XNRLvVN+A/HP+7p054We1DulS/yM76WEhN2yhtG89WuVZR8aIobX8NmRlOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4360
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
Cc: Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-06 04:12, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 6 Oct 2022 09:28:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> I have applied the following hack for today:
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Thu, 6 Oct 2022 09:14:26 +1100
>> Subject: [PATCH] fix up for drivers/gpu/drm/amd/display/dc/core/dc_stream.c
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>>   drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
>> index ae13887756bf..a5da787b7876 100644
>> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
>> @@ -520,9 +520,9 @@ bool dc_stream_remove_writeback(struct dc *dc,
>>   	}
>>   
>>   	/* remove writeback info for disabled writeback pipes from stream */
>> -	for (i = 0, j = 0; i < stream->num_wb_info && j < MAX_DWB_PIPES; i++) {
>> +	for (i = 0, j = 0; i < stream->num_wb_info && i < MAX_DWB_PIPES; i++) {
>>   		if (stream->writeback_info[i].wb_enabled) {
>> -			if (i != j)
>> +			if ((j >= 0) && (j < i))
>>   				/* trim the array */
>>   				stream->writeback_info[j] = stream->writeback_info[i];
>>   			j++;
> 
> This works as well, and (in my opinion) is better:

I can confirm that this fix works on GCC 9.4, as well.

> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> index ae13887756bf..fb6222d4c430 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> @@ -499,7 +499,7 @@ bool dc_stream_remove_writeback(struct dc *dc,
>   		struct dc_stream_state *stream,
>   		uint32_t dwb_pipe_inst)
>   {
> -	int i = 0, j = 0;
> +	unsigned int i, j;
>   	if (stream == NULL) {
>   		dm_error("DC: dc_stream is NULL!\n");
>   		return false;
> @@ -520,9 +520,9 @@ bool dc_stream_remove_writeback(struct dc *dc,
>   	}
>   
>   	/* remove writeback info for disabled writeback pipes from stream */
> -	for (i = 0, j = 0; i < stream->num_wb_info && j < MAX_DWB_PIPES; i++) {
> +	for (i = 0, j = 0; i < stream->num_wb_info; i++) {
>   		if (stream->writeback_info[i].wb_enabled) {
> -			if (i != j)
> +			if (j < i)
>   				/* trim the array */
>   				stream->writeback_info[j] = stream->writeback_info[i];
>   			j++;
> 

-- 
Hamza

