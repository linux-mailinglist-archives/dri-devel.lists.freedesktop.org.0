Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A402BBF14CE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 14:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC5010E29C;
	Mon, 20 Oct 2025 12:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="NdX3w7kU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E839210E29C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 12:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=iCETLYsFibjq+CsukzViDDTORlacs1ZM9GueRkvBoiQ=; b=NdX3w7kUUi40I3knc1H3016F0j
 Yag6eG4tQ09/7ItC9tkDkRTOL9esr2bm8Q/ox54JUnDMGCdGrWFNvznVSQJm2nHjvlme+o9RwtJaG
 449+bJJqQ7F+DqQRoPrcuK9a7mhGZMDOm3FtAOSgl7Nen101eMV4Bk7ruKrwXTKNXisau5my3ijnl
 KvKnS8P4XLWuinHMB5DWh+JI4fj+uFXM0njHMhpRgZIeyZPsVA8kwlchpyydJZecgGM2VLjs/scFX
 qTxBRI6xSpwtmu9dE06F2qRSa3B7VxOi8IBv+vMe3Li1Bz6j6G7C4TeXNjpG4NU+v18UuE8JzImiV
 W3jLpg3A==;
Received: from [141.76.253.240] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vApGZ-0001AI-NB; Mon, 20 Oct 2025 14:45:35 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: dmitry.baryshkov@oss.qualcomm.com, Andy Yan <andyshrk@163.com>,
 neil.armstrong@linaro.org, andrzej.hajda@intel.com
Cc: mripard@kernel.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de, knaerzche@gmail.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v8 1/2] drm/rockchip: inno-hdmi: Convert to drm bridge
Date: Mon, 20 Oct 2025 14:45:34 +0200
Message-ID: <8913609.MhkbZ0Pkbq@phil>
In-Reply-To: <20251016083843.76675-2-andyshrk@163.com>
References: <20251016083843.76675-1-andyshrk@163.com>
 <20251016083843.76675-2-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Am Donnerstag, 16. Oktober 2025, 10:38:31 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> Convert it to drm bridge driver, it will be convenient for us to
> migrate the connector part to the display driver later.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

But of course I would be really happy if someone with more experience
on general bridges could also take a look.


Heiko


