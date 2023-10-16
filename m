Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C848B7CA5FD
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 12:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD4110E1AC;
	Mon, 16 Oct 2023 10:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B6510E1AC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 10:47:19 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9b6559cbd74so762722866b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 03:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1697453238; x=1698058038;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FSOsW3lqyVDGEO7YV9jDSsXKfAhrZdV4NxhIXBreaCc=;
 b=ZKSCnv5/d4S0lSKy6nTnE85uMIXmEN0nKD/stF34Orko35E8B2We/xWkTjKiqQOyoW
 +p3jxTCHwUDRw7eeLsjE5ZhaBYQziRhUMxlm4OAc5dPa7DLcGy8/6XztCivgCmS7XP7m
 nbkFpqsHMeK5dot64Qj1+ZCT5EwEnxwHN/SWd2yQq2V9dhKgpoR8taus6mA2/jiy9zce
 McKzlspgnijDikG1vEcMBnWpIRPjjAoZ9qdt2dS4Of13r6WhDpe3soN1KWskmDYeoku9
 lmDhgfpm9Nr8+spu9aggjchR8kPmToXSfNuBdzEDrn7yfUZU/su15/RdZ2lHQAiQYUYa
 RVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697453238; x=1698058038;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FSOsW3lqyVDGEO7YV9jDSsXKfAhrZdV4NxhIXBreaCc=;
 b=ZhzWpGXJmDzF69lJxIWgIwsqElg9f5nfe2r7HGAu/oQUAuX9ppdngUl2HaoOlnywoW
 6uMUEHfXRtRsUU7H5jIsN7o5cKCUOepo2V7IeCSQUc8sCixLrOTkFjBkiwKRezdI6K0j
 VNu5ac6aQynsJeunJ5DBk3I4ortFCQT+2gb1gYgsqcRaklcJpTAvyLN3Z62LXTKoZyny
 PX+D/XyxuiMQ4/evH1e0JQ1hFWonOK2Iy/Ri4TAFYrA7Sl/2wgfRLSXKiHz9ilQ/VYa3
 sfJNbTPCNJ4aSDvFQuLG5Z2l4AUP5/2puYrvf/hKCSUM0ETUefVU6+OffE6hhzyoNTCL
 57Rg==
X-Gm-Message-State: AOJu0YyHh7NXHed7ishH0dYzUUbMbw5GLjzk5KB6Zmah99Ffwrd1nvvg
 dARSbG1+mfoRWUZSBlENBZSlxPjRHB36f2W7W8mAMg==
X-Google-Smtp-Source: AGHT+IE4rTDIFGCtxkHDTxmHZHJipHKSAGuGG/X+qZH0l607g2QnU10hsXIs4iTRUVFldU+NJUeLfr6IQgVhXcx+8ds=
X-Received: by 2002:a17:907:2cef:b0:9ba:1d08:ad43 with SMTP id
 hz15-20020a1709072cef00b009ba1d08ad43mr19381711ejc.70.1697453237825; Mon, 16
 Oct 2023 03:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231006073831.10402-1-shawn.sung@mediatek.com>
 <20231006073831.10402-5-shawn.sung@mediatek.com>
 <CAPj87rMUbP12uwzyhV=94wR7LkQK4JfTB4kEMGADq2YJOk8Vrw@mail.gmail.com>
 <c3fff5bcc3a7cfeffcd86d6e2c199963a720871a.camel@mediatek.com>
In-Reply-To: <c3fff5bcc3a7cfeffcd86d6e2c199963a720871a.camel@mediatek.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 16 Oct 2023 12:47:05 +0200
Message-ID: <CAPj87rMc=3tX8Fbk4LjXmqgPfp=YX3GS64V4Sb5y84xwf3wDBw@mail.gmail.com>
Subject: Re: [PATCH v7 04/23] dt-bindings: display: mediatek: padding: Add
 MT8188
To: =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Shawn,

On Mon, 16 Oct 2023 at 06:23, Shawn Sung (=E5=AE=8B=E5=AD=9D=E8=AC=99) <Sha=
wn.Sung@mediatek.com> wrote:
> On Fri, 2023-10-13 at 17:26 +0100, Daniel Stone wrote:
> > If I understand the driver correctly, padding is automatically
> > applied
> > to compensate for unaligned dimensions. The first/last rows/columns
> > of
> > the overlay area will be filled with a specified colour (black?) to
> > preserve the area. This is unfortunately not OK to do transparently.
> > Userspace must be aware of this policy decision and specifically
> > request it. If not, the atomic request check should fail and tell
> > userspace that the requested configuration is not possible to
> > achieve.
>
> Yes, Padding works as you described, users can assign background colors
> for the filled area in 10bit RGB format, however, the rows and columns
> that are filled by Padding will be cropped by the hardware components
> after it to avoid situations as you mentioned, so users should not
> notice any difference.

Thanks for the explanation, I hadn't realised that the added padding
later gets cropped.

Cheers,
Daniel
