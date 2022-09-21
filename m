Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FFF5C00EF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 17:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1417210E89E;
	Wed, 21 Sep 2022 15:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9D610E33D;
 Wed, 21 Sep 2022 15:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663773480; x=1695309480;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BkOCSFMv0Hw3HppMoCbw8gRVYJCeSFlXAg7MaOBjuys=;
 b=lnyQiheY/6ztyn3B8Xdzu9GxulOSfvVkLW89LfCUseH8dGr8LDQ6ZUHa
 3lRuFNWpS/T5a/ShWpt+HPkfs1qULxn3fVxFrnWBva+G/SlqJRrCnXICQ
 pwzoikNEGb+YdfSHiu4Vto41R0ZpEU53tWwBsK5tuiIX7YsJ/fqGCqq/e
 OHsBfD/ZuNlhrh7l6CRvsu1wEe4EOlVYM9cXMaoVlp3w55KI4X5wUr8OA
 CWXMbU/lFIOqsof8Y8d6U0e17FI9N0rbJja1b/dQ7AaBwjV00foXbWXCS
 OpJB4L3ZG9tsKN1P4M5oMA9+zaWpwYM6GrTTeh/bP26slodd1JrXFXxuW A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="386317625"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="386317625"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 08:17:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="708492212"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Sep 2022 08:17:39 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 08:17:38 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 08:17:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 21 Sep 2022 08:17:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 21 Sep 2022 08:17:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ld24NaZrYfDIe+Y4YLgUX+PaiNrgAfIHPAUSTxzK+moer/eDJgJSRDxTHj3K77kPapyheeg8LGWeweRVIr3ZDWVRIGWRN1kVudthpi/wjRLYwtUUXkHwAEwU3z5iqJ9uuLdgYslaD5ffTzaY+1/modN4vZO1faGDtyeF5HzQambkyEv5OQyrqebywejQsQ3Wy/aG6JSA0BrfPIEDESwKjVdo/GxagTZQWMrGsmnCfTLpgPeQ1W/AEkPPgxAfmachpZJYVFTWq1WrMG+7GIsqsKxVMuEqK2UZbB9V3agiItKYQNwD7P+sUu8v2GXqbnDP5rJt++YxIzMJDohjPIeOcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UM9ar0OVAWJ1thOBXP123itRApXTggwMwLDD/UviO+o=;
 b=BgWjLGlE1AJPDc75RTc5mWY8k5kHafPHKQq43QBTSMPRHWgCrXFiSJ0MD7xoC95tSZCj4Jvs5zVHr8bOe+qtwhZLYwRAvfKqG7kcLI3617MXMmFtlz4esKE65yk1ibaBmqnwLv7w40AxGmNASHdkwOrC1pXZsm6ELsQeHDEGobXWguEKQ07rt32rFfkrUOdsD/MRPBxtHxEZZh0iZaABacF4SX+RTY+9XHFwGD0AIVHvYYzKFarRQ6WBXO/XDvpsgXtczQJOkqPAkCr66hu893AQDCsk6NOjPXK8EXxMIJjiIKK4RCLuvuDtKEEowL2Jxfzow5ls/aofrtQCCDA1uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ1PR11MB6250.namprd11.prod.outlook.com (2603:10b6:a03:459::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Wed, 21 Sep
 2022 15:17:36 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::b8f7:e789:58d6:f0ee]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::b8f7:e789:58d6:f0ee%9]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 15:17:36 +0000
Message-ID: <cf707153-a034-fae7-22b0-443592594433@intel.com>
Date: Wed, 21 Sep 2022 20:47:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH 1/7] drm/i915/hwmon: Add HWMON infrastructure
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
 <20220916150054.807590-2-badal.nilawar@intel.com>
 <YysHM8Ot1escBzEy@ashyti-mobl2.lan>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <YysHM8Ot1escBzEy@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ1PR11MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f816324-5ad5-4b93-b988-08da9be46a11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EJEKf5qnEdX65z3tbsDNRPXyHJkNKOaZWF8KwEma3cy3uhmIylVgGxj+NUQ7dLz6z4LGvUZSgOkpnEGxI7HvsXkOX84y9Q15I0FWrRLjWfY3mpKoNgYNh6i6bpNacK6Vip98tf6fePtDtFdNRQwuRRbh7LaI+h36JMsv0SlEB6ZaCZOFRZK+btZVw6oeK9WIC4D7qhYdSi8f+P64JdtHXv7S9ssgp3thNlFNQr0xp6TjOgwWhZ3H/FU0eOvSTXVv+sT+audRPCa3e0S7RD8nN78G5uKeNCXXIR+mayT9io/5zU87OlABVe0bQ3KGnBuk/0AJEfrf9EyWHEFO+DKMTSKZ8+GysHSmtWp/JRh05tdsdxyMI8p/tRp7fTEYhQKaRRpMqYxYpVt+8kG8fOyAY4NwlitTO/ag/hbnl69mYXZyFhiageUsrFxrEzJoU5moE3t4JFU0Djjo/R09uFrlGjb5Wrfbg601014uvS0RTKXH9LZLCkR3URQpNgd0E3/+J6fMFoEq7Z7GS8og5Ahmz90afstuNqG2LRcA/2+HmGX4LiBgqwzjL0WYV+EFTRjRIhlwWhAz8e0mmvUvNJWNffPAXlViaXOpN3DHuwTicpIca4cyfpdt8UAVlypw8lYy0TYmRPcGaqKH7WClqz2dJvtcmTvIOMUF/vLwMXCwWMKYU7QKCt3mFB5TZHPt7cBiU4EqdNKnlEZo5SErBxprJi9r6E2BojQ+riwjHtSe41Ym2jfDUz/528f1GdGMSnGMlleRsSKENLgzFUR5gwCRPnuCzODV5XyahF06PW8qTJ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(346002)(376002)(396003)(136003)(451199015)(2616005)(2906002)(36756003)(53546011)(186003)(6506007)(6666004)(41300700001)(38100700002)(5660300002)(8676002)(6512007)(26005)(8936002)(82960400001)(31696002)(86362001)(83380400001)(66476007)(31686004)(6916009)(316002)(4326008)(6486002)(478600001)(66946007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2R1RFIyZVM3aHdISGJiNzZSVExiR2pvMjhOUnB4ZWMzMThORWVHQ2lKcHRr?=
 =?utf-8?B?czNlVzFkTlFLZmpmL09tUkdKbWJoMzhXT2NBSTVTT24wOGs5UzJPa3pTbzly?=
 =?utf-8?B?V1krdGpSR1EzdGEzN2loZ1lyVzYwUUNHVVpTdDlDbUtaRUhNSktjS0VmMWpT?=
 =?utf-8?B?dFhQcExqT0c5Uy9zWmtIT202WEJxU0dQS0pkRGZMOVZQOFZoT1R4R2E5NUVI?=
 =?utf-8?B?OW9EaGZSdjVwSDREbHlMZ0JZWkxWaWNVM202SmdrdUw4ayswNzg4VUpqb2l5?=
 =?utf-8?B?KzhRekxjZm11ckdLYWtBTnR4Skp5dHEwK3psV0htT1BLVVpVOFlGMk8vUmRW?=
 =?utf-8?B?M04vWmZzVXVidnZuYjYvSDV1WG5FUis1Ny9lWURibTRiV05tVUtBNnZKbE9q?=
 =?utf-8?B?M1d5Q09kYk1KaTRiN3dqRzI3T21HQ0xoRG9IRzNZOEpLRHo0bjNmOElWTnZu?=
 =?utf-8?B?V1RuZzU3UG14emZNaVArQkZaV2ZpVGtjZjBYWFBFWjhDczU0dHVJUWdQb1FQ?=
 =?utf-8?B?VkR4WW4yNm9KNkRIZE5yQUhTVVN1dnlrR3R6WTdydXBnMEJkcmpmOWJmSDVU?=
 =?utf-8?B?aSs5VkNQZ2hPckJ3Q2JUbHBBNXl6YWZUUUxOSVByUVVXQUNGMGJjMElnRGZD?=
 =?utf-8?B?MFQzdlBBQ2dmNVRSUk93TVloYnhHNVlablFFWHlPbTM0Z1VIVnFkTWFySnlj?=
 =?utf-8?B?NU11VFJaTDZZL2dlWTU2ZGI2T2prM0hjdngrWjByRGJLRktNZmZWR3JsOG1p?=
 =?utf-8?B?SmNLR1ZWUnVvbmU5UXU2TDBxOXFhNkVuRjFvZ0xBRTNuUnlOdVA1dU9ZT0t1?=
 =?utf-8?B?VjJ6Tzkvbis4QUJRYVoyNmdPNFU0QmdESDR0a0g0bXdORVJxMnVDN2c4S24z?=
 =?utf-8?B?WHZWb0xrRU9tWXRuWkxUSks3bFZvb0hGL21maG9NL3ZOUURpYSs2eXRrMEhU?=
 =?utf-8?B?WGVVbVZSRitidlJISUhjZ0VmcVRTVXRHd084UERaNFFYd0JYaHZxRHF3ZmZl?=
 =?utf-8?B?QXJmbXk5VHpuNDJTUWFlOC9VWEpUWjc5N0JtM3FlcU9rZndjUmNmdzg1bTBy?=
 =?utf-8?B?M3hITkFRRDhjTEh4UTJJeUZMdDBJRlBqQWE3TnF2a0F2c0pMYkZncWwyZDFi?=
 =?utf-8?B?Y21Qek5kWUVOazlaZGI5ak12MzByN0RLL0dzZDhXVXhlbzFZOWF0Zk5GajB1?=
 =?utf-8?B?N01QV3A5ZnZsZENJZEZqU2lDaWFQcUJML0E2NnNQTmFlT3VOTzl2WFdZVXk3?=
 =?utf-8?B?R2syaDIxZTBkcU1nNmVJa3piRktmY2NiZ0dJMElNeGFJYTNLcXpZQ2ZxYnlX?=
 =?utf-8?B?a2pvMitKWlF2amRuanFjVU14WE9tWEFGdGF1WTY5VE95K1k3UTRwZjhPR1Rr?=
 =?utf-8?B?T1I2TFM0UUJ0YkZCaFY0Y3B1VGFlOVZRTmkxN2FTZm1yWG5LTmFrM0NLZEVO?=
 =?utf-8?B?STdyaXp3M3pPcmJiVTVwOURlTWN5M3VCWXo1YUVYNGRtNENqOXprNmxMS3Ev?=
 =?utf-8?B?S3pOZXlBNlFMcDh4ejhSVXpJSVpFRUhZUnZIcUJGeGpuWC9XZHhGbXRGNHV5?=
 =?utf-8?B?WTN2OGdZeUxuTks2dmVSd2pWV1dwR1Y1Z21rTXpZSWtFWkVoZVVFdzBxa1NE?=
 =?utf-8?B?QUtqUGNMa2Z2c0N1WnpiNWpUWmFBaGhhUWNqeEIrYzZnK1VramlMWk5Lbkll?=
 =?utf-8?B?eUpjNENrWXFKbU9YMm1rOW9qREp1dE8rR2d3clZkLytMRXBSWldyL2RSQ2hs?=
 =?utf-8?B?eHhKdnVJaGJjUmdtdklJMFdIQ2RZWlJ2cndUNDNCNzJJcE9VcWo5cDRnZFJJ?=
 =?utf-8?B?TWF6TnVab2UxZUVWVGh3ZHcwSzl2ODFKM3BOQXoxSW9BWXJXOTVXTnRhTGpT?=
 =?utf-8?B?UXBsQktSdFJQMDUrMTlYcXN6d2dnclpaSHcwc1RidXREdStXZ3kyTE1NQWM0?=
 =?utf-8?B?eks0Y2lCMVduNU9yRTFjWXhGbVZ5RGJLY253Z1Bkd2w3Sis1YlBqMU1sd0VT?=
 =?utf-8?B?LzE2UXR0Qk1oaklLK0lNVWlxWVhQRmhuY2hGQzR3RzFzMnM5d05QYy9BOEhL?=
 =?utf-8?B?UEdXQ3ZLWk1yZ3RHd3F3b09jS01wSkp2cXQvdjZocEJJYXg2cFFmdVZFbUFw?=
 =?utf-8?B?WmZPckxNUk9ZeXJOcEN6YmlZenFyRGRvcmdMNTVmcGlRRzBjam9EZDBEZTQr?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f816324-5ad5-4b93-b988-08da9be46a11
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 15:17:36.3866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xmYQ8Slct+/bTDySTyMC1KvrEB5pevOS5asijK5ISKqg2GU70ZCgqpKsZM09DoQInC2dDyRMgyi+pn08JcfRvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6250
X-OriginatorOrg: intel.com
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
Cc: linux-hwmon@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21-09-2022 18:14, Andi Shyti wrote:
> Hi Badal,
> 
>> +struct hwm_reg {
>> +};
>> +
>> +struct hwm_drvdata {
>> +	struct i915_hwmon *hwmon;
>> +	struct intel_uncore *uncore;
>> +	struct device *hwmon_dev;
>> +	char name[12];
>> +};
>> +
>> +struct i915_hwmon {
>> +	struct hwm_drvdata ddat;
>> +	struct mutex hwmon_lock;		/* counter overflow logic and rmw */
>> +	struct hwm_reg rg;
>> +};
>> +
>> +static const struct hwmon_channel_info *hwm_info[] = {
>> +	NULL
>> +};
>> +
>> +static umode_t
>> +hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>> +	       u32 attr, int channel)
>> +{
>> +	switch (type) {
>> +	default:
>> +		return 0;
>> +	}
>> +}
>> +
>> +static int
>> +hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>> +	 int channel, long *val)
>> +{
>> +	switch (type) {
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static int
>> +hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>> +	  int channel, long val)
>> +{
>> +	switch (type) {
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static const struct hwmon_ops hwm_ops = {
>> +	.is_visible = hwm_is_visible,
>> +	.read = hwm_read,
>> +	.write = hwm_write,
>> +};
>> +
>> +static const struct hwmon_chip_info hwm_chip_info = {
>> +	.ops = &hwm_ops,
>> +	.info = hwm_info,
>> +};
> 
> what's the point for splitting so much? Can't you just send the
> hwmon driver all at once? With this patch you are not actually
> doing anything useful. In my opinion this should be squashed with
> the next ones.
During discussion in cover letter of rev0 series we decided to create 
separate infrastructure patch, as we wanted to keep kconfig, i915 hwmon 
structures and new file addition in separate patch. Further feature wise 
we kept adding new patches.
> 
>> +static void
>> +hwm_get_preregistration_info(struct drm_i915_private *i915)
>> +{
>> +}
>> +
>> +void i915_hwmon_register(struct drm_i915_private *i915)
>> +{
>> +	struct device *dev = i915->drm.dev;
>> +	struct i915_hwmon *hwmon;
>> +	struct device *hwmon_dev;
>> +	struct hwm_drvdata *ddat;
>> +
>> +	/* hwmon is available only for dGfx */
>> +	if (!IS_DGFX(i915))
>> +		return;
>> +
>> +	hwmon = kzalloc(sizeof(*hwmon), GFP_KERNEL);
> 
> why don't we use devm_kzalloc?
> 
>> +	if (!hwmon)
>> +		return;
>> +
>> +	i915->hwmon = hwmon;
>> +	mutex_init(&hwmon->hwmon_lock);
>> +	ddat = &hwmon->ddat;
>> +
>> +	ddat->hwmon = hwmon;
>> +	ddat->uncore = &i915->uncore;
>> +	snprintf(ddat->name, sizeof(ddat->name), "i915");
>> +
>> +	hwm_get_preregistration_info(i915);
>> +
>> +	/*  hwmon_dev points to device hwmon<i> */
>> +	hwmon_dev = hwmon_device_register_with_info(dev, ddat->name,
>> +						    ddat,
>> +						    &hwm_chip_info,
>> +						    NULL);
>> +	if (IS_ERR(hwmon_dev)) {
>> +		mutex_destroy(&hwmon->hwmon_lock);
> 
> there is not such a big need to destroy the mutex. Destroying
> mutexes is more useful when you actually are creating/destroying
> and there is some debug need. I don't think that's the case.
> 
> With the devm_kzalloc this would be just a return.
I think we can switch to devm_kzalloc.

Regards,
Badal
> 
> Andi
> 
>> +		i915->hwmon = NULL;
>> +		kfree(hwmon);
>> +		return;
>> +	}
>> +
>> +	ddat->hwmon_dev = hwmon_dev;
>> +}
>> +
>> +void i915_hwmon_unregister(struct drm_i915_private *i915)
>> +{
>> +	struct i915_hwmon *hwmon;
>> +	struct hwm_drvdata *ddat;
>> +
>> +	hwmon = fetch_and_zero(&i915->hwmon);
>> +	if (!hwmon)
>> +		return;
>> +
>> +	ddat = &hwmon->ddat;
>> +	if (ddat->hwmon_dev)
>> +		hwmon_device_unregister(ddat->hwmon_dev);
>> +
>> +	mutex_destroy(&hwmon->hwmon_lock);
>> +	kfree(hwmon);
>> +}
>> diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
>> new file mode 100644
>> index 000000000000..7ca9cf2c34c9
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/i915_hwmon.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +/*
>> + * Copyright © 2022 Intel Corporation
>> + */
>> +
>> +#ifndef __I915_HWMON_H__
>> +#define __I915_HWMON_H__
>> +
>> +struct drm_i915_private;
>> +
>> +#if IS_REACHABLE(CONFIG_HWMON)
>> +void i915_hwmon_register(struct drm_i915_private *i915);
>> +void i915_hwmon_unregister(struct drm_i915_private *i915);
>> +#else
>> +static inline void i915_hwmon_register(struct drm_i915_private *i915) { };
>> +static inline void i915_hwmon_unregister(struct drm_i915_private *i915) { };
>> +#endif
>> +
>> +#endif /* __I915_HWMON_H__ */
>> -- 
>> 2.25.1
