Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F296D66AB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 17:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB9B10E6DE;
	Tue,  4 Apr 2023 15:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536F610E6DE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 15:03:09 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id f14so10856668oiw.10
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 08:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680620588;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xvMCqRQRf/gGIv7OESh2ryqIvc636JRA//u6AB/lZ4A=;
 b=THjN01mLcxpN6nEW6PKJXdgOD1D4GaYChzH3W5H6niJWUCXWhI7RaAngZIFev3s8Gp
 oHOsZbBavP8a8/hECytyMn551H51eOcqTtRsmO89S0TzyppAHiyoHvtE2eLcRQNWQS+8
 wHitkjaufmYDX+Q7o24Oelk6ywfk9LapLfgWEhzr/FHTieviZolxgEnau83VtmiazUyf
 Zeh18rzvW87PHZy9cqMXBac7CiiFI3oYSdSEQD9WdB3PN8yQSBoFHNOLsZaDD3Y18uEO
 snrCVBXOdZKK0xBp/SHd/mpnsQ6yqCOVhlFdQLPdIyaHUpx69aLHYHC6O0Ki6XvEGkO8
 EVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620588;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xvMCqRQRf/gGIv7OESh2ryqIvc636JRA//u6AB/lZ4A=;
 b=YsXUxPoGaPfDZqBpYZZPuKyYJZF0eN139iYg/55OWUNiM1DSu/xgqKDo3Dbb/aXGty
 Rgqq4THh0zAjNeA6vIEIBIAcRC5M4z/GJOZjtpX/to8TjgmorSl9/bLQPzPaGGnUpnpo
 VNAJl62DKQzgBQ+xhX2sAKGoXscdce1Jke855TXu0rcVVoLTIFeK4fqc0RGSZwf7AO5p
 E5vz+hjBZ3eIykG0GCZ82qNRd9wPIxf/VSg2hdXmVMKx5eSDW4a+kKv3MElNPBuQueWn
 mm08AcPU2MXwKROTR6amX4letKFRep6atNWXsUi9KHcXtJ/rRytlCeLtEd0ngQYXjlIG
 gKeQ==
X-Gm-Message-State: AAQBX9cuMIRAkAsJU75O9NcxFJhwx52uQ19dxUQSanneUqFu7NkpIRsB
 LlCGFz1DLv8lO1D5YdLi8ea++FHTgi6cDpiKwic=
X-Google-Smtp-Source: AKy350YujKRNGsMRUoIBrj18JGfp8lOKGzmP0vrL73jovQXuRFBnIqFrFxusFkVvnVKSVyi/K382RHA1Ks4k7VxPTtw=
X-Received: by 2002:aca:120e:0:b0:387:7fe1:a5 with SMTP id
 14-20020aca120e000000b003877fe100a5mr1057927ois.6.1680620588073; 
 Tue, 04 Apr 2023 08:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200424222740.16259-1-afd@ti.com>
 <CAL_Jsq+4mf6QHX27knoHTXA4vnsC3swuvAH7zK1DpyaV-p_qbw@mail.gmail.com>
 <f46c097a-b2a6-6368-a8a4-e30995a54d17@ti.com>
 <CAH9NwWeZnDEkundm98=KL6xB9bVO3nOkk48xMF-eQnztP4DD4g@mail.gmail.com>
 <99f1da4f-810e-986d-388a-af136ade745e@ti.com>
In-Reply-To: <99f1da4f-810e-986d-388a-af136ade745e@ti.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Tue, 4 Apr 2023 17:02:56 +0200
Message-ID: <CAH9NwWcafkmcZd=5WN_hoJmfkwUJJrewaPnSmCK-izrC3hwKnA@mail.gmail.com>
Subject: Re: [PATCH] misc: sram: Add dma-heap-export reserved SRAM area type
To: Andrew Davis <afd@ti.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > Hi Andrew
> >
> >>
> >>
> >> Okay, will split for v2.
> >>
> >>
> >
> > Was there a follow-up v2 of this patchset? AFAICT this series did not
> > make it into the mainline kernel.
> > Do you have any plans to work on it? If not I would like to help out
> > as we have a use case where we want to
> > use a dma-buf sram exporter.
> >
> >
>
> Sure, I've been keeping it alive in our evil vendor tree, but if
> there is interest upstream now I'll post a v2 and CC you.

That would be great!

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
