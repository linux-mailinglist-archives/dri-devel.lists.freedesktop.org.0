Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7967A8AAD74
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 13:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D13E10F1E0;
	Fri, 19 Apr 2024 11:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0902410F1E0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 11:10:44 +0000 (UTC)
Received: from [213.70.33.226] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rxm8b-0000OP-Ei; Fri, 19 Apr 2024 13:10:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: javierm@redhat.com, deller@gmx.de, airlied@gmail.com, daniel@ffwll.ch,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 31/43] drm/rockchip: Use fbdev-dma
Date: Fri, 19 Apr 2024 13:10:34 +0200
Message-ID: <2131772.TLkxdtWsSY@phil>
In-Reply-To: <20240419083331.7761-32-tzimmermann@suse.de>
References: <20240419083331.7761-1-tzimmermann@suse.de>
 <20240419083331.7761-32-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

Am Freitag, 19. April 2024, 10:29:24 CEST schrieb Thomas Zimmermann:
> Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
> damage handling, which is required by rockchip. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St=FCbner" <heiko@sntech.de>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>




