Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A71D155ED1E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 20:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE0410F172;
	Tue, 28 Jun 2022 18:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4C910E5D3;
 Tue, 28 Jun 2022 18:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656442756; x=1687978756;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NAVFk9svbD3Wp6KuGcaband6EkFaR0ip2+hflgUw6ow=;
 b=dsDZXdRUk4Yhe7AKqnrKdKfxyBICfRWWkf1hAe8Me8x851Dv+st7Uw20
 U6l7zRrDcQV/gmq0GWBdEdrjRFrZ3K6jc2KNpoUtSQcnA4D+o5AJ1w7qL
 T7zukLrhZGZurDIiC09Bl9qAOWuaQKLlXPAODDX12oTkxmmKbF2v+dTNK
 KE2PKJXZS69BkosGYKSTxN1GtD5tNMVXiutG0Yijzb3veLiTKVjT5bPjv
 HJCfrMmoZp8ZKgtJS5H4HA/GYjct2b81wniTYr/idsqQPzKHHyFVWaxMD
 XBxb+ryelQcGYO1JN2B4jntkxoHRtsiJe33ervsSOFhENJQA1KHmJx0HJ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="262232680"
X-IronPort-AV: E=Sophos;i="5.92,229,1650956400"; d="scan'208";a="262232680"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 11:59:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,229,1650956400"; d="scan'208";a="623042199"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga001.jf.intel.com with ESMTP; 28 Jun 2022 11:59:04 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 28 Jun 2022 11:59:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 28 Jun 2022 11:59:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 28 Jun 2022 11:59:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBKbyCAaLl7lfN1/itS4yRvx8AaxDNRDOLBb/nMwLXK17NK/EaQxzGvYpAhA75fCtCMS8KIM7xfSD7bvrDKz+/eDc2NTnOkd10D88h1wti4iH5rj94LhRWTG1jlKHNb6zqz+QBjesLqAyldhtgfUwky1nS/WXSSS1eM8vxGa7sbJNG+well8gUNj4MyY5v/bULjNDTjI6U8Z9KHHXUwDJPnVcBUOB+/i8P67nTMpE9T+D3xNSrx+oOIwxszuABVrTiRxyWCUKwAIqsR+TP0NrZfpvz5hw3IpSKyCfxkpNXIk7UV7JKc64w13Ud8JSGxL9ASdUDjZJCXHgge2HDLenA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4QB59gGmlwp28H+Q1w+TKgIop8FeXLvNUmK3JXHpKA=;
 b=NaE/9TqPaqO9obb1hD20Rt+qhh0+SmR1HK4bGZUvAbtNe3JgnLKx2qCRZ8pZm5aVT8fiREkrGfD7hGGfGqLJlz3W4tzzwmTqrXsHSONbDOxWJtae0D2jQ84zdDchcCpQ+TM2Vv4ucubxRC45ABG7bbMqKnWyN8j+gHy+kDAD1fsdiR+eEhN6de3HuMK1LoEp9mZ7Zi+X1n5bVv0DzS0i+j+mSEmbDzh0k/UDRud35Uf9JbNp2Q+JSHR0e5qSzgxT6SjXduJg0f9JJCiDVQnlFDcqqMnW+/Ta8Yjk2C0auX0u6R43D1QdF0z/b/nWBwi1spbPWtQxxrwmeakGxPGoRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4720.namprd11.prod.outlook.com (2603:10b6:806:72::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 18:59:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fc50:22fd:6bdb:5769]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fc50:22fd:6bdb:5769%7]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 18:59:02 +0000
Date: Tue, 28 Jun 2022 11:59:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [CI 1/3] drm-tip: 2022y-06m-27d-16h-18m-47s UTC integration
 manifest
Message-ID: <20220628185900.wrwhpaxuz45qr23z@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220628184747.3844242-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628184747.3844242-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MWHPR1701CA0014.namprd17.prod.outlook.com
 (2603:10b6:301:14::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecd7029a-e576-4ae7-0779-08da5938445c
X-MS-TrafficTypeDiagnostic: SA0PR11MB4720:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yPGVzT/rImqxR7+yTMl2d7TGOXawDx6N2EAQMXfAIyOsbcQ8k75KwZxkycWhc6esRenQz8galOv7wsI7igYHV994DHb8xdw8HFYJP4e4nngC1Tt0kLCG9J9ndnrI7foqBwE18b0D8esFe5jsccLMU231KkIhdC0U5dzav0TsD5eto6+mfQK5g7onAj+fNz6axtN9IJ40sNQzxaQsjOpL4MckCcwry5FsGGnW6iDUuKTBI2qPux+UvaC1XXVdFcS+8PYVTeKx6NEEa4CdDaHZh75JpvBxLxrHW7tUlJwJFgVvikTRf/R2ObmKwF6yxp/7zV/yZD9oqqNeOHS33t0pRw0ehv2N7aASxQnen1HkLYE8LcnjB85/p980KV1MX3Hre/+rGbfdvNBYn4tFOFZ/RK+7+xy9jI0jLRXvFQU3kk6ZNW71u6npMnu8LU7P8b+7h5uunrWNzRpfaH8NC+jzJDDWMju7rct2t/HtoZYLbqNu559O6Z2/Sl2dapGGUoby637RVXJv3LlM8XclwRYCUFoaW4OEfeF0yyB8Mn/gshkYtKtdlaK5ZYQNg9U8BU4e2LOPY3AEPNOR/YXL/wIIigoml/eQoH0RZtAeUYpeSheDpj8sMfpLj85gO8o2zHLBFMv+bz+vardNdFBIWhIGPcf1YYPbJ5VNYdEzO9HKQ9D9DzrrQsxL+izPA7Tc4VkDQ0l3uWK666lj9Js86qxo4TGOpsjig1C2+W+YGHXnM2A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(376002)(396003)(39860400002)(366004)(346002)(136003)(38100700002)(66574015)(4744005)(316002)(2906002)(186003)(82960400001)(66476007)(5660300002)(8936002)(66556008)(66946007)(6506007)(33716001)(4326008)(41300700001)(8676002)(478600001)(6486002)(26005)(9686003)(6512007)(86362001)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DoeQGg7d4lee9mMGO/bsEdf5uW9NNq21bjSTPmgxmdiTxSViPPKLmkfXw5?=
 =?iso-8859-1?Q?rVN9P3bCM87A4hoej8nsEvw0wr16/vChDS1vO86Ixrv8utEZ+UDMlLP0if?=
 =?iso-8859-1?Q?rJyrCBhi39saY0Fb4BpnGiNbWZrUpUNozhhoPnsLg/WBmO/kV/sT6x0DJP?=
 =?iso-8859-1?Q?bZslrqsPaEW/tkryw/O5x2wXD3NPAr7GMrSNR5hj1zIBQSn/03ZcKmBUFX?=
 =?iso-8859-1?Q?xmZYpXjEL05WkjRveP8xAZ4rQfmbaF+qDnrIwyavQzdmS3SCFt6tmG5skY?=
 =?iso-8859-1?Q?lKHqn/ODwvrlCzXXLueGmOHfgGDFl34nsbDSc7E/4oQt5DIT92Cyv/1Ild?=
 =?iso-8859-1?Q?AxTkRQ3ftGaAo/QT5nfEnl8No+FQi8xTa7a4JM9hrjq6BSKksfX7Q6SFv+?=
 =?iso-8859-1?Q?JwaaZIji9DV15JdwQg2VruQ9Fm7AuapprlO8UVgd49Oiy4weatvkWXuLRO?=
 =?iso-8859-1?Q?1N9euGQMkwrhqXLrvst43qQSist9AO3YDeHWvtVUrroMFwuaYCK8dGUgBQ?=
 =?iso-8859-1?Q?3cj5dlDrpJsPCeszYUuwY8z/DzASfJqiWG/oAUwARkEi++QHiNkgHI2bg1?=
 =?iso-8859-1?Q?LarVOrgC6014XjYlVH7N+NgMkM3UcbFfyOnQMQk2PHkfQe5VU0mz8uNsLt?=
 =?iso-8859-1?Q?P8zXjmqmlFu06uO7trKab42sGPR1/5FW4Eacrr/1Gsnwtoyh4WVt3LLCYI?=
 =?iso-8859-1?Q?HXXspZA9fdnVghWxePrMe1szKVggkXDpOSewjxCxRrZHRr/S1XUZTK3av9?=
 =?iso-8859-1?Q?1TwSH5ZBUrw6P7xQMetJKe/pkqwlsvDLnegdUamgtTr6rDw4soFP2sCnSL?=
 =?iso-8859-1?Q?KtN8iV1tjNEMylbfNq9uo5BRThwabV1qrr2RTXVhA5Iw/Cw5ZEpSQ91W0l?=
 =?iso-8859-1?Q?7g7ddkia9ZGoIg1B+WpYLr3po62ihCPnSOJv+GXt8nDvCBvwJw2j0picH2?=
 =?iso-8859-1?Q?G4tdR6fGEz7F9jarG76gsHRINwqlWTzknzf+VWzPsSPOv63O861sx5TRV/?=
 =?iso-8859-1?Q?LR00gcr+hbE/ZLIxSGdhNIkfqAaxpWxx5AjqJS8xyiiJECtQClXZbgpfIL?=
 =?iso-8859-1?Q?TJJOV2oftr32pLkOkAliF754fa+wcOwS8RyR5/JfRiqU00NeSNQnYwEdTh?=
 =?iso-8859-1?Q?qhCBlU6K49Oss1rjA/JnySwVmPWfdqzKJEo+nWwDL0GPKo0rQjRzIRpc3+?=
 =?iso-8859-1?Q?z37y2DmB1611iCVKyACIWExnj9aKWHAXLnjtg54PxPJ7mK3+m+6zaA+Ge5?=
 =?iso-8859-1?Q?sBdhTLGTXa/kRarU9O0CvTtQ0zH/76MNkTj1DsIDg+omrgCxb7+u347oMe?=
 =?iso-8859-1?Q?YABHe8ZPeHqcTG2rzIDJlQUAlu9V/aV2OolxkaP07QBtX2B4Ituw/kDRHe?=
 =?iso-8859-1?Q?8lfoAV7+qjoaBSiBNQuMZJ/5IgSqSAp+VVh+qCfD8qALlLyofElk/tyKAd?=
 =?iso-8859-1?Q?p5C8U+cvDe83l5djyLRyFcmrNv0QXjUYkxdXbNyzE6/+ZvCOUacH2m6eBk?=
 =?iso-8859-1?Q?/IkOwbYewF9vzCLSFkvcN5zjV7GuPHcLx84gmyKbBSZwNOV8xi6keXuuc4?=
 =?iso-8859-1?Q?2cEvmSMmFwVoUyDvP7ZWPskRu/v/TJUBGMcMcbJP9jc20Bo4s+dp52Czbi?=
 =?iso-8859-1?Q?kxU/oDSMh+S5pAEQS9icyXBzqScVlhpX3cWdAaH8r5YaTG+TwcO1Si6Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd7029a-e576-4ae7-0779-08da5938445c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 18:59:02.7987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfsbsdSvguO6X6hm067jpEBy6kWvuQ43bD9weIXzbWWAhnlZgl5x5prb7G/Ln7I3tpPZryET+MsepxvME0vbgHfYMQADZGpG7ChEbF/K83Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4720
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, christian.koenig@amd.com,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 28, 2022 at 11:47:45AM -0700, Lucas De Marchi wrote:
>From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Sorry for the noise.

This should NOT be the patch 1, of course. It went here beacuse my local
and remote branch were out of sync (and drm-tip/drm-tip.. then includes
it)

This is intended for CI, but it will fail to apply. I will re-submit
this.

Lucas De Marchi
