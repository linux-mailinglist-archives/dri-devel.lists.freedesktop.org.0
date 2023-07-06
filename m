Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA7574A5DF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 23:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30B610E4C8;
	Thu,  6 Jul 2023 21:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADE710E4C8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 21:26:32 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-bb3a77abd7bso1318205276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 14:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688678790; x=1691270790;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3vz33CppPYfXOTfLJgPcu9OJ5KBYg5KcTasjmg2ccFk=;
 b=yUdwWPBjmOtznyv9Iu0y+4e/c7Wrkmiu7RwzjoljlH5zctsBWeIGZbnfUaFrPJ3UmU
 JMWKi9Anv5wouvyIHvbf8T8qkIAJrMwTZgnmvsrwhJzI2v21WZ2nHiNF0Kpfgp97s9e5
 2/jmPgcM/KIyCR4puFUlEM2gMOm1YlJ8imux/hQc8/4C9jXhacUckoobZu5/deaaz6y5
 GPNk8/NA627GElidNNNf1scJKIALNLpQLedN4RgVKFny3FI0bgcYHqJkP3D0/zvuv34z
 BxK8Bf+EfwyhBEJvfMroxV3mwD3Y6N/kjHawfNORWGGmJmI9pDA/ztZG62+UIQGRvFf/
 pVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688678790; x=1691270790;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3vz33CppPYfXOTfLJgPcu9OJ5KBYg5KcTasjmg2ccFk=;
 b=Nk8Uj2QS3dY//vXqcKTCSVLm9qlcZY0EnzyawGGYrIhtKkYxg/GSR/KV/+ltOgvRsR
 Ly9zIXGA//VTFB2ulESrs6SY76BTxJ7Gc1jhUZC3TLfFlqghajK4gDpA7RQLAFiPM6pE
 GyC4BOXsJnUPixNHZ2NhiwyZLfs9sfgnct7VQa4S8OFW0mo9U6KQ0cbyep1uuZ1sUHfH
 yhqUWGdE1X0Zp+TfyaHNmi73vDDDdbCPrVd8EYWqw+SoNDgDrlk9KBzd5AzlZBJ5mh41
 KAk5kUZxmrZd563j2n2beSTzCU6he6XzA9DFWcQpBZHDIJF5SKR1oCwgXxbcQTayAyev
 eTqA==
X-Gm-Message-State: ABy/qLam1M1CzmjqxZjMQXcmjP8Y8yxKqNpVb0wnkVlAGLSPTJfFlFRG
 rvc7YfhkaoNFk/cJds4ArZP4UMYQoSjyncMB6e617Q==
X-Google-Smtp-Source: APBJJlEP2wvr+Iyk5E1cmNurC6nLVcPhLGhfHUlpZ997tAXhtTCxv0xTrYKrRIwbCZ/sp9klyKZFRMt/AXGg5FY0XeQ=
X-Received: by 2002:a25:188a:0:b0:c12:29ac:1d36 with SMTP id
 132-20020a25188a000000b00c1229ac1d36mr2834480yby.7.1688678790356; Thu, 06 Jul
 2023 14:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230627050148.2045691-1-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=WR=fnhCxC37Eo3hinh2MV=eTNuXG+GrwgR6K_pV4Rbaw@mail.gmail.com>
 <CAD=FV=UcFn7Wq_Ock6RCT0mPhgjpJwF7dJjcbwcoESW9nni62Q@mail.gmail.com>
 <CACRpkdb_6n+CKUHYu5nAtCEKK_VwO2hGUUCHny56oSYt_vTfLw@mail.gmail.com>
 <CAD=FV=WwRiAzfV0Unk8ipnWJkTiDYraJHAwH+Oq5Q0=4TJ6ESA@mail.gmail.com>
In-Reply-To: <CAD=FV=WwRiAzfV0Unk8ipnWJkTiDYraJHAwH+Oq5Q0=4TJ6ESA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Jul 2023 23:26:19 +0200
Message-ID: <CACRpkdZ12GKSXXyT+qqtarPNFn4C6oHaE=ZisGaRYaBySvpFmA@mail.gmail.com>
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

On Thu, Jul 6, 2023 at 9:26=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:

> Presumably if we wait a few days things will sort themselves out. If
> something needs to happen sooner then we'll have to get the drm-misc
> maintainers involved. Probably at this point it makes sense to wait?

Yeah there is certainly no hurry :D

Yours,
Linus Walleij
