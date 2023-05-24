Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD1970FFCB
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 23:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE4E10E698;
	Wed, 24 May 2023 21:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CFB10E698
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 21:13:18 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-33828a86ee2so50845ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 14:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684962798; x=1687554798;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vEdYxdYetiOJG9KjcYwzVdHTHSNxCtOLYboFK2bcSHM=;
 b=Izcguru0m0GonlPHAnQjcOLsaouOFxVJ6x4X6zQ8HIVwD3JLF/PPVL326mc5XVKFGz
 rj7hJ1J7g6KF7qAUQd7wylY5D9Mcg5BS3kRVjXw5McMtv7bXbcqVnl3YPx1dxTpVWy4+
 9SbLTwWmMzz8b4vMy/+BrjOib8SOJbtkwKWEx5JFBll2qiD8K+sJzecLYB8A3zECZvU7
 JxQlHLsXqxjhS6SJg2VAD6rGnT1nBb1Vw/JFsCZ139KJ4HQ1Fj7tX2XWaHV7oR3a076d
 JsGEPun9WDcmlQaxZ8B1Ure0jcqF04bx04fwXCq4p4BRlHDz4azH31F3Q2BixEBCe1mb
 vGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684962798; x=1687554798;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vEdYxdYetiOJG9KjcYwzVdHTHSNxCtOLYboFK2bcSHM=;
 b=Lw9wmx1vopcXK9lt6HLAWznsRMZ/0yMnfgbgStSIK9eEqIIjVCvOlpzM3EuPiK99pC
 EH0upMWhfWBSFbzJySud4WN4zRRbtCORwsbrtF7EyEcBNQCvweYtgwMc7j+7sko2O54H
 UxLtBGEY1SmJFg0TMaBzki+tEOXYHUj1JoINN0xAm7J6gciwiHxw3iY0JRKygmTCc7pX
 GxcxCOaQj6ldh+oqptaudztgWiqgHKtZsjTFt/Tw7aaKyUNSUfha6sHLg7lz026hHF5R
 b8oWaoSx0pP5RWKjfGEKErAMqkt5Wax0EEUKxQr8kcA/whkxaxgap/xO4ve6Q2WXR6mG
 igng==
X-Gm-Message-State: AC+VfDxpNnpI0/y+FCIh6sTYNlOAM37uN8/h7Cr9yS2Uvbua/rfshNIG
 ciQVj98Kr3e4AigGZ/90hIyz7gsXp7fCOj0O8ry/iw==
X-Google-Smtp-Source: ACHHUZ6mbREIm4Ztc8moSsgKru2S/9jx12dtX3Dli6UKcvfjWKYl0QKXqxeWvi0k//DflwaHfMTWM5i2nMBZDc1nqUI=
X-Received: by 2002:a05:6e02:1689:b0:329:333e:4e79 with SMTP id
 f9-20020a056e02168900b00329333e4e79mr85770ila.1.1684962797671; Wed, 24 May
 2023 14:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=FV=WRecTWsFM96k81YAx1=jJT0vpS4EPP0ZfWFUGHNFx9Tw@mail.gmail.com>
 <20230524074455.1172064-1-yangcong5@huaqin.corp-partner.google.com>
 <20230524074455.1172064-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20230524074455.1172064-3-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Wed, 24 May 2023 14:13:05 -0700
Message-ID: <CAD=FV=XUuzjjLq3YP3683jOd06odwk5Dox5MS8oY8goB-_8T5w@mail.gmail.com>
Subject: Re: [v2 4/4] dt-bindings: display: panel: Add compatible for Starry
 ili9882t
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, May 24, 2023 at 12:45=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The STARRY ili9882t is a 10.51" WUXGA TFT LCD panel,
> which fits in nicely with the existing panel-boe-tv101wum-nl6
> driver. Hence, we add a new compatible with panel specific config.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml     | 2 ++
>  1 file changed, 2 insertions(+)

nit: bindings usually land first, so you should swap the order of
patch #3 and patch #4 in your series.

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
