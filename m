Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EDA173647
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 12:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5836F414;
	Fri, 28 Feb 2020 11:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5156F414
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 11:43:13 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id y201so824002vky.8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 03:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E3m86ksh6JFmu3VknsoJDtsgFMq7t6y1ig8+9IFNC7o=;
 b=iSF2h8WjrzLANZPthBLsPysYtOFZhfyKXWP81wIHGIYPPblKRtSZFZYnBzBrzwlXpX
 TfjJpu33pPZ2lmrgcDY+N7Rz3SfDAMf+JDv6HBuR+mjc8ZaJXb9jqJJBD4a6u8Bh2RhW
 NDOXxq3DzG8hVN50y/7DLhPfvs00tSfsJCY3liPqQL3CjOFQhMy1Llomu7adDRRFXixL
 bGDlYoIhwLnu555tDCtStbgvoYHNt7Lq70gND463YPOLamodlkIZ6tvaIF6q5bsqo/Yx
 Z1SRuT4jIRpFrAGAOKZTAZZbZp7LA1NBFEcmP5coLxdhNjrbqv3yPXUMStoX693YsGxS
 j7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E3m86ksh6JFmu3VknsoJDtsgFMq7t6y1ig8+9IFNC7o=;
 b=MP+JpXSAMZC3BUwJ6063PoinIDPIxuIu9ZHcnuYVMsgRNiEkYwyBVZ84S2zGm1a0Fx
 GpmBFjmfz5aT0Y3xIrbLbfbTrFLH0HGfft9JBYwZMkRGUH5oVRlVfPzcvS23Mje+N8ey
 cZAdvtzeHw9g6gO+LgpO3lzVe5tVKeh1B6z815JebWtcMfNDQwguEsCmt11/VfabvbZl
 dJ6GeN68Gb3Hgv2ML/mrG7LGh366+Mpq/hrVG4RTc1nmB7kvhooLUn7km4rxbJN5lyH/
 hT/yLUJ7fk1S8NyhmsSj4IXwn19n02DH06QKZdXoQskA41XCd5bUhv3VHyK2DY40N+GV
 L/Hw==
X-Gm-Message-State: ANhLgQ28kjzG6AevvdWJDMCEAdH626LT8fsvelE82tNSFtPu4DQs3pVY
 KDnu+0hs8h/8LzTWJgxHOIYhP+Fjd1AmMgBtkwc3NR+Xf2U=
X-Google-Smtp-Source: ADFU+vsWwohEwX3ZoU6MtCUGU4exfDPSpM7FN+Re7PZw9MZ0+gIVfUZIBQzdcHS2j0Mhc3Uurt3uAGIFmtK9R/OqcyQ=
X-Received: by 2002:a1f:c982:: with SMTP id z124mr2158683vkf.6.1582890192246; 
 Fri, 28 Feb 2020 03:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20200224140726.1550689-1-bigeasy@linutronix.de>
 <20200224140726.1550689-2-bigeasy@linutronix.de>
In-Reply-To: <20200224140726.1550689-2-bigeasy@linutronix.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 28 Feb 2020 11:42:46 +0000
Message-ID: <CACvgo53pWS-0CibAX_RcWJxo4fPqfykUbo8cohr7wg+-wOtKAw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/vmwgfx: Remove a few unused functions
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

On Mon, 24 Feb 2020 at 16:55, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> I noticed that there is a prototype for vmw_fifo_ping_host_locked() but
> no function. Then I looked further and noticed more functions which are
> not used anymore or functions protoypes which remained after the
> function was removed.
>
> Remove unused function (prototypes).
>
Seems like the last user was removed in 2015 with commit a278724aa23c
("drm/vmwgfx: Implement fbdev on kms v2").

With this patch, the section of "VGA registers" in struct vmw_private
becomes dead code.
IMHO it would make sense to also remove those with this patch.

HTH
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
