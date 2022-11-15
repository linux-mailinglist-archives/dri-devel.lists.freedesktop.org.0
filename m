Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A32926294CA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 10:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E205989FF9;
	Tue, 15 Nov 2022 09:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC3589CB3;
 Tue, 15 Nov 2022 09:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668505711; x=1700041711;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mbBbJZptvhS2n1rlUzNwxeDFP32taLBWKrlPC30DAtM=;
 b=Nz6EiWnxpX0CIPQ6cNeKoYHrVhfy1SFxQIOzHnRMSjEsTTJGpNoHi/w9
 Qb79fIWj4sX1pYy3BTSxQoAp0gK+gpybJJjrtulMGfUdbcbY0a81XtG5b
 2qAV1FMqcWVgDd6pzizFnmIf5iYpqwja/fS3lNcA2gamkBm/jPEp0lSXj
 bQuHhuo/7MZ4E/rmUrgTr6rSAEYCppjtsD+stYhQz3xvoZBPq5E3Mr3qs
 kMc9Q1KfUbBlL1tLY/YA3LxoCJD4mFMmrVNcj/jgJQ4zUMRSED4SSBkdj
 NkDlUxug1Dz/zMCrUFnxpxLJEZ4NflvIroI2km+QPY6FMbhhQ5IEwYGPK Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="374346222"
X-IronPort-AV: E=Sophos;i="5.96,165,1665471600"; d="scan'208";a="374346222"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 01:48:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="813624186"
X-IronPort-AV: E=Sophos;i="5.96,165,1665471600"; d="scan'208";a="813624186"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 15 Nov 2022 01:48:30 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 01:48:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 15 Nov 2022 01:48:30 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 15 Nov 2022 01:48:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZiXs33bZN1h2QybnrQj75IEcCjYlQLevMv7Dt9XDs6nzXc54zAJmD/8YoZ937lWOR1OmQWwq1BAVFxJKZ3rADUBJ22bdkU4ekTXp794uC5iNh8Z2R4xvmL8v5kxDod0qJJXAiRNslQoX8qtEzRul+Gdy1JJ+VZ4HDCKIu3D3exLXULzp2qevTTlyCBUQRHvtQE5j/Ewwio0sj8pqXOEP4xBZnukBUEXNbDftMi4c2Hs7sTQJRAgHmftzX+jeY47GsO2iumcHVWjl7MEvtOtnkqszfmhO5kJc+TuF1zF2KZsISxpMHLFKgN8fENn1+lUmg4MK4otw8jkEnpV+xzPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpYo0EIczlge8QEs0ILiWgUV584oAh9jZ9ISmrx8MFc=;
 b=E4J7mrw7zfnTGHZGX+o6hq2XRC9A7RW67h8ifYYVccmOqCu2wnQuuBsLEAwNB5NXUG+KyLGN+zGIcyMA2uyMmHfe+zKh0Pj9NGSiM/+Ub7lwO8LsRslNRY7hsBCgwrmsnH9/YRYiobIOAN5H/1YT490peOFbzvDXPoirekhKeci24OezZGv5D7AVVd4dm+kgG0REKt8k2ZjmA0uq8wutk8V3TBYmbzj5jTChZ7c/Mq0duZZUkJ2civyvbc6pnr7yW53xCL+83MHTmGn6KAlbaziwDNkfQ4IPdsgr76qbibobci5nBVDA2LwUqMsuF4sYOJrx+mqxpoP3h1Jcr+JlGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 BL3PR11MB6531.namprd11.prod.outlook.com (2603:10b6:208:38e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 09:48:13 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67%3]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 09:48:13 +0000
Date: Tue, 15 Nov 2022 15:18:01 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [Intel-gfx] [PATCH 2/3] Documentation/gpu: Limit index to
 maxdepth=2
Message-ID: <Y3NgUWlKr1ie83BW@bala-ubuntu>
References: <20221107173209.2219571-1-lucas.demarchi@intel.com>
 <20221107173209.2219571-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221107173209.2219571-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: PN3PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::12) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|BL3PR11MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: c6adc20b-3bf8-4ecb-f876-08dac6ee82a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pn7neYsHHwGGe3DOyLDeGt+KNsKCmJCv34Qq/qKOEWIY5OgQ0VeyhoaAETE3+ZWmxYwplUuQlHgg41B9dqOasLH80P6FG5ozK0NIgIoEkKA+DpIa7rPeDPEOosRluHMSF0wic5mPI7754/tYwHWBWfhQnPfOBzIwSl6v3w42/P37duCe4yGPqGny7dM7fnPP1zTB//W8e4I9QM4aFnGvvwg17i+ht+xr98j4PswIQZGN0z1Btyyj772pbtw/TLPVdyEBGoVix9CMyW+Kq+Iuki57WTHLcGwz1xKaemKidhLNSHxmEVWVL03vUBpr1bdHNxVNFLJywXh7LthUFylAjEI64vuVWFS9yfbUkBoWFBcFly7cee32QnlPFjQ1E8S0YvtHCsluUWzrHGwqG7YIOpJ6c5VUquIirOUNgTLCeEth7mWUr/DVlLLF672DfnCtM6s0ripyVGfUQ45RhucifZGg8p3qW1ldlkxp2IB50B1X2GZS489vpU0abHVSxVPHsJuNpk9HS43ugf2eqfHnZcjQIrl5JdLwJndmIz3e55Bks3ZLRoLsvVOqKv3qpvBkiJJ6oo8GFrJoRotnrPJNoE5WHt5O/8fgUlqtBThdI66SRFlQZIJeeQHXWWD/4YWCGdtr6MHDNjvdXJX7+tS2tbZbtsrKXsBjwnBtWR0HYqxZLA8fT17Vcfi03NDHlaKmO5uY4h0kvTKaLpngii0gvyP3uSFDSZ1lHMQhX2+u9UHd8393JiHZgBND6rutDNCz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199015)(53546011)(316002)(8936002)(44832011)(41300700001)(186003)(26005)(5660300002)(6506007)(6512007)(83380400001)(33716001)(9686003)(2906002)(66556008)(66946007)(4326008)(66476007)(8676002)(38100700002)(86362001)(6486002)(478600001)(82960400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGNteVVzTXhhVlBML2dMNkltYVdVOGJkWUFDbHgyNFV0ZmxST1FuM3dhYmNC?=
 =?utf-8?B?cUtPMnVaaHgrUEs3UTNQRjdCdEJxbWRadE5wcmFnbTN6RW5FL1BNQ0RKS2RF?=
 =?utf-8?B?clo2L0IwQlptcDE1YTdtanV3a2JJT094aXdqUkk1bFlQWDVibVlyT3RVRzcr?=
 =?utf-8?B?UVJxeTVKK3U4TVExYnVsVy9KOG9URmltZkpBemRyNGRneHBzUG9DVkJsTUNt?=
 =?utf-8?B?bzh6UDFVcVRjZHY0SFhJWEE2ZWlZNjZ1NjRpVFRCREtUZmp0R202eFoyQUVa?=
 =?utf-8?B?Z3J5RUZnNXFpRjlyM3lUa3VXWEtSdTRJNHRnVU1ZMkFzZkVSckd2NlRnbXdY?=
 =?utf-8?B?RnhFQmVNTGJyemNDQ2F0RDMwOWtIbis4TGdXc05ETE15QmlDNFN0WTllenJR?=
 =?utf-8?B?WklFMU9Nc2pTVFBrYUpyeG9SeWVhTU44dE40T3lnNHZvQUVrRW1lc2d0OHhJ?=
 =?utf-8?B?Wm5weHlZMUlPSHJ1NlFraTFHS3JtM2RWVDBDSVpLenZITlM0R0Q3VTBhMDRY?=
 =?utf-8?B?MWkrdWpIWnpVVDlBSWk0Q2VOMGdOakdJTDJlNFdJRi9wVDJiUy9WYW9KMzdp?=
 =?utf-8?B?VWU5eEZRUnF4WjlMSXdVeVp0ZCt3VGVFYVJMMlFVa0dPYlIvdFRPNFRJWGkw?=
 =?utf-8?B?OVhjQXRGOGRsRkZVMGdyQlJ5MzJYZWZMd1pVT21HQ1d5K1hna2dtMmFRRGdy?=
 =?utf-8?B?R2JxcDBpSitNZjBkdWZIdWtDRlhiVDg0NTA1TmYwam1aSTVaUVAvcDMxZm1i?=
 =?utf-8?B?MUt5UitiYlhUVkVCNS9PcG84OWo0cDdXK09YRXNkMEgxaDBrVTVHYTAxT1gr?=
 =?utf-8?B?V3lEOFkxZ0IxUTFMenRPQzRWT1FhelRBelp6SXZhSmtqSHNPK0ZnRWZQd2ha?=
 =?utf-8?B?VS9vYlQ3U2xtNk8wZzI5M2VjUDQ1YWhyWlNkVHdqZ05QQXhiRk5lUVo5VVo2?=
 =?utf-8?B?WGo4UitsaXE1a0ZBdTFrN3g3VXkrNWhPbzNkcGJLbFcwYmx4dFNZM2U2VFZ1?=
 =?utf-8?B?dC9DTGZZd29rSDRtcWdiMHdYM0hmeHJNc0d6V3V4YWVGL0podEY4bEk3Z2RN?=
 =?utf-8?B?anppenNZb09OSytrQTl1ZTBwYkJqOXJ4cUFUZnlmRVorN1pLTXdJRWJPTkJ3?=
 =?utf-8?B?TVBTZk40T3h2NW4xUm1tckk4TmZoOFJqdWVkeGRqaUJHRHlVZytYMEtEbjBn?=
 =?utf-8?B?VmRqWFZ5NmorTkdOOU02eWFhN1JXVHJkSkhTTitFUUF1WWVQRFFPUjNIUW9Y?=
 =?utf-8?B?dlpJMWNkMFo5KzIxV1V2ZzN1RHZWb0w4RWRsVHdGa3NMTGdxTkRjOThoQitF?=
 =?utf-8?B?WEZ5a0lJeDk3OHAwNUZEOTUyMkV2SkdvTWxrTHltelNCYVBoR1BPeG9heitn?=
 =?utf-8?B?WU1tOThjcVp6ZHREV0FJRTlzZHZndWVNRG13QzRkNHhYZXZnRk1DWUxrUDFN?=
 =?utf-8?B?MzRycnBMcU9KSTkwajZPN2pEMzI0dDhwRVJ2bEZMVjAwdEY5cmJ2dW40azB3?=
 =?utf-8?B?d2VmUTltWVh6RHQzc0xiRnlMSmMwbjE2T0VIN2FBZFZSVWdxT1dFSjc1aHM2?=
 =?utf-8?B?NEFPcVdDM0UrcmFZUE9Wdk5Ib0U4djAxQ1FFOG9HL0xoY25lVW16NGtWbzhw?=
 =?utf-8?B?VjFkUmRNVXlwcWNmenZXSGJVaHRsQVBaY2VUYXIvc2FsbnFObVNPNEpVakhF?=
 =?utf-8?B?RTMrSUxIUm9ybjFXWXM0OWRFUUs2azdrcU9xZG8rYi80YkptWXpqNW8vVHE5?=
 =?utf-8?B?KzdNS0FlRHdFWkFReWJjR0MycS9IR2NuRTVMT3IwTHlmeElDZ0dxY0l5UEtO?=
 =?utf-8?B?N2E0NG1Ob3IycFBkemhDbEU3NDJKdW45bUxGbmpHemdLUmlYVVJkeHhMVHdz?=
 =?utf-8?B?Wjc0V1NsY2ZuYXJZSTJYaTlXOFdMT0xqVGFZMWJ0YTRBbktMZmZpRXFDdEE3?=
 =?utf-8?B?Q2RhTDAxSTBGTkhQbENlZE1KNEcwT2pZRCswSy9BUXl3RE1HOUE3MTRDdU1h?=
 =?utf-8?B?UFpSd0QxNzR3V0d3Qkh0NGZKT1RUd3AweHJhM2toSTZkWW9DK2pueVVBSGZ0?=
 =?utf-8?B?VjZJK3RRNm1ZcERtNzVkUm5iR2lzNUE5SitFVkVMSDVJV3pLQ1JhcjBHUFpk?=
 =?utf-8?B?SUpzNngzcklkUXNzYVNkQ1hPaUpHZVQ2Qk1lb1ljQUZkanZMRE96SEYrTk1x?=
 =?utf-8?Q?tkm63mALfHs7bwUOtWEqufc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6adc20b-3bf8-4ecb-f876-08dac6ee82a8
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 09:48:13.7348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dxLPRbDPYi721v3+DOtQnj3E23Fi6zzzmw5i/AqkY+vqIIML1TaKAPU8ZcuZhUTUXuaxB7YeZj/L3ioZvgHyNNoNlU4AQQOlAbi3//+E+AqPEqjgRKYIPSnN3DA+3xWS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6531
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
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07.11.2022 09:32, Lucas De Marchi wrote:
> With a lot of sub-section it's a little bit hard to find the information
> needed in the main GPU index. Limit the maxdepth to 2 so it doesn't get
> poluted with noise from each driver and from other sections.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  Documentation/gpu/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> index b99dede9a5b1..1d9402d519be 100644
> --- a/Documentation/gpu/index.rst
> +++ b/Documentation/gpu/index.rst
> @@ -3,6 +3,7 @@ Linux GPU Driver Developer's Guide
>  ==================================
>  
>  .. toctree::
> +   :maxdepth: 2

I have a bit different opinion here. I find it helpful to search for a
topic if the headers remain uncollapsed.
A top level view is anyways available in the TOC shown in the left side
of the page which shows only the immediate next level headers.

Regards,
Bala
>  
>     introduction
>     drm-internals
> -- 
> 2.38.1
> 
