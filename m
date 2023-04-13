Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CA96E07DF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 09:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBBC10EA44;
	Thu, 13 Apr 2023 07:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B355810EA44
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 07:37:07 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id t16so1513160ybi.13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 00:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681371426; x=1683963426;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JrIOkoqNa4l7cqOirMtnXosK8aTIQGEDDZDGV4W2aNE=;
 b=Kv2hZemh+4CLk2fHXoGEYgfSjsnRNVFLpK7CFGhNKYp4AKJkm1mDYkLPoLOcj4zDR+
 kINv6htC+cTuBqBnzCSsD3Zjf+yT6zfeZpLwFnuYIxGKQ83M0XBCOpPIrK0nqkckbT3I
 HRlpl6/T/rVxpuLmkFFXl1f3sCVD71jnM4VZJlVcke/EUP9ic9gZlN+CFmv0RhKI9bTj
 e0l/WeB7d+Q1o5wPONr3Wr63lS/5C2nMWZ94MPWBUiljNd6dpmBxxZvCwn2wkLqZl89g
 NDM34wLHEHxD/WU3H3aKsLLlIwoBp1WS0rMGs6LRMpA5z8M9cuh5eeP+UaiHaJm613x8
 NpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681371426; x=1683963426;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JrIOkoqNa4l7cqOirMtnXosK8aTIQGEDDZDGV4W2aNE=;
 b=Hm6STTWK+Mgw4SPo6bmtPqpgTlfGJrijWtG2Vo/Erdec3VXjUpYfVh7VEdUXdITyoK
 gNwBCV6tBakD2unuvvKgF8Grp3xGJFiJqXTuWG1SCMj9PcOLMjOXNY0AnBckYNfGJxNk
 BOZfXc0j87wQYpr5P5H1XgkXtDouaCG4XDSsVunHbsgBeT/5qiNti0BGCMIbRzzWLNfR
 +blKMB80uivqIrkhSq1GXhpVlmNSXEnK2nMkJylpVlxecNHS7rRgqUogWxywnUNB7c2D
 2Ma7YOZQ8yCuTq/gf1BcReqOTDxD57ok+h+Qksajc47tAd+gSFmotshmkb4fCaR0LTXs
 bqzQ==
X-Gm-Message-State: AAQBX9fGyapB5AwcKnA8uBQPqCwOZZ8MrTthgQfsZ3J4oXsqJ/JVf8iJ
 voOI2x7jmBUmgoh0TqEdwP0ixyOH+2JwRF3ICUG70A==
X-Google-Smtp-Source: AKy350a0L9E2liQ2C3VPt6HJwo9mVSSTy114EXniZeJn3aEl6VSxaTEvhE9/+HhS3MFl1vWVxXa2zYrCtjVFpbdGad4=
X-Received: by 2002:a25:d6d4:0:b0:b8e:ec30:853e with SMTP id
 n203-20020a25d6d4000000b00b8eec30853emr663375ybg.4.1681371426300; Thu, 13 Apr
 2023 00:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230412-topic-lenovopanel-v1-0-00b25df46824@linaro.org>
 <20230412-topic-lenovopanel-v1-5-00b25df46824@linaro.org>
In-Reply-To: <20230412-topic-lenovopanel-v1-5-00b25df46824@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Apr 2023 09:36:54 +0200
Message-ID: <CACRpkdbnAPGdQzJv9L9r0BtXyGHBxQ3SLktj+wUKRs7NuBVq=Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/panel: nt36523: Add Lenovo J606F panel
To: Konrad Dybcio <konrad.dybcio@linaro.org>, csr@novatek.com.tw
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Jianhua Lu <lujianhua000@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I added Novatek contact email to responders.

Hi Novatek, can we have a public datasheet for NT36523?
We are developing a Linux driver for NT36523-based displays
and we need documentation. Thanks.

On Wed, Apr 12, 2023 at 9:46=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:

> Some Lenovo J606F tablets come with a 2K (2000x1200) 60Hz 11" 5:3
> video mode display. Add support for these panels.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Thanks for the best effort to use documented commands and best guesses
for defines.

The rest we can detail if we ever run into a datasheet.

Novatek doesn't have a single email address in the kernel
log so no idea who I could mail about this, I think I even tried
their webpage at one point, no answer. But I put their contact
mail on the To-line let's see if someone answers!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
