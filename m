Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D65C388BC17
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 09:14:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E0410E19C;
	Tue, 26 Mar 2024 08:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FwdbtemA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9FE10EDBF
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 08:14:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B162FCE1F17;
 Tue, 26 Mar 2024 08:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36493C433C7;
 Tue, 26 Mar 2024 08:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711440879;
 bh=aGJeC3iATCnbMz5LYGJYFSpKCDTNsuAAz6oPO6eLsJg=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=FwdbtemA0/OAmCuxU9EWEJM3VN4d/1F0Fvw9xGUq3eZosa5p/C+0/NZZy8ihOdmIQ
 p9lN/KPUXBfeI4vY/km3+kFYKz4CtuvzdhMJ9UlQQ6GzYu93wNcAWKWdTZDxKder0F
 Kx4DFZz5jWAjbebcRDZFQw6SBxh8zgCrn43M6yyjd/TNrlSoZiqQqZ+L/DojMHw3Rt
 zfS5z7cJcBCl0hCL6CAMFWVm5l+pqJgTiXQ2UZnfvnALsQW27ng9eJoSANEsgcLVZd
 yixwMsWqga1nrHE3a/NnG2XDj+qVg4evHCAms64LuZl9mq0tWtzQl1O/ycGLo9Vzeu
 ucqoH7PNC3cHg==
Message-ID: <5ace91ffc0a62af945f837cbd73ad88b@kernel.org>
Date: Tue, 26 Mar 2024 08:14:33 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH v6 12/13] drm/ast: Implement polling for VGA and SIL164
 connectors
In-Reply-To: <20240325200855.21150-13-tzimmermann@suse.de>
References: <20240325200855.21150-13-tzimmermann@suse.de>
Cc: airlied@gmail.com, airlied@redhat.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, jani.nikula@linux.intel.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sui.jingfeng@linux.dev, "Maxime Ripard" <mripard@kernel.org>
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

On Mon, 25 Mar 2024 21:06:57 +0100, Thomas Zimmermann wrote:
> Implement polling for VGA and SIL164 connectors. Set the flag
> DRM_CONNECTOR_POLL_DISCONNECT for each to detect the removal of the
> monitor cable. Implement struct drm_connector_helper_funcs.detect_ctx
> for each type of connector by testing for EDID data.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
