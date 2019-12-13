Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E0511E1F4
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 11:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE906E2BC;
	Fri, 13 Dec 2019 10:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2EC6E2BC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 10:30:28 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y11so6069994wrt.6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 02:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MW5Zie9YB0PL/+73229K4MQ5EabrfJmWqqvKiyi55ZA=;
 b=gW9j/8wsNp4IM0Jiyq3lMOqqEAuOi9Ql72oIJrDEHg0kC1IfWAqPsUXX585RtN+bxp
 TIVe8BB6lz6T4CcZo8QAjZ/wnuEaUBJLHWxabM2ODQY633YIsz5Ux7WXSz8AZ7NPGOIK
 qo3jLccGJ8yqPvIhtaNMMt6pcAIw5KPl6him4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MW5Zie9YB0PL/+73229K4MQ5EabrfJmWqqvKiyi55ZA=;
 b=CKuYecO/oVGlM6LJBbHrNSSv7Cn7vEhk1sXMYE8YcvhBytwDsJgv7ATfVNlAjxEdBI
 Q7B92QSWQKKNr0A8Gpiqmhziajs+b+5pTIm+WaLSKflI6IHwcfdiY0UG9iAnlPBeAoEG
 SiAidCBTg3m7+IKMUY6CyWJmVZiZVd39WlMWM+fd0w2XWiEsj5vgc3xd/cTRZLRCad0Q
 tAQge2jtQgVR7wA9NC/6Sd0+xM/2y0MwCZlD/w2B1iSXf5dHCBFI8iuS1TXVvAqFbtcH
 kAGJb+Wc0k3VGaC1c6BSkVvz0IPCDdFRta2/b8xndi7mYIiJG7FB3aH+wOIKZuj7zeHW
 izSg==
X-Gm-Message-State: APjAAAVOc/iRR2yKqUgIWLR8YtnivH9lgLLZ5ILCNz9/Hhid0sKLDyPs
 tU7mQPcB3OKhTc+VkNbMqB26Tg==
X-Google-Smtp-Source: APXvYqyI4U5+ACQOcPaVzoLD3INSXA2p09Bfcn2xpGoA/cyWYIWcbwgJC6V20ZUZ8g7cgZ5bgsAfTA==
X-Received: by 2002:adf:e290:: with SMTP id v16mr12441091wri.16.1576233027546; 
 Fri, 13 Dec 2019 02:30:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id j130sm4983543wmb.18.2019.12.13.02.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 02:30:26 -0800 (PST)
Date: Fri, 13 Dec 2019 11:30:24 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v3 5/5] MAINTAINERS: add entry for tidss
Message-ID: <20191213103024.GH624164@phenom.ffwll.local>
References: <cover.1576158368.git.jsarha@ti.com>
 <09da3a37ca59bb45bef62f2335a191985363d393.1576158368.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <09da3a37ca59bb45bef62f2335a191985363d393.1576158368.git.jsarha@ti.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: devicetree@vger.kernel.org, yamonkar@cadence.com, praneeth@ti.com,
 tomi.valkeinen@ti.com, subhajit_paul@ti.com, dri-devel@lists.freedesktop.org,
 peter.ujfalusi@ti.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com,
 sjakhade@cadence.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 12, 2019 at 03:52:01PM +0200, Jyri Sarha wrote:
> Add entry for tidss DRM driver.
> 
> Version history:
> 
> v2: no change
> 
> v3: - Move tidss entry after omapdrm
>     - Add "T:     git git://anongit.freedesktop.org/drm/drm-misc"
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  MAINTAINERS | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 741e3f433f6e..e89fbfb1ce06 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5559,6 +5559,17 @@ S:	Maintained
>  F:	drivers/gpu/drm/omapdrm/
>  F:	Documentation/devicetree/bindings/display/ti/
>  
> +DRM DRIVERS FOR TI KEYSTONE
> +M:	Jyri Sarha <jsarha@ti.com>
> +M:	Tomi Valkeinen <tomi.valkeinen@ti.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +F:	drivers/gpu/drm/tidss/
> +F:	Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> +F:	Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +F:	Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
> +T:	git git://anongit.freedesktop.org/drm/drm-misc

Is the plan to also move other TI drivers over (like tilcdc) or just an
experiment to see what happens? Asking since if eventually omapdrm moves
that might be a bit much (or at least needs a discussion first).
-Daniel

> +
>  DRM DRIVERS FOR V3D
>  M:	Eric Anholt <eric@anholt.net>
>  S:	Supported
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
