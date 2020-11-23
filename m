Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D542C18BA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 23:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCAC6E103;
	Mon, 23 Nov 2020 22:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F1D6E103
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 22:57:33 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75452206D8;
 Mon, 23 Nov 2020 22:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606172253;
 bh=85UQxxhOYcaC1aVFet5PQGMG0Q+y+uLnQYPGD/LRlgg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IwumpbTU+MvLcm7gOtTh6zIqqnhtuT7umn02WKYTFeQAD95f42UeUi+Wg6SuBNdxt
 JEGN20yqbSo6s56p/u9FB3UyEHD+3jM10DqVIwzwNbg82lmdWkVU8U8adudo7xYPTz
 TWlFgunDW9mvfeKbpexXuRy4J5SockPfDraDYjgE=
Date: Mon, 23 Nov 2020 16:57:47 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 079/141] drm: Fix fall-through warnings for Clang
Message-ID: <20201123225747.GU21644@embeddedor>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <111e9d3d55c686892357aa5269022024b4d48330.1605896059.git.gustavoars@kernel.org>
 <20201122220322.GA566387@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201122220322.GA566387@ravnborg.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 22, 2020 at 11:03:22PM +0100, Sam Ravnborg wrote:
> Hi Gustavo,
> On Fri, Nov 20, 2020 at 12:35:17PM -0600, Gustavo A. R. Silva wrote:
> > In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> > by explicitly adding a break statement instead of letting the code fall
> > through to the next case.
> > 
> > Link: https://github.com/KSPP/linux/issues/115
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> thanks, applied to drm-misc-next.

Thanks, Sam.
--
Gustavo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
