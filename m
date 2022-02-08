Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F434ADB44
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 15:36:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA11E10E265;
	Tue,  8 Feb 2022 14:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1080810E265
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 14:36:04 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 q145-20020a4a3397000000b002e85c7234b1so17787531ooq.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 06:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3E3r6Gvdt1TsjWVZp7Q+MZWSTjUxL9aI47zydUPIpFs=;
 b=WiD6fpLGyGEdbggowUeEe1o0saR50n/ROkERtSGwA3XzZPK/Fl9vzi0v3BCRE/ETU1
 4EZIfftm+nBLnuOn1HeC+XZerK9s8AK3gm9K061QsBLY3s4oHHEZB6hrzUJpbAi4Bytc
 d7yvodXOuiOrObz39GylnBGbJ+ySplxkqf2wqKeLFx5nNjSsaa0FNTpv4jiHCGLoKHWe
 XgLJjgCUjP8aQVY+r+bNegPbHTH3vkZ92FDo3A7S9MA9kieH4x3l6rEAPP+3EVAc15PG
 y476e2n44s0M+lCkq+//g51kwXD6/TVW425UC1Q16mzM+o7xIBrS2x72/cSsfW+J6wtx
 eA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3E3r6Gvdt1TsjWVZp7Q+MZWSTjUxL9aI47zydUPIpFs=;
 b=t/tkGsSX3QKSw8lwFRPPlW13Qdu9B7wle2xoyQDYJFjGRAao1yAa4GRtRpX83gDyLr
 3uljoPLwwmtvPIbBWJU3B8RRnwtNYsMWo2j+axIpu/cBXgGseDSHNwZK6nbDuz0HLMTQ
 YM+rtF6PGHEW53InoNZkPbAZjVhXunTfnlG7MpwRRUu0/dZR0NLsz/ZcSYihiYaJbIFD
 2QEDzQCZv93J4/UxF8D/vfBTdQMWfE5HWB7aLcnV6ZapJlHgrV86RO3IWYBqSnbGe3eh
 5ePF20b/iTJwjXY3EwJygF5uTcdtS+AfVg2oZa8Tfi8cURxUbzdLBNG4X4T6vFGImg8g
 KxZA==
X-Gm-Message-State: AOAM532mDJ1z4RNDYsWcO6qM26N1TjxsHEp5fEsb9ShxA9/LsDYZsXJ/
 kwHTd8tDLAjPEVtsQHDFej9rd2iO1IPHgqF6lFwJwuvz
X-Google-Smtp-Source: ABdhPJySyitmZnEk0DhErL7kT8VMqrOZlc9+BAEiI/qNA6a3Z5FdbiS2p1AGmpPuStHAiozZQ6zid9R+Fk1GSP1P30g=
X-Received: by 2002:a05:6870:54d6:: with SMTP id
 g22mr434012oan.225.1644330963201; 
 Tue, 08 Feb 2022 06:36:03 -0800 (PST)
MIME-Version: 1.0
References: <20220208143152.5846-1-tzimmermann@suse.de>
In-Reply-To: <20220208143152.5846-1-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Feb 2022 09:35:52 -0500
Message-ID: <CADnq5_P2VAf=HxWRc8dYrO=uDjofYXA=tUOBV4u0yjYNNRZ-HQ@mail.gmail.com>
Subject: Re: [PATCH] drm/udl: Set VGA connector
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Dave Airlie <airlied@linux.ie>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 8, 2022 at 9:32 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Set the connector type to VGA. The previously exported DVII type
> isn't even supported by the driver.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/udl/udl_connector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/udl/udl_connector.c b/drivers/gpu/drm/udl/udl_connector.c
> index 930574ad2bca..318fdb38b47a 100644
> --- a/drivers/gpu/drm/udl/udl_connector.c
> +++ b/drivers/gpu/drm/udl/udl_connector.c
> @@ -128,7 +128,7 @@ struct drm_connector *udl_connector_init(struct drm_device *dev)
>
>         connector = &udl_connector->connector;
>         drm_connector_init(dev, connector, &udl_connector_funcs,
> -                          DRM_MODE_CONNECTOR_DVII);
> +                          DRM_MODE_CONNECTOR_VGA);
>         drm_connector_helper_add(connector, &udl_connector_helper_funcs);
>
>         connector->polled = DRM_CONNECTOR_POLL_HPD |
> --
> 2.34.1
>
