Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 876A571A356
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 17:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B1910E574;
	Thu,  1 Jun 2023 15:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1793110E574
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 15:55:37 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-33bf12b5fb5so130335ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 08:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1685634937; x=1688226937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KJnr0nAI79FbGcEzwusG2c1oxXOAZlwGtMuVl8TkMiU=;
 b=F5ig9ehUjDqdxIKiSKJHREsI10xOX38A0QXUHK8VNB5hnRo7A4nuB5c1oqPzQ7C4m4
 esj2spCXlIiXTwhCAdjn/TSxlJceR8dNBjfDTN2T1dVO9wYHIm37J8f/tTZB/uoenLG9
 mfP5FfovaPngf3Zli2QGTeNbKETa4l+SzSPA/GvBYfYSuWeQ8m3K2E5R6Q2j7VIC5ooW
 O06ZajcRKWL3YyiO5uwDYngWTnziiJHwoPbu9Xd0X0HqWf4ZaBiWR8YQeJs13RWyiqhK
 Z8hilvcXYi/HQuMJpB/R55TCMNXCy1zoUAtvSGLNuzQggGw56C1pHpfTCmcCKl35QoTl
 kiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685634937; x=1688226937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KJnr0nAI79FbGcEzwusG2c1oxXOAZlwGtMuVl8TkMiU=;
 b=YaZffWzDu2jvY0DFY7XZuTn6LG5SV4I0bXctvW+Ph2dXstF6rgBTM20gBUdfDG6KLD
 krBBnRr05TsLkP7Bk5sMR2uGjXBm6K2c4OMCTvU1ZLFhMDN9fS/y2eEd9fSoUbF+Shyz
 uUZMb3JBFFsHXcSQkChGB3tWIrTYa6ljuV0lhvoOn+ouG7FlhC/OUrUcha5zALhxi/Ff
 hAIEmnYo9K0EPYnT7x2Paare4zu2TCZK+4/jhURy3AKNfKYfMElLB10IRgP26KsKx6Ki
 YFb+c8gTiHSMDBpwRr3e9ROqVbkVo7hYVAbxGC3O+1rZ5URmCQ++S3z9RsyqX8jnF+IV
 RxMw==
X-Gm-Message-State: AC+VfDznY5Wlvdfm8kWWHDPBnOu0wVh+PuZ4cg3+tgd0XrDSA5Y8VmFS
 aabiE4rz1FcbSmZZU191vPtxRDvrWTwS5dSxA4VBVg==
X-Google-Smtp-Source: ACHHUZ5M77PykdR9xQv90jShpkPZX5SDCZzIQ6mgVZzgThumvHXN/x1LRc07L7DTNmktmo0tu9ZbvFJsmNSZXID1HUg=
X-Received: by 2002:a05:6e02:1a25:b0:33b:4a8c:2147 with SMTP id
 g5-20020a056e021a2500b0033b4a8c2147mr261587ile.8.1685634936701; Thu, 01 Jun
 2023 08:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <1adda828-cf35-fb2c-6db5-f9ca91b5b62a@linaro.org>
 <20230525093151.2338370-1-yangcong5@huaqin.corp-partner.google.com>
 <20230525093151.2338370-4-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20230525093151.2338370-4-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Thu, 1 Jun 2023 08:55:25 -0700
Message-ID: <CAD=FV=VxQcoYpE4OJYB9JVbiOQVUi_bkDzynR=VVfuNb4eQB9Q@mail.gmail.com>
Subject: Re: [v4 3/4] dt-bindings: display: panel: Add compatible for Starry
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
 dri-devel@lists.freedesktop.org, Conor Dooley <conor.dooley@microchip.com>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, May 25, 2023 at 2:32=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The STARRY ili9882t is a 10.51" WUXGA TFT LCD panel,
> which fits in nicely with the existing panel-boe-tv101wum-nl6
> driver. Hence, we add a new compatible with panel specific config.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml     | 2 ++
>  1 file changed, 2 insertions(+)

Applied to drm-misc-next:

0a73471ca1f7 dt-bindings: display: panel: Add compatible for Starry ili9882=
t
