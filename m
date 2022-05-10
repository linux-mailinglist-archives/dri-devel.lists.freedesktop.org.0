Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2066D521225
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 12:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C7D210F709;
	Tue, 10 May 2022 10:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A4B10F704;
 Tue, 10 May 2022 10:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652178318; x=1683714318;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/0GSmOwHlgddxK/z4kl5S0GGv1Okl+k6MFnJg6dw4BM=;
 b=go8fBUIGkAPM1PPZJOMuiOrzmVGV/icLAsz66g8R7Bf/JCfGj/jz4ig4
 HWJ9yAGk5GYbtd83NLERJwzPgtLgKUNLfLzDBg1G4R2sTI3EeRdg+xKHd
 yodPmoSXZUHSm9VO0F07UBFXzM5It6V9xpeiNVOQDnxQe6G+NrC3MR0jL
 WmgV9KBlsSmTPtiGFdNtgYjpG8mxkcbNospu3FhEQwykdWv7Rs/Tb+W0F
 +MHtQLuHa0XBDdj0/9C7fS9ge2f4R+FfgztveFuobrTtn6nzkwANbaI6r
 B7zY8ENGP9OsB1bMr8oAWzZ/remELjfSpwPLEAKZUwGCTMLdAhwuBSfnY w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="329924268"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="329924268"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 03:25:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="565582634"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga007.jf.intel.com with ESMTP; 10 May 2022 03:25:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 03:25:17 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 03:25:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 03:25:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 03:25:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRRE0FxbPK2T5no1rP05PwiKuirgMTAdNP6dIrr+U/mECZfle0igN1fwmARWKej8zzVQVsUZCVHV/394agyMW3cly/GkTUPfeE41feTw/YqsD4rbnP/jJ85kUywu87CJD1xxqwtIwR5Pp0TnWwdVzYhOeI12jRuhtpMI+uT7uWcz9Lulm5I5Z9fo/jHT7P3e7PyQQzfBayxsh2aeY96AUGrvJAZ0TXS7ohknQdweZXBup/OCvyO/n3XpYBXjGLdXLEFv39UFXKZhgv2P9rIA6yfZQ4NBA34Tzhj0XzYVk4OSF7gMjmP+DZ0ggDnlzhF3n0nWXuiq3WZaAilDdyyRyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4dA7KtIWJWX9MejAWEFDm2K2FfOPXbeWZoyag5dMdw=;
 b=Z8hyfqv0Y0144TKhoRVBKTzFebgbe6tSB+cHmjevL1NjOyFZszKgDbAjd2bpOH6LiXyppwJEDMECESf5AsoRJ2QR0emboEPgHKPLBhZUXjXpEGlRWkyv1PEILQu4rhbfphugIkkKSr/epmHBEvpE1q14EpCHP87s4v/03KoAlZGksYusZ4CbucxWQcPsMj+jCEQeAfGR6vDY0jSrDlSu+HUjzECzT9NDid6vHD75x7SQ4pXiD3S+AzyTRN9zbHetx8HY/iqo6o93QvSul27Nh0IJGD/375tMFxgzu4hBfN9QALUqLNL3Tg9HyAX1OUCTbczJGG/fYytvV2wOU4JrLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DM6PR11MB3612.namprd11.prod.outlook.com (2603:10b6:5:13b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Tue, 10 May
 2022 10:25:15 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 10:25:15 +0000
Message-ID: <70bf12f4-b4ae-d240-332b-f1bc30af035f@intel.com>
Date: Tue, 10 May 2022 15:55:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH v2 22/25] drm/edid: convert drm_edid_iter_begin() to
 drm_edid
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <24dfb5fd9026ebef573bb55b368b94e56cae5cec.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <24dfb5fd9026ebef573bb55b368b94e56cae5cec.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::25) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c0fa3d9-4936-4357-408f-08da326f5f4d
X-MS-TrafficTypeDiagnostic: DM6PR11MB3612:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB36128C59212AC8718D06A04DCEC99@DM6PR11MB3612.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2kIbFukiPyYM788o3NpZTUPgOezVf4jr4XS2Rtitdm6r9zeDpuMkcjzv77p28qI4vW00zU4MNjdIC8rLAs77nUP8s9EdjJVsjUmaLOQTy+Vk6SxukMVICPnpa62blA8L/bsb7VjLX+992EElttjHfK44ahqyg4b7tgkK/kqd2MsCqwftToHkmIwKlGa4xfQXVstbGkFAxnIVRxxrpNQ/CfrW5Imlh7ayCGsQtiYAkvqYg5QNnOYnqwfy/VYijEKR65cPm3MKCZUhaQa3qRZ9HGftrqxO/I00NK3B7Wx7m3j+sgEmEgWOI1Bd30p3NnCqalpsfSt6EGbgGzxaqqyeH0SS4cIPkUt6+Or98r06hbIPsZq9N46A6SjsWE4i9vBi97OT3yYO3EJRktczLtIJ1DhWxLF5a3yvnF7N8adFKJn61OdoAnUPqJxM232cSGoa7xtYUtJbd/DPwObYp39kHW8ucbuj9MhcB9/ClDwzZ8iRxt0+urdAmc+A+XlU1JJmgu+yNc4sNw+JLvmbpDjMuWGbnLX1QJVk2dzoB7pxgfVwavHYR9ld2cuifdzxdWNptEno8ko1P8wEfGgVR55PTGk6JAPrYCbcshGUcjlbyNTBv7yhf5tSpxEm3/e1Aw4CQqK/GszscZBcn9cwtr6r22Vv+LFa+H8PrxMW22EOtcTcfr8+jqCgw2mLbcQOiu7lfD3HK7tOhq2fCDn4SbwBmyd23qRD9wck/ErPwcYlF74=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(2906002)(5660300002)(31686004)(450100002)(66556008)(8676002)(66476007)(66946007)(4326008)(38100700002)(6486002)(186003)(86362001)(83380400001)(31696002)(2616005)(6506007)(55236004)(53546011)(26005)(316002)(6666004)(6512007)(508600001)(82960400001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3B5SFB6b1hxWUFVbTVqQlp0VUd5Y0dXZDJOZWhZbjBEb2t3ZFkrRGhZdEYv?=
 =?utf-8?B?WGNGQlNUeHNpLzZ0UVlHVzFoOGVVRkpWbHdHYnFsSE43ZFpqZCt3UEVhMGN4?=
 =?utf-8?B?eDhpLzE3d045dXNFa3dxSGZJelNoblVaRktuSmJXbjZ1UXU0cDE0UitrdERm?=
 =?utf-8?B?Q29TMHVXTVJwOU9EYVl3YWcrUUI5TWtJOHBGbmtSakxUcXJJUThNR29hRWI3?=
 =?utf-8?B?Z2lZZjFlS3A0WUNXdmFHNlg4SWF4VXdtZEorN0dMOXFuUm1yNEsyOWhEVEZK?=
 =?utf-8?B?Z2hiK1hzLys2cG5ELzg0dFo2cmorMXQvSzEwVHRQbk5jK01icnk5anQyQlF6?=
 =?utf-8?B?Ny9KNXFYUDFsaFVycW9oaERSSU5SSGgyek83MFA1MG1BeWNEaUl3RVVxLzl3?=
 =?utf-8?B?UUVoalJWN2RtK1hTM1pSVDlYeUpqb0d6aHdWS09GS3BUV3pMNUVuekV2aHVj?=
 =?utf-8?B?VHpNOXdqaUVKSjRMYzRySWZJUzZ0OTNVbjJOOEtJYnhhVmNWLy9kQ1lQb1FF?=
 =?utf-8?B?V3NSd3NBTGdPTDJTMzNLcE9NNVp3SklqRlBTNFhqSCtYeThvTGZ0S3dXTFB2?=
 =?utf-8?B?QVFFUWUxUVpzcVlhQTZYTTZqOVROTllFQXJOaXR5NGh6V0Y0bktSN2pDODg1?=
 =?utf-8?B?TDNPeHFFWFpLTVU3d3lhTkd2QVNSWHFxeHRtOG16RVZpc1hSM1NlS3lSRDhw?=
 =?utf-8?B?ZkE4M1VCSitQU3REaDNzRzlneGdRcWZ1TFNZVmpSOVArYVRWd0w5R1dYd2or?=
 =?utf-8?B?YkJNU1Rha01DK1lSUWxtQkQ0RWZ0TXJOYXlldnA1ZnVra1hSdUp3bU1JVTln?=
 =?utf-8?B?bDYvWGZES0txN2RCbmV4b3MvaFFWT3I3Q21Ed2lnWXp5Vm5hZE9BU1RGVjNi?=
 =?utf-8?B?RWlTZks3NzZJYlhLd2pkUEhyaU02VUcwQ1JDcUlUem9qekphTUhRMGdqTWtH?=
 =?utf-8?B?S1RjOExTTFhTRGUxN2lDeVVqZ2RZTmRBU0YrLzUzYmluZ0JHM09ZS01RS2dV?=
 =?utf-8?B?NnlYcGFFRXg4aW5kNjVYbjN0SXU0dllRc1dYQVhTMzJIT2lKcXoyVkg2Q0g3?=
 =?utf-8?B?Ynp3SitFdXV5djhVek9NU2VMV0JHVStUeDBtYk04QmFRRUdGTkg4V09mNndM?=
 =?utf-8?B?YjJpT3dpNjMxSndaSU5ibzNQWFk0NTFxMGFVSEYrZGdXTGRtRjdFR0NnN1Nu?=
 =?utf-8?B?T0ZXTlFJOXpjeFpra09tMWwxbjVTQXA0TWtOdllLL1IxbFAzSDUvT0NnUmp1?=
 =?utf-8?B?c3pkNkxWSmVJZVQ4dHFjSkZscU1UZExCZ1prdG1OWXVUNUdjSFFzM3VwMHN2?=
 =?utf-8?B?MjVBc3hLdmN1TXVTb2Z1bkVJR0NtWko1MGQraC9OdWtsNDZ2Ym5tbzFEaG41?=
 =?utf-8?B?dFpPMEdQVm9qd1hUSWpMNnFSdmliR0lVSDhiQzJoU3hqUXVGTjdPamk0SVZV?=
 =?utf-8?B?dSs1a1NaWVJsVE9pWFJVRHpkajB2Z0xnQ0xnTjdJbFNnbzRLUmVRdEIzRExY?=
 =?utf-8?B?cXJWcWdST0hZZDUxaUxocS85NE1uclQ1a3RpRUtRSGdDNXQ4Y01vOWZtcjRD?=
 =?utf-8?B?dk5uNWlQTDFJcXJrbVFzbER5Smt6bzN4eEtPM1JkYUVJejAxRndxR0RnSDFM?=
 =?utf-8?B?citIYS9rNXFnSjhBNVFEWmJYRkZQR2xEODVTMGpsYVNQTjI5Y2JkRTBnd3lB?=
 =?utf-8?B?V0xhNlI2S0NpcWlteFlhYlhEdmU5am1nY1hYdmNybERUNklEOWpNbUN2UGN4?=
 =?utf-8?B?bXk4dGZ5cWlUYzFEY0F4UVJPL3ppNWpOcEgyNFlONy9DN1laZ2o5OEQ0QTVZ?=
 =?utf-8?B?R1Y0VGtpZm40Wk91TnpIbE5QN1lCd3g1RE1taUd4WllickgxYlBoaTJ6TTFk?=
 =?utf-8?B?aEI4ZFNsa1RxaTFJRGNZRFFVSm8vajc0czR1QTBNUUNxNk5PMTRjWFFIK2hX?=
 =?utf-8?B?eW1OWTFLL2NjaUo5bXNXTnVLYTZRTHlqK0N1Q0IrcGxJMHhBRE1KTmVJa283?=
 =?utf-8?B?djFSNGNMQXNvTFlWczAwelpqaDZ6OWVreTFXMC9ZdHpBYjBuVEVGT2R4dnRv?=
 =?utf-8?B?YzhYS1FWUDJJdjFwMnVJTFlOczNkM1N4UG9TZGJvTE9LdHRrdU9ScDEvQlFy?=
 =?utf-8?B?OWJSNVp6MGRSd0cvQmErK1o2RHN3M0trOGtEc0cwMjJaNUR6RGtuTkUvMzlH?=
 =?utf-8?B?WlJPRm9FaXhwM2dNMnNZOEhBckpOeTVadzl3UFBRNzFGWUZqUUZRVkxqZlU0?=
 =?utf-8?B?bTJMUkVqNURIREgyNGdtN3hYRXlUd21GcVk0UWs3U0pka1V2VzRWckd3UWZC?=
 =?utf-8?B?enkzNGN0ZTRDb3hiSXV4dXhVNFAwcnNrS2piQWFMbUJVM0RHM0F6WkkzRkpC?=
 =?utf-8?Q?5Nl/loU9gnk7RDqo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0fa3d9-4936-4357-408f-08da326f5f4d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 10:25:15.1128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/hat9hpWsjL5KvhUiBoGaAAYaNqsiOQp2H4lqQaqFebW2mKpUbyOOVJGW3Dgvv+kxNB1GPSkfxFuQBgpje8tMhPVTsht4o53fJx15mTf5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3612
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Regards,

Ankit

On 5/9/2022 5:33 PM, Jani Nikula wrote:
> We'll need to propagate drm_edid everywhere.
>
> v2: Rebase
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index bd14010ed1c5..d857d1d74c82 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1632,36 +1632,36 @@ static const struct drm_edid *drm_edid_legacy_init(struct drm_edid *drm_edid,
>    * struct drm_edid_iter iter;
>    * const u8 *block;
>    *
> - * drm_edid_iter_begin(edid, &iter);
> + * drm_edid_iter_begin(drm_edid, &iter);
>    * drm_edid_iter_for_each(block, &iter) {
>    *         // do stuff with block
>    * }
>    * drm_edid_iter_end(&iter);
>    */
>   struct drm_edid_iter {
> -	const struct edid *edid;
> +	const struct drm_edid *drm_edid;
>   
>   	/* Current block index. */
>   	int index;
>   };
>   
> -static void drm_edid_iter_begin(const struct edid *edid,
> +static void drm_edid_iter_begin(const struct drm_edid *drm_edid,
>   				struct drm_edid_iter *iter)
>   {
>   	memset(iter, 0, sizeof(*iter));
>   
> -	iter->edid = edid;
> +	iter->drm_edid = drm_edid;
>   }
>   
>   static const void *__drm_edid_iter_next(struct drm_edid_iter *iter)
>   {
>   	const void *block = NULL;
>   
> -	if (!iter->edid)
> +	if (!iter->drm_edid)
>   		return NULL;
>   
> -	if (iter->index < edid_block_count(iter->edid))
> -		block = edid_block_data(iter->edid, iter->index++);
> +	if (iter->index < edid_block_count(iter->drm_edid->edid))
> +		block = edid_block_data(iter->drm_edid->edid, iter->index++);
>   
>   	return block;
>   }
> @@ -2611,7 +2611,7 @@ static void drm_for_each_detailed_block(const struct drm_edid *drm_edid,
>   	for (i = 0; i < EDID_DETAILED_TIMINGS; i++)
>   		cb(&drm_edid->edid->detailed_timings[i], closure);
>   
> -	drm_edid_iter_begin(drm_edid->edid, &edid_iter);
> +	drm_edid_iter_begin(drm_edid, &edid_iter);
>   	drm_edid_iter_for_each(ext, &edid_iter) {
>   		switch (*ext) {
>   		case CEA_EXT:
> @@ -4453,7 +4453,7 @@ static void cea_db_iter_edid_begin(const struct drm_edid *drm_edid,
>   {
>   	memset(iter, 0, sizeof(*iter));
>   
> -	drm_edid_iter_begin(drm_edid ? drm_edid->edid : NULL, &iter->edid_iter);
> +	drm_edid_iter_begin(drm_edid, &iter->edid_iter);
>   	displayid_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter->displayid_iter);
>   }
>   
> @@ -5163,7 +5163,7 @@ static bool _drm_detect_monitor_audio(const struct drm_edid *drm_edid)
>   	const u8 *edid_ext;
>   	bool has_audio = false;
>   
> -	drm_edid_iter_begin(drm_edid ? drm_edid->edid : NULL, &edid_iter);
> +	drm_edid_iter_begin(drm_edid, &edid_iter);
>   	drm_edid_iter_for_each(edid_ext, &edid_iter) {
>   		if (edid_ext[0] == CEA_EXT) {
>   			has_audio = edid_ext[3] & EDID_BASIC_AUDIO;
> @@ -5516,7 +5516,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>   	struct cea_db_iter iter;
>   	const u8 *edid_ext;
>   
> -	drm_edid_iter_begin(drm_edid->edid, &edid_iter);
> +	drm_edid_iter_begin(drm_edid, &edid_iter);
>   	drm_edid_iter_for_each(edid_ext, &edid_iter) {
>   		if (edid_ext[0] != CEA_EXT)
>   			continue;
