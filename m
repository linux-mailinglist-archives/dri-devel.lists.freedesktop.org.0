Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D69C4915478
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 18:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB8710E4FB;
	Mon, 24 Jun 2024 16:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="YtbX9bo8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0206710E27D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 16:40:05 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-44056f72257so1731cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1719247205; x=1719852005;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GZ+xnyCLREi74xq4k4heuccoqe9gphJLidfi9eaePRI=;
 b=YtbX9bo8TqW7J7Mff3L4HU/NM8FAm72dqN0066LN9Aph84fkcK7zVYhaWrxVFIQfH9
 qpbB9AyMPrk2Wui//iW9dYUrLBq+KxrvWJlRobsUfMUFF+JM0iRXqHAaKXgYK5AnXqJU
 FmbD47EMiASGiSDj6Z5eLdQzxXQa0d1Pteg02EeHneXTanxIitkjJ7TRmBHF/4Z6HA1R
 x6Hb48zCCgwIk5W3AHSztN6SAbhfDTSlnsLGQV0RUQiz7NT9A+jygbpse532zcYaXPhO
 hXwlPpQmgZL3TbeBaIQZHjYX5sdVkGjUnClw1B0zwbG630ebWoeE4slhXJWQW+b2yygX
 QPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719247205; x=1719852005;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GZ+xnyCLREi74xq4k4heuccoqe9gphJLidfi9eaePRI=;
 b=s53ubuGbnSFNrvmLoGST+Q9GIvoX508CBZP1Wl5r4k4WPrBSh3r+MbQ25wvgEb3omq
 QaeDYFu+Shr+pOxFy0oK7tPm5mqDOwd0qv9LfbVdbdpGCVDrgajSk0XClu0cNQUvrA2o
 mlGJD4mffZjlaqRXX0YmxiKqpwmVjDzAJznFlXZBLdlCQg1JGPiiJZJfsr0ER17CiLAo
 uEvSBp9C7f7oavwxbs3ZH5y9recKtApzdwWvZJavHjHfXKFFCUUfB4/hk1nkxLTtwUH8
 O7xqI0l8obLN3Mx/1dfQJBRival54xu6a3nut9wbDc3UqrF/hSgPlyEOJmvOpfbTD26b
 9m2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+1RciGeoGPGT5m6TmoRFgldNiDJ/RG8oYh5O/yz2tNvZide8/iMe1i2NJgf6QQ4cGDTH0XpOWJdqg6gOq4pEmNvT71oE9OS5a+O4ANrpw
X-Gm-Message-State: AOJu0Yyk5WY4cWOrwF0lldHn9H+nGeJ7VB2Aavm176F+rqQeBvqwivRO
 I6CO64QEbPHDDIo1VRcgHntjR+pgWS/eLabHkA+lAhqDwx3DhlotyKwpOu8cFYvCQ6Vk7wJjmf4
 nwlTjarFqQkmLqYz2IES/0sf1/iVf//mwg3bW
X-Google-Smtp-Source: AGHT+IFixPe77lWinjbn1l+sNnJv5Ui/C76Vx2CtkIRfQjKNjmI2FCb1bmRnLWcIP8e3ucRsKkrRobHHIY0Ljuz5GjU=
X-Received: by 2002:a05:622a:109:b0:444:a760:55de with SMTP id
 d75a77b69052e-444ce34a3b1mr5027131cf.24.1719247204577; Mon, 24 Jun 2024
 09:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240624141926.5250-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240624141926.5250-4-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240624141926.5250-4-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Mon, 24 Jun 2024 09:39:53 -0700
Message-ID: <CAD=FV=XNS6sq1nuynDqU6gvfVa5pyBzVKPSiboEEYsTbwvV9fQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] drm/panel: panel-jadard-jd9365da-h3: use wrapped
 MIPI DCS functions
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, hsinyi@google.com, jagan@edgeble.ai, 
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

Hi,

On Mon, Jun 24, 2024 at 7:21=E2=80=AFAM Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> +static int radxa_display_8hd_ad002_init_cmds(struct jadard *jadard)
> +{
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D jadard->dsi =
};
> +
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE0, 0x00);

nit: could you convert the hex from UPPERCASE to lowercase in this
patch. As an example, 0xE0 above should be 0xe0.

Other than that nit, this looks OK to me:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
