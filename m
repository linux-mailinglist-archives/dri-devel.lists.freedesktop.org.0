Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD31867923C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 08:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E483810E616;
	Tue, 24 Jan 2023 07:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3344410E615;
 Tue, 24 Jan 2023 07:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674546333; x=1706082333;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XRb7ZUYs4fN4YelNCuJChlIF4OaMCX8rRH1HVgjLRG4=;
 b=DlNrprcIzHx7IcLgDj17VC7RzDU73h+MSP1/UyZcHVtQUXHjRyDBpnC6
 wKH8oOwc/uzBW41WZHk1eE0nuKSUBs0pMP7YFjazePi9v+9ypkqaeqSng
 i3/vm+085lQHUsuPQfQidpP2s1Bx41459/ufdqnpDod5+F8REUo6Ey22i
 ck6uYFUz/9E76EMKcJ9QgiyB53ABd1+XKAEcqjJRhshO0n3GBb6purHYU
 QsrBHgBMixxL7ulpd5lLKkF5HrqfWFtujgUzLggMD2OvtACX5d2lJYhwA
 1s7CU2Os1uRjkBmUNSWuPmvNXzVj3WVyPEsijhYywI+7BQo65+I7e9v38 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="305907098"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; d="scan'208";a="305907098"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 23:45:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="907393856"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; d="scan'208";a="907393856"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 23 Jan 2023 23:45:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 23:45:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 23:45:30 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 23 Jan 2023 23:45:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXVM5zsmF9VLG2zevv7d3SPmbrBHkBvjQW21vaXSN9Rprzs3EAfBPI5UkQRHBYqQu0srl0t1+bZ+n/G8WE4jOZvwn1NpyDHAruKyDDiMtuWBOH5kKvQ9w6jQdqJaObkEfk/QoffsDvAbFwNz0LARi8AtPQTzX3lymDcJe+cXGYqnKAm2duwaP6IufLFpHQrv/hf4y4vIcv30q9OZwBUruYZArzXljHpchy8BC/9Ql7aP3/3vxQlX5qD3RsimB4N98OywH//gzLES8+5kJ0ZoYttQWa9onJP9KAvC2XKzdI/YZS16TjtbzAsKY4UImAt9vowPiCYOLfJBLDoh/XHKFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQXSZBp3sx+3lRfm5nJtwJFHj6ZRuNxEfYitxbCUCqs=;
 b=ii5B7THdUqz5Z8WRv6Ny4GBzeiW7M7krX8W3dLW0/MQ1jz65hVw9s5/nrtpxLT401FnYkeQimuZmt8gJg4H4eGMicAAWxey5LYk1W7G2wI9KJz7qllxwWUZ0dWz4zBZvXDKUQbedtsy8TBpl5RIwMEL7hBVte/Z+brjpqkrmeNRNBnzX0pb+YgwbSKKkH08zDeMVwVwkcGfJWmQ85Tj9AJE5fzN11MRU3M/fYfvshWnJBcUQ6jG0JZMny8eVDpr5c6IDmoIwiWhGEAIJRsD1TWXcDTF2rHlKta34hIMhhwsYjJVFoLSrw6w1VyGTa4uX6Agoa70Ui5fPbrX4b5PoZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6862.namprd11.prod.outlook.com (2603:10b6:303:220::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 07:45:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a%7]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 07:45:28 +0000
Date: Mon, 23 Jan 2023 23:45:25 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2 1/8] drm/i915: Add _PICK_EVEN_2RANGES()
Message-ID: <20230124074525.xqprvxdtvkodcgdj@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230120193457.3295977-1-lucas.demarchi@intel.com>
 <20230120193457.3295977-2-lucas.demarchi@intel.com>
 <87lelt8riz.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87lelt8riz.fsf@intel.com>
X-ClientProxiedBy: MW4PR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:303:8e::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e7f1493-d248-42e6-4f31-08dafddef623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oDJjof4jk2HYL/7JQBzNdTn1slv5ozY5ytv2zUCgrNOuzlPCkEAF1vB77M5mfc4znDwZx45gVCI+VJo8MHvWZDi36Ia7a+bWp4zpzwkf/WWTdeGTct2HcEYSjSyIXgD6aca00MdBnum2yAFCNVnuqo6FmDxXhojrw0bihuDI3p1bD/JB9fBQ1TBiHpHLlsqH05cEiyOMTBWmRTNoO+pgX06V80Yt+LNVQZPaVsTAedjkFNBsQf65jBy0DPU7Kigg/KnQxdMf3hl7wIiWPRSKnoWUSINCt3R5OiZgAVTNukNUtjmqq3rPLdIxuKhiRNf6s2htez8GE0qtIdkyomYdI19IQrCAV1l9LWed57h5dGAnQHgGzM3EjE1Z4UHGDRo66AG7aU6fQtpWxsNsGDKWdMLGzobGfFleFFGYiyTY2kyqN6BmtB2k2G+MIgrcLooJ7w+xykkGx6/3gM49m4NhP72kitDVsn5S14DsT5j1aHWR4Fr5ogLNkruaF6pAyS4yTQDLZlRd0k3jO9VL533XKnyJlxh8bUHhAStKP3LEiZOPSFRWaL+KX9RY6g3l0gY3Ov3u3pejw91wUItn8Lhfj8giWzsgb2MAYB13CZMXRHp+4zl0cREUOxLOfDzT6UuO6kxEaNW4loREzJkdPOgpBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199015)(82960400001)(36756003)(5660300002)(38100700002)(2906002)(86362001)(8936002)(4326008)(8676002)(6916009)(41300700001)(66556008)(66946007)(3716004)(66476007)(83380400001)(1076003)(6506007)(186003)(6666004)(9686003)(316002)(6486002)(478600001)(6512007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmJZZHV2UXZZMDIzQ3VMS2t3TGNSMDJNMHRPTmVOQmVKcHJRUFFpNVBuZkQ4?=
 =?utf-8?B?dmZEQ00rV3ppUTM2NHcxVTZnanlLNzh1bUZTUWcvbFdrQUp2QVRXZjJKVldu?=
 =?utf-8?B?aERoYTY5Q01VcHZVeGYyRC90bW16UHh3VGVkTFJkQnFGQkVNc3l4NXo3b3Q1?=
 =?utf-8?B?QzlpZFkzZmtOQ016eGdXTHJEbi9IUHJwR3hBd1RCeDRKQ05qamY2SlpQdTZw?=
 =?utf-8?B?V29BQWxQYkJUVHduKzBJMG1WQzIybG83ZGloVWRud3h2b3JQQnJENWVzZThB?=
 =?utf-8?B?b0d5ajRMcXFoc1h3TERUeUkvNmZBOUZuYngrd2JqaVlBeGFKaXFDbGpsRHBx?=
 =?utf-8?B?MDRDTStlRkd4Yy9Ta0JjOUJNWHlQWU5xc3hDcS9JL2lzQ2VjenFFeUlabTlq?=
 =?utf-8?B?dnMvN0tDZUJibXIvOEpDNHhNc0gyNUVSWnQ5YXY2QXBhSlJCZGdEQ1Y0aENZ?=
 =?utf-8?B?RGlIbHBMaGtXWmMrK0liQXJUTlcrdWJYaFpzQkVsb0RCU1hFU1VlTHlFSENW?=
 =?utf-8?B?eDNwbXgvY1BnMVZ0TFpzdVRzMERyWlRsMndKU0ttMTg0SlQxZlF5azJkbHZX?=
 =?utf-8?B?aXFPNHFQcEFOYlFsN2szQW42dkdDbWZnbjBxS0hyS3VuN3dIN1ArdG5FNGZV?=
 =?utf-8?B?STM5TzltK1JhZWhCc2RpSjgwREhPa0RwcEZMbkpnUXc0dHNmMTYxVk4vTjh4?=
 =?utf-8?B?YTYrRFBNRVFlSzYwc0NPOHJlNEZnSzliRzQxV2pKR1Fma0MrRmxrM0g3SlpZ?=
 =?utf-8?B?WGR0NzQyQy90VkEzdGZxM0tORmx6ZG42cWt0ZHJoUHd3NGlZc3I5R1VtZTRU?=
 =?utf-8?B?SFllMkNPOTI2VEdRdXRHRDQ1VEtpOTNtVHpSajI1aUswYVloSmNOLzlNOTBi?=
 =?utf-8?B?K2dZK1lFcDhZMkIvU3ZTc2MvamlVeEhQYUNJY0pPaUpQNHdWRXM4S1FFQ09u?=
 =?utf-8?B?eGl0bFZMU0Mra3h3NGZPM1JWM2VPQXoweVdTVFJHQ0RwQUQ1SlRNRm9ET2ZK?=
 =?utf-8?B?L0FMK0xUUlBjR0VsTDZreXYyalByNUJyYUlEemZuU21jMFdIZlpDVGhBY2dZ?=
 =?utf-8?B?b1RmdXY0WlJtTit3Zm53S1JtaUNoRlJ0WjVqd0MwOGkwN1NNdTV1V25veTFT?=
 =?utf-8?B?Z3hjYndrQVhSMDJkUWU5SkZ0d05mVlVJeldacVVZb1VXUnp4TjczY2EyL3Bs?=
 =?utf-8?B?SC9ZYzFzZjRaWG1yUGZMM0J1eS9PbnRDSjJLZm1hV2NuNkxPelJGWFRMdHpw?=
 =?utf-8?B?Tmk4ZngxcnlMNzI4YjBwNVZPTHhmemMyM0JLL2p0NDIwVTRBV0g0Z1dpR2Vo?=
 =?utf-8?B?RjUrMC9WUERqY1ZRSVFhRlZTeXlPTzB6T2pQYmtKYStzL0JUU2taM09CYTA0?=
 =?utf-8?B?LzNsdmRrR0o3RVlwZXVhODNMOXpLVTkzU3NuMk1UUDd5NXREWkNGUWlORjJy?=
 =?utf-8?B?U25KWHdaZWlzTUlHV1hCM0NGUnl1S3JRdW1WV2cwaWI0bHNCSVYxQ2pyR1hO?=
 =?utf-8?B?MGw2bjlKaVUwSVRnd05kQ05CWjArZHN6dzZQaUNUTjJ0dEhjUTFGK3FpUXIw?=
 =?utf-8?B?N1ovTnJTMGRSQmZzeDNxRURTSDRjQU9hS3J0NHBMUEpENXJ4UytpbUZsMFVn?=
 =?utf-8?B?TWEzRCsxTVk1T0xkenprVmRwTXczMmNGbkN1Sk8vOFp5U3dDTUx6RnJTYWls?=
 =?utf-8?B?b09RUTVkZTEyakdOT1VPeWZDY3N3Z1BqcmhJVkFJQ080S2RxU3JjOE1CRXZk?=
 =?utf-8?B?VXpDcnhUeURDaUpFTE0vSDZvTzRaVG9TcUlaOEQySGhrYm4xU0JsQnZXSEVi?=
 =?utf-8?B?VWdVengwQVVxTWtjaE8yT1NpUE11TWlNUTNkckFMWDVvM0Y3cWpFcUhXbFZV?=
 =?utf-8?B?TEpybW90WnZFakl4Tm5yaWVHNjViTUc2dUorUmozV3pXTTNDOVVSYTNhZm1q?=
 =?utf-8?B?QlMwYkJ0bkhHVGp6Qlp1NHdtakw2bTk5czNsNThTNzFJT21HSWtoRHdFZ3NJ?=
 =?utf-8?B?WXhYVnJmYks4MHFZQ2JjVmVLSWFWMmY3azlNVE1LdjUrWFVzRWRVMWxZWmRD?=
 =?utf-8?B?VklIVnhKcHNyMy80RWJML012Wk93UTlvMjNYaUNQQlhzZkcvNHJvWTBNM0ZK?=
 =?utf-8?B?SVdSUEZNcmZTUWVIc3FZdTh1WngyS1dDY1ljVERJdm9CM0lVZGhLNlJiVjJS?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7f1493-d248-42e6-4f31-08dafddef623
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 07:45:28.2467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yw4bs+FSYCQEc73FhVbxYeh0uUPm6eUdd3AFsVGP4f3Qk3/0JVIrjXOf9QNCU8n09p2iMcguY2jbAA538u8UTrIgmb85+PFhj9Ijov1/h+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6862
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(I missed this review you did before I had sent a v2.1, I will incorporate
what is missing in the next version)

On Mon, Jan 23, 2023 at 12:38:28PM +0200, Jani Nikula wrote:
>On Fri, 20 Jan 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> It's a constant pattern in the driver to need to use 2 ranges of MMIOs
>> based on port, phy, pll, etc. When that happens, instead of using
>> _PICK_EVEN(), _PICK() needs to be used.  Using _PICK() is discouraged
>> due to some reasons like:
>>
>> 1) It increases the code size since the array is declared
>>    in each call site
>
>Would be interesting to see what this does, and whether the compiler has
>the smarts to combine these within each file:
>
>-#define _PICK(__index, ...) (((const u32 []){ __VA_ARGS__ })[__index])
>+#define _PICK(__index, ...) (((static const u32 []){ __VA_ARGS__ })[__index])

if the compiler is smart, it would be at least 1 per compilation unit.
gcc doesn't seem smart enough to even compile it though:

../drivers/gpu/drm/i915/i915_reg_defs.h:155:52: error: expected ‘)’ before ‘{’ token                                                                                                                               
   155 | #define _PICK(__index, ...) (((static const u32 []){ __VA_ARGS__ })[__index])                                                                                                                              
       |                              ~                     ^    

What I'm thinking for the remaining uses of _PICK() is to be explicit
and statically define them in a good .c depending on the use.
Then use that in the macro.

>
>> 2) Developers need to be careful not to incur an
>>    out-of-bounds array access
>> 3) Developers need to be careful that the indexes match the
>>    table. For that it may be that the table needs to contain
>>    holes, making (1) even worse.
>>
>> Add a variant of _PICK_EVEN() that works with 2 ranges and selects which
>> one to use depending on the index value.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/i915/i915_reg_defs.h | 28 ++++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
>> index be43580a6979..b7ec87464d69 100644
>> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
>> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
>> @@ -119,6 +119,34 @@
>>   */
>>  #define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) - (__a)))
>>
>> +/*
>> + * Like _PICK_EVEN(), but supports 2 ranges of evenly spaced address offsets.
>> + * The first range is used for indexes below @__c_index, and the second
>> + * range is used for anything above it. Example::
>
>I'd like this to be clear about which range is used for index ==
>__c_index, instead of saying "below" and "above".
>
>No need for the double colon :: because this isn't a kernel-doc comment.

ok, what about this?

  * Like _PICK_EVEN(), but supports 2 ranges of evenly spaced address offsets.
  * @__c_index corresponds to the index in which the second range starts
  * to be used. Using math interval notation, the first range is used
  * for indexes [ 0, @__c_index), while the second range is used for
  * [ @__c_index, ... ). Example:


>
>> + *
>> + * #define _FOO_A			0xf000
>> + * #define _FOO_B			0xf004
>> + * #define _FOO_C			0xf008
>> + * #define _SUPER_FOO_A			0xa000
>> + * #define _SUPER_FOO_B			0xa100
>> + * #define FOO(x)			_MMIO(_PICK_EVEN_RANGES(x, 3,		\
>
>The example uses a different name for the macro.

yeah, that was the previous name I was using... good catch, will fix.

>
>> + *					      _FOO_A, _FOO_B,			\
>> + *					      _SUPER_FOO_A, _SUPER_FOO_B))
>> + *
>> + * This expands to:
>> + *	0: 0xf000,
>> + *	1: 0xf004,
>> + *	2: 0xf008,
>> + *	3: 0xa100,
>
>With the above definitions, this would be 3: 0xa000.

fixed


thanks
Lucas De Marchi

>
>> + *	4: 0xa200,
>> + *	5: 0xa300,
>> + *	...
>> + */
>> +#define _PICK_EVEN_2RANGES(__index, __c_index, __a, __b, __c, __d)		\
>> +	(BUILD_BUG_ON_ZERO(!__is_constexpr(__c_index)) +			\
>> +	 ((__index) < (__c_index) ? _PICK_EVEN(__index, __a, __b) :		\
>> +				   _PICK_EVEN((__index) - (__c_index), __c, __d)))
>> +
>>  /*
>>   * Given the arbitrary numbers in varargs, pick the 0-based __index'th number.
>>   *
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
