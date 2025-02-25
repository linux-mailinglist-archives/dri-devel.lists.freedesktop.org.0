Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DDCA437AC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 09:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6458010E5AF;
	Tue, 25 Feb 2025 08:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="E9jiiyGd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888EF10E373
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 06:30:05 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-3f3eade4116so2262244b6e.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 22:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1740465004; x=1741069804;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:subject:user-agent
 :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4+mBAQq6Mkez/2/DMWHStf85qnBYyGFLVJqfvqnbkxk=;
 b=E9jiiyGdyAHr5bDdlryjPlLUQgR7TE9+TQvy7uAs1Nnvj2UhO11xuZxeJ+hPtp8p1E
 QM75puQ0WG+fdXCP2KFtQpAY3LhvG0oNlSUXyOp3MCRAyzOIkGJtjfrJy63aJdZyBn+4
 PaDzfkL0zcM/57b3Y+z+3RZcm0FZ23c8s9lqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740465004; x=1741069804;
 h=content-transfer-encoding:mime-version:subject:user-agent
 :references:in-reply-to:message-id:date:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4+mBAQq6Mkez/2/DMWHStf85qnBYyGFLVJqfvqnbkxk=;
 b=krLGVAiYG1c3DxZbxQJXPL159XrFs4v33aZuP5z0E2BDLzCHqQ/Na5o6pI1pKpRycr
 pvW8AV5GYY/0fpybwcdV20dPBHKvfl0LKGba+a09GK8k84H0y8TTqFMAottzZlUiKbSI
 8K4OiLbXXry+sMGK7ogJ4yp1EKW3LjeEF51JgrsQqNj43JahN/BzuUm/e0zo2ibFUWdc
 T2wwbjI9hqDq2+Z9iiCqjkK9GCcZc4StRTULs6OqfN/+D0kSXc1EReqytIAu0siSaRj7
 OVpCkMunUTyvja1pSI0+ibFFyoCqGBFvLfwD594IsjAL0Dm1RbFI9i/vO5VuaUlx1Acr
 VArw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVEWAjEy3xkNyFiVUoJ+TN6uLqTcFQWhVbflgFhzqzUf9rRgJKx49wGdLuOCHpjSLI4/iv7JHZPPI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfJOUykJscaiU+8CaDoekZf8iZLc5ZA27Uj6m1Z23VD81CItui
 1wAGogIsmoepL8V2UEkQ8O9H4vZhDc4XzSTgpu1Y+DW6VOh2ttdb8gqJPgDo2g==
X-Gm-Gg: ASbGnctYaezhU1TAHTjkyLxc1Q1B6kBC1m5LWsATrg9fK/fPrKHEgcaWkejKTPkdBxu
 rr2Wifc9dFng5yTB8EX+yxuUGTfF5OtoCueUYPOJhsU5PFCCwmxuSGEe3bqP5IGewnqgtFqiOop
 yuHlHA7i/RljB0LM2zhuJO9Ga557b59iDHrQ0MnGBd3Ifr6FbZFEr8sMkY9K2wTRPrqbRuQmg5t
 FeHWx+qn6aUvmtUuG+UK9EWoHgviLKF5/dK/3NXXL5iXjk2vcjdyyqNv22R82QFeUtJ4KRKNYSI
 oaGfXMVtv4cjweAk9UdrHNeezZbT/akjxyZ26AmKyN8xU6PB72ktjjueOUogOeFc
X-Google-Smtp-Source: AGHT+IFdXMbhGx7fP9GFKGlpguOITWaZZGOBzMRAt9OnDAJpr0Tf6LoZNYE9WcUj4WMJOinaxdWK7Q==
X-Received: by 2002:a05:6808:3c8f:b0:3f3:e8e7:2001 with SMTP id
 5614622812f47-3f424777eb0mr12305946b6e.26.1740465004283; 
 Mon, 24 Feb 2025 22:30:04 -0800 (PST)
Received: from [192.168.178.74] (f215227.upc-f.chello.nl. [80.56.215.227])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f541bd992bsm190300b6e.16.2025.02.24.22.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 22:30:03 -0800 (PST)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: "Kuan-Wei Chiu" <visitorckw@gmail.com>, <tglx@linutronix.de>,
 <mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, <jk@ozlabs.org>, <joel@jms.id.au>, <eajames@linux.ibm.com>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dmitry.torokhov@gmail.com>, <mchehab@kernel.org>, <awalls@md.metrocast.net>,
 <hverkuil@xs4all.nl>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <louis.peens@corigine.com>, <andrew+netdev@lunn.ch>,
 <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
 <parthiban.veerasooran@microchip.com>, <johannes@sipsolutions.net>,
 <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>, <yury.norov@gmail.com>,
 <akpm@linux-foundation.org>
CC: <hpa@zytor.com>, <alistair@popple.id.au>, <linux@rasmusvillemoes.dk>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <kuba@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-fsi@lists.ozlabs.org>, <dri-devel@lists.freedesktop.org>,
 <linux-input@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <oss-drivers@corigine.com>,
 <netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>,
 <linux-serial@vger.kernel.org>, <bpf@vger.kernel.org>,
 <jserv@ccns.ncku.edu.tw>, "Yu-Chun Lin" <eleanor15x@gmail.com>
Date: Tue, 25 Feb 2025 07:29:46 +0100
Message-ID: <1953bcc1790.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20250223164217.2139331-12-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-12-visitorckw@gmail.com>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH 11/17] wifi: brcm80211: Replace open-coded parity
 calculation with parity32()
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Feb 2025 08:31:33 +0000
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

On February 23, 2025 5:44:54 PM Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> Refactor parity calculations to use the standard parity32() helper.
> This change eliminates redundant implementations and improves code
> efficiency.

While the dust settles on the exact implementation from driver perspective 
looks fine to me so...

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
>
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> .../wireless/broadcom/brcm80211/brcmsmac/dma.c   | 16 +---------------
> 1 file changed, 1 insertion(+), 15 deletions(-)



