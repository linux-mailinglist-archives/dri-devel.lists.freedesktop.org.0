Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105017AB9CB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 21:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE69C10E703;
	Fri, 22 Sep 2023 19:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BBE10E701;
 Fri, 22 Sep 2023 19:04:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MkafhO6jAgqCKlzxaepmAVrRhbD4DSaeLYWZMzGG5ZQjLT6F1Dm3NHEl28w+KuYxJvVJGnEui22ABEsFlI4emrKL5cpiV2O2QzmNv7l+9k9lbkpSaaYl/mATI1qXrzyNLtCtAXidIuZrth20MGgLgsaWhRU+tsQHrrDAqIRChjoIdE6suqYy8rNwRR7EOOfRDExwukgqRZmuqBzfKbA54I9A50HrWInI1UcPID5R08A+S7Cwbd+r4Pi04BehtE2+ZInzTKkMh7TzF2ngeoGk8jWlYXk9/IXvOYxmBiT8u8SPPGzQlZCJSAWOPHxFa4JagJI2JVkwQl880f6ZpAd4eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cm9WPkx3Z1s++hnDbv6WmooTRjgqMP1sTNuae69V0KA=;
 b=h2XEs1+LoFlCC0Vd1q2HfS3AKbG/pDWLLY5SGkkjwSUNmiyb/9ULAaHeRjBAG2+ZxZjhzDbZD2iUiOzBH1CToQYRZsJw/nczIa+UNidxOdRwDwN9Fiu8mvw7iY0SDY6BY79NR2m+KMz+/a4r7/nkClZrAWdkrv2R27iDznRNu5yohbv7m1Fk5hcuNEsPBs1RU4yI5U920//t13acFgeHHoTGUgWea7j20W1/F43PSJitF2q2qbNk+Rw8tNyJ47xmIppePuT2yTXj+Vnh8BTqAukf+bdE72wxSkjcXqhCyPvjsVE89ADSlV4qJMZIOI4t3tGJIZEF5GmAZQEPA2Cs6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cm9WPkx3Z1s++hnDbv6WmooTRjgqMP1sTNuae69V0KA=;
 b=MurLgFZD8eZK9Dr5RQmJH/J+jSSut9kNJD1jfpMrFHF+iTpjLBBYt4prkqGf3FJecRn5dG7sVTufWgHBVVupVhapcikEygAawvhoCl0qbcYLRc5I4Qg1AMLi9kdV54ZT364ntLSTAEorhdYhvJ/Tpr/9fe2H6HkZzjAmgtU87Iw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH8PR12MB7028.namprd12.prod.outlook.com (2603:10b6:510:1bf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 22 Sep
 2023 19:04:53 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4%3]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 19:04:53 +0000
Message-ID: <f370fd18-345a-4b7d-b074-550539e7933c@amd.com>
Date: Fri, 22 Sep 2023 14:04:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/15] platform/x86/amd/pmf: Add PMF-AMDSFH interface for
 HPD
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, basavaraj.natikar@amd.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-15-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230922175056.244940-15-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:8:2f::16) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH8PR12MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f67f68-e6ae-4c77-0eb4-08dbbb9ecd72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4EDpa+xM3n1uAEzbfOxUIbl0q9z8+O3hQe6htymg0F27uIzeQ4lWMfPByO7Sn+Kg2+7/jUEz/J59Pis1ubkehAL23ylf5F3dhJvHS5p+Gbjm62HAtgT1Id4ZIrLX4VlSxRjzBAYwSCr98GvFZfTT5xDfi3Kmnb/IXW3gYqJiHTfVYXuu4ag/lqMYkABOsgefM8b1IExG9eZsQOCSyTUiNH6TW/lTLaNNyq3RoujAZORJqWNkZRNmqS2eHKsUj6z0jqJWDA9YvLCecOmioyCeJKNroYIi3Dvwd98jOQynQ55GuVJ9Tcaa3ZdiJoZjfCkN29mmMw2FOETpVUArJxeESlbo6c3FS28ZY388N8/UY7+bQIy+uIblPp1YlQN3p8WzgVEJjNQsr9sFTcg/9z5n2Kd2/XfVMquRYmsRZy5GgM97MYpDgeYDMWHZnd8t6bJ1q0sonNCCpaRBr9fkspe/h3lfGWJmfo4lEW/6oMiMRSPFcz/7HuBiWAuSwc2E/XDDUn1xQoQ5vdGDjNnH8POS2IJiiEVajdgT9uqvSQVT62uQ3cQ38sIvMWz9xhHsNoXn5m7jE5JktT1WyYyetEGX+nRHMYuI2Nf7Y4dtrbz8sjUdlmNc2Ly4YmoMFrDWCaLNmyfGdZoD10nER42IdxnWwhg1VvVLGdNIfpCwG0t6Jmw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(366004)(346002)(396003)(1800799009)(451199024)(186009)(53546011)(6666004)(6486002)(6506007)(41300700001)(83380400001)(8936002)(478600001)(26005)(2616005)(66556008)(316002)(5660300002)(66476007)(44832011)(66946007)(4326008)(8676002)(7416002)(31696002)(921005)(36756003)(38100700002)(2906002)(6512007)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkRhenVBWnFUMHZlYldjMGZvWDZKYU5jNTI5anp4SkVVVTdhZDM0ZmhQYjRX?=
 =?utf-8?B?THNsaFo1YXI4dkRSd0dpQytVUFk2emZDaldENzhBWEVJcjBGL0M3eXI2ZnBC?=
 =?utf-8?B?Q1hjY3N4YVQxUDF5VGc4cW1LREhEZlE2ek0vOE1QdU9oazN4UTZVWEE4cUZ3?=
 =?utf-8?B?bHJhK1EzaGhudEtQTTFuSXZiZjhaYlIzV1ZsK3pCZGM5am8vZUtMdSsvbzV0?=
 =?utf-8?B?S09TK2FObDF0eW4vY3U3aXZ6SUZlck16SlhMSlVRM3ZjQ3ZzSzF1WFZKSlJ1?=
 =?utf-8?B?WVVld2dsNFZnU0VRT0QraXQrc3QwekpiYlBHelhhb2c1RDgxUXdjKzcyZlBT?=
 =?utf-8?B?aUVFc3ZoczZDdWJwRGxtS1hsWmM0Z0h2K3YwTE56K0JkM3NFc2lJUlhMaEtT?=
 =?utf-8?B?OVU2V05SY1JLK1RHR3E1YURUQlIyQlN1TVpjMytWVllxMllWcFBYUWZvNHRz?=
 =?utf-8?B?NVpxUkRhMHlzY3pYK280U2g2eWx2SjVwNEFRejVkZSsraUpjWXpMMmZ4T1RG?=
 =?utf-8?B?MVQ1RVFhYXFBZVNQYjIrMjNmQmFHblZ1YXpuVXl2TmlGby80R0NVU0wyT2hM?=
 =?utf-8?B?czhleFF0U2V4RElaZFhZNGtJTldQYjh4aC9hUjR0TFNJUHRvYWN2dEY3bUdy?=
 =?utf-8?B?dVBUTG9vWmsvenBEeko0TmwwRitMQ205OE14UDVhNEF4ODYyRUx4QlBIUHVU?=
 =?utf-8?B?c2Rqelc1K2NkN1U4WGcxWnlUSTlUNkl4dEtBSGtzOFpPTHIzTFB6cVc2ck9R?=
 =?utf-8?B?SGVaQUdraXNiUGl0N2hUMlBVTDNIS0NZNmVlZDRGNFRienhFMUVKc3FQdith?=
 =?utf-8?B?bGZ1ZnhySVFpaUxkVjBJOUZYQlI4YVUvUzYzTEgxVDRWUEhUSGtJV1NaVGw1?=
 =?utf-8?B?VmdjcWFMZW02TE4rSTh3M1g5elQwT09LVkpQeW9pSXdzY2UwRGNTbDEzb2gz?=
 =?utf-8?B?U1E2Ky80dzA5RmpkYWwzQ2NOT1AzRm5IRWk5Nkw3cWNNQ2owdHA4U0VaVjky?=
 =?utf-8?B?bm9Ma3hmMEgydmMrT29PS2tLRms3ZWZNZ3BPcStXZ0lPdDE4WVpMaUh5UEdX?=
 =?utf-8?B?Q1VCZVRKYWp3UjlNeERkd3JZVVhyT05yMEtxM3hTNFBPZUhNdlpMcWlId0Ny?=
 =?utf-8?B?UDdKaFJGWTJ1aHZnUzdZRXhkb3FWOGtUWmtpTlF0aVlvM2tmMXFDWkp6SGow?=
 =?utf-8?B?bDhFUTdPU3hiODU1eHVDcW5kNWxIcy9tT0xSOG9NVU5uSjlsNEJaa0xvSkla?=
 =?utf-8?B?SGhYT3RPZHNmVkM0U29PNnlRSGIrNjVCczlLMUluN0NOdDFuMnc1K25BWDlm?=
 =?utf-8?B?MzdaZDA0V3c3dUVCTlhnNjRtbW1OUkd5S3Z4QnBRZWZXZVRZcC9rQ1RMRHJn?=
 =?utf-8?B?elpkZkhCU1d6WmdCaVB2SmU5WFlsVXhpbFhpNS83RUlaemJKSjFaTmFhUlZW?=
 =?utf-8?B?UWRwZU9uT0NzVlJOdkRmdE5xRS9MYXRSdWNtK1VmT1ovLzRnL1RIbGNpRW1w?=
 =?utf-8?B?cTEzSXNLM1A3Wm5YZ3ZkV3h3RWJrYnVWeWRZQ2JycW9MUWVUN1FUbVFpeGlO?=
 =?utf-8?B?azIxWGt6QXFjUlc5OWo0cGdGdmF2VHB6L1FTVXFtNGg0Q0dsRXE3RlZ2ZXlM?=
 =?utf-8?B?eWFDUk5FNmI1OTM1aHg1MzZ0bVRTYkJWTFZUK2xlVzZNMmNDcWpMNjE1aVh1?=
 =?utf-8?B?QzdFR3Y3a29tcHVsYlkxRFA0aEptTnJlVDFCaEJYWFJOUmU2blpTWHhTZ1pU?=
 =?utf-8?B?VjltVUswOXVUdy9EUkNrTm9FOUF4VklmSVF2Y0h1akU2TEdSRTEyS2l1d1pR?=
 =?utf-8?B?SVc5eksrRkM0S0ExR3pESzhlM3FtY2htRGgrdlpTRnoxTWpyNkRFMm0xNkFm?=
 =?utf-8?B?ZExjZ3JFaHc1STViUGNwMWJuM3VFck1UVlhNZWd3a1dZeXV5clFlWjBFU3Ev?=
 =?utf-8?B?V3NHbTk3UjVoR0tYRVgzTkw5OWZqaGdMbnpNT2xBMExYelpwOTVQNlVmRHBO?=
 =?utf-8?B?S1l3U0FEWUNqME1nUy9hdDV1eVltQ1gyZlgwYnFRY0EvWUs2YlFaSWQ2VnJY?=
 =?utf-8?B?UTJRYmEzVUh6RlhpWEZlZFZWT3NqUmpGejhOMFlZN0RvWWVSRVhQSXRlR3dr?=
 =?utf-8?Q?WXc4zJT39MfUsUzQr1bpR4PSw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f67f68-e6ae-4c77-0eb4-08dbbb9ecd72
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 19:04:53.1052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tq5WX2bLUm7rRyofsGLoAO14Fm2RYR9G66gqfeWhTAzF7n12nVSjoHAltDeAHYo1LtifVTy74qb6gX8aYaGqdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7028
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

On 9/22/2023 12:50, Shyam Sundar S K wrote:
> From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> 
> AMDSFH has information about the User presence information via the Human
> Presence Detection (HPD) sensor which is part of the AMD sensor fusion hub.
> Add PMF and AMDSFH interface to get this information.
> 
> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>   drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  5 ++++
>   drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c |  2 +-
>   drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 11 ++++++++
>   .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 28 +++++++++++++++++++
>   .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    |  1 +
>   drivers/platform/x86/amd/pmf/spc.c            | 21 ++++++++++++++
>   include/linux/amd-pmf-io.h                    | 22 ++++++++++++++-
>   7 files changed, 88 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> index 2643bb14fee2..cd57037bf217 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> @@ -37,6 +37,10 @@ struct amd_mp2_sensor_info {
>   	dma_addr_t dma_address;
>   };
>   
> +struct sfh_dev_status {
> +	bool is_hpd_present;
> +};
> +
>   struct amd_mp2_dev {
>   	struct pci_dev *pdev;
>   	struct amdtp_cl_data *cl_data;
> @@ -47,6 +51,7 @@ struct amd_mp2_dev {
>   	struct amd_input_data in_data;
>   	/* mp2 active control status */
>   	u32 mp2_acs;
> +	struct sfh_dev_status dev_en;
>   };
>   
>   struct amd_mp2_ops {
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
> index 06bdcf072d10..d7467c41ad3b 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
> @@ -132,7 +132,7 @@ static void get_common_inputs(struct common_input_property *common, int report_i
>   	common->event_type = HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM;
>   }
>   
> -static int float_to_int(u32 flt32_val)
> +int float_to_int(u32 flt32_val)
>   {
>   	int fraction, shift, mantissa, sign, exp, zeropre;
>   
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> index e9c6413af24a..9c623456ee12 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> @@ -73,6 +73,12 @@ static int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
>   	int i, status;
>   
>   	for (i = 0; i < cl_data->num_hid_devices; i++) {
> +		switch (cl_data->sensor_idx[i]) {
> +		case HPD_IDX:
> +			privdata->dev_en.is_hpd_present = false;
> +			break;
> +		}
> +
>   		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
>   			privdata->mp2_ops->stop(privdata, cl_data->sensor_idx[i]);
>   			status = amd_sfh_wait_for_response
> @@ -178,6 +184,11 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
>   			rc = amdtp_hid_probe(i, cl_data);
>   			if (rc)
>   				goto cleanup;
> +			switch (cl_data->sensor_idx[i]) {
> +			case HPD_IDX:
> +			privdata->dev_en.is_hpd_present = true;

Looks like this is missing a tab.

> +				break;
> +			}
>   		}
>   		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
>   			cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> index 4f81ef2d4f56..63a5bbca5a09 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> @@ -7,11 +7,14 @@
>    *
>    * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>    */
> +#include <linux/amd-pmf-io.h>
>   #include <linux/io-64-nonatomic-lo-hi.h>
>   #include <linux/iopoll.h>
>   
>   #include "amd_sfh_interface.h"
>   
> +static struct amd_mp2_dev *emp2;
> +
>   static int amd_sfh_wait_response(struct amd_mp2_dev *mp2, u8 sid, u32 cmd_id)
>   {
>   	struct sfh_cmd_response cmd_resp;
> @@ -76,4 +79,29 @@ static struct amd_mp2_ops amd_sfh_ops = {
>   void sfh_interface_init(struct amd_mp2_dev *mp2)
>   {
>   	mp2->mp2_ops = &amd_sfh_ops;
> +	emp2 = mp2;
> +}
> +
> +static int amd_sfh_hpd_info(u8 *user_present)
> +{
> +	if (emp2 && emp2->dev_en.is_hpd_present) {
> +		struct hpd_status hpdstatus;
> +
> +		hpdstatus.val = readl(emp2->mmio + AMD_C2P_MSG(4));
> +		*user_present = hpdstatus.shpd.presence;
> +		return 0;
> +	}
> +	return  -ENODEV;

Extra whitespace here.

> +}
> +
> +int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op)
> +{
> +	if (sfh_info) {
> +		switch (op) {
> +		case MT_HPD:
> +			return amd_sfh_hpd_info(&sfh_info->user_present);
> +		}
> +	}
> +	return -1;

This looks like it should probably be -EINVAL.

>   }
> +EXPORT_SYMBOL_GPL(amd_get_sfh_info);
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> index 9d31d5b510eb..8a36386e6bce 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> @@ -149,6 +149,7 @@ struct hpd_status {
>   	};
>   };
>   
> +int float_to_int(u32 flt32_val);
>   void sfh_interface_init(struct amd_mp2_dev *mp2);
>   void amd_sfh1_1_set_desc_ops(struct amd_mp2_ops *mp2_ops);
>   #endif
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 5f3ab1ce09d2..97293ae25cf5 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -48,6 +48,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>   	dev_dbg(dev->dev, "Primary Display State : %s\n", in->ev_info.display_state ?
>   			"Connected" : "disconnected/unknown");
>   	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
> +	dev_dbg(dev->dev, "User Presence : %s\n", in->ev_info.user_present ? "Present" : "Away");
>   	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>   }
>   #else
> @@ -156,6 +157,25 @@ static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
>   	in->ev_info.display_state = dev->gfx_data.con_status[0];
>   }
>   
> +static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	struct amd_sfh_info sfh_info;
> +
> +	/* get HPD data */
> +	amd_get_sfh_info(&sfh_info, MT_HPD);

amd_get_sfh_info() is int.

Shouldn't you look for the return code here?

> +	switch (sfh_info.user_present) {
> +	case SFH_NOT_DETECTED:
> +		in->ev_info.user_present = 0xff; /* assume no sensors connected */
> +		break;
> +	case SFH_USER_PRESENT:
> +		in->ev_info.user_present = 1;
> +		break;
> +	case SFH_USER_AWAY:
> +		in->ev_info.user_present = 0;
> +		break;
> +	}
> +}
> +
>   void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>   {
>   	/* TA side lid open is 1 and close is 0, hence the ! here */
> @@ -165,4 +185,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
>   	amd_pmf_get_battery_info(dev, in);
>   	amd_pmf_get_slider_info(dev, in);
>   	amd_pmf_get_gpu_info(dev, in);
> +	amd_pmf_get_sensor_info(dev, in);
>   }
> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> index ecae387ddaa6..4f82973f6ad2 100644
> --- a/include/linux/amd-pmf-io.h
> +++ b/include/linux/amd-pmf-io.h
> @@ -5,7 +5,8 @@
>    * Copyright (c) 2023, Advanced Micro Devices, Inc.
>    * All Rights Reserved.
>    *
> - * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + *          Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>    */
>   
>   #ifndef AMD_PMF_IO_H
> @@ -26,4 +27,23 @@ struct amd_gpu_pmf_data {
>   
>   int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>   int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
> +
> +/* amd-sfh */
> +enum sfh_message_type {
> +	MT_HPD,
> +};
> +
> +enum hpd_info {
> +	SFH_NOT_DETECTED,
> +	SFH_USER_PRESENT,
> +	SFH_USER_AWAY
> +};
> +
> +struct amd_sfh_info {
> +	u8 user_present;
> +	/* add future caps below */
> +};
> +
> +int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
> +
>   #endif

