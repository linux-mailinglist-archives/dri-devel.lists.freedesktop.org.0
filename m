Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE9A2B423D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 12:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC7D89A1E;
	Mon, 16 Nov 2020 11:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A8489A1E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 11:08:25 +0000 (UTC)
Date: Mon, 16 Nov 2020 11:08:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605524903;
 bh=QGhi54MdNuZPb1+rrhFwdkR6s6Cgk8mVP/zIusN9TRs=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=DwTv/PZdOIVkD5yYisQNusXYtUo94jyX5zKb8OaM6tAx7mXnwpAxxCfaib5crVwUv
 EmmzLowY+OJhzYpeOZK1D1heZ+G1IGOGdrnb9zHYoO/Fmbf+dJdzL5uftmTokmgB+x
 wqVQbhNKCm1kRh/rPvb+j22cLVkfSbTefDNfZ75BAR3TpU9R8hx97PRnS3OnA9fHpp
 c6AFhKUpQ7OlBEUOFxUAGtJ/WqsZmy/4NMSeoIFThoaJ3jLf73VqJZrS7tr7PoGSru
 MY+5U1lOfqNr5ZwwYgYBdf/sQM+ol3jkmc5E148KcCr9rGlNQ/AHwOnlPy6UWB9/R9
 lqP7YsC3iCuMg==
To: Colin King <colin.king@canonical.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH][next] drm/atomic: avoid null pointer dereference on
 pointer crtc
Message-ID: <Gsgkd1PRlRQd3tlZ0nZROZwVfLvE7QmJdeOA8wkeVyE9ewGIj89RZAixoLltsvvgqB-Ica_sfpcNbwdtRCjDx16tYykgs61QOJRYm9Eumys=@emersion.fr>
In-Reply-To: <20201116110316.269934-1-colin.king@canonical.com>
References: <20201116110316.269934-1-colin.king@canonical.com>
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
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, November 16, 2020 12:03 PM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King colin.king@canonical.com
>
> Since moving to the new debug helper functions we now have a debug message
> that dereferences crtc to print a kernel debug message when crtc is null
> and so this debug message will now cause a null pointer dereference. Since
> this is a debug message it probably is just simplest to fix this by just
> removing the debug message altogether.

NACK. This removes the log altogether instead of fixing it.

A fix has already been pushed to drm-misc-next: 0003b687ee6d ("drm: fix
oops in drm_atomic_set_crtc_for_connector").
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
