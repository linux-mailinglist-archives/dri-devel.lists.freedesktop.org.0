Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1534B93E5B9
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 16:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E3810E184;
	Sun, 28 Jul 2024 14:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UPMZKONQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8714A10E184
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 14:52:36 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-6b97097f7fdso15903566d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 07:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722178355; x=1722783155; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tZp6ohF7fMnFuP0g+iZlmuP4ACp+YqqKbSTvRemgoPQ=;
 b=UPMZKONQSqwz22T8VD0YoddQI6+3ZRJqGvlE3WiV+/XHdsSVNiQ+nMudXZoU0aG78T
 AMFrvbVz+rWxzqUmu/duupIfa++zAFmLVECdFiCDmyhs6kzfegeeRMt0cZ0MN1fIFT+O
 +GkyMtNaimImSp/WoJcCJ7TN1Fc9LKs3rhrO84GoqauulYsazEDJOCejkIMtZeAuCvy2
 mr2HRp4qdL5BSz0UEwaBNB7T5KSvMFBggzzuBb+BvTH5ZIcYvrsbXSXjxPtRlwZGjT8F
 vnf1CKyms8qcj6MQvA/lgsbBZj8ooUMj4AxAmCBs6+im39/3LW1oqQBwwFBXPmmyLNc1
 569Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722178355; x=1722783155;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZp6ohF7fMnFuP0g+iZlmuP4ACp+YqqKbSTvRemgoPQ=;
 b=AzusmNC6BQVFERnQ2hXvihsbq1A1VKD2whPhfWoxO6OAVXYyH6TLYPRs0ndeTGql6u
 uW6hLFuy9iBtVQuK5IUh7awcZs0fu0H7vyQ97LetG93PqRmblXBPbeoIYV0o1SjAL112
 r1GBzQvAMUzQMLuSyKYtfCXAtU1NeDJh2mHCfq/klakSqovKQ4C0PyQbDEd8OXXHqV6D
 Eb/Rgshib10j71+av9k/JjjGz8VESmbHNdJ0DhWddxxDarSNtaPMCbfPCqfUPChJ0EEh
 CpWGs6uIEaqLA0fhjwL/Nt6EBtsXZwayODw/qZB448k39rHl7EGV+gZ/jOm0UT/ljwW1
 Zz3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcG8Tz20mlVZVlY+smg0/fm7NN+0KB4WFsTjvdSVdiB7s6RcBhsYXhqngwucpFDcUJDMc0wPJv9RSV7RoRWCO4Y7DXcWMITj4ss9CR1fiV
X-Gm-Message-State: AOJu0Yw80w98JJNmqdku0DXFPDLgBcARgyt7EmPq3lBPhSxopeMyJZOo
 pGj7oC69DPXasYf0iZd7ogPoWvZ6e+kNi2mNq5xZd8d5N2ICUw/q
X-Google-Smtp-Source: AGHT+IGDB+ttYPFx4TQUrCgIQJWbbDjmtLOnZcLk00fPOQgxgWq12138PSalkJM2nTycdUiZK23bLQ==
X-Received: by 2002:a05:622a:1791:b0:44f:fde6:7fad with SMTP id
 d75a77b69052e-45004f2a79fmr85331251cf.43.1722178355232; 
 Sun, 28 Jul 2024 07:52:35 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44fe8200640sm35289981cf.71.2024.07.28.07.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jul 2024 07:52:34 -0700 (PDT)
Date: Sun, 28 Jul 2024 10:52:31 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mehdi.djait@bootlin.com, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Message-ID: <3wgrdnpwmss3lpevxmf574pqt4rwttdwadsm6tqaobouw3akor@v6z76j5yzdmu>
References: <20240725004734.644986-1-lanzano.alex@gmail.com>
 <20240725004734.644986-2-lanzano.alex@gmail.com>
 <c7bf08aa-e7a0-4b60-b9fe-b43215ce3fb9@kernel.org>
 <7zpp4ebzj5xk3wbbpt7l5xnhqg3i52mdjhn3grmn562mres4k5@a3g2xxftk2td>
 <2d28134f-63d0-498c-8539-1cf2d0f1d68d@kernel.org>
 <ko6kavj46gm5py3vtfnt6zdka5ar2zigmpg72kt4zr6f3tbhwr@nbbhn726oo36>
 <8edc9bd6-2130-44aa-aeaf-cfb5ca43ca0f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8edc9bd6-2130-44aa-aeaf-cfb5ca43ca0f@kernel.org>
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

On Sun, Jul 28, 2024 at 04:43:42PM GMT, Krzysztof Kozlowski wrote:
> On 28/07/2024 14:56, Alex Lanzano wrote:
> >>>>> +
> >>>>> +  spi-cs-high: true
> >>>>
> >>>> You can drop it.
> >>>>
> >>>
> >>> This is a required property in order for the display to function correctly.
> >>> But I have no issues removing it if there's a better place to document it.
> >>
> >> The sharp LCD device or the board (e.g. via some inversion)?
> >>
> > 
> > The sharp LCD device itself.
> > 
> > https://cdn.sparkfun.com/assets/d/e/8/9/7/LS013B7DH03_datasheet.pdf
> > Page 16 of the PDF below shows the timing chart for it if interested
> 
> OK, so you enforce chip select as always high and then someone comes
> with a board which has a inversion and expect the SoC to drive it low,
> as usually? In such system this would not work, would it?
> 
> IOW, I think this is the first case where you require specific CS high
> and this should make you think why...

Ahh I see what you mean! I'll remove it.

Best regard,
Alex
