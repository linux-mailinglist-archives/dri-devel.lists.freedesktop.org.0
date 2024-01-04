Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2154823BFC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 06:59:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A769710E396;
	Thu,  4 Jan 2024 05:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557FD10E395;
 Thu,  4 Jan 2024 05:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704347963; x=1735883963;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=M49gRZic3Y5xk88VnxT4YqoU7YI8sxxP6v676Kc737k=;
 b=EgefAdMpvHCE0Wc0G4ja+P/eG9TCuADCSM4bz4nwV9ZaqsZCpM68DcoX
 MHr4Wh4HfP42JBbiq+FntEYkwkbqSxPqLKahdoPBQY6PeIuve7PdgnXAR
 VKZpl9KW6s4plyoHPlk0NRsKbEhctD9O8QBruFa8qTTijCt6LPlfK8FME
 El8CJLzPHyv6El/VMv6fweeywNV7CFnHS7Oj00KoqTHftredv1zwOABe2
 qMySQRBUnDKrhMx7XnK5/5dr5AuwFK8kHqKRZv6l+B7PX8FRRhdRc/eea
 RBqWy1nUpq8BAH+9L5emVGftunxGWLq54L3tN+BNt4ZO+dzHRXU1vpJU0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="3933540"
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; 
   d="scan'208";a="3933540"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 21:59:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="953481664"
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; d="scan'208";a="953481664"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jan 2024 21:59:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 21:59:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Jan 2024 21:59:20 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Jan 2024 21:59:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSHbK6aMbxEF6bjeEywx6z+HjQrZHg9e8S9NVFVbWPqL0Giltwe0cnw3SJ6mVMBohBBDaXiBa5uN5Oe9em72bseZ9tPyiottnBOEKwokvjo4QVuPxV0cNIOPaCI7kkkXCcYbhbjuzSAv+pRlVSZOe5xWMNrFXFBfcjMNt2W8n2TPlP+a0CRLjhQ9hyZlZRLtXDJ6MiOH2Q+XBM/ZJtH4QNh3q9G3Pls/h4aowt1cWg2YEmKOPSAsICgLjQ4bLQGlSaUqyeVWiuTZSqJDR+N5Eyoo1c3A0bfza1nNFPJWn3Ar4a+f0lOuPjNL8x18BkIC3quXUq3CAasMLc8NwUoRbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZrePR4sIyQusCHANBnAy1+JRJh4Mbm8mIp9hxAU094=;
 b=JnupZ8oxs9j5ne56ivfnDNK6cEnwEmel3Pxv5Tfu0aVR1TTwmGD2CH3dy8cQP2iDZH8WMOojiBLoNtF+PEncKU+7wGq0ViaMiglBFAJA7HfL5F4qbsbKJpUBlpmkQ3d4h776vK6R2CjPkcIZuZwICnGWXA7GHTAgWrqZE+G6f/yzurmnTFsyjcG2jkqg0rIKnHAqxLabjB0Y3otTDtix0c5JEU7AWr8TsZBuM6+UvDpc93FFplMxq86WEz2R0yRlzmS360qVhoRwGQkI5XDRI29dmIGt48yC9h0RvqXFXSS0GgO5v4n4Qzgfo92JO+oFKIoSHsCt7A62AKwzGMoBwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Thu, 4 Jan
 2024 05:59:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7135.023; Thu, 4 Jan 2024
 05:59:18 +0000
Date: Wed, 3 Jan 2024 23:59:16 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] nightly.conf: Add the xe repo to drm-tip
Message-ID: <ktdr7l23leikip3hsmbxr2iirmz5zat7wck2ib6lbijl3uybtu@4iqn3adhfzyv>
References: <20231222113640.14038-1-thomas.hellstrom@linux.intel.com>
 <ZYsb09nsERQFDCQl@intel.com>
 <9541c844440e8b0fc5686e19850a04c7a55745ba.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9541c844440e8b0fc5686e19850a04c7a55745ba.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0073.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: 87623b3a-fd08-4c1f-a874-08dc0cea49d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gICulDm9RXYU+X29nnE3kcH+r1w7ig+L4vhWTumLdGUvRY+RfZZdvJHu3m1bhxYjjI1xbnzaQErdoAjZD021B5f9N7we7+Iyxdq+TgnvJ3HP5cZYFy0QsKyQT19823MUCN8DK6MBylQhRqlg2CnIZadqzMUkzkFIN02JnSb+fBE3ff64Irrw0KSpcsVtHxbdJgf+11gbIgH6m1/N+F3lwMpK89zrm9RIWvHyCNAjuslsGjFL85q5hK4txK2tkU0zv7+67Pok0ttGmiuqt8xOPC39xslaiu2hcGYNZHPD/8IpNVZQQBQSWGcowGCS8C+EMLGIgkbt/HDrZSyq0umu2oWyrvP3fSPsw0g5SOWSTtJXoZPd5K5Kp6Rb/d+5KySuVed42jko+t6JO8h6r2LURPsDUze62AoP3XOMI5urMJWM0IgLyF1OtDMF80pS2ppM3HfWgIdWd6r8WQGRKrRd+5iWkvv42SXu9M9L8f9cNhtF/HaYapJuZWFFPaK0lpLbDPgfKxdqOZIw0xwDJ8q/x6Dwe3aazD2Mkb92FXVArY4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(136003)(396003)(366004)(39860400002)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(6916009)(66556008)(66946007)(66476007)(38100700002)(82960400001)(83380400001)(41300700001)(86362001)(66574015)(2906002)(26005)(4001150100001)(33716001)(6512007)(6506007)(9686003)(5660300002)(966005)(478600001)(8936002)(8676002)(6486002)(4326008)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kbCBoMepdt4EQ7f2DLjcEt4PdpVl1uLNt9eJm4QGde7hRUK2Co3x677hFB?=
 =?iso-8859-1?Q?g0bM4eZylNJ6yWViBAkHBkv4oWGGF5eV/vPoq36mr5F1czvHYeYLQtB2+/?=
 =?iso-8859-1?Q?YJoPADfONW7WggQdRt8u7pm5zGzGHvIWdOR11OCjLpjHfqwJMX2Zq3eI+l?=
 =?iso-8859-1?Q?XMqgKSFA4lJ4KrjcJCELJ/h0LcnH6nfUNI8+5opXHOHasebzkrD79ZW4q0?=
 =?iso-8859-1?Q?18Wmf1m8IKmzT8C3W3ebSsBjprmP8nniFGIO2NsUQG6jzW6H0MXWUCTOKu?=
 =?iso-8859-1?Q?o/hRAfH82SIdn/NLZ80QMVHHTlQEQtzj4deQrSxoIUqwJ9fZK584+sMWoo?=
 =?iso-8859-1?Q?NsnzDR1gqge9YKMFX32HAE/p+10iO8meXfoT1wBoe8/15gjbt46TDc29LY?=
 =?iso-8859-1?Q?9EeOwpDIvug3xUITIaPC4RCMM6IcoINFyfohnJV6Pzob8oJifD6MbsSPfs?=
 =?iso-8859-1?Q?Bdqb7aHMisYUOzBgDelGYTN1AfGn7GKUOLCPJH8FG92k1bQf9OI+bhkPzf?=
 =?iso-8859-1?Q?t4BR7KxjvG23ROHruc7y6GvN3feInNQmX5D3uemeeapIWhvisC4HyFcUAA?=
 =?iso-8859-1?Q?iJ9bQabeBcUEgUEZvkt6J3F1RCthIc/sTaZI/0Znt1u9/oPmP6EJXC+fqT?=
 =?iso-8859-1?Q?Rj7QeC0ycmEOGvLx3OEMPnsilhAoExeRl5fM8o71KeykqTs7KvTPLb6AZ7?=
 =?iso-8859-1?Q?PvdSErvMYxrouyZ3EvMcuCQb2wWHn97tLAc5yStDqBDRc6wVFH/xfDbnfs?=
 =?iso-8859-1?Q?GhT8XlF919trr9rlZded7c8kCu/ihyF7RgTfiXmd7d324USVgKbcAs8oCm?=
 =?iso-8859-1?Q?wlsEkJ+M7h5EGb52hQkVB6dprCcpyzXOU/M9PnEBp+kmCOevmI4l7cf+76?=
 =?iso-8859-1?Q?0Rgs9CF/8B9prrphSB5z5Hp9/dU2viXpMhfHONpanCfEJame8EDCc89yMS?=
 =?iso-8859-1?Q?3ku0TBEdv2plxCXTRqgWSBb3cuZ6O/sMuKF7IAUph4ziI4hoM0Nb8H5NhP?=
 =?iso-8859-1?Q?AFUvE/sLK1W9qvGfm76NNdZJSGTRwTfuqWMoo/iEp3xftpW9pirFoBJmf8?=
 =?iso-8859-1?Q?OqF+dufySqcgpP96w7VKt1nNLL8NhwvsKzpb02LwSCUAx6adjq7yvN0WOH?=
 =?iso-8859-1?Q?VGM4uekI9BRlFzEQHtzpDfE/wt+2gip8re6vaJNhH4sgzotTjUOVuYRWqr?=
 =?iso-8859-1?Q?rZX9ktVYfFslXBT7Z4/S2CJiWAvt7r0+r0vTXlKsS7h6C1sz1Y1wjlSLjF?=
 =?iso-8859-1?Q?14qQ4z+ilNKCIXJU9xOLLkRcNbYXf8e2DceVSYmyzSHS067HfZaogIRHC1?=
 =?iso-8859-1?Q?n5bCFcl3zNxOABzg2LfCrngEulwS9/IF4sgLVe5lC1TrJuaRBOrANBXqJe?=
 =?iso-8859-1?Q?yIZsiF8Sjq7VSkbdv8C6hh4TbQ9Ofb9bzeGYVH+mmLxol4+MtnyvnKE+2T?=
 =?iso-8859-1?Q?mYL/GvSVEhSzzQbRNGiRcKmLaSxntXS9UkOKGK0sKmFXK9zT3A3rnfQf5a?=
 =?iso-8859-1?Q?3T+wy9lR6T7cM+ZwV95Hr7v8zspuGXIfcj7UP+6dmumS27ndfM3FQrS3vT?=
 =?iso-8859-1?Q?ptT9Tsc4jPWv81YI5wC/TME6XnmOpDYLy9suyenI7mXji3Ta0kNxvBB8nW?=
 =?iso-8859-1?Q?7SDOMftMdWd595i7KaydCjWodmV+JqRg6nRrGQEAyTI4bHr0g0eFNhEA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87623b3a-fd08-4c1f-a874-08dc0cea49d0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 05:59:18.1717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8QSHXQJQrwG2HpXL0It5b7zjCugGYwsIWKLf6X6PNrCY9nKDB4tVKfxE9MS44bR+C7NR6qbiQKUnaQIrrsducfP5bnIedk+K9+CxiW1Y8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6366
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
Cc: dim-tools@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 03, 2024 at 02:50:57PM +0100, Thomas Hellström wrote:
>On Tue, 2023-12-26 at 13:30 -0500, Rodrigo Vivi wrote:
>> On Fri, Dec 22, 2023 at 12:36:39PM +0100, Thomas Hellström wrote:
>> > Add the xe repo to drm-tip and the dim tools.
>> > For now use the sha1 of the first drm-xe-next pull request for drm-
>> > tip,
>> > since that branch tip is currently adapted for our CI testing.
>> >
>> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Cc: Oded Gabbay <ogabbay@kernel.org>
>> > Cc: daniel.vetter@ffwll.ch
>> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> > Cc: dim-tools@lists.freedesktop.org
>> > Cc: dri-devel@lists.freedesktop.org
>> > Cc: intel-gfx@lists.freedesktop.org
>> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> > ---
>> >  nightly.conf | 7 +++++++
>> >  1 file changed, 7 insertions(+)
>> >
>> > diff --git a/nightly.conf b/nightly.conf
>> > index 24126b61b797..accd3ff2cc39 100644
>> > --- a/nightly.conf
>> > +++ b/nightly.conf
>> > @@ -24,6 +24,10 @@ git://anongit.freedesktop.org/drm-tip
>> >  https://anongit.freedesktop.org/git/drm/drm-tip
>> >  https://anongit.freedesktop.org/git/drm/drm-tip.git
>> >  "
>> > +drm_tip_repos[drm-xe]="
>> > +ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git
>> > +https://gitlab.freedesktop.org/drm/xe/kernel.git
>> > +"
>> >  drm_tip_repos[drm-intel]="
>> >  ssh://git.freedesktop.org/git/drm/drm-intel
>> >  ssh://git.freedesktop.org/git/drm-intel
>> > @@ -65,14 +69,17 @@ drm_tip_config=(
>> >  	"drm			drm-fixes"
>> >  	"drm-misc		drm-misc-fixes"
>> >  	"drm-intel		drm-intel-fixes"
>> > +	"drm-xe			drm-xe-fixes"
>> >  
>> >  	"drm			drm-next"
>> >  	"drm-misc		drm-misc-next-fixes"
>> >  	"drm-intel		drm-intel-next-fixes"
>> > +	"drm-xe			drm-xe-next-fixes"
>> >  
>> >  	"drm-misc		drm-misc-next"
>> >  	"drm-intel		drm-intel-next"
>> >  	"drm-intel		drm-intel-gt-next"
>> > +	"drm-xe			drm-xe-next b6e1b7081768"
>>
>> yeap, up to this commit nothing else should change, but
>> then we will need an extra rebase of the rest on top of drm/drm-next.
>>
>> But then we need to decide where these following patches will live:
>> 880277f31cc69 drm/xe/guc: define LNL FW
>> 2cfc5ae1b8267 drm/xe/guc: define PVC FW
>> 52383b58eb8cf mei/hdcp: Also enable for XE
>> bea27d7369855 mei: gsc: add support for auxiliary device created by
>> Xe driver
>> fcb3410197f05 fault-inject: Include linux/types.h by default.
>> 8ebd9cd71f8ac drm/xe: Add PVC's PCI device IDs
>>
>>
>> Will it be the topic/core-for-CI?
>> or topic/xe-extras?
>> or what?
>
>This sounds to me like topic/core-for-CI? Or is there any drawback with
>that?

I think some of them are not really a "for CI". It's more like the
workflow we are adopting e.g. with guc/huc, not sending it to linux-firmware
until we are confident on what version we will start officially
supporting.

This one can't go to topic/core-for-CI neither:
	fcb3410197f05 fault-inject: Include linux/types.h by default.

what it would do would be that we would not see the build error anymore,
but everyone else would (and it's not a CI-only configuration).
Unless it's merged to another branch, we shouldn't merge it.

"52383b58eb8cf mei/hdcp: Also enable for XE" could be material for
topic/core-for-CI and  "8ebd9cd71f8ac drm/xe: Add PVC's PCI device IDs"
could either be on that branch or another xe-specific one.

>
>>
>> Anyway, for the inclusion like this, after our CI is ready:
>
>Could we merge this patch already at this point, considering it will,
>at least for now, only update drm-tip with our fixes?

ack

Lucas De Marchi

>
>Thanks,
>
>/Thomas
>
>
>>
>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>> >  
>> >  	"drm-intel		topic/core-for-CI"
>> >  	"drm-misc		topic/i915-ttm"
>> > --
>> > 2.42.0
>> >
>
