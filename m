Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 509834A32EA
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jan 2022 01:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0865210E1A5;
	Sun, 30 Jan 2022 00:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2E710E1A5
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 00:43:52 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id i10so29552975ybt.10
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 16:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i0heOt0MsnfbggLnL41BYSYo+JW4b1v4laT3az03jyE=;
 b=NTUUoAwKu7RD+Vz0K3+O7Xn0Q+qJK8lQEW5wXkAOwblKwjVUeOWeoXjSuUyHQOm2WU
 QLR05VjCiSdHhC2r3/lfYWWwxot6fMes++uNzubU/E+IosIe0VZaK2yrLpeqYGxCFj6t
 qFNdYlyHv5gFrXHes9twon2u56e+90H5YMqGrOXE4MzzkTFwZ23E4ZtBJ+fUlSMO9n7k
 ivfk/0fKeZCdf8ARYxPfnEY7xjBDObjf0TTLwfcttTXLcf8GT7iatHOW1toEDwZPeH0b
 PpMtLUQWp+S/baBvVEqBvBBbuXp1QHTqyMILfqFgRxiyqoDR7Hb8a6Bla3MPFzt424Ko
 2Hhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i0heOt0MsnfbggLnL41BYSYo+JW4b1v4laT3az03jyE=;
 b=vBcrAaIpZaV3t7Pbo04rvfIpXBigEocs5JncSYv1JhQOjBRLTmNy82hLGhMnCNpwtl
 5iNSbKxHg6O0A851yemkJHhLeTyk7M3dL7KTacizSKtdj9oIKhnsAkYaWytc9IrRVI3N
 QR0lYHS1IkeyNBHtbOIAT3f1Cqu8zlng4JVx+FsaStcajHv/AdDYgLtoHHudJN5IxxrE
 oDEyU7V68UCv46dXyGTHGiE4rEHhQWaA99/nqXr4KkGrFC30ngwEuvpQbqFUqGwZiL5s
 8exr/8U7jnhCeKXRBNdNf32u7IdOGZjQWurix1wbGEk9pIr7wJB0bsqmh8xMfy1I3vGN
 Aa0w==
X-Gm-Message-State: AOAM533bncQJHJw3pen8TB/uPIqcfNhE7A67we5bpDiUO9r8JmXFL/Sn
 yCAoWtfc9VwPgXceBNOpbxKtsSOi8luo4cULe15ZFA==
X-Google-Smtp-Source: ABdhPJydy6ZkeacI3rT8jHNSi9nSVdfyeZ6fzuQWvUGVLQ53U3TfGwQChT4mT+0l3VMAP7QbbCFsXkBR31fK2hp451E=
X-Received: by 2002:a25:8c3:: with SMTP id 186mr21032329ybi.587.1643503431458; 
 Sat, 29 Jan 2022 16:43:51 -0800 (PST)
MIME-Version: 1.0
References: <20220120150024.646714-1-paul.kocialkowski@bootlin.com>
 <20220120150024.646714-4-paul.kocialkowski@bootlin.com>
In-Reply-To: <20220120150024.646714-4-paul.kocialkowski@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 30 Jan 2022 01:43:40 +0100
Message-ID: <CACRpkdZnw-Tf2eQwO+LZRW4UacR09qWRWct00=XLb4pfa-N3=g@mail.gmail.com>
Subject: Re: [PATCH v10 3/6] gpio: logicvc: Support compatible with major
 version only
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

> Support the newly-introduced common compatible for version 3.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Are there dependencies between the GPIO patches and the rest?
Doesn't look like that.
Can Bartosz just merge the GPIO stuff to the GPIO tree?

Yours,
Linus Walleij
