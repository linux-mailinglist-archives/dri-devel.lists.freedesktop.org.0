Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBFC452C4C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 09:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F61B6EDA2;
	Tue, 16 Nov 2021 08:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEA36E8CE;
 Tue, 16 Nov 2021 08:01:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnzepoWojghugJLllPi7i8IIOeoUBHMB1DMrWbJLFMyLKb2S9mc0LDH4FbOjSvOP7gIRca3ipxB8bbD9R0obcMt9jAUeK5NVrIVi1BnOXlBRLtKjtS9e0MdBCBrVbsTSFDkER2XEwJL2JZYrd2A2TiE1e698zW/GewgETNzsuCAR0w90MnKr7qrZfwzoBx7clMYt/PqK6rauowhsF0XqvpwwuIlYCLUnTg7indDRi6yIWsVhYhi4NC5kGdBD2Cj06c+MTjd+6AVVhDYzM32aQHH/z7OnNRS6rTcYRANEBypOKJ73edJVUCVQvmEpLlCGl6yPE2L+g9YNnUI/R4MNDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3rqjOWJkpl8Lwzo3CD/iemNVUkgaWQpZ1JvGOKFl1o=;
 b=bDO1Z0HPih+csXdq7UA7x/O8WJALQC3ON6pf5RIgsLUKfy40m5Jfn+/GQ06mFIouFUAEirpUFv1B2kgLH4RGRYD/ZV4Ft45NpVlMQfoCwQ/xaP2dJasR4KDVfdTDwp/ayvWoRxEjY3z4LgPvaCute0mciOC51j+LRgsjpD6mjDa5KCrWoT3B56JWC9QvMlkAzeaBfrUwL21OAloXb5lDyy2ULew1EnUnfzGOCu/nNeSieCKA/kkotx0UsZAkRrSUBP56G8lRvh/hoAt6W9AXJjsLKJcRG4onHm0WfiZ4sEa4ZVTq/BkK4MgMJUqhiZo/mcNAKtTkrPj3opCAQaHQ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3rqjOWJkpl8Lwzo3CD/iemNVUkgaWQpZ1JvGOKFl1o=;
 b=eA9EJon4teQ3Bgaec2ftipGZ1sUqu8YSwo/FqsNZpIMNAh+Nh0GusIEVpENKX0q09znsa9VlDeVAOF1+viBVe9xGaM+D/YYY0D6Gg0j5p6cTE+mjdIAcGxdSICOHhswKfgQxiWS9ffUYAcYhSsYIN2HWa8hCRt45x3bYRe+KRGE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) by
 DM6PR12MB2938.namprd12.prod.outlook.com (2603:10b6:5:18a::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.16; Tue, 16 Nov 2021 08:01:00 +0000
Received: from DM6PR12MB4250.namprd12.prod.outlook.com
 ([fe80::711a:4c44:b4a7:4afa]) by DM6PR12MB4250.namprd12.prod.outlook.com
 ([fe80::711a:4c44:b4a7:4afa%8]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 08:01:00 +0000
Date: Tue, 16 Nov 2021 16:00:19 +0800
From: Lang Yu <Lang.Yu@amd.com>
To: Christian Koenig <ckoenig.leichtzumerken@gmail.com>
Subject: Re: Questions about KMS flip
Message-ID: <YZNlE9bZSJmTvS6d@lang-desktop>
References: <735f8781-982b-a09f-32fe-fded0024a587@gmail.com>
 <58097218-40dd-55fd-32d2-2a299d39230f@daenzer.net>
 <YZIA/dkvjuMsup24@lang-desktop>
 <cadb9503-b390-e254-ffba-5e2e11f100cc@daenzer.net>
 <YZIiqM6PKKL/ZMNy@lang-desktop>
 <f1b88742-b07e-5973-1e30-9674a5950bf3@daenzer.net>
 <YZJFHMEqm1oz7QJN@lang-desktop>
 <e44a237c-0073-2eec-1a47-c5faf99f77b4@daenzer.net>
 <YZMlGSA9iG3aVCUu@lang-desktop>
 <391ee32e-f1b1-d92b-c9f3-17dbc0a9d690@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <391ee32e-f1b1-d92b-c9f3-17dbc0a9d690@gmail.com>
X-ClientProxiedBy: HKAPR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:203:d0::27) To DM6PR12MB4250.namprd12.prod.outlook.com
 (2603:10b6:5:21a::9)
MIME-Version: 1.0
Received: from lang-desktop (165.204.134.244) by
 HKAPR04CA0017.apcprd04.prod.outlook.com (2603:1096:203:d0::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Tue, 16 Nov 2021 08:00:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99b9b1de-2476-451b-83ff-08d9a8d73a32
X-MS-TrafficTypeDiagnostic: DM6PR12MB2938:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2938C77AF46984931FF91DFEFB999@DM6PR12MB2938.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ra4rQw/WwUuAzDTLQ+yc13mAQg+its5bljn1qNZ2NP+x22JLbnW036vhSRNKBlkylxdSWx5u/MCAw7B3nIpEYLJH/b+1R3p6hrI5W19Phq0ZIirnmmjM1ne1bGDercnJbiiZGBFVMDNYfk423JOWdMI0b8fh2HBvDBYnY1rKz/eX09aP1x4ipp6anm8EeMU2eAc+COP7jHmXizsJk5RKGA7Xg73jaN8142quCY/ExdILCRpAfxnzkOyWq1dDxvlPCfSnG8Ui0iAE3J3149SrbtNhfVUFlyidOL5HHuoyOK1736FQlM1Nu/515PSZyDJ7PV5RiPFmZcakUzMOstfGG2bkh8xk41e+9BWays6o5iDoOk5YF9+rkx9uocH7eVxR1jBkkGhRhGcyVUOxZ4jX3gk+3T8hs6GGDdg1TxGuYzvra27X2HL/Rsh1aPRLvXDwM8M2ZCvgSk4xj4KCHvVsD1EtyuR1ZkLkCfFNH3gN5ZuKoh6HTvRtEAB3NjTbk+stiQaZ6lp45dufASb2r2ES5lkrTbuja8Ix0gVDHbI8AjG/7xDFS8ADJsgP8/M1fPVIHamQr9wJinZxqHZYT7zJcinb2KBuM0vmC5NFGV47BiStcDucmbJsV09ug0CXLYjrO2jdVPtY7pvCSJVABqXaEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4250.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(86362001)(33716001)(38100700002)(9686003)(956004)(6496006)(3480700007)(186003)(316002)(83380400001)(55016002)(8676002)(4326008)(2906002)(508600001)(6666004)(26005)(8936002)(6916009)(54906003)(66556008)(66946007)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vvpkEBwDDoY7zIl7jlAHAvNeA11wcHGTdmfjNiSccE0hNWZoQbx2fR40dq5C?=
 =?us-ascii?Q?qaca4mQHcdVLPJH0lE1lUs2ddQO6GI/0RZ0hJu1+3SJu+ilzFdSJNwzvNNrQ?=
 =?us-ascii?Q?fIJJFz8qyiT2rhWcx56UHNKSfRxteOAA2QBwI0XRJkHtc2XnfZf7PlpW90ho?=
 =?us-ascii?Q?jjHIwJS0TRz1a7AlTk9C/U/ms5l5J4Uf4LaGspqfZ+DXipWn+6wIX121xQCI?=
 =?us-ascii?Q?ZI8ohPkyfXuBi82FDNWebjFYYYWheoe+FGEi4KLlYqFkkW2xzw12JhpHZMzu?=
 =?us-ascii?Q?yuTZ3F/3Rso7WfFslMGVvr8i4yBf3/NOqrRpVIJXhD8DyVv6w3NYZxg6HHHB?=
 =?us-ascii?Q?O1ldN0STTfBHAAawExjjVJ43Tf0kNT16Y3hN5rk1cPjgKC8P9Oz1XUQD+ntk?=
 =?us-ascii?Q?x9St32PItZrq3sk/bDWDH9NwMrjSYAslsfvIwCsQL4mJ4r2Wn48DZxnBAAyX?=
 =?us-ascii?Q?tkP7CyN7YYjLxALBtY6LFej7jAFc9rUQfn53Sq8NGaDtWAtQitFX+006u2yK?=
 =?us-ascii?Q?Fsqzrj3mel4Sg4ZwS8ZRS4ui2OJxRZoI487FFkM5pyYW2Qi9bL1L8TI/z3Wp?=
 =?us-ascii?Q?tXygb/B9clysdJE56IYTp3SpuDZVI3eXkggb6HRK/rNCdZuVTbodvPxOF7U3?=
 =?us-ascii?Q?hg3W0C7xGszVS8osgnxWgNwa+s+fdOjTwJX4SZgMmxgClcWXUcOT4sgPlg35?=
 =?us-ascii?Q?ALGyxHq5OM5hoNGYd7eZgxdOoNVITFKGXzKO2qmSe6ZrDdJ0sjIm9h1eoLll?=
 =?us-ascii?Q?eky1cfaV8Rx69TU7OvWMRLe0gd8a+gsvnYxCD/DtfzABsWDAz9u54FBLFuiS?=
 =?us-ascii?Q?ikHWEB7JSSZfwjZpMsTsbFE1+hQyMd5R6/J/PSARJSBK2hGuhWJQQ56g5Ztf?=
 =?us-ascii?Q?lZK2cmGu/GVpoMGxgR2r3qnnoLXU/00FYU+YgGH9GJVgrve3qPrV8VWF1DAO?=
 =?us-ascii?Q?qIl9m9C8pLpiovKslc2fKlVVP4BLTpsG51rKtuv3w/1IdMrtDxPGZYT4bX2H?=
 =?us-ascii?Q?uCOQjJx0nOxC9pFREUCxauAVASDbmZU9dj4kE69FLYPKfCSYXhQeqLuPRJ3w?=
 =?us-ascii?Q?DcbZJmgt9hqQJgQoRdBpwlRyir4WKw5bysq2y4alfoSTHhWQcufTjW1LXXKG?=
 =?us-ascii?Q?KiSlrJoHRz3axbWDyoZSxJjF5tZvSWL9zJrEWL7rO24eft4lUWMaXtVgenRq?=
 =?us-ascii?Q?CnyIlsnWHsV4f+oKVD8TG5Ul3j2qY93KlNRsks7vwwLIJiZla0WV+mZPpi66?=
 =?us-ascii?Q?MJ2YghM1d8XYdK0DHnOkQX5+QO9cxaVhaGFMF63vsj0gm8HSM03txIRlw7Bf?=
 =?us-ascii?Q?f4/CpIwWP6NHrT4jTKLa0DEs64p0PI72m4ytW89kM08pQG2j5Pt9QHmlI//A?=
 =?us-ascii?Q?FdEj7Hy7fEurIF0R0xohJHljanWKsXYMlQ87c5oADfU2JBXSmCx+Zy+peMDx?=
 =?us-ascii?Q?zJoZ8ECf8LYo8WlCcx5LZKgMW653Qf3JqtH0C3ZjaE1xF36eqJE2Ut8uwO0t?=
 =?us-ascii?Q?bTf4M1I4xzscj0kBY+2PGUtxTZ6b5K1s3Qjh9fMQZWaGprVXR5B5pKQz89bx?=
 =?us-ascii?Q?lWAI4P+C5v2LtfVwlf3c4069BZqLoS0DJUVHTifYUl8yVYmXU5O3CRLkMJOG?=
 =?us-ascii?Q?zMC52i+EHaSIpZquADO4Pjk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b9b1de-2476-451b-83ff-08d9a8d73a32
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4250.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 08:00:59.8883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4v8S7ps2z5GD3xrJM6t7BsmSzkhxXy6K26Dsh0lh72n/NoElny+XPsK28LGmQ2iizNt/tlUEvQADkURY2X+xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2938
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Michel DDDnzer <michel@daenzer.net>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian KKKnig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 16, 2021 at 08:14:08AM +0100, Christian KKKnig wrote:
> Am 16.11.21 um 04:27 schrieb Lang Yu:
> > On Mon, Nov 15, 2021 at 01:04:15PM +0100, Michel DDDnzer wrote:
> > > [SNIP]
> > > > Though a single call to dce_v*_0_crtc_do_set_base() will
> > > > only pin the BO, I found it will be unpinned in next call to
> > > > dce_v*_0_crtc_do_set_base().
> > > Yeah, that's the normal case when the new BO is different from the old one.
> > > 
> > > To catch the case I described, try something like
> > > 
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> > > 
> > > index 18a7b3bd633b..5726bd87a355 100644
> > > 
> > > --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> > > 
> > > +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> > > 
> > > @@ -1926,6 +1926,7 @@ static int dce_v11_0_crtc_do_set_base(struct drm_crtc *crtc,
> > > 
> > >                  return r;
> > > 
> > > 
> > > 
> > >          if (!atomic) {
> > > 
> > > +               WARN_ON_ONCE(target_fb == fb);
> > > 
> > >                  r = amdgpu_bo_pin(abo, AMDGPU_GEM_DOMAIN_VRAM);
> > > 
> > >                  if (unlikely(r != 0)) {
> > > 
> > >                          amdgpu_bo_unreserve(abo);
> > > 
> > I did some tests, the warning can be triggered.
> > 
> > pin/unpin operations in *_crtc_do_set_base() and
> > amdgpu_display_crtc_page_flip_target() are mixed.
> 
> Ok sounds like we narrowed down the root cause pretty well.
> 
> Question is now how can we fix this? Just not pin the BO when target_fb ==
> fb?

That worked. I did a few simple tests and didn't observe ttm_bo_release warnings 
any more.

The pin/unpin logic,

1, fist crtc_mode_set, dce_v*_0_crtc_do_set_base() pins crtc->primary->fb(new),
old_fb is NULL.

2, second crtc_mode_set, dce_v*_0_crtc_do_set_base() pins crtc->primary->fb(new),
unpins old fb.

3, amdgpu_display_crtc_page_flip_target() pin/unpin operations.

4, third crtc_mode_set, dce_v*_0_crtc_do_set_base() pins crtc->primary->fb(new),
unpins old fb (it is pinned in last call to amdgpu_display_crtc_page_flip_target)

5, amdgpu_display_crtc_page_flip_target() pin/unpin operations.

.....

x, reboot, amdgpu_display_suspend_helper() is called, the last pinned fb was unpinned.

And I didn't observe amdgpu_bo_unpin() in dce_v*_0_crtc_disable() is called.

If the logic is wrong, please correct me.

Regards,
Lang

> Thanks,
> Christian.
> 
> > 
> > Regards,
> > Lang
> > 
> 
