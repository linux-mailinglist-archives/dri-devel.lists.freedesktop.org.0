Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E50A77DB8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 16:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9452310E10D;
	Tue,  1 Apr 2025 14:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="bQCmc3Fi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673ED10E10D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 14:29:49 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so45471905e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 07:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743517788; x=1744122588;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4+DXyGZpy3baMIIEpJypfdpYsotPYKsxA3mI/UuDijo=;
 b=bQCmc3FiJhjKZ9xOLoaxjFBBCfCoECX6jVbudVgxCZBlVAXQjiyC1yJSrCOfM9mFv9
 /TGLXiEzNCTxEqnkYERjOT5U1TaAruLRVJ7gsrpWM+uYfKM+x+Ai7LA6tyXwe5hO9hv2
 E3MLK7JWJA73HYrqCGGYSKmwrnqGUKhfTUWoryK/EL1eepIU7t1J/SguHH0pqsBN8zvE
 ZSf5x7xFoaaro3aLEXYkd5DGxqIKpdpn8DGkuudEueRrwyG0EGAVM1W8+49HR03IKv7s
 Rh0LkLxyUWGN4KCMYaypCGJEOFLpp6Eqc6dumz/Mfnh874ilLJx1rRaYteyiOLqWRc1j
 ekJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743517788; x=1744122588;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4+DXyGZpy3baMIIEpJypfdpYsotPYKsxA3mI/UuDijo=;
 b=Er14jEUY0ee4BxcJmhS0Zx1CfN3CQObmpPaoOaGiH9jznxRwH5UrAjW2ggtIbM5ABI
 IaRE3GUADwB36oTi3hFIAnJzkI3EMIZw6cP4ngQKntjmYQDerHtVxLt/VWnuiyngKEIN
 BrHuZ8t9m9ZlFxZar8E0YCMbO0mJ11202HOvzz7SWeYliMDJgvB9BKTF95Bx7zzrTTZk
 tGbgnWo0LaEbQuate00k+PUtSOyVSkSe3VY+vtFSALikQWHGaY6a+0UfcGDRLnh5QV66
 VTMWnwXBTJQYccgjPVcMRIk3Y1NdhbncR6gKTtbGHkn9kq8Hypn1xhunQZfRxYzVhvtA
 yj2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgoC2VCJx5SyOjYQJFUBHQF9Rx+42Fr4TIWx0ZuAuaWXxyhceyWZ6If4/4ws+sb8SLHQhyQt/2y7c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDtcKKhP99sXgIwJ2rwAQCdf5HWDtaidzjFHKeg2Pg/6GNJyKg
 wLQdeJ4BLZCztp4gl5FQAQifrvIhcQ0fs+gYBRik4B6Kq5o1rUyvCkhZAg840oQ=
X-Gm-Gg: ASbGncvfXx18uuhkpOZIZy7OWBhqDKBxYMtzDmWJmd+wfG0gI55SyNimqrUhUkCZNYM
 ag8XR/Z6rtEXuoG3RCeDxDgo3FXrda/EOnOsMb6PIVsYJbgYFT8V+LZjfYOsEFageO4PGhR7ZLm
 9b/uhphIP+6785b2lO0vYr7VHSC6az0zD+jnfAM93nF5eG0et8qX6gJJpTzDSJyUJ5B3zWUSiA9
 2eypHHGYKlyl/qcpTQG2sFilkcLy07a412J34Cus6M+ES33Z/hHJhNDtFB+8NM482weQF1rrZra
 GvST2G+AZwNodqyLAHyX/iE4ETOpCSzoG1GjYORhlZ3uvOMDGQ9NGcid1EbJY0DdyWVsaVKKGo2
 PNe8SvuQUdk5ks0xaAG4SWQxoqq4=
X-Google-Smtp-Source: AGHT+IHNx4vQ9HZX3k4j4jTP+pXfpW+zl8Y4RdgON0AYVMnFWqF1w5VQnDHa4fobYb4eHhHiNIy/Pg==
X-Received: by 2002:a05:6000:18a2:b0:38d:ba8e:7327 with SMTP id
 ffacd0b85a97d-39c27ee84f2mr205051f8f.8.1743517788210; 
 Tue, 01 Apr 2025 07:29:48 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66a9d2sm14254936f8f.43.2025.04.01.07.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 07:29:47 -0700 (PDT)
Date: Tue, 1 Apr 2025 15:29:45 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Haoyu Li <lihaoyu499@gmail.com>
Cc: danielt@kernel.org, chenyuan0y@gmail.com, deller@gmx.de,
 dri-devel@lists.freedesktop.org, jani.nikula@linux.intel.com,
 jingoohan1@gmail.com, lee@kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org,
 stable@vger.kernel.org, zichenxie0106@gmail.com
Subject: Re: [PATCH] drivers: video: backlight: Fix NULL Pointer Dereference
 in backlight_device_register()
Message-ID: <Z-v4WansLWJtv9CV@aspen.lan>
References: <Z65fFRKgqk-33HXI@aspen.lan>
 <20250219122950.7416-1-lihaoyu499@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219122950.7416-1-lihaoyu499@gmail.com>
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

Hi Haoyu

On Wed, Feb 19, 2025 at 08:29:50PM +0800, Haoyu Li wrote:
> As per Jani and Daniel's feedback, I have updated the patch so that
> the `wled->name` null check now occurs in the `wled_configure`
> function, right after the `devm_kasprintf` callsite. This should
> resolve the issue.

I'm afraid this patch got swamped in my mailbox and I missed it.

Worse, we've just been discussing and reviewing a patch for the same
issue from another developer:
https://lore.kernel.org/all/20250401091647.22784-1-bsdhenrymartin@gmail.com/

So, I just wanted to acknowlege the mistake. Sorry.


Daniel.
