Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDBF56385A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 19:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BAF11A4D2;
	Fri,  1 Jul 2022 16:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E9611205D;
 Fri,  1 Jul 2022 16:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656694795; x=1688230795;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Iqyw9800HX+0UGggPVUC+kpE6Pt799Ucpg3iuPxR6BU=;
 b=W4JlC67LE+XBrlp0KtdCLN9Q51lUMd5bzusV7jRsnaOq1GpP+liqv3nq
 /f/mWZxEsAwXutUjjGV82G15w7gMEyz73uhooBhBXqIScwNX1ayr3XSPn
 kPCJ/GBO310EK5MumrEofTQ103mAvw/ykEq3IY6yx0QBTae16YAzEpNbU
 7oeUt0/KPRULvQrQZqEDsVAFP6/wKjA/zAvHMVE08ss2uCns0UpiWcH74
 7ziGlpr+ma2ygbZqfbmOGjqtmnLrg9qXcqkmnb6+59xN0xzSWEgq3l4AX
 klxJCXoZNRqx5HMhZwdBUlFB0qJEO9xq6C2/KH4vSmUF1uHcqVDvTkEea g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="282724263"
X-IronPort-AV: E=Sophos;i="5.92,237,1650956400"; d="scan'208";a="282724263"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 09:59:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,237,1650956400"; d="scan'208";a="648417905"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 01 Jul 2022 09:59:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 1 Jul 2022 09:59:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 1 Jul 2022 09:59:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 1 Jul 2022 09:59:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 1 Jul 2022 09:59:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6wgx1oS+8K/zd7uR5k6uzyg4xir9bGp0VXcSEMVJzTcXuHmgCGmIX3z/JczduNuIGeIGbBA0UcQdKN7JYRPO110vR0ycpvX4SOQbZOAK4vz7MW5SAPi+0ipW/Jf//iB4QiKIksbk1quz48EeLmLGwPZadfeev1zUWFCpF5Ga+M6D2xSACHB6MsA3FNmdgP6Tyh5XwB4w4LOX9v7Brx/+RI5SPpy22R2iQpmabNL9a8Y8SRS4yrh46tAUOgCXICMz9QvupDla3RTNtiPy+pugkJom+f5PDNHPDRtUYfjzGLp2qO2fDDVFqejYQIOeIZbrc33JVj78O8m7dn6Mmdzeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QB5kYwW06HtLwn/Ow/d3jkl09YOi4oJwN3GOgK8e1kY=;
 b=I/3EqniBGQgoBVctp87Sjs49ePLpazN+Gwdd/MUwwtx5bcIoqiiYedzYlFw9KuPwT+o7Ae0nFUuSl73jb53NHfROFblwUvg1c8Dk0A/03PP4rOs1Yto23U1LbWj8sgbfsG6E7YGPomBMvD5J4rN79BiI+sDHfWtjxn8Vb6uF6T7GuQ2i5TTps3GWKqZ8SjUolP1G2vveg/Dhev+EO1Mh8SJnRPfG/zv4T0j0o/lH/DXOK8/oq78yB60y2DZxJvwUhVovRLKkW3UxoY5ehbcgJsKw4zpy0uVyJFbGMPVcj6UiqHoaUNJoS4TJH5PDQ3EAZqj+KL2yfkeYTtOfDPq2wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5644.namprd11.prod.outlook.com (2603:10b6:510:ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 16:59:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::a012:82da:5edb:513]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::a012:82da:5edb:513%7]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 16:59:52 +0000
Date: Fri, 1 Jul 2022 09:59:50 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/2] drm/i915: DG2 and ATS-M device ID updates
Message-ID: <20220701165950.hfb6dulnaqjmtqhr@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220701152231.529511-1-matthew.d.roper@intel.com>
 <20220701152231.529511-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220701152231.529511-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0236.namprd04.prod.outlook.com
 (2603:10b6:303:87::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3c08223-5026-4a52-4a3b-08da5b831dac
X-MS-TrafficTypeDiagnostic: PH0PR11MB5644:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xHztHNx0hfvAHIH4iHKQYLrP7pGCvD9RdsbO6pBWpPjLSZYJaZgGmqOI9f/WWGZALwFfuv5VoaODBdmGA7f4HWoQEJQ/0CG1h+EtPPLSxfnYnkV3jVygGtqqgvmHWK6jlK/wKWhCJAHNTh2mRnPBh4zMp+UByY3TaOoAPm4YXO7dims5FgoDEtStDmiEUib3OwJmRSUc8x+RCUxs+JHKLvcaEWd31dPEJ2OgyUd4pOuVegP6cYBvFCZbV8lMUm1i58qS7wh+1C0ZhJr+zxK4kPFgHSTMH/JrjnEF/AS+YP7JAjgOIJySZUPf9uj2CRY9pB8x5qyptmwGUofmiO2WPzz/Ff/igmPCape4jj4XD/cdesLDjBCZjDH48Q7PlYrPOhk7NVbotjW76l4BA006CCu9IHWkI09TwBbA4xlsBZmlvqUBwuZJgZT1nZhRpubfQLARUbsZEmX+70CjqXy6yzuzTzOt63biU6L0viPCzmnrD72LG7ADETkejHKKCLnSj1UDTtK/e8p+7VaQBnc/YodGspqJGHHZZP75a8RkmLYmUJE09IqBFVf7QUuQTz5amlrfLhSmQeCiPh0kkySjQYvgxjiGMYFiVDVG4p+gJL3VuIr3fftlE6Tq0LB/hOMCsgS/Gtx4LGAF5g1+sBaCAp0k0+ZyDqNizfRfIr8oOM+wN/e1EFzK64idhB/5f5G8cNCHGm1tSyLJXKVFsHpxGBmicPNfwkXCXfdTgOJxMnhNmV672MN2hR1DgZflAHX7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(39860400002)(376002)(396003)(366004)(136003)(346002)(2906002)(66946007)(8676002)(4326008)(66476007)(450100002)(66556008)(6636002)(82960400001)(6862004)(8936002)(5660300002)(6486002)(4744005)(478600001)(33716001)(316002)(41300700001)(1076003)(38100700002)(83380400001)(6506007)(86362001)(6512007)(26005)(9686003)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eEf9sfXvCEzR6jMR6wu7vgCHNZpsS/KSlYgUDkFxOA5DRHinKgbqLwkHVmXa?=
 =?us-ascii?Q?APzWTubSovASYxw+Rtj8HjbTJFgrsbcdzY48EIn39Lvb0lIHwVhMn1i9X3Fg?=
 =?us-ascii?Q?bJaFLaBgBD+0zkTuDkKT0aGbsNZRh2d570fwDkSUKmTehigKYTEmRxYqvqhF?=
 =?us-ascii?Q?CbKXkidSjmMRx1JrGF+F2AUS60YCUTpbkqme1w7ZCj0BT7GgsJBdMz/b3Kk+?=
 =?us-ascii?Q?FJbEftPqqdGQbR6EmabWqQRKCREJ6llXQCR51k2G/hl/NMf8yj1GQOL45ffM?=
 =?us-ascii?Q?CwMLSMuVFx/yjO+JsWGk5z13mCQcKhw66/VhlYYkUKrjFHA6jE/+jgUE6T+S?=
 =?us-ascii?Q?1stYbgCbjp0QIQltEHn/IOJCcXjpK1zlZReZoVuf5Rz2fpox1uRXSEaTe480?=
 =?us-ascii?Q?lIwZ4HP+zYV/Lx8lA+PwKveNmS9givGiy92KrdVf8zdW2YYrrPcYhEeUnGqg?=
 =?us-ascii?Q?fQLk2/tRyR8LB0Cd1YFaYdIofliDawqsy1gwkzeWeHDGiY+6QHlEav1vYbcy?=
 =?us-ascii?Q?fYdJrpt4xYViRIEGpvOSccCHMIlRzvYvFw6pUYJpun1dzVbt9UI7dAazurJt?=
 =?us-ascii?Q?2NGK+knM4RVvX7G7CRrnkv+ITAqKq5i+r2zij2g/qTqnIExR3wzX9LIcnngI?=
 =?us-ascii?Q?5c0YvsuK/0DF9yuOwnyz7VTywidBQFDhyDPE4VAllLplHac/uW/nNlFpoapW?=
 =?us-ascii?Q?ZgZH+zVvjL++bg5+FZl6W8ZTnPptKWNu+Bc4YITWYJ0qFNg5/6qtc2uMCgpy?=
 =?us-ascii?Q?/tQgd3ytYFZtkbFuyhPX4mMEwUsWgg+tIXZ3ShFoZ7Bwjxkf4Ic+lPbBA4ey?=
 =?us-ascii?Q?bjxFNfZpD2A+UgaO6IvZ4pcMFMQDzqPdBH9J1FjXgZAAYpQ1w3lsxTCwar8M?=
 =?us-ascii?Q?GHDstzAwkKO267IdmWBkhYzL3+wM4H954w7mlFlN0tL719bnXIW3WHUU5z3a?=
 =?us-ascii?Q?w+OFHsf1ph23w6jZEajFYyZKsK1aCC2Ry58D0wBusI145Li73YQMucarT+V0?=
 =?us-ascii?Q?BAKX1RbPBRswsQYY8aspuMTJgHU1ny60dpxg8zyxGdcxUtRIXfLcUlezkvu+?=
 =?us-ascii?Q?bKUxdxVIZdJO7qRryah3JgSmPrOBYrDTE8BGFSDsKmQXDrESyR1eIIqQhbYW?=
 =?us-ascii?Q?eOgQPNaNZopDsn8RKK4pBP9BlxGeKSPQTPhhiuSbkdzPF1IrAdpPHH1+MYoU?=
 =?us-ascii?Q?bvkU4ghBo1weflUIB4EtuDLUyK0Lmdj2k1jm6nZzzM89jIlj+2XAMA8XgDkg?=
 =?us-ascii?Q?Xw6ctXttDY1yODZBVi+cbU5vbRKTJN4SdUw74/l03eO61zhRQ7mLWxyEhnw7?=
 =?us-ascii?Q?4vVTyyz4Mg+DSHgBf9+DqhU/g4YwYC0QbBQasXOEzrT981RmKTpDWI668jPq?=
 =?us-ascii?Q?LYNxzHGOd+LBnFEbJdpyyDx/a3XdPXHAmcCIWXhr5wtY5gBUCVV6OyFdkEJp?=
 =?us-ascii?Q?j3zVdgI7sJaUr7e7VYOyb09ef/LdkTRD2RCEL0LUmUNim8xGMM+rx6rIU5FC?=
 =?us-ascii?Q?noMQcshykNInKsEOnZa/7d5wrNGKqyj/SxLkIcTvzgkiGpKHXgHtnE1Y9peo?=
 =?us-ascii?Q?zQBTJN3+6Pj/bfySb9MoIJi1TRq+hkjrCt5ftmnkxCKuTbAsJAdGRxQMe16R?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c08223-5026-4a52-4a3b-08da5b831dac
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 16:59:52.4738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: elNYWNZJLz2psp/nPBjsN5P/ZVcljqVXqNbjKqviSizvO91Ocg73UqQopLGiqGVeROW0quDxdf3ue0pMrGZJWZkNDzbhshpVdH/p22ZdvdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5644
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 01, 2022 at 08:22:31AM -0700, Matt Roper wrote:
>Small BAR support has now landed, which allows us to add the PCI IDs
>that correspond to add-in card designs of DG2 and ATS-M.  There's also
>one additional MB-down PCI ID that recently appeared (0x5698) so we add
>it too.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
