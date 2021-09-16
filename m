Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C6B40E01B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 18:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD5C6EE2B;
	Thu, 16 Sep 2021 16:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CA86EE2B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 16:17:24 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id y144so8099170qkb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 09:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9bNXzT+QjdczaR0NrtTvu7baFnr9KybQD65y/vUcaD8=;
 b=WbzRt/2SFYXzgn8/y8QfQ7UAZErvt4gH4M35TM24D3BawYcEwMA3SqYkqrE29LEaqB
 y+7curn9JBBi0dUk1oPYcmuY/tq/H2nwVga8lOkUd9zozL8Y0Fumyr+l90XPU3v6eQXr
 H1yqBJhL0rWzBNYYc3PiABr9Ri4F476YWnXZNs49aQ7CCaQ9Xh/pSheeRXe68aSb+MLI
 f8X6zLQI3vVDCVYPMZuJWuFpzPHXZj0HdOyrGj/9Pi2xDG9daQgWLSdKpgu/I8YjYqsP
 YwIkwhYuTPa1DSZ/pHeU8qws7sEIej9K8FAUl+759UG41h24FR1RuOCaFmPmmrtdLgfI
 jUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9bNXzT+QjdczaR0NrtTvu7baFnr9KybQD65y/vUcaD8=;
 b=7y9Qrc7KxH6Gi3/kTL2k+ZJBj2zj0yxt6bYEnHFSNNU7zslXj/95/8rPFCAXcQoZ28
 7g51T7ouTuPu334lwzbsdv7ZjM3Xwg2051xo4QSLNNxPzFtUL/8Q3Q96O0bNO5jd7Yr9
 hErCI2sx6FNDbXE/NQFzzNZGXX2ck4CFFb3gWiR/cWRe/rtSd40lw8OZylDFySYCTJno
 u/W7CaCvQLP48O/6qZqr9T5W+U2NdoPaXau1lr0AU8l8tkcX0JCSOqwEQxthnZaotXFy
 gzLSE9eLKIxAQBrz1p7MY/za+pIjJ7J/BBA6XqVb6IbGU0q5CuEhfXI5WSGV8fclG7Zc
 VtFA==
X-Gm-Message-State: AOAM531rsxWGXXlHnMP8T0CefisFzL6a8OsRkZxy101QzgUl1emTDizC
 2TSoDF08HqS6lyhshY2wn8dpRUBNwkRT+rhH1Qs=
X-Google-Smtp-Source: ABdhPJwuTIIoaeKG5dah6ds3dwC87mVmoHxHQgUXPL/pWtyxLdI8wqN2wE6Jbq5pE2WGwUWTwVCGFex7KyziEFRAG4w=
X-Received: by 2002:a25:9906:: with SMTP id z6mr7954873ybn.373.1631809043295; 
 Thu, 16 Sep 2021 09:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210913182645.17075-1-decui@microsoft.com>
 <CAHFnvW0iX1FMTcJzQQtjHGosavSJ6-9wkRb7C0Ljv3c+BBUEXQ@mail.gmail.com>
 <BYAPR21MB1270C4427C264D14F151A0CCBFDB9@BYAPR21MB1270.namprd21.prod.outlook.com>
In-Reply-To: <BYAPR21MB1270C4427C264D14F151A0CCBFDB9@BYAPR21MB1270.namprd21.prod.outlook.com>
From: Deepak Rawat <drawat.floss@gmail.com>
Date: Thu, 16 Sep 2021 09:17:12 -0700
Message-ID: <CAHFnvW3J-9LGCUSP_5mvYFyiUMCy63=egu1X3Uv9GrecfOJvRQ@mail.gmail.com>
Subject: Re: [PATCH] drm/hyperv: Fix double mouse pointers
To: Dexuan Cui <decui@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HI Dexuan, thanks for confirming. Could you please add this as a
comment to the function.

Reviewed-by: Deepak Rawat <drawat.floss@gmail.com>

On Tue, Sep 14, 2021 at 11:59 PM Dexuan Cui <decui@microsoft.com> wrote:
>
> > From: Deepak Rawat <drawat.floss@gmail.com>
> > Sent: Tuesday, September 14, 2021 8:59 AM
> > ...
> > > +/* Send mouse pointer info to host */
> > > +int hyperv_send_ptr(struct hv_device *hdev)
> > > +{
> > > +       struct synthvid_msg msg;
> > > +
> > > +       memset(&msg, 0, sizeof(struct synthvid_msg));
> > > +       msg.vid_hdr.type = SYNTHVID_POINTER_POSITION;
> > > +       msg.vid_hdr.size = sizeof(struct synthvid_msg_hdr) +
> > > +               sizeof(struct synthvid_pointer_position);
> > > +       msg.ptr_pos.is_visible = 1;
> >
> > "is_visible" should be 0 since you want to hide the pointer. Maybe
> > better, accept these from the caller.
>
> According to my test, "is_visible = 0" doesn't work, i.e. can't hide the
> unwanted HW mouse poiner. It looks like the field is for some very old
> legacy Windows VMs like Windows Vista.
>
> Haiyang also replied in another email, saying "is_visible = 0" doesn't
> work.
>
> > > +       msg.ptr_pos.video_output = 0;
> > > +       msg.ptr_pos.image_x = 0;
> > > +       msg.ptr_pos.image_y = 0;
> > > +       hyperv_sendpacket(hdev, &msg);
> > > +
> > > +       memset(&msg, 0, sizeof(struct synthvid_msg));
> > > +       msg.vid_hdr.type = SYNTHVID_POINTER_SHAPE;
> > > +       msg.vid_hdr.size = sizeof(struct synthvid_msg_hdr) +
> > > +               sizeof(struct synthvid_pointer_shape);
> > > +       msg.ptr_shape.part_idx = SYNTHVID_CURSOR_COMPLETE;
> > > +       msg.ptr_shape.is_argb = 1;
> > > +       msg.ptr_shape.width = 1;
> > > +       msg.ptr_shape.height = 1;
> > > +       msg.ptr_shape.hot_x = 0;
> > > +       msg.ptr_shape.hot_y = 0;
> > > +       msg.ptr_shape.data[0] = 0;
> > > +       msg.ptr_shape.data[1] = 1;
> > > +       msg.ptr_shape.data[2] = 1;
> > > +       msg.ptr_shape.data[3] = 1;
> > > +       hyperv_sendpacket(hdev, &msg);
> > > +
> >
> > Is it necessary to send SYNTHVID_POINTER_SHAPE here? Perhaps we should
>
> According to my test, yes. If I don't send a SYNTHVID_POINTER_SHAPE message,
> the unwanted mouse pointer can't be hidden. As we know, the protocol between
> the VSC and the VSP is not well documented to us. I can ask Hyper-V
> team for some clarification on this, but it's probably we can just use the current
> version of hiding the mouse pointer as-is -- this has been used for 10+ years
> in the hyperv_fb driver without any issue. :-)
>
> > separate SYNTHVID_POINTER_POSITION and SYNTHVID_POINTER_SHAPE into
> > different functions.
>
> Since the 2 messages are only used here, I suggest we keep it as-is.
>
> Thanks,
> -- Dexuan
