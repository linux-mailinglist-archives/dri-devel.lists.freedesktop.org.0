Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D73B4FFBE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2486B10E748;
	Tue,  9 Sep 2025 14:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oK0ywa0m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C2A10E746;
 Tue,  9 Sep 2025 14:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757428989; x=1788964989;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RzhRi1e5HLaKtIaUbijEfUeMbA+h3UZ9l664Rlu4RFE=;
 b=oK0ywa0mHJTNm212DySZEUfGAtxjIXeds77cn6s3RSqjNQK0aV/W5+VI
 4VH3ERMg/gX4dgzl9Sss9VE/bOMAVTrP7G33nSBlQCyCh0K71dwAHShr3
 wWv/KpRwtQLedH6Oln8b1WLiEfg94U3wZSzwXPG1itn4Fzdlvjw/2Z4sN
 pb2Ki6Wl5I+fbnwdQyWHtN3i7S6nyAQbWfG/Vw2Pvmre0X653/JD3HjoI
 uRhE9qw/auePbxaLYRk6BV67XIOuFxHYZYX7NNH2ByFUjc6L1ED7CB4Mz
 kgmGI7/+fi9DZELVbZTrzNp5uZ5+xBDfjOCthvrA9R3xzoXoFMRnKwUus A==;
X-CSE-ConnectionGUID: 5lvaoPhiRPixyNbksUESdg==
X-CSE-MsgGUID: 2zdkTPgaRr+7t2IBRMLUfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="47287293"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="47287293"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 07:43:09 -0700
X-CSE-ConnectionGUID: L8uKPx7QSwWBsRaVUdy8fw==
X-CSE-MsgGUID: T+4P070wRVKju4q9oHtOnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172270969"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 07:43:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 07:43:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 07:43:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.72) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 07:43:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDkCXY05fJTqXgGsBw2xEeN3PVTRVJ/igIIC1LxJe349TevLpwXpBt0l/402rnlufHiUwf9VLqzkQ7pK3cYSduAAuUlB6q13FSkaaKjosagNnaDMQdu1T0l4NC7aQcc7M0ibBA815rDLUGBRAkn66rffvdO9s3WsDPi831NOIwqDPySf47FOtXGERFlogkhDmpzBv5+/TwVaSIawAp1lSSVREABErDiBxZnYjow6tjt7zmdcG200l4NIsYLeXcFHut085BVrNoPsCyCNDAIV6hEz3dTtWLRiXojbeZA4CoVF4U1jDKEyJkCXKgkFfB5jCyvdLeprxjAIBVIaDq7diQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7EeMEBRyxTXtEabyaqLR5/+ztZYDX+Doq5etY6FlKM=;
 b=pSS4lQRWQA0S90WdI75z1C9eZ8KzJK9T7C9GKkQpZwfnstR7BZhNOT6qbnRkPYF11rTGNQyFKc+6f2qFbiRupB8h/NHLmIjELUNhqi31jAy6yeCwzlkZFKOAfUcn7yoL5L+SHejnEkGmAITtDU2V2vTfBQlcS0hUyoqLCG4TYIbXG/+WPSVHT7wq7m7JbdEjC0xP4LsfWDO6Brko/yjU5Zt4bpcQATkqnxYWzU0+1RoB3WHcj24x6hvNvSrj2ydBN/Ks3MvbJhC9CIYzvRhoUAtN30wkmYcaej7k7/qJFO3K+0avuNYOxarBMfATRD0JdEDQdnXM3PXZVI9LiSHv9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB8808.namprd11.prod.outlook.com (2603:10b6:8:257::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Tue, 9 Sep
 2025 14:43:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 14:43:05 +0000
Date: Tue, 9 Sep 2025 09:43:02 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "mika.westerberg@linux.intel.com"
 <mika.westerberg@linux.intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>
Subject: Re: [PATCH v9 2/9] mei: late_bind: add late binding component driver
Message-ID: <wuy7xx57puqytyigl2fbosluckauxikgdvcrdvtubbob6olvyl@wlbsiuquprep>
References: <20250905154953.3974335-1-badal.nilawar@intel.com>
 <20250905154953.3974335-3-badal.nilawar@intel.com>
 <tbflj3r6picnz7pzhiz77gzhrdnmfxlruhtas4rfrvm27dapss@3wqf4dd2lmsx>
 <CY5PR11MB63665FAB1FE8D8CBE17C31CEED0FA@CY5PR11MB6366.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CY5PR11MB63665FAB1FE8D8CBE17C31CEED0FA@CY5PR11MB6366.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:40::40) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB8808:EE_
X-MS-Office365-Filtering-Correlation-Id: 18159c85-fff7-42e0-960a-08ddefaf2f97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5gDY1LcElEuO0CBdXMtYUF+z38y6VtcITEfCrdhO3OXg+vI2Vh3zjR1CQq6c?=
 =?us-ascii?Q?Jg2/8mT08cnefxadkYyccep/nEQJ1B/679ucIAqtRX+2kv47G6DyRn3icCE3?=
 =?us-ascii?Q?ZiL+sXF7GMwdprFzYE8FXEFcfNOmW9SaUPZLqSA2NEIiJqAKhIwC+mkJ1mHR?=
 =?us-ascii?Q?NpfTpdag0oMUKuYYiviecRzR295m8rl0gJXSQNeT7hMg642bYAO5z+0cezaP?=
 =?us-ascii?Q?P3Bo6O0sikgocVT3Mx57CWlksMgsa6VBYYF7Mgwc08Y05WStO6b/L8RCkCaQ?=
 =?us-ascii?Q?kV4JExzzilYdRr7qqlPzFmvI6PSdJ4XgezzOi4OeCQf9UQ42/M6kq+NKYKIy?=
 =?us-ascii?Q?wF9BkL2mn01Kb9N3cGCb6UCEr8HykOYsUeFSELIxz9JuMvBGLcTB753f1OxD?=
 =?us-ascii?Q?JQpLuzAJslgKE08d6x0Le/8b69mkBHCP4cvLDnrZ0CzIUDf4ffLkjulIOMJQ?=
 =?us-ascii?Q?dTGS3VA2rocUQKgRWz0ySxj1a7CpDhkwnWRA98MRoBwn/JnY3VcyIzu8pc0r?=
 =?us-ascii?Q?OWQ/pejsqR6Vw0azixP2AIKHH18DaKd/r9RdsRsHZzIjm2yGbm7GidmfqHOi?=
 =?us-ascii?Q?WxL1ZEiLbFUTvzLMu8CoK5sHFKlEVkpexOkP7D8U/m6sfu6DFO841pkyh9hu?=
 =?us-ascii?Q?8k/A2SdXSX2aUjULQc2CnkRDMVENCtWYxyHVsQR/ddaZhePhJy0pnYqC2Xm6?=
 =?us-ascii?Q?snUb3qNFyedxVNXscmGu9qtKD4FtNtNdk5Ld5+61AzvFNTxNi82lGN74SLs+?=
 =?us-ascii?Q?tXLGjPKNiK0gdjWe5Dm1fEiz975fzfyb9S6tptWIbWei4OQptm58zG37Vi9j?=
 =?us-ascii?Q?xCwUqvuaxmHWTBCXPBCz3EgVO2m6jSXG8MWGQqGv+JrsfSzl1tBi1B/hkSVt?=
 =?us-ascii?Q?5aVhi20Me8BluQn93VaTsnqn4L/j3wpScpvqsIQMwIofnaNDGp7Ce+GvklW+?=
 =?us-ascii?Q?SMcp4oLpn1AcdR4aXRwdtGt5WPPcyDGXtWoA6OsMP27LR9kbxiwoNQZ+2R66?=
 =?us-ascii?Q?g6PByOP8FTkCbYnT/jFDjdLP4TXDeP0kRheremWWvIgp5FWY3N4drzWmt55t?=
 =?us-ascii?Q?oCbEBWl9TmN7faFqI7XqlDoxEW0QBTElSPcvLyMOVNUeHSO9up0lj7Iy07iw?=
 =?us-ascii?Q?bVfyYC/YFI9RrwHvuTaLNQ5/b9LNwbJFRuAt9lI6FOn9SMNGKl1OvOPbtuA8?=
 =?us-ascii?Q?eWtdwt3qhO4cF9cTT28s1Qh+Rweq8YQ9qGsb/fcXIOQRYkqpelgsKPaeGjPf?=
 =?us-ascii?Q?EyZga4gGRsOrqm8xrKKjMtB9j8CHcPwGC6MnBGxS2VQkvCIiroHsKSQcYx24?=
 =?us-ascii?Q?aNaXytJ9I92l6lbQwRX5hVDgb2SyruMfzJYTtxfKZRGOOJZWvN5KxAb8YyuV?=
 =?us-ascii?Q?6rb5ffAk22pJsDswV2cFCgBd/EY8Vps+0sUTo9Zz/SA777olG21BGlBVWznK?=
 =?us-ascii?Q?WjkZFOVCVE/OqXQIktBDWUPyN0mzqZxREvzel8nOwtGk3x3rUyXqDQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VP+AazWAGsMwKcMNOsuRAXAn8rhHNRbtsFSbz2BoB5dgMihzDS+YwdzmUMOZ?=
 =?us-ascii?Q?3IgrijzK/N4YeWVHys9pAPLGUY+oaAfWcnC1R5HMMgeyHEVB3vPPwPL9E/p8?=
 =?us-ascii?Q?MhrHpYxJalJmHj3lLb4kv+YxQdpYa1GGxWyu/qacmmRpM0Ax9gcvPGWoeO5e?=
 =?us-ascii?Q?Vmt+Q+vMn27gVEvfLKfy6NDZAKwWRlmCv6nHvyyH6bEREy7bZPA+t7NzO6Om?=
 =?us-ascii?Q?96THttyQuBkVYvIfc1fR55HuOC13/r1UldXZ5RZivKx662G5CiJLKqH5xa6y?=
 =?us-ascii?Q?vsnbj592RR865YM3ohL1FhtgpQiqKN8ruwFhz8sn3i/X6nXV3ngoEl2ms7B2?=
 =?us-ascii?Q?grhnhLo0oI6T7XHyeRWdK24y57Uvk8m5WIeuMwXnPpW5/UmjG7hGIw7H1bOL?=
 =?us-ascii?Q?jpptJhYrdXlUMJaZyunoKH9H/FMwJxNckjxS+b8EN4CNCpGLFMShDXIeH3D7?=
 =?us-ascii?Q?jRrF3sd1sFCPE5wCZY6RnUe3oJblREAoE296ZJ7LHT68OdeNi4PYnjxo6sTW?=
 =?us-ascii?Q?E70OAA/aMmJxre+uDffx1OsoQfXApJEz//7bwm29WXQwdmkjjap1EmkCgYhr?=
 =?us-ascii?Q?ba5vqdylwi2B2Sq08FyKjBr1NovE+jkOb8H1hHS5VMgOnMqPbU3XhQUUyFUg?=
 =?us-ascii?Q?6k6LtqcwGe7HkDqnwnb++8HtKMmfdDbr5BQlzH/O1od2It5pJB/rvCSMwpsB?=
 =?us-ascii?Q?7bJ0hqVWXa+ZTvF5qDfiRJduDSe5+qSh3rI4p/XzYRkvSfL9wUZp26IjOXRR?=
 =?us-ascii?Q?d24liBMMl3BO4jREW5D1WOb3WuagpYSyqaF8eEIusOjB/L8IhDwLoWAJC+Bc?=
 =?us-ascii?Q?XT5AVm2fba3hZnw23s7WD2v9SymaFGAUjn1Ob+wECv+cku35S1Vvv6LL/c7a?=
 =?us-ascii?Q?YRMah7aOqIljyKT6BB27hnb9YO3NSPYgtM3YoIjEYxbSbLWwVNxVFaiDHKP1?=
 =?us-ascii?Q?9+wqimD2WPh3W1VFjVgS4bzxdyNLn2fRExsz08fxT+w4YXgJId8WgOWjZBaZ?=
 =?us-ascii?Q?vgIEQOAVIAjbdeERW9cjKYZfxUDJnWCy4dA3/wUMu+XeS4SrvQieRDVKmM95?=
 =?us-ascii?Q?tPxjlBBxtRR3mXsNSpEFnI5ZNscHxjCSQo1tdGiZpKZTzmF4tB+kt2UMvP5o?=
 =?us-ascii?Q?+mgWzera7zD1gtalRv/0KE2DEgnBbrXzDr9EyUnj/ypT8N17OqHnGacFu4R0?=
 =?us-ascii?Q?IquDUa5TZjqXHN/AhFl9UYmPlm3cEihqaLD8RTd4eXZ9pdl0Hwe2zqE8XRKp?=
 =?us-ascii?Q?jyV3kL3Zm25XsWZ+GrZ8i4XiODB75q2QixXXVmXBCtEeiIYhrUPSfJStiqB+?=
 =?us-ascii?Q?66obgQyV9R7hVDocuanufxxvo5q/mTQlq7/AYHeZZXhMDP1GnJX8UfPn4Hx9?=
 =?us-ascii?Q?HYxghkeXphhYK4CjW6uoVpdQbjjfoiFmhVmb0gAcD6u3LxTHy58Uk1tvl5kO?=
 =?us-ascii?Q?xmQArc8QCqPX7ixY27DgVc+JDaH1TloACnvPs5eJgy47eR/4yrKdkc/9pIL/?=
 =?us-ascii?Q?MVZ7zC/aMgCqkgD/0gm+ahjKEUIghcqviPljr9cY8r/pF0+S6N2y4JcepHMR?=
 =?us-ascii?Q?E7nFE+A1zl62IZF5BvMIP8Ggxs3rlzfBlpSMRfo0nIECeqQ5maj1C65PF74z?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18159c85-fff7-42e0-960a-08ddefaf2f97
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 14:43:05.4998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /o4dWKRhra5Lez70c8z8dyQ6BHvu6xfuCgF9mMcMho4GHqWF4BLWgfeIihx9ctAIZ993HkAhLthOrLpVd+p3Lo+AkL2nfD+cTRMW4nIKSbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8808
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

On Tue, Sep 09, 2025 at 04:50:41AM +0000, Usyskin, Alexander wrote:
>> >+static int mei_lb_component_match(struct device *dev, int subcomponent,
>> >+				  void *data)
>> >+{
>> >+	/*
>> >+	 * This function checks if requester is Intel %PCI_CLASS_DISPLAY_VGA
>> or
>> >+	 * %PCI_CLASS_DISPLAY_OTHER device, and checks if the requester is
>> the
>> >+	 * grand parent of mei_if i.e. late bind MEI device
>> >+	 */
>> >+	struct device *base = data;
>> >+	struct pci_dev *pdev;
>> >+
>> >+	if (!dev)
>> >+		return 0;
>> >+
>> >+	if (!dev_is_pci(dev))
>> >+		return 0;
>> >+
>> >+	pdev = to_pci_dev(dev);
>> >+
>> >+	if (pdev->vendor != PCI_VENDOR_ID_INTEL)
>> >+		return 0;
>> >+
>> >+	if (pdev->class != (PCI_CLASS_DISPLAY_VGA << 8) &&
>> >+	    pdev->class != (PCI_CLASS_DISPLAY_OTHER << 8))
>>
>> this doesn't seem right, we should allow other PCI classes. AFAICS this
>> check could just be removed and just leave the INTEL_COMPONENT_LB below
>> to protect for component match
>>
>> Lucas De Marchi
>>
>
>The subcomponent is unique only in its own instance of the component framework.
>Or I'm wrong here?
>We have to ensure that we have Intel display device, not any other device to
>subcomponent check to work correctly.

We are matching by child-parent relationship + the component id. So you
have both the mei device and another pci device that added that specific
subcomponent and both need to have a common parent. Thinking about
another device that would match the parent-child relationship:  audio,
but audio doesn't add that.

what scenario would cause a false match that I'm not seeing?

Lucas De Marchi
