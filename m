Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE47342FDC1
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 00:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310DF6EDFB;
	Fri, 15 Oct 2021 22:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958576EDFB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 22:01:34 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id t16so43243929eds.9
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 15:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VdArxZN7JWq/GtMisAnVnOhcFRIyl27YGTGhWESz1Mo=;
 b=AP7PoE3eVj1rJ3LwTKXMtVjphKGuZDmojGn687G2JyiWjbUZ38mpygQ81X1Ccga0nB
 uw5SbwsTU0VeQ4dTnrMVjIT3dX1ImpV+ZhYfAfe2VsfxVgYOD6fceMzt08fuDcj+9oUt
 BNVrXhhT0hZphbEBNJQZp8RbW7uoluOLWX6/2EORr41YfYJNGWhGPsMKE0LqopJl6/8j
 Qm/M10AuIt/LBjaEKdCYEahKpJJpw7ywrJtmarX1XtLBetjKViPaq2ufVe7i1VUFQiMQ
 3E23NkJYGcoW4dx1p0EoomFAlYBoR4RdvYaI8gxWE7Zs6tMOdRFSXOIsKiQW0b3zmWqW
 C5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VdArxZN7JWq/GtMisAnVnOhcFRIyl27YGTGhWESz1Mo=;
 b=4LWL4DFRy9FFgYSM+wUJx41vu6nv1s65Jp/jjxLcrqhRWHu5pIKdJuiPb3jXM9q1ST
 JLEfjFGhBlatrwK72zvLOTKzbBM6ymE7k1FIL1zDTH++SlND0/WaMj1gGuDkiqJtqpfT
 nlbqTOEvG6Jh9Qm8Op5qF638pvHGMDeY70qXbkGQUzPho54E5AghbBms1uan81mUpAgp
 GANPoO2DbQ8aJ8J8mkNI4M+FtHk6a26XImBQoKDYxn1bTvovKnXUiGBjkQ03e378igur
 gJxefdWRnCN6M1GDI8VBrl4KC7/0uSaRF7Tw68pK2bO2GDb30/lYs8YDM9CR8XrG2mDJ
 cnDQ==
X-Gm-Message-State: AOAM531Jp9Qbcs4/t7/oXA+ZwDz73rSWYCcXC4DBjPSKjPZi4RB8lxsi
 yKZ2fkQCCXR8j+Z2tctGv0X2jcUJsj6lhpYflEc=
X-Google-Smtp-Source: ABdhPJyNzRTtu3SHzdokxlvf3m2rFKEjdlgvWFQNN8uNikRTK52xQUEX9H3Fr68f+iA1J0yFdfk/EEwLH3H1aa51FtA=
X-Received: by 2002:a17:907:2d28:: with SMTP id
 gs40mr10145552ejc.203.1634335293007; 
 Fri, 15 Oct 2021 15:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
 <20211015141107.2430800-4-narmstrong@baylibre.com>
In-Reply-To: <20211015141107.2430800-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 16 Oct 2021 00:01:22 +0200
Message-ID: <CAFBinCAo4-shmtpN=nNMEwTSu-cZJrqX+0+mctM0Vn57ZS=ytw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] drm/meson: split out encoder from meson_dw_hdmi
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Fri, Oct 15, 2021 at 4:11 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This moves all the non-DW-HDMI code where it should be:
> an encoder in the drm/meson core driver.
>
> The bridge functions are copied as-is, except:
> - the encoder init uses the simple kms helper
> - the mode_set has been moved to atomic_enable()
> - debug prints are converted to dev_debg()
>
> For now the bridge attach flags is 0, DRM_BRIDGE_ATTACH_NO_CONNECTOR
> will be handled later.
>
> The meson dw-hdmi glue is slighly fixed to live without the
typo: slightly

> encoder in the same driver.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
apart from that typo (please fix it up when applying the patch) this
is some great work!
it helps me a lot with HDMI support on the 32-bit SoCs
with that said:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
