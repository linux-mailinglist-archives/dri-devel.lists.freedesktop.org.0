Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6D765DBDA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 19:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D1810E5FF;
	Wed,  4 Jan 2023 18:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7455B10E5E2;
 Wed,  4 Jan 2023 18:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672855587; x=1704391587;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iKrDOyu412+ZZocs2AgzI22gClI40yXgOAxPKa0PWE0=;
 b=adC8jJHLfbVns5uavJ5mL91yVsAAFqqt+KxKlhyPowyWjFrNLYwsszNx
 N5zdzbBfrUonXDVBQOR2Iy3Z1MvtPzkk7igB0NArTYhedQauDZZQ1JItf
 7+5NlRQMH2+Z4ZTN9/u9v2tO4r0qBRVilDqtv2/dCLSselW+Btg8hy6Tu
 iMLHvdDIyOdWgOQexLEqcKN56/c7H7n5LO8tOLEuS2rGCAQJXQGExPLDX
 AuDeYJbArE50sESmA8gmPDMOPCZ8+caYdhxTnqeB61XneBOSmNo6Mc8WQ
 QAMw7KEkx43uRzOX/MXFZXaApdyMzt5C+5p4eqiz50qUwDQ2CkQJO2+9b Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="305506326"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; d="scan'208";a="305506326"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 10:06:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="829238811"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; d="scan'208";a="829238811"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 04 Jan 2023 10:06:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 4 Jan 2023 10:06:05 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 4 Jan 2023 10:06:05 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 4 Jan 2023 10:06:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2zgSfrxJWmG1mhDlLuIh3tv3RulCE5Jtu2r03ZYcpVk17r7d0tCn2OU2v52Ia61GhG7fRY6BWidI+qklEAbToF/DdH8Ih26A9nOFms95Io281gnIg3X4N8jpT1TELJ3UhlHmsyaoxfpIKa4Yxyp3Dk/e7+2waCDfD1EyUTO/BGEW3m+Vc7/KExLto/djUrf0Ph2EtlLLx3MqHB9tgPTkUzgajjOMfRwHQcMnw8Lp3vRT4hCdxQssa+VNMcyUYSW+pN9ktKZ/gY29axR780qDFIErEEZVL0K1CB1eYxOJgJjviLRCQBowP1KRzhvQWANH97z4bDF9OpRQczy4T8VYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neUR4vkD+z+M4Ebc2vVkRHxs7Fg44syvUT0j/O2+HRI=;
 b=mjsgiGxq1JOZlZBXQsvymmkmStgz59/WBirEm5Iwpa29W353p2T6nRRrCAFy1XIOGMtuETloXoiu0nXYU4W2zmXjLmuVJzstsSkgN50wBgXTyv725QNfMaVcQoaEXCOcoE1xnqSxEqp7hWXqEfP7k6OTMAy8W2IgeFwjS+CILCF/Jy2wmV04zxd4jeeZYkHYeMiLQOgEKeFrQR9balxNU9wYeqXg8ueQIGZFiR6VBR/fKCqXcIIu4pHUXnOjMkaUql57yDN09tEG43EymWAQOkzrQ7BYgiCf4KhSLjRpfXmq/EhKGxIcsAY9qlfBJamqRGuO+WAl45c+hTcihzeNsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB7184.namprd11.prod.outlook.com (2603:10b6:8:110::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 18:06:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808%8]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 18:06:02 +0000
Date: Wed, 4 Jan 2023 13:05:56 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] drm/i915/fbc: Avoid full proxy f_ops for FBC debug
 attributes
Message-ID: <Y7XABJ9MWCWO5IUA@intel.com>
References: <Y6qmNW6cOHjGwn03@qemulion> <Y6sn1BmhFJFssW0h@intel.com>
 <Y6s0FSK9+F+/oKSf@qemulion> <Y6wl9NhYZG5RjJL7@intel.com>
 <Y7PG5Hx5dDE7aHSx@qemulion>
 <alpine.DEB.2.22.394.2301041850570.7216@hadrien>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2301041850570.7216@hadrien>
X-ClientProxiedBy: BYAPR05CA0098.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::39) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: 4365b236-f377-4028-5c2a-08daee7e5706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g4MS1UpjpHPDNYXeiKPDM0IVJI3sfJuG+exLQEeZbIRQYXf2aKzmDHrr/ULnrH60Vg3i2llUi107B+503JEOooBttXvM2UCS30OjzOk9zeGoK5WkKWBfibs1rXXYEhZpygy40kgzFJC+OjIFBeKP55wyWp3IJUwT8m6eNezEfaIVztU9cn9XmcCpM6YmCnPZeewXbyHRqlEA5i6eOEw58n6vC7e7e0vUzCKdxAbfPvOyxudJx92z6LwgdnLj5E5ruINQNoGYlzav8iTxhMORyjn+eMQb81CC/K57gR8s0QzIlSBQQc/XSi/I5dsYIy7xruM0G5XjhSkTyJaVLPMidNSOjjiqUpyk8XXjfpxUOOOnZvLg+kxRtlvUkQawQmyWp89RPSDu8OgVyMo44jwGTTX2D23Cc7xqckqouI+E7GnHhbGWzJN0LBd0b69v+0Uw5SEYJtptS5CRq8OBWb22BNBOkQ2MnvB/2ZOY35pqPc5dLrP6zHdZj93ulTBNpr0MJG/oGQKo0oBL2WE7+uVJsNloLUj7XaYNMXhUdpNWSwlaJsT7kGl//LDUtA6IeQgtvsb+7O+Mpw+ezbTuIRGHTM2yO5n9l8f3PDRitEbWmCvkUOYwceL2OCoeEG66lUKT6ppW4aKeLbMgLQgkKwWQxikgxSbuG1ILcc8gfIuJJDc0I+ze9TYjRcjhWm0eeEVA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199015)(5660300002)(44832011)(7416002)(2906002)(316002)(6916009)(54906003)(66556008)(4326008)(8676002)(66946007)(66476007)(41300700001)(8936002)(478600001)(36756003)(6506007)(6666004)(83380400001)(186003)(26005)(33656002)(6512007)(6486002)(2616005)(86362001)(82960400001)(38100700002)(35806009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?va7mAdOwHVBqEVh5xo5R4FsFahFVjeKwoC1TQvWiZzznSCXNYusu66TUNyBM?=
 =?us-ascii?Q?c9ydljFtf/H+wFVVJ63/bOAn5m+qa28yFGehwGaq8mL8547mI+aBkOeAGCIK?=
 =?us-ascii?Q?fFa99VllZixD6kziIDCbhDzKGs9j5IiiYw+byFLV32nOltIY/lMfxqe3IDaD?=
 =?us-ascii?Q?HwmghNLJC2VPxDeJ4yG1uY+pm8HhQZWwpGnPMAmUlupLLL1/xCoXHCNaVfk+?=
 =?us-ascii?Q?mEStvOQ43p6R6jemGIFROENr+SyJUD+j915WjrHjtv8ghp7vunOQsFdC4fBC?=
 =?us-ascii?Q?FMwTGbDmvK2RJgeCwthmyQv2YzAZHdn/pw5ZgzXHQKlkl3cWgG4DNEEqEVue?=
 =?us-ascii?Q?QdXvlpdiptUFxA6HofhbENupXq2tcw5efGdskgR918bnRs93yxcXtlzSuU22?=
 =?us-ascii?Q?ZrSdtKcP3R6D8WFmTPgBmV3/QxS9LeFFYihHfsS07nZGC2YubUZhid7eIiI5?=
 =?us-ascii?Q?kYH7YWpGZI68T1QIWobQpMr64+LxOLXVaIKlF5B2/GELzFG0s2PIrXnRTQHu?=
 =?us-ascii?Q?gLgOaRpzeRmeyOdIPtVpVhtsYDffztEcXfX36LVjSmx0tyuzJ0bqmJh6ANsc?=
 =?us-ascii?Q?eJwIVnTrNZd5PkO4HT2us0gVuHodwsxEllnaWY8J03KjWIgl6s1qt0sRhQ6O?=
 =?us-ascii?Q?55SgaMhA03sP97UXBnPl2DHkq4Bus4Qy1R9WoqXf0Y59tydvVDcZAkSkPsRu?=
 =?us-ascii?Q?vtCTlSHROd57qKjaKsAAFpdDxDNaiMhxBJl1rFaamc9+s+cgT6xtF5vDu/3T?=
 =?us-ascii?Q?EItTRzFjesz8XdhqL+Sfhr/SWseXrdO3mtWF6Fd+bxCdPcr21VBDEOTF2tRj?=
 =?us-ascii?Q?dHOsYrkGRTkiEiuFd+t8ZmIXlRBCTzMsOOT4Vb8vhxAL7qukwMrF+HhwmNT4?=
 =?us-ascii?Q?K7E+I/jULal85Tn2MsZWKdbsxIvCl9FNNDRxP4LmDjc2o7MAarxHCoyfdKB8?=
 =?us-ascii?Q?VmZ9NV2ifoybtn2wH4wOFVO6zqNSC/BT5TFzUvr2/Pk5O0mEVltu6UBsnqW2?=
 =?us-ascii?Q?MxNpNu6NrAtxqk85B6OjjAGt9sTAODMRrDT01HZVaqsf9T/XKRIGnhGNRDww?=
 =?us-ascii?Q?TAMZfRWAMK7Zhs1utBYevsSpZCG3NebE7BcBOZY8ed7ZCrNkVO6Q1qYWZMz3?=
 =?us-ascii?Q?wue+E4jljABh/pd2XQ9cQmwyXf1SeVnAEwNE/8ktgac/V8o26BYnPC3wZC6Z?=
 =?us-ascii?Q?fxiet4deBc4LzLao33pTsIyhn15PD1YP4hJnCwjrPlfgbC57nbKIF3w8jYKl?=
 =?us-ascii?Q?fUGKNWJWBXiIOKukwId9GteWExujv1VV7HZUNDfJ9P4gchLcu7uyHZDFxMxR?=
 =?us-ascii?Q?6pbErV7QZlMw1WvFf05QErvd7DxCofxKvUH2ROWZaNPEAFKwzm9KVIunCB2q?=
 =?us-ascii?Q?Yjrsotc5XyQtu2h0IWUQH7Tnd8O1esXDzTlW5M2P2WhUSljXQt6qL5/tR3gg?=
 =?us-ascii?Q?YweBA6lqV9YU8z+gzudhMYJ4JNPVReRGKRIPEAgiFscKnv+vPkPT+wBeGCTa?=
 =?us-ascii?Q?4KjjzT7q8J/vOCF3YduD4Ubj6iiqzeERNFkitgZbYHXefK3AnYStMSkg+a8w?=
 =?us-ascii?Q?cNwVi9BA9WDEN5xAb1cE0nIs6z1mOh5Jvhp9wJyKGGpku4UnL2ArVA98E8RE?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4365b236-f377-4028-5c2a-08daee7e5706
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 18:06:02.2014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d218OiHKgFhtAiVgWjP79lvSa2bSiY/e7SoSS5Rq0Rxdh2ur/wf2dy+pAVGmvsTfq+DAmC2zl2ur7UYlpMCVHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7184
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Saurabh
 Singh Sengar <ssengar@microsoft.com>, Deepak R Varma <drv@mailo.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Julia Lawall <Julia.Lawall@lip6.fr>, Nicolai Stange <nicstange@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 04, 2023 at 06:51:37PM +0100, Julia Lawall wrote:
> 
> 
> On Tue, 3 Jan 2023, Deepak R Varma wrote:
> 
> > On Wed, Dec 28, 2022 at 06:18:12AM -0500, Rodrigo Vivi wrote:
> > > On Tue, Dec 27, 2022 at 11:36:13PM +0530, Deepak R Varma wrote:
> > > > On Tue, Dec 27, 2022 at 12:13:56PM -0500, Rodrigo Vivi wrote:
> > > > > On Tue, Dec 27, 2022 at 01:30:53PM +0530, Deepak R Varma wrote:
> > > > > > Using DEFINE_SIMPLE_ATTRIBUTE macro with the debugfs_create_file()
> > > > > > function adds the overhead of introducing a proxy file operation
> > > > > > functions to wrap the original read/write inside file removal protection
> > > > > > functions. This adds significant overhead in terms of introducing and
> > > > > > managing the proxy factory file operations structure and function
> > > > > > wrapping at runtime.
> > > > > > As a replacement, a combination of DEFINE_DEBUGFS_ATTRIBUTE macro paired
> > > > > > with debugfs_create_file_unsafe() is suggested to be used instead.  The
> > > > > > DEFINE_DEBUGFS_ATTRIBUTE utilises debugfs_file_get() and
> > > > > > debugfs_file_put() wrappers to protect the original read and write
> > > > > > function calls for the debug attributes. There is no need for any
> > > > > > runtime proxy file operations to be managed by the debugfs core.
> > > > > >
> > > > > > This Change is reported by the debugfs_simple_attr.cocci Coccinelle
> > > > > > semantic patch.
> > > > >
> > > > > I just checked here with
> > > > > $ make coccicheck M=drivers/gpu/drm/i915/ MODE=context COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> > > >
> > > > Hello Rodrigo,
> > > > Thank you so much for your review and feedback on the patch proposal.
> > > >
> > > > >
> > > > > The part reported by the this script is the s/SIMPLE/DEBUGFS
> > > > > but the change to the unsafe option is not.
> > > >
> > > > If you look at the original commit of this coccinelle file, it calls out the
> > > > need for pairing debugfs_create_file_unsafe() as well. Please review this
> > > >
> > > > commitID: 5103068eaca2: ("debugfs, coccinelle: check for obsolete DEFINE_SIMPLE_ATTRIBUTE() usage")
> > >
> > > +Nicolai and Julia.
> > >
> > > It looks like coccinelle got right the
> > > - DEFINE_SIMPLE_ATTRIBUTE(dsa_fops, dsa_get, dsa_set, dsa_fmt);
> > > + DEFINE_DEBUGFS_ATTRIBUTE(dsa_fops, dsa_get, dsa_set, dsa_fmt);
> > >
> > > but it failed badly on
> > > - debugfs_create_file(name, mode, parent, data, &dsa_fops)
> > > + debugfs_create_file_unsafe(name, mode, parent, data, &dsa_fops)
> > >
> > > >
> > > > Based on my review of the code, the functions debugfs_create_file() and
> > > > debugfs_create_file_unsafe(), both internally call __debugfs_create_file().
> > > > However, they pass debugfs_full_proxy_file_operations and
> > > > debugfs_open_proxy_file_operations respectively to it. The former represents the
> > > > full proxy factory, where as the later one is lightweight open proxy
> > > > implementation of the file operations structure.
> > > >
> > > > >
> > > > > This commit message is not explaining why the unsafe is the suggested
> > > > > or who suggested it.
> > > >
> > > > If you find the response above accurate, I will include these details about
> > > > the _unsafe() function in my commit message in v2.
> > > >
> > > > >
> > > > > If you remove the unsafe part feel free to resend adding:
> > > >
> > > > Please confirm you still believe switching to _unsafe() is not necessary.
> > >
> > > Based on the coccinelle commit it looks like you are right, but cocinelle
> > > just failed to detect the case. Let's see what Nicolai and Julia respond
> > > before we move with any patch here.
> >
> > Hello Nicolai and Julia,
> > Can you please review this proposed patch and the feedback comments from Rodrigo
> > please?
> 
> I'm not an expert on this issue.  If the semantic patch needs to change in
> some way, I would be happy to take any improvements.

Hi Julia, thanks for helping here.

So, my question is why this 

make coccicheck M=drivers/gpu/drm/i915/ MODE=context COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci 

didn't catch this chunck:

-		debugfs_create_file("i915_fbc_false_color", 0644, parent,
-				    fbc, &intel_fbc_debugfs_false_color_fops);
+		debugfs_create_file_unsafe("i915_fbc_false_color", 0644, parent,
+					   fbc, &intel_fbc_debugfs_false_color_fops);

When I run it it only catches and replaces this:

- DEFINE_SIMPLE_ATTRIBUTE(dsa_fops, dsa_get, dsa_set, dsa_fmt);
+ DEFINE_DEBUGFS_ATTRIBUTE(dsa_fops, dsa_get, dsa_set, dsa_fmt);

But looking to the .cocci script or at least to its description,
I believe it should catch both cases.

But if it is not a bug in the cocci script, then I'd like to hear
from Nicolai why. And have this documented in the script.

Thanks,
Rodrigo.

> 
> julia
> 
> 
> >
> > Thank you,
> > ./drv
> >
> > >
> > > >
> > > > >
> > > > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > (to both patches, this and the drrs one.
> > > > >
> > > > > Also, it looks like you could contribute with other 2 patches:
> > > > > drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c:64:0-23: WARNING: pxp_terminate_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE
> > > > > drivers/gpu/drm/i915/gvt/debugfs.c:150:0-23: WARNING: vgpu_scan_nonprivbb_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE
> > > >
> > > > Yes, these are on my list. Was waiting for a feedback on the first submission
> > > > before I send more similar patches.
> > > >
> > > > Appreciate your time and the feedback.
> > > >
> > > >
> > > > Regards,
> > > > ./drv
> > > >
> > > > >
> > > > > >
> > > > > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/i915/display/intel_fbc.c | 12 ++++++------
> > > > > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
> > > > > > index b5ee5ea0d010..4b481e2f908b 100644
> > > > > > --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> > > > > > +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> > > > > > @@ -1809,10 +1809,10 @@ static int intel_fbc_debugfs_false_color_set(void *data, u64 val)
> > > > > >  	return 0;
> > > > > >  }
> > > > > >
> > > > > > -DEFINE_SIMPLE_ATTRIBUTE(intel_fbc_debugfs_false_color_fops,
> > > > > > -			intel_fbc_debugfs_false_color_get,
> > > > > > -			intel_fbc_debugfs_false_color_set,
> > > > > > -			"%llu\n");
> > > > > > +DEFINE_DEBUGFS_ATTRIBUTE(intel_fbc_debugfs_false_color_fops,
> > > > > > +			 intel_fbc_debugfs_false_color_get,
> > > > > > +			 intel_fbc_debugfs_false_color_set,
> > > > > > +			 "%llu\n");
> > > > > >
> > > > > >  static void intel_fbc_debugfs_add(struct intel_fbc *fbc,
> > > > > >  				  struct dentry *parent)
> > > > > > @@ -1821,8 +1821,8 @@ static void intel_fbc_debugfs_add(struct intel_fbc *fbc,
> > > > > >  			    fbc, &intel_fbc_debugfs_status_fops);
> > > > > >
> > > > > >  	if (fbc->funcs->set_false_color)
> > > > > > -		debugfs_create_file("i915_fbc_false_color", 0644, parent,
> > > > > > -				    fbc, &intel_fbc_debugfs_false_color_fops);
> > > > > > +		debugfs_create_file_unsafe("i915_fbc_false_color", 0644, parent,
> > > > > > +					   fbc, &intel_fbc_debugfs_false_color_fops);
> > > > > >  }
> > > > > >
> > > > > >  void intel_fbc_crtc_debugfs_add(struct intel_crtc *crtc)
> > > > > > --
> > > > > > 2.34.1
> > > > > >
> > > > > >
> > > > > >
> > > >
> > > >
> > >
> >
> >
> >
