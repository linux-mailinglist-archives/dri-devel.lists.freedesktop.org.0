Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86643A1A7BD
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 17:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED82010E879;
	Thu, 23 Jan 2025 16:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="UwI1KAE5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9956010E879
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 16:20:58 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-540218726d5so1258166e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 08:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1737649257; x=1738254057;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dP4iIFxpGRxJIuWg8fbKde8yqpGCy/LbovICFuWMxcc=;
 b=UwI1KAE5HDNFEnh41OlpoUrDrVoNEUhXHvHYiDplButqhE2paOy0USZha6jA/wAM1y
 q1hD7GZPIlsW4MeYgZghmeFVlP2X1BVM/lYCid6ixHrVbkE/Kp/5ppPTahS9C+2tjmmy
 ySF5f6P2U/3A/B4jWwvV1IHMWZtp2hDDRm1qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737649257; x=1738254057;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dP4iIFxpGRxJIuWg8fbKde8yqpGCy/LbovICFuWMxcc=;
 b=SP7yLUHXY4DMLi1rm9l2Scr3EDGhDfj+GuHAnORk7rHUrw7UcCUKLm+iSThkf61BSe
 juwluV2USqcYL1uDiBdojraDLN4nONAqe01CQOFZ4dw8y4FKpHHMGKnH0fSu+6Xay7Pl
 OqJGYsPdT5u30gepbebMSCAbR2bS3S6HYWDVjt3Hr35DJdGpQyIuzrMNjGPxp8MUDa65
 /G9liDZdClAistfIzYaGI58kBw0fv5N4399+H/b9wPj8W7uJ/uf91DD8PHnkcZ2OAnGO
 93wQyzW/N1tHHHOru/g3czjForLzRqFBiyGx9uUFMkzmANqD0XLFtDXzXjkRpwztOlTS
 zevg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq6xBzi1bkgaHwu+ghovFNrGn9LKRF9qkAOCQKpW2hQKTrnpSw/zuFTf8/n3THRK1tFPGkTVaeJZY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/k+IOYiMMATxfP3I8ItpNS3TetpKgVrqaverc1WJQClry0cuq
 55CtBtR0U+g+D2aFKIMCcsSalL7grSJ/6aHZWobY0ERHgUJ9v12ExlHpEM0+/bUWzcjmARdD9G5
 7gDgP0qgg1QF8wXWcz+3GhmXCxwveL5kuzWC3
X-Gm-Gg: ASbGncuvaSwvb7Tnhc1+AY2HvoVpRrYN+uBjhS0o33b5+4tzuZ4qh2Frf+J+a+wwI+A
 dnwutqYidoKaxmmlknzFevX9bxG0PiljMEErAh0aX1/8Erz0KV5kLdcbmWJArKC6ye6/SYr5kKx
 +ajzRHa8+6HZ2pTC90CQ==
X-Google-Smtp-Source: AGHT+IEKUB561xRTvYxXd4p0qNfpMRKfCZE8QX0G+Jn2kD2LonKgpFupCThYaQ1M0nTLUAE+dgJAYJFA1Lqm+sRFeOA=
X-Received: by 2002:a05:6512:124e:b0:540:2549:b5ad with SMTP id
 2adb3069b0e04-5439c246d35mr9447895e87.22.1737649256790; Thu, 23 Jan 2025
 08:20:56 -0800 (PST)
MIME-Version: 1.0
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-5-paul-pl.chen@mediatek.com>
 <173651725269.2671643.2891127782637834272.robh@kernel.org>
 <SG2PR03MB66367B4A9DBCC971F55DB326BC182@SG2PR03MB6636.apcprd03.prod.outlook.com>
 <d116e180-a056-4595-851c-ed1bb6f24cef@kernel.org>
 <b9405b09da418eb3c65592b53489d7f0dd4093f2.camel@mediatek.com>
 <e6fd5225-b437-4f3b-9835-f206ae4b9d2f@kernel.org>
 <843f2dcee012007572f41df991e52369c1e5ed22.camel@mediatek.com>
In-Reply-To: <843f2dcee012007572f41df991e52369c1e5ed22.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Jan 2025 00:20:45 +0800
X-Gm-Features: AWEUYZkfWBp2Lo-8TZn9tTq4YyIX0WXHpEKOlB7N1Mjjx7XBDKyByJYKaE3h9KI
Message-ID: <CAGXv+5G8C8F5ua595Z3zs-D4vUP6YSUaxaUTGPQY-kfZ6am61g@mail.gmail.com>
Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
To: =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
Cc: "robh@kernel.org" <robh@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>, 
 =?UTF-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>, 
 =?UTF-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>, 
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?UTF-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?= <Xiandong.Wang@mediatek.com>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>, 
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "treapking@chromium.org" <treapking@chromium.org>
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

On Fri, Jan 24, 2025 at 12:14=E2=80=AFAM Paul-pl Chen (=E9=99=B3=E6=9F=8F=
=E9=9C=96)
<Paul-pl.Chen@mediatek.com> wrote:
>
> On Thu, 2025-01-23 at 08:21 +0100, Krzysztof Kozlowski wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > On 23/01/2025 07:11, Paul-pl Chen (=E9=99=B3=E6=9F=8F=E9=9C=96) wrote:
> > >
> > > Hi Krzysztof
> > >
> > > I hope this email finds you well. I have a couple of questions
> > > regarding the EXDMA commit patch and decoupling:
> > >
> > > 1. Would removing the example from the EXDMA commit patch be
> > > sufficient
> > > to achieve decoupling for EXDMA YAML and MTK clock/power header?
> >
> > No
> >
> > >
> > > 2. If removing the example from the EXDMA YAML is not allowed, what
> > > alternative changes could we implement to achieve decoupling?
> >
> > Don't use the header constants but just some fake phandle.
> >
> >
> >
> > Best regards,
> > Krzysztof
>
> Hi Krzysztof,
>
> Once again, thanks for the review and reply.
>
> SO If we apply Chenyu's suggestion:
>
> + example:
> +-|
>
> +soc {
> +
> + disp_ovl0_exdma2: dma-controller@32850000 {
> +compatible =3D "mediatek,mt8196-exdma";
> +reg =3D <0 0x32850000 0 0x1000>;
> +clocks =3D <13>;
> +power-domains =3D <12>;
> +mediatek,larb =3D <88>;
> +iommus =3D <&mm_smmu 144>;
> +#dma-cells =3D <1>;
> +        };
> +    };
>
> Does this work for decoupling?
>

AFAIK it will since now it isn't including any headers.

ChenYu

> Best Regards,
>
> Paul
>
>
>
>
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!
