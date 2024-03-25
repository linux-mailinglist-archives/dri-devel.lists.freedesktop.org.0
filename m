Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F24C288AFCE
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 20:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBF410E3AA;
	Mon, 25 Mar 2024 19:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MGVe6Cju";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45F610E3AA
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 19:24:43 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2a0782f0da5so637622a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 12:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711394683; x=1711999483; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P8SlcQVDmaEWiOte6mDmefSXrzEKVOFtuPmb7V2Kzic=;
 b=MGVe6CjuOpQjFOZKI6Kemw5aGsvCr2CxDXoZ2PNL+f7zyM0klEPVLVRxSa2Ww6zOx0
 H3mXfy/aq/jAu133M78k+ppS//c61DlvWTp5gCV3ZHkurAlKuV3ZrR3A94WFJZ/IamgF
 sFSsbg/b/h8Pg/OKP9BS/2CMv1GpVTS3SdAXoqyV7rg0w8sRxSYgomx1e7VNnyB/+oyT
 1eMXyvX4LR9Hkke9ny0riWrlQFStX3ncgLSrSZFQOniEJ1YWfD9EMR6aCFSg0YK9UnaE
 pm7J9wqgkSfJVG7VDCz32EgVTFHgR0FpRXSI5Q+2U5iXwNpIl4ALt3NFBzXFQZktYPmZ
 LVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711394683; x=1711999483;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P8SlcQVDmaEWiOte6mDmefSXrzEKVOFtuPmb7V2Kzic=;
 b=s0fC3p8Egu6WV9ST1zlRALNTFW5z2Vam/PucFCSiVOcOJASyVUwICw1HQ5JKDQbikm
 mgKSIkN4bjvotvmXgpDdiqZm/+n2rvHPAFZhMC3OCtsW9y6nu16gGy+C94aMXbO/D9zY
 pt4cHJtSj2Sj1j7PrGgOM5QWAMMEn8SjJ3/Rlmy/lPy+j3lHHtOicd1SbyGCCEv8LDcH
 SvWW3F4UWMKwGd2LVVcIcZcqZvCX+447VdgjPRoymr2S/twBKM7JWykZQWIKzcZVNxIg
 /mIKnx30DIxt8hAnRymhHJyiQ4NtFBOyJ7hOs7edYnokMth8H+A5qlNZXrJo38Laq05j
 l+3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+VIrYVz4+cCB8Kx6Q0wAbPVuGSxu+4BPwXc0HlDLm2fM0ggMDjOpE4yTN7pGDyJ2/LFa40zg5uBI1BSNdZLhN8bucXJVX5H6XFqoELfyC
X-Gm-Message-State: AOJu0YxWiDjAPVeNb9k+DS2AVJfJIjPBSiGAJhpdy7kAIS9+nuZ5bJeQ
 eKXOLJNhy2wcv2Cs0WVyvhQ9AXktrcGY52J2J/lTor87qodFcoe/
X-Google-Smtp-Source: AGHT+IFwrImv53xAJXZaDSLJtn5nAAXYRWdj5wAShxC6nIYkDeejlGCGK79rEKa0DnGROBP9wWQclw==
X-Received: by 2002:a17:90b:3d8:b0:29b:a345:620a with SMTP id
 go24-20020a17090b03d800b0029ba345620amr10896738pjb.20.1711394683229; 
 Mon, 25 Mar 2024 12:24:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a17090a304700b0029bf9969afbsm10113710pjl.53.2024.03.25.12.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 12:24:42 -0700 (PDT)
Date: Mon, 25 Mar 2024 12:24:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH v2 05/14] drm: Suppress intentional warning backtraces in
 scaling unit tests
Message-ID: <e880828b-552e-488e-9f31-3989bec276ae@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
 <20240325175248.1499046-6-linux@roeck-us.net>
 <0729b218-53f1-4139-b165-a324794a9abd@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0729b218-53f1-4139-b165-a324794a9abd@igalia.com>
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

Hi,

On Mon, Mar 25, 2024 at 04:05:06PM -0300, Maíra Canal wrote:
> Hi Guenter,
> 
> On 3/25/24 14:52, Guenter Roeck wrote:
> > The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
> > intentionally trigger warning backtraces by providing bad parameters to
> > the tested functions. What is tested is the return value, not the existence
> > of a warning backtrace. Suppress the backtraces to avoid clogging the
> > kernel log.
> > 
> > Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> > - Rebased to v6.9-rc1
> > - Added Tested-by:, Acked-by:, and Reviewed-by: tags
> > 
> >   drivers/gpu/drm/tests/drm_rect_test.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
> > index 76332cd2ead8..75614cb4deb5 100644
> > --- a/drivers/gpu/drm/tests/drm_rect_test.c
> > +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> > @@ -406,22 +406,28 @@ KUNIT_ARRAY_PARAM(drm_rect_scale, drm_rect_scale_cases, drm_rect_scale_case_desc
> >   static void drm_test_rect_calc_hscale(struct kunit *test)
> >   {
> > +	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
> >   	const struct drm_rect_scale_case *params = test->param_value;
> >   	int scaling_factor;
> > +	START_SUPPRESSED_WARNING(drm_calc_scale);
> 
> I'm not sure if it is not that obvious only to me, but it would be nice
> to have a comment here, remembering that we provide bad parameters in
> some test cases.

Sure. Something like this ?

        /*
         * drm_rect_calc_hscale() generates a warning backtrace whenever bad
         * parameters are passed to it. This affects all unit tests with an
         * error code in expected_scaling_factor.
         */

Thanks,
Guenter
