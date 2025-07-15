Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FACB05CA5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 15:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB5C10E215;
	Tue, 15 Jul 2025 13:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Om3RG4Gp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCF710E215
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 13:34:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 57FF445E89
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 13:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B7AC4CEFE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 13:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752586487;
 bh=+5fnVYi8jGUiwllSXfccJ9ZG874S/+1gUDYyvoKFb0M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Om3RG4Gp7iPuBcFfzV0TJrXSvVZ1ziTXeDG8NIjHzeKf0fzxyzu5ewG1JJjYIBDEh
 oMSlbAknTx0ATbzw8IpDlNBIrVW1lnP16fyzsfYVc8m2i8t74qls7qpTRI/P7OaYVc
 KXCsvanIabf18oIFopxNwYFsSaT8eOo7AiatP31ifLhGzXVqrVk9e5PUixsZudYIJ4
 XQkjYpDTnIyf1Tnn8whwjtnj+T5Ygx5q19IlMqCmDHati5kjPJYO+Mk2NdzGwhLMqq
 wqNzqzPR/BjhVlVfVFNVVKBr1g+0D7TLomCWzuYZ79x3izp2CvaFAvbhU3NSfX5CSV
 m+shVTHiN8DMg==
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-60867565fb5so8927161a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 06:34:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU9uuyrSil0JGECU+ySVMsBqb6ulLJ0ZMqTq2Aop0gU9+YiHGTOojczKuD1JlGhc+d0pG893BZ47fc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/8zIbu7WqRJo+vlKCXgbZThZLuZn8DFEigVAai7BZ4JIdrHF6
 fKDhDZc/Br7M6L03qTJ5T7zZIIVMI2k2B3qIGf+/5psDeTch8eOdR/Yqe2KZMkLRPaM0vTf+RzJ
 empa3zrT69Eh/QL7uY268GydQFp5gBw==
X-Google-Smtp-Source: AGHT+IGRu2JZfsUA5LKiQLqa/UEZNxt2u/LBgONat/gO2EH38uOyxF+eGpc7ilCTo4wwSiYodRP/HpFAhZMX9LDqasw=
X-Received: by 2002:a17:907:9686:b0:ae0:dcd5:ea75 with SMTP id
 a640c23a62f3a-ae9b948923cmr254110266b.5.1752586485564; Tue, 15 Jul 2025
 06:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-14-tzimmermann@suse.de>
In-Reply-To: <20250715122643.137027-14-tzimmermann@suse.de>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Jul 2025 08:34:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKSjQy8CVohbVL50kn=o_kPVUsAUFjYvNC3mpcA7pm_Og@mail.gmail.com>
X-Gm-Features: Ac12FXymC2XmqYlRUlcYFWrwlgiDEh1VRFeVs1QRm6fJt93kN_btbEF-gtsl3Qo
Message-ID: <CAL_JsqKSjQy8CVohbVL50kn=o_kPVUsAUFjYvNC3mpcA7pm_Og@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] backlight: rave-sp: Include <linux/of.h> and
 <linux/mod_devicetable.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, 
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, deller@gmx.de, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch, fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com, 
 ilpo.jarvinen@linux.intel.com, sven@kernel.org, alyssa@rosenzweig.io, 
 neal@gompa.dev, support.opensource@diasemi.com, duje.mihanovic@skole.hr, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jul 15, 2025 at 7:30=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Include <linux/of.h> to declare struct device_node and include
> <linux/mod_devicetable.h> to declare struct of_device_id. Avoids
> dependency on backlight header to include it.

struct device_node should be opaque...

        /*
         * If there is a phandle pointing to the device node we can
         * assume that another device will manage the status changes.
         * If not we make sure the backlight is in a consistent state.
         */
        if (!dev->of_node->phandle)
                backlight_update_status(bd);

Well, that is ugly. IMO, we should just drop the check. A DT built
with "-@" option will have phandle set, so that's not a reliable test.

Rob
