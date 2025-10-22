Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 574F7BFA2A5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 08:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E2510E141;
	Wed, 22 Oct 2025 06:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="dK22UHSm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4F210E6A7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 05:42:16 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso46539775e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 22:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1761111735; x=1761716535;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qoA1WWVRov6H7a5xUEiwI5O5mAdzyiICIeuaq5U1Y4A=;
 b=dK22UHSmpWlr9FojCbngvt4nTrH0gZ3hZYCdjdaEuS0OFXoEIV1ObR6XAMpPWYTYYm
 qfxkUEVm+M6TYxd86laeSq9QvEQTYNf7dMi6+ODyvNql1Skay49sEquNe6+9+7NZWD8e
 fnvpJwHCc143jItm/HD2/dMATw6HZ448rBKjh7oBuQ7rCKXMEQ5KHlSl0jqQkV0J/T/Y
 XKHExqAiOEcKWO38S3cnwvKvAa7CCiSwCwJjo3bV4YqMeOvlsovwpmsYgaylHhHXhPBp
 RmpdMMePX4K7hSzpgCqQC9eVuI8aE5WkZ11phLX6ZgeF81iWOOuVzS2GoZzcLrKfKbA0
 e/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761111735; x=1761716535;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qoA1WWVRov6H7a5xUEiwI5O5mAdzyiICIeuaq5U1Y4A=;
 b=vuK492lDMlpUlux75a2C+M5khjID3HUf1ocDd+9JIgiAEnaQz3TaoWHuLRRFkfu53T
 Y7+0TXjWtkqiE4cmDpJ612mehStoN0pxbI+/SWOBltuhA6RXeQAh03wWOQ//2n8taVvO
 F+z2tMLF1cEvCJQ3hnaBdqNv/0+h3q8ArdzQNQYK3qApzsWs92xQGBOKcB1cK9K0GMdk
 p0yfpjpc5CSXT7fu6ev2Vbff6rP32ps7nRaUIMi9NSWt6ONmUS61brrBiDyy7wppCl6l
 DHA/eyJHtrHvFoWVav7B7Y57Cd5SafkJDfiJRX/vzURwFNP1RISObXFHw61nOMrWa4Zp
 xDhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaNH2NZsvqkRUvnmYzsKHWYaBv8xn/oWI8jfxEViwnLK1BynxWISGZJ59TyT9lC63GebMR2wAiFNM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNz6Gu+qg9qFr+sGCIGYHjsvEE5pF078cALl/BafIf39rTT59l
 aaNW3B0di0YnhCiXifxFHupe7QS+t82CrrJ5UMXJB8ViB2CEEqqKWUo=
X-Gm-Gg: ASbGncv1Y1a7XCM1Rw9joYfhjkmigIAipIJuYDclCWSnb/MPi+se+faUK05syXHuPaB
 foW3JBFAncYVhIJxetsLol/Rd7hei4cSEMJs9kFeeWVRnC3+8Tw2esMMhQv8DqYJ9EaQUD9QgNv
 009eX25QlyxhP22I/G64DgmSDiTYfyFHU6BdtcsEIU12HIGygWPlPtceht0kxDdCxSrldW1sGNR
 e1n3pFILiQu0iYRyDfsvPRByoscE2ME7nog/0Dbm+EjQDxQa4YrLqlu7UGM3WamDMDNfZewisr/
 pi4aZB8RHkNHqnFgAT2GcpckTVrnJW/4WLh31Rh4M18ZEqIzYk0N8xZOEY1LZ247IUxvZ19NgE7
 Dhz0L8msqKFAhOoO+dRdHRH0Gj6CMoAcDB+TioYXxzdwdI3aruktWqqBIKLqjhyRknjTzWugC7C
 TzFN1DaSsNbK9qjImetTofTIGMEoylLVQFgd7evT+Eu7csh9U6JvQdlX2eFB1aaQ==
X-Google-Smtp-Source: AGHT+IGWLldgO9eeUo0uqFHesf5QkUIf3hAgpxI4olpESlwkKLLpF1ZgmVauywZSpSoCic9nLf2kJg==
X-Received: by 2002:a05:600c:470d:b0:471:7c8:ddf7 with SMTP id
 5b1f17b1804b1-471178a7447mr126370715e9.14.1761111734829; 
 Tue, 21 Oct 2025 22:42:14 -0700 (PDT)
Received: from [192.168.1.3] (p5b057850.dip0.t-ipconnect.de. [91.5.120.80])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496bf7137sm30354195e9.3.2025.10.21.22.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 22:42:14 -0700 (PDT)
Message-ID: <7015844a-7eca-469c-9115-b84183a94154@googlemail.com>
Date: Wed, 22 Oct 2025 07:42:14 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.12 020/136] drm/ast: Blank with VGACR17 sync enable,
 always clear VGACRB6 sync off
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Nick Bowler <nbowler@draconx.ca>, Douglas Anderson <dianders@chromium.org>,
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org
References: <20251021195035.953989698@linuxfoundation.org>
 <20251021195036.457336682@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20251021195036.457336682@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Oct 2025 06:07:43 +0000
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

Hi Greg,

Am 21.10.2025 um 21:50 schrieb Greg Kroah-Hartman:
> 6.12-stable review patch.  If anyone has any objections, please let me know.
> 
> ------------------
> 
> From: Thomas Zimmermann <tzimmermann@suse.de>
> 
> commit 6f719373b943a955fee6fc2012aed207b65e2854 upstream.
> 
> Blank the display by disabling sync pulses with VGACR17<7>. Unblank
> by reenabling them. This VGA setting should be supported by all Aspeed
> hardware.

This patch breaks VGA output on my machine. I have already reported this regression against mainline 6.18-rc2, see here:

https://lore.kernel.org/all/a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com/

When I revert this patch from 6.12.55-rc1, the issue goes away, just as in mainline. I'm still going to test 6.17.5-rc1 
too and report back, but I guess it will be just the same.


Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
