Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8317CFC5D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 16:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22FE10E4F4;
	Thu, 19 Oct 2023 14:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7DD10E4F4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 14:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1697725360; x=1697984560;
 bh=BZ8m8hzLlbVZD5/QhXKn58C893KnGUrMpTj8JXVT2AQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=H1+Oki2gdHeuc6uivf186YbX2aVRFqzk58KCtapUjdpyeKLfc5ViwjbyW2II5GrTa
 /yR0xnHBhij7EQ2JA5fZaDKvuYEFJVMkre4vMlYsGIO2ell5EmA1iwOLN40tEQJqni
 G1KRtiMj0y6IpDTlq4w/S7tenbCaccDBpYGAlRTRSWQE2Jzi/fxyXRvYlbLKbviMRr
 3aHhp8IQIN+bfXRDhznoO98LLye2JlbEM1qFz/FP5TkS2exNtNPbrvtS79rFCR0V2n
 YYxjTVAJeUoNV2w4FC7qpiQDdab95M1YE59+q9wIMhAzU6lgGJU7LvO2s7+HRfhs1B
 tEmNUaSoNn/Fg==
Date: Thu, 19 Oct 2023 14:22:28 +0000
To: Jessica Zhang <quic_jesszhan@quicinc.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH RFC v6 01/10] drm: Introduce pixel_source DRM plane
 property
Message-ID: <DrmsyZK_ptUMO9pdU0ESXgVdv4Mjhp_A5A0x6U4N3HoKNQZKfU4E4xNPN-PXa4gpxqk-Urv8-9mWWTK8GUcadIX61FttgzCJOL-Nszh0n9w=@emersion.fr>
In-Reply-To: <20230828-solid-fill-v6-1-a820efcce852@quicinc.com>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-1-a820efcce852@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, sebastian.wick@redhat.com,
 ppaalanen@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the uAPI:

Acked-by: Simon Ser <contact@emersion.fr>
