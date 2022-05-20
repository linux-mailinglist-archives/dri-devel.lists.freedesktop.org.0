Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A9652E900
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 11:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E1610E6C3;
	Fri, 20 May 2022 09:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D75B10E651
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 09:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1653039669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kq0o3HFsRHNjMdV32ZHN/hvfJaOGtyVOMLJu1ZLX0U4=;
 b=ffGYGavPc09HxyWldw5XqxXxMcKx2PJ6R9+AeSdWolsj6e0vcPmNRiasX6aIgC/xa3knIG
 qiZuAZvESzVvyqexAByg+eNJXXAiPPJTgFmzKoqOUqZC24Yb9c1jysfXFFtCkNVfVqRnOq
 spI77bGfzwvjIR1PuYQ5Z2KPjTlRMS4=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-0v1tkyQ-PGG5Rlt6bw6XTw-2; Fri, 20 May 2022 11:41:08 +0200
X-MC-Unique: 0v1tkyQ-PGG5Rlt6bw6XTw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETO5EDsnavCoMBJJSKrRh3d4N56tZijZCAQEXON75vvkPhl59ViO+Rk+nYOKR3rtmrDZPOYePvUOA4iy/w9pZIxKkqcjKXaZNNne8BoCUIosJCWqeVc0jhEW5qV4ZhEakJ//FLP103Woo+uTpOojvnw+x7MdIEmZ0W3M6XaCOs377F+NJJrP56EjbW5OPEWBKoRs8DC9mfwqPA89xND3Xt6mWLH3Xq7wCtwNtDwj26NXZhAc1OH+jAyrCaJIO6eBA9EWbiFSlyTLLOvTsq6i3Xpgc4fLcHxhvZAvLKnOK2IgD+wILXC9853dRTK5bQHSDwkv1uzMrE1Ms1tfIIkO1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kq0o3HFsRHNjMdV32ZHN/hvfJaOGtyVOMLJu1ZLX0U4=;
 b=ku2lmCC27HSgIrTgXB17OdvwZKt56Z8Gecm0bh6Em0oeKqhkzktewRMQtw0ccn/QCxa/sqEzEF4tx1n8Tx/YDqIAcOSoPpo8kYuxv+QtipUqtnVfYh6+gHCsGZpSDRBvuezf0dkVu15ramSplIbWphFZmcTdz+fvYOOcclkZTsgQfnAr2jpiz01DEvUiRHlvT2xz5Ri/KmdVZzKP4is1/2NWjEgIWMiaviAisI7xQHBhjTenc4vdoSTbX73nsdy3eQzF1Sl3z++DW9ym31vU2vSaBEBg+oywqcbMfNoF4D+kCJ6hJXF6VvrkXOQ2dWNmuzNGczZov/e+vcPc45ElFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6515.eurprd04.prod.outlook.com (2603:10a6:208:16f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 09:41:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 09:41:04 +0000
Message-ID: <3bff3562-bb1e-04e6-6eca-8d9bc355f2eb@suse.com>
Date: Fri, 20 May 2022 11:41:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] x86/pat: add functions to query specific cache mode
 availability
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@netscape.net>
References: <20220503132207.17234-1-jgross@suse.com>
 <20220503132207.17234-3-jgross@suse.com>
 <1d86d8ff-6878-5488-e8c4-cbe8a5e8f624@suse.com>
 <0dcb05d0-108f-6252-e768-f75b393a7f5c@suse.com>
 <77255e5b-12bf-5390-6910-dafbaff18e96@netscape.net>
 <a2e95587-418b-879f-2468-8699a6df4a6a@suse.com>
 <8b1ebea5-7820-69c4-2e2b-9866d55bc180@netscape.net>
 <c5fa3c3f-e602-ed68-d670-d59b93c012a0@netscape.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c5fa3c3f-e602-ed68-d670-d59b93c012a0@netscape.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0323.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b17af9dd-760c-4e04-7b8a-08da3a44db4e
X-MS-TrafficTypeDiagnostic: AM0PR04MB6515:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <AM0PR04MB6515B4C94C38A53F34E13067B3D39@AM0PR04MB6515.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dAfJvDz03H6oRK0e8eDDJVj1nqiQGr59FkkJCCAWrEBnCJqwVEsTgnmpsHJ9s2R4M3XOTXwqB48tsZG0WPa60NCEqHaEFjLzqIYFB8XyYJCAonhBQf9c3eVv2xJ/fJ/852D8FRQCn64exKD3EiSfksavLk1E64nj+oUVqFB6k2aErzb7iuUznhRj4/EduoO4tbsSKCrHsnlVvlsAemfXrs0Ct3mXJEqjmHlPzgrqfbFdLkiiXTgXPB0SxGyA85cSp/3y5Nz3oLhU8lTdiqTbaR+/jk5pf0PRIcAHBi+a74RCysLkNjJBdQmJtm+fKhAgOLbCpyPV/jO1ULM3M/hb5pOSntTbZD53JFUOfUaqybE+0RSmHAR3eEpD1eVhiFuQ1Jtq9Ceucj58GjefZrqmJzg+DdwQDbWuFegaQhkIyh/x1WjhIXqskG1Mj//fuiChpLL3vCCHtdpv7QtvSs1OHVk8JTfxOJUo4GPUtCmdjSc/rCa0elm9wzPFNn/EfctYF5colGXBnVKVorGjg1CFU79w/dE2XqYjrNQUYGd97CvmUQwKtO8mfcvDr+6rG8Y3BmQCawWCOm16HEiSPIH5kOB8dydDlCxepwafVX7pnqTPK2iD7lz6apoPurTU9VNd3nOTcVs0katFWuqPJbJR3Lq6OXGY1G6Ps+HIObY2UwWLOjdBuynImeIVdzl+HN1mBmP/mD7+kPSRnaZSazYVgTV/H7/Z0xihojGUxly+csg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6560.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(5660300002)(66476007)(66556008)(66946007)(86362001)(7416002)(36756003)(8676002)(31686004)(4326008)(107886003)(2616005)(31696002)(186003)(38100700002)(6486002)(53546011)(508600001)(6916009)(26005)(6512007)(6666004)(54906003)(6506007)(316002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUFkMWx1NWpWZUVIMS9XcHhzbXk0UzgwWk92Z0tJbWNrSWNxSWFZYW80YTRT?=
 =?utf-8?B?dmIvQ2FhY0dSRGdqaUx5WXNKMXgvREllWFlsdWlTS1dmMVZYdlhwUzJkR29z?=
 =?utf-8?B?Y3lhZ3cvaW9KRVZ3SVRDdjVpeGVrUEdjakhpUXd4NWFhY1BOV1MxLzhEVEhK?=
 =?utf-8?B?MmdjcHM5aVRZdGdGWlFIQnNabTR5K2RYUkxhVWxrdElYRVp1Z3l2ZE90REVZ?=
 =?utf-8?B?Tm9hWm9BbkMxeUpBQmxlUmZya1ZrMG1EWjJjQk9sWDBQbjh2aHd4M3lpT08r?=
 =?utf-8?B?L3hLK3hCODFMWkxpMWFjdGVXNGpTcWY2aEE4Z3RScHFSZ0MzdzIwRTFQNkxG?=
 =?utf-8?B?UDVnbFdQdnZDd1l1YUNFQ0dJZWd2aXdBc2kzOWQ3R2I3YmhVQUtQZG5xUVhq?=
 =?utf-8?B?VzJaTjh3UStnclp4OWJCNjRVVHFpeTlDa3IyS1I3akxyRkM1OWZqaHdsZmMz?=
 =?utf-8?B?cnMzQlhYRWRJMDh3ZmVqMjdCWDV0Y0VsMDB6UVQ4R0dscnRndFEyaEFHZDVn?=
 =?utf-8?B?K1pJSFB1Rk1QOE5UaTRZTFZqTGR2eFdnTWkxRFJDejFDQVhFcXNXK2xQdVdK?=
 =?utf-8?B?YTgra3E0bFc2ODZmZEJFK2Ywd29MWGwxbk1qNEVKTklXM0ExVTFYbDNrUUhD?=
 =?utf-8?B?dGxrY3JLQlVaaGtKclRVNk93MjF0akhsVVJUVG5lSVA2VHR6SE96UnhVbWM2?=
 =?utf-8?B?QzQrUjROTnF5L2g1YlE4bDduU2FRb094OWZzMXVqS1dxRUpIT0lCRit3MmpO?=
 =?utf-8?B?ekhobmxPZkFSTDFPTHVMelFCZi9jSElFYm5oOURDeUNrV3QvbGYxYVFFYWtK?=
 =?utf-8?B?Y2Z0bGV0cDhLRitURHdRMnJ2dzRQaHI0ak1XM0xqRHA0YW00VXFsSXNmekt0?=
 =?utf-8?B?VDFPamEzOU9wWkRqVnM1OEl5SDlvL21VNDhjWXNLT255MHkzeGduaStHNXYr?=
 =?utf-8?B?bGlIbFROa3llK0NPdFNQUTRPOGN0VktsYWVBc01nbEZ2UkswcFBxTStUTThP?=
 =?utf-8?B?UmRBL01QT2RzbUdUaFIzQmpsZEhoQTlnaHhGWEs5WDNPZDVpVUdsTHhGb2Nl?=
 =?utf-8?B?bzAzOGk1dnBmK1VYUytJYkUxME9iWDRYVmE0L3pVNVI2bmVyRkFjVnlzVGoz?=
 =?utf-8?B?TUt6SU9nWFNXUU9UZUZJQWw3cnpmT0ZLWlp2NndxTWNYQ0ZWVlFwSGlwWmZs?=
 =?utf-8?B?RjBzNC95bW5qN2Y3STVBTEhoS0JqSjAvdzBqUVpYVWVJMi85dHNDL0pTVlhx?=
 =?utf-8?B?b1lBR0ZMWkRuOWtuNDFBdkw4ZWc0MjBLWW9FVmJHQmpmWG8wODIweHdjeVBL?=
 =?utf-8?B?V1FsR21mMC9yVXVwYm1mZUhlanNrYlFyMUlWWVIxdmM2S3ovY2hGOEpveTZo?=
 =?utf-8?B?enJOdFhFankzSit2MC8rMmRlYzZWUDlzZDVpMExGaG1UYnY4V2VLOHZWd1gx?=
 =?utf-8?B?WVRPY1FraFpmMHdNZzc0emZGMFY1SUYzblBaQUV4ODNCdk1Tcm54Ny9RVmFv?=
 =?utf-8?B?R2s5YlBDSnNRVzNaOGRta29lM0xBYUhuOWk1cU93OXM4anVKOTMxUVh4cjcw?=
 =?utf-8?B?UDh2ZGp3RWJlZXljSE5wU0ZRc0IvbVFDYlJCREkxV3hvcDREVXJ1bXFpMkpn?=
 =?utf-8?B?UVMxM1VmbVJwQk5mVnUrdzdQajBPU1lZK2dLNXhOUWZiWmdRWHhEanNFODlj?=
 =?utf-8?B?c0xjak53QVVWeU9xTExvSVExazNFd2pLK0pTTHpFTDg4b3ZjWHI2amF0TmlV?=
 =?utf-8?B?T3JSVWZibjZKSkMwMVdzcnRNWXJhK2p1eTRMT21ObVJkSEVLaE1ydTZPU3Jy?=
 =?utf-8?B?VHRFeWU0bmdNM0NXcHdKaTZzdzRVU3k1d1dOcytqbllrYXltVEZhVFpjZDBZ?=
 =?utf-8?B?ZGk4dmNsUlZHbmNhdWtmMHJzeWxBOE1hRDRxTU95YmxzNUNVWGt1TjBYeW5y?=
 =?utf-8?B?Qlh0QlR2RWxDYzhtUmM1TDc4aFI1NmlTcDN1bm9ybGJ3U0M5T3FmM0p6dzNY?=
 =?utf-8?B?amdKY0ZMeHMzS05kcUE3UEtka0FBR2xVd281ZFREVElWZXJjUCtiWFdxMDNZ?=
 =?utf-8?B?U3U1aXpvRTNGaUpESjRBZ2k4bytXc1dDS3VtOHFKaEdZS29RdnZMYVFEdHlr?=
 =?utf-8?B?bTNWdkRPU3o4c20zd0ZxZDNqMDViVnBOcGl6Zm1WcU1uL0pYTkhSR0p4S2d4?=
 =?utf-8?B?ak80V0o0QU9RVWZManc1UHNoQmliRW1PbkhubjFnWkdtWThreWNUQjdmN1ln?=
 =?utf-8?B?NDY1MHBSdzYxcEFyeFZpamxiblJNMWZiK0JPbkQ0N1cwMGI0K0doOFMrTWRR?=
 =?utf-8?B?QUVyWDg3cFdUVDVXcENrYXNBalN1ZHVTYTE2eTB5RXBUNUwxQXM4dz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b17af9dd-760c-4e04-7b8a-08da3a44db4e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 09:41:03.9918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hZqBG0s884oEYaKbJKP13sSNGGksMSgW1bpyv7CllHHZ04VAkyo9mTR42HhrePsGCDrfmB4ai/Ek1JXVwYC0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6515
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
Cc: Juergen Gross <jgross@suse.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, intel-gfx@lists.freedesktop.org,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, dri-devel@lists.freedesktop.org,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20.05.2022 10:30, Chuck Zmudzinski wrote:
> On 5/20/2022 2:59 AM, Chuck Zmudzinski wrote:
>> On 5/20/2022 2:05 AM, Jan Beulich wrote:
>>> On 20.05.2022 06:43, Chuck Zmudzinski wrote:
>>>> On 5/4/22 5:14 AM, Juergen Gross wrote:
>>>>> On 04.05.22 10:31, Jan Beulich wrote:
>>>>>> On 03.05.2022 15:22, Juergen Gross wrote:
>>>>>>
>>>>>> ... these uses there are several more. You say nothing on why 
>>>>>> those want
>>>>>> leaving unaltered. When preparing my earlier patch I did inspect them
>>>>>> and came to the conclusion that these all would also better 
>>>>>> observe the
>>>>>> adjusted behavior (or else I couldn't have left pat_enabled() as the
>>>>>> only predicate). In fact, as said in the description of my earlier 
>>>>>> patch, in
>>>>>> my debugging I did find the use in i915_gem_object_pin_map() to be 
>>>>>> the
>>>>>> problematic one, which you leave alone.
>>>>> Oh, I missed that one, sorry.
>>>> That is why your patch would not fix my Haswell unless
>>>> it also touches i915_gem_object_pin_map() in
>>>> drivers/gpu/drm/i915/gem/i915_gem_pages.c
>>>>
>>>>> I wanted to be rather defensive in my changes, but I agree at least 
>>>>> the
>>>>> case in arch_phys_wc_add() might want to be changed, too.
>>>> I think your approach needs to be more aggressive so it will fix
>>>> all the known false negatives introduced by bdd8b6c98239
>>>> such as the one in i915_gem_object_pin_map().
>>>>
>>>> I looked at Jan's approach and I think it would fix the issue
>>>> with my Haswell as long as I don't use the nopat option. I
>>>> really don't have a strong opinion on that question, but I
>>>> think the nopat option as a Linux kernel option, as opposed
>>>> to a hypervisor option, should only affect the kernel, and
>>>> if the hypervisor provides the pat feature, then the kernel
>>>> should not override that,
>>> Hmm, why would the kernel not be allowed to override that? Such
>>> an override would affect only the single domain where the
>>> kernel runs; other domains could take their own decisions.
>>>
>>> Also, for the sake of completeness: "nopat" used when running on
>>> bare metal has the same bad effect on system boot, so there
>>> pretty clearly is an error cleanup issue in the i915 driver. But
>>> that's orthogonal, and I expect the maintainers may not even care
>>> (but tell us "don't do that then").
> 
> Actually I just did a test with the last official Debian kernel
> build of Linux 5.16, that is, a kernel before bdd8b6c98239 was
> applied. In fact, the nopat option does *not* break the i915 driver
> in 5.16. That is, with the nopat option, the i915 driver loads
> normally on both the bare metal and on the Xen hypervisor.
> That means your presumption (and the presumption of
> the author of bdd8b6c98239) that the "nopat" option was
> being observed by the i915 driver is incorrect. Setting "nopat"
> had no effect on my system with Linux 5.16. So after doing these
> tests, I am against the aggressive approach of breaking the i915
> driver with the "nopat" option because prior to bdd8b6c98239,
> nopat did not break the i915 driver. Why break it now?

Because that's, in my understanding, is the purpose of "nopat"
(not breaking the driver of course - that's a driver bug -, but
having an effect on the driver).

Jan

