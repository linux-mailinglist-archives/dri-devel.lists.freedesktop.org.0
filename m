Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D26806E25BC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 16:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978E410ED53;
	Fri, 14 Apr 2023 14:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7EC10ED53;
 Fri, 14 Apr 2023 14:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681482609; x=1713018609;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CQ24gnsTNmmuswDCdZhvwwk3Dc/5DroiQ6diAht3PmU=;
 b=c2Sb6JE1bO1cvPTWEQxBpbP4VYrT6dYOz5krr2GHOenpjtk0L4HOlXOG
 LZNh0s0XBDFw3eol9zOlhmb+DvdagYBxi6UZn5eErejiyTKTKbQQinXX8
 AYC8UbWnGYS+5EW4fL8MZxmIKSn6BqtAcZ8d4VN+3RBV18ThSVKvF2nFQ
 hVw4uNpg769R1W2+uphrYqoCxfJi6uNmNPxmpMygg4LS46QdolVKkI4UH
 sauU1X3iYV9H/FVu7FP5VqzK/NiuJRUB8IqLwwf9dexlkPe1/0/VKHydp
 IxsB3NkuvANfF6zYXAuzUwY7njJ/0dqk7ZF1f93MdOD87wopoYxPim4uT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="324828206"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="324828206"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 07:30:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="692428665"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="692428665"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 14 Apr 2023 07:30:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 07:30:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 07:30:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 07:30:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 07:30:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+iLucv+YKHWGidBTRWybaaaVe2wsERFvWziw9vMXwnBWxQ0Bt8aix0xQmhyr2NbmHO3djunOoVLBqygmPQZKMW0dwDY1hPHq8et8jV2soigK8NKSsrGGLiT5ZQmGqHA1W3X6uZiJDKVxDExxK0tUxKzwZBCVfQ7q2fSvYn4pWfkEGwIVnc9+g+0m7H8bBVTWDtJ4Iq4wYmF324vTlxlRz9e/vn/ixH3DYga4443J9eZDyVz2BY7tETPEJEBxW9SphqyMh+seMp6DRpF140K2LMF0sTC01aUKzApQbnZfNMgrMC/yZgvXyhiAaob3pRIcxlMJmhxlyX0W5YtJtQxHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKTo8yiK62XBEECEUx72epcU2I50eP/KYy5NLCSf51I=;
 b=jHF3t+YAdu30yoBV3Ajxtey6fIg8EtS69i6MWum/ajFgJ85M8GsnPnKD2WbWgXOhRzQ8CAKEQDaO5ulOha0tRRSZRa1Rb5jjeKOUg0ujWpBdkONfMMcL8PZuyFj13f9DgKMGkJXL3eQwmldJxS4Hv5LJwhMCiSta4C5xfp10YO3hXjDg7fIzoL3U7/ok0OqPqeerNNioLOQv9KC7l2PbZn7YPdLaQhruXER5kAOjq9qL/kaSuI1VysM/kOhHY/78XphoysinO1B23jmUvr+BPnYi8W3MFXeGCCAhcmwzfw8ETG3nOGPNCIg3TAywIR2DCeEZukSMB6hCEJdXRI0g7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by SA2PR11MB5212.namprd11.prod.outlook.com (2603:10b6:806:114::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 14:30:03 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::23f4:7c29:30d8:f534]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::23f4:7c29:30d8:f534%4]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 14:30:03 +0000
Date: Fri, 14 Apr 2023 16:29:58 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH 1/9] drm: execution context for GEM buffers v3
Message-ID: <20230414142958.GB2945768@kav-xto-001.ka.intel.com>
References: <20230228083406.1720795-1-christian.koenig@amd.com>
 <20230228083406.1720795-2-christian.koenig@amd.com>
 <1ff3dcc9-5124-6d93-e3df-58e5e34160be@shipmail.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ff3dcc9-5124-6d93-e3df-58e5e34160be@shipmail.org>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0268.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::16) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|SA2PR11MB5212:EE_
X-MS-Office365-Filtering-Correlation-Id: fd6c91d3-3330-48d8-8bed-08db3cf4bc08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jt0o5o3lrirJ3eloNpBdBNnezrFNAuqL4EfNBPNVc/fRurubTKvKSB4EpTfkZYy8EQ8Rg50BQm0pFJqjeVBTOJgU1C+aqW/QjZiWhHPbz9noBPcpjS/uF2cit+8V7zQ+nAwYXDRzfY3pOjm2nVXfHLhsnuad/xVMcT9nZS1XjpbeeAOXiBXt+5kD36MVxEtDf77xkYC2KPNANmTt05hTxTlcRhbGaqJ5p1U2sGckxgJUOvCtzd4oSAxjHoTgpUivPYmuI+gibDql26tY+tPzFliEl0hIzuSukYMBCQwlYi19Vjr6bZrSpZhx1L8GKcLPaq5wznlJEu0oQOT4kWhsTHxWo4LRyZZTnfm3iOjer4KBWbeUPw6S7m/NerjlQWeNV6LyC8lgxFHybc785c8McQWtwXBfxADduU3e5mf/E9c1G1FFi8Fsed8/Rvvd6RN1blbBU6e4ERF9kWtOKQ7WKDA75wsKs4R8QPm5e8VDWoftr6sMT/5bv/9jD4zmpbHlRHBO2s1+WQer2YjEcV30PQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199021)(6666004)(36916002)(6486002)(966005)(5660300002)(4744005)(66556008)(6916009)(66476007)(66946007)(4326008)(2906002)(44832011)(86362001)(38100700002)(41300700001)(82960400001)(33656002)(8676002)(8936002)(316002)(478600001)(1076003)(6512007)(6506007)(26005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UiukQNFLBM6/MFwYf2DI3VjPxiDLmscUvHBB025fMDqXO1oqFQoKzjjNFb?=
 =?iso-8859-1?Q?xmDazE3qEf3R7+oafRJNwdY+4/R62d+1M90WzBsrevF7dbBAHG+2KZ+Bdv?=
 =?iso-8859-1?Q?h4wHstsI/VKpw3ggsKPdj4Ei6uSVaeQtsR0P06iti8t/k6EbYb8QOcF+fD?=
 =?iso-8859-1?Q?PVoYeL27HEgutr7IGi3AclcakGa8e1OWQHzHej2F7fZSWvxfT/qXhUpvTM?=
 =?iso-8859-1?Q?QNr3IxQQvdrJkK8tzQki0fL4zNGi9hfi8GJSXsFO4t4N6J8lGjS06jqIvd?=
 =?iso-8859-1?Q?T1/XFeb0cw+IVWGKQJwqqfUPOdCnWfG2LwHtlZS07V01SdYPmyJJI6hzeS?=
 =?iso-8859-1?Q?uoV708n63dM5736W4YLIKvJ5DZMNWNACWgpLtYkm27KidTcw0wVWD5baBT?=
 =?iso-8859-1?Q?0u5+wK39jQUj7krYtMFfS1SkqfKHkv6pD3+jPFJOTdJY7sdZepIqThPYPI?=
 =?iso-8859-1?Q?w6EbvvEv9CbkcE6QCGEDIsvWZbB1s9f7jPht/i2ugjj4bDlISqeGwUXweC?=
 =?iso-8859-1?Q?piYHv3XmxbqcE1d7EIMJ5BPtd9npJqV66f25AvXR2FXSMKTkkxkutPvNz7?=
 =?iso-8859-1?Q?+g3voboJcXgU6W261Fn9ISoSebcdVF1MXaiC6i1UZKEztUtC9OFsiQk8i9?=
 =?iso-8859-1?Q?h0Ayeu5AmZ1r7fXfMF0K4ivSr9wjFIkdF/cjJ0Vpl/TtyW1gwfLP+Gxgc8?=
 =?iso-8859-1?Q?+bhXU+qBSPIj8gkNkU6ERTo4OvKN7W4ElxLPoJNFmUeWxP/F4mmh//rtgk?=
 =?iso-8859-1?Q?WQywPAKAgdcK/7v7mGQL0ZoZCamIC7qLqmkG8XDnY0+NatFmTpHHkQmWJr?=
 =?iso-8859-1?Q?rFah8kDGlb9ieeBhq6aZMd8IqvmAtn3I4iYqk6+hC6RfljRaTvNdddnRKp?=
 =?iso-8859-1?Q?UycUKx634sfmZU27c/Ap6DKtx46BhyKClk260uuDD9BgSu3B4Q7X53v7kS?=
 =?iso-8859-1?Q?0kx5dNUA5Ni0ZfEZOHCOeVO0dL3Hu3a1BNLON/EvjyfjoF1Z564GmX05aM?=
 =?iso-8859-1?Q?Zvnstcov4ejv1vo9zB9FvX46mMAERo/IemNxPh+FPtb6Sz6JdZCyLIvVRm?=
 =?iso-8859-1?Q?XA6y7Svb78eUGi86JqbVnwqe7O3tyWtyzEZIW3BhpKihAlJp4j/Q6jI412?=
 =?iso-8859-1?Q?0NG14mKDtnnBwAolDoKDYL7WSuHnNprniCMrQJLrM37tzvQLeeOAQSScxY?=
 =?iso-8859-1?Q?qHyvHsibyQVYr+qEfMMOSIiCDCgmZzBtxDyVxoFoVglAyr92Q+THL+HRRO?=
 =?iso-8859-1?Q?aH4GmeeaVTODn0WsMPM0inohvudVUJgTtANIejwdJyUZwEHu40t/IijmO6?=
 =?iso-8859-1?Q?nL7X7G95NB3PEBfkTvR4UrEPpDcJ5kS/L28jVPaun/HymS15FHOGy/idm1?=
 =?iso-8859-1?Q?NbflzeYXpf7R0OI5PqiN39QSXc59SEdeBNSOhQ5M8yzR+oPFfp27bK3rSC?=
 =?iso-8859-1?Q?p8VViIhCh6i1/1lP0wMvuyjl0K39VeQ5wCPJO6ohiNSfb87DEngUS/YlFJ?=
 =?iso-8859-1?Q?jJniKSEBWFJrdqNgV9b9RafNT1OdoCcUw0uayip/5xcqK1Q8dcMF2frBt1?=
 =?iso-8859-1?Q?rXtsqOdokfOmUOgxQYuJGa1TyGRufAZ8E0Q3i1O3NYAHq9n3BMRXq4d2Uq?=
 =?iso-8859-1?Q?cTdN3B5ncqg11mOlTjyXK4d75cRCk4wIoqCte3lPykznMrpk6PrNndLw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd6c91d3-3330-48d8-8bed-08db3cf4bc08
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 14:30:02.9352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0iDQY31wFg6TZLVt6nC2hRbB/vIffNLNOasbnAmEXiAHmi2MTzgP2yqj5my6J/2E2B6n/mBlbVY/jV92giTt352/3xnA06yCm4ZWt2Wfvvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5212
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dakr@redhat.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, arunpravin.paneerselvam@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian, hi Thomas,

On Fri, Mar 10, 2023 at 11:42:56AM +0100, Thomas Hellström (Intel) wrote:
> Nice. This seems to have all we need for now for Xe as well, although not
> for i915 ATM.

A series to use drm_exec in Xe has been sent for review:
https://patchwork.freedesktop.org/series/116477/

Thanks,
Francois
