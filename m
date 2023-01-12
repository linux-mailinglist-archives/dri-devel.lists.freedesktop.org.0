Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BE66671F4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 13:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B9D10E8D9;
	Thu, 12 Jan 2023 12:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AE010E8D9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 12:18:27 +0000 (UTC)
Date: Thu, 12 Jan 2023 12:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1673525905; x=1673785105;
 bh=juI0GFGF7FVCc6p0Z9TYJVq+dBfyTc/skTNGMY81Zdo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=dClIetWFxuDkbm63wopjnsmqJkVPem4yBMWw265ypuM25/N7ltIH08qCCGwt7sVv4
 E1RGbu0q8tQU4kAvAm+NmO7YDXNZvfUEtXPuF0LchU8E5qRDpSrvUuf2+pJ5LkfcNm
 HB4deYHcyKew1Vl+4cDCoVWY1a2e4t7FNdikvAtqkWMf1rIfDFpqLZI/XI6NyHIuXD
 lNDaemfwrOiqrSIMAIcRdPmzIVsdIo2mBOkeCm5IPJraafM2oCZRG79bXdJsUpiTkl
 BfeuYK+o4QUh1+XqwafXFiXaLxv3v+0d2Vdqx8kNW/jXjyPJAPqUfe23SBwRNFuTjn
 vJSDd+9FL6qPA==
To: =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 3/5] drm/i915: Remove redundant framebuffer format check
Message-ID: <jwSmlsqOGa2MOuW6XX_iVdi7q10qz92z9mXvo_XPI-WyGTM4i7cU7q9VQ-kKoPKdR1g5ucjZ-dOG_u0ZUJp22YgOwN6HzTkIqBpLSLfaGJw=@emersion.fr>
In-Reply-To: <20230109105807.18172-4-mcanal@igalia.com>
References: <20230109105807.18172-1-mcanal@igalia.com>
 <20230109105807.18172-4-mcanal@igalia.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Intel counterpart is also:

Reviewed-by: Simon Ser <contact@emersion.fr>
