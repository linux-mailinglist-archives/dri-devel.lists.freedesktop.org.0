Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C3C47B847
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 03:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D1B10E654;
	Tue, 21 Dec 2021 02:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA4F10E654
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 02:13:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3535561224
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 02:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A937C36AEB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 02:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640052785;
 bh=xtLoWNL27ZT2nOXxUG9dgkAci+a5a6mW2D2J6GngDO0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ddfhMycQQT/2F0mKq+tDJ3oaXPAzeTOsq6SPU54pEqICKx/36CbnsK6sfmXxIH0B6
 MuBJnrTz20WmADFthuTfXXPCNqAzRotFyfJelU61gNpsXZR7QvmyZWfYZA/nCKPoVT
 QV07v0mlDSYAAdefaM2e4uKWjDkPCMZziLcXiIOwyG8fYAOxfXCx7QHMNQcvjBiGWd
 W3f3SxL74KiR6Tc5VoCBjgTbZCqflQWr6wxz5YqqcEnrOBcm0MtVEjco3tIzC+x0zd
 6B+Cds4FUHhZ2D/f+gSbs78ie9onE/UiQogU7jl38nUx0DwKOuI51kbuAikiT0Ms4Z
 NVRbniY0FE+nA==
Received: by mail-ed1-f43.google.com with SMTP id y13so45786334edd.13
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 18:13:05 -0800 (PST)
X-Gm-Message-State: AOAM5335YeWl5EAwv5E5+Mr2dmMrn5Li6NOTjw7DsEn3zRrKH+LWL7P9
 1qDQ/NXDLrVn4Bb3989+gYzA9PXzwoBm8cyAsQ==
X-Google-Smtp-Source: ABdhPJyZjxxkiLiLnY3yh+Ed87AUgwZAtR+mtE9n+Mql5D+TnFkImpiUwWNvdOXwhHi0GhwsCkogbDZjjEYpMxshIOg=
X-Received: by 2002:a05:6402:350a:: with SMTP id
 b10mr993755edd.89.1640052783965; 
 Mon, 20 Dec 2021 18:13:03 -0800 (PST)
MIME-Version: 1.0
References: <20211220125147.519880-1-thierry.reding@gmail.com>
In-Reply-To: <20211220125147.519880-1-thierry.reding@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 20 Dec 2021 22:12:52 -0400
X-Gmail-Original-Message-ID: <CAL_JsqKZcctQ8yum-OLzNHccF3XQq4CEjNBsps4_+sDy86xPoA@mail.gmail.com>
Message-ID: <CAL_JsqKZcctQ8yum-OLzNHccF3XQq4CEjNBsps4_+sDy86xPoA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: lvds-codec: Fix duplicate
 key
To: Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 20, 2021 at 8:51 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> In order to validate multiple "if" conditionals, they must be part of an
> "allOf:" list, otherwise they will cause a failure in parsing the schema
> because of the duplicated "if" property.
>
> Fixes: d7df3948eb49 ("dt-bindings: display: bridge: lvds-codec: Document pixel data sampling edge select")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/display/bridge/lvds-codec.yaml   | 43 ++++++++++---------
>  1 file changed, 22 insertions(+), 21 deletions(-)

Thanks!

Acked-by: Rob Herring <robh@kernel.org>
