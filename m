Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A6FA760A8
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 09:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A789110E393;
	Mon, 31 Mar 2025 07:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W3/bh3EO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B9E10E394
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 07:55:37 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5e6c18e2c7dso7682949a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 00:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743407736; x=1744012536; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jhSDhknLfaKoAskNTlrl4k31o/FzwCgA7zXF8gqAJQg=;
 b=W3/bh3EOrbk9TZdTkuqbq5Oosh4HXOA1cB4+hpf9oxb4XC/ss6Ksxjza0HzXfgujN3
 kBeS1wbDkSUGGC9N/V82cmQmFjPbt3EnJn789shTT7ZmA6/si8rq4Rly/x/hZvjHsm1x
 6sf9n8iR8pobu6kA5vxwurX70Q1c/HxgP0vrXHlEbm3hvwDMZ1pgI/dzdi/jKbcTconM
 IAJ6KflxxGqRvkETJydG/0dgBq6Apo4gNexpn7z1AoLY0VvKkPJaKu1b2aWPoIrd77D4
 umDx9aBNl3cm8RBq2iABVM0GMfp6afq+4RIXTj035Xn5m3Ag/wg9QCPRf786+mdYp3oB
 W2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743407736; x=1744012536;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jhSDhknLfaKoAskNTlrl4k31o/FzwCgA7zXF8gqAJQg=;
 b=hhULzBICdXGtXfffhbER0tjr9utUya32TlPP+obVJ3a3AB8/3RB2l+YRaVQtvlHOq3
 XNhI7kvF663Aroq6uEWeuu6MynSskEU4tAyjpMSmL/w+7Z0b2uMVp8UsTHeSMeegsgZ+
 6PttDynVlY6FN898JmBHLEBHYfTsktFZZ/qMFeSCF7VUR4eHvUo83qe3Xr2t3Mp17LVU
 CPWXyQ52ikh+EcFma0iVZHrX1LiatKR+G+/zx9fjQV2G1sY88ujEbsBZDGnlAUEsr53C
 e5CR1XpJl6vyQW9uXS/wrNvOsAJXTusvDVip3QGyta9u0pZIbJgfqYvoZRAEnuI7vKHC
 Q1KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+IY3RsJYsJ5RiqGgx8F6XEqAlAwIovo8n+CUA+etBkwfK7N1yZy5u5rrL8TS4qpyc/xPQh4vBJpg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz/TOHCYXA9571A0V3y02oMk3CG81yY4DO9ABGl2rqVNe66x1V
 EDPawZJArqaJ9iXQdWLjXmFvq8m8FLcOGgG/SF6o+kZyzA2sWq/omxX7xX4CbH8BOTGoAEJRfMi
 uhNIdZKnMvFhSQGMI8FKBEW0IR8k=
X-Gm-Gg: ASbGncuJ5m+F2gvFTr/Iq4h98th31a5sM0XP/V9dNhY3f65Lv1XVkfzKPOZuRSZPgrc
 WuxK/orfPaCoD91ceWIciQjdO3jPGGfGWB0UjgBo6S2amOgTL5mvdFxiV7q8NAtJ9DpzoyIuXVR
 bjSGBqmBe9wAurzkbvBTo6nMTRFw==
X-Google-Smtp-Source: AGHT+IG+P9tkPvhVhRPKISalG/60ZULdT19cun5J/nPAl6qjbLOBD+JT+BRWsBqhaBCLHd4636n+W5g3kjd2i/Cb1f8=
X-Received: by 2002:a17:907:2ce6:b0:ac3:413b:69c7 with SMTP id
 a640c23a62f3a-ac738be07f4mr640242066b.39.1743407735884; Mon, 31 Mar 2025
 00:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250327160117.945165-1-vignesh.raman@collabora.com>
 <20250327160117.945165-3-vignesh.raman@collabora.com>
 <v4dhuuuvfk63bakncz43z3ndjdze5ac7nrv6qvtpdnonfpetsx@5hh3vzcj336x>
 <20250331-amphibian-hopping-bobcat-e19a0b@houat>
In-Reply-To: <20250331-amphibian-hopping-bobcat-e19a0b@houat>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Mon, 31 Mar 2025 10:55:23 +0300
X-Gm-Features: AQ5f1JpQ9fyxYtLdrUedBGMD-ND6srXxfnPbzw0qqt2zxCvy4-i4JXwyMC3DrT8
Message-ID: <CALT56yO-=nQnTB=H4L-qnta4js3FB=-WCOFj8q57PPWjLY+JKA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/ci: Add jobs to validate devicetrees
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org, 
 daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com, 
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
 lumag@kernel.org, quic_abhinavk@quicinc.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 linux-kernel@vger.kernel.org
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

On Mon, 31 Mar 2025 at 10:53, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Sun, Mar 30, 2025 at 08:06:45PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Mar 27, 2025 at 09:31:11PM +0530, Vignesh Raman wrote:
> > > Add jobs to run dt_binding_check and dtbs_check. If warnings are seen,
> > > exit with a non-zero error code while configuring them as warning in
> > > the GitLab CI pipeline.
> >
> > Can it really succeed or is it going to be an always-failing job? The
> > dt_binding_check generally succeed, dtbs_check generates tons of
> > warnings. We are trying to make progress there, but it's still very far
> > from being achevable.
>
> It depends on the platforms I guess. Some are 100% covered and any
> warning should be treated as a failure, and some have not started the
> effort.
>
> I guess we could solve it with some kind of expectation list, but I do
> wonder if it's something *we* should be focusing on :)

I think that we might want to limit this to `make dt_bindings_check
DT_SCHEMA_FILES=display`, checking all GPU / display schema files.

-- 
With best wishes
Dmitry
