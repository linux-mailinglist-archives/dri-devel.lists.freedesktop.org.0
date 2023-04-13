Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988D66E07BC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 09:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C90E10EA51;
	Thu, 13 Apr 2023 07:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7089010EA51
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 07:30:26 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id f188so46173398ybb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 00:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681371025; x=1683963025;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KMISx41rFHJr6iPn8d/tZBbPZ6RQuJBNrkQeU/K1yXU=;
 b=whbuHWWdeAp4lomCTHfm+944XRjCmlfBA90jDLyIgz/k4Q68dYfRYLCQr7OnWKZ6iw
 w1CohXPGGnBR6YAZhet/F2eVbZpLFwANShCSGyeBXLgWCiLtUqiQB08ier/YcszqhhaG
 iN94Wont3bxDiAQPr7LF3vFB0jZu50auLAmgDCmhkj1J53o7kz92DjHXKQw9f2lzdFqr
 v+xan3WC+MXrnXhXavLECWV/cRGzQ+t7/utnE0Z56n0y92KtbZZSu3qq7JE0v13p8KjG
 QC6GS2nT/4bKsPiS01F7V4Mu5OasU2u4L/PaCzK3p5TlGPHq+E+ZVX1uWfam1gC7KC0U
 dj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681371025; x=1683963025;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KMISx41rFHJr6iPn8d/tZBbPZ6RQuJBNrkQeU/K1yXU=;
 b=HEkIvo+aCsFjUCpnZXChNBAWEnD9CBTFXnzrK7aGazBPwa/W2GsM2qcxbvL3dxgVS4
 2v5UkQq6spiqoFmUhkHFW2DOJf/HLJjT8nCdGDH/GZE/R0W6oBrchTXcosStUEhBekQM
 au06H6OvOFW9xEp8agYvkx0RBr/D0DRxQGHXiOxyrtqmdXlYKA6HqEBhdkI1cmssIqEE
 jD0YonjW9rYbXVtbaZEoS4BzYfhRxXkumE13nbI4XxSjOA5Aew5xSJ+iXneXpU/vvD+T
 ONQITCer2I9vEpAijaOsOMdKH0fIdTTbhKowBbGKSGcq3MtsPXE5VDMgC8vVPtq9r8Pz
 z+2A==
X-Gm-Message-State: AAQBX9ci9nplmWw7t9RiA/xHxTrutNC4HeRzBqvh2rphtUhNWHMDVmP9
 RZ8J/xxtha2nytRm011qOla1VswIQz/Z7jWZetOkPQ==
X-Google-Smtp-Source: AKy350b2cjWnqq1MlUht/h20IguGQOltfjZsSdUZqWKxv0QURFl+0Do7uJK7FVh1PuYT/sKJo4dXyFtUbpgbxLcUBEw=
X-Received: by 2002:a25:d44a:0:b0:b8e:fbcb:d6ef with SMTP id
 m71-20020a25d44a000000b00b8efbcbd6efmr881101ybf.4.1681371025305; Thu, 13 Apr
 2023 00:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230412-topic-lenovopanel-v1-0-00b25df46824@linaro.org>
 <20230412-topic-lenovopanel-v1-4-00b25df46824@linaro.org>
In-Reply-To: <20230412-topic-lenovopanel-v1-4-00b25df46824@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Apr 2023 09:30:14 +0200
Message-ID: <CACRpkdb4WvCOCfUna+HDQNTJ0jwNDvVj272JqZj8cHWk47N2OA@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/panel: nt36523: Get orientation from OF
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

> Some bright vendors mount their display panels upside down. Add the
> required pieces to allow for accounting for that.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
