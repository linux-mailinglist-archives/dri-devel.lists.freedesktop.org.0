Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EB47AB508
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 17:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F3D10E698;
	Fri, 22 Sep 2023 15:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A315710E69E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 15:44:33 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4053cb57f02so10697415e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 08:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695397469; x=1696002269;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x30RhvJx7Eh4gJJcrIw3/KmQaNQO6cXN4EDW/eJIqIA=;
 b=VAWUuGf7UWlVV7TiHlB2KhHUdYS3mFG9mgq7zX0KM8FB+wdFJEObi4N2qShWxKhB8E
 jJ1LDSEDqXHpLra8kkVA5bzVYcwF6uxjfCXtnIdowUsyYVNBCNxWTgVPe81LgyUpOy75
 camTH9P8n6fQi4ZDRIpRQcs8UokEvzIpoh/LU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695397469; x=1696002269;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x30RhvJx7Eh4gJJcrIw3/KmQaNQO6cXN4EDW/eJIqIA=;
 b=i47OWfvb/1Oc6/HqhBhOeAw3YbGg9AB4ZXkSXqr5Nb4rEQwYQIrh+a7gJb5UeeczWD
 vsiq45DMwh0/toDYewLTdGpQ+t29PdGQhldzv8Gfa4jGY3XWG1WyDf+XxGHvgHJIGHlz
 nH5lpa+BFX+H8oF87cl0mwzISWcV7qI6r4izYLN0+RElSY8HriMA9u/DiRyoCscGUOky
 Vi1RIVFlZau66dW45TFZCRxbVFjDVTTDgyEDNjxH18Xkgy7SVGVGOm8Va+XDOX4K8I0Q
 19flr3fc4zdYDTNarAPE+cMHUb2PVA8d5jgw4CEjYvc9hgShYsv2mOYUVZLmiThAxNGP
 ryXA==
X-Gm-Message-State: AOJu0Yxmp7rXuOQOUXXwTQuP0q/daRj5j0iaLWpaBISHBkNE2IeMCWmJ
 bmmzaeOgyOCadAx+bpj//6bog4E2CsJJGK3eZjGkpWeY
X-Google-Smtp-Source: AGHT+IEGXT5zVB7wx0xpi9Xp7yYkLZsSCKZkI0lBKnBNV3BM/K5j69HvkyGk2qsL++cAjNne6IuLVg==
X-Received: by 2002:a05:6000:1c7:b0:31f:e5cf:6724 with SMTP id
 t7-20020a05600001c700b0031fe5cf6724mr34843wrx.46.1695397469201; 
 Fri, 22 Sep 2023 08:44:29 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 d4-20020a170906370400b0099bd8c1f67esm2882344ejc.109.2023.09.22.08.44.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 08:44:28 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4053f24c900so69045e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 08:44:28 -0700 (PDT)
X-Received: by 2002:a05:600c:2e4c:b0:404:7462:1f87 with SMTP id
 q12-20020a05600c2e4c00b0040474621f87mr79571wmf.6.1695397467960; Fri, 22 Sep
 2023 08:44:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230921192749.1542462-1-dianders@chromium.org>
 <20230921122641.RFT.v2.1.I134336fce7eac5a63bdac46d57b0888858fc8081@changeid>
 <20230922075610.ekrzyz6hfcd3rjsm@fsr-ub1664-121.ea.freescale.net>
In-Reply-To: <20230922075610.ekrzyz6hfcd3rjsm@fsr-ub1664-121.ea.freescale.net>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 22 Sep 2023 08:44:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=ViV-n2T1Bup+XScsWD11yWpTmW3qEOLTTDj3kTtTY4Cg@mail.gmail.com>
Message-ID: <CAD=FV=ViV-n2T1Bup+XScsWD11yWpTmW3qEOLTTDj3kTtTY4Cg@mail.gmail.com>
Subject: Re: [RFT PATCH v2 01/12] drm/imx/dcss: Call
 drm_atomic_helper_shutdown() at shutdown time
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: kernel@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-imx@nxp.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Sep 22, 2023 at 12:56=E2=80=AFAM Laurentiu Palcu
<laurentiu.palcu@oss.nxp.com> wrote:
>
> Hi,
>
> On Thu, Sep 21, 2023 at 12:26:44PM -0700, Douglas Anderson wrote:
> > Based on grepping through the source code this driver appears to be
> > missing a call to drm_atomic_helper_shutdown() at system shutdown
> > time. Among other things, this means that if a panel is in use that it
> > won't be cleanly powered off at system shutdown time.
> >
> > The fact that we should call drm_atomic_helper_shutdown() in the case
> > of OS shutdown/restart comes straight out of the kernel doc "driver
> > instance overview" in drm_drv.c.
> >
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> No issues found on i.MX8MQ.
>
> Tested-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Thanks! Would you expect this patch to land through drm-misc? If so,
I'm happy to commit it there with your tags. If patches to this driver
normally flow through drm-misc, I'm also happy to post a patch to
MAINTAINERS (or review a patch you post) adding this to the entry for
"NXP i.MX 8MQ DCSS DRIVER":

T:     git git://anongit.freedesktop.org/drm/drm-misc

...which would make it obvious in the future that things should land
through drm-misc. This is similar to what I did for commit
92e62478b62c ("MAINTAINERS: Update DRM DRIVERS FOR FREESCALE IMX
entry"). :-)

-Doug
