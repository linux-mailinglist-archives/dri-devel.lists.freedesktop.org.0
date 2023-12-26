Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B2B81E90F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Dec 2023 19:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CAF10E121;
	Tue, 26 Dec 2023 18:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9093C10E0F1;
 Tue, 26 Dec 2023 18:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703615451; x=1735151451;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1kU65ixTKKiW6jWyZX2VBn78giGBgE0G1+qZ4EDC8rA=;
 b=UAf7AYVuhLUD9GqidVJbIh3VRtt0g/c3zP4JY+95IvrCV3HeUBNo66KZ
 N9sBpDPnOsfnAXdf+LIFpehwMXiySSygnri3EwbyoNmHrKnGfmCb2nrWq
 4qehAp5wTJ0I/2fVJEtmJN6RW+xW7SwiRjYau2fS6WsLYRanubno8pgsn
 zV+77ejIjuoeFQxBjLNrQX+5YYWJDUGRB9R42eM94guXFa7MPyC33YxK3
 CAchzLtkJfMPNP3PzqUxzYvuDjovFpfDlbwWhuZ81TiyR234THI0ZzJyM
 X/evb8Tx/7YO50H3i2+UAo2PNJa3e8i4CBOBVe2FcHGU04CoTa5vzkiOq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="396103594"
X-IronPort-AV: E=Sophos;i="6.04,307,1695711600"; d="scan'208";a="396103594"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2023 10:30:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,307,1695711600"; d="scan'208";a="26358960"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Dec 2023 10:30:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Dec 2023 10:30:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Dec 2023 10:30:50 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Dec 2023 10:30:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hx1pAYCLuCKPuSNYqpquI/3OstE5aIQOf5ElynPBHse2tsYY31xUfht+KNoOLdQIxrTIMN6TFGGxBC551B+OZVgQzBagtXJPHhlkO0DADkMWKL7AazmjdHhDQnD2a19jyub+zJnnTIDeX/bq/zQvR+8r2JRcfNrNYvdgiPhkMWaveEQmzqO3+Je7RVlZdSIzXoKBOK8LDytlo32FFqrl5TB44R6AQS0V6byi4XI2Efe/906TYt7gnkP7stXYmipH9NDtVWfLrADpEGxjGSJk/JVW6ath1vwUO9zjdBUm6O1AqOc73rgFtjfQgIv2rTIlrUQ0q7a+P18Te+PvWxm28Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnQJiXMEFX8Q1H0D5Qmr9iBbmi2g4bFbH+dB3H7p4sQ=;
 b=Ao0t6GK9dMlyxUqIxGawDzdW8nlR9IeZl67nrD8bZPC2bhWCxMJGmW5e6BdYmtGCJA/a69DWWR1TWVrfw4oUZuVLA8rcePE+g8S8SbQs3l8j/liaNSvM34MXMbgB/TfqpYVeEGMELZUx6IOeMxUXZ/f+VTMWgjzglMrY5IaE3TLs1yOdTfLmKOvvYOrieJ2a9M/k/D91aic2VjTnxoJ+lDqNeqqFOh3PU+XMbMLNvKxXNn+2lvyHET3kPq0kwKaOa+GIqF8Y9t5vth3SR3z6buHPNgWLNwHNPs4sF6X+bFtDbCaZ1ooLVe43RUm6tYIl75/T5XtRZ7y6MbIcsj9VZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.26; Tue, 26 Dec
 2023 18:30:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Tue, 26 Dec 2023
 18:30:47 +0000
Date: Tue, 26 Dec 2023 13:30:43 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] nightly.conf: Add the xe repo to drm-tip
Message-ID: <ZYsb09nsERQFDCQl@intel.com>
References: <20231222113640.14038-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231222113640.14038-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR06CA0058.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO6PR11MB5634:EE_
X-MS-Office365-Filtering-Correlation-Id: 422fdb0a-5b53-4b9a-3168-08dc0640c743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y6WVzJeVRHT/XFEQ7ob+sm5Z8OI5ZWXe6LIBJavnvDSOdka3Kl7dyeIZthG9I9foxnjuTjB+bIwCC7UfSDa8n8hwcpSm0oVY/CS83uchAei7BTJ6j1Tx6diJuOjRhVndp6jpZTNSsrJwaM6wyB6gmiF9YO/SzNoJNRCO1a9RAGivCH6d2BRk0BGRB++rPueGIiODI4vkNDTu47s6Sk7tHTYot2zy9OVp1VhhfuysWzcJfHxmllB13M/SYnoQ0Wqj8l9tV0050mVw9GMY0BWoW+zxbyMvQZmOywhoMCmXUnMaag7zbakBffal6zcKkkz3emulOAJgvq0u57irSGIHD/8k63X7KDaLjts8oyq0VDfLbxB/IeroM2kNhKtNCw/TrXqc+mXVYV3bLeB4kaVbPqueZWJKI1yTDgE8WwfBZaebQjKIqBlqLi/VgWABPKDMbMO0zdvaBWrinTyUKN/EcsAT4OBcJrelEoBGPQEeTKDuBD6iMDnsYufLYX3u3p/vbDLAjfs0YAb6pyLUj5dANZE1EkUTWh6GFPWkDD1YG9I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(366004)(376002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(478600001)(6486002)(966005)(8936002)(44832011)(8676002)(4326008)(6666004)(38100700002)(82960400001)(6506007)(2616005)(26005)(86362001)(66574015)(316002)(6916009)(66476007)(6512007)(83380400001)(66556008)(66946007)(5660300002)(2906002)(41300700001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?t+NMIjoGmHcq47DuNL3MfefyLbX1icO5WUUjSfpcUlAXs1VIuAJOAl8nAv?=
 =?iso-8859-1?Q?YZn/TC71MqeVqDk2Oeud9AK+Hf60Lq1+Jra6cAf68i+4KCP0n2AvThV5N0?=
 =?iso-8859-1?Q?XoFgXHA+lV3rNRiqO2pq/IKT8Lcg6/NW51n/CWZLdVkzpWGg+0gVaZz1r+?=
 =?iso-8859-1?Q?VFtw+Hx8hzBHxZUpECmp2RyKOR7wPQDGfC8PP4dZLsa4dGVRJDxlkBXGrH?=
 =?iso-8859-1?Q?gJlbmcw+xI3Sy+XAtbSNeqlrPzcj5Zn8ZwYzqJ5JYnxl5HArZ7U5vptYht?=
 =?iso-8859-1?Q?/83uiFzp2swB5bQWD+NOKXsu3L6StRtNjKR2Wln9BXdEloPuK+o0G/ZNyv?=
 =?iso-8859-1?Q?5ilJlwyx5AGGcY8oLDOHzQ2hC8FKHdbHQ0Fvd7crfp4sVd4wqYLbbd+iCT?=
 =?iso-8859-1?Q?4sRnlL1zSInSGq80tf0whJ5lik01zn7XgjSgYzQnIwRPyKKnwAh3LOtNLS?=
 =?iso-8859-1?Q?zjRY+PKyqH9f9FuXJQmqCNrsuF9kj+OqF1o+6I8SZWSD+L1XQxQ3UBQyRp?=
 =?iso-8859-1?Q?4i47O/+REPAIWAakIMPJKWTDWBLvJrtcvJHiskZkWN4qMAjHWU/l5DIxPG?=
 =?iso-8859-1?Q?TleHjk6OhbpVSw2ufxNVh7BCSZEiIjqFAwZBgQC2iN8IrVM5Ks0TLVbkJw?=
 =?iso-8859-1?Q?Wh2BNsq336aIb5FA3/caY7CcO5+VmnPMVU1rZPjGyy7P+zcG0GHFnAWuM8?=
 =?iso-8859-1?Q?m7K8b0iLgKDJqo6BtBA/ny2tQ2Egp6icHUoDdf5i4JylqD4TzUGBGLTVqF?=
 =?iso-8859-1?Q?jWUWpXEqf0RIIigBjHKf2rGPIfCPpZTNpO3OIvH4ciTfXXrLy+ut0tL92r?=
 =?iso-8859-1?Q?elAYJErmoul7s6mNeQTLgrJEgysbJ99hLwkAWNgZ+tK5CDhBkVS9QFeRFn?=
 =?iso-8859-1?Q?TSoC+KgaE57G7d+YLXaTwq1YlmPNzipWjKnNsk4ebYSbhMa5bKJTldyM/t?=
 =?iso-8859-1?Q?pNyDWaKHlyAI+LUqPFuJVsLjN4wdFpeGimoVhgZM4zg+oYiII+unbbQh93?=
 =?iso-8859-1?Q?GnEZn/jMvuno8qIoYM8FwjJNy9gekwJORYeu9WEUwTb7G7lCInJeWdk4KX?=
 =?iso-8859-1?Q?Ym0mkEOyUxvMZUmaHyKsSEyRT95beoqEyk6Oa4/AyBrzdsERAUoQTo3KQ3?=
 =?iso-8859-1?Q?05CnMRxTDkxZEnCu36lLPupW0qUWG651EUSKQKFVNIs+hn+dO+Yf/kBUPK?=
 =?iso-8859-1?Q?XXitR3yItIku1LS1GF9Onzn128zSMsuXoVR65QDZqKJGdJzmlGR9N9yLbG?=
 =?iso-8859-1?Q?iBg8krYze9MthbOWMF+mPyXB+vde1EfAecfliuGgouQLsRdYusHqrfeMb/?=
 =?iso-8859-1?Q?z6j5+pS2ZL9gVp94Wqu2Y2DOCB4jkJ9SKex1o+62cH2UVLiyzFg5jvtH4C?=
 =?iso-8859-1?Q?RX/IcCoHdRe9dqJZMDV06UZjWeECC7+Nf7EoMlcwdD3XWntoGRoDTqY1MH?=
 =?iso-8859-1?Q?D/PXOv7iJHjtF7WBekCurdeJenzstU1HZCWjQh4pCmHDXExnyLPx0wZ3LA?=
 =?iso-8859-1?Q?/53YXOXEPvJ2NACS8ayb2l2ebZ52Okvo1bCR6RCNvZr0K743JiUoSJf0vB?=
 =?iso-8859-1?Q?iU4/o5FsBHPsxN+ZwEaUySx+j5siY+6piWOg1viYjPbPE2aTfLR8Dn3YyI?=
 =?iso-8859-1?Q?SelGwdlEyaWdYm8Kk2BZ5BzwVxQ0iUf3Cw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 422fdb0a-5b53-4b9a-3168-08dc0640c743
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2023 18:30:47.3116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XoWhRcqTGYQ7/dxZKho2o9UZi/phwgn9YtWeP5u3ssL7EcEPcvnrMu8QRdD3KrLxpHJy1YTKtKyK/j1DRPafhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5634
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
Cc: dim-tools@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 22, 2023 at 12:36:39PM +0100, Thomas Hellström wrote:
> Add the xe repo to drm-tip and the dim tools.
> For now use the sha1 of the first drm-xe-next pull request for drm-tip,
> since that branch tip is currently adapted for our CI testing.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: daniel.vetter@ffwll.ch
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: dim-tools@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  nightly.conf | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/nightly.conf b/nightly.conf
> index 24126b61b797..accd3ff2cc39 100644
> --- a/nightly.conf
> +++ b/nightly.conf
> @@ -24,6 +24,10 @@ git://anongit.freedesktop.org/drm-tip
>  https://anongit.freedesktop.org/git/drm/drm-tip
>  https://anongit.freedesktop.org/git/drm/drm-tip.git
>  "
> +drm_tip_repos[drm-xe]="
> +ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git
> +https://gitlab.freedesktop.org/drm/xe/kernel.git
> +"
>  drm_tip_repos[drm-intel]="
>  ssh://git.freedesktop.org/git/drm/drm-intel
>  ssh://git.freedesktop.org/git/drm-intel
> @@ -65,14 +69,17 @@ drm_tip_config=(
>  	"drm			drm-fixes"
>  	"drm-misc		drm-misc-fixes"
>  	"drm-intel		drm-intel-fixes"
> +	"drm-xe			drm-xe-fixes"
>  
>  	"drm			drm-next"
>  	"drm-misc		drm-misc-next-fixes"
>  	"drm-intel		drm-intel-next-fixes"
> +	"drm-xe			drm-xe-next-fixes"
>  
>  	"drm-misc		drm-misc-next"
>  	"drm-intel		drm-intel-next"
>  	"drm-intel		drm-intel-gt-next"
> +	"drm-xe			drm-xe-next b6e1b7081768"

yeap, up to this commit nothing else should change, but
then we will need an extra rebase of the rest on top of drm/drm-next.

But then we need to decide where these following patches will live:
880277f31cc69 drm/xe/guc: define LNL FW
2cfc5ae1b8267 drm/xe/guc: define PVC FW
52383b58eb8cf mei/hdcp: Also enable for XE
bea27d7369855 mei: gsc: add support for auxiliary device created by Xe driver
fcb3410197f05 fault-inject: Include linux/types.h by default.
8ebd9cd71f8ac drm/xe: Add PVC's PCI device IDs


Will it be the topic/core-for-CI?
or topic/xe-extras?
or what?

Anyway, for the inclusion like this, after our CI is ready:

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  
>  	"drm-intel		topic/core-for-CI"
>  	"drm-misc		topic/i915-ttm"
> -- 
> 2.42.0
> 
