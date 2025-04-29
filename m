Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A38BAAA0A14
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 13:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF7110E437;
	Tue, 29 Apr 2025 11:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Aa5qk7eC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C0C10E306
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 11:39:48 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ac289147833so1052088666b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 04:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1745926786; x=1746531586; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vjNdZRo+0JKNJCIrNVFAoCGrKjiVgsh/8WizVWXn7Jw=;
 b=Aa5qk7eCjTh5bDemBWIuTTOepevJPQfoYv2EgMS28DY8K8smZKPbRGENDAbEFJTTSN
 vIuhanikV70XSPI0NPMecEjpMeV618vlXigJrtMExXE3/M+A0t+GfLzoC7rlCU5wYWT5
 s/7y9AUidqMpdqaLxQLSPD3ettpoGyE1oE3HoCEmIFqAUXwG0fLu4bKQJ9YrsPviuzoj
 DStvh7agf+Air3fNGpKqOpI0XUDhbfEuxelgrTRkZPWr4y8x3EhI7AGGQzJL5fFIn2Fd
 HnwYNs7McBkAZ858TsTUTfYjFWOBr1bpsTl6B/duqI+tw37b5WxPLCKMDIDpXC0apg3U
 Ua6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745926786; x=1746531586;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vjNdZRo+0JKNJCIrNVFAoCGrKjiVgsh/8WizVWXn7Jw=;
 b=OOBHmiCLzwHzzNUDQM0z9ecT4LGq6koXQO0c7G9n49xbohHu4Z/GGOciIW/ATDbVzS
 PF5CAejdAesAj9clFyz67+a3bFutrCz9AoWIiwiWHR3JbErZR8Qhoh3pfzOV2jTTkR0j
 d3sHCnckZvP08LjC/RWFRui701T+ZSwSLGo1JaJxHOyo64GZGww+weDkt9zC7J4KvVtX
 peeIcTUYiIy7NDpUkVZYV7jUI65GwOO50C/2caZ8lLzVxFPMURGcMCdq0TcXDkmVTeIf
 wuod7uLSo5QVWYFzQa7E/thPmaub0HvCFhjvZ1TlzWsF+6qhL3TVagnMCgR9WwmAAOVc
 JipQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7tWBG4/cpH2oytECQY4b/XKsQDZvEeRms42hF1+VIFBzZS/iPaj2A/uLiDBLa/auhhijJfVUoqqo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQGbOU6tNQWJozhavOWj/llcU0jHu51btl3EBbKdDPwEfyeT7b
 CcqzwTFshas3xAWU1/8YuB1L+vgM+/EYWzMaBudXX7qp4Sr5F1yu/DIEtI7g4ZU=
X-Gm-Gg: ASbGncvUMNgDAbl+HUkchcQbuy9/A+N4WIYRVKWlSnux9OwZIgelJ3UhBsy3qjv6NgX
 tsAZUX/25a8r01Xy+q47TQtROuqBstuizt+IrFOo00J3kvBuwu5xkGgPI1Zv4UcRPqGFB8ADrKB
 gfiPKFHcAun7x73nMi9xrKXlL88O+O65w/z1xklNrVvN6/bPK5UtlczjgQm4BJDkLWEXWXjQCLb
 uP1UchHRJHCgorMNw8S8rIycbMYQUrZ2WXgagcXWKoy+Ua5frgpuOZ18pLYC5+URb2aVhcNxzrL
 wDbTZ9n3Nh6ajINnyxBQWrqAun1QP1ecZh0a/ad+
X-Google-Smtp-Source: AGHT+IEvfTQCJKCNh3qhke/KxsW/y1p2uYXP6K9g5VKxCSG1GBRIRQqV1uYXaafKpVqcupU8bMrCXw==
X-Received: by 2002:a17:907:86ac:b0:ac2:7f28:684e with SMTP id
 a640c23a62f3a-ace848c2393mr1062210766b.6.1745926786169; 
 Tue, 29 Apr 2025 04:39:46 -0700 (PDT)
Received: from pathway.suse.cz ([193.86.92.181])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acec0530c37sm169875066b.136.2025.04.29.04.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 04:39:45 -0700 (PDT)
Date: Tue, 29 Apr 2025 13:39:43 +0200
From: Petr Mladek <pmladek@suse.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>,
 Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
 Simona Vetter <simona@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com,
 joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
 Kees Cook <kees@kernel.org>, tamird@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Hector Martin <marcan@marcan.st>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] vsprintf: Use %p4chR instead of %p4cn for reading data
 in reversed host ordering
Message-ID: <aBC6f8Vmlik9ua0K@pathway.suse.cz>
References: <20250428123132.578771-1-pmladek@suse.com>
 <aA-0MuLxVTueDAhm@blossom>
 <PN3PR01MB959715E4B4C95911A60ED075B8812@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB959715E4B4C95911A60ED075B8812@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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

On Mon 2025-04-28 22:38:13, Aditya Garg wrote:
> 
> 
> On 28-04-2025 10:30 pm, Alyssa Rosenzweig wrote:
> > Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> > 
> > Since the other patches went thru drm-misc-next, I guess this should
> > too?
> 
> I think yes.

Yes, it would be ideal to add this to drm-misc-next as well.

Best Regards,
Petr
