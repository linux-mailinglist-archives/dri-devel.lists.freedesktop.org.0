Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E136F828B3A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 18:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A272810E49F;
	Tue,  9 Jan 2024 17:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C01510E49F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 17:29:02 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5e7409797a1so29692927b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 09:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1704821341; x=1705426141;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ES7KBLZZG8PKvoN1C5XRDxhZW5V7JmVLq/Pi/J8+3to=;
 b=IvlA6iFwKxdMZ27S+p9y7p1/IWBSw1+cLdOEDBO2yL7/Hmn2M8H9FFMkgX/vUTETBl
 ACBEXtlxOHBZIlMwzDOC7AyIbC0tXbwq/DAmGNcRuI6PEG643QOVuUUfPOQAkE40nIP5
 HLD0ek5E42wis6NN0XZvb5WIhCq2MKA9LW9cwNRkmFBvqwSrjyOcCICKDZ+bKTXLI/5f
 1Ui+2VYS1jXfBPRoI1+Cjgzvcv3VWnGBu0QYo3D2GtZOlOc5K47OkhjpI49JTIJBjGAy
 qgTRxBXMHtgJiv584wYMCCbRDqC2eexI0iUwH39IrgYqSQciyCp1oP161D3yrGLSwRkR
 sQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704821341; x=1705426141;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ES7KBLZZG8PKvoN1C5XRDxhZW5V7JmVLq/Pi/J8+3to=;
 b=XWYZbDvLSQl17Csbb+mBmpo+W4aiPEmxqXSogdhdYbmdD3AFbsE+b3PSb4vknLM56v
 zRMHcUdhuTsXc/IgGZWiMxu+7SHdipe9uD+B7ZjIqcAXNxcVAMCYSe38e/s2xp/QRwqQ
 fR+OOeT9B68KeJrcc2Lp++kcTBJgQI4/B2M8J9fa8NEXqPRs+/5CosTdi4uiVOBl+HI4
 brYWrw0SygmcapRJjH30iE3s3Yenv8cYBysviWku2m+pbHihsQ1FWXFU5aaUw76fY2PW
 e5vw6Po0h20O8gcmnP4rUltAyVDWzy3BNwsP8mlE7YEcYe16qMcG/AQj0yMBfabrU0un
 2nPw==
X-Gm-Message-State: AOJu0YzwxEEy7Drx3gwGKUwa/nc2JneoYdqCLi/Oo8UZBC3YIqwLy5yc
 vEUdZiXIq0AsjgW0m9iIMjcnF81tpcJkb/mibfQO9yUBAV3PEA==
X-Google-Smtp-Source: AGHT+IGgI/FoLML7Z/cvGXsENd2rwJDH5p4+nuQ7PKd15HF7RA/G4lSfYUHjMfXlkBR8ob0lW+xWSn2ZjfO7PCnI8Dk=
X-Received: by 2002:a81:9184:0:b0:5e8:8890:8afe with SMTP id
 i126-20020a819184000000b005e888908afemr3645470ywg.78.1704821341152; Tue, 09
 Jan 2024 09:29:01 -0800 (PST)
MIME-Version: 1.0
References: <20240109070949.23957-1-shengyang.chen@starfivetech.com>
 <99d7bb85-17b0-4b5e-a6cf-f5957ad92298@linaro.org>
In-Reply-To: <99d7bb85-17b0-4b5e-a6cf-f5957ad92298@linaro.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 9 Jan 2024 17:28:44 +0000
Message-ID: <CAPY8ntBcXEyg5tXHGwAdbVody7ihHo3gb1C4vE+6PY2biDhN4g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add waveshare 7inch touchscreen panel support
To: neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 keith.zhao@starfivetech.com, tzimmermann@suse.de,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jack.zhu@starfivetech.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 mripard@kernel.org, Shengyang Chen <shengyang.chen@starfivetech.com>,
 quic_jesszhan@quicinc.com, changhuang.liang@starfivetech.com, wahrenst@gmx.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Tue, 9 Jan 2024 at 11:19, <neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 09/01/2024 08:09, Shengyang Chen wrote:
> > This patchset adds waveshare 7inch touchscreen panel support
> > for the StarFive JH7110 SoC.
>
> Could you precise which SKU you're referring to ? is it 19885 => https://www.waveshare.com/7inch-dsi-lcd.htm ?
>
> Are you sure it requires different timings from the RPi one ? In the Waveshare
> wiki it explicitly uses the rpi setup (vc4-kms-dsi-7inch) to drive it: https://www.waveshare.com/wiki/7inch_DSI_LCD

I raise the same question.

Keith Zhao earlier submitted effectively the same set of patches [1]
and the response for the updated timing was:
<quote>
My platform dphy tx hardware has certain limitations.
Only supports integer multiples of 10M bitrate:
such as 160M ,170M, 180M,190M,...1G(max)

as common dphy bitrate = pixclock*bpp/lanes.
This value cannot match successfully in most cases.

so in order to match bitrate , I choose a bitrate value around
pixclock*bpp/lanes,
Prevent overflow and underflow by fine-tuning the timing parameters:-(
that will make the new timming value.
</quote>

I then suggested mode_fixup should be used in the DSI host driver, and
Keith acknowledged that.

Is this new timing still because of the DSI host requirement?

  Dave

[1] https://lists.freedesktop.org/archives/dri-devel/2023-December/434150.html

> Neil
>
> >
> >
> > changes since v1:
> > - Rebased on tag v6.7.
> >
> > patch 1:
> > - Gave up original changing.
> > - Changed the commit message.
> > - Add compatible in panel-simple.yaml
> >
> > patch 2:
> > - Gave up original changing.
> > - Changed the commit message.
> > - Add new mode for the panel in panel-simple.c
> >
> > v1: https://patchwork.kernel.org/project/dri-devel/cover/20231124104451.44271-1-shengyang.chen@starfivetech.com/
> >
> > Shengyang Chen (2):
> >    dt-bindings: display: panel: panel-simple: Add compatible property for
> >      waveshare 7inch touchscreen panel
> >    gpu: drm: panel: panel-simple: add new display mode for waveshare
> >      7inch touchscreen panel
> >
> >   .../bindings/display/panel/panel-simple.yaml  |  2 ++
> >   drivers/gpu/drm/panel/panel-simple.c          | 28 +++++++++++++++++++
> >   2 files changed, 30 insertions(+)
> >
>
