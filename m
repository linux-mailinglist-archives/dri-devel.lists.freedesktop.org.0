Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9827F8A49F4
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 10:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8827010E442;
	Mon, 15 Apr 2024 08:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V0JBn5TT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D72410E3F1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 08:13:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 44DC2CE0AD5;
 Mon, 15 Apr 2024 08:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC35C113CC;
 Mon, 15 Apr 2024 08:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713168799;
 bh=rcDAWNhXVzUZL03O1SHWIX9sFvrB+I8PVu/WEazX9Ek=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=V0JBn5TTqAla89qpDE0M+vBIipafEvd3mGQijUuI6KvyiNY0IZWmXN/E5py2H0A9h
 2NVFepot6wpcrEic4ZMAUHeEDoy58H2/9TSQPxB0L5NLVxIpk/Iznlc0q92YhkuzPc
 kKUe0JhtR25LcCY9GV2w99nxbtYjns/ssHShCv1hSfcXPsxd3OETiZ4tpce4eqJl5y
 e8i1RAeoHkeUmtwQ9r4pFnOPdkFQChtEhb7eNZWlOEs1O9OfU710KAjas//kOWTvCf
 8PyuCtP18XiK9jIP/6psJ6dFtLt6tYdktikUh67vIs9EjA1p4CtJnZ1Oyk8d7VqI4B
 qp/FXRCUOEdkA==
From: Maxime Ripard <mripard@kernel.org>
To: Eric Anholt <eric@anholt.net>, Aleksandr Mishin <amishin@t-argos.ru>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Boris Brezillon <bbrezillon@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 lvc-project@linuxtesting.org
In-Reply-To: <20240409075622.11783-1-amishin@t-argos.ru>
References: <20240409075622.11783-1-amishin@t-argos.ru>
Subject: Re: (subset) [PATCH] drm: vc4: Fix possible null pointer dereference
Message-Id: <171316879740.200641.7167138932298013615.b4-ty@kernel.org>
Date: Mon, 15 Apr 2024 10:13:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Tue, 09 Apr 2024 10:56:22 +0300, Aleksandr Mishin wrote:
> In vc4_hdmi_audio_init() of_get_address() may return
> NULL which is later dereferenced. Fix this bug by adding NULL check.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

