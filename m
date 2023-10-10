Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2D37C0192
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 18:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C6C10E3A6;
	Tue, 10 Oct 2023 16:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::616])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31F510E32C;
 Tue, 10 Oct 2023 16:26:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+CVXJXUvtjaHcW32gQ8gTLoBYnjHdoiKSTD3BiWYIpTrRt1gdpoIUuH/tz/rhWRw4y/rxgCZ7lViHpHTMaTXjhqWelwbTlB1NSwYI5dJLags1Bb1SjXEqt9vxwp0PpNOomC+kCaKI/G3qPgUWA8qf1aXGabz5+FRla+/qCTJ8ke1mbZ4OCjrGKujCWZ7Sl7eOLZVcK5aLPdu342Tc6Rp3ZtYjDzhsF0cZZ2h3pIpTX2EZeLnSmqp+j5OhkAnsSSL8a0bnJZweMuI2M6CLETRFKZaD9ReW8Mgj9X+WVPn2iEP1WseDGceFlO2ttORAdvIUa4ZNx1vqzYim8AkOs56Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+Fk2JaJo/EXHxhWzZWfZUUAY3zheNUk2u1kLF+/F4k=;
 b=gNlJEGLiUYRWs0L/Dw2dBWs+JSCQdG0mm9p3qnCVmZfXF//37KLcaXCccJ8UnRdG+qO4dPvzILrDmiQ8OOgLhXbPEWYZjuHQ1q3keNLWsI1R0vA0bj+ES7rC667MM5Yg6r8AviQgb5/tohda3OnymHLiETBveuFFZYhZpvcxNdKMyKSEedP2z5gKPvegi9a6dQiyPNDKXr5AVYMeA996Ud0BjEVfxLi9rJKxHgrXhkBxW2ZAs3Xjs2xbxXtM8qEpfr0UG6gRFPPIg0+Os7rUFt9xjaANshnqk1A2EnrpNy2bZ356q5WTxzHMPYPE4xIiKLkUt4CZd/dT5dJrImtAkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+Fk2JaJo/EXHxhWzZWfZUUAY3zheNUk2u1kLF+/F4k=;
 b=elmA2y35OGN+pl+Njr/plTRC+37+xt2F/c0N92iqd497Z+xTEVJMo+cq8vJR7BPQtG1RlqL0LVWBKubncdGMIMQO1E51Cx2zZCM+lC9703JwxKibNlvBF4KfvOY0PzHHtPihU8RI6PfqmZLjlupB8wsZbyqaeTz8bPpe15ZCIFc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB7425.namprd12.prod.outlook.com (2603:10b6:510:200::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Tue, 10 Oct
 2023 16:26:18 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4%3]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 16:26:18 +0000
Message-ID: <db29fe6f-1ac1-4e8f-9f77-f3569c503a76@amd.com>
Date: Tue, 10 Oct 2023 11:26:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/16] platform/x86/amd/pmf: Add support for PMF Policy
 Binary
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
 basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
 <20231010125917.138225-5-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231010125917.138225-5-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0159.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::7) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: eaad2593-b4e1-4ad2-66fb-08dbc9ada165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G5Z4Y8GthOXVJD6vDmBYET+epMQ5L7vJ/d329+h87x9gxIdPN1STzMTKkSpiCDmQaa8viyB4FPpBuiMd3jUKC7mkQ9nNgIAYt7YjIm/DHgnm+7fIVJwyl/3DTMW9oU1Oo6PQfPPPW9VoMM49fwY+5CHVRLNIfBKrBk8PTUnFSUpIPsqPPbbkGGVbT4aB0w5GtkRudTqqDmB7N7xRQHiwUcKJNqthEZcovbgMzVbK8vKN7sZB1x/A+T+UGSZBZaXln6tzPKnQtrd6hWHHaNcc/kxRQM1HMPHhjUblOVp8noXVSHAQfliMDJnhoy3w3iZ5UNy096lQHdCcmc9DrjDhxlDHwUuTalHQHLcFTXZ3iPPEHaQEheYHQBLmU2zDC/xeRLSv+2yFSNVTTm8opFFD71a3NUl6+oxCjJppKbAH/gYXt2mnkFaWNmQZovlFJiHkvsqUFZ5LBvF+TOHFgKrL5t0RtodxtJBWsOnpzrugDSBxk1SUetZkUUZ47w5UAMpWRu0emC/BC9V7Xqav4Mw8x/yc/TI3miIEGeVWk7w/wn4ZKrT7pNSx8asbvua+PQxCB+j2YkXs9dmniRdeT4MWX/pabE3/zE81vJrFKtKjWP/9kTdLYvseWAINOY0Pu0Cf296u+8K3xyReVtbGm7JergY1PQOa5sEgzBsyAZ8QrTA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(366004)(39860400002)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(26005)(53546011)(2616005)(6506007)(83380400001)(8676002)(6666004)(6512007)(4326008)(30864003)(2906002)(7416002)(478600001)(66476007)(316002)(66946007)(66556008)(41300700001)(6486002)(44832011)(5660300002)(86362001)(38100700002)(8936002)(921005)(36756003)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHZmMTF5N3IzNk5jS0JkTlZMdWw3dGlPdFY0dVJSdUs5blNzVEtkTG85enh2?=
 =?utf-8?B?RnNJc3JHNGE2bHJuKzduSzE0emlHeElHejhwRkI3ajhOVVdyMU11SVkyYnJX?=
 =?utf-8?B?QlpDUzV1NmRDa1VpcHcxalpUTSs0cVJKZjN1eE1lK1lSd0ZoVm9mclRRSzdM?=
 =?utf-8?B?dFJBM3BSeGJDQ0VnT1BKNGhrakVWSVdkQXp6Z1VYeG01L0wyMkVKMlJjM1pR?=
 =?utf-8?B?QWFsTm5KL3ozaU9wMkp2emVrUGpkcC9TTnBZTjJReGgxeE03QzhNUzErYmtr?=
 =?utf-8?B?c2hEbUg3NlIxNEJFZXhvRkxmZlZwbHhEd21GT1FyS25hekdYRnFCQW10bFZJ?=
 =?utf-8?B?TExWVmUwZk5oR0dUQTAzeGc2QWNXUVVIeVljSHVjemtTRnpMajloNlF0VmRS?=
 =?utf-8?B?WXVCS3Fwb0k1eUlOalhwaTZPWHBOZnk2S2R4bmVheDVEMHhZcTZNNG9EcjBF?=
 =?utf-8?B?a1lUNDBkVlZXNVczUFRYUkJ4Sm9GOXIwdnBYYmF1KzJXbHBKVXBFb2NsUC9I?=
 =?utf-8?B?RHRZM1M5ZUZTU3ZjNjZadFd6Q1FWeTlnTlVDMGk5VXl3TFdmYjlDWStwMmZB?=
 =?utf-8?B?VVVMTG5xK3hhQmxwcXcyRnRoVkJ3dW00YjRsVW5SMDhCeFUwVllWYWVZWUZu?=
 =?utf-8?B?aVJ5QmJEUzV4dFhrMjEwOFJFajRBSFBGMERHMzM3WmowMUxUUWdKNXA4dkZS?=
 =?utf-8?B?R3laNldvUlNCZ0x3R0JrRFFSWFhlZGkzbW01dHRITHY5VXA1MWhKNzNJWTdT?=
 =?utf-8?B?dGw2NG9MTUladWFEbnhMTm9XQkE1RTg3L1kzWDdWZHJ0eFhUMnh5WXpmZFlE?=
 =?utf-8?B?NjJIa3QwRjRkU0RReUlzaUY5T3ltd2JUeE1uTmFVa0JBZFpHSUtwMDQzdzVO?=
 =?utf-8?B?a2tLMldlMkkzYjBrcFhKVUlBbUxNOThXUm1kWXJXeTN2Z1NLTnA5TUlrNnZJ?=
 =?utf-8?B?L2VuS05EMVBlcnQyazZocGUwNjhxb1Rjbnh0SFF5b2Yva3ZYN3ZjQ2N5dXBL?=
 =?utf-8?B?eEhEZTJ0czk2dTBxTGxoNzRpZWg3bTFGeWw0Z3EwemhVMWkzdDFvT3dUWUJ4?=
 =?utf-8?B?aVRBeTZLa205S0t6L09DeS9BTzNRNzRKRExXNlljUnY1eHlmWGNrYzQzSkRk?=
 =?utf-8?B?Nk5Gd2wzb3FHa2FsMDNiR291SklZYmplNVdFUVdyTTBLUTF2dk8wZHNxSDBS?=
 =?utf-8?B?OWZjV2U0WnEvWElNa24xNWdyNTVQbnBPMkNKZmRYV1R0QlJuWmlyM0FLc1Z5?=
 =?utf-8?B?bXJzenIydU5MNENWeTQxN3RJTTFsU3JBVG52R3JkVks5eHp3R3hjbzBpbnkv?=
 =?utf-8?B?aHVhcHhwN1hWT09Hekp2RWxTN3ZxZFNEbkFjZGVScVBwYzlGRXlPYXE2TnRZ?=
 =?utf-8?B?N1hNdlRXMjk2dm9wVFVlS3NUb0NIeDgwOTZ4N0ZsWHhBbnJUMlB2aiszVlBi?=
 =?utf-8?B?LzEyeTJvcHd4a3lPY0g3Y2lnMGJuY0pJdFp6TVZHL2lhWjFCRzFjR0cyT2ky?=
 =?utf-8?B?eFkwcDMzTE8yQmoyUnoxK2tSdCszWWlaS3BWd25mYmEzVHZFNWxEd2Q1bTZy?=
 =?utf-8?B?UUNNL3BvRDl6QUZuMVRvNzNSNVlGOXBySzdVK20xamhBVFVLSlpEblpVRHlx?=
 =?utf-8?B?Nys2ZHlKd3Y0N0wzOG9UWUpVLzJpVk9OaWNGS3NOa1RSc044OWFuVlMwakZC?=
 =?utf-8?B?bUpOTFBOdWUwdmxDSzZ6OXprMnJkR3ZhQlJTUG5RRTJSY1VLK0N3MXB5VkFE?=
 =?utf-8?B?bVdmbnJHTlFZQXViVEtvRlBaVDZuY2R3YWlicVoya01BQlhSSFB1NDVxdDhZ?=
 =?utf-8?B?YmZPdFJmU05jWU55VGJhMUNaak1JczZpVCtDY00ycFNLeWVvc0crdHh1V2dl?=
 =?utf-8?B?VzltVnlQZHUzR09yTEZZRTkydVliZ1dkaWdpSXdta2Nxd0RnTzJSTVFkdnNY?=
 =?utf-8?B?c3JsdmxpUk5Nb1UvaDQrcStSVWxmejhIL1VCNm1ibXNmWENqdUVKZjVIaFJj?=
 =?utf-8?B?N3R5aWQxS0lsbG00dDNVRWlRbE1PbXFtTHFYSnJxK2VjZWE3Q0lOOWJPYkU2?=
 =?utf-8?B?RzcyNC93KzRLVlRkUVBleGM1UXd0bm5vYXJhaTBJSkFpc0NYd1c5VmlUcURq?=
 =?utf-8?Q?X98PvNJSYZT5SGqijnOuNFbZ6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaad2593-b4e1-4ad2-66fb-08dbc9ada165
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 16:26:17.9363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVEduoj30vXF2uMHi66nMkDZUtKxxOzb+atIGFiU1gvMn4c0B+WTz1XInbAzYVwfMmK82F6Cr6Bq5+dBC1OV4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7425
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
Cc: dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Patil.Reddy@amd.com,
 platform-driver-x86@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/10/2023 07:59, Shyam Sundar S K wrote:
> PMF Policy binary is a encrypted and signed binary that will be part
> of the BIOS. PMF driver via the ACPI interface checks the existence
> of Smart PC bit. If the advertised bit is found, PMF driver walks
> the acpi namespace to find out the policy binary size and the address
> which has to be passed to the TA during the TA init sequence.
> 
> The policy binary is comprised of inputs (or the events) and outputs
> (or the actions). With the PMF ecosystem, OEMs generate the policy
> binary (or could be multiple binaries) that contains a supported set
> of inputs and outputs which could be specifically carved out for each
> usage segment (or for each user also) that could influence the system
> behavior either by enriching the user experience or/and boost/throttle
> power limits.
> 
> Once the TA init command succeeds, the PMF driver sends the changing
> events in the current environment to the TA for a constant sampling
> frequency time (the event here could be a lid close or open) and
> if the policy binary has corresponding action built within it, the
> TA sends the action for it in the subsequent enact command.
> 
> If the inputs sent to the TA has no output defined in the policy
> binary generated by OEMs, there will be no action to be performed
> by the PMF driver.
> 
> Example policies:
> 
> 1) if slider is performance ; set the SPL to 40W
> Here PMF driver registers with the platform profile interface and
> when the slider position is changed, PMF driver lets the TA know
> about this. TA sends back an action to update the Sustained
> Power Limit (SPL). PMF driver updates this limit via the PMFW mailbox.
> 
> 2) if user_away ; then lock the system
> Here PMF driver hooks to the AMD SFH driver to know the user presence
> and send the inputs to TA and if the condition is met, the TA sends
> the action of locking the system. PMF driver generates a uevent and
> based on the udev rule in the userland the system gets locked with
> systemctl.
> 
> The intent here is to provide the OEM's to make a policy to lock the
> system when the user is away ; but the userland can make a choice to
> ignore it.
> 
> and so on.
> 
> The OEMs will have an utility to create numerous such policies and
> the policies shall be reviewed by AMD before signing and encrypting
> them. Policies are shared between operating systems to have seemless user
> experience.
> 
> Since all this action has to happen via the "amdtee" driver, currently
> there is no caller for it in the kernel which can load the amdtee driver.
> Without amdtee driver loading onto the system the "tee" calls shall fail
> from the PMF driver. Hence an explicit "request_module" has been added
> to address this.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/Kconfig  |   2 +-
>   drivers/platform/x86/amd/pmf/acpi.c   |  37 +++++++
>   drivers/platform/x86/amd/pmf/core.c   |  13 +++
>   drivers/platform/x86/amd/pmf/pmf.h    | 136 ++++++++++++++++++++++++
>   drivers/platform/x86/amd/pmf/tee-if.c | 146 +++++++++++++++++++++++++-
>   5 files changed, 331 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index 32a029e8db80..f246252bddd8 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -9,7 +9,7 @@ config AMD_PMF
>   	depends on POWER_SUPPLY
>   	depends on AMD_NB
>   	select ACPI_PLATFORM_PROFILE
> -	depends on TEE
> +	depends on TEE && AMDTEE
>   	help
>   	  This driver provides support for the AMD Platform Management Framework.
>   	  The goal is to enhance end user experience by making AMD PCs smarter,
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 3fc5e4547d9f..d0512af2cd42 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -286,6 +286,43 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
>   	return 0;
>   }
>   
> +static acpi_status apmf_walk_resources(struct acpi_resource *res, void *data)
> +{
> +	struct amd_pmf_dev *dev = data;
> +
> +	switch (res->type) {
> +	case ACPI_RESOURCE_TYPE_ADDRESS64:
> +		dev->policy_addr = res->data.address64.address.minimum;
> +		dev->policy_sz = res->data.address64.address.address_length;
> +		break;
> +	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
> +		dev->policy_addr = res->data.fixed_memory32.address;
> +		dev->policy_sz = res->data.fixed_memory32.address_length;
> +		break;
> +	}
> +
> +	if (!dev->policy_addr || dev->policy_sz > POLICY_BUF_MAX_SZ || dev->policy_sz == 0) {
> +		pr_err("Incorrect Policy params, possibly a SBIOS bug\n");
> +		return AE_ERROR;
> +	}
> +
> +	return AE_OK;
> +}
> +
> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
> +{
> +	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> +	acpi_status status;
> +
> +	status = acpi_walk_resources(ahandle, METHOD_NAME__CRS, apmf_walk_resources, pmf_dev);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(pmf_dev->dev, "acpi_walk_resources failed\n");
> +		return status;

You're returning acpi_status here, but the return for the function is 
int.  It "happens to work" but I think it would be better to do 
something like:

dev_err(pmf_dev->dev, "acpi_walk_resources failed: %d\n, status);
return -EINVAL;

> +	}
> +
> +	return 0;
> +}
> +
>   void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>   {
>   	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index ffb78e9709d9..96a41e7d4e7d 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -395,6 +395,19 @@ static int amd_pmf_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	dev->dev = &pdev->dev;
> +	err = apmf_check_smart_pc(dev);
> +	if (!err) {

Rather than just failing to init smart PC solution builder, shouldn't 
you fail probe entirely if an err is set from probing the BIOS 
resources?  This seems fairly fatal.

For example I'd think that setting up static slider is relatively 
pointless on a system intending to use smart PC solution builder if 
smart PC solution builder isn't working.

> +		/*
> +		 * In order for Smart PC solution to work it has a hard dependency
> +		 * on the amdtee driver to be loaded first even before the PMF driver
> +		 * loads. PMF ASL has a _CRS method that advertises the existence
> +		 * of Smart PC bit. If this information is present, use this to
> +		 * explicitly probe the amdtee driver, so that "tee" plumbing is done
> +		 * before the PMF Smart PC init happens.
> +		 */
> +		if (request_module("amdtee"))
> +			pr_err("Failed to load amdtee. PMF Smart PC not enabled!\n");

Did that softdep thing Ilpo mentioned not work for modprobe?  Hopefully 
that generally works for everything except the insmod case so this code 
path is unlikely to be hit in the wild.

> +	}
>   
>   	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
>   	if (!rdev || !pci_match_id(pmf_pci_ids, rdev)) {
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index a91c22d9b532..51c0e17f7720 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -14,6 +14,11 @@
>   #include <linux/acpi.h>
>   #include <linux/platform_profile.h>
>   
> +#define POLICY_BUF_MAX_SZ		0x4b000
> +#define POLICY_SIGN_COOKIE		0x31535024
> +#define POLICY_COOKIE_OFFSET		0x10
> +#define POLICY_COOKIE_LEN		0x14
> +
>   /* APMF Functions */
>   #define APMF_FUNC_VERIFY_INTERFACE			0
>   #define APMF_FUNC_GET_SYS_PARAMS			1
> @@ -59,8 +64,21 @@
>   #define ARG_NONE 0
>   #define AVG_SAMPLE_SIZE 3
>   
> +/* Policy Actions */
> +#define PMF_POLICY_SPL						2
> +#define PMF_POLICY_SPPT						3
> +#define PMF_POLICY_FPPT						4
> +#define PMF_POLICY_SPPT_APU_ONLY				5
> +#define PMF_POLICY_STT_MIN					6
> +#define PMF_POLICY_STT_SKINTEMP_APU				7
> +#define PMF_POLICY_STT_SKINTEMP_HS2				8
> +
>   /* TA macros */
>   #define PMF_TA_IF_VERSION_MAJOR				1
> +#define TA_PMF_ACTION_MAX					32
> +#define TA_PMF_UNDO_MAX						8
> +#define TA_OUTPUT_RESERVED_MEM				906
> +#define MAX_OPERATION_PARAMS					4
>   
>   /* AMD PMF BIOS interfaces */
>   struct apmf_verify_interface {
> @@ -183,11 +201,16 @@ struct amd_pmf_dev {
>   	bool cnqf_supported;
>   	struct notifier_block pwr_src_notifier;
>   	/* Smart PC solution builder */
> +	unsigned char *policy_buf;
> +	u32 policy_sz;
>   	struct tee_context *tee_ctx;
>   	struct tee_shm *fw_shm_pool;
>   	u32 session_id;
>   	void *shbuf;
>   	struct delayed_work pb_work;
> +	struct pmf_action_table *prev_data;
> +	u64 policy_addr;
> +	void *policy_base;
>   	bool smart_pc_enabled;
>   };
>   
> @@ -399,17 +422,129 @@ struct apmf_dyn_slider_output {
>   	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
>   } __packed;
>   
> +/* Smart PC - TA internals */
> +enum ta_slider {
> +	TA_BEST_BATTERY,	/* Best Battery */
> +	TA_BETTER_BATTERY,	/* Better Battery */
> +	TA_BETTER_PERFORMANCE,	/* Better Performance */
> +	TA_BEST_PERFORMANCE,	/* Best Performance */
> +	TA_MAX,
> +};

The comments above at end of the line don't add any value.

> +
>   /* cmd ids for TA communication */
>   enum ta_pmf_command {
>   	TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
>   	TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES,
>   };
>   
> +enum ta_pmf_error_type {
> +	TA_PMF_TYPE_SUCCESS,
> +	TA_PMF_ERROR_TYPE_GENERIC,
> +	TA_PMF_ERROR_TYPE_CRYPTO,
> +	TA_PMF_ERROR_TYPE_CRYPTO_VALIDATE,
> +	TA_PMF_ERROR_TYPE_CRYPTO_VERIFY_OEM,
> +	TA_PMF_ERROR_TYPE_POLICY_BUILDER,
> +	TA_PMF_ERROR_TYPE_PB_CONVERT,
> +	TA_PMF_ERROR_TYPE_PB_SETUP,
> +	TA_PMF_ERROR_TYPE_PB_ENACT,
> +	TA_PMF_ERROR_TYPE_ASD_GET_DEVICE_INFO,
> +	TA_PMF_ERROR_TYPE_ASD_GET_DEVICE_PCIE_INFO,
> +	TA_PMF_ERROR_TYPE_SYS_DRV_FW_VALIDATION,
> +	TA_PMF_ERROR_TYPE_MAX,
> +};
> +
> +struct pmf_action_table {
> +	u32 spl;		/* in mW */
> +	u32 sppt;		/* in mW */
> +	u32 sppt_apuonly;	/* in mW */
> +	u32 fppt;		/* in mW */
> +	u32 stt_minlimit;	/* in mW */
> +	u32 stt_skintemp_apu;	/* in C */
> +	u32 stt_skintemp_hs2;	/* in C */
> +};
> +
> +/* Input conditions */
> +struct ta_pmf_condition_info {
> +	u32 power_source;
> +	u32 bat_percentage;
> +	u32 power_slider;
> +	u32 lid_state;
> +	bool user_present;
> +	u32 rsvd1[2];
> +	u32 monitor_count;
> +	u32 rsvd2[2];
> +	u32 bat_design;
> +	u32 full_charge_capacity;
> +	int drain_rate;
> +	bool user_engaged;
> +	u32 device_state;
> +	u32 socket_power;
> +	u32 skin_temperature;
> +	u32 rsvd3[5];
> +	u32 ambient_light;
> +	u32 length;
> +	u32 avg_c0residency;
> +	u32 max_c0residency;
> +	u32 s0i3_entry;
> +	u32 gfx_busy;
> +	u32 rsvd4[7];
> +	bool camera_state;
> +	u32 workload_type;
> +	u32 display_type;
> +	u32 display_state;
> +	u32 rsvd5[150];
> +};
> +
> +struct ta_pmf_load_policy_table {
> +	u32 table_size;
> +	u8 table[POLICY_BUF_MAX_SZ];
> +};
> +
> +/* TA initialization params */
> +struct ta_pmf_init_table {
> +	u32 frequency; /* SMU sampling frequency */
> +	bool validate;
> +	bool sku_check;
> +	bool metadata_macrocheck;
> +	struct ta_pmf_load_policy_table policies_table;
> +};
> +
> +/* Everything the TA needs to Enact Policies */
> +struct ta_pmf_enact_table {
> +	struct ta_pmf_condition_info ev_info;
> +	u32 name;
> +};
> +
> +struct ta_pmf_action {
> +	u32 action_index;
> +	u32 value;
> +};
> +
> +/* output actions from TA */
> +struct ta_pmf_enact_result {
> +	u32 actions_count;
> +	struct ta_pmf_action actions_list[TA_PMF_ACTION_MAX];
> +	u32 undo_count;
> +	struct ta_pmf_action undo_list[TA_PMF_UNDO_MAX];
> +};
> +
> +union ta_pmf_input {
> +	struct ta_pmf_enact_table enact_table;
> +	struct ta_pmf_init_table init_table;
> +};
> +
> +union ta_pmf_output {
> +	struct ta_pmf_enact_result policy_apply_table;
> +	u32 rsvd[TA_OUTPUT_RESERVED_MEM];
> +};
> +
>   struct ta_pmf_shared_memory {
>   	int command_id;
>   	int resp_id;
>   	u32 pmf_result;
>   	u32 if_version;
> +	union ta_pmf_output pmf_output;
> +	union ta_pmf_input pmf_input;
>   };
>   
>   /* Core Layer */
> @@ -460,4 +595,5 @@ extern const struct attribute_group cnqf_feature_attribute_group;
>   /* Smart PC builder Layer */
>   int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
>   void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
>   #endif /* PMF_H */
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 4036f435f1e2..38f02676261d 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -42,9 +42,77 @@ static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
>   	param[0].u.memref.shm_offs = 0;
>   }
>   
> +static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
> +{
> +	u32 val;
> +	int idx;
> +
> +	for (idx = 0; idx < out->actions_count; idx++) {
> +		val = out->actions_list[idx].value;
> +		switch (out->actions_list[idx].action_index) {
> +		case PMF_POLICY_SPL:
> +			if (dev->prev_data->spl != val) {
> +				amd_pmf_send_cmd(dev, SET_SPL, false, val, NULL);
> +				dev_dbg(dev->dev, "update SPL : %u\n", val);
> +				dev->prev_data->spl = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_SPPT:
> +			if (dev->prev_data->sppt != val) {
> +				amd_pmf_send_cmd(dev, SET_SPPT, false, val, NULL);
> +				dev_dbg(dev->dev, "update SPPT : %u\n", val);
> +				dev->prev_data->sppt = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_FPPT:
> +			if (dev->prev_data->fppt != val) {
> +				amd_pmf_send_cmd(dev, SET_FPPT, false, val, NULL);
> +				dev_dbg(dev->dev, "update FPPT : %u\n", val);
> +				dev->prev_data->fppt = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_SPPT_APU_ONLY:
> +			if (dev->prev_data->sppt_apuonly != val) {
> +				amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, val, NULL);
> +				dev_dbg(dev->dev, "update SPPT_APU_ONLY : %u\n", val);
> +				dev->prev_data->sppt_apuonly = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_STT_MIN:
> +			if (dev->prev_data->stt_minlimit != val) {
> +				amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, val, NULL);
> +				dev_dbg(dev->dev, "update STT_MIN : %u\n", val);
> +				dev->prev_data->stt_minlimit = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_STT_SKINTEMP_APU:
> +			if (dev->prev_data->stt_skintemp_apu != val) {
> +				amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false, val, NULL);
> +				dev_dbg(dev->dev, "update STT_SKINTEMP_APU : %u\n", val);
> +				dev->prev_data->stt_skintemp_apu = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_STT_SKINTEMP_HS2:
> +			if (dev->prev_data->stt_skintemp_hs2 != val) {
> +				amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false, val, NULL);
> +				dev_dbg(dev->dev, "update STT_SKINTEMP_HS2 : %u\n", val);
> +				dev->prev_data->stt_skintemp_hs2 = val;
> +			}
> +			break;
> +		}
> +	}
> +}
> +
>   static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>   {
>   	struct ta_pmf_shared_memory *ta_sm = NULL;
> +	struct ta_pmf_enact_result *out = NULL;
>   	struct tee_param param[MAX_TEE_PARAM];
>   	struct tee_ioctl_invoke_arg arg;
>   	int ret = 0;
> @@ -52,7 +120,10 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>   	if (!dev->tee_ctx)
>   		return -ENODEV;
>   
> +	memset(dev->shbuf, 0, dev->policy_sz);
>   	ta_sm = dev->shbuf;
> +	out = &ta_sm->pmf_output.policy_apply_table;
> +
>   	memset(ta_sm, 0, sizeof(*ta_sm));
>   	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES;
>   	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
> @@ -65,6 +136,12 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>   		return ret;
>   	}
>   
> +	if (ta_sm->pmf_result == TA_PMF_TYPE_SUCCESS && out->actions_count) {
> +		dev_dbg(dev->dev, "action count:%u result:%x\n", out->actions_count,
> +			ta_sm->pmf_result);
> +		amd_pmf_apply_policies(dev, out);
> +	}
> +
>   	return 0;
>   }
>   
> @@ -72,6 +149,7 @@ static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
>   {
>   	struct ta_pmf_shared_memory *ta_sm = NULL;
>   	struct tee_param param[MAX_TEE_PARAM];
> +	struct ta_pmf_init_table *in = NULL;
>   	struct tee_ioctl_invoke_arg arg;
>   	int ret = 0;
>   
> @@ -80,10 +158,21 @@ static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
>   		return -ENODEV;
>   	}
>   
> +	dev_dbg(dev->dev, "Policy Binary size: %u bytes\n", dev->policy_sz);
> +	memset(dev->shbuf, 0, dev->policy_sz);
>   	ta_sm = dev->shbuf;
> +	in = &ta_sm->pmf_input.init_table;
> +
>   	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE;
>   	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
>   
> +	in->metadata_macrocheck = false;
> +	in->sku_check = false;
> +	in->validate = true;
> +	in->frequency = pb_actions_ms;
> +	in->policies_table.table_size = dev->policy_sz;
> +
> +	memcpy(in->policies_table.table, dev->policy_buf, dev->policy_sz);
>   	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE, &arg, param);
>   
>   	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
> @@ -103,6 +192,51 @@ static void amd_pmf_invoke_cmd(struct work_struct *work)
>   	schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms));
>   }
>   
> +static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
> +{
> +	u32 cookie, length;
> +	int res;
> +
> +	cookie = readl(dev->policy_buf + POLICY_COOKIE_OFFSET);
> +	length = readl(dev->policy_buf + POLICY_COOKIE_LEN);
> +
> +	if (cookie != POLICY_SIGN_COOKIE || !length)
> +		return -EINVAL;
> +
> +	/* update the actual length */
> +	dev->policy_sz = length + 512;
> +	res = amd_pmf_invoke_cmd_init(dev);
> +	if (res == TA_PMF_TYPE_SUCCESS) {
> +		/* now its safe to announce that smart pc is enabled */
> +		dev->smart_pc_enabled = 1;
> +		/*
> +		 * Start collecting the data from PMFW after a small delay
> +		 * or else, we might end up getting stale values.
> +		 */
> +		schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms * 3));
> +	} else {
> +		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
> +		return res;
> +	}
> +
> +	return 0;
> +}
> +
> +static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
> +{
> +	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
> +	if (!dev->policy_buf)
> +		return -ENOMEM;
> +
> +	dev->policy_base = devm_ioremap(dev->dev, dev->policy_addr, dev->policy_sz);
> +	if (!dev->policy_base)
> +		return -ENOMEM;
> +
> +	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
> +
> +	return amd_pmf_start_policy_engine(dev);
> +}
> +
>   static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
>   {
>   	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
> @@ -146,7 +280,7 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
>   		goto out_ctx;
>   	}
>   
> -	size = sizeof(struct ta_pmf_shared_memory);
> +	size = sizeof(struct ta_pmf_shared_memory) + dev->policy_sz;
>   	dev->fw_shm_pool = tee_shm_alloc_kernel_buf(dev->tee_ctx, size);
>   	if (IS_ERR(dev->fw_shm_pool)) {
>   		dev_err(dev->dev, "Failed to alloc TEE shared memory\n");
> @@ -190,11 +324,19 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>   		return ret;
>   
>   	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
> -	return 0;
> +	amd_pmf_set_dram_addr(dev);
> +	amd_pmf_get_bios_buffer(dev);
> +	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
> +	if (!dev->prev_data)
> +		return -ENOMEM;
> +
> +	return dev->smart_pc_enabled;
>   }
>   
>   void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>   {
> +	kfree(dev->prev_data);
> +	kfree(dev->policy_buf);
>   	cancel_delayed_work_sync(&dev->pb_work);
>   	amd_pmf_tee_deinit(dev);
>   }

