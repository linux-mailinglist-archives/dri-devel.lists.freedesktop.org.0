Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0643A8A6CA5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 15:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13F0112CAE;
	Tue, 16 Apr 2024 13:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i+GV0c8u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46265112CAE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:41:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 49F4D61211;
 Tue, 16 Apr 2024 13:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BEA5C113CE;
 Tue, 16 Apr 2024 13:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713274864;
 bh=b5mTg0z4oYzKbTXPS5Ca9YSCSmYP80Vsy14fqETxjpo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=i+GV0c8u+4Mp+hIYeBLGod/+I6s2h0TRDsvK7LoDwnwh1cAUCMZn3KKOuQ9H84FkY
 3SDG/xqu9GFbkGhuXgsFsebgCWI6sZiw0rex7qmhLSTo57CEe+7vqOzWVEifwHUu7s
 AnnVV8Ay7eLFsMDhC/ik3ACZVVaqgJf733Maqc3buQxVAZejyH9HAvN0SDf+DHzlKf
 3dhJCXJlokMLiSaPR+K8BHPYJWYeFSMG40SH94byBA2U2FlMxnFO6QpxL0ARLfWgFw
 fGO5Axuz6H2ZjjoYmPWEs2kaO4XbOsh0KGr/XzDMPy9im13TJEjd9vSbHHhXXj2Mvv
 LuhpDDtd0y3sw==
From: Robert Foss <rfoss@kernel.org>
To: Maxime Ripard <mripard@kernel.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, David Airlie <airlied@gmail.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Xin Ji <xji@analogixsemi.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240416-anx7625-v3-1-f916ae31bdd7@chromium.org>
References: <20240416-anx7625-v3-1-f916ae31bdd7@chromium.org>
Subject: Re: [PATCH RESEND v3] drm/bridge: anx7625: Update audio status while
 detecting
Message-Id: <171327486021.31483.13603823438662708518.b4-ty@kernel.org>
Date: Tue, 16 Apr 2024 15:41:00 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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

On Tue, 16 Apr 2024 07:21:35 +0000, Hsin-Te Yuan wrote:
> Previously, the audio status was not updated during detection, leading
> to a persistent audio despite hot plugging events. To resolve this
> issue, update the audio status during detection.
> 
> 

Applied, thanks!

[1/1] drm/bridge: anx7625: Update audio status while detecting
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a665b4e60369



Rob

