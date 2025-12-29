Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0626CE6B38
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 13:34:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1753C10E064;
	Mon, 29 Dec 2025 12:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AQ5Hvjtl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB1710E064
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 12:33:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 60F2844499
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 12:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F9EC2BCAF
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 12:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767011637;
 bh=xAUdXnwdw4MGc3Kxf0WtvX8dHtupKQMIxTUwesxjVCI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AQ5Hvjtl5ZI+vB91mXgf/7FaqmloUxzxxQOxMEUbZSj4iJsdeSbey4dSwIloBMgE0
 HLDWfKKqOcAtuthiaZ56D1nSIAj1fmO+VGnDlPcGmTHnYKU3JVMncjS0TnqB/hDpur
 p/K9RHQW2JBAiX2Tg7qYVFwJUGKBzCygW+NEnrgTgFfvxHjBePNDytBPlv34p3VKGh
 sjXxPKKX/FB2ZF7PQUzNdWo/pWZVAdlLQ7BnI2EHVAJGPt/KAGUflSCdqlD2y48YEw
 0YYwYHoJzdYLPAP6bOUY9cOnm6zUyL9bF78KOn6Ssb8E+npcSFkYTFDv0/bHstGliN
 eiv5hU979WNnA==
Received: by mail-yx1-f54.google.com with SMTP id
 956f58d0204a3-640e065991dso7427494d50.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 04:33:57 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXX+9uO8NOySi8hz51pTAylqovZq9T7xuZvyavVWXA3K5wWMAB8dicsy18LPCgTVeHBsf+QOjo511c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkNwbzh7pQzSvw9mwfM6fkU45Xm99rvGP5hiUcI/qmWnWSMA7X
 4MRQ2KIDv/G0+a22t8BKvBuE68/HrZ9gdWcJoStfa2FC34fiaS99EoRXNHFrI3Dj62PTAI24CmE
 7WwOwMcwDW/FA7uVOnbrd+QoqnDaEW34=
X-Google-Smtp-Source: AGHT+IGW7fvps7wB/XnC6tWrYAZ5eBSHy0nlOLcWaaFTpZYeFIeLso81oPc9n2jerPEWAR2y7Lp0JA50tvD/yxStcwE=
X-Received: by 2002:a53:c05a:0:10b0:63f:bab4:fdcd with SMTP id
 956f58d0204a3-6466a8ac439mr18565681d50.48.1767011636089; Mon, 29 Dec 2025
 04:33:56 -0800 (PST)
MIME-Version: 1.0
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-3-82a87465d163@somainline.org>
 <CAD++jL=c0AVm+BD_G_AJjiXYVyWdM_HscqyoNQ-tBByJ1Dp1jQ@mail.gmail.com>
 <aVJh2xdCreGpi_f9@SoMainline.org>
In-Reply-To: <aVJh2xdCreGpi_f9@SoMainline.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 29 Dec 2025 13:33:44 +0100
X-Gmail-Original-Message-ID: <CAD++jLkb5=i=XZdB=hc49hX1t6eP9=5tfv6Hg-5m5F0ghC=5_g@mail.gmail.com>
X-Gm-Features: AQt7F2oymfwij8Obp1J0ATiKmWENsUelo_uvAIVTj5-tWNR2T3NJY1yDSiPZ5vE
Message-ID: <CAD++jLkb5=i=XZdB=hc49hX1t6eP9=5tfv6Hg-5m5F0ghC=5_g@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] drm/panel: Add LGD LH599QH3-EDB1 panel driver
 for Sony Xperia XZ3
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 29, 2025 at 12:21=E2=80=AFPM Marijn Suijten
<marijn.suijten@somainline.org> wrote:

> > Can you break it out to a subroutine?
> > lgd_lh599qh3_edb1_unlock()?
>
> Sure, though unsure where the "lock" sequence resides (and why it needs t=
o be
> unlocked twice, unless this was autogenerated and is unnecessary, or impl=
ies a
> "flush" of sorts) or why it looks so familiar to the Samsung panels.
>
> Will rename it to lgd_lh599qh3_edb1_unlock_multi() and pass it a
> mipi_dsi_multi_context so that no extra return-code handling needs to be
> implemented.

I think extracting the unlock macros from the s6e* drivers and put into
a separate .h file is the best for starting to unify these drivers a bit,
but no big deal, I can do it later.

> > +/- this nitpick:
> > Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Just making sure, you reviewed the SOFEF01 driver with your Linaro addres=
s,
> which one do you prefer or should I keep this distinction?

The Linaro address stops working at the end of this year,
I'm sorry if my fingers sometimes type the wrong address...
linusw@kernel.org is what I should be using henceforth.

Yours,
Linus Walleij
