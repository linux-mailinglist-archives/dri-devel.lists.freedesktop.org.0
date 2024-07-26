Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6469193CC1E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 02:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF9110E8F0;
	Fri, 26 Jul 2024 00:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nYMOuptB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAD710E8F0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 00:36:17 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-7a1d0ad7113so10737785a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 17:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721954176; x=1722558976; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=L291mgIc5iI7OK8XleK9YhT1xWPCs2ak74jgRyXyYfQ=;
 b=nYMOuptB1FDyA/qnQvXyxxhZf6iBWBTeV0VOwqPQElcTfBS7WwetpeATgkUXUQ9pZc
 CY9m3WvfRm2owOPUV5MtfS9BrSIbuSHxb1z/9KnmhnsNvturBsZ4QHfrbxAbBhF3WyAB
 5mM9NrfhB6eH8lfFXR2GYKDHlf6C3hwxOdhdtjOpG9miSJsKEXhMNX98uGQCilhmE1uc
 0ZxhSjEf64sngAEssrDhfEU/4keWkMekTiZy8mNu8wDZ7S9O7oUfh2X/kY/UKj42GsGT
 LZrzp5naowDr6IVoQlmqwjSvtATdzUblQbTSX2TJEStmY68AG8R3LLSRUbvZVjg+Yhb/
 5rGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721954176; x=1722558976;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L291mgIc5iI7OK8XleK9YhT1xWPCs2ak74jgRyXyYfQ=;
 b=BgaIhCwFHA5T6nhsMXHs54PiZQVtlNByv3YyR2Tmur6hewhjzl0+ItjO7XoDgYse0I
 CAo+LTSQFMR7nXTINz1l1mXJ9zXdaXyTdxxGA8i8n0XZiXXaQBOWmxv7mawBtuaeYuI1
 YTCbR/+emsF9xhcoloioagdpgCgCTknc3ObeD51Ww2CbmbXBNsPquaMdkY+sdMZ1sf/t
 P1dRkUB6shdSb5H/kuQRARUZe9QUlptdpELAbVqyEa/qGfDE/FMWk6R0M4ObUDCpW7Wi
 xdm5xcATqzF6xF9bjFgr9gw2hbMboMJ6GXTAaf96WwtIbE71m8pbHHaXOrX6LX4jlB1h
 CbhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZbB5LQkbxYqajQ+CNZYdYEa8juxTbkV5oI8gHWnPu3KPxhWc8x2l2yyPcdlSDj+DhonZfOZRUsRm/OfG+4yKTCBBpYeEpCWLFFzftq9Dn
X-Gm-Message-State: AOJu0YxHV0ifjQDajTETYab0cIoZx+tTPuFAqtjjsAwOd+nC5aNtrWuy
 83qQKlvfqmuthJ3rUuDXgSh5oSzv1+/MrpX885Ca3Pc9Th6FQEfx
X-Google-Smtp-Source: AGHT+IFL80A/AmlvrAcmTqfRsjx33wSR9irZJm5WasknKgEYW/EaDmsMs7vzmUn3r8rpCSLBNxu7Lg==
X-Received: by 2002:a05:620a:d93:b0:79d:6276:927a with SMTP id
 af79cd13be357-7a1d44b593emr607077085a.22.1721954176418; 
 Thu, 25 Jul 2024 17:36:16 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1d7444d42sm129040985a.99.2024.07.25.17.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 17:36:15 -0700 (PDT)
Date: Thu, 25 Jul 2024 20:36:13 -0400
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
Message-ID: <li2dwzrd7oqjc4rmkrimicmbkzh46grpt2pwjbidsksm4xbtx7@ifc3ir4ineo5>
References: <20240725004734.644986-1-lanzano.alex@gmail.com>
 <20240725004734.644986-2-lanzano.alex@gmail.com>
 <b358e743-d264-4c18-95a3-393b9d20a87c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b358e743-d264-4c18-95a3-393b9d20a87c@kernel.org>
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

On Thu, Jul 25, 2024 at 08:18:44AM GMT, Krzysztof Kozlowski wrote:
> On 25/07/2024 02:47, Alex Lanzano wrote:
> > Add device tree bindings for the monochrome Sharp Memory LCD
> > 
> > Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> > ---
> >  .../bindings/display/sharp,sharp-memory.yaml  | 97 +++++++++++++++++++
> >  include/dt-bindings/display/sharp-memory.h    |  9 ++
> >  2 files changed, 106 insertions(+)
> 
> BTW, look at your original binding:
> https://lore.kernel.org/dri-devel/2a7c51b6e619c02ec175a5c219b0a0fd7a24499d.1701267411.git.mehdi.djait@bootlin.com/
> 
> Why did you decide to introduce mistakes? Eg. dropping all $refs?
> 
> And finally look at the comment:
> https://lore.kernel.org/dri-devel/5dbdf7bd-cfa3-492b-a0a3-fdc323cf11f8@linaro.org/
> You just ignored it completely....
> 
> Best regards,
> Krzysztof
> 

Will fix in V2.

Best regards,
Alex
