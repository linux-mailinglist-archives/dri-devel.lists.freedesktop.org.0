Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E5034B6D1
	for <lists+dri-devel@lfdr.de>; Sat, 27 Mar 2021 12:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0354C6E22B;
	Sat, 27 Mar 2021 11:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E74D6E22B
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 11:24:25 +0000 (UTC)
Date: Sat, 27 Mar 2021 11:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1616844262;
 bh=ZeosTjM7JTFTNLFhh8j3WlcOms5nuTO7bTrKwENNYQA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=RIPT0bde8x/F0BSTs64Mp+ghXeXOEByxoW0cBkbAunG9v42djMFM5bu2gUA8dbWnX
 thFaGbxERyf8xQIe0xf7aqhBwZuGyHXufOT05hYenfsWomuV08L5aVwnaI6yt8k4oE
 3E3XKkdQ6Kf36vrOwINH7vkVrCTSfr/Y57rx01cmfUFeZYvQlSJzN+XeuBGl8VTwBK
 GBUtx3ZAcKRZBJvXpXSLULiz2E3wDbTm6uNNGcui+bzjPDmTjREn7firXO1o95bnB1
 9sGxzI+nwO/lgKuIjgmA5lsGI5DxgGSRDI1Uvx/ZdbAAqcmR16gnlfb+ZDnp+MVxKm
 6X2SAdQ17zWoQ==
To: Paul Cercueil <paul@crapouillou.net>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: DON'T require each CRTC to have a unique primary
 plane
Message-ID: <1J_tcDPSAZW23jPO8ApyzgINcVRRWcNyFP0LvrSFVIMbZB9lH6lCWvh2ByU9rNt6bj6xpgRgv8n0hBKhXAvXNfLBGfTIsvbhYuHW3IIDd7Y=@emersion.fr>
In-Reply-To: <20210327112214.10252-1-paul@crapouillou.net>
References: <20210327112214.10252-1-paul@crapouillou.net>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, od@zcrc.me, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Saturday, March 27th, 2021 at 12:22 PM, Paul Cercueil <paul@crapouillou.net> wrote:

> The ingenic-drm driver has two mutually exclusive primary planes
> already; so the fact that a CRTC must have one and only one primary
> plane is an invalid assumption.

Why does this driver expose two primary planes, if it only has a single
CRTC?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
