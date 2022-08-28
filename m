Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BB25A3CE8
	for <lists+dri-devel@lfdr.de>; Sun, 28 Aug 2022 10:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A62010EE15;
	Sun, 28 Aug 2022 08:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B047810EE15
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 08:59:20 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 az24-20020a05600c601800b003a842e4983cso443114wmb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 01:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc; bh=6n2CtwjylJHGKeOQHVvrMhmnklOgYwrq0j6ivmjhucc=;
 b=EVbhcIus7jocM22F8kdsrRXc44SPslZj25giSfVCCzcp9vqQYmTkIYb7OmN4j936R6
 64l3Sjx0sQDkQf4lbcHYSAtBPxTcXIfHhvlfc5zni2AZPoroj7Pxr+BQwq33Bu1z8CoH
 HELfycweKKOle19vporRG4U5hHr/Ujv6ig44dyucmZWGoPXBky7wDv0t1AEU3UgeOwoh
 4hAI58CHrn7LyIjYSnePTE2hgtwaBiuP5eoI0rS4i1ZK3vx9iOzJLzybPwCT3PVn0/CQ
 ahGR1oScXrAb6dofYIcymlUkWf2vdBLXuq4CFubVHoxBH1cxmbHU5yRFa1wRe1WScOac
 BwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=6n2CtwjylJHGKeOQHVvrMhmnklOgYwrq0j6ivmjhucc=;
 b=Sw588ak+lLL8ZvDWK5pSD7+p5ydilO9DqJYMRMPB8rVPDoOCfWY9vkujdi9hlZSH2w
 C72xkB0KnJzsiziyXMsY6SHq/K39LngcLMg14I5uiTAiwZ/KPYxYDq4wi8wVxsTZSt9z
 PZDCZyd3+Ocxamt6aTerwYD++p2FYMvHi6gzTKLERzN04M7338FqOS44G/LhYuto7mJV
 CMtNDURVif8bqETN2OMw4Fk6sh2fARYTWz3GJ+XbSA2kzqU8OpDPL0cUOENRJ+UVgUyA
 OMk6WqSXRK3GrLYNV5wpBxYztQk6672S0QgVcHDrrD9Shx1eheEZnxHytp+1j6eKNSpT
 wTTA==
X-Gm-Message-State: ACgBeo0e+QnhkpIc6ztRc0r8ZKx1MiTmNRN6c2TZkblXPq21QPm7PdEh
 rtZzIUu4aGXN5SheAnGLfMI=
X-Google-Smtp-Source: AA6agR4QKmmDPIdSig2lUuLgA12j+7i/ihGNcz4Vx0b5Yitwxw3Ia77N454CBJhVbPCSgtfPSOtPeQ==
X-Received: by 2002:a05:600c:22c7:b0:3a6:68e4:1e5f with SMTP id
 7-20020a05600c22c700b003a668e41e5fmr4036845wmg.46.1661677159051; 
 Sun, 28 Aug 2022 01:59:19 -0700 (PDT)
Received: from elementary ([94.73.32.249]) by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c3b9300b003a6091b3a96sm6035822wms.23.2022.08.28.01.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 01:59:18 -0700 (PDT)
Date: Sun, 28 Aug 2022 10:59:16 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>
Subject: Re: [PATCH 0/3] KUnit tests for RGB888, XRGB2101010 and grayscale
Message-ID: <20220828085916.GA12952@elementary>
References: <20220816102903.276879-1-jose.exposito89@gmail.com>
 <6761eeb7-eedf-c9bb-4f7f-d42e3c6e8ae4@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6761eeb7-eedf-c9bb-4f7f-d42e3c6e8ae4@riseup.net>
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
Cc: dri-devel@lists.freedesktop.org, davidgow@google.com,
 magalilemes00@gmail.com, airlied@linux.ie, tales.aparecida@gmail.com,
 dlatypov@google.com, javierm@redhat.com, linux-kernel@vger.kernel.org,
 geert@linux-m68k.org, tzimmermann@suse.de, isabbasso@riseup.net,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 16, 2022 at 10:37:49AM -0300, Maíra Canal wrote:
> Hi José,
> 
> Tested the whole series on UML, x86, i386 and PPC. All looks fine!
> 
> Tested-by: Maíra Canal <mairacanal@riseup.net>
> 
> Best Regards,
> - Maíra Canal
> 
> On 8/16/22 07:29, José Expósito wrote:
> > Hello everyone,
> > 
> > This series is a follow up on my work adding KUnit test to the XRGB8888
> > conversion functions. This time RGB888, XRGB2101010 and gray8 are added.
> > 
> > Best wishes,
> > Jose
> > 
> > José Expósito (3):
> >    drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb888()
> >    drm/format-helper: Add KUnit tests for
> >      drm_fb_xrgb8888_to_xrgb2101010()
> >    drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_gray8()
> > 
> >   .../gpu/drm/tests/drm_format_helper_test.c    | 190 ++++++++++++++++++
> >   1 file changed, 190 insertions(+)
> > 

Thanks a lot for testing the series Maíra and for the code review
David.

I added a note to my ToDo list to use KUNIT_EXPECT_MEMEQ once it gets
merged.

For the moment, I'll send v2 :)

Best wishes,
Jose
