Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C47DB8C2BD6
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 23:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E95E10E575;
	Fri, 10 May 2024 21:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B+lmwiXI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1527F10E575
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 21:25:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 510B7CE0B49;
 Fri, 10 May 2024 21:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0CFC113CC;
 Fri, 10 May 2024 21:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715376342;
 bh=IDiYeRxupKFpbWrcDW7eoKaHzmNgzIv9PhoI9GNnRlE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B+lmwiXI4t+p0X9dc3Ch8VbPvbz6K3d2ZLW9S+K5/MmYBWibTcjGAfJwa0SpyGGvm
 qgBxo2E6Qq9DCJAX3WlImrUANcOKzYo9thnkgOkItCHDYyQkwR9oBvYCqAwsdpjya5
 GM+XNYG1IrQA03RfAWVuMdQBykARM4aNkogilxEuQPSdszkGv/PZ9RgN23zI05azZt
 wY1Wa8KJ+xbVsffnOTpP/ZQk5ytIZgIyz2N80KeTmzz0PVN6sSzVEhxfYuLP6i2Ve9
 5QgOFSWE4o3NiGcUKex2N3XEkxYKnPZ0nEYne7f8yuD0jQfVowKIlg1XygrL0dZwI4
 MvF6RWNiDyC+w==
Date: Fri, 10 May 2024 16:25:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>
Cc: conor+dt@kernel.org, chromeos-krk-upstreaming@google.com,
 robh+dt@kernel.org, daniel@ffwll.ch, hverkuil-cisco@xs4all.nl,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@gmail.com, mripard@kernel.org, tzimmermann@suse.de,
 akpm@linux-foundation.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 dinguyen@kernel.org, maarten.lankhorst@linux.intel.com, mchehab@kernel.org
Subject: Re: [PATCH v3 08/10] media: dt-bindings: Add Chameleon v3 video
 interface
Message-ID: <171537633771.768105.2129322533384876377.robh@kernel.org>
References: <20240507155413.266057-1-panikiel@google.com>
 <20240507155413.266057-9-panikiel@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240507155413.266057-9-panikiel@google.com>
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


On Tue, 07 May 2024 15:54:11 +0000, Paweł Anikiel wrote:
> Add dt binding for the video interface present on the Google
> Chameleon v3. The Chameleon v3 uses the video interface to capture
> a single video source from a given HDMI or DP connector and write
> the resulting frames to memory.
> 
> Signed-off-by: Paweł Anikiel <panikiel@google.com>
> ---
>  .../bindings/media/google,chv3-video.yaml     | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/google,chv3-video.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

