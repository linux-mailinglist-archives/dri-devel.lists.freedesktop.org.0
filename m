Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4F65B513D
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 23:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548A310E1A7;
	Sun, 11 Sep 2022 21:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A371A10E1A7;
 Sun, 11 Sep 2022 21:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662930857; x=1694466857;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Fcg0Xww7zGyxfdtjwCAc3oQ6UgD+m7HcdmX8IuAMmkI=;
 b=Y43XKcj+jRabL+W5RdEMNJZRaBs3DMZT025w2U5pGjoUnfXT/TMCrHB3
 4MGZz8da9EsIFvN88veDX/Vh4t8IXNMN5TBjkiZlb/SEGkVEqghmXD/vz
 2Xbx/mXymyoOKMFxiJrXfVv+5gnuYgKg6tfYR0mC/YFaa2rejUc3cOh7v
 7YUJblr6ttZqQLqN5R06fqUeMzQWZwRF+tPzueYUalvCZU8o5kDxe1V/V
 MBockNtZSYgyoGuUo/2l6bSR6Ntxya6IQTqzW3vD49CbvtoBMbUiPizGv
 JuFfgcVdBNWI6d3w52QN53oUXdDIuI0WDG31HmKM1M0pdnAJ1u/iXdauk w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="295337127"
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; d="scan'208";a="295337127"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2022 14:14:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; d="scan'208";a="615852846"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 11 Sep 2022 14:14:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 11 Sep 2022 14:14:16 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 11 Sep 2022 14:14:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sun, 11 Sep 2022 14:14:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sun, 11 Sep 2022 14:14:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqPxKnqOV02m+XmJ0H2cVd07/8kf/Qx3+eP/TuxMqP1jzCnF9gqMxr2W0n05ZiFP2yz6XmfI+R9NmluVU+qEUNTi+uctIBubfOT3CqAPlT6Uyo3iiX9sLjrR9DqF/a2lFfpS//DbGnwpU9f1W83iNpopSUbSC6WOesF+Bk0g+mUiFX3HbJW5LkoMGHQHFXqWdKSQPdn0sUDXvN7VrTjS1XYla1xPHpQWKgXogOSBvllDCuFmhd8KY7Hri+C2rtAXJ9Ug8S7+rWWROvhx2OpUsEhhdKT+KTYDsscBpiOB09dCyzJN8KKpyshW1dv0tTiRhqH/p/Njn+I5ce6Yp9tKWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVpvw31RwxvlvazMpf9wH1PcICIDZJJbz/3GUO31z5k=;
 b=Knqa2vAPYGYt2ALUpIikW7uK3pMHnHELqWEjxADiURZILLH9gWVb2UEE+IuFSs8uocxhIUeo/LLKLUMKuNS5bC5uXimn60Tm96zIMnGy02DGavRTNjItBN+ymI25mXflcOc/yBpcZ2E5FrdTtaaSFXIasHFn8wjmyX90jTXzGLR5O67f7DZMz6jLPEisBFzoft5VyaEzP1GNG4gWpfmiQQXVQ90lMQVROX15T1U9wHqssHxg/TssC2a7nJ1xvVX/oSrABL9uBINnD5i+QC2Jv1qjUFzC2MHpJuGepXG+lQUs+4kRZ/ZnorLqdOMnodOU85VIndCO21UL9/b13mZiQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB6065.namprd11.prod.outlook.com (2603:10b6:8:60::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.20; Sun, 11 Sep 2022 21:14:00 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5145:64b6:db32:b424]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5145:64b6:db32:b424%5]) with mapi id 15.20.5612.022; Sun, 11 Sep 2022
 21:14:00 +0000
Date: Sun, 11 Sep 2022 23:13:53 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v4 1/3] drm: Use XArray instead of IDR for minors
Message-ID: <20220911211353.kuv3jnwkgo2m5arw@nostramo>
References: <20220906201629.419160-1-michal.winiarski@intel.com>
 <20220906201629.419160-2-michal.winiarski@intel.com>
 <Yxe1YDcVfqbjgT6a@casper.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yxe1YDcVfqbjgT6a@casper.infradead.org>
X-ClientProxiedBy: FR3P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::9) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: cde79016-0703-478b-98d3-08da943a8c18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kD3nR3vsbWe5K1ZSJOY+2vCJlGD2rgA+dl15wNQVHxGt8LLov9IOV3DKO2ZZhyt5ZYeGjfvURnXEhUWvBsSHJj9E/oHjpi9J+OBgncOv2udamLs/7gOC02q6bdD+yCE6n/hRv4TTjPef0ZAlTXjvDG+0v/+fChmCSdl9vCRkX24AJDyv199Of19+suS6Z7CoXiTpa6EYHGKJz20e6lcKpbp9RVHE+CI+S6e9ArjyM4QmK6CeKxbAJGKqTWAjyS/HQRt/ndLZR7bqSCbFFdR9kGvfMNZdwNZ2sOqpmH4b95ouBqWOfN78Bl0ktbGYAEHJxYFvmNFafWm7qhBRU1UqRfgeSZj31K3EoOJdJlJW2zoMaZvbfV0P9BoAXZzfAc3T99kY8ljrB3pmMVmSDn05WHGfvL1DEJAGoEZvgL/vV1wN1w4cUk5J+WjqURjEba+rJlY9t1to5v6DA8RF95qV7fx0aGs9FfgpwW1Qn134w07FVp7xE7LCJtcYSOhAM+IpMwqJie+YPboLll2HWqrNsOqbaAA+VRtz4my0tvcgjEOwu60pdA7HEZLgtwogJ34ZVWM5xw3VQEUBoHaDvj/4W3JvRJJL2fRHTbzJQCUffu6j7i9eNnmt2LjSjpsW++HKhxlE7NL+2fGc/Wsg+Urjt8Sqrzd80RlEIy97XAhPiRcec7kC5o5FbjsRzcvzGDB/39lIeOI+GgazfwmL+dUbjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(346002)(366004)(396003)(136003)(376002)(39860400002)(186003)(6512007)(26005)(41300700001)(6506007)(83380400001)(6486002)(9686003)(1076003)(478600001)(6666004)(316002)(6916009)(4326008)(8936002)(8676002)(7416002)(2906002)(82960400001)(5660300002)(38100700002)(86362001)(66556008)(66476007)(54906003)(66946007)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkpGaUw5eXN1WnY2a25XbCtKL0Nrb1huYUlsVkN6TGdMbkgzSEdYaFBGY1lV?=
 =?utf-8?B?VTEwZkVUWitZbmU4akFrUjUwWXFmV2J2ajdEMlV5bFdtcDdLWjBIUWlmSVcw?=
 =?utf-8?B?TlFkRzFEakdZMklsZmFObHhabVJrYmIvWGJkNmxBUmhGeWt0MS9mRTM0VWNu?=
 =?utf-8?B?a1AxQ0VDNW9WMm94aTZ0MzcxaXkxWjI1RWtrNVMxM1AzMGVQZXdEK2F3dUdF?=
 =?utf-8?B?K0RCaEMvYVk2bCtFZkdiZ3lUZDlNa1pGYW9MSEVtYlpHWjl0MGFGOTNnMkhC?=
 =?utf-8?B?ajErS3ZmeVdoQkhZbURGQTl3Y3J3RXh6WHF0VjdwVXVzQ3ZaOU5DcWVRTk9U?=
 =?utf-8?B?Y21EM2k3U0lXNXkxS3RQQXAwSmo3a05QZDk2NkRkMXJJZzZCUWxCdzNzN1ZF?=
 =?utf-8?B?UkNIM1htenk0aE9IK3h4SmJBRDdsTTVRbUNSL09uc2t2Ykw2SGMyeEhSMm80?=
 =?utf-8?B?VjBDM2JPQUVMQy9wMDRLakYrZC9rVDZQdEtwSUF0MCtWWWZGWmhranVxc3BD?=
 =?utf-8?B?QmFTdGFpKzVPcCtZK0xybkRXek1EZXB3clptc0c5MDIrRVJFWDl5WU5KQ0pU?=
 =?utf-8?B?eERmdThnVkwyL1dVNU5VUHA2bkNLdTgwUnp6bmFUNng3S3dqQnJSQjNCZ0hD?=
 =?utf-8?B?T09ublBUa281S3d5VmduOHNXeFVEVHRiMEJZK3BXb25hb2xCVitpT29qNFdC?=
 =?utf-8?B?dlF3dTdWRytxNk9tckJXQkJ5MWZaRi9aUWZyMVcyKy9hbzY1RzdYa0Rudnl4?=
 =?utf-8?B?V3dMR2EzM1NOUlo0YlJlRCtrbTkraWtCTU8yYm5yeTlKSzdRNlBKdC9QOU55?=
 =?utf-8?B?c3VjNzJNRTNrdDh3emFnM2FiY0haQjVMVjJwS1ozSkhlOFQwUU5kcnc5WEhO?=
 =?utf-8?B?UGRTTUxQaFQreEFweHUzM3NHSlF3UkV2T3JMT0FJZ3NrdzN5NU8vV1FZN1d0?=
 =?utf-8?B?NVJIK2d3cENhV2pFTU5sUUNMQnFFSXo3SDIvOHFYNUtQTldLaUFvc2hIdTRn?=
 =?utf-8?B?cE1reURDWG85TWlZTUVlMnp4ZHVqQWF3d2dGanNBMUNpNUhFbUJLZEx0WTAw?=
 =?utf-8?B?Y0p6Y0kvcXowTzhzTGE3NWIvY1hYOHA2cm1xb0t4Q25SVmVtYjN1ODFhenhy?=
 =?utf-8?B?YmU4VWZldDM4eHpHSkZ2UGtLRm9IbjE4Nmg0S1hrQlRYYnNTL3FmZ1lYV1JE?=
 =?utf-8?B?UXE0SjQyK3FGWUhTSHVZS3BQSm5nVXNaSDdvTlFkQWw0aGFzdFVndVh2NGRG?=
 =?utf-8?B?RWRWS3ZFTTIxK2xtcXNWY1oyMU10RW1tV3dxM1VrSkMrSVFZV0ZRZ2dpRE5s?=
 =?utf-8?B?VmdUQmgxUHNrNzhCeGVQa3F1MEJuUUpCdTVLWVNpWmRWcElUSnllWUZYTERB?=
 =?utf-8?B?QnBUSVVSWDc3RlBSWGxlQWRTMjBZMjhPenMzMmhSNFFKZHBKWG1obDZkRVVv?=
 =?utf-8?B?K1JLUjRrV01HcXpQZ1VGNVdIdWJ1Zmg4b2NaOWM3c0RySE9aeS9KSXdIdU1W?=
 =?utf-8?B?SjRJSjBMVEtYQS9BMVNKQlZiOHVrYkY1dDM3UFh0UFJOZUdMd083RlpWMXBo?=
 =?utf-8?B?WkhoS3BRY2xwVytGQmVvTkFqK3V5aVgvL3FGRGpCZzEwakt6V0FST0Z1T00w?=
 =?utf-8?B?VHR0eXlYV2U5TVJxWTNXRURWVUZOWXp3VWR0b1BiT0tHZnVRRTFGRjZRWUpZ?=
 =?utf-8?B?MUUvbXRISThuRmJ5VFBRS1hnRGoyV1VneXBhZFJPeTFleFVRSEkxUGFZOWdo?=
 =?utf-8?B?Uk5oNWh5OWxoZUFxcFBmMERyT2pFbTEyQVhBeTNVUjRnamQwTnZEMGFTN0RI?=
 =?utf-8?B?MUlGOW5KY3FoeEx1WlZEZmJiZUI3Mm1RTVUrVFYzMit1THVRMjJyWFN4WDdX?=
 =?utf-8?B?NnhnQjV4eDJFbFhvWlRMaTh6aUxobXhHRG5DZFk3SWJlMit1KzVGem5ZSHBT?=
 =?utf-8?B?NEJMNHZKdUNZS3lRWmhzbXRKb0JPUUVUdDJzc2JHVWhJQzVFZDVUNGpmUmpL?=
 =?utf-8?B?NkpyaXZWTGNGK0VTeE1IejFwa1ZKbmIzcVFWSXJLMHB4K091T1J2QjFvcXVH?=
 =?utf-8?B?TTU5cHFQSkJWLyt4TGdEMVJVdFVKYUtjWXQxdFhFMVhlRllBQXNTQVR3c0xE?=
 =?utf-8?B?TTFBWHZkOHVETzRPVWVuQUJTejRWTXBtcCtkUmdVWVJhWmRGZ0hkRnFDZDBO?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cde79016-0703-478b-98d3-08da943a8c18
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2022 21:14:00.7345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SfAzcesRM22ucBxYcNDVpvdAVHcSdWCYS3MHhirnYiZYDLgxgn+0CnXiodim9kps2cdWIrdA/20/21CN9bI5PijaQp9sfV0LKsNNK+zzt7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6065
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 06, 2022 at 10:02:24PM +0100, Matthew Wilcox wrote:
> On Tue, Sep 06, 2022 at 10:16:27PM +0200, Michał Winiarski wrote:
> > IDR is deprecated, and since XArray manages its own state with internal
> > locking, it simplifies the locking on DRM side.
> > Additionally, don't use the IRQ-safe variant, since operating on drm
> > minor is not done in IRQ context.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > Suggested-by: Matthew Wilcox <willy@infradead.org>
> 
> I have a few questions, but I like where you're going.
> 
> > @@ -98,21 +98,18 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
> >  static void drm_minor_alloc_release(struct drm_device *dev, void *data)
> >  {
> >  	struct drm_minor *minor = data;
> > -	unsigned long flags;
> >  
> >  	WARN_ON(dev != minor->dev);
> >  
> >  	put_device(minor->kdev);
> >  
> > -	spin_lock_irqsave(&drm_minor_lock, flags);
> > -	idr_remove(&drm_minors_idr, minor->index);
> > -	spin_unlock_irqrestore(&drm_minor_lock, flags);
> > +	xa_release(&drm_minors_xa, minor->index);
> 
> Has it definitely been unused at this point?  I would think that
> xa_erase() (an unconditional store) would be the correct function to
> call.

Yes, unless there's a programmers error somewhere - I'll replace it though.

> 
> > @@ -122,20 +119,12 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
> >  	minor->type = type;
> >  	minor->dev = dev;
> >  
> > -	idr_preload(GFP_KERNEL);
> > -	spin_lock_irqsave(&drm_minor_lock, flags);
> > -	r = idr_alloc(&drm_minors_idr,
> > -		      NULL,
> > -		      64 * type,
> > -		      64 * (type + 1),
> > -		      GFP_NOWAIT);
> > -	spin_unlock_irqrestore(&drm_minor_lock, flags);
> > -	idr_preload_end();
> > -
> > +	r = xa_alloc(&drm_minors_xa, &id, NULL,
> > +		     XA_LIMIT(64 * type, 64 * (type + 1) - 1), GFP_KERNEL);
> >  	if (r < 0)
> >  		return r;
> >  
> > -	minor->index = r;
> > +	minor->index = id;
> 
> Wouldn't it be better to call:
> 
> 	r = xa_alloc(&drm_minors_xa, &minor->index, NULL,
> 			XA_LIMIT(64 * type, 64 * (type + 1) - 1), GFP_KERNEL);
> 
> I might also prefer a little syntactic sugar like:
> 
> #define DRM_MINOR_LIMIT(type)	XA_LIMIT(64 * (type), 64 * (type) + 63)
> 
> but that's definitely a matter of taste.

Sure.

> 
> > @@ -172,9 +161,12 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
> >  		goto err_debugfs;
> >  
> >  	/* replace NULL with @minor so lookups will succeed from now on */
> > -	spin_lock_irqsave(&drm_minor_lock, flags);
> > -	idr_replace(&drm_minors_idr, minor, minor->index);
> > -	spin_unlock_irqrestore(&drm_minor_lock, flags);
> > +	entry = xa_store(&drm_minors_xa, minor->index, &minor, GFP_KERNEL);
> > +	if (xa_is_err(entry)) {
> > +		ret = xa_err(entry);
> > +		goto err_debugfs;
> > +	}
> > +	WARN_ON(entry);
> 
> Might be better as an xa_cmpxchg()?

Ack.

> 
> > @@ -187,16 +179,13 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
> >  static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
> >  {
> >  	struct drm_minor *minor;
> > -	unsigned long flags;
> >  
> >  	minor = *drm_minor_get_slot(dev, type);
> >  	if (!minor || !device_is_registered(minor->kdev))
> >  		return;
> >  
> >  	/* replace @minor with NULL so lookups will fail from now on */
> > -	spin_lock_irqsave(&drm_minor_lock, flags);
> > -	idr_replace(&drm_minors_idr, NULL, minor->index);
> > -	spin_unlock_irqrestore(&drm_minor_lock, flags);
> > +	xa_erase(&drm_minors_xa, minor->index);
> 
> This isn't an exact replacement, but I'm not sure whether that makes a
> difference.  xa_erase() allows allocation of this ID again while
> idr_replace() means that lookups return NULL, but the ID remains in
> use.  The equivalent of idr_replace() is:
> 	xa_store(&drm_minors_xa, minor->index, NULL, GFP_KERNEL);

It does makes a difference, I'll change it to the equivalent.

> 
> > @@ -215,13 +204,10 @@ static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
> >  struct drm_minor *drm_minor_acquire(unsigned int minor_id)
> >  {
> >  	struct drm_minor *minor;
> > -	unsigned long flags;
> >  
> > -	spin_lock_irqsave(&drm_minor_lock, flags);
> > -	minor = idr_find(&drm_minors_idr, minor_id);
> > +	minor = xa_load(&drm_minors_xa, minor_id);
> >  	if (minor)
> >  		drm_dev_get(minor->dev);
> > -	spin_unlock_irqrestore(&drm_minor_lock, flags);
> 
> This is also not an exact equivalent as the dev_drm_get() is now outside
> the lock.  Does that matter in this case?  I don't know the code well
> enough to say.  If you want it to be equivalent, then:
> 
> 	xa_lock(&drm_minors_xa);
> 	minor = xa_load(&drm_minors_xa, minor_id);
> 	if (minor)
> 		drm_dev_get(minor->dev);
> 	xa_unlock(&drm_minors_xa);
> 
> would be the code to use.

Again, it does matter, I'll change it.

> 
> > @@ -1037,7 +1023,7 @@ static void drm_core_exit(void)
> >  	unregister_chrdev(DRM_MAJOR, "drm");
> >  	debugfs_remove(drm_debugfs_root);
> >  	drm_sysfs_destroy();
> > -	idr_destroy(&drm_minors_idr);
> > +	xa_destroy(&drm_minors_xa);
> 
> I don't know if this is the right call.  xa_destroy() is the exact
> replacement, but if the xarray should already be empty (and it should,
> right?) then asserting the xa_empty() is true may be the better call
> to make.

Yeah - I'll replace it with WARN_ON.

> 
> 
> Phew, that was a lot of comments/questions.  I hope that was useful!

Very useful indeed, thanks!

-Michał
