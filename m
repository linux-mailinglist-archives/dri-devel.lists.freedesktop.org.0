Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 278BF4A32EF
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jan 2022 01:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7C910E1B8;
	Sun, 30 Jan 2022 00:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1514E10E1B8
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 00:46:57 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id w81so7327907ybg.12
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 16:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KAfmV2XPrbcMqVhndkzGzY+w8H1ibzDYb+Ml7huAryE=;
 b=NaWg7ApeC09EQY/CJ/W25ZLJZoNitSiYuPfGysObv/UTGU9NUNdCXb1DdSbEZodzye
 IH9OGfSiUYJWivIhzwf/P0P0pqKMXrrtBUTsAwI9HQZW8hUxoSZj3j18sLTfxl5iZjxh
 o84foTOSgqeFWKqUfUSoKSAosOYXr/Al9fUg3IDcM7+pIgrhM6cJ+t8ogReqnXeIf8vR
 2/a+8UcnpzyZ0reNAfhX/opnTfQEXw+5IQ/FztUpOP0HA+bgwBHru9uRagVYZTEs3L3C
 uW4fdpqSBf0N0Yp7TzqcAB+sRrSlp21Zsi90wtzXJtXRJ8+oWx5NkXiMSQmWDsgTREtx
 hD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KAfmV2XPrbcMqVhndkzGzY+w8H1ibzDYb+Ml7huAryE=;
 b=7GNO524BJKdnoZeU2TTKiC+8ROiOl86nFWxRLxsyr+NdN8oDGnd/QLjDfr6fzgi9IC
 E7sC9BoB+wH8J6tGHz6ZvnVRWh4CoiJqo1o2GPQnaFCCjtGXgw0Cos4EvVHONYcne8wJ
 UEwr/vieddmSjhMJVdTX9xAR1U8CILysEJdvghYMLxLYLWImOlYy1tTFvwQ8eDCNkMeA
 2vIuX0mIOn10gcsO6RHJL6s5GBI/KukVouzQgpW+wFHQRt41rrOCxIg8Ntvk7MR7eZYl
 Dtf2LHpuRIN7vw9N7xfKueFs2YYBNO42xKvTpHkBCS2Pfiual3yJOu3myHuxGdRpJeYg
 O7FQ==
X-Gm-Message-State: AOAM53110Lh1ny4WKUf955/iUSB3JfRDNFRRjjfUhdQgYs00Wy7BIiZY
 NmU2vXXb6m0JyGp7biViFjG/bsq92z7sE0456NGz8g==
X-Google-Smtp-Source: ABdhPJxgbS1t2Nwj6sfn6p8sKTS1bE8L273N6tr+1TJqhugSlRrkIMo99/GZ+xiBo52oNvQ4sJbVps16o+lrp2z1cBE=
X-Received: by 2002:a25:5143:: with SMTP id f64mr23512899ybb.520.1643503616244; 
 Sat, 29 Jan 2022 16:46:56 -0800 (PST)
MIME-Version: 1.0
References: <20220120150024.646714-1-paul.kocialkowski@bootlin.com>
 <20220120150024.646714-5-paul.kocialkowski@bootlin.com>
In-Reply-To: <20220120150024.646714-5-paul.kocialkowski@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 30 Jan 2022 01:46:44 +0100
Message-ID: <CACRpkdYNCpPUpJmbXNteEJ3kPkLQCMCcBezj8oYhwRZvmA-Vqg@mail.gmail.com>
Subject: Re: [PATCH v10 4/6] dt-bindings: display: Add compatibles with major
 versions only
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
>
> Add common compatibles that only list the major version instead.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Same comment as the other binding patch.

Yours,
Linus Walleij
