Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2474061213A
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 10:02:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0968410E1C9;
	Sat, 29 Oct 2022 08:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AA310E1C9;
 Sat, 29 Oct 2022 08:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667030561; x=1698566561;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6f1CfeiDjcTFcq6WIpZwewoWPsbaOakXUR/MS/lxlxo=;
 b=UTOoLRkkUsaxIR84ldXLMefRjV0R3594QDktnMTRjkm4IDplfpaIvMlJ
 eWAsJOMZuBStjqpcFoKdr70s1nCZTzXP/vnF9bc9NfQ/xB1KMdwikBLUo
 KUPousOy+dkVBEpSQ42C/Zmcjy6OIheX8akVMJg/E1PntKTiJlfVZSRVT
 o8P+kDK+sutdwFIcyMJcEgb1BUVYDoSKi+0DVR6LWXILuYk/5Frcu/MjG
 3/lQFvIh0jBe9a83+MWneA+JbjLTUf8Ga7gAdwvU9DojDqn9ptV/4G9z7
 lgTXv/E296QhwwRxw5MQw+/GoRtwtOd6KqvjNpjgxNGC4tOR0O1TcU80f A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="289041179"
X-IronPort-AV: E=Sophos;i="5.95,223,1661842800"; d="scan'208";a="289041179"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2022 01:02:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="738394040"
X-IronPort-AV: E=Sophos;i="5.95,223,1661842800"; d="scan'208";a="738394040"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 29 Oct 2022 01:02:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 29 Oct 2022 01:02:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sat, 29 Oct 2022 01:02:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sat, 29 Oct 2022 01:02:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4Jl6cKY0VEQ2u3AVeSyJ1N2VznigHTI2Ngwz7xMPnAQeUqg1qHe8T28SAzpkdy7kz7by3ncM7MMjAxPznrBOKJ8PZRMR8PjngjwnNMUEccf36dJ95MEdx93WDHTwURbdVNaxa/vuHvAvSiIr+C/yHylq3mk/WZp0L/jVQm1ubuMm1TfrgQfmmSug0DblTjMMOWAxBlAV2a0VOKeSTiAo/pEK9yOq5F46y191nbBPUIAJbd5d78xrVUInCDmIFzO9J/P/hY8ELwRgCdAyaR43M61bS4A+xTO9KO3ba2mX0n0P/kRsSHmkilzXFXMPph+Qd55bsSowMteVN3dRmNobg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lE8g5Z+KSMvia93buNgzoZJbVY1HK31P8gXDQvhDbZw=;
 b=Bnln2pqs2+6YDYYCluR6ps5jv6Mp2aMNkXwCACchezUDB2Hn2Fu4JJ5EuZSSrXBMtVWkmX2MjRt9nPLAyXbLXP4F09iK81pIDgswBIS9e32xVOAoFLO56BonXTkfdf2VlcjKpb1IkgLfytyCW6SVKgZigURqe60yPPykGfaiwkVgubeh5GEtBPoddlBVYwfHT34fgVrCFUF6UOA4FAo4sYRUfDN1+NcZljTMA1MV+q5dyPHpPTc48y70r+9QhMOHr+IPk25DLEESN7JuFRjHBbEa/1XmMm1G0t7zJ0zsJvg1XH/vvr7ul+lwFuB8fwkM2fuygt/FVgjkxvWZswUlVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by PH0PR11MB5128.namprd11.prod.outlook.com (2603:10b6:510:39::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Sat, 29 Oct
 2022 08:02:33 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::4ec5:eced:e4:7706]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::4ec5:eced:e4:7706%6]) with mapi id 15.20.5769.016; Sat, 29 Oct 2022
 08:02:32 +0000
Message-ID: <850085e1-e420-b6eb-104d-15694a400bb7@intel.com>
Date: Sat, 29 Oct 2022 11:01:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5] overflow: Introduce overflows_type() and
 castable_to_type()
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
References: <20220926191109.1803094-1-keescook@chromium.org>
 <20221024201125.1416422-1-gwan-gyeong.mun@intel.com>
 <ffcfb7ce-7646-c827-8d29-7c41e4b121d6@intel.com>
 <202210290029.3CD089A86C@keescook>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <202210290029.3CD089A86C@keescook>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|PH0PR11MB5128:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d97c3ba-c39e-4801-96f5-08dab983eeba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U1Z0botNPSbhc9SSObnryJaAhzkQ4k9ZpV++k5dvkAxDjpCfGcGrEqpk8B68V+8WMZnYnV+ayKltK4aUNEyM5GlxC8n2/Zs4eWbHI1XjZQDYBiUGCuj5zDAV5BjLA5D8ACWmohReImkBVZ+tXvRuxVGrPgyUztRbzNzw6JanSZjBC4CRdL/+5gRmNRcSCo7NKidWrTKIKANfqwtcJjHFnOFhbF1kMfPaS9TJ039nOQzAmMG2wYrOD0ejMADiwLgbBbyUye9TLYb8K6te1i8oq9ifJ2uOvKuEBsYx6viyYAIq5svEC9/nj/z496OjJhyVPs3v3e3rNX7DE/0MqVAS5jlGnR+Jfd7869Oj4sS6SyLdY4Bv/M5v08jOClIMru2ZYY8cCFwDsB4Cf4F3gnZwsacfk1Td4w3/ZvcJ+LSqAq+6GUxgOJopu9xBkZ9HW7efQDgTkPq5nbB0CacUm18hopRTa4QhxYa21+uWK5d7HjAQxOH2MXm2dryEsvrraifixnupxJc4aisA/jLLgQys9zapdVLvR6BCSnIIeNoWnnyXwfMHMqt4Rmmcf4dxL4cg9t5d+IxWIXMxKRnsO7JqUftm7hRdjAXEcgGGQ0CXizga1eE3kIRpGbmyl0VKDlWc544nMes3uXfyfc/efSJA+H8EY0NGiF9lJ6++OaTxDZ7aEvz6CBhA3FiO0ojpv8raXXdtbWJjWXOEUu+fkGq1o9DESsazFtBkkfJrT2PaZuw4ZoLpTdvNIBTlAExJ220hr4gssbLv6om2EOBpD0rhTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199015)(2906002)(36756003)(31696002)(86362001)(31686004)(82960400001)(38100700002)(83380400001)(53546011)(6506007)(26005)(6512007)(478600001)(2616005)(186003)(6486002)(4744005)(6916009)(316002)(66556008)(4326008)(8676002)(66946007)(5660300002)(66476007)(41300700001)(8936002)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2hhWTAyaStiaG5lMG16QnNLYk5oNzBhZVdmOFBtd2FCckRyNG9GNldnajVJ?=
 =?utf-8?B?ZTJXbXo5RGxaMjFLVmJTeDZNZ2xjM3hCVS9CZW1BbEE4RFlGNDRhMHJ3V01D?=
 =?utf-8?B?RnhPZkNMMkFJcVg3ZWlvZ1JsYkh2WFdleUQ1dk1aTHVWQTdMa21vTWdsWms2?=
 =?utf-8?B?ZXpJOUltTTk1TXFUSzlwSHI1ais0enQ1TWNVYWorQlB4OU12YWt4aGVjbU9v?=
 =?utf-8?B?K1dDY2NobjBjbVlCK1hqMzFaV3VVdTFoZjdxbE5qcWJ3NHhtd1dMNGdxeld6?=
 =?utf-8?B?bHE0UWlRSHFOcUhrSFMxNElOVERFV2lENEs3M0RtR1prb2UralFmMUlPUHNJ?=
 =?utf-8?B?L2hGdHFzZ0g0OFAwbG1hYk40M1ZOYWtvK1JaQk1ac1RsNEczRXQ5c0hKcHlk?=
 =?utf-8?B?QmFYeWZNU2pWM25MWkFjMERMZG1aM29PaXBvOVhWU08yUXc4cjN0V2pwWk83?=
 =?utf-8?B?Qmh1TlFYL3RXcFpHMXdNR01BUDlUQk1YKzRqRUZqRkpPMUFKTDk2bHVBRndv?=
 =?utf-8?B?V3J6TXVkMVhTWEJrZmE5S2JVbGVBckZHMUN5VVlDTXZGNXlGWkZHNzFWc2hs?=
 =?utf-8?B?UW5YQ2dkREowbnJGRGJnUkJuSUZnZjRXVnZkcDFwMVZ4MmZ6R05DTjZuNE1G?=
 =?utf-8?B?TnhvMmM3MGx1NUxZMXNxMWRZV3FKVmdqWi9UclpkVnQrTVpWcVRMUEcxeWFE?=
 =?utf-8?B?SG91RUVNdy81SmlTQ0VjUkIxNEIrNUFvb1lyMWF2ZkJUSTEvcDRGcDhCaVpJ?=
 =?utf-8?B?a1hVZ0h3bmhwRHJpMVpHLy9tamlrOWJpYTJ6OG8zLzhncnJXREY0RTVGVkZx?=
 =?utf-8?B?YW44WXh0SW1yWW95NVFacWNyREd1NVUxeC9aQnhKclZ0WHFTZkF3TzFqeUM4?=
 =?utf-8?B?dmdpUk8xYmdpVytKcUlyYXdRNU9iVXlvZkQxSEtUajlReDVKeFRCM0FFQy9r?=
 =?utf-8?B?c3dZblJNWE5nNE1kTldpZDAvWERtbGJQbUpOUjBYMlViaG9tT29LQ1R2K3Fz?=
 =?utf-8?B?QnNUQWdSTXJ5OUhEd3RyU3hkdjJDU2NNVE14anhDKzhOeGpIUzhZbVB2UEhW?=
 =?utf-8?B?Yk9ETDhZOGZmYTRmdEt5bW9QeW45S3NWYlBTak01UmpiSklLQUNNUGVEVVRq?=
 =?utf-8?B?aW1iSWV6TUhMaTFGZTR1TW00L21OZGg3b1NCa2dBMkRpcUQ5S2JrdUIxKzls?=
 =?utf-8?B?VzBveEt5WUJXKzhjVHZ6eXhST0VKcnlZRDdNdzVMSFhhaEhVcGdBODJKNk5i?=
 =?utf-8?B?bmpPMWhlR2d5VXZLc2txaTYxZGlSWVBZTUVrN2VkVTl6clZqaGlXVjEzdVR5?=
 =?utf-8?B?dVJ5ekZWcWMzRUR2UGNuR3pkdTVBWk1KeE1vVEdqRkpwVFh6OFJZUHdmUWw0?=
 =?utf-8?B?SUpoWEhTNndNNW1pUEMzeXZRb0ZrOFF6ZjlWUVJhQ3dkcG5YWW1PK1AzQlJR?=
 =?utf-8?B?Z1Vid0ovMVBRMDZJeHZtYXFsWXIrejVhSU1VWFhGZlQwVjVoaEJxRzduaUJ1?=
 =?utf-8?B?Z3pOdThBamdUckw0OVdCYmFaVk8xL3BXbWNGU1B5VFRwMEZocStoVGFlY1E2?=
 =?utf-8?B?eWVWNFc0Q2Z6eUNPZkZveWtaRTdrWlNlNEp2S1drcllGTW9hUkJwd1JCQjQz?=
 =?utf-8?B?NkVmejgxU3pUVXNKeHJJdFZYR1FtNDE3WEFrdGtOWTFFTmR1RVNVRXRMb0pH?=
 =?utf-8?B?WDI4VGpnT3U4MWxxL1RFRy9GTSs2RVFWdHE3eFFrU0JNaXo0a1JmdTFLb3hI?=
 =?utf-8?B?eFNCVWoxdEl4dThNeWliYjlqNE1WWXBTQ3luUC92cDZ1Nkt0Sm1BbnFiZ0U2?=
 =?utf-8?B?RGN2azZrYVJ4a3pKa0F0YS9DYXBhTGJDL2l3QjhlcHdGTEdFMks4V1JxZE9I?=
 =?utf-8?B?c2c3MVhIbmVGUGU5YW9ETVZmNDMwUmZEbm9tUGtFdHBxZHplNFQzcXRaSis2?=
 =?utf-8?B?S2dsMFkraVBlcUZQcGpOazJ3Z2hQKy8rTlg5b3RXTUs4eDJobXFxdFdhakZu?=
 =?utf-8?B?N1VnalVJdmhLTzl0NDMzVDN2elh2NVY3Rk5MSXpzL0xVWHBweEQ0OWEvd3Ns?=
 =?utf-8?B?TElJelRFYnRnK0VoMzlVK0tFaFlFUnlFSkYzU1Q4bHNsWVNUZ2hpcnBOQ3dw?=
 =?utf-8?B?T2hnN1QwWDYwb2preUM1UUxJd2ZuUXZiTnRlNzJ3VzlLQ1RTK1NDTi9BUGZ6?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d97c3ba-c39e-4801-96f5-08dab983eeba
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2022 08:02:32.7468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9fyoW2rgfr8KTCTQdxpBRaMofTxjeCzh8GPxvlvVopEgeZhV52yKOouASNNCKcXDnD+Rk7JPYlJaBzpdt7zuxB5RA4IEx2ksVHCYz7ntJc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5128
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
Cc: arnd@kernel.org, mauro.chehab@linux.intel.com,
 tvrtko.ursulin@linux.intel.com, airlied@linux.ie, trix@redhat.com,
 dlatypov@google.com, llvm@lists.linux.dev, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gustavoars@kernel.org, nathan@kernel.org, linux-sparse@vger.kernel.org,
 linux-hardening@vger.kernel.org, rodrigo.vivi@intel.com, mchehab@kernel.org,
 intel-gfx@lists.freedesktop.org, luc.vanoostenryck@gmail.com,
 vitor@massaru.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/29/22 10:32 AM, Kees Cook wrote:
> On Sat, Oct 29, 2022 at 08:55:43AM +0300, Gwan-gyeong Mun wrote:
>> Hi Kees,
> 
> Hi! :)
> 
>> I've updated to v5 with the last comment of Nathan.
>> Could you please kindly review what more is needed as we move forward with
>> this patch?
> 
> It looks fine to me -- I assume it'll go via the drm tree? Would you
> rather I carry the non-drm changes in my tree instead?
> 
Hi!
Yes, I think it would be better to run this patch on your tree.
this patch moves the macro of i915 to overflows.h and modifies one part 
of drm's driver code, but I think this part can be easily applied when 
merging into the drm tree.

Many thanks,
G.G.
>>
