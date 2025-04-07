Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1452A7D7F7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 10:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABB910E087;
	Mon,  7 Apr 2025 08:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c6cWTHmw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB42C10E087
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 08:34:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 67882A48644;
 Mon,  7 Apr 2025 08:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DE3C4CEDD;
 Mon,  7 Apr 2025 08:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744014851;
 bh=m/TaOChonZ35mMesQTACEd12fQdLgAjVQLkMrkfFWuw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c6cWTHmw7f5XXfltKBE1jrGo1cNC8PSjkk2XvPWeG/EBvlfRoITRizDQrLDYP7jfW
 xdZNKF3h4AATXCPhOBXORzamzvaswh/w5Ue+MKPeLwtwb19WGFQ70MafvErw77VP5j
 2J3n5a8KlHo9c4UiAgG8BcU8tfQoFbFRa22ewRkwKWl+jyo+JGNgfmTou/Tptkk3xi
 /1Hz3NYNi09JsqjvUxafUNPEkJ0qp1tmup1aV21LKQE/bYxPiq5e24zdRbfQKhKaF5
 HAkEK1z+0ovGjxDjyuISMPcgvNGsD3fClcwVW++2TsHYTnFZYXRIpwjZzA+m9tTXW/
 v2gfsICJUlgog==
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>,
 Joel Selvaraj <jo@jsfamily.in>, Douglas Anderson <dianders@chromium.org>,
 Anusha Srivatsa <asrivats@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] drm/panel: Use refcounted allocation in place of
 devm_kzalloc()
Date: Mon,  7 Apr 2025 10:34:06 +0200
Message-ID: <174401483592.120970.11262671520967808365.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 01 Apr 2025 12:03:43 -0400, Anusha Srivatsa wrote:
> Start converting drivers to use the API - devm_drm_panel_alloc().
> 
> This series addresses only 10 drivers. There are 98 more to go. Sending this
> series to mostly get feedback. if any change is required, it will be
> incorporated in the next version and in the next series that will
> address the remaining drivers.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
