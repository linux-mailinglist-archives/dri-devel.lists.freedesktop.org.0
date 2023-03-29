Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D66356CED31
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 17:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5D610EB58;
	Wed, 29 Mar 2023 15:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5305210EB58
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 15:42:52 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-54601d90118so144844677b3.12
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 08:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680104571;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=10pB1ZFq83fYs1zuTZu6lxTnqmTWS6Y+MzNSuQ9y+DE=;
 b=nJ7gJHi78lKpN91bz57CNaqm6iaAv8FtXYr3rWlX6HVImjCXQCNUcsf0MqJIi9+/je
 gjNDF35IM1ffoU60VKxE5HQ8qvwp1KBcEdw7D+oh8t5MHaPIVPRAgSZdb68EiFMkGreo
 iKMXVTrIsNONghpJipfVT4py5dLu3IgMD5SYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680104571;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=10pB1ZFq83fYs1zuTZu6lxTnqmTWS6Y+MzNSuQ9y+DE=;
 b=LvNCtChfr+cOZwfCN68LUyTtdlIzaB0lVeh8NGnNhGotjC/iRl2Vymrf+RyVBGBtA6
 Dhmgh26XcymsWdEqiQ17M1upv3xOlg/rXuxe7/4ifEnTL7yZI9i0eK7p1lSzy5hHzBls
 vjz6IaGmqePnyQioZX4xIQsz14/FW3gumtIOImbvhkRfyLkPE2iiWZnx/S2XIKeogIR8
 Tx1uoIbOGmuRvxR3MXMeBzlqC5wq8yESa4nihadxONQeAUWz+G/CkuHMszb5168LFy3B
 EsEVLi+0FJPYe8CSHrY6nDD0IzGtKM4v1JnN+H4IsLHPAX9qCYsGAqAtwWbR3K3tvUP/
 LTXQ==
X-Gm-Message-State: AAQBX9dR2jVVBkVcD1N4oQIbj0drEkSRS/mmkfgynhHofAtrOEgMCJIr
 HMwrYgqCkiNpp/uA3Vc3a9f1bHnslWLh/0guTZehUA==
X-Google-Smtp-Source: AKy350bF9W8wRS9Q25G4IPhRri+HwV58jWEFiVECSTzvsRrArCHQ/I2Nf7fpNz/yR4DEJVi2ndAzEecJM2On8YNE82U=
X-Received: by 2002:a81:ae23:0:b0:53c:6fda:835f with SMTP id
 m35-20020a81ae23000000b0053c6fda835fmr9473072ywh.0.1680104571505; Wed, 29 Mar
 2023 08:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230329144155.699196-1-festevam@gmail.com>
In-Reply-To: <20230329144155.699196-1-festevam@gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 29 Mar 2023 21:12:40 +0530
Message-ID: <CAMty3ZCVgya5P2zKoyZit0ZXEHeEy1haiV4XUtGhDPOxJ2rnWA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: exynos: dsim: Add
 'lane-polarities'
To: Fabio Estevam <festevam@gmail.com>
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
Cc: marex@denx.de, neil.armstrong@linaro.org, Fabio Estevam <festevam@denx.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 29, 2023 at 8:12=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> From: Fabio Estevam <festevam@denx.de>
>
> The Samsung DSIM IP block allows the inversion of the clock and
> data lanes.
>
> Add an optional property called 'lane-polarities' that describes the
> polarities of the MIPI DSI clock and data lanes.
>
> This is property is useful for properly describing the hardware
> when the board designer decided to switch the polarities of the MIPI DSI
> clock and/or data lanes.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
