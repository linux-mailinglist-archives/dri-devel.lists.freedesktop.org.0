Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A3A88145D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 16:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51DA10FD7C;
	Wed, 20 Mar 2024 15:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Di9//qRx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FD810FD7D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 15:19:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0ADF3CE1002;
 Wed, 20 Mar 2024 15:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01B7C433F1;
 Wed, 20 Mar 2024 15:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710947994;
 bh=fk6z00AYgsvjTuQMjj3coJGiNAU3hTCY/rmgfpXE8L8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Di9//qRxCFLpJ99qH64FcvdaQxD70QgVqJoDOo9n6FD+HzMnQ/9/Hj6+b2QE6/+X1
 bXbbNPysInXBusaMa3gYG0tJz7X0yOC6rqLnHrJnwU8/vbyHUA1tt4vR30OtVfk4Ki
 3pMVwfe3rORpIY7CeEyrvxtATKyvtTKMkvD7gAz9r8GDc8WR8TSadOebQPSFfTH6um
 g3pmZJ5ypQHQDSc0mM8T1EQ+Sw28cqTbvQp8/i130UDFwJnUZY3Ip9wPhtZaUVAiAm
 RcJaMTcmUd1P0REBhziMUcfsTJI4Be4gPNvSx0gJYj89Ahyk/lT5TGyHfbRj8K5D3P
 jPuikLvP6MzUQ==
Date: Wed, 20 Mar 2024 16:19:51 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: Missing commits from drm-misc-next on linux-next
Message-ID: <20240320-sticky-shiny-mussel-5da3cf@houat>
References: <39ad88fa-449a-4aa9-ac6a-902d8d531984@notapiano>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <39ad88fa-449a-4aa9-ac6a-902d8d531984@notapiano>
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

Hi,

On Wed, Mar 20, 2024 at 11:07:34AM -0400, N=EDcolas F. R. A. Prado wrote:
> I noticed that there are some commits from drm-misc-next [1] that haven't=
 been
> added to the for-linux-next [2] branch, and consequently haven't made the=
ir way
> into linux-next.
>=20
> Namely, commit bf0390e2c95b ("drm/panel: add samsung s6e3fa7 panel driver=
") and
> commit 2689b33b8864 ("dt-bindings: display: panel-simple-dsi: add s6e3fa7
> ams559nk06 compat") which have been applied almost a month ago [3].
>=20
> I noticed because running 'make dtbs_check' on today's next is showing new
> warnings, but with these commits applied there shouldn't be any warning.
>=20
> Could you please take a look? I'm guessing a merge was forgotten somewher=
e along
> the line on the for-linux-next branch.

Those commits are in drm-misc-next which is now targetting the 6.10
merge window. In order not to disrupt the oncoming 6.9 release though,
drm-misc-next is removed from the for-next branch, it will be
reintroduced after 6.9-rc1.

Maxime
