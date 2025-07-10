Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA9EB00C74
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 22:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF65310E056;
	Thu, 10 Jul 2025 20:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="gS/BsRFs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch
 [109.224.244.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC9A10E056
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 20:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1752178065; x=1752437265;
 bh=9Yd4rh1XhHFxTtLmOacPRTSGxjELViwvSgavEJBYZ3s=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=gS/BsRFsoIPvpCFDqzmuvAuZnCXAAzEEr77w2wy1jB6NFJq892m/ZAYvVVTNGuBCm
 6ghAfoMm4+YZnZxSvvWohjpgTWZxfAAs92xnfRzr3wu04ttWNz98X9ydO9A5A/mVSV
 GZyAffDczQSsGMM9XyJyMPraSQffoTiYJSZvxupCKy8f8EVJFSG90eZQ+Eaou85P9W
 ddolCHiG+otn1pVAR7GQGsNlndb93bJrJHR/6qBP03QWHGhC1wKDpEdXCCG68iPXtx
 fR/WW6CJCdY9MY1PBlIe1fQbtg8R0LJ1mk5WQJV+L4/nIrC8KHLDPyYw+WVUvOiWZ/
 Ijh8Ak5f0qX3g==
Date: Thu, 10 Jul 2025 20:07:40 +0000
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Turner <david.turner@raspberrypi.com>,
 Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v2] drm: document DRM_MODE_PAGE_FLIP_EVENT interactions
 with atomic
Message-ID: <chRMluYufVIQOwgvGCTE0bDiRwi69U-MECSebFV3mto1c2_MKEZyVuslrvJgdzusI_CBhz86NSx4oeeClWmZxc_zq1UnCUWlvOVlv9lIyGE=@emersion.fr>
In-Reply-To: <20250501112945.6448-1-contact@emersion.fr>
References: <20250501112945.6448-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 0117a94f2e1606569206329e770b9d3a3fab5e57
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

Bump: would anyone be willing to review this?
