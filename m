Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3305D78B737
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 20:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD1C10E08F;
	Mon, 28 Aug 2023 18:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31DB10E08F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 18:26:37 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2690803a368so821480a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 11:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693247197; x=1693851997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FiPV4G5iHAtAG4UvFP/AL0UjoI+7fgafbUPgIedNHeY=;
 b=hZRyflvdsgVf7Z/jfpA1eH6omfmqrfbtnaUVRqGynac978QClZRwXdwM5S4YzNbiIx
 9CuNrESpSwwG3hBb4UCMzoYqjIBgnNl1s6SbU1GwRBplRSyLaOZLw3dC9iX0nCAQw1hL
 k7AtYHIcp7Zm+ZfR1FIen1P1Rk1vve+N0dQPPNI3oAOmhUvm4q6SVlqSmYZq1qkl3pKF
 mZOmBbbMaDjimrVgM7vOBkt77dWEM2QPZM2FpLtFFBOCvM5lkKE0qANOGCzzYDVqWVZe
 BqDp/50Hlo3+4wMOD61LqQFmFhf2oiCx7JKlGUBiHS6SuWPoH7pcTzP2nPv1mumg+m5W
 d+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693247197; x=1693851997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FiPV4G5iHAtAG4UvFP/AL0UjoI+7fgafbUPgIedNHeY=;
 b=T5WWMInMqwv/CExZrc6m796KgguQa+wku0A/K8Ea7vR2P7K2kHydUPCiBiXl+1Swqh
 hS9H3QQusBLD3H8p4uptpMsR8jVAqUeSc4yaeCgp7oBrC/E3hK/0FamQrrmB7P3VOX+f
 LE/FQPw9AZn3zRvLoFL+MQu2bTTIvKXAJm8BrX2t31XGSOQkjkw/A8VXG1tO4k7sEQhv
 ePCvVwiCLNlwFZPcMVsZb5r8AwZOWaWJ3bCFwUs3y4q5g7TmVk1BW2N4kshX5anrLg+x
 qX8QnumLU6B/wa5bt20bgAW+/ek7SdItjPoJMhZV6Gqx6WbocWhKtGx0MOTXjyyLgbxa
 bVFA==
X-Gm-Message-State: AOJu0Yy9QXI71lr9Mx1uPclDErMG5YOJECVF5a/dNh0ogevRb/ZT95u6
 TKRd6vhpxZ2QVSbsiHLT8jtF/Cp0mNdOiyU9tJo=
X-Google-Smtp-Source: AGHT+IGoMCQugWsIfzxKXbeAuTWuckm9aMkH0QVvfSGDqsCLi/h7IPshGXj6QQLYt0zErVLqJGKelTlnx9A0D0AYI8w=
X-Received: by 2002:a17:90a:680e:b0:26d:2635:5a7c with SMTP id
 p14-20020a17090a680e00b0026d26355a7cmr24357519pjj.2.1693247197185; Mon, 28
 Aug 2023 11:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <20230818-samsung-dsim-v1-4-b39716db6b7a@pengutronix.de>
In-Reply-To: <20230818-samsung-dsim-v1-4-b39716db6b7a@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 28 Aug 2023 15:26:25 -0300
Message-ID: <CAOMZO5AFEDMT1de2O2sUUuw8E0ZRCyD4QVVCKxAtfRaisU5gVw@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/bridge: samsung-dsim: adjust porches by rounding
 up
To: Michael Tretter <m.tretter@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael,

On Mon, Aug 28, 2023 at 12:59=E2=80=AFPM Michael Tretter
<m.tretter@pengutronix.de> wrote:
>
> The porches must be rounded up to make the samsung-dsim work.

The commit log could be improved here.

The way it is written gives the impression that samsung-dsim does not
work currently.
