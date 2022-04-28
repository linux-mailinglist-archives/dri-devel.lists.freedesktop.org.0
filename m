Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0644A5127FA
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 02:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19C110E0A7;
	Thu, 28 Apr 2022 00:24:51 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88DC10E0A7;
 Thu, 28 Apr 2022 00:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651105490; x=1682641490;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N7zHWfm5/uBSA8hoZb9f7/FB4oVTDTq1RD05liU4R74=;
 b=DkesBc2bdKzGcfCWHAz4Gg9/Gjo5sJRf9Nwqmrp4jsc2e+/SYOp6cyIV
 6ojzvbQaig8cEpA/se2u7wSM01NYNjQqfnUPtGV6hDKLEoEids+01AxQ7
 JN25KsdvnVMH35IkN6L1d4hI+ytpkRGhcocXBgo0w9RLvFJwDBPhA/9LO
 a8j5Lv092HZIfIxz1S6HryxeAm67pVQ4Oj7hjRF7jQJht4yBrQ4mPNYqs
 vIk5NlQ1JaqgztZ157jQCZnZv7OqwmUBpo+r37w3yZMPxBm9AG+0eXbPs
 ZBIn+mp9YEN42NbZ7mMwQJgwOfGdn734sY6oORrQnhgaYzNoOO5ozWxWe w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="329057953"
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="329057953"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 17:24:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="513971983"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga003.jf.intel.com with ESMTP; 27 Apr 2022 17:24:50 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 27 Apr 2022 17:24:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 27 Apr 2022 17:24:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 27 Apr 2022 17:24:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 27 Apr 2022 17:24:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIb5CxRlLBHCMekvtvy8WW2SG4SbvaT8irk3cP8bdoRM628E+J3rtj1mlZQPlyX+qZM7ZSLFn2BDoFkkiVC5fQzyixsp18XbNYl8tC/dG1W+bCXK7cf6UEazhXNhoxRKlxXATXCeIMtHo642nWuiPDaxo3mBE+bfpuq+IgIDYXEI0/lb8nIge0JaAodbXwtYHVAlVYeEGFbip0mA8BilHLRHDXpCkBfNUl6ZXfQN2KJjGq5gkmooMVRxQ6O933ZlyfSNmEUtxGgC6aw2rohO3AxkJ4N/XrFRzCcmpr9nFBN1C+mxHvDRVipz3IK/T9OzGFmQKoP/AN0xY0UOHZV31Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7wQch/jRrL3RHKWN24TNXQUtboxAEcsXBHbWd8UUxM=;
 b=hESj+c2/1Q3Bg0tqujcHWHU5XSwcD9uMUb3XX4NIjDPvrSoUrRCO4UuK3a1+YlCEIwzYhVyVD0QXVWT+tIHggltJoV+g7jbz994npy4xuayvD7hWENYDrPQdheYujX1maaa0gaa+R9SdH53HRHRLubaPX7r+It7EfMMK6mgCN2xpkVqCqW99jTbWyN1NpD3BhxDMOR+8C2Jxm1shDPOuHYtbP62EmrgCOsU0Ii+5jdwQKmdQaJT4CA8xzYI0A82lxU2H4rly4Z+496sAhN4XG81J0BVEK3bOAzbJhUJPKkAPWgHxmygnyU8TwcACi9LWoHX9eOXo83EldYf4eBl/WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB4057.namprd11.prod.outlook.com (2603:10b6:5:19d::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12; Thu, 28 Apr 2022 00:24:47 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b907:4e16:92da:b2cf]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b907:4e16:92da:b2cf%2]) with mapi id 15.20.5206.013; Thu, 28 Apr 2022
 00:24:47 +0000
Message-ID: <7970427c-485e-6a60-2925-a5b3cd75df6a@intel.com>
Date: Wed, 27 Apr 2022 17:24:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] drm/i915/dg2: Define GuC firmware version for DG2
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220427165550.3636686-1-John.C.Harrison@Intel.com>
 <20220427165550.3636686-3-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220427165550.3636686-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0017.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::30) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f59d7573-95a8-4b17-4365-08da28ad803b
X-MS-TrafficTypeDiagnostic: DM6PR11MB4057:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB4057B43C29045D7BC0FE061CF4FD9@DM6PR11MB4057.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cSuUHTsDMlOVv8ZNyiXoD2A41t+7BwSuJT2JREXDShfNwaMfidk9K6f+ogP10A8eXAzCETbuUSYeuB7jMM1ATOorgeWRz6/X4om5hHVRX+E+ByXUzk/8IMno/RwMx11H1KJh1OTigJ2lZn0mMq8YHiRwErIGVO4QOLj6FlpTMid/4Lxz8h3nwKn7det2iFf6aSt+p9uG9fJ9UPpSRTGHDbIeaN/iMDFXetXv70LPrlOJ2CPT0UDCgIi5Oq+CXK0zna64F7doInJqk1xIkr0hzEcSqu9+IF47IETe4qgHaCkxrzHcyz8E3JwSodE2icRK/b1qXWT59nLwovcDPJfyJvqe2DRHSXgz7MRokAjHiI0+b3AnXhhH6niDkDAIkdpQAzYXhENPKEfC7NatJyo/hQyE3uuLz8K4Ijq5zw2ZXypI/2q/6xInmV0Dkc1VUUYVZkU0Rr1bTFoUao9nUyxBFkVwSaE1HSwXdXH/2agp4uMJuLp2Z6CrcVHKnIeb4zLFAcmdChKyDX0QPG3D3nmP0vADuG0hsDZm+XLo/j6aAHm7n3qlnJZyLDQlbJI+w0RAUbgMvVhcTwM9jTzabKdyHG3EDersBMIlOQT32E4MvMtcnmTPBaVO7z4JjM5cRJGg5WvIHA3CWpbP8rrh/TTh+CQckD2PRycVvnfRv9wSUl3t9wA20llKxaHoQV/2aKBi+/j0imvgYK7QjkebDLUmvnUtl8GKn3IWc9Fmc/n/2RRv6b4X0x9rSNY0ilXbCXla
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(2906002)(66476007)(4326008)(186003)(8676002)(66556008)(66946007)(86362001)(6512007)(31696002)(53546011)(6666004)(6506007)(6486002)(508600001)(8936002)(107886003)(5660300002)(2616005)(38100700002)(450100002)(31686004)(316002)(54906003)(82960400001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXR6Vk44WXNqOEx0d2t2ZzNkdW5qRTVwakZTTDZRVEVJZytxYmh0aDdhZ3Nr?=
 =?utf-8?B?eSt1N0paOVZYa2g1YUZpMmxKL0ZkUHdjTGZ1dUlEdDJqVW91UlVscUlkUUJO?=
 =?utf-8?B?bkFTUGhhblJQK3NXUkxaZ1hnMU5qNEpPQTRBdmdWTUVIa1VhM0RtMUFaVDBs?=
 =?utf-8?B?WTc5QlZ4bGZEM21ZOG43ZWxkK0l6ZlhhMk45QkVzRU5yNkt6d0daMEJDM25a?=
 =?utf-8?B?eHVPc2lTakpXcC9seGNEOFBzMU91K2h5VXJFeit3MVVqc09weWhKeS91SUdh?=
 =?utf-8?B?azVlWlpnRGhOMDhWUlVHSWhWd3BHZW9SU1RwL3lOVWZlMlRVemMyRTk1MjZU?=
 =?utf-8?B?Uk9nVGdudEkwVGowNDFodmljTGh4a0xFNFZzRUxJZlNRaXNac3B3TU01Q0RQ?=
 =?utf-8?B?Wjk2UmMxdFV5d25hL2VTWDUyVDlwbXZ3ckd4ODBGd0hXcUVYbU80Y1RqcFJt?=
 =?utf-8?B?Ui9uVGhrZzhzUjBqUS9zNlBuM0JYVmNaN05PemdrYXZ4N0dXcStDZFh0eXlu?=
 =?utf-8?B?SFVrZXZsUEF0eGphdEVjM3dEc0lRNkY5NmtKU2lCTnNDcnBLODNVbGxNZ3l1?=
 =?utf-8?B?YWtPT0FiSUVYcnBpQ1dXVVkvcFU5QkdYR3Z5a3dkTWNxM2FYbEV1SXg1Y2Fh?=
 =?utf-8?B?N1NxR2VtcXhKekEyNlRha0RHbjZVSk16SVl0bkFjQnA3bWp2b3daYlJsaGFZ?=
 =?utf-8?B?ZTkrWHBtUmtQeENKeFBUWFAwVkhFSnlWK0NLWGJpK0cwR2hubjZyNFBnY1VG?=
 =?utf-8?B?STNZdkFPTzNHRlY3b3RpTnNGK3F3QjF0SEJXUUtNWjlIc2pIVjJ1eGxvbjZ6?=
 =?utf-8?B?c2h0NGNrQVhVSytpa3MrZGxuYU03cU1NMmlMWHBOeEdXeXB1bnVoSGtpdnVi?=
 =?utf-8?B?RGFtQ1dwZzBrWHd3ZU8rYS9TcmxqV29TVjNMcmdiaHN5Z0pLUW5NTmRBZ1h4?=
 =?utf-8?B?akdXcnIxdDJqaEJ2STNHSmpzSnhwNWRSekJmclhBNFh3K1ZyTXBnUmNzREwr?=
 =?utf-8?B?eFlUUW5ja0o3eGtQeXZlTEF3UTBzbEVxUFc5VU45bGc3d21nSzZDNlZIeG5Q?=
 =?utf-8?B?QXRNcWZvOWZEU2pZR1JEbGw0a2IvNFBTZEZxTHFnVytReXMxQzE2czN2ckQ2?=
 =?utf-8?B?MTA5OGVZUHFaT21PbmgwUXNWaGNjZlFKaUc4Tk9ENTM5TEszKzVhaXAwTUpn?=
 =?utf-8?B?MUFUaktnN1BIakw3UWpoTDEyUnorcGhGSklVYnNtR01FTVY5bVh6bVRsbXJN?=
 =?utf-8?B?cXMxRnNROXQ4MTY1cUprRnBXeXFUdHRmRWQ4dmZnaDdwS3o1VDlsNlFkLzhy?=
 =?utf-8?B?Qzhlaks1TEU2c2NGbTlVaU5McndFY2NUVUpqMm9OU0NuTnhGd2YxQXRhR2h3?=
 =?utf-8?B?N1VIT2d6b214R3gyMWJRUU9WVWVjUzBUUWRGR25EQzlHUktQTEZRWFFrdGZ0?=
 =?utf-8?B?SWFQQmViODlsZjN1cHdoLzQxVjdHVUdPc3AxM3RxK0FLVnIrYzdVdDB1d0FO?=
 =?utf-8?B?ODFWcXZRNG1RakVEUGFEMHlvejdpOFVhWjJLampJdlFaZmtwWGE3enhqNm1O?=
 =?utf-8?B?QkNnYWJmckFtZUZ4aEkzNml2MGFmTGxmbGdXakFyTXpTVGlpVDFzMjREMk9P?=
 =?utf-8?B?d1JXWE56WE5ldnorVmxxQjNjLytlQnZvOXhMQUVEZ0tEWEgvS2RYNmdVOE0z?=
 =?utf-8?B?WmpYWGZqdlh6WmFnZmdpaksvRUI0bzlPZEc4b0xXdTdheXRWMXNDcnBTa0pW?=
 =?utf-8?B?YnhxQmNvYjVueG82cm14RFROdUR5WlgvTVJWUXJ2NHpkWkRUbnN4NVNUUG11?=
 =?utf-8?B?RkduVmxpL011akJHODFzTU1seUE2OHVaN0YzeHJxV2xOY3pJQ3duYmRNRnZB?=
 =?utf-8?B?NHNrTGp0Q29OdllTS2VSS1N6VUgydVRQazhQK2c4NGtCNjNQOWZpSjBGNHBt?=
 =?utf-8?B?dUF5UEl6RDB0aUtON2RlSlBDTkQreHBueFlzNlFVUnRMUVE1VG9ySzBicEdN?=
 =?utf-8?B?R2tMb0JpbnMzVTZRODJ1NHJTYWJzMXVpeGh5WXVPRmJyZzd4dFdWRWpkNUc5?=
 =?utf-8?B?SmpvcDEwcUNvU2JiUTZoWG1Ba1puWHE3UFpJaGFSZldkTUVUeDNyRlBRSnlt?=
 =?utf-8?B?Y2YxaXlCRVdEaXhHUjBTL28wMUZLRVg3SjY4cXpaVnZFZTB5dlk4TWNYOEcx?=
 =?utf-8?B?T2p5Q2lXOURKS2prQTNkUzhhRXN1bnNlRzYvSERlVmNKOFUzVDZsWWliejNk?=
 =?utf-8?B?TnBuZ3lYUCtIekxBN2FQZnhScDJCZ1NpUUVFcGpKdGJyM1ZqMFFKUU9BNXFH?=
 =?utf-8?B?RGVQMG1ZTHBKMHRJUFh0WkVOaXZTTTRtenk3dC9oMnE3YVVLdExLUzQ4WG5L?=
 =?utf-8?Q?pSKGX60maQLwNFDT+rzKyJjQJk8ruqj/AinHc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f59d7573-95a8-4b17-4365-08da28ad803b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 00:24:47.4354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUPXtlm/P+MY5Z8NdS6w8JJlSGq3FT6w0CQRQioUxFEorsxCIpYAjNSxI/k4gp0HMIsujkbReFdg3xfQj7LWdgzugJwswL42MbJzqKzhgdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4057
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
Cc: Tomasz Mistat <tomasz.mistat@intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/27/2022 9:55 AM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> First release of GuC for DG2.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> CC: Tomasz Mistat <tomasz.mistat@intel.com>
> CC: Ramalingam C <ramalingam.c@intel.com>
> CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index a876d39e6bcf..d078f884b5e3 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -53,6 +53,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>    * firmware as TGL.
>    */
>   #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
> +	fw_def(DG2,          0, guc_def(dg2,  70, 1, 2)) \
>   	fw_def(ALDERLAKE_P,  0, guc_def(adlp, 70, 1, 1)) \
>   	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  70, 1, 1)) \
>   	fw_def(DG1,          0, guc_def(dg1,  70, 1, 1)) \

