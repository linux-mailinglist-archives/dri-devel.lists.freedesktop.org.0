Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1F453E3F9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 11:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A1C113294;
	Mon,  6 Jun 2022 09:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4A7113294
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 09:44:03 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 v4-20020a1cac04000000b00397001398c0so9699441wme.5
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 02:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pZxJjfzSiCSZsMONOLroxHj+cORse23nRQ7Nf9aFbIc=;
 b=puvFF5bwhhEj943FfBvEgJQNken3NkxQXXVtOTW9FZ0wWYxuufZaGSEPSxzGFlW2V+
 NwCaRIBw6GwBp7XyXBxOCty2lYhcvKXkr6YUgxRs5J3ACpmDfC5q2D4M+w8VluKsk3g6
 cknukAivObmf3R+Y0ANqLyc+ThVXeByD/kkR0S0Gv61lgCdnEsDfrNFulNjww9Kbd09/
 cg0QtoM4Bd5s2JUdTbnn+WAIJBsfrK+onQ5aNZmboBXOU2E/8bhfnGYtcSc9XmFBFgcn
 RND9Dron4qv6GnVM+FqfPO/NZlsNfkxwpA7X/F+P7yDfDvNBR3YOPFW5nSgRFrvNTBuL
 0+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pZxJjfzSiCSZsMONOLroxHj+cORse23nRQ7Nf9aFbIc=;
 b=lamJeKW3TprFHrHQEDdLMx3JmIgmYE44BG8ty14Wsx9Yp9W27D3ha5G7ADEk0qU7Ox
 3+MC3mSXhgEAEq8oQ0PpPH+qfrSWpPKPwcAJMVYTjRuDPqhgPUf0YqJIQ0a9J0UIfWgI
 kC4mWE2/l2ekruGU4mnZ3Lt8iDYeXoV9nElg3bvnYNF35GLJVqm5/5cBGEtDs1RtuXTL
 jTijIapRB821W6f0+//ADBhlPsOWGRyx213mkup6+NNq+AA8mt6CeRX2M9kADHmq+iZ8
 SiWfI0duXNPqEK4L9SpnL2M7M+3727J2f76lIyUtmS6cdZvBI/G3gZUDICV2zBMQ18ow
 ABKQ==
X-Gm-Message-State: AOAM533IXd3P5Z4C11XnGPdVNYsWQvxm/wTTbIq+O5PFKVQhelQhoAtA
 nW0i1Atv/oxiNewHnU8JONM=
X-Google-Smtp-Source: ABdhPJwzPOWPoj4ZpAEG+LGY0/gEwkp9MyfTcQfRvPzVTjX38rwGye6seHpxn3Wfb0JiATEaiOMsew==
X-Received: by 2002:a05:600c:3c91:b0:39b:6b:d5de with SMTP id
 bg17-20020a05600c3c9100b0039b006bd5demr39564985wmb.132.1654508641506; 
 Mon, 06 Jun 2022 02:44:01 -0700 (PDT)
Received: from elementary ([94.73.36.128]) by smtp.gmail.com with ESMTPSA id
 l6-20020a5d4bc6000000b0020e615bab7bsm14956105wrt.7.2022.06.06.02.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 02:44:00 -0700 (PDT)
Date: Mon, 6 Jun 2022 11:43:52 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [RFC PATCH 1/1] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
Message-ID: <20220606094352.GA937049@elementary>
References: <20220530102017.471865-1-jose.exposito89@gmail.com>
 <20220530102017.471865-2-jose.exposito89@gmail.com>
 <e26de140-afb7-7b1b-4826-6ac4f3a4fe02@redhat.com>
 <CABVgOSkCxu2xBnxwc6mO2AQaqzTbDf53PJzT2QvZNyLeumt5hg@mail.gmail.com>
 <195c6865-d6f7-fbc4-6ee5-784c5c49d243@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <195c6865-d6f7-fbc4-6ee5-784c5c49d243@redhat.com>
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
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 Daniel Latypov <dlatypov@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, David Gow <davidgow@google.com>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello everyone,

On Thu, Jun 02, 2022 at 07:21:28PM +0200, Javier Martinez Canillas wrote:
> Hello David,
> 
> On 6/2/22 19:07, David Gow wrote:
> > On Thu, Jun 2, 2022 at 9:27 AM Javier Martinez Canillas
> 
> [snip]
> 
> >>
> >> And doing that will also allow you to get rid of this, since just selecting
> >> CONFIG_DRM_KUNIT_TEST=y would be enough for the tests built and run by KUnit.
> >>
> > 
> > This is definitely something other KUnit tests (apparmor, elf, etc)
> > are doing, and it's generally fine. You do lose the ability to build
> > the tests as a separate module, though. (This is not usually a big
> > problem, but there are some cases where it's useful.)
> > 
> > That being said, I don't think 'select' is enough of a problem that
> > you should feel the need to refactor in this way just to avoid it.
> 
> Oh, yes I didn't want to imply that this was the main reason but just
> pointed out that wouldn't even be needed if done that way. And it is
> something that we want to do anyway IMO, since as mentioned it would
> allow to test the static functions, which are the majority the format
> helpers in that file.

Conversion functions alway call drm_fb_xfrm()/drm_fb_xfrm_toio() and
their *_line function. For example, drm_fb_xrgb8888_to_rgb332() calls
drm_fb_xfrm() and drm_fb_xrgb8888_to_rgb332_line().

The current tests already check that the *_line() function works as
expected. I'd like to test the high-level functions first and, if
required, go into more detail in the future. The refactor is pretty
easy, so I'd prefer to keep it as it is for the moment.

About the other changes suggested, I applied all of them over the
weekend. I'll send v1 of the patch to the mailing list including them
so we have an up to date code to comment on.

Thanks a lot for all of your comments and help,
José Expósito
