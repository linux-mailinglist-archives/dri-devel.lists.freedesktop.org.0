Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1501FACFDA8
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 09:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7896410E920;
	Fri,  6 Jun 2025 07:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cKOIHe8y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C070310E920
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 07:44:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 25285629F9;
 Fri,  6 Jun 2025 07:44:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5185EC4CEEB;
 Fri,  6 Jun 2025 07:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749195843;
 bh=JP884Cjden7HuQGhvDL+Ok1rW1puoAHNuJwZgtcJsYM=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=cKOIHe8yH1KAfZ+ctxLQ9Rb3vIKXs2cblsR+8NePoG0yEX1a/DaHoS0OHumJ7WpCk
 o52akUSJ9sBv8XbBJg4Dfdlu4O0V0T4f9JvcOyVO4SAVKgFEuRgH+a2ik+qjSbdYGb
 4PtnQElh17SWBTxu/hfBKSI5HbXF4CmnHJIyHjtJxuZSp/mKVlVZZpKSYXHRQD9gPJ
 zM/M+bYpyBdAcZPB82gvrN0+vuzaWwDRM74KV8x18djh7SpXHDgIC/21356SXjuufn
 /IwfreLEgKAk73290jnIehoPYK0Vg8UOwSDjoQV4C5ZShgKztQqI8SnQ/Ff9cGDQYJ
 7yD/bvY3viO9Q==
Message-ID: <cfedda06fdba55a959f681413b4d8300@kernel.org>
Date: Fri, 06 Jun 2025 07:44:01 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH 3/3] drm/format-helper: Move drm_fb_build_fourcc_list()
 to sysfb helpers
In-Reply-To: <20250604154844.28995-4-tzimmermann@suse.de>
References: <20250604154844.28995-4-tzimmermann@suse.de>
Cc: arthurgrillo@riseup.net, dri-devel@lists.freedesktop.org,
 javierm@redhat.com, jose.exposito89@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
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

On Wed, 4 Jun 2025 17:45:44 +0200, Thomas Zimmermann wrote:
> Only sysfb drivers use drm_fb_build_fourcc_list(). Move the function
> to sysfb helpers and rename it accordingly. Update drivers and tests.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
