Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E474A1A456
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 13:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DBE10E7F7;
	Thu, 23 Jan 2025 12:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QubXU7wQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2B610E7F8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 12:33:20 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30737db1aa9so7559501fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 04:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737635599; x=1738240399; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MzuaUkJPtGU0Y8SsBm5U+6NPdWGRXOC1n7OZXEVN1BI=;
 b=QubXU7wQC9TFtEIMl4mmI3IuFk8fJnBrhPuGb24y/YZuJPD6dKhFTmOjEfPOeRDdws
 g0eSYu8fnU7j1RZcang6hZELGIzRcN6b1ru+VaSz7xplD29N7DCIqgHiXvbSAGDWCHfm
 uxbREwcHMI9cuzXgZCPyTvGfjj2geV3UaaJybWSr+MRBp0SXWUbzKRZ+Jx0jwacA5hjt
 i3E+9V+Wsp1W1YyWjA/Vjl0Qyrr+W7CzVRFsgCZwQ/iueBbmv4eql/Ex0iFYYHw9Jq4X
 hfnHNJTyfbPoUALJ66B2I+sdRsDr18+SLGPw+yt4/EP1To3RdT+ggZX1k3qsDphFsCGF
 ak/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737635599; x=1738240399;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MzuaUkJPtGU0Y8SsBm5U+6NPdWGRXOC1n7OZXEVN1BI=;
 b=jKlWyk8EckMuzMoubn1wkgD77H0lnSJjq+NZzn2n14TJwh3wM175ws7qtyT7WyLi6n
 yKtV3rnpvt888dUlKkv6U93P+PSnG3UFEyMwcTd7+ahzVnI4UIxXc+a1uCz4BkxxH354
 NkKuQ04jzSRCFomr0OiRMW8tWbzRwI3b4T12kkFjz1/VNzgpUuRhQt77e8WMW6oRZF5h
 jJFiKgl9mZfGSW6vEONLP0MqCdLLQVrMhWNqLjtIxk3pKlF+C85CKpxKjtl0f9ttnrue
 laFlhsi1Y8Nl1Q2qNd7iDKym+TxsZS5GhS8gmCN0BpmETrDDsxAwlFDXci+PcBUXjFmZ
 2Usg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuWXymIWMNaF2jORT+Bp7rirYWnd4EUdOm+iidDGkAcuo3fKWv1w8hQQXocHSHGUs4pktu3h66cwY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yysa75NXZuS+Cty0RkkR89aRFxMMAEGpYoN3jnCC+z1SN023il3
 hQuYCqOKDGfVk2Ril7iPZ0hZ9YjGnT1dzjgHaL081r/0H/er5MojteaMkd6V6BsCZVj3zR4VSv/
 ICfg=
X-Gm-Gg: ASbGncvIVhLHPd+o5i9ZWIikEODIys+AfntpRs2wF1JI94ElQ2kXh+p+RPoSClWXY/q
 +3OYKMGcqc8SnONENCE+u+hfBvobBAqzHmF+WEcZtLULN8vDezDJUIURXBFByYHfV1ZzCbkzLfz
 zt7/lapENWEUheBfgXrq1RjdM/enM1ROnK66rZT+cznr/Ty6gQWKy0mQ+QxCexYFV/dEnQQIRKM
 SC4HrMsUuj0Vf/4ChnVffDC/bWf9fGKexjhuKlZpu4LmSnNLiTkXd7gP+l4il4SSn4mmZMn+eP/
 szp8lLXUxI8i+4WgaanmBIHw+9APROoeOQxp5WFc3QHXzFK5KvUZ79L4jd+O
X-Google-Smtp-Source: AGHT+IErQWFeBotep27Ltl/nuscXGFi9e/0AUMTPcrmPtjAPmWeFKUSimPRCMFGsuvRpF6vYiR1yAA==
X-Received: by 2002:a2e:a54a:0:b0:302:3c78:4ea4 with SMTP id
 38308e7fff4ca-3072cb1f4demr90679461fa.30.1737635598411; 
 Thu, 23 Jan 2025 04:33:18 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a344890sm30144611fa.30.2025.01.23.04.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 04:33:17 -0800 (PST)
Date: Thu, 23 Jan 2025 14:33:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 1/4] misc: fastrpc: Add CRC support using invokeV2
 request
Message-ID: <yjvjq657cfqzfcvusox5ykpyhzsi37certamb4p35eowohwwoz@cjcujhkrt2tx>
References: <20241007084518.3649876-1-quic_ekangupt@quicinc.com>
 <20241007084518.3649876-2-quic_ekangupt@quicinc.com>
 <bmg5em2f673vis6wwtjx6ibkhee7d3zocwesgoafsgt5jxbfqn@w73y6gmzbamj>
 <53ce4792-6eca-42ae-b5d7-24d524697344@quicinc.com>
 <fm4wxyu7dv7wzz6szwtz4vyukzxmzajtzqlidaed4hcrabhpe2@eqw6vimhzkjm>
 <0dd43d4f-0399-454b-96fd-2d4f5f36ea14@quicinc.com>
 <drh2ikzku37tblmpkjbcdqjllynb3shsfogljfkhq2vcsej2ga@4ex36yehg2e6>
 <41fb5e93-2d77-48e5-92e0-8e82ee4d27ce@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41fb5e93-2d77-48e5-92e0-8e82ee4d27ce@quicinc.com>
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

On Thu, Jan 23, 2025 at 05:34:00PM +0530, Ekansh Gupta wrote:
> 
> 
> 
> On 1/23/2025 4:43 PM, Dmitry Baryshkov wrote:
> > On Thu, Jan 23, 2025 at 03:19:21PM +0530, Ekansh Gupta wrote:
> >>
> >>
> >> On 1/23/2025 1:18 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Jan 23, 2025 at 11:16:41AM +0530, Ekansh Gupta wrote:
> >>>>
> >>>> On 10/7/2024 7:27 PM, Dmitry Baryshkov wrote:
> >>>>> On Mon, Oct 07, 2024 at 02:15:15PM GMT, Ekansh Gupta wrote:
> >>>>>> InvokeV2 request is intended to support multiple enhanced invoke
> >>>>>> requests like CRC check, performance counter enablement and polling
> >>>>>> mode for RPC invocations. CRC check is getting enabled as part of
> >>>>>> this patch. CRC check for input and output argument helps in ensuring
> >>>>>> data consistency over a remote call. If user intends to enable CRC
> >>>>>> check, first local user CRC is calculated at user end and a CRC buffer
> >>>>>> is passed to DSP to capture remote CRC values. DSP is expected to
> >>>>>> write to the remote CRC buffer which is then compared at user level
> >>>>>> with the local CRC values.
> >>>>> This doesn't explain why this is necessary. Why do you need to checksum
> >>>>> arguments?
> >>>> This helps if the user suspects any data inconsistencies in the buffers passed to DSP over
> >>>> remote call. This is not enabled by default and user can enable it as per their reqirement.
> >>>> I'll add this information.
> >>> An inconsistency where? Between the kernel and the DSP? Between the user
> >>> and the DSP? Does it cover buffer contents or just the addresses?
> >> Inconsistency between user and DSP. crc_user is calculated at user library before
> >> making ioctl call and it is compared against the crc data which is filled by DSP and
> >> copied to user.
> >> This covers inconsistency in buffer contents.
> > What is the reason for possible inconsistencies? Is it a debugging
> > feature?
> This is a debugging feature. Buffer data corruption might result in inconsistency.
> >
> >>>>> Also, what if the DSP firmware doesn't support CRC? How should userspace
> >>>>> know that?
> >>>> CRC support on DSP is there since long time(>6years).
> >>> This doesn't give us a lot. Upstream kernel supports fastrpc since
> >>> MSM8916 and MSM8996. Do those platforms support CRC?
> >> The metadata buffer as of today also carries space for CRC information:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n877
> >>
> >> So this is common across all platforms.
> >>
> >> In case CRC is not supported on any older platform, it would result in crc mismatch at user library.
> >> As of now a warning is getting logged there, I can add the information suggesting the failure might
> >> also occur if CRC is not supported.
> > Logs go to /dev/null, they are ignored by users, etc. So either there
> > should be an actual error being returned by the kernel / library, or it
> > can be completely ignored and skipped.
> >
> > So, do MSM8916 / MSM8996 / SDM845 support CRC? If not, that must be
> > handled somehow.
> I see it's supported on SDM845 but not on MSM89##. I'll just send the new patch version for now
> as CRC mismatch failures are getting ignored.

Please clearly document which platforms don't support CRC feature, the
implications and the possible (userspace) impact. E.g. if the kernel
logs a message for each call with failed CRC case, then this might cause
a serious slowdown. Likewise a userspace lib might cause a slowdown.

In fact, if CRC is a debugging feature, is it going to be enabled or
disabled by default?

> >
> >>> And if they do, why do we need the invoke_v2? Can we modify existing
> >>> code instead?
> >> invoke_v2 is needed because there is a need to pass user crc pointer over ioctl call which
> >> cannot be achieved using existing code. Also there are plans to add more features to this
> >> invoke_v2 request which will carry some information from user.
> > Is it really extensible without breaking the ABI?
> I'm planning to keep reserved bits in uapi struct for the same. Do you see any
> problem with this?

Please keep Greg's comment in mind - verify that all reserved fields are
zero.

> >>>> From user space CRC check failure is
> >>>> not fatal and is printed as a warning. But if copy of CRC to user fails, it will result in remote
> >>>> call failure. Should I keep it as fatal considering that ever very old DSP support this or should
> >>>> I consider the copy failure as non-fatal as userspace is treating this as a warning?
> >>> warnings can remain unseen for a long time. Consider a GUI app. Nobody
> >>> is there to view kernel warnings or library output.
> >> Let me see if this can be done. Are you suggesting that the app will be somewhat tracking
> >> if there is any crc check mismatch failures?
> > I suggest returning -EIO to the app.
> I'll check this.
> >
> >>>>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >>>>>> ---
> >>>>>>  drivers/misc/fastrpc.c      | 161 ++++++++++++++++++++++++------------
> >>>>>>  include/uapi/misc/fastrpc.h |   7 ++
> >>>>>>  2 files changed, 116 insertions(+), 52 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >>>>>> index 74181b8c386b..8e817a763d1d 100644
> >>>>>> --- a/drivers/misc/fastrpc.c
> >>>>>> +++ b/drivers/misc/fastrpc.c
> >>>>>> @@ -573,13 +573,15 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
> >>>>>>  
> >>>>>>  static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
> >>>>>>  			struct fastrpc_user *user, u32 kernel, u32 sc,
> >>>>>> -			struct fastrpc_invoke_args *args)
> >>>>>> +			struct fastrpc_invoke_v2 *inv2)
> >>>>>>  {
> >>>>>>  	struct fastrpc_channel_ctx *cctx = user->cctx;
> >>>>>>  	struct fastrpc_invoke_ctx *ctx = NULL;
> >>>>>> +	struct fastrpc_invoke_args *args = NULL;
> >>>>> Why do you need to init to NULL if you are going to set it two lines
> >>>>> below?
> >>>>>
> >>>>>>  	unsigned long flags;
> >>>>>>  	int ret;
> >>>>>>  
> >>>>>> +	args = (struct fastrpc_invoke_args *)inv2->inv.args;
> >>>>> Why does it need a typecast?
> >>>>>
> >>>>>>  	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> >>>>>>  	if (!ctx)
> >>>>>>  		return ERR_PTR(-ENOMEM);
> >>>>>> @@ -611,6 +613,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
> >>>>>>  	/* Released in fastrpc_context_put() */
> >>>>>>  	fastrpc_channel_ctx_get(cctx);
> >>>>>>  
> >>>>>> +	ctx->crc = (u32 *)(uintptr_t)inv2->crc;
> >>>>> Oh, but why? Also is it a user pointer or in-kernel data? If it's a
> >>>>> user-based pointer, where is the accessiblity check? Why isn't it
> >>>>> annotated properly?
> >>>> This is a user pointer where the crc data is expected to be copied. There is no
> >>>> other access to this pointer from kernel. I'm planning to change the data type
> >>>> for crc as (void __user*) inside fastrpc_invoke_ctx structure.
> >>> Yes, please. Also make sure that sparse doesn't add any warnings
> >>> regarding pointer conversions.
> >> Ack.
> >>>>>>  	ctx->sc = sc;
> >>>>>>  	ctx->retval = -1;
> >>>>>>  	ctx->pid = current->pid;
> >>>>>> @@ -1070,6 +1073,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
> >>>>>>  	struct fastrpc_invoke_buf *list;
> >>>>>>  	struct fastrpc_phy_page *pages;
> >>>>>>  	u64 *fdlist;
> >>>>>> +	u32 *crclist;
> >>>>>>  	int i, inbufs, outbufs, handles;
> >>>>>>  
> >>>>>>  	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
> >>>>>> @@ -1078,6 +1082,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
> >>>>>>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
> >>>>>>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
> >>>>>>  	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
> >>>>>> +	crclist = (u32 *)(fdlist + FASTRPC_MAX_FDLIST);
> >>>>> I think we should rewrite this parsing somehow. Is the format of data
> >>>>> documented somewhere?
> >>>> fdlist, crclist and poll(planned) are the only pointers that is being used. I'm planning
> >>>> to store these pointers to ctx structure and directly use it wherever needed. This will
> >>>> clean-up this unnecessary calculations at multiple places.
> >>> Please do. Nevertheless, the format also must be documented.
> >> Ack.
> >>>>>>  
> >>>>>>  	for (i = inbufs; i < ctx->nbufs; ++i) {
> >>>>>>  		if (!ctx->maps[i]) {
> >>>>>> @@ -1102,6 +1107,12 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
> >>>>>>  			fastrpc_map_put(mmap);
> >>>>>>  	}
> >>>>>>  
> >>>>>> +	if (ctx->crc && crclist && rpra) {
> >>>>>> +		if (copy_to_user((void __user *)ctx->crc, crclist,
> >>>>>> +				FASTRPC_MAX_CRCLIST * sizeof(u32)))
> >>>>> Oh, so it's a user pointer. Then u32* was completely incorrect.
> >>>>> Also you are copying FASTRPC_MAX_CRCLIST elements. Are all of them
> >>>>> filled? Or are we leaking some data to userspace?
> >>>> Yes, right. Planning clean-up in next patch.
> >>>>
> >>>> All of FASTRPC_MAX_CRCLIST is filled with crc data by DSP so copying should be fine.
> >>> Huh? I definitely want to see documentation for function arguments.
> >> Sure. I'll also modify the metadata layout doc here to add fdlist, CRC and other planned contents.
> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n842
> > This is not a documentation. E.g. I can not write code using that
> > description. For example, it mentions neither FDLIST nor CRC.
> I'm planning to add complete documentation for CRC and polling mode in user library project.
> If I need to add documentation in driver, can you pls suggest what is the right place to add
> the information?

Library should be fine. We don't require documenting all hardware in the
kernel. But the uAPI of the driver should be properly described.

> 
> Thanks for your comments.
> 
> --ekansh
> >
> >>>>>> +			return -EFAULT;
> >>>>>> +	}
> >>>>>> +
> >>>>>>  	return 0;
> >>>>>>  }
> >>>>>>  
> 

-- 
With best wishes
Dmitry
