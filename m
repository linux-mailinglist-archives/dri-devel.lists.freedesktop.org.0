Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8946F565AEA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB6F10E58F;
	Mon,  4 Jul 2022 16:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8C710E00F
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 15:19:31 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 g39-20020a05600c4ca700b003a03ac7d540so6519490wmp.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jul 2022 08:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+CMs8UMxqlzkS/Qmt0OCCCKfDi92HEEc4PUy8wummUs=;
 b=RQOq+mQs9FgWUuYaRg9hDTuBRcwKYe+KY7O7x9AcozKgRKkzNA8O2ydVuVZ1x+tH6H
 LMsY/P8flCSaptp79IYJasRg/CCBKY/n9y2JU9wXxkVNWs5D/mrvW1GImFb0E8mIS+FM
 ynl10XKGOGztnDeezxSwB4pqQp/3VhSvpRG55310dC2lFZUXw2e0i9fqoXiJ53BP/i68
 eGqiCcup5XLo+jOgGrcASUrCIrYw/GhDhwVT5YLiyVIM4t0Joe+39h38MwVkqndxTOfK
 cd0viRJ44tRDsq4fNEQZ40Aw8P8xXyrjXmONQFKoIhHldZ8sclQzGrnT45wn8Z3npTVE
 w6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+CMs8UMxqlzkS/Qmt0OCCCKfDi92HEEc4PUy8wummUs=;
 b=EJljhdW3rMM6h+JIm7Och/zp+OqvgKfh7C7fZmeJJ7ktAOfF7jqI/5ZUDbImVtRHvL
 2uMA3kZO20i7UV/kDHw+O+SYJKjn1XpeYyGLRSXy3vC2GnUMAO1PSD345UjrkiAnnAnL
 cWOWLYAUWKDMyW4p9j0fhidNNntUVRQ96hJ/J0+2ZFBkelSFoCwzLp4LkKM5J9QNsySu
 oAS+EWo2xDek3OpR5QbIAFqVrhErghVlsIpuqYWFbPqcygBQr2CYJsHS8XdMPn03Y0tv
 Y8oVOERDgsxGq2LUq4g2cejBp7WsKU6tKRsYA5deOJHqHBD6PhQiVDz65cN7Llz1EiPM
 ATOA==
X-Gm-Message-State: AJIora+QQAnR1ZTRfEX5TYx7tiB3MaVqAbhu5Jbl8TY3iv6GW1L6k3WU
 uSX8Q4hMQmr4wmAA5iOtyrE=
X-Google-Smtp-Source: AGRyM1v2CJgezpMOiZS+/XQO8P8h1S1Kyf6c+QVbF8BG5113gnVeUqUs2XTlqyNY5H4wB5WNO7E+NA==
X-Received: by 2002:a05:600c:286:b0:3a0:49ce:51bf with SMTP id
 6-20020a05600c028600b003a049ce51bfmr25543836wmk.18.1656861569566; 
 Sun, 03 Jul 2022 08:19:29 -0700 (PDT)
Received: from elementary ([94.73.36.128]) by smtp.gmail.com with ESMTPSA id
 e2-20020adfdbc2000000b0021b9f126fd3sm28187755wrj.14.2022.07.03.08.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 08:19:29 -0700 (PDT)
Date: Sun, 3 Jul 2022 17:19:26 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: David Gow <davidgow@google.com>
Subject: Re: [PATCH 0/4] KUnit tests for RGB565 conversion
Message-ID: <20220703151926.GA130430@elementary>
References: <20220627161132.33256-1-jose.exposito89@gmail.com>
 <CABVgOSmC6WJxMo58VH0WSD7wdLn7_TmTktm=6txrn0ECXCNJZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABVgOSmC6WJxMo58VH0WSD7wdLn7_TmTktm=6txrn0ECXCNJZQ@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 magalilemes00@gmail.com, David Airlie <airlied@linux.ie>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>,
 Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 tales.aparecida@gmail.com, Isabella Basso <isabbasso@riseup.net>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi David,

Sorry for not getting back to you sooner, I've been swamped with work
this week.

On Wed, Jun 29, 2022 at 03:27:44PM +0800, David Gow wrote:
> These look pretty good overall to me, but there is one big issue
> (which is actually with the previous series -- oops!), and a few small
> stylistic thoughts.
> 
> For the big issue: these tests don't work on big-endian systems. The
> 'swab' bit in this series reminded me to check, and sure enough, all
> of the tests fail (including the rgb332 ones).
> 
> I tested it on PowerPC with:
>  ./tools/testing/kunit/kunit.py run
> --kunitconfig=drivers/gpu/drm/tests --arch=powerpc
> --cross_compile=powerpc64-linux-gnu-
> 
> So that's something which needs to be fixed.

Oops, yes, definitely something that I need to fix!
I'll include an extra patch at the beginning of v2 fixing this bug.

> The smaller stylistic thoughts basically all revolve around the
> complexity of convert_xrgb8888_cases: there are arrays of structs with
> arrays of unions of structs (with function pointers in them). This
> isn't a problem: it's actually a lot more readable than that
> description implies, but there are other ways it could be tackled
> (which have their own tradeoffs, of course).
> 
> One possibility would be to split up the test into a separate test per
> destination format. They could reuse the convert_xrgb8888_cases array,
> and just each access a different result. You could make things even
> clearer (IMO) by replacing the results[] array with a separate, named,
> member (since you don't need to iterate over them any more), and
> remove the need to have the function pointer and swab union/members by
> just hardcoding those in the separate test functions. It'd also make
> the results a bit clearer, as each destination format would get its
> own separate set of results.
> 
> Of course, that's just an idea: I don't actually have a problem with
> the existing design either (other than the endianness issue, of
> course).

I like from your approach that the output of the tests would be easier
to understand. At the moment, if a test fails, there is not enough
context to know which target format failed. I'll explore this approach
and see how it looks like.

Thanks,
Jose

> Cheers,
> -- David


