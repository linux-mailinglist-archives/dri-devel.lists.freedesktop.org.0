Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B163314E0
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 18:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1836E14B;
	Mon,  8 Mar 2021 17:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920566E14B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 17:30:09 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id t9so3412047pjl.5
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Mar 2021 09:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=pPr4TEZg8eRFsyyC0gyS8i3k7JNesoOp96Z0bqlYwW8=;
 b=AIgOCaFbfqm0PaTD5lY7ZMlRGv3BK5ulfABakddZh+yraj0Z3osw9OBnVEveESDti/
 5veeMZojLMgcVELHBcHwhDsRxyGdFr/04Qk3eAIZSY/J6G36AFtpcbGeE+hmXx50va3j
 QUQFfh8+8v7XhuVYcx3WW1/d1WX9dHJGebyEWf+aUDHVLEhnU1Bv60Ri5FEF/nKOyRct
 X2eZWLlyF+LuN3IRcDG0TJIagjA+l8aBnC0BaOM4JX8I+XF9vm6TYacx8HQNc0/X2ECs
 hngsoTdA6ZeJYgjE8GaM+6cXJh0qxbfNJmY9ynovnXORcaJ2SpusQTqy8fNMgvwVkpM6
 DuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=pPr4TEZg8eRFsyyC0gyS8i3k7JNesoOp96Z0bqlYwW8=;
 b=nT9Xh7LPbxfa3OYr846prIBowx1zMEiaROEKiVnuBPG/PADIxv3X5FQKwoWJm0F0cO
 UuL1XBPNVrXm0CYcPmDxxbrvPiw9NfX0mQh1ZzYJRTWF0nUlEr0ToxaeqkbbD2+2uecA
 3NnyYEt+6CQ4o6c1OAVb+iFOsIxPAONHhn1JXWEqI2tSTqg5En2NpTw5bX4yE6irmw1g
 i4Gmyc8CLHC18hM0naDXU+7G6gyUhR7trfypTUHWKFpB1wCmVXdEB/wGF6Rev0EXH4lN
 lZfdBeH7zcCP5vt0cBBN62Q30lnHlnqySF/YXA8bMaUpdoWQbqgGlQCWYpi9F98SBVCN
 7duQ==
X-Gm-Message-State: AOAM530QwijFkC90zZJPXovwsEPduP8NAoSWvOUCVTOuGyH1ck+r7W2Y
 3fR2Um+JMrSHhYuZnvRTpevPFw==
X-Google-Smtp-Source: ABdhPJxp5FeOMPK9+lFtnyew8n2+3htoOnuDitU9jh66jK7OhfS4uRrdaIbOVg97usDkp6nVL8TiGw==
X-Received: by 2002:a17:90b:120f:: with SMTP id
 gl15mr25787521pjb.77.1615224608902; 
 Mon, 08 Mar 2021 09:30:08 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id 35sm10489466pgm.64.2021.03.08.09.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:30:08 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Artem Lapkin <email2tema@gmail.com>, narmstrong@baylibre.com
Subject: Re: [PATCH] drm: meson_drv add shutdown function
In-Reply-To: <20210302042202.3728113-1-art@khadas.com>
References: <20210302042202.3728113-1-art@khadas.com>
Date: Mon, 08 Mar 2021 09:30:07 -0800
Message-ID: <7ho8ft365c.fsf@baylibre.com>
MIME-Version: 1.0
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
Cc: gouwa@khadas.com, martin.blumenstingl@googlemail.com,
 christianshewitt@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Artem Lapkin <email2tema@gmail.com> writes:

> Problem: random stucks on reboot stage about 1/20 stuck/reboots
> // debug kernel log
> [    4.496660] reboot: kernel restart prepare CMD:(null)
> [    4.498114] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown begin
> [    4.503949] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown domain 0:VPU...
> ...STUCK...
>
> Solution: add shutdown function to meson_drm driver 
> // debug kernel log
> [    5.231896] reboot: kernel restart prepare CMD:(null)
> [    5.246135] [drm:meson_drv_shutdown]
> ...
> [    5.259271] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown begin
> [    5.274688] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown domain 0:VPU...
> [    5.338331] reboot: Restarting system
> [    5.358293] psci: PSCI_0_2_FN_SYSTEM_RESET reboot_mode:0 cmd:(null)
> bl31 reboot reason: 0xd
> bl31 reboot reason: 0x0
> system cmd  1.
> ...REBOOT...
>
> Tested: on VIM1 VIM2 VIM3 VIM3L khadas sbcs - 1000+ successful reboots
> and Odroid boards, WeTek Play2 (GXBB)
>
> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Artem Lapkin <art@khadas.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
