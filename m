Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2594B70BED0
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 14:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A3D10E30A;
	Mon, 22 May 2023 12:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6F110E30A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 12:53:44 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-24de62e16bcso176881a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 05:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684760023; x=1687352023;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7nqbFE0zl6OhqCaZYGP4sDCZVp9m/hk9F5c1BkbaT0Y=;
 b=HgXUrw1FpLNRfMsXpo2k3IbEvxB3ESGqAWx4nwjpcCgjt4tjYTjay5KpWZvhCMycN/
 Sey1lZ06CdNN0u9u9fDA+a8s+qTCKV/KlI/Bm7p8GB18HmfiAHRxLsMVUqE8f+GeO2bj
 3aDhjIcMWYZvu/M+FdigMpTo3gx9xzvAIBCYFTUBGCB+BGeR3RXkpip6q6yOuzKzBA0p
 C5a4L2TJ5uveVZlmd+aYiPhVfq/H2DprOG27kV79XGJNOx8pDOPhiRSrQyI6549/hIQ9
 ez+4l0Ki858Jum1MTGZfZWHOIavw/gcXlD+teekyx1jIhJkgN8ludaQuPirXHkD/Vjxc
 NfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684760023; x=1687352023;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7nqbFE0zl6OhqCaZYGP4sDCZVp9m/hk9F5c1BkbaT0Y=;
 b=aLmPuLNpFw39EHj1OXBbAHq6Ki0Bb0tocCzxb+cBdna8uNkiTuogAtgdTuDXppr4PS
 I4On6EmBbpb2SAP9GHgLRzTlWAiPh94eLJumXL7HJWUtWdtmIifB6lt5vaTOb6Zn4dWu
 3BJJ7eYTBpVXxJBNG72K96lzuJ+HZn51gTrjXIF+HzvnpNiKEHK5AwMKt9y6e95mNNOr
 R6OT/a20EGCIv9rqpNUsz2Bgv3kBFjzleN8y0RWGUYabGKtvHxrVhbirHZETcczqf+pe
 WqbUse6dp6jlY7bL8SgMEpcPkm48C9sdbTZr0lt/Q5PSwWLhbDm9QDKlANq0C0/+Njyt
 o5uA==
X-Gm-Message-State: AC+VfDyxbLCeWiQtkyOEcGv+txOd6D6ug/XEbR1gcM86X+qlMA/6Anq/
 QMLEeVuvd5ZETOVg96sMJ67kmQ6/U2cw+qqTQVM=
X-Google-Smtp-Source: ACHHUZ5sAJxA+g7SI0XZspfhQNNVMPT09vkzrnxuPOyuY3GKvs3jNxCzXLqXYcgP3BzrkyQ25n9wIIFzMAjrAC0W4nQ=
X-Received: by 2002:a17:90b:4b01:b0:23b:4bce:97de with SMTP id
 lx1-20020a17090b4b0100b0023b4bce97demr12004733pjb.4.1684760023337; Mon, 22
 May 2023 05:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230514114625.98372-1-festevam@gmail.com>
 <a6e549e3-a898-c7b2-1c72-4c6fa2866388@linaro.org>
In-Reply-To: <a6e549e3-a898-c7b2-1c72-4c6fa2866388@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 22 May 2023 09:53:34 -0300
Message-ID: <CAOMZO5BTAPPs+KsW7+GnBTJf1dLMKuAzZa-HRXtQ+ZTWz+EOxw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: samsung,
 mipi-dsim: Add 'lane-polarities'
To: neil.armstrong@linaro.org
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
Cc: marex@denx.de, devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 jagan@amarulasolutions.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Sun, May 14, 2023 at 9:29=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 14/05/2023 13:46, Fabio Estevam wrote:
> > From: Fabio Estevam <festevam@denx.de>
> >
> > The Samsung DSIM IP block allows the inversion of the clock and
> > data lanes.
> >
> > Add an optional property called 'lane-polarities' that describes the
> > polarities of the MIPI DSI clock and data lanes.
>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Could you please apply this series?

Thanks
