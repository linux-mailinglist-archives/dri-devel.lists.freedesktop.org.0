Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0EB82873A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 14:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B0510E45A;
	Tue,  9 Jan 2024 13:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D609F10E079
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 13:38:19 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3bb9d54575cso2736085b6e.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 05:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1704807499; x=1705412299;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7mDLa1lDA9I4zsDt/vUi7Q5DM723KSTf2pIxDEMdeEE=;
 b=YTdsUGrlVhC4D+51bbQeFzVLHFUvOQsR3NBmPhm5AgUq9T+be/KRycU6hKW7shFuD/
 v4GLQknE+GiRxy1XBQjD4oU7cjwyHE0DDO0reWrkj0xO9zPOBsUWVEGw7bS9VZz3CDTA
 8ZBeJ3yuBtp43CeMUxWQrk9I2U1euQmt0me/GFnizS2dHazKxTpVWZFbKj242/xkKG4M
 oZpfrUimlNxu2AjfBqE6dRhxbt6XeQCt/ORVqnyIhRGeu58r7Z8cHsyIoh5JLQgHn5mO
 0dx/zqO8apLbJ1lAMaOjFCTLzNYXVmynSqMkGgTJ33zeMsroPJZ3FXHul2+GUIWDM/nd
 hP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704807499; x=1705412299;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7mDLa1lDA9I4zsDt/vUi7Q5DM723KSTf2pIxDEMdeEE=;
 b=o5gcf5xA8oSQSEZwr+SD/9vm5FzY1DDal0R0ySh+RFbqGgMfCBHtPDjGI7fmhA027D
 kfixsum0UWtGpJqOV5iqaATBNIi3j9nnY8PqW2tI5+qU4hjkhwz31J5gz2IfmYOekdmU
 OToHy6hP26cZfoQutOLN3jqzBfzbOAwPYlVkM9Q5yBAHRIbWyfJBMHYh+IRNVREX94sf
 tvbIiJf5xqztvuogdTvRe58lnhYYPzBYvIz4JDVqXjXpBbuitQky0FQy/pUHzeXtwdZu
 uyYj4IaPCd2iAmekTv5RI6Wyt6fJ2vch2g9Ucb3xEr3msAC/V/AgYIXvrCuc5BRxWqvx
 Iy+Q==
X-Gm-Message-State: AOJu0YwfUQ1ynXFJU9gC3Q4JUjEDD5aGeXrvLCeBSurkprC5WOlCgajk
 kDQvLEnyFoWDa6E88ke3WyhTsVFoDqTyodU8ZjpsMxYskeHNDg==
X-Google-Smtp-Source: AGHT+IEiIF+TOwHH0WeGea/W9p977jXEPA2RPNa5wHtj/r0Fwo02EIRShmM0F605PcR5+mNqG3weRRapKtHQAzzaPtk=
X-Received: by 2002:a05:6808:3185:b0:3bb:d83a:99a8 with SMTP id
 cd5-20020a056808318500b003bbd83a99a8mr8896956oib.58.1704807499107; Tue, 09
 Jan 2024 05:38:19 -0800 (PST)
MIME-Version: 1.0
References: <20231220121110.1441160-1-vignesh.raman@collabora.com>
In-Reply-To: <20231220121110.1441160-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 9 Jan 2024 13:38:08 +0000
Message-ID: <CAPj87rOMPioOK0r74vcnVkXusm6Nah6KNUWyxYgpVLdkMNtW2g@mail.gmail.com>
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

Hi,

On Wed, 20 Dec 2023 at 12:11, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> Some ARM SOCs have a separate display controller and GPU, each with
> different drivers. For mediatek mt8173, the GPU driver is powervr,
> and the display driver is mediatek. In the case of mediatek mt8183,
> the GPU driver is panfrost, and the display driver is mediatek.
> With rockchip rk3288/rk3399, the GPU driver is panfrost, while the
> display driver is rockchip. For amlogic meson, the GPU driver is
> panfrost, and the display driver is meson.
>
> IGT tests run various tests with different xfails and can test both
> GPU devices and KMS/display devices. Currently, in drm-ci for MediaTek,
> Rockchip, and Amlogic Meson platforms, only the GPU driver is tested.
> This leads to incomplete coverage since the display is never tested on
> these platforms. This commit series adds support in drm-ci to run tests
> for both GPU and display drivers for MediaTek, Rockchip, and Amlogic
> Meson platforms.

Thanks a lot for these. The patches need to be squashed to be
bisectable though. For example, patch #2 changes the MTK job names and
adds more jobs, but the corresponding xfail updates only come in #7
and #8. This means we have a span of a few patches where we don't have
useful test results.

A better sequencing would be something like:
  1. add ANX7625 config
  2. refactor _existing_ MTK display jobs to use YAML includes, change
the existing job name, and rename the existing xfail set, remove
IGT_FORCE_DRIVER from the script since it's now set by the job
  3. add MTK Panfrost+PVR GPU jobs with new xfails, add xfail entry to
MAINTAINERS
  4+5: same as 2+3 but for Amlogic
  6+7: same as 2+3 but for Rockchip

Then the separate rename/update xfail commits just disappear, as does
the removal of IGT_FORCE_DRIVER, because it's just done incrementally
as part of the commits which change the related functionality. It's
extremely important that every change can work standalone, instead of
introducing intermediate breakage which is only fixed in later commits
in the series.

Cheers,
Daniel
