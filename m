Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 624AA4B7B84
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 01:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F0310E1AA;
	Wed, 16 Feb 2022 00:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2066.outbound.protection.outlook.com [40.107.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FEFC10E1AA;
 Wed, 16 Feb 2022 00:01:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKDw5TTYgRm6kBtqRYNt6YA24qwKtLJBgS/5SHF8/M7L2OErYkuA+aRic0LNpIVPjZkIm/obfOYIl/uT7qZT8WHn12gGbsl0oRnME4SvI6Xals6CHEJT68c+Mhy/tOIy6M4z39eks7e3TzT2egnA2rJLuaoRXgInxc/SR/UQgBiuhisGBAu+ODCIHghD4wgsZ6UKMIiO1ZaG7nBcRoUfdNuN5qTGGaIss4pJ/S3mnFDU/ouvibU6L4hO5JReUExlVO1g05d2PfzLDSvUpnBo1Nt3ROqRQVl2aUNSiNVUwvwwp1ZOFSeepae/GfB/WktHw1tkgJC1kkfOFcXxwKSVBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xso4DQSts2/a3yTQH0Fmx3DpwyUfGI15scJDOx6fHz0=;
 b=HedLC0QHQuV2fDsRTEAcrb3UvwZ6L0jVlagJxYqv8dEmqgx/j+OELcxtIZfpEd+waLwoavuPzIRH0xy/1WgHFq6s/RSAUfbWYaU4N1IcSVdM0tcv8rSO4OlgGcVP3/2FMGVUleotVN2+iYeLX0jubD/K/Am9SEfREXcFkz8AdCrnxhXoYHZAdFDSYwLZdt2FF0O9CbJTmPySSq/OcrOeh8C60ClsP0O0mRPeLqLBgm1dnJq916B0lo0MjHQhNO6uC3Jc6Z0jnbboFACLPqxTNkndDDfXv0lU4A3tdwjzTxuh1iiSbVkOWM0p8SbuXf3i2nyDd9ta+4oPHX8q9bQMhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xso4DQSts2/a3yTQH0Fmx3DpwyUfGI15scJDOx6fHz0=;
 b=0/u+OAmlO53QCiRqiVC5T81aOnPIq5fwsAlhpr3i4YMZ0AqFgcTGv0U8hI3N7rQeIpt98eQnrwDZqt+yGGZAuCEJEZ7Iz6QG7WlucY8RJwWs/Mi0R5Gj7oMupWYlzNOjmK8+TR6jAk2YfYeqsXEIXsmyaIOkm4cIFAVIozHX2TE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM6PR12MB4138.namprd12.prod.outlook.com (2603:10b6:5:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Wed, 16 Feb
 2022 00:01:19 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa%4]) with mapi id 15.20.4975.019; Wed, 16 Feb 2022
 00:01:18 +0000
Message-ID: <35be6c0b-e6a8-d0f1-1870-6a77a18556c7@amd.com>
Date: Tue, 15 Feb 2022 19:01:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdkfd: Replace zero-length array with flexible-array
 member
Content-Language: en-US
To: cgel.zte@gmail.com
References: <20220215091142.1775600-1-deng.changcheng@zte.com.cn>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20220215091142.1775600-1-deng.changcheng@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR12CA0017.namprd12.prod.outlook.com
 (2603:10b6:610:57::27) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa516f59-8256-475c-f585-08d9f0df74c4
X-MS-TrafficTypeDiagnostic: DM6PR12MB4138:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4138426680C882723EF3E87192359@DM6PR12MB4138.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2L/E/e4r5yVUkYLEVtMhOF3cMP47EU+GGpKchtu2wPuiSgwuYHE2n7COBMPQN1wHHR8+6qUeZakL9/yK/3BCViAvc+IDgvZopc8vzovQUYBBM4pCo3aS7a372xU9mAGDs7cOAd5NW3bSxJ9tl/vyod3Pnxop/ojMI/13RoegumCfN/965AbUfHxKnZu1Uy3kdhXQ+LWP5NBoFpUCG3q2BPH2u7Y8wKeALQ0GrDhy8a122I5GnPjRn7tWmRsgATSkPX/Or9HikxZsm/O+/q69nGcd1u2EdEYW90zSL/umkl0Nv+txJhjTxR73KUWRBdRnczw/YRiPTIxClvIKF4ep6NR0v2EuiWfyRshd3framPx2iFcw6+1wQFYQfZxfZSih6/aOv7pOqcj7ZXUm7TuZFgngNo+Hkiipx31MyCMvN2C2xU5qTCS/hyUz+683QyfHYw0ZgW3VNzegoebqWLi7WFCyaFQy31rYV33UuloEbcrCWsYJ/vYDnxOFR5LTvBhQA9Yvv4Zfs1mBpCCIUjG4Fl6jzJodcfoq3y4f7OTO/BnUvuIABCW/2RtJK4n9JrbKo8za/HckQmeN9qBIE91++ambEZ1O71+DFd2Qo22Ffv+GDwwcXibfIstDzE6PKbzY73TMoyrzWNiFTVt8xXK0SGREu5eWVkP2orGn1ZCY5hCPfO9YgDfBkPIpd+ZN8oJce77jnkwg71OBhOWvcDL0JrUhmp02NuAP6UK3eRFxKPOfQ+nv7F7ko4yBtCHK+93bWlahDlrG2hJDZ5e1+l8kein7+XKxWoNZU/5AVKu3ie4D2zAkJjh3Io9Hhu6VcMb3SxrHs10JoAyTR6887TWk0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(5660300002)(2616005)(26005)(2906002)(44832011)(31696002)(186003)(38100700002)(36916002)(66556008)(53546011)(4326008)(8676002)(66476007)(66946007)(8936002)(508600001)(316002)(6916009)(54906003)(6506007)(6512007)(83380400001)(966005)(6486002)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NERqVVlhM2tiZ1Z5UVBpb0x1QVZyb214bGVobmhaWUVkSDZQMUMwQkVrVDBC?=
 =?utf-8?B?MnJTTzZSbU9LYkNCZ0ZIUjVFdFcra0h6LzRkM0pKaFdnRkN3OXlMcXUyMkdB?=
 =?utf-8?B?T21ZRDJBRzErVUhLMEJRMlYrMzJOZ0JuWk81MFBMTVBZMFhlVHZlTk1yL0NW?=
 =?utf-8?B?REw4dDdrUFBFbFVDQ0F0M2FSL0hJYVhEczVIUjRKc2g4bk5UOUFOSU1Fdkla?=
 =?utf-8?B?Nmdjc1hjaFdnWWxiT2tIdXUvM2xCZ1M5MEN5dHRIUk4zMHB6WEpnYnpOTzUz?=
 =?utf-8?B?cnZ1NTJ3RXEzTWhoQWpaOHk3QytNZmNvK2VGNVNDRjdMeXJOOTk0djdvVGVj?=
 =?utf-8?B?V0Zsbm5KZHU3WkM3U0NpV3p0QlozZ3JRTkxyaFFLMnpwdFlvNjgvSzZ4c3dW?=
 =?utf-8?B?Y25wUkFINXE1aUxuZDcwRjJsa0dzTC9sdkdnUEJxRzZUcWNDRzVrcEJUZE8w?=
 =?utf-8?B?elM2cVBxbkZBOWdZZ3AwOHd1V0RIVEVSeDV1eEJMVXVGRVljYUdlOVo0d1Bx?=
 =?utf-8?B?b29oUENUd3Q5bXdNUDVoYk9IOEluTm1nRXFSbVFYZ3JQRWVoTzZUdWo3S2I1?=
 =?utf-8?B?N1B1ODBsNEt2WHFKTWZPRHlzVDhaMVUza2dpMEhaNFA2QVBERnhucFdrNTNw?=
 =?utf-8?B?RGx0eFBCNFAwOGtoWWRLRDNQWXN4eEZzOURMb00xK1FEYVZPbTRrRXFLWGJx?=
 =?utf-8?B?MXU0MmUwajlPalZ2WXNoak10SmpHcmtRWk9Kak5ST2ZnY1FnUzhaVy9Hakd2?=
 =?utf-8?B?MXFqaUU0RVIwT3dLa0ZKV3N3SmF5NDgyRVRDVVRScDlobmdneFV2OS9GdWZK?=
 =?utf-8?B?TW5scCsyMjVzZXdubWFhajUydEhlRm5Qd2Y2Y01SV25vU1prazdUTnZrS1o1?=
 =?utf-8?B?NkRFaVVCaVVBVGpDODdZRytVRDhyYlNUdFJiVEN6aXkrbHBMZzFvN0pJdmlK?=
 =?utf-8?B?alFFdWNyalFmeWRKUk43WisybERXb0hLdjdCYUpoNkIyMUN1V3E1RFVLSU1q?=
 =?utf-8?B?OUZQNStmR2NYcXd1M0JGRU1Ob1VWd0Q4ek90a1cyNEpMVWtoRmxObjhFOHZm?=
 =?utf-8?B?Mm1PTnNRTm01N2NuNHVQRmNZNDAxSUp3R3c5NTZGdS9IWFljQzdaSmxMRjBr?=
 =?utf-8?B?TG85MXhwanJUZTIxOVVWQytJeTJabzFLandhSUt3TjlaaTJKRDFMUUhGeEVI?=
 =?utf-8?B?Q1BlZSs2MFRqQndVRm4wTHgrYWl4d3Nwd1hXZXlSckJMMHBlSWlQZzBXYk1i?=
 =?utf-8?B?d3BqYm9LOW9qdVp5bDV6YnVyQ0RwaGRCQmhHYWhQUTJVcDRkMU5pNGR2K0pN?=
 =?utf-8?B?VktqRWtHNGFmakUyTVdvME43U0pBaTRueEdjYXNMQ0ZoR3JhZkNRenBYNkls?=
 =?utf-8?B?N0M5bnFxRHA1N3dsTUY4aEROU2RyREZwc0dlak1odUsrL2VEb1RSRzFmZ0FS?=
 =?utf-8?B?QWVlUmlzUTFVOU9UbnlJU3Q4N1R3SWpVLzR1MUIwN2lCdFF6WXVvalM4ektJ?=
 =?utf-8?B?cUJrUXVSK3h1MWZ3Z2orRnV2Wmw3UU03VmE0emplajBqSWdBbGNtMTBhdk44?=
 =?utf-8?B?QkpnNXEwQ3FrYXJ2Y0Y5SGVyeThrWGdRRW42OFhxRlRxMnBUSnNGSmVKbWxX?=
 =?utf-8?B?WTg0M0ZUc0ZqVkM5QnNOaS8weXVRa3RHNjdmOFZ3ckZyc2dYZTRIR3JCbFN2?=
 =?utf-8?B?V1hqVlhwWU9IVVczeC8vTFN3MEgzMlcreVgwMDhLWkxTa3dQcVYwMi9ZSzZH?=
 =?utf-8?B?UDBvWG4xcTJqeXlmRUVnalNlbXU5czVIaC92RU1jcjEzelZHcXQxQW1td3h4?=
 =?utf-8?B?bW9jV01TUGxvOU9VclJtalVJYTI3REtka1RHNXZ3MW44V1U1dndaZHVDNjYy?=
 =?utf-8?B?UHJ6M01XQVY1R1A1UEtUTG9xQzJHRUpXa2JCc1l0Qk1RUXVvckVTeUlRRnFK?=
 =?utf-8?B?bFVqeFd3akpKamh3ei8vRjZWS0pkUjJlclRZZGNSTWI0aGZhalRoWFgwYUNJ?=
 =?utf-8?B?a1VzL3hqekwrYTdwQnN5enJLMGhZS0JwOXUwcFlFSkcwTmhQbzQxWGV2a201?=
 =?utf-8?B?bmpUSCt2Q251bXF3R044N2h6dXVBWlNocTVDeFd0ZmZxRVlmVXVRSVdJR2I3?=
 =?utf-8?B?dVpFOVNEbkZEQmRNbzF0dE9IRDJYOFVsUUMxRFF1c3ZjYXRIZ3NGQVp6OVM0?=
 =?utf-8?Q?u/ms4ODY4ktKls8dAZv691M=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa516f59-8256-475c-f585-08d9f0df74c4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 00:01:18.8178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ksYuX0+/KYaPDvLjM14h3iZ1MIHvHxpWeUfXuBhhMX11raMn+gvb4CDTFiJVQlAt//Q0TeLfRLusAMHR8GvKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4138
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
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-02-15 04:11, cgel.zte@gmail.com wrote:
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
>
> There is a regular need in the kernel to provide a way to declare having
> a dynamically sized set of trailing elements in a structure. Kernel code
> should always use "flexible array members" for these cases. The older
> style of one-element or zero-length arrays should no longer be used.
> Reference:
> https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>

Makes sense. I'm applying this patch to amd-staging-drm-next.

I also found a similar issue in include/uapi/linux/kfd_ioctl.h. I'll 
send another patch to fix that as well.

Regards,
   Felix


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
