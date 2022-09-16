Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E5B5BACFF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 14:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB3A10E3FD;
	Fri, 16 Sep 2022 12:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8032310E3FD;
 Fri, 16 Sep 2022 12:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663330096; x=1694866096;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YXU1+LIqO6jGl1e2erDZ+5cx+w7NOnr0H1U7eaK3Erc=;
 b=S7EEWei7qCASfr4qb6cOPvLBrLrMD6swN3MDRg0mbo648Xok+SaqNKsM
 Eq2mydQCoNbPXr9yJ7VHtMx1e05TEmbJrw/FiFURWvlG8R+QQqSH3poEo
 XFn97EBDWTJubN8geXRjHWxRXzTnaDmifTR7UcpTqZycBX/vPVZgzD7GX
 7niLSD+VS4ouwNXQjNqBjUjKkSc6qF4i4YBKi6v9NqIsLRvdgJyTJXo/5
 j0MTrIf42UTC50WhN8kyiSK7J4qAUXpPjkhkQf2j1bYSle2c812PRbkcS
 8DEPzi8UKqmSC9+OgaDMCYXN/2ye+95WdofnqAsgWAsM/COswxuhq+WoQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="278706398"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="278706398"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 05:08:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="568809155"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 16 Sep 2022 05:08:15 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 05:08:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 05:08:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 16 Sep 2022 05:08:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 16 Sep 2022 05:08:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9SZDNvEB5o8D+PS+MPKK4F/M8pBEJwhLwQPwb8LhR3BxJQ5CS3fUPFy5KjAeXvQo9iMN7icj7nxdCUpuE7V7v1lJ5Dvfkx+gWTWCLeqZygWQj5DAcalqDi5nMcsNe88SsBhIFEF5HrQqkr3hCY2ojwXU5hzTXZ0L2gSAgwuEAmzZzORnyWcmi7YVWRMKre9WC5XjFzdyu97F0aCZ+GBi1iaHXN9WdxGV99SZRQYiDjmzNxBkSqh1bGroNf+9yqRUmfWUffTRvunYyG4YagWQ9ln6ugduGUAZasR1wuCvaIFxDpYb5epf6S6UeDUK8CkXjksbVwolfEzcOcyFswv+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oGYy7sLcZ+Ekkf/kY3lwBPI5IQDSEqwY7VH+NdZigU=;
 b=UN3SC2HJSNwf2vo3nt4j+itxWXlPtsnC9LtulDi6pbYzkiDw10McrS/uyTHI6cDk4YZvHDq5WnZPcvD1FJBa3cCcIaVQqML+U8qd66xAFGhk5wapHrifogAtyTzTYMQJxspm+drdq93K8DClgarZclzfY+wFq42RXPzlh+tA0VvfVId/WCwIT+rjz26+M5GBX2MZZMKgWGZtLwzM0dFr0VTap0B/BcDR7tut3xhMgIH77IwqTJgG1zvC71yYhXBuCVXgj7zMxbEGZ0wzXjt5DyWzyBa1U6HKF6ei2kYZYFyH9JhyefpzrGqJYLgXVyUpWTKuO/Oe9iFRcXtGlYP+tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by IA1PR11MB6490.namprd11.prod.outlook.com (2603:10b6:208:3a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Fri, 16 Sep
 2022 12:08:10 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae%7]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 12:08:10 +0000
Message-ID: <57e5ec2f-bd83-c8d0-829c-c0003bd8e9da@intel.com>
Date: Fri, 16 Sep 2022 15:07:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [Intel-gfx] [PATCH v3 2/2] drm/i915/gem: Really move
 i915_gem_context.link under ref protection
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220916092403.201355-1-janusz.krzysztofik@linux.intel.com>
 <20220916092403.201355-3-janusz.krzysztofik@linux.intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20220916092403.201355-3-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::8) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|IA1PR11MB6490:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a62717-ebb6-49da-d8b5-08da97dc1f3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a0oc5wKAsj7AEJf5pgKDgsmVITKIEW0SV4VDl6pOFnlqYHr75wDgOx2trfsVD4A5dm+AZTDJoROXG4zF4zM+s1lvMm8+v0wCE0elm76tKzb3a+AmKwYc7/3Ki4AkNc0aKPQCPlynnpA3OSJUD5Zk7CfTvO0nUI75SbrM7UCq8ZnH1Uuj17uSdOoCn6f/vROm+Ecj6iSNQEpNzrQ83FNwbPGIxV2+o0Fj8l+enRpW6wwLM2r4pJBLti6b76PS4ZXY0gNayTRFGMEdnjH57bL42cyW36KVaYZ7ogwr5KOkEwp/3MjGp4h1/OOF3VPbqEzGcrB69INBlmt/+2jrTYjwH9PjAQncjcVzpfg3bPoKctyG2L9zwdcgcdaV5RjkfHpbPnyNSFarwSlwhGiCFt0UMxxpdWU5x7guuyjEyr4Jk0OkMoW0CTLUjs8XATfZ508ptRVHqYoYzllMex9y3MzqG0IvJUSukKXLLMIbp6im8QPxoMGQ8xDh8WAch4Ym7HS8W+fQQqzF4gb8i2N5RIHBGztX9J5N7mByyn+sMaCpenq0awUBBPb3lwytC6sjYT22GjeFffdF2vgzBCSusS7zJvN2oVgyO5feMunRZoiaIdlrGwaO2WyvfnVio/ROgJInROWydCqzclZFwTnHVFTaSa9Q4BnRwMbupdhSfmRPZ3wruy+THWF3pUCLEJec8lxeFtU4QJI6LMYgJ9zDQl6jjwECBW/K7MKRW3jRgGRAVvxO9oVisy8STV+xO08kIgVX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199015)(6506007)(6666004)(82960400001)(53546011)(26005)(86362001)(41300700001)(66476007)(6486002)(45080400002)(8936002)(4326008)(38100700002)(66946007)(478600001)(83380400001)(36756003)(316002)(966005)(2616005)(8676002)(186003)(5660300002)(31686004)(54906003)(66556008)(31696002)(2906002)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHNzMzd6UW96Mk43bUt6NDRsYkZpV3lZWXdwUEsrUlFraldJaGdOV2tjZWFa?=
 =?utf-8?B?ZmVDVGM1WWhoeGhaVFVDNldrTzZJbnhjMXF5ZlFjNWdhdEFqenBoMWlrdjZM?=
 =?utf-8?B?eU9kL2hCcEQ1Ri9vd2xqUjI4bFkzci93RG9wVUFuWjhjWUpjWGpza3UxdjJs?=
 =?utf-8?B?dC82N0RKcHI3d0d0SlNUbzEveU9KQ2JjYkt1MFV6TVg2UzQwL0N5YlZITTJj?=
 =?utf-8?B?L0NYMUxVWGd3UFR4cXNYcExNcDZ4cFJYOGFZbC9OdVlpUkxWSzlkdnd3ekZt?=
 =?utf-8?B?VnE2VjYwV0hOdUJ6aUpGZ0FTT0Q5c3NPbG9PTld0V0U2SGFiaDZTWk42Q01J?=
 =?utf-8?B?NUFPK0xmZEczVTV1czNxYVYvK1dIR2M2V2NYZStRSWllcUV0S2tRUmgzTUFo?=
 =?utf-8?B?cjdiK0pMRVdQLzlNeXhKaGRpYnNMNmE2Qm5POW9vK0I5b1V0d3pqTE1LKy9s?=
 =?utf-8?B?NEVtM25helJmVnhsS3ExYmoweVdaK3hyaEJoQndhWHdtRUZaRnNnQjV0MXI5?=
 =?utf-8?B?V0JGVS9DY25wZ0M4dWU5NVluOUVlZzBQRUlFd2FsNkh0YjM1STNCM2hsL29p?=
 =?utf-8?B?eGhKUGtpbzIvbUVDblVuY1NOdndYNm5VYjRzd0pJaUd4L2UvVUxOQnFJSzYv?=
 =?utf-8?B?SEpwZEFYeWVqUDRsMEFOVkg4NS9QVlgxZU01QW5MQTJYcWdHNnlHV3lKVFcv?=
 =?utf-8?B?V0tiZE9YeVRqaXpmVU1nZGF4bkNoc08vUHE3aE5sOXUxZFJER2dxTk5VaUl5?=
 =?utf-8?B?LzRYV29IZVd6KzhMWHNLQTBBSUxIUG1ieTdSNkR6b0dNU1BrUGRNeEMreEFI?=
 =?utf-8?B?d1dsQytaWWxoeTBzOWoxQXEydXFpZ2dhY1p3ZzNqQmJvemlWYVVOL0JicDVQ?=
 =?utf-8?B?UThrRE9VUEM5eVZUQ3NxRTl4aFc1UWlqUlBKOE9ibGF6R2FhVVd4U0h1OXU2?=
 =?utf-8?B?dDFpOUMvSkJwTHJBaEduVlhHbmNtQkhGWFk4eUN5NWNxMWdXTzJ0T3JXcWpm?=
 =?utf-8?B?OFp4U1BwOU10Q0pnRUlPL1lIcGpNdGZITjdOa1dsQmpIWUpoUTA3cElFV3Ft?=
 =?utf-8?B?M3VubWpjSUJkZFVnanRxcXg5Wjl3Z29WMkhvT09jQ1RvNWsrWmY4Q01BR29m?=
 =?utf-8?B?disvcTRjdTNTQVAzQWxMZUVIbzNlZTNLWkp5VytDOGhZRks4SlFyU1p0QTFM?=
 =?utf-8?B?YkZBaDhyaFR4WmFBcmxuWVV1TFhWR0pLTUhEOWtrSS83WVFuZytGRG82d0Vs?=
 =?utf-8?B?bE91Sm16aUN1NkpTNWIyLzJxeThnRWYreDk1U2w4Z1hTT0dNZnNudzZDYTJE?=
 =?utf-8?B?SmNReHV0UElrT3JhUTlabkk3STVYdEhnR0VkQTZCTytnK1c0YVBrb280aFRX?=
 =?utf-8?B?UEtDakl0RENTSmRnbjRQbDFrRmxndzhueS9HcXpQWHlXMDBDR0hiMU5xczNV?=
 =?utf-8?B?VEZFWmNydlh4Z2FxTENaTU9sSnVUaDYxdTdzcGpmZWFrTjdxLzVFUVZhL0NF?=
 =?utf-8?B?aTFKeXVyRXRsQ0hLaWt5K3RQOGFUbjYyT1htZE1tYWxLNS8vRUVlYnB1azd6?=
 =?utf-8?B?NzQ3NG05VlFWQ1JOZEFBSlN1VkY1enhsQ2RWZWJkbStQd3ZIY0pGcG5QNHF0?=
 =?utf-8?B?V09reTZ5S3IzWVcvdHh5b3pJbktxcVFMTXMxUm85QnRwSWV6dlkvVDRSOGNt?=
 =?utf-8?B?VzNFY1g0Z2pkVDVQaS9sc25meEVFbW00MVhSSzltSGh2WmsxT3QrL2p5NzRw?=
 =?utf-8?B?SDlWQWI2SnBJY1FLTmZFT3RSZFpQYzJieTFGTzlQWmR4QWYrUXd1RmZYak11?=
 =?utf-8?B?b3VpV2pWQWdsb0Z6WUVoNG9Qd1RIU3U4TXp5ZGVGTnNWdjFoaG41ZjY4eEFJ?=
 =?utf-8?B?NEZQODUzNHhHQXJSSHA2enZlRlVIaHU1ZkhiVW9lRmF0aU1mU2FNOVpTR0pC?=
 =?utf-8?B?eWRWQmxCaUxRRUVvZHQxbGxtYUJ6QlhzanJDQ3dIZHZIQTdKQVpNWnNDUGNM?=
 =?utf-8?B?NjJtanpSckdxb2ExaUdTZzgrNm9temlrdnh3NThoTmczbnRMRkRSbklQNUJW?=
 =?utf-8?B?U0xjcThHUUhnaUwwQTdJWGpacVZxeTg4dlI0ZE12RXRPV0xtOTlybTlFVURL?=
 =?utf-8?B?T0htM3BjYWxzUnNvNE5Ra2ZrbXZkUlV2VFJvUCtTVDQ2UDA3SEE0RUNYZjNY?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a62717-ebb6-49da-d8b5-08da97dc1f3c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 12:08:10.3585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g67j3PvF7+XHuo7YLJqTZbb0SB83ogAadcPnrWvQz4ixflp6QWeDdnJTLFVeOJf8SPzXZF3yIQA4f/b2T4zf9OluJ9i6QFgBJ3K4YxpEebg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6490
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
Cc: dri-devel@lists.freedesktop.org, Chris
 Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 9/16/22 12:24 PM, Janusz Krzysztofik wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> i915_perf assumes that it can use the i915_gem_context reference to
> protect its i915->gem.contexts.list iteration. However, this requires
> that we do not remove the context from the list until after we drop the
> final reference and release the struct. If, as currently, we remove the
> context from the list during context_close(), the link.next pointer may
> be poisoned while we are holding the context reference and cause a GPF:
> 
> [ 4070.573157] i915 0000:00:02.0: [drm:i915_perf_open_ioctl [i915]] filtering on ctx_id=0x1fffff ctx_id_mask=0x1fffff
> [ 4070.574881] general protection fault, probably for non-canonical address 0xdead000000000100: 0000 [#1] PREEMPT SMP
> [ 4070.574897] CPU: 1 PID: 284392 Comm: amd_performance Tainted: G            E     5.17.9 #180
> [ 4070.574903] Hardware name: Intel Corporation NUC7i5BNK/NUC7i5BNB, BIOS BNKBL357.86A.0052.2017.0918.1346 09/18/2017
> [ 4070.574907] RIP: 0010:oa_configure_all_contexts.isra.0+0x222/0x350 [i915]
> [ 4070.574982] Code: 08 e8 32 6e 10 e1 4d 8b 6d 50 b8 ff ff ff ff 49 83 ed 50 f0 41 0f c1 04 24 83 f8 01 0f 84 e3 00 00 00 85 c0 0f 8e fa 00 00 00 <49> 8b 45 50 48 8d 70 b0 49 8d 45 50 48 39 44 24 10 0f 85 34 fe ff
> [ 4070.574990] RSP: 0018:ffffc90002077b78 EFLAGS: 00010202
> [ 4070.574995] RAX: 0000000000000002 RBX: 0000000000000002 RCX: 0000000000000000
> [ 4070.575000] RDX: 0000000000000001 RSI: ffffc90002077b20 RDI: ffff88810ddc7c68
> [ 4070.575004] RBP: 0000000000000001 R08: ffff888103242648 R09: fffffffffffffffc
> [ 4070.575008] R10: ffffffff82c50bc0 R11: 0000000000025c80 R12: ffff888101bf1860
> [ 4070.575012] R13: dead0000000000b0 R14: ffffc90002077c04 R15: ffff88810be5cabc
> [ 4070.575016] FS:  00007f1ed50c0780(0000) GS:ffff88885ec80000(0000) knlGS:0000000000000000
> [ 4070.575021] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 4070.575025] CR2: 00007f1ed5590280 CR3: 000000010ef6f005 CR4: 00000000003706e0
> [ 4070.575029] Call Trace:
> [ 4070.575033]  <TASK>
> [ 4070.575037]  lrc_configure_all_contexts+0x13e/0x150 [i915]
> [ 4070.575103]  gen8_enable_metric_set+0x4d/0x90 [i915]
> [ 4070.575164]  i915_perf_open_ioctl+0xbc0/0x1500 [i915]
> [ 4070.575224]  ? asm_common_interrupt+0x1e/0x40
> [ 4070.575232]  ? i915_oa_init_reg_state+0x110/0x110 [i915]
> [ 4070.575290]  drm_ioctl_kernel+0x85/0x110
> [ 4070.575296]  ? update_load_avg+0x5f/0x5e0
> [ 4070.575302]  drm_ioctl+0x1d3/0x370
> [ 4070.575307]  ? i915_oa_init_reg_state+0x110/0x110 [i915]
> [ 4070.575382]  ? gen8_gt_irq_handler+0x46/0x130 [i915]
> [ 4070.575445]  __x64_sys_ioctl+0x3c4/0x8d0
> [ 4070.575451]  ? __do_softirq+0xaa/0x1d2
> [ 4070.575456]  do_syscall_64+0x35/0x80
> [ 4070.575461]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [ 4070.575467] RIP: 0033:0x7f1ed5c10397
> [ 4070.575471] Code: 3c 1c e8 1c ff ff ff 85 c0 79 87 49 c7 c4 ff ff ff ff 5b 5d 4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a9 da 0d 00 f7 d8 64 89 01 48
> [ 4070.575478] RSP: 002b:00007ffd65c8d7a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [ 4070.575484] RAX: ffffffffffffffda RBX: 0000000000000006 RCX: 00007f1ed5c10397
> [ 4070.575488] RDX: 00007ffd65c8d7c0 RSI: 0000000040106476 RDI: 0000000000000006
> [ 4070.575492] RBP: 00005620972f9c60 R08: 000000000000000a R09: 0000000000000005
> [ 4070.575496] R10: 000000000000000d R11: 0000000000000246 R12: 000000000000000a
> [ 4070.575500] R13: 000000000000000d R14: 0000000000000000 R15: 00007ffd65c8d7c0
> [ 4070.575505]  </TASK>
> [ 4070.575507] Modules linked in: nls_ascii(E) nls_cp437(E) vfat(E) fat(E) i915(E) x86_pkg_temp_thermal(E) intel_powerclamp(E) crct10dif_pclmul(E) crc32_pclmul(E) crc32c_intel(E) aesni_intel(E) crypto_simd(E) intel_gtt(E) cryptd(E) ttm(E) rapl(E) intel_cstate(E) drm_kms_helper(E) cfbfillrect(E) syscopyarea(E) cfbimgblt(E) intel_uncore(E) sysfillrect(E) mei_me(E) sysimgblt(E) i2c_i801(E) fb_sys_fops(E) mei(E) intel_pch_thermal(E) i2c_smbus(E) cfbcopyarea(E) video(E) button(E) efivarfs(E) autofs4(E)
> [ 4070.575549] ---[ end trace 0000000000000000 ]---
> 
> v3: fix incorrect syntax of spin_lock() replacing spin_lock_irqsave()
> 
> v2: irqsave not required in a worker, neither conversion to irq safe
>      elsewhere (Tvrtko),
>    - perf: it's safe to call gen8_configure_context() even if context has
>      been closed, no need to check,
>    - drop unrelated cleanup (Andi, Tvrtko)
> 
> Reported-by: Mark Janes <mark.janes@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/intel/issues/6222
> References: a4e7ccdac38e ("drm/i915: Move context management under GEM")
> Fixes: f8246cf4d9a9 ("drm/i915/gem: Drop free_work for GEM contexts")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: <stable@vger.kernel.org> # v5.12+
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index dabdfe09f5e51..0bcde53c50c61 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1269,6 +1269,10 @@ static void i915_gem_context_release_work(struct work_struct *work)
>   	trace_i915_context_free(ctx);
>   	GEM_BUG_ON(!i915_gem_context_is_closed(ctx));
>   
> +	spin_lock(&ctx->i915->gem.contexts.lock);
> +	list_del(&ctx->link);
> +	spin_unlock(&ctx->i915->gem.contexts.lock);
> +
>   	if (ctx->syncobj)
>   		drm_syncobj_put(ctx->syncobj);
>   
> @@ -1521,10 +1525,6 @@ static void context_close(struct i915_gem_context *ctx)
>   
>   	ctx->file_priv = ERR_PTR(-EBADF);
>   
> -	spin_lock(&ctx->i915->gem.contexts.lock);
> -	list_del(&ctx->link);
> -	spin_unlock(&ctx->i915->gem.contexts.lock);
> -
>   	client = ctx->client;
>   	if (client) {
>   		spin_lock(&client->ctx_lock);
