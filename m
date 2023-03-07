Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD096AF99E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 23:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D03F10E573;
	Tue,  7 Mar 2023 22:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23A210E58E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 22:55:44 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-536b7ffdd34so273160207b3.6
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 14:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678229744;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VOumxYNupJ270oxfqqpBEcjU4dd6uD/r4togrRDieg4=;
 b=Lkva8Yqv6yfbbe56NAGI6TppDFJfd9ensNRUWXkdcF5LkmTeW55SEDYN3Qy+C2p9ai
 YUlDDqKvcV24AFRf8W5qUxIU2gbHlDjFfhw9c69zvRJAFfmRUUgyIs3Jy8ye7F5W+yBn
 6201eqKNf3VQMA2vlijZkLl+4M1P7lDqY1isu1mM7MKBiAHq/AUKY2yuN2ENw7IV2beP
 xQnxBK6E2Iadt3LmOkoEhsqvin5VOhEbFDyOhKuXql1Fteg8j7yiOnhAnvutX6f6c2JF
 YXjMcH4CJr37LyqPUIVFhNMkIjUTMkmEqFA/y67WMvUrq+HkVFQNnDQGNnDgxOlGQ33z
 1MEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678229744;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VOumxYNupJ270oxfqqpBEcjU4dd6uD/r4togrRDieg4=;
 b=t36529eDjbSso6DAJ6u0piO4Q7ETsNZeokNeV4vNOiCvb22j64go6Y/JG1sRWkuoxw
 Bh7v4BMpWU5oXZ5oQoKbcf3qM78b7PPGj4vNHxVrD98iliU3IZ22zqAdjKNwixd6entH
 RB/kBQ6GvIEslPz+iILzMZjI0NcZ+gxcAlDOdukrOu4WubGo0wYEXuc4Z9rKJWL4dsvv
 itFmb+H9LEvxjuQeU35ri2CdU+rIY3pGXejt81Nzs299yyY1UUac1+P5D9CviivUWJD6
 jqLamaw0woltWzBL9+wVeF5pX/2APTzPqUzmpLrY0sVDc/At2w8yPM1KAjNKR/vzxjGV
 lfXA==
X-Gm-Message-State: AO0yUKVUqvXKTLUk0Irtm+e+sHBaUMi7Zg7xGJf0tvRKw67XNrKjHbnv
 hpJPEgtDuL809ziA1N5THtEckpJqfSUg+2XUz5h4nQ==
X-Google-Smtp-Source: AK7set9MfC1PxNng6Vma+yRI7hRnqfXJxNmDi52QuFYnS9zfjs79ZjNGCHl8MlsdVidRYygFsWFznmMwQJa3NB16f9E=
X-Received: by 2002:a81:ac4b:0:b0:533:9ffb:cb12 with SMTP id
 z11-20020a81ac4b000000b005339ffbcb12mr10523196ywj.10.1678229743868; Tue, 07
 Mar 2023 14:55:43 -0800 (PST)
MIME-Version: 1.0
References: <20230119163201.580858-1-konrad.dybcio@linaro.org>
 <20230119163201.580858-2-konrad.dybcio@linaro.org>
In-Reply-To: <20230119163201.580858-2-konrad.dybcio@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Mar 2023 23:55:32 +0100
Message-ID: <CACRpkdakgumdpkEdbcUkmSgGRzSOxX6rFD_a9bjMaE1yemgUbw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpu/drm/panel: Add Sony TD4353 JDI panel driver
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 krzysztof.kozlowski@linaro.org, agross@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 marijn.suijten@somainline.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 5:32=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:

> From: Konrad Dybcio <konrad.dybcio@somainline.org>
>
> Add support for the Sony TD4353 JDI 2160x1080 display panel used in
> some Sony Xperia XZ2 and XZ2 Compact smartphones. Due to the specifics
> of smartphone manufacturing, it is impossible to retrieve a better name
> for this panel.
>
> This revision adds support for the default 60 Hz configuration, however
> there could possibly be some room for expansion, as the display panels
> used on Sony devices have historically been capable of >2x refresh rate
> overclocking.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

Looks good, so patch applied to drm-misc-next.

Yours,
Linus Walleij
