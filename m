Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6769A372C9C
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 16:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55B46EB1A;
	Tue,  4 May 2021 14:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7486EB1A;
 Tue,  4 May 2021 14:58:54 +0000 (UTC)
Date: Tue, 04 May 2021 14:58:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1620140331;
 bh=qEGxxhio4KaOagLa+mw/91EPyjF4mijCoGDB/nEKnaI=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=dVwyWgUr9/GdatTYaoqxaLJ8/LNbZ/iTKA+oBmNUod49weBCN2tWEtyEHTnxiGeKG
 Y+fFSxa7oFlnErdrA4rUhdoWDDvFi4ay6BJ1qO46aXTCn8/h0cYLgLtH1pkPRCGy+X
 JfJfgJo0VRKJDTSKpDfbqS5Vb8BnSAflwuZtfxxIaoecC4WxcHJPjX1YDrBxgZjjbb
 /Zn8RLF/x5TWLXKgI4owGtpvnszmts1a7H9jDAw+hZE+j9OPJXmBepV4Vlae9JeQl9
 rbtlG+ObYFwz9DQswOtwe1HxvKKwZgDxBeLm2BsTY9FV5ZbUXmJiJQrtlSPirBHLm3
 CN830PawN2oEA==
To: Emil Velikov <emil.l.velikov@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 8/8] drm/modifiers: Enforce consistency between the cap an
 IN_FORMATS
Message-ID: <_ICN4Ho9WvMf55FvcWEqbzvApWTRd3hIiVAJ8vkrc0XTljEiq3f5aOB8ElxJL3WTL--P1-VZddkcjLcwdL3YxdPkYClHuyMhtQ0-Zv88Fh0=@emersion.fr>
In-Reply-To: <CACvgo50frye2h5L78YKnHm8TaE9xM=fn-7fNNtHbSwiv+GnYVA@mail.gmail.com>
References: <20210427092018.832258-1-daniel.vetter@ffwll.ch>
 <20210427092018.832258-8-daniel.vetter@ffwll.ch>
 <CACvgo51rQJmHc1K-MSq-WLZkwVt34MY73csgEyxorrYsKPwQiA@mail.gmail.com>
 <YIgB76WmQijHCJeV@phenom.ffwll.local>
 <CACvgo50frye2h5L78YKnHm8TaE9xM=fn-7fNNtHbSwiv+GnYVA@mail.gmail.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Continuing on that idea to push for enabling the cap in more cases: do
we have a policy to require new drivers to always support modifiers?

That would be nice, even if it's just about enabling LINEAR.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
