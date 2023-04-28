Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3AE6F1384
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 10:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB23910E3AE;
	Fri, 28 Apr 2023 08:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DFC10E0CA;
 Fri, 28 Apr 2023 08:50:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJ9ZFJqm6T5wWFe5j6ELlHUMmWaT7fc7KyKz4AEaxfaMFFnsXwupN3PlLhES3bqZ1KYclEXzKB8X3xTrwzp8WYwx2mOiMzEOuOrr4Mq9upf7URZZb2hRxRqUeBT0jWU/WvUeMhGqu+tlUcNb59CS1+EGFKZ/BQMqKQI/N94yL1XnRnBQ7wPge4l82ABqSKKqEX8fykn8B/cZV8NTpBs4AEiUFyBgLSl+X7EWxnfuRFYIBr3JrIm7+HdsTl4cyupfs/Bl+Zf+kRRI2zPac8BKgWX+qcXcLk8BAHtEc8c7FZULs3gcjPKDJjXq8qH/4CP1zC17jh2q5keyBmOiv2jSXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxXceFf2kndtxGdhJFSF+Qp67KP2Ciq5k1LPkvyySBg=;
 b=fzj3gPKMnXflVzXObAD5RwiQrhSA/SBHL3xipfHBFjNlLQriWusgTI2kaNwNJkirbPMl+/K54IYbBP0AdaHbDFumtVhxzypZwqxwr7zihB58fVpOVNyISWEqoq3QqZESuSPAeQ4aC6nJO1RB0PkFlPTjLEaZNy0xdVzC0ZiaQY1lgxLgYBydCpm7S6SlTMJXQryN7bZF/fbxnu6uftJP3Es4nA7uBLBz4kwf4JUe6j54MrW9h0eBIu6Fu7Z9TwhiJdHFj+FyFUIO4zhEJeETYjCNsMsC8puYVhntBs2E4kWmXNgszT+2CgFf96z9ToF+jTb7uS2qvHDjXitRfKeevw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxXceFf2kndtxGdhJFSF+Qp67KP2Ciq5k1LPkvyySBg=;
 b=it5mrMvI5S479kb9OhbU4kVi6QDlrl6BfYnlrNqeOmSRQMYLM50+x8pACe9j9L8w1MZy7LlndxfV3QYX0VXpxOf86QjQzZeXAZlvy/sxYu6Rz2/eXjmYf8Ni/bLavSuLE3qN6/SCyoGk3dAL9C0aAdaLTvZNYvklLUIC1eWEg7c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY8PR12MB7193.namprd12.prod.outlook.com (2603:10b6:930:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 08:50:43 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6340.022; Fri, 28 Apr 2023
 08:50:43 +0000
Message-ID: <0be60cda-6b8b-5844-c4fe-b711e7279cc7@amd.com>
Date: Fri, 28 Apr 2023 10:50:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/9] drm/docs: Fix usage stats typos
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230427175340.1280952-1-robdclark@gmail.com>
 <20230427175340.1280952-2-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230427175340.1280952-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY8PR12MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: e6677d50-c33a-49bf-48d2-08db47c5a67c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CEfojVXSty3z+eVc896YzoC+/RjvOaqMuY+el8QrT6WclIkcUx8e/ZCCmN6beT7mDrhzAbhQRvjGWaLnqDh+G5FL8FXSA08iujBK7j4hRibDTjusRZUOyu8LqrLnrcxV6hJLEpo30qr/e11P1V7uRyTlgFqC1Q89DVZU/xmfv/sffXTXpDrPIKgtluGgbTZ/uQ2mlZnjSp4EvauxR+IbaGDlsWIjRBey76Bk/lbdelV6SDvHWX/wrIae/Z9sAwHKxIF8mugKOkXNJ/2VyxTHsXYA2HA0SUyI8cHlWkeMOpCTlwXRIwHoofRP8M79aEdVcjZ0RttlX/TFgiYq2rJq174nnXas7ZcH5lnAfMpy6s0NdjnxbJBMl0hRk/XlbVWLN21pa1OU5rIgFHnzwpGM2NXSdltvwtfKLsre5h32JEzPHUD7l6sKSKvEm5/vIzSkbeSSmKOAi99tUx/FFeN3k42/UQGA0g5u5RlmI3gj9k0XDUqijWGrzqph2e2yOs3ujQGbXl8pjjoh1ebv/yUMnLupDOYoko7OH9jAM7I8DAbI0msLxp4Opsj13kZ+/otw04gFRunnwAoKxaNEc9UkxG20yHtYz7URXHMCNuFRhVhrYRmCrYPa7Y8pcW2y3Cuq+RFJ5dbOu7HfVbqY32cjdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199021)(186003)(6512007)(6506007)(2616005)(83380400001)(31686004)(66556008)(66476007)(66946007)(41300700001)(38100700002)(316002)(5660300002)(4326008)(2906002)(7416002)(31696002)(86362001)(478600001)(54906003)(6666004)(66574015)(8936002)(8676002)(6486002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnFKczNGY0owOEliTTdVQzdwU1AxN2VQZ1l6Rm5Ga2hNcFRuTnR6MXVKUjIz?=
 =?utf-8?B?WWxSRnJUVVB1T01qcVRXSEZTLzR4NytDcStJUlUxakVQR1pQVk4zWWZWTmpm?=
 =?utf-8?B?ZG43dnh4akUrWlVGNS9pSWxBYk00KzZ3Z2h2elRlZG90eDRCQ3A4clNrMzRi?=
 =?utf-8?B?dEdaWFJoVEUxbFhocjlLTDN4VzU5MXd0V0tUbS85c0IwMXJqODdkL3lIT1Jl?=
 =?utf-8?B?VzFTdmxDbE9yTWxKV3c2Nnc3SkRxaS9OYmNpS2J2YlJwR3AvbnAvdHV0RXNL?=
 =?utf-8?B?bGlodjNwVy8wTG5CM2dVS1BXRGRPcm5GRFFOUWY5dEptTmx6SzZBc2x5eHpl?=
 =?utf-8?B?K3U5NkdyNlNrYVNvT09GbUV6aUlWdXgwRHJOKy9YZlZJWHMvTlU1VEI1Rkp3?=
 =?utf-8?B?d0UreTBZWmVXOFVxRUxpbWNRbzFUSWVhUWt2RjhPUGFEUFoxZnd2WG5JWWJL?=
 =?utf-8?B?MGpXdHh0OXZNQUwwL1M1b1ZBWXFqVDBCTDM2RlJqaUN6WDlIRzYxSFEzWVYv?=
 =?utf-8?B?bzkwQ0szVE5rUkpZN05zN3BnalRXcTc4S3kzWkFlVVFZOGp4L1lvS1NWUjRp?=
 =?utf-8?B?Q1RTd2ttWlFsKzRhSnpEWHUzZkZ0dWJuMHNXbzNYS21ISjRqbDBqdldKSWxJ?=
 =?utf-8?B?RmYzL0xkZFBEcTNoYW82OEI3TTBQOHN4VlNLY2xOOStkNEdaNDhkZWJsMk5x?=
 =?utf-8?B?UGR2dVJDcUZrN1p6VnFoeWc5cjB1TmZQbE56SUFqNUY5dFdrYlUxakZsL3Nq?=
 =?utf-8?B?T2FvUjZrcVpCaG9RdlBscy9Ud0VEZk5XUG9GcjlxUFM3Q2k4S3pTZDBzZ1M1?=
 =?utf-8?B?SW9VczlnWXZRcWdCbFoyekZNaWtYQmJGK3BjaitkZ21zM04zbkdXcmlvaGxi?=
 =?utf-8?B?OXFHZm5JamRFQ1hlRWlwT1g3WHFjZVE5RlVCdHhCYXAwWGYvcFRSVC8rTmpV?=
 =?utf-8?B?MlJmc2VuVTFwL1FVcXpJWkcyd0ZPVm5jbzNHS3NGK1BjZEg1d1RHbFJaTUc0?=
 =?utf-8?B?VU5ucmY2VE14dVE3NndFaXZlM1o5SHV4cVh4Z29QcmF1R0V3Yyt6RGw4UzR3?=
 =?utf-8?B?R2ttVllWNVRaYjF4WGtaVGk4bEovR09TZGN1NmxDRVpabldYUHdxalpJMVJ4?=
 =?utf-8?B?UlJOMkw2cVNDWTFuZ0cyODZsQXJTRWk4TmZmUDZwM0V3MWU1bkdybmp3dXJL?=
 =?utf-8?B?WFAwejQ5OTg2TzNoNEhRdnBGZno4aSs4RVlXeFNqcVlPb2FXN2RJdm9ibmZj?=
 =?utf-8?B?cEFXdTBYTG9JR2Y0M2NCRGZISVlPdHVpajRQVmVCVHNIS0lQbEoxU3hwaWla?=
 =?utf-8?B?akhUdGVsMTY5ZTJ2RmxHaVpnNzM2c3FTQ3dsVnNYelp2VlNwaWpRSDlCNHh1?=
 =?utf-8?B?NEoyQzNoOERHNGk0NWdqUS95QjNBYkFkeU1Ta1RCSitZdldFMHVwWDMzNHky?=
 =?utf-8?B?Vk51UWM2OGZuUWN5eWRxdFB3SEZuUHZpUVNJTUFqbkFiNjlpaU84MGlRU1JO?=
 =?utf-8?B?dXh6Q2wyRzRXenJNVDU2ckJraXpSaUwrbG1QMFFiMUxRY2dDZEZZS1F0MVBv?=
 =?utf-8?B?NjZtUHh0ZEpZY3BwSEdQeDhaNEhUUi8zQ2NjK29WTjhQcnYwTUtPMy9FbTJo?=
 =?utf-8?B?anIvbEFQOTFkM0NjRkoyN2p4bkc0RC9NRlpLRStaVGdiNzd2WVIzZnBzL0tE?=
 =?utf-8?B?RHRzL1pZYTMyU1dKTVZpZno3M01NL01uSlIrZFlsUzRvNzRadmlha3Z2TVFI?=
 =?utf-8?B?dWxMamc0d2hZR24rL0E0MnlCUlZqbFNwdENLQ1hvbWVkN2VVTTNwQzdTem1X?=
 =?utf-8?B?SzBSdEZ4bTFyZGo2bmVTQXdKRnN0RkR2ZXo5NzBvaFplcWdnNmdLUU1vOHNU?=
 =?utf-8?B?RUlxTGM5N2UyeFVZYTJCdkVtNXlUdWlkanFNZUl5Z1JCb0ZPS3ZaazZ1RFNn?=
 =?utf-8?B?UVBZRjF5U0pYVU1ZbFF2c3R2S3plMWxUSG5aeG9vOXZBaTd6Tk5ReGhSS0N2?=
 =?utf-8?B?T1NQNjlEUFdNbzI1SnIyV2JaQ0VqTUI3U1p1RTRMSkV1OUNwV242ejFVVkpW?=
 =?utf-8?B?ajhJS1JYS3E0bTJUaTR5N2FCL0ZCRWFBeUxwZTIzMEpxNDRuUXhKdjJ3OG11?=
 =?utf-8?B?M3JWQVlnc2VmQ1p2V3FhTmdCNU56TDRhSG9Vbk8yditHNEJ6RmRxV3FXVXRM?=
 =?utf-8?Q?NfI32KHSDouGapqmLQf71ouVD21RH2TpBdp9+O6h/5aM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6677d50-c33a-49bf-48d2-08db47c5a67c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 08:50:43.2146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fISLttXeNXDc6YOrbIj+Fs17VBnNErbadzFj7NHnLs450TO5+BbOQktDDDtQ4WUW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7193
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.04.23 um 19:53 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> Fix a couple missing ':'s.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Since this is a pretty clear fix I suggest to get this pushed to reduce 
the number of patches in the set.

Christian.

> ---
>   Documentation/gpu/drm-usage-stats.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index b46327356e80..72d069e5dacb 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -105,7 +105,7 @@ object belong to this client, in the respective memory region.
>   Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
>   indicating kibi- or mebi-bytes.
>   
> -- drm-cycles-<str> <uint>
> +- drm-cycles-<str>: <uint>
>   
>   Engine identifier string must be the same as the one specified in the
>   drm-engine-<str> tag and shall contain the number of busy cycles for the given
> @@ -117,7 +117,7 @@ larger value within a reasonable period. Upon observing a value lower than what
>   was previously read, userspace is expected to stay with that larger previous
>   value until a monotonic update is seen.
>   
> -- drm-maxfreq-<str> <uint> [Hz|MHz|KHz]
> +- drm-maxfreq-<str>: <uint> [Hz|MHz|KHz]
>   
>   Engine identifier string must be the same as the one specified in the
>   drm-engine-<str> tag and shall contain the maximum frequency for the given

