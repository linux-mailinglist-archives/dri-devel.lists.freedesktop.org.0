Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 221CFA19F5B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 08:48:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6F310E780;
	Thu, 23 Jan 2025 07:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m+3lLXxC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A08510E780
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 07:48:25 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb4so706639e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 23:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737618504; x=1738223304; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TAgzBFWvoNfqrs2RKpM4hGMsxrdxynI/YaPcW7eqIuI=;
 b=m+3lLXxCuIPrPXFo0kTdr1b/LdUVqsTIsxbyWKo/QuG/IFc8MI82QISGdRjOsGH01C
 uPWVDLvHaDdPQp0B8yO6oLCLymzmEM+XniEYFQKCaWLLRueG2YzHPdt/KAh4Q9Rx/JtE
 DEROvJo5lVlaX5W/3dlExf4pAVpYWPRjdRyK+d6VaJUecVLgVXPKadnEv8Yorzx6myyz
 cPhP2xQ5zxS7mwzP4oWHdDEBbx34DpQ7Tk+qP2/YpsvbfxPlBzw0U4X+Y3qF/O/4EoX6
 knFu0uULm+leFJd3aKMA55xhOQ+64EMTOw1FjsJpZtWNtj0T6jJl7v8tWYeb5QSckswV
 OSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737618504; x=1738223304;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TAgzBFWvoNfqrs2RKpM4hGMsxrdxynI/YaPcW7eqIuI=;
 b=rpCYU4JEf7p3RMtrk2Yx16cCSOA5cz9qwUjEebeEE/syBesqZ22sG4Hf811ogLOLXD
 XyFo/Co+Todnpq9lzeEwOSktq87yhbEopDlaPGmZUt2HL28tffMRQAFXkHR2+V40w55C
 Ar7HdCfYOMgCm0wWWbjJseJA1uYG6XLufdvFndrdAqQShMCyEww1umZ4C7KO6WDZE1FK
 IU+rGHRru0PjQ3CNzBxPQk3RrfVwcAbiBU0ntl2dV0ChlMaRDSK08PgCnMZWbG5gVmqA
 maeBMWmQiD3i3cG2C6L5WijT9urOB+mOHD9IDF4971eDlPp3Mmy1a70nBFrjBRQodJHM
 tWHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrGxZfA54SlzB0f/lri6jXAcoZtjlLyPIb3Bi/P5ANIQNmuFUJ6T4RD5kn2e9XBPX0eKHqy6jYl8U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1uGoou0w7IrngtAC6SC+LgoZPoplqiC0GX6iTVrd+DPbF51Gn
 GuskuE32TeukYDoCJJPtY0S86IqSMd17kcehlWjBfQy1nIIuRzDJ7Lx1379RQVU=
X-Gm-Gg: ASbGncteZMOCLs/45vT/oOKFkoVP3zAfPxnGPZ+qi6slLHUhYhubBzm11Y2Bz7Qxbve
 JREm48Tdl9BvRo2eHUFs8o8mV03eXLIqeeubIhhQvyVJXKTKMhhA9fywSM4xuZMBMlwHJmNB4bl
 xCJ6NtD2ySYgSJQrBH5487vTLGWUBjGlyfKPCSvfUMvfc4eimG/yDmL0EGPap6Owxo/Y4p/CrpN
 fp6LMVxPg6jr4nreDIR/ijBDyEorh+lmTpR7lNW4T+TRjj9bM80aPgewqhdjruBG4hfIyUI4/7r
 CV4aaMp87dXA5RlHPMYPGzoyhMNyN0hX4RTz1RU4KFq1jsMNm4hjD2tfj77x
X-Google-Smtp-Source: AGHT+IENeSO7SdQX1wA+LznM3S48DXfC8H8DlOH/8cEqpLDj4dPtBtGzAftqKzC/6B8p5rtafrPe3w==
X-Received: by 2002:a05:6512:ac7:b0:542:2934:71a7 with SMTP id
 2adb3069b0e04-5439c24626amr9424531e87.15.1737618503461; 
 Wed, 22 Jan 2025 23:48:23 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78683sm2519992e87.242.2025.01.22.23.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 23:48:23 -0800 (PST)
Date: Thu, 23 Jan 2025 09:48:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 1/4] misc: fastrpc: Add CRC support using invokeV2
 request
Message-ID: <fm4wxyu7dv7wzz6szwtz4vyukzxmzajtzqlidaed4hcrabhpe2@eqw6vimhzkjm>
References: <20241007084518.3649876-1-quic_ekangupt@quicinc.com>
 <20241007084518.3649876-2-quic_ekangupt@quicinc.com>
 <bmg5em2f673vis6wwtjx6ibkhee7d3zocwesgoafsgt5jxbfqn@w73y6gmzbamj>
 <53ce4792-6eca-42ae-b5d7-24d524697344@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53ce4792-6eca-42ae-b5d7-24d524697344@quicinc.com>
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

On Thu, Jan 23, 2025 at 11:16:41AM +0530, Ekansh Gupta wrote:
> 
> 
> 
> On 10/7/2024 7:27 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 07, 2024 at 02:15:15PM GMT, Ekansh Gupta wrote:
> >> InvokeV2 request is intended to support multiple enhanced invoke
> >> requests like CRC check, performance counter enablement and polling
> >> mode for RPC invocations. CRC check is getting enabled as part of
> >> this patch. CRC check for input and output argument helps in ensuring
> >> data consistency over a remote call. If user intends to enable CRC
> >> check, first local user CRC is calculated at user end and a CRC buffer
> >> is passed to DSP to capture remote CRC values. DSP is expected to
> >> write to the remote CRC buffer which is then compared at user level
> >> with the local CRC values.
> > This doesn't explain why this is necessary. Why do you need to checksum
> > arguments?
> This helps if the user suspects any data inconsistencies in the buffers passed to DSP over
> remote call. This is not enabled by default and user can enable it as per their reqirement.
> I'll add this information.

An inconsistency where? Between the kernel and the DSP? Between the user
and the DSP? Does it cover buffer contents or just the addresses?

> >
> > Also, what if the DSP firmware doesn't support CRC? How should userspace
> > know that?
> CRC support on DSP is there since long time(>6years).

This doesn't give us a lot. Upstream kernel supports fastrpc since
MSM8916 and MSM8996. Do those platforms support CRC?
And if they do, why do we need the invoke_v2? Can we modify existing
code instead?

> From user space CRC check failure is
> not fatal and is printed as a warning. But if copy of CRC to user fails, it will result in remote
> call failure. Should I keep it as fatal considering that ever very old DSP support this or should
> I consider the copy failure as non-fatal as userspace is treating this as a warning?

warnings can remain unseen for a long time. Consider a GUI app. Nobody
is there to view kernel warnings or library output.

> >
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>  drivers/misc/fastrpc.c      | 161 ++++++++++++++++++++++++------------
> >>  include/uapi/misc/fastrpc.h |   7 ++
> >>  2 files changed, 116 insertions(+), 52 deletions(-)
> >>
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index 74181b8c386b..8e817a763d1d 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -573,13 +573,15 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
> >>  
> >>  static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
> >>  			struct fastrpc_user *user, u32 kernel, u32 sc,
> >> -			struct fastrpc_invoke_args *args)
> >> +			struct fastrpc_invoke_v2 *inv2)
> >>  {
> >>  	struct fastrpc_channel_ctx *cctx = user->cctx;
> >>  	struct fastrpc_invoke_ctx *ctx = NULL;
> >> +	struct fastrpc_invoke_args *args = NULL;
> > Why do you need to init to NULL if you are going to set it two lines
> > below?
> >
> >>  	unsigned long flags;
> >>  	int ret;
> >>  
> >> +	args = (struct fastrpc_invoke_args *)inv2->inv.args;
> > Why does it need a typecast?
> >
> >>  	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> >>  	if (!ctx)
> >>  		return ERR_PTR(-ENOMEM);
> >> @@ -611,6 +613,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
> >>  	/* Released in fastrpc_context_put() */
> >>  	fastrpc_channel_ctx_get(cctx);
> >>  
> >> +	ctx->crc = (u32 *)(uintptr_t)inv2->crc;
> > Oh, but why? Also is it a user pointer or in-kernel data? If it's a
> > user-based pointer, where is the accessiblity check? Why isn't it
> > annotated properly?
> This is a user pointer where the crc data is expected to be copied. There is no
> other access to this pointer from kernel. I'm planning to change the data type
> for crc as (void __user*) inside fastrpc_invoke_ctx structure.

Yes, please. Also make sure that sparse doesn't add any warnings
regarding pointer conversions.

> >
> >>  	ctx->sc = sc;
> >>  	ctx->retval = -1;
> >>  	ctx->pid = current->pid;
> >> @@ -1070,6 +1073,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
> >>  	struct fastrpc_invoke_buf *list;
> >>  	struct fastrpc_phy_page *pages;
> >>  	u64 *fdlist;
> >> +	u32 *crclist;
> >>  	int i, inbufs, outbufs, handles;
> >>  
> >>  	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
> >> @@ -1078,6 +1082,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
> >>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
> >>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
> >>  	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
> >> +	crclist = (u32 *)(fdlist + FASTRPC_MAX_FDLIST);
> > I think we should rewrite this parsing somehow. Is the format of data
> > documented somewhere?
> fdlist, crclist and poll(planned) are the only pointers that is being used. I'm planning
> to store these pointers to ctx structure and directly use it wherever needed. This will
> clean-up this unnecessary calculations at multiple places.


Please do. Nevertheless, the format also must be documented.

> >
> >>  
> >>  	for (i = inbufs; i < ctx->nbufs; ++i) {
> >>  		if (!ctx->maps[i]) {
> >> @@ -1102,6 +1107,12 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
> >>  			fastrpc_map_put(mmap);
> >>  	}
> >>  
> >> +	if (ctx->crc && crclist && rpra) {
> >> +		if (copy_to_user((void __user *)ctx->crc, crclist,
> >> +				FASTRPC_MAX_CRCLIST * sizeof(u32)))
> > Oh, so it's a user pointer. Then u32* was completely incorrect.
> > Also you are copying FASTRPC_MAX_CRCLIST elements. Are all of them
> > filled? Or are we leaking some data to userspace?
> Yes, right. Planning clean-up in next patch.
> 
> All of FASTRPC_MAX_CRCLIST is filled with crc data by DSP so copying should be fine.

Huh? I definitely want to see documentation for function arguments.

> >
> >> +			return -EFAULT;
> >> +	}
> >> +
> >>  	return 0;
> >>  }
> >>  
> >> @@ -1137,13 +1148,12 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
> >>  
> >>  }
> >>  
> >> -static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
> >> -				   u32 handle, u32 sc,
> >> -				   struct fastrpc_invoke_args *args)
> >> +static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel, struct fastrpc_invoke_v2 *inv2)
> > Please don't touch what doesn't need to be touched. You are replacing
> > handle/sc/args with inv2, not touching the first line.
> Ack.
> >
> >>  {
> >>  	struct fastrpc_invoke_ctx *ctx = NULL;
> >>  	struct fastrpc_buf *buf, *b;
> >> -
> >> +	struct fastrpc_invoke inv;
> >> +	u32 handle, sc;
> >>  	int err = 0;
> >>  
> >>  	if (!fl->sctx)
> >> @@ -1152,12 +1162,15 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
> >>  	if (!fl->cctx->rpdev)
> >>  		return -EPIPE;
> >>  
> >> +	inv = inv2->inv;
> >> +	handle = inv.handle;
> >> +	sc = inv.sc;
> >>  	if (handle == FASTRPC_INIT_HANDLE && !kernel) {
> >>  		dev_warn_ratelimited(fl->sctx->dev, "user app trying to send a kernel RPC message (%d)\n",  handle);
> >>  		return -EPERM;
> >>  	}
> >>  
> >> -	ctx = fastrpc_context_alloc(fl, kernel, sc, args);
> >> +	ctx = fastrpc_context_alloc(fl, kernel, sc, inv2);
> >>  	if (IS_ERR(ctx))
> >>  		return PTR_ERR(ctx);
> >>  
> >> @@ -1239,6 +1252,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> >>  {
> >>  	struct fastrpc_init_create_static init;
> >>  	struct fastrpc_invoke_args *args;
> >> +	struct fastrpc_invoke_v2 ioctl = {0};
> > Why do you need to init it?
> Ack.
> >
> >>  	struct fastrpc_phy_page pages[1];
> >>  	char *name;
> >>  	int err;
> >> @@ -1248,7 +1262,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> >>  		u32 namelen;
> >>  		u32 pageslen;
> >>  	} inbuf;
> >> -	u32 sc;
> >>  
> >>  	args = kcalloc(FASTRPC_CREATE_STATIC_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
> >>  	if (!args)
> >> @@ -1313,10 +1326,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> >>  	args[2].length = sizeof(*pages);
> >>  	args[2].fd = -1;
> >>  
> >> -	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_STATIC, 3, 0);
> >> -
> >> -	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> >> -				      sc, args);
> >> +	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
> >> +	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_STATIC, 3, 0);
> >> +	ioctl.inv.args = (u64)args;
> > Can you pass it as is, without typecasts?
> Cleaned up in refactoring change.
> >
> >> +	err = fastrpc_internal_invoke(fl, true, &ioctl);
> >>  	if (err)
> >>  		goto err_invoke;
> >>  
> >> @@ -1357,6 +1370,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
> >>  {
> >>  	struct fastrpc_init_create init;
> >>  	struct fastrpc_invoke_args *args;
> >> +	struct fastrpc_invoke_v2 ioctl = {0};
> >>  	struct fastrpc_phy_page pages[1];
> >>  	struct fastrpc_map *map = NULL;
> >>  	struct fastrpc_buf *imem = NULL;
> >> @@ -1370,7 +1384,6 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
> >>  		u32 attrs;
> >>  		u32 siglen;
> >>  	} inbuf;
> >> -	u32 sc;
> >>  	bool unsigned_module = false;
> >>  
> >>  	args = kcalloc(FASTRPC_CREATE_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
> >> @@ -1444,12 +1457,12 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
> >>  	args[5].length = sizeof(inbuf.siglen);
> >>  	args[5].fd = -1;
> >>  
> >> -	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
> >> +	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
> >> +	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
> >>  	if (init.attrs)
> >> -		sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);
> >> -
> >> -	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> >> -				      sc, args);
> >> +		ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);
> > if (init.attrs)
> >     ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);
> > else
> >     ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
> >
> >> +	ioctl.inv.args = (u64)args;
> >> +	err = fastrpc_internal_invoke(fl, true, &ioctl);
> >>  	if (err)
> >>  		goto err_invoke;
> >>  
> >> @@ -1501,17 +1514,18 @@ static void fastrpc_session_free(struct fastrpc_channel_ctx *cctx,
> >>  static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
> >>  {
> >>  	struct fastrpc_invoke_args args[1];
> >> +	struct fastrpc_invoke_v2 ioctl = {0};
> >>  	int tgid = 0;
> >> -	u32 sc;
> >>  
> >>  	tgid = fl->tgid;
> >>  	args[0].ptr = (u64)(uintptr_t) &tgid;
> >>  	args[0].length = sizeof(tgid);
> >>  	args[0].fd = -1;
> >> -	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_RELEASE, 1, 0);
> >>  
> >> -	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> >> -				       sc, &args[0]);
> >> +	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
> >> +	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_RELEASE, 1, 0);
> >> +	ioctl.inv.args = (u64)args;
> >> +	return fastrpc_internal_invoke(fl, true, &ioctl);
> >>  }
> >>  
> >>  static int fastrpc_device_release(struct inode *inode, struct file *file)
> >> @@ -1647,45 +1661,77 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
> >>  static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
> >>  {
> >>  	struct fastrpc_invoke_args args[1];
> >> +	struct fastrpc_invoke_v2 ioctl = {0};
> >>  	int tgid = fl->tgid;
> >> -	u32 sc;
> >>  
> >>  	args[0].ptr = (u64)(uintptr_t) &tgid;
> >>  	args[0].length = sizeof(tgid);
> >>  	args[0].fd = -1;
> >> -	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
> >>  	fl->pd = pd;
> >>  
> >> -	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> >> -				       sc, &args[0]);
> >> +	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
> >> +	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
> >> +	ioctl.inv.args = (u64)args;
> >> +	return fastrpc_internal_invoke(fl, true, &ioctl);
> >>  }
> >>  
> >> -static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
> >> +static int fastrpc_copy_args(struct fastrpc_invoke *inv)
> >>  {
> >>  	struct fastrpc_invoke_args *args = NULL;
> >> -	struct fastrpc_invoke inv;
> >>  	u32 nscalars;
> >> -	int err;
> >> -
> >> -	if (copy_from_user(&inv, argp, sizeof(inv)))
> >> -		return -EFAULT;
> >>  
> >>  	/* nscalars is truncated here to max supported value */
> >> -	nscalars = REMOTE_SCALARS_LENGTH(inv.sc);
> >> +	nscalars = REMOTE_SCALARS_LENGTH(inv->sc);
> >>  	if (nscalars) {
> >>  		args = kcalloc(nscalars, sizeof(*args), GFP_KERNEL);
> >>  		if (!args)
> >>  			return -ENOMEM;
> >>  
> >> -		if (copy_from_user(args, (void __user *)(uintptr_t)inv.args,
> >> +		if (copy_from_user(args, (void __user *)(uintptr_t)inv->args,
> > Wait... So inv->args is a user pointer? Then how can you assign a
> > kernel-based pointer to the same field? I think you need to sanitize
> > your structures. One is userspace-facing. It should be using userspace
> > data pointers, etc. Another one is a kernel representation of the ioctl
> > args. It might have a different structure, it shouldn't contain __user
> > data, etc.
> I'm planning to have a new structure to carry ctx specific data which will be saved in
> fastrpc_invoke_ctx structure during fastrpc_context_alloc.
> 
> Something like this:
> struct fastrpc_ctx_args {
>     struct fastrpc_invoke_args *args;  /* Carries args that is copied from ioctl structure */
>     void __user *crc; /* Carries CRC user pointer where the crcdata from DSP will be copied for user to read */
>     u64 poll_timeout; /* Carried context specific poll_timeout information */
> };
> 
> Do you see any problem with this?

Not yet. But I'd like to see patches first.

> >
> >>  				   nscalars * sizeof(*args))) {
> >>  			kfree(args);
> >>  			return -EFAULT;
> >>  		}
> >>  	}
> >> +	inv->args = args;
> >>  
> >> -	err = fastrpc_internal_invoke(fl, false, inv.handle, inv.sc, args);
> >> -	kfree(args);
> >> +	return 0;
> >> +}
> > Looking at the rest of the code, I think the patch needs to be split.
> > CRC is the minor issue at this point, please focus on getting existing
> > data being handled correctly while refactoring the code to use new
> > structure. I'd suggest seeing two struct definitions: one for the
> > userspace and another one for the kernel space.
> I've made changes for refactoring where instead of using userspace structure, I'm
> planning to use fastrpc_ctx_args structure mentioned above.
> >
> >> +
> >> +static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
> >> +{
> >> +	struct fastrpc_invoke_v2 ioctl = {0};
> >> +	struct fastrpc_invoke inv;
> >> +	int err;
> >> +
> >> +	if (copy_from_user(&inv, argp, sizeof(inv)))
> >> +		return -EFAULT;
> >> +
> >> +	err = fastrpc_copy_args(&inv);
> >> +	if (err)
> >>
> >> -- 
> >> 2.34.1
> >>
> 

-- 
With best wishes
Dmitry
