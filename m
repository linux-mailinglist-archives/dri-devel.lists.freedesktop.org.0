Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFBB8751F4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 15:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E3F10F475;
	Thu,  7 Mar 2024 14:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="zP7D+7Me";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F09F10F475
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 14:36:10 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-428405a0205so295151cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 06:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709822169; x=1710426969;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t6cjTaPA3JGO0htGi6Pjtb9XftoGgbKI0J0q9NK3+w4=;
 b=zP7D+7Mepc/aT6jBKbsJ/kvirb0XzfOdjCsAThnIqH1hlajCPVVuw8hW0ZuVhwaKPw
 W735QGdyif8lQriT2raWc6ZUPk3XkRj7x//awzMjdp5O6y5hBLR1hPnbTYHF8oiCyMQz
 PwxCSotwKF6EqC91X14RUHGzuAyqYD7Ec74tZmL8mDowcK1nl7rIPgrYyzrhgJ1VY2Ny
 pn3RVDNY/v/JDfqWIxbh2HZ3hoD4OqQptMFbC+Bq1ez2o2a5435Vfd887npSZWpF9Fw5
 3yGmiGP0QOb1xMcRZ3qfeyMKCF0Stj0XzKker+9bNb9qFzQBSRXo+zZym1wxnUQwIoys
 MPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709822169; x=1710426969;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t6cjTaPA3JGO0htGi6Pjtb9XftoGgbKI0J0q9NK3+w4=;
 b=liyjdSH0CYJ032cPC1Rv5Ms5wA3xqngTSMsfFIqhf2vx3ykSk4vq35/707Ll0sJ/RR
 Vqs40sujJPOkFJxAdh9v2UE3wma1zmEom1O6yTZ79i3rlzi2VGqaYe5GZNwKndkU4/PW
 d3VLJBqZBB6CtskFF8JZC8XWSzMDO2huzkbg4PvgCZOxmx1S3R0WKGHaVvxQ4D/6OcZb
 ckfbLxJAi9qTpI03l6SOd5WMBBzev7JETLW5yBRqLclncjG7fLKI+KIn1F+GQtv3vbTE
 Z7GU28o2pcLTutvHr/Hw1KPqwSoN0iMWqRrsGqscBmxBe2NEj7okG/LCqwk5NR9+B9zT
 PjaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsAQ5RCBvuuNRG+T6KaeL2kgno2HJwN7SZg51r5hegHonPEJ9NVh1OqMnsQJ2yXI2E1PlPW07uj5Tsksq7mVxsuAPiniRNv1bumMc8FEf/
X-Gm-Message-State: AOJu0Yxi0ibBLqCWhbgsDAqPG78dqeIBS+ZixkpYNL2wNxeRA0aQoaG6
 42j1n11K43cLzgqkBUBW3nNlLh/zbugrZS4XMumZazpZPcxDTg5ffvZfDirmy1dGzlOBdbLE54+
 C1u7XKgMmPq7bsfKcE3j/QruOF1kXceYw1xkh
X-Google-Smtp-Source: AGHT+IFTbUYTdln+HN5bHEZragkgBfryVrLW7yxjMefRnXhcn7EKiTuuupTzwNyjjzX/gNPojrKZtcxTSe69tmWWdIE=
X-Received: by 2002:a05:622a:1c8:b0:42f:a3c:2d4e with SMTP id
 t8-20020a05622a01c800b0042f0a3c2d4emr266044qtw.15.1709822168971; Thu, 07 Mar
 2024 06:36:08 -0800 (PST)
MIME-Version: 1.0
References: <20240307094433.3440431-1-xuxinxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240307094433.3440431-1-xuxinxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Thu, 7 Mar 2024 06:35:53 -0800
Message-ID: <CAD=FV=U8wdT_5k-yrLVpmh=q4k18LntqujK7Mw88TdweBXCPgg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add several generic edp panels
To: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 hsinyi@google.com, dri-devel@lists.freedesktop.org, 
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

On Thu, Mar 7, 2024 at 1:44=E2=80=AFAM Xuxin Xiong
<xuxinxiong@huaqin.corp-partner.google.com> wrote:
>
> Add support for the following 2 panels:
> 1. BOE NT116WHM-N44
> 2. CMN N116BCA-EA1
>
> Signed-off-by: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 2 ++
>  1 file changed, 2 insertions(+)

The patch looks OK, but please resend with a more unique subject. I
think we've already landed more than one patch with the subject "Add
several generic edp panels". Since this is just two panels, maybe just

drm/panel-edp: Add BOE NT116WHM-N44 and CMN N116BCA-EA1

-Doug
