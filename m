Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 173B180B81C
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 00:39:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC75810E327;
	Sat,  9 Dec 2023 23:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA90010E327
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Dec 2023 23:38:59 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6d9fdbcec6eso618119a34.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Dec 2023 15:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702165139; x=1702769939; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iAEzUkk0kLkDRJlJ+TUfuQi4C1RrkEwtDZIE9MYzNDQ=;
 b=ngq8EoftuFX4i6MUWs0vsB7nC6mhuGX9wwkpTNLc8FoVfDeAtIjsZQ8keIY5dRi9UE
 Aqp4geM2yJWvXcnqI4cq79g48KukauPUA38H4FWqffAdXiYLGwQZQ6e1gaE6pz1upOfi
 yE++Bc03vRPqKuIpR5g/XzHI9gsjhwkH4hSJ/2BtEVxR4TYKy3ow/96cJMGyNUjrrsmA
 UaMN56iP7owmfmdWmQZ30XASjFVQR0AdNwKzuJsk1bMB5qKr4+/j6xrEQTa9vo49mBiq
 ykHehYDx05sQdFE7J3JNjYIDLcuA50Y9GfnqyPqPmMeXjMc5LyNl2B/xRlWTUzSLxjFu
 ooUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702165139; x=1702769939;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iAEzUkk0kLkDRJlJ+TUfuQi4C1RrkEwtDZIE9MYzNDQ=;
 b=wA4ml0T2qb2+gClkZf/Q5nGUuvEokFyDPpPsuzZOk1rZewj/3vXU14b2VwdWrSG+On
 P0sruYGf0oUCh764Lyq73x7DFCrwfBIhI1seHeNQqBWSK8MNMB4wck+/5I9wDVGJz6u3
 NdNc74wDlU7eQk3BO1NnDHENS0ljA03VUmIi1tvVzG8n547AH66GRH808lHcPsAvK2pC
 NPGoP9ctFnUM1g2HPe6myOG4JCc7U4nJYKaURij2ogP38/fyj7LG/c9b6AnTFpOD9jdN
 guzqdpQ4bhTtG9kWuj4QtYVSWjBYmLi5gNDe57XwlnkYj5NV5pqcSAggWvm8UBYGupP8
 EnOw==
X-Gm-Message-State: AOJu0YxlIv7C2RzXl89GyeQfTkkf/PqDaoK0N7nEEyJTWuz9CUdRcwMh
 Au1I74Vkilq5qqQie0OVoxoT9MoPfrtA0+62ftDrXw==
X-Google-Smtp-Source: AGHT+IF7RMDK0uGNI+/IJvR4qUuQ3e4du1hRISXEDPoiQ5rBh9DcvbkyUjE4cenbjyrO+jkB4HfVhbofAm3cHS7ePtE=
X-Received: by 2002:a9d:7a57:0:b0:6d9:d6f9:359f with SMTP id
 z23-20020a9d7a57000000b006d9d6f9359fmr1783064otm.53.1702165139069; Sat, 09
 Dec 2023 15:38:59 -0800 (PST)
MIME-Version: 1.0
References: <20231208154847.130615-1-macroalpha82@gmail.com>
 <20231208154847.130615-3-macroalpha82@gmail.com>
In-Reply-To: <20231208154847.130615-3-macroalpha82@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 10 Dec 2023 00:38:47 +0100
Message-ID: <CACRpkdYHvwKT+3xO0MEDncxw8ZJJsfKnWUJdy9RucvncSgwztw@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: st7701: Add Anbernic RG-ARC
 panel
To: Chris Morgan <macroalpha82@gmail.com>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jagan@amarulasolutions.com,
 krzysztof.kozlowski+dt@linaro.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 8, 2023 at 4:48=E2=80=AFPM Chris Morgan <macroalpha82@gmail.com=
> wrote:

> From: Chris Morgan <macromorgan@hotmail.com>
>
> The RG-ARC panel is a panel specific to the Anbernic RG-ARC. It is 4
> inches in size (diagonally) with a resolution of 480x640.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
