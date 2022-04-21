Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568B35098A7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 09:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2E510F349;
	Thu, 21 Apr 2022 07:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B052A10F346
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 07:10:18 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z99so5289951ede.5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 00:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nbjLblII7Z2uoGDQq4GfVdmFvR2bagmypp3+70OIo8I=;
 b=P6UpypImljS5OSfnMO9hdrzhulrB9Of8rz9z+jnrnUrobOmeQNpmMMtZIbS8XGleeC
 KanXbo8DdrB/5L5BYPR4FkBv9hSe3y81W9vKpxP4hUwxP1H+SsZO7e4E/taDSSs6AJw3
 NUp9eI5zLVOWaYtsZd7a6jShDZKODICVUm82gOzUKKgDdi8OKYJEWireg+gmLrEKoVko
 3Qx6A/V5Ewcv9tIsihoVIynQFQHMhkbLmhu7T7p93DIVy4htGM3Q1sJLkMcuQLT8D3L1
 xlxUPPZQgxnX7opM8A60mRBREcfxBgKfgcWMb7Rj7coziz0JY0ldoIwNVS4WlLhncyBl
 rt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nbjLblII7Z2uoGDQq4GfVdmFvR2bagmypp3+70OIo8I=;
 b=6zp5o5hGYSC4qpMzxZlsDcp/FoNLRD2J1npEELrUpl1k67kzZzgVG81cvLlcoTUcFI
 FN//pzSWyyvw6EiCYfv3FwUFvqFmJBt1ugtLZIOmxE0GnLfAmCTqWr7mqJ+hzzuXKZsT
 zMhhLyDtcAgNF/QCcXAnI1JhzfE4FaWt3s6jtOUQFK3IM/LDmLcUKi/JqLTl2bqDxPvx
 Kn2SRWBMgLW6llljk4cbFr31UIAfQiTIm6+lF8uBeA925LhlTTNobjBJCpLEmPyHaQMG
 kNqY/Dyurzbncy0RuZWuJV1H3TLZNU3D83zHyEebfHrTWAxoDzXZUz+ghIieoeAyic3s
 h+tA==
X-Gm-Message-State: AOAM533W5IBh/RQzaPwf2gAmHvpcKWkrJ+rixKGzte/eLpaiFRYufYvH
 EsBTHG6UXlsr/TSXCDEijTY=
X-Google-Smtp-Source: ABdhPJzr84nRJtm+qBzUEfqcugaiD6jjrathMDD2cdUzX0mdEOEFkYF92L6clSwrVyD+XYRwdQG7kA==
X-Received: by 2002:a05:6402:3592:b0:423:d71e:41dc with SMTP id
 y18-20020a056402359200b00423d71e41dcmr25069151edc.402.1650525017140; 
 Thu, 21 Apr 2022 00:10:17 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84]) by smtp.gmail.com with ESMTPSA id
 n25-20020a1709062bd900b006e8766b7907sm7499660ejg.223.2022.04.21.00.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 00:10:16 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Samuel Holland <samuel@sholland.org>,
 Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [RFC PATCH 00/16] drm/rockchip: Rockchip EBC ("E-Book
 Controller") display driver
Date: Thu, 21 Apr 2022 09:10:15 +0200
Message-ID: <1790161.aHo8FjPgqx@archbook>
In-Reply-To: <20220421084338.084c4d6e@aktux>
References: <20220413221916.50995-1-samuel@sholland.org>
 <20220421084338.084c4d6e@aktux>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: David Airlie <airlied@linux.ie>, =?utf-8?B?T25kxZllag==?= Jirman <x@xff.cz>,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-rockchip@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Liang Chen <cl@rock-chips.com>,
 devicetree@vger.kernel.org, Alistair Francis <alistair@alistair23.me>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Donnerstag, 21. April 2022 08:43:38 CEST Andreas Kemnade wrote:
> On Wed, 13 Apr 2022 17:19:00 -0500
> Samuel Holland <samuel@sholland.org> wrote:
> > Blitting/Blending in Software
> > =============================
> > There are multiple layers to this topic (pun slightly intended):
> >  1) Today's userspace does not expect a grayscale framebuffer.
> >     Currently, the driver advertises XRGB8888 and converts to Y4
> >     in software. This seems to match other drivers (e.g. repaper).
> > 
> >  2) Ignoring what userspace "wants", the closest existing format is
> >     DRM_FORMAT_R8. Geert sent a series[4] adding DRM_FORMAT_R1 through
> >     DRM_FORMAT_R4 (patch 9), which I believe are the "correct" formats
> >     to use.
> >
> hmm R=red? That sounds strange. I am unsure whether doing things with
> lower bit depths actually really helps. 

Hi,

for single-component formats, the name of the component plays
practically no role. Even if said component was really red,
it makes little difference to either side.

For example, the OpenGL straight up refers to all single component
image formats as only using the red component:

	OpenGL only allows "R", "RG", "RGB", or "RGBA"; other
	combinations are not allowed as internal image formats.

from https://www.khronos.org/opengl/wiki/Image_Format

In truth it would of course be nice if the world agreed on
not making the name of data structures imply some way they
are to be processed, but humanity hasn't gotten there yet.

> 
> Regards,
> Andreas
> 

Regards,
Nicolas Frattaroli


