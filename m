Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 517716898CB
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 13:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB3310E786;
	Fri,  3 Feb 2023 12:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835AE10E78A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 12:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675427551; x=1706963551;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DUWRCs+QYvrEb/4orQ23xPl+EEvjheL3F8/LB+1zaQs=;
 b=US49dzA+KXQlVe2Vv6YIG+WfQZLzkZqMvAuyaLcC73LdC5O++KcDNAv0
 n5jQFKgOOdn4ZoMz3DKYY5znue0GtJsDNb2zdBr3yW+meiUXuCPl3mhft
 zR9I6qo9IyztTkg45OZtjZZYR8/97X1eLknDexmJp+FfLV7V76x7X3xtG
 /yEAPxst36k50ZQGXUHhfpZh+H2P7Y0yXSHQLc6rikToRckuLDuU+V/c/
 KTEdCurkJpVzdep7lYRUD1wPAUe3qzeLx3JmoFdwmhZWqwAUHa/Qc1Yqy
 PQTPiG2349+rXGzlmle4H4xwxL5jYMN2mjyC4MXm8V0H2o2jmw4Pa91z2 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="393329156"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="393329156"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 04:32:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="729246750"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="729246750"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 03 Feb 2023 04:32:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 04:32:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 04:32:29 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 04:32:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WICZPsMvd/vcEOiAwVPzIM9eugq5gb/ZoD3GKIpAjM6IMcYgztQk8e1zYPWU7abChIYsni2+T1nm2Nab+mhx+f8KH6E7XJ6/EICCFD12DrzIslnqjq9ioNQybkTpGUw1ce2K87S4Jr352TUJ4KMhYlvKGP+vwlGXukY1lc/pz98aavBgozj8vW5mVyBecTaJFUIKJzMuSdy/prYs0CmpWQ/fgqPJ9/z+cZS6rXxiVZ5eAvedRFR0dsA/hkaR13+H9UL3G/FLTbYjBN0qKoovuSd7dfVNxwBc9doG4RJep/OCAI/2z75GL7vDwugwsG+RJ4pGwhHNDrhNKArTj+zjQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wn3qflYdeLRXh290pvDwwBccJf19QZTCaugTxEF8Y80=;
 b=ni4BXYLzSx2Je4R7wbCN9QIiOnzP8s6zOD7Lsw5/WyPxm/MTX6fQPnYE6C3cFxvfsz0tEwOOQyI8vgy68KtZW0ouKpqlgEWYTe5uuu8Q/I8hMoZt0yUD7rAFE4OBudKN7MVVHsVK9jMxOzJxJW7znWs3aYctlxPKigz/+jdJqARwFGOuSQZIkxL4fZ8o3G/nJCcWy9WxJK7BJEubQdoloqdYCt26QDc/nqKauLa/5jZa8rlvlTBTqxjfquwBqzfXC+pOcXBPEeKttHgr7YQf5i7//HaX7iAXv8NvibbyWu/2vfviZM2MgYFvLvRlwcxKg8TYe81cgdnFiPg4iL3jag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 12:32:27 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::8808:cbc4:63f2:eb7e]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::8808:cbc4:63f2:eb7e%4]) with mapi id 15.20.6064.031; Fri, 3 Feb 2023
 12:32:26 +0000
Date: Fri, 3 Feb 2023 09:32:20 -0300
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@redhat.com>
Subject: Re: linux-next: build warning after merge of the drm tree
Message-ID: <20230203123220.u74adkj6doafjmqu@gjsousa-mobl2>
References: <20230203134622.0b6315b9@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230203134622.0b6315b9@canb.auug.org.au>
X-ClientProxiedBy: BY5PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:180::27) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SJ0PR11MB6717:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a9308bd-1a53-498a-834c-08db05e2b550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: arNAxsJaQhQ9N/BqTlj0UvDDeUIUO8K9mpGrgbpT4JQ8eD4vzXDYb45cG4EhRoQ90rpU/aq3q7pZXojWoZcitCSJB9PD1KiXe33TokMFAaAWhcozQmLeKfrWoulM/vYELZU5S3jrN+ZPSFObJlvYYFkMN7SXw+XscbvxhMkOEXTOqeWFaMfOMF4t3AzlGbVF8wB5EBCmmTlEsd+QZdXseY0CgiKtuk00aX/5vCp//B0V/7NBJtpXciPXISweD8kEZXhFDk71aLMzE5mFsbdxd4JRY0raKP+Td+mMi0UIhtxvyJTByWaxsXw+D5lu/X1B2Q4oF84taWTMRy0B2k1nA0yXI3spUzytHZRy/h+CZv0TVZJ5vCuFLyD5Y5ZYgNMTdwd6TqPu/Cd8AFCgesYGZmu7wPHcBjflRnPeY5JUHcdHXQ4A/iDTDV91nh6wX3J5WftLoO2OJrCcbPGSFTLRnBFmm/cxabjRXvi3q0DEVuLknWYPFh9S1BhpGYmbCuHCGJdCFbGKv/SbNICjMf4sdAHyu4Vrd+Brphdyye4DH9dKxVW5CUpOkE+9lk+/2yZJjhcN84NTZ8x8T3s3RAOnuZeTx+1XQFxxivnhMzlYmYw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199018)(316002)(110136005)(54906003)(66476007)(66946007)(66556008)(33716001)(8676002)(41300700001)(4326008)(82960400001)(86362001)(38100700002)(6512007)(186003)(9686003)(26005)(478600001)(1076003)(44832011)(4744005)(5660300002)(2906002)(83380400001)(8936002)(6486002)(966005)(6666004)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZvriwuQ8ndK5EwkNIPI+Nm45//oTtUOwAY53vt6THhqSUlXv+UUrFCTUsxRp?=
 =?us-ascii?Q?EjquTWfLvTMbY7oUncQCxqiOj3vUiMimLPDH4/coT/zwupsJNXjp8V6+/d44?=
 =?us-ascii?Q?HPHtV6c2ynQ/eqkLPG6nN0LsvBN5uwf73v+di4rYVxeKaMoXvjcN3gjT4Of7?=
 =?us-ascii?Q?HNGML7zkVhx6hOQ5Yh+kdANfIzqNEmzIaQ888+SanbM05T40f9nu2JGOsNYA?=
 =?us-ascii?Q?/ScdWrvaL6ADeZiWhfFt+mL51nQLvuKtppgJhkdVzSQgMlGzr6k2ZcJdPS5h?=
 =?us-ascii?Q?iyd6TShTVeIG7XYqM3YfU+i4+XC2hZ8fb5rKA2J1oqZJo1kk6CXOQOjYqDK/?=
 =?us-ascii?Q?6mgsaf87RNi/TBowMDpux+lQIy3ngP34ndgu5hR670enE1IjLvXNovehywcD?=
 =?us-ascii?Q?pDp46Ju9cUmpmmJAs5/qR2oAWU2MhfAViryGdwLFBvdKJkK7Coz2s7rOshfp?=
 =?us-ascii?Q?HK7JZjjTi2kBRVVvuMpROV7vB9DCaICRQehfPyePrOv1plRAZtb6BYez2FJc?=
 =?us-ascii?Q?0tuu9rMToWVGdmlcDlPKyBVBhwMTRw+ooaSLOSToL1Mtjj90w33lUMZrdVDh?=
 =?us-ascii?Q?V51KwtdtcP5JUhZdKjtGSgCpm0V+7uEgB1tslWbi26I5qImhV36jlAbmxYZE?=
 =?us-ascii?Q?ZYEEQkMxkM4kjS7HDiW1nyIhxJJz7lIrw4OK+7Efd678lotMfESAHVjM+bO0?=
 =?us-ascii?Q?qpSKtd9J/PZrJa1g9nlxt1XB54wlhcJ9Oz1ajvFmJzfZm5DpZUnn1Owl2ycq?=
 =?us-ascii?Q?b3yA8l3AD2Kgn6H6rbsLyyv5zpm/YHMqzEcUZkOcRFMtJKYhMLFx9X79t99m?=
 =?us-ascii?Q?38+mxic2gmFeyfttrgk7FkiHkjv7d/obolPyucm55+9flCApSmKm6AboFgPR?=
 =?us-ascii?Q?43vgq7k7ku4cpVqfjzcYjZWBKlhBR/Mo/oZUdJXPuRhDQ3+gPjbrHKuj8uoE?=
 =?us-ascii?Q?KR5neM8/GTIsemW8FJuekd2+oRSwf2FbD/UQMlJKmcbOzM2XluD2NvydKQ+r?=
 =?us-ascii?Q?JfeQWofcI0N309W4JNYAkN9cG0l3Q0GH5qwz1zc68V5lcD1n9a5iDd8Wyrw6?=
 =?us-ascii?Q?giMTd3WPjHCpe6eccmhG0JRNpXR0IdHDr2IGlyz2EepI5+hkzasT6mPPNh2T?=
 =?us-ascii?Q?P/5yXh6z61MKVAVMRxrPz7g5/fQ2VecoEBYVo0IGvMZ83rPz7kL8Nbi6M0Te?=
 =?us-ascii?Q?9L+GK5wY8ftJdyPVvkaGtY9kslSVn2bWQeNhNvN8Feyjfi1+15mTaLYWRTtx?=
 =?us-ascii?Q?vm8AssobsImncJrY/9iQPDQAHUqdfD9U4vpnB5Zv0cMHOyfd+WDIIjo48pkc?=
 =?us-ascii?Q?4ToMebAqaFfUK9AByb8Ui5XiyXjnfpBZ78dLtf2AuRJHyqKvaiBg4Dll+5I8?=
 =?us-ascii?Q?hP35NLNuStqsh4SHZILZOi4RbWjabgP1uNhbOaz/n6MldQAwYTsud8k0QXdH?=
 =?us-ascii?Q?+KjYL+waANdm7mgQHLcONpp4TnqjJstSXZxFga/ZCiZRGhQ4GKuTvPFNL8dP?=
 =?us-ascii?Q?3JXbgry2bTv+8/HOkLrJjssckBQyAHtb43OeNSLXbKiBAdyAn1BHV1YlkEv5?=
 =?us-ascii?Q?EmcPDBLPTjjqeJGRRuV4sWV9CVzp94lGDvakgiucGqATtx+CJJ6DS3bpHzvN?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a9308bd-1a53-498a-834c-08db05e2b550
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 12:32:26.7163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xHf54edSlNoIBS8qFQOnSl7lvpYN0pkjRroXk8AuTypjhZZQH6e0M/6zuUalWX/b1f9LioUIVuyforbqXK5C+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6717
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 03, 2023 at 01:46:22PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/gpu/i915:64: drivers/gpu/drm/i915/gt/intel_workarounds.c:32: WARNING: Inline emphasis start-string without end-string.
> Documentation/gpu/i915:64: drivers/gpu/drm/i915/gt/intel_workarounds.c:57: WARNING: Inline emphasis start-string without end-string.
> Documentation/gpu/i915:64: drivers/gpu/drm/i915/gt/intel_workarounds.c:66: WARNING: Inline emphasis start-string without end-string.
> 
> Introduced by commit
> 
>   0c3064cf33fb ("drm/i915/doc: Document where to implement register workarounds")
> 

Hello all.

First of all, sorry about that!

There is already a patch[1] in intel-gfx mailing list fixing that and it has
already received an r-b. It just needs to be applied by a maintainer.

[1] https://patchwork.freedesktop.org/series/113193/

--
Gustavo Sousa
