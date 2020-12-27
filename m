Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F622E3201
	for <lists+dri-devel@lfdr.de>; Sun, 27 Dec 2020 17:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BD1894E3;
	Sun, 27 Dec 2020 16:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9084C894E3;
 Sun, 27 Dec 2020 16:58:33 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id s26so19176819lfc.8;
 Sun, 27 Dec 2020 08:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=ZkMPV9Td1S5uycOwIvh1VSBjqIoKt6ivrgzO9euGk6k=;
 b=h3UjHTQbZFTWREq+YdFLvQBlQCi9hnxTEZ/35Nh0HoABAJr5WfFqpVpjYGNaB1xmiV
 QSSwbOcRT9t5twuVfXp/+546HHtWj4ntWY8DIRAbGjsm6WyESRiQB8qRKg1zE/zQmJhR
 vmkb6o2KYncK60Tipdq1sej93wypwjkm5qYRGZ3G+doS/RWC/KhBNIeVETy8eNVWxH5F
 cwkOJeJkWFQADKjV/ZLeCANmoWJGRTUcqoRfcXIVI8oqOIuqjkP9zsTLvHY0+7J+wO+5
 AbZ6hNZZn4/D6ZIDjAHlITMUQAS11Z5CtC6iiAdKx1J4ysyEcRy1DseppeZ3nPk/NWrt
 7DcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=ZkMPV9Td1S5uycOwIvh1VSBjqIoKt6ivrgzO9euGk6k=;
 b=TBLBULEs0IjWqnJ16ooEzB8oNnXzhCqCo/00aDE/C+/b8oWqMWyXrsU1I8taKlBwPN
 6vypO95BiMr7M8oNRyhVGpycjqn5ACZkmJ7eu26CxJkFBlEIJP/VjWSgLTQ4D/+YfomW
 o7ywQ3k+5B/WmXZlqORLY0V4kqyXneuQ2KDDcoLCc0jSp7gMfrwXxODqZkFd6GgGBdRj
 eIy4aG6k2XCWgaAW0tZImJA0+HAe/xwGELEBwe0T7kJ0rCyvjGeKJ0pAvpvSdhOa/dXa
 dnRjjfFsbS2An011uzugH5kycdq8AXqnbQ2OthitWbvGfhi/omlUivfecrAbRBltU4tH
 UCtA==
X-Gm-Message-State: AOAM531GPiaBUaEgmRozgxP/mndMLYHgzUnX3TCgczAK9+ppJAkZS9Od
 08fWvrpjRy+1H0breuOj3RZW2pA3FgspWp31P7HWDC/jaAJIZQ==
X-Google-Smtp-Source: ABdhPJwa3TKMysxlJ5jAuwHJUdFJSYmcqOJkHmdRh2j7s+MTi2xaduXesCaOpK2yv7ARglvAc7DFLrxdqRWIuw0Nj+c=
X-Received: by 2002:ac2:4ec4:: with SMTP id p4mr19484820lfr.130.1609088311615; 
 Sun, 27 Dec 2020 08:58:31 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsPsXSTh+WO2XESOU+Q1ocrWmS1c1YJFarzmA=woK_ke5Q@mail.gmail.com>
In-Reply-To: <CABXGCsPsXSTh+WO2XESOU+Q1ocrWmS1c1YJFarzmA=woK_ke5Q@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Sun, 27 Dec 2020 21:58:20 +0500
Message-ID: <CABXGCsPBBDX3ozAgtT174nesiM+Gx4UkQi+PD27jB3i9OQ=G0g@mail.gmail.com>
Subject: Re: [bug] Radeon 3900XT not switch to graphic mode on kernel 5.10
To: amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 27 Dec 2020 at 21:39, Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
> I suppose the root of cause my problem here:
>
> [    3.961326] amdgpu 0000:0b:00.0: Direct firmware load for
> amdgpu/sienna_cichlid_sos.bin failed with error -2
> [    3.961359] amdgpu 0000:0b:00.0: amdgpu: failed to init sos firmware
> [    3.961433] [drm:psp_sw_init [amdgpu]] *ERROR* Failed to load psp firmware!
> [    3.961529] [drm:amdgpu_device_init.cold [amdgpu]] *ERROR* sw_init
> of IP block <psp> failed -2
> [    3.961549] amdgpu 0000:0b:00.0: amdgpu: amdgpu_device_ip_init failed
> [    3.961569] amdgpu 0000:0b:00.0: amdgpu: Fatal error during GPU init
> [    3.961911] amdgpu: probe of 0000:0b:00.0 failed with error -2
>

# dnf provides */sienna_cichlid_sos.bin
Last metadata expiration check: 3:01:27 ago on Sun 27 Dec 2020 06:53:25 PM +05.
linux-firmware-20201218-116.fc34.noarch : Firmware files used by the
Linux kernel
Repo        : @System
Matched from:
Filename    : /usr/lib/firmware/amdgpu/sienna_cichlid_sos.bin

linux-firmware-20201218-116.fc34.noarch : Firmware files used by the
Linux kernel
Repo        : rawhide
Matched from:
Filename    : /usr/lib/firmware/amdgpu/sienna_cichlid_sos.bin

# dnf install linux-firmware-20201218-116.fc34.noarch
Last metadata expiration check: 3:02:11 ago on Sun 27 Dec 2020 06:53:25 PM +05.
Package linux-firmware-20201218-116.fc34.noarch is already installed.
Dependencies resolved.
Nothing to do.
Complete!

Looks like firmware is present. So I didn't understand why the kernel
cannot read firmware.

--
Best Regards,
Mike Gavrilov.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
