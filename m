Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 319A080E588
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 09:09:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D97910E58F;
	Tue, 12 Dec 2023 08:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5952B10E586;
 Tue, 12 Dec 2023 08:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702368560; x=1733904560;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/k0SjtYjYCNtVovb4FEBZ0eTjUIHmjtL3TsbIXiLLmM=;
 b=He245tW+EWktulGJgl9KBq2QL+jl+QLpQ0gwPCY+VHqZz27WhFQHuVZB
 QAH+v/IESTD8V0KJn4Xn9kCquEqO3BvN17NrYi05vAU9TC6WpG2Zuaqa6
 Jv8u+CRi5OSlpemfVL6QQhKQ72p7VYJVcajddijEykKQSMVoJwMhTnpCz
 Wkbow+xV5GfTocLJQim27yihELmDhJnADA5s7VkL4Re8qXvOjpM0yqvjh
 mQbvpm9DiR1FyVLi8S7peH9whMIcGBbNIpKXZv14taaj3sIdb8MpVFl37
 9mzdT2SSGR8NTuP4AEjZ96qQQGaYtUTpfUn8FD45ZA5wQ6mrDQM78FyhN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="16321316"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="16321316"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 00:09:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="766712433"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="766712433"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 00:09:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 00:09:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 00:09:16 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 00:09:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DB3yy1fXKJY6apxURG1tQI5PQsMVnfi3WAAXPMidpLlxj9zwnylH6wv5kcgEH6D36SrcmTcjW8FlRagAWMFQD2p8lWAKfdHQMF8UZHztJyLmCNlkEdRW0yep8xgTSNPkH1hzSGkcfPRp2Za/hN19wVwHHixm6lXXEQVVlCuIFCFXLasKo+OUHwgoZepkrGEO7bBuq0Y0ob3PVSfjRhtlT7oIxgqGu+pnQSAZ4aD3uLFoZSx+Nf8vCm0IWFARywv+++HETgA9/YmZZt2g7XSwAePNnocMN5m0+qT3pFwpgqShldCM1mhvbceCr7KQcfRuBNbwyHOPiy1zDufcsTPOvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GiuwIL2GA3PaNa5scKKDCV0LYI+ZgSowAJkpeeEd8zA=;
 b=gwlKwcVul9bPGmqNly4KoIDo2cW1M3N0s2vzmuFjR28iuF85n5ZR0fbr7Pg7tH6Ie1w3bmRCtUtcwDoob4swFnz9bfEjKOqnzT5nUxc2vHS3HhjyjUCfruolw6TttRpKHt0Pgt4GSrXrVwRERmlQn3+RWDcqI+scPOWfasuZcBJ83AvtSnDCCxuNJ7fRvQF0Cm7aUV9H5d+JCdlKlN5OXSvlYUWmKEkQgUhOZGlxWSLvaRMme1Gu7+u2FYep54O6p56OvUmWPJCcQX7FG8eimdNUyzRbPVaupfrJ8YQe7jbS5YeR1J6c8rzxLK8djZgnx/Len36bUzFypqvCfW9pkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB6403.namprd11.prod.outlook.com (2603:10b6:510:1f9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 08:09:12 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 08:09:12 +0000
Date: Tue, 12 Dec 2023 16:09:02 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [drm-intel:drm-intel-gt-next] [drm/i915]
 [confidence: ] 9bb66c179f: assertion_failure
Message-ID: <ZXgVHko9Zwp9ZeA0@xsang-OptiPlex-9020>
References: <202312071643.321205c6-oliver.sang@intel.com>
 <87o7f1ypyo.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87o7f1ypyo.fsf@intel.com>
X-ClientProxiedBy: SG2PR01CA0120.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::24) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a79877a-5847-4633-672e-08dbfae99f88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YV7uzX2Hr5pbpqrWH8S8zNx7QKpxbsLdkRcuCylyO/gRpb03RZq5D6O5HhwvyXOvwZ9uo0MOoO3OtjistwhkAj5SD8I343guM24UMt3hiH1EDGfn2jlqCVP3wgQb93QEHQ5AvmJoRgHd2wrsziRiZrNDnkLTgRC9ZC/+DP5AluOdK/+WaKOdQYSIvU0jFVwJs8WmsC/MWrwFB0G4l0hFZYyVew2R3gs23YZRINdU/C2HKHA3evGBdmrK9DHeE8+fAPvAhsNM49vaVX/g1gu0QbJb89ulfwJH2g/ogBOk62f4A6ljEh7tAIXwZLu0cpVRVjGm8j03pHiYFf5PCJi0eAyqpngc8qsm3S8bDfQtkyAI8IH+6D0MuUbZEWtqN0omz+scgPzG4oSuIgGiTmzjsjJB/V7fBVAiGayvRQ9ZG4ieP1BbwC3/Wo8hPe9qZWD+XUEY4+DDh3nn74NIzE8fWqSqCoCf70KDOPmKULKs8unU/ouM4p8N/4ycKQangxpfVfSbeLrZgo29GX3fAdG8gsNWr2efHb3KYmYg3cdqk1z98M1eJRDdrAhWymdUCQbp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66899024)(33716001)(41300700001)(26005)(83380400001)(82960400001)(86362001)(38100700002)(44832011)(5660300002)(316002)(8676002)(8936002)(4326008)(2906002)(6666004)(6512007)(6506007)(6916009)(9686003)(66476007)(54906003)(66556008)(66946007)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4GJ5f3yt2pjlpzFvIHjAftoTMXxGjbVhHmTEprQr/Sfp2NSRgWWockSF8BiD?=
 =?us-ascii?Q?NI/+YYuPaui990V79AbqiuvSJLXgtS9Xu92O8rL1OB7v+ocD8bDqkYHF1Opl?=
 =?us-ascii?Q?l2PunhMYViVSvvQ+EqccSy9cmmM8UDfPhc0R9kpWlu+LpdgAdvrqQFv3UPlH?=
 =?us-ascii?Q?zxlm3jfrUgMJU0AUuhyrpiJCbOjKSl22AaCMGUHniZZJpPH/UY4NbvYLGh+a?=
 =?us-ascii?Q?vmnE5/+jrZuGMPeo8Bi6m7WE7pN80f4RogVfuEUcJE81SJbOAuw45bKCBRk8?=
 =?us-ascii?Q?HsebL08PRtK6qRyBfLsFuHjLnfy/TZTqbjJyDe9i4nWtUOYqGa2P1MQjRGNY?=
 =?us-ascii?Q?blrpRKjrfE2+2cjmM21jja1bCBtyMthzxkJ2YVaygz04xouvpNNRaXwqp06R?=
 =?us-ascii?Q?dNZU7oNRs8neZO30QX2/Ky+rHGEx9hQS7RGHJn4fUmqduuzLE79gzqjvDsCW?=
 =?us-ascii?Q?L1mQZALDwVVe1kut0j6J1HAOtxshlmbLnj3YmvIQei/Q2DYf4TP7TKVCmbvY?=
 =?us-ascii?Q?c+L1N7QvSeOeZk8dYmlWPdQiuum7uPp3M4QKgM/f3XhBuZj/8bGZK3XNp/iJ?=
 =?us-ascii?Q?Vxks7J+qvx7YKIqZRpFuNONGL3uMy2u/yAbNMk0DT5ruWpEUrrMztNrtNyYA?=
 =?us-ascii?Q?3EN4Vml2PlZ4qFwezdRCLXuQ9d3OpjMStblLN3P50t+tySAJ7leRMIAGiUAZ?=
 =?us-ascii?Q?21mZZW8v/Zzw5mpwTwvWsY3wjm6nqa/I8KpUoKVi1Fp8awRoH2RW2s+Txf5h?=
 =?us-ascii?Q?yse36ANPnN/XA+gIEb8mumXD3+ZWLDwgNOojwvKB5/o2zCQugDCg+CtnLmhY?=
 =?us-ascii?Q?kU2xqnaiiW8yphddirpuXfnwOzF2L3Z81PeL72RrrJTmhjkoYkHssZDyqRot?=
 =?us-ascii?Q?fRd1fsHi+jmt1qRbRP7FQl8kukaH7t0W3NXWyy94GJe1sXU5jkBB9MOsf8Ga?=
 =?us-ascii?Q?cqT3kXeLMYD8oYQW0RdQSHaq0Zv0ymz9SE/Ub5IosUASv4f+Lq2Wfcds1/ms?=
 =?us-ascii?Q?7FQRmkt/bR43PvrUhfHQHmAy0JGDuHGRN1bZygOjAwFFfGosUiY7GUIBan+x?=
 =?us-ascii?Q?hZltI9QKHXS7cXuy8NHxD+bdycRZAqSvW0syy/ibUSbxbtQVnRX8mJvlgwTy?=
 =?us-ascii?Q?nyhQdW27jQVqY4NhayLj9rogWO7DU73ujHybW4AH2DbsFjgaBoI90yCMJlAq?=
 =?us-ascii?Q?Pdx6d01GP9QFSourt2cajdTYB6aG3vOBk69cYRvZGSKcV9KJ2CHTC2piyFLI?=
 =?us-ascii?Q?PXxE3qCYk6DBNZmVt5GMmVxKd981mrG0m1QemZEO1UsRHjCre4PVanAahjDA?=
 =?us-ascii?Q?E4iUSXlMeMqCMFol6RijShGl0jqVO26+HSGajg6fk488o4xsx/wW6OWTTIqQ?=
 =?us-ascii?Q?YHfzJ2kCEJCLXVDcxp5SGtFUUloLBn0mC6t6dGLlHw8JF9qyGOA0T9cjArK2?=
 =?us-ascii?Q?v+fDUDEHDc5BtBj+YWFPo03OPhG4KmFF0J2ygqj4lvp88hDtm7ZmIMLny1vf?=
 =?us-ascii?Q?2MZJCr8Sl34vWEw53OplZqS0K2wiE0NY7wyhSqp8wdcjo6bgDC7gCT8MsPot?=
 =?us-ascii?Q?cGtPQY1vMJETKsGQHGVRz2aGMDE4rhkpPK3PDpoMKEtT0cGQ9iBOJsOrLUkp?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a79877a-5847-4633-672e-08dbfae99f88
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 08:09:12.1871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3s7VjGzhBla2+bLE0CE2t3zEeXKiRn6YM1UPqe3F/maWb2EK7O0LH//jX+uUn5pdMhLo/82Mx4Ee+BT2UC528g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6403
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
Cc: lkp@intel.com, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 intel-gfx@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org, oliver.sang@intel.com,
 Andrzej Hajda <andrzej.hajda@intel.com>, "Musial,
 Ewelina" <ewelina.musial@intel.com>, oe-lkp@lists.linux.dev,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi, Jani,

On Fri, Dec 08, 2023 at 11:59:43AM +0200, Jani Nikula wrote:
> On Thu, 07 Dec 2023, kernel test robot <oliver.sang@intel.com> wrote:
> > Hello,
> >
> > kernel test robot noticed "assertion_failure" on:
> >
> > commit: 9bb66c179f50e61df20ba13c9b34ca17d00b05fb ("drm/i915: Reserve some kernel space per vm")
> > git://anongit.freedesktop.org/drm-intel drm-intel-gt-next
> >
> > in testcase: igt
> 
> So the kernel test robot runs igt. I've seen a handful of reports over
> the years, but not a whole lot. If you run it even semi-regularly, I
> would have expected more. What's the deal here?

our team merges lots of linux kernel repo/tree in so-called hourly kernels,
tests these hourly kernels by 80+ tools (including igt) on various platforms,
if any failure found comparing to some good bases, we will trigger auto-bisect
to try to catpure fbc (first bad commit) and report. this is the reason you
see this report.

we cannot gurantee coverage since resource constraints, possible failures
in different stage such like merging, building, auto-bisect, and so on. this
means we could fail to capture some issues.

> 
> There's clearly overlap with what our CI is doing. Maybe better
> coordination would be useful? Especially wrt reporting. I'm not sure if
> anyone's going to track these mails.
> 
> Cc: Ewelina

for this case we just capture a assertion_failure upon
branch: drm-intel/drm-intel-gt-next
on a Commet Lake (with 16G memory). not sure if this is valuable to you,
say, for some legacy platform regression check?

we want to seek advices from you:
(1) if this is still useful, do you want us to limit the receivers of this kind
    of report?
(2) or would you suggest there is no need for us to test below repo at all?
    git://anongit.freedesktop.org/drm-intel

> 
> > version: igt-x86_64-0f075441-1_20230520
> 
> That's six months old and more than 1k commits behind. The results are
> going to be useless, I'm afraid.

got it. if you still want us to keep the test upon the repo, we would upgrade
igt to latest version.

> 
> 
> BR,
> Jani.
> 
> 
