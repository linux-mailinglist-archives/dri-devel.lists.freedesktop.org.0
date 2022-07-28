Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ECC58453D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 19:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9B010E778;
	Thu, 28 Jul 2022 17:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B379D10E9DC
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 17:51:13 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 8-20020a05600c024800b003a2fe343db1so1447542wmj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 10:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=YlUW33qUz1u3QNCrgfswPy2v8jgmUdUSwTGtmme6eU0=;
 b=gDYHTL3xoRdr9vSsvTGmVAXGy9L+evVGkWjk2OYYBZuR3GD/xaOvfRkn5MD9/JBvBS
 1RG64ID8OmN79RzUkupMYuRwR9GVfZ8Vhv/H4sStkU54BxKUX3rgso3H4KtGUU9T56hh
 KVfvjsoxRlp6eOr1RznozlMDbt3+I11MFFR4OURGxDxXIjcX1gKbM9E0uMybS9JV2vVa
 BLwoHeAk3b1rF3BPi45vczhNH9mhBCtEfJKcgi9u0a056e4c64yrlyBkc4sTtU0g0zVr
 +0OABpJqa8AmK0MimMB8sHLzCPwiVgSpOYlQQhAmG74kvPB1W66EWov+AVSVGOquACHr
 X+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YlUW33qUz1u3QNCrgfswPy2v8jgmUdUSwTGtmme6eU0=;
 b=LyzPtuqEeJj6h4Bc+ed4dBSkdayWOeiox6qPYghMVY0AiS8JTzqHTzZB3+U22wozAj
 6h2FbyQ18aJ2avgBRaHlHJghWk15jCZdvDyXIwyikCowCWyQW0+VnfZbttKOZhUWkQ3v
 x0I6xE4lKz+6ApL8YBB1WaXtoYU2U8IW2VsX8+uK42W/tGbUEiPp8whPpRw2idR6tgN7
 z5bXmW/ZvLAcv4Etl/B9OWEBfm/PEWW+6mugFN554M8/Ez831JDzmhh5+ItCDpmzTrao
 +z8KGQjYkKXnvIkr7z8G1e7eWoxWI6KjMgI8OssI7mPTkndwmZAQtRioUXdN29Aj4zC6
 VyYg==
X-Gm-Message-State: AJIora+eJhguZX8vqxF8KLbDD45SJpgSAexjINrFiJ1od4PX+08/JPkR
 Bdf4SZTt0aDDvy+PmWgg8YQ=
X-Google-Smtp-Source: AGRyM1sPPRMmaaBCJ523PjfKUrU6TnxSMuf4S7TtJszu0YhyO9G/4nJ7bk51F33yS1etRuoMHzthGQ==
X-Received: by 2002:a05:600c:510f:b0:3a3:254c:b081 with SMTP id
 o15-20020a05600c510f00b003a3254cb081mr345788wms.65.1659030672106; 
 Thu, 28 Jul 2022 10:51:12 -0700 (PDT)
Received: from elementary ([94.73.33.57]) by smtp.gmail.com with ESMTPSA id
 n40-20020a05600c3ba800b003a2ed2a40e4sm6526699wms.17.2022.07.28.10.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 10:51:11 -0700 (PDT)
Date: Thu, 28 Jul 2022 19:51:08 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: Re: [PATCH v3 0/4] KUnit tests for RGB565 conversion
Message-ID: <20220728175108.GB52359@elementary>
References: <20220726230916.390575-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220726230916.390575-1-jose.exposito89@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 magalilemes00@gmail.com, airlied@linux.ie, maira.canal@usp.br,
 dlatypov@google.com, linux-kernel@vger.kernel.org, geert@linux-m68k.org,
 tales.aparecida@gmail.com, davidgow@google.com, isabbasso@riseup.net,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 27, 2022 at 01:09:12AM +0200, José Expósito wrote:
> Hello everyone,
> 
> This series is a follow up of the XRGB8888 to RGB332 conversion KUnit
> tests.
> 
> As I mentioned in v2 [1] I suspected that the inconsistency handling
> the endian might need to be fixed.
> Fortunately, Geert Uytterhoeven fixed it in commit 4d9db10576ff
> ("drm/format-helper: Fix endianness in drm_fb_*_to_*() conversion
> helpers"), so I updated the tests to reflect his change.
> 
> Changes since v1:
> 
>  - Fix a bug reported by David Gow in the XRGB8888 to RGB332 tests
>  - Simplify the test structure as suggested by David Gow
>  - Add Tested-by Tales L. Aparecida and Acked-by Thomas Zimmermann
>  - Fix link in the last patch (Thomas Zimmermann)
> 
> Changes since v2:
> 
>  - Test endian as fixed in commit 4d9db10576ff ("drm/format-helper: Fix
>    endianness in drm_fb_*_to_*() conversion helpers")
>  - Fix Sparse warning reported by David Gow
>  - Add Reviewed-by David Gow
> 
> [1] https://lore.kernel.org/dri-devel/20220709115837.560877-1-jose.exposito89@gmail.com/
> 
> José Expósito (4):
>   drm/format-helper: Fix test on big endian architectures
>   drm/format-helper: Rename test cases to make them more generic
>   drm/format-helper: Support multiple target formats results
>   drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb565()
> 
>  .../gpu/drm/tests/drm_format_helper_test.c    | 169 ++++++++++++++----
>  1 file changed, 139 insertions(+), 30 deletions(-)
> 
> -- 
> 2.25.1
> 

As suggested by Thomas [1] I pushed the series to drm-misc-next.

I've found some conflicts in drm-tip in unreleated files I'm trying to
figure out on IRC though :(

Jose

[1] https://lore.kernel.org/dri-devel/4ba57f80-5025-c3a0-5f65-ec52643f0122@suse.de/
