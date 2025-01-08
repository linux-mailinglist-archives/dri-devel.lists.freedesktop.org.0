Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6431EA05E8A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 15:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3E010E0E4;
	Wed,  8 Jan 2025 14:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iW+T1Kqa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E244310E12E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 14:27:07 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-54252789365so10624604e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 06:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736346366; x=1736951166; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VzRkQFsbsZb3prYdm8IYnpC6IOEvvGL2fTo7OIg3jSI=;
 b=iW+T1KqatyM/ro/qgcS3X490Z7egNZADwj9bgYdmNSDm31KGBj4Ul4dyDFqieVZFrr
 f4kMsYhgpS4dy671nhQ7IHx5jdEZMoG+xDTbmehbqYJjal0nxteoTix74FHzq8qrfsOv
 PmnsGOKYFL9FqBTNmx8kUaaZ7h01whAaJyA+C5IO/Qvbq24SxoxIaFMH8Pw4me73b0+h
 7U06TC6Hlf0NUgEUP2i47muEdNzg9j38kp6zX0E9lxCVzcHH5LTLmuKCn/0O7FkOr4j4
 2lptOh/GVkI4U9LoUFWELOQkNCooZ/QB5XEXIK1aQEdJ19xnDRNmRWFKJYUf7bZRgsm9
 sn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736346366; x=1736951166;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VzRkQFsbsZb3prYdm8IYnpC6IOEvvGL2fTo7OIg3jSI=;
 b=p+iSzhJjYtqgxisTlXg3ma2tbZSwSdBxzQCyAwuNHHODsRVTLHHrcITFmWaHmWnCwO
 pnc205QH0lUKYyDdynFRaCiHAdq5+igz7FsLzfhzIKjP8LsL2dHr7pv/qMbKEayo2Mg6
 j7dE+hoSdbnAxygu1KJn2n5o8zy5aTuQXBBgu2uynCws/InZvuIQ738BHQEx2//pZmr9
 cgwA5xpXCr+WpxiPUvksEzh/sGkFIwNKaR66ps1sIODS3YxXf0ejpGk3POHvpEPhGXGQ
 vtubHh4KgwRWMynwhjeVgr/Kp2UkhyocSXzukhRJ0g/gefunOFFpYfLOamFTO/eaJHTI
 9ofA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ6kdnJoDcnJ83Ric3x1x0TXAI/vabNaLrdLR4rukA4S4Ja8N8SGOe/8H7m4iu+XDjWL1zxxMTzGU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpVf0EO2bS9ZbMgKRyjHkmLy1GgfTIPwslLSU/oD8RTWOwGiQh
 1AIsKXkWLBCJmKnByRgIo23q9gTeEg/fgp0neYMHZGt65Hvf+jx/qNihaBM7ze/3owVH/axTwA6
 wgcSAdnxmJtsAW9ggfKtqsGq0riY=
X-Gm-Gg: ASbGncu2ufFyWQMuBon7Tz6e74gc00CWJi3ZnUJgJkHfue/k7A2N6D3RQ7xdgAhOxnO
 jpFyM/SiekNvb78EqMIbMk2W5FqwNNW2tIX2/a3eTQcgCCoLbH7JlLi/JCTp7CAN71SYMvQ==
X-Google-Smtp-Source: AGHT+IGS3A8h0Q/PUkaHrm1SeFvYbUscGOt6bkTAr2NyzolQMBSyfrUMesJ48vgLAB/IZNBnRthccsMB5/EPlNVzUcc=
X-Received: by 2002:a05:6512:1150:b0:542:2166:44cb with SMTP id
 2adb3069b0e04-54284815b35mr845905e87.35.1736346365946; Wed, 08 Jan 2025
 06:26:05 -0800 (PST)
MIME-Version: 1.0
References: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
 <20250107094943.518474-3-alexander.stein@ew.tq-group.com>
 <173629198495.2036683.9877314471091548361.robh@kernel.org>
In-Reply-To: <173629198495.2036683.9877314471091548361.robh@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 8 Jan 2025 11:25:54 -0300
X-Gm-Features: AbW1kvYHWbk5Czj-Ab9dHoICLA67HONxWPXgJEt2PMFBPH7OeOl5M6o3MpfGq30
Message-ID: <CAOMZO5DeGn1_i60r7Km40D13f+B+bTk8DndNEJVq4h6HZnnpYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: samsung,
 mipi-dsim: Add imx7d specific compatible
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, imx@lists.linux.dev, 
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 devicetree@vger.kernel.org, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Robert Foss <rfoss@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
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

On Tue, Jan 7, 2025 at 8:21=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:

> Fabio is clearly confused, and I prefer this patch over his. As
> it is probably past the drm-misc cutoff, I applied it to DT tree.

You are right. I am sorry for the confusion.
