Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BB9700871
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 14:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843F010E58C;
	Fri, 12 May 2023 12:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE0010E58C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 12:51:01 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6439d505274so6005591b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 05:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683895861; x=1686487861;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8hKOD9Iy0tQGy4fcQ/4Kqxu+FxDMMu7hFSgKPykyf4I=;
 b=NqfM5rnLOQVg+jb+U8/Sth8UTb3RBrch4desjGURYmphgqv6o0MyEsdMy2WvyTpZSI
 TmYbtpFkO/rnBXpBuB8dRDYBRPYLJKgvDt1n3xTpTaGb6LefNDxlB8g+uvVT6f08SOf6
 mU4j5l3vuyhxQK2KuVXbXOO3qQSO7Cm9pGG7N8aXKWc+bGCOzrBNRflYbOL/G06QDKJq
 VVa7lKkaoX1SPRH97nE58mvjS8rLo2wCmE8oe4zmNhqSFAYpKasKMHCI4e6YO3iixfjy
 IpsOTqXNjQYZyY/+KQG90AE5gJW9wgLf5NQ7NlzZiWKlDQamS52pfdMrR8p9ousiaZtF
 mAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683895861; x=1686487861;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8hKOD9Iy0tQGy4fcQ/4Kqxu+FxDMMu7hFSgKPykyf4I=;
 b=PTmVyqKRqIURHwuDxTpWm3s35ErLrk89nCmPWg3e/Dm0VL5Xu75xEqJuGUIdrQvf1M
 zlRHSXLskToAnb7Je74+J0VEbH62KoA3aNsHLmqQKUQVfPsTGRFoxKjJ17mjVkOK8jC6
 qymhf5ptREgg917OtqYXvXvP2g6gzGhKEROP7QedYTW2OOuK9je8A+sQCYCWJ4eNHzr0
 UeMuRdziOWb8dYaSVRmfi8Q8dMCJw91a2Q4t1JyqWCTxY/Y6zoPXcR49LOdboTUH1nAv
 ayAqzM9+Wd/Efs6AsTnxLS199hIl90rnZzSD4IHEos18NyJrdHFfuCDYhvH5o4HsvGz4
 lzCg==
X-Gm-Message-State: AC+VfDw2LOEiCdtdyr+p2trnC0ggsrWYgq8QwzrdiMKXkeWXNvPXRSVh
 4b8bqm77Dns3bG1CLFFK0g8=
X-Google-Smtp-Source: ACHHUZ4rmEAXNT8MNROvPS8CMw3+GgMmuh4hcG+aNoCCCMOyboEKaBOaBbPyFVaiIjspjomoMOheAQ==
X-Received: by 2002:a05:6a00:2daa:b0:643:b054:534e with SMTP id
 fb42-20020a056a002daa00b00643b054534emr29995034pfb.31.1683895860993; 
 Fri, 12 May 2023 05:51:00 -0700 (PDT)
Received: from [192.168.43.80] (subs10b-223-255-225-227.three.co.id.
 [223.255.225.227]) by smtp.gmail.com with ESMTPSA id
 x9-20020aa784c9000000b006475f831838sm5973214pfn.30.2023.05.12.05.50.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 05:51:00 -0700 (PDT)
Message-ID: <492cf425-0146-9608-aaba-e91c819b3eeb@gmail.com>
Date: Fri, 12 May 2023 19:50:21 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 08/10] drivers: watchdog: Replace GPL license notice
 with SPDX identifier
To: Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>
References: <20230512100620.36807-1-bagasdotme@gmail.com>
 <20230512100620.36807-9-bagasdotme@gmail.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20230512100620.36807-9-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Simon Horman <simon.horman@corigine.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Eric Dumazet <edumazet@google.com>, Jonas Jensen <jonas.jensen@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Andy Gospodarek <andy@greyhouse.net>,
 Sylver Bruneau <sylver.bruneau@googlemail.com>, Marc Zyngier <maz@kernel.org>,
 Oleg Drokin <green@crimea.edu>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrey Panin <pazke@donpac.ru>,
 Guenter Roeck <linux@roeck-us.net>, Sam Creasey <sammy@sammy.net>,
 Denis Turischev <denis@compulab.co.il>,
 Manivannan Sadhasivam <mani@kernel.org>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Andrew Sharp <andy.sharp@lsi.com>,
 David Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Ray Lehtiniemi <rayl@mail.com>, Alan Cox <alan@linux.intel.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Karsten Keil <isdn@linux-pingi.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Diederik de Haas <didi.debian@cknow.org>, Jan Kara <jack@suse.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/12/23 17:06, Bagas Sanjaya wrote:
> diff --git a/drivers/watchdog/octeon-wdt-nmi.S b/drivers/watchdog/octeon-wdt-nmi.S
> index 97f6eb7b5a8e04..57bb0845de477d 100644
> --- a/drivers/watchdog/octeon-wdt-nmi.S
> +++ b/drivers/watchdog/octeon-wdt-nmi.S
> @@ -1,8 +1,5 @@
> +/* SPDX-License-Identifier: GPL-1.0+ */
>  /*
> - * This file is subject to the terms and conditions of the GNU General Public
> - * License.  See the file "COPYING" in the main directory of this archive
> - * for more details.
> - *

Oops, still incorrect tag. Will fix in v3 (should be out on next Monday).

-- 
An old man doll... just what I always wanted! - Clara

