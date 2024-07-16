Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D5C9321C1
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 10:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F47010E0BE;
	Tue, 16 Jul 2024 08:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YjUE5mnj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639CA10E0BE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 08:21:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 52805CE0909;
 Tue, 16 Jul 2024 08:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117D9C116B1;
 Tue, 16 Jul 2024 08:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721118103;
 bh=0AC1+wuH0a0+70iqaPYVX3H0hTaHGeWARF9nJ5gO+0E=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=YjUE5mnjS22XUtLtHleeGF2XoMhSKpEtjuHrRAh6TDGPVDHdSqf5+VPftA0Gpu5k4
 mkbNoz4SkjQtrMqUj97Wne5kL7cdbmzkX0itzymJvJ2GqydEGgZpvZc3IGCEJoHH05
 Abfpp8aXelBU0p6M/Ve2gSTdu9IFFpRo8i1ZDM7unCH2UQNNjcDyhNyX5tUR3edNGx
 80PXEmHQgHCBmIxUkGZQ7zI9Z1tAQE56k2mzV/q9rSA9N+cn8cxNdY+RPAO89f8hjT
 KgnSNP6s6IzKybm6r2weJ6DG0DFofGKgmA+g3Do9WeK+iCaO6mPc4TjHI48uyfPXQC
 DIcF794zcFoDA==
Message-ID: <cfcd84fde80482884ee893b3afe3dcf3@kernel.org>
Date: Tue, 16 Jul 2024 08:21:40 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH 1/7] drm/probe-helper: Call connector detect functions
 in single helper
In-Reply-To: <20240715093936.793552-2-tzimmermann@suse.de>
References: <20240715093936.793552-2-tzimmermann@suse.de>
Cc: airlied@gmail.com, airlied@redhat.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, jfalempe@redhat.com,
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

On Mon, 15 Jul 2024 11:38:57 +0200, Thomas Zimmermann wrote:
> Move the logic to call the connector's detect helper into a single
> internal function. Reduces code dupliction.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
