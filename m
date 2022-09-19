Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983FD5BC450
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 10:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E7A10E5CF;
	Mon, 19 Sep 2022 08:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E2B10E5CF
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 08:29:19 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r7so5230892wrm.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 01:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=WXCToHfQiSix6PvjVjohUsg//yZJDPaLAeIA+KqtiOI=;
 b=KgMKYhel6t7u9jg288YAF26uIfAPwmvcCFYE/z+gjfGW/VZNzC+t8kfsQghe9c4w5w
 83JfkeFfvj7CDaugxJB5ZSC3Cyc+6ZNts95DNOWYaP//NcwGOHZT62OKTtzwgczBMoiM
 HuccyFu7LAPE2m5cLKiW8YSTGSaZGDbn+XSM0unQQWYySxwP7ej24OCXtK2Ub6isH+Jc
 xiRqxiI3n1b6N98tAzh1FS3ZxzdNgRdewCS8Wg7XwuyrtE/Z/WeyjVy5eRMA7+1Y9bJl
 5O/WcoQ4CUwo1Y2bysXz33XgObnsLL8YOXOY/7sGY4TdwWpsa3aqIjd9UUVdMHyod9Nv
 szYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=WXCToHfQiSix6PvjVjohUsg//yZJDPaLAeIA+KqtiOI=;
 b=HxCvUa6PUKBZ3Ib1FZ9r40NG9kN5c/EeknxSHaTdv0MtkRVMSlEUxlEA7ixutgYyau
 HJuyAZCkqZ/fNEZtB3GgWsgn2xKCmkPXdj95sHtwEmp640FmT2A4NCr2iQdvXhissx8n
 mSjGcXvpKbytKuhIWoWQYCKajLrJta6xgCmFwxiY2dUGRzE/z0XIHkSciqmquQwkTvhk
 5zr2G+tCxtVJ0e9aiSiHm1BukRta/Q86rusMhdU+BMjonafUQ+VFqPu/PPjvbHW7rNfL
 dXf+UKPa3h9nxOAWX8iEDgsYnd5+js/GoeqqlyR13qn7bFlM9R8V76vk1sMzI4+UBwoL
 MLTA==
X-Gm-Message-State: ACrzQf3ROWmDID1JDfi55Jcq5d07KFkkuxCJP7oOCXJoBxbaQmgdJdPB
 9mUSjl5zczsF1Z69XRd7e1zzjr6u4M44rg==
X-Google-Smtp-Source: AMsMyM7BJlzxPe+aIM0WiE73TyvATgkKl5lyzhtImNW8NVwkL5+RaNi2UmRGdLoqFJS/UqVwlu3KTw==
X-Received: by 2002:a05:6000:184e:b0:228:bb9d:f98a with SMTP id
 c14-20020a056000184e00b00228bb9df98amr9535880wri.479.1663576158316; 
 Mon, 19 Sep 2022 01:29:18 -0700 (PDT)
Received: from elementary ([94.73.32.249]) by smtp.gmail.com with ESMTPSA id
 z20-20020a05600c0a1400b003b4727d199asm13141011wmp.15.2022.09.19.01.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 01:29:17 -0700 (PDT)
Date: Mon, 19 Sep 2022 10:29:14 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v4 3/3] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_gray8()
Message-ID: <20220919082914.GA290343@elementary>
References: <20220919071531.105124-1-jose.exposito89@gmail.com>
 <20220919071531.105124-4-jose.exposito89@gmail.com>
 <20220919073645.uf64enluhiwd2b2i@houat>
 <20220919081801.GA144802@elementary>
 <20220919082519.s5d7llmynot76xsx@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220919082519.s5d7llmynot76xsx@houat>
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

On Mon, Sep 19, 2022 at 10:25:19AM +0200, Maxime Ripard wrote:
> On Mon, Sep 19, 2022 at 10:18:01AM +0200, José Expósito wrote:
> > Hi Maxime,
> > 
> > Thanks for looking into the patches.
> > 
> > On Mon, Sep 19, 2022 at 09:36:45AM +0200, Maxime Ripard wrote:
> > > Hi,
> > > 
> > > On Mon, Sep 19, 2022 at 09:15:31AM +0200, José Expósito wrote:
> > > > Extend the existing test cases to test the conversion from XRGB8888 to
> > > > grayscale.
> > > > 
> > > > Tested-by: Maíra Canal <mairacanal@riseup.net>
> > > > Reviewed-by: David Gow <davidgow@google.com>
> > > > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > > > ---
> > > >  .../gpu/drm/tests/drm_format_helper_test.c    | 62 +++++++++++++++++++
> > > >  1 file changed, 62 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> > > > index 09d358b54da0..71722e828abe 100644
> > > > --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> > > > +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> > > > @@ -37,6 +37,11 @@ struct convert_to_xrgb2101010_result {
> > > >  	const u32 expected[TEST_BUF_SIZE];
> > > >  };
> > > >  
> > > > +struct convert_to_gray8_result {
> > > > +	unsigned int dst_pitch;
> > > > +	const u8 expected[TEST_BUF_SIZE];
> > > > +};
> > > > +
> > > >
> > > > [...]
> > > >
> > > >  static struct kunit_case drm_format_helper_test_cases[] = {
> > > >  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_gen_params),
> > > >  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb565, convert_xrgb8888_gen_params),
> > > >  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb888_test, convert_xrgb8888_gen_params),
> > > >  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb2101010_test, convert_xrgb8888_gen_params),
> > > > +	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_gray8_test, convert_xrgb8888_gen_params),
> > > 
> > > The trailing test feels redundant,
> > 
> > Why do you feel like it is redundant? Under the hood, most conversion
> > functions reuse the same code, but the *_line() function is unique and
> > I think that it is worth testing it.
> 
> Sure, I wasn't commenting on the code itself, but the trailing "test" in
> the test name: drm_test_fb_xrgb8888_to_gray8_test
>                                              ^
> 
> Which is redundant since we already have "test" in the prefix.
> 
> Maxime

Ah! OK, I misunderstood your first sentence. Indeed, the _test sufix
should be removed, added to my TODO list.

Thanks!!
