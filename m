Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E64509970
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 09:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245F610F88E;
	Thu, 21 Apr 2022 07:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82F710F88E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 07:46:06 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id u18so5405786eda.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 00:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xueFlLS/AZxrU9SUkQ2FQU5VYlSgM2qCJjLUnN4XaFk=;
 b=axHTrC19SmnFuGe23nnW0DMoSNCdyDFeux/krw45FYRIKCKhZZ5yXv5L9V6YFJISk0
 9DyBC1nGxEgNRGuDbeRAIQVZxW2DYwONHEh8CGskvZXfDIlMeTzJflJ3YjFa6smbzVAu
 eJfQekLsHH8NBCznIg8vvfVG04D5HpqL3JTHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xueFlLS/AZxrU9SUkQ2FQU5VYlSgM2qCJjLUnN4XaFk=;
 b=p9pwwxhbCVdatDcYuSDNnB/7vZpmhDj1wHOyxZil4i4Im1+71O4bHRBa2T5HoMhPpg
 fYJQi3rCHtUGXjaqMpnEhs3IKrRjiPe3GTIasLAPXJIBV/ja/u++ylf85GVwba+Y7RLb
 wRu1Hfg/n7DK+WAXdnhkHEDSU3kHRNLP1civpo4RLN1iz4A71B3Wx8Hc1Lpxx+5O2Z2R
 80y03646cSpiYjgoVJpfiscW2kWoTnfFHrWOkpZYagfv3k5bfuQRFG/s9igBBa69JFjZ
 O9Sdsa4L+Jf0jvuAy4mdMFVqBj1O+5tJhu/47+sYQz1tL3qhalgdzEOtjWMUDKD1LNcS
 xnXA==
X-Gm-Message-State: AOAM53205fi7w1rNRFTZP+Bl8amHvMMHFNmz1Kz+HNhZhokPH+VmDL6m
 MMvYzjtlfQSwSV256cX7YjiaWM1jANznG5FL+QDqJA==
X-Google-Smtp-Source: ABdhPJwuoM/Pk3gnukt5KMZfQCSdnQrVvQBf1lC1EKOi6WVC45MWzZf0LgtgCsJ0Ihu7RVgjAhldJ/k/WTUe7SY441Y=
X-Received: by 2002:a05:6402:26cd:b0:423:b43d:8b09 with SMTP id
 x13-20020a05640226cd00b00423b43d8b09mr26396374edd.400.1650527165319; Thu, 21
 Apr 2022 00:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <20220420231230.58499-2-bjorn.andersson@linaro.org>
In-Reply-To: <20220420231230.58499-2-bjorn.andersson@linaro.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 21 Apr 2022 13:15:54 +0530
Message-ID: <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Linus
+ Marek
+ Laurent
+ Robert

On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Commit '80253168dbfd ("drm: of: Lookup if child node has panel or
> bridge")' attempted to simplify the case of expressing a simple panel
> under a DSI controller, by assuming that the first non-graph child node
> was a panel or bridge.
>
> Unfortunately for non-trivial cases the first child node might not be a
> panel or bridge.  Examples of this can be a aux-bus in the case of
> DisplayPort, or an opp-table represented before the panel node.
>
> In these cases the reverted commit prevents the caller from ever finding
> a reference to the panel.
>
> This reverts commit '80253168dbfd ("drm: of: Lookup if child node has
> panel or bridge")', in favor of using an explicit graph reference to the
> panel in the trivial case as well.

This eventually breaks many child-based devm_drm_of_get_bridge
switched drivers.  Do you have any suggestions on how to proceed to
succeed in those use cases as well?

Jagan.
