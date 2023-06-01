Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB5871A352
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 17:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D454E10E571;
	Thu,  1 Jun 2023 15:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC49B10E571
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 15:55:14 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-33bf12b5fb5so130235ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 08:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1685634913; x=1688226913;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bcFHd8KydoGNMakaE+r7qYK2+GReJfjjugBl3aXp89w=;
 b=SL4pYfDecbcOQkLFjRrzaszytlRsjWKv7TXKTPpEmnZ9TgXq7iMK+eafFvYnAdwqyf
 khkp8jY4HdOj858ecpc//lBwBZQ9HaDdJDXhMGcv3+TX+3Pb6JgkQjZ3inwHO7oc4Jwg
 AuWqT/OtAdR2BnrbPMjpEVG2O99/JKUdiCG9MIUGtw/Sa+gGMeIY9QX5pOZQ4+qKKGJE
 /A0xipy6hgP60ktzPzZC2X6LVAFHEhVPZlFSMYOvtg4GHPxZFNCBSk/rkGu9smkfEVUX
 HfDzMvEKffXF7ZdX/cjhRyfz4m++ppbKQAKiHMYcAjEsA9goCz5oPxHRi4K0a45a6ogR
 8Z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685634913; x=1688226913;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bcFHd8KydoGNMakaE+r7qYK2+GReJfjjugBl3aXp89w=;
 b=PlRs3S8KIdXvGvjFIbpgfMS6CYhzTfLdEfexiNl+hr9wk+zuoeNymmycmXGXEahx7U
 tNdZKe9gK5INQJqF2uf8FdKCFlC8s2WnLo7Q6J7vO36GxnvTtYXp8JE4dUnTXd02G4Bv
 Strt9q3UMmX01sLZVWqw5eyOyakM1MA5qn3JReAgWuM98jtJpdzek4ndBYSlrmS16z4A
 8ZUCK+UP2tG1iUhqefn70KV66Vk6ok13Ot+TAVe4bT4d2NhgOc68dfZUxkTDBIoydzzO
 pGxPU0rsnysqVlVV773H8obJAwMUOCa1Iom3xQYsnVATqcMxq/Y4QpmofONk0+BUzTkH
 iLnw==
X-Gm-Message-State: AC+VfDwrfiMxiwUgMcN+HL4MhE7KfTfyskjh/lLeijEAivukRoZh8V6l
 2a1zk54dkRM/fPhECLjek8VCGQmulSuT6y5moW8oSQ==
X-Google-Smtp-Source: ACHHUZ5tNrISHWhGI3VKmvsVJdzk5rApIA+ScRjMOFK6/ERy49AFcEHGdmb5Lbwbk7kHe7mdIy4KMUAybF/WWAmQhng=
X-Received: by 2002:a05:6e02:b2c:b0:32a:642d:2a13 with SMTP id
 e12-20020a056e020b2c00b0032a642d2a13mr248297ilu.6.1685634913599; Thu, 01 Jun
 2023 08:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <1adda828-cf35-fb2c-6db5-f9ca91b5b62a@linaro.org>
 <20230525093151.2338370-1-yangcong5@huaqin.corp-partner.google.com>
 <20230525093151.2338370-2-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20230525093151.2338370-2-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Thu, 1 Jun 2023 08:55:02 -0700
Message-ID: <CAD=FV=UduUjeG0ZPFm6QMpRE0+wJpbwTue9xprSTd2fPK2oyZA@mail.gmail.com>
Subject: Re: [v4 1/4] dt-bindings: display: panel: Add compatible for Starry
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
 dri-devel@lists.freedesktop.org, Conor Dooley <conor.dooley@microchip.com>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, May 25, 2023 at 2:32=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The STARRY himax83102-j02 is a 10.51" WUXGA TFT LCD panel,
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

06c3269cd574 dt-bindings: display: panel: Add compatible for Starry
himax83102-j02
