Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DD46C5A4F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 00:25:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57AF610E41E;
	Wed, 22 Mar 2023 23:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D63910E41E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 23:25:48 +0000 (UTC)
Received: from p508fd58e.dip0.t-ipconnect.de ([80.143.213.142]
 helo=phil.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1pf7py-0005TQ-G7; Thu, 23 Mar 2023 00:25:46 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 Alfredo Cruz <alfredo.carlon@gmail.com>
Subject: Re: [PATCH V2] drm/rockchip: vop2: Add error check to
 devm_regmap_init_mmio
Date: Thu, 23 Mar 2023 00:25:45 +0100
Message-ID: <11713849.nUPlyArG6x@phil>
In-Reply-To: <20230322224411.15612-1-alfredo.carlon@gmail.com>
References: <20230322224411.15612-1-alfredo.carlon@gmail.com>
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
Cc: Alfredo Cruz <alfredo.carlon@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, 22. M=E4rz 2023, 23:44:11 CET schrieb Alfredo Cruz:
> devm_regmap_init_mmio() may return an invalid pointer in case of an error.
> This patch adds the corresponding IS_ERR check to vop2->map.
>=20
> Signed-off-by: Alfredo Cruz <alfredo.carlon@gmail.com>

applied to drm-misc

Thanks for the refresh
Heiko


