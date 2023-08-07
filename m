Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5F67730C9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 22:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E30F10E10D;
	Mon,  7 Aug 2023 20:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E69510E10D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 20:58:41 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-ccc462deca6so5403079276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 13:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691441920; x=1692046720;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T3Phr/qBjna65dSbgC9HNPvXBfrTrOh8y71Gnukdgxs=;
 b=M+AWhNElFxz4pAjSLCvt1ZnlOlNfZyBNfhvCqb1HeRGpLnoTT74yzpChjlWZgJbXDT
 Ghneba3qc2Y/+um+uq8VYTocDvgVjSsGMXEP8AKdlTD8GM3ZAl3I3SKfFpukq4Q6fYWY
 72dX7Ylm0eGD25PL2zBwf0+GTpHD62WskWluY80X5ltM0KqdPUqUtmRYn1B2ztazxVmY
 QvuVLWouKl/JCROhJnuTAigN92pSjWVELDj+dazyLh5dWC4ZueZadxxSJQ+DE4T5XBjX
 L+eskiYt8uLY6zwROaCL/CJluQlh2WzWRzAdoisgFjw+z/okdyoTh+gWAzJbOeNOI5ee
 dkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691441920; x=1692046720;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T3Phr/qBjna65dSbgC9HNPvXBfrTrOh8y71Gnukdgxs=;
 b=cxgVLEi0EBersDSJ3kHK0xXcqbpKeYN55f+obcMd6c4CT5M5MAcgABfYd/Rsv326jc
 tHU/YF+alFPnvdWEeGLw1qiO5gksJ6KfS6aHU2BJH5fOy4IoMoyoZfunyEu5KqBDTo2S
 9aUqFBT6fLKQly7TMIYAMHgKEAcsuznutEvBGZjeQNM+GrN9L87c+GZdZibPXopKxM1G
 eoHb/x9eHNhMV6gp+1+tiEMXNMBS0Zazw0ws6POVfb7tIcVi9oVbFwVyUjOHh7hiUDUS
 1NHgQoC8U7cMoE+yXJe+9T001Y3FDCJ5W16ul6yz9MwUWVjtuFGJgilYbMH8IWBDA6UJ
 SrEg==
X-Gm-Message-State: AOJu0YyX9ab7aJYjUYzPwm110wIozETf1ooaR1gkMU79/nei3hl91OpL
 5FyLTbS0I3sCt36uP7Uy7Qbn1C09+0wZA7VJ2dfjkyP2nENWLhfk
X-Google-Smtp-Source: AGHT+IEPbfMU6FnbM2nuPmSSAfLdNHlZn/23luLcc6pcHAAANUMauW+J5vYh+YbMRY3LfIfizFYX6YAl+st36+onh7w=
X-Received: by 2002:a25:8404:0:b0:d3f:2238:8872 with SMTP id
 u4-20020a258404000000b00d3f22388872mr10755050ybk.63.1691441920632; Mon, 07
 Aug 2023 13:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230731124222.78643-1-wangzhu9@huawei.com>
In-Reply-To: <20230731124222.78643-1-wangzhu9@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 7 Aug 2023 22:58:29 +0200
Message-ID: <CACRpkdYspy4VWJ5PBBc4Dxpo2VU2eZm-WXwPNKHBM1aXXGQKgw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/tve200: remove redundant of_match_ptr
To: Zhu Wang <wangzhu9@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: arnd@arndb.de, dri-devel@lists.freedesktop.org,
 u.kleine-koenig@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 31, 2023 at 2:43=E2=80=AFPM Zhu Wang <wangzhu9@huawei.com> wrot=
e:

> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr here.
>
> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it. Hence we remove of_match_ptr.
>
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>

Patch applied!

Yours,
Linus Walleij
