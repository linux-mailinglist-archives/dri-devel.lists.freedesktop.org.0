Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2F55E5A9F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 07:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0044C10E56A;
	Thu, 22 Sep 2022 05:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FDC10E463;
 Thu, 22 Sep 2022 05:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663824266; x=1695360266;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QANjGeJKX0Rm2+WY2OO+34OX4PwfcMp88cxtrBQa35I=;
 b=Uu270eLvG4efSU0zabpnEDtiDT+fTlg+breI9TZtsThVqmITfjKq9e5h
 /AF1wSVP5M1iWoqh38zwHP9Ahwm6Si2PDU0xv1jTX/O8NPU7BIufDcZ9m
 CBgULfcvjigGTz+c5m1HCUX4pv1gGyIPjW158HHI76MPbzMXD+UkOfTBL
 WAeSUP863yFB9WWHauKX8KBeBBTkUVMnKOfvuwvVwh4yc6z48zKGnRSN/
 MBIc9R4lCIG5gTDX7Xm0Sxhps5po4JA/lLB+xQzVRAP6146J+RwbGY+Fy
 j/ZkLOzIuNbOJYFTB0YrgWNlDfrCNdZHyPDFMUUfBdf2FTWfYIA/FJotw A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="326519534"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="326519534"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 22:24:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="615072311"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 21 Sep 2022 22:24:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 22:24:25 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 22:24:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 21 Sep 2022 22:24:25 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 21 Sep 2022 22:24:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mzy9dlIjRUhyuI2q46s47b93FHkMy0RJKENQvDox4Z/xxO4FpSpd7KA2qqWcTMpeYSyT5M8+7mn4NRtq34JiNztmRerCTFhZKyWAmp4TS+lArmOSb5+l2avi+qMbTMIngMZtzdfoLUACIirzlegwlVmoPoDL/tycpweOdRnxSpRpmLVDsPB25P/k6QlL0eck2TPG5CFecsOaXYcVaGBP+LTosH3lQYTWNlwhwKBPLFDjkMmEPzVfF7KBRIzXrEk/PDPr3l/v1JcGDXjMHh+NcRsjJ2DDX6lx3biOTi+sJcs+0tZGOzEpcmORV8EO30PEjukPKREk2LmHP3ZE5b5m5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1g42WyzZpV46RqnbTrYtcFVzpK6+pJcjzSDEoldgM0=;
 b=nfhZ22hiIuYSvE2TjloPs1LoCBGv1FXbO6rFMWDwGuy5q4NMRBHc3Qilvkwtj/ZPDjH5LNN4DDENJ2LKc8vL1qF/WWGsxi8duMX+XDMhYygKweQUpqx1IIbIbbF9Uhgp9EsEN0gveRKuWCtrli3IZrizqeLpebP5R6QblMSyMjwX9SqIudhN+KrMoZwvTbQSubj57tomEZU7AriLckck/W3Pivyz8zXLlq8/pwh4C+XW5uOJLOnE5Y+QXPXFAlbciarfNLEV9QzsJwZU4+vIdRt7u1kvdi1QijXf44qC3tlhcyXCQCC9Z3mSB/PfZLgU5VujVFbuq6V2oFVcX7dDAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SA2PR11MB4954.namprd11.prod.outlook.com (2603:10b6:806:11b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Thu, 22 Sep
 2022 05:24:23 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::c144:218:70eb:9cbe]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::c144:218:70eb:9cbe%4]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 05:24:23 +0000
Message-ID: <5c88044c-7ad6-80aa-634b-139532f9bf59@intel.com>
Date: Thu, 22 Sep 2022 10:54:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH 5/7] drm/i915/hwmon: Expose card reactive critical power
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
 <20220916150054.807590-6-badal.nilawar@intel.com>
 <d8af316e-6e1e-98db-e25b-273c734634f6@intel.com>
 <87fsgkm71w.wl-ashutosh.dixit@intel.com>
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
In-Reply-To: <87fsgkm71w.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::23) To CY5PR11MB6211.namprd11.prod.outlook.com
 (2603:10b6:930:25::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6211:EE_|SA2PR11MB4954:EE_
X-MS-Office365-Filtering-Correlation-Id: f7efd998-60e7-4cc7-ac4f-08da9c5ab515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LgQKNhNVZ3wbJ1MXvocuUHP5h6nB1S8EtcbqJANAxvLiugV4yiur1HAPw+dgvMHaxwggiLVrhMMEAE/KTZx//FR/rFi1TDckZ+QWZ+P8tCSP4r/Mhrcj/EX9CZGLqST2ObEE1FwkXCthy2yVvhFpPGGvYvDBt10g2rWy6RypFjdLoY77mfwTAQcm9zUYmhZpFCi8Sif4GvziadOjFhHisUc8+xL5Bj8lxPJZh7fCwQF61z5faJYYeaYsw5YiYT0DDYFCMYstTZycy/LBGtJ7I7q+d6fuxgl8nZMdQf7gK531xqGOkSfMoZSCiPxMW0QCZCaalUZJmysBt8R8kpOGYRrJzjA5zeeDqP6HRsyImeHSNq2cXhXb0n0dl1pzbGLFxMwyjIXXmIGoLhlsnwNJ68GStqwteD6dqJoG4eYuJhLSqbHqHgPB5PH/nGhaGyQjVLPuc0Hq6eJLO1HNm1+s3RKx6ZOY9ZccbWveRpk9wrfcGkwsMWq/RTZu5diQhUch9HfJBojjd70Wy05JuTKJN0t/kW/PioEeXhggrNGODSoIBxJWu0TWcwa/rnjL6hdliDtBc7uaNgFqwwLO5VGCqsm9YDcVRjtt/s8bZYzBcP+lhsfJcfw2G+MwCaISL3X/q6ljR76PHrS7COCPtTytU+88xHaiMQKGfykneElYG4DWtNu9C69QcFPhynasVZqybiBrApkW4aLn24vGvk9gVQ1LYJtokY5hVYU390B0/9DFi0uG5107L7FgZT6l+1pdjXnR8NMjFRZfAGYh7dxGjBTFEiaeijjdaI2kQV4VaY8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(39860400002)(366004)(136003)(376002)(451199015)(5660300002)(478600001)(38100700002)(41300700001)(6636002)(6666004)(82960400001)(31696002)(36756003)(6486002)(86362001)(2906002)(66556008)(66476007)(8936002)(6862004)(37006003)(6506007)(53546011)(26005)(55236004)(316002)(4326008)(66946007)(6512007)(2616005)(186003)(8676002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0JmVXc3Rnlud3kyamF6bDZFNjd6UFdoOFNzMHVWQW1qeW5LU2VnV0diQnlx?=
 =?utf-8?B?UE5PVUkxckF2b1ZwWHdJZHRjWkpvWlcrVVFqaTNiRk5jZ1pqSzJRWFhvUTV3?=
 =?utf-8?B?VS9XZW8rNzJVSjU1MkJnWEYxaDlyOFdMYlRWcEFIbkFNVlRDZlhjbGplUUZF?=
 =?utf-8?B?VEdiMWdubTd6RDdYT2k4bk5lZnVLdVdwb3FnUkFKa2swYUJxYXpvbmk3cEMw?=
 =?utf-8?B?aG1hMTFYd3cyV3VsWlhMTjBlUkdsa2N3KzVrWkdiZmViem0vR2ZVQmZhRG5N?=
 =?utf-8?B?WFp4MW9FdjZuTEpvMnQ3ZzVxWWlnK2tWeTlhQ1gzbkw3WkdZWWMwczNxc2dS?=
 =?utf-8?B?ZFdtbWI1ejBydmVoaUErNXNUVHg3OE1IUVNzbHlhbURPM3VrVkdHTmdZaXk5?=
 =?utf-8?B?L3JpbHZOMjY0U3pQSUxKYytFeXVzYXNPbkRuTTNPcDNXalF3MXVIQlJyOEdP?=
 =?utf-8?B?NHp3ZjFwb1JRS0ZaL295N3ZDeWsxMStjN2tuZVdRbEpQaXpkMFNaak0ra1pV?=
 =?utf-8?B?K1lXOGhVN2JzbXc2c0VTMXF1TTZYdnY5cGo5UDdaTjFLa0U4T2hlMjJ4a0ww?=
 =?utf-8?B?emlDUXpCMXQrR0hzN3hPaDg0NEtWR1orWXVvVGRtM3hUcGdycHoxcU9UTzBY?=
 =?utf-8?B?dHhwMVdWN1BhZUE5bFdzTE40NzhTbmkreWNZOVo2UlJ6SFBKeTB1emI3cUYw?=
 =?utf-8?B?WkY0TUl2Z2R4YTdqaG9QTDEydW83d2R0eXB0NWJFRTJzQnZJRXE4UGlhYnpN?=
 =?utf-8?B?MjRYKzlYcHBxL1E5enduVVFSajFoaFBNZXlYdXZmaXNUNjNpRjZTWWw5bVEv?=
 =?utf-8?B?MlF5dWZzNVl5RTJyampBakxqYndPd2ZDalU3elhQalZJRHFOVVFnWlJUaDV3?=
 =?utf-8?B?cnVWeHBKNmxGOENHTkJJbCtMU3NyMm1oa01FY1VLcERWRW5wMEJNbFQwNWY1?=
 =?utf-8?B?TkxBZ09tY1pzTkwzZ2twc1pNUWZJRmw0bzlCZ0dzUktBMjhCWWdIVnJkSFZQ?=
 =?utf-8?B?Y3VDSXJyTzFnVVNPR3hqSXN5RjVSb1JZbm9vbmdBTktWK1Jnc1pscTJNRURj?=
 =?utf-8?B?MlBqaW9sdW8wMFFSMzlMeXFkMEtvbDNtRlZEVkRHdjZ0QXBWMDR1aDVCV1V5?=
 =?utf-8?B?Tm1VRzAxSGxUdUNsVGhyMlIraHdtd0RJdUdDN0hhZTdlRE9LeWxLZVUxUS9V?=
 =?utf-8?B?VU9OUlJaYklWSmJIZXh2c1VKK3dTMThZcHVQZG85dUdLK0tQekhraDB2ZVcy?=
 =?utf-8?B?VXR1d1hIUUF5NmVQSjk5NXUwZFdIRFFzSHZOMVNreFJ6NHdtUld5K1V5VEpY?=
 =?utf-8?B?eGtxTEtRTlBMWkVBYmJlcnNjN20xZkpJU1lhc2dqazMyNWNia1ZCZ2M4MGVW?=
 =?utf-8?B?bk9KTTJtQU5nMkoydDlEMlltb0pGYWZZTFFBTVFBWVdUZ3ZWcGU2c0NvbFBL?=
 =?utf-8?B?MndMcFRmMFRNUW01dGsxNFh5ekNGQXFXNFpuN25pWjAyTHZUdHpSbEtOQWJn?=
 =?utf-8?B?SWhHQnEzSEUyQmlTbkliUU5PeGNuR3o4NzdLbFFFU1F3Z090cGdoT25SRGtU?=
 =?utf-8?B?ZDBXbm15TzIvcWk5cnRadmNhNmFGQjlQWGtZcmRiZUpVMEh4bEZldmY0MWw1?=
 =?utf-8?B?T05qZmVIWWI2WEczaG1nUUxqYzlaNDBJRkVQbGJvVjdkOW1HcjhheUZGUXNO?=
 =?utf-8?B?NFNxYmFUUWZ4Z1h2dUVGa0xMemoyWXZqb0ROTDVkN0pwdFNmYUhpWkhLTmVG?=
 =?utf-8?B?azFxOFZNR0g3NEJzanJpeGVVU2Z6K3gxR3F6WlJ5dDFHYlBpcEVla1JRUGpS?=
 =?utf-8?B?RzhNUnViRW9JR29pZzhPT0dXUmVDd2RCdlllNXNSNXlpUzFRb0w2Q0pLSHQ3?=
 =?utf-8?B?ZzN5ZUt1VzBTZFRWZzlMTnBWTEwxUmJvVjFaTTFQK3o1dGhaVXgvNUF1OW9l?=
 =?utf-8?B?ZDdwbjQ0eXFTSkFaUGZGbTNMNk5JOTI3eHBCVm9DSlZwVkFrM1EwazFrR3Bw?=
 =?utf-8?B?QXNiNE5wcTRNYU5DK01adHhrSm5rZUpwRG1mREw5eVlQV1ZQWTRHZ0Z6R0Iy?=
 =?utf-8?B?Ny8wWDJldS82a0hBUnk4c1VQKzNvMHFxenR0Wm9IcnNpTUcvcUt6eVpWUjJO?=
 =?utf-8?B?eWhzNVJta3lGeWhnNkI5Wno4bzgzR1dLamxtOEwwZFlJaTV4ZThxeEcyc0tt?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7efd998-60e7-4cc7-ac4f-08da9c5ab515
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 05:24:22.9039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTaXm7CXcBHz+012tcNfKA3K4j92/v2p+dMnKpeHHOZZhcw4kNbiOz0mvtZRKLaTwX4xC0POZxzce33FdmdWwJTx0NK7nXR9XwpzK9QdkSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4954
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
 dri-devel@lists.freedesktop.org, jon.ewins@intel.com,
 Badal Nilawar <badal.nilawar@intel.com>, riana.tauro@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/22/2022 8:47 AM, Dixit, Ashutosh wrote:
> On Wed, 21 Sep 2022 08:07:15 -0700, Gupta, Anshuman wrote:
>>
> 
> Hi Anshuman,
> 
>>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>>> index 55c35903adca..956e5298ef1e 100644
>>> --- a/drivers/gpu/drm/i915/i915_reg.h
>>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>>> @@ -6644,6 +6644,12 @@
>>>    #define   DG1_PCODE_STATUS			0x7E
>>>    #define     DG1_UNCORE_GET_INIT_STATUS		0x0
>>>    #define     DG1_UNCORE_INIT_STATUS_COMPLETE	0x1
>>> +#define   PCODE_POWER_SETUP			0x7C
>>> +#define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4
>>> +#define     POWER_SETUP_SUBCOMMAND_WRITE_I1	0x5
>>> +#define	    POWER_SETUP_I1_WATTS		REG_BIT(31)
>>> +#define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
>> Could please add some comment to explain, why POWER_SETUP_I1_SHIFT  = 6,
>> what is excatly 10.6 fixed point format ?
>> With that.
>> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> 
> 10.6 fixed point format means a 16 bit number is represented as x.y where x
> are the top 10 bits and y are the bottom 6 bits. The float value of this 16
> bit number is (x + (y / 2^6)), so (x + (y / 64)). For example the number
> 0x8008 will have the value (1 * 2^9 + 8 / 2^6) == 512.125. Note that the
> hexadecimal number 0x8008 == 32776 and 512.125 == 32776 / 64 which is why
> POWER_SETUP_I1_SHIFT is 6 (2^6 == 64).
> 
> Similarly, the 8.8 fixed point format is explained in
> gt/intel_gt_sysfs_pm.c. Do you think this needs a comment? I thought "10.6
> fixed point format" is a sufficient hint (fixed point numbers are fairly
> well known).
> 
> An even trickier data format is in the patch "drm/i915/hwmon: Expose
> power1_max_interval" in hwm_power1_max_interval_show() but I think I have a
> long comment there.
Thanks for explaining this, i was unaware of fixed point representation.
My RB can can be used without any change.
Br,
Anshuman.

> 
> Thanks.
> --
> Ashutosh
