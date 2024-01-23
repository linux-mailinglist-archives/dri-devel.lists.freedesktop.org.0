Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC51838813
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 08:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2384F10E2E8;
	Tue, 23 Jan 2024 07:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0656D10E2E8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 07:39:46 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-33931b38b65so1958986f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 23:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705995525; x=1706600325; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yETxiGG3CveSvMqCA4PglMWiCajZsQqRtEiheWi+x/Q=;
 b=i9WLwJJrj2vhe800wRmoQ2tSTvKUa3ZKg0pX2mCH2fyarvT1Im/1h9DJ0WFQtEb6De
 7qI6z28BG5Ql/J/+Ar1XPnjnt5CenHBEGNAwfCRlUkiWqUxX92L1tgIHtTLyrpat35CO
 Jy20tnCUhid52wM6Rx4kaWwprHZ0LmfKim7EwuFUYLQN0o/4vSljfD5lJpl3M+am6dFE
 VNaCBniQBt5svDEbC3ukPurHwG/Ylf4MWjswF86P2Zss87KwWmGWEUZdQeJxcTuCtsTN
 fmAtAfNxXueTE5DCFCzysG4bmKT6SS3DX3Y0S4sc2yxylrCM9QaiMT9inglcTAaFr56T
 zkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705995525; x=1706600325;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yETxiGG3CveSvMqCA4PglMWiCajZsQqRtEiheWi+x/Q=;
 b=xEDq7+uVzwuoGdj3PkOYioICjOgbL7HWXRwjvgyN/5WoUfqIMwjZfq6PLH3vlg8u8b
 sIr3zNwWM9WeC1vNs2FednSPjXEd9IXOaSx/oKorxfH1/vla6CQVGuxeMkLHlxX/YXRc
 B9rQvZjNbjaWlzP3GOf0jP4ZT9RYxPur5z+wBJouIChC5Ju/zMvaLZ0rmnDp7qvOh4AD
 61EiY587CbekMuDVJm1f7PMBereiyQ/Kzdc3clDi/n79CgP9RMuXwKR0Xp9yXjZwZu/y
 t+19BdeJpwAGiHRpKwkPLM8bYlvUBUz+VYMVeZ3+Ph3+g+QDLuRpB7J3QvYCIEGcEhgn
 xAXQ==
X-Gm-Message-State: AOJu0YyUjOxIo677L8x5hu9TZgm3F80MjZnxasvo+r2KFkBMB+iQ48NQ
 GaUnL61VTtSUX2MyitVv9voI6WUDcFd5hGjd4u+zml+raFJAB4wFI0U+46Z/cY8=
X-Google-Smtp-Source: AGHT+IEYd35MOW7sUO6WnjHIiHJYGzUljxDUCiR4Ck+ZRIreA3QvtDPNOG4m6ojWM4vS49RBrPxWhA==
X-Received: by 2002:a5d:6882:0:b0:336:768d:1b90 with SMTP id
 h2-20020a5d6882000000b00336768d1b90mr1758406wru.168.1705995525330; 
 Mon, 22 Jan 2024 23:38:45 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 t8-20020adff048000000b003366c058509sm7565004wro.23.2024.01.22.23.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 23:38:44 -0800 (PST)
Date: Tue, 23 Jan 2024 10:38:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH][next] drm/nouveau/fifo/gk104: remove redundant variable
 ret
Message-ID: <55f0983a-300e-40bb-9142-6f4683914402@moroto.mountain>
References: <20240116111609.2258675-1-colin.i.king@gmail.com>
 <aafe669f-b322-4f22-a48e-564e3eb3447f@moroto.mountain>
 <bdc7e401-a676-4040-9138-8dc5cf35bd05@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdc7e401-a676-4040-9138-8dc5cf35bd05@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Colin Ian King <colin.i.king@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 12:04:23AM +0100, Danilo Krummrich wrote:
> On 1/16/24 13:31, Dan Carpenter wrote:
> > On Tue, Jan 16, 2024 at 11:16:09AM +0000, Colin Ian King wrote:
> > > The variable ret is being assigned a value but it isn't being
> > > read afterwards. The assignment is redundant and so ret can be
> > > removed.
> > > 
> > > Cleans up clang scan build warning:
> > > warning: Although the value stored to 'ret' is used in the enclosing
> > > expression, the value is never actually read from 'ret'
> > > [deadcode.DeadStores]
> > > 
> > > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > > ---
> > >   drivers/gpu/drm/nouveau/nvif/fifo.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/nvif/fifo.c b/drivers/gpu/drm/nouveau/nvif/fifo.c
> > > index a463289962b2..e96de14ce87e 100644
> > > --- a/drivers/gpu/drm/nouveau/nvif/fifo.c
> > > +++ b/drivers/gpu/drm/nouveau/nvif/fifo.c
> > > @@ -73,9 +73,9 @@ u64
> > >   nvif_fifo_runlist(struct nvif_device *device, u64 engine)
> > >   {
> > >   	u64 runm = 0;
> > > -	int ret, i;
> > > +	int i;
> > > -	if ((ret = nvif_fifo_runlists(device)))
> > > +	if (nvif_fifo_runlists(device))
> > >   		return runm;
> > 
> > Could we return a literal zero here?  Otherwise, I'm surprised this
> > doesn't trigger a static checker warning.
> 
> Why do you think so? Conditionally, runm is used later on as well. I don't
> think the checker should complain about keeping the value single source.
> 
> If you agree, want to offer your RB?

If you look at v6.7 then probably 300 patches were from static
analysis.  The syzbot gets credit for 63 bugs and those bugs are more
important because those are real life bugs.  But static analysis is a
huge in terms of just quantity.

One of the most common bugs that static checkers complain about is
missing error codes.  It's a super common bug.  Returning success
instead of failure almost always results in NULL dereference or a use
after free or some kind of crash.  Fortunately, error paths seldom
affect real life users.

My published Smatch checks only complain about:

	if (ret)
		return ret;

	if (failure)
		return ret;

I have a different check that I haven't published but I wish that I
could which looks like:

	if (!ret)
		return ret;

Here is a bug that check found recently.
https://lore.kernel.org/all/9c81251b-bc87-4ca3-bb86-843dc85e5145@moroto.mountain/

I have a different unpublished check for every time ret is zero and we
do:
	return ret;

But I only review those warnings for specific code.  Perhaps, I could
make a warning for:

	if (failure)
		return ret;

I'm sure I tried this in the past and it had more false positives than
when we have an "if (ret) return ret;" like in the first example, but I
can't remember.  I could experiment with that a bit...

To me, if "return ret;" and "return 0;" are the same, then "return 0;"
is obviously more clear and looks more intentional.  When I was looking
at the code here, I had to consider the context.  Especially when the
patch was dealing with the "ret" variable it seemed suspicous.  But
"return 0;" is unamibuous.

I don't have a problem with this patch, it's correct.  But I really do
think that "return 0;" is clearer than "return ret;"

regards,
dan carpenter

