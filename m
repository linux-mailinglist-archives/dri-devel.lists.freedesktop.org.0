Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AAC58805E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 18:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F24F91965;
	Tue,  2 Aug 2022 16:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB038D6EE;
 Tue,  2 Aug 2022 16:38:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGAkCorpPt0+ZrrquEDXpKua4sT3cc9wHkF/Q15io37qNp4NV54Ax09EAG4M0bV2YJ6r+1c755AlqQREO9dkmpHvSFd0OnQmV5NEFy2lrsZoXVyqQ7JvQfRCPnhUps1cfK/RtVopRYXKsz682oevePcJ1sErKroBwHfZdJ/icvXZm8ls7lqa2lIDNHIMj9dVrZrto8ni5HfGb1C3AldVY+h9gwCvs28eqd2Of4O5x/RN6k0KDFsWHYC0IDSVuqYnkhFi6xrECWJqzBj5l2ZpKqlJq5BKIeSaFJh245oAhE4l/4l62kCgwxedFzQsSG2dMRxuY0VZ+ioBCpYbGYJXYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYwXfJz/4USg5q1a6LdhI++lnYGJx+pbclqPlgypsyI=;
 b=AZ2LxzDEjUoKe0pWP8f2E2KeoMTLQdt/CIpR8mzi7/nwxBim9VZe3m1ilqXqHNV2jZ9kNKlDJNaWJRsmbcceJezf7WjtOwBk5MBRk5w97qyXrlpDjPaojkp2MnMsvRMLQYCSOpy5QKUNrKZfzxknftev94lLCVmjxKnetIEa05WPCXtmOeBKQUWasr26XHnzqCS6765MOma9JVju2+v7AWcHMDv4HfqWISHQpzKz+wDjZvZZqHG37+hZSifuN9jCUuVFcGPnHJM7l3OknYQLI4yO96ETwSwmcCdQ0wQLT7RnmTwUlal7t2cO7UfG25HjjqouRXrOT8H37+yTsN6fiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYwXfJz/4USg5q1a6LdhI++lnYGJx+pbclqPlgypsyI=;
 b=ziUd0dL/1TKyAwxyN23PaJuLLsGpNzebbUjOD36hwouwVNbsSEeuSF5OnCA62C8O0F/Hqce1veVqRbbV+16sg2inUesAaMrS3R+iE+7rO4ox7q8t8J/o6XTvJ9I9CRwJ60bjibhE47O6/WKcqFD2SsZhKHMWCBTmT8PwKVoAtNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by SA1PR12MB6895.namprd12.prod.outlook.com (2603:10b6:806:24e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Tue, 2 Aug
 2022 16:38:45 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43%7]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 16:38:44 +0000
Message-ID: <98cb62b2-e11b-4675-7017-7feba8f196e5@amd.com>
Date: Tue, 2 Aug 2022 12:38:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/3] drm/amd/display: make variables static
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Magali Lemes <magalilemes00@gmail.com>
References: <20220730010700.1824647-1-magalilemes00@gmail.com>
 <7069d082-f508-af3a-8098-081e59a4e41f@igalia.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <7069d082-f508-af3a-8098-081e59a4e41f@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR08CA0016.namprd08.prod.outlook.com
 (2603:10b6:610:33::21) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98f5e6a3-c635-477d-6aa9-08da74a576f4
X-MS-TrafficTypeDiagnostic: SA1PR12MB6895:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UY7Qvi/g9BkFkHgL0h+mX5YBpQOG9dsavldd8M6CHYKHf9x4ER8XvkSKcxziXVQm6fnly8k0m/JWja1svH/UdYidSPzW0lUIqRX7SednN5IhXBC7e3jQHP2q8pn7PunXNCNu5aYCaGXjSB6hQMlaJufjtkVpa93iHHUcASZx73mY+o40f7kLDtEQjLKdCmjsKououq9S87Oaj3lOqKSnCqgk7XapSQeqV/A3emuUsSWjeEdYyNQ+AgcSfpiCivPebww9MBwzI50n4gHCA8gHk84dOjOKxyBy4NlWh+XQPQE43ig4/RKdvuAWC851h0IedoFY+goyCslupYx1tFLMbcicJ4Tu89Aieb/tVGcTYqVa1ChC6Gjw7Da3RWl45umtXufKjPfdwaN0VDUuXNz1J03F5Xmt4n+gZFtSfop/LG8BeSxQISvPvdOsEYOI8M9NCsqng9XTCXkxW4p8M9T0FFkRxGLI515OErav9kDpLyAub/MkEEgNlbci4+LLKqSe4H7oyZa8HtUoTK3kNSNeotxKtNfVUaZyQYHd8yn7en3Mu1dCZeVIJ2gkjDTCzvghEZc1yuxwYH9koxNpI7aAxNnc/d5QVamP79jhRgeMW7sNANcGl2851gifpzbOew3KY4iyMlR046/aXWWP6Ku/0+9WgZ9OQJnHVDJcgQOJL5/nfZxs5vr8FOuV5JL/fxI1fh2R/u3bzYjJTzvHlyGJljepl5Lq4O360sQe9/DI7xF3G8WbxxSfo1Pm2Z3/QVE1pWdZmIxLfDZajbPx/vaSPjQIjBbHw7LAcwqa3uxXKya1ZqlZmNPVLgotgRkpuGTHCCA48vyjizvhk1U4WVb0LQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(4744005)(6486002)(5660300002)(7416002)(86362001)(316002)(31696002)(66946007)(66556008)(8936002)(8676002)(66476007)(4326008)(110136005)(26005)(6512007)(36756003)(2616005)(53546011)(186003)(38100700002)(478600001)(31686004)(6506007)(41300700001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1ZGcFNmVGJnNTJhcTBRWjB3cFFJQmF6eTVPWGg5ejVnci96MTAxeGc2dCtD?=
 =?utf-8?B?cnlpd3M2SUFBTkorT2M4QmFkYnVkNXBLMVd4NlZmb1RycWUveHMrbzl2RHZI?=
 =?utf-8?B?dVZxVis3UE0zQ2llOTJ3RnNORkpKRGZmMFdYT0U1N2psUXVqNlZEbXZ2QUkx?=
 =?utf-8?B?RnBJUGJxSWRGT0ZPaURFTysvSE9mamY4d2xYZkpyQThTOUFoTnRnaDBZNW9l?=
 =?utf-8?B?SUdNT2RNTkxBSm1pS05QSTFoUExnSHZkRWU0a3ZtSHZ5VGVpSlJ3QktWMGtO?=
 =?utf-8?B?UzhST042VGxqSkxTNTA3SUJtWVZEVE9mOGNDTnlUL1RvUjEzeTRiVzBJTkRn?=
 =?utf-8?B?Q3cxaWRFejZBcFM5cWloaEJpYWJUMlZtUG1WbjNQeHdTTnFWMys0NEpHOGgw?=
 =?utf-8?B?bldEMmVoZ1htYzA5UGdZVnVqY1EyN1p3NEwrRWhaZXN1RVBnekluQUlJN01F?=
 =?utf-8?B?ZFR2czNQQnAyQnBBZlBQbkZ2UzVwV2krV0F0T050b1EwcXlLdVhGczROZzlO?=
 =?utf-8?B?QnVUSVY0WkhwOXNtNXJlZUNzdkkwZUtSa2FtS0FzazdycWRpR1FLOGMrS1dJ?=
 =?utf-8?B?VDRZUWoyMlBuc1J0SDhEZWs4am9QbmRzWFhpbFJqVXhoSUUvUW0yemRJbEZx?=
 =?utf-8?B?V0FLZzVsQkpuaENORXRrT0RyeEJac1dLYlJqNEp3Q2hzUU9kYThOUFlBQjZT?=
 =?utf-8?B?V3NFamV2UXUzdVdRM3JTcWZMQlFKdFlwM0xFbGhvUEcwcUNyWGQxcmxBS3BN?=
 =?utf-8?B?dTZiR1dQRmhTa0ZLM2VnTkpQa0w0OG1IU0xHOTNJeGhvamRBdzVocTBUZDZJ?=
 =?utf-8?B?QTVpc25YY1ZLOTNTVzlsL3FNY2dRVll5NHFPUms1bExvRXV3MWZHUDZ2VDBW?=
 =?utf-8?B?RmZtaDVtd0dJTDB2R25pNi9vOXhQTGlCN0VCSytqYmhocHNldU9ubnJWV3V3?=
 =?utf-8?B?ckpHaDRURVEvanQ2Zmg2dVJKa1M3SXJzUW1HVENET0M3ZkJmcTU1SEJXNXI3?=
 =?utf-8?B?QmpCN2hiUUNaT2tVWWMreFdzSjdVQUVSOGYwcUMrRWd1RkZsNndMeGFnemE5?=
 =?utf-8?B?Y1dzWFp4RG5lT3FEMk5lSUFyWjFlNjJsb2REeDM4MVV3T0dGbkYvaG50TmJz?=
 =?utf-8?B?OXZtOUd2cFpHQXBmNmFGS3orZmJEQTI5d0VkY0pEdjdKMDZidnlHYTByeUp5?=
 =?utf-8?B?b0hBZHpJMHlqNXdGaHFvZ0E5NnJqKy9QV0tXNlR0SS9DNU9jSnhsUW1QZEg2?=
 =?utf-8?B?VmRtVCtkSlhpWnBxS09OYWRSQ2ZZK1RuaENNNGRDS1hRNW9nc1NIbUVoaGFF?=
 =?utf-8?B?dzY3RU5ScmhPRkc3NjZLcWVjWTUxOU4wQzRDRnZVN0VRWFRvTTJFUTJ2SFZX?=
 =?utf-8?B?cWNMT1FMU0NQamhQaUpLTzRqcEtMY1doZWVmR0s2Sy9PMlYzVUZaYVppdHEy?=
 =?utf-8?B?bFNpcVZQdkJ4TE5WVWpJOGdhd0Q3SmZOVThhQnZsUmYrd2x3RjFyekJTTTdE?=
 =?utf-8?B?Yys0KzNGQzd1NFpsdHkzSkYwZzRvUklhUkdra3A0QkpDS0diaTRIMEI5NEIx?=
 =?utf-8?B?Ukl0ZHBGQmExMXlZUkVoS3FucDlwYkZTdXBLVjBOMDJSM2JDTTFpbnE0YWpD?=
 =?utf-8?B?VmI5bGdBU2IvV0V2aDlXUjdVb04xcEdTUVJlVE1OYXpQN0pwZWxvWm5OSWll?=
 =?utf-8?B?OVA5OGo1bEdEZ0t5R0dQWDhqaDNjdUI3QVRQN1RXQ0dzMkYrK3Bjbi9xYnIy?=
 =?utf-8?B?OXlNMXBvTmdQRkNUWmZHS1ZqOHlwYjhlVlVkMzZoWCtienYzbVFwdWNvRzRl?=
 =?utf-8?B?MmEvZWRPQTNodkFuRDQ4V0NJT1B4amR5NUxDcnlwdUlSdDZVdXJtM2xLaGpk?=
 =?utf-8?B?TE5DWnYwSHdxSWlpdUxWYlU2dGRzNURhZXlGTlBpUjZFUGFZMzM1aG9jdWh4?=
 =?utf-8?B?dTNobDZZV3VQc3JHaGx0MmduaS9zN1BkSE5QL2Y5SHduMVZpTnR0S25Zb2w4?=
 =?utf-8?B?aHJxdzZjSVY2QU93d3pLZUhQTU9LVU1IQmh4VjVDY2o1cE5jemFSb0FHR0M1?=
 =?utf-8?B?U3B0T2dXOWtFNGRtRUs2TmliVEhCa2g0TWhvOWdGSFJzKzBLcDRnZDROSlhX?=
 =?utf-8?Q?jslTWjpSAmy1q7xF4a4P+WxCF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f5e6a3-c635-477d-6aa9-08da74a576f4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 16:38:44.3314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLNuv8x550tUpFBiP+Kr+h+5N4h3gw+olO5zujO4GuvfMSMO/d6PO2fYUnbMjr/vUmhonKk9UTYoMNuyz7YYNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6895
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
Cc: siqueirajordao@riseup.net, sunpeng.li@amd.com, tales.aparecida@gmail.com,
 airlied@linux.ie, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, mwen@igalia.com, mairacanal@riseup.net,
 alex.hung@amd.com, dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 isabbasso@riseup.net, andrealmeid@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-08-02 09:31, André Almeida wrote:
> 
> 
> Às 22:06 de 29/07/22, Magali Lemes escreveu:
>> As "dcn3_1_soc", "dcn3_15_soc", and "dcn3_16_soc" are not used outside
>> of their corresponding "dcn3*_fpu.c", make them static and remove their
>> extern declaration.
>>
>> Fixes: 26f4712aedbd ("drm/amd/display: move FPU related code from dcn31 to dml/dcn31 folder")
>> Fixes: fa896297b31b ("drm/amd/display: move FPU related code from dcn315 to dml/dcn31 folder")
>> Fixes: 3f8951cc123f ("drm/amd/display: move FPU related code from dcn316 to dml/dcn31 folder")
>> Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
>> Reviewed-by: Maíra Canal <mairacanal@riseup.net>
>> Reviewed-by: Melissa Wen <mwen@igalia.com>
>> ---
> 
> Series is Reviewed-by: André Almeida <andrealmeid@igalia.com>

Series also

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Applied to amd-staging-drm-next.

Thanks
Siqueira
