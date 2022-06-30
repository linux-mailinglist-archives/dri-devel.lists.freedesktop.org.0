Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4334D562220
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 20:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9A310ED67;
	Thu, 30 Jun 2022 18:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6971B10ED6F;
 Thu, 30 Jun 2022 18:34:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPepUKYjioEo3uqaLelSWWXxte0D5u0yMEZ+8r4WWfjaiqjPXTtOWJhYXOK0ByBgoRDiHeY2C3vbnBRDWQ2NiGJsmX8uXFHfLE05lVYCV675uzYitNmjsNFZXlAjgeL0Eu51dMMbe8Tyrf1YakKU/Nxn3vlM1R6TQsm/MOg+YgNrnRtTxHcw2bag8Y9OWSGd8kM/BfgpmR62wAETJaVRWIunbo2H1D82WOSvXbc/FM82VnMUAtU6nioPOHRh3c+zQJtbqg5+xyYWo+JqjOApwSywBChAmnf47SZfOlrga+wAYQumjukNGRjSimGukW+YQlWSrFekzNn2rl82YQ+BIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faRr+5o5PPOwoCWovnjYBSIT9YXzdg4gzZVWO2V8V2c=;
 b=UzF8FUsysQ//eqJ/nY/NVDv2sK1dZxEJD2AB1CCvjEPw9zR3uXYHoyq6qtG/p9GqzQCWveck5v0rvjR/UJfQ7aPAL0SD6U3jIrhLknkKs7AMZIxlwohgSYDOvPH6gLmjZQz65Y2RMwvI4BWns7gGh5IHxZywh4yXosrB0LoWSjW8wFoGwjBmPkAapyDRMocA0FO+PGeHrpq7HL3u3O1mFxPxAlqDVd5rSpAPBWHXLHW1gg40Vu66eDct2pBCDtO0UaIDt3CcouZ44L2IugBjsDTwdgBBUBVb0Bs13YhnCCwkxJub1/1bmOu3wKv0pWkXsIJZ58BNzWGi4c0pJ43lCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faRr+5o5PPOwoCWovnjYBSIT9YXzdg4gzZVWO2V8V2c=;
 b=GxCtkbZFOmHQUH0vnM1iJ5YvkercQIrjFGBoar5h3zuYC8IKgzPAKKw5SdJSnHGSNHBGobtA/M3Mlcm5qfeZJvpFlGK/h4NjtLG0xJ3AD7/COyuCY7zP8LVjw08egncadmmZQZP4xlXq1S21LSsmToIgpGziY0l8dWaZJ4nl6Es=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by DM6PR12MB3386.namprd12.prod.outlook.com (2603:10b6:5:115::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 30 Jun
 2022 18:34:03 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::6d50:f6c5:cea4:1d95]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::6d50:f6c5:cea4:1d95%6]) with mapi id 15.20.5373.018; Thu, 30 Jun 2022
 18:34:03 +0000
Message-ID: <ceb5c0a9-60da-43c6-5cab-c9d9a2dff618@amd.com>
Date: Fri, 1 Jul 2022 00:06:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/5] ASoC: amd: add Machine driver for Jadeite platform
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220630031755.1055413-1-Vijendar.Mukunda@amd.com>
 <20220630031755.1055413-5-Vijendar.Mukunda@amd.com>
 <Yr2Eq0BUmi6mZsRY@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <Yr2Eq0BUmi6mZsRY@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0149.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::19) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66a24903-fa13-421b-aea6-08da5ac71b26
X-MS-TrafficTypeDiagnostic: DM6PR12MB3386:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QkV2P1KCfeGd6vyt5Ks17qQUF2FsBTeT662Rs+IOf4YkolEWIZcZO42rVczdrVqod6feL4aGrWO0WHwLtcGhBBpvf60NsunC4uXqfRLUKGcKnWsqj/Qemp1v1jqUBqKBk7XWXLQRTQdXC7ss9yNRYEljh3n1u7kV/RYUEsbyNzrQM43AuSGmI/dUnCS1lAt2Z2QUlJn4WXq+qWaNnMyVuVbCg/toZ9fRz6v8HtOggR7Oz8VNlhE6ZnEgvHjItWhHeIEM3OEvrM9AhAMeIaVh6mroecWz9P6DyzSQCqGqtJximzalAjrZKtebYhUhzVDHefGWClYGoRLqsPtKTNo3xejtxMIXDx72WDrZOCjCkl5jreFxO8cXhleAW8SdvvtPKMCj9IKrVUj2q8E00mnSTzboNu89pLA4EcXqn04raPXYBrtEaNvg7hVVN/nQ8LlwnEWVQ/34B7tx0Sa4jbG/KPwyjHOT80zCYRel0JbIHIf4ebDDr/Ozo4O4h91sSfK3b1ZWP3e2MN+v7Rr3kYF2TIXoDxW5nZvOWRJJ7S3RysJD8svnp1WdLTrNFvFRiQUliIR+ValiWW/rIrCU7onUEm3GpzHF/0daj8BPwsAdlDWrtSwd90De1MPZLjcVARfzHgRAxvQotQkT9lnCbNkIw12hvKfxfaRQrjWXIsyS8r7qVaf59MiL8/PgzLMqUzkR9KjFb/DHxJoWdflCXNgW6NO0k9X+wzUKIMQcmguE8RWM108S3IZ84k46YhcFGZZZ+Wke1hbK7hdifeC00UBbYgAL9ZKtLhd+Y7yNqQrGswj1SHxoIPqTdZLcd2rvGGuE5f8PIutL/qgzEDWjzAX49eEvfeuCJl2MWy5lzQp0cbM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4123.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(6512007)(186003)(2906002)(26005)(83380400001)(2616005)(6666004)(6506007)(36756003)(31686004)(53546011)(38100700002)(41300700001)(66476007)(54906003)(6916009)(4744005)(8936002)(5660300002)(478600001)(8676002)(66556008)(66946007)(4326008)(6486002)(316002)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckVuSExPMTlIdGpiTW5SdGVscUNERUVFT1pPSEpuU216ZXNYZTI1Z3lLZE9o?=
 =?utf-8?B?cUhFamMzTU9LSlk2Yi9PRXJVNGZKeE80WGRVZVVhK2VROXd6VXFyMHlha2lL?=
 =?utf-8?B?ZWZNZkNnUG1DeExCUGQwcTNuNWNEeXpCVVZrTDZPUENteUNYSXdNRUx5RkVH?=
 =?utf-8?B?b2k5SWRvMmNLcVJNNDdOSzZlUmgwd1ZOUVd6d2JVQWhaZjJhc0NaK2lENnpJ?=
 =?utf-8?B?WnF5NWFieFdHSWdqdU5rTGNzK3dlc2s5RGVqNFpYcytDUEtBZTJTajZWc2hx?=
 =?utf-8?B?UFhEbFVlTVZkczJqbGJ1aUxiN21RNEgxZGY0UTFxT3FHODl5YlE1Z1VWejVi?=
 =?utf-8?B?RkhSM09XMDNXSmZvSjl3bzBzck8zcVMwUS83cTlPTEYwOTZYS0kvNG5FeWox?=
 =?utf-8?B?L2V6bno5QnFJSjhma0xvdkRzMnlvQTJrUHhvMWU1UG03Sm41aGdHeHlKajdU?=
 =?utf-8?B?NWdtclhIWkhCRjlxZHdESjVTMkZpVnZYWHNHQ2RTdnJWRitGd1Ntd215MUtG?=
 =?utf-8?B?NWJTU2RQbFIybUxGQlRFWVk0OGZFTnJmYmpIaVZSOVZwRG9UdFFnY2VZWkpV?=
 =?utf-8?B?MEl3ZkgrZGUwaHN1Um9BMUtqTGR6dEs1Y1o1YVhUbDloTzVkUVh4bXV3cG5R?=
 =?utf-8?B?cDR4and2b0dia3VKeDVqeWxmWjFIN1FuaDFzUFg1aU45T3BYNTFVMk9vVzA4?=
 =?utf-8?B?eEJRbjEwVWRhQWIwUjZMaWdKOUxOL0J3TldrVlovRGc3K1o4ZkQwN1AzQkJu?=
 =?utf-8?B?bzI5cGVWY2ZZeVl4SUZJdnVpMDR1S2dmb2l3c25TOVcwK0VqeWZ6YU5qbmxq?=
 =?utf-8?B?N3JsYUw5eTZ3blpmd3YyTlQyTXV4TXlXZy9FN2V6blgzelRqRjlZb1ZBT0wr?=
 =?utf-8?B?eGt0a2RzdThmTk1rZ2pHMWlyTEpDUjluWGg1Q2Znb1dxNE9DU1ZCbmRJR2JI?=
 =?utf-8?B?UXVrYTcrRlFCM0k1UUFqcVN6ZElwaEljV0QwZHdTSmwvdy9QSm1QVEcwQWlv?=
 =?utf-8?B?OU1yOHcrK1BRb3k5a0NJWU9MR0Z2SEpJWUlGTG9JZ1BPTEF5THBRU0E0Tmkv?=
 =?utf-8?B?T1VvL1c1WXlkQzNERTdUNElMRmtXZEpyQlBjNitGaVJnZkVibnB2dGp0OUhq?=
 =?utf-8?B?T0NWb0UxVDJlaVo5S3FyckhYSlc3YitTSjYrSWtaRHRRUkg0YkNOMy9sQ3V0?=
 =?utf-8?B?eVRRUlRqS1I0TEVTR0M0dEdweVlLSFRKTWxNNjBWNERWb2czWE55Z0dMT25H?=
 =?utf-8?B?ZVAzZDgvWExBbmtuOXU4RFRKVkxVRnJhVTIzdDdaeitlZHFkNFdoNUQ1OXNO?=
 =?utf-8?B?bGoxd2FTYlY4ckd2cFQ2OGhzY09CemdqT084S2lkVjZTNzdXRWFxeS96MUk1?=
 =?utf-8?B?b1lsQmp4aGJjdUxseVBVTGcvaG14MUFVRC9BNFE3cWhkQUhORHdBaXpIRzAx?=
 =?utf-8?B?Nm1yQWJuSnljWlB2dTVxbTJMaDloQjI2TkJWbGlvR2h3RUJqcHJkdkFqQlVa?=
 =?utf-8?B?QkQvcXpqb3FqV055RlhpVjZsSDRMc0wxcGRLMUxORVFpbWxWOWc1MzRuOHky?=
 =?utf-8?B?cjFaZ0xZV00rczJRaTYyLy9GVEU4RC9QdEQzcGtoNXFTQjFQNDJMdERGKzFW?=
 =?utf-8?B?UkdVQVp6SmphQk5mdy9ZYW9YRWVYMzJMYlVUVjNzMDYxZzRrYXYybFB0akFp?=
 =?utf-8?B?QlFFdGNyZWlFNGNROHpFd1ZCUDJFNnhuZ01yQUhZMXJKK2NPMTBSdlVLbHQ4?=
 =?utf-8?B?NjV3RWM5NWVHNjhHdzQ5RnZHTHE4ZWcyS1Z4SzN3UVk2SURTMDUyWE1XODVx?=
 =?utf-8?B?bEpQNlc0dXFBTkxYbkJQSTVjTG5adXJLcU1WOHprWUR0bE1VRGRYbWNIclRE?=
 =?utf-8?B?R2hnd0JNRTMzTXVleUk3eGtLdnRSaE9lYnpCc1BPODFodGZiY1RISmc3TXZl?=
 =?utf-8?B?K3JSSDIrK3hReXpCVzdHZ2ZId1RqQzJlUkhRUjRYZHFFWkg4Si9aTlA1Umpx?=
 =?utf-8?B?SFJDRy95elJMeW1LK1JpL0ZydmZOMktqUExDanI0RjBuQXg2ZUdIcFEwTHRj?=
 =?utf-8?B?ZjkzWkNXOUZjUkgyVUtSeEozWkVsOVkvc0NXUSs2Uk1IQmlOQ0I2UmxQTHZB?=
 =?utf-8?Q?DOyyLA7IarE0w92xTr/q2vh2k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a24903-fa13-421b-aea6-08da5ac71b26
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 18:34:03.1715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHCh5uD9cf4zWSiPh0+uJF7ZbAkyqDnNEnIFWl5dohL+O4f+0cNGS5Fz6Gt7qB6HsCOBabPn+/GFk3Vv7nM1YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3386
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
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 amd-gfx@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 dri-devel@lists.freedesktop.org, Alexander.Deucher@amd.com,
 zhuning@everest-semi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/30/22 4:40 PM, Mark Brown wrote:
> On Thu, Jun 30, 2022 at 08:47:54AM +0530, Vijendar Mukunda wrote:
> 
>> +static int st_es8336_hw_params(struct snd_pcm_substream *substream,
>> +			       struct snd_pcm_hw_params *params)
>> +{
>> +	int ret = 0;
>> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
>> +	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
>> +
>> +	ret = snd_soc_dai_set_sysclk(codec_dai, 0, params_rate(params) * 256, SND_SOC_CLOCK_IN);
>> +	if (ret < 0) {
>> +		dev_err(rtd->dev, "can't set codec sysclk: %d\n", ret);
>> +		return ret;
>> +	}
>> +	return ret;
>> +}
> 
>> +static const unsigned int st_channels[] = {
>> +	DUAL_CHANNEL,
>> +};
>> +
>> +static const unsigned int st_rates[] = {
>> +	48000,
>> +};
> 
> If the clock rate is fixed why not just set the sysclk once at startup
> too?
Yes. We can set sysclk once at the startup as clock rate is fixed.
Will modify the code and post the new patch.

