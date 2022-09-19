Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CAE5BC421
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 10:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFB310E5AE;
	Mon, 19 Sep 2022 08:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C14910E5AE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 08:18:12 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id n8so12819101wmr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 01:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=ZHoX1E0pKQsE6388AWWZYn9R8dI2szExvawhZ0L+wnU=;
 b=km5dCJC4r54rG/sqDz+HpYtwhcza885+XiPyOOLZlmh73YtKl7wk2/DtvxHii3twB9
 //O7B3T9bC4CDZumBJVWQnT04N3dRuxGd8nPm/cAWGX4lnzoaiRuPNOTrazrKF9O5+TF
 mJODf3vMg4x1A93Mm4QXO3kAlWp81ytvw+anZLK7a0+C/a53Xt89SkBr6ji6qONSu8lt
 iHL5IcaP6YJPRC86QqYw5j+qTsiSEieEXyjP3Es3b/2i/+2WF8sFmGnSg8SrqVzPeYJj
 2I2M7vfmjs8NL44M9IaLGuNwYQ/rNMu4m+O8KZC5aVPho/FN4NBrbOzHW187j2nD7+Ol
 L2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ZHoX1E0pKQsE6388AWWZYn9R8dI2szExvawhZ0L+wnU=;
 b=MM2lL/vw+4P1yikUPE9/c8CUXlTG4HRpeRhea2bWQgWOsIX74ZSiUPfYJWdexHeL5q
 oOXJcMYlO1crSZxRcMaRDE9BGPLJFU6rLm195sppIo3CDjxcqRVUjrJodOpU7mOU5dup
 58GPOSbc8QhrBjK7drZAiRVr51RjxRDSW/Rhv5W0aA8fTUPyaM5us4pTa76K63h3HV9y
 /csHQjVBvYK86VP87mVRGiQ+UMJVccPhiZuz30RtObUqzAObQwzW6XS17YeOCTDpNYcQ
 ShwihyTHJ9IFAwOYnISP9LKoD6adl44iewNIwlDIaPrxRv6Vo+fUFw9r9jlfOdZ0Zjed
 MaDw==
X-Gm-Message-State: ACrzQf3Wk9gnJgD6x3ulXP9DhkbEFjhZA92YHqyXEAucjY+xz+aWiNiU
 0T3WguTk68OQtJr22dDX0F8=
X-Google-Smtp-Source: AMsMyM5wJs0YA4BjfQrX6Et+Flxuo6Ydr8qqfocaSk56SSD0ldp9+zwH2mFoYMFYWT4aTGTmV7XXdw==
X-Received: by 2002:a05:600c:1e18:b0:3b3:b9f8:2186 with SMTP id
 ay24-20020a05600c1e1800b003b3b9f82186mr11862430wmb.151.1663575490638; 
 Mon, 19 Sep 2022 01:18:10 -0700 (PDT)
Received: from elementary ([94.73.32.249]) by smtp.gmail.com with ESMTPSA id
 l3-20020a5d4bc3000000b002238ea5750csm15623562wrt.72.2022.09.19.01.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 01:18:10 -0700 (PDT)
Date: Mon, 19 Sep 2022 10:18:01 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v4 3/3] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_gray8()
Message-ID: <20220919081801.GA144802@elementary>
References: <20220919071531.105124-1-jose.exposito89@gmail.com>
 <20220919071531.105124-4-jose.exposito89@gmail.com>
 <20220919073645.uf64enluhiwd2b2i@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220919073645.uf64enluhiwd2b2i@houat>
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
Cc: tzimmermann@suse.de, magalilemes00@gmail.com, airlied@linux.ie,
 maira.canal@usp.br, dlatypov@google.com, javierm@redhat.com,
 linux-kernel@vger.kernel.org,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>, geert@linux-m68k.org,
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 davidgow@google.com, isabbasso@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Thanks for looking into the patches.

On Mon, Sep 19, 2022 at 09:36:45AM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Sep 19, 2022 at 09:15:31AM +0200, José Expósito wrote:
> > Extend the existing test cases to test the conversion from XRGB8888 to
> > grayscale.
> > 
> > Tested-by: Maíra Canal <mairacanal@riseup.net>
> > Reviewed-by: David Gow <davidgow@google.com>
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > ---
> >  .../gpu/drm/tests/drm_format_helper_test.c    | 62 +++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> > index 09d358b54da0..71722e828abe 100644
> > --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> > +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> > @@ -37,6 +37,11 @@ struct convert_to_xrgb2101010_result {
> >  	const u32 expected[TEST_BUF_SIZE];
> >  };
> >  
> > +struct convert_to_gray8_result {
> > +	unsigned int dst_pitch;
> > +	const u8 expected[TEST_BUF_SIZE];
> > +};
> > +
> >
> > [...]
> >
> >  static struct kunit_case drm_format_helper_test_cases[] = {
> >  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_gen_params),
> >  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb565, convert_xrgb8888_gen_params),
> >  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb888_test, convert_xrgb8888_gen_params),
> >  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb2101010_test, convert_xrgb8888_gen_params),
> > +	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_gray8_test, convert_xrgb8888_gen_params),
> 
> The trailing test feels redundant,

Why do you feel like it is redundant? Under the hood, most conversion
functions reuse the same code, but the *_line() function is unique and
I think that it is worth testing it.

> and we should order them
> alphabetically to avoid conflicts as much as possible.

Good point, I'll sort them alphabetically.

> Feel free to add my
> Acked-by: Maxime Ripard <maxime@cerno.tech>
> 
> And fix this while applying
> 
> Maxime

Thanks!
Jose
