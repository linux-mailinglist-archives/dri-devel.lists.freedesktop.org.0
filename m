Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C244278131
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 09:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368766EC17;
	Fri, 25 Sep 2020 07:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2994F6E0DF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 16:59:33 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id jw11so21337pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 09:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EoPsF8kT+VOZ0TY1NiW28PV/QlfjktpBLxI4qeILRo4=;
 b=Xxj7YqZYUTyfP+NUXTtSCBseX1FoZILvOYExB17luljVEgXT6MQPrxbe2SwZePvnG7
 pjB9h1S3PEtrGDy8r+b8fOnWXogVtc/yZ0g3K8zkDRq9+4nxJhWq5NOp/E3LMxrW0dP/
 AHZn4V2FMZlJUJWGu+qPmtKly8U59JwqOL3AHVLiKB5PBX+6o7qxMuB//P+sliP2JrOk
 Lcv/6x81xSKV+nZg9LX8xr58/NVn9VcPGB6201AkKwb43AZ5QjKyW0WVj2dXutj0Fzvw
 LOuh33hAdh8QMvFioPeiFQeErKlXVUqdJQG1FFqpge0fOUr5X9s1XWXE6QYN6tG5vE7s
 KzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EoPsF8kT+VOZ0TY1NiW28PV/QlfjktpBLxI4qeILRo4=;
 b=ubXUuaZ6S2iOC/FLN2vihIDGhY3baFdqaWCrcJtSHKQgp380SThh2zhhUCadDQdB8p
 QQzuwdAxEI3n9zDbNOLep4UA/XjKRnMqGI5gClMMFKFnB8JC8WGzfkqZxI3wk25/XM9F
 OIWyVlg/XRaOajETqBzv3TdNsgaGEk+LVjglOGRMvHjDmxj9PKHOrDlDpTn6+qb8renp
 hLUaBCcv5rz+vsLDXsIIzsCns3VlKQcByuLNKZGVw2QQQhR6gcmtIP8BiZMcNWtgBDj9
 DftENHy4/01zB2YfNTxwQdFfUij0YbI3I1D88RV1Va81NeSclUj2yUYOr4nNI7VkTR5f
 4JwA==
X-Gm-Message-State: AOAM5330qspSPppZ7Uj6+KbudIvhAIixB4yEm0Ol04i837fQoT0Lk7xP
 wtfxsrnWt93KB0QJ76BJxnsbw534Vzi2
X-Google-Smtp-Source: ABdhPJy0Cetm+6slveWErW0ubf/EmjYXGJAeOS5m+z8+iSgrtaRZr6rzhyYdogiEl3WzOse4BlCKaQ==
X-Received: by 2002:a17:90b:245:: with SMTP id
 fz5mr100677pjb.131.1600966772308; 
 Thu, 24 Sep 2020 09:59:32 -0700 (PDT)
Received: from PWN (n11212042027.netvigator.com. [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id x198sm3569037pgx.28.2020.09.24.09.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 09:59:31 -0700 (PDT)
Date: Thu, 24 Sep 2020 12:59:19 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 0/3] Prevent out-of-bounds access for built-in font data
 buffers
Message-ID: <20200924165919.GA880812@PWN>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <20200924140937.GA749208@kroah.com>
 <394733ab6fae47488d078cb22f22a85b@AcuMS.aculab.com>
 <20200924153035.GA879703@PWN> <20200924154516.GL4282@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924154516.GL4282@kadam>
X-Mailman-Approved-At: Fri, 25 Sep 2020 07:09:24 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Laight <David.Laight@aculab.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 24, 2020 at 06:45:16PM +0300, Dan Carpenter wrote:
> Smatch has a tool to show where struct members are set.
> 
> `~/smatch/smatch_data/db/smdb.py where console_font height`
> 
> It's not perfect and this output comes from allmodconfig on yesterday's
> linux-next.
> 
> regards,
> dan carpenter

Wow, thank you for the really interesting information!

> drivers/video/console/vgacon.c | vgacon_init                    | (struct console_font)->height | 0-32
> drivers/video/console/vgacon.c | vgacon_adjust_height           | (struct console_font)->height | 1-32
> drivers/video/fbdev/core/fbcon.c | fbcon_startup                  | (struct console_font)->height | 6,8,10-11,14,16,18,22,32
> drivers/video/fbdev/core/fbcon.c | fbcon_init                     | (struct console_font)->height | 6,8,10-11,14,16,18,22,32
> drivers/video/fbdev/core/fbcon.c | fbcon_do_set_font              | (struct console_font)->height | 0-u32max
> drivers/video/fbdev/core/fbcon.c | fbcon_set_def_font             | (struct console_font)->height | 6,8,10-11,14,16,18,22,32
> drivers/usb/misc/sisusbvga/sisusb_con.c | sisusbcon_init                 | (struct console_font)->height | 0-u32max

In looking at this one,
	c->vc_font.height = sisusb->current_font_height;

`sisusb->current_font_height` is only set in sisusbcon_do_font_op():
		sisusb->current_font_height = fh;

and...

> drivers/usb/misc/sisusbvga/sisusb_con.c | sisusbcon_do_font_op           | (struct console_font)->height | 1-32

...sisusbcon_do_font_op() is called in four places, with an `fh` of either
16, `sisusb->font_backup_height`, or `font->height`. The latter two cases
all come from sisusbcon_font_set(), whose dispatcher, con_font_set()
gurantees that `font->height` is less than or equal to 32, as shown by
Smatch here.

> drivers/tty/vt/vt_ioctl.c      | vt_k_ioctl                     | (struct console_font)->height | ignore
> drivers/tty/vt/vt_ioctl.c      | vt_resizex                     | (struct console_font)->height | 0-u32max
> drivers/tty/vt/vt_ioctl.c      | vt_ioctl                       | (struct console_font)->height | ignore
> drivers/tty/vt/vt_ioctl.c      | vt_compat_ioctl                | (struct console_font)->height | ignore
> drivers/tty/vt/vt.c            | vc_allocate                    | (struct console_font)->height | 0
> drivers/tty/vt/vt.c            | vt_resize                      | (struct console_font)->height | ignore
> drivers/tty/vt/vt.c            | do_con_write                   | (struct console_font)->height | ignore
> drivers/tty/vt/vt.c            | con_unthrottle                 | (struct console_font)->height | ignore
> drivers/tty/vt/vt.c            | con_flush_chars                | (struct console_font)->height | ignore
> drivers/tty/vt/vt.c            | con_shutdown                   | (struct console_font)->height | ignore
> drivers/tty/vt/vt.c            | con_cleanup                    | (struct console_font)->height | ignore
> drivers/tty/vt/vt.c            | con_init                       | (struct console_font)->height | 0
> drivers/tty/vt/vt.c            | con_font_set                   | (struct console_font)->height | 1-32
> drivers/tty/vt/vt.c            | con_font_default               | (struct console_font)->height | 0-u32max
> drivers/tty/vt/selection.c     | paste_selection                | (struct console_font)->height | ignore

I will go through the list starting from these "0-u32max" cases. Thanks
again!

Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
