Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A16A4265F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 16:36:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7615610E3CC;
	Mon, 24 Feb 2025 15:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N903F01l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8074210E3CC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 15:36:00 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-220ca204d04so72873135ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 07:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740411360; x=1741016160; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TvUBzAQsQhizjRbALhklVYcHMIlUUFNb0lUUZGXIVX0=;
 b=N903F01lY84M3O3f7P3eITRpKO53erR93dSehC1iELMwpaf2EukUHAG/C3dL3X/ayG
 9SlcVqn8DeFQwB+YsDlDvUozE7pZqaOvHs6JnsmgTtQIXz5z6v/bTlVpz2mVdM4Hsbsi
 U7t5aDdeCfBQ+YEg9jmt7p0VY5HG4CtjgAzo0Mqn9rZIFwtGn3G/Oq+hsZXTAlJy7wm7
 HH2mNmMBp8mRSEO01R4BF5pteqwPdM1egmoGZhnIl67wTciPzDYKRVou4s3U4o68nPab
 jEgtHmVFEL+3ahVh7ncDgsZwnSVoQsFLx/U0X0tEg0RfTHUbcaolxvxy1bxqZsQnv1Rl
 5vuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740411360; x=1741016160;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TvUBzAQsQhizjRbALhklVYcHMIlUUFNb0lUUZGXIVX0=;
 b=WEHQpWuFHk9DClcdPS2UT8kh+gsLV0wRQ3bOCdNc/JhxehdHU69olx7fisbP5B564i
 eNzQgaxV9v6daS523EnSacLn81LThEHno5aCvvRIWkK0kockHP75htl9Lyu2P1tPrxJY
 ElHgHQ4BSkdoGQTFAPA7Vn2kpJTqVvVpvvt59z9nPjcU9TWQ3N9iEWRM/0E/VyacZ4Jv
 pPqt7x+ps2V9+aKGB/Hd6tkj0JWRW19zjfAQUxI1j+mdS0gnyKan/5KPORLC05MSncz/
 io1FSbuzqq98efgX76rR+H1u/ZB8xSZ8XhmrAQkPx1EfYGGjgW53APmq/XFth/l4Epui
 u2og==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0jiu2Q7W/vsw9UuQMn/ljvbDo8wpz8a6EYJpqzh2Kv2Q+SiMck0q3GVSmVCbHrhJKiTbf89V63W8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVyHCjHBmstty6HSYjAGJ2VIYzZMpPp4aFnyLEQwVBDMGxs03H
 LtcyWO1a/U++PV9wrMMu03x3hMCceH+Ou652v/u364EXZCwtjF/l
X-Gm-Gg: ASbGncsI8/q3qxLF462YULUxkBpjCKs+mKtNkdU01NfEiv9LyFSnzpoUiSUQlHfKIYE
 kfULcLOktZYDZLQijW14lubJ0PEbHAAJRZWugQqXM0TYea/Y1VicluZmRjz55XdwFqcq0U2VP//
 NEw8pX/qIccYOBrH+4rUbjRS+BVOGVUk2rMK3lPEg+G8uZYJYnxBbZCt62Ga5f04TKSAW5CF9rU
 qUQXC0T/gb2E8aszNLfPGBYS6H+Dd5YS86RwXyAyk4asAkZIien8/8WxK3wZCQDYahYVjYxdkT9
 rgOPGiQq9nhzrpRF9C0op4cjeXDg
X-Google-Smtp-Source: AGHT+IHd2msCEkxFy+eTP0g8bXm0gN1PJPrXpracR00S9KkpiQvppU+iNHJWil/lk2n6JQBTakl5Tg==
X-Received: by 2002:a17:902:f706:b0:220:faa2:c917 with SMTP id
 d9443c01a7336-2219ffa74demr245408665ad.34.1740411359935; 
 Mon, 24 Feb 2025 07:35:59 -0800 (PST)
Received: from eleanor-wkdl ([140.116.96.203])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d5348f29sm181794265ad.37.2025.02.24.07.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 07:35:59 -0800 (PST)
Date: Mon, 24 Feb 2025 23:35:48 +0800
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.torokhov@gmail.com, mchehab@kernel.org,
 awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com,
 akpm@linux-foundation.org, hpa@zytor.com, alistair@popple.id.au,
 linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH 00/17] Introduce and use generic parity32/64 helper
Message-ID: <Z7yR1C4nC1UTrX5e@eleanor-wkdl>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <1cebfebb9c205a1ebc5722ca7e3b87339ceb3c79.camel@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cebfebb9c205a1ebc5722ca7e3b87339ceb3c79.camel@ozlabs.org>
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

On Mon, Feb 24, 2025 at 03:58:49PM +0800, Jeremy Kerr wrote:
> More so than __builtin_parity() ?
> 
> I'm all for reducing the duplication, but the compiler may well have a
> better parity approach than the xor-folding implementation here. Looks
> like we can get this to two instructions on powerpc64, for example.

Hi Jeremy,

Thank for your input. We will do that in V2.

Best regards,
Yu-Chun Lin
