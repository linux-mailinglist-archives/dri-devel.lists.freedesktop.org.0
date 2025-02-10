Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0735A2E994
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 11:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E9A10E053;
	Mon, 10 Feb 2025 10:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kjzyJSa8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0AD10E053
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 10:35:59 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6f4434b5305so33042017b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 02:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739183758; x=1739788558; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7LztZBr9UCNRH3665/itmC4BjC9OAqgTvSMO1KGR3xk=;
 b=kjzyJSa8UsddwpeRfqSDP7tClCsW1zcbzdmoDYR9ZVeLbSM9CINn7zqyz5iZuhU3My
 6q2Fb4ajzLbff8fbePR+TSObqDxkC234JmJAP9Et7cisu3KcKsULJ/lXN/ueR6rpz38F
 lGlxfHGRd7zEMLw8rKauwVIJuFmpeb39OaN0CeLG3H/JmWutSXipTMPhCSoa2LHsTbTX
 WIdQFxXtXcqQyl1yRGl0EJM9sjsiUg6DxKB8HMePUGrZEo3qQhL90SniY9uZI/t8htoJ
 ZSOL3TRGyutzF41pdrUZ1tmg2/9R0dYfv0Vp+bPFZHqbv4wXu3UZgw690yROOpP6mrrA
 i/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739183758; x=1739788558;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7LztZBr9UCNRH3665/itmC4BjC9OAqgTvSMO1KGR3xk=;
 b=gDbSsLdap2TfPjmoHMg/gu8MYhcCJF6yTIqDTtxqG5HEmcl7tx0FfOPJ3pUl/hY/Vm
 EPeF91YYrUxXqqr6LMIbI5lVJmBVW49ogHXOVCX/8b07VrfZbP2taeV56FM49q7SdSKj
 3PVCL9QpK7myAfwnaQuLI5ed/7XGdKsyKqsXQjkEpOKHuL60YT7peb5/3OQ+Yw62bxGX
 HSCe6+BaiGurupZEPal/N3sWdnaEsgmVsfVcS6ubRociqnSQOexR9DOOgFfpM4midgf8
 Qqa/pb2UoF9gt5iPU3b9gZ5R0Er268TU/w8wV0n74ep8ZErhPB8AJGCgCQXfxiCDlDCt
 Gd7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSw1kvqSwkFG47kdbjUUBVqQVNOwQsZZ1cEdpviDisDHeTCAYLZuv9oJT3hGjovqZgIj/IsjafEI0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKG3IST7SBUhNdSt4rJpx1GDb+ntVdyJGWmBY4pG8kLmHByHF3
 lRt91y6aCVhsEYXnaUeChiWAvW5AL3dqrlh9dlWmeSH/S2X6v5KWvUV32YDVstt+D7IbAaTEkIM
 F1K6LtLUW12AoSk0LJ0AQGJrxOgTFFIcYK5OwtA==
X-Gm-Gg: ASbGnct1LQ5h/HqPsC4K1ejTqootLmVfpajgmUnP8E1a3cYsunGejkW5x4scruoJeRd
 jJ+gFGH5VKwCTeLyFEvLlItqPWNhEfZJZ1B+DhrZHw2ZkOeq4CtBcGEFfKcsFrn9zxJU1Wfpx6+
 wUQ69XLME6RhE=
X-Google-Smtp-Source: AGHT+IHt8hQwFd2lr2bqG242EFIHlbAYjCytUcpkE4iweROj/UMkohB1x0JR7pFoKeYm/Ay9mFUX1xMElnfFd5zGBZw=
X-Received: by 2002:a05:690c:610a:b0:6f9:87da:b763 with SMTP id
 00721157ae682-6f9b2818c4bmr98338027b3.12.1739183758565; Mon, 10 Feb 2025
 02:35:58 -0800 (PST)
MIME-Version: 1.0
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-6-quic_ekangupt@quicinc.com>
 <im7gi5ib7wnihu3ff4a2erqctne2pm2zf3wl4qmuejz4dfhf7e@z5au6vnm5por>
 <08b469b8-2339-4fde-9472-fcaadbb4ed87@quicinc.com>
 <jeixk4dmk53ubnujop3sp2lc6jffugjmzndmmqmyuft7uquibt@s2h2dgj7yj7h>
 <053dd6d6-9ca2-4723-8c21-da4093f00e03@quicinc.com>
In-Reply-To: <053dd6d6-9ca2-4723-8c21-da4093f00e03@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 10 Feb 2025 12:35:46 +0200
X-Gm-Features: AWEUYZmraPlEmdmws6gXHl7rBHz9XPzrdqwD1L7uBe0XsCT7vz2EaVFBgVPPQ0k
Message-ID: <CAA8EJppDK8MZw0s-2sOM9mf3smRfqCcyy=opq0dEF0AOCnWraA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] misc: fastrpc: Modify context id mask to support
 polling mode
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
 dri-devel@lists.freedesktop.org, arnd@arndb.de
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

On Mon, 10 Feb 2025 at 11:05, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
>
>
>
>
> On 1/29/2025 4:53 PM, Dmitry Baryshkov wrote:
> > On Wed, Jan 29, 2025 at 11:13:05AM +0530, Ekansh Gupta wrote:
> >>
> >>
> >> On 1/29/2025 5:00 AM, Dmitry Baryshkov wrote:
> >>> On Mon, Jan 27, 2025 at 10:12:39AM +0530, Ekansh Gupta wrote:
> >>>> DSP needs last 4 bits of context id to be 0 for polling mode to be
> >>>> supported as setting of last 8 is intended for async mode(not yet
> >>>> supported on upstream driver) and setting these bits restrics
> >>>> writing to poll memory from DSP. Modify context id mask to ensure
> >>>> polling mode is supported.
> >>> Shouldn't this commit come before the previous one?
> >> Yes, I'll change the order in next series.
> >>
> >> Thanks for reviewing the changes.
> > Please consider asking somebody for the internal review before sending
> > patches. This should help you to catch such mistakes.
> >
> > Next, I keep on asking for a sensible userspace and testing suite. No,
> > existing fastrpc doesn't pass that criteria. We have discussed that, but
> > I see no changes in the development. The PR that you've linked in the
> > cover letter contains a single commit, covering documentation, new
> > IOCTL, CRC support, poll mode support, etc. What if the discussion ends
> > up accepting the CRC support but declining the polling mode? Or vice
> > versa, accepting poll mode but declining the CRC support? There is no
> > easy way for us to review userspace impact, corresponding changes, etc.
>
> We are working with our Legal team to push HexagonSDK publicly , that  will
> have sample apps for all features supported by upstream driver and can be used
> for testing.
>
> I'll break down the PR to multiple meaningful commits based on the features
> that are getting added.
>
> >
> > Last, but not least: I want to bring up Sima's response in one of the
> > earlier discussions ([1]): "Yeah, if fastrpc just keeps growing the
> > story will completely different."
> >
> > You are adding new IOCTL and new ivocation API. That totally sounds
> > like "keeps growing", which returns us back to the uAPI question,
> > drm_accel.h and the rest of the questions on the userspace, compiler,
> > etc.
> >
> > [1] https://lore.kernel.org/dri-devel/Znk87-xCx8f3fIUL@phenom.ffwll.local/
>
> Currently, we are upstreaming the features supported on DSP for publicly
> available platforms. No features for future platforms are planned for FastRPC
> driver.
>
> We are also looking in having the driver under drivers/accel for any new features
> that are planned in future platforms.

Granted that there is a single driver, supporting all platforms, I
don't think that supporting new vs old platforms makes any sense.
The message from Sima was about growing the driver / uAPI. From my
point of view, adding a new IOCTL points out active driver development
(from the upstream kernel point of view).
Please talk to your only upstream users - libssc / hexagonrpcd
developers. It should be them reviewing your uAPI changes, not just
me.

And yes, from my side, the question would be the same: if you are
adding a new uAPI, why is it not following drm_accel.h? "It has been
done this way ages ago" isn't an answer for _new_ IOCTLs.

>
> --ekansh
>
> >
> >
> >> --ekansh
> >>
> >>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >>>> ---
> >>>>  drivers/misc/fastrpc.c | 8 ++++----
> >>>>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >>>> index 257a741af115..ef56c793c564 100644
> >>>> --- a/drivers/misc/fastrpc.c
> >>>> +++ b/drivers/misc/fastrpc.c
> >>>> @@ -40,7 +40,7 @@
> >>>>  #define FASTRPC_INIT_HANDLE       1
> >>>>  #define FASTRPC_DSP_UTILITIES_HANDLE      2
> >>>>  #define FASTRPC_MAX_STATIC_HANDLE (20)
> >>>> -#define FASTRPC_CTXID_MASK (0xFF0)
> >>>> +#define FASTRPC_CTXID_MASK (0xFF0000)
> >>>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
> >>>>  #define INIT_FILE_NAMELEN_MAX (128)
> >>>>  #define FASTRPC_DEVICE_NAME       "fastrpc"
> >>>> @@ -524,7 +524,7 @@ static void fastrpc_context_free(struct kref *ref)
> >>>>            fastrpc_buf_free(ctx->buf);
> >>>>
> >>>>    spin_lock_irqsave(&cctx->lock, flags);
> >>>> -  idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
> >>>> +  idr_remove(&cctx->ctx_idr, ctx->ctxid >> 16);
> >>>>    spin_unlock_irqrestore(&cctx->lock, flags);
> >>>>
> >>>>    kfree(ctx->maps);
> >>>> @@ -664,7 +664,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
> >>>>            spin_unlock_irqrestore(&cctx->lock, flags);
> >>>>            goto err_idr;
> >>>>    }
> >>>> -  ctx->ctxid = ret << 4;
> >>>> +  ctx->ctxid = ret << 16;
> >>>>    spin_unlock_irqrestore(&cctx->lock, flags);
> >>>>
> >>>>    kref_init(&ctx->refcount);
> >>>> @@ -2675,7 +2675,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
> >>>>    if (len < sizeof(*rsp))
> >>>>            return -EINVAL;
> >>>>
> >>>> -  ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
> >>>> +  ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 16);
> >>>>
> >>>>    spin_lock_irqsave(&cctx->lock, flags);
> >>>>    ctx = idr_find(&cctx->ctx_idr, ctxid);
> >>>> --
> >>>> 2.34.1
> >>>>
>


-- 
With best wishes
Dmitry
