Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A57084B211E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 10:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBE310E344;
	Fri, 11 Feb 2022 09:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3835310EA27;
 Fri, 11 Feb 2022 09:00:56 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id n23so15150160pfo.1;
 Fri, 11 Feb 2022 01:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TYfaiwKavc3e6ks5kgUb85H+DdokL0giIO6Sl6/ijvM=;
 b=YirJZ/OrUY1KZE/c6Pg4WKdA/DVfcwtcmgwJ5LeUBhEbafCWoTh9dRaxYHbAAlx5/C
 U2C+6mW0+lJAlHWtOg6Jfruy1phkB55fCjanV518XXMonO4Hm6ZSmv0a+hkiWX4Xf2l2
 F9WP7bUMgjY+zB++WmbReucO/ta2ZBOXgrg92r7OGhkWQy37UA+S//xb9jpWn5ZKj96y
 LnpuDVcC32NCF4RZ+6aqEftgT8/PJdiEZnC+VclBeG3Ei8dWYSEKoWoxv52Zf/WhHGnV
 07bulekwlPGroFxqE2alC/bi7t4P/vt0jqRGa474mzrGuPqiaFj5qHcTUhc6uew3QFCw
 KNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TYfaiwKavc3e6ks5kgUb85H+DdokL0giIO6Sl6/ijvM=;
 b=MuvnwSIpa+QRzcC3Rc5w2fpUWi05xaSUfLnteha2U7gBv9igKYuB0wynCu2tsLeOFI
 Zl/HDAld1iq3kq0jNXHPKhy82dHnFjuZr0fZ234vjUpwci8SXJ3KhbrCV6eGubb+h2DS
 y5HVOumflR1dl8PbuRrtnW+bIJHrfQ+lMsECqtUroCO+4DerpF0xOGcJJhZ5S/Rz8DUW
 o7GdaS9uR1EeRCLYkou0qlRhW2Eil6fANb9n/rZyMs9rqh1C+5fcHQpojq9rgp0FPI3g
 VbXZcI6McoZy490XMaqblk7x75i72SEOVMGO5tA6uyMGYkii+rCQgABE/Dep/f49RNJv
 CvKg==
X-Gm-Message-State: AOAM531bgSN06zZboAIYKoO3AKxmiFVY7IKkCPHd5EPiIzJv7QgMXnKv
 JVAM8Vsr4UQZrGinopK33oxfVRilteltTa3DkS0=
X-Google-Smtp-Source: ABdhPJzcBNwwDsrsLQTMfyhXlsVQPJ2eITAU351K13T2qQrMZreubqDuNlWvqA9y1Wv+mW0Rsuhg0no4yZY/uUPEJeI=
X-Received: by 2002:a05:6a00:2310:: with SMTP id
 h16mr697184pfh.80.1644570055706; 
 Fri, 11 Feb 2022 01:00:55 -0800 (PST)
MIME-Version: 1.0
References: <20220210224329.2793-1-mario.limonciello@amd.com>
 <20220210224329.2793-9-mario.limonciello@amd.com>
In-Reply-To: <20220210224329.2793-9-mario.limonciello@amd.com>
From: Yehezkel Bernat <yehezkelshb@gmail.com>
Date: Fri, 11 Feb 2022 11:00:39 +0200
Message-ID: <CA+CmpXtah8AeVehExk0+eagyP=DQOPEy18DW3t2rQ0ZjyMk-Rw@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] platform/x86: amd-gmux: drop the use of
 `pci_is_thunderbolt_attached`
To: Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 11 Feb 2022 09:11:21 +0000
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
Cc: Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Alexander.Deucher@amd.com, Mika Westerberg <mika.westerberg@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 12:43 AM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> Currently `pci_is_thunderbolt_attached` is used to indicate a device
> is connected externally.
>
> The PCI core now marks such devices as removable and downstream drivers
> can use this instead.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/apple-gmux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index 04232fbc7d56..ffac15b9befd 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -596,7 +596,7 @@ static int gmux_resume(struct device *dev)
>
>  static int is_thunderbolt(struct device *dev, void *data)
>  {
> -       return pci_is_thunderbolt_attached(to_pci_dev(dev));
> +       return dev_is_removable(dev);
>  }
>

Maybe it's only me, but isn't it a bit strange to keep this function named
`is_thunderbolt` while it's actually about being removable?
