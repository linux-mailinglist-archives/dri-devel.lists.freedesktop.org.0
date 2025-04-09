Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00535A8306F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 21:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BD110E700;
	Wed,  9 Apr 2025 19:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jyZm1qy6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F5A10E700
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 19:23:27 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-223f4c06e9fso764345ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 12:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744226607; x=1744831407; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8RibaRu5VBtVELK4VwEix973B2UxxmX58KGstf9uOmk=;
 b=jyZm1qy63PYR3JcaLm6ZBow/7pI4MD5whYG3gcXaX6IHx9adz1+ZmdO3UL3rAiHkpL
 5kKx2Mev3t/l5Uly2wCKXZQxcvzOcp/AIM19fvtdWX/LbgtKrp/dzIsrzCJp3XMBh3M4
 7nYVQmCArPgi/HlJBmGLlGzWq/qqWAFrg9bgTCorsi8RkFgbGl2Z+aLlyOdsrExj0uS4
 9pQQsyEliyDVQ4BIRLOIqefaO6ZlW0dfqrqJEZq3gasnL9zZrePVXSB5NE9sSPco9yxt
 0ZW5NEqwGT/jPb1mnueehzCCZ3PM84IaG7S+QER5L8db/jOzKbSDpfbq1rX5jfM+F/8h
 9sUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744226607; x=1744831407;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8RibaRu5VBtVELK4VwEix973B2UxxmX58KGstf9uOmk=;
 b=c1X6/cAZHAojrpi5e+R89ypNV2Qnod/3TtKPiVdl5WQuqA64AiMCmteb+OeHCkWZEz
 n59oc3rbGUN63IliaXtZeaQXhleLuGC1LHhGOZkbb/NsosKk4smnQNRN0oCKt3+Zh7HT
 Tp6dL3dVTJGmaxAKZUJ8tViYkysVNaOXb/DfkxEfRvkjXcq98m5IEDeb04idG4Bayh11
 tT6ZEPLLdJiSMkrvzZ05z+yFXLrjqFLeBKArI9m5IaD9TmYgJRknu3QQxf5VnZw5IZnL
 hpe0dWY+cDJkdy1WxSYJmXfu79kmGWAbIDKXl9peVzqZzjQcGLEJnoXY2+nt2vT9v/O2
 2VDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCkIo3PUPh4k3XDGmOCiI3Aojkc2Trvvj/zPOJ65f3cdDdZTeOT30X3HWjO4brj15xiyuCu7n2uWM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGonv6QYePDMyUV+JYen/U7w6NkW2fkZ3+EUtyfp/c7JTVmPBQ
 zscphQUHhqUpMX9sj38Lsl3GwBFZu8+L3VAPZzdjrvRvCXojDpQ+
X-Gm-Gg: ASbGncvqBSrr8GSF595P4i7KUFR4m+N2Oi4zmQf8Z6n+6ulTMd8FBoxmesiGZnv5Hbp
 3V/MSNSuoDgYhJBZyB1JcjHQm0UUBxFPhXEL6aarK0QQPfKSwHF/hb0Y3Sr6eGmvtsTQIDR1sph
 2E1+EDWeXmzPWzdjKtsZdb1DSNKj4LNnkyQCo6KEgNn6GYqzOa5N6BJTx3OHj09/X8TzStE2a2+
 VhZfGo40Toiq613tKo9nvvcRDONMpFBinsSOlYnDZWFcVBb47HoB14BvKS/2yA/Abh3pWTdleYC
 VMD7q1Eqcfk6pLKZPaF9/duCWj8WhnWxUjEcoEWTEQ==
X-Google-Smtp-Source: AGHT+IFL3XhQxmETFJky3U8LpnPa3gTvoNA7bcU/WI3ailvxU34USadXflyfbHs0+s3uYjppXMMUHw==
X-Received: by 2002:a17:903:90d:b0:224:7a4:b31 with SMTP id
 d9443c01a7336-22acfe92581mr8187825ad.6.1744226606945; 
 Wed, 09 Apr 2025 12:23:26 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:cff4:8871:54bb:4c97])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7cbdfe7sm15862175ad.207.2025.04.09.12.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 12:23:26 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:23:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au, 
 eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, mchehab@kernel.org, 
 awalls@md.metrocast.net, hverkuil@xs4all.nl, miquel.raynal@bootlin.com,
 richard@nod.at, 
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch, 
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, 
 gregkh@linuxfoundation.org, jirislaby@kernel.org, yury.norov@gmail.com, 
 akpm@linux-foundation.org, jdelvare@suse.com, linux@roeck-us.net, 
 alexandre.belloni@bootlin.com, pgaj@cadence.com, hpa@zytor.com,
 alistair@popple.id.au, 
 linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, 
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, 
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, 
 jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com, linux-hwmon@vger.kernel.org, 
 linux-i3c@lists.infradead.org, david.laight.linux@gmail.com,
 andrew.cooper3@citrix.com, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 07/13] Input: joystick - Replace open-coded parity
 calculation with parity_odd()
Message-ID: <mustacwfqzgmrrtxj23apezwp2ieavnmfa4myylvnojnpf2alm@enruxjpzr46i>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-8-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409154356.423512-8-visitorckw@gmail.com>
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

On Wed, Apr 09, 2025 at 11:43:50PM +0800, Kuan-Wei Chiu wrote:
> Refactor parity calculations to use the standard parity_odd() helper.
> This change eliminates redundant implementations.
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
