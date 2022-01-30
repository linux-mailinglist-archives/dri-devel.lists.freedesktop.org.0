Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 453954A32EC
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jan 2022 01:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B1F10E1B5;
	Sun, 30 Jan 2022 00:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990CF10E1B5
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 00:46:21 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id p5so29483493ybd.13
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 16:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5CkGE9Ok32toHn0F3ILw6NYE0JtPX1pPXi5Uwmz6i/E=;
 b=CyU4byVCy2zP7rLS3aAb+Gpyn1UzN3hst7qvRNGEhOqDefWNCL04SQZesw4CRgRD6X
 61N2DWtykRl1OJJvVZz+5PAPGJ2iwEm1lN8xX/p6t6nkjymmfTMeX6rXjap2fzt9lUrq
 yUlnYyXckP7xumLSMnsyRUb1Xvd5xAa+8EW/KbxvzHYd5wLKqRDUo1Cm+TQfFSncxJRN
 Vu4kWqsXIpl10WECsTCRDAXQ+FEfWS+svoRk3x/RhBwMj/9nllXUIFFVj1FwC3n0w2JU
 uVb9ZQiLCUblH3S41y+XovOjQoS10o67rJpLngNbP7ht7F8sAMNPUYgX6S2W71vbOxRl
 T2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5CkGE9Ok32toHn0F3ILw6NYE0JtPX1pPXi5Uwmz6i/E=;
 b=WPNjFXbRXu4EoTq2+IobpBHh84b/tsz6GlgVhdnP32+WWg8b+pmdr6iKxiOsEwXCRh
 OG5iiLrQx3S/Di9LcjXSp1VR+7htuRUxoiXRbH5TeJDN/rKmCpZlDBlhbv37v/lJJPRN
 8+XyvYFidU7Ligd0YhL/qXaTO5uAcass9K/w7VzdaM1vGNbeUhen5VTmeZiCHBoPdnCH
 aZVYX5FBJkwTAE8b1qXqKeZCk6SzAWF87yaDpd9k2/L8ODcFm2DtTebce00y1OyDSl2m
 eeYNy82g8YdKr1lk/BG+vlw+L6hr9u2JZbcCXQQMTm6z8mPLQglkzYRj+mG7i9pnfxxK
 DxJg==
X-Gm-Message-State: AOAM533qwGRtXZgPzDGbz31UnkXU5VRI5W4k+Dnwr4V8TPRo/CCRe4Dw
 nhUAPgFFc34rCZRECP5YLJyhCd9UCUDqs/+Xl3LFfw==
X-Google-Smtp-Source: ABdhPJxBBbvxiS1E9vs8QRFfJybGryxP5F1pejpBuS7PwfZtqKt4WfyDm6NBmgEeNSTPVT4THEVvoRYsy2lA+HhDHi0=
X-Received: by 2002:a25:2451:: with SMTP id k78mr20790628ybk.511.1643503580791; 
 Sat, 29 Jan 2022 16:46:20 -0800 (PST)
MIME-Version: 1.0
References: <20220120150024.646714-1-paul.kocialkowski@bootlin.com>
 <20220120150024.646714-3-paul.kocialkowski@bootlin.com>
In-Reply-To: <20220120150024.646714-3-paul.kocialkowski@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 30 Jan 2022 01:46:09 +0100
Message-ID: <CACRpkdbnEKeDNmFCuUCLaySs6AtD9MPtxV+9JDxKuXvTs9iMVQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/6] dt-bindings: gpio: logicvc: Add a compatible with
 major version only
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 20, 2022 at 4:00 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:

> There are lots of different versions of the logicvc block and it
> makes little sense to list them all in compatibles since all versions
> with the same major are found to be register-compatible.

The reason we try to be precise is because sometime, long after the driver
has been merged and maintained for a few years, a bug is discovered
in a specific version of the silicon.

What happens is that a fix is applied on all silicon whether it is needed
or not.

If you have the precise silicon compatible, you can avoid this and target
only a specific version.

Yours,
Linus Walleij
