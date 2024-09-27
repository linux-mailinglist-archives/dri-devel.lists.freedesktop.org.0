Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7596988736
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 16:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039AD10EC80;
	Fri, 27 Sep 2024 14:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c6IOD6E8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9E310EC82;
 Fri, 27 Sep 2024 14:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727447769; x=1758983769;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+MOLFSiYjZsUhdChu6i3KQMH0AkFHGPbMGhNEsWmCM8=;
 b=c6IOD6E8ws0m8MuR0AnZ8pvUomTBDPc5VBJT0H0aDcTcCQ8f0aUtiuFA
 09jUUKIH0TW3MOYcdLCD6vpDBBwYRO7d7FYrQySF0EGecYARwAaACkgQU
 DYdP5FARcFsywJ6ryNxm+w3xK7VRFyyK/wzrpH+i65qwT5E9x3gCMMstN
 E6/nVS8/Iz+cIl5Bbi6qTD+v3XDz4JEyTPl+i+jF29eCNO8NDApoq8SEa
 k9FTS4zaXLh8uPOzDF8GrOBZHnFk+NGGyga/ahYCFfXf7LRR/s5lqriLx
 w51C4TT8EPU8I3bKa4dAb0Hyl4Jd/ZqzADdSiGObqIKYfd+n9EfnQVIEN A==;
X-CSE-ConnectionGUID: eI1GioaDRDKSvCZZs0Jkuw==
X-CSE-MsgGUID: vs7gRdIfQvySw4e9JgF/WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="49121276"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="49121276"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 07:36:09 -0700
X-CSE-ConnectionGUID: 4qFHJUCnRWaJKFzUy/nLug==
X-CSE-MsgGUID: S9xR4EEjTWixrzneASOlpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72854594"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 07:36:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 07:36:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 07:36:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 07:36:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g25fbL+6xZy6y0ehKSei6J25jULH0OaUAucMA0uBm6DXH7hQp9xb/PwU03F6VHu+0kOo5apAJuWkXavOsKGdrm4m6gbJaik+0jTSTKU+/GCf9BOHMImaRAFt+JO41sJwNSHNLqYBMep1eAgwK31V35lhH7unBE/LDyyAXDrJRsaSXOUTAGRb7ncx108UJFxhC2rXDsLo9f/DRMG1KpjE41e5t6gqngNhmJPei3uhm5rAecpJ2GzThxtRrp+tjFgvfrg5fUHUn7mUFuKekFJ+0JMvC2OaKFg+ShG27iDclniHX610LXTpxUPubuTZqLCENXYxTOd3IhNtjnqYh+gwog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXs66BDXVmpsLSerwooIMLhmKohkA6pAXuF0WkNkKLc=;
 b=XLCnAeOZhzpmBjFXIwZITgqHfGN5ikuxNNn3zDwYzlFYu566yqycZ6/wx9Puf02t+BQUg6dAv4n6bH9qu1zzhDdPNBq3SBvIin9d55RZYCatLWqhGwuYANpEzJ5sLSEaXOgg+f3enV6ffFaZSHRzxhQM48OEurqz7yOU8z9R/4ysinkvaqzxK/qIrDrClaizv9o7kmqCwbO3j4cOw335hXuCyEhZzn1nbA0p2AVEFz5sfaq6kKHc20qAxVeyuHf7nY0hoPNqM2n/VLMAB5pEewySVJYZhOCQWQejZfxP9OnrcFHVKz5VbiOTWC3hVDIPiHtZishhjGYcm9hJ4U1E9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2864.namprd11.prod.outlook.com (2603:10b6:805:63::26)
 by PH8PR11MB6925.namprd11.prod.outlook.com (2603:10b6:510:227::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 14:36:05 +0000
Received: from SN6PR11MB2864.namprd11.prod.outlook.com
 ([fe80::c58f:66d9:46c0:d83d]) by SN6PR11MB2864.namprd11.prod.outlook.com
 ([fe80::c58f:66d9:46c0:d83d%6]) with mapi id 15.20.7982.016; Fri, 27 Sep 2024
 14:36:05 +0000
Date: Fri, 27 Sep 2024 10:35:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <daniels@collabora.com>,
 <helen.koike@collabora.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <robdclark@gmail.com>, <guilherme.gallo@collabora.com>,
 <sergi.blanch.torne@collabora.com>, <deborah.brouwer@collabora.com>,
 <dmitry.baryshkov@linaro.org>, <mripard@kernel.org>,
 <quic_abhinavk@quicinc.com>, <linux-mediatek@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
 <amd-gfx@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>, <virtualization@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] docs/gpu: ci: update flake tests requirements
Message-ID: <ZvbCzqvyeTI_j2cD@intel.com>
References: <20240927052416.1833889-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240927052416.1833889-1-vignesh.raman@collabora.com>
X-ClientProxiedBy: MW4P222CA0030.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::35) To SN6PR11MB2864.namprd11.prod.outlook.com
 (2603:10b6:805:63::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2864:EE_|PH8PR11MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: 320fe305-71d4-4ea8-cb10-08dcdf01b751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ElrEf6GuiOyrEsbiu+RLqnOJJupxGbN04rSe1jrloJEtK8c4a4ji/UDr94G3?=
 =?us-ascii?Q?F7P6jyPvYFrpjpnxppHKsdBTIjWV2LlUNmWo4tgRPacpomqqCi3epropdlHV?=
 =?us-ascii?Q?scVvjVsHP6mHY/GEdHrYcXMJQVUUp31aK3TlCKBvqVfcnd2KqM8tgqMx9chN?=
 =?us-ascii?Q?jaIXdLW6haoH1T7BIE4RGfrtHlMWk88UKtXyz+5twEhfYrKvXzGoFfz1SS05?=
 =?us-ascii?Q?Q2nnUX+HRhW0TCX8Et4hGBm94j/lPnr3kJBjUyxKLjDChToxqa552p1Ked/F?=
 =?us-ascii?Q?89gEK7OMe7fhTwmGIJUVz5FwmkFpTZ4Rq4CKJkSNuGxACYrZN/Ll1DvcyjOk?=
 =?us-ascii?Q?ajEXu0tU4RoQKQtcqo8zSyM3BApALXf/zxeF9BFnN5y+/32Qp4AAd1gN9OPe?=
 =?us-ascii?Q?fQDk1cFl8ek8ygE4qv9htZ81U1q8nJdH1CWuz+nO+VwaDkMRQemfRUXRcLEZ?=
 =?us-ascii?Q?wf7A1LlRQwgeib0wEBshCwPsmp3tIsC54GnshRsrgVlbMf0EW5KC4gEp+aak?=
 =?us-ascii?Q?IKz/XHRKgZiOxZ7bOUKsHyNgvc6rAfD0rLwmFMLXOe16K4ykuOUPTNj9tJgu?=
 =?us-ascii?Q?1XGnx5Dtj8S/J5OkKD9MHK94sUctuzj9zRfA8OywaB1c0aJV/wmcPPtaIRwp?=
 =?us-ascii?Q?oSZVwq1B6LpQog+sPMKcUmvpTPETtp4gpeXPv8BK16DQqmttx00Zii1k1tg4?=
 =?us-ascii?Q?R3GV2Pub/vgiqigsoNlyWMKs/aAi+xUvoUPZTEqCnu+dlPrKPM18QQyxyL27?=
 =?us-ascii?Q?i3K4Lmxx8r4one44EFo83HgMXt8Ytfy/wzYtIp+vgIQrjhv+9wIU7N1Cvw0Z?=
 =?us-ascii?Q?eLhUSO38tqXnbgMv8wJloFobT7yGZRfn0NryT7qlALzdWGP0DboiKfwKy9u2?=
 =?us-ascii?Q?wPPpnZKQZUEI3XR2L06LzsZkCQwieX8ISCg7BOTKBQRt2XV5q7rded/mFSJm?=
 =?us-ascii?Q?JZNzSM5sQrpVosQ/bC7Qim4lYkFfBDgBt0W2L+0Ars1HV5LlNr8rIZMkzY0y?=
 =?us-ascii?Q?cCf4ja1XSSediPPZNzA6Wtby7SK51nwCf3TaaQk8DaHOoZjFKCDuc5fxuA4k?=
 =?us-ascii?Q?Hpkvzdf6fj7UOhSOxPC56oxdlrU8HuXzSo9nF5NCWvE2pmWErznH5xkn+4k1?=
 =?us-ascii?Q?oulDcbTqM3v1JmEb1CSrB4gPK+ZDnnSrBUUBKTUKwFiWD3QGQ6PPGjlAC0GL?=
 =?us-ascii?Q?FFz8xnoCWwPxvSUfq/Zj2dlleL28lkJ6JIKLcbSODJtEHijX9laGJ4M36gM?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l5WVllZvSimEdc1+0M/NtfM4OG2EpFFEeyoIigLRBCrMm/PVcDwqEHiOrCdh?=
 =?us-ascii?Q?Wbw5q7Rh3JgpyRedTixLuk0XrWzA+j9hifqTpsX2goKFJxnprqmQwz1lr080?=
 =?us-ascii?Q?s6GJf84E+qdVwb9n4uSZGI5klVeM4i/hk38EVy3H8YyOvS6NFzy/dWBZXmJP?=
 =?us-ascii?Q?aYxxD6/v12ictdxfg62DYsR5Qux4WrbRC/67Ak3OZQSQcWaQ/yWzcPc/eky1?=
 =?us-ascii?Q?Mfms/v4qTi8LeqL4RjRCvTG0fWKph5AV3/qWtRx7Dr0WTK73Ad9V6wsJY3JR?=
 =?us-ascii?Q?6Vwtu0lwLP+slAoljVpFXLVQEzp3QO+mxjs5S5eSoJnSIblrzlEYPbLjgeie?=
 =?us-ascii?Q?5JGhhyCH2BWthyZBjEtqEcC6IYRUpRBzM3abxWOolVawEoSg5NMLjn5Zgb4e?=
 =?us-ascii?Q?rbwzrBgZXO6Y95Z7Y/qxq8NoTGktZXgzysPsDb4dkRAST2wwvVjCbyEpegFu?=
 =?us-ascii?Q?UQAbsppoor3m8//72RuUL2ReU492T9DXQM9eQ2IWW9bdJWhZHbkDRB59xVCF?=
 =?us-ascii?Q?gtlCBQkVOsoxHFGifgNwiFzDY0XwnVbj1KDvF/io3sxbGCMYOwEAzyGO1lpY?=
 =?us-ascii?Q?vtPyjY3tETlhKmMMjd2zQ+FEfPHMRuQVIfRbpkL3LT1rWY3qJHVQZ7cMQSja?=
 =?us-ascii?Q?2Jo5nrdkZJ6FTXMgPpUNu/QoW/XP/41duMVp1xZngsGttPWrTre5JUuEJgWE?=
 =?us-ascii?Q?ore2w+MfESNw17cyxf9hp8Qer/PJ7m+HxAFwWQxfo67vF0xPyzplevzQvqFR?=
 =?us-ascii?Q?TLG7GoL94ZS9z4dpVfua6SHxWr43JBXmNU9ZZHbIgqBCp4ZDtLlhutbleOT3?=
 =?us-ascii?Q?0cUhE40dSdZC5nrJUUvJ+wRm/uo05WGvEooIM0y0wW1WX+obqtnLcyvGJfli?=
 =?us-ascii?Q?mxhSQMORZPqTH8N+qnVp57DCV4L8HH+l91MDuxSnMqQhxnH1JWqz6DOZZUe7?=
 =?us-ascii?Q?wXEpwoORTjLyitocbGBuymzdKXejhGeCmT64I+Uvxm4NjNmvFASLepC0H8yu?=
 =?us-ascii?Q?Ve3dOMJ/v6/RkC4ajwutXWhF0oPp4qFJtISsreHiWd7D1VQ/o73RuzP6uA84?=
 =?us-ascii?Q?M4Als5GL6XUOIozETpqv6HTFyYte+ZJ8t1UTBMDdadnfADs9YC68xDz4BCUo?=
 =?us-ascii?Q?yFo12dJ7qeICxLXWWDC4t0Ze67TM4iK9HQ68rod90DXFz9JdVDAUySiqc2ZL?=
 =?us-ascii?Q?mWBIwY9klkzHqd6C499mBNF8xO8hYDZUh3RbPZOHgnzUW97o4Ezpn4RVnpdU?=
 =?us-ascii?Q?+Uj4YOGNeGFAzZFibLwRSlYo/XGdCvgNydm/R4rnrRCN7pTG7Odtc8M8JroS?=
 =?us-ascii?Q?vR+bHyIfvTR1nu+m9gFoq/0vLGqk1hdAzdeBTgocg009FHuYwUKAN2QY69dw?=
 =?us-ascii?Q?87WkMspWs5aAY2lA50JKO+gP6UU4RdqbdbjEjSydotPgUwINd4khso9Kvd10?=
 =?us-ascii?Q?K0/DT6GAZGMRT5XpUJyjW47LCV0LvKPvnAHwglsYx8dNbiuJdEON/OxGO0BC?=
 =?us-ascii?Q?XAuEfXonfMhpj01KE/koJWIcPXdE6zjDlcJCud+Pc5Z+xN6wDeLTNF2BigAS?=
 =?us-ascii?Q?LGWt7xQ7KZB6qGahXjPBW2exbqUUWMU/1bqTuCngWqIteLnZjab1rQq2Xylh?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 320fe305-71d4-4ea8-cb10-08dcdf01b751
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 14:36:04.9841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8hEmvkmOJ5ZG7CtX27kwSHNlSKUWTqLyV4tAUcYPhK053DbbHH+EotzyB9wy6qExV5gvNYHKvGd7NabQqyZHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6925
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 27, 2024 at 10:54:14AM +0530, Vignesh Raman wrote:
> Update the documentation to specify linking to a relevant GitLab
> issue or email report for each new flake entry. Added specific
> GitLab issue urls for i915, msm and amdgpu driver.
> 
> Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # msm
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
> - Add gitlab issue link for msm driver.
> 
> v3:
> - Update docs to specify we use email reporting or GitLab issues for flake entries.
> 
> ---
>  Documentation/gpu/automated_testing.rst | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
> index 2d5a28866afe..03769b4a17cf 100644
> --- a/Documentation/gpu/automated_testing.rst
> +++ b/Documentation/gpu/automated_testing.rst
> @@ -68,19 +68,24 @@ known to behave unreliably. These tests won't cause a job to fail regardless of
>  the result. They will still be run.
>  
>  Each new flake entry must be associated with a link to the email reporting the
> -bug to the author of the affected driver, the board name or Device Tree name of
> -the board, the first kernel version affected, the IGT version used for tests,
> -and an approximation of the failure rate.
> +bug to the author of the affected driver or the relevant GitLab issue. The entry
> +must also include the board name or Device Tree name, the first kernel version
> +affected, the IGT version used for tests, and an approximation of the failure rate.
>  
>  They should be provided under the following format::
>  
> -  # Bug Report: $LORE_OR_PATCHWORK_URL
> +  # Bug Report: $LORE_URL_OR_GITLAB_ISSUE
>    # Board Name: broken-board.dtb
>    # Linux Version: 6.6-rc1
>    # IGT Version: 1.28-gd2af13d9f
>    # Failure Rate: 100
>    flaky-test
>  
> +Use the appropriate link below to create a GitLab issue:
> +amdgpu driver: https://gitlab.freedesktop.org/drm/amd/-/issues
> +i915 driver: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues

Probably good to add:

xe driver: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +msm driver: https://gitlab.freedesktop.org/drm/msm/-/issues
> +
>  drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
>  -----------------------------------------------------------
>  
> -- 
> 2.43.0
> 
