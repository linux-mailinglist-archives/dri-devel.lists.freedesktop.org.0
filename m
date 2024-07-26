Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EE293CBD5
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 02:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955D010E8E4;
	Fri, 26 Jul 2024 00:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gFdAH1Q8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB6010E8E4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 00:07:06 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-44fea2d40adso663991cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 17:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721952425; x=1722557225; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9mhrx66p4k+0HqBnVFIS3fmt62myrp/Me7feWqvjhdI=;
 b=gFdAH1Q8HxpsTBI+TdZWzBJR4MmY2eONZ4bPZRAma+xLSSduuX3BmE09RRiohOnF29
 4QMvWiLyDUIBBDi2nG0NBkd2dffwOdos85I21N0LVAg3ZUyLpoKCP8weCUxwvQZdz095
 ZXjKRM9oaOIs0KXvPlvQFhKDB5WD4yuLFZxYlyXqyTT1cpoZLtpXtj0szBWvrg152slN
 i+9n6xYXaAcVUhF7N4ypkr7woltksTzV1CUoGizkbayOUo0C4F3SDpI3zduVPBDDCUu4
 55UfY9TEf0hSmveB0doHBM81XyvUeiTpURuLg5HhauTjvAdFSWYe2Wm5xK5XuCKiYvvY
 1C0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721952425; x=1722557225;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9mhrx66p4k+0HqBnVFIS3fmt62myrp/Me7feWqvjhdI=;
 b=oUaGn6XOm3Vqk1WBOlN+GOeZsClOFQ97ThNcZicTuMiMkXxrJjLe3em6bLy+yVOEuh
 1yQWfFPysj5SlG3Bs09HkrZ+nOKOrwujADECYXfgLZkoh655GGQcg9DIOYRiqjyoi81c
 wGjkjWk6cxV+TK1IxbLUvq1CHml+Vg9BvgjTzbCXeHfDj66xeeCSQVXTSZ1n5F8XfHvT
 SyGq6h6ui6ryihVMVxLtujXLkv4i6io/gcBlOInJlOQ0LJPGni4UXoCCeq5RnEZAEr/Q
 +K/Ra+MmN6byxEcg8Qt7otUCmU8hqBrALwgh+9AvbFY50tf03/1AF42K+KnAgGaqYgHq
 QvDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnCyvsgZD7P3m3IJcvE/tpT+b2BOSp/hbsmoeuRCMTQk89XjAHrtVAhsJt3ZL3A3Oipq7kJ833XldWMcQStXciFYSIOCTd6Z4jMCUCFFtD
X-Gm-Message-State: AOJu0Yw5M4murDbGqjfI6egtiMKc9Fx306GG8JT+E1ge2st7bUrpwngR
 6uBfGBTxt5cH3fBjweno4qXAseyRYNs3WdS2g5SwRuT5AgpJGgrX
X-Google-Smtp-Source: AGHT+IGGfUcDRIS2ADeLCH+O/5hJ5jOciW87T8ynnw+FeWzNqY38U4MpJcRIw508BOtTHDbLgyKoBA==
X-Received: by 2002:a05:6214:da3:b0:6b7:a6eb:c343 with SMTP id
 6a1803df08f44-6bb4087082dmr46978076d6.51.1721952425017; 
 Thu, 25 Jul 2024 17:07:05 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fab9639sm11506416d6.103.2024.07.25.17.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 17:07:04 -0700 (PDT)
Date: Thu, 25 Jul 2024 20:07:01 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: mehdi.djait@bootlin.com, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mehdi Djait <mehdi.djait.k@gmail.com>
Subject: Re: [PATCH 0/2] Add driver for Sharp Memory LCD
Message-ID: <vlhicmhpvqkvdbyq2dsgqmofst5a5rjztr3uhp3bwyjhv3kqog@lu5lqtey262n>
References: <20240725004734.644986-1-lanzano.alex@gmail.com>
 <20240725074532.65616a26@windsurf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725074532.65616a26@windsurf>
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

On Thu, Jul 25, 2024 at 07:45:32AM GMT, Thomas Petazzoni wrote:
> Hello Alex,
> 
> On Wed, 24 Jul 2024 20:47:01 -0400
> Alex Lanzano <lanzano.alex@gmail.com> wrote:
> 
> > This patch series add support for the monochrome Sharp Memory LCD
> > panels. This series is based off of the work done by Mehdi Djait.
> 
> Thanks for resuming the effort on this patch series! Since this patch
> series is clearly heavily based on Mehdi's work, wouldn't it make sense
> to preserve Mehdi's authorship for the patches?

Hi! Thanks for the review. 

What would be the best way to go about doing this? I'm guessing appending to
MODULE_AUTHOR and adding a Signed-of-by or Co-Developed-by?
