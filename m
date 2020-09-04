Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A33C725DCDD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 17:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAFC6EC60;
	Fri,  4 Sep 2020 15:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9EE6EC60
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 15:09:51 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id i17so6787796oig.10
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 08:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pDK/W863J4Emn1hkynlvhr7fPRAsMPX6ZEbd3sQLo0I=;
 b=g2D2qGtM/WYDLwSvJbX+jaBrlLxeXrw2h98Bytw/9YXLeUUNpuxEO0G+yMcVkqL9x/
 FvUlngKXsRsMh06LU8Xd53alpdZRFlk3k52a9TlqoBfXqdfWI7a/SnOaOlK4BQ3MdrNL
 4zFI3UYoeh5EdMI2FN+JcKkDhVH1eSLLQ2ux0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pDK/W863J4Emn1hkynlvhr7fPRAsMPX6ZEbd3sQLo0I=;
 b=m510KAYs9AgHRxmX3LEKLqQSriVXbio82bordhuyCzRrXF749BKyacpl5lauOxvv4z
 PQHtv1dR/PpbPEcDT7Pr3MmjmYKSyen9DJ4TpYXlMe1eVdgAt9VXsADmq4habzxzgsw6
 S2bDbP1TMveg1CvqSGGySFc/7MwhMMflsA7KBfsUVr3xET17KGgWlPM9B3RNsvyKuvVf
 EhSK+wE35UFy90AdLHWK9nodGS+qR/xMnCPoFsl7rodH0mVnO2wCurMsRPHLbmydxUNr
 0aO8M6goKMlbwpO51EPnGWH8Ox8g/odsLB55Aj8WJ3NaEjSmiOXSTAvicnVvumeaCbeX
 2CcA==
X-Gm-Message-State: AOAM531IUpSF/X1bXPB1KXX7fWVQxoESuCn42W/Spgp4/JakOPyX+IFW
 1johSAUPwgzGzHP6oN2Dtx/VOSlZA4ZZ3SqboGrCeQ==
X-Google-Smtp-Source: ABdhPJxPJzpMyfCwWQaTqMdDuKLDqebC6uSpZLg67V6hw4kRA3DJgPwgwnTtpUQIMpeD2MqRoBLl3L7TtNrQm9/xMXE=
X-Received: by 2002:aca:ea44:: with SMTP id i65mr5577999oih.14.1599232190594; 
 Fri, 04 Sep 2020 08:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200904130605.vs5tnfhgnemnz6pt@smtp.gmail.com>
In-Reply-To: <20200904130605.vs5tnfhgnemnz6pt@smtp.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 4 Sep 2020 17:09:39 +0200
Message-ID: <CAKMK7uG+qXLn4Om6oZhyYkKk=Cb57CNSzpJv=rLCds6xpk+dhg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add entry for VKMS
To: Melissa Wen <melissa.srw@gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 4, 2020 at 3:06 PM Melissa Wen <melissa.srw@gmail.com> wrote:
>
> Add myself as maintainer of VKMS driver
>
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Congrats!
-Daniel

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 01fb9ee6b951..d4277824a01c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5640,6 +5640,7 @@ F:        drivers/gpu/drm/udl/
>
>  DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
>  M:     Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> +M:     Melissa Wen <melissa.srw@gmail.com>
>  R:     Haneen Mohammed <hamohammed.sa@gmail.com>
>  R:     Daniel Vetter <daniel@ffwll.ch>
>  L:     dri-devel@lists.freedesktop.org
> --
> 2.28.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
