Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A216B7D113F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 16:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0FA10E5BA;
	Fri, 20 Oct 2023 14:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164D810E5BA
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 14:11:30 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4084de32db5so7426385e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 07:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697811088; x=1698415888; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NdyrNJ6lsFZjMd58HVjsqmzDp5amnjP4XJKw4WkTsCQ=;
 b=H8V/ClylNMzO4BwUPa/J9nF1dheDbWx/vez6s7uCNZ1Hx8doMn0a+O4XUJ9ghJVIa0
 FFGaIFDyFhVQ1g/bWEYhd9FFZGEexDUMgXiQuZCJ6MHCdU+BEeuBCMSoPsaj72FiWed1
 zMz6JIeLxPl+QI0pqDAlEUYI/L+dQleR3pKV9VNqtFC6tGeW4Ex/7rhNWOX2N6UnAghe
 yMztsCXmG0m6Ob1B08wlJQwJQr/HCqBP6AmVuKDEEl2dj5hjKTttX9sgHsGXuznNWZT+
 aD8ndc3ssUgZJCSNw9he2zLydV5yl1VCNOfU8rblOifKkZSSVTPrzmYm0+ISREq2n9ZO
 n7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697811088; x=1698415888;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NdyrNJ6lsFZjMd58HVjsqmzDp5amnjP4XJKw4WkTsCQ=;
 b=YZBTuzu5z+ljUY7DecamCoqrC6LkmGAahJzyY7OOcH/i8aQJ6Dqjiv2uhYCfYxTpli
 eIEC6HU8LE2WAopdt0PV+cchjE0tTGEB9SbfIaoCMExbVxFn+8LjTx6mu8aIFzvPZp1O
 blVFzY5iM+v9CMhVtf5xoHoSnTcr+8Ot4V98sXy1w6wbIzGIs8S8tQkfJpsL8nattitW
 xB+vD1FuElKefa+4WT7CDZN2xkgW4o9InaejFSpyfF0QQWwXKNHtgZ9LRspIykgBK+yL
 yWY1wm7q/euAJVyqsmugBC4Ew3A9veFMV6aKiPjBfqzDuyZFHJjQe/kV8PUwVjJ2GX8l
 /4wQ==
X-Gm-Message-State: AOJu0YzdV+fjf/9tbTKDks1Hc8P6seaeK5U0CC7zjfDpTAAE0OrNvKwM
 ib2vqjJ7w+WGySNpgE5trGxiIQ==
X-Google-Smtp-Source: AGHT+IE4CeuCMofa2AzYF2SYGvxnfyVkAiWklMaMEPeYNRCJz9wP40Ysf0BPNvV3Jig0FU8DM/Azmw==
X-Received: by 2002:a05:600c:468e:b0:402:f07c:4b48 with SMTP id
 p14-20020a05600c468e00b00402f07c4b48mr1488484wmo.28.1697811088327; 
 Fri, 20 Oct 2023 07:11:28 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 f7-20020adff587000000b0031fb91f23e9sm1760544wro.43.2023.10.20.07.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 07:11:28 -0700 (PDT)
Date: Fri, 20 Oct 2023 17:11:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [bug report] drm: Warn about negative sizes when calculating
 scale factor
Message-ID: <0c9bcb53-e8b5-4b40-9010-51cc145ec4ab@kadam.mountain>
References: <c7f0fd2f-a48d-4120-9291-a0cc58faadce@moroto.mountain>
 <2ad54714-b1b2-4454-95d4-c46fae4c9404@kadam.mountain>
 <ZTJquc5Gtu2fg4GV@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZTJquc5Gtu2fg4GV@intel.com>
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
Cc: Daniel =?iso-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>,
 kv-team <kv-team@linaro.org>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 dri-devel@lists.freedesktop.org, Arthur Grillo <arthurgrillo@riseup.net>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 20, 2023 at 02:55:37PM +0300, Ville Syrjälä wrote:
> On Fri, Oct 20, 2023 at 02:39:04PM +0300, Dan Carpenter wrote:
> > On Wed, Oct 18, 2023 at 05:17:42PM +0300, Dan Carpenter wrote:
> > > drivers/gpu/drm/drm_rect.c
> > >    134  static int drm_calc_scale(int src, int dst)
> > >    135  {
> > >    136          int scale = 0;
> > >    137  
> > >    138          if (WARN_ON(src < 0 || dst < 0))
> > >                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > These days, with automated fuzz testing, this WARN_ON() is problematic.
> > > WARN() is considered a kernel bug, and pr_warn() is the hip new way to
> > > alert the user about issues.
> > 
> > Btw, a lot of people (Greg claims it's the majority of Linux users)
> > these days have run kernels with panic on warn enabled so that's another
> > reason to avoid using WARN_ON() for stuff that it known to be possible.
> 
> This is not possible, unless there is a serious bug somewhere else.

Ah.  That's fine then.  This is kunit which is deliberately triggering
the WARN_ON().  The KASAN testing also deliberately triggers WARN_ON()s
so it's a necessary thing.

I just wonder if there is some way to mark these kinds of warnings as
expected.  Perhaps we could add a comment in the kunit test?

regards,
dan carpenter
