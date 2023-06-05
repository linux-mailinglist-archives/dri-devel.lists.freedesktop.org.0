Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ED7722D77
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 19:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F6B10E301;
	Mon,  5 Jun 2023 17:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDE810E300;
 Mon,  5 Jun 2023 17:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685985514; x=1717521514;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L9xiuatM7bzO9hLF5xcLEO7/5MaJhJrcEixwYW9FWok=;
 b=MiUdLHrksInW/Pr+Z7sOjlK4aKO58/5mEOoCO0Tkgtn8koFUxHiO4k28
 pNrvj3GGm2CJY9PmiC7XB16EnmYqig0PRH7tFfL3E/dQf4SQI9moFGOvj
 KwzWm7Y9g0T5KeiXeviSmHeQg6TWWTGVZUZhBznirKCFYE2SahnM7b50l
 ujFFNc2WWtBUT7JNycEjV5ialLHiwVP6Wkf7aPD+3Ef7pd/goZ7DUhMnv
 9bQfxdcv3vsAQgTVDwLYuyuaPeaaIBHew1nb04ZpkuR+teyLu/7qv9syD
 3Ud3wM+/YP3gi6Rw1MJMkeNSfDkuwpgfPvWz08+1Tb11xkDGQKhOT+36j g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="356434296"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="356434296"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 10:18:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="773810969"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="773810969"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 05 Jun 2023 10:18:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 10:18:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 10:18:31 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 10:18:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZL26NxkzUCHwZOCECWE/OEuOAzCC1Ws/UXTOrovHTb4Z3UEiQTLLtKBKvN2Ke6eJGaGY6IyOvQCi66WIh2Do8po1tLpSf7yvhe9UDltXxy/evBWfXEFI98iLUoQzPqkoPTWt+QYKLiNFDRH7KPsg+9ex4Cc1lTpSAvxjRK0PVEdaCdlonSwoTzvrezwVHI4cTx1kvCWOcCJyOaWuhjXgN4NZibvDgFWMdPWs4w0xc9HX7rh6pu77Cp/aozsw8s/zTvCLcvqXcZTEfn1H+i35kpGoULzJP7Zu0Jk7STVNL+psqPZyUqRJX5ySUKoXY3J+w1044J09b+2OFNd675Svfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KnrXfEOmDWn29+0+P7m+dECwa1n7FLVWMndASsz5XU=;
 b=QITHAEWejdbqO874Cfg/f6PWATJ6aTB16FaOY4zJjnYrK5p6epvUpvghYLpS9fvRPQPTVjOVGK31VDnDDLJuF9rCoqwdUAZwyEQOwVILLtg53xm6L3d/TaGDB8sgCGEblDx2eU3KbAdokQzsHqy84ajU9V9oAhqbSLNTNRetAWcKTvicFyb40wJzVbdf06LmbWvbuKahr8s+hvBzFcIbNTNx/96f0ttfTdaURqxyHRuuDJdP2WZ4uZDyMwo2VjuCnNWd/3kRb6ENlnM7sbLVtyjTQoP1tDSozcV3DdQiycYBxx+1Mm+w1ciNBblacKP11mvSnBQQ9NqwAGGqNUvmvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by SA3PR11MB7464.namprd11.prod.outlook.com (2603:10b6:806:31b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.28; Mon, 5 Jun
 2023 17:18:29 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::13aa:6fa9:70a7:4735]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::13aa:6fa9:70a7:4735%6]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 17:18:29 +0000
Message-ID: <4418f353-18c6-b74d-dc19-f6edc624cd52@intel.com>
Date: Mon, 5 Jun 2023 22:48:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [Intel-xe] [RFC 1/5] drm/netlink: Add netlink infrastructure
Content-Language: en-US
To: Tomer Tayar <ttayar@habana.ai>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
References: <20230526162016.428357-1-aravind.iddamsetty@intel.com>
 <20230526162016.428357-2-aravind.iddamsetty@intel.com>
 <98184112-ca7d-65c5-0b98-94abb418a2a5@habana.ai>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <98184112-ca7d-65c5-0b98-94abb418a2a5@habana.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::21) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|SA3PR11MB7464:EE_
X-MS-Office365-Filtering-Correlation-Id: a9ff0ce3-fae8-49aa-5d64-08db65e8e12a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9geQx/0H2UUROuQDUBUoctr4qauHUfNyYk/Xi8fenn3ZBVqJkoTmVF+k5PUKN42rkGA1HPpOWg1ChHPzjOY+fSWeECj93HpiPCHzYbz423IxVGUz/FshK4iCcad6i15+7rz+s+0jcYByPgjS11u8fg2CmMGJUeo0Ej8cU36PNs20WsYeE+NemUAEmYfk7jbv6ONpdSoGwZ+LXxpTOoI6d6fWsW0QFThShfuLq4LBu9KPbbISFpaIJtULPnruzhkO4B0eW5JSo5DI9X6MdpUHutdPL3L3/EEzCPEs9HHPANDjle/oNeHbIXp+1HU0f7IKY0t8cDO2goZxe4qDWmp4BVLW931orJC0+muxtdvg36F4SpvMcQ4LL2aq04m7LDyCfwlDRW8iy/5zma4n+8911+RPiqSnsG4jn72AuJ5j9V65PexDzbUdCOstIy7DCxGN/Z6SCaILJacjotzBh0BRa/lMN92QxY5eq9F1GQO9a3MDeh+E9JVKjqcGaZtGrjKHanNIzQhed3fxXifa72KzVVJxZ98/CLVweyFj9HwO6r9H0mpjsDPFJbkKbxibYh9Acb9yfEDvbXOCbNKq2xlooeZFKb+aJmDzz9ujJvVmDX73spIB/UT4uztpdbadVJQohOy3xL5HI2F6l+SgUTCODQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199021)(6506007)(186003)(26005)(6512007)(53546011)(2616005)(31686004)(66899021)(83380400001)(36756003)(6666004)(6486002)(2906002)(8676002)(8936002)(82960400001)(54906003)(110136005)(478600001)(38100700002)(5660300002)(31696002)(86362001)(4326008)(316002)(41300700001)(66556008)(66476007)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFVLdkRTUDA2ZTViYWtMYldRV1FOMy8rdEdFYklQSGk4WmREaTJ6S3pUcVdB?=
 =?utf-8?B?T0NRclVVemxyUzhldGgyMnNFQTdtVkZ3ZUNTZnF5bDRnNi9VL3dScmVZMk5l?=
 =?utf-8?B?UGIvTGJqTk1pcFBMaTU1VnhhbWFXRGttSjhOa0pwZHIvS2lCZWVSU2RNZmZQ?=
 =?utf-8?B?WW9PZ0FraGJYeXVad1RjWjdpY0pHVmkySWxCajU4ZkUxWlJTdjE0Y3ROWERm?=
 =?utf-8?B?WXMxaVdYMm5sZTROVStzbTBFL2JVbGh5L09TSzlMWU9Uck1SQmJtVTlYcHN0?=
 =?utf-8?B?S1h0dW84QnNXc0xEb2tIT3o0NGQ3RFcvVFRpWDVkaStnekZLSzRLMmdrYWNs?=
 =?utf-8?B?amVYY2FlRnRnN3FWTFpEa0VvVENObE9rTVB6R05hTTZMdllmdGk1ZU02ZHU5?=
 =?utf-8?B?SU5rKzNsQlROZUgvYThUd2k3TUNyTllHeTJkWUhDS0FMUDFTLzhTdG83Uzhz?=
 =?utf-8?B?RmxqMHNSeG11cDRZQm04UEhBZVQyZG1TMTNJdGJIdXp4WWdId0d4a3YvUW9J?=
 =?utf-8?B?YUd3WDhFUVVEVUhtVTJpMmNsMnB1TkppTW5LQ21pVHNOSGVyckZTWHBFYmRz?=
 =?utf-8?B?dFBiTWRSVkdGU2sveTFNMmdic2JPRDc5dnZOQldFbkVZY2l1VmdBSkREbmE3?=
 =?utf-8?B?TUR1a05CSGpOSit2cG5VSHFxRTRMNXlwMDNydGNoY3l4YWNWREU5K3laVmE4?=
 =?utf-8?B?YWFVQUJDMnpERlp0YVd6ZUhVcmFQVXpKeXFuQXNxVkNwY2RLSGovalMyZE1V?=
 =?utf-8?B?WHJLMkl3eXBndUZzM0JvdjM3am8vTmVvcnhNT05QN0NuL0lWUnZJOG85cks0?=
 =?utf-8?B?dmZ5b1ZyMUU3UmNzUFlMRDdaYnNMcXREd0pINlVmeWx0cEdWdFJqM0VGb0NM?=
 =?utf-8?B?clVBNW1KK0tyS0d1LzBPOUJ1aTVJTUR5bTFQa0haSkNpNmI5Vmo0RmVsa2Zv?=
 =?utf-8?B?NzhmS1dJeG5IUjJnM0Vvc2FhVUt2VFZrSjBseDlldDBidjFlenA3SzlkV1Yv?=
 =?utf-8?B?TXdhcUR2Z2ZMc2ZPWEtmWDFxaEdveXcrMkRRamxTU01YdEpDdk80MU5SMXNl?=
 =?utf-8?B?d09oT1dlZHIrdVpGMytzMWdnUVhydkNoZ041SDZkMnZnUnFUOVZMdTVPRTJp?=
 =?utf-8?B?dEY3cTFzaW5ROEM1MHlYZFdqSGdwVjI2RWs1czhLaEJRRERQbWdndGZLOHY3?=
 =?utf-8?B?ZXRaMHpVcHB5R0RpVjk1OThvWHRicnN0NVRGczJnNWIwR1cxOEppV1BVdTdH?=
 =?utf-8?B?b0hMamxXM1ZtaVBVeDc0bExpN2F3WjBLQUd1Vm1JNzdrTDlVOWdnWStkZk9T?=
 =?utf-8?B?QmZxRS8zcjJGRytnQVRwa3EyckxlSHNhY1FwMUhjZ1FxbzBNeGx6U0NESWx2?=
 =?utf-8?B?b0lsWFlSLzhQSlk2RDQ2QjhSWHRMdnB3ZlZJa3ZpaFV2aXVoaHZHMzgwUzZm?=
 =?utf-8?B?RXI1V3UxelNMNWowTHBMU2kva01JcThmbkp0aTluT0lMekRzb3o3WFIxOFdP?=
 =?utf-8?B?dnRsOVE5b1F1MVNCK3g3S0o4KzM1citubG91VU1qNjlPdDJhQWxlSElxeWYw?=
 =?utf-8?B?azkzcitqNCtvc3R6UUlwWlpOR0Q0QjUwSVRLTytHWjJSUjBTYi9FRzhWRXJL?=
 =?utf-8?B?YnY1MkpKY09TZkdlOHBYMmlnWHRCUVFtRlorL3NwZ3ptZmdGdkdZd083Q0ZV?=
 =?utf-8?B?UFN2ZGNVVThvUFVWOUxqeEordGdWa2hCdWJmV2xzNFQxaTZpSS8wck5xSUpF?=
 =?utf-8?B?eFJHMXoyNkFuQlBaVkxDK0JNek1NYVRqdnVTdnhWWjJoTE5wYWRXanhlWlRw?=
 =?utf-8?B?UllzcVdrWFZjeHBiZXRmRjQzTkUzNTVBLzRBREFGTUViSDNKM1dyNnlOeXBs?=
 =?utf-8?B?b2lvYkhzc0U1OHAvT3N2YVBDbDY2SXJlRG9LdFFqRlJZMTc1RXhzdlNvak9H?=
 =?utf-8?B?b01pSktiQmlrV0prSm9hcGxFaytnalU4Q21ldWMwNDl0S3Y4UU9HVUdIcVk2?=
 =?utf-8?B?emprTUZqbERYNUJFU1dFUVhNOVhqNEhybjNVQTNzbmVjbVN4aGwyK1BwdzRk?=
 =?utf-8?B?b0h6bDZ0OTlUYVJqRkhZM1g2dEorQTdlajBobXoxRUcwcE44R1EzTi9UdERR?=
 =?utf-8?B?SEdXRitiWG9nTndLMVRrQzJhZXJsVTNTRUg3dnJHQjRNaUNPYU5SaTV2cWJa?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ff0ce3-fae8-49aa-5d64-08db65e8e12a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 17:18:29.6077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GH9rGo8IG0UAY+q6Qks0KSvPG5fHQhiC/HRL5BNDF0rOjXcf6cRI1dzJ156KrOGFhLYh6qneYrw5Uf+v9c93Q/XQUII1etC1o/LRCx18gro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7464
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
Cc: "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04-06-2023 22:37, Tomer Tayar wrote:
> On 26/05/2023 19:20, Aravind Iddamsetty wrote:
>> Define the netlink commands and attributes that can be commonly used
>> across by drm drivers.
>>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> ---
>>   include/uapi/drm/drm_netlink.h | 68 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 68 insertions(+)
>>   create mode 100644 include/uapi/drm/drm_netlink.h
>>
>> diff --git a/include/uapi/drm/drm_netlink.h b/include/uapi/drm/drm_netlink.h
>> new file mode 100644
>> index 000000000000..28e7a334d0c7
>> --- /dev/null
>> +++ b/include/uapi/drm/drm_netlink.h
>> @@ -0,0 +1,68 @@
>> +/*
>> + * Copyright 2023 Intel Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice (including the next
>> + * paragraph) shall be included in all copies or substantial portions of the
>> + * Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +#ifndef _DRM_NETLINK_H_
>> +#define _DRM_NETLINK_H_
>> +
>> +#include <linux/netdevice.h>
>> +#include <net/genetlink.h>
>> +#include <net/sock.h>
> 
> This is a uapi header.
> Are all header files here available for user?

no they are not, I later came to know that we should not have any of
that user can't use so will split the header into 2.
> Also, should we add here "#if defined(__cplusplus) extern "C" { ..."?

ya will add that
> 
>> +
>> +#define DRM_GENL_VERSION 1
>> +
>> +enum error_cmds {
>> +	DRM_CMD_UNSPEC,
>> +	/* command to list all errors names with config-id */
>> +	DRM_CMD_QUERY,
>> +	/* command to get a counter for a specific error */
>> +	DRM_CMD_READ_ONE,
>> +	/* command to get counters of all errors */
>> +	DRM_CMD_READ_ALL,
>> +
>> +	__DRM_CMD_MAX,
>> +	DRM_CMD_MAX = __DRM_CMD_MAX - 1,
>> +};
>> +
>> +enum error_attr {
>> +	DRM_ATTR_UNSPEC,
>> +	DRM_ATTR_PAD = DRM_ATTR_UNSPEC,
>> +	DRM_ATTR_REQUEST, /* NLA_U8 */
>> +	DRM_ATTR_QUERY_REPLY, /*NLA_NESTED*/
> 
> Missing spaces in /*NLA_NESTED*/
> 
>> +	DRM_ATTR_ERROR_NAME, /* NLA_NUL_STRING */
>> +	DRM_ATTR_ERROR_ID, /* NLA_U64 */
>> +	DRM_ATTR_ERROR_VALUE, /* NLA_U64 */
>> +
>> +	__DRM_ATTR_MAX,
>> +	DRM_ATTR_MAX = __DRM_ATTR_MAX - 1,
>> +};
>> +
>> +/* attribute policies */
>> +static const struct nla_policy drm_attr_policy_query[DRM_ATTR_MAX + 1] = {
>> +	[DRM_ATTR_REQUEST] = { .type = NLA_U8 },
>> +};
> 
> Should these policies structures be in uapi?

so ya these will also likely move into a separate drm header as
userspace would define there own policy.
> 
>> +
>> +static const struct nla_policy drm_attr_policy_read_one[DRM_ATTR_MAX + 1] = {
>> +	[DRM_ATTR_ERROR_ID] = { .type = NLA_U64 },
>> +};
> 
> I might miss something here, but why it is not a single policy structure 
> with entries for DRM_ATTR_REQUEST and DRM_ATTR_ERROR_ID?

so each command can have it's own policy defined, i.e what attributes it
expects we could define only those, that way we can have a check as
well. So, in the present implementation DRM_CMD_QUERY and
DRM_CMD_READ_ALL expect only DRM_ATTR_REQUEST and while DRM_CMD_READ_ONE
expects only DRM_ATTR_ERROR_ID as part of the incoming message from user.

Thanks,
Aravind.
> 
> Thanks,
> Tomer
> 
>> +
>> +#endif
> 
> 
