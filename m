Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B274A3F373
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 12:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB3810EA59;
	Fri, 21 Feb 2025 11:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="cWrUm9N7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F41B10E1DE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 11:55:10 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30737db1aa9so19319891fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 03:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google; t=1740138909; x=1740743709;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3/iRbyF06sKBSuXAXawsdJPOX5Xxar4Ru2tRuKb6D2o=;
 b=cWrUm9N7HLhLlQ9G9QBdAEgd3+JN2nZ9JSEGSaZJ5F5KtA+bdJGJfTKuBn32dWsgYL
 Lopc7yb9DKrixv8DfwBHj/eS6SSPOIhqjPxjyDiTz779z3xWXJOtPLJyyqpouDze7tzx
 ZIiaQhYx8Rjl3z3rjQ46tA39OFqx7jXJ8HWnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740138909; x=1740743709;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3/iRbyF06sKBSuXAXawsdJPOX5Xxar4Ru2tRuKb6D2o=;
 b=kOFEk+HlOUVXDUN+Q5lHhG9c+nuMCregFVzWHOF8+4vab4r0iHMzqseZw/FlJUxlGC
 gAB4VKcyW9uGEsljN4A7YSggK2W4Vdu1v0e6BEzZitxurOnm44C3v8q6EkW5R+aMmP2P
 y4cf/Jo2Ge2ST+5CLC6BeF9MbSOz0B/1MI5qf7wrYnrJj9XohRgBKT7p9yMwz3b7s4Gr
 NZs+EFi60MDA+lbEIPvf8DqkMqSmveKrLVnuwghAiEU6KO1ojdWWdeYxWcEBNMaGqE3Q
 MCay58hAWHmdylO+1TaR34I/r8cQ5Go5u/JCgCTs8dU+5Xk3ghmDMSO9TKySvxKP7kV8
 0MvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxrnMEdGpFW9/3W3OSMYkUSQg1iUPBc4KwfXnXT1A9M6lKs96Dlu/P2s7TtCTWsNOwocEjjJzjnAE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+J+iBzRNddLXzyicAAPVE61cmjsYEdAy46o8RfLlY0wo7vfXk
 1JjN/O5mY84BBdS4Z6vK8VpqJAoif9YiyVHlpJ7NOPuL9UylXCGP5lQoqaJe56DnFK5mwF5hRSh
 SdCEJnklGT3e6bxCUnwRtzlWR0a2HF+O31JYMJw==
X-Gm-Gg: ASbGncsBd4682FJEm9UXLpzVLeDnOt1YJqi5U7FB5xauxzR9/KYMSPzfnQy5FOLKPL4
 /htfSRcMNb0RYZqDmc1MvYS0+KMHPMF2vk9Det/aUe4iNi8ai4p8dsnDudfZ/yhAEOJwGBu+dlA
 TfSYQWnpI=
X-Google-Smtp-Source: AGHT+IGq/dIo+A2JknCfxBPtCWEXSb1e8s5WLFM0DZHAgz+xRkivavGxrBcVWQ1kfkiIjnKC8wn9G/O8JUziZ5NiZwc=
X-Received: by 2002:a2e:9b97:0:b0:308:db61:34cf with SMTP id
 38308e7fff4ca-30a59899cafmr8679651fa.14.1740138908700; Fri, 21 Feb 2025
 03:55:08 -0800 (PST)
MIME-Version: 1.0
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
 <98289BC4-D5E1-41B8-AC89-632DBD2C2789@live.com>
In-Reply-To: <98289BC4-D5E1-41B8-AC89-632DBD2C2789@live.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Fri, 21 Feb 2025 12:54:57 +0100
X-Gm-Features: AWEUYZkag0YCbmK4501eSholWPOVfmEf5FjMGyae-nYt_GMpw1QMs3yS9iwYbxw
Message-ID: <CAKwiHFi_nngthth0wZkaPviVeS+8SWDtTw6gJcDAHCqiwXAG2A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 Andrew Morton <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>, 
 "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>, 
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>, 
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 Kerem Karabay <kekrby@gmail.com>, 
 Aun-Ali Zaidi <admin@kodeit.net>, Orlando Chamberlain <orlandoch.dev@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>, 
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Hector Martin <marcan@marcan.st>, 
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>, 
 Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Feb 2025 at 12:37, Aditya Garg <gargaditya08@live.com> wrote:
>
> From: Hector Martin <marcan@marcan.st>
>
> %p4cc is designed for DRM/V4L2 FOURCCs with their specific quirks, but
> it's useful to be able to print generic 4-character codes formatted as
> an integer. Extend it to add format specifiers for printing generic
> 32-bit FOURCCs with various endian semantics:
>
> %p4ch   Host-endian
> %p4cl   Little-endian
> %p4cb   Big-endian
> %p4cr   Reverse-endian
>
> The endianness determines how bytes are interpreted as a u32, and the
> FOURCC is then always printed MSByte-first (this is the opposite of
> V4L/DRM FOURCCs). This covers most practical cases, e.g. %p4cr would
> allow printing LSByte-first FOURCCs stored in host endian order
> (other than the hex form being in character order, not the integer
> value).
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>

Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
