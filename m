Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A421CA7F3
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 12:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA476E057;
	Fri,  8 May 2020 10:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62866E057
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 10:09:32 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id g35so441832uad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 03:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FwE3UsWT96cqONd5K4XH+qgJcMDeEiY1HojvEXSbDJM=;
 b=STbTjv/IGOQd8q0f8kBVpMK8LtTBiJZuUFkZaEsPb6ODmfIt/NcksNctnyH9JfG0+d
 WPtfKJPK/VxNKqXSqan4/lqHpkOjW5zu0jO6R+UTvmvNsBUr65kXSmp6Zn0yiRoGKiFR
 CK5bmpdKEB6Vzoz2UbydRLZC065n/s4paEdQjK7dEyVqxo9rQJUVGy+wPQZOPQHXPFTd
 fVd877A4rh9vi9os+Xoqd6+Dh0rMiSG2SHifqYQRxRliFjrU5Ja2TKM+y9Ao40Uolraj
 3x/JLvSxSWL06pUuRPcr47X4G0n+lP4G8LOQfibTv4kgj33o29Al7WmgSrp5AIkNYCan
 LZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FwE3UsWT96cqONd5K4XH+qgJcMDeEiY1HojvEXSbDJM=;
 b=jtwCEK6ERBHQzVFUeN6+eUPMhmGdE4CHR59/dQ5X26nc35pRz8GvO25xahi8JwbPoL
 l61dn+nnjmgftNkUCu8ie/UZ1y4cX4R7JcqXbIES2TdtIPpDQ3MvEAJPzS1AUC9VdYVz
 yyXFHpca+VRilrgNZooiXRHCIPc+nnfS+zQtN8aljdJBjglyTRVh4nDuJteeZphfDQHU
 H5sQJ3VqPHJLHrV/ZjCG9ZPKHfYqvVo17K3Bj19PCa/JFKSP0lHzu9RVdZThAkdamqMH
 254KewdGR7gdZGj4GdxZweWU0fP3T02Z4qDd8JtacvXiyAdTCO9G9PB9/SGl/6BRDG/3
 OE7g==
X-Gm-Message-State: AGi0PuYHTSzCf/zEgqHIp0haSjZ74MjdwAwbB5QuTog9EWU5n6wP0+Nq
 uomCsx7SxDE1bcfdQEGtvVHv8FyBiQJ28brTOVAXv+46
X-Google-Smtp-Source: APiQypLTNmCg//d4ub+dhblSNOLaoB2rgX3pdgAsx2Gl0KDqkp3krHjaFjmcTAYBr/+UUwSSYJxfWvJuLgnmJtWKGn0=
X-Received: by 2002:ab0:18d:: with SMTP id 13mr1228362ual.69.1588932571915;
 Fri, 08 May 2020 03:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-5-emil.l.velikov@gmail.com>
 <20200508062749.GC10381@phenom.ffwll.local>
In-Reply-To: <20200508062749.GC10381@phenom.ffwll.local>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 8 May 2020 11:07:00 +0100
Message-ID: <CACvgo50XZqz=fTK45+-NFV3u8Fxycy4hBycHG5pw=bRQRTouog@mail.gmail.com>
Subject: Re: [PATCH 04/36] drm/doc: drop struct_mutex references
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 May 2020 at 07:27, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, May 07, 2020 at 04:07:50PM +0100, Emil Velikov wrote:
> > From: Emil Velikov <emil.velikov@collabora.com>
> >
> > There's little point in providing partial and ancient information about
> > the struct_mutex. Some drivers are using it, new ones should not.
> >
> > As-it this only provides for confusion.
> >
> > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
>
> I think a doc patch to add a big warning for drm_device.struct_mutex would
> also be good. The current text is kinda unhelpful.

Would something like this be enough?

diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index a55874db9dd4..0988351d743c 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -146,6 +146,9 @@ struct drm_device {
  * @struct_mutex:
  *
  * Lock for others (not &drm_minor.master and &drm_file.is_master)
+ *
+ * WARNING:
+ * Only drivers annotated with DRIVER_LEGACY should be using this.
  */
  struct mutex struct_mutex;

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
