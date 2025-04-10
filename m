Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BD3A84746
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 17:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CCC10E9DC;
	Thu, 10 Apr 2025 15:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CXrsZw/S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDB910E9DC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 15:07:33 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7390d21bb1cso925992b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744297653; x=1744902453; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3D5EegHjNXWtRqs7oVUZyDcWwG0k9rfQtFHn9dOK4Lo=;
 b=CXrsZw/Sdsezr0EKngaiacLWPZWsZ4XRnH8VNC8Qa1uEH22p7cSgZOBUHXWhWItomQ
 rJ6MBETrFExNQPOl9+BICT91+yNAJr4FDrb8Z90WKVu9BumtYi9xOeX5rRYrx+F+XkCC
 Wvt8vU5G09l44tjo8FbIUoWdd0pcMJRFM30H6EI0HwWH1B1UMqvxx/qw+Z8TFGzCxtTp
 sMFqGFC8Dx6ENsbbcx7D8IcZTE/8HdrgFUyB2ZI1nPgO+IGxR07L06x28mXSjnl5HtG3
 6PQek50oh9HhJrk0cezZY2pV3nz9xMAUU+gNo86xJyu4jgqhQxtObVt4Z+RleitxPypo
 CtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744297653; x=1744902453;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3D5EegHjNXWtRqs7oVUZyDcWwG0k9rfQtFHn9dOK4Lo=;
 b=Npw7hC8FlTTTMzP8PBp+VBXzOTTs6PyPJkECmjsaO+xyKtQpRLqmm/Ru5NfrF0jsru
 wqz9NC61ok8AOLtyl7BId8yWtX9WVcytrVmttlg7AHNAt6tt2gawaa8MzDmRPzMuJRwW
 AaHTmkekTPqTtTaK9JusxZ0P1TdxWQ/8LoCcUTFc6WKwNkf7KJip28esO44BwSCtiJrT
 7ZPZq6PUDKxTrKm3JYqez2oCTJRYwkk8mekO6fXIU0VdMFXw2KI+AkKD8wFCCRQR936Y
 RNUTeh8Xrht/i7PPzmOBP/jElhdAPhqh6YK/YlbBJo0m4+yvnqfkxmoY5FO6iGJHhcy9
 958g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL9anjmpNKAYTaVvcb6eXKHUBjUNn/e6yLjURJZPrgwsiZuwbD3W08KpPgjwvJ4cBuD+xCP/OOiA4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4aQeiusMxpaCqOriJ8nGu3RcC8NXy0xDZ9JF+K6qsMFqsusXl
 QLnd+23Nc1UX03EGTlA7RMC5NnpjLp5DhJcIEOIPYs8f5C5P/Eub
X-Gm-Gg: ASbGncsCJVKJyplpUhe3yCn8b0ALgH7vqKhhC7Y5JO4UxelQE5fBXDwJY4C8DYNPh2B
 E08R0CYcIYIMAOUvIjmlfRF1DxI1NRm0o8jGmHW2pSQGXZqragv8vBivsX66eHQPGGeSaqbnJvm
 K4xdGowPAJZmCYj/L9eFI/4XB8GVgYFosDqxhg2wYozB/MTLQ4osOrUxDavUKolM/TWAF+c7Zwi
 ir1QmYH7V2+nFRb0sG319uhp0+TZur9Kc7uBYFqOuwK1JWWoT+I8WdwFvM2AejkFyhLrORsDRco
 CRpEd2msH1VBrR1FAwIM1DpU0V8ASmPflRCIyzqI
X-Google-Smtp-Source: AGHT+IFy1ewRYIQi2QM4ZSLkQhokapTj0gR7Ltj5GpPkDsZlOlyCTjP19Ec1IKFhcZrwo1l74Iw4rg==
X-Received: by 2002:a05:6a00:240a:b0:736:ab1d:83c4 with SMTP id
 d2e1a72fcca58-73bbec49f99mr4365817b3a.0.1744297652831; 
 Thu, 10 Apr 2025 08:07:32 -0700 (PDT)
Received: from localhost ([216.228.127.131]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bb1e51f1csm3501019b3a.145.2025.04.10.08.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 08:07:31 -0700 (PDT)
Date: Thu, 10 Apr 2025 11:07:29 -0400
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
Message-ID: <Z_fesYbCnSjAo-K4@yury>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-3-visitorckw@gmail.com>
 <Z_aobrK3t7zdwZRK@yury>
 <Z/a7DecDljuLtKeS@visitorckw-System-Product-Name>
 <Z_a_PzmNnvC2z7se@yury>
 <Z/bC6cygo0hem5IO@visitorckw-System-Product-Name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/bC6cygo0hem5IO@visitorckw-System-Product-Name>
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

On Thu, Apr 10, 2025 at 02:56:41AM +0800, Kuan-Wei Chiu wrote:
> On Wed, Apr 09, 2025 at 02:41:03PM -0400, Yury Norov wrote:
> > On Thu, Apr 10, 2025 at 02:23:09AM +0800, Kuan-Wei Chiu wrote:
> > > On Wed, Apr 09, 2025 at 01:03:42PM -0400, Yury Norov wrote:
> > > > On Wed, Apr 09, 2025 at 11:43:45PM +0800, Kuan-Wei Chiu wrote:

> > > > So, if val == 0 than parity_odd(val) is also 0, and this can be
> > > > simplified just to:
> > > >         return parity(val) ? 0 : 0x80;
> > > > Or I miss something?
> > > >
> > > If val == 0x01, the return value of calc_parity() will remain 0x01.
> > > If changed to return parity_odd(val) ? 0 : 0x80;, the return value will
> > > be changed to 0x00.
> > 
> > Sorry, I meant
> >         return val ? 0 : 0x80;
> > 
> > This 'val | (parity_odd(val)' is only false when val == 0, right?
> > When val != 0, compiler will return true immediately, not even calling
> > parity().
> >
> I'm still confused.
> 
> Maybe you're interpreting the code as:
> 
> 	(val | parity(val)) ? 0 : 0x80
> 
> But what we're trying to do is:
> 
> 	val | (parity(val) ? 0 : 0x80)
> 
> So, for example, if val == 0x06, the return value will be 0x86.
> Only returning 0 or 0x80 seems wrong to me.
> Or did I misunderstand something?

I misread the whole construction. Sorry, you're right. Scratch this.
