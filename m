Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE7529BDD2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 17:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806B26E1CD;
	Tue, 27 Oct 2020 16:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9136E6E1CD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 16:50:28 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id j5so1058606plk.7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HptrGwBSY+SD+CDa0bd+3OxbTLi4hMQSBZc7Kms8AlM=;
 b=SloE/kKeI7PO02Z+h+wXGCAWMViSW6igjNsKi66UgTllzsf3Xo6lcfNN9TKzvnGz+O
 XdUGidI0SkH6IYKDAy6fCGH7p45ca7aCZPPpBs+hzcCKoaTXmYy1hRg1UxzuO9/Ir52v
 2GHeyuWwCB3PgNUJyCJ99aWZ19Ta+Swx/eL8cyS04LCr67nbMkcvk+AiQLkiCrXLtGaa
 1bI5nNiH/BumJ7Kfksftg+A48qlnMSXf91iRXxjciYyPK50SL8nGjswljjr+F3yUqq6G
 KX+R6b8X5fPOfTFGIOkwhGfPyjq22j391lukmuhQ5KjUA2gOJDoXLmpIoW+sDYulXSh3
 GqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HptrGwBSY+SD+CDa0bd+3OxbTLi4hMQSBZc7Kms8AlM=;
 b=fet5/YGr0aUZPiVhME7XZU5T6DuGz+66e51d56tL/DLGvw/1rqiJcyVtRKWCxIqKO7
 K8E8jKKqaKTykbYK2A4a76iaINP2h4/3X9H1HQfeZOeLBntf9ABVvJTI+72o+mN7r622
 ZRhT6GLJ6EG1FBMxgWy0KsjDDAoQ82mZ8LhAlAMaRRbeW2DPj11oYkmIcVFYMGeKKAZd
 IguPXnYIr92qgTwI18fKtJ6iq/+VswxBHDLHUsEvbWUR8xOFQAlM38UzbLa5zNgS7lmn
 hB5JpQaieSLECGdh9IuiBUyfRMPIzQrRhwjaJnIqtEb7GkxuNK9kIZNlUCPWWn4PxO8W
 33mQ==
X-Gm-Message-State: AOAM533tc4a0h1u5GZKpsKj4gfieuV0/f0adJ3/GAC6HVB6aBc8wHkzn
 srld2eTWYAXkFtQhZwI8yw==
X-Google-Smtp-Source: ABdhPJzMTJ8Bn35UCTNCGA0/agh8C9PXo3qzw/+//DmpetLuoSxkefj3JCZmZuvgck6DNRGfBiwPoA==
X-Received: by 2002:a17:902:9a84:b029:d3:8b4f:50d5 with SMTP id
 w4-20020a1709029a84b02900d38b4f50d5mr3605768plp.48.1603817428057; 
 Tue, 27 Oct 2020 09:50:28 -0700 (PDT)
Received: from PWN (n11212042025.netvigator.com. [112.120.42.25])
 by smtp.gmail.com with ESMTPSA id b3sm2840505pfd.66.2020.10.27.09.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 09:50:27 -0700 (PDT)
Date: Tue, 27 Oct 2020 12:50:21 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Following up
Message-ID: <20201027165021.GA1178130@PWN>
References: <cover.1603788511.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1603788511.git.yepeilin.cs@gmail.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

More about the 3 things we've discussed before:

  1. Cleaning up con_font_op():

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

On Tue, Sep 29, 2020 at 04:38:49PM +0200, Daniel Vetter wrote:
> I think if we change the conf_font_get/set/default/copy functions to not
> take the *op struct (which is take pretty arbitrarily from one of the
> ioctl), but the parameters each needs directly, that would clean up the
> code a _lot_.

    This is on my TODO list! One day I came up with some idea about
    fbcon.c, so I postponed this a bit...

  2. Removing dummy functions, like sisusbdummycon_font_set():
    
    Turns out, before c396a5bf457f ("console: Expand dummy functions for
    CFI"), they were just some macros:

-#define SISUSBCONDUMMY (void *)sisusbdummycon_dummy
+static int sisusbdummycon_font_set(struct vc_data *vc,
+                                  struct console_font *font,
+                                  unsigned int flags)
+{
+       return 0;
+}

    ...and they had been there for a very long (10+ years) time. Removing
    code like this makes me a bit nervous, and...

On Tue, Sep 29, 2020 at 04:38:49PM +0200, Daniel Vetter wrote:
> This actually does something. tbh I would not be surprises if the
> fb_set utility is the only thing that uses this - with a bit of code
> search we could perhaps confirm this, and delete all the other
> implementations.

    ...you mentioned code search, where & what should we look at, in order
    to confirm it's safe to remove them?

  3. Using `font_desc` in `vc_data`:

    Our plan for the gradual conversion was to use a helper function to
    set font for a vc, but after reviewing the 300-ish occurrence of
    `vc_font`, it seems like code doesn't usually set it as a whole:

(drivers/usb/misc/sisusbvga/sisusb_con.c)
	[...]
	c->vc_font.height = sisusb->current_font_height;
	[...]

    ...that's it! It only cares about the height. There are only 4 or 5
    places in fbcon.c that actually set all fields of `vc_font`, like:

    		vc->vc_font.width = font->width;
		vc->vc_font.height = font->height;
		vc->vc_font.data = (void *)(p->fontdata = font->data);
		vc->vc_font.charcount = 256; /* FIXME  Need to support more fonts */

    To make it even more complicated, `p` is a `struct fbcon_display *`,
    containing yet another font data pointer (`fontdata`) that I think
    should be replaced by a `font_desc *`...

    In conclusion, I think it's all about a few hard problems in fbcon.c.
    I'll keep trying and see how it goes.
    
Thank you,
Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
