Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E79F65EB3E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 13:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2961710E711;
	Thu,  5 Jan 2023 12:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B4E10E70F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 12:57:34 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id o21so9630835pjw.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 04:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6eXwlkYEyYH0RAxYdq0+qxRYI8660LJjNt6Ey3h+rmk=;
 b=m7h/fvXT/G3TPk+gkdWxSTwIIo/wRUwDwB64D7kw59eJaJflMn5mIenZKtQaGNyTiv
 LPvDaSzi0k2k8v1pMspw+Q4jgNal2WFQaOVuUYkyc5Qvpcj+KsF8/3npM7L3x4FBA5TS
 WxBo37hfSfLs/IHBXrh01P0PvZiTBhvBvxtPclcNvgDXvH2iAYVHFhveLXmFlQ2kqwz8
 Ob/mP70BfQaaxaPCn1EnBVoNHqzcHUKtZifqowcbr+hKPBWH/hk0RAqYHCUdLOOP0URs
 XiPp0nCO9BVTO6gNmZ6Xl7IsPYYT0/3ItFLLVI0WZBRiY341tGe9MgqpC5pMtxuImoEj
 AQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6eXwlkYEyYH0RAxYdq0+qxRYI8660LJjNt6Ey3h+rmk=;
 b=rgmptBvR9FEj/riuEDIVLQvS3vC3VdeQJk13k0PM/Ka0Y/VxLJ+PUvf1y6chaXBvjp
 6T5jloCWl5gu3QTlQgzhBbphRosj3bUYXf1FoJJOJvX2RNNk14enhIpVGOOeetvoDMUm
 5GbUeBKv7l2NWWnF9KPp+GWzoRL3nCC2aTfhIRg8FlUO45IKLKvIefiv8cQDiwDjOk0t
 aFv9PqoodBU/5uNJw0EwoJtIV+cmkq+ZFYfuadWMZGtQ+l2DAS5+4GAV4qu4WuxCywTr
 SWnlPj3LclX7P5rOAmqlFpQZDvqFD5P//dnBW9qGwDXkoNZZBIaj3xgcHJxrDz2CAMUw
 hCWA==
X-Gm-Message-State: AFqh2kpP8yTzaFqRiLJ9szAOW0T2wJEBNCIneYymcSpof9SPEJ0KQkNa
 L4fiBvkSp07yTXikvwNsrQKhuqvU/39jSZiyUSJSfwyAPaw=
X-Google-Smtp-Source: AMrXdXuYpqsaQxnldVRA15VYmbLQYbuZClTuRNej/ns/6Klxs22itHE8mbPor5qiD3cGoWyV0FAIEAeLCmSL6pIxDCc=
X-Received: by 2002:a17:902:aa02:b0:193:500:e09 with SMTP id
 be2-20020a170902aa0200b0019305000e09mr51572plb.168.1672923454039; Thu, 05 Jan
 2023 04:57:34 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5Ba5eNCQO9GQezbEO5RX=C7EpUSz1zjO78Ki0kD3aK2uw@mail.gmail.com>
 <a4945d6e-be05-bac1-38d2-a3154a15aa8c@tronnes.org>
In-Reply-To: <a4945d6e-be05-bac1-38d2-a3154a15aa8c@tronnes.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 5 Jan 2023 09:57:21 -0300
Message-ID: <CAOMZO5C+u7knB-5K-CPFWL8wQ5H3fB02742dZ4P=1FmrJhvEPg@mail.gmail.com>
Subject: Re: Driver for CFAF240320X0-020T display
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Sam Ravnborg <sam@ravnborg.org>, damien.lemoal@wdc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Noralf,

On Fri, Dec 16, 2022 at 9:30 AM Noralf Tr=C3=B8nnes <noralf@tronnes.org> wr=
ote:

> There is a DRM driver that can be used with all of these controllers:
> drivers/gpu/drm/tiny/panel-mipi-dbi.c. It uses a firmware file for the
> init commands.
>
> Binding:
> Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> Wiki: https://github.com/notro/panel-mipi-dbi/wiki

Thanks for your suggestion.

I was able to get the CFAF240320X0-020T display to work with the
panel-mipi-dbi.c
driver.

You did a great job on this driver and wiki!

Cheers
