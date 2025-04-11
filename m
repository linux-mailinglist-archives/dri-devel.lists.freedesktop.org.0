Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E970A8636F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 18:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D2410EC27;
	Fri, 11 Apr 2025 16:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VK2N6IKo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A466610EC27
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 16:37:34 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-226185948ffso25657645ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 09:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744389454; x=1744994254; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MjzA0YnYKabpFVnU6SCdVYbRaI+R9P9oLUcK7MMUODI=;
 b=VK2N6IKoHglU4Jbik3G6p/KGC8MBj9y33QNi/UvTfqnMGRd5b+z0ecYo673P2xd5ip
 RY07VD0D+cI2JRWZrkBeD8wsZ8tiKoNL4PfCfIa2wEl8CSZwgtBqU+y7sQZ720FyPSip
 tjMyR7jpac/XmYUvnw1dYaWjecDhoSDkNTwIDcudYUjb/fHQi2vXGOoLAllqlmU5cHSi
 MrOmNW6vat/NwkwxLqHNzyEGXuFS7Thr3FsCPn5Gf6FRz1lEkDaOyxf6X/tBUvAuTqF4
 i5I6mGa3EgKDtxlKAWsmp21J0i7T3xro0Q/4CxWJyD1+bI5xynkwb/xPvaUDS+EAcE8I
 ws+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744389454; x=1744994254;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MjzA0YnYKabpFVnU6SCdVYbRaI+R9P9oLUcK7MMUODI=;
 b=vdbeDiKMJMqKIqzuljqUbBLW+zVeSIwV7METOn1Lf5xJ0ava+m/4Ap4wm2rHgGc+S5
 OEW5qJvWoFVsIrMhft6k/TP/V8VHhafO4urbRQYoOh0dB8/dGD/+F7ti/tXLzoM/KVsS
 HxnnH1Yif+P40Qg07Ie7xm/tCP2itNvouer1kFtBpuRCZ0FLvFdnQplrPoRwXtrUuWkc
 xhw277nVv8/FMh5rtIy14jpywxomnXxQ5nU6cas4qMVWF/dF/PjUPk7ESy0Y7L4NwlvY
 PYbLYinFN+0RMtIvBkp+4u9I6mpKWwDxOjsiLFAgB9iFjmBijyiH7yZNzXjPcyE4kw81
 r30w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlzVY54ElSTjf45dWbkWvAWkcnCg9Jix8cHXyi3+yzPZ3ZOJpA/zI2Xkl1eBp6i/hAV50W9nuqwag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxkha5ixcuhZedKZTQ3U900Cw9y9K3J8MwsY1oeHPL76+JYZVG3
 9qX09HQ0Q268F0lt4cZXOm+Zzrki02wEtqIaNNiOED3YwSsfgref
X-Gm-Gg: ASbGnctVonGF9ufcQySjKFmYAqTrmE0cn2MCPVQ+25lQwzU74AVDtQJsk5HiXCXxLp6
 92mrcUM1NF1/K4sb6Mbg1eRj0OYCfNo1XsbZMM4TdmYvxuetP619xu5addtpvcmoPmd32rQCdUQ
 cmoaGvKF041W4geLSUWVxR2j9Uen65IIjxArwwOKGULQ8kWwJHUaTFVix5WKhSvEzOaeLymmPxM
 Rq9TI3GPfiuj6TmxWs0A0vpmTSpsGclOurS8FZcM2FEGYqYsaJcn4ww7rja3citF8G53luj+/7/
 MQSMRcKrW0qBHiUK4s6k7odZxbFapepbDgzawkx8kHHAItY/6xv7XCWjhQP0F7cI461d
X-Google-Smtp-Source: AGHT+IGlMlFJxwXfO1vN1lbAUVxQSfZJdWvCgXvyYRfzP61vo51gp8lcBZ4/5fk7RALG9+wgB3IUnA==
X-Received: by 2002:a17:902:d4d1:b0:223:42ca:10ef with SMTP id
 d9443c01a7336-22bea4fee72mr44963195ad.43.1744389454075; 
 Fri, 11 Apr 2025 09:37:34 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7c971fcsm51537235ad.111.2025.04.11.09.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 09:37:33 -0700 (PDT)
Date: Sat, 12 Apr 2025 00:37:23 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org,
 awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com,
 akpm@linux-foundation.org, jdelvare@suse.com, linux@roeck-us.net,
 alexandre.belloni@bootlin.com, pgaj@cadence.com, hpa@zytor.com,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
 linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
 david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 03/13] media: pci: cx18-av-vbi: Replace open-coded
 parity calculation with parity_odd()
Message-ID: <Z/lFQ85vhSQiFDBm@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-4-visitorckw@gmail.com>
 <25b7888d-f704-493b-a2d7-c5e8fff9cfb4@broadcom.com>
 <740c7de894d39249665c6333aa3175762cfb13c6.camel@sipsolutions.net>
 <1961e19ee10.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1961e19ee10.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
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

On Thu, Apr 10, 2025 at 07:08:58AM +0200, Arend Van Spriel wrote:
> On April 10, 2025 12:06:52 AM Johannes Berg <johannes@sipsolutions.net> wrote:
> 
> > On Wed, 2025-04-09 at 20:43 +0200, Arend van Spriel wrote:
> > > 
> > > This is orthogonal to the change to parity_odd() though. More specific
> > > to the new parity_odd() you can now do following as parity_odd()
> > > argument is u64:
> > > 
> > > err = !parity_odd(*(u16 *)p);
> > 
> > Can it though? Need to be careful with alignment with that, I'd think.
> 
> My bad. You are absolutely right.
> 
Then maybe we can still go with:

	err = !parity_odd(p[0] ^ p[1]);

I believe this should still be a fairly safe approach?

Regards,
Kuan-Wei
