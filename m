Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C03827982D7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 08:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A3510E054;
	Fri,  8 Sep 2023 06:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A086F10E7A7
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 09:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1694079758;
 x=1725615758; h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Uod+QW1rqqmCmu4+B2vjNdF8rve/S1mg+NZwFW+SwJo=;
 b=dd2rjY/TZFT1QHLuNia8m8Ip77NrsK5ac9yl7vpnKl/eNbymTrLuSPCm
 ImSfxzO1dpkrRf78uuLmm3Q4vjF5e1YghXl/YQoYJDLQrZVcIwpTUrwuH
 YeKR9aQSgUq0sPIBsPd2djyIH/8lBBuj84bH9i1eoNZ4wo3t9c/fpwRvz
 oP9iMFVathnEwXkX3E8IlGU+809EGQTOjzSSp4Vl8BmjWFA1VqXcSNcd/
 5A23OLY57U2G/ApTAr9EHoWippiZuFhatPMtXPE5AZ4Q7k4BJwheTcGlo
 bJwBAECp/56wijh5X5dtPDlN3oTqCZBnw+KjLNBX1ualyslXnIHzoAqAz Q==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXQtpNatlWps+4pc3DQNbYiMfY18Gg4KORuXwHDCdJaH8gtXxPGgB2MFmGFiAaBqryiy1DjbIAVGCBnUh6rUv1agBBuA/YG1ESNEtp6dAoqt+HheapQbaoZUnll+HoI3bYu3hSfU4ZT7+FMNj/tlq3dILOa67mHytJd/IllTCEVVEYPssHNCpP9bUn7WcUcYBlfiYJ1jedH8vJhMIcd7HkFHunS4yUc6RCRAjcNA59YBz2q2U7I/Ow16h/eJVSorGHiRLGO0Kso4v5zzLc7htLf1uA0J1KISkEfr1uLO7llvEnWRCp2UZ+gEshO7FV1sEfH3DlepbWFAzmCGOkhiXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uod+QW1rqqmCmu4+B2vjNdF8rve/S1mg+NZwFW+SwJo=;
 b=aO/exoE+H80GgBlwVQetd72lkpnNkPrwsYkVUOInzBb5Et8LWCFu6N9OmI2AI1+n0ZicVrbtl0qsGi9I0kGjdBc5DGhdtrbNL9eUtzpI0Ew5Ah/XjlPcY3tTwhJZI7cjfPnRl0PE0rQd/GfMgFxyh5AfIG2ScPadCcYrFwffesgz5Emgu8x/686eyiv6rmLd1w/mb95s1RBuTjBd4Eo7D5jaei1Nzl6bC26YDIM21ZV+zPtkyO+nucWVYV9cDbEZHvbpTLgfDlNZhzOYIWqrCsaXCLpLunn4p4KuCqWXTCYPqq8aY755sy3SfUWZTBc1q4dePG+qfsAKdtlmYZozWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uod+QW1rqqmCmu4+B2vjNdF8rve/S1mg+NZwFW+SwJo=;
 b=IBfR12EteA/EYEthmMYww9CbF1DlQ04S6K/gBsmKSptMT+ThrKGTAEDGIfjjxiKQFhhSybItGSjQiyVTIv2ovELLcDg2scOGS7B5XKNuMmxjaaoD+AC5mMVRiFkCOfSso/qB59jFsklgS0XoKXKKLGANtVLRnxNaULsOSh93IKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Message-ID: <310c6236-b231-e66c-1c9f-d2dfc5ab3ad5@axis.com>
Date: Thu, 7 Sep 2023 11:42:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 0/2] Add st7735s drm driver and Winstar panel
Content-Language: sv-FI
To: David Lechner <david@lechnology.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>
References: <20230906-st7735s-v1-0-add92677c190@axis.com>
 <bf1b80c1-0499-ebf8-969c-7d9c40538c65@lechnology.com>
From: Stefan x Nilsson <stefan.x.nilsson@axis.com>
In-Reply-To: <bf1b80c1-0499-ebf8-969c-7d9c40538c65@lechnology.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0020.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::15) To DB5PR02MB10072.eurprd02.prod.outlook.com
 (2603:10a6:10:48b::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PR02MB10072:EE_|AS8PR02MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d6cd3c6-43f7-4747-4a07-08dbaf86c2df
X-LD-Processed: 78703d3c-b907-432f-b066-88f7af9ca3af,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0BiMDdyBRLSVG3jLMbN+InH+wpslEJH9RO5K+pxLD3y01FL2v0G4+/tml/qjdXm6eCpoCkmkv8E/eZhf7YFG/3rb8fnoFtc1fmRPhyEF2qJBcIbNnYZ+mPZVK5B5AZ9hzP+zucTNAPOUOCR7qDYn93ciqWanPoVyz18c8Wd4hw2eDZNcUKbubJcpN8EiAPPIbDUQco6Zi94BbrbuGBu84SXQ+w4uDY/e4XpGwNrm+nvw8boN23uGE8Gkxam7FdPcsbCZ/FBA5FveUFccXAKgcuPKMa6hZlgpS+efzouqjgSMyQsbCs4iQmSj1Y/w3LjrAIXiNZPACTwfO0jE0BX2j7+FK6QGm0RuYsPzBlkcDcDmqJ/qd/CGdzE6h4Z840uI/yC20XEHKe+mnGlM7U1PKEDn+Rpg+K6Z/uEBvyBX9W6I8M+j2M9SaBweWl5RbSOAcAq+BufT282FiLDwwoIkLiIZqdhnWBWRHlz9w9NrqDKWrDABT2d+XaK0gXIC9L2h/kpetM7GEOCxRGAyltM3NGZLdq6x+UFn8m+ljTvLHoB4ongZIp9URcjhZk6CZxGQIZp3mjdNJIckrZ+tRiEee+sKDDDOraNUpjUK5q//cWrCkPQVn5C5QutgU5BWirLpRC9rIHARY4gwKL5rJ+m4aQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB5PR02MB10072.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(346002)(366004)(136003)(1800799009)(186009)(451199024)(2906002)(66556008)(4744005)(6486002)(6506007)(316002)(66946007)(66476007)(110136005)(5660300002)(966005)(26005)(478600001)(107886003)(53546011)(4326008)(8676002)(41300700001)(6512007)(2616005)(8936002)(36756003)(38100700002)(86362001)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFAzN3pWT21vSVAyQ2Q3Mkkvd0dhVmZ3dFRlQzRYNEVhVnJRSVhxTWxaN3VG?=
 =?utf-8?B?ejJPaUpSTnFxemRaYktka3orSWhYTnIweGZUN0cxZStLU0hkTlJ0bmxOTnc0?=
 =?utf-8?B?VXl0aEhsdzlpb3dxWkdteE1yaVkrNHpmRWRoLzNjNHlSOFBoVnNRTzNScTcz?=
 =?utf-8?B?bFZHcnpyY3ZrVEZ0SU9rNU84SGV3ZkJpVC92YXkycmRhUzA4MUxxbHAwTDVp?=
 =?utf-8?B?cVY3SVd1ak1TdFVPcHhwK3ovT1QyTzZnMGFwTk5oeFEzUTUrTlRPVm9jN2hK?=
 =?utf-8?B?T3VBWHA5V2dac1ZDZ1Y2bms4N080OVRLc29GL0Nudm9MRUg1UGsvSXl2QTZ4?=
 =?utf-8?B?ZU9RVnVCU2YyMHl0bUtZTDhqRUhtdHBtSFllVGdXV2MxL2d2U0pKZHVCZlR4?=
 =?utf-8?B?NEZtb0FNTXU2T3ZMdW5PWmJwS3U3bjgxMGt3Wm5kbUdrQXIrejFJemtwaEtu?=
 =?utf-8?B?ODRqRGpYdEVLQk5RTVlJSERSOWVOY09sTXNNN05ib3Q1TjNPcTduZExLemQ0?=
 =?utf-8?B?M2VLK0ZPeUVuWUw5WitoMjI4VUdKS1NTOGtsbDhpMUx3a0FoU0FZNzFKSEho?=
 =?utf-8?B?VFVPMHhIL0VlWW1FMWpTTlR5ei9tamFBTXJvMFJYeXlHZlZRKzhzRzM2djlj?=
 =?utf-8?B?UEdDUVpoY3FCNURlR3VzYnZ0RmM4b212R1V6cHlCNVMwNHJjQ1VjZDREZDFy?=
 =?utf-8?B?cHBCRExoWFRsUjJuYW5UbkNaYXVZL2RHYXlLYlVSNHVqSzVkTHdWWkpsU3RJ?=
 =?utf-8?B?ODlEd0hsdklRMVBsam9FemY1YTNLd3hnQkZwVW9OMkYrL01vNTZRNlZ3WHF1?=
 =?utf-8?B?Y1pQbmQ2ZXJNUzJrUzJMYUxLTlo4aURTZlJlYjVNb0VwK3RlQTB4VUZKSnNv?=
 =?utf-8?B?VFB1ZXZCVVVXRHN2ZHd6N08rZ3JLRTYzRmZwdEN5ZDZBTytJM1VIR1ZQTUtL?=
 =?utf-8?B?UVBHWHhQR1kyMmNZdE5rSnB6UDBzTnYzaXJXalNuMlhyWnhhY1kydERQNTRW?=
 =?utf-8?B?YWk3YjJLNFVTU1FaNDFuZUk0bGNYT2k1Lys5ZUcxRFVPSzVNbGFva0I4QjJO?=
 =?utf-8?B?TXFhVkh0Sy84VndjRjUxSHQyV3VoK29aTmpLS1NPTVF2UHVrT3ZkY1d0ellv?=
 =?utf-8?B?a1M4bE0vR1c3WmlvTDRmd1VlZnNuVjA1eVdLUGJNZmJYa3h4ayt4U3lJdUlJ?=
 =?utf-8?B?Y1R4eVQ0eTlFaG5pSlRrYkhoblFURTZ0Z0FGSnp3OHRXRStTUzJ2ajhoTTlG?=
 =?utf-8?B?OTZzTmRTY0NCWDc4U3VrSHpFVk9IaGNrSGttd002OUEyOVZIZnA2ODI4RGg3?=
 =?utf-8?B?VGc2NW9GVFprMG5FMWVlTEd0SWhxeEs3Tzc4bGY4QlpKNnNTMEtFSStGdWpx?=
 =?utf-8?B?Ky9OUXR0UXBDMVFldXlHWVNMYllIcmlRcWJIVlNGSXAzT0FyK2trR1ova1l0?=
 =?utf-8?B?NllHMWprTERBNnJtZ1pGMjlENmlPYkVvUmRFNXo0MW9NZ3NQMFRmQlZ0MG9Z?=
 =?utf-8?B?NklQeXVzR25Mc2sxS2NUYXJFRERHUGY2b3FjSXBFZ0YyVlkzMUZMQXMzMUNS?=
 =?utf-8?B?SzNta1V2aWI1dVFSRGQxQ2hpRTBuQ2IrdnR1bml0L3A5S2FXc0Q4QllkQ2V3?=
 =?utf-8?B?OWxQWVg1bjg3UUIrSk9Va1pxcTR0VmliZG9MVXlENm0vdnVwRFI2U0QwVHpE?=
 =?utf-8?B?QnV4QlFoRW1CUFEyS1daRS96b1hsa2dKc3FFbFlVZ21Halc2RUI0US9oZGlO?=
 =?utf-8?B?cnB2clBNa1hyRVpHZy9Za0JkdEhKdEVaR0l6Mjg5M0FPbDhxcldnVEpBYXpy?=
 =?utf-8?B?YjBEN2RwVG15WTRlNlY3cjRta1BzUkk5TU5zTnBwWkZDTzRuZmRNeUNXVnpV?=
 =?utf-8?B?a3lwdW1ZZVRsRFlMMlpqaUIrMXpveVBpWkk5TVhJUDdFUmFNbnVnZkU2VEhW?=
 =?utf-8?B?T01acFJzMnFjTGFMNmxKOTNmZ2paM0UydkMyRitRYlJkdTIyaWZudmlzbEF6?=
 =?utf-8?B?STRwTEJLQWxRajQvSlliUGRPMzYweHhLNzZRZTRiWEx3dzQ4MGh1RGg2eW4r?=
 =?utf-8?B?dXRtUFowVEpJNFJUZDY3Tng5dUQ4bk9KVkRUMHR4dGpHazhXZmlxTGZwVlZw?=
 =?utf-8?Q?Z0mNc7VvOaFQJLg6cCES64+jZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d6cd3c6-43f7-4747-4a07-08dbaf86c2df
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10072.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 09:42:33.5547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Agle2d8+iuE+qxOkaRe30hWsCG7Hl1HeOp3JfTaP2/KSa93Ij4pcLLzxfJuf04PYll+k+3bsleTNWEIIB60hrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7383
X-Mailman-Approved-At: Fri, 08 Sep 2023 06:56:24 +0000
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
Cc: devicetree@vger.kernel.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/7/23 01:29, David Lechner wrote:
> On 9/6/23 11:22 AM, Stefan x Nilsson wrote:
>> Add a new driver for the Sitronix st7735s display controller
>> together with a 0.96" 80x160 color TFT display by Winstar.
>>
>> The driver is very similar to the st7735r driver, but uses a
>> different pipe_enable sequence and also allows for an
>> optional regulator to be specified using devicetree.
>>
> 
> Can this panel be used with the generic "panel-mipi-dbi-spi" driver?
> 
> more info: https://github.com/notro/panel-mipi-dbi/wiki
> 

That looks like an excellent suggestion David!

Looks like a very convenient driver. It was not available on my 5.4 
vendor kernel for my hardware so I missed it completely. Will try to 
backport that driver to my 5.4 kernel instead.

So lets drop these patches. Thanks for your input.

Best Regards
Stefan x Nilsson
