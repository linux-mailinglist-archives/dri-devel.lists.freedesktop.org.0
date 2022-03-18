Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BB24DDA29
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 14:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBDA89CD5;
	Fri, 18 Mar 2022 13:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2ADE89BF6;
 Fri, 18 Mar 2022 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647608959; x=1679144959;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XMA0qYZdi4sxWJx8On4wfH9wQ1bJnbPrR+9xiFcPijg=;
 b=II0G97WMrt7hjGERJj13F/oH/G27ZM4tAGx7EQjvpxGkz5F3JEY1ABfQ
 zEJlPfXYBusMJOWnil79YHzLBnsF0vTaiTObviY5xIQ1p697SAMShnqGU
 lIIezV1Co0F8CkeVAUmwOHqFyJFhjyV//dsDeuYmL2wL0S6WZo/mtSkaW
 4PRmJbOvVRg8hnOYx8QLXXRqmBwoNoSBXpOGiNHpYJ7QGcpAzAfd0xQuG
 DzLSYJDpT4nm5tYkJIcEZqahd/7x2FYDxQfOa7gLjNWKmesLxdQ1m3clB
 aVA+EIX3Zm6YSpHpnFFjTiCKBwovwZ1dQs5WJnL92A3A5n5I8kEj8PEWe w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="320342247"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="320342247"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 06:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="541833991"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 18 Mar 2022 06:09:19 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 06:09:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 18 Mar 2022 06:09:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 18 Mar 2022 06:09:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqejGgt+mAcTJ7Ztt65knhovIQWXYGRR1wsBJ1lXSJIVQGSg0IREgCqBv+GPz6AV0HLpl+OcxqFCK5Kaq7GJUyD5DRbyHGH3Vr7KOBEPy3f/e26yzjYxgkB1nS0oz9+Od7kBut+hCJ+UhgHaC40MvddtrA7xrvL8sBdInq0gRA6CFQvI2CPE2wVbKG9U8pjdpWjSpkYfBW3TaHuhSpsmG44vo3cJDmUyRU02u42fQmgtaR0XBgch13QwVADOBIz/pxP1g4U0f/iaLdKXZE9Q9DeYOHnYY11oV+BUUYbsYM+McycC/iqk8SABn+BoJi9uJ482WY8IvjRdDEEzws++OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6u5wiQSfN03y8VDm+cHm+7BHTJR3kvLLBHPV2mZYWW4=;
 b=l4k0vlXq341qiRlBvxoKy+W6yLqIoNv5aP/ybVCopcnJRJdT1Vl39+rIwFCPXUGE1Ay4GHu7/Yap9frDCcEXZUE0dMF9fI+3KTSqsIFxvCPF9LtyKSGS5VoT6H9LeEgrYz2vIU8wgWeqLxHfADGil2n1uXDeQuL0FPQgSocx6Yfqvce9vi1NpBRa8hjh+93amJXedZBQaGlOVX5c463ECYfYbsPAmyUBQB6N7x4cm0s79nIjR1aT/D1dFiTIS8YTTKfCndJENw3JTe/ShRgBQc4C0pAIVhMN76Ckcc2xDAJhdKS6XrK15E8mVOwP7b4eguZ6IpmzSEqBmjFcQbqS6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 MWHPR1101MB2224.namprd11.prod.outlook.com (2603:10b6:301:52::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 18 Mar
 2022 13:09:16 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1de5:f9fb:2202:dd64]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1de5:f9fb:2202:dd64%3]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 13:09:16 +0000
Message-ID: <dcea5918-2504-a847-b457-b75bf1d4521a@intel.com>
Date: Fri, 18 Mar 2022 14:09:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH v6 7/7] drm/i915/gt: Adding new sysfs
 frequency attributes
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>
References: <20220318021046.40348-1-andi.shyti@linux.intel.com>
 <20220318021046.40348-8-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220318021046.40348-8-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0424.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::15) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4976b97-8b7b-4006-5ee2-08da08e0816a
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2224:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MWHPR1101MB2224E46F37DCCC6B76D635E4EB139@MWHPR1101MB2224.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PPerm1xsazQkxPIWSiT/sUHWimBJ9qdCLwQCMfjVC7kjEfhD7t4yFiEXOhGZb3+IgRFD2UVq2quXCJa9D5D6C8nSRcwDaPz+upCiF5CYQgBvus5sBLFP9MSiB1xnvYihkCMak3oNWtT9We7mnvR6wfdHwTAbAO+GCaUr7aWvAsTl1YReLMQ76VRsNhcBoXqt7Rt3L5D3NqS23IwtOH/FmRmqctFUz8dSxw4VlYq2dOcEUYFahCNoRGrlGoHzOy7hHSJ/spjzRonHkZ3Ggsn96BAAeKIg2QzSfSwBAMdeapmPfuON83lgj1vJDw8XBQgMvnmOsZwU45i1ok7vGnmsZkDuQ3NBW/SWo22C24nJxcqPTd2a9JTpEw9Dwtmwi2PLEdyub/WSrSA/r96Qe50RKKtd03vtBGAL/G8tNzMpxF0wZ3eP4fxvQNEYLYxgbQDhzMf6nAb6UHVYuW2A28agip7IfiQVbRjaQVMEPqrMLt5yvKheDFqujWlqUVZVyS5xxSKDlcmTie6YkRIj7sQnK3Lt1AL0oRGiacrKQDOEypPvhHwZlhzFzaZBFb1xjzcMWUL9ZnpFyXlvtz2EIzz9cyTe16p2TiPXNY/cAsBh+CrcpH+5Iql157+4O/Ccc5WUI2neJTk22A7mBT3wPx0pP/H1pNCaAAVnMVzIE3aSHnYkoaVCRhJBIiM71Q7rxlMGp4IadKGmbSdyNMnVqUFRuc1IM7xQPtZTel42PJigkx/wVLNc9r3PhoCqsh9T/8U7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(44832011)(4744005)(2906002)(53546011)(82960400001)(316002)(6506007)(86362001)(2616005)(6512007)(31696002)(5660300002)(38100700002)(6666004)(8676002)(4326008)(508600001)(66946007)(186003)(66476007)(66556008)(110136005)(6486002)(36756003)(31686004)(54906003)(36916002)(83380400001)(26005)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U01DN2JDMnZpeVVjQ0dKajJtZkpvWUMvY1NUZ08vaVpDTGI5U0ltT2d6cDJm?=
 =?utf-8?B?Zy9iSnE3eko0dnowVFg5NTZ6Y3RlY1YxRjBOdXZqanRxd20wSUNOUVc4NytP?=
 =?utf-8?B?L29WYWpIdGNaUkpoQzJLQnJWblpwUkV1MjRvVVVxR3BYbFdGUUpvNVZsckF3?=
 =?utf-8?B?MUZCU0J6UDBSdjBFNlA0ZFBibU5GMlBsOW0rdmhrM2pMRHN3TVVUY3BqWllT?=
 =?utf-8?B?citacDhjdEFzUmp2TXlBSk5wU2Nwb2RKYUVJdVVpaEsxaStNdCtiU0Z0bzBS?=
 =?utf-8?B?WC9NVks1MzBWTGRBMWYvSm12Y0pOdEFGeURMQWg5RUllUnBkOGVPS242b05Z?=
 =?utf-8?B?V2VqZ2UxQTd4SGJVQmh4UkJZdndaR1lRc21ZUE1mQ04zbEJwUGdOK09JL01m?=
 =?utf-8?B?Sm5LUUdVbVpSTzJrNTVFQ3pyTDBET1F1bzVoUHlwRVdBSTgyd2dJRC9lN1Bt?=
 =?utf-8?B?MXRDS2xxVmdEQ3hMMUk0UXExbWdyd0s2U243aVNhMENwWktGTERQMWVIVkFh?=
 =?utf-8?B?WlJ0eDJ5TTR4SWZvc3FXVzFMSDhmTXFZSEVEWUptYWYyVWM0ckREa1Y5eXRP?=
 =?utf-8?B?TXdZdVc0YVBLdFVJNlBjOHJUeCtrdXlGRm9IRml2bnEvZlVZWjcxaUcxc3Bn?=
 =?utf-8?B?RDZlNHVEMHNjcW9vbjFNMHJ0SXZ2Um10Yk5lYWRWSVFZUFdEcTBRZ0M5d0dW?=
 =?utf-8?B?anZzaW1Ld1RjRlh2NkRYSGJyWjZ3Zk02V2JMNFY5eU5xUEVoeXVkQ2NGOVhz?=
 =?utf-8?B?TXJ1VWQ1TVpRcGd5NExXdVRpcStlaktuNnkwbEwyRE9DWXgyTmdnZ1h2ZFh1?=
 =?utf-8?B?YjFrcjRqeWVSYUUzYmhjT0pXWGZkWVg3b1dEbVVNNHl5U3hzVzFrYXh1a1M4?=
 =?utf-8?B?aXJTbis4Y1JoSEJIWFF3UFJYSUdOSHdBdm5aS0tDK1Y2ZmpUWjlkODFxWHdM?=
 =?utf-8?B?SkdXaThEV1pWR3lEVHBLQVMxV1hRQ0ppbDh4WlFteEZURE85NHpkdlVPYVpK?=
 =?utf-8?B?RStBNjdpRnNLaVRSVk41NGcyOGptLzhpV2hSbkhpUmlkMkIyV3VjODY4VjJQ?=
 =?utf-8?B?bzk5bWptenhMdzNiR0dGa3BZeDNlSGVDSVpyTm5yRExkZlRYRUg3c3R3aFFt?=
 =?utf-8?B?b1R0M0hoZGxlSTgyWnFqbSt4TDdMZElibUIvdCtqaTJDZ2lFRkZZSlJqcUcw?=
 =?utf-8?B?YVU1YmJmbEFTdlNZL0dzOVZqTlNUVlRmdlhCSXhCeXpMYmhwakhvbWsrcFI5?=
 =?utf-8?B?d29xWEVvdUQzRTJIc0QvODNGQUZvZTdTdld6bFphaHY0amQ2VVFkdDk2SWZD?=
 =?utf-8?B?a2puZWcvOEhqdFlNRElkbzlRaUZ4bitlZURwbHZCSkZDVU1oWGU5Y1BtZ0cz?=
 =?utf-8?B?ck5UMGNhZG8ycml1OGd6OGhCVUVWWHhaeitPYlZRVVliYXNlVitDQWN3OVpB?=
 =?utf-8?B?dTBhSnJqYmhSRi9qTWhIVFNIWmhwWjd6RXBGa2NUTlVlSlZkR2Q0RU1vcUpI?=
 =?utf-8?B?bTdRQXJoS293M01oVDJjUXYwZGtzK2xQdHpaU3JqaVJhUitWR2crbUtIbTcx?=
 =?utf-8?B?M1F1djc3MG1DckdpSnExdFg1VmFubXlzT3h6QVB4cnBOWkdKWDI3SWdRdnRM?=
 =?utf-8?B?WFFXZWEzSlV0eUJWMFFLeEdqOFRhR3FWUUxpdEhDVTNYN1VjVmhJVmhJZm5v?=
 =?utf-8?B?QXRkbjZxZEVManZqeWZGcTl3REZVZ3hFYkVLOGlodWg0SW1HakJmcHdGb2ov?=
 =?utf-8?B?UGE5bXNyaFBFMWpRSW14citwbmJNcUZxUnd2cFBFbHNwOVA5YWlEZjJQdURZ?=
 =?utf-8?B?NnVCZnk2NkNWODVFYlVZS3Z6NWJqRldlWUd3c2JGTnl2ZktZZEc2UnZmTjBO?=
 =?utf-8?B?am03Y3ExeURYRGlHMFNsRHdEWWkwbWVWdnprMXZWTktXNktQZlozcHpZeVB1?=
 =?utf-8?B?dHBVZTdzY1BNbk9yajJITWVUa0Q3NHoxN01iV1lyMEdBZ2FZUXJXMGdvZmpj?=
 =?utf-8?B?RnQwam0zRDNRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4976b97-8b7b-4006-5ee2-08da08e0816a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 13:09:16.5774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WRoQeG1xHeJvabhqYK89Jekc7cWKtbtBTTuUtY/stanBD2FoshGjSkpCY+lTCUBalW+p1e6C5MclfBV86/8wig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2224
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.03.2022 03:10, Andi Shyti wrote:
> From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> 
> This patch adds the following new sysfs frequency attributes:
> 
> 	- punit_req_freq_mhz
> 	- throttle_reason_status
> 	- throttle_reason_pl1
> 	- throttle_reason_pl2
> 	- throttle_reason_pl4
> 	- throttle_reason_thermal
> 	- throttle_reason_prochot
> 	- throttle_reason_ratl
> 	- throttle_reason_vr_thermalert
> 	- throttle_reason_vr_tdc
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Cc: Dale B Stimson <dale.b.stimson@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
