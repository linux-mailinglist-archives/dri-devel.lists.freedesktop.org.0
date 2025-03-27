Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C61A7362D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 16:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF1A10E913;
	Thu, 27 Mar 2025 15:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KTPCUC5z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEC410E913
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 15:58:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3682343BBF;
 Thu, 27 Mar 2025 15:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224E1C4CEDD;
 Thu, 27 Mar 2025 15:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743091121;
 bh=yYRohU/7oNSwFfXRdHiEbHST7HR2eGwqnNVwlczmaKc=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=KTPCUC5zw0Poq5OjNluqgrmi8pXqZJjJSrBNyBdCsSjMOHVdmnDC8lideAb9L6s3+
 hfmCPs110RE+v/1gyle6w891YDUtl+o8/pYm5oz9ElJNz/znIPeyfiRncNyFRNP/4D
 mS7is6wPpbw0c6VAkbZYCND6NwtOWwbupDX+TSfL0O75hsGFo1yjdIn1ZpQGuJAv4i
 QhlqZ5VcXqRhmUTaHgjc1DhIDsHH++dK5a1VoiPmnQagOC2d716a0NvF4cGIJ4a1bv
 YcJ9oR95J1sXHG8gt1RxYjEtkMK9qtZ1VZFnZQHxrm3gHqAnN/lzbkQkue/J1V6elK
 ZVbFfVna4ccrg==
Message-ID: <98602072621543af8cfeaab2d19bf1fa@kernel.org>
Date: Thu, 27 Mar 2025 15:58:39 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
Subject: Re: [PATCH v2 2/4] drm/panel: Add refcount support
In-Reply-To: <20250327-b4-panel-refcounting-v2-2-b5f5ca551f95@redhat.com>
References: <20250327-b4-panel-refcounting-v2-2-b5f5ca551f95@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "David
 Airlie" <airlied@gmail.com>, "Jessica Zhang" <quic_jesszhan@quicinc.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Thu, 27 Mar 2025 10:55:40 -0400, Anusha Srivatsa wrote:
> Allocate panel via reference counting. Add _get() and _put() helper
> functions to ensure panel allocations are refcounted. Avoid use after
> free by ensuring panel pointer is valid and can be usable till the last
> reference is put.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
