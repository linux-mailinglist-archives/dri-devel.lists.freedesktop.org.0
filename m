Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211DD682BFC
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 12:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB03510E31A;
	Tue, 31 Jan 2023 11:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF0D10E31A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 11:56:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8B19F614DC
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 11:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D789C43446
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 11:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675166171;
 bh=wRCvfnECS+TaNzM15rM9zUuk3Gnb1rcqeccYV5WNn9E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SoGjF9oWEf6SLcJzbKrqDxoXCmf7frtP86+EDJ3kWAMscEcl6IGlLsP6Y9lWgtjNe
 C6NnZYmX4vwoGJMElKMS6LtOttFksZARGMvzrG+ou092pGOV4+E0dEy6NMIlBgrKvg
 0Yh3OyuDxKKxEgx0Mr9yI2xySX9RJf1lNvMkVORSRhYudsd72oNIlQipN/y2FnUVnr
 o7VhpDoOhYrW+cvrAD6LxP4Lbq0l1V6MiH6iuHysoWcfay81P5gt0WMfNRgMN0+SvL
 kBUs1eLQv0UBefDa2zaL2ebLaem5JHGQ2bavF0K2K7mSoeFzRanukO6h/l84SX9dd0
 g1+sQWJRJ2pew==
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-510476ee20aso92481147b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 03:56:11 -0800 (PST)
X-Gm-Message-State: AO0yUKU18HTyvBllR0JPQq2WpPzSDrF3bhTOfq/Kp35UHQj+b0CQ8+dN
 X05TF3XiA82ATLR9mRqe+slUcb5WMBBxzPR75Vs=
X-Google-Smtp-Source: AK7set+Dt/F0Do5/LaT6yA03kC67uscO3wPrVxSx/gX7jcRpuYRplli6hsYRgGDvzl6JkfmHbYXVU4x2tNZo5RojBSw=
X-Received: by 2002:a05:690c:c81:b0:506:38b7:774e with SMTP id
 cm1-20020a05690c0c8100b0050638b7774emr4862284ywb.135.1675166170545; Tue, 31
 Jan 2023 03:56:10 -0800 (PST)
MIME-Version: 1.0
References: <20230124104145.3962497-1-geert+renesas@glider.be>
In-Reply-To: <20230124104145.3962497-1-geert+renesas@glider.be>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Tue, 31 Jan 2023 13:55:44 +0200
X-Gmail-Original-Message-ID: <CAFCwf12P7S=U+LdtQjzVYnXwnWYTOq+Cre0F+N=tWFg4f23xHg@mail.gmail.com>
Message-ID: <CAFCwf12P7S=U+LdtQjzVYnXwnWYTOq+Cre0F+N=tWFg4f23xHg@mail.gmail.com>
Subject: Re: [PATCH] drivers: Restore alignment and newline in Makefile
To: Geert Uytterhoeven <geert+renesas@glider.be>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 24, 2023 at 12:42 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The introduction of drivers/accel/ broke alignment, and removed the
> newline at the end of the file.  Fix all of that.
>
> Fixes: 35b137630f08d913 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/Makefile b/drivers/Makefile
> index f0972e2226c97cb5..9ea6eb3b5d7b7f17 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -189,4 +189,4 @@ obj-$(CONFIG_COUNTER)               += counter/
>  obj-$(CONFIG_MOST)             += most/
>  obj-$(CONFIG_PECI)             += peci/
>  obj-$(CONFIG_HTE)              += hte/
> -obj-$(CONFIG_DRM_ACCEL)        += accel/
> \ No newline at end of file
> +obj-$(CONFIG_DRM_ACCEL)                += accel/
> --
> 2.34.1
>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
