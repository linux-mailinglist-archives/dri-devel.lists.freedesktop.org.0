Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CB97418C6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 21:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3A310E0B8;
	Wed, 28 Jun 2023 19:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005CC10E0B8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 19:18:50 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-be30cbe88b3so84420276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 12:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687979930; x=1690571930;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7DUD/shWe46KMvA0LBMlGn2qbYD6iSa8fQ8POxlPlXM=;
 b=bwFjvvNcUJo7//TF8Jp1vEu1xBV6qJmdrgeX0/ANiiVkekDwHHURXv+DV88cWYT6jW
 RbHZEIn3r9PtHYcU4fIMjie5zJI6IS0zU0Yq+6jHzzBqH1S+8mbos0IDAI3y4O1YxynU
 imdW1P2optY818M2gbNF5hU4q2ZU/cpterMPuJEU5VtKZ63vv5BOPOYpaOXFEVDcJCZe
 njEyQ1uoFmFpp8jWN7ztedU+45WHoCMjLCJHxIZUoYY3yo0OHqUkekyUbJVC4tKKMOka
 OguEhhd/Ez61qhzCh0w6nIJMbVWfYEit5vhI4og1FaIZ6NwTsVbGXZoQEAU8iEt/P0Zs
 bmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687979930; x=1690571930;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7DUD/shWe46KMvA0LBMlGn2qbYD6iSa8fQ8POxlPlXM=;
 b=jG1n2yPK81gVTMZxzROhRYFi7b0Na4kXCvTMlwhBe8BSDVOT1plX4pXVUjYbYgv2Ls
 QWAIOlKo0qxJB8ERfwMYFzXfJTOpK7tiLGt2oqbYbAVEveGxdkb1yRzhTFq1GdcQg/T5
 gwoH4dHTXu9JVIpPYjKmzyu/EOdPNJ75LMhJnllfzVGM918bCU09La71/NORbTt803VM
 jV6OX7QY6F5ZKfHckEM+7saUviQmA/uXRFHJ3CIayUoVlpjSC82kNNy+icjdtyKeZwhp
 PqpW4Wl6vkTV1GBHINJH2RGg1Winzwgjh2zvuKz2XbHExJ/pYPYieMMK/tVweOX9aSnU
 woTw==
X-Gm-Message-State: AC+VfDx+CWuXBmw28FIsaHwIKq7fIyeUj64lGHPmsXwwzTsUUAA3DDWv
 M8jwI3cLuwruaKRevY34nEPzJqhVHpaibtaQ0ZU4vA==
X-Google-Smtp-Source: ACHHUZ7rpDB3iLiEU8xufHcYAsfVBnrCQGv7FT1VlaIgweQmvXwzogrWdJylssczyf5duNaEFnucjJqA02PevJT363c=
X-Received: by 2002:a05:6902:91:b0:bb8:4cc6:9d09 with SMTP id
 h17-20020a056902009100b00bb84cc69d09mr28026725ybs.29.1687979929795; Wed, 28
 Jun 2023 12:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-10-541c341d6bee@somainline.org>
 <CACRpkdbrk_pPqewo-bGPq4NQScHSRKNMeO0ik_aqEQ+BY12BBQ@mail.gmail.com>
 <a7h7hudmgg3ldb334o2knga7dqilvp47tfd46se4szpri2xi35@lxg5i5igjfmj>
In-Reply-To: <a7h7hudmgg3ldb334o2knga7dqilvp47tfd46se4szpri2xi35@lxg5i5igjfmj>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 28 Jun 2023 21:18:38 +0200
Message-ID: <CACRpkdZSNzeh8v=HW6948dJ8j0xNMhgrAz2+CpvQX=meGwPkyg@mail.gmail.com>
Subject: Re: [PATCH RFC 10/10] drm/panel/sony-griffin-samsung: Add panel
 driver for Sony Xperia 1
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: dri-devel@lists.freedesktop.org, Caleb Connolly <caleb@connolly.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sam Ravnborg <sam@ravnborg.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 28, 2023 at 4:20=E2=80=AFPM Marijn Suijten
<marijn.suijten@somainline.org> wrote:

> But for now we might already create a step-up version of that by having
> a "Samsung panel driver library" to deduplicate generic commands, which
> drivers can freely call into?

Yeah something like that is likely what we want.

> On the other hand of the spectrum we currently have 4 downstream panels
> for Sony devices that all declare to be using the sofef01 controller,
> but with vastly different command sets.  And even if we "accidentally"
> send the wrong set for the wrong device, the panel works anyway with no
> noticeable color shifts or otherwise...

Yeah that is typically the case :/

We should try to group the similar code together and expect that sooner
or later we will figure out what display controller(s) it is and name it af=
ter
that rather than after the panel (which I define as the combination of
a display controller and an actual panel).

Yours,
Linus Walleij
