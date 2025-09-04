Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCEAB432AB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 08:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A1910E97A;
	Thu,  4 Sep 2025 06:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="QcCwCcTL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DFC10E97A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 06:40:46 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250904064044euoutp017c59de00acd45c2541bb788cc045bb1c~iASCwqghV1482914829euoutp01o
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 06:40:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250904064044euoutp017c59de00acd45c2541bb788cc045bb1c~iASCwqghV1482914829euoutp01o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1756968044;
 bh=A/yDGtDHqTHoPVxQFOAkkIfF4zIy3UZ0vUKDgsqqVOc=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=QcCwCcTLjQhAJBgjfcjHoBleYj4ltUDCEaUZJOMVDss/gKJSWYHjYpNOWQAVkJiVc
 jwhEHY1qQfXL/ywyJ/C47pdoWEkGIt8ea2MbcgYn1yBHUsd5cOwEnItFQFZCfKh4FG
 9jmQa351xLqb/mMwR47RWNj2RqqZzqnX9Mg0+8Bk=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250904064044eucas1p1903e2408a311a9a88aa7459c078f0ca3~iASCdUNGL3162431624eucas1p1k;
 Thu,  4 Sep 2025 06:40:44 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250904064042eusmtip130798f35ba17f7345464a545efd3511c~iASBRoIaA0826508265eusmtip1S;
 Thu,  4 Sep 2025 06:40:42 +0000 (GMT)
Message-ID: <532937cb-fa69-4010-b2cf-cba9a2e6c730@samsung.com>
Date: Thu, 4 Sep 2025 08:40:42 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 3/3] drm/bridge: sii9234: use extcon cable detection
 logic to detect MHL
To: Henrik Grimler <henrik@grimler.se>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-samsung-soc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 replicant@osuosl.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250903193231.GA5526@l14.localdomain>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250904064044eucas1p1903e2408a311a9a88aa7459c078f0ca3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250824111745eucas1p20e336aecd501200bdd035bfc30ce1e63
X-EPHeader: CA
X-CMS-RootMailID: 20250824111745eucas1p20e336aecd501200bdd035bfc30ce1e63
References: <20250824-exynos4-sii9234-driver-v3-0-80849e716a37@grimler.se>
 <CGME20250824111745eucas1p20e336aecd501200bdd035bfc30ce1e63@eucas1p2.samsung.com>
 <20250824-exynos4-sii9234-driver-v3-3-80849e716a37@grimler.se>
 <ac222017-d4e2-4fa7-beed-cc6b73042a73@samsung.com>
 <20250903193231.GA5526@l14.localdomain>
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

On 03.09.2025 21:32, Henrik Grimler wrote:
> On Mon, Aug 25, 2025 at 04:16:50PM +0200, Marek Szyprowski wrote:
>> On 24.08.2025 13:16, Henrik Grimler wrote:
>>> To use MHL we currently need the MHL chip to be permanently on, which
>>> consumes unnecessary power. Let's use extcon attached to MUIC to enable
>>> the MHL chip only if it detects an MHL cable.
>>>
>>> Signed-off-by: Henrik Grimler <henrik@grimler.se>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>
>> On Trats2 board the status of HDMI connector is no properly reported as
>> disconnected when no cable is attached.
> Thanks for testing (again)!
>
> In what way is it not properly reported as disconnected, are you
> checking some sysfs property, or with some userspace tool?

Huh, my typo. It should be 'connector is *now* properly reported', 
that's why I gave my 'tested-by' tag.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

