Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A956E07B3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 09:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CA910EA3B;
	Thu, 13 Apr 2023 07:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3917A10E10F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 07:27:43 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id h198so20887592ybg.12
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 00:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681370861; x=1683962861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=abfJHn7ZwvAozrqfG1qVzD8XD4gBACYbJZHJhuhNXQE=;
 b=d7BTv/vmtNhnXAx+Il+EBpfKR/J/Xb1OCcaQ/NruFP/cYDcdWB/2E2u7Yjcre+P1L0
 q/ksHFqnvT2cNKvoyzTw8JCJg0lEwsJAHBg/WTWpuo6SIKh3vcIkF0tahvIOwaJQuF3F
 20SyDVfYmgMDtQHUexfuymfONHFU0z3nrJKzHb+NMT3X4ibGYWWcM5Bq1dWq9iZPLEVF
 reubUDf1O3UiX+YdFhAgb3y46zeH2OtiUqqoFWdJAK8LbODr71Pe/8R8hyYeOsfp6GD7
 MdpPSFFaJe2BCftQWFoOesmh85zqtgItDJqcPGT2JLoP93gtVT1he/kkNkedFDfXNsNb
 Wgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681370861; x=1683962861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=abfJHn7ZwvAozrqfG1qVzD8XD4gBACYbJZHJhuhNXQE=;
 b=isNJx+/5ubXkCoUwb4p9/UqdseoCLqghUk/rcLPTn4/sLWWWKQwWICurDEX8RzXzB3
 IkOPz5JuqW+uDlXbJ2pjAT/QscLV/3a4N54fxwLhLcL23XX6tA+i9/rhtBBGgR6ZlOU/
 7Oth6BsfAmcgCwGxNjPEL1ZGLAoSpzcXgi0ofVnV9rNzKuhcxNLL8VMh247/TeAUvwNM
 qOjHkrail4gEm9udQPKNpAnJ67FoQz88MtL/9s7elnx0/8mNftsord6SjyY+Q7f1hjoV
 IyvsmL15DEdRZoGuD7qjHZtiBrBFHpyrhc1NIMNtQsEAWRbPuse604lJTfkrTa8Strra
 fjFA==
X-Gm-Message-State: AAQBX9dCgEcpZ/Bg8eNOFfhpqnXEH4iU82JtkUMqtkBZRfEkR9MZN/IW
 Tg53C3fqAgLF/bKfP/tf3BIszZMUvAmffOX2heqt/Q==
X-Google-Smtp-Source: AKy350bH+ZiTXauAcVY8vTc+xQLvbz0J9sGd7KTjoAKKs3btY4h4QHUcD0S5ToJ0HGl5nKUCZ1NU6OZPPf3mLTTVNZ4=
X-Received: by 2002:a25:748b:0:b0:b8f:567f:4352 with SMTP id
 p133-20020a25748b000000b00b8f567f4352mr548520ybc.3.1681370860855; Thu, 13 Apr
 2023 00:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230412-topic-lenovopanel-v1-0-00b25df46824@linaro.org>
 <20230412-topic-lenovopanel-v1-2-00b25df46824@linaro.org>
In-Reply-To: <20230412-topic-lenovopanel-v1-2-00b25df46824@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Apr 2023 09:27:29 +0200
Message-ID: <CACRpkdb8DqeKHMSQQoNvJKiuUG2rZtHTbyo8rGMJ=L8FY4Y_ow@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: display: panel: nt36523: Add Lenovo
 J606F panel
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Jianhua Lu <lujianhua000@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 9:46=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:

> Some Lenovo J606F tablets come with a 2K (2000x1200) 60Hz 11" 5:3
> video mode display. Document it and allow rotation while at it (Lenovo
> mounted it upside down!).
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
