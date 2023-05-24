Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0AA70FFC2
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 23:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B588810E696;
	Wed, 24 May 2023 21:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21D310E696
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 21:13:07 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-33164ec77ccso47165ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 14:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684962786; x=1687554786;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UT9Y/dwgBpalMa3LjWqrqX13zFQiiWk7YoUb5Dh/rb0=;
 b=Pw2sY0kk+uA0lgLXJ4QrG1lbzK+hLwpi+0Liuc2siJTpaf2jce9WDPb8zfEZ94bP7O
 EwTcsnMR1S1aTzjAc6AGBjK/1BDaVBk7mKzM2Iy3nSK/ky+tUiWdnA/oNElEszT4sUv1
 XAImeI5oyKAzxe0XXyByLNaiKV4nWL9L105baHwfl4c09HRDi4o3+Zc/1qXLikY0KXXb
 iuZmHBZvyHJFN8iRb3bDm+GLyOlZj8GqrEMRz+IR9B78HzJJ6wuJ5hwIZc/hMBEN9jHO
 ZEIqBBXPvrj6UmgEjupNGYhVUHQwqWf1x+TDAmgl7ygxOyTQabqpmuVzkOerPMcH+VgS
 gJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684962786; x=1687554786;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UT9Y/dwgBpalMa3LjWqrqX13zFQiiWk7YoUb5Dh/rb0=;
 b=V2ZrX2dhrHKoTgx41rAK7bznfhMM3Ddt+D2MNWGzKvpM9dakldahfdJ9rpeERQU55i
 5DFkOo3sqZEoKuAd+jtuOMCnk9Is7GAgjLF6iHDLfj1SEwiHylMSVjKLu/XKdJqb4EdO
 LBWiNZbELKdIGF+QRimZ5cNEl+b9BKCFkdg/bQVb8S2HR4xlirRNsaJ+DHPuo8MQDafa
 OU2Lgdy4odBMAcWv1Mv24r7+6dl0oJItDCdOtBNvWyCLxZa7z5No9qZCgSlxEWvbsyob
 jkzX/yM8L3GudPU0vzH0bF9UcVOQo8aQdQeDYf4BhOUhCJ7mhZoW0wc8KTFwv2byIndY
 gBOw==
X-Gm-Message-State: AC+VfDyHSouVop59eTzoL0/gtOfrTuYnxPFG6GUCT68qoaVKmi/Kqf9B
 +9m/70G87hwNj1G4hZjPedCpEe4R42A5hCXWfim7Ow==
X-Google-Smtp-Source: ACHHUZ5m6ZRnMjWwhSIGN0CAK0LQtBjTMOAsgHa9yk09PFD6/CRPJXTpFlgBJC6zrARysCmio+4jKLhu7Ni1uXqlG6c=
X-Received: by 2002:a05:6e02:17c8:b0:338:3b6a:4719 with SMTP id
 z8-20020a056e0217c800b003383b6a4719mr50834ilu.17.1684962786520; Wed, 24 May
 2023 14:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=FV=WRecTWsFM96k81YAx1=jJT0vpS4EPP0ZfWFUGHNFx9Tw@mail.gmail.com>
 <20230524074455.1172064-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20230524074455.1172064-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Wed, 24 May 2023 14:12:49 -0700
Message-ID: <CAD=FV=VDDWX_LXjwxgudS38HG=+-gei2Xya7XiqcxjUTy90maw@mail.gmail.com>
Subject: Re: [v2 2/4] dt-bindings: display: panel: Add compatible for Starry
 himax83102-j02
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
> The STARRY himax83102-j02 is a 10.51" WUXGA TFT LCD panel,
> which fits in nicely with the existing panel-boe-tv101wum-nl6
> driver. Hence, we add a new compatible with panel specific config.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml     | 2 ++
>  1 file changed, 2 insertions(+)

nit: bindings usually land first, so you should swap the order of
patch #1 and patch #2 in your series.

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
