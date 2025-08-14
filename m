Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB310B2633A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 12:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12EC10E867;
	Thu, 14 Aug 2025 10:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PSWtVhXX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A978E10E867
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 10:48:37 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-45a1b0cd668so3760955e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 03:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755168516; x=1755773316; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Bx3TLXqBYw25yeKL23bBB3cn7ttnh+0Nz11O8E+7Gi4=;
 b=PSWtVhXXg/p8BVY1Fn0VhrFotPsJm8djc9ofT1jPWD7BrCrWxmQJ3HJIR6MEECRIfX
 lpVrtIt4Pw+MyRCVCQ6V+BOk5VrpuYCG5MtTtfeEPFKtUE40RDdcot0D50j2//gZiKPk
 Bv0WBOQjTXTP0isrMK6Dvv2h/5WabOqUvZGrTFwopWIQy/c1oDCFeX/+MRRB4Rtw4mB5
 aD/wATuipp06ckeeEkGVMUh0MinRoVxmHcf3ljMlD+WRDYjvaHNbSyBU7V7X93Y3EBzq
 +G8y69D1HA/8dW5Fv9gTsru6JWfLa4PX8V2Bt/3/lwf9oCT1c0veG32Ls86XCHGFtc6/
 PNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755168516; x=1755773316;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bx3TLXqBYw25yeKL23bBB3cn7ttnh+0Nz11O8E+7Gi4=;
 b=ushVGX5ibUybgLnti7clMa2PWbxh0ACwtd9cj/+QUcgy34C86zUofYXMfIMYqXTvHJ
 pop+wgbxD7i61s5YceMezF2by+oig46UCdK625Oe8bPm6+Ab58X3T+qwEU7ZRDkAx1Vj
 EiRBGY+0+oh/ksndiQotyDdfcfZUiLX/ooQnSnBO/qHrOEOrAfYtce3K9jQ0xa7yvsV+
 SfhswI78kfmK1X+w102HSlJEbabdU82kKwNoQbA3BLq4Gx2LKjI9ePjKDA0J8zcA1+WE
 l2MYOYLuscaP2GuA3w/edo3whXN4XYyeOd3Qj5dEG6QcNu/nwlmhxBcQAgkTcDAUN4e9
 /Vsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5ZKUG/dx7yp20na45u5ktGLpZJwRHORjo54ErSpx9uVZZYjQ2KCi9ufi6b1Cx8dzsyJ8PqVGhWW8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzB6THtLxJyG52k2+etbylSitS/vbnXsJ+dCO66ieHxY8fcwWTj
 qEHF7eegQe0ydJOWJDO8icaz8SAqdjQPuAB4okGh23yYVIK6rVJAy+Fl
X-Gm-Gg: ASbGncuAn34PiTBtJeUdUsoqFf7UN450aAFgYHj+bjI+XLUd+4j9AiXDOq/dEY+LgJ1
 5xCBGiPolzpXBFj5MQH+2OJ5aYVouyTvvScbw2uO7cOelgejsZORGQuRQAaG/GxJQ4xccIiOreD
 NXCmBGvGe9BeQ5DrG4+a/XtYElSlSWHDm63XU9dQBFRHlu41pbDx0NS8AM/Fbz6ofEw+qWl2uFk
 0R7dXt/x6pQRoFQ7QEkzWg+zDtRXuOlIOwMdMlDaMFmppc85vMQfRDukMXBpyY6mpd7kuMKg6rr
 59CVfIWRz1rl7L4w3TBsn5mot12/MecR0l/9CO12k3+i/CpzqiGEheQbBthp+7EdbaHMmQmS68V
 TUYJj5NNawi96x6fRlZ4=
X-Google-Smtp-Source: AGHT+IHUSrx9o55tnuafu0iaeaUk7fJBlAIEsurRqxxZfH/C/pGJWTRbXbtYKqzH3DXCEt3LQch0Ag==
X-Received: by 2002:a05:600c:3b1a:b0:459:e440:61c7 with SMTP id
 5b1f17b1804b1-45a1b66a643mr23116765e9.31.1755168515763; 
 Thu, 14 Aug 2025 03:48:35 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8f5d7deaasm29741838f8f.65.2025.08.14.03.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 03:48:35 -0700 (PDT)
Date: Thu, 14 Aug 2025 12:48:33 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, hamohammed.sa@gmail.com,
 simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vkms: Assert if vkms_config_create_*() fails
Message-ID: <aJ2_Adfr-ZC9tEpy@fedora>
References: <20250811101529.150716-1-jose.exposito89@gmail.com>
 <91587a35-f884-46ad-9869-126d3efbfc61@bootlin.com>
 <aJr92bN5iQnIzTbP@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJr92bN5iQnIzTbP@stanley.mountain>
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

Hi everyone,

On Tue, Aug 12, 2025 at 11:39:53AM +0300, Dan Carpenter wrote:
> On Mon, Aug 11, 2025 at 07:21:18PM +0200, Louis Chauvet wrote:
> > 
> > 
> > Le 11/08/2025 à 12:15, José Expósito a écrit :
> > > Check that the value returned by the vkms_config_create_*() functions is
> > > valid. Otherwise, assert and finish the KUnit test.
> > > 
> > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > Closes: https://lore.kernel.org/dri-devel/aJTL6IFEBaI8gqtH@stanley.mountain/
> > > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > 
> > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > 
> > I am not sure on how to use smach, I don't have any warning at all for the
> > whole kernel, so I will wait for Dan Carpenter review before applying.
> > 
> 
> Looks good.  Thanks!
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks to the both of you for your reviews :D

As a side note, I also couldn't make Smatch to report these warnings,
so thanks a lot for verifying that they are fixed.

Jose

> > Side question: should we use __must_check in this case to warn at compile
> > time?
> 
> We wouldn't normally...  It turns out the existing code was already
> checking for errors so this is really just a "silence the checker"
> patch.
> 
> regards,
> dan carpenter
> 
