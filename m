Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE44512F9D2
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 16:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07B66E096;
	Fri,  3 Jan 2020 15:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EB06E096
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 15:31:19 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id b8so41892327edx.7
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 07:31:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RkLCz5in5T2g3YDNyQdgyTRFUwUtav+QzKtl9FKJNLY=;
 b=rZSpa5x4ZYnarKvLANQsBCT6Zb3ODBJMf/4w/srNfpjT2rqp0zXVuFi82oGzW3LeSU
 s+uPiFqZJ4aXEuSwG7+i/42MGkiPWK211FsF9GU+bRoakOOUNffboXZh06DM5o+05wC1
 1UomcoXU5Fr65uQqo0/acPYLyrUTkWdPlFpbJbnpoXoXXIo231J/Q8f6UWmV8PZFk6N4
 rK+GouzulyDigNicoTVfb0yCaAiWm8XtOKxyeyIf3V3X4Qby3YDHTahdrOCG9xN+APqT
 T18D3dSLm9LaTRVdd06RBrpv0dIf4KbtfC3drE/1bAMRYYZgeCzwD1MOidtx5aTi3Spo
 fLWA==
X-Gm-Message-State: APjAAAUqruS0Jnv8RpWkp9ZWg0d5xw2V9wwV3jRYKQxeGWh2eQC7ko7O
 YHOHP9YgmxvLN0JxtpYBMaWeW4t35NE=
X-Google-Smtp-Source: APXvYqzl77yzicOXqt/J6/2uQ2y/howzhUS0RxcEJnAwXCUqUlw15i8iCSvYDMiIzq53zl+PaXtUFA==
X-Received: by 2002:a50:fc85:: with SMTP id f5mr93345532edq.294.1578065477333; 
 Fri, 03 Jan 2020 07:31:17 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54])
 by smtp.gmail.com with ESMTPSA id m27sm7092559eda.96.2020.01.03.07.31.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2020 07:31:17 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id z3so42819731wru.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 07:31:16 -0800 (PST)
X-Received: by 2002:adf:ef4e:: with SMTP id c14mr90003435wrp.142.1578065476585; 
 Fri, 03 Jan 2020 07:31:16 -0800 (PST)
MIME-Version: 1.0
References: <20200103152801.47254-1-maxime@cerno.tech>
 <20200103152801.47254-4-maxime@cerno.tech>
In-Reply-To: <20200103152801.47254-4-maxime@cerno.tech>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 3 Jan 2020 23:31:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v65S32hbbKHRu1W+p7eP3-_uC1qKKGSP+ftkzxEO1egnjA@mail.gmail.com>
Message-ID: <CAGb2v65S32hbbKHRu1W+p7eP3-_uC1qKKGSP+ftkzxEO1egnjA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] ARM: dts: sunxi: Add missing LVDS resets and clocks
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 3, 2020 at 11:28 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Some old SoCs, while supporting LVDS, don't list the LVDS clocks and reset
> lines. Let's add them when relevant.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
