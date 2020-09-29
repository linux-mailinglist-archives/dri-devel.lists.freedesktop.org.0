Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 558A627E2F4
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 09:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840E16E536;
	Wed, 30 Sep 2020 07:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E284889D4F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 12:43:51 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id t76so5255741oif.7
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 05:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5rHgv3Sr+ekM/SsMbR/R49R59mo5gpJuryz3IETMKd0=;
 b=CGMYIu6+EPJf1f0pWCTmazIqlHTj+YwbQZ2eRrH6j/Ayz/ScpVrasyw6reedNxk7vw
 26nSL60rR9vKnLfmAgzWY112bg4Uc+shTYHKUy+ZWq4HX+D0WJAi+oopMkkTrcnhtQ8+
 tmk0tcnFgjTXrK2gZzq5ZGGvlUg5PWmTjnnzGf1q9BujgNjyi2/KAb9cFt/QbdlNHc/H
 vHmvFASe/rU5uh/f2TdgoM2apm1+lm2y7Z/pP0yy+x6148HaYv9PLaXKwZ7K9dRQXVUx
 xi940pRZqM7Tcc67xavk663A5rK94YZs4c4XKTYonQhbGIeGtRYz9UGGwN5/f8AMd1V+
 EORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5rHgv3Sr+ekM/SsMbR/R49R59mo5gpJuryz3IETMKd0=;
 b=CcBd7syip8Lip5YRKLEf5NYsFHM0stJDXK2aSXF/7hPZVHTDfBsWd56liWdIl1b6ZZ
 tB8kiqWG8BOR+yLRnGnXJvoZDsQ8TBSsYiLk5e1TAwu5ESk0abfeqDnvtBoswjStCWRs
 5Wq9C0XShpjW3k6HFnrU9i7EyTq8FTJHdW1yoprkd7ETbXiUnN22zRGjzZfAm5OLTQoS
 5HTqtTzRGAYabQn2erSNAPK1q2Xiik3Q3F09OvuT3JK+HyazgNeKwUTE700pVUxuimti
 6DYk7SeE6qMIsODZ0/kqX/ihq40Yjs82P5uUwMnCaP/v+5FSUm4FD4U1UPMpg1vrc/gw
 G4GQ==
X-Gm-Message-State: AOAM531xPiZtDEtB2sP39NC4Q0aK+clxtWjh3rfll91ikbc/jdh+0voz
 wmM2WbURMmIqTigzkd39fJJPA7I7xsmK
X-Google-Smtp-Source: ABdhPJwjJI9Q3e8kl+gLKkBlEFScJwJrat89dB/c20Epq5jiOvfR+01dwXKgdsZ3GRp4jUjxqkOMsA==
X-Received: by 2002:a17:90a:5c83:: with SMTP id
 r3mr3700960pji.112.1601382871116; 
 Tue, 29 Sep 2020 05:34:31 -0700 (PDT)
Received: from PWN ([161.117.80.159])
 by smtp.gmail.com with ESMTPSA id m13sm4924769pjl.45.2020.09.29.05.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 05:34:30 -0700 (PDT)
Date: Tue, 29 Sep 2020 08:34:20 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/3] Prevent out-of-bounds access for built-in font data
 buffers
Message-ID: <20200929123420.GA1143575@PWN>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN>
 <20200925132551.GF438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925132551.GF438822@phenom.ffwll.local>
X-Mailman-Approved-At: Wed, 30 Sep 2020 07:50:09 +0000
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 25, 2020 at 03:25:51PM +0200, Daniel Vetter wrote:
> I think the only way to make this work is that we have one place which
> takes in the userspace uapi struct, and then converts it once into a
> kernel_console_font. With all the error checking.

Hi Daniel,

It seems that users don't use `console_font` directly, they use
`console_font_op`. Then, in TTY:

(drivers/tty/vt/vt.c)
int con_font_op(struct vc_data *vc, struct console_font_op *op)
{
	switch (op->op) {
	case KD_FONT_OP_SET:
		return con_font_set(vc, op);
	case KD_FONT_OP_GET:
		return con_font_get(vc, op);
	case KD_FONT_OP_SET_DEFAULT:
		return con_font_default(vc, op);
	case KD_FONT_OP_COPY:
		return con_font_copy(vc, op);
	}
	return -ENOSYS;
}

These 4 functions allocate `console_font`. We can replace them with our
`kernel_console_font`. So, ...

$ vgrep "\.con_font_set"
Index File                                    Line Content
    0 drivers/usb/misc/sisusbvga/sisusb_con.c 1294 .con_font_set =              sisusbcon_font_set,
    1 drivers/usb/misc/sisusbvga/sisusb_con.c 1378 .con_font_set =              sisusbdummycon_font_set,
    2 drivers/video/console/dummycon.c         162 .con_font_set =      dummycon_font_set,
    3 drivers/video/console/newport_con.c      693 .con_font_set          = newport_font_set,
    4 drivers/video/console/vgacon.c          1226 .con_font_set = vgacon_font_set,
    5 drivers/video/fbdev/core/fbcon.c        3120 .con_font_set                = fbcon_set_font,
$
$ vgrep "\.con_font_get"
Index File                                    Line Content
    0 drivers/usb/misc/sisusbvga/sisusb_con.c 1295 .con_font_get =              sisusbcon_font_get,
    1 drivers/video/console/vgacon.c          1227 .con_font_get = vgacon_font_get,
    2 drivers/video/fbdev/core/fbcon.c        3121 .con_font_get                = fbcon_get_font,
$
$ vgrep "\.con_font_default"
Index File                                    Line Content
    0 drivers/usb/misc/sisusbvga/sisusb_con.c 1379 .con_font_default =  sisusbdummycon_font_default,
    1 drivers/video/console/dummycon.c         163 .con_font_default =  dummycon_font_default,
    2 drivers/video/console/newport_con.c      694 .con_font_default = newport_font_default,
    3 drivers/video/fbdev/core/fbcon.c        3122 .con_font_default    = fbcon_set_def_font,
$
$ vgrep "\.con_font_copy"
Index File                                    Line Content
    0 drivers/usb/misc/sisusbvga/sisusb_con.c 1380 .con_font_copy =     sisusbdummycon_font_copy,
    1 drivers/video/console/dummycon.c         164 .con_font_copy =     dummycon_font_copy,
    2 drivers/video/fbdev/core/fbcon.c        3123 .con_font_copy               = fbcon_copy_font,
$ _

... are these all the callbacks we need to take care of? What about
other console drivers that don't register these callbacks? ...

$ vgrep "\.con_init"
Index File                                    Line Content
[...]
    3 drivers/usb/misc/sisusbvga/sisusb_con.c 1285 .con_init =          sisusbcon_init,
    4 drivers/usb/misc/sisusbvga/sisusb_con.c 1369 .con_init =          sisusbdummycon_init,
    5 drivers/video/console/dummycon.c         153 .con_init =          dummycon_init,
    6 drivers/video/console/mdacon.c           544 .con_init =          mdacon_init,
    7 drivers/video/console/newport_con.c      684 .con_init      = newport_init,
    8 drivers/video/console/sticon.c           328 .con_init            = sticon_init,
    9 drivers/video/console/vgacon.c          1217 .con_init = vgacon_init,
   10 drivers/video/fbdev/core/fbcon.c        3111 .con_init             = fbcon_init,
[...]

... for example, mdacon.c? What font does mdacon.c use? I know that
/lib/fonts/ exports two functions, find_font() and get_default_font(),
but I don't see them being used in mdacon.c.

Ah, and speaking of built-in fonts, see fbcon_startup():

	/* Setup default font */
		[...]
		vc->vc_font.charcount = 256; /* FIXME  Need to support more fonts */
			    ^^^^^^^^^^^^^^^

This is because find_font() and get_default_font() return a `struct
font_desc *`, but `struct font_desc` doesn't contain `charcount`. I
think we also need to add a `charcount` field to `struct font_desc`.

> Then all internal code deals in terms of kernel_console_font, with
> properly typed and named struct members and helper functions and
> everything. And we might need a gradual conversion for this, so that first
> we can convert over invidual console drivers, then subsystems, until at
> the end we've pushed the conversion from uapi array to kernel_console_font
> all the way to the ioctl entry points.

Currently `struct vc_data` contains a `struct console_font vc_font`, and
I think this is making gradual conversion very hard. As an example, in
fbcon_do_set_font(), we update `vc->vc_font`. We lose all the extra
information we want in `kernel_console_font`, as long as `struct
vc_data` still uses `console_font`...

However, if we let `struct vc_data` use `kernel_console_font` instead,
we'll have to handle a lot of things in one go:

$ vgrep --no-less --no-header ".vc_font" | wc -l
296
$ echo ":("
:(

The good news is, I've tried cleaning up all the macros in fbcon.c in my
playground, and things seem to work. For example, currently we have:

	if (userfont)
		cnt = FNTCHARCNT(data);
	else
		cnt = 256;

After introducing `kernel_console_font` (and adding `charcount` to
`struct font_desc` etc.), this should look like:

#define to_font(_data) container_of(_data, struct kernel_console_font, data)
	[...]
	cnt = to_font(data)->charcount;

No more `if` and `else`, and the framebuffer layer will be able to
support new bulit-in fonts that have more than 256 characters. This
seems really nice, so I'd like to spend some time working on it.

However before I start working on real patches, do you have suggestions
about which console driver I should start with, or how should I split up
the work in general? I couldn't think of how do we clean up subsystems
one by one, while keeping a `console_font` in `struct vc_data`.

Thank you!
Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
