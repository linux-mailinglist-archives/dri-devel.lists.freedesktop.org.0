Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05FFA823FA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 13:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C10A10E11F;
	Wed,  9 Apr 2025 11:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="RFyj8p65";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1092 seconds by postgrey-1.36 at gabe;
 Wed, 09 Apr 2025 11:50:36 UTC
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA44810E11F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 11:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=2kdRW5j4UphyaUbVQ/aSdW8WfqtXtz8+zNPopoZuuI4=; b=RFyj8p65cDBJu6c7p2JRBa5BEK
 e5izKTUZfWK5glHwyQZvaXwdUGpBIiA5YOIEXrB0MQmiVuNzXxjgFBRdrFBU9WTHB8TjK/xEJz1cS
 M2OuOFqbxI7uAfYPIeP89QbbUEcLrEhLPqtCZsl1l2MYnrpN+laSsdxoTxew9/EZNcT+cQDTM2lxT
 aV/CnVix2Mg0FFE8+D3/VLkjqsmeXzmxu+sNYWQwh0/+AMGsic5JG/YXLropx8AmWXwBf2cEYm2Eb
 45XPqbqpcVHZJIcJiFcobeQqvSv/kuS2ZQn7H0gALlGm8Q9rB3vDfQ2DuwNVRkci/yS8Kob1SxM4G
 yACwqNNg==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1u2TfH-000809-IO; Wed, 09 Apr 2025 13:32:19 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Heiko Stuebner <heiko.stuebner@cherry.de>, dri-devel@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [bug report] HACK: drm/panel: ltk050h3146w: read panel-id
Date: Wed, 09 Apr 2025 13:32:17 +0200
Message-ID: <2854711.BEx9A2HvPv@diego>
In-Reply-To: <66c0b8c9-4143-4564-bae3-6ecbd59752ac@stanley.mountain>
References: <66c0b8c9-4143-4564-bae3-6ecbd59752ac@stanley.mountain>
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

Hi Dan,

Am Mittwoch, 9. April 2025, 12:59:39 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Dan Carpenter:
> Commit e09be2a6ab1a ("HACK: drm/panel: ltk050h3146w: read panel-id")

that commit was accientially merged into my for-next branch but never
applied to any actual kernel branch (and is already gone again after
today's linux-next run).

Heiko



