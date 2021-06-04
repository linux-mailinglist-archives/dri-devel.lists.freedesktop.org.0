Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A195C39BFE7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 20:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5D66F8A8;
	Fri,  4 Jun 2021 18:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0C66F8BE;
 Fri,  4 Jun 2021 18:51:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TM4zzJdxS2w1Nj+ML+OPCCW121f3ACGZXZjn06v93z+qk8NWHYY52Pw9kX2vpZuP/1hYPtTzcVhmyCYhBCA0Nd5yk/6B/fsufgfMEebT6lSwv6UBjOM1veDNy5VZLsBTx7+UUulkNEaly0oFOglVKOQhc6mJU4SH4znBW08VY2xeZ7thcqjEUTUUbJnnrvX/+3OZiSXYxRjf9G2dbLQMMCSR7AZM0EM7DY7Ep27cnmiLPeRODdY5NNEW06hICmOO4dmYyDGiVktU9vLmlqN14SH/nZv+P/FpFiLxL0P0InxDcaqoqipccXsutR9DqkIG6rcfmmtHHiZR8vdtv/kz/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Of/dZxRvVuqe9hEraaFc7pxjCEam2x9DcNAcFQG2nIQ=;
 b=VWZdtjZvIfxfLTefKiLC8TOW1d7ODHtCpauclGBbyoO8DmH6KQWMdeFhYQLxo3INqsOxPIptl9l+hGdjtlr71O2ZNLuQkDWhW51wiyVChpkQrq91ut0liiiJE87E/BXXJCmKRdLIRzPMRu9xCIY7u/UGWpS6HbcLzpJDL+SeJHLTLM7ViEc0Moda6hjNOqK6aH59Skn8MeGDP1HPJsmpE6jJ1phQw6OLR9qfP+kiWHfWlg2HejSb99VVIXtlEE7xbpTUTWPcu8vnT+4ReTcoZ+bPs2UrcdmmQVrYkySOngdQBfN+J1MGrfpmG1ejEqux0VLpb+xadTppuUm6rUBooA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Of/dZxRvVuqe9hEraaFc7pxjCEam2x9DcNAcFQG2nIQ=;
 b=AkmYLBRWrIy6iPH4uFp+FuzqP7aMLOBPDvvn3j5IcU71niPbUgvi3vIWxmasOOPkCvyB+ZMX6w7X40zpLJx4YjeYK2yk274JrjaAYzQ3VgiL4ikw5TpEa7dJcYOyLrTIzNeWtJB07kgwfNiinN7LVLhyK6Bnxkhs2Z/UDYBw1M0=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5441.namprd12.prod.outlook.com (2603:10b6:303:13b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Fri, 4 Jun
 2021 18:51:28 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f455:b0b4:439:2753]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f455:b0b4:439:2753%3]) with mapi id 15.20.4195.025; Fri, 4 Jun 2021
 18:51:28 +0000
Subject: Re: [PATCH 0/9] Enhance pipe color support for multi segmented luts
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210601104135.29020-1-uma.shankar@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <0909131c-1340-c93b-7b80-b661497ccf73@amd.com>
Date: Fri, 4 Jun 2021 14:51:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210601104135.29020-1-uma.shankar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [198.200.67.154]
X-ClientProxiedBy: YQXPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 YQXPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:14::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.26 via Frontend
 Transport; Fri, 4 Jun 2021 18:51:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aafd8817-4037-4966-987d-08d92789c2cd
X-MS-TrafficTypeDiagnostic: CO6PR12MB5441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB5441839E495D30988B59964A8C3B9@CO6PR12MB5441.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TNJYzdTc7RCjxET+sAn/6TjHw0AEoXuh2JuD8xnVOtEnQUeuZFMI9qbfjh4JVgXFM796MoPyIS2HOYJYsJgzxIy3k346Iv9GbtxD1wnLU64lUWRkcszJbf+/g5GCXpRhf4JbO3IVRyq3bAGTXihMhB8RKrxFTmxKkLQvrMYZrkM3aLR4oq/u0fCRY3ASOkb3estBFPmS4dUPsMcT2QEj1Ww7KVHAp8PJedfaQIu1UuNMABlVQCF3d4GOCaAeNChQHXLS9VBnd8ZJVNVKPNKouHVQZ4+ACENs46IOvNixWGjobLJRJk2Wwijz+K7sIkTweWu+oz+6fRn05s87qs0XnmPWH66ScG0P995t//ma15zi6aYmE3bA8vpsntVTc5b2y7Ygful1lyY4KyndUsRklvJuB55aOCujN/mkjFdoMGiKam/oGgZKHBdcruAPDUstjlaTnk/HYVJE6x1W8X3NLL8gf9dhEd9cXI6NiKnjccagBiwHxmjb01zE5hhOokYgU848LeTP1erlucL4yjvdmNjN5gDoWkXv4W0KL+WzMLOeYQiHSF8w1UXBYAZExUUz3pqWfMaDWbW7bVihYRhohAvQXJv8/uuZGHGazQCUSiUidlNQ1AM67CRAj/qSu1FFh+i5J336MpqGwY9M3z/DL7f0M4nUFcWblW1uZ5B+8zNyc9NhjYg/X26rM/fNgK+X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(366004)(376002)(39850400004)(31686004)(66556008)(66476007)(66946007)(16526019)(44832011)(8676002)(2616005)(86362001)(956004)(53546011)(36756003)(16576012)(316002)(186003)(26005)(31696002)(6486002)(8936002)(478600001)(2906002)(5660300002)(4326008)(83380400001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c1JuSlR5NUpPTHpSUzBsTEJ5RlpXUDd2ZzNyQk9RLzFRNVQraGFTWVJjSnlj?=
 =?utf-8?B?V1UxdTJsMnVycmdpWW5CRVlYdlozc0ppNUoyWGZQOVd5VEZWZjhNUTVNZzd3?=
 =?utf-8?B?WHZzeDhjVjRZb3l0VVlEU2ZZQlhTRUdzTDh6YXd5bjRJYUtQaEMzY042ak5n?=
 =?utf-8?B?b0s1Ry8vd1dZQk51aWl1a3BHam0rUDI3eWxxWXhyd3YwZXpzS0RNaFRxamFQ?=
 =?utf-8?B?YXpHR1pCazZ3QWZBenFOZXlUUVU1bVpIdVBLWUpZa3RKV2tpdkIwZkJEZktZ?=
 =?utf-8?B?Mll2NTVTNWdVQ1FkV3FFaDdLdlg5NFVGK3Q1NXhLZ2xHeXNSTnBLaWdBRXZo?=
 =?utf-8?B?eWtlWHQyRlVxWlVnVDNnVHdtNUNRU2ZWdStFZE9iN0V0MnptOEFRTis1ZmJI?=
 =?utf-8?B?ek9VS2VTU0tOaUg4d0htRGk0OEJDV1dWVTZXTVk1WWhjR2xzaGFRcHhwYkx0?=
 =?utf-8?B?WWNmVGFCRkdkNFhuUGhzZEQyRkpGR1Z6YW16aXJrZ2l6M1VYMFdCbmpvOWl0?=
 =?utf-8?B?VE5OWmxoV0IyQjMxWGR6QWVYQ25wVFM4YUdoVjBVb2VkeHp2WmpQQ0Z0TmZp?=
 =?utf-8?B?OFVnU3pXUUQ5Y3JUTjRDV0VrZkI1OHhjdEt0REExK3BqcERpWmhKb2RhUGow?=
 =?utf-8?B?emErUGxTZmRxYVlHdnRwTG5QN2pBaERkTzVNNFhXQnRhZWFGZnMxb0RKc3M1?=
 =?utf-8?B?ZnBYeXNUeWRkeWxPb1d2RkZ1WHhiek0zOXQrTWJ1YXUrek9uUC93VGtLeXkv?=
 =?utf-8?B?bEQ3Ti9FSkNxL0dmSXpKMU9HVjZuYkNTY2k3dTRwalRaYjdMMzlNSUkzSUY5?=
 =?utf-8?B?Ti91Z1NRenNWVXlSaFdkMVBxZEcrSytMMGdkZ0s0WEFCUzR4bWJpVzZGMjU2?=
 =?utf-8?B?L0lkK0Q3bGFmckFpTjh2ekt0R1g5MHcxd2llZEFTN0t1Q0lyVUtSV0xyYndY?=
 =?utf-8?B?VmQ3azc2N3JheUF6NXJiM1dLSWJ1ZWhKMmlXSXZLZGp5c3dQdi94NHpiUXEr?=
 =?utf-8?B?Y1RrODNOOWVGSVdBblZpcWIxV3VKdVQrekx0TDJLZlJ0OWtOTDY3RDVTbkUz?=
 =?utf-8?B?YytuM0xBK3pNM2p5UGNFRm1ra3ZpSWs4SE1uM2dSalRYR3FCMWZMd1I3aWc2?=
 =?utf-8?B?NThWYjVNcFNDSWFCeTdRcE9QVE1qWFdsUXRUUm16Rmd0SjRHRk9hcndEUmhl?=
 =?utf-8?B?N0lzSjJHMW1NaFVPUjdhRVdMeG1IS056a3hFTVBoeDZkT1NDbUlLaFdzZWx3?=
 =?utf-8?B?L0ErdWxtTmRrUDhKRlpCUkpVNEZnQktYRWVPN3BROGF0cnppdkVtUDVHMGJa?=
 =?utf-8?B?MkpOQWNzQ3ZPM1l4SHk1VThvRGFrZlFkMm54Mmp6ZzhBSE9LdGU1MTQzSWhj?=
 =?utf-8?B?TldxTFpodnlaN1MxdEYyaHZJaDdiSnFHT3BZZU14ZUJydEJ6UHRQb21VL2pK?=
 =?utf-8?B?NDhqUDdGMXZFcjZoMmdEcHpRSW54Y2I3VDd3d1JRQmIxZ0VaNm5oYnExN0p2?=
 =?utf-8?B?Qmx1Ni9Ya0cvemZkNklMU2NMYXlWTmsvTGZXa0MwUDlVbzJ1SjVwbmJ1SExm?=
 =?utf-8?B?WmhTdzk2eDF3cGozODVmZFBpVUQrbjVSVDVRNll2STdndkhrcHl1Tk42VGFK?=
 =?utf-8?B?MnU2OHJQTWprVFpIb29yZy9HcG9EaCtxMlRQR0lRRndPeGJTTzljTnFWVjgr?=
 =?utf-8?B?VThPTHl2Vi9MbWFLaDdBUkEzMDAxc1lSZmhNdmVnZko2UmNpLzAwQ2ZvU0ZE?=
 =?utf-8?Q?e4vOe9HpUV4P5eoKNldljt4JJR2Pfp8SfIWAUu7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aafd8817-4037-4966-987d-08d92789c2cd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 18:51:28.3455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KcrhkEAzHPtYvmT2Epey0jKh2TFAV00FruRVpkIw4bu+J7uvhaGw47Gwfc/71cmeCfgQzrwIOq5C+uuOmKoWEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5441
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
Cc: bhanuprakash.modem@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-01 6:41 a.m., Uma Shankar wrote:
> Modern hardwares have multi segmented lut approach to prioritize
> the darker regions of the spectrum. This series introduces a new
> UAPI to define the lut ranges supported by the respective hardware.
> 
> This also enables Pipe Color Management Support for Intel's XE_LPD hw.
> Enable Support for Pipe Degamma with the increased lut samples
> supported by hardware. This also adds support for newly introduced
> Logarithmic Gamma for XE_LPD. Also added the gamma readout support.
> 
> The Logarithmic gamma implementation on XE_LPD is non linear and adds 25
> segments with non linear lut samples in each segment. The expectation
> is userspace will create the luts as per this distribution and pass
> the final samples to driver to be programmed in hardware.
> 

Is this design targetting Intel XE_LPD HW in particular or is it intended
to be generic?

If this is intended to be generic I think it would benefit from a lot more
documentation. At this point it's difficult for me to see how to adapt this
to AMD HW. It would take me a while to be comfortable to make a call on whether
we can use it or not. And what about other vendors?

I think we need to be cautious in directly exposing HW functionality through
UAPI. The CM parts of AMD HW seem to be changing in some way each generation
and it looks like the same is true for Intel. The trouble we have with adapting
the old gamma/degamma properties to modern HW is some indication to me that
this approach is somewhat problematic.

It would be useful to understand and document the specific use-cases we want to
provide to userspace implementers with this functionality. Do we want to support
modern transfer functions such as PQ or HLG? If so, it might be beneficial to
have an API to explicitly specify that, and then use LUT tables in drivers that
are optimized for the implementing HW. Or is the use case tone mapping? If so,
would a parametric definition of tone mapping be easier to manage?

> +-----+------------------------------+
> | x   |  2 pow x segment|No of Entries
> |     |  0              | 1          |
> | 0   |  1              | 1          |
> | 1   |  2              | 2          |
> | 2   |  4              | 2          |
> | 3   |  8              | 2          |
> | 4   |  16             | 2          |
> | 5   |  32             | 4          |
> | 6   |  64             | 4          |
> | 7   |  128            | 4          |
> | 8   |  256            | 8          |
> | 9   |  512            | 8          |
> | 10  |  1024           | 8          |
> | 11  |  2048           | 16         |
> | 12  |  4096           | 16         |
> | 13  |  8192           | 16         |
> | 14  |  16384          | 32         |
> | 15  |  32768          | 32         |
> | 16  |  65536          | 64         |
> | 17  |  131072         | 64         |
> | 18  |  262144         | 64         |
> | 19  |  524288         | 32         |
> | 20  |  1048576        | 32         |
> | 21  |  2097152        | 32         |
> | 22  |  4194304        | 32         |
> | 23  |  8388608        | 32         |
> | 24  |  16777216       | 1          |
> |     | Total Entries   | 511        |
>  -----+-----------------+------------+
> 
> Credits: Special mention and credits to Ville Syrjala for coming up
> with a design for this feature and inputs. This series is based on
> his original design.
> 
> Note: Userspace support for this new UAPI will be done on Chrome and
> plan is to get this supported on mutter as well. We will notify the
> list once we have that ready for review.
> 

Is this an RFC? If so it would be good to mark it as such.

Harry

> Uma Shankar (9):
>   drm: Add gamma mode property
>   drm/i915/xelpd: Define color lut range structure
>   drm/i915/xelpd: Add support for Logarithmic gamma mode
>   drm/i915/xelpd: Attach gamma mode property
>   drm: Add Client Cap for advance gamma mode
>   drm/i915/xelpd: logarithmic gamma enabled only with advance gamma mode
>   drm/i915/xelpd: Enable Pipe Degamma
>   drm/i915/xelpd: Add Pipe Color Lut caps to platform config
>   drm/i915/xelpd: Enable XE_LPD Gamma Lut readout
> 
>  drivers/gpu/drm/drm_atomic_uapi.c          |   8 +
>  drivers/gpu/drm/drm_color_mgmt.c           |  75 ++++
>  drivers/gpu/drm/drm_ioctl.c                |   5 +
>  drivers/gpu/drm/i915/display/intel_color.c | 454 ++++++++++++++++++++-
>  drivers/gpu/drm/i915/i915_pci.c            |   3 +-
>  drivers/gpu/drm/i915/i915_reg.h            |   7 +
>  include/drm/drm_atomic.h                   |   1 +
>  include/drm/drm_color_mgmt.h               |   8 +
>  include/drm/drm_crtc.h                     |  25 ++
>  include/drm/drm_file.h                     |   8 +
>  include/uapi/drm/drm.h                     |   8 +
>  include/uapi/drm/drm_mode.h                |  43 ++
>  12 files changed, 630 insertions(+), 15 deletions(-)
> 

