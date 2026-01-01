Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EACA9CECC6F
	for <lists+dri-devel@lfdr.de>; Thu, 01 Jan 2026 04:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1230810E32B;
	Thu,  1 Jan 2026 03:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fRzLwaXC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875AD10E32B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jan 2026 03:22:33 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-8b2d56eaaceso1351909885a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 19:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767237752; x=1767842552; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4SGACg4q8kf1PtzlpQhz4eYb6eMxOAM/cAhtukHpIFo=;
 b=fRzLwaXCFw50nPMeOWv7coys3pIldDgoIhMRojPFBdMeD60Xc8poAfkgftDcb+e5o/
 pomUZ4IXhoOO7GJoVeIFqezF6OyhLK8Qv202nvDpUoLh8gMIYEjVR+fsqIubdNtnQm3h
 iPSa4axdkWVWNXVZGdZhb4B3WbhvlQrS9u80/NrNL/oXAD4BHoUrjyIEKmtTY4zf1b9Y
 MdS32XDf5g1nnwo17aroTeapwSTCH9ax4FDQx83OgNFxGwUQPsRQq9TsxeFziRr4f689
 /Ig95ywl6xN4qRSK+klFPYutb98T7wscg7rex4iG6bcGE7eOmqIlGaR/nnh3b7rGjNBy
 43ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767237752; x=1767842552;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4SGACg4q8kf1PtzlpQhz4eYb6eMxOAM/cAhtukHpIFo=;
 b=MG/odYJAxi1HFrwwlI7K3jYaS4pEAYtd/mPVsrI7XiODIvGlgWjS/OCN429KwSKWwp
 331UkCGmCY9ew4ObdcwPlzPofs7f5bIROQAX8muvirlz9K+SKR/3HW9RilSHDN3PFsLa
 g5us7JyIDVAphzbwj/UXblCFdpuO3SuzAtAyBDlx/+4NmPpfLD6POD/xfHdmvPPnTO3S
 lqxNKFYrNs0L4Y3LLRqyKiC7HNNyh9OQqpm1aD0tWN0c68zFJNq0E6wKt5diL8doGEIH
 gercy8Zx5rfTLQ7cuhoGPSoyG5z6yCKt6YPxpSNYaGiTezrZ0rjQuyJ2zRG7PJ8Lj2Tm
 LpYA==
X-Gm-Message-State: AOJu0YxR3h1zI+XwfKlsMvtb2KIBodq8o9XjI3kZVBCGaAsEEzPAUCH/
 +IWPbOfFOTw2FE7lWwgmtqRKQE5en/cV+OEq0tTXJ2SJUnx1eBMmD2Wq3S4ox3CMaQcezcFPP+x
 6jsbZzsR3kje0hWTDcmxlcJzaUGm8no8=
X-Gm-Gg: AY/fxX6CLitaHYVIUdOzejt95Jfow9a6s6b9ZWv8/C8EuEjn/KB5Gzctlo5FrC6/j52
 cu12EAbKWoqftd+sPX9zxIJjsMWyTsuDZfW/hYfzpVEgfauCY9pgak3yPm7jE48Gr67P/+K5ab6
 T5BcoicDRfna6jQHTTsvB0T6043d4v5AWK6EbuTFrZ7iuHzwyTx9qD1UNhoSQ1UpWL2G3H6/N/V
 Wsn5dJ20k1sL1Z9Sw7JZwutbizuZMWOdjXociGlAo1RVGyHLJ32YybXqHK4Ig+Dx49wNg==
X-Google-Smtp-Source: AGHT+IERBSEXr0mrjYMvN93S1VY1kfcIcTc4265r3Eq7MwucZuBUkQwrXdZGx5wfDwa1LCfpTLnlpRnPRXjF3AOiZd4=
X-Received: by 2002:a05:620a:2906:b0:8b2:e1bc:f27c with SMTP id
 af79cd13be357-8c08fabf900mr5599610885a.68.1767237752401; Wed, 31 Dec 2025
 19:22:32 -0800 (PST)
MIME-Version: 1.0
References: <CAMFK0gsScPgpTRPL7_vjG825OPkA6ZqKnyRMXwYEWG-XV0-7KQ@mail.gmail.com>
In-Reply-To: <CAMFK0gsScPgpTRPL7_vjG825OPkA6ZqKnyRMXwYEWG-XV0-7KQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 1 Jan 2026 13:22:19 +1000
X-Gm-Features: AQt7F2pDt542blKVz9M_yBgglOJEVg3RoYnqgFBK7xYuI3v5jZJRQPLYTr1W5zk
Message-ID: <CAPM=9txjNMA8NVzMr651BH4W_ju33-rLhHv6PO_H9Nodx1Xz-w@mail.gmail.com>
Subject: Re: How much hotplugging is actually possible in drm?
To: Olivier Galibert <galibert@pobox.com>
Cc: dri-devel@lists.freedesktop.org
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

On Thu, 1 Jan 2026 at 08:51, Olivier Galibert <galibert@pobox.com> wrote:
>
>   Hi,
>
> I'm looking at drm usage, and in particular DRM_IOCTL_MODE_GETRESOURCES. =
 The example of use indicates that the count of crtcs, connectors or encode=
rs may change at any time through hotplug events.  Is it true?  I mean, hav=
ing cards come and go makes perfect sense (e.g. displaylink usb), but inter=
nal resources of the gpu?  Do we have drivers for current hardware that do =
that?  And if yes, what would the hotplug netlink event look like?

I think the only place we do it is with Displayport MST involves
hotplugging connectors, encoders and crtcs stay the same.

Dave.
