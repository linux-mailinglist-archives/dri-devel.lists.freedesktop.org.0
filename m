Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1DA97EC89
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 15:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285C810E19B;
	Mon, 23 Sep 2024 13:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Qo7oYnD0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDA010E188
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 13:44:11 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2f7528f4658so37517161fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 06:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727099050; x=1727703850; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LnxbStqMmnuqZto92aGKrrzBBkrNE1dtBY8RqcATvcA=;
 b=Qo7oYnD0hnHVYovq4on1bQ0I7TpQEkM75/BKyGrzJwh8Gqz8YyR2HUvyLInWu6uV/w
 EFzlJ7UMBZ3wZrNACiTQ5g9LU2EmnMPEMVm5qq8mNmMde/bILAa1wypirlpj0bKjHYAm
 BYJyLaCIAH3HJQCcFFS9SS9ij//QCLSvqcBfTK+mx5VgZBFFSH75aWSNNdZijMXAI9jm
 BwZnX5ORHo6h2c7nH9rx5vK/vlvgxjFrYXmgi1LQsVrBucxUSvq1xfEkgwRnaB/Xwkme
 wBePh1v0quvEX1gaW3GTWZ3FxGlmDg6sJ8f9HYhAnf94Bi1Doe4V7c02ptOWH2TzMSO1
 oJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727099050; x=1727703850;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LnxbStqMmnuqZto92aGKrrzBBkrNE1dtBY8RqcATvcA=;
 b=dhvJ9ykEvb2Zlyakpyj5nKBeBHbEE8nstAjwGbv7ny1Xd8Uh0T17lgZa/e5y6jcXuG
 TxmZ9tX56LZERfWcAv9yDR+all+q+YnFgq3S9AX8v0khnXZFES+fKuf4L4VXlMY9nkvR
 JmlXHIol7fAvbmh5hxtFgmgIMT16p4rrdrPJlqif/JmpOrX1i1oDuw9VQe2ft7YuCQBM
 rRRoiUf5tk9wjc+k81tMq1MVGiR2wkHFufk2KEQ1cpSaYoDuTaxm2mI2dLKAAxCR9+GV
 roYgjuZYL4t9S0h2muuSNejAPje7P4zTv3fA1Ugz0MX8pR97YEWkcYPdvL60Sb11fml/
 7mNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfGkrIHl3T6H9xUMrf3L2YiyfYLolekwyJsoUSTjg7O3+GbAxcLLcOfXSI1EsKN9FRrM9i05Qek/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOfG5u+80CImuSmO8Z1JuOu20GJnbJryJvXxfv5RLmVLFpPq3J
 mvoKnuGuC3kV6ojftNhCEgYcNGCjCs7Wt+7R1Zqqmb2OGk0lY5WSSJaYyikperk=
X-Google-Smtp-Source: AGHT+IHOacohnpUeawQEYAxzHpTmZQcAHpd2SWiHRgZKHmRZeclY06+UgBZ9HRZSZwZbq/XrXMqu9A==
X-Received: by 2002:a2e:611a:0:b0:2f3:ee44:c6de with SMTP id
 38308e7fff4ca-2f7cb3243dbmr47758351fa.27.1727099049065; 
 Mon, 23 Sep 2024 06:44:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d2e1e04sm29142321fa.28.2024.09.23.06.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 06:44:08 -0700 (PDT)
Date: Mon, 23 Sep 2024 16:44:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, dianders@chromium.org, hsinyi@google.com, 
 awarnecke002@hotmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] drm/panel: boe-th101mb31ig002: Modify Starry
 panel timing
Message-ID: <z3wtynas7udnrd2pus3o4lcyz5xkz4csrjyhrrnjkdbuys7ysp@5mmxpxunil22>
References: <20240915080830.11318-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240915080830.11318-3-lvzhaoxiong@huaqin.corp-partner.google.com>
 <CAA8EJpqC5tQ45gj8-0bDutinCs7CoxiQVL1EAzwDK9RJTXYMcQ@mail.gmail.com>
 <CA+6=WdR6+nh9e2HCuCVdR6uw3vuJoWfKCG4gPjJMp9db+Quimw@mail.gmail.com>
 <ovmleeivshtixncuxwv3dink6l4fi242rcspklicl3u4qp73rx@km3nu4co4hen>
 <CA+6=WdRMihx1f-kDYX-RngkQ-kDa2vLGSFU30C75jdFXGz88VQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+6=WdRMihx1f-kDYX-RngkQ-kDa2vLGSFU30C75jdFXGz88VQ@mail.gmail.com>
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

On Mon, Sep 23, 2024 at 09:38:59PM GMT, zhaoxiong lv wrote:
> On Mon, Sep 23, 2024 at 8:07 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, Sep 23, 2024 at 05:22:20PM GMT, zhaoxiong lv wrote:
> > > On Mon, Sep 16, 2024 at 1:15 PM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > Same comment as the one that I've provided to the other patch, plus:
> > > >
> > > > On Sun, 15 Sept 2024 at 10:11, Zhaoxiong Lv
> > > > <lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
> > > > >
> > > > > In order to meet the timing, remove the delay between "backlight off"
> > > > > and "display off", and reduce the delay between "display_off" and
> > > > > "enter_sleep"
> > > >
> > > > Separate commit, separate _justification_. Why, not what.
> > > >
> > > > >
> > > > > Removing variables: display_off_to_enter_sleep_delay_ms
> > > >
> > > > This phrase is useless.
> > > >
> > > hi Dmitry
> > >
> > > As in another patch reply, in order to solve a black screen problem,
> > > the delay is reduced.
> > > The panel spec:
> > > 1. https://github.com/Vme5o/power-on-off-sequential
> >
> > It should be described in the commit message(s). You have removed one
> > delay and added another one. Is that a single fix or two separate fixes?
> hi Dmitry
> We only modify one of the drivers (starry), and the other driver
> (boe_th101mb31ig002) is just to keep the original value.

Well, the question was about fixes, not about the drivers.

-- 
With best wishes
Dmitry
