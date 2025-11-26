Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10405C8C3B4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 23:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0BF10E6F9;
	Wed, 26 Nov 2025 22:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="dF40XHLI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244104.protonmail.ch (mail-244104.protonmail.ch
 [109.224.244.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A18110E6FE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 22:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1764196706; x=1764455906;
 bh=06MEF8AcuUpShTtyXFUwYObeJ4lAsK+qXj1Fh6uGpRo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=dF40XHLIvxCBnhgS8wT3v6aXWhhji2NkYx8fSGekkakrvdimrWuNR++6SEFiZOoiZ
 OaGukqiNuM6/6FEwoJxg6cwPLbKm4vHH6Q5lW59DLJprk0Ek8dZrY/8DkJMtPHtrdH
 8hmarnGoTAUQw4pTdazmhJMDfotPHE2Xto27i0iYH1r+UnOVRD7kCnbDrF59Q3wlkA
 A+0+6UAlESFZ1/sOYJmh6+dJs6ZVx59rVlvWCl0/dE1ZPhWHM/cPy26W2NQB3FdHBY
 ezteEUfsfnpVScrOY6q9AevmFA19uSveJNRchjq0nvI7ynSotRhxXqaCmL3cCnm4tP
 Vc/TgvqFcziNQ==
Date: Wed, 26 Nov 2025 22:38:20 +0000
To: Louis Chauvet <louis.chauvet@bootlin.com>
From: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 xaver.hugl@gmail.com, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, mcanal@igalia.com, nfraprado@collabora.com,
 arthurgrillo@riseup.net
Subject: Re: [PATCH V13 00/51][FINAL] Color Pipeline API w/ VKMS
Message-ID: <6QY5Z1orPMIPt_9Gn1wlXHSZHCPaaFuECJl_lVkAAdMUaBxGELZdG2NTHjg7vRV8MaKa0EU1MO9DOnuI4Pzsjej4GuC10FsnqdaVTvWFWBk=@emersion.fr>
In-Reply-To: <2270bad3-8634-438a-aa16-2092398e271b@bootlin.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
 <cbe00ac4-a535-47d3-813a-e2eda7e9b991@amd.com>
 <d8360e9c-502d-4003-93ab-9afd8d716c49@bootlin.com>
 <cb13dd25-82b6-4d8d-a8f2-a9a31ef2e73d@amd.com>
 <ecf54c45-4b45-4fb4-a102-46ce9e1de3a5@amd.com>
 <2270bad3-8634-438a-aa16-2092398e271b@bootlin.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: acbab64dd232884748aa287fa9d5454026321f3c
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

I've cleaned up the checkpatch warnings (mostly whitespace changes) and
pushed the series to drm-misc-next. Thanks everyone!

Simon
