Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34828AA739D
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 15:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6465C10E061;
	Fri,  2 May 2025 13:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="aeIAf/Mr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D9210E92E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 13:30:38 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-acacb8743a7so358253166b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 06:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1746192637; x=1746797437; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oI2ULQh5v/7XJgNEVII7Ar9c5ShGuV2fSObmZKZHKeY=;
 b=aeIAf/Mrj2Zr9E90WeNLH8j7PsMwu+GTLt5ivGOLOvLia2Lnr5eabwfM3+0LobATQj
 +gDT1HNDuotVh/Vc6B1Gc/4I+4HdxsAlRxzjKAGkKGrgrXTwsTnujxiLn1oCcdK5UaEs
 /s9SdCfZq0ms+6v21AsjrJsgj+4tHfp1vqFiPBwPGTyfwmecWelf1gysQKqIckL+3qML
 G2NvVSkB4RDlZZmAmAJQ0pXoD6t1WpsQTv//prC8wuX6mAShD6n0gfGluz/lym65mab2
 +YjFSu12aa1qRV9FuoFiDCQgSoc93NK5zE+WOTZ9Bzqz060GA7ih5vyhB8DqJmmxn5nr
 OCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746192637; x=1746797437;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oI2ULQh5v/7XJgNEVII7Ar9c5ShGuV2fSObmZKZHKeY=;
 b=A7vl9d4cUaO7Q+Lixmix5Fgy85OftYHW6Ahts3891avtMviPPq4hr13kzFu4x/z/vP
 Yrr7plNBgb1gw1SgDraUBj4fzcdYC3k4PPpdNKtRtT58k7M4Q1+ToBF/fMbws8bWNmsA
 u2wyHYSFVmQCL4cxWBlrn8O7O7x4J3FMuaSMnSKWzFvCK6yEih7Gj7fsWuSm8K/Wjksy
 9QzK1dRkxIMdeavE1M5Ke78gVua0rWD3zM+ACvs8bcsuAO8acleukslP9+HFoL+vC+ah
 BrHYet6xOTgmNLkN1JC7xdBNSOVVydFhpWTVJOIt+w8xzjxQT5OnoxO+Y6zMIdvE2pjF
 UrsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9PB7idZ8zj9ehO5jZPaLwnSVplydc/NJWmHHUHL0QXL4BN65jML17CX5Q63tV457OGEOzSErg66A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzN7r910wxxb+X+1/SZqGpPDtXJM2SxZAerzJjc48yWUb/EYsju
 ww4oOeZ4dasF89iay6NXSU81va+8Yl668u1jqwM312AET2uYtQpFclexjEBj+7kRXamPcOC3ku7
 P
X-Gm-Gg: ASbGncsPLt9i0p3f2iGHTyLHqsenLueX6iyoig5vTYAiC3psdNVEgFkzDLgsI8JPyzA
 TMAMHfHLZtK/4z2QDvhhpLjBdWSzAYFNKlG1EgFGoQm2o6WkMGCwe7gAGMDjJRQWQNRp/i8VJcS
 9jV93fXi4E5CaSBwI/+KzGbXn8pCx+iQKT1dlIRELkXdsTxNgVVEwdn2T5llfch8iMCn3ta5CFH
 zelawTGwsycVEo/xRv8Jgd8mIrrCxm81HbmKsOYQxiW4u2NUpGnjWpN67cXOcFnBN/vOToCl5oY
 uZvh417oYPcH2RQqcR8/1m5diFnbqlYTomIXpCqwY3LcQQNTFiPoftJ45gsp/A==
X-Google-Smtp-Source: AGHT+IGNjdWSsHUN82hvMxthq8y7vwBmvrJ6nrWhg8zsSPmK5nzcMmRdBKIMbJNC2QRWTDJHY7Fsug==
X-Received: by 2002:a17:907:c298:b0:ace:8176:9870 with SMTP id
 a640c23a62f3a-ad17ad88dc8mr244745366b.9.1746192636538; 
 Fri, 02 May 2025 06:30:36 -0700 (PDT)
Received: from localhost.localdomain ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad189540d5bsm50208966b.176.2025.05.02.06.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 06:30:36 -0700 (PDT)
Date: Fri, 2 May 2025 15:30:34 +0200
From: Petr Mladek <pmladek@suse.com>
To: Aditya Garg <gargaditya08@live.com>, alyssa@rosenzweig.io
Cc: admin@kodeit.net, airlied@redhat.com, akpm@linux-foundation.org,
 andriy.shevchenko@linux.intel.com, apw@canonical.com,
 asahi@lists.linux.dev, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, dwaipayanray1@gmail.com,
 geert@linux-m68k.org, joe@perches.com, kees@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@rasmusvillemoes.dk, lukas.bulwahn@gmail.com, marcan@marcan.st,
 mripard@kernel.org, rostedt@goodmis.org, senozhatsky@chromium.org,
 simona@ffwll.ch, sven@svenpeter.dev, tamird@gmail.com, tzimmermann@suse.de
Subject: Re: [PATCH v3] checkpatch: remove %p4cn
Message-ID: <aBTI-v5-_JWDdge2@localhost.localdomain>
References: <20250428123132.578771-1-pmladek@suse.com>
 <PN3PR01MB95971954FC5E026C59B6F8EDB8802@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB959760B89BF7E4B43852700CB8832@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB959760B89BF7E4B43852700CB8832@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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

On Wed 2025-04-30 19:19:08, Aditya Garg wrote:
> %p4cn was recently removed and replaced by %p4chR in vsprintf. So,
> remove the check for %p4cn from checkpatch.pl.
> 
> Fixes: 37eed892cc5f ("vsprintf: Use %p4chR instead of %p4cn for reading data in reversed host ordering")
> Signed-off-by: Aditya Garg <gargaditya08@live.com>

Looks and works well:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Alyssa, could you please queue this one via drm-misc-next as well?

Best Regards,
Petr

PS: Aditya, thanks a lot for stepping in and providing this patch. Also
      thanks others for shaping in. I was not able to react quickly. I
      had technical problems with my workstation and public holidays.
