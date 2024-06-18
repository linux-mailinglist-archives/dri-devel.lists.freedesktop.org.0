Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0C490DE11
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 23:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501B210E192;
	Tue, 18 Jun 2024 21:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="xwFXJJEq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E688310E192
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 21:19:33 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-70623ec42c2so196409b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1718745573;
 x=1719350373; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gBOXu3AX8iawimeoI7cVv0ed5p6W28OLisBmj7DoqVw=;
 b=xwFXJJEqEyw+eJvY4w3SVs1TK/gW3odhAgFQZDZLh8nFfgf+SToB0kB6vvdk24A4/r
 BlMEgy6vSR4A7HCUcvGZvS6zGhF3oAXO955sQSkTQEwvroe4wCdq8Vk6eV37P/HVX7Ob
 PheOZ1ZIRG9JnXzcQDAMQxtsXNIV3nq8rRegT99UH9c1ziK+/3sHuKDf1IFEVqRnKbty
 aph6VqNrUIxd+WNIGNxMdpQpulIDIefIogAoy0s150Yrz3XW2PeZZ530gs9xU3TOLPch
 jJZawfT7GysODJ6Rlj99S2HTx8duY0TNogZeY7ywMFQMS/o2g4DwD6lfJsUy82ETNJBP
 ycCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718745573; x=1719350373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gBOXu3AX8iawimeoI7cVv0ed5p6W28OLisBmj7DoqVw=;
 b=wthD13/WlTQublmOKp4j3i5WusKwPbFnztZkGTVeLum2QwbEyPjgioeORTwk8himhh
 +fJUyDaFU8WJ6oPqIypLxiDx9UMBPm80e0sxOriiCC6XZsIwy5ShIf317PwjWpzwLFwy
 VtdWiivcPs4VlDd1WFoOW+h1+/s/Z+6z6yGjAGlKA4CdcMwL7Yw+E8D8Kllo8VbljQmW
 21Yw92+7kCQywiu75JDcO0+Op5TlphbV+Thk6K+R3HKFVatD9AjVF1ThB2ThGkkAxOgU
 u7DILtKoreIdYXpTnXXlz7k4EWsyYu87xjZSbTRjxbCK+NumV7W6ZgI8oBzcdOgBgmj7
 fPBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEVcDwH94dA+q9QkhTR2HCVLblhYPq2TveDpF0CK4Qx1VAC3HGIwYhXGTw0C8b6GRbujvtK5NbF7mP+LlKK/nJX7fD2F6O5cKiAivLSEiE
X-Gm-Message-State: AOJu0Yz3VthzBDtKPWDjVXZ/Pd1ptQnhTxAOUJp8TQr1jfxXDEWhfjt/
 KBMTj4BJlYPMu43h14+zIqMQFjLm4EsR7CiAc8XU2OorcqyH87Vqg5SW1QCAsCI=
X-Google-Smtp-Source: AGHT+IEDJdHgqhnpdjG6jF8Kggw629x32bz6eKrC/MAgTBCxU/oW9mH69BRNudTCCPM3Uu+J0MTMjg==
X-Received: by 2002:a05:6a20:3c8a:b0:1b4:b9f0:ffc4 with SMTP id
 adf61e73a8af0-1bcab0528d7mr5844124637.18.1718745573134; 
 Tue, 18 Jun 2024 14:19:33 -0700 (PDT)
Received: from hermes.local (204-195-96-226.wavecable.com. [204.195.96.226])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-710744224c4sm390475a12.66.2024.06.18.14.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 14:19:32 -0700 (PDT)
Date: Tue, 18 Jun 2024 14:19:24 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Omer Shpigelman <oshpigelman@habana.ai>
Cc: Joe Damato <jdamato@fastly.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "ogabbay@kernel.org"
 <ogabbay@kernel.org>, Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Message-ID: <20240618141924.5a62a3d8@hermes.local>
In-Reply-To: <16369c7d-af15-4959-9e84-8a495b6b5035@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
 <ZmzIy3c0j8ubspIM@LQ3V64L9R2>
 <16369c7d-af15-4959-9e84-8a495b6b5035@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 18 Jun 2024 19:37:36 +0000
Omer Shpigelman <oshpigelman@habana.ai> wrote:

> > 
> > Is there any reason in particular to call netif_receive_skb instead of
> > napi_gro_receive ?
> >   
> 
> As you can see, we also support polling mode which is a non-NAPI flow.
> We could use napi_gro_receive() for NAPI flow and netif_receive_skb() for
> polling mode but we don't support RX checksum offload anyway.

 Why non-NAPI? I thought current netdev policy was all drivers should
use NAPI.
