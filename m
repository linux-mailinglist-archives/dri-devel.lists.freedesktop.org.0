Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA82443277
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598327316C;
	Tue,  2 Nov 2021 16:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF537316B;
 Tue,  2 Nov 2021 16:14:12 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id bl12so5847802qkb.13;
 Tue, 02 Nov 2021 09:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fgqeEtgI/cs0M4vgdzmViWk6tFPcM14dilo4uIBxLKE=;
 b=Iqrt2YiihaFFyWftJ/9ObI9Ri6qcMPEQck5AOdqJo5ePfZjU80yQ3XRocoy/LxMH6S
 1JHhbuQV1MuEIMJrZSULfNjhSJoxalhoTdpxsHbPKVdJfm4JEy5yTtfEHU+e9+AgHAzb
 YO6CL7SAau3fpFxxIgnE6SDyzSc3WLHkVTPmmeY9Fls41NAK7R2eTwgcw1kbM4nRvZpb
 lFetC3cowKlGWh55XBIIulwruLguKlrDiXvvx9pk6TUnQk+ZpnG4h+a6STNbaljlnOyo
 ccAWtGgV4h2RVE6ZPUfvRhbuLrmKDp/sz7Lut0jxfGfwW16/9Fu1nOycyIdH0PDtimhw
 UZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fgqeEtgI/cs0M4vgdzmViWk6tFPcM14dilo4uIBxLKE=;
 b=pvcEmcCGe77PSldJYQjBakmUcCE6IMRIyN1NikFZIXGmFpIeUI1hmNSu6SCzzb00A6
 OBDgKk4XEEN4OWMwyiX5fg5pykfyiHed5uaCZmVBUv6Lj8+GYK2ljmRBDWT3rrD7iGdN
 Ae8FUotx2TE7jCbR2g52tZP83h0AP9XBxqTzRCL0Bwbz+GB0KnHI8w96rBxa6EiTCyt8
 Cc/4yvZ+KyyIggPRvS+GeEbqeUh9Ejk2bVoE0dOX4vFoT9nNOwC1m+lDwf3ZgoPeRWxD
 OSaEucmNjAX837E7AUn4L63u2poGvSpgTCYg344n6RqsAWsLtYa8D65YjmrGywMhWQgE
 D83A==
X-Gm-Message-State: AOAM531hrTMCVSflCgTCcCN9/W+yXlNvjyGZOi2zlDVoMTSYj/q4nDJz
 bvQLdEcQHwRfv9O/ihpSHEfncCVCgYlL79izitY=
X-Google-Smtp-Source: ABdhPJzAklQlPJAPi0gbt+hBlt6/VF0iWdeIK+jG23lxNNIBz9FXfyxnmeOSsUG8HB3NC5j7mRaKCFrv6UP4i3aV88o=
X-Received: by 2002:a05:620a:29c3:: with SMTP id
 s3mr5467027qkp.342.1635869651457; 
 Tue, 02 Nov 2021 09:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-11-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211021103605.735002-11-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 2 Nov 2021 16:13:45 +0000
Message-ID: <CAM0jSHMqchWSSb_F0Lqyai168-0r52L1QTML-JsHV3gm-tqqQA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 11/28] drm/i915/pm: Move CONTEXT_VALID_BIT
 check
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Oct 2021 at 11:37, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> Resetting will clear the CONTEXT_VALID_BIT, so wait until after that to test.
>

AFAIK this seems to be fixing something earlier in the series(maybe
patch 7?) i.e without this patch we seem to trigger the BUG_ON. If so,
this needs to be much earlier in the series?

Also this probably needs some more commentary in the commit message
for whether moving the BUG_ON matters, or if this is potentially
papering over something significant?

> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_pm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> index a1334b48dde7..849fbb229bd3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> @@ -52,8 +52,6 @@ static int __engine_unpark(struct intel_wakeref *wf)
>         /* Discard stale context state from across idling */
>         ce = engine->kernel_context;
>         if (ce) {
> -               GEM_BUG_ON(test_bit(CONTEXT_VALID_BIT, &ce->flags));
> -
>                 /* Flush all pending HW writes before we touch the context */
>                 while (unlikely(intel_context_inflight(ce)))
>                         intel_engine_flush_submission(engine);
> @@ -68,6 +66,9 @@ static int __engine_unpark(struct intel_wakeref *wf)
>                          ce->timeline->seqno,
>                          READ_ONCE(*ce->timeline->hwsp_seqno),
>                          ce->ring->emit);
> +
> +               GEM_BUG_ON(test_bit(CONTEXT_VALID_BIT, &ce->flags));
> +
>                 GEM_BUG_ON(ce->timeline->seqno !=
>                            READ_ONCE(*ce->timeline->hwsp_seqno));
>         }
> --
> 2.33.0
>
