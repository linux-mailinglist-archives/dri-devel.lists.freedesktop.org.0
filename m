Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB04804D2B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 10:05:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5956310E4B8;
	Tue,  5 Dec 2023 09:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C6010E4B8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 09:05:08 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c09f5a7cfso23877425e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 01:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701767107; x=1702371907; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EB/Y92v0I9IkLUdwFZ6UBLMNAao4UX9xJXV50Zdq6Ao=;
 b=r7JqMQbKd34AOUZ7PUcXguU2t2ybnofxhaMI0oQ3OyzWwu8kLsBK8x5xIAhnNx4lCf
 /yOvoAj+tuzPAvx2bE/DB7Qc82+8Qh10qS5WMOfOT56ykTmJbYzOx08HWztKGurvp+x2
 1+sFgQEM7y9fqOXDQmF1UuZEqXaEd+y8Qtdl8fyoQuqqICsUGcOhFMkoAGf3TgGU1whA
 RLfOAbRxxg13NUNT65hdXcQXoUyIeffbwuo4v6aZHnEHYxWwyaq1MDxi5dXVcMOkNUf/
 owygZ0xb7VnN0InhsszGS784Aolj8r40z2UXj+YSabp/r6T3+M8D0lVKeXqtsD5AmB2P
 prKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701767107; x=1702371907;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EB/Y92v0I9IkLUdwFZ6UBLMNAao4UX9xJXV50Zdq6Ao=;
 b=tV6A0E/aqfRwWlNzXdECPET6i0VRrqMVgMjijJ85ztIEovHXL0StemhBNMHuWWEqVw
 GEZd7D5fT9/vv3joEEXdTJlv2o/5yrHRNCg8ZGBqXlPNaAPxLWIuzEz5YIWcs0/7eh55
 5tdAOkW+yztampyjrk8vcEYSfxxibazefxkI+tNb+tl2cakWGK1FOSelUILwghIOTCmF
 OCjyarp1GZdbxgAtRpAIJAk3FE+THYVUrs3Mmu5YPebvN89snYmWz9U7mn4wNRWtL2OJ
 zp5pXSr9uyVSGryHOngd7Q47k7KSVe2H+M9XEmKQlly141s1V4wOqw1IvJKHLd6wMhU2
 V6WQ==
X-Gm-Message-State: AOJu0Yx3vIxkrBfI4qtWidPE+UqtHMqDUOuOFUuDVQ9A42o3zSwm+LoC
 cKrg8yIyTeHeKLyKn5gWVcQ5lQ==
X-Google-Smtp-Source: AGHT+IHzbXwr5ME5OwjDJBGKBmy57k08KuhAPRUBnAvT+jiYCDRow0jaZ3wtgDJkcfuVRBvshGgQlA==
X-Received: by 2002:a05:600c:25cc:b0:40b:5e59:e9f3 with SMTP id
 12-20020a05600c25cc00b0040b5e59e9f3mr253482wml.146.1701767107112; 
 Tue, 05 Dec 2023 01:05:07 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c4f4800b0040b37f107c4sm17991122wmq.16.2023.12.05.01.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 01:05:06 -0800 (PST)
Date: Tue, 5 Dec 2023 12:05:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Maxime Ripard <mripard@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: Kunit drm_test_check_plane_state: EXPECTATION FAILED at
 drivers/gpu/drm/tests/drm_plane_helper_test.c:123
Message-ID: <42d85b15-9ffd-4a08-b51e-a3367e57d128@suswa.mountain>
References: <20231204173536.51003-1-naresh.kamboju@linaro.org>
 <rxv7jlfuwjib443pzdepbtgu454gdzemd3ojmmhbnhr4syneve@6me3bduyx2ee>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rxv7jlfuwjib443pzdepbtgu454gdzemd3ojmmhbnhr4syneve@6me3bduyx2ee>
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
Cc: regressions@lists.linux.dev, tzimmermann@suse.de,
 Naresh Kamboju <naresh.kamboju@linaro.org>, linux-kernel@vger.kernel.org,
 lkft-triage@lists.linaro.org, dri-devel@lists.freedesktop.org,
 davidgow@google.com, Linux Kernel Functional Testing <lkft@linaro.org>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 05, 2023 at 09:37:05AM +0100, Maxime Ripard wrote:
> Hi Naresh,
> 
> Thanks for the report
> 
> On Mon, Dec 04, 2023 at 11:05:36PM +0530, Naresh Kamboju wrote:
> > The Kunit drm_plane_helper failed on all devices running Linux next-20231204
> > 
> > ## Test Regressions (compared to next-20231201)
> > * qemu-armv7, kunit and
> > * x86, kunit
> >   - drm_test_check_invalid_plane_state_downscaling_invalid
> >   - drm_test_check_invalid_plane_state_drm_plane_helper
> >   - drm_test_check_invalid_plane_state_drm_test_check_invalid_plane_state
> >   - drm_test_check_invalid_plane_state_positioning_invalid
> >   - drm_test_check_invalid_plane_state_upscaling_invalid
> >   - drm_test_check_plane_state_clipping_rotate_reflect
> >   - drm_test_check_plane_state_clipping_simple
> >   - drm_test_check_plane_state_downscaling
> >   - drm_test_check_plane_state_drm_test_check_plane_state
> >   - drm_test_check_plane_state_positioning_simple
> >   - drm_test_check_plane_state_rounding1
> >   - drm_test_check_plane_state_rounding2
> >   - drm_test_check_plane_state_rounding3
> >   - drm_test_check_plane_state_rounding4
> >   - drm_test_check_plane_state_upscaling
> 
> I found the source of failure to be f1e75da5364e ("drm/atomic: Loosen FB
> atomic checks").
> 
> Fortunately for us, it's already been reverted yesterday for some
> unrelated reason, so it should be fixed in next-20231205 onward.

Sorry, that's a bummer that these patches were reverted.  :(  The whole
episode was a bit unfortunate...

Qualcom has been working on those patches for a year.  They must not be
using kunit testing as part of their QC...  It's some kind of
communication failure on our part.

Hopefully we can get this all sorted out and re-apply the patches soon.

regards,
dan carpenter
