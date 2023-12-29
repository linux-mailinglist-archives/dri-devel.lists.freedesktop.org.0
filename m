Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BE38200F0
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 18:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02DB10E2D4;
	Fri, 29 Dec 2023 17:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A278210E2D4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 17:46:42 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-dbe318ead5dso2006212276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 09:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703872001; x=1704476801; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bW/8qnQVOuCrpelBOhL9bBZ5oe2cPmQUpD0VXBVorkw=;
 b=ocHExn9q9G4RLELayS2hTESvns+UAtzjondARbbwBpuyGWPMbIjZ8RMi7as7V2MQFW
 soD3CFYDzo+1cknMUbbOX/UMQ4IUjKusl3MnvD5ae8xmRhuQheYzQWPeEa2jjcrOZ59y
 T6C1TED1E1Kitl4v+khXKa8NcX+jkes/xSBL5o1EM2HIRn5fbob/deo6eug0GQ5Ahu2N
 tA+Z9jCOBgplH9pFJGdfnwi8K7xQotOntFN2cwHangGApC9DKEV+YLIWFq/nytvpg87B
 Btx0UDrXsGVLwUtQaU8Z7vQ9GYWa8lzp1g2taOeIxjgHJC0TDz5L02LAZ1g61AObgbOc
 c7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703872001; x=1704476801;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bW/8qnQVOuCrpelBOhL9bBZ5oe2cPmQUpD0VXBVorkw=;
 b=mIXZDiZ88zSWWl9IrdXQt7cTdzn8k6+4whJj4kSwJSCuOkauLXdfRNFWuShxjgQa7H
 3o5CvFKBLQ1tAwQGwKryXIUCkMiEOJ7apWpBOBpkRHZplRsfSr2CHfJLDk9Gy5EzZOlh
 +owO1SFbyShOBfmGEDNXB1B05ykiGQaIp7PdZKDRpPICucq+qipjQpGE2TuTI2AuIJ7B
 4xX7Wof3844BrIxTnSSj5/Llr2XJDu/nGh5n9Lyqa6+7n81WhkwWmyPA/nh4+vDD+AEA
 kGpvV1NM40hDBWkSPKnQSN4iZ/0kVFtLSpgkY5o3IuAs9S6CSG6ldFwCwvT7C8Bjs5i9
 yfcg==
X-Gm-Message-State: AOJu0YyrwewPV0eeFafcG9rS7uqWugULTHzxieuhXK0zZEaIFbz4pbrG
 BIujEekDr51nBkAeku+aah4CRxADBVpeaukbRvhLfIlzo95WRA==
X-Google-Smtp-Source: AGHT+IGLODEawCuJpoVcBVXIkKKkBjBq8qoZWCqtUWJ3Y7AZ05fBAjMAbbu202fTig97uet5lOUKFj54M3tLy989Hr8=
X-Received: by 2002:a25:664d:0:b0:dbd:c1ef:bca8 with SMTP id
 z13-20020a25664d000000b00dbdc1efbca8mr6857806ybm.40.1703872001727; Fri, 29
 Dec 2023 09:46:41 -0800 (PST)
MIME-Version: 1.0
References: <20231229135154.675946-1-dario.binacchi@amarulasolutions.com>
 <20231229135154.675946-9-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20231229135154.675946-9-dario.binacchi@amarulasolutions.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Dec 2023 18:46:30 +0100
Message-ID: <CACRpkdaEPGonc_pDiApEN2XNn3R4hdUtEp0TZqWjBOmbM_Gimw@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-amarula@amarulasolutions.com, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dario,

On Fri, Dec 29, 2023 at 2:52=E2=80=AFPM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:

> The initialization commands are taken from the STMicroelectronics driver
> found at https://github.com/STMicroelectronics/STM32CubeF7/blob/master/Dr=
ivers/BSP/Components/nt35510/
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

NAK.

Please rewrite the patch to use the detailed instructions with clear defini=
tions
about what is going on the same way as in the old driver, and add #defines
for all the magic commands, and break down the commands to what they
are actually doing with the display hardware.

Magic display init sequences are not OK in this driver, and not in general,
it is all the other drivers that are just unaware about what they are doing
and this driver actually isn't.

Yours,
Linus Walleij
