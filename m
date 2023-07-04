Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41567746AD3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 09:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9978910E29F;
	Tue,  4 Jul 2023 07:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0090610E29F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 07:39:51 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-c5c03379a76so682600276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 00:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688456390; x=1691048390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xp+QKEk7TTS2IiTonm6ANj4/wmZQdWj2NqG5aVXpncM=;
 b=bHYWYL8i4lzh8sEhz5VZ8+QaouZrpUmg2mnnB9W2cInPjOz7hlnDoU+HGYgvKXBVjm
 mytGluOUKmL28Mxr3kXdWQIcLu+ZI6M1RV/LyiNYkJizaECi4u1c2HBrkYjW4UViirN1
 ZB+kzmzWoNlT6DMXJJzMfNPahkMge+5q5qOenf8yORBDkr4oHl06HX2XEWkroMSb5TdW
 Ha74K4JQds9cf4q4KuV+Ay1sBb+IV2zRzSEOy83eTYtyFhY5zUPjo8hy3SoOpZLF8YH+
 3nIA8dM07vcG7lUiwsEgxO+WmO2oM9sQhyNQXyAwU0u34iE71/eY28Eb0wHJbA0h17nU
 ngwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688456390; x=1691048390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xp+QKEk7TTS2IiTonm6ANj4/wmZQdWj2NqG5aVXpncM=;
 b=PtjWpEhWndWLSJDgj/7IU5WD/rgWYqiHo2wajh2S98CCDaIex+V+I0WVv1+g8uc2Lj
 dBcikkoVbjHoOj5Va+7s07SrkcSfj/DGC6ShMJpwfE4zeHh+2ze1b55jPWyt+rIGklt2
 oTR4YD+nHKS4OyUQcIdnplQ8WxleWHYERyVmZp/C4iMb1XQ+6bLGJoasV4mj1ssv5uNo
 OlDbOiJpZZameAmdzhRn6C6J9Y9wiVzROyF89K0B+y71AuFKfuBKCqhWSAqYPQR1Vk2Z
 ejp/O3JCiSfqf1ccJodkkgosc2YkzMViVeGPRYLQiOQpT+ujeBMOkQdPA9oWoA6T7GKt
 xFoA==
X-Gm-Message-State: ABy/qLZXRpIckeKiA9EHZzf16bZHqpuGBU6C9tN6qwnnOHLUnz8k9pZN
 gD0UznABi6YcLxdKQFmpJ4bHo4FDrv93W1QxQzfopA==
X-Google-Smtp-Source: APBJJlHDKKwZ79lFPkNzLD0TjSMaB69YfKzURQNSkXUvL8aTFXOSk+TSkTezVMXogst0zaQgctBCu8vKcQH5YGpdOw8=
X-Received: by 2002:a25:8142:0:b0:c02:e455:e2c0 with SMTP id
 j2-20020a258142000000b00c02e455e2c0mr10207480ybm.11.1688456390657; Tue, 04
 Jul 2023 00:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230627050148.2045691-1-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=WR=fnhCxC37Eo3hinh2MV=eTNuXG+GrwgR6K_pV4Rbaw@mail.gmail.com>
 <CAD=FV=UcFn7Wq_Ock6RCT0mPhgjpJwF7dJjcbwcoESW9nni62Q@mail.gmail.com>
In-Reply-To: <CAD=FV=UcFn7Wq_Ock6RCT0mPhgjpJwF7dJjcbwcoESW9nni62Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Jul 2023 09:39:39 +0200
Message-ID: <CACRpkdb_6n+CKUHYu5nAtCEKK_VwO2hGUUCHny56oSYt_vTfLw@mail.gmail.com>
Subject: Re: [v2] drm/panel: Fine tune Starry-ili9882t panel HFP and HBP
To: Doug Anderson <dianders@chromium.org>
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
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hsinyi@google.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 30, 2023 at 2:42=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:

> ...this means that it lands in drm-misc-next-fixes, so I've pushed it the=
re.
>
> 59bba51ec2a5 drm/panel: Fine tune Starry-ili9882t panel HFP and HBP

I guess that means we need to merge drm-misc-next-fixes back to the
drm-misc-next branch so that I can rebase my series breaking out the
ili9882t driver to its own file?

Yours,
Linus Walleij
