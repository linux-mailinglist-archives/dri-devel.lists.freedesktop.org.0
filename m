Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA586AF9A0
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 23:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A287510E56D;
	Tue,  7 Mar 2023 22:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6D810E56D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 22:56:13 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id e82so13005190ybh.9
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 14:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678229773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yT6vJ760dlo3cpztZcrQb2BiHonS1E/qGxacYw3cRjw=;
 b=mJRRLg4/5ng1ycFI2WzAFe+qf21Bs55snchruhUYb3mMDoJpJIfLUyXpkPhAxF9HvO
 8cZmkSrqt67dRX1mitN8alTlMiKOE3aKJ86zbo76PBLRJg53RlFN4bomIpgAwPrDRlT+
 BHE41Rx31odBtInyaCGdpjGxXuDhjdN75nTduUOKzWdQhL54GwKjnLuRoGtLHsDYQcp6
 TnYHYuo8QgQBpg14+jmzkn4nP6VHdHllE5bQs0ScWzPpNa80u+1RWcL7xFqa+P//VsEl
 CVj/v2nIBJInsMKlh01INA8Z0Wg4DOGbKGd9Ui/Y8aBaE4Cd3Bli0G1Pz8L0EWCtXEzT
 UbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678229773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yT6vJ760dlo3cpztZcrQb2BiHonS1E/qGxacYw3cRjw=;
 b=hICgyemJZFio0zNFF7Pos4kiE7RsF2XjE5rZvpzqbc2+KVBuh0Muw8qZlc4H8dLLF9
 yBiBoeuIifWECXAcXnYbaJ42vhK8ADfUmmvzECUfK+O2Ea08zdwKgPCdycoH0aaK9fnr
 4e5SRGRLu1CRth1dgPZfwdbsjCCJIAzqH8q7oNDaB6r/oTG8GXEmj53q4/dEpB8n1SzX
 ooGFDhN+HOViUIE9vfI9lDYV58DGRrtnTdkxDjnVNNfnrPiYqPc+YpewC2Ro4ck6LdaC
 TCamGhpuGe5JfvNbpzcOixlMCYueJ3YsKJLTU26xWhG6CLSHGL9nDNqnHB4QoRB4oFHA
 ci5Q==
X-Gm-Message-State: AO0yUKU6Wn7K6tRvXNVhlFQ5sFqA9ri0AW9RN3N8yiZabh6HSszdkfio
 De9BoqEmA7cW137hroDq44y6jOIW8pm0mqvjSvsUiA==
X-Google-Smtp-Source: AK7set+Oyb0Gqd+OA3Mz2Jq1wBO6O3BOCVPQ+rKZXv7PqDQ9jZ3YW1GUW1m7oV8juDeJ5SWuXwhqWcU4UV/AbId5Gxc=
X-Received: by 2002:a05:6902:c3:b0:9f1:6c48:f95f with SMTP id
 i3-20020a05690200c300b009f16c48f95fmr7797151ybs.5.1678229772780; Tue, 07 Mar
 2023 14:56:12 -0800 (PST)
MIME-Version: 1.0
References: <20230119163201.580858-1-konrad.dybcio@linaro.org>
In-Reply-To: <20230119163201.580858-1-konrad.dybcio@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Mar 2023 23:56:01 +0100
Message-ID: <CACRpkdYn90RMWP7=B8Y=-9MgF=Z1U=MS5upE26q7xbUu6vVX0w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: display/panel: Add Sony Tama TD4353
 JDI display panel
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
> Add bindings for the display panel used on some Sony Xperia XZ2 and XZ2
> Compact smartphones.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied to drm-misc-next.

Yours,
Linus Walleij
