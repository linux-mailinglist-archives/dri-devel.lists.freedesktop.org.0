Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 971E7823BBB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 06:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B7E10E38B;
	Thu,  4 Jan 2024 05:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4776510E38B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 05:18:29 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5ef7c6f4cfcso8763487b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jan 2024 21:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1704345508; x=1704950308;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jDxFbYixhs6f1tAqnhwF6CXml/tJlYbDmEA428x1Kyw=;
 b=EqRKGvdMhBlGbmf/2DWtcofo/K3xmrmqB+08x0OW8j/u7QSuowbKEwL5ndiuzbmSUD
 QPuWI8jpvP53GdueRs4+uXqsooz0Pi+Zhyibr6xUxIJCEf8yCGAvvGK38dYRJ/HDJ/6W
 tmc6q7fQX+DZqOoizZ21f2TOXprlNnhno/GSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704345508; x=1704950308;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jDxFbYixhs6f1tAqnhwF6CXml/tJlYbDmEA428x1Kyw=;
 b=rngjPQIxgZYdmwv+WgN/vrr882aDg7671ba6hWpuiUVRzuDIYLr1gM/WnebDuUN2eN
 bf2jsENb6DtnCN084elY4qUc2A2juRWUvVOhmojoZcslhcba78cpMiSriwqerHS+7unK
 /+Hb/cTLZjE+O5Ypmo/gi6F4FpomfbdtVDrk0XBKEQBa0O54x1K/diZSuVLmqiMK1d1o
 SYd4MB/VnAtBC7RXvWOTf/YYcVfgUBlKdhDXJGgeNCXeAmRrus98xgEXKqWL3M0bh0no
 bnbCOsKRMcjtmHlaM+XAJMzqwI+zAg2V09I50V7WBfK3covZ8gYqygHYv+Zqfj08CBK5
 tORw==
X-Gm-Message-State: AOJu0YzRGZPwzUV/o2KF5/b4pa1NicWk7Uajte81RzUgBYyl6yCf69CF
 jiKVjL7X20AoeFx1luqfwfDBdUHTxxGhkwupwuaOPHJwha1K
X-Google-Smtp-Source: AGHT+IFfPrKd5UvUBwLgNuQi2a3WeIo8NksR83Oc9+RtmyQIjk6I/eGg0w+05h8CifxSZf3x50auweXBOYX/clLqHMQ=
X-Received: by 2002:a25:740a:0:b0:db5:4ec5:6f2f with SMTP id
 p10-20020a25740a000000b00db54ec56f2fmr7340ybc.20.1704345508267; Wed, 03 Jan
 2024 21:18:28 -0800 (PST)
MIME-Version: 1.0
References: <20231215060159.555229-1-ghanshyam1898@gmail.com>
 <e9b028b3-20e6-4e74-a305-c4f18efc70e1@infradead.org>
In-Reply-To: <e9b028b3-20e6-4e74-a305-c4f18efc70e1@infradead.org>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 4 Jan 2024 00:18:17 -0500
Message-ID: <CABQX2QO0mPD3KYZYVk+cEr1z9o_cjRM9nct7piZhD4oJEm2hZg@mail.gmail.com>
Subject: Re: [PATCH V2] drivers: gpu: drm: vmwgfx: fixed typos
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Ghanshyam Agrawal <ghanshyam1898@gmail.com>, linux-kernel@vger.kernel.org,
 mripard@kernel.org, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 1:21=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hi--
>
> On 12/14/23 22:01, Ghanshyam Agrawal wrote:
> > Fixed multiple typos in vmwgfx_execbuf.c
> >
> > Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
> > ---
> > V2:
> > Fixed some more typos suggested by codespell
> > and the community.
> >
> > V1:
> > Fixed multiple typos
> >
> >  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/=
vmwgfx/vmwgfx_execbuf.c
> > index 36987ef3fc30..76aa72e8be73 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> > @@ -127,7 +127,7 @@ struct vmw_ctx_validation_info {
> >   * @func: Call-back to handle the command.
> >   * @user_allow: Whether allowed from the execbuf ioctl.
> >   * @gb_disable: Whether disabled if guest-backed objects are available=
.
> > - * @gb_enable: Whether enabled iff guest-backed objects are available.
> > + * @gb_enable: Whether enabled if guest-backed objects are available.
>
> "iff" normally means "if and only if" and its use in the kernel sources i=
s
> usually not a mistake. However, this one sounds dodgy to me (before your =
change),
> so it's OK IMO. Also, the line above it uses "if" for a similar comment.
>
> Maybe someone else knows better.

Right, this one was "iff". I submitted a version of this without the
iff change to drm-misc-next.
z
