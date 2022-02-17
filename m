Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D53764B9CD0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 11:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7983310F054;
	Thu, 17 Feb 2022 10:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F03C10F054
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 10:13:47 +0000 (UTC)
Date: Thu, 17 Feb 2022 10:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1645092825;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=XV/s7HJVL1qbwDQCdTnsgF2/L4C0Sbgkmd+Huz1mL3T3LFhrxRJmeTNQeOT/kSXUz
 Whsd9N4TsxboLB18U3Iw/pBoio5RDubZGh59VL8twXixm/1HU0EXZaPkMhBEh0Fp7G
 8ZdbpBRmBSOdeyytpIaRLmIev34JgZVy5mlTWg5z+0WIgmEMakGahDPyAcB4imEwxF
 nuuDTDdojvsXXVF05asFCY6P6VZzK5zKodZ+KIbvzWFnXUEJL7DwtP1DrSee/gk8CT
 mqRVi2xjL9q0uRY92vw0wHVGaD9SJIRsgiZ8euokpVLvDKG2Xybw3KK3MNJmVUYlrS
 pUEWkeAiLeu/A==
To: Geert Uytterhoeven <geert@linux-m68k.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/fb: Improve drm_framebuffer.offsets documentation
Message-ID: <hgqZF4svzr5gPet-VlXFssJqwPiNkW31lJ7RiPQLDF8akhTLQyGhVx5SklTZSQpxqQoI1o2cHi8n3Ytad1XJXiNDeI1pcP_ZxOyh58V9EkY=@emersion.fr>
In-Reply-To: <20220216084106.2913777-1-geert@linux-m68k.org>
References: <20220216084106.2913777-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,T_SCC_BODY_TEXT_LINE
 shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
