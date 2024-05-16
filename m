Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1978C77D3
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 15:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8621E10ED1D;
	Thu, 16 May 2024 13:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kq7NW1Vq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5397810ED1C;
 Thu, 16 May 2024 13:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715866781; x=1747402781;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QwcdU6MhQVmoz1f0wmGhHRAn8RxLfL79KG4XsL4gBgE=;
 b=kq7NW1VqmOCp9JlflbD08+GxicXoExvZUw5Euc8ya8Sm0tY+XwwqDO0Q
 BSU3Kr8YfX2Vmci8hNnCeP5NKpbc/DWqnyJY5N/WueJ1KTNqwkQ0d0nJl
 f2iDPA4FNqBaNmxUg16DO1kHtGQzQYGhVe/4Wxuyl1L6h0WsHiSyq/LIU
 jZ3WD8DmlOwJ4N3zr+wzDMcGGs2ElqX1S7H8JghBgNoG7G4h8ma9orPll
 J9oBWf49XXdPP4rUtEjh+5L1AsO0cRi/qdXzYXV/bwRlX+t835t6KQGxE
 PLb+5noRrF/q7GbwZnRMQKaJfF+yaq+jDyTy5yionsR0Wtey0Xe9d0/vS A==;
X-CSE-ConnectionGUID: G25ur9PfRFmSAjELr/qRZw==
X-CSE-MsgGUID: 890tIU+rSYGjypTgRdegQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11811191"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="11811191"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 06:39:40 -0700
X-CSE-ConnectionGUID: oP17sOExTF+9mJiBxpOceg==
X-CSE-MsgGUID: tkapJg07RnmSXgvbh/9EiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="62268309"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 06:39:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 06:39:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 16 May 2024 06:39:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 06:39:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkI6Gx3U9IFCI7ZqcyTOj+eoVshRPqEKRrDqCm0uUIMXXmpUrm7+AU3ATQfdhiYp8QkmgGqvWC7zrJEVZqNSag+PBpr0BMQ24p0QjeTY4vB/F0rd7ZLJmevLQKvPGmuo40wO+jKuScukf4q5zDsz8YTZsFHCUFT56++l/WNQ3xxGN6xZrK50SDhSrUU80Nd18ma516JiOuUw0W15fqtWWsBCYmon5NXimM8tOA15byBeVrlIaWaUhU4FNNOr+EmF6GSJ3ibyxM8jQ619gvX4Dqf3hgBlsQQ7qXrimlmSext1MM/HJFrS5H9uB8n2WQinJBaGLB3tIV4BxmTNzWrN3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODhuXbvZTjnglAlgK7ZVX7EfXjBbsEwf/FCjLSIISTc=;
 b=MXNuCGgnb6wDvXOTLdASvWtOGnCJkvMpEuolS0vxoO/OXHa3BLzelPOtYt48L0gRXVC6CG7zd9eUa0UkBf344L2mHtZpS8bIhurbEWrSdWoGf46NkFH241N9+NpnlpSlbGAHnGiOsCtQeGl5sTk8XYfw8brDGG/2saOB8jeS10jNVEpMvthXwN+HJCpxOnTo8iIKa2HnA8NOkGxXrh+5bcGMc3zc8GSw/is9f/3tgdnDVc7dvwhj4LlLcEYSrUHPNpYqk2mfNzQewoiLVrRn0RNTjav3cKLEeAOuIcTvsi7Ar+obVmBNaJK64dvuspG3GfgNuEzYZs23N0mEKl8uyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4689.namprd11.prod.outlook.com (2603:10b6:5:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Thu, 16 May
 2024 13:39:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 13:39:37 +0000
Date: Thu, 16 May 2024 08:39:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 8/8] drm/xe/client: Print runtime to fdinfo
Message-ID: <kefcyhuvhixrwpseniwiipgqp2446dozicbq3lpap23xpsm4ep@wljofx5pkxg6>
References: <20240515214258.59209-1-lucas.demarchi@intel.com>
 <20240515214258.59209-9-lucas.demarchi@intel.com>
 <9bf21f5a-28a9-4bb6-8467-419889f405a9@ursulin.net>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9bf21f5a-28a9-4bb6-8467-419889f405a9@ursulin.net>
X-ClientProxiedBy: MW4PR04CA0216.namprd04.prod.outlook.com
 (2603:10b6:303:87::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4689:EE_
X-MS-Office365-Filtering-Correlation-Id: 83822f0a-ee95-41a8-c310-08dc75ada0f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?sc41gp8+jRdwLd3tjrYlHMsF2e65gvliuZMlGhjaZBSqYuIah6YPFSUHci?=
 =?iso-8859-1?Q?59Rq+Ps4OFpt+W06RsZasXFTYU7ztw4DZQKQJrQf0q3ixqORIKPQ/xiR50?=
 =?iso-8859-1?Q?ftfMBvGLEfPZkXubbm2A1FtDA1sSHL5E5bNaG9ZmkkNaAxIp/KplG0PAqn?=
 =?iso-8859-1?Q?ANj4QL+oTixIitKyq3u8X3kDN+KGAiCPObs8CAvyGtcJ5jPJ5OBIe9lepN?=
 =?iso-8859-1?Q?8lbBeVeiK01+p4eGzht9vatsTWhsqIVUZSSQflBXwSe8LdzJ0PGCSXiosk?=
 =?iso-8859-1?Q?MU+wo50nIA88/e21xtKUM1MEwO6Jm0TDRsBR2yere9igY9ixB+9ApqjBh5?=
 =?iso-8859-1?Q?77wzMdD26urs96lg7BSqhuZWzL1MUnSutP/Ex+97782cuCn6PcjeDw1iKw?=
 =?iso-8859-1?Q?gZLvNE5pwtJUtxqKmB6/khU3NmrnCPtN798FuVeMONmDJjT+9J+i3f0axp?=
 =?iso-8859-1?Q?dGrMTE+EW8Xcrn7DA/2OhnBOviNDC77B9LwAP7EnzA6Q21ZlkXyPtDXk1O?=
 =?iso-8859-1?Q?sBJaoJF+ifahXcVSlWrzqMtxaloQiQ6c/ms8QenORrZy5xaUrElmqSqvgP?=
 =?iso-8859-1?Q?IiWvglaJmK4XVz4mWqsURgbbxwInAOwTF6fkDaVz11DYI8LJszKBmDld84?=
 =?iso-8859-1?Q?rEBF4yWvYkRx82ENDOx2e8xWEAzGyx5bGYK4aWL4lXX904542E5khfbeGS?=
 =?iso-8859-1?Q?ilzRLugJtWeX61OjtxTckbZTshgz1oSB0+aE6aOJCvjvjKkDVQEC1NUZWY?=
 =?iso-8859-1?Q?Fl4fIbYPBOVrujg2K3yjJ/K0h2nafHq4mXCQRd7ATIaE5gYRubAiyvUm3P?=
 =?iso-8859-1?Q?b5l+1A65Dlxgv22B+l+/TuBL9akvOt0z+geAof+lFSOqoKPFgqWlJD7LLX?=
 =?iso-8859-1?Q?b+aA63CkrSXbh1ej0C9oG6wMgR0ob3lPXSW4bqqkSwLw7PbFxJnrt3d+0Z?=
 =?iso-8859-1?Q?4381fgadmOgKjODieCDQk1x2Pl7LS2R6gj94suts0xd++jQKLmgkiUetjT?=
 =?iso-8859-1?Q?OrNdIUwujQC+BsMxf129+FaVA/cDMx+Z1SlBj32x3ogWBCDqNiLp1nzedw?=
 =?iso-8859-1?Q?pI5akUZBM5Ym0ULOGlIs+ZNf4HXFGD/3fD6iVb5LCv9PdiYoJCS0Nv4RtE?=
 =?iso-8859-1?Q?+1jvVuMG5Jth53SG79QPNOP/redD3+IfaFZh5WdhOTjTEyWoeDubgJsuqg?=
 =?iso-8859-1?Q?79X5QRLUi9ZMYkfMHXztaWU0iSEZqjeVew9RJs1wWIoUy8xXuRNPGne6W4?=
 =?iso-8859-1?Q?YeIXdQGpR37JO1Clw3JLSo8i2xibT/hDnjUJVG8NjNO/Wg6CPfzWM4BWBn?=
 =?iso-8859-1?Q?87fpH7xP21qWzm3ozLrhnO3XJg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LoPwQCA2cvZv6sYGNKURLyu2mLFG+AYAuvbjwe75ukyCgj7Hm7Y5JDfIsi?=
 =?iso-8859-1?Q?wPlQoM1hEiqgfbKpI/o5ZPb3gkwzmtYeffKzqtdBB1BRUNoqF1GaWm/VfD?=
 =?iso-8859-1?Q?n/4wi86hufE5YYQejiDFxld/wksIT3PlhTqAzQa2/d2tFTpMstNSrYj4/Q?=
 =?iso-8859-1?Q?QI/k0xQrbx0D/iEcWCZq9ZKXN9vwSNSTgfqR04q+b6JF1kRylRl+UlUWkq?=
 =?iso-8859-1?Q?nAdB3i5zJ76baHEdK4nkWtLl3dDpN04dc15WFYo8wEFd3wQYOuMK4zTFrH?=
 =?iso-8859-1?Q?QP0GhaP2UOC64Q8H6G/ttq2nhUod3ndqQypfjScndU04IIp1qPClxNsgU2?=
 =?iso-8859-1?Q?LD1wW3T0B4snn2czmfRrK96jwiL9FjLcIPp55fqrBPj/gdX3lMO/141VPe?=
 =?iso-8859-1?Q?1as520SZgbJVGwu99Rwy2bBBtiUgP926/SS+8CXUXdcWezrumdLZbkApD8?=
 =?iso-8859-1?Q?PIw0EUSoVjf4jEGNBX4EXdjCNpXXWN6I0IsStxhoK/nWxwiiTd0Yy4ifMI?=
 =?iso-8859-1?Q?LhciG9tIlKePUsP+IJ5f+xH1cfp3ebuqZP+mA7R0rfAv3LXEp8sSZ6Pn2y?=
 =?iso-8859-1?Q?DwwH0sy1oI+k0QtDNnznJJehSftPHCcehTIV4nWJaUFxi9gw0iYxJe5dnz?=
 =?iso-8859-1?Q?hRrCBiTAZsG41h7y+FyrXFjsuciBmwv+7luQh48V6XRL3UJKDjWVxhCAD5?=
 =?iso-8859-1?Q?6d0ASKcQsROgpBZZRmxdZ2lRSD2Rtv1mCseSEgo6Xwd0tdoR4YOQ0BRdYG?=
 =?iso-8859-1?Q?lpoy0hmj4PTSA+vPtFc+JROy9iPpnrhOW3n4PND9ygfZH/S4RBVIsmS/6W?=
 =?iso-8859-1?Q?TQymUea3W+CXhWc6RxjCrOEqymDaW0ApaoGAjUOoCeKWeOhRytr/hpGCZ1?=
 =?iso-8859-1?Q?8i3No82etw/GSGxBuFKgdvhX9VprjT/foeAJZUGZFxkPbC+FQmBwQ7GITB?=
 =?iso-8859-1?Q?zBIYBHrNW/L7mD/jnfzujKg4LZI+OuDeoK1JAIoFsS+x5cusVWcobe6rPj?=
 =?iso-8859-1?Q?WW3nLLxeFCRwV/fR8lKmHwGffY2iR8YiSitpI5Aaw0hX3lO7o6NYb8wL5P?=
 =?iso-8859-1?Q?GJX9qKKCLEWVhgfcY1gd/o6FWKAqFk8/wYrtq64omJVGXkRMio8c8VGufn?=
 =?iso-8859-1?Q?gkPr2uSZl00ULqw9OfwMWILjPU5ty56y6FJP9MJ2MwwMf+idVLHwajfXd0?=
 =?iso-8859-1?Q?IyxmiA2fleoewH897Guz9iWqJmQ0SY1R+XVhryt/h7wrb9bmpgEt7LSWeX?=
 =?iso-8859-1?Q?BtMzwWyy7x16BVG9xKVG/sryz8esS058Nwx2NbTgyvPgqITf/U7l+uuAem?=
 =?iso-8859-1?Q?OncBR2lxsVAtY1wPdf716aza6zLb9/MZaHqtkq/RefxK5SfuBOMw5llbKH?=
 =?iso-8859-1?Q?IRa++2RYLhHp+iYFnPNs7Sga8sdrRJPo3D+L08XsylPHlf/x+8A4qjvnFC?=
 =?iso-8859-1?Q?Dkd7Q7hrj/G3NPtdJEghra/O80Cyce+aCPet8uDU5eq3YezgMT6BRUKydh?=
 =?iso-8859-1?Q?XAdRJaPSjfvQWW5HTbvLICECc3OsIK0pQhU+wv1OXrle9YtWAPFUIhmyvE?=
 =?iso-8859-1?Q?mV19nIsZ1RLhHgIjbq2XMe0erRwyiOOHsK0qGTjfFolpmCfT2/kWL5qLOP?=
 =?iso-8859-1?Q?RdYmmA0Trdk8ErYGNqci3jVk+HbkhW/1aBkOT/bqSAxvON+BvoDl+JiQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83822f0a-ee95-41a8-c310-08dc75ada0f5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 13:39:37.2149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyOUw7FJHhMcO+z0DkHi0s01q3or+jW6M9Utj751fFaDkJP6L6L9NpoxkpCNJfNQ8Bk14tymJPHTtF2ZweQmgRLPTgGdERXQcL5MoPgHslY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4689
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

On Thu, May 16, 2024 at 08:57:48AM GMT, Tvrtko Ursulin wrote:
>
>On 15/05/2024 22:42, Lucas De Marchi wrote:
>>Print the accumulated runtime for client when printing fdinfo.
>>Each time a query is done it first does 2 things:
>>
>>1) loop through all the exec queues for the current client and
>>    accumulate the runtime, per engine class. CTX_TIMESTAMP is used for
>>    that, being read from the context image.
>>
>>2) Read a "GPU timestamp" that can be used for considering "how much GPU
>>    time has passed" and that has the same unit/refclock as the one
>>    recording the runtime. RING_TIMESTAMP is used for that via MMIO.
>>
>>Since for all current platforms RING_TIMESTAMP follows the same
>>refclock, just read it once, using any first engine available.
>>
>>This is exported to userspace as 2 numbers in fdinfo:
>>
>>	drm-cycles-<class>: <RUNTIME>
>>	drm-total-cycles-<class>: <TIMESTAMP>
>>
>>Userspace is expected to collect at least 2 samples, which allows to
>>know the client engine busyness as per:
>>
>>		    RUNTIME1 - RUNTIME0
>>	busyness = ---------------------
>>			  T1 - T0
>>
>>Since drm-cycles-<class> always starts at 0, it's also possible to know
>>if and engine was ever used by a client.
>>
>>It's expected that userspace will read any 2 samples every few seconds.
>>Given the update frequency of the counters involved and that
>>CTX_TIMESTAMP is 32-bits, the counter for each exec_queue can wrap
>>around (assuming 100% utilization) after ~200s. The wraparound is not
>>perceived by userspace since it's just accumulated for all the
>>exec_queues in a 64-bit counter) but the measurement will not be
>>accurate if the samples are too far apart.
>>
>>This could be mitigated by adding a workqueue to accumulate the counters
>>every so often, but it's additional complexity for something that is
>>done already by userspace every few seconds in tools like gputop (from
>>igt), htop, nvtop, etc, with none of them really defaulting to 1 sample
>>per minute or more.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  Documentation/gpu/drm-usage-stats.rst       |  21 +++-
>>  Documentation/gpu/xe/index.rst              |   1 +
>>  Documentation/gpu/xe/xe-drm-usage-stats.rst |  10 ++
>>  drivers/gpu/drm/xe/xe_drm_client.c          | 121 +++++++++++++++++++-
>>  4 files changed, 150 insertions(+), 3 deletions(-)
>>  create mode 100644 Documentation/gpu/xe/xe-drm-usage-stats.rst
>>
>>diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
>>index 6dc299343b48..a80f95ca1b2f 100644
>>--- a/Documentation/gpu/drm-usage-stats.rst
>>+++ b/Documentation/gpu/drm-usage-stats.rst
>>@@ -112,6 +112,19 @@ larger value within a reasonable period. Upon observing a value lower than what
>>  was previously read, userspace is expected to stay with that larger previous
>>  value until a monotonic update is seen.
>>+- drm-total-cycles-<keystr>: <uint>
>>+
>>+Engine identifier string must be the same as the one specified in the
>>+drm-cycles-<keystr> tag and shall contain the total number cycles for the given
>>+engine.
>>+
>>+This is a timestamp in GPU unspecified unit that matches the update rate
>>+of drm-cycles-<keystr>. For drivers that implement this interface, the engine
>>+utilization can be calculated entirely on the GPU clock domain, without
>>+considering the CPU sleep time between 2 samples.
>>+
>>+A driver may implement either this key or drm-maxfreq-<keystr>, but not both.
>>+
>>  - drm-maxfreq-<keystr>: <uint> [Hz|MHz|KHz]
>>  Engine identifier string must be the same as the one specified in the
>>@@ -121,6 +134,9 @@ percentage utilization of the engine, whereas drm-engine-<keystr> only reflects
>>  time active without considering what frequency the engine is operating as a
>>  percentage of its maximum frequency.
>>+A driver may implement either this key or drm-total-cycles-<keystr>, but not
>>+both.
>>+
>
>For the spec part:
>
>Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

thanks

>
>Some minor comments and questions below.
>
>>  Memory
>>  ^^^^^^
>>@@ -168,5 +184,6 @@ be documented above and where possible, aligned with other drivers.
>>  Driver specific implementations
>>  -------------------------------
>>-:ref:`i915-usage-stats`
>>-:ref:`panfrost-usage-stats`
>>+* :ref:`i915-usage-stats`
>>+* :ref:`panfrost-usage-stats`
>>+* :ref:`xe-usage-stats`
>>diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
>>index c224ecaee81e..3f07aa3b5432 100644
>>--- a/Documentation/gpu/xe/index.rst
>>+++ b/Documentation/gpu/xe/index.rst
>>@@ -23,3 +23,4 @@ DG2, etc is provided to prototype the driver.
>>     xe_firmware
>>     xe_tile
>>     xe_debugging
>>+   xe-drm-usage-stats.rst
>>diff --git a/Documentation/gpu/xe/xe-drm-usage-stats.rst b/Documentation/gpu/xe/xe-drm-usage-stats.rst
>>new file mode 100644
>>index 000000000000..482d503ae68a
>>--- /dev/null
>>+++ b/Documentation/gpu/xe/xe-drm-usage-stats.rst
>>@@ -0,0 +1,10 @@
>>+.. SPDX-License-Identifier: GPL-2.0+
>>+
>>+.. _xe-usage-stats:
>>+
>>+========================================
>>+Xe DRM client usage stats implementation
>>+========================================
>>+
>>+.. kernel-doc:: drivers/gpu/drm/xe/xe_drm_client.c
>>+   :doc: DRM Client usage stats
>>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>>index 08f0b7c95901..952b0cc87708 100644
>>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>@@ -2,6 +2,7 @@
>>  /*
>>   * Copyright © 2023 Intel Corporation
>>   */
>>+#include "xe_drm_client.h"
>>  #include <drm/drm_print.h>
>>  #include <drm/xe_drm.h>
>>@@ -12,9 +13,66 @@
>>  #include "xe_bo.h"
>>  #include "xe_bo_types.h"
>>  #include "xe_device_types.h"
>>-#include "xe_drm_client.h"
>>+#include "xe_exec_queue.h"
>>+#include "xe_force_wake.h"
>>+#include "xe_gt.h"
>>+#include "xe_hw_engine.h"
>>+#include "xe_pm.h"
>>  #include "xe_trace.h"
>>+/**
>>+ * DOC: DRM Client usage stats
>>+ *
>>+ * The drm/xe driver implements the DRM client usage stats specification as
>>+ * documented in :ref:`drm-client-usage-stats`.
>>+ *
>>+ * Example of the output showing the implemented key value pairs and entirety of
>>+ * the currently possible format options:
>>+ *
>>+ * ::
>>+ *
>>+ * 	pos:    0
>>+ * 	flags:  0100002
>>+ * 	mnt_id: 26
>>+ * 	ino:    685
>>+ * 	drm-driver:     xe
>>+ * 	drm-client-id:  3
>>+ * 	drm-pdev:       0000:03:00.0
>>+ * 	drm-total-system:       0
>>+ * 	drm-shared-system:      0
>>+ * 	drm-active-system:      0
>>+ * 	drm-resident-system:    0
>>+ * 	drm-purgeable-system:   0
>>+ * 	drm-total-gtt:  192 KiB
>>+ * 	drm-shared-gtt: 0
>>+ * 	drm-active-gtt: 0
>>+ * 	drm-resident-gtt:       192 KiB
>>+ * 	drm-total-vram0:        23992 KiB
>>+ * 	drm-shared-vram0:       16 MiB
>>+ * 	drm-active-vram0:       0
>>+ * 	drm-resident-vram0:     23992 KiB
>>+ * 	drm-total-stolen:       0
>>+ * 	drm-shared-stolen:      0
>>+ * 	drm-active-stolen:      0
>>+ * 	drm-resident-stolen:    0
>>+ * 	drm-cycles-rcs: 28257900
>>+ * 	drm-total-cycles-rcs:   7655183225
>>+ * 	drm-cycles-bcs: 0
>>+ * 	drm-total-cycles-bcs:   7655183225
>>+ * 	drm-cycles-vcs: 0
>>+ * 	drm-total-cycles-vcs:   7655183225
>>+ * 	drm-engine-capacity-vcs:        2
>>+ * 	drm-cycles-vecs:        0
>>+ * 	drm-total-cycles-vecs:  7655183225
>>+ * 	drm-engine-capacity-vecs:       2
>>+ * 	drm-cycles-ccs: 0
>>+ * 	drm-total-cycles-ccs:   7655183225
>>+ * 	drm-engine-capacity-ccs:        4
>>+ *
>>+ * Possible `drm-cycles-` key names are: `rcs`, `ccs`, `bcs`, `vcs`, `vecs` and
>>+ * "other".
>>+ */
>>+
>>  /**
>>   * xe_drm_client_alloc() - Allocate drm client
>>   * @void: No arg
>>@@ -179,6 +237,66 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>>  	}
>>  }
>>+static void show_runtime(struct drm_printer *p, struct drm_file *file)
>>+{
>>+	unsigned long class, i, gt_id, capacity[XE_ENGINE_CLASS_MAX] = { };
>
>Why long? But it doesn't matter really, at least on the architectures 
>I know.

`i` should be long for the xa_for_each(). The other ones it's just
because it didn't really matter. Are you suggesting to use unsigned int
for capacity and class?

>
>>+	struct xe_file *xef = file->driver_priv;
>>+	struct xe_device *xe = xef->xe;
>>+	struct xe_gt *gt;
>>+	struct xe_hw_engine *hwe;
>>+	struct xe_exec_queue *q;
>>+	u64 gpu_timestamp;
>>+
>>+	xe_pm_runtime_get(xe);
>>+
>>+	/* Accumulate all the exec queues from this client */
>>+	mutex_lock(&xef->exec_queue.lock);
>>+	xa_for_each(&xef->exec_queue.xa, i, q)
>>+		xe_exec_queue_update_runtime(q);
>>+	mutex_unlock(&xef->exec_queue.lock);
>>+
>>+	/* Get the total GPU cycles */
>>+	for_each_gt(gt, xe, gt_id) {
>>+		hwe = xe_gt_any_hw_engine(gt);
>>+		if (!hwe)
>>+			continue;
>>+
>>+		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>+		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>+		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>+		break;
>>+	}
>
>Runtime pm get/put could be just around this block, right?

yes, I will update just this patch moving the xe_pm_runtime_put()
if there are no other changes for next version.

thanks
Lucas De Marchi

>
>But overall now it reads super clean, thanks for accomodating my ideas!
>
>Regards,
>
>Tvrtko
>
>>+
>>+	if (unlikely(!hwe))
>>+		return;
>>+
>>+	for (class = 0; class < XE_ENGINE_CLASS_MAX; class++) {
>>+		const char *class_name;
>>+
>>+		for_each_gt(gt, xe, gt_id)
>>+			capacity[class] += gt->user_engines.instances_per_class[class];
>>+
>>+		/*
>>+		 * Engines may be fused off or not exposed to userspace. Don't
>>+		 * return anything if this entire class is not available
>>+		 */
>>+		if (!capacity[class])
>>+			continue;
>>+
>>+		class_name = xe_hw_engine_class_to_str(class);
>>+		drm_printf(p, "drm-cycles-%s:\t%llu\n",
>>+			   class_name, xef->runtime[class]);
>>+		drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
>>+			   class_name, gpu_timestamp);
>>+
>>+		if (capacity[class] > 1)
>>+			drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",
>>+				   class_name, capacity[class]);
>>+	}
>>+
>>+	xe_pm_runtime_put(xe);
>>+}
>>+
>>  /**
>>   * xe_drm_client_fdinfo() - Callback for fdinfo interface
>>   * @p: The drm_printer ptr
>>@@ -192,5 +310,6 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>>  void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>>  {
>>  	show_meminfo(p, file);
>>+	show_runtime(p, file);
>>  }
>>  #endif
