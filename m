Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 739E44B6774
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 10:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9689710E427;
	Tue, 15 Feb 2022 09:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EA110E42A;
 Tue, 15 Feb 2022 09:22:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OH+zojnui0ZOoJwnDX4JqE1Q5SWPwXmPJFhxxVVIVui/ZL033+O21CSwSqCPWdZDaEjjcuLLoafHw9eAd6qTh3SmAq9h5GWuT14VgC78gE2+ZeUETLMrcoc774A8l8bOw5D4KLI6vJGr92BLOaFlvhnkK0ajVB+0vciPbI88uU+gV9oTFPX76HFuRiVomR/94aQKzfsUiGToQmgjLXSAYFJaAHazcWRefKAFbVf0m5SrApDgNSOmgeeAFfjGK/85F2uMubCCvseJHmoCwRKfOmMYWwe7EC9RqM+tz5KkEZ6U90hQ5t7FsOaO5yiW8q50eMJEhdQxJxq/670yZ2QTTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n91EHGu7logRHc/EPPDK5nUgQyFIL9y74UDoMal00XU=;
 b=ewwStsFr2Hc7iskxjkFpAp/qOEr8RUr/34gAKIfHjkcyv25jfEH9P106RHhNUpiS5au8SYNf4UFZyoEJUlIxSD2ct+e+bboLPLNranx5qsYQoWh6sWmI+RPEeZhkhH5ILJveu9nLo4GpAcLak2BLjm3l8CY4LjWCqUvVzXFDjVhg49c7HCPJMSpAlrFNkQH3TxvOSEowTo7IBndvg+wpdS5mOekeH7xsJucRJBDOIj3W0kV7ErygkGCwOAEPZi3QcMaowHkpKRwYogsWJvPt3Td5VtwelkQEFA4smgCeCBdz1yMoKZUnOD5KXJGxQ3EdPrsUIUbE8hO9Vj83UgQH5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n91EHGu7logRHc/EPPDK5nUgQyFIL9y74UDoMal00XU=;
 b=ryHXgIHv3OuS3N1Xl3izQ+nLkmj771Y8qt/nMQHeocKip/2Ul1AaQWvfKoe7AyeXw9hVY/HAMKFywAmC1h4aod/o+AyjIo4mh36pwObIH0yy/FWa8GNyL2jb441EqG52DcHjR69Fyt1C7xSNI5M0cVEULJZdcags+82HY5fy6yI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BYAPR12MB3559.namprd12.prod.outlook.com (2603:10b6:a03:d9::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 15 Feb
 2022 09:22:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 09:22:01 +0000
Message-ID: <d4087e25-5cd0-71fe-f9b7-a7dc03b813cf@amd.com>
Date: Tue, 15 Feb 2022 10:21:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdkfd: Replace zero-length array with flexible-array
 member
Content-Language: en-US
To: cgel.zte@gmail.com, Felix.Kuehling@amd.com
References: <20220215091142.1775600-1-deng.changcheng@zte.com.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220215091142.1775600-1-deng.changcheng@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P191CA0092.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::33) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dac79886-2221-4d77-cbc8-08d9f0649f0b
X-MS-TrafficTypeDiagnostic: BYAPR12MB3559:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB35596738B6FAB6C4BEB2611983349@BYAPR12MB3559.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R+Yu/eqsrheZGxcIuIluDAQrq2W4bID6Qa7/56EWsO5x+4zPSSyp5afhJ4p1fTglu5sIw486DPbWarSDHT+wm76lsmqAr6SJQomTEUY9MEm7l6XkhKLtT8Th6zAqeEadunOJfWQZkaqFpZOHPRgX0+Zve53CC2aNX00i89zGJyNcS+FAONr5OSDd0EAlYVSEJozz1x87Fa+egxBGmnSapYjLbtvo7FVaat9oi/G/iLjbCW4ysUFcszxpDpyGoAUv6C4UQuqSMrLkM+uMreilvV7UyaShCdhfAxMGB9A4dk2lYEyFSSD/E9WJFsw08RdHgmaty8U/PTJSa+jH/eMVYPCSl3+TswD1p/XAY1PNtlDTD6fNFy6eZLFu7enhk20urESPaYsr5tGkkcObVcTfBlCVlT+y3aRaBO8xwHzyqWuN4APY69nbyO/moU+5gWXIbKcEOBUAYq+Tehxq2RWVtYChe9+BvRiR7yJmlR5gt/N8q+rMEvpHSFYWJ2zul8oQv9gtX1MorGdJ3spsyjBzzjtHFIuNxq6hur+jMOc67TL1OJsKKbR6+jmPjpZ/dnU7A0qF7VV1nBqKgy6VbGwS5X05vdOhdAdE8rAGMnNMIwUjexIaO5ZZLReddYWXubtkQkbXi4I7Vydyq4HhQry7AQefyRdvkQ7n3cavg0ZT5ca4rvYRc48Am8GlnRHN/XON/955w0Ser+m0tVv2fXKGEYVskI8yaZDJTAO27REpo+Xdmyp7enzcvggwnpG9P7/hUJqZi5y2JulPmHbMLbPlLb5wZ+GP+fZ4f2Dht4xEa0/ByoU/LYyvWzfe+Y9YTFDoclcKr4tIrDRU64CS0g/iFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(6506007)(54906003)(66946007)(31686004)(8936002)(6636002)(83380400001)(4326008)(66476007)(5660300002)(66556008)(31696002)(316002)(6666004)(8676002)(966005)(2906002)(36756003)(2616005)(186003)(38100700002)(508600001)(6486002)(66574015)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0VhM1FVc3dLU1NrSnlUMkVMdm5leGJGb3RJcXpUWGJWakJZeDE4TlpYcTlR?=
 =?utf-8?B?ME5PZzEzakN5VFZkb0hBUmRTbEl5eFZRb1c3UHF5VnFYWWkyK0NXcWtqbnNa?=
 =?utf-8?B?MHJMb2xFSG5YUzBuU2V1UUcvN0ZVdndVNmU1WTdnc1FMTWVWNXB2c3YxTWNS?=
 =?utf-8?B?dEd0YXRsMnZpb2tOTUdodlNxK3c1N1Y4UWVaVzlmNDVCSVZJcTQvV0h5elBV?=
 =?utf-8?B?MkJ6bnhPUzNiQnNJT3ZrSDY5ajRBRThEVkJidlVXSnREQUthOUxwWkZpbG9P?=
 =?utf-8?B?eUlJMW9aaW4yRUpYd05oeWhrMEFRcFJHSndaaWxPeDZHZDhpVWt0SE1jcG10?=
 =?utf-8?B?RUhOYmNhVExPeVprMSs4eHZRTXJmbHhNZ0ZKeGZOdEsxMDVobEdWeUc3aU53?=
 =?utf-8?B?cXJtM2lENE5MNjJuOHlqUTJpcm9mSGZ1YldTOHhSYjhSQXdWVWFkMVdBa2Ju?=
 =?utf-8?B?UVFyQTc4UmJpcnlwYXdCNkg5cDY4L3Y0azZnNUNSMWFPRDMzclVtdm55Uzg1?=
 =?utf-8?B?bGFsRFhJcy9rV0lUQldqbTFIc3ZBdVkxSDFWdDhQbzNtZ3NJQndIN0FHRlNx?=
 =?utf-8?B?T0pDa2lRbGxDQWhuNkZVakNtMkp6L21SdS9TRGtLOWlFV3FPNTlDa0R3N3ZH?=
 =?utf-8?B?ZDgzTE1mSWdxbmtYaEo2UC9rL2JBMUN2YUl4SUM5NnI4aTg3cE5DL1poSU9r?=
 =?utf-8?B?Ym5EMlVmR3RoQWE5TFdkdXg1Z2o4eEU5dk5VaDMycVgyaC9qYzJrdGhqVDhw?=
 =?utf-8?B?UzJjYXF6RW82N2VGclVCZVBnUXRBaUxNMVljZlV6V0thbEZ6b1V2K3k1YTVP?=
 =?utf-8?B?SUU1WlVHRzlmRWlneXFWL0dHNFRpRDU0VXVZRnJiSEdydm96cHRDUUNmNnFF?=
 =?utf-8?B?RWltdW5mWmtyUkkvYi92QlNDMFQ0NU1IY2p5ZEFoRjdCV2tGUFlpSW5ZbGpW?=
 =?utf-8?B?Mkw1eGVMSFE2NkkzS1FvbGZYUGxWMklBeVc2eGdoeEs0d05BUFN4WGJ5R0kz?=
 =?utf-8?B?QTdiaW8wM0wrNkkwdzdaQ2FBYk44dVUzekxMTmNtWlpieVZRSGp4UFdqeUht?=
 =?utf-8?B?bkJ5VDA0NDQ1VGozRkhyb1dRdWIxb3IzdDZTbHlHRnNmQ2VKdWo3ZjJhRDVl?=
 =?utf-8?B?S0pkbk83MStrbncvWEJzbDd5WGE1dDU1MXFHa05YK1g1akplWGMxTnFHNTFR?=
 =?utf-8?B?eENpUWZ2MU1NQXhjRGFXeGNYRGxpd2NObjFoblpLQmRqaWozSko1dEJObmZP?=
 =?utf-8?B?OXNlTm0rWWMzVmRZTTBTR0VIWGZjLy9naHUvY0RHTDZ0cDM3RlNDUkUwUDBM?=
 =?utf-8?B?VjdqeWp2UW9wVmNwWEE4RmkwMjVyZjcyVXFoSzRNVUplNzNwK1NLV3hpZjV5?=
 =?utf-8?B?REp5RkJ0VXNFSmlMV3J1UUJBYjRrQVhOM2RNalM5NlZhM0ZIVG5QR0I1TVFX?=
 =?utf-8?B?cHh1aWZDVk9Tb1BlK2RaMS8rTTZveWNQL3A3ZlJhSVAvU2FQSlJ4bERNdmhK?=
 =?utf-8?B?b1Z1MVFUT1pjaUYxMGhSL085d1dXdmJUUWQ4NG5TU2RGUWhKYkpQOEJXNTdo?=
 =?utf-8?B?dExDZHo4OUJDcnpVSHg5MHR4NlBETTBFMHJ3SFBoZkEvWXVYaHUzZGt4NTJk?=
 =?utf-8?B?NXRoRkJma3F1WmhIamZWMTlveGpwVUg5SXZQOHF1eXBIYmtzVFFWWjBWU1Fj?=
 =?utf-8?B?cjZJSjlFa0lidDFTMmxBYVJIeVhYbzhWMlRzUTBGdXZuM1NHNUVvSSt6cSt4?=
 =?utf-8?B?aTZsZ1F6N1FjOC9aTkV5eHdKUFlEcDFJdTJ3a2RFQUF6N3FjNjYrQ1JYaWVY?=
 =?utf-8?B?QURIcmdKaVA1MjFhZEJBMWwvN0pTUTcvU25FMHFEY0JoUTZCR1I2ZEJReW9i?=
 =?utf-8?B?enhnV3o1WE1jZGttdlhmczBjRUNEZWdLREZCQnpXMW85Y3RpN0lBS1BOMUIy?=
 =?utf-8?B?eVovTlE1ZTVSY1YwcXlyeFg4VWFOcFppK2lUQmlRZ0N1S3B2WU9GZUxDYmFn?=
 =?utf-8?B?Qkt5SEVrZnRFYXd6TVhXemdxWWNIbVY3TXFQajFPUlNoRHBOSnFkWjJ5Umlt?=
 =?utf-8?B?OVVlRjY1andlcjE1dHZ4N1BJelJ0S3ZvY2tkMXhIWG1DMGlNU3FISjQzWFNJ?=
 =?utf-8?B?Q29BaXlhUGlMTDRWZVJxWVk1L25zbGtuMlRSNU15WDJTekxTRnlyaXJ1alln?=
 =?utf-8?Q?ooHIv7ZO/g6wQ0RvUm/SvJg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dac79886-2221-4d77-cbc8-08d9f0649f0b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 09:22:00.7569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0Mkc2uvo4n/+EMxOEjtJGx2jLDzyJqOKJyYLqtzX00+TkeMGuBowBM20SwaKqL4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3559
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
Cc: airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 15.02.22 um 10:11 schrieb cgel.zte@gmail.com:
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
>
> There is a regular need in the kernel to provide a way to declare having
> a dynamically sized set of trailing elements in a structure. Kernel code
> should always use "flexible array members" for these cases. The older
> style of one-element or zero-length arrays should no longer be used.
> Reference:
> https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays

I think you should harden the wording here into "must" no longer be used.

We had so many problems with that and certain gcc versions that we 
should have this automatically checked somehow.

>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index e54a52785690..7d39191d13f6 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -1084,7 +1084,7 @@ struct kfd_criu_svm_range_priv_data {
>   	uint64_t start_addr;
>   	uint64_t size;
>   	/* Variable length array of attributes */
> -	struct kfd_ioctl_svm_attribute attrs[0];
> +	struct kfd_ioctl_svm_attribute attrs[];
>   };
>   
>   struct kfd_criu_queue_priv_data {

