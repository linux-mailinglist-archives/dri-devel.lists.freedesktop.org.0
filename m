Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60224CDC2D6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 13:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61ABE10EFD1;
	Wed, 24 Dec 2025 12:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=veygax.dev header.i=@veygax.dev header.b="FWTsFneU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244104.protonmail.ch (mail-244104.protonmail.ch
 [109.224.244.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111DA10EFBD;
 Wed, 24 Dec 2025 12:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=veygax.dev;
 s=protonmail; t=1766578054; x=1766837254;
 bh=sWwI4o499TZh/aJYoMPPUZGIMI7Kvm3jNl6akq2JPVw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=FWTsFneUrpMVCl8GFx0t8en+MdWeHNDV1YZiNI6OT0pHvGCiVQuGCN4aZkp/NTFfy
 KrAEKikwa+AVl15t39A4kS3qfdfYdvV8AsllDQce2LO/ZxW8mBfOYAK/xO17vdzPRI
 c0AJSBjqui2Y5/AUzQgil8L8ZwYOCumfyfuHgBE2kgKoDi3MX6lwYuFlrbubcVDvde
 U3VNNnimlOWq12fWsQnPuf3FBcE8+1sfMrtzu+MUz4qAIFhcgbl/l76pbOxsD7cI/q
 //PW+ZAThG4rHQGwgphUAnD1PDydLMACpszPI37fWyHdG1E52B1ZjCD13oRxF8VNOO
 T21byZWcI1hwg==
Date: Wed, 24 Dec 2025 12:07:29 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 robin.clark@oss.qualcomm.com, lumag@kernel.org
From: veygax <veyga@veygax.dev>
Cc: abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Replace unsafe snprintf usage with scnprintf
Message-ID: <a5b8cf57-8697-49ba-b225-ec735bb4e337@veygax.dev>
In-Reply-To: <176656845704.3796981.11008925293580480750.b4-ty@oss.qualcomm.com>
References: <20251130012834.142585-2-veyga@veygax.dev>
 <176656845704.3796981.11008925293580480750.b4-ty@oss.qualcomm.com>
Feedback-ID: 160365411:user:proton
X-Pm-Message-ID: 3ad0eae39b17dc513940a2b0790d259d64335f94
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On 24/12/2025 09:27, Dmitry Baryshkov wrote:
> [1/1] drm/msm: Replace unsafe snprintf usage with scnprintf
>       https://gitlab.freedesktop.org/lumag/msm/-/commit/093cbd754382

Hi Dmitry,

Apologies but I've just noticed that I signed-off with my screen name
instead of my real name. Would you like me to submit a patch V2 fixing this=
?

--=20
- Evan Lambert / veygax


