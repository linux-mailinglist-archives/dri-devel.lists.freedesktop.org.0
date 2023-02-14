Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0BD696212
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 12:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB84910E885;
	Tue, 14 Feb 2023 11:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625F610E885
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 11:11:22 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 fu4-20020a17090ad18400b002341fadc370so3242051pjb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 03:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ky17l8iHWA+nurbdhU7Dvug8BSc+GSjC5WigIc/2O64=;
 b=TtE5mLMTOJZu7jg7Wi/r2is93T8mFOyVp8z2fwRxcPuZNEOADvL56XolJIbAZZXCUD
 EBfDbtDnnKvT3xcFNUpSCu5jdZmdoaG/4PA+CrGYXaxXaCSl3C5r5FEfDJzHdqg9vfoX
 gDpKOAMHyV7u+l5n/qRUICsPPjfwdIk8yGuurXiIO/+LzXSAF911Bb3xBi+ZKp7r61Vt
 L045/BEdXHhLPZnM+cT0V/0Zvi9b4xTdeFTII/JW9BkyJpSSxPz3jwZFcG8BcJymDaCE
 J5tSh9Si0FVocZuktjnC//TveJqUsIjSifIHMY+AVioNHKHVl9HalNnVl2f6KHuXREMJ
 lNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ky17l8iHWA+nurbdhU7Dvug8BSc+GSjC5WigIc/2O64=;
 b=QF+QKZaFSK4XZ94Ty/4LNLupQI7b8qXGedQUERDqe67WXkGKFtKeuPTcDCYPPOuM45
 HfxgoEExBGmW1Yut8hYYuDRz+jx1CfwR2kpoZ6BU8Jt/rqxcdNBJbAxqmic5kdFobdQ8
 a6VY6iylCBM39RjOEGKrTIv/raFcXmp9/tk5kAYhH2SDFz96Oi+VTI5BHStWJ1dj8x/e
 8DlHa4e0wtS7+HueHXSHQAnH5lv1aMa3OlTenZBa+uoRckeO7p6K2aq+s4b4l8WUT72M
 emCCoeTsdzxGEVXn6WBUifJXIjYxJ2ARKjZQkLaH4RBP3Elgz8Wv5Kdc7EfFJxfBikgR
 5RzA==
X-Gm-Message-State: AO0yUKVBAMHhRFLYXh5maJzKLjc72pMt4ViB7+WvZ7K5jWo50zPj5nQ9
 cFfHWhga5dNNddIlkmrdl9Jk432hOtNinQLZUb0=
X-Google-Smtp-Source: AK7set+L+qwFIv/uwm+extZxpVupTYLYJ54DD3h5lIDQ7Xb8iFU2mYJYOuJcOIxVbuwmjwjEYnvDp/PZAV/eDEefaeQ=
X-Received: by 2002:a17:90a:d710:b0:233:bc13:2cbb with SMTP id
 y16-20020a17090ad71000b00233bc132cbbmr2915383pju.39.1676373081859; Tue, 14
 Feb 2023 03:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
 <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
 <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk>
 <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
 <31ccc974-4b01-ae47-9505-626617f07758@denx.de>
 <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
 <dcc28c36-9b09-ea92-be21-665c6cbf35b3@denx.de>
 <c21ee1e2-b92e-0fad-40bf-91cae9e57f48@prevas.dk>
 <1745c43d-06b4-933b-5dbd-50add565828e@kontron.de>
 <c9dc0b2b-8850-6227-163b-85c53c5d72ef@prevas.dk>
 <12d5568f-c12c-970d-0f78-17d6dc7c0c1d@denx.de>
 <6ceb6866-f8a5-072f-3d86-895024fcec79@prevas.dk>
 <CAOMZO5C1oau7+YAbadD=8ERiNSLi_Z1k3VC9HVmT8aVpQF5hiQ@mail.gmail.com>
In-Reply-To: <CAOMZO5C1oau7+YAbadD=8ERiNSLi_Z1k3VC9HVmT8aVpQF5hiQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 14 Feb 2023 08:11:11 -0300
Message-ID: <CAOMZO5AxHbi1w9w244SjYXNjv-P8MDzRvAmnWgYwsVOJ_kqtdQ@mail.gmail.com>
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 matteo.lisi@engicam.com, aford173@gmail.com, dri-devel@lists.freedesktop.org,
 sw0312.kim@samsung.com, linux-imx@nxp.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, kyungmin.park@samsung.com,
 Jagan Teki <jagan@amarulasolutions.com>, andrzej.hajda@intel.com,
 m.szyprowski@samsung.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 14, 2023 at 8:09 AM Fabio Estevam <festevam@gmail.com> wrote:

> Some extra ADV7535 patches were needed. Please check patches 0020-0023
> and see if they help.

Sorry, forgot to put the repo URL:

https://github.com/fabioestevam/meta-imx8mmevk-bsp/tree/kirkstone/recipes-kernel/linux/linux-stable/6.1/imx8mmevk
