Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D2F613E98
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 20:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A7710E15F;
	Mon, 31 Oct 2022 19:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4291C10E15F
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 19:55:20 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id a67so18965026edf.12
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 12:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DF4wkWvWXegmip018YfFTMUIfpvZ++f68WTZSD1bWH4=;
 b=b/AhgHxwilfewDUeFdF7w5tS1qudHYwzeXYHCeNTee8gy7zQX39fPcLeEM+Wg2XbVc
 OMXGEWO82RD7yGQEkDfRc2i0aqOuYklgxxBLGlc3zsxIFDUxm5azTpth70VNAT6C/K0V
 Sp55l2H8ExCVM971zGFtptSmbXODgOa63SoNl/bpXl2unUrPP8r7gJoRJ5lyg749pl8u
 tk7UmZgFsHQ6SrAr8fiCmWbrqAdFMgUuBhxhyH5fE2JHga4rzsYrQkaLeck9SCqq868x
 v9dDgVFzZdrz6jmTK0GaAXL6a36GJmr4G2f5Kt0kQpPmy2lPsBMyIQ8bASyY8Ivup2CE
 0YnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DF4wkWvWXegmip018YfFTMUIfpvZ++f68WTZSD1bWH4=;
 b=zN9nlvn9woR4ZJ0zK0Q11CLEZ6gIVthJ9mV6LZj08uQgRop/jkLT860hZdaZHjPQGb
 LjUT+6afKMoM/D5PZds0eZZoT0iECfwA5fOU99/ZEmzYIfRCMrNT1UqkEtWyIoJ+WiM/
 W/Lv5uGZKpbJcpcnkg/YE6AniMSVSJhS5GFXguZaKBgFUTYaDEId+jpOYQJJDwaWF+d1
 IpaDcBtjEpdvKYfWU0wWdLyeOt6tHqKPQZtvaofWS/yC7+0nH4AXqO/f1j/BIxM/ceDl
 Js+CMpAk8ru7rlnvYZ3Ot/zDw5qJeUkysKFpftCnmlBLN4XclFW8/aGPij3t3Nlhr5ny
 3/lg==
X-Gm-Message-State: ACrzQf19JXOKJr63AkLGCdNIJWx/0yfJ/v6oklJFuS1qjjeqHMbJpTVA
 mC9gUjdKVMwAyT9THeiQRMOvXNVokNZvwj802ZLfaA==
X-Google-Smtp-Source: AMsMyM56VjnjVqw1pPVrEHK3+oaJydtdMBXaE2SuGomtgUtwtlegLzPacGGZ1UIeWQGuFFHcB8CXww6lQcbWYaPdUiY=
X-Received: by 2002:a05:6402:1bdc:b0:463:6315:1b96 with SMTP id
 ch28-20020a0564021bdc00b0046363151b96mr6249924edb.158.1667246118524; Mon, 31
 Oct 2022 12:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221021155000.4108406-1-arnd@kernel.org>
 <20221021155000.4108406-3-arnd@kernel.org>
In-Reply-To: <20221021155000.4108406-3-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 31 Oct 2022 20:55:07 +0100
Message-ID: <CACRpkdYayAm4rxg3taUqDa_9YCTK+EFiGKAoMETQd+yg1C83-w@mail.gmail.com>
Subject: Re: [PATCH 02/11] ARM: sa1100: remove unused board files
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Stefan Eletzhofer <stefan.eletzhofer@eletztrick.de>,
 linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org,
 Lubomir Rintel <lkundrak@v3.sk>, Peter Chubb <peter.chubb@unsw.edu.au>,
 Alan Stern <stern@rowland.harvard.edu>, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 21, 2022 at 5:55 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The Cerf, H3100, Badge4, Hackkit, LART, NanoEngine, PLEB, Shannon and
> Simpad machines were all marked as unused as there are no known users
> left. Remove all of these, along with references to them in defconfig
> files and drivers.
>
> Four machines remain now: Assabet, Collie (Zaurus SL5500), iPAQ H3600
> and Jornada 720, each of which had one person still using them, with
> Collie also being supported in Qemu.
>
> Cc: Peter Chubb <peter.chubb@unsw.edu.au>
> Cc: Stefan Eletzhofer <stefan.eletzhofer@eletztrick.de>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
