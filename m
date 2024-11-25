Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6F59D934C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 09:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6E310E7DD;
	Tue, 26 Nov 2024 08:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YFE+Itn7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7B010E650
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 13:14:59 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e333af0f528so3903936276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 05:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732540499; x=1733145299; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=29eqaOcblHE7fnrH+/9B8++CMwboxE8T+PhkUkEFlJM=;
 b=YFE+Itn72qrTeUNpze7PI3oF8nnxswp1dqh11xN8p2hZnqpcEKYB4uFhZTJOC6roqL
 6C8nMWOfce/9DKvfMo8Nl8pqWTfBJ4Vr0MGHA5dnuR429E4v05sSHW+ZJJiIT2XhV51X
 4DCxe+o49xaXf5uuU+AveHjjJLzLiWi1aEnvHb4HGsSCEgJQ4WiS+HFymAI926onRh14
 yC2cWFsQqA31s352bZvVLykbaPwLxJaGzICa3GqVDEQUa10uO0epPGGaP8Avb6DhIS4t
 eN3BcNOee2nDbW3nRs07SrXALVNBwr1895s3q4kHpcCNk94fmt+3wLNq6RGha3wGQ12Q
 ixqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732540499; x=1733145299;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=29eqaOcblHE7fnrH+/9B8++CMwboxE8T+PhkUkEFlJM=;
 b=nk+0fGq8vREh0U3b4UnkZcWwSNpGnLFMRK5wcBeUviaFvQ4i/m2i7LzW5N4O6UTUTj
 Wpa7XtyAyhyf8zJWdCIwXtYuVe2u5Monu0ULarnRVtj7tNdsIJMvI7tnjGUqpF9/eIC9
 Kr3QqAg86AkKKGP4aBBv0+h2sJHP5QL9ffYzpSGKLs1oR8RifaouefgHVImno0NZ+/IR
 PaqyJEXKjuLS6163DvR2qLA96cMjPslYkQzh2dWZJswJGMGam47pPQWTGHE8YBOD/GzV
 vxmI+y6kufxIFixaTHXhrsu+REDBYNzO06TfIJYNd84dJlp9F78OTQNNp5KfNNctGM3a
 M8kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0glGa1DcoKjvYcZo6krvkAp9YkrW4fBIUwElQJC1Hreo96Dt9wDTMNo4T5GAnz1V1zRsMOwhNewI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlZhE4sBZYRhM0EsX04bsDQgjmvQtjYp0DzUci4GTvUQXT6dXc
 CQx0Roy62SRsRyMe7c1FydyFI8x10xRsFdvTme6tqW3eBKLOGkRX1M2mdscqnZfOfSr14pUtj/x
 o6OUrxzjdIvmGquryXTYgA6dqWbs=
X-Gm-Gg: ASbGnctjDCZFp1DRIFi3f9XAqfjnQJz6MDfHDN7QNnSBEpU2KwPLEOXUn15Jxn+oO1w
 zVz1tIBgbERUPRIQZRUUYERwaJTzu6uwL
X-Google-Smtp-Source: AGHT+IGfaRNCO8ZfhjsTKNxOcvugz+C7g7ey2hBA5+ko6id9//Gtggy/7MbHGZufCHhEZf6fX8TjG/HrfvyCxyamoGU=
X-Received: by 2002:a05:6902:e0f:b0:e2b:d131:f293 with SMTP id
 3f1490d57ef6-e38f8c09892mr11476595276.51.1732540498735; Mon, 25 Nov 2024
 05:14:58 -0800 (PST)
MIME-Version: 1.0
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
 <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org>
 <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
 <c6b0273f-16f3-4469-a4b8-9564f7355400@linaro.org>
In-Reply-To: <c6b0273f-16f3-4469-a4b8-9564f7355400@linaro.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Mon, 25 Nov 2024 14:14:47 +0100
Message-ID: <CAMT+MTS3Nmy=RzsE4wUf=jHBsu8ghyyqpXWPyB8qoR+W3EUscw@mail.gmail.com>
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
To: neil.armstrong@linaro.org
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:26:46 +0000
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

On Mon, 25 Nov 2024 at 13:57, <neil.armstrong@linaro.org> wrote:
>
> On 25/11/2024 12:24, Sasha Finkelstein wrote:
> > On Mon, 25 Nov 2024 at 09:50, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >>
> >> So this controller only supports a single mode ???????
> >>
> > Most likely. On all devices it is connected to a single built-in display.
> >
> > Ack on all other changes, will be fixed for v2.
>
> OK, so instead make the panel driver return this single mode
> and from the display driver just filter out anything that's
> not ADP_SCREEN_VSIZE & ADP_SCREEN_HSIZE.

Not sure i follow, you want the mode hardcoded in the panel driver
and the controller driver to fetch and return that?
