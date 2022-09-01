Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 521285A9AD5
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 16:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE7810E738;
	Thu,  1 Sep 2022 14:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D4B10E738
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 14:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662043761; x=1693579761;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=L79xhWbQdoBu29n+DSZ0BRKVsuaXLCBf5IHX0Bfwk0Q=;
 b=CxPpbIpkMJpzjfag2GGqw1SuBR+dJS3YnoJ1Cgi4TxKv4ULekIiGE3Ev
 iXrwZ9vfkaTmU97YJQaxCAQsAr0WnicjcV7eOulmP19p2o3ydm0SeywEp
 QIco6uPl80np+hk+/QsScW3hoyWjrpBlRAt+vhLaiga5GsFv1/OaonTRi
 TVP73A8cPkocwVx0Oujoc+rtXqcHH5zuEdrkNulduI4yMIzQglj4ntbK9
 faH/ulR6lnXmyCgB1cIWHkhUvk0CpRpjhgpmHHNTGjr2lPrlCHbNC1E6g
 4KWRupS1AQou7pBH+8tkohxUahbQNy0/fQsKAoenH3Blr4f+2a+OzVayx Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="359692689"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="359692689"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 07:49:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="642360936"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 01 Sep 2022 07:49:20 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 07:49:19 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 07:49:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 1 Sep 2022 07:49:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 1 Sep 2022 07:49:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwfkONkRpNKtvS9tuTQojLAZRA/jO+nKYQhGUWCAfD2YJXyDizHz3YzV4CJ2f+pmK9E6uvmmejemy7AwY2DzThkruoy1wF+zJAbmGWL73JJ5plP24IggtjAkXSoFZkiCzTOKfqzbi16xdr4RuS4tqyQ+KN7MbZlnbhTpOsALv0tgISSoPKUugT9DJMWms1Nibf98VISdIlW6T0POA9h8U7cYO0UoLrcQwcFd6RRwvDfjKrqYh9oNqwIgi8m6wptvumWsSHrs3/dAaWRnemP3kyFYNGrUKexHjh4JC1j3lZFp2rqcfBXwwYL8+POLGLvKHiBcdLL4WmVhV+5CLZkU7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONVR0KJYITfqF1k3JRREnK1IyOi0f5YF5N7u8zttVRE=;
 b=CfnCSS+SiuY5peAzo0F5a0iJFIbvP0aHlWNG9qq9HuWy9SKMuynxU3IDMOyTrgYRqrZYoo2BbUVrdGvxdN7yOUmNuycp/5FNq/9JkkaEPFM6xW+++m9YhTPVPsy6QNkT0ZRL8rOf4VK2lsX6XZIB9gsBemoD8bur4MhB8fklcHRW647S8ooOQ53jwIEsNkKIDNI7NQ9ecq8P0OlLFUvnilKMivSsUOvXEjB13qUiTxs+9A/DYHxwdN9zm+DK+5QwsIxSBR4T9AoYffgWhGe79vdjWJzziHUYQSLq5WNEFQwEG/akLTexrjFdKXgBaoRW7+tr2Ot+zXkD8RatqGGxPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY5PR11MB6511.namprd11.prod.outlook.com (2603:10b6:930:41::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.12; Thu, 1 Sep 2022 14:49:17 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5588.011; Thu, 1 Sep 2022
 14:49:17 +0000
Date: Thu, 1 Sep 2022 16:49:09 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm: Simplify testing on UML with kunit.py
Message-ID: <20220901144909.6rihfj4mgklk3ddf@nostramo.hardline.pl>
References: <20220901133621.353270-1-michal.winiarski@intel.com>
 <20220901140253.6ebvykv35kyc3v3w@houat>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220901140253.6ebvykv35kyc3v3w@houat>
X-ClientProxiedBy: AS9PR06CA0518.eurprd06.prod.outlook.com
 (2603:10a6:20b:49d::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fb50caf-78fc-4eab-6dd7-08da8c29255a
X-MS-TrafficTypeDiagnostic: CY5PR11MB6511:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z7czkp/el+LovqLc10wLtXRwBbnxITeBBoydm3pi9W4quDFPymZfbxLjFxKt5z46qaTXVJp6KhRgG9cTcX4WnNlmXNtDWhR5RCVUZNDJsbZB0jeatw8umdllZxkFC8BeHiMCsa78YUR9eMVF6MD2zcJD7bxYHCRHJpaX+whVElML2X5qVaRd+BF3SSYLtbC/cE0Nc//N/sG7nmBggkjAuJ7cg/0peQvJqribtpnXXU6i0i+CTg7inDceU7qnJbEDqU6FerhHa9N2z3FxTSkZk9U7xTlx9G/4dsWf+Q/fhsmfZuEWHvEHg2R0cCQF0AjlXGcCaqXNBH0Qc47DofnM87Ezz89ks/pwpCEUkBPLy8xaHbSdbcJSbV9Bl7pFeywuaAZ+ArkNZoD4pLzxrJdzofdKBrAiwzKLYpT5nIUtUKDT4hcBhATimkvaUgKjkDedq2J8HQ3coKReFNXzo/qaqy2BoMumgAHrW8eel59zEqXMoIo5otxauctPxl0F6Z8sSaBa7y1OPMTfZ2o8VmTzj3HrCfaBh9l8jUGZBHHmb52xu/pSH1n5oRUeki2al5U15/7DWa+79l9D3Zas+EzQMGK+60p325PKNqq2AktrTe8H1sCocpz80xi1lj1edHA966JlSwIpC17mAr75Enl1RY3iYlo/7/4+WJaYuSbGpBCCeWad9YPVdbPECWO91Wc7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(396003)(39860400002)(136003)(366004)(66946007)(8676002)(4326008)(66556008)(6486002)(478600001)(6916009)(54906003)(316002)(66476007)(8936002)(2906002)(7416002)(5660300002)(82960400001)(38100700002)(86362001)(1076003)(186003)(6666004)(6512007)(9686003)(26005)(41300700001)(6506007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWFNeTlaM0VxQUsvZ1A0QzFVeFdQWnBGVXd1WUlGd0hKSHlLWFQ4dFJIcm1Y?=
 =?utf-8?B?YjMybXV0REV4SUk1WVNDVXNhZnlyMC9qeGJvQk9EVmY1UDczUGZOeW5hWVlv?=
 =?utf-8?B?TTQxV01pUE9aRGc1R2RnSmF0WmZVdUNTR0VydDl0K3c3ekdxSWVFdG5HdGdv?=
 =?utf-8?B?cnl1cThIMXhhUWFmRHRMOTF1QlZ0UEkzV3MwVEFaTUxCTVpFU0lHSEhpK3Bh?=
 =?utf-8?B?V01sZVIvcS95aDBJNWt3YWVIZXRCOW92djkrZ2g5NTdrMkV2THM2RS83SHgy?=
 =?utf-8?B?K3d6eHVac3FBN3hXR0xwcFdNUkk0cTBMTGduSzhZazJvbmdBcVloQzZBOHlr?=
 =?utf-8?B?MjF6eThoVjRDUkk1aUtYMDM1MlJiMVVEV1pXQlBZWlZvRzdRUWFvdlRpcGRn?=
 =?utf-8?B?OWVKc3pNblpZL0JaRlhGZm9mNGFmcEgvY2JCT3BaUzNCYjEvR0hJUHZUdElm?=
 =?utf-8?B?dkhkeWFzTmxXR214TGg4T1M0VDZGQnBZdVcrK0V6Zyt2UWJjZFg3Zlg4YlQ5?=
 =?utf-8?B?Um9hT3RCNVJMc2FQRysrdG96ejJXbTcxOHJnVnkrUTdZa3FZakVmSHJ1anFN?=
 =?utf-8?B?dWwxSERndTU1N1RqamxZVXZubmxVczlLaEV6VFZCNENPdmV1S2p6aFJIdU9w?=
 =?utf-8?B?bUVSUmx0bG80Wjh5dVlKcmloQWgwbVRpdmhJYUhFbDZvUVdHWVA3ZXE4Rjg1?=
 =?utf-8?B?SmdnaFQrRkNZaGJWd0w5cThOdDU5aWpJWXg2YzRRcG85Wi8wTmtCLytIWENq?=
 =?utf-8?B?dWRxRDRzS2xMTUppV1FobGgxWXZUY1FldjdKY2hkanpqVTE5Sk14RU1uMFU3?=
 =?utf-8?B?SUNqNldiOXdRQWR6bEdJMDFodm56U3hyOW53dktGMC9ybVdNd3d2UytoWHdw?=
 =?utf-8?B?OC9JbFVNVVpMV0l3U0lMOGE3d0J6Z1p6ZzFSTmFJdjhkMkJ0QUMwN000QkRq?=
 =?utf-8?B?RytSM2xKQkx6bnBNeVpySTFMWE1OdEtZS3NBVzFwSVpnN29XWktJR25VVEdo?=
 =?utf-8?B?amZia3lDVmhuUXVMaExFVnE0SVJ6Tml5T0EzenRHTDRydXBvZC9ENWdJa05F?=
 =?utf-8?B?WGdVbFlHMXBacXUrSnp3dDZWNkZYMUtvOVRHeUlJN1JjTE53MXBkMDdSZVUw?=
 =?utf-8?B?QXoxMWF4Q2xEVHQwU2JUdjdPcEV4YzkzanpkdkROVjI2Q0tVV1VPTFFIaDVX?=
 =?utf-8?B?K3YwaUJNTk5jWHRTL1MwcUxMdk1rWTkxSTZYMDRDNk9VQlk5S3dwbGY4QitK?=
 =?utf-8?B?dWNHeHUvTW8wTEw1aDM5MXdRVG1OKzFQcTk0ajhCYTMvOEdsYXJnN1NYa2l1?=
 =?utf-8?B?Q1ZpcmUvT3ZqZEZFODlGWFJGdlFOYWJwbU5UZ0tNcWxnUm0rU2g2NzdrbC9M?=
 =?utf-8?B?SCtMR2NGV0VzUVk3VnpKWW5TVDNTWGV0NnJ0eng3RExpUFpGbWhwWXd3dk9L?=
 =?utf-8?B?OEFrQU1zcENKNHJackZoSTZ6QzVuM09lanQzenQ3R3lNTytUKzBsRHRGUG5G?=
 =?utf-8?B?bmhXNkVwSy9hSE9KOUVMOUt2MFhUUFZMRzRJVmJzYW8za1RkZDdaK3pUSC9G?=
 =?utf-8?B?NjZwTm4rTkhzMDlLaWcyV1g3b3FIcEVHMnVUQW5XS2Y0OU5DZWN0Q2cyVlV1?=
 =?utf-8?B?b0JpdlZDVzhtWm8xT2hJWC9WQkdZeEo0biswZ3l4WmFsRVpMalc0TmxXNU1Q?=
 =?utf-8?B?c2dRdzRoSmJhTnZnQW14NHkyYlNxRU94dUx5WXdIWVphb3Fsdkp4K0J2NENt?=
 =?utf-8?B?blphQkZ3NUQwT25qSC9TTDlOVnhoTHVvSlRWVDBUTG1WRDZISlNxcU5BLzNs?=
 =?utf-8?B?WlFxc1VEd3h4OXF5Tk1FUXl0dE83UnZMaTc0bTJwUGh1OHZkd3BKMk80OHNz?=
 =?utf-8?B?QTNENXR3YXhPdU5jVzc4MUFFT0ZVMEF1NDFTYjFjUTFmSHhLSDVhQVY2bCtt?=
 =?utf-8?B?Rk0rT0NJOENMQVZHYjdtc1QxZUt6MUREeE95OTUyUTBKSWZjWkhsQzNhTGo4?=
 =?utf-8?B?ZmxPMWJ3SVcyeHlRbTd2OUZiSFE5aENTTis1SkZ3bW96QkRDaUNtWnQyM0hS?=
 =?utf-8?B?SDVJQWhhZHhmajlzbDZYUDhyUHNKL2Rpek8xbTIrTWdYeU9MaXlkMTJNdUJR?=
 =?utf-8?B?ZCtqTHduby8zRFVBb1E3a05mM0NwNGtoV1ZvaGNtR2VtTWpCdUxKeXdyZnRE?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb50caf-78fc-4eab-6dd7-08da8c29255a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 14:49:17.6296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vxaCmgpQ2T0Fb/bKDR5xz5LlNLRzYME1wXQQxIpOdFeHH/98zjxEbznvgrU0NkmPu0+pFdkQYzm3wC3bOkMHTEBhLyBudQ/lQQJKgFyEF+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6511
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
Cc: linux-fbdev@vger.kernel.org, David Gow <davidgow@google.com>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 01, 2022 at 04:02:53PM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Sep 01, 2022 at 03:36:21PM +0200, Michał Winiarski wrote:
> > DRM depends on IOMEM and DMA, introduce an additional Kconfig to pull in
> > IOMEM and DMA emulation on UML.
> > Since --kconfig_add usage is no longer needed, remove it from
> > documentation.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  Documentation/gpu/drm-internals.rst | 7 +------
> >  drivers/video/Kconfig               | 4 ++++
> >  2 files changed, 5 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
> > index 5fd20a306718..c264a9587d21 100644
> > --- a/Documentation/gpu/drm-internals.rst
> > +++ b/Documentation/gpu/drm-internals.rst
> > @@ -228,16 +228,11 @@ follows:
> >  
> >  .. code-block:: bash
> >  
> > -	$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/tests \
> > -		--kconfig_add CONFIG_VIRTIO_UML=y \
> > -		--kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=y
> > +	$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/tests
> >  
> >  .. note::
> >  	The configuration included in ``.kunitconfig`` should be as generic as
> >  	possible.
> > -	``CONFIG_VIRTIO_UML`` and ``CONFIG_UML_PCI_OVER_VIRTIO`` are not
> > -	included in it because they are only required for User Mode Linux.
> > -
> 
> I'm all for removing that part of the documentation, but because
> 6fc3a8636a7b, in 6.0 should address this entirely? Why would we need
> that other symbol?

We don't. I wasn't aware that 6fc3a8636a7b exists and had this one in my tree
prior to 6.0.
(well... technically we do need those other symbols and don't need VIRTIO, but
since CONFIG_UML_PCI_OVER_VIRTIO pull in those two, it also works).
Since docs were not updated, I didn't see any conflicts when rebasing.

Sorry for the noise, please ignore this patch.

-Michał

> 
> Maxime


