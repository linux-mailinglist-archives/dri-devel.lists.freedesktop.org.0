Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9928B90C50B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 10:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4B510E235;
	Tue, 18 Jun 2024 08:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K8LdqSfR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30A310E235
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 08:53:16 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2ebec2f11b7so51035891fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 01:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718700795; x=1719305595; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sVER3ppowxMPvCNe3SDX+A7Me1Hrn33qQHZFeWMqsbE=;
 b=K8LdqSfRdXyytA07pJBojjegvqVu9YuouddVqHAz4HBDfRRKCwGOfR06WZqaEksU9q
 JXQ+4E3HWPErJK5a9j6ZPLSQh3II5bVyoUpWacRHFXM8hlq399ry85QFYVzU/LymX0qt
 XJKEbPF4xf+ZAjjWldfu21WxQuB8xNiYj3DTwO5NYUB3eWgYGLn6KWuD3RO9IyNcJurg
 z+XwWZnyHJvmwygMxUkU4SzhE1kwvIGKrKCtwM0BKU4qfbb4ufYaj5fQrqdsCFqJQgbh
 der/2Dm5Z060Z9YOg9JwUOeeWUWmPZLelY2TVfJDBKu0/ccaC97U2d2M91wtghYxdvym
 N2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718700795; x=1719305595;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sVER3ppowxMPvCNe3SDX+A7Me1Hrn33qQHZFeWMqsbE=;
 b=VzGhgosYhHuXqevq8hXhNu2dG2Cb+bgWJQUoifwkxtXErWK1/e3EbOB60xj1icfPEi
 0AmjAqZboegmxsZw6b5Si7atm7dlATP4eTEywvBIVrIeNWDhBIcIyiJ5vgE6II5Vwkfd
 +OefdTyWnkPw31bKyZBmR8RF73jhU0MoHLQV007mWOzksyFkKKbiSag3c5Mz5DThdKsP
 pUR9K4PMutT5IJppmXOn+eHYMnDSKFtt5+YLFz7ClQTB2zuDY77S6ssowIcRIcOCHpls
 nPSWmdugvsts4ZofiZ5b20BCy/0wBXabKrmg1Byo21l76UIgdT99Yu06F0/24/YmjBYR
 LLvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtlXlmAeAex6bZOGwnb4q9QH5U86praHU7MXGsA31lKKu1ehSMF53XyW22wXwhZUpbqYKHTAjf9yN0/cGIwWPg5yE2O36uNBnQlCj6CpuE
X-Gm-Message-State: AOJu0YyOkrC6gyYxINAKBhoxrX/aWdrzVKcnHsm3Opxj+sWXFsMV1zYo
 X5U9/3+MUZW0zwoMkhyhsgnZ/nFqeZFwzKtgqwVSVoL9kNj0mru6YE8mag9J6iM=
X-Google-Smtp-Source: AGHT+IHjljSrzg9NpUqW7k5AdRVnTpSNq4ainlTzhMuboYE5T1cHBMCyozCY9/8dplx6irn8mzOGmg==
X-Received: by 2002:a2e:350e:0:b0:2ec:2b25:3c8e with SMTP id
 38308e7fff4ca-2ec2b253d64mr35720221fa.39.1718700795066; 
 Tue, 18 Jun 2024 01:53:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c7840bsm16409561fa.98.2024.06.18.01.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 01:53:14 -0700 (PDT)
Date: Tue, 18 Jun 2024 11:53:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Jean Delvare <jdelvare@suse.de>, dri-devel@lists.freedesktop.org, 
 LKML <linux-kernel@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Andrew Morton <akpm@linux-foundation.org>, YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH RESEND] drm/display: Drop obsolete dependency on
 COMPILE_TEST
Message-ID: <w2el7qxjvc2utmgn24l45ltuh6gjre6pfgyd44ehb6iciwfxck@rg7sdypno3pe>
References: <20240617103018.515f0bf1@endymion.delvare>
 <xd2yybtxvzte7gwqwg2vudzvhoekqao2dle6zsuduzjzi3rsay@xhahwof2prph>
 <20240617132348.5f20bf89@endymion.delvare>
 <vsrsvmrkqnmxs3ncqv5m2gevzefiq55tr2iolxlmoehsvgcfkn@hyx37vax6r5e>
 <20240617201814.73a07702@endymion.delvare>
 <jbqbn6zaqq7j5htxuqxb34tjrf5lnqabkh5ywtnklhd4owyc3h@ztvolr6hjrti>
 <CAD=FV=X4qVDTOdMFQeEiJi2DD=tuEj66vP35XQKrSj5-r_YADQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=X4qVDTOdMFQeEiJi2DD=tuEj66vP35XQKrSj5-r_YADQ@mail.gmail.com>
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

On Mon, Jun 17, 2024 at 07:12:05PM GMT, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jun 17, 2024 at 3:26 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, Jun 17, 2024 at 08:18:14PM GMT, Jean Delvare wrote:
> > > On Mon, 17 Jun 2024 14:55:22 +0300, Dmitry Baryshkov wrote:
> > > > On Mon, Jun 17, 2024 at 01:23:48PM GMT, Jean Delvare wrote:
> > > > > Hi Dmitry,
> > > > >
> > > > > Thanks for your feedback.
> > > > >
> > > > > On Mon, 17 Jun 2024 12:57:19 +0300, Dmitry Baryshkov wrote:
> > > > > > On Mon, Jun 17, 2024 at 10:30:30AM GMT, Jean Delvare wrote:
> > > > > > > Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> > > > > > > is possible to test-build any driver which depends on OF on any
> > > > > > > architecture by explicitly selecting OF. Therefore depending on
> > > > > > > COMPILE_TEST as an alternative is no longer needed.
> > > > > >
> > > > > > The goal of this clause is to allow build-testing the driver with OF
> > > > > > being disabled (meaning that some of OF functions are stubbed and some
> > > > > > might disappear). I don't see how user-selectable OF provides the same
> > > > > > result.
> > > > >
> > > > > Historically, the goal of this clause *was* to allow build-testing the
> > > > > driver on architectures which did not support OF, and that did make
> > > > > sense back then. As I understand it, building the driver without OF
> > > > > support was never a goal per se (if it was, then the driver wouldn't be
> > > > > set to depend on OF in the first place).
> > > > >
> > > > > Some of my other submissions include the following explanation which
> > > > > you might find useful (I ended up stripping it on resubmission after
> > > > > being told I was being too verbose, but maybe it was needed after all):
> > > > >
> > > > > It is actually better to always build such drivers with OF enabled,
> > > > > so that the test builds are closer to how each driver will actually be
> > > > > built on its intended target. Building them without OF may not test
> > > > > much as the compiler will optimize out potentially large parts of the
> > > > > code. In the worst case, this could even pop false positive warnings.
> > > > > Dropping COMPILE_TEST here improves the quality of our testing and
> > > > > avoids wasting time on non-existent issues.
> > > >
> > > > This doesn't seem to match the COMPILE_TEST usage that I observe in
> > > > other places. For example, we frequently use 'depends on ARCH_QCOM ||
> > > > COMPILE_TEST'. Which means that the driver itself doesn't make sense
> > > > without ARCH_QCOM, but we want for it to be tested on non-ARCH_QCOM
> > > > cases. I think the same logic applies to 'depends on OF ||
> > > > COMPILE_TEST' clauses. The driver (DP AUX bus) depends on OF to be fully
> > > > functional, but it should be compilable even without OF case.
> > >
> > > The major difference is that one can't possibly enable ARCH_QCOM if
> > > building on X86 for example. Therefore COMPILE_TEST is the only way to
> > > let everyone (including randconfig/allmodconfig build farms) test-build
> > > your code.
> > >
> > > On the other hand, if you want to test-build drm_dp_aux_bus, you can
> > > simply enable OF, because it is available on all architectures and
> > > doesn't depend on anything. No need for COMPILE_TEST.
> >
> > I'd probably let Doug respond, what was his intention.
> 
> Is this me? This looks like a straight revert of commit 876271118aa4
> ("drm/display: Fix build error without CONFIG_OF")

Thanks!

> I don't personally have anything against removing COMPILE_TEST for
> this given that I wasn't the one who added it, but make sure it's not
> going to cause randconfig issues.

-- 
With best wishes
Dmitry
