Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 639EDB4780E
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B40910E137;
	Sat,  6 Sep 2025 22:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HoZGSA0Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDF010E22D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 16:50:29 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-74382048b8cso855572a34.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 09:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757004628; x=1757609428; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7Eg2IdZbj7N045XJY1xJIaR/PZ7v9B940ADnZGlBOSw=;
 b=HoZGSA0Q0DmD72Y8JT4gZhO/JVeRWxBp0RdLR6ZAiOy/2LORMpccyjeSMkOF3el/gk
 r1/KWc8Cu2Emw1Ba6O6nzhykbI/IqnlBNbY2hVN0SgrSRx6RkamWcw4OXBWgzZwJPxWN
 tEhChagQ4/AHJYPHBu72Ay8o7vsE+7YVtjSxOyFlmC0llG2hqblc+g57l2M5Qjn/tmi/
 2yDCFEu13x89RMlfp2inHaIQDdzFl6bHRrcC1kE9kuRhWfOD/9hY93dy2Gozbr2YsQbN
 yL0ZPXIFgoNJ1Zx4wiuQlcEz3m4sLq/EtArA/1UMNveRQe0nTE+56DMFzQu8M6yErupk
 qggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757004628; x=1757609428;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7Eg2IdZbj7N045XJY1xJIaR/PZ7v9B940ADnZGlBOSw=;
 b=XKoFST429wVpRbmWuPLlTRlrmMvJXs6eXpI1SCuRnoI31ec/In2RNOWJHmGZOH3iR4
 1uG8/NhdzyoS71gcoW00YKeAeRt/XEd8AvFagExeDXfGjbqwiVDuAgfb+Czy9fSYqkqJ
 qNoMJ+VlQ8ssU6eE0FTHWAjvdYadG7pjDffrxiXglXA0MTwGY37XU6IKNcfOxrr23IMC
 rIU+wDnUpFwC+almTy2DSSej+wPtaRkQH/nD0Qnh1UcNfaH6jPC007WbhR93ASa2T8bV
 uIZp7LuoNcOC8XRxFMwVE9lTG2SmTKn9TKdAR+X+PT1TYhaGI5QoI/JBgrO2X1OoQNcj
 D7rA==
X-Gm-Message-State: AOJu0Yy+/9vxCB4ASUMPFF5gWVXu8E+PIOawOe05qdX1uewe/ViwnYrg
 R5N97CUNHhn+ZwJb69wUGIMeiBIYb64mYtfOFSmETPQBsY9+Izyik2O2PZMNJAZof49rtIdRNPR
 TB4B9UFmJGlUy6EizFB7pSjFRoUTszshY907r/tg=
X-Gm-Gg: ASbGncvS8YXkEeqqseOu0k7++dhrCEL54DXEhghDwREcA/8e5kiV//x0GHcQsa1CNei
 DIkh05nCgiKvH3L4XnD7RmkvD9zUypuJ3Rw08DWrOqYyqJfiouRBytVz0BxTKylKmfXvMZ3cxYc
 8MOutoGE3DnQ+spM5POMh3OVJV93qAUeNxmvUcemj+ApyrFyp7tfkB6/1Ng376sPirqVL578LEK
 amUiLGUvm9jBl5O98k=
X-Google-Smtp-Source: AGHT+IFm4qp9Bw0dBE1PdZXnAhD/rS7PhWnQebtZtFl47df+sHLE1nZP8uiU4gSX4cQwg5z39eobd+EZAoiNuLlIOUg=
X-Received: by 2002:a05:6830:67fb:b0:745:9d11:cc87 with SMTP id
 46e09a7af769-7459d11d264mr3305859a34.35.1757004628075; Thu, 04 Sep 2025
 09:50:28 -0700 (PDT)
MIME-Version: 1.0
From: Lucas Moreno <lucasgabmoreno@gmail.com>
Date: Thu, 4 Sep 2025 13:50:16 -0300
X-Gm-Features: Ac12FXxoyV6jAGvvGo_0Rri1QnhUwVr5tZsrHNruUMHNsQbzrzsQpucFQ7nqKH0
Message-ID: <CAND3jMbggtne5+SL7h8Ojkv2yV1oqrBCTB2X55WB+_dkUJu5gg@mail.gmail.com>
Subject: [BUG] Lenovo D330-10IGL: Blank screen issues with DSI display on
 Gemini Lake
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:46:30 +0000
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

Hello,

I'm writing to report a recurring issue with the DSI display on my
Lenovo D330-10IGL. The screen randomly goes blank. I've observed this
problem across multiple Linux operating systems and kernel versions,
which suggests it's a driver-level issue.

- Device: Lenovo D330-10IGL
- Processor: Intel Celeron N4000 (Gemini Lake)
- Display Type: DSI
- Affected Operating Systems: GNU Linux, Android x64 and ChromeOS

The blank screen issue manifests in several scenarios:
- Random Blank Screen on Boot: The display occasionally remains blank
upon boot, regardless of whether I'm using an X11 or Wayland session.
- Failure to Resume from Suspend: The screen does not recover after
the system is suspended. This occurs consistently on both X11 and
Wayland.
- Random Blank Screen on Screen Rotation (X11 only): When using X11,
the screen randomly goes blank when the device is rotated.-

I've found that the display works reliably with X11 on kernels up to
5.4. However, with any newer kernel, the display only functions within
a Wayland session .
I have checked dmesg after a failure, and unfortunately, it doesn't
show any explicit errors or kernel panics.
Please let me know if further details, logs, or testing are required
to assist in diagnosing these issues.

Best regards,
Lucas Moreno
