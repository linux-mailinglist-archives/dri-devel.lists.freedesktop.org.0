Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C85092B995
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 14:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3F710E04B;
	Tue,  9 Jul 2024 12:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="DAoFH4lN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF4C10E04B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 12:35:45 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469BB9X5019019;
 Tue, 9 Jul 2024 14:35:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=selector1; bh=xL7gSE037cQc+udtp5aRXcyP
 CiEsUKe1LlWNxsNYELY=; b=DAoFH4lNp+R9Ryuw8sGmHWe6ApeRTbyoEDN0tEWz
 M7Ygjbf8Z4z0dlq0U6vKWWC0J6njhFQwBJaFbDE51BGfJ1UP0GjdrGJUMo5ORuyw
 E6attc+ka3Qqk8LezXZjwsr8oJMIZHcdRobS/gRDWumo8QnMs6ju3I7ikOUwqEm7
 z6ys0sZH+YkpIAw/iMJAk++1g6v9iY4WcDuvsd7IwQ+5t6jd5Z8zqXldvsAEbOGe
 riUDj8OhydMv7cG2eRHCQwyAyKLtptNDXLxHQrZXQp0eqvqj/ik8zvHkvAFR7W4O
 WjTuKKS8aH8wtmTMflVO48f41tHM9HjjMBBTDKn5KCHdzg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 407fg0hutq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jul 2024 14:35:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3607540044;
 Tue,  9 Jul 2024 14:35:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F9AE226FDF;
 Tue,  9 Jul 2024 14:34:43 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 9 Jul
 2024 14:34:42 +0200
Date: Tue, 9 Jul 2024 14:34:34 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Maxime Ripard <mripard@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Philippe CORNU <philippe.cornu@foss.st.com>, Yannick FERTRE
 <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH] MAINTAINERS: drm/sti: mark it as Odd Fixes
Message-ID: <20240709123434.GA58085@gnbcxd0016.gnb.st.com>
References: <20240705100356.16760-1-krzysztof.kozlowski@linaro.org>
 <ZofW1v4uEFo9GscF@phenom.ffwll.local>
 <20240705-hysterical-beluga-of-courtesy-38b2e2@houat>
 <ff8b84c9-5bef-4cb9-a10b-b3bb1a017366@linaro.org>
 <Zof4Bp82iu7hZsSZ@phenom.ffwll.local>
 <20240705151436.GA3949471@gnbcxd0016.gnb.st.com>
 <20240708-industrious-paper-wombat-ef3ff3@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240708-industrious-paper-wombat-ef3ff3@houat>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_02,2024-07-09_01,2024-05-17_01
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Mon, Jul 08, 2024 at 04:57:49PM +0200, Maxime Ripard wrote:
> On Fri, Jul 05, 2024 at 05:14:36PM GMT, Alain Volmat wrote:
> > Hi Krzysztof, Daniel, and Maxime,
> > 
> > On Fri, Jul 05, 2024 at 03:41:26PM +0200, Daniel Vetter wrote:
> > > On Fri, Jul 05, 2024 at 01:33:38PM +0200, Krzysztof Kozlowski wrote:
> > > > On 05/07/2024 13:22, Maxime Ripard wrote:
> > > > > On Fri, Jul 05, 2024 at 01:19:50PM GMT, Daniel Vetter wrote:
> > > > >> On Fri, Jul 05, 2024 at 12:03:56PM +0200, Krzysztof Kozlowski wrote:
> > > > >>> Patches to STI DRM are not being picked up, so even though there is
> > > > >>> maintainer activity, it seems that these drivers are not being actively
> > > > >>> looked at.  Reflect this in maintainer status.
> > > > >>
> > > > >> Note that since the driver is in drm-misc, other committers can also pick
> > > > >> up patches and push them. Both Neil and Dimtry have commit rights and
> > > > >> should be able to pick up your patches for you, if they get stuck.
> > > > > 
> > > > > I've applied the patches.
> > > > > 
> > > > > I don't think we should merge this one though, a one-off mishap can happen.
> > > > 
> > > > Sure.
> > > > 
> > > > Folks, maybe then pattern in maintainers should be somehow changed or grew?
> > > > 
> > > > The recommendation to all submitters is to use get_maintainers.pl. b4
> > > > also does it. In this particular case, using get_maintainers.pl or b4
> > > > will result in patches not being picked up.
> > > 
> > > I think get_maintainers.pl is correct: You get the driver maintainer, plus
> > > drm-misc maintainers as official fallback, plus Dave&me as fallback of
> > > last resorts. So all correct.
> > > 
> > > What's special with the commit rights model is that other committers that
> > > work all over the subsystem can also pick up the patches for you, so that
> > > the drm-misc mainters don't become a bottleneck. But the ideal person
> > > there are drm-misc committers who work in your team or company, or someone
> > > else where you have some goodwill credits to spend with and ask them for a
> > > favour. And there's just no way to model that and make sure the script
> > > gives you the right suggestions.
> > 
> > Many thanks for all your emails and your support.
> > 
> > In the past, I've never committed patches to drm-misc myself and, to be honest,
> > missed the point that as a drm driver maintainer, I should also do so.
> 
> Are you saying you don't have a drm-misc account, or that you don't want
> to participate?

I don't have (yet) a drm-misc account.  But following recents email exchanges,
expectations are now clear so I will request an account in order to merge as well
patches of drm/sti.

Thanks a lot Maxime for all the explanations.

Alain

> 
> > Thanks to recent discussions, I now fully understand how it should be done.
> > 
> > That said, since the volume of drm/sti patches is rather small, I will
> > from now on request help for commit from drm/stm (Philippe, Yannick,
> > and Raphael) and drm-misc maintainers in a more "pro-active" way :-)
> > 
> > Sorry for the inconvenience, and once again, many thanks for your
> > support.
> 
> Sorry, but the expectation is very much that you merge at least some of
> the patches for the driver you maintain, and not just rely on someone
> eventually picking it up.
> 
> Maxime


