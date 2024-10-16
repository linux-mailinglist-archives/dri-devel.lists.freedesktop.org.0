Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 399919A13AC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 22:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279B510E0B4;
	Wed, 16 Oct 2024 20:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="DFZBiJiB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4404E10E0B4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 20:17:41 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-6cc1b20ce54so1781276d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 13:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1729109860; x=1729714660;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0F3memFK2IqEIyDZRhf1ZtxUtPaa69HplF1wyp2YAb4=;
 b=DFZBiJiBAcZQocC0B/zu45NhIjR5Xli9q9qctgZxlsAG6t96Aw4xuyU5IRyczz8lEG
 m8OBO2buy/qn41xnT1y/u8aIFhGSsoX/HxOhytZGh+4HeFSM9p4XRCgzO6yTCJSrjgfR
 dB6LjmLOQNk6qD6mw5MaJ7m0/+RLktPW7k5IEXomLxsgZQ2VI5+9Qdvp8JlqfMK3RVAr
 vXSZIJhYwkyXQ5RfUl6n1w7FhdmSfE5Id6+gdVofM5AIJvVmNGYq6YC9mCCGuRRpUS01
 UXRusjlURyVCMDH1HSYAfpB8yCBd4kuAN/t0ujlc08TkF0LLDUGjDLOVktyBsQsD/CUI
 1Dqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729109860; x=1729714660;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0F3memFK2IqEIyDZRhf1ZtxUtPaa69HplF1wyp2YAb4=;
 b=oExTjZv86D/D2xUEvzkmRrdydx1CkCJoCTgAJIikR5FgOwQbm8R+AfjUj1lmn+NBKR
 lNiXsVbW4dkxjj3vhdO+tyyoVDaPogiAL+pdtj1Um8hCK2cG3838PgavcfnrXoU0XLzY
 yOHElqfE8R0Bloz8HaeNRfiInSgXXQOyGNiOKn3zdVdOnltvDFn8g9569Oekwh6H/8A2
 iagvS6idQ7nGo3NaX5FbcuKL13W73T1keo1Tb3zTVwSCuiHzxUr8d+tTOR1pSwa5bihu
 cQ3fJ3MPGJRufvzTMgcR0MO0uLY+YEPkLeGUDp+0UYPv8xr0axVp2vhSImvJR5aTZgjN
 i0Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJmQqBt0bvBxcVoiUtwLnoTKel05kLg+73oSVSMK3xNAovuPXxZrnAHfuAsw7kqfw0Rqa14Ybyr0g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1JE1H0vO2jhuUtir/fqd9EfWMTxy1uTkUs5LDSPzd+c6Sc0vf
 RlzxfrxUidvpeoFgPNs7jOEKr5Am+ZHlaaWs9BTxaKiV2oNKlpCGEWOxcLss2N6LMqJDOsjvldx
 dCxuBSa1u+ZO7HL6kBOnQLPocrMcRQk9XLTovgQ==
X-Google-Smtp-Source: AGHT+IH8FdORu8BAVMYETQ3EFP7GdnSBr3/OY9F2kRda3SXcmSTFgN1GFVyxcQE38MPpmTDwMWhcvAQ5OacfMETt+rA=
X-Received: by 2002:a0c:fbc1:0:b0:6cb:fb58:3d23 with SMTP id
 6a1803df08f44-6cbfb583dccmr188633316d6.43.1729109860038; Wed, 16 Oct 2024
 13:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20241014222022.571819-4-pZ010001011111@proton.me>
 <7b45f190.452f.1928e41b746.Coremail.andyshrk@163.com>
 <o_Cyz_ARcHj4zNlovv75MBwslIRhn3YWlscoNrlpLVobh7eWIMEQR5bNv0yhHx2KEx_gbYi_gH-8Y-CdvRZs9lZscz3-lhAbM50GXUdtSKY=@proton.me>
 <30940542.b36d.19290215124.Coremail.andyshrk@163.com>
 <1974DYrs9gLrQrZ5VwCglFgKDDK686iyqnS_g6uPB-s9wZ_4CqfZXPjmYWihLgrkRu7ptNjpkFeqB0uTt73RFId6cL8FowQ8LFltPmaKCoI=@proton.me>
 <1ae9f15d.e52.19292e05e73.Coremail.andyshrk@163.com>
 <CAPj87rOmPyat12S4WUixiUBAsuAEEbyNX5VY2JS+wn5a1jux0A@mail.gmail.com>
 <kYKfHO8oonY1wP8ZvanmTnvgjGfw0uek8cmMIV99Bc6zO3EE32B2LKaypAphAxVJKx2I-Lnd3CzvyTRVAaM4xhj75z7dOzlp7xPMlFQKRN0=@proton.me>
In-Reply-To: <kYKfHO8oonY1wP8ZvanmTnvgjGfw0uek8cmMIV99Bc6zO3EE32B2LKaypAphAxVJKx2I-Lnd3CzvyTRVAaM4xhj75z7dOzlp7xPMlFQKRN0=@proton.me>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 16 Oct 2024 21:17:28 +0100
Message-ID: <CAPj87rOdQPsuH9qB_ZLfC9S=cO2noNi1mOGW0ZmQ6SHCugb9=w@mail.gmail.com>
Subject: Re: Re:Re:[PATCH v5] rockchip/drm: vop2: add support for gamma LUT
To: Piotr Zalewski <pZ010001011111@proton.me>
Cc: Andy Yan <andyshrk@163.com>, hjc@rock-chips.com, heiko@sntech.de, 
 andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, Dragan Simic <dsimic@manjaro.org>, 
 Diederik de Haas <didi.debian@cknow.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Piotr,

On Wed, 16 Oct 2024 at 20:19, Piotr Zalewski <pZ010001011111@proton.me> wrote:
> On Wednesday, October 16th, 2024 at 2:27 PM, Daniel Stone <daniel@fooishbar.org> wrote:
> > 1 is the only solution that can work. Silently changing the colour
> > properties of a separate CRTC is not OK, since this can lead to
> > displaying incorrect content.
>
> Ok right kernel keeps track of the state and sees gamma as enabled even if
> dsp lut en bit was cleared.
>
> Would it be better to check if gamma is already enabled on another CRTC in
> atomic_check rather than atomic_begin/atomic_flush (and silently fail) like
> in[1]?

Yes please, that's exactly it. If userspace requests something that
can't be done, then fail the request.

Cheers,
Daniel
