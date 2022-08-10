Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D2958F078
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 18:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E5491C00;
	Wed, 10 Aug 2022 16:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA0D113743
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 16:31:53 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id
 q1-20020a05600c040100b003a52db97fffso1255338wmb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 09:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc;
 bh=VlxSVSh4TBV3g0hrz44ERG5bQdABeiPaNu0wSLgb4Pg=;
 b=X+fhvSQC7TSTK4j3QNGEQvlf6uuTzpYO/9AD715gfzd+7yaQux1eya4IyKMsorRVAM
 cRreGrBXnuJ3+8ccozEYY4N7Gn4WxqQ7WP64+MaQDOMf9n0Ze3sO1jfWIzEi+r9EVKUM
 PiTRLICNJLQZW3rkY4MxMd8VhJhyhshif2KxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc;
 bh=VlxSVSh4TBV3g0hrz44ERG5bQdABeiPaNu0wSLgb4Pg=;
 b=yToQiisJy5dklOflWg/IyeDKDQerPliXdSR6D6S3FxkgyGMafgAcj3CqSo0qiAGVlF
 Id4KPlP057kJDNF+N951HhiJC93fsPwQkT//4r97LjFJy2/+TH7Hqy76Zph+7AD2llco
 A1zflav4YpW2L+Yo7n8b3xaiSOhnLbRU0HKkxx5y8Pjtx4BHElD9ByvYNfp4J3bm5Ikn
 M9otO+wZTpj2RrRw3B8FH/XGPk/Y0Atb+Y/Jx6+a1L8pQ1Rx9woDgCC7HPAJMgPmoRT3
 0SBD+YS7IA48X51d0XukpYRQmmzLFixRyJbWq1plJhbQukBe1L4c+/twHn9s0SgTybrB
 Dwtg==
X-Gm-Message-State: ACgBeo1v12pogbqdhJth1Nmo263BSvsqn5CUf1KpGb4Q463yE+l3Arf8
 6h/0jOGiwoOV0IQ92GwIBBq1Eg==
X-Google-Smtp-Source: AA6agR6Kd0jjywQgmPLRp2Q+ytUTiLAiAgjJ619ktBQijD4gk6n84NU4HxO7RhUIl9YJIpn6Wquj+Q==
X-Received: by 2002:a05:600c:4f0e:b0:3a3:3077:e5b3 with SMTP id
 l14-20020a05600c4f0e00b003a33077e5b3mr3016818wmq.94.1660149112232; 
 Wed, 10 Aug 2022 09:31:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a5d4803000000b0021e42e7c7dbsm16417354wrq.83.2022.08.10.09.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 09:31:51 -0700 (PDT)
Date: Wed, 10 Aug 2022 18:31:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH v2 4/4] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb565()
Message-ID: <YvPddQEptMj23HSj@phenom.ffwll.local>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 David Gow <davidgow@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Latypov <dlatypov@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 maarten.lankhorst@linux.intel.com,
 Jani Nikula <jani.nikula@linux.intel.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>,
 Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, dri-devel@lists.freedesktop.org,
 KUnit Development <kunit-dev@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220709115837.560877-1-jose.exposito89@gmail.com>
 <20220709115837.560877-5-jose.exposito89@gmail.com>
 <CABVgOSmhOBdXPH_=B_WRcUjMGC-wVPTLBwCdbgZLb0o3-O8pKw@mail.gmail.com>
 <20220717170054.GA1028249@elementary>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220717170054.GA1028249@elementary>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: dri-devel@lists.freedesktop.org, David Gow <davidgow@google.com>,
 magalilemes00@gmail.com, David Airlie <airlied@linux.ie>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>,
 Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, tales.aparecida@gmail.com,
 Isabella Basso <isabbasso@riseup.net>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 17, 2022 at 07:00:54PM +0200, José Expósito wrote:
> José Expósito <jose.exposito89@gmail.com> wrote:
> > I already fixed the warning and added the reviewed by tags, however, I
> > noticed that rebasing the series on the latest drm-misc-next show this
> > error:
> > [...]
> 
> Sorry for the extra email. I forgot to mention that the error is only
> present in UML. Running in other architectures works as expected.
> Tested on x86_64 and PowerPC.

Maybe a regression in the kunit infrastructure? Just guessing here ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
