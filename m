Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD2EA82F04
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 20:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6B310E686;
	Wed,  9 Apr 2025 18:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eYJyw+xC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C417710E686
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 18:41:06 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7399a2dc13fso9533135b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 11:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744224066; x=1744828866; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=y9MRs+OpXV0ogJQHvE9axw548ilRfDN2nGQrTik2VzY=;
 b=eYJyw+xC/y7jfApGLqWhY4jBwb7zYsuutg1PcjII4enA8HyDyx4VYkOT8v56T7i9NZ
 246SD4+ysRlj5LBtsOJjty6Ooo1H9mVjze9X38zf7uewOkiBYENdjtzEUhTlm7egI2UR
 B2ec6Lyb714AzxqhPVkemaCy9eSvqvj67umwEb2ljgRel18AeS2cI1JY7N3UN2E0QxJF
 AcIM33Ed0nbbuBPCrsduB+7XKfAXGzjkm9VsXQNd6iAaR0JNTyIBm6yoVZwYhVjKXCwq
 3U0mGw4LZOLQujx+nw2FU2rKPN5/m4d1+miiC5ObNMWvvRbr0Ay7FHRL4IxFatBWIFX+
 llIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744224066; x=1744828866;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y9MRs+OpXV0ogJQHvE9axw548ilRfDN2nGQrTik2VzY=;
 b=GI1WmZAE+4nJOt7OL8/vW8hABeX2kCeiEyB2NyFGRqmZC1PlV3Tw9LdZlWG+6zZntc
 gp4jh4T00wLWV0s94D6r/mlyCms1Hnb5s/E5I4vAAIer1q2QmT4CMm6BLsNaFhvDuSyN
 szEiuOu29KHEC6Lq4TidbTE+JwhTPQYe67IsHuPiYwisHFOjGMIG7O+Q4xRm7U0iC7S7
 2+RBQ1a/1eXtdZ9qqPgCazrS4QDSJyxdgfrvXs8jPeS9VhQkeRK1pykc0IhBKkwpU6kp
 jcj/Ljiuw9e96f9cMcbZnUKNv5Xa2zFbur5UN/8IDBKesLez7X4/3Lmko3GhtxJQm0zU
 9ymw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcI2oRw1FEg4jeCqFpYV8voWDLqPFWW19QO9/WWLgAjAJvUKkzM9VFPHtdy7wyBRvn5NU/3tvLEV8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGpaBIKyTw3NGT668/bhVy+zjV21ycNN8QLwDteG8vpGVIUv0q
 /LUziXgX5kbhgiQgL/toWQRfyqpxeq8ItI4s1xkodRbz+QehxtPH
X-Gm-Gg: ASbGncuMBJWD+n/VrI4ShQYY+ivpK4DoVYWnwYOKZ3Uq0QVPqVE4msYnyqsUIr3ZqeJ
 Q/mBYNbNBb07EAgMABAttnp5MigpndgakhuuP5W5aHLCq26BMWOSVoIiyAPIvsVhweKiEMY72R2
 xeGQfqKcHX+WG1dAsEeWgRexZABSdFWn/O7gKFSOutjRMT6UwQ6t/jC0k6BttkkdVVsA+5AjwhG
 wRdV5kmWdtBnzUkxbFZmUy/Id2TqCFZJ9/V+0VnuFA3nP2edmmHTPuQWJHA0tjET0XO4dzjV/bT
 76mO2RVhfbPr8tO9FbRTxyjvJFq9agoEQmeyvYrkfKUxDW3LE8o=
X-Google-Smtp-Source: AGHT+IFBplIB7lbzzonBtacivuTbdfAuDOBFrLzj0CEeoRBndpxGhIacjgtf4O10nP956h0EjBOoEg==
X-Received: by 2002:a05:6a00:22c2:b0:736:5545:5b84 with SMTP id
 d2e1a72fcca58-73bafbbae8dmr4546648b3a.3.1744224066191; 
 Wed, 09 Apr 2025 11:41:06 -0700 (PDT)
Received: from localhost ([216.228.127.131]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bb1e4f768sm1739807b3a.142.2025.04.09.11.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 11:41:05 -0700 (PDT)
Date: Wed, 9 Apr 2025 14:41:03 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
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
 jirislaby@kernel.org, akpm@linux-foundation.org, jdelvare@suse.com,
 linux@roeck-us.net, alexandre.belloni@bootlin.com, pgaj@cadence.com,
 hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
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
Subject: Re: [PATCH v4 02/13] media: media/test_drivers: Replace open-coded
 parity calculation with parity_odd()
Message-ID: <Z_a_PzmNnvC2z7se@yury>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-3-visitorckw@gmail.com>
 <Z_aobrK3t7zdwZRK@yury>
 <Z/a7DecDljuLtKeS@visitorckw-System-Product-Name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/a7DecDljuLtKeS@visitorckw-System-Product-Name>
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

On Thu, Apr 10, 2025 at 02:23:09AM +0800, Kuan-Wei Chiu wrote:
> On Wed, Apr 09, 2025 at 01:03:42PM -0400, Yury Norov wrote:
> > On Wed, Apr 09, 2025 at 11:43:45PM +0800, Kuan-Wei Chiu wrote:
> > > Refactor parity calculations to use the standard parity_odd() helper.
> > > This change eliminates redundant implementations.
> > > 
> > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > ---
> > >  drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
> > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > > index 70a4024d461e..5e1b7b1742e4 100644
> > > --- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > > +++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > > @@ -5,6 +5,7 @@
> > >   * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> > >   */
> > >  
> > > +#include <linux/bitops.h>
> > >  #include <linux/errno.h>
> > >  #include <linux/kernel.h>
> > >  #include <linux/ktime.h>
> > > @@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
> > >  
> > >  static u8 calc_parity(u8 val)
> > >  {
> > > -	unsigned i;
> > > -	unsigned tot = 0;
> > > -
> > > -	for (i = 0; i < 7; i++)
> > > -		tot += (val & (1 << i)) ? 1 : 0;
> > > -	return val | ((tot & 1) ? 0 : 0x80);
> > > +	return val | (parity_odd(val) ? 0 : 0x80);
> > 
> > So, if val == 0 than parity_odd(val) is also 0, and this can be
> > simplified just to:
> >         return parity(val) ? 0 : 0x80;
> > Or I miss something?
> >
> If val == 0x01, the return value of calc_parity() will remain 0x01.
> If changed to return parity_odd(val) ? 0 : 0x80;, the return value will
> be changed to 0x00.

Sorry, I meant
        return val ? 0 : 0x80;

This 'val | (parity_odd(val)' is only false when val == 0, right?
When val != 0, compiler will return true immediately, not even calling
parity().

I think we need a comment from authors.
