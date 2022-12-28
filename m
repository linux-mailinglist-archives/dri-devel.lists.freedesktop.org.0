Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCE16575D2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 12:19:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6938210E39E;
	Wed, 28 Dec 2022 11:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5813D10E39F;
 Wed, 28 Dec 2022 11:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672226317; x=1703762317;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h/sgP0bAJakohctD4J6TVdmm206c2R2kUzIvtPDoD6Y=;
 b=Co1hemMDXfw9qlAvTu3dM9tvv8yTk8dqOpPbBKAgHsxV8lF5JogcUI5D
 4UUtZa2NmrHE4BZ3ebaVgI2/GvdV7yNY7/Ra1dkuu4s8RKJ8N1yoLSs4c
 dDE8gOCbAjKXmbAlrTKJv5DAQSEdQ0T39eTBthI+7qflMyZDeVsiaZ70w
 +vgRSjjqC28rwI/Lt3IP/2pyLQcFQO67LlGYm4ys5zTc8REvKB3vBG2u+
 BRqOuBz46mnbtViSSeDcqKIVlT6hhHaUDWdfJLVIfpFLESGDpFftMJHa9
 xY0yhMrqI/RXdnJ6TB7b1SOP5fCh8XogAJJMOCDuQDijOOFCWJn31HZeS w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="385276310"
X-IronPort-AV: E=Sophos;i="5.96,280,1665471600"; d="scan'208";a="385276310"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2022 03:18:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="795631941"
X-IronPort-AV: E=Sophos;i="5.96,280,1665471600"; d="scan'208";a="795631941"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 28 Dec 2022 03:18:29 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 28 Dec 2022 03:18:28 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 28 Dec 2022 03:18:28 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 28 Dec 2022 03:18:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRZDivGyY03a3MLXO93wdxq5p+y/6ICpGgNbhLbE/UpMheupDeXLCxz6rU/pGcezHTarkJblu9TMuwTSZt+V2naAHng/pNjY3KmnI/MWLKzDxzoigwnR+kEk704+bf8d/kFDNvp9ipri4atPDIcsqQu/ipnngVRBEhqRnn0gfrXZG+2i6H9dj+IgLtXbig/k2AX/Rfw2aHcoeoLsJotmD+WgwqW7edtESVJ35TexJOK+xpU68aklZOFpjZjb3dJZDPVVnqMz/QDIkOhsKOr0KkUCvZ2ZgANPIcdY/NUWouJ3jOKQJX2r9C6J2Vvt+6LfK1lRjWqimrPgHf3VejomPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zAsQ3oIH/ezxwZTbcns5kWdAPjULCH5Xv1FVriFLZY=;
 b=PU+LniaqeL2FJZj2Ba1x7k245/zaPjvdyKMk6VkGAjaPiz6FNgAI7zcjqnssfTymlv4E0LFy+9tvwMFfa/Jf3ceo8jn1YKM2lVKYb1YYZoVmY4Mnawu4k7SGe0hPgAdEiulftOC06AtVfQTdmRjpWwJvy+W2CMDYs0/4ZGKBmPdVGAdtnFDBGAzKRLo3g3v6TfsbimcZogJaGJ8Lyg2yajnEq4g8q0iJb7MxlVr11ir89aibh57BUAtgC9Y8ACwtwexN2GX72ZSj33DL8OtNq33p3thSQSWMjjS1eU+mD3OzzSSTBEKzIZIAfCev/4lZXvnXwT4Uzs1Ok/WNt1uGAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4717.namprd11.prod.outlook.com (2603:10b6:806:9f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Wed, 28 Dec
 2022 11:18:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808%9]) with mapi id 15.20.5944.013; Wed, 28 Dec 2022
 11:18:20 +0000
Date: Wed, 28 Dec 2022 06:18:12 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Deepak R Varma <drv@mailo.com>, Nicolai Stange <nicstange@gmail.com>,
 Julia Lawall <Julia.Lawall@lip6.fr>
Subject: Re: [PATCH] drm/i915/fbc: Avoid full proxy f_ops for FBC debug
 attributes
Message-ID: <Y6wl9NhYZG5RjJL7@intel.com>
References: <Y6qmNW6cOHjGwn03@qemulion> <Y6sn1BmhFJFssW0h@intel.com>
 <Y6s0FSK9+F+/oKSf@qemulion>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y6s0FSK9+F+/oKSf@qemulion>
X-ClientProxiedBy: SJ0PR13CA0070.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4717:EE_
X-MS-Office365-Filtering-Correlation-Id: e07c9653-866c-4a62-b1b7-08dae8c539a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aPxgegsY7bnTh7/sAefOLFogFzL4kknH+5kOkL2ANylQjZbPSDeMSEiMkSObwO0jAYDbEq7HjqR9E7DVtOFsiTh5lrYvlRL2ASizsInVeFqRROZ0dnW7iqa7IF32mUkBClSe/qXrmwy1gWpNGgZ615BCSBQliYtoUhxDFk9NbtFSh6/d7kgSoSKzP6qoPnA6ue/1u1s3Q6hLVXlgmW7KDjCiMo2buXbs4HrT4qJ1UfsHY2sF8ZaGCk/GZlS5kH7DuTIBYb5CapPpTUXAaVIlXy5a5nbeSZ0JeM1vGgJVcXfk+AxdNdupAlHZ/tL5QbRejYfVMHOfGXIU4akTCb72/Dtiqsq6XOf36HbZZ/F3YbuxWRoRGAXGl4vhTC9xh61ZEWu+ip4TOczb+EjGSQRfHXbJF2gAE5lokxT8TMrDc+beNqGGs365CN74DYRnwwZgoSQPUhrjbJgXog4IvsDmYQnYtGP8hfp3+R0OzG36UjHcZXEov8eMNC1AKAgEVdjzC1yS/Fq42o01O5HgurTwjNo/uwozhnlVOPcopJgScg5dGw819wOafJZepHfvwK7qGQUjhr+Aa/ZZ5JTZnRqj8zqfkCZRRoDu8VGVi16t8XIhb149XmTfUlleLQltnKByqF9MYdHLPzfNTneNTla8YA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199015)(6486002)(478600001)(316002)(186003)(110136005)(54906003)(2906002)(36756003)(6506007)(83380400001)(82960400001)(38100700002)(6666004)(86362001)(2616005)(26005)(6512007)(5660300002)(7416002)(8676002)(66946007)(8936002)(4326008)(66556008)(66476007)(44832011)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dRZ3VWNjCV1oP7EvYzExZGyii3DEihlKrtyry1j7jsabK0JV+oD8xdhk0D61?=
 =?us-ascii?Q?BP4AyHzP9WJFA11mhXwBZXPTRy73D2XHUdrXjUyMqGMBrcHPnWfliQL+GeCB?=
 =?us-ascii?Q?2hKEt/rzWhAjJ2G6cfUXYzcazPVj3xFyHjMn5MORtqN360U149Sot2ERyns0?=
 =?us-ascii?Q?wo4+kWPwWNZ2mTRwAl3OLKz8CuK+YSgodG4TSYFgS+dA1sSXjIWu0TVpCAQz?=
 =?us-ascii?Q?Fw6cHEtikVBMwHrQcJFK2uuU6G5x61uYgT4xVx/h9SANB17oba+CbUHLT+yJ?=
 =?us-ascii?Q?CBvDqolS2kkN9eY8C5o3cr9F9EMgEUWJFWoC4+Vc4bZ+EigGap0qJWYGwvZK?=
 =?us-ascii?Q?dsJA6pOlYwdRI0aKCpDKd+bbWoODlgz+MmPTvaFBXGqT0gQLqcmcXzFm6E0S?=
 =?us-ascii?Q?rVP+I9BGfjeUakwXTmjYgO9wAfJ43vPs5CdKHgSEAfAMlmVg/SqKm3i0/HoN?=
 =?us-ascii?Q?HadMJABoMxC/uMgY1whGq9uPf3cuRwHIGgKXKJLNsZwc54vS+tpGtee7e4Fo?=
 =?us-ascii?Q?cRU5v0TzMCV9xCnB5YcM179IJB3hWU3BC23SFVCmQx6y/7mswCCX5I9NbPO7?=
 =?us-ascii?Q?Zy2561owEicCe8Fxlsx+pGdwCKLfgrdAq/pKvJPDuBczfTwEkrfx2Ar6ltJp?=
 =?us-ascii?Q?a9uhtCI8SwdAeuoUCjutoT6PsRa/x5WZcuRFpsFzku7BHpPckkcWnZSASbac?=
 =?us-ascii?Q?ekyjynv1rnWe2SsiwB8UX/vPWj2Fie31kCJX4/uZqZoTEVAc1U3Aq/AR9XOA?=
 =?us-ascii?Q?2Z38XnWe5vVarOpzE7vEHUfUg9rr7ixMtpXT/+WwEjd4kyi2RrF06aUVJhvT?=
 =?us-ascii?Q?7HYSKG1LyZL/+ZSPeAsHNoeSp10KDe/7s688kvosTkH1zL7aivqq923bXCf7?=
 =?us-ascii?Q?HBOPWoFU7bnyxhpdDisuouIMQvNU9FbS3uUqBRVpQaVU9y02bcFW3vjXUpKv?=
 =?us-ascii?Q?tW/E8+4Kq2KW1AB2MMykMbT4CK0JLhBrxzMNChDEzvN0uVzcUJvmhkaTeHIl?=
 =?us-ascii?Q?TDsyGi0N0VZg7uJfjvkICIoC2oZqwYlk9FZvszjbwazLxR0TRH0vOQP7eQTZ?=
 =?us-ascii?Q?dyzMCIDB1Rj1cqqShzg9DWmOObgIz6gw2+xWrQdzeehYlzQRkYzK1vHNT6qz?=
 =?us-ascii?Q?LPK8EoS/92+7w7PbB3EOW2JZaEabV+wybVBePe0YZJFp6fUWSsFG6Au9nIZn?=
 =?us-ascii?Q?dLLUVb3l/aewSH98cL5DUqqGT39IjgWBS3wQcS01cK33MYw2flJafdEi9xfE?=
 =?us-ascii?Q?S62AiXWGWkx1LdbVJWuUR4Y79Cg72HW37HaWDIB0LxPrDmiMmYGCdSEk3QF0?=
 =?us-ascii?Q?gPNOYUY//KBqguRM6zfN9TsAKyVIt0fjKnOqiKMs8HitHRKEqaLAYJUZI7Aq?=
 =?us-ascii?Q?FAaUDW7+AwcT5gKsHYCE9lRqquf2kjgTYPoePg6wZnIcNIrqcbcSSh5NnRQO?=
 =?us-ascii?Q?F+YJnbwRofRHoab29R5YEJcGkMiyrdB/uBPjBLODM3rI01WMlVdRX05LEwZp?=
 =?us-ascii?Q?KVK6n0OQmwHAE4nMDSrLICgv6S3oyDr39mfyD/znwRJFbvJ3O65rv7lOidVY?=
 =?us-ascii?Q?F6UqyccQt/k426rp2VLcTs98Q/104FsFl2D7dvn6dB0H6sz0UtYkLr5JvkFT?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e07c9653-866c-4a62-b1b7-08dae8c539a2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2022 11:18:20.2635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gW/T7yiflcXkUi2RUviNf+Z2u2yL8o1BN0pSHqjHykIt02WCOAYcDK86MySIRPyFmUk86mS8Ac65mNxMB59O5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4717
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
 Singh Sengar <ssengar@microsoft.com>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 27, 2022 at 11:36:13PM +0530, Deepak R Varma wrote:
> On Tue, Dec 27, 2022 at 12:13:56PM -0500, Rodrigo Vivi wrote:
> > On Tue, Dec 27, 2022 at 01:30:53PM +0530, Deepak R Varma wrote:
> > > Using DEFINE_SIMPLE_ATTRIBUTE macro with the debugfs_create_file()
> > > function adds the overhead of introducing a proxy file operation
> > > functions to wrap the original read/write inside file removal protection
> > > functions. This adds significant overhead in terms of introducing and
> > > managing the proxy factory file operations structure and function
> > > wrapping at runtime.
> > > As a replacement, a combination of DEFINE_DEBUGFS_ATTRIBUTE macro paired
> > > with debugfs_create_file_unsafe() is suggested to be used instead.  The
> > > DEFINE_DEBUGFS_ATTRIBUTE utilises debugfs_file_get() and
> > > debugfs_file_put() wrappers to protect the original read and write
> > > function calls for the debug attributes. There is no need for any
> > > runtime proxy file operations to be managed by the debugfs core.
> > >
> > > This Change is reported by the debugfs_simple_attr.cocci Coccinelle
> > > semantic patch.
> >
> > I just checked here with
> > $ make coccicheck M=drivers/gpu/drm/i915/ MODE=context COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> 
> Hello Rodrigo,
> Thank you so much for your review and feedback on the patch proposal.
> 
> >
> > The part reported by the this script is the s/SIMPLE/DEBUGFS
> > but the change to the unsafe option is not.
> 
> If you look at the original commit of this coccinelle file, it calls out the
> need for pairing debugfs_create_file_unsafe() as well. Please review this
> 
> commitID: 5103068eaca2: ("debugfs, coccinelle: check for obsolete DEFINE_SIMPLE_ATTRIBUTE() usage")

+Nicolai and Julia.

It looks like coccinelle got right the
- DEFINE_SIMPLE_ATTRIBUTE(dsa_fops, dsa_get, dsa_set, dsa_fmt);
+ DEFINE_DEBUGFS_ATTRIBUTE(dsa_fops, dsa_get, dsa_set, dsa_fmt);

but it failed badly on
- debugfs_create_file(name, mode, parent, data, &dsa_fops)
+ debugfs_create_file_unsafe(name, mode, parent, data, &dsa_fops)

> 
> Based on my review of the code, the functions debugfs_create_file() and
> debugfs_create_file_unsafe(), both internally call __debugfs_create_file().
> However, they pass debugfs_full_proxy_file_operations and
> debugfs_open_proxy_file_operations respectively to it. The former represents the
> full proxy factory, where as the later one is lightweight open proxy
> implementation of the file operations structure.
> 
> >
> > This commit message is not explaining why the unsafe is the suggested
> > or who suggested it.
> 
> If you find the response above accurate, I will include these details about
> the _unsafe() function in my commit message in v2.
> 
> >
> > If you remove the unsafe part feel free to resend adding:
> 
> Please confirm you still believe switching to _unsafe() is not necessary.

Based on the coccinelle commit it looks like you are right, but cocinelle
just failed to detect the case. Let's see what Nicolai and Julia respond
before we move with any patch here.

> 
> >
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > (to both patches, this and the drrs one.
> >
> > Also, it looks like you could contribute with other 2 patches:
> > drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c:64:0-23: WARNING: pxp_terminate_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE
> > drivers/gpu/drm/i915/gvt/debugfs.c:150:0-23: WARNING: vgpu_scan_nonprivbb_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE
> 
> Yes, these are on my list. Was waiting for a feedback on the first submission
> before I send more similar patches.
> 
> Appreciate your time and the feedback.
> 
> 
> Regards,
> ./drv
> 
> >
> > >
> > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_fbc.c | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
> > > index b5ee5ea0d010..4b481e2f908b 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> > > @@ -1809,10 +1809,10 @@ static int intel_fbc_debugfs_false_color_set(void *data, u64 val)
> > >  	return 0;
> > >  }
> > >
> > > -DEFINE_SIMPLE_ATTRIBUTE(intel_fbc_debugfs_false_color_fops,
> > > -			intel_fbc_debugfs_false_color_get,
> > > -			intel_fbc_debugfs_false_color_set,
> > > -			"%llu\n");
> > > +DEFINE_DEBUGFS_ATTRIBUTE(intel_fbc_debugfs_false_color_fops,
> > > +			 intel_fbc_debugfs_false_color_get,
> > > +			 intel_fbc_debugfs_false_color_set,
> > > +			 "%llu\n");
> > >
> > >  static void intel_fbc_debugfs_add(struct intel_fbc *fbc,
> > >  				  struct dentry *parent)
> > > @@ -1821,8 +1821,8 @@ static void intel_fbc_debugfs_add(struct intel_fbc *fbc,
> > >  			    fbc, &intel_fbc_debugfs_status_fops);
> > >
> > >  	if (fbc->funcs->set_false_color)
> > > -		debugfs_create_file("i915_fbc_false_color", 0644, parent,
> > > -				    fbc, &intel_fbc_debugfs_false_color_fops);
> > > +		debugfs_create_file_unsafe("i915_fbc_false_color", 0644, parent,
> > > +					   fbc, &intel_fbc_debugfs_false_color_fops);
> > >  }
> > >
> > >  void intel_fbc_crtc_debugfs_add(struct intel_crtc *crtc)
> > > --
> > > 2.34.1
> > >
> > >
> > >
> 
> 

