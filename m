Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5E182B48B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 19:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9BB10E94A;
	Thu, 11 Jan 2024 18:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C462D10E94A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 18:11:37 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3bd562d17dcso414678b6e.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 10:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1704996697; x=1705601497;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GNwfPpOc+w6+qUvr4c6LiIOhhkOq06R1P3AdfBXYN2Y=;
 b=29V/pAgihHmtRCM66lpFHt4BDyb4m6Xagb64WJ78eQFnQRvxjvm965B0EYt2hRXHak
 4HbVhCjoJyRZCcpDGfVmiTKCPGAxrGY42L8qCym26OPBVfhknha/I+oQD0xnAi2BufmJ
 FdZielPEHjx/ukEJUXcrCHCb8XG2H6mqMPfo12im5mjPUvoc28KJB3oHuwJN/GBe+qfo
 Kue+Up3JTWCNcYGmrNGpd1YPz5qjhBdgrpvFPVSB7Mz2NQU1AWOgpMTo8gt9YcZVTkrX
 /ft3kgIpJkLLUcAtekZUILvJX1EVExzNsxSt/iYjDCfwR30gZyzcohwZNbOgL4mEiO/d
 qOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704996697; x=1705601497;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GNwfPpOc+w6+qUvr4c6LiIOhhkOq06R1P3AdfBXYN2Y=;
 b=LFOaaJWwbjPDTu8NBhf4TA4j58tp0Wmum5k8mAsv4vcZmW6J32EuIwJ8+OC7j0RYQJ
 S3OVjzwncWR46OlWBOliXcSHi1fxVN4TYhNLMjDCvSu9KzX73uW1TUX9G+yixE1ivB35
 gyeVXimrFm9iARcXiH2EA7RsRCejgWVG4t4UqMB2hGJeFTqaTgvUfEMaYxfxeILWfHOz
 2p/bQuVa8XzJOEN6ZZoIFFLrCC9m1EPXVon25Ek4zRkTZXYPGveJ1ExRA3BEnn/a61H5
 8DfEcoG0QGyEfvS1yOb/Hm0skpGNzCrU5H8RxvONX+cprDHdJPcnXrZ9RkHc8VkHrloM
 HghA==
X-Gm-Message-State: AOJu0YyIPHqKy2dktLpRaoqdOPX7/H2Sv6DXhOP6lbsenhjlVCHq+TN6
 uXw8viWp+HwejsIGh9HiwV1sEl2LbZP42zxn0Pzfw+w/k/rhlw==
X-Google-Smtp-Source: AGHT+IEOQA3VGINqdDq3XtCaDe7x77fu7+Iwu6ym4ijoXArXnWe9XYkfG56HHC5HEq3XFTuTf4bmEuP1OyFcAzpA/9w=
X-Received: by 2002:a05:6808:3989:b0:3bd:5006:e313 with SMTP id
 gq9-20020a056808398900b003bd5006e313mr78961oib.105.1704996696986; Thu, 11 Jan
 2024 10:11:36 -0800 (PST)
MIME-Version: 1.0
References: <20231220121110.1441160-1-vignesh.raman@collabora.com>
 <CAPj87rOMPioOK0r74vcnVkXusm6Nah6KNUWyxYgpVLdkMNtW2g@mail.gmail.com>
 <ad7cbd59-5264-96e8-5e9b-aafde8028e41@collabora.com>
In-Reply-To: <ad7cbd59-5264-96e8-5e9b-aafde8028e41@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 11 Jan 2024 18:11:25 +0000
Message-ID: <CAPj87rPRRfJmxTev50YqxBizyvzCUhCiymoV_bdqsZ-zvcREfA@mail.gmail.com>
Subject: Re: [PATCH v1 0/8] drm/ci: Add support for GPU and display testing
To: Helen Koike <helen.koike@collabora.com>, Dave Airlie <airlied@gmail.com>, 
 Sima Vetter <daniel@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 Emma Anholt <emma@anholt.net>, 
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 David Heidelberg <david.heidelberg@collabora.com>,
 Rob Clark <robdclark@gmail.com>, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org
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

Hi Vignesh,

On Wed, 10 Jan 2024 at 10:47, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> On 09/01/24 19:08, Daniel Stone wrote:
> > A better sequencing would be something like:
> >    1. add ANX7625 config
> >    2. refactor _existing_ MTK display jobs to use YAML includes, change
> > the existing job name, and rename the existing xfail set, remove
> > IGT_FORCE_DRIVER from the script since it's now set by the job
> >    3. add MTK Panfrost+PVR GPU jobs with new xfails, add xfail entry to
> > MAINTAINERS
> >    4+5: same as 2+3 but for Amlogic
> >    6+7: same as 2+3 but for Rockchip
> >
> > Then the separate rename/update xfail commits just disappear, as does
> > the removal of IGT_FORCE_DRIVER, because it's just done incrementally
> > as part of the commits which change the related functionality. It's
> > extremely important that every change can work standalone, instead of
> > introducing intermediate breakage which is only fixed in later commits
> > in the series.
>
> Thank you for reviewing the patches. I agree, will follow this sequence
> and send a v2 version.

Alongside Rob's patch to add msm-specific tests to the runlist, we'd
need to add the Panfrost-specific tests. Whilst we're here, we might
as well add the vc4/v3d/etnaviv/lima tests so they can use it in
future.

Panfrost should also skip kms_.* tests - since it's not a KMS driver,
it can't run the KMS tests, so there's no point in trying.

Cheers,
Daniel
