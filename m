Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5994C47A094
	for <lists+dri-devel@lfdr.de>; Sun, 19 Dec 2021 14:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103A611A869;
	Sun, 19 Dec 2021 13:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C42111A49B;
 Sun, 19 Dec 2021 13:09:36 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id k14so5541673ils.12;
 Sun, 19 Dec 2021 05:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to:cc;
 bh=6IOwamf+SMlLVU3j6e67luDialX1rdvlytYo+dmvLYI=;
 b=H8yFzm3VUc4qM2eqyA1rk9RqjvaRV//lkrQJaInDOA3ei5oq5MOhPBQuxwUwSlG3zA
 R1O1qa+wWkAM+vwrSiTEVDf8ekw0Rq7xHOgz8B8qBt86VqIEGItQe4SjSsjsq4zj6/RG
 ZyHpPWsohJVRbmuC8s4b9iXypytvVgtjlC9zn1qQP6otPlJ/WWckYZu9QEX8JGae36we
 kjGW5kczCdH9SkMTYsdZ5t4a6I+Komvj70guqi6rdLFOjaUkN5thgCqPe8mbQJbNepfs
 xgbG+NLYPEJjOHWP+mTp4ZedOIweddEDDHmipRgWOJ/nZRMioyYQjNXa5fIYInEDrIpC
 pfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to:cc;
 bh=6IOwamf+SMlLVU3j6e67luDialX1rdvlytYo+dmvLYI=;
 b=DxoIkXe5s51PfF6Qr8OlNhLsWW4XLVTgiDn5TaYALlYIdgqiH23iKOf4GBlwPX6kvA
 Du+Yspp230AAd3PaG6rfo05+E45ST/O7YOPdg7r0B8fl9ToOiuHel3cQ+dJ2HcJjMLsy
 EHEZYV4DU2wm6eI/hippKMtNjxk5Qq4fLOsp/c5rTav18cTt52JVer84lR+xqn9Jx1Hk
 5zy1cK3OX7aKrChIsix8QlyH51SIRmss64FfNOgRPbVMA8X9RaUgAnboB/a2EGaCyURG
 24hQPmyLB80iQceTdzwKxUYJNQIviOqEBpQNRUEUzHOHBi7jvn/WSzxgMoFXNmZ61J98
 Cqug==
X-Gm-Message-State: AOAM5325c/gzpbiCJr+BNkJV8+BzFGKCSuaFwhiiZlRKje2CmlU5hWM8
 68YZBcZ+RaW7arsdqJyREnch8GotR/0AcKlB1Myh0AkWWoiFEg==
X-Google-Smtp-Source: ABdhPJztubX3UAtT6YaZkwgRxf2IVSUzNpl0wuqrpYgMWrOh0Emc0L460NjRDMnpBN+ci4ofHN99uW2H/SDyoEHJXhY=
X-Received: by 2002:a05:6e02:1545:: with SMTP id
 j5mr6223782ilu.20.1639919375330; 
 Sun, 19 Dec 2021 05:09:35 -0800 (PST)
MIME-Version: 1.0
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sun, 19 Dec 2021 14:08:59 +0100
Message-ID: <CA+icZUWx20yPfFAbH-sQrHK-MrCwg0eDWwbCEruFcELW1a+kFg@mail.gmail.com>
Subject: [intel-gfx] How to determine supported HDMI versions of an Intel GPU
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Reply-To: sedat.dilek@gmail.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[ Please CC me I am not subscribed to any CCed mailing-lists ]

Hi Daniel,

I hope you are well.

While searching for a new monitor I wanted to buy a miniHDMI->HDMI
adapter or cable to connect it.

My Samsung laptop has a Intel HD graphics 3000 GPU and a miniHDMI connector.

Unfortunately, I have no idea how to get information about supported
HDMI versions and or supported resolutions when there is *no* external
monitor connected.

root# xrandr --listmonitors
Monitors: 1
0: +XWAYLAND0 1366/293x768/165+0+0  XWAYLAND0

root# egrep -i 'hdmi|snb' /var/log/Xorg.0.log
101:[    81.251] (II) modeset(0): glamor X acceleration enabled on
Mesa DRI Intel(R) HD Graphics 3000 (SNB GT2)
105:[    81.255] (II) modeset(0): Output HDMI-1 has no monitor section
176:[    81.264] (II) modeset(0): EDID for output HDMI-1
180:[    81.264] (II) modeset(0): Output HDMI-1 disconnected
337:[    87.548] (II) config/udev: Adding input device HDA Intel PCH
HDMI/DP,pcm=3 (/dev/input/event11)

I am here on Linux v5.15.10 and using KDE/Wayland 5.23.4.

Do you need further information?

Thanks in advance.

Regards,
- Sedat -
