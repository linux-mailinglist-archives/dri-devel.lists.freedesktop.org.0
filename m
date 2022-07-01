Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8157E56385B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 19:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700A412B4F9;
	Fri,  1 Jul 2022 17:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1317D12B4A6;
 Fri,  1 Jul 2022 17:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656694829; x=1688230829;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DboNgO5polsX2buD9ASXkaH7ZeFMseC6Na6zFs66jUY=;
 b=D2QjwufIHiaTB9A67+XWMQf1SG6MnRuf1CxGzVM/Kr4yECypDfTeKb2K
 JWhJ6usPDZ8H6Da2XkFv/0nuzspmMClw63bNw8n7CcWpEYpfHm/+kdXO4
 +zjQ4w2t5Rdy5BkQMhKeoM+Em2KM2iolvrnobGnZJaUJGBCV4bZNcHJsa
 2lxGrGL7wMISGUpJa5jiR2PeYzLQnMb5MgfLAy4iIZCXJyGfQ5zDey32M
 zmvDJiK2ccgFOVDC1hCr5v/m5DW7hrBcw8F5o5NSdx1eoViE79pK3hgbP
 ACvqs31msYqEzQcajkbJ259OR5CtSjvaSKDuao7ta76hCrdHd6cDBoHLh g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="263094401"
X-IronPort-AV: E=Sophos;i="5.92,237,1650956400"; d="scan'208";a="263094401"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 10:00:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,237,1650956400"; d="scan'208";a="596321203"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 01 Jul 2022 10:00:28 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 1 Jul 2022 10:00:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 1 Jul 2022 10:00:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 1 Jul 2022 10:00:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkan0+p+4fASemyKOYvcfcCigMztHolq0Gkbt5vRB6drL5iYhAw/oEE/JI2CLVctJnXlS/d9zuhpBhhndTHlZJNnwHln3uFrodz4w40aijE1lljVhwcPG/DkIzhIL2p/Z5Sjp8FndUKX6Dl5PVCoRSoyWse7+TNblLGt3DOCYGekc7XzzBtbFshJqEl0dNVXGpZqaPbrlbzMxnMw5mqF2a1NKC01tjpa9OWuxxije8frkZzM6VqLOnmgMqB8sKUkn0N1hmw9x5LnBPy8ruj2N36zEoqJnVVTebTMMTA7JaJxwyFd+Gy0KiV6O/lpuDZKvqJbrF3VZBAo1fF53d9ceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znrbjrlAPakN95OBjQIIVERENxS9j3xCnycdx3rdgA0=;
 b=KaugfvQGsRY/xUsNepOG0ZWY3gtiHPLyxkpzMwzjs3odKDE4hat4K93ZDmP1YlKc36/sRZ8LWaaYEXER3/AKErPd/5XIaPnKJlV2l6vSIHE3JGN+sIJg80dYHu7fOUw4YIWfiIdflVvT41JOrXAUCe08uuHJ6wr1qCXANlBSI4xpYgYMN2MjqeINfj2ZqOEQ+jusi/VRXcoBDurzyDPuMfdOgL7u6fR6Qe1lWklVph44ye2Gw8ZGzd7NgsJCaMBPlJ/m22/Zpj/Mzm3ADVzfrxkYBCGFGkmb7mm7qw43B86Y3OpwkO352TWtU+apBm9myxJFKeh9UouIZN0n8z/MZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5372.namprd11.prod.outlook.com (2603:10b6:408:105::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 17:00:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::a012:82da:5edb:513]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::a012:82da:5edb:513%7]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 17:00:26 +0000
Date: Fri, 1 Jul 2022 10:00:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] Revert "topic/core-for-CI: Add remaining
 DG2 and ATS-M device IDs"
Message-ID: <20220701170024.nwwytnmz3uqqzjnc@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220701152231.529511-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220701152231.529511-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0085.namprd04.prod.outlook.com
 (2603:10b6:303:6b::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32ef8fb5-f7e3-4e5b-5153-08da5b8331b9
X-MS-TrafficTypeDiagnostic: BN9PR11MB5372:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qFzBal0xOWV4eJ/XL5Vy7Wyc5U2Dooc0IYsgEKCyaNWbB3if1UHXp3zB7+D1gXVnQurohST3DB+MXvDjbRMexYsmMkBzwlDNFyakkhvLLA1Nl6TxtG9/aSxTl0xvv6f67p3HeE6zSbR0mXM1cc5+7okDxejtp1yaREfk8dT/nL3ihnwzlJ+wszWBVmpTx6fkJhqCgfbR+0iURtak7Ky3GOk4lIrZ2LpG1AVD8or2c7U/rdMxPVe6CjIhCv+s8Jzl0AvpMzoVvpNc1H7C/GNVkqYZI9zNKN7yYv+54QwS1tghivORuT5oEl0HO5jdXV6Yq5elASXenGxkEsVaWZ/72+RIuhXRvJNm2oQiYcdGCMO8y03IjN9oi3pTV7cP8TWbRUTQK3Ctb1kVsue9jildhe1FJrU+InpiFps4/Bt719Q5nUqLIpDQ26lmTD4aBT/FSt5TcZnEcrXaoBhRX2sGMS8WhzlJisnDod/A+O95hWyxOp4xwd09pM6nGhU9aHbRIqkdzym5p3NdHYIMHCNeQOlm4pVTiWflmCpAw7F+IDbF43xLWBVfMNZkZvflr6GW3ckfpejOxnDCeo9tttWQ6PD9oZw83xv//Ot4vt3FNXRZ2lneazMMxfHR7VwdG2n43A470aHZ/sA4N8Zb4HJ+8rTFXOjDVACDkMD0qdoMczfaunBYM7Mwa9Ft8CXBf/vH/Ms0+hKCr5v9vnaaDtLtd0mb1lfmNzhNBxAVRhA2JEjFOKZbTWa0M7Z8vN7RDxrIynQMjkF0o6+AbO1ZH87uLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(396003)(376002)(346002)(136003)(39860400002)(6512007)(1076003)(41300700001)(86362001)(66556008)(8936002)(38100700002)(478600001)(6862004)(26005)(9686003)(66476007)(4744005)(8676002)(2906002)(450100002)(4326008)(33716001)(5660300002)(6486002)(66946007)(6636002)(316002)(186003)(82960400001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tByQZQlq6m8ouYEouH0do/Xb5q4uwgSdxFSNihjiBD7+tPaP+F5iRFVMSK11?=
 =?us-ascii?Q?Opkh9q87BaY9CMQIVQa6i1PH8HAKuxFz+J4AEzKHIzqDkPmbvNO9pEne+8zn?=
 =?us-ascii?Q?9zJ2Mb99bjXVE9PkzMzI/HO3oukoI6vjG2ICQkp05TGY7rxngMbygfdJ8Cei?=
 =?us-ascii?Q?uHwTbU5BI9LqzXZU8FumhhKv/ftl1bEy7lABhAltgigQovWyUr/dx/tI73Fl?=
 =?us-ascii?Q?+lZL2uw7lnNlqpkdETnpp3eCVrfBi13uUS3WivJ7rVMi9r+mmMwrPZaHPZi1?=
 =?us-ascii?Q?seYUBSHfJfYDXJPYzJ1OrtDCP5lhujUSJl1W1FK4agKG3QIF6M2Jzfrjpfzg?=
 =?us-ascii?Q?LYnaxgecH7AOrEBRao+amkaXfmvkOKx16ty6pIej90IzSXtkdyaL2i0/A8Hg?=
 =?us-ascii?Q?yf4xtv+waPP95FbBowTUvDMH5jvfjAADPKTxrsrMpzaVS1v1PrepLd7s2cme?=
 =?us-ascii?Q?mJKxoIwZTqNlf050t2f8xpsb0KUeM7yK69tF/xzeJ6Rrn7cXlkejAFo3fEvF?=
 =?us-ascii?Q?6FoO4WrIhTfQN7hnBNZzwdf4EmUHR+f67pY9gppqB00ONy7aB6jqMXsgy8q7?=
 =?us-ascii?Q?6hafbN8rtI2X2vdqFxjfZr8cf+uPyPuwGktms2UROSCDJXOlZiVtsmTnw/kI?=
 =?us-ascii?Q?3zTkLstiYIzvz2sZQqT1Q0DBK0rSgtbt6JZMJDFWZIvPhWmb1kW6RxsXo1vV?=
 =?us-ascii?Q?SqaI1JRcgz8Q6nEiewt+WGrO6Jm6ZSAxHhPGDVwIXzJJkoKpgFcCD8zmYscC?=
 =?us-ascii?Q?3aRgthzki43WMyOHl8J9afpUWYRUNrsMniK+P7npqKSQX866gjMCvwx9prrw?=
 =?us-ascii?Q?Bc8OJflzH2Bhhr+2dHHwj+P+8R2NYE0e6Gr1QQ+gzxkM152YbjqFXRGAUpTT?=
 =?us-ascii?Q?1g4JpyXomGVoCqD4EWz6s3RnfDcsJYqK1oBDGvYdjmNbxIhODfWzidD17HNi?=
 =?us-ascii?Q?8UFN0LgRv9bFqwoFNtiXyOPOweTPjF6L1rb/NXSI5POAUTlBZ/dBNP4egw0u?=
 =?us-ascii?Q?H9pYCIxVwQLDCHFU15AOcaNUCn9Gg/3WRcr8VpSfPSazWmAAkQvjhz+W1ej/?=
 =?us-ascii?Q?hZgpXRvdyN4YEeS/wGsgg+BCkKk4fMiB0qvKiPsuChKSxY8e6v31cfgntGH2?=
 =?us-ascii?Q?en4RlozyCgTzwatCwa/Bcfx4AzjV/9RfYzeirz69TNTwoi0HBj1Nk5pq6a5L?=
 =?us-ascii?Q?JJX4uL6t0Y8XAgiNHtUFSwKiwzomMbTimsBh3c1MwhXhI0blChoNzvek6Pim?=
 =?us-ascii?Q?KtWTw3o+EXqXCDET/mEkVEAZQ+HuBjHgoly6p8PbWRilsNpdQ0nQOmV4PO3t?=
 =?us-ascii?Q?Xxi2KAl8NGpFvsRMjDOIZa1/Df41eSZrN0ts3sHl6RjeLjl5+VoLsS/Yq1f6?=
 =?us-ascii?Q?LRAKjndcc/g/c3UcLpslrkSwUTka6vj+rYRXx/sS6iUdpxnxtpbTT+/5HNaQ?=
 =?us-ascii?Q?yI7f9uYBodmiQGqtXKjPboV4nbkWpGiwDXPY086cXdiQCdDoYZbBVAyKgEdg?=
 =?us-ascii?Q?Ejs9Uh6Wlt4PqIvxMJJsyMw4cxIhIrFi1r75or4Ah/hoJHlK5HqElfJ7GTuI?=
 =?us-ascii?Q?NdwduTL+3GoOjCnDsaKVXjCbJCNwicXERpsf1TSt0vTtHygCxEuE9+7ugrpP?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ef8fb5-f7e3-4e5b-5153-08da5b8331b9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 17:00:26.0199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRI+gUkcy9ZxYIvCy2bqDTf0D88w8h6GVetBE72NqYGYWqxe4IE4jQp6hWL6+0dRCFCYYLIeKqVS+Ag7+vVZTB5CSd+lPvKlO6JWY1+6lkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5372
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

On Fri, Jul 01, 2022 at 08:22:30AM -0700, Matt Roper wrote:
>This reverts commit f7d7dddaab81eeae4508197b5f38f0b974d97b8c.
>
>In reality we'll just rebase this patch out of the topic/core-for-CI
>branch after landing the "real" copy in drm-intel.  But to prevent
>pre-merge CI from getting confused, we send it as an explicit revert on
>the mailing list.

ack on the approach

Lucas De Marchi
