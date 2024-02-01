Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC98845CDF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 17:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFCF10F15E;
	Thu,  1 Feb 2024 16:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2tlnfif";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEDF10F094;
 Thu,  1 Feb 2024 16:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706804213; x=1738340213;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LWu75toGMWQhTxGnVz7Du8qJZzxOnQeVgPmuRzptH8A=;
 b=I2tlnfif3xk/td8wXfmH1VVkSyZe0srSIyEwk+n7wOI/6PbNLdcH4Hdk
 Wo7MPbMt0tu305ZVGZxxb7yQT/cHtU9B3ARcoKn6f1ykFAX/bRyF/MhpE
 eMwpvPXEhmzW1OLHRsgxtQaxqL8dETsYRy4SrtCXoiNziUNokycufmsHE
 1CxyuFvsYeDTAfC5BUDTvScTBxG9B7Psc9WKhHpiPzNvS9D0J3LQe2zos
 as9m059WdbLYfdyufxov3bmXRWB2DKvwJagFncFZgJ53BsAvHben0POOx
 PoYDWdqrUDPA69TZQcVYOOmbiAhqjeatBTSbaw6YKZsF+8enZW+GkrXYY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="468161898"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="468161898"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 08:16:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="23135738"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 08:16:49 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 08:16:48 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 08:16:48 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 08:16:48 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 08:16:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/DDRb0HIMj1tZTQbv+10sR4dx4mmHqd6OSUNbUYTG4YRy9dJal1NwLH9Qii5kZEgsIs8d2CXgR9ln53MiajkdEv77KGaWPYYhye1iG8osDDhJfQVeavGqEobu3xh8lh9mWkg0fa2+JmgOC3AJ5Ajs/VquxS+lLIAzrrECFN+CH6kSbTZgQvE7lEFci+nCHhTj1tzkqTxCS5tCWhxoj4IpFZpDgH7h7/J8jq+L/YhEtKm8QZv+ATGOQ7rHPZbza08KD3f4BEtSTMRmwHj0udZFwhIet88kevuzO2bWOdWE2lF2Xp7B7FwfgK6ac8J0s7ZE+3KmlhhXiILCKHjakrrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSVFWYlbOS/7caaRumACL0iDVe9+fH8/Lk0M1XO5thU=;
 b=Vww04tlfx1xbLoDSQu1xv4zUdXZMj0nzyw08tlhng4mNsQxDoleFAWIGG3RT1DzYLWwjNA9367d8IukHN4wgQo7MdKXS2OTyVBKXRTRjWWpyHYfhg2hJjzKsrK3X44YzhE0PH3x3/kAhObcRPYRnokg/S5lYR2ccv6v2lk9Uw9wc9C8gx5NwAMDwIPwQODx+KKtcsKSkZ6JKy6DvFkMPuQQPsAnCBXEPATE18SnL7F1ssLAtU9UCDnXBoN/tXfjvPNeIocsS2b9vQ9d6Ne9MtP53TH6y+YvqGHSKoJLziiaFnCUdr0GAKVeUfdpV7wINQpZCAm9R4RrpqCiCMd11Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7483.namprd11.prod.outlook.com (2603:10b6:8:147::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Thu, 1 Feb
 2024 16:16:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Thu, 1 Feb 2024
 16:16:39 +0000
Date: Thu, 1 Feb 2024 10:16:36 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: Re: [PATCH 09/10] drm/xe: switch from drm_debug_printer() to
 device specific drm_dbg_printer()
Message-ID: <yivsrvud5khq4vjl5g4aigjwru4zyxfzp7bgzzxcifchpv7kll@4bdjrna2levy>
References: <cover.1705410327.git.jani.nikula@intel.com>
 <35929b030f7ba67cd32808d42e916aa9cfb5709d.1705410327.git.jani.nikula@intel.com>
 <87y1c4fis8.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87y1c4fis8.fsf@intel.com>
X-ClientProxiedBy: SJ0PR13CA0210.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e72709-9fb5-4093-97fc-08dc23412b7f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fEoGdDFV0zV529Y142lb5jTUHam43yWQndxT+7fWgYH6YwxYw5P3ooyMrvZRG9qazXP9g6Svllq5KgIjHZnCLV5S3NXKuKdGfKAe6vpP1ipjbJhUNxpnoLtb9yqPXhgKqvbdunG52efXBr76KPqhI3t+wsBWIIecDUYYIvh6o7FL6r/Lr7GCp+Yku306MWncKQtCA2vPv+DW9H5QYdaAHqP8eCsjHBaJLtY5euSSjpjQg0TGJt2eyJFt897GhlgNDTqyqNWUemNtXfeh6FjaAN5955T5b9xSOasMzH8BV+ZPm9z9wpYn8/L/l48eebYJtgjlIraYoQ0C3W7CHddjy9NE1LZohnp3fUHSwUklMole5iyhcuXgYLIe3SXMoMjiV9u7XRntKX3LebfDQzZhRNEkz63XyQSWf/rlLo2Ddb2f5iGmxNgiUg3QC8h6hduYp9XqdNKiqyj2rN0958NocmteVOr3cXhKuprn1OiQKlLOOCSOEP9wmK5We8WgPUZKDnNvy0ydPlP4DO7gE9bg9V+DNDtUfvmruvzQBn+xnYlNIC7kt5rpYAsKw/+2f7u3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(39860400002)(136003)(346002)(376002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(6636002)(66946007)(4326008)(8676002)(8936002)(6862004)(86362001)(2906002)(4744005)(5660300002)(66476007)(66556008)(316002)(6486002)(9686003)(54906003)(38100700002)(82960400001)(478600001)(6512007)(6506007)(6666004)(41300700001)(33716001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VEsC37k3XAUX2kKVCWFr4v6Zoo7iXLX7pZaK8sClvpozPYI07Nye4zrQBkYN?=
 =?us-ascii?Q?W8GsGlmvL5palQCKieWfbYopR00GbmBWUKE4WTd3vdwF+AcqzUjxGbIRAW1k?=
 =?us-ascii?Q?/2pZaypXMDwydRBR2oTW1QUukEZe73TFWEHq/Yh5+tsLo2qZeAFIwHjf+eKY?=
 =?us-ascii?Q?QloFc3xjxM5S43RnklX8eIDuV94busPiME2GnsijscRuyotFIZxiFV6cQllS?=
 =?us-ascii?Q?tkOxj/G3YomlvW+86vBXmHOyHkBeGOq7Hw2QJU94645hML1HxxlCdfl7t6vB?=
 =?us-ascii?Q?0MWzy0GCR57LmyorFZUKYeyTRVBl6VofjBKxJTIRfuSTpEsyj62vDD2uH78R?=
 =?us-ascii?Q?Y3tqjiDHmkEgy42KoncDEzb4P42rhG2/KlKwO3t7Neb9M7+w7cjzACX/DlAf?=
 =?us-ascii?Q?5iXwlhJS3/3Wp6atjCXyCXoF6gOCWT1H3Ez0Z96naBbpo5sMrl5MXpSFSSAv?=
 =?us-ascii?Q?4d7gbDk5zzTedcurZLe/+N3JggeJfFt+EihW3A+ApCLqVFtwi0pdJk/d0JnI?=
 =?us-ascii?Q?zNNLoUYWli4RrCVyQLmDXAp+Ya+3EhqiauGZlayn5eSQmNKP9zeSAI3lEs7H?=
 =?us-ascii?Q?sIX22miPOZvpdzFogzAUahkA4gGgVfcT02g6GdN9nLNaOe5d/uq4hQbWFt3n?=
 =?us-ascii?Q?DBf3VMIlcWz20TEgtiVNsWt+xA6vrDHM8O1ITrmF3LG9kVEViy2SzecNneg/?=
 =?us-ascii?Q?8BJ8/AjzDLuTLUb/MAeYO1/ZZq1Tb8zeKHhfyTmp4A4IUgFrbi+ej3ozbmnz?=
 =?us-ascii?Q?2i7c6zDQ7IB8vS1uWmKluony6b8/pwavDlTOI8ijPTVaXVvdt+c2+U9BBbCl?=
 =?us-ascii?Q?j8TodvX+GftF7ExfRmf2iNHRIEXFZE+m2wGUBpfLwu209vlEXzd3I7B6A/w4?=
 =?us-ascii?Q?/2DHTg6cZoC0aihGkbx316Q1hfj08gfhqVcAstQxqQeOW/XpCDEVawGyPNoY?=
 =?us-ascii?Q?V+GpwfkGBZqlO5t3nDZKBO/hFkPljECFgvZvTnLZtcHSrFzbynyLFAFYtXZB?=
 =?us-ascii?Q?xd75jrXaObBTCipZ4/3GuXHiGHXR4uw9WfTpdvtgEGQ1RuOH2bAPAJ0QiBVg?=
 =?us-ascii?Q?B2iODF3i+BW0E76yoxitgi11jn+2u0g1XhYYAA1Fnl9wp5ujtIeFye/tC8yx?=
 =?us-ascii?Q?MCzf9Qs3y+fsbk53W5APsxrCPeFnvLwBxjPuPg9cTI0Cc1S2VmHbtaa4uUOz?=
 =?us-ascii?Q?manLOXvz9EHHo1zXC7ufvrWVEGkWQ20h/sMnKuhDApBQhwRteMwr3Yfn9QUx?=
 =?us-ascii?Q?XdyhreuDimq/i/VhYprAE1nyQvBYv1sBEEvIaYTwmqOeTrYRRCX/oIoK8gva?=
 =?us-ascii?Q?Y0AcwITPdWtSLzq6RibcaIHnnrygY9FuCmcOd2xnuWA28DXr6ZuXpbba6uwU?=
 =?us-ascii?Q?Vyqzij84MkMZCRDbzF3rCB/8V8zEQ4XE9EOprLrs+kZBG9But/9gHyUAZNUw?=
 =?us-ascii?Q?GEu/6AtvAi9uoOrhRxpy20LTbTchV+qsH/dw0kFha+tlvkoSoe133N4ZIHcb?=
 =?us-ascii?Q?fdTSj/M+GvfoCe1Zucn73ippfMunzKxo5zQMwcipLdKjTICl4LtHxJIYmuUa?=
 =?us-ascii?Q?s2qu3oCMQLcUsycHEqMNf5ZKxDO7WzMi7gdlJjp4fTjVKSW42fnLBRJ38hon?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e72709-9fb5-4093-97fc-08dc23412b7f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 16:16:39.0829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PqiUzRnv+FrJ8ANkjrRHY/1bKy4OpDDzO+DGm0KpigSGrzqxVoJsRe+VZ4Pz+CSK4e9DWPi6RQD08+JABwnZPlAt+XjRsOJED5G6o5gYiaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7483
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

On Thu, Feb 01, 2024 at 02:52:55PM +0200, Jani Nikula wrote:
>On Tue, 16 Jan 2024, Jani Nikula <jani.nikula@intel.com> wrote:
>> Prefer the device specific debug printer.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
>Xe maintainers, ack for merging this via drm-misc along with the rest of
>the series?

Do you plan to also merge the last patch where you remove
drm_debug_printer()?  Any conflict to be solved in the merge commit?

This is just a question to know what's the plan, not preferring
something else.

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
