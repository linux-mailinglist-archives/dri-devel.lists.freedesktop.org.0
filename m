Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CCE71A34B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 17:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410AB10E56D;
	Thu,  1 Jun 2023 15:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E684410E56D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 15:54:27 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-33b7f217dd0so156755ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 08:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1685634867; x=1688226867;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p75d/9vAo2QmHGYASe5pVB3mdXeN7tpGcCzjSSNDwCI=;
 b=pB2M88fOWegLHbbo1d+tMCHh0Boi8N2ckCUoAxS2KH2mN6q2UpN0q7c4qh5+XGI80C
 H98XGitwXYrWwX3tP0U5fCD5ZJgw1EG383lnBtrI8+PCIbqwXll5D7emj6m/M5ZioT/l
 3vcpowBllTwJKTvCLOGwWEs6ZTEULLFRbzQx0+5pxfx7DOyM1sNXYYJehlRpBfYRQG4s
 I5AYAnJ4VFup/fHUgNH9srrsXEVLLg9iDyeZJjhAgDDibGre1hYWgycudLgYvaQPP/sv
 Ol4u1sfVJLUPLLXBGJCDQuxNem5gS3HrF4ttA4WEziqc8/wvs7YLa1pKxaN7W+F+HmAA
 Yu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685634867; x=1688226867;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p75d/9vAo2QmHGYASe5pVB3mdXeN7tpGcCzjSSNDwCI=;
 b=HcXfh0vxypVv+qjuIx0emDmkiiZ5uwesIkBhj6eViqR/5UHxKvFpZD5JwlO8LGMgbB
 rHH4RD7JDxSjUoFCeQXiYaUsPgIr33g4OXtytX4sBmO8i0CGgB5vhHpI5SzR3iSpAV6A
 GUWeod5lF5XZuMmk/WvH/EhKBL62O2YFVgQ4iX7sHPJvWX+li0Fw4EB32C3wpYNCrG9o
 5/yOEJZHj1reF2Ow6u/SKONv79vQyC14VLdP+RQXeuNQFPLJnzZz7+F3y62Xw8jvSF4R
 b8IGAnI4HDF5DlQoWOxTDq87nsMwQUQGHuLhfu4+M2EjZLbhSkl6yw/0W/T1WCJZtHfS
 ND7w==
X-Gm-Message-State: AC+VfDzRVnN+agKkWpFLA/RT3/Cqz0RalsIhi/bkOKsFwFbNkxae5oBl
 RT1DZq4L82kaER7CiNbHM2NvruU/W+YUrZF3w+fXbA==
X-Google-Smtp-Source: ACHHUZ5iIWwTojAZAR2RN0XWGD2cCzkBc04L8Zy4/yB6TmM0Xtt7GPFCebiEEi/Bni+lRbbzZA73dV+y0VMVs4Z+V+c=
X-Received: by 2002:a92:c261:0:b0:33b:4805:7333 with SMTP id
 h1-20020a92c261000000b0033b48057333mr212113ild.26.1685634866619; Thu, 01 Jun
 2023 08:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <1adda828-cf35-fb2c-6db5-f9ca91b5b62a@linaro.org>
 <20230525093151.2338370-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20230525093151.2338370-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Thu, 1 Jun 2023 08:54:15 -0700
Message-ID: <CAD=FV=VsaiWVfyMhXavE8zRgCRnDdtYDUMZrp--3BKnJNWbk4A@mail.gmail.com>
Subject: Re: [v4 0/4] Support Starry-himax83102-j02 and Starry-ili9882t TDDI
 MIPI-DSI panel
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, May 25, 2023 at 2:32=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Copare V3:Resend without Conor's acks on patches 2 and 4.
>
> Cong Yang (4):
>   dt-bindings: display: panel: Add compatible for Starry himax83102-j02
>   drm/panel: Support for Starry-himax83102-j02 TDDI MIPI-DSI panel
>   dt-bindings: display: panel: Add compatible for Starry ili9882t
>   drm/panel: Support for Starry-ili9882t TDDI MIPI-DSI panel
>
>  .../display/panel/boe,tv101wum-nl6.yaml       |   4 +
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 471 ++++++++++++++++++
>  2 files changed, 475 insertions(+)

For future reference: please don't send your patch series
"In-Reply-To" the previous version (or in In-Reply-To anything). This
messes up a bunch of threading and generally people don't like it. No
need to resend this patch series.
