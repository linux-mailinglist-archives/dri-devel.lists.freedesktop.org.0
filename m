Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIbSKrr/n2n3fAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 09:09:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0651A24F4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 09:09:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7513F10E12F;
	Thu, 26 Feb 2026 08:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB7610E12F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 08:09:26 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-56a91a5e64eso187698e0c.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 00:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772093366; x=1772698166;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FMwst+L/dmOaYbXaIYLxxc9SkmqogXh2haYIQH1PaVs=;
 b=h+EjR3dC9CX6w3+UjSw8KWFZ4WEN+CPVoyL6NqYxNbYMM2sVguMi9tGKKLGkpW7lv6
 WDYYZ5d2jA273ULamkHtPXDbtxc9zBUI7P2CEUfx+JAWMB7oS0WOcm9GjU4F7z5F6hli
 ZBxHL5DTYpGZ9XIWgPUE/iiTqD5hcrftIHBFcPbOYwYpeCWa+/esarBBnHD0OUE3PbSi
 bGYLnH7yeBXIZ3IfzDLNG+YoCnkTmR8qPd39hnm/dEQ09IorOb0cK1Yz8Y+CaBoIZguX
 NvO8fINwaolRuDqRZd2nGOZsP3SylMXMlbrjqTQ6i9wqdNSz4/OYAeXFV7j4UJ7LKyoL
 2BCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVglawjsnmahMWsVlTk9640tPK9PYUrx8fNsAbcxPTcYKUw7Mw/7ccmJLlqvPSKMNVxv/OVbh94/5s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEwQeBkWY6RiYPc/zKifpp4VYJjPhOh9d34XyKC2oaXScxDbeA
 WUJOhhmwfXPAeARikA4LIxNoD40kN0Ix5vvFx2+tQm68Bjsu5mD6DHe2RWtrC9nq
X-Gm-Gg: ATEYQzxYQsGhczHI2JgCd5iz/0K/fiYnsXZ5zA4XSgK93XylXftIr14Hyu1UXKIYYcX
 hHwTjRaZruzp5mRZUWxJvqOSkm6ZdfK4GEZnhqU4/8fdhBIjxShtA1bB8wxwskEagSg21Jjm4kV
 WNtcO8D/pMFnNNrAhinQtW0awRcKE6/w/axNvNAz/ReK5atZAc1sWXz3GtKhUKq9pz8wPXmexrW
 ocAGQhRrcQogdHj9Kij9TOG/wJLeuYbkqyaXlea0LUR/B/CCA0Evbwn7FMbG6T7A6SLf5VTU/j1
 C7pBj/lERUJ7OSAOQ8ywBEiSN3Ekqy+sax4of2uRirvg9NiANnbOKhebqDGOiMYtl2tRZAMdoaY
 +7PXW9NuWMofqnfa+TM2kXB6afDMVUkoRCPvzZwxjlvt8ftNGDGdeH1mrvNma7E9apLEM2wSvs1
 KUavhLryEkMnURSCu/dQJJdYxBd4EsaF/wqc43sInTI+doPGRy73DAc5TjnR1mSmbY2Eq9O4M=
X-Received: by 2002:a05:6122:1d54:b0:566:eb31:4715 with SMTP id
 71dfb90a1353d-568e47c487dmr7938927e0c.8.1772093365771; 
 Thu, 26 Feb 2026 00:09:25 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-56a91bcc3eesm1722285e0c.8.2026.02.26.00.09.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 00:09:25 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-5ff093cf15eso118569137.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 00:09:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUj9nooXtdZ8eeJqF4ARaC5YSGoDo2MOLMbfuqYAe1jELIMiALGXVHsuREHznZOsSao1ZGJVKJFvKQ=@lists.freedesktop.org
X-Received: by 2002:a05:6102:f14:b0:5ff:1f6e:6269 with SMTP id
 ada2fe7eead31-5ff1f6e7e68mr545413137.41.1772093364755; Thu, 26 Feb 2026
 00:09:24 -0800 (PST)
MIME-Version: 1.0
References: <20260226051338.27460-1-phucduc.bui@gmail.com>
 <20260226054035.30330-1-phucduc.bui@gmail.com>
In-Reply-To: <20260226054035.30330-1-phucduc.bui@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Feb 2026 09:09:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXrYTGQkjC1Sr4NjOcsRyOw3_eEj9m5MVVo1GWUuCxo3Q@mail.gmail.com>
X-Gm-Features: AaiRm51XMkux3B1QqgjcHVbFdYag1eq8lj6Y0Kfg2ouDz7vKdp5cWOR8jMqmm4E
Message-ID: <CAMuHMdXrYTGQkjC1Sr4NjOcsRyOw3_eEj9m5MVVo1GWUuCxo3Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm: shmobile: Fix blank screen after resume when LCDC
 is stopped
To: phucduc.bui@gmail.com
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org, 
 laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:phucduc.bui@gmail.com,m:airlied@gmail.com,m:laurent.pinchart@ideasonboard.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:phucducbui@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,ideasonboard.com,vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.986];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2F0651A24F4
X-Rspamd-Action: no action

Hi Phucduc,

On Thu, 26 Feb 2026 at 06:40, <phucduc.bui@gmail.com> wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> The LCDC controller on R8A7740 loses its register state during
> deep sleep. Upon resume, the driver's Mirror Register mechanism
> (MRS) fails to update active registers because the controller is
> stopped (DO=0).
>
> According to the datasheet (Section 38.7.1, Figure 38.13), the
> Two-Set Register Switching logic only triggers a change between
> Set A and Set B when a Frame End Interrupt occurs at the
> completion of a display frame. During resume, as the LCDC is
> stopped, no frame is processed and no Frame End pulse is
> generated. This leaves the Display Data Start Address (SA)
> pending in the standby set, while the active register (Side A)
> remains at 0x00000000, preventing the display engine from
> starting.Debug logs collected during resume confirm this
> behavior, showing the start address written to the standby set
> while the active register remains unchanged.
>
> Prime both register sets when the LCDC is stopped:
>
>     If DO=0: Use lcdc_write() to force the Start Address (SA)
>     into both Set A and Set B registers. This bypasses the
>     switching logic and ensures the engine has a valid base
>     address immediately upon being enabled.
>
>     If DO=1: Maintain the standard Mirror mechanism and MRS
>     toggle for normal, tear-free operation.
>
> Verified on R8A7740.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Thanks for your patch!

What do you mean by "deep sleep"? s2ram? In upstream, s2ram behaves
the same as s2idle, and the LCD works fine after resume from s2ram on
my Amadillo, with and without your patch,

What am I missing?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
