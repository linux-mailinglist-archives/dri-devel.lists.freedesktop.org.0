Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCE9912DE6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 21:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70FF10E071;
	Fri, 21 Jun 2024 19:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="bq2XdQse";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F1210E0D6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 19:34:02 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-443586c2091so589651cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 12:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1718998442; x=1719603242;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TcjyGl0poFmJvaQIN/Tb4xXEEBm1p2om5dg/4ZRBoHA=;
 b=bq2XdQse0P0G/i0Njo+03T/uH0mqTNkFDfY4GTzph/re+Ykse7yp0DRVRLGUqvT72k
 6P+KAvpPr7Gcio2Y/F8HL5e+t6hDC1zIsmRo81bZ5yt+++qIJqRg/Xx3JYMWpzMkJ7jM
 /7699QouZHkmOTupGyYPDGwFlQPZZpGT+IEA/pTmjoMf6+fZnM8o57JM95FBVptQvwcP
 oXkKoSw5pFDn0p8lifE4q2PmsIfttxZMlkRyVU7+I+5AmybiGPBpdimbuRJbZ3Y3Ozsv
 tWgnwFm89Wt6dNOBsboULHaC5XekH6TDdtEN/BVLQpYD+JkFjFULKPZFL1ayCK0z+KmI
 8jCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718998442; x=1719603242;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TcjyGl0poFmJvaQIN/Tb4xXEEBm1p2om5dg/4ZRBoHA=;
 b=ETVXwDEEXBO2pyq6RFWCaB1Td5GziH4Luojht2ixaf3klK4vyWHzfEO6/wEsCJNAyf
 sOw8N05E/k/ULzivSkcyChGmcWkSb3TSnojGMA0qpyfP1+AjYqUOtDQPbQciDTlNzLVV
 WjcYek3PjKpxejEaxrfVXckz3r+zk4xfgIJTQlqz/nYK5XL8Ds2DRqaq3YDxC6esxV9l
 VLqAgU61j9cXfp7hhuUsCb+JmW1idzxyT36PTfa+QbbX6KZSu+OX/+hPPSfpBTCc+y2B
 QBN3o7fsJuIdOVQKMf8NxsshazBSdBq5/IupKt4lZpVPiMYwXKd9dbt2F94vfM9G3BcF
 x5yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSRgz0UtYZKc1dDzSBxvLz05Z6SPoDdZD2DtYRBES7pabOxJiRinPOrceEaW81D1MYczxCO3bfeO3bwWKdf4PErmW4dpu67FhBV49ntjTj
X-Gm-Message-State: AOJu0Yzy8qFiBz0L5OC5muCkNV3KUJTywwy9KGIzAZOApBbFOIYbWlvK
 HwIQGwg+j7KUquLVngyg3ymPWu3Qhn+Sqxx61dO99mTCfWZfgU/ZQ1F+aBSrFMcATjKQICsIfaf
 aHnDHekKgVONi1Erqw1qD4Ng/X1N7SvD/tsyp
X-Google-Smtp-Source: AGHT+IHOnCXVNj6jxV8LpXQHq3BlC9ork7/0wY+nUji69T+kI2ZaEuQxzQC3D1JRanjzh53xix7c9zbM8luwO4E45L8=
X-Received: by 2002:ac8:5748:0:b0:444:cdc4:fef5 with SMTP id
 d75a77b69052e-444ce38fbebmr159621cf.27.1718998441772; Fri, 21 Jun 2024
 12:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240620080509.18504-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240620080509.18504-5-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240620080509.18504-5-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Fri, 21 Jun 2024 12:33:49 -0700
Message-ID: <CAD=FV=UjFvi53W2gkfhJTz10ALSsR=E+9ZLCH_8KCr9h5bHSaQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] drm/panel: jd9365da: Add the function of adjusting
 orientation
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, hsinyi@google.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Thu, Jun 20, 2024 at 1:05=E2=80=AFAM Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> @@ -893,6 +901,12 @@ static int jadard_dsi_probe(struct mipi_dsi_device *=
dsi)
>         drm_panel_init(&jadard->panel, dev, &jadard_funcs,
>                        DRM_MODE_CONNECTOR_DSI);
>
> +       ret =3D of_drm_get_panel_orientation(dev->of_node, &jadard->orien=
tation);
> +       if (ret < 0) {
> +               dev_err(dev, "%pOF: failed to get orientation %d\n", dev-=
>of_node, ret);
> +               return ret;
> +       }

nit: use dev_err_probe(). Also no need to include a %pOF, AKA:

if (ret < 0)
  return dev_err_probe(dev, ret, "Failed to get orientation\n");
