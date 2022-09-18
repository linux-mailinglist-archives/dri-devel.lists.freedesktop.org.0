Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC335BBDFC
	for <lists+dri-devel@lfdr.de>; Sun, 18 Sep 2022 15:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE4810E573;
	Sun, 18 Sep 2022 13:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B4A10E573
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 13:22:44 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id cc5so33314796wrb.6
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=qe70WmdNsVt7D6f6WRbeUCANYSNWq1ba7xme+qOpCj8=;
 b=qDtOVc8u19Cde231bxT92BzaZi14aziR6OA52P1kHGWTLQTHX92mwYFuK0BSAg9G1k
 NuLRGMpvXm1yWW9/DZmr6ylAKR8WXyQCmqQGx3As8W+70r4LBZ8zFoJS+sYwtwjMI57v
 v7cadDoCQpaxyZMv8DbVM+RKv3nOd7jiTT9b9NnnDgJ8BTVEasVrGKPqE8hldOgK0gIH
 QF3XGnjryS2ty32by7Mu6fBypTOXJZnbpGrgW3nv/p1iqgsp1Xj0fXF8IT01wdz0jAXu
 OG+gybzC3crOL5+6qmUicIlF4yG8ygXFA4C0FS4wggQyGrvHSC2saOXLESgjvWSGikQ3
 G0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=qe70WmdNsVt7D6f6WRbeUCANYSNWq1ba7xme+qOpCj8=;
 b=U8RgvdGTvRzSEC5ROTfpv+L21erWK9NneQPObB6xdfUJbPiAnEzve418JNClZmMxeg
 H8zngfcNIlo/OaS9Dh2eyK7x8zkGrUzUkiyqNxmhxgqbyXlYV5GX5gm3Zuim0Q0hi4Rw
 tnegA63OQ3bJ93pirjJpKimRqqxBnMEYARyyLpShUqUzid4RtlwrjuPJy/68HTU4rxDi
 Ce9NzBGOJlZMx57wsAPnkhr8kUOadYKUPbA0y95dZMiQ8o6ke66mhibvYtw8JXebWEeQ
 f+RfgHhQNSnxdf5dNrTbd9tJ8W6+Ths8O2Ex/Q259SE/ESOqeEDDjjpCCEItocS88Tas
 z7pw==
X-Gm-Message-State: ACrzQf3pc8RVSYHkw9A7F5cjOo0jC2qGipmY8bOJpIi80TkuTk+gll10
 8DdUVnTUx6u5X9LEl824Ez58msaHaA0jOw==
X-Google-Smtp-Source: AMsMyM4KPaQoCCsfqvY5cDcSXaYx7GlY+PhVoFFA2zC7ZRVdOMv+TM5LWHHDdR0gr+YTGYjXUQ1ptQ==
X-Received: by 2002:a5d:6f0d:0:b0:229:a479:989e with SMTP id
 ay13-20020a5d6f0d000000b00229a479989emr7762430wrb.158.1663507363013; 
 Sun, 18 Sep 2022 06:22:43 -0700 (PDT)
Received: from elementary ([94.73.32.249]) by smtp.gmail.com with ESMTPSA id
 p6-20020a5d48c6000000b0022ae401e9e0sm6148033wrs.78.2022.09.18.06.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 06:22:42 -0700 (PDT)
Date: Sun, 18 Sep 2022 15:22:40 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: Re: [PATCH v3 0/3] KUnit tests for RGB888, XRGB2101010 and grayscale
Message-ID: <20220918132240.GA7818@elementary>
References: <20220828164517.185092-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220828164517.185092-1-jose.exposito89@gmail.com>
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

Hi!

On Sun, Aug 28, 2022 at 06:45:14PM +0200, José Expósito wrote:
> Hello everyone,
> 
> This series is a follow up on my work adding KUnit test to the XRGB8888
> conversion functions. This time RGB888, XRGB2101010 and gray8 are added.
> 
> Best wishes,
> Jose
> 
> v1 -> v2:
> 
>     Tested-by: Maíra Canal <mairacanal@riseup.net>
>     Reviewed-by: David Gow <davidgow@google.com>
> 
> v2 -> v3:
> 
>     Export symbol drm_fb_xrgb8888_to_xrgb2101010()

This patchset is being in the mailing list for a while. Unless someone
has a reason to not merge it, I'd like to push it next week.

Thanks,
Jose
 
> José Expósito (3):
>   drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb888()
>   drm/format-helper: Add KUnit tests for
>     drm_fb_xrgb8888_to_xrgb2101010()
>   drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_gray8()
> 
>  drivers/gpu/drm/drm_format_helper.c           |   1 +
>  .../gpu/drm/tests/drm_format_helper_test.c    | 190 ++++++++++++++++++
>  2 files changed, 191 insertions(+)
> 
> 
> base-commit: 61a9fa154d217c13eea90aa5bc635bc4b1fcb66e
> -- 
> 2.25.1
> 
