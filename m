Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F13745A60
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 12:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE07710E032;
	Mon,  3 Jul 2023 10:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E7410E032
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 10:36:24 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-313f61890fbso4732690f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 03:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688380582; x=1690972582;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ixKZPqjMUtYmaa1DZf59STOffMkhoGUDgvvQ1w9gmxU=;
 b=pz0dwk4ABASU/bsaehINWP2hrWKMVGOli4cj08a0jsh3za/q/rasrg6XpxZRlZ/cc5
 n1eawc3Rp+oltxx6Y/8NogISdO2UbMJ0JzROiR6FMN9/mmrXb27Ad+F3ch5UZ1lFS2oR
 BTuyqyz80hrUkr1a578tKS+0vAOAEq//koWS6aZIVyaeE21CAOlo8pqxWHuaduD0FojJ
 OM2HWmX0P0SFSgnlx+FVEX+P3tyni1cNBO06taAKgbzCK+fpjKyjhtQQnr9JjcVOSYTx
 +UW69hVXfDMnYDDkhi9OnDsQHBq3yfR8YpiXGwBCO4iSs1KvayYKZGz1FXjuKSQhaKmq
 2Wkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688380582; x=1690972582;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ixKZPqjMUtYmaa1DZf59STOffMkhoGUDgvvQ1w9gmxU=;
 b=MJkWXrwKdSGoN2DLzso1ZL8d4nZjmNlwU4rdg9dTeW/lfFa2BUQy54SPVYa7c6CKlo
 c0n4KGXlWbUU2jVsA1AWg79epKKTIwRLYfKsHyLkeMiYpwXnoU4Ml1DRKZCqkUtkTuZJ
 sZSKK55i/qqxvnl+AmpjCck4v2wFK/vaM4eK4m5ndtp+/W0UDd/TAlEeCrw7qTVuy6aE
 oM4G3dQ50i4Kecf2c4QLX1qGOfHbNIldN0uPVFsA3wF6fcE6SHWlEjnm1AM5i6fuQEam
 XvQncctSL627yFiciIYryMlcUXz2XC8KVIytsFr+SNAENDEioX97qaqZpSbb4gogvkDb
 j+DQ==
X-Gm-Message-State: ABy/qLaaIldY5VRmoXycNyRk5dWS8WZPp2heTXsKoOrziYx4W1qNcJCK
 Om0VM7Gx3VzuNwItTJzR2EtnzQ==
X-Google-Smtp-Source: APBJJlFCtn/MbjA2G8ZvLuBmC6KdcueKpt+ZPYpnE6pacAyeUCSM0gU2+5700Tz56JqYf+INB/Q1GQ==
X-Received: by 2002:adf:cd87:0:b0:313:edaa:24fd with SMTP id
 q7-20020adfcd87000000b00313edaa24fdmr7691744wrj.21.1688380582578; 
 Mon, 03 Jul 2023 03:36:22 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 fa12-20020a05600c518c00b003fbb1ce274fsm10250195wmb.0.2023.07.03.03.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:36:21 -0700 (PDT)
Date: Mon, 3 Jul 2023 11:36:20 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Julius Zint <julius@zint.sh>
Subject: Re: [PATCH 0/1] Backlight driver for the Apple Studio Display
Message-ID: <20230703103620.GB4328@aspen.lan>
References: <20230701120806.11812-1-julius@zint.sh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230701120806.11812-1-julius@zint.sh>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 01, 2023 at 02:08:02PM +0200, Julius Zint wrote:
> I have been using and testing this as a DKMS for 6 months now without
> any known issues. It bothers me, that it needs to be part of the
> initramfs instead of just working out of the box. Maybe someone else
> here knows, how to tell the USB HID driver, that this is not a HID device
> and it should keep its fingers from it.

If is says it is a HID device and is uses HID reports for control then
it *is* a HID device!

In other words you need your driver to register as a HID driver instead
of sending raw HID frames using the USB stack. If you do that then the
HID core infrastructure will ensure the right driver gets loaded (it
has special logic to automatically unregister hid-generic and load the
better driver as soon as one becomes available).


Daniel.
