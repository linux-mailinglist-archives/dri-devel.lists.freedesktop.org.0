Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7B025E4B2
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 02:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F616ED08;
	Sat,  5 Sep 2020 00:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA706E21C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 10:17:49 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id g96so5365044otb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 03:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=lPxZaTNtW5YIeyR3xGRRL/xoA1G8FPiEJM8B82fslQU=;
 b=Le2zSKkazZ1gO39eGYsVx4cem55qd/DC6Q2blFPKTBoy+7nOudrnvnkzDCECzwXeT2
 3sWv7LSDa51geVMtEujv6z6cfikZCLGNCMOhlNw+e+BADnCYCsvFG/epFABwLkq7gu5M
 E4AduSqpE2wPwQlvZLNdbJL6vnzIovrTzUMYAm/QdlfErhvvZUIm1Z0MPiiF8mFPh6Rf
 hvLUweTbmvvsxYkzQISGX9j5KRehBC9NYmyDBLv7/mZ2xoRyEMxUxHEWrcvb2Fu/QknF
 wWbHZ2tt+z6ucf/sG8PXoX/ewHJty2MDYnjESaQKFcKGFdgZiRhKT7QEuygCAcLMgCKa
 m8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=lPxZaTNtW5YIeyR3xGRRL/xoA1G8FPiEJM8B82fslQU=;
 b=rXbs2xiKfX2wxxKqUfaiiyVJnQtWKmmpm9PdFkmfD6iR29LQGkQAQ55AU3wBgaexE9
 lyJZuoKmI72WbpsiE5Mw6cY+uumWuMKF/oGtVlWoJd/f3xyNOU+wdn+gNW/mahbmvhAr
 sWMgQmHjOXQAbhzn2HXd5P4+n/eTuaCM8c93G4qsASQrCRNM59kNdceVZZjkY2vdlSwQ
 n2z9O4b2EhP4Zx/yDXNtD5WckMTKhz7vNyVLDYEZia3hk0VKozq0ZphCouATdxpT877J
 LiorGI1KMMa1CaqNg+OHbSUfyUdO/Kddv3QnIRv4Zk3LcsO/CUXojXrh33pnJ2zRt/f2
 42Lg==
X-Gm-Message-State: AOAM530a3rOBhGwXkCX++ChM1PERaIfhonsVypNG9bE3NPa198Zx0z2f
 1DrhFNCkuQngO2dhK7pr2Tb3q/9oAiJ+IZ26PlFoFA==
X-Google-Smtp-Source: ABdhPJweP2lCtEYjkHQWlo8QD4Vq+0WurSxnsElGAWHdmPXCihLvVJ8RSL9d2TT9bD+gTRC7lnVmzXCKaHLVS1Y6hf8=
X-Received: by 2002:a05:6830:1e22:: with SMTP id
 t2mr240631otr.100.1599214668457; 
 Fri, 04 Sep 2020 03:17:48 -0700 (PDT)
MIME-Version: 1.0
From: Jian-Hong Pan <jian-hong@endlessm.com>
Date: Fri, 4 Sep 2020 18:16:16 +0800
Message-ID: <CAPpJ_efY2=qmaAtuYVfWhZNBhzTAtAxm9CS5jb_sTpca97jkpA@mail.gmail.com>
Subject: Re: [PATCH v5 00/80] drm/vc4: Support BCM2711 Display Pipeline
To: maxime@cerno.tech
X-Mailman-Approved-At: Sat, 05 Sep 2020 00:35:27 +0000
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
Cc: devicetree@vger.kernel.org, tim.gover@raspberrypi.com, kdasu.kdev@gmail.com,
 sboyd@kernel.org, nsaenzjulienne@suse.de, dave.stevenson@raspberrypi.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org,
 Linux Upstreaming Team <linux@endlessm.com>, phil@raspberrypi.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Thanks for version 5 patch series!

I applied it based on linux-next tag next-20200828 and build it with
the config [1] to test on RPi 4
However, It fails to get HDMI state machine clock and pixel bcb clock.
Then, vc4-drm probes failed. Full dmseg [2]:

[    2.552675] [drm:vc5_hdmi_init_resources] *ERROR* Failed to get
HDMI state machine clock
[    2.557974] raspberrypi-firmware soc:firmware: Attached to firmware
from 2020-06-01T13:23:40
[    2.567612] of_clk_hw_onecell_get: invalid index 14
[    2.567636] [drm:vc5_hdmi_init_resources] *ERROR* Failed to get
pixel bvb clock
[    2.567664] vc4-drm gpu: failed to bind fef00700.hdmi (ops vc4_hdmi_ops): -2
[    2.567731] vc4-drm gpu: master bind failed: -2
[    2.567755] vc4-drm: probe of gpu failed with error -2

I decompile bcm2711-rpi-4-b.dtb.  Both hdmi@7ef00700 and hdmi@7ef05700
show the clocks member.

hdmi@7ef00700 {
        compatible = "brcm,bcm2711-hdmi0";
        reg = <0x7ef00700 0x300 0x7ef00300 0x200 0x7ef00f00 0x80
0x7ef00f80 0x80 0x7ef01b00 0x200 0x7ef01f00 0x400 0x7ef00200 0x80
0x7ef04300 0x100 0x7ef20000 0x100>;
        reg-names = "hdmi\0dvp\0phy\0rm\0packet\0metadata\0csc\0cec\0hd";
        clock-names = "hdmi\0bvb\0audio\0cec";
        resets = <0x17 0x00>;
        ddc = <0x18>;
        dmas = <0x19 0x0a>;
        dma-names = "audio-rx";
        status = "okay";
        clocks = <0x10 0x0d 0x10 0x0e 0x17 0x00 0x1a>;
};

hdmi@7ef05700 {
        compatible = "brcm,bcm2711-hdmi1";
        reg = <0x7ef05700 0x300 0x7ef05300 0x200 0x7ef05f00 0x80
0x7ef05f80 0x80 0x7ef06b00 0x200 0x7ef06f00 0x400 0x7ef00280 0x80
0x7ef09300 0x100 0x7ef20000 0x100>;
        reg-names = "hdmi\0dvp\0phy\0rm\0packet\0metadata\0csc\0cec\0hd";
        ddc = <0x1b>;
        clock-names = "hdmi\0bvb\0audio\0cec";
        resets = <0x17 0x01>;
        dmas = <0x19 0x11>;
        dma-names = "audio-rx";
        status = "okay";
        clocks = <0x10 0x0d 0x10 0x0e 0x17 0x01 0x1a>;
};

Also re-check runtime device tree, they are the same values as mentioned above:

$ xxd /proc/device-tree/soc/hdmi@7ef00700/clocks
00000000: 0000 0010 0000 000d 0000 0010 0000 000e  ................
00000010: 0000 0017 0000 0000 0000 001a            ............
$ xxd /proc/device-tree/soc/hdmi@7ef05700/clocks
00000000: 0000 0010 0000 000d 0000 0010 0000 000e  ................
00000010: 0000 0017 0000 0001 0000 001a            ............

Do I miss something?

[1]: https://gist.github.com/starnight/649ea5a8384313f0354aca504f78ad70#file-config
[2]: https://gist.github.com/starnight/649ea5a8384313f0354aca504f78ad70#file-dmesg-log

Jian-Hong Pan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
