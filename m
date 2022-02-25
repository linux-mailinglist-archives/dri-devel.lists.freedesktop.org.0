Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C2B4C3B87
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 03:17:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C263110E862;
	Fri, 25 Feb 2022 02:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1123210E860;
 Fri, 25 Feb 2022 02:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645755472; x=1677291472;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=69POMUciEPDt+0t4qOOyRRLqqCcw1R1qLulNMdM9R/w=;
 b=LDG6ZbPCFHe1+TOLJ8uqAui5DMVno2a07K0PolGRfUB18S4cQCmtFfBf
 6MSH2/SAr+4UpraVpe9BNZbGSWjJAjYl5FZvqvUKk/r8wd9/zqqWFrVwa
 l/qzk9cLmvlTY2OuU+38DTHmTUX1oE3qTmo3FMaT2i83iYgJ/ZOQulc5D
 y6xkW8XkeQrV6bntq9CS1YET2fExYNaa+s3c+h0Ys/OgqeJNeYQBDt5eR
 cBFRubwTr6dlkX+a8IL8c5HV4IEiBEsRriLPqU/fmHtmUQWjn15YJbG3h
 mlhoIzXyK3Iz4JJQBitHpxkGr+676ruP/MEY10ulhpW5HLTRt9FTFoKBC Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="239802867"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="239802867"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 18:17:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="707699469"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 24 Feb 2022 18:17:51 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 24 Feb 2022 18:17:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 24 Feb 2022 18:17:50 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 24 Feb 2022 18:17:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxjKnDblIubcl4k73Me2Rg8Jk2RH0sJPucW9hiHCdg4A9mHiSsMWJO4pLE576qCIFUBmXVwYHh4Dv61A99mvdg+KH9iDQoVQnstMZ6BFhPNJXPQzMAJuVi3U64z5CI1p4NF5N0w8zSb26sHx4Lz6yb0UhFmSINGJCGvkb6ZCKT+SFLZhpwq91QiQJ/nDRuLpVpbpMECTC7atQ1W+MnD9c3LaKaoxUNn5oh8IyC73L/JMgsnUxEKR5qVhXxqQkPZr6hva36zmC2clhy8KWzpkDYcMH5NOJ0ooq2KNoNXgcChcmbAza/t46g3Z5Hj8NsbQjcAQkBJo1uZqk0JBVWzzBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xU1/50mSIoVYuDbW6AIg/jTcZJuVn/3Kr4NOGtqeAf8=;
 b=PbHBINJRnyxOxLnXT6/ypvQB38jUQF66rTk3o4xbOYlompJV6oEG0wf3BWbHLWeeXwnw5TXN5KsRZputPew8ErLVWJrNHm2AWbkAgRapiGG6sPk73drANB/Fp0Nq0K9hmJi4VkhAfyCbuNRRXL2Hp298Seju8YWukXEt2lTINdwacgGSGWkJeRIgLf2TIRG83TRUyracKy06j4qTAMOYTQVRjN15WX6fJrAY0XvIZzIDDwSNF4rGyjshXfxKma9ef4uzczGbvsWV6KvE90GErv0PZ66ZIMHYvi3GBdHNcYizlrlv69Ohogm6alP2QZgBOOMXEvUVuGL5ypv34Nd2YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BN6PR11MB1636.namprd11.prod.outlook.com (2603:10b6:405:10::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.22; Fri, 25 Feb
 2022 02:17:46 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.022; Fri, 25 Feb 2022
 02:17:46 +0000
Message-ID: <621be0f6-63e3-a8fb-93e3-e581bf4b2d4b@intel.com>
Date: Thu, 24 Feb 2022 18:17:43 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v5 1/4] drm/i915/guc: Add fetch of hwconfig table
Content-Language: en-GB
To: Jordan Justen <jordan.l.justen@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>
References: <20220222103640.1006006-1-jordan.l.justen@intel.com>
 <20220222103640.1006006-2-jordan.l.justen@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220222103640.1006006-2-jordan.l.justen@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR21CA0039.namprd21.prod.outlook.com
 (2603:10b6:300:129::25) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b6e4fba-40f7-4b33-531f-08d9f805035b
X-MS-TrafficTypeDiagnostic: BN6PR11MB1636:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR11MB1636A4A511A9509F7963649CBD3E9@BN6PR11MB1636.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6miIPI3ApLyQUVxWYnnbtrOgrbsziaGsNczja/nqB9ZbbPkrj/AGskoFsso8MMdAPDdMt7mifBOdjtxzabFvVqNUglJFjX2pbtaMp8pTgj7drf64oHUuzKuv6Z6ubeEYkm+HWv9W9ATB0TSMzqbKQEt7rz4sJc2zHkYOVTp7HIBKD6qfEnCIKJ3O35P0YDGCUBo3vGtqvIlZxYvyxWy4+nmWAkciMn9HBiyLQKJGcuSlEAFMI7rn63FQKwPSAW/8wmNm2ANcHIviUa1Ncs8lHjXgTgrh8t2vyktcm+b+4b9kmNRyGdwHMc5jdVrFQdMQ7KUHGf1I/uxVG57Mfxa8FpjKxIZfpCviIkNeUBMNFPxBJHM7SDcilUjGIUeMn6Dz1xhlw5/imgbttvMuwPAXQ3jH8idrO8PzFWUq/4E5cZSiKDJilvEZ2Z+qePhCaG4kSYfBmlf1v0N5WVOVJZdDxc0QpLOdsNVzZy614BzhcTXFAFiI0qfjpoxSXtXqhFjgv3Zfiks3FuAau6T2Lhv8WDJrYy6Ovzw1QeRW/6V4nWhOSkF8za4H3nyH9UjGyCwNNjXRdV8ZnqabrSEqI41ldTXELWx6s+9K60eW/4Q4BrOy/kciS0Qq78j6RC/gxL2UratfnQSHNYsVLMHOEumN0TxVRGwlrSQJPuPk+lYUEV21yEyMepJoynb/iDvlI5U6WiDjpWQPq0tQJL+ayNFpuDJHJRAQoZy51GiVt5DvE1pLb02R9uefEsRB+AJQj51v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(6512007)(30864003)(83380400001)(82960400001)(110136005)(6506007)(31686004)(6486002)(54906003)(5660300002)(53546011)(508600001)(66556008)(8676002)(38100700002)(66476007)(66946007)(6666004)(186003)(26005)(450100002)(36756003)(31696002)(316002)(4326008)(107886003)(86362001)(2616005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm9nbWk4SWxqYnVzQ2lMQ0ZNMXd4dm5tT1Q4U3FXb2RoRThEUU9FREF6VGsx?=
 =?utf-8?B?bjA5Nzl5V3BOSEp4aUJlRGp5Q3ltUGxYek1IR0VoRHFFNTdHNVZGZ0NTQTl4?=
 =?utf-8?B?b0tKQ0NQeFNsWkc0NXM5MkgzcXNXcW90cWhGdXNoMDZwWGFNMEEvS0swYzNW?=
 =?utf-8?B?MmsyOGRzUXFyVU4vaG5NOUcwWU44Vi9mUUlXRTZwVDZvUEEvTXZrMVExSGFi?=
 =?utf-8?B?YkdUS1NWT1M1QXY3OGtZUnNZdHJmZytWRlk3YkIycTBVeFIyWXI2ekd3K09i?=
 =?utf-8?B?cjhpSG9vblE2bzAwOWo0dWUrejlxc1pBYnQ2d3FxUzI5MnJmY2V1ZGRPVlll?=
 =?utf-8?B?dXBITkhFcnpzdXQyZzNMZEJzNG45NzN0RE5QU1p3OHJDdnJOYXlMTDcvUXRU?=
 =?utf-8?B?WjF3bEo2L3NtaWdBWjNuYmhRUEw3M21sOE1KMFpWKzVNSFI2SDB1SFFjYlU4?=
 =?utf-8?B?VnB0UzN2bG5wK2xEZ1VlQnlvbVJqNS8vMDg4MjBjK2twVjAzdXkyVm5OU1JY?=
 =?utf-8?B?TUVBeUpSa2Nha0FOcHlxd3l2V1J1UUxYUTlzOVdoV3pab2lWdFBLYkFnUDBC?=
 =?utf-8?B?MVBlZjJJMjZsRFlLQmRpTGxtK1RhVGhxbVg5NE1RSzhMalFBY2RQTHF6am5a?=
 =?utf-8?B?VmxqeXVhaHdIczBMSVRrS0RpVkRYNlJEMHUrT0lBcVg4TlRRVlR0eHh4VEU2?=
 =?utf-8?B?eFh2SlNHOE03UForS1RSd0YyTzMzZk9JZUpGeEhMYmZTclJFUlJWRHdLWWg1?=
 =?utf-8?B?TU9NcDdwR1NnRW5ZKzdQSlhwNlkxeDFZRUM0R2FzazloRUc2a0krbElPNlpG?=
 =?utf-8?B?dTFWaWZLRGh3N2pGL2xrVFdxdktONWpFK1ZCMml2TmVKVVVpQTYzTEpVNlQv?=
 =?utf-8?B?MXY4U0VRdHh5QUFZUzFrbFFpc0kzT1RyL0lpZDFPSjRtcEYxYTdaeFZ0aG0w?=
 =?utf-8?B?WXFlWkkrRVE1MjZKRzd6M3ZzdGdJUXNicStSd0NETi8wQWlIdWp2Nlh4K0VN?=
 =?utf-8?B?MTQ5Y2N4SHFzMWpmVTVoY1Vzd25aTE1iK3VTS3g2Sks1WlZ3TnNNT2htZ1BE?=
 =?utf-8?B?NmpDaWZ1QmhNa2hyKzJpWVppWHV2MjVVUGNmU3JER1ZwRWdpb3BQN1M2NWdn?=
 =?utf-8?B?ZEo5eGFlbzlsYVMwNS9mLzFwK0FBNGpuRE5Jengrdm8vLzdxLzV6RE81cUpS?=
 =?utf-8?B?eWduQ3VhMUdQT1F2TnVSV1VZVjJ6bU9ucWxWVFRjN1VXR2tySGR6NDFMcTdt?=
 =?utf-8?B?N0N5ZHZNNjRJcmVxc3NHNzQ5UEVpRHJFUzJiR0xucTdqYWk1Tmtsb0ZOOXZ3?=
 =?utf-8?B?VC9pTnJmaG1pZkFnUlRNTjR5MER2YU1BTWdvWGlFMENqWWUyS0kvdmx1YXpy?=
 =?utf-8?B?VWdPUXZyRVk0UU5HajRGVkRzekNlM1ZsOXZ5RWRWb2QzN1VkTXpLejV3SnV2?=
 =?utf-8?B?cmJabkRuNUEzZVlkOFNQL1dGei8rbnNJLzNQYTVJQnpSVDgySTZ6d0tzYWdx?=
 =?utf-8?B?bU1pYzNtZUpaR1VTdUtZZGZXMVhFdHZDTkd6UExUdVlPL0tNVzMxWjhIaWho?=
 =?utf-8?B?VDdTdnFkZHZNbVJrODdhaEFpeDB1NkRPVU1JZHhSNDQrcVVFS1RxT241a3BV?=
 =?utf-8?B?MENWc3ovMjZhazF3OUlReEpFZ3hxWGwyMCtYR3BTNXlGMGlHREE0djZubTVy?=
 =?utf-8?B?SjAvZmN3eXJwOVNwWEorSzl1SGw4L1h6Y1BBd3dOVWc0M0U4WkVZaWJTRisr?=
 =?utf-8?B?VUZyWWwzZmY4eW1yanZSOGhxSjJJMVhDWHJKcEJsMlFFb3E1MHFMWTlrbHRp?=
 =?utf-8?B?cHpSUUdZYnRoRkNpN2Niczg2TVlDOTZSYjZXVUxCNlVRL3RyandTYzBoZmJE?=
 =?utf-8?B?cWtHZi83V0t0WUNYSEQyRktLcnNja29VOC9qYUFIZXRNS2QrMEJDTFBWL1B1?=
 =?utf-8?B?dDNBRnhVQmpNVEM3TkpZSStkNUhJQU5uM2E3a0lHTjZCa2h0dXFDSm0xYWl6?=
 =?utf-8?B?dXdrTk82N20xSm1ZUnpPTzVXeGQvbXpydXVDVWxQejJteFB0dHBqV2Q3QWVu?=
 =?utf-8?B?dFhPczF5cWZ1SDlCaUJSVFBKMFFVNUt3R0FwUTVwVklYZ1RJd0VCZFU4d25k?=
 =?utf-8?B?RnI1OGRzczk5Z1UzNklzOVpQWUwvdHNUK0NFVmUvSmJTdG94aWErUWxFam5X?=
 =?utf-8?B?dXdJZFVCbXQzZ2IrNTJ2OVBUVk5xZmxkVVk0TVBYOVdXRndIWkhWYmtqS1lO?=
 =?utf-8?Q?p59HNSV1spyPRMLI9cUPlOMJxrhJYinXIG+uxOROvE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6e4fba-40f7-4b33-531f-08d9f805035b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:17:46.6039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xfw/btAyXmKz/Tepbo3qjTEWHweqbAE06e4Zho69RDY3PuXpe3fqCWvW/kNcoyWsdz/WoBKIRAZRIqYsmiHO4dbCEuc6E+55O+4MaGC5Eu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1636
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
Cc: Matthew
 Brost <matthew.brost@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/22/2022 02:36, Jordan Justen wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Implement support for fetching the hardware description table from the
> GuC. The call is made twice - once without a destination buffer to
> query the size and then a second time to fill in the buffer.
>
> Note that the table is only available on ADL-P and later platforms.
>
> v5 (of Jordan's posting):
>   * Various changes made by Jordan and recommended by Michal
>     - Makefile ordering
>     - Adjust "struct intel_guc_hwconfig hwconfig" comment
>     - Set Copyright year to 2022 in intel_guc_hwconfig.c/.h
>     - Drop inline from hwconfig_to_guc()
>     - Replace hwconfig param with guc in __guc_action_get_hwconfig()
>     - Move zero size check into guc_hwconfig_discover_size()
>     - Change comment to say zero size offset/size is needed to get size
>     - Add has_guc_hwconfig to devinfo and drop has_table()
>     - Change drm_err to notice in __uc_init_hw() and use %pe
>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Acked-by: Jon Bloomfield <jon.bloomfield@intel.com>
> Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile                 |   1 +
>   .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
>   .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |   4 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   3 +
>   .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 145 ++++++++++++++++++
>   .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.h   |  19 +++
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   7 +
>   drivers/gpu/drm/i915/i915_pci.c               |   1 +
>   drivers/gpu/drm/i915/intel_device_info.h      |   1 +
>   9 files changed, 182 insertions(+)
>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index e9ce09620eb5..661f1afb51d7 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -188,6 +188,7 @@ i915-y += gt/uc/intel_uc.o \
>   	  gt/uc/intel_guc_ct.o \
>   	  gt/uc/intel_guc_debugfs.o \
>   	  gt/uc/intel_guc_fw.o \
> +	  gt/uc/intel_guc_hwconfig.o \
>   	  gt/uc/intel_guc_log.o \
>   	  gt/uc/intel_guc_log_debugfs.o \
>   	  gt/uc/intel_guc_rc.o \
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> index fe5d7d261797..4a61c819f32b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> @@ -137,6 +137,7 @@ enum intel_guc_action {
>   	INTEL_GUC_ACTION_ENGINE_FAILURE_NOTIFICATION = 0x1009,
>   	INTEL_GUC_ACTION_SETUP_PC_GUCRC = 0x3004,
>   	INTEL_GUC_ACTION_AUTHENTICATE_HUC = 0x4000,
> +	INTEL_GUC_ACTION_GET_HWCONFIG = 0x4100,
>   	INTEL_GUC_ACTION_REGISTER_CONTEXT = 0x4502,
>   	INTEL_GUC_ACTION_DEREGISTER_CONTEXT = 0x4503,
>   	INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
> index 488b6061ee89..f9e2a6aaef4a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
> @@ -8,6 +8,10 @@
>   
>   enum intel_guc_response_status {
>   	INTEL_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
> +	INTEL_GUC_RESPONSE_NOT_SUPPORTED = 0x20,
> +	INTEL_GUC_RESPONSE_NO_ATTRIBUTE_TABLE = 0x201,
> +	INTEL_GUC_RESPONSE_NO_DECRYPTION_KEY = 0x202,
> +	INTEL_GUC_RESPONSE_DECRYPTION_FAILED = 0x204,
>   	INTEL_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
>   };
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index f9240d4baa69..2058eb8c3d0c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -13,6 +13,7 @@
>   #include "intel_guc_fw.h"
>   #include "intel_guc_fwif.h"
>   #include "intel_guc_ct.h"
> +#include "intel_guc_hwconfig.h"
>   #include "intel_guc_log.h"
>   #include "intel_guc_reg.h"
>   #include "intel_guc_slpc_types.h"
> @@ -37,6 +38,8 @@ struct intel_guc {
>   	struct intel_guc_ct ct;
>   	/** @slpc: sub-structure containing SLPC related data and objects */
>   	struct intel_guc_slpc slpc;
> +	/** @hwconfig: data related to hardware configuration KLV blob */
> +	struct intel_guc_hwconfig hwconfig;
>   
>   	/** @sched_engine: Global engine used to submit requests to GuC */
>   	struct i915_sched_engine *sched_engine;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> new file mode 100644
> index 000000000000..ad289603460c
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#include "gt/intel_gt.h"
> +#include "i915_drv.h"
> +#include "i915_memcpy.h"
> +#include "intel_guc_hwconfig.h"
> +
> +static struct intel_guc *hwconfig_to_guc(struct intel_guc_hwconfig *hwconfig)
> +{
> +	return container_of(hwconfig, struct intel_guc, hwconfig);
> +}
> +
> +/*
> + * GuC has a blob containing hardware configuration information (HWConfig).
> + * This is formatted as a simple and flexible KLV (Key/Length/Value) table.
> + *
> + * For example, a minimal version could be:
> + *   enum device_attr {
> + *     ATTR_SOME_VALUE = 0,
> + *     ATTR_SOME_MASK  = 1,
> + *   };
> + *
> + *   static const u32 hwconfig[] = {
> + *     ATTR_SOME_VALUE,
> + *     1,		// Value Length in DWords
> + *     8,		// Value
> + *
> + *     ATTR_SOME_MASK,
> + *     3,
> + *     0x00FFFFFFFF, 0xFFFFFFFF, 0xFF000000,
> + *   };
> + *
> + * The attribute ids are defined in a hardware spec.
> + */
> +
> +static int __guc_action_get_hwconfig(struct intel_guc *guc,
> +				     u32 ggtt_offset, u32 ggtt_size)
> +{
> +	u32 action[] = {
> +		INTEL_GUC_ACTION_GET_HWCONFIG,
> +		ggtt_offset,
> +		0, /* upper 32 bits of address */
> +		ggtt_size,
> +	};
> +	int ret;
> +
> +	ret = intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
> +	if (ret == -ENXIO)
> +		return -ENOENT;
> +
> +	return ret;
> +}
> +
> +static int guc_hwconfig_discover_size(struct intel_guc_hwconfig *hwconfig)
> +{
> +	struct intel_guc *guc = hwconfig_to_guc(hwconfig);
> +	int ret;
> +
> +	/* Sending a query with zero offset and size will return the
> +	 * size of the blob.
> +	 */
> +	ret = __guc_action_get_hwconfig(guc, 0, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret == 0)
> +		return -EINVAL;
> +
> +	hwconfig->size = ret;
> +	return 0;
> +}
> +
> +static int guc_hwconfig_fill_buffer(struct intel_guc_hwconfig *hwconfig)
> +{
> +	struct intel_guc *guc = hwconfig_to_guc(hwconfig);
> +	struct i915_vma *vma;
> +	u32 ggtt_offset;
> +	void *vaddr;
> +	int ret;
> +
> +	GEM_BUG_ON(!hwconfig->size);
> +
> +	ret = intel_guc_allocate_and_map_vma(guc, hwconfig->size, &vma, &vaddr);
> +	if (ret)
> +		return ret;
> +
> +	ggtt_offset = intel_guc_ggtt_offset(guc, vma);
> +
> +	ret = __guc_action_get_hwconfig(guc, ggtt_offset, hwconfig->size);
> +	if (ret >= 0)
> +		memcpy(hwconfig->ptr, vaddr, hwconfig->size);
> +
> +	i915_vma_unpin_and_release(&vma, I915_VMA_RELEASE_MAP);
> +
> +	return ret;
> +}
> +
> +/**
> + * intel_guc_hwconfig_fini - Finalize the HWConfig
> + *
> + * Free up the memory allocation holding the table.
> + */
> +void intel_guc_hwconfig_fini(struct intel_guc_hwconfig *hwconfig)
> +{
> +	kfree(hwconfig->ptr);
> +	hwconfig->size = 0;
> +	hwconfig->ptr = NULL;
> +}
> +
> +/**
> + * intel_guc_hwconfig_init - Initialize the HWConfig
> + *
> + * Retrieve the HWConfig table from the GuC and save it away in a local memory
> + * allocation. It can then be queried on demand by other users later on.
> + */
> +int intel_guc_hwconfig_init(struct intel_guc_hwconfig *hwconfig)
> +{
> +	struct intel_guc *guc = hwconfig_to_guc(hwconfig);
> +	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
> +	int ret;
> +
> +	if (!INTEL_INFO(i915)->has_guc_hwconfig)
> +		return 0;
> +
> +	ret = guc_hwconfig_discover_size(hwconfig);
> +	if (ret)
> +		return ret;
> +
> +	hwconfig->ptr = kmalloc(hwconfig->size, GFP_KERNEL);
> +	if (!hwconfig->ptr) {
> +		hwconfig->size = 0;
> +		return -ENOMEM;
> +	}
> +
> +	ret = guc_hwconfig_fill_buffer(hwconfig);
> +	if (ret < 0) {
> +		intel_guc_hwconfig_fini(hwconfig);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h
> new file mode 100644
> index 000000000000..bfb90ae168dc
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#ifndef _INTEL_GUC_HWCONFIG_H_
> +#define _INTEL_GUC_HWCONFIG_H_
> +
> +#include <linux/types.h>
> +
> +struct intel_guc_hwconfig {
> +	u32 size;
> +	void *ptr;
> +};
> +
> +int intel_guc_hwconfig_init(struct intel_guc_hwconfig *hwconfig);
> +void intel_guc_hwconfig_fini(struct intel_guc_hwconfig *hwconfig);
> +
> +#endif /* _INTEL_GUC_HWCONFIG_H_ */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 09ed29df67bc..0cefa2a95190 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -489,6 +489,11 @@ static int __uc_init_hw(struct intel_uc *uc)
>   	if (ret)
>   		goto err_log_capture;
>   
> +	ret = intel_guc_hwconfig_init(&guc->hwconfig);
> +	if (ret)
> +		drm_notice(&i915->drm, "Failed to retrieve hwconfig table: %pe\n",
Why only drm_notice? As you are keen to point out, the UMDs won't work 
if the table is not available. All the failure paths in your own 
verification function are 'drm_err'. So why is it only a 'notice' if 
there is no table at all?

Note that this function is called as part of the reset path. The reset 
path is not allowed to allocate memory. The table is stored in a 
dynamically allocated object. Hence the IGT test failure. The table 
query has to be done elsewhere at driver init time only.

> +			   ERR_PTR(ret));
> +
>   	ret = guc_enable_communication(guc);
>   	if (ret)
>   		goto err_log_capture;
> @@ -562,6 +567,8 @@ static void __uc_fini_hw(struct intel_uc *uc)
>   	if (intel_uc_uses_guc_submission(uc))
>   		intel_guc_submission_disable(guc);
>   
> +	intel_guc_hwconfig_fini(&guc->hwconfig);
> +
>   	__uc_sanitize(uc);
>   }
>   
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 76e590fcb903..1d31e35a5154 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -990,6 +990,7 @@ static const struct intel_device_info adl_p_info = {
>   		BIT(RCS0) | BIT(BCS0) | BIT(VECS0) | BIT(VCS0) | BIT(VCS2),
>   	.ppgtt_size = 48,
>   	.dma_mask_size = 39,
> +	.has_guc_hwconfig = 1,
Who requested this change? It was previously done this way but the 
instruction was that i915_pci.c is for hardware features only but that 
this, as you seem extremely keen about pointing out at every 
opportunity, is a software feature.

John.


>   };
>   
>   #undef GEN
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index 3699b1c539ea..82d8d6bc30ff 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -133,6 +133,7 @@ enum intel_ppgtt_type {
>   	func(gpu_reset_clobbers_display); \
>   	func(has_reset_engine); \
>   	func(has_global_mocs); \
> +	func(has_guc_hwconfig); \
>   	func(has_gt_uc); \
>   	func(has_l3_dpf); \
>   	func(has_llc); \

