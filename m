Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 431A9365483
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 10:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591046E488;
	Tue, 20 Apr 2021 08:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DB16E488
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 08:48:13 +0000 (UTC)
Date: Tue, 20 Apr 2021 08:47:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1618908490;
 bh=RgTu4E+lGGBYsYxGMoXZaskjuAMvFqUNkfM8G/g+T6w=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Hrs6R8LN2iWfclE8TJK68xgMNS2j7coRca9dI739mBir9Va6TgfhcCXbQ5ZefYHoL
 rU2t0gk8iqvaei8p6AmcHphGts+8nBN9o5yIguRK8gEAMgosoxJozXPaCuMxCb2nPB
 nlvOU2nyBfpFGwE+4/N/EBwNERm11DYSoyNmmOkjCDrIm7eUehvD4SOEZC8xsIHUNf
 gXOn8Dah5h5aBojBCw8rR9a/3I01k4FrbreRvoN/D1NasZE3Cs4D9i3tFrG1zBU/ar
 X0nUCgFe/5nqe35thDBmhDKpAouUAZM7+J+GAx6w1FSAaf+/tBgYW3c+ke2U12LfVp
 lR0Ccp8F8zrDg==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/connector: demote connector force-probes for
 non-master clients
Message-ID: <CXemFrfxceqR1txmfMWjWOrHcUSkGLguEtVCt7qr2exOcewP6TVdUpTWkCTZdf2WMnZ8K26j1YGBfxokDV2Z0I0Jna0mZgqdrltZgzhVKbk=@emersion.fr>
In-Reply-To: <20210407103850.0bc7a391@eldfell>
References: <20210402112212.5625-1-contact@emersion.fr>
 <20210407100224.653fa3e7@eldfell>
 <itV15ocZXBT9rpF0IwtL2H5MES6wcFyY2FfKiuN_4sc6VM39xYBEvYz42p6Iba2IW_MuNZk2_dws36blub8Pd8WBod4t_ruqFk9wjRI-fbE=@emersion.fr>
 <20210407103850.0bc7a391@eldfell>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping Daniel Vetter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
