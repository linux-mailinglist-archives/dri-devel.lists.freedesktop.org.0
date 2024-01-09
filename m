Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E44F0828902
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 16:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77FA10E47C;
	Tue,  9 Jan 2024 15:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25F010E47B;
 Tue,  9 Jan 2024 15:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704814114; x=1736350114;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fDeC3DSeidQoP9mpFYBfWiaNlgvW6Evd91LpSPnITDM=;
 b=MfOG667tCM5w/MjuXQVXptpY7NfjymmTygIFSNIK3LndphXxAVekPTKx
 30vUtb6vL1GU4PhcvmDBkrJ7Rk7+4pcDRTlrRpvV7A74nPY9HjRl7ded/
 RtIgkUYBurGqRzv0LHOdmDLDUwGo4RX45/xLZCFmanldpPYSFAXr9LwmL
 wdTOYv52GshrgXzwJIPv/jBAfE/0xKA8gnIeTayYcynQf+zBeZHdQMwV3
 TN6dazX8Qm19UUGBgeAZUbjS0UpCgTSYWYCkCWwqOANn9feWSkE9byill
 R7QlLPlZyTYgEJ18T9ij9WXS5wAR24/1zwdlv+/5b5gOt0ecb3EPCqNHJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5597909"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="5597909"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 07:28:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="781838182"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="781838182"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 07:28:32 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 07:28:32 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 07:28:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 07:28:31 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 07:28:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tfi67sED9b+mvm9SEZKjCM7ez1IWQ72HkUdqqEWl1X0t/vHP66asyXBjjCma3iCVrr+YvmCcVDCHqgfmy+/L0+87RIQ9p6n0H+amNfLuxiDFM5/Vu0StWeRfnzuffjNWUlz2LK6t4aNPPhs0XcFPgqEPgO9LR0s3coKyznYr1sGV3/7rEQlvG9E12QSOVIb4RSHFWPVFnt0RsrDLeZRNQLyPPVG/2FNUQXvjqvhSdKOGdyme8gWOxO/hKxJavf66MDysAVbubeQYTyGwCeNSx7pXqbXTq/H1+Xcoty22d2BVhZGyqK3Bx7DKfBqTqItJnuZ60ZkX127R3lH++lkt1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SyCHOUfrdEhFiwv13dJxrEktlPkUn+Q7hukG687oSNg=;
 b=D1gQ12rwOeCKjXW+HaMgcBzWR6Z+NtaFiZnnu+m4V3HSTrid5zaH5lNSXMoxxae+17w6I+Itg3RImqfizIoYaVH2aTDp8p+MM76eiIVBePtR8HM81Nf9vEoYQmHGAYLYP6ceZz22utvMygo44IYfJcxucOMKRGYyQI5lSzC9ZKWgaAJio2E7XQNJwsBZYS39H6OsgNgUegcnOFNlQkbl5r9rfhhkUoREm5JdhIbcRbAlcXpd2UDPe/ajX0jBAP7+Je7wwq+kGvtvFOYYk+15zP/u2hzf5vVXSmYiH4NfXLkfFxLUD6TaC0mSCjqTA4/aUVrBDNJYgtAjcMvg6Opohg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6540.namprd11.prod.outlook.com (2603:10b6:208:3a0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 15:28:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 15:28:17 +0000
Date: Tue, 9 Jan 2024 09:28:15 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] nightly.conf: Reorder the xe repo URLs
Message-ID: <olapqr7e2ef3se7i54qdm3m227vtcbwjkxyj7oydle7adtcwpt@rnaovrmslwhg>
References: <20240109150015.193368-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240109150015.193368-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0131.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6540:EE_
X-MS-Office365-Filtering-Correlation-Id: 71773e8f-6e1f-44fc-9792-08dc11279a83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hNwO2EIcloePJy0U93Bs7frlYE1mKZCj4zWKk39VieBtqfYMxk0phxXdnVsY7zLhUo6aUOm9K/45Msk7TKepqJHQOCq1fPePjRDRJaeR0Z916NRjkFJcvbpaV9q0bID5gvMfjCecLuNA86rT7ZJRGxK+T6YzCFcAKfCEkOacV2zsJ5OH79xNpbmhRhyTHzp2brDv172vMS4rtKXz6RqjN+2J1dE7CNRrF5wUBAFdsNA8H6Jlbwkouy1j6qTcHWmVy4kkHJA4tfLvJzGx/hOwJOYbkRR7fTkvV6ITRe7/QIW05InsQNogZZJyIUaYRgjDdf2LoceqVj/bdzpA0t6X3LvFbeLVglNJvAKzt/7w1qROWamEjDdjbUOKdCOnhSNHAxwWZSg6gwznR42RauktwktR8z97CzEuuwLhI94xYEt/O9Jl5mdtBW3pkO63mlK4VrgvvGeUZ5utCMg6fq+AzFlunwULRbjz/jr3AMsv8owiyHWMvFNte6p+g8lIopZvl7BNus3JLWnBGyFIa53JUSOPGjlNPitLGiciB6DrJCbaAAuRzpE680MjrApfxA6l913fbXLwoNaCvUEs6h6Elw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(396003)(39860400002)(376002)(136003)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(9686003)(6486002)(6506007)(966005)(478600001)(6512007)(26005)(38100700002)(41300700001)(86362001)(82960400001)(2906002)(33716001)(5660300002)(66574015)(83380400001)(66946007)(4326008)(66476007)(316002)(8676002)(8936002)(6916009)(66556008)(27256008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jLAQdNaXPCUcvpe9300vYMhgRcHvbii0Wq8OXum0Od5Igm+wI40nHvdiLR?=
 =?iso-8859-1?Q?nJpF7e0e8Bvf+mEKxBigPtOW0qAoz9BlIgU8caw7sV6CrtdJtaSLUSV9pw?=
 =?iso-8859-1?Q?DHrySZ8xFzkLbyIBhgjxVuwzSB4Sj+O4yaBg8Bk5wmG1trZgmENB/OSESC?=
 =?iso-8859-1?Q?gYZ/SBXpu03/wsOFeAbrFYZKi0/2GJpXPqmCCBk9wynQpjUMRobnwS+I4w?=
 =?iso-8859-1?Q?v6kgEaaPzXuVENSKoEIhJLyYfw2Pmhc7u4DazycZr77imMXrf1iEpHDURA?=
 =?iso-8859-1?Q?wU8NL5qK1YB0fasAXPYMW1QvO0eESGAMa2gBrjsp+hD28wtmuF1liH6BaA?=
 =?iso-8859-1?Q?5VCPKP3n11XMbTcljzoaP+t9HY/Xhe6XX5Kpaujr2di5geBJQSpaDbH7Gy?=
 =?iso-8859-1?Q?gy3wUH1kBGInmJP/V5ED4PnJPr2aRyhUjx5oDidyXe+6SS6ZMPLRUFRabX?=
 =?iso-8859-1?Q?QC7Eh3Eo0nTI0Ua5EzhsmEKgAl1/fICrFSNegu08A4Rbz4BrQIC7ZV32ht?=
 =?iso-8859-1?Q?EJxwlrR9us8voH9togwWvCv+r22VeXJBB2O8GC2VvRnIXYaE2UAK9uGGd8?=
 =?iso-8859-1?Q?pD74py4KqM8QClzVaw4NYwNjrWJYSaqVHovHKG0em8Lx58yUX3bRmDhfH6?=
 =?iso-8859-1?Q?MRohp67U9Nox1eXqoSdq7vXay8k3Rl32ncjgj6KsQsKkwxjUJyDDYNN3DM?=
 =?iso-8859-1?Q?WYpP5Z7xfSS0E/pDG0WWP2zWaWWwJ8ZbhvPhF/hiP9h1rPuBp0gm76P6tx?=
 =?iso-8859-1?Q?u2n5smvSl7XWM4uZmAnerc6fW5BkBI7ljpL8PM4VKhRDVLlJO1+R1/sLGo?=
 =?iso-8859-1?Q?GCe8EueWMPLDSMvribIo+s5SFFxKlPU2Filr7mC79xYEiKmH7rWN9fAUW6?=
 =?iso-8859-1?Q?KUqFkIf9E/gVA85171F82oQi1XfJpcBME1n7GQhKDDgpObievLlRjpvzXe?=
 =?iso-8859-1?Q?ocL1C5MiRmn1ffWvUHgjwueYPVGmV8Zh1uUH9vTB9xryYvLMxz1PySuwN+?=
 =?iso-8859-1?Q?4n20ZZr97TZ7m3lZZ9VmZdTCkGj4xruFhDEtcnwaRnIia76YhsbZFsTG21?=
 =?iso-8859-1?Q?1H2zkNXgCO+UgOMeAwwPKhQowZv3udko0msHAoA5lY4XYARXh310eo50iM?=
 =?iso-8859-1?Q?mYQq2gBZtTsribsZtOV8IBzf6k/w/8k1r+x8M2zbAaBAtG0tlS66oE1FOr?=
 =?iso-8859-1?Q?1iVRUHuNQgWmzvB8SsfzTWtvv06xRa7aUf3G/oIhaM49UboUnTddvYmUA9?=
 =?iso-8859-1?Q?l/aRT/kJm5cnU55tQxD4KBJCC0O8XVcNh1vSVXOah2kw102jLz926tgusG?=
 =?iso-8859-1?Q?3hv+qpzkWJu9UWl/f0TnBI38YfQJ+QGrpHZAGRzq4XLjlhAvE0oRivzFJU?=
 =?iso-8859-1?Q?m0W5C9kMAv7G06zVD/zxEsATelhCpnH6snAki2qiPo5QsgKwi88hM8BWLA?=
 =?iso-8859-1?Q?7UOAy6bPEDAkyZhZ6shBCpgiMpp9OONTZ7c77/ua6bnZF+yICOyZPP6ZZd?=
 =?iso-8859-1?Q?AB0SudE7UFQyCjf23jry+iZd3Dox4W7QZMY9rwg/iLPgE5PDMH8TDmZ1aH?=
 =?iso-8859-1?Q?m3Vs8ECCqTKCVk9slFa/I0qSFePJcwI7DkYYpSN1mJq2YlsT48YJ/+Cj6B?=
 =?iso-8859-1?Q?J2k0c9vC0hIRjN7vHiFTIL47RK5QFvTRvJUuvnHMqimZyvxPh9MBM1JA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71773e8f-6e1f-44fc-9792-08dc11279a83
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 15:28:17.5155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j21KD2HRxf2QUvK8xUhdQMTUlx4KLGFUhmrV+u/NQfQntrNFDLoaFOQ189JMtx05xfapH25Bz/7sJoa3gQ2ULSn6+04Ln0Owlv/3AZYV8jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6540
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 04:00:15PM +0100, Thomas Hellström wrote:
>Select the https URL by default for xe since users may not have
>registered a gitlab ssh key yet, and may get confused by
>the corresponding error message.
>
>Suggested-by: Daniel Vetter <daniel@ffwll.ch>
>Cc: intel-xe@lists.freedesktop.org
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> nightly.conf | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/nightly.conf b/nightly.conf
>index accd3ff2cc39..84dbdb98a99f 100644
>--- a/nightly.conf
>+++ b/nightly.conf
>@@ -25,8 +25,8 @@ https://anongit.freedesktop.org/git/drm/drm-tip
> https://anongit.freedesktop.org/git/drm/drm-tip.git
> "
> drm_tip_repos[drm-xe]="
>-ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git
> https://gitlab.freedesktop.org/drm/xe/kernel.git
>+ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git
> "
> drm_tip_repos[drm-intel]="
> ssh://git.freedesktop.org/git/drm/drm-intel
>-- 
>2.43.0
>
