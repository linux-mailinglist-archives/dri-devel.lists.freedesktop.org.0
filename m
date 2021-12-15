Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 391D847502A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BBA10E1F3;
	Wed, 15 Dec 2021 01:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DAE10E1F3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:03:14 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id bj13so29552634oib.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uw6bN6d4TEpZ4w8TTcuB+Vquo3dAMeEaia/fJgaxXHs=;
 b=H4muOgjK5/dmipKYb548E8BJxPqSbo3j0zUgv2RPxaIY0janIUUZNlsnqB/Uu2IjEV
 X1oyh+GZmEWsi+4TIxhCX0N0XQ6y8IqecJX/8d+GY3LMattPjYOXZ41rmOfIh1b9cHgt
 wPVE7vKeIPmfH95eql9uPMTETbzvrR9Nu9JECandS49rg0WENRiHo8c2p89DRJsi1G9j
 9ruLwk03ONpGADcAwzoOnNrqb+ug4Rh+Pm6Vxnlxw3tKhEiVGbbZ/5Rs0zmX9BMbiQ4S
 KmJeYJmVSpuzUsBtnyHiTIwNPB1Gx1v+8zNwA6aS0EV6kTE43xLDlSD4yqxilZrI4UBk
 rR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uw6bN6d4TEpZ4w8TTcuB+Vquo3dAMeEaia/fJgaxXHs=;
 b=0qoKeF4D7vY4NoWLPlvGfKYclyzxWK0Y2yzxCxFJ4/50mnLzfdk6HFiSu4dXY0Socm
 +Z+pqNPEzKcL7eTtuiCfC8ZslUiajdzxpV1t2bX5wAaNBh2XzOqVGzwtb8H7jy/C+pE5
 J7V7N4okeQQcuducYEtucuOY3V0T+Rxw39NFwXjIBsu3rmvujdFYezVsiKCgvSWTD5uE
 kNlLejkILS+3X/V/WuYPydV7qBxu1OvDQDNKjg1x8+ILW9zxSb88eXdGD9HKzcpUeLnQ
 qp2hvOnmYPM/mBOJg4+bSCoOXXmwH8z6yNCOPuMsXxZzKWgwf6QYXUiR6O8iYjQvzJ+M
 fACA==
X-Gm-Message-State: AOAM5313FsyiQ93BeVZi+lq2CQSBgUn5H3B9KZTE1dIByBPUobDa5Wfz
 q8aiNc9OxSebfZfkz4DPdX8lEO+j1M5N4Ru8P5vudKE+8STLig==
X-Google-Smtp-Source: ABdhPJxliBCdAwd2D2fYqD1C2K2IdEZ42OdIUesvDoXQZeocLw/E99x719/CgLnSa9cMHZF1p6JG+ArPNcBQZ24Ri7Y=
X-Received: by 2002:aca:120f:: with SMTP id 15mr6921450ois.132.1639530193662; 
 Tue, 14 Dec 2021 17:03:13 -0800 (PST)
MIME-Version: 1.0
References: <20211215010008.2545520-1-javierm@redhat.com>
 <20211215010008.2545520-57-javierm@redhat.com>
In-Reply-To: <20211215010008.2545520-57-javierm@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Dec 2021 02:03:02 +0100
Message-ID: <CACRpkdbmLyXhGbuKEaCL=M=52huK3H-8_O-z_gyjf_95gO-fsw@mail.gmail.com>
Subject: Re: [PATCH 56/60] drm/tve200: Add support for the nomodeset kernel
 parameter
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 15, 2021 at 2:01 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:

> According to disable Documentation/admin-guide/kernel-parameters.txt, this
> parameter can be used to disable kernel modesetting.
>
> DRM drivers will not perform display-mode changes or accelerated rendering
> and only the systewm system framebuffer will be available if it was set-up.
>
> But only a few DRM drivers currently check for nomodeset, make this driver
> to also support the command line parameter.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
