Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0963602E4C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 16:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACE010E24A;
	Tue, 18 Oct 2022 14:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80040.outbound.protection.outlook.com [40.107.8.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0834D10E24A;
 Tue, 18 Oct 2022 14:21:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZLCghwoaweAK6AiSWMlV1PYyKvXEvTfF/A9GBOG7NgM74RmQHspej6JaSusrPoGU99LX11K/e8JYCr6A0GRBMJu6sRAj36d1ZEx46NozLM2DD9AM1YhI7RHiN6T1lTMVea7O7dyejAShEsWeUOI2cot84kRg7VsH5XQq8tkt/mhQG9uKyIZ4Z2MME4kxBuIVkDji3it9q2nV2tAHz6UnfBEb+9LJZlEIWB4PeagICTwempdxZb1BEx/KcXxOrw8HoKbE8VJbDikFdd3KL/h9Xl+EMSHyZagQpqAAzBctvsHgNlKQgW0USA7mE9iZPTgYRE8OB1BoQtM6ZUUz2GtLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2K642ghudLTIsyxgMMLATLhX4zB9IF3MWcLYfmF8A8E=;
 b=Vo5Pyj5rNTm6RE99y92aUc1HNCk7nSbjsBURg0bYp5jWV0EkCv+cuppAghr6VVXBRpw7Vi16pjOyVsfp2iC2Z5RMRPP5Fm1MQvWpDf7Enz/XPq9LwkhJHX5pTwOyx3GbyFtc5/KJcyUew2hqRk+WdNDBUTkFCj74hw38EkoHh+AGOAKxzlfx8HoDwUJgft1gZdD+yecwk+n3bplhehsqr8xphtQ4SPT1559wd2aUILGy6qpV4IzaG0+qtlc6J3kG9E5ne9JYA0vxfYfIytmYyWTkrQLbHyYTDCTdwVvhA2e1DgTjL0lVzgbV0tUfYHpQI0CIxn22n3s/X3Zjar+lCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2K642ghudLTIsyxgMMLATLhX4zB9IF3MWcLYfmF8A8E=;
 b=UOEt5knMgkO2jWfNwUuXG81gW4S5BNB/EoGJDndKIzSf+v+1el3wCcLydBggBwrs6v1hk4kU066uGZFwInhtEY3bG8tMQ9nH8dDS3FqE2jysqpGwicvp0UeJxQboJnRyKRoYbl0GOYMUlWJz+aCKo0YRAUoNF9EY9+OaPhD4LfwsnaaA/PYJKPoDVPLe1DUPbVlf+TJLMBgwyo7PybuVb2HR0TY3XUpJ/m6cHfqgDXct8bbTO0dTDa5XxFOW11KEab84XcmLOHwD0TEDbQhonhpbvv1jQBL559Zs+3/MDrqCRJX3MYd5Zkk7uM4WAl3fGDahWYlwOLgroTAnpzZg9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8766.eurprd04.prod.outlook.com (2603:10a6:102:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 18 Oct
 2022 14:21:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 14:21:45 +0000
Message-ID: <d67ceabb-b31a-59e6-fc77-8d6c48b277f2@suse.com>
Date: Tue, 18 Oct 2022 16:21:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: i915 "GPU HANG", bisected to a2daa27c0c61 "swiotlb: simplify
 swiotlb_max_segment"
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20221018082413.GA25785@lst.de>
 <a5966644-72d7-4b25-83d1-9765d0593e44@suse.com>
 <20221018110243.GA4655@lst.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221018110243.GA4655@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0267.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::33) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d1f1b3e-e816-454f-bd6e-08dab1141640
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: unmDrL5qpfGQ7k1nYSMAelNn3VH1U1IrlamfrNq066vYzyEJTYLVHgmFfmj5vNozi2T+7PgQ6TMP9czFIm5xe6VjZIdKWyE4xLHiTOcexOcx9KUwihpOwPxJAzbxMagytdqJ/A9l1zDeJfsKw0W70mUGb2VYzESxrr638pRIu9dfATl+XOy698gfa1OyCjS9d65PKdKGhkCbbA68UohnTIssvh9fLdU07ug1MoILJ1/ksZyeY7dogEWJYeBZWYsThFutGrDc4E8cnksJTOZTAJCZ8ORJM1FCrHFpN1n2YB3FaGlao/aTTb7Mv0Gq4DRnsbUfjYDQwjcS38yF7YWPS98d/7B+P/wJPGk7zid4bAE2YyfyU6odexY9DWmUVCPJrfpyIheQuGZn8bZKQL7twwe76UCHiwwqu3vV2gkDWY3ka7YLjOak+fjZFVlb/02B/48q5aacPt6MP8cgXgXHcK2BJA+oj1TQx1M1+lx3kDdHGfLt//dzLg9gQH1/Paz7CjGPd8vvIBGZGDABvU5l57lLPibJ5Izp9G4iWrwEt0Ck3T2GhLX+ohDBN2h4/C1rYLss4x1F05bimvAqapGvjzNRORvtHVfX2SHUF/dDSjOFRRDNVPAxCWQv3Vagcz0YsadAUMB9IwSxHG2NQXX3mDvhlbng92HJS3/12DN4hoClpwS/PpgZ4EVbQ8Cr8LtetqveH2o/JSLkr/10c4LEOct1eyc57xhrSM7wqooKnNPFvGKWAbhnluks84rIil3BBifDYDV/iLWSVTMjGkzuLVITFqEaF/YiMQTgpjJxb54=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6560.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199015)(38100700002)(31686004)(478600001)(6486002)(186003)(2616005)(36756003)(6506007)(4326008)(54906003)(6916009)(316002)(66946007)(66556008)(5660300002)(8676002)(66476007)(6512007)(53546011)(2906002)(26005)(8936002)(86362001)(31696002)(41300700001)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c05BYmM0emt2a3ZsM09rZllhdWFQT3JEVURNaFhjU3g1Zmt6azQ2bzkzNTJi?=
 =?utf-8?B?dE9iN1RaWU9Kdm02QWtLZEdYdUdIckpIUkxjaWFKdmE0d0xJNk44Mkd5anBM?=
 =?utf-8?B?UE10Z2NNZjE4a2k4VlcwdG11bU9qcHZtSzYvRElvVnlQWVhPcWY2aDlYMHFn?=
 =?utf-8?B?WmxqajBsSlNLSWlNL1V0MTlFZjgrWGhpSkpLL0pXUkUweitlU21mTmhNV0Rh?=
 =?utf-8?B?SW41RzdxRThWY0ovWDd5U1Z0TVNoakgzeWlTdEpIdUJudXI4bVJScUlkUy85?=
 =?utf-8?B?UENNL1hjM3VQTFBMeGhsNXhpU2tYbWZaUU5LOEMxaGl5OVNxQnJ5SW1NRmpM?=
 =?utf-8?B?WEdBaDdRd3MzSkZUNFdHV3hEUmo4K3NhYWNURGNKblBSTnR6cXk1WDM4THBj?=
 =?utf-8?B?N0NJL3lValF2aXpIc1Q5MWhoc0h5TE9MT2xocmtIVk9WeTA4YUUwOThVYVZQ?=
 =?utf-8?B?aFZCYTZOL1JFVmhhVzF3UDV5QWd0QnJTOHZYRjkyUEZwbnlBQXgzUG83aXdF?=
 =?utf-8?B?dWJucGFybVBRUXhFNmxEeWxXWEgvY2xxV3NldGgrUUk5Z1VWeDNuV3ZWSUpI?=
 =?utf-8?B?cHhIL3FOYThZbm5BaGh4ampGcHY2MytGU2JwNjdIUUFkVjNoRUZIL1A5QUdm?=
 =?utf-8?B?NjA3bzI3d2ZoelFCRDVmSzMwT2JQRm1xWUlGcm9Ka3M4dDM0RWljZitwZHRq?=
 =?utf-8?B?N3N2UDJrcTI0WXc1NHEvNlQzTnBXNHh2UUxDL1ZXaFVDcHNhQzBVRVowU0I5?=
 =?utf-8?B?SXpabU41S0x5MGVHeEJJb2dsYnExYzVMKzVXSUNTL1BFMU16QUkwMFFaZUtR?=
 =?utf-8?B?enh4SlZEUUVGV25OREM5ZlA0R1R4TkJLSFhLdjRiVllMNyt1UDRoTDBXUzQx?=
 =?utf-8?B?empCWnJ4TEFsdHMyNVRQT2tzM3JUUldHRHRxN1RkWUFCNndrMVpOY3hLTHdJ?=
 =?utf-8?B?Z1RPMFdGOG02WmxlMUlNSXpYS0tFL3VqeklWcGJaaXhVbUhwcEtYK1ZQMWda?=
 =?utf-8?B?ekc1VWpMZGhRV09uNzVsKzRqRG0vMjBnUjdLdXFoSFNMNDhPM0k3Z2hsTHJs?=
 =?utf-8?B?dWs1SXozNGpGOXBoZXJYWjBCT2dPZVFnaEV0ektMNzJWVXIvTlg1cXdTeWVV?=
 =?utf-8?B?Qzl1a2J5a2lITVdVTDFLUmhDYmtFS2FCclQ3akZMWFZlelZObWpSSytzZ0wr?=
 =?utf-8?B?VHhMWTh5VEdBblVVb2t4bUFuUFZJNnVuRngxV2VYd0pCQ1V4YlFKTVoxcXcz?=
 =?utf-8?B?bXBUNDlOT2E1YTFPYURxZkdZK3pUalJFTXBvZVRBdzdFUXFWZnZRM1Axbjhz?=
 =?utf-8?B?Vk81VW9zU2FDWWZrMHp5OHdIL1VIT3ptSjFLaEZYMlVQUFp2U3g5UCswVmNC?=
 =?utf-8?B?KzV5eWZZYmwxYnVjdlZxbXVoY1hDS3kyZGgvanhoTUUyeldTREV4QkRGa2Z4?=
 =?utf-8?B?UG9zOXhhRVFEOVZnQ3o3Y0hCdDZsQytJbXVna1AvbmJZNWI3WmZ4Qk5kTWNz?=
 =?utf-8?B?OFFRSFpxN3ZLd0l2RzVrRU5JNk1Nbnd5Q0owZzl6U1A5Tzg0a2VSRTliaGhX?=
 =?utf-8?B?LzVuaWVZZVY2VXBDYjhyMXhDM2ppV0UwUGVPbjBRYlQ3Sm5wMnhSek1ITTN4?=
 =?utf-8?B?S3dmR2htMWdoWWpJMnlPdSs4T0pTU1lKK1JFZGxDTWFCZlFKclYyWFN2dWtO?=
 =?utf-8?B?ZVFpRS9vVEEyMm56ZVZhWnBTNkd5T3VzT2JmOXNlWjRNNkJ6dEhiNHdXVUVU?=
 =?utf-8?B?WndHRlUvM3VrMUpueldIOTc5djZLQUhkZVZNaC9IU05yM1ByWWNkTSs1Vzd3?=
 =?utf-8?B?NnZkcmdhSFRuZ0QvQnNwUElUdlVqL3E5TnZxSld2bkpHTHczYjFBRTZyVkNP?=
 =?utf-8?B?ME9IUjA5YjAxc201NXlsL28wMGZrNjVHV0VLU0pEazFyeDc4MGNnWUIxUEZ6?=
 =?utf-8?B?UGdnbUYvcU5HbGNKMVM5dGlKV1NvZjA0R1ZtSXdOeHNKaUZSYWJoTnFqZEc0?=
 =?utf-8?B?VDRsdGxUODIvRXVCQ2x2N096VHZseVJpVnBJRHowTE9zVHNobGtQT3luenAw?=
 =?utf-8?B?M0grTGtCVjhFU1JHUUdNaWxFVGhOME5Mb1ptVHNqb2ExUGVYdFFsZXNvekRY?=
 =?utf-8?Q?38sq0lqwKw0nx1z1/+AxME4KX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d1f1b3e-e816-454f-bd6e-08dab1141640
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 14:21:45.8712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQDXCbjgngb8SmPtVWGMTkn3COXtlu5GoVnxU4JsFR6YaRz/rbOaaN2KcRuHncuFSzrH9CzDbk9X6/FG020e1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8766
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
Cc: Juergen Gross <jgross@suse.com>, Robert Beckett <bob.beckett@collabora.com>,
 Stefano Stabellini <sstabellini@kernel.org>, regressions@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 intel-gfx@lists.freedesktop.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, iommu@lists.linux.dev,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 xen-devel@lists.xenproject.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.10.2022 13:02, Christoph Hellwig wrote:
> On Tue, Oct 18, 2022 at 10:57:37AM +0200, Jan Beulich wrote:
>> Shouldn't this then be xen_pv_domain() that you use here, and - if you
>> really want IS_ENABLED() in addition - CONFIG_XEN_PV?
> 
> I'll need help from people that understand Xen better than me what
> the exact conditions (and maybe also comments are).

Leaving the "i915 abuses" part aside (because I can't tell what exactly the
abuse is), but assuming that "can't cope with bounce buffering" means they
don't actually use the allocated buffers, I'd suggest this:

	/*
	 * For Xen PV guests pages aren't contiguous in DMA (machine) address
	 * space.  The DMA API takes care of that both in dma_alloc_* (by
	 * calling into the hypervisor to make the pages contiguous) and in
	 * dma_map_* (by bounce buffering).  But i915 abuses ignores the
	 * coherency aspects of the DMA API and thus can't cope with bounce
	 * buffering actually happening, so add a hack here to force small
	 * allocations and mappings when running in PV mode on Xen.
	 */
	if (IS_ENABLED(CONFIG_XEN_PV) && xen_pv_domain())
		max = PAGE_SIZE;

I've dropped the TDX related remark because I don't think it's meaningful
for PV guests. Otoh I've left the "abuses ignores" word sequence as is, no
matter that it reads odd to me. Plus, as hinted at before, I'm not
convinced the IS_ENABLED() use is actually necessary or warranted here.

Jan
