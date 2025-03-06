Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A73A5518C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7509210EA1A;
	Thu,  6 Mar 2025 16:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xkmHnfCa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E5C10EA1B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:42:34 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5497e7bf2e0so999609e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741279353; x=1741884153; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=k1TEoG6Bs4dGXKhJ2AGcoAN5xoNJpv8hc7dD8huvzUY=;
 b=xkmHnfCashRsaPuEYvlnzRTRazy8SzFXFLJfeFixs8p877S9xK1yFED7ONEWlDsrdY
 y+dCE7MfC1qP4lENupIe2OFJucr+gIeRyGX2Z2kKjdLxbJ9Swd22pDnvjejsx0uCibQx
 g4vdNqoN+3oIgptSUf/Vd9B7Iu5vKyjI6KpEZZ5F3Aj2LeS/aNHhK66QH+pyAinUccin
 5w+ZywVJosj+lpfMAK809vJrwnfx+Qzekhi8Sz2I+ttFEt/idQejc3453J5nOBRGEqMH
 vjUoVjvBZlyPR/IBi8QBXHrybTtLnmt8/nvIRD5uzC6khxNaBLvJ459MMRUuzOnBEl5Z
 X3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741279353; x=1741884153;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k1TEoG6Bs4dGXKhJ2AGcoAN5xoNJpv8hc7dD8huvzUY=;
 b=f6PucJXuEVAf2U2mi59EWdXrVP5lrwLWRqzBhtBidE8C6Uq1Za1DQ0bslUHNu0/doV
 9gX9dbKnn+UHmK3cdeNeDvX9/Gi0aj+B4KXyuGfvi9ailKK4ilYbtTscUYUVPJy4T8z3
 3jYvgwr029IqQ1FBs1m80L1mx9h49D+906hRaBmgFjayodnrZSqUnurGZU+m1Dv4Pl0m
 Ot5KYZXF/96Up7p1cW3F7fmLvzuerQfN0iyodO4EXqr/o7j8wUALWjl94a6hiqpGhUjy
 dEoOrSme/beqg9i4kW48Qaf//rfG0vsp3ZCpT1NB2r+iTL760W1b8ToewIamSHnqe5WA
 C3bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu36ZNoKSLX6jWDf4X7GgIBikJ78RhMueAr/w43mFQbwZn/f5xpl8Sc9zddhrZ+HYTt/Ik4g/K48g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybJqzSxFFuZZRDOBaRP0gwrFG9fWhJRF59d5wr5bW22GL/bvgB
 DYQ4I2UB6rqo3wOcV1cql1wSyuc9WieYGQT2eIgHS3ovJJGeDTp9EO134nTBINs=
X-Gm-Gg: ASbGnct8VHuVWlUSDMCeDwfCS/fspl7uCeXbj0e++N17aoN4nNysnSss0oMfbAB1Sva
 XCKGp5iBLNqALJsCHkai61f0jX7kUqNvwQCq/RokMpeoTDCko7rRO6njpGDuAyy7RWGuaKmxiC9
 oyOd6VZWmuZ8cSp+82nUoIHrERIVG3qr11L1Gn+WZsNFABs4sQjJKKyChSMHOYKLS9Nn/DAPgWl
 9qVALYJMVMQrYCPEUBd0VSVFBLIT338vp8pJvEoEcIB1hC/Wr42u2lpUNz7ZYm3SceQoO5+VuYM
 typioIQeb+vzP/UNq6b5Hg529i50aEuxUg3sB540Om/MgzwS9g+WtKP+D61De7w3qcGHFQQtl4X
 dNERS1pQugV/NKoc3orfB+fzq
X-Google-Smtp-Source: AGHT+IE1wW9mQTVmacyoQdeIAvRVB50L7n4ewIxrLBTw9juMr8FpFISjO6I/fHqGbHPO6+88qFtLCw==
X-Received: by 2002:a05:6512:33d1:b0:545:2efc:7458 with SMTP id
 2adb3069b0e04-5497d377827mr2510465e87.39.1741279352687; 
 Thu, 06 Mar 2025 08:42:32 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498b1bc204sm225871e87.176.2025.03.06.08.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:42:31 -0800 (PST)
Date: Thu, 6 Mar 2025 18:42:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC v2 0/7] drm/display: dp: add new DPCD access functions
Message-ID: <fdhegbtikit7n6ftql4cx4giikgt2vkue4jrasxfgkpxlgdbo3@vlcv63kz4j4r>
References: <20250301-drm-rework-dpcd-access-v2-0-4d92602fc7cd@linaro.org>
 <87a59ywda3.fsf@intel.com> <877c52wbrh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c52wbrh.fsf@intel.com>
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

On Thu, Mar 06, 2025 at 03:04:50PM +0200, Jani Nikula wrote:
> On Thu, 06 Mar 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Sat, 01 Mar 2025, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> >> Existing DPCD access functions return an error code or the number of
> >> bytes being read / write in case of partial access. However a lot of
> >> drivers either (incorrectly) ignore partial access or mishandle error
> >> codes. In other cases this results in a boilerplate code which compares
> >> returned value with the size.
> >>
> >> As suggested by Jani implement new set of DPCD access helpers, which
> >> ignore partial access, always return 0 or an error code. Reimplement
> >> existing helpers using the new functions to ensure backwards
> >> compatibility.
> >
> > I think that description is for earlier versions of the series, it's the
> > other way round now.
> >
> > Regardless, glanced through the series quickly, I like it, this is
> >
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> 
> PS. If you need to send another round, please Cc: intel-gfx and intel-xe
> to run this through CI for both i915 and xe drivers. Thanks!

It might be a good idea to do that anyway. I'll send next iteration,
fixing the cover letter and adding both MLs. I hope we can tolerate a
bit of spam for the sake of getting the series a proper CI test.


-- 
With best wishes
Dmitry
