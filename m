Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DF160B4C4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 20:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D91110E6E6;
	Mon, 24 Oct 2022 18:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6F210E6E6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 18:03:15 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id l6so5094807pjj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CPf6G/73Hd0s0zh7PYg5rvhdRmvS3jQjXsc+lqFusyc=;
 b=aK7rr4hTJtbRNOulFuHnHfwCjuuBLuXPDU7X6Pd78YSglIK+xG0EewzkI8thUhuudh
 N86uG3cAkJHU/p+sVY9ShGCrZkcqa5TBtFL6vhefQk9kIsXMWEIc2fYjnrlILBuSeiW3
 F/lIbVIHXQNKAR2rGxUAH2e7vlSRoIC7/KD2KLSYQ/xHsK4xBShSigtomJV2HVbTZhCW
 1KM7jGPx/dsQl67bfJvZeQeYn0yJFZwMmaZn+UQFW+2ZGIXDnYt0ttwLRK1zJYhlNgtb
 J4rEBgm3LG+4czsUZxxbYUqAtw5B3cW5b/1mkAN2vDDXLZLsHRps154Zo5YHnci47hOW
 QZdw==
X-Gm-Message-State: ACrzQf3snpA7lSKIBzmED90aAepUUPYIz2ApdI2SAkX6OsZw8IT9rj7T
 mxSbjM9XP8jsdw7RDBwlgy5d8A==
X-Google-Smtp-Source: AMsMyM4Gm7Aig8YT5fRJeyMGddzfvxxYUrUEmpPq2PCQ/RGA1i1Qlql9jRoJlFidSVPdqq8RCQds4g==
X-Received: by 2002:a17:90a:fe6:b0:212:bfc3:31f5 with SMTP id
 93-20020a17090a0fe600b00212bfc331f5mr25482041pjz.215.1666634594766; 
 Mon, 24 Oct 2022 11:03:14 -0700 (PDT)
Received: from localhost ([75.172.140.17]) by smtp.gmail.com with ESMTPSA id
 mj19-20020a17090b369300b002131a9f8dcbsm1291814pjb.46.2022.10.24.11.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 11:03:14 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 14/17] ARM: omap1: remove dead code
In-Reply-To: <20221019150410.3851944-14-arnd@kernel.org>
References: <20221019144119.3848027-1-arnd@kernel.org>
 <20221019150410.3851944-1-arnd@kernel.org>
 <20221019150410.3851944-14-arnd@kernel.org>
Date: Mon, 24 Oct 2022 11:03:13 -0700
Message-ID: <7hbkq1hzfi.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-fbdev@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-omap@vger.kernel.org,
 Bin Liu <b-liu@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> After the removal of the unused board files, I went through the
> omap1 code to look for code that no longer has any callers
> and remove that.
>
> In particular, support for the omap7xx/omap8xx family is now
> completely unused, so I'm only leaving omap15xx/omap16xx/omap59xx.

Acked-by: Kevin Hilman <khilman@baylibre.com>

with a few tears shed since omap7xx/omap8xx was the first family I
contributed to upstream. :(

Kevin
