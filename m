Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCB07942B6
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 20:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8101210E6DE;
	Wed,  6 Sep 2023 18:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27D710E6DD;
 Wed,  6 Sep 2023 18:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694023475; x=1725559475;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5mYSscpHN/rbKeG4cMtA9L81E8I8UXJZYQfmP22G2Go=;
 b=cz906jMlxNJLO1aQLBJUqBl3aqzGTfkOXCyCunbqyO+gF8Puj3n6hiYN
 1zHq2KcwUrrPZxRnz2SCFhii0kZURhVW5GBBp6vjd9V9e9eMEFPqKLuaE
 fXNjgwIDWbA9k4yaud87Y/Zp1yYByvfeqErae4zNdAXDdo7SDzoOssDU0
 BA6S9hdiOUHbFF9xmLFHXDDr4nq2ZR4wPVPshxftJ7f8iXvltBzvQKCXj
 rFN4SJLt3OTGBXNJ1If6ulEPwZam/FzvBZF/r4xyrTv6nlroSMHnecsoI
 9/QXEgZhG8WCoc1h0xBxEEraTBFdZ7XJ6CAmCIulpdVfT+TOmuQl7m65m g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="357451809"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="357451809"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 11:03:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="770870880"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="770870880"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 11:03:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 11:03:55 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 11:03:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 6 Sep 2023 11:03:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 11:03:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NX5VJCaJaAW8JKmSF2r8/QZHgB/r2rqGKapkQy9JpKiswhh09s6DtYEhQmgX7swv46SXdjyZ2ZneoSqWk1GimtQq17m6hoht/fuCkgjcoJMaNfTG6xcy10ThOU52re6e5CwV6y8IC3LSTPQtbbYJPwi/nIGLU82+kp+DXV3SsP5kUj6ZgpAl2PUHiWgGmJ4AVGspFDpkxjz2IsfhWZiZ32wA9QacQEI/AbbRfLFZXOa3WCIvNrrT5M+yhcNx2nRfiWXsQxw+7Zld16NX7aBUjKuHdRFZBhFeatdH8cv7MDtDtIOTulR/WbMw6tvzrZDhVG9a0iCKwbUyERmkMlQ6FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pv1KOhCk++kSKQ2OFJYlOyOFK8CihMZvjV6OCbtPLcI=;
 b=UvRHaudLRggFcU9DQmqPB7Tog3vc1g4GAhqiIHilQvv6Zpqe6Wot2rt8t3lfvMc6WIfksjriPcoICrJ4bpCEUk6ibzAB5PhxK/Fhn2XgLSXQWwiKgCvhMtnzRe++rHz2quUKFqNdhLTCp3h5RiAPyZY1es0a7suosIDKoTO8juC1SESRh7iIUOd0aUaRaFYNI9739xNjLaF0rNsBmpLxWnMPnNBXM65Jf++aaU8jusGGHxIfiIiVLD7U5kOFIjdaKC0SvSjLghFTnZwEkDJr3FYvvsUawp+gS9cOVuY5s1gd1oR4K8LCGJXsM+xVnwZwdjOFKdcE+V0Pvwmcajp66Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7811.namprd11.prod.outlook.com (2603:10b6:208:3f9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 18:03:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 18:03:49 +0000
Date: Wed, 6 Sep 2023 14:03:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH 4/4] drm/doc/rfc: Mark GPU VA as complete.
Message-ID: <ZPi/ABw+wdTKLQA1@intel.com>
References: <20230829163005.54067-1-rodrigo.vivi@intel.com>
 <20230829163005.54067-4-rodrigo.vivi@intel.com>
 <ZPDnT72UCgOyY/YC@intel.com>
 <24e70864-ce64-f2c3-4a09-6f252a1c6080@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24e70864-ce64-f2c3-4a09-6f252a1c6080@redhat.com>
X-ClientProxiedBy: SJ0PR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:332::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f146be7-3a58-432d-4af4-08dbaf039efa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +IGdLU27pPa5Ly0yJ+KVtejfzIJOe1achjdj4nIpWDodiI9iPi18SKBhOoKKm4HE/YtteJNcPAbuRZ2oaiBAsQ0Fb0Z32LL5OMoWgibQ1JdLLDWYOf4/EXszO4HQdeH0uqLR8WRWPZIz0EU1MxgrMX+ROym3PmyQ3bJodtvdOiOphT0BVp8HvYWjbXXjB0wXdKKY4pWiaxZiWW9iTZZxx00hIBB5YPIZcmgTGpQX2jkebjh0OPmggX5Hy8KKxB0C6bN9yhHpNvsl0ROXJO6kys43DLvZwDP6Zvxg2s6Caai34O5nPutNRIGGE8CckSwe1gUaoN/4nKPW/elm/O+0qkJEEz8kK3mmQ7IBsVWnBrbsh/4QQR+67gH+x2r8MeZQH3wAaHr8ePJSAyW1YjnB9vJ4ViNK6Ar///k/ZYPXxcDwQhKgat0gTzZlH4yifyW4mEW/QFf2eKOpMN6WR7JMrejsSV4z+/r9feux+dbbIPKJJP+TzIo5r+hvrhQqCudX5z51sE5KtEy5HtkApBjC05fyP8pcM/TPrzEOwzU3eFi/7fxmucav3HUt6JJAL2rINZCUxEPOOyYtuoWkZ0/kcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199024)(186009)(1800799009)(41300700001)(38100700002)(966005)(478600001)(86362001)(6666004)(82960400001)(83380400001)(2616005)(26005)(6512007)(53546011)(6486002)(6506007)(316002)(66946007)(6916009)(2906002)(36756003)(66476007)(66556008)(5660300002)(8936002)(4326008)(44832011)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTc4ektROVFzNDNqV2l2Z1pTdmJqWkRIWVpBUXhCWWhYZDBOVk1uZVROSTkw?=
 =?utf-8?B?N1Q3NTNDWm03ckJZMjVNRTl0Y1ZHVGV6S2xrYnBWMVppU05yaGpCaGFKdkJK?=
 =?utf-8?B?SS9yeUViRzRXWVRPb25HYWZmQy81R1BCaE9LVERSYU1yODV3NVFlVTRuYzZE?=
 =?utf-8?B?Mk5MMVpVZHVIcXU0WFJXT0JWYmFzMi9uT2Y1elNLaXVXRUlzcDIycy9qV2hG?=
 =?utf-8?B?MXZXcWlXTXRXZlpMdEplcW5Kd0hYUUc1RmpVU1FaanRONFBTeHFXQzkvaUlv?=
 =?utf-8?B?c1g0TFRGRnJHWDZ3cDNPRzNwK0Iwa3ZvZ01sWWJxcFUxaW52V01NRndSNmpY?=
 =?utf-8?B?bEcvZzkvZ1doRHN3UkIzcXRORGRILy9uMjFDMzJScXVnRkIzRVEyaUw3MVAx?=
 =?utf-8?B?NlRKVlFxa1pIZTRnbmdSeUIyMGdBUkI4TVRaa2xSYmxyNHhnVVIrWm42VGF4?=
 =?utf-8?B?d3dqTWVnSU5SZmtlVTcydGNYZWVIQko5VVRlM0I5b3hMRitwdDJmWlV3aGJX?=
 =?utf-8?B?QkdVQWdaa0hTSVRQL0JMWUE1RzBHOWVKK0RqMkp4WXpUdU0vYmpMeEVvdnp0?=
 =?utf-8?B?MkVJMVpDemV4Y0F4dzBxb213RUhDazdDV0NFekxqK0MwSDVuWlFUWGxDQ0ZS?=
 =?utf-8?B?T2xQSDdCSVdtRDlLa2FSL0dmdW0rQlc4cy91SjUxc252OHV1d3oxT2VDbHVt?=
 =?utf-8?B?MjBoSlpEazhZVkhyelpLeUVDbGtKK21VY01lUDdLSEY2MUhYRUpEOXg4TjU0?=
 =?utf-8?B?MHc3bk4vNlNrOTJ2Q0FLU21lZjlrWElKeTZlbTZPb2pxeld5Q2E5NUxTWTZJ?=
 =?utf-8?B?UkRFcjlXR3hxTW9iVVRQVUlhODFhaE1QMWtnUUlYTnJmbUZnZ0QzdXVRNWZW?=
 =?utf-8?B?aWNrYVpHZXo1ZEd0R05mRHhqelVtekFDOVlMWm40WTVVZ0hCWEYya3cvVEw1?=
 =?utf-8?B?ZS95b3YwMFBOazNUUlYrTERQb01OeXhZV28wTmV4SVB0Z3JOaGdBdFFHd0cr?=
 =?utf-8?B?b201amh5TDA5ZnQ2VDVtWVpEVTZzZGQ3NkpJWmRqZTZ5K1ZJMzV0NEVGVjA4?=
 =?utf-8?B?d3JmbWxPY2lRYmRFd0Q2TVg3bHpTM1E1WU11aE1vWW9KNXdkK1o1ZWRTb2R3?=
 =?utf-8?B?QzAva0xPSHZ6SmgwT3dRQW5neExFUEpEOVRLYVZFN2t1M093aHFOOXVDcXQ4?=
 =?utf-8?B?M2o0bnAxSTMyNDVPSDB0TG5UcWU0M05TakF3bzQ4bkpsZHdzUDVXbUdweDNQ?=
 =?utf-8?B?NTdIY2VzSWlkQmVWaUs3SlZTMHNIazBzMjdFRmpVN1l4cmQ5S3JjNG95d0JS?=
 =?utf-8?B?OFJ3QkI0cXFmb2N0amhhQms0ZEJ6cVFScUtqeFgrc2pUd2ZsZkVKODEvUW13?=
 =?utf-8?B?N2FwZzJ5dTRnenBTcUdSK1h2R1krSzgxWmszS2lGK0dUek93eWNQWWdEcWFK?=
 =?utf-8?B?UzJuWXViNkp6MmFMc1BoTXRmcDRWdmp3R2g1YkVDcEQ0Q1FVb2ZzaFAxV0xE?=
 =?utf-8?B?emM1TE9zZmNGTE9OS1FJMXh5b1NSNnBDUjlIK0V3OUZvSTNpR3BCdE9nd0w2?=
 =?utf-8?B?bmNxSmJwRStodWt0MytoR1NORkgxT3FKZmhqanFPU2R5bks3K1lvdm0zSmYy?=
 =?utf-8?B?d2xSNnNCUkRTclBXUFJpZHNlUFFUaVAwOTEra1drelNUWW1QS01MVHFZYkNF?=
 =?utf-8?B?V1dveHdOVEx4MGkxSlIrMk42ei9zd29kQ3ZyUEc4eDVQcXdUeHlvZmNJb3Fk?=
 =?utf-8?B?ajdMVFFPRm51bVZSSTM4N1hSQkZRSFF0bjJyQnFUWWpvd0lPLzZVNExxVTdm?=
 =?utf-8?B?emYraWZBcmNOdWlHc2tSOFJCaTNBUHlPV1UzaVVCLzVJTTFpV2FyVVMrZWMx?=
 =?utf-8?B?RG16S1Z1cnkvWmJmRXk5dFhET1NWcGhLRjlxU1Fnajc0V2VqNW56Z01sOHZZ?=
 =?utf-8?B?SUxsV1N4bWQza0dpVmFHQzdIZTNGU2hseVdQd0RNMm16c09xZnZFencrNG1L?=
 =?utf-8?B?OEVzZE1ydFA4c2NhWmZCR0ZhV0V4SEg0dWs3alYrdDNYbXE1ZDFOS3BJTmZV?=
 =?utf-8?B?RlNMd2d0aGhZenNCUWFGamt3dkNTV3VLNEVtcjVSRkxlN3JTa0l6aEg0dmhR?=
 =?utf-8?B?dUVkNnc3WTcybTRla0o4Q0h6L09zdmd4RjBYYmc3cVZvV29VZUNEOFYxcDBP?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f146be7-3a58-432d-4af4-08dbaf039efa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 18:03:49.5825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rylO2bt9tZSP8czNHG7ufB+lQIC+fQYqoqTnHVDgFeHfXzXPeArtaryAeXkavMQ491ykCYqOQZLFbYg6E/ZqyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7811
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
Cc: daniel.vetter@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 04, 2023 at 11:39:55PM +0200, Danilo Krummrich wrote:
> On 8/31/23 21:17, Rodrigo Vivi wrote:
> > On Tue, Aug 29, 2023 at 12:30:04PM -0400, Rodrigo Vivi wrote:
> > > Nouveau has landed the GPU VA helpers, support and documentation
> > > already and Xe is already using the upstream GPU VA.
> > 
> > Danilo, although this is more on the Xe side and I wouldn't ask you
> > to review our code entirely, I'd like to get your ack here as Daniel
> > recommended. Meaning that we are aligned there and not creating any
> > change on top of GPU VA. Xe is currently using GPU VA directly without
> > any customization.
> > 
> > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/commit/ea4ae69e66b2940107e74f240ecb9dae87bf1ff1
> > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/commits/drm-xe-next?ref_type=heads
> 
> Acked-by: Danilo Krummrich <dakr@redhat.com>
> 
> Just one note: If we end up to agree on [1] few more adjustments are needed.

Thanks. I see Thomas is already engaged there and I believe it will be easier
to change that and align when we are merged. Since that appears to not
break any uapi.

> 
> Otherwise, same as the other commit, where is the paragraph going?

to the new
+Xe – Pre-Merge Goals - Completed
+================================
https://lore.kernel.org/all/20230829163005.54067-2-rodrigo.vivi@intel.com/

> 
> - Danilo
> 
> [1] https://lore.kernel.org/dri-devel/202308221050.kTj8uFMA-lkp@intel.com/T/#m7f3b5a7ff70723332adeea32671578cb95c62f7c
> 
> > 
> > > 
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >   Documentation/gpu/rfc/xe.rst | 36 ++++++++++++++++++------------------
> > >   1 file changed, 18 insertions(+), 18 deletions(-)
> > > 
> > > diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
> > > index a115526c03e0..b67f8e6a1825 100644
> > > --- a/Documentation/gpu/rfc/xe.rst
> > > +++ b/Documentation/gpu/rfc/xe.rst
> > > @@ -88,24 +88,6 @@ depend on any other patch touching drm_scheduler itself that was not yet merged
> > >   through drm-misc. This, by itself, already includes the reach of an agreement for
> > >   uniform 1 to 1 relationship implementation / usage across drivers.
> > > -GPU VA
> > > -------
> > > -Two main goals of Xe are meeting together here:
> > > -
> > > -1) Have an uAPI that aligns with modern UMD needs.
> > > -
> > > -2) Early upstream engagement.
> > > -
> > > -RedHat engineers working on Nouveau proposed a new DRM feature to handle keeping
> > > -track of GPU virtual address mappings. This is still not merged upstream, but
> > > -this aligns very well with our goals and with our VM_BIND. The engagement with
> > > -upstream and the port of Xe towards GPUVA is already ongoing.
> > > -
> > > -As a key measurable result, Xe needs to be aligned with the GPU VA and working in
> > > -our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
> > > -related patch should be independent and present on dri-devel or acked by
> > > -maintainers to go along with the first Xe pull request towards drm-next.
> > > -
> > >   ASYNC VM_BIND
> > >   -------------
> > >   Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
> > > @@ -230,3 +212,21 @@ Xe merged, it is mandatory to enforce the overall locking scheme for all major
> > >   structs and list (so vm and vma). So, a consensus is needed, and possibly some
> > >   common helpers. If helpers are needed, they should be also documented in this
> > >   document.
> > > +
> > > +GPU VA
> > > +------
> > > +Two main goals of Xe are meeting together here:
> > > +
> > > +1) Have an uAPI that aligns with modern UMD needs.
> > > +
> > > +2) Early upstream engagement.
> > > +
> > > +RedHat engineers working on Nouveau proposed a new DRM feature to handle keeping
> > > +track of GPU virtual address mappings. This is still not merged upstream, but
> > > +this aligns very well with our goals and with our VM_BIND. The engagement with
> > > +upstream and the port of Xe towards GPUVA is already ongoing.
> > > +
> > > +As a key measurable result, Xe needs to be aligned with the GPU VA and working in
> > > +our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
> > > +related patch should be independent and present on dri-devel or acked by
> > > +maintainers to go along with the first Xe pull request towards drm-next.
> > > -- 
> > > 2.41.0
> > > 
> > 
> 
