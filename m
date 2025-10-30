Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F15EC20F82
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 16:37:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C4810E9F1;
	Thu, 30 Oct 2025 15:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0c2ezzB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4170610E9F1;
 Thu, 30 Oct 2025 15:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761838673; x=1793374673;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=P7pDqO/RAeFvw7Hef1qz8IUEKW2mqOuHDJVq3dp3OMk=;
 b=J0c2ezzB1SChedPvSHtOgvRJ9JqF1kpjUG6ej3k5DN8ZMOjJtX3gzFBW
 aDgHsW/0I7AOgff7zQ8K33wloTOcvBSdf6X5qxDiozFHVOwtN3/sRE2ny
 QE68p1bSNqne6JEOc5eReSKaJrHJeQoNSoIF7iR/wgIGpI1hRt6Ox77/N
 zmMGNcpgDrLrff0LQRp57yYfPU4PsPRDnqksbKWdGghQhWfBvuxJeVJEF
 U37rOkPve0AcYFYznhOA1x0REGPbxalgVAjzsP0q6lYDqQjEVE1DCdvgx
 7K6AVLbG0PDv9OQWpoqn+AcEomMOqrBEpyY0TiI23Y3kWHulEcztw09hD A==;
X-CSE-ConnectionGUID: Up5dlOVxSLGd/1mYfLpUrA==
X-CSE-MsgGUID: mrNLPsyKQwyDyo90maz9oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63188893"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="63188893"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:37:53 -0700
X-CSE-ConnectionGUID: fzt20Q5iS9miDukHFYJmKw==
X-CSE-MsgGUID: DcZbW8MgQ+65E5avZbscPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="216642600"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:37:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 08:37:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 08:37:52 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 08:37:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uE7qbfCC3xfJ/XWBKlnHQ93p/raJtr+KTKHw+x0b/PqwbpCCrDoYp5bogzefO/qzwOZ9DQs0wunAaNZJ/lQUQcJK8oXvd0Rm8SDP2oHiUxhZ41+MgZogjWDeQxpnFq3lHrneHBoYBPivqGgZDB2VUZWoHH64zlxScrTF6fjOqI2VE/5DzfAYS0vEwwtBPZfM+wPLh4GBffHnRpepthFIAi4vRNUM0mr9ZXESe52kfjTS9WXqS64heoMNeWKyy+syK/OXgO75yw7QxuzCCrZ6dey9XNJoYkOvrW5W5vXTFKgyTq4rKBsPey7oV5fHAdIDbeYStT9HLYW7tvPgixHdjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dOnRqRy0B3sd0pD6uTakammYZRz4absK1ZaSpDuHeg=;
 b=YooBzSKtjM/KVZFNNSTPYzZ6ngdf6Rftnhd0sMBxrTGBWwW43shbkvFdN2/SnKOrXHp9zsskjhwYULqArPZ0AcmQXhxz+BPv5ndTLCY8+Wmuh2X41XFXIhZobmIpb9r//+6unyiI5/cJk+Gf9AgA11QqLiJYFPD8t2pEHEvgivGY15j38aHTQmH9cy/gU4Z7Z7YJSAJcXVXMlZZUR5vRgZOQ7pKF3ZZYHOWe9Cp3dfA3qJKSKCb5vmnvcgKQNX2mUcZZV/5YhQLcD9o2oIrLhuYzbAURkIYk9/2VlkQtWtcEkTpfhZAW7pNo1Gz4ux04hs+ufUR1OTVYJTJFNc8Bkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB7568.namprd11.prod.outlook.com (2603:10b6:806:34e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Thu, 30 Oct
 2025 15:37:49 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 15:37:49 +0000
Date: Thu, 30 Oct 2025 11:37:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Dave
 Airlie" <airlied@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Lukas Wunner <lukas@wunner.de>, "Aravind
 Iddamsetty" <aravind.iddamsetty@linux.intel.com>, <netdev@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>
Subject: Re: DRM_RAS (netlink genl family) for CPER Error logging?!
Message-ID: <aQOGRpjAFTtXAnYD@intel.com>
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
 <aQEVy1qjaDCwL_cc@intel.com> <aQN6dqFdrXxLKWlI@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aQN6dqFdrXxLKWlI@intel.com>
X-ClientProxiedBy: SJ0PR13CA0138.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SN7PR11MB7568:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dbc34e8-8ea0-4d8b-1580-08de17ca47fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|13003099007|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jlh4IahvJRo9Olas49WQUiy0bBy0Bz1HAs33SpVgD7as/jaNAz0h2I7Vd3b+?=
 =?us-ascii?Q?M9PtOfko0P/wWnFLOr8PcnULzOgSA/opdQGLg3nVV5/rEgdaL2zTlBrAWWaj?=
 =?us-ascii?Q?tjDRUd4gf+SIpENJ9zYjgKouD5oihue6cuvibKOB/r9vU1qzmwWa57ZsrOTS?=
 =?us-ascii?Q?Fe1yJRzswyDtKIXxi8qLIR29V+OR8SrpfV74kT14cNokiTSM//uVJVm9sn4c?=
 =?us-ascii?Q?wje/TkjVSAfKSEbTPeQQ8z5m0gsdZ5wF1KMkrZopJdd9BkPo5gWtKyRy/GCs?=
 =?us-ascii?Q?OzxIhxjv1TEXYoL6y8FTp3lIfKmb0csHCsLvJeSwtfq2uShp3DlABtRC3vZs?=
 =?us-ascii?Q?Az1O9xbcRKkoypAi3WjwCfnPXA5GgBFihEXYzbXJaHEyMpV7JoKuIjS9zRPq?=
 =?us-ascii?Q?4va5Svs4bTGdkEmZCLQLO+yuhhyu/+szqpQA7XnDUyudd5fyPqaltysc9MKd?=
 =?us-ascii?Q?tA1Qx325yXlFxklDZB42eBIlr5aXsqA5HE25ey99md8bqIffK0ThTnrWLP/a?=
 =?us-ascii?Q?FVLaIwIzIV2Qrwpp7FUMae5KN3pCDZs7bTq88OWubP2EnYEU0VI8qFhN+jZD?=
 =?us-ascii?Q?lHlU8Bc7X7U6uwNd9xU/wvs8C9AFGwuQHTrqRp8RbHHth7eRr6RL9PGgrOa9?=
 =?us-ascii?Q?PUZl533lYjpi3Ty2ooGCwTNL3AJs4FG6A7l/fRX3BkNPCf8yPL/fwyK9KzdO?=
 =?us-ascii?Q?0aZfWV9st/7uWGF/gcj9GDYCxckxH6d1uG8m6HabmXEba/9TL1Qihwu3u295?=
 =?us-ascii?Q?5f/zQVFyyx8a7UHItM30LjzYWy3sxaIzbkXP09clFwiTKG32iRMoayNMldJo?=
 =?us-ascii?Q?nxhmxLNbp+9i8/goHaTRsqhxbBDPxaWkfWP/sq14SuabX2U6oBCenqJbCL36?=
 =?us-ascii?Q?htZL5ljHVqhW1qiKT/LLVFcYQCAN57U0+h/65qY7uT9h9KrJmki+Xx3c1NNm?=
 =?us-ascii?Q?yxbKdC2skQxU6Nla4do18Z3o8ijHsi5de46CKVN0aT6vVn282djcj9jztotl?=
 =?us-ascii?Q?5uvET/+DnIYWoTDuUQV7NpMQQkCHG/U1L6tjsJ1o37CD2rOOz0EJDYdzzWY6?=
 =?us-ascii?Q?Q2JcNLNLpfzjq8QgKYBvxJOeSBJXU/203TUB+rUw7ECVlMulfY+08Nm9MY5t?=
 =?us-ascii?Q?9EepkPZLFNZK6dWq1WIKj/JwxlJ0IKWc1IBr77Vin7rwa96pvyRt6hz4BvWW?=
 =?us-ascii?Q?WCUIY3Dzi4M3TiK7Chqhi+T8A8SSFW4bVZYnVlHfTA/kH4gCYUOmC3NXlfqZ?=
 =?us-ascii?Q?NftuSQdjWFhNhlleV0doPsKRkUPvOWV6izCvnseBHyNaEm9EzeONzSaZz++s?=
 =?us-ascii?Q?EP5nNd5yYN3UfTabqxC+wchnApYatVG0WZINEyzwzR9xK2S5Nbr/wZG3PfF6?=
 =?us-ascii?Q?KGlT6ewOaY3BSxbEttY2yMmRenAVP24R4yCBdvCgBoRBsXIIQIgib3zRUxAG?=
 =?us-ascii?Q?s6pDCdU97I6sVHvYIOrd++oAZYluldWr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(13003099007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?es15EBFce8PBKQpC7FgQcyW/23bYzyBQlvGeR6s3YmnqQyM1lpe/XrodZXFu?=
 =?us-ascii?Q?zLPuKK5YO66dNBwvuHBfYc/c7plTh3PL9TO2qyv2ic7r44l+aCizM9NwIgQr?=
 =?us-ascii?Q?2I/kI1BNqtlUNzLQ/v9fBQTQCDOtswcvetoAV8s8POb8UdTraNmpRoe8yl/n?=
 =?us-ascii?Q?wyrCt8xZmdU8dK3qhb2f0JBQLhcBs0Zmvdi3rPvk4/TszZhp6e13Jb+DNvPk?=
 =?us-ascii?Q?h0TJf8jBise1bm89mnp0c3SsNxx4MLjxQT/PxbUKgoMhdB3kYTc4xtTLXx16?=
 =?us-ascii?Q?6C5tob9IJcofvzjKjnTelPeoa3vZ0Ny9SXHZbe0XsYTKIulEsTZV/xhHVaeA?=
 =?us-ascii?Q?fFLT0OjWpYNkzuJyScxBIevZkRQu9huMAkUjDsr4ijPKlSnavf+Q2K624lf/?=
 =?us-ascii?Q?Q8a9baozIw9llx986gVhnXLgKXCr7cGl4Gt4qtFTsTYij0BAFL3fIK5t/Gvg?=
 =?us-ascii?Q?1MeUb2LwKz9dUCd8UTP6ctFnxkqEu8zH7ATaKnVcQ1yOCVjXZUDX1X7MR1EJ?=
 =?us-ascii?Q?OMAYlMYOECYkNUskE6rSSOdwcQJ2rtJBs/XTbi+NA2IbzdAFydJiXIlbK1Xr?=
 =?us-ascii?Q?lPdzG6zOTUtaNlLx4UrRW0EtG9yT5r1Ct1h5WbWgsmGzAbvaHXWJzXYNd23+?=
 =?us-ascii?Q?UVLhoxKkKaiAgKFTwtU1bdnht3JeIY/yHE03Fw4YCiDSOZ/oH4MDBt8hJw+z?=
 =?us-ascii?Q?fgjAlCZlrnhsOH/Lnjg0uxx5VIQ6t9qyHj/VQUgfLkPV9a2tXK5cCulC2fqT?=
 =?us-ascii?Q?473gmtAvdBcMF3A8VypIvQp7paETgY5ZQ2Sqtb5HUufp+M/2ogjTQilVUahb?=
 =?us-ascii?Q?7Qfoz7nxlG1vAx8fWjyZ0ZrJbj8jiswTFaUmHCcqWc8jVyD0Zy/tn64N/8As?=
 =?us-ascii?Q?L5SlO5mFq+Oy1UEOa000joj898hpX90W8RXZTOhaK1ZlVP3suygs/+/K7TdM?=
 =?us-ascii?Q?8S43BQS2mGQygN4BlOTs9wgMoINZolNB9gIDPBN6HTYa9QhlWRvt3to9FcaL?=
 =?us-ascii?Q?6OLAYv+XH3x2Xrzqa7Mc9b6MX9D0KI8P7RsWYB/gGBaS0tOd+t4PXvwqNUmv?=
 =?us-ascii?Q?pNqLkNzDZ0NqcWuicQIHhCX9yopbAnGV2kEDVSEtI0RpYkg/bbW5u8QSFnGA?=
 =?us-ascii?Q?tMEXcznggVdp+j5LrwFdLOJ8Npqk6HRM9rcc9AyD+gEulnlnPoZFnM3uyCa+?=
 =?us-ascii?Q?aBfg1IZLfGL38BTrVdMlcwz0E3bXrWb4O34xOJeftcbhww45vJQBlB8liqrG?=
 =?us-ascii?Q?COgcQabZTeWcp6SmNa0MAYdJongVVE3RkiYtKuS9G28VqcrkGeM8rKEDLlL6?=
 =?us-ascii?Q?TgxrsMjELQYEaQ3S7FIoY9EJqvVaN9z7K/W+O9bJIFzoKzqgmkN/UjzD1sSv?=
 =?us-ascii?Q?hsoQQygreqzXjWKuklV/9si90zZG+tO0ZcnpQM+HeRpSOvaLbq20AWOmi1Ik?=
 =?us-ascii?Q?BKAJ6DkfS7890oEulGDTkOSS6lDwsBKS2taFthnESFrUtfd0urMmvMrLLOOk?=
 =?us-ascii?Q?C6zS9ublOoDf6vK053xNy59c9olKr3zaniEdPD+NJnMUP0oT9zilWTudjZAE?=
 =?us-ascii?Q?AcVQTPKB1FxC+ne+6t6C114JTJAJYvC5UzVsYvi3IE2WVqR+IN1bgvE2XqLt?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbc34e8-8ea0-4d8b-1580-08de17ca47fd
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 15:37:49.3980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ETo3JHs2U6hMILG7eNid1nM6ZmlOllbq2YTBSFyhJldhWiTBJEsWsQ+RYerBx5vj9tyR4NtGJv1PaFWvHa0bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7568
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

On Thu, Oct 30, 2025 at 10:47:18AM -0400, Rodrigo Vivi wrote:
> On Tue, Oct 28, 2025 at 03:13:15PM -0400, Rodrigo Vivi wrote:
> > On Mon, Sep 29, 2025 at 05:44:12PM -0400, Rodrigo Vivi wrote:
> > 
> > Hey Dave, Sima, AMD folks, Qualcomm folks,
> 
> + Netlink list and maintainers to get some feedback on the netlink usage
> proposed here.

The netdev mailing list blocked my bounces of the original discussions,
so for the overall context:

Usage of netlink as a drm-ras solution (with error counters in mind):
https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html

Proposal for error-counters with drm-ras generic netlink:
https://lore.kernel.org/dri-devel/20250929214415.326414-4-rodrigo.vivi@intel.com/

Question about the error-logging RAS sub-case with CPER over this drm-ras netlink:
https://lore.kernel.org/dri-devel/aQEVy1qjaDCwL_cc@intel.com/

> 
> Specially to check if there's any concern with CPER blob going through
> netlink or if there's any size limitation or concern.
> 
> > 
> > I have a key question to you below here.
> > 
> > > This work is a continuation of the great work started by Aravind ([1] and [2])
> > > in order to fulfill the RAS requirements and proposal as previously discussed
> > > and agreed in the Linux Plumbers accelerator's bof of 2022 [3].
> > > 
> > > [1]: https://lore.kernel.org/dri-devel/20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com/
> > > [2]: https://lore.kernel.org/all/4cbdfcc5-5020-a942-740e-a602d4c00cc2@linux.intel.com/
> > > [3]: https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html
> > > 
> > > During the past review round, Lukas pointed out that netlink had evolved
> > > in parallel during these years and that now, any new usage of netlink families
> > > would require the usage of the YAML description and scripts.
> > > 
> > > With this new requirement in place, the family name is hardcoded in the yaml file,
> > > so we are forced to have a single family name for the entire drm, and then we now
> > > we are forced to have a registration.
> > > 
> > > So, while doing the registration, we now created the concept of drm-ras-node.
> > > For now the only node type supported is the agreed error-counter. But that could
> > > be expanded for other cases like telemetry, requested by Zack for the qualcomm accel
> > > driver.
> > > 
> > > In this first version, only querying counter is supported. But also this is expandable
> > > to future introduction of multicast notification and also clearing the counters.
> > > 
> > > This design with multiple nodes per device is already flexible enough for driver
> > > to decide if it wants to handle error per device, or per IP block, or per error
> > > category. I believe this fully attend to the requested AMD feedback in the earlier
> > > reviews.
> > > 
> > > So, my proposal is to start simple with this case as is, and then iterate over
> > > with the drm-ras in tree so we evolve together according to various driver's RAS
> > > needs.
> > > 
> > > I have provided a documentation and the first Xe implementation of the counter
> > > as reference.
> > > 
> > > Also, it is worth to mention that we have a in-tree pyynl/cli.py tool that entirely
> > > exercises this new API, hence I hope this can be the reference code for the uAPI
> > > usage, while we continue with the plan of introducing IGT tests and tools for this
> > > and adjusting the internal vendor tools to open with open source developments and
> > > changing them to support these flows.
> > > 
> > > Example on MTL:
> > > 
> > > $ sudo ./tools/net/ynl/pyynl/cli.py \
> > >   --spec Documentation/netlink/specs/drm_ras.yaml \
> > >   --dump list-nodes
> > > [{'device-name': '00:02.0',
> > >   'node-id': 0,
> > >   'node-name': 'non-fatal',
> > >   'node-type': 'error-counter'},
> > >  {'device-name': '00:02.0',
> > >   'node-id': 1,
> > >   'node-name': 'correctable',
> > >   'node-type': 'error-counter'}]
> > 
> > As you can see on the drm-ras patch, we now have only a single family called
> > 'drm-ras', with that we have to register entry points, called 'nodes'
> > and for now only one type is existing: 'error-counter'
> > 
> > As I believe it was agreed in the Linux Plumbers accelerator's bof of 2022 [3].
> > 
> > Zack already indicated that for Qualcomm he doesn't need the error counters,
> > but another type, perhaps telemetry.
> > 
> > I need your feedback and input on yet another case here that goes side
> > by side with error-counters: Error logging.
> > 
> > One of the RAS requirements that we have is to emit CPER logs in certain
> > cases. AMD is currently using debugfs for printing the CPER entries that
> > accumulates in a ringbuffer. (iiuc).
> > 
> > Some folks are asking us to emit the CPER in the tracefs because
> > debugfs might not be available in some enterprise production images.
> > 
> > However, there's a concern on the tracefs usage for the error-logging case.
> > There is no active query path in the tracefs. If user needs to poll for
> > the latest CPER records it would need to pig-back on some other API
> > that would force the emit-trace(cper).
> > 
> > I believe that the cleanest way is to have another drm-ras node type
> > named 'error-logging' with a single operation that is query-logs,
> > that would be a dump of the available ring-buffer with latest known
> > cper records. Is this acceptable?
> > 
> > AMD folks, would you consider this to replace the current debugfs you
> > have?
> > 
> > Please let me know your thoughts.
> > 
> > We won't have an example for now, but it would be something like:
> > 
> > Thanks,
> > Rodrigo.
> > 
> > $ sudo ./tools/net/ynl/pyynl/cli.py \
> >   --spec Documentation/netlink/specs/drm_ras.yaml \
> >   --dump list-nodes
> > [{'device-name': '00:02.0',
> >   'node-id': 0,
> >   'node-name': 'non-fatal',
> >   'node-type': 'error-counter'},
> >  {'device-name': '00:02.0',
> >   'node-id': 1,
> >   'node-name': 'correctable',
> >   'node-type': 'error-counter'}
> >  'device-name': '00:02.0',
> >   'node-id': 2,
> >   'node-name': 'non-fatal',
> >   'node-type': 'error-logging'},
> >  {'device-name': '00:02.0',
> >   'node-id': 3,
> >   'node-name': 'correctable',
> >   'node-type': 'error-logging'}]
> > 
> > $ sudo ./tools/net/ynl/pyynl/cli.py \
> >    --spec Documentation/netlink/specs/drm_ras.yaml \
> >    --dump get-logs --json '{"node-id":3}'
> > [{'FRU': 'String with device info', 'CPER': !@#$#!@#$},
> > {'FRU': 'String with device info', 'CPER': !@#$#!@#$},
> > {'FRU': 'String with device info', 'CPER': !@#$#!@#$},
> > {'FRU': 'String with device info', 'CPER': !@#$#!@#$},
> > {'FRU': 'String with device info', 'CPER': !@#$#!@#$},
> > ]
> > 
> > Of course, details of the error-logging fields along with the CPER binary
> > is yet to be defined.
> > 
> > Oh, and the nodes names and split is device specific. The infra is flexible
> > enough. Driver can do whatever it makes sense for their device.
> > 
> > Any feedback or comment is really appreciated.
> > 
> > Thanks in advance,
> > Rodrigo.
> > 
> > > 
> > > $ sudo ./tools/net/ynl/pyynl/cli.py \
> > >   --spec Documentation/netlink/specs/drm_ras.yaml \
> > >   --dump get-error-counters --json '{"node-id":1}'
> > > [{'error-id': 0, 'error-name': 'GT Error', 'error-value': 0},
> > >  {'error-id': 4, 'error-name': 'Display Error', 'error-value': 0},
> > >  {'error-id': 8, 'error-name': 'GSC Error', 'error-value': 0},
> > >  {'error-id': 12, 'error-name': 'SG Unit Error', 'error-value': 0},
> > >  {'error-id': 16, 'error-name': 'SoC Error', 'error-value': 0},
> > >  {'error-id': 17, 'error-name': 'CSC Error', 'error-value': 0}]
> > > 
> > > $ sudo ./tools/net/ynl/pyynl/cli.py \
> > >   --spec Documentation/netlink/specs/drm_ras.yaml \
> > >   --do query-error-counter --json '{"node-id": 0, "error-id": 12}'
> > > {'error-id': 12, 'error-name': 'SG Unit Error', 'error-value': 0}
> > > 
> > > $ sudo ./tools/net/ynl/pyynl/cli.py \
> > >   --spec Documentation/netlink/specs/drm_ras.yaml \
> > >   --do query-error-counter --json '{"node-id": 1, "error-id": 16}'
> > > {'error-id': 16, 'error-name': 'SoC Error', 'error-value': 0}
> > > 
> > > Thanks,
> > > Rodrigo.
> > > 
> > > Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
> > > Cc: Lukas Wunner <lukas@wunner.de>
> > > Cc: Dave Airlie <airlied@gmail.com>
> > > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > > Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > 
> > > Rodrigo Vivi (2):
> > >   drm/ras: Introduce the DRM RAS infrastructure over generic netlink
> > >   drm/xe: Introduce the usage of drm_ras with supported HW errors
> > > 
> > >  Documentation/gpu/drm-ras.rst              | 109 +++++++
> > >  Documentation/netlink/specs/drm_ras.yaml   | 130 ++++++++
> > >  drivers/gpu/drm/Kconfig                    |   9 +
> > >  drivers/gpu/drm/Makefile                   |   1 +
> > >  drivers/gpu/drm/drm_drv.c                  |   6 +
> > >  drivers/gpu/drm/drm_ras.c                  | 357 +++++++++++++++++++++
> > >  drivers/gpu/drm/drm_ras_genl_family.c      |  42 +++
> > >  drivers/gpu/drm/drm_ras_nl.c               |  54 ++++
> > >  drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  22 ++
> > >  drivers/gpu/drm/xe/xe_hw_error.c           | 155 ++++++++-
> > >  include/drm/drm_ras.h                      |  76 +++++
> > >  include/drm/drm_ras_genl_family.h          |  17 +
> > >  include/drm/drm_ras_nl.h                   |  24 ++
> > >  include/uapi/drm/drm_ras.h                 |  49 +++
> > >  14 files changed, 1049 insertions(+), 2 deletions(-)
> > >  create mode 100644 Documentation/gpu/drm-ras.rst
> > >  create mode 100644 Documentation/netlink/specs/drm_ras.yaml
> > >  create mode 100644 drivers/gpu/drm/drm_ras.c
> > >  create mode 100644 drivers/gpu/drm/drm_ras_genl_family.c
> > >  create mode 100644 drivers/gpu/drm/drm_ras_nl.c
> > >  create mode 100644 include/drm/drm_ras.h
> > >  create mode 100644 include/drm/drm_ras_genl_family.h
> > >  create mode 100644 include/drm/drm_ras_nl.h
> > >  create mode 100644 include/uapi/drm/drm_ras.h
> > > 
> > > -- 
> > > 2.51.0
> > > 
