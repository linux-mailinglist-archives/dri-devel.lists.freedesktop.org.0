Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A046E7FAF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 18:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC1110E9F7;
	Wed, 19 Apr 2023 16:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D7910E1C1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 16:32:24 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-94ea38c90ccso93216366b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 09:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681921942; x=1684513942;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vjXbDQrMTlMveGgpzjaxOqJ4MX3Zc3PuAQFculrIp90=;
 b=Bzjp+BeQnrAKzIJWTEfUAa+W3pdspTEwqQF0Pa3tbP0lt3pW+mEMdyjsxr7XKzQxxM
 mIrFsanjX96nzba8usxtgUNN+uUHN5AaScdGV3qyXuEIojvImSDkRl/zXstTSqiLG9qS
 2jZ2SMzLHM11Ly9g09B0B0ONvetjkk3kMyy5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681921942; x=1684513942;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vjXbDQrMTlMveGgpzjaxOqJ4MX3Zc3PuAQFculrIp90=;
 b=MzbeVJQhzKCEi+xqe54uBGSHDtlm8gByHOEB8725Zmbra7pHEzlUOsOmz4iMdsjqUJ
 B9qg6pOHTsTSm2oer53NyjJx6zMpQePksTbfCNDTA3jcJmHUS3e2dWBkrUdgYDk0E+ob
 QpbqhfAiOVVv+jAJBliRGH0OqISFydTwRNxo/oVk4mBjfWf7nXYD+NFm2TFqkNeEW8h5
 dNY+Umj3ox6ufurf6MoMiCvvBbCkfOMzVac5eKcCQgl84UZ1MC4oFrYLd3RjtoxtopiV
 Ic92O2JrLMFEg2m1vFnArapzowz5+MfT8BB0X0kLfYKaJKecJkKPJsn78Bqkux1mlLFj
 6RLQ==
X-Gm-Message-State: AAQBX9cDXMySao585Zmmel0g3wJg/KhutJ/2UJKK0zCRakmIk/dEB8El
 56lrSTWD0iUD9mGukCN/Whlq9A==
X-Google-Smtp-Source: AKy350aENGpODhst1P2SnjiQJvzhoC9GSkVgTOh9e3yM/mzLGea3xasoYck5TN1My/5JEkEvmKDOSQ==
X-Received: by 2002:a17:906:5d:b0:94e:d688:fc92 with SMTP id
 29-20020a170906005d00b0094ed688fc92mr16825594ejg.0.1681921942431; 
 Wed, 19 Apr 2023 09:32:22 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 t16-20020a170906269000b00932ba722482sm9754722ejc.149.2023.04.19.09.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 09:32:22 -0700 (PDT)
Date: Wed, 19 Apr 2023 18:32:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: linux-next: manual merge of the drm-misc tree with the mm-stable
 tree
Message-ID: <ZEAXlEeYrqvVejJj@phenom.ffwll.local>
Mail-Followup-To: Nathan Chancellor <nathan@kernel.org>,
 Mark Brown <broonie@kernel.org>, Dave Airlie <airlied@gmail.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230414125913.851920-1-broonie@kernel.org>
 <ZDuqut+8BKjMXblJ@phenom.ffwll.local>
 <8c90b4db-3075-4275-bea8-01f501b00885@sirena.org.uk>
 <ZEAVxeIEOny81EGY@phenom.ffwll.local>
 <20230419163011.GA1865368@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419163011.GA1865368@dev-arch.thelio-3990X>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 09:30:11AM -0700, Nathan Chancellor wrote:
> On Wed, Apr 19, 2023 at 06:24:37PM +0200, Daniel Vetter wrote:
> > On Tue, Apr 18, 2023 at 07:34:44PM +0100, Mark Brown wrote:
> > > On Sun, Apr 16, 2023 at 09:58:50AM +0200, Daniel Vetter wrote:
> > > 
> > > > Note there was a ppc compile fail, which is why we pushed the ttm revert.
> > > > That /should/ be fixed now, but would be good if you can confirm?
> > > 
> > > According to Nathan (CCed) there's still issues with the interaction
> > > with the PowerPC tree.
> > 
> > So this revert was supposed to fix this: 56e51681246e ("drm/ttm: revert
> > "Reduce the number of used allocation orders for TTM pages"")
> > 
> > If there's anything left then I need to chase that asap since the merge
> > window will open soon.
> 
> I think we are talking about two different issues here. My issue is not
> a compilation failure, it is an incorrect merge resolution that is
> happening in -next because of two independent changes in the drm and
> powerpc tree, the thread below should have more information.
> 
> https://lore.kernel.org/20230413184725.GA3183133@dev-arch.thelio-3990X/
> 
> I do not think this is something that either tree can solve
> independently of each other, -next has to resolve the conflict correctly
> (which is what I point out in the message above) and a note of it should
> be passed along to Linus so it can be resolved correctly in mainline
> when the time comes.

Ah yes that's a different one. I think we have a note about this one
already, but I'll double-check with Dave Airlie.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
