Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 514AF7D9B07
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 16:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0066710E03C;
	Fri, 27 Oct 2023 14:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 345 seconds by postgrey-1.36 at gabe;
 Fri, 27 Oct 2023 14:19:38 UTC
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD8B10E03C;
 Fri, 27 Oct 2023 14:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1698416377; x=1698675577;
 bh=clYYIFz/CcY8mTw95VOFnf9GIUJHbDvjIe6G5SgzFsc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=CHV2U0uFF4BNo+f1NeWZh3JIY3G2k2fNhAPJkuuqe27LN93vOFi3oIkUk/RzZDcIb
 REekAEU5FbZwpb4JWjlCtcmLag/tFReuv+Vi6EA+DxhdhsxtkcPIzBbeF+25TCiBhN
 SCg1vDzD+jOsaiqY3MMInfZUNsN9kJDGNXWMLKI5ojQMz7qaqjwfH6IX0leUdabHOW
 khPdXIbhUxt1WNDUioTLMBdw3IJ2oRoVtrP0qlKnUSdBr8Zm8ozqmKCLAbsFf2WWmb
 SBWK81OGPIlTnfukGdZuT/1hNWUdu3sLcxcRTJX5+YipZmoLtK5TCUSjyaiPNjUOZY
 HVFWeBo8tk6LA==
Date: Fri, 27 Oct 2023 14:19:26 +0000
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH v2 03/17] drm/vkms: Create separate Kconfig file for
 VKMS
Message-ID: <tm2fb-ku7lG8o3d8fNANAa6P9x8oQ0spekx4XjJ2v6qJbL7TexYPds_bxFZgENhz32yOHRZmF5_r8kf_9OxZ2UJEtuDRx75iKKmmGUBsudk=@emersion.fr>
In-Reply-To: <20231019212133.245155-4-harry.wentland@amd.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-4-harry.wentland@amd.com>
Feedback-ID: 1358184:user:proton
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 =?utf-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Aleix Pol <aleixpol@kde.org>, Christopher Braga <quic_cbraga@quicinc.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Hector Martin <marcan@marcan.st>, Xaver Hugl <xaver.hugl@gmail.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, October 19th, 2023 at 23:21, Harry Wentland <harry.wentland@am=
d.com> wrote:

> +++ b/drivers/gpu/drm/vkms/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0+

It seems like the original Kconfig uses GPL-2.0-only. I think it'd be
safer to just re-use the exact same license here?

With that fixed:
Reviewed-by: Simon Ser <contact@emersion.fr>
