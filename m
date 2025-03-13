Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5E4A5FB76
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 17:24:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1705610E8E4;
	Thu, 13 Mar 2025 16:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jEVfJ2jS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582C210E1F3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 16:24:42 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-22337bc9ac3so24733505ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 09:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741883082; x=1742487882; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gfjeDfcFtBUkNo/zS3F1TWi9ohbnRv2k3DpKMTE74P8=;
 b=jEVfJ2jSjhsFbec7+nG8xOXP1Dc3np+3N1t5tlriVnb5+MG7t7XutZ3ykn1/YADd1y
 Ks/LHAtbMYmH/TzSjp7HjipYQ+1gnpyLJKOHNvGhSN7oomVTkEqIlyRUfeOxtHn36wAM
 01/LhIb8A3hvkg58AJimo1PGC0+20DuMOgcwcry8CN3C2euLy3kpbc92Q5j+fKOuGcqF
 3d//1nsj8Bb+4wkM0mXy845jVnss1Nt33ssAfJgjJdhoFZJjyLx2SZo+7XyfQM5DSGAa
 aPv4MEW9JwSHyJS4Ooqud9KwNQn+gofc5K5E8cz7fBynmNxz6Doi110M7RlmJLwUIn+/
 50/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741883082; x=1742487882;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gfjeDfcFtBUkNo/zS3F1TWi9ohbnRv2k3DpKMTE74P8=;
 b=ENBEBKX7IiCwuJ1tAWZ9kUZ52RDeqyJHR7imUZETi3JkXnLvt+0oKySg9bAcQnYgyj
 o0m+hfERoWd5UDlKNooe9SHEHf1xg3udxW4YXo/iTXCJze2Mx4PgzElNDDVJPt2Q+eYY
 3pIWzu2gm33VOjO4xXweYAht8oFuorR+kjI7plmTYLL2TOqfCBgYE83VSLljycmWvuA3
 x6qhBpUpBe4eGHUB9ssb4aflL0I3Cqlcuf1dbXK2cFXGl3paN7KemBSx5Qqkgf1qxkYV
 DK7KWPPnk4LoDzBlT8CxpYd/ErCoW5674jP6HF2APGmmdKskK25HxPZ8L247jEGf920o
 i/MA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUMj/0bHT8b358uMs0fQ4mI1G9n0IMIQ4VNI3yBQEgXJA6GiCagNLTtojfYFL1BrMdIZHEDJ5TH9w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVqGU9cRVXztyYujlgQAHVpvKiTx1GbYZmNNqhCG2GcE/xSwHU
 jACnKAF+BuLYTc39gpyP5740tdsY/YI5JtBCG1NqAy+9mGYkF2SU
X-Gm-Gg: ASbGncvtR+4Ragv1db00pLD+WxZgMgwU66+xHS8T9P2SPs0gRMHoF7/IxGl07Ne/udt
 cE+dlT5RUbEAZ3llp4WVDWV4xB2Gl9Q4B0ZuUvvLkSgWWSKJ1acbvM38XbM1Ww3HHilgMa2RpTw
 7L7gBnBhsrRTeevUjiwGWAkk2wciHr9YKo2WWoymaMsBjeNhnm15OlB0+gaNZLOkmVLIsU/dntP
 AGc6o5XQn+v8mRRpaPh5sZcig4PIzmPmjIUmE5Daz4ieZCoR934MdV7dgZ2r2Jt9cTi+Em0C9Zr
 TIdDqjyLi5GHc6yD0Ne9T8vOM6iH+ZKkSOJBSnkjuEIk67WSVO4Q6jU=
X-Google-Smtp-Source: AGHT+IEhm2UlrxnESPtEwBvMI/fgf4613dWJojNHjH0dA0YyQIoHXBBX22mwSMAlbcl6B7SrptBmaw==
X-Received: by 2002:a17:902:f552:b0:224:216e:332f with SMTP id
 d9443c01a7336-225931ad2bemr163943215ad.48.1741883081419; 
 Thu, 13 Mar 2025 09:24:41 -0700 (PDT)
Received: from localhost ([216.228.125.129]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c6bbcba7sm15241975ad.173.2025.03.13.09.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:24:40 -0700 (PDT)
Date: Thu, 13 Mar 2025 12:24:38 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Jacob Keller <jacob.e.keller@intel.com>,
 David Laight <david.laight.linux@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
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
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 akpm@linux-foundation.org, alistair@popple.id.au,
 linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
Message-ID: <Z9MGxknjluvbX19w@thinkpad>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <20250306162541.2633025-2-visitorckw@gmail.com>
 <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
 <Z8ra0s9uRoS35brb@gmail.com>
 <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
 <20250307193643.28065d2d@pumpkin>
 <cbb26a91-807b-4227-be81-8114e9ea72cb@intel.com>
 <0F794C6F-32A9-4F34-9516-CEE24EA4BC49@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0F794C6F-32A9-4F34-9516-CEE24EA4BC49@zytor.com>
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

On Wed, Mar 12, 2025 at 05:09:16PM -0700, H. Peter Anvin wrote:
> On March 12, 2025 4:56:31 PM PDT, Jacob Keller <jacob.e.keller@intel.com> wrote:

[...]

> >This is really a question of whether you expect odd or even parity as
> >the "true" value. I think that would depend on context, and we may not
> >reach a good consensus.
> >
> >I do agree that my brain would jump to "true is even, false is odd".
> >However, I also agree returning the value as 0 for even and 1 for odd
> >kind of made sense before, and updating this to be a bool and then
> >requiring to switch all the callers is a bit obnoxious...
> 
> Odd = 1 = true is the only same definition. It is a bitwise XOR, or sum mod 1.

The x86 implementation will be "popcnt(val) & 1", right? So if we
choose to go with odd == false, we'll have to add an extra negation.
So because it's a purely conventional thing, let's just pick a simpler
one?

Compiler's builtin parity() returns 1 for odd.

Thanks,
Yury
