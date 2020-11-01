Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD6B2A2191
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 21:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7AD6E0D8;
	Sun,  1 Nov 2020 20:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F314F6E0D8
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 20:35:48 +0000 (UTC)
Date: Sun, 01 Nov 2020 20:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1604262946;
 bh=lqH57NRg1r8l5DwntBJpNI4A4/rBw9T+/QKDokEi9mw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Ta+CCNsDDNApjRo+sO6MqhnFc2OLNvlVXXodNFUA2keEo3dqC6dVeNWrklcf/9obt
 fXzeH+hBONokCnpT8yFmVmnrivjZCbdjXYjdogaM8ECqCETEfJg4DI54Qg2ww5VdYj
 qL+K+F/qVgUOm/Pd+OHy1JTzHtrWofrRz6y/Im7okUqIPRWDF7R6MEW7ORQ21CdxKk
 foS2Auj+T3+FxdUehW0aIVG/ObHgQzsP3IOngFv3kHcRV5LKZI1OipgwXpamtEa7SD
 50JAAFC5x+5Lf8YUfuUvrqjfLpziJmf+Cz11e75WgcfgORSxfhn/4zeOxAU9WtTskq
 dCIPm8Ke0YxNw==
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document that blobs are ref'counted
Message-ID: <qhVMa7YWDnEiufs2_tBn6d3idpWpj2A5cqvDHL94SdZeGfVsdZCdlKlKGKRN0MfJDGZ4PJthZ86C1Xqncp7jcdiEq2eKVMLFIm1uAKRDEkA=@emersion.fr>
In-Reply-To: <HNBtgIoryEkrMD_i_O5qy-HyxoyMYWSziPwHQQn9LYoOL8Ds5o7gvqMqz-Y0v7GZDqcYzBLC3d3KPfO37nRCl1doMWeQjKyHYv_pYFxYZ24=@emersion.fr>
References: <HNBtgIoryEkrMD_i_O5qy-HyxoyMYWSziPwHQQn9LYoOL8Ds5o7gvqMqz-Y0v7GZDqcYzBLC3d3KPfO37nRCl1doMWeQjKyHYv_pYFxYZ24=@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel, does this patch look good to you?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
