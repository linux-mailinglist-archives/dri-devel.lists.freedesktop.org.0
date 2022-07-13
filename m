Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D59757355C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 13:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FE099FC4;
	Wed, 13 Jul 2022 11:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D32499FC2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 11:27:32 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id oy13so14436932ejb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 04:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cgbVqpds8mhTKeUXizYnEEoGmAd2rC6hze58WchI2BM=;
 b=YE8DIUKEKR81wAdiKdIdXPiVSalzHYH7NiL2C5V6iUyw/U4tQsO8cTTuNu/adU8fyD
 E8fm6cQ2pKPhPyvgxSzZFCLhHKzeHtboii2CGvQcd4XogCVJgBRpwytlV6CQ0wCAfHea
 AMIf6iz0sdEyy03hBciyNKRUGeDIDiCL8LxrSt4EpvWdPxSEsSO074ldQXBIeNzwuzmj
 yRHOIz5ox+htnE2+DlgT0jifhG4TJ4fbp4QRXAfKQy1i51Pq/kzbAMJoE5GaUI8X5MLI
 9pQ98Z71WcDiLMrOMK9KB/5LqNtMDcjz7FcCp7MUdfm19ZnuI3/m4UG5K+7+CGjdMHdq
 CRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cgbVqpds8mhTKeUXizYnEEoGmAd2rC6hze58WchI2BM=;
 b=S3o8QuvzBvcJG0ZdOnAOS9NytwIJSYHv05DErpwQbMGyzQAX7MNFQx6cd/YVWGtC8i
 F/NJKTqLY4VRB+vRAG5HA7WH1iUFPrMr4fsUdrSa+R4XQ3VFE2boAj+LhfPgwoqTyP3r
 fOfJeumvyxRK8Ar+OK0ZN2oa3Jn8xHUUx+HdeKo9zNhd3UXD4WaXVoQs0TiIRlYx9HCV
 vBsj0QMGV+wcuZVir7jxNzebHlCogcy3LclQ2GATIsYwG3xROStpvZCLknB8euaR5QFn
 52krDL1G1+WI5Scmc97QCQu+kvZ30BQpMGFeZuMtNgoCDddi9js2eMp387sJEfAnG24P
 uiVg==
X-Gm-Message-State: AJIora8BOSOjB3d8VWFt7pUvEVXKHbSWtxGyn5mILVAf+AazWWxg4S6k
 iqKLoRjbZnHZbTzxFGR/lM6KryooXw0tsc80Giiyyg==
X-Google-Smtp-Source: AGRyM1tHwm40kKIWPERFKsHDjnmslgZwhxHHbdVXqQbznHIUujskOLvaWC2g4hKKQJ6jrd9rtwfArZWg/KjJFIOPUh8=
X-Received: by 2002:a17:906:c781:b0:726:c967:8d1b with SMTP id
 cw1-20020a170906c78100b00726c9678d1bmr3093574ejb.54.1657711651034; Wed, 13
 Jul 2022 04:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220712131201.131475-1-christian.koenig@amd.com>
 <CADnq5_PSECF0b_ynF=UhXu3Os0hYZcvcQtk1pD+T3q+Z1g-Hgg@mail.gmail.com>
 <a3dfc73f-5867-d442-b74d-a890a42753bd@amd.com>
In-Reply-To: <a3dfc73f-5867-d442-b74d-a890a42753bd@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Wed, 13 Jul 2022 13:27:13 +0200
Message-ID: <CAP+8YyHLy9=ueEcgVbk6nnAr=aqJXW1f31xm37gkGVrzdG3o=g@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/dma_resv_usage: update explicit
 sync documentation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With that changed

Reviewed-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>

Thanks!

On Tue, Jul 12, 2022 at 3:23 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 12.07.22 um 15:20 schrieb Alex Deucher:
> > On Tue, Jul 12, 2022 at 9:12 AM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Make it clear that DMA_RESV_USAGE_BOOKMARK can be used for explicit sy=
nced
> > DMA_RESV_USAGE_BOOKKEEP?
>
> Crappy autocorrect and copy&paste. Thanks for pointing that out.
>
> Christian.
>
> >
> >> user space submissions as well and document the rules around adding th=
e
> >> same fence with different usages.
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> ---
> >>   include/linux/dma-resv.h | 16 +++++++++++++---
> >>   1 file changed, 13 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> >> index c8ccbc94d5d2..264e27e56dff 100644
> >> --- a/include/linux/dma-resv.h
> >> +++ b/include/linux/dma-resv.h
> >> @@ -62,6 +62,11 @@ struct dma_resv_list;
> >>    * For example when asking for WRITE fences then the KERNEL fences a=
re returned
> >>    * as well. Similar when asked for READ fences then both WRITE and K=
ERNEL
> >>    * fences are returned as well.
> >> + *
> >> + * Already used fences can be promoted in the sense that a fence with
> >> + * DMA_RESV_USAGE_BOOKMARK could become DMA_RESV_USAGE_READ by adding=
 it again
> > Same here.
> >
> > With that fixed,
> > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> >
> > Alex
> >
> >> + * with this usage. But fences can never be degraded in the sense tha=
t a fence
> >> + * with DMA_RESV_USAGE_WRITE could become DMA_RESV_USAGE_READ.
> >>    */
> >>   enum dma_resv_usage {
> >>          /**
> >> @@ -98,10 +103,15 @@ enum dma_resv_usage {
> >>           * @DMA_RESV_USAGE_BOOKKEEP: No implicit sync.
> >>           *
> >>           * This should be used by submissions which don't want to par=
ticipate in
> >> -        * implicit synchronization.
> >> +        * any implicit synchronization.
> >> +        *
> >> +        * The most common case are preemption fences, page table upda=
tes, TLB
> >> +        * flushes as well as explicit synced user submissions.
> >>           *
> >> -        * The most common case are preemption fences as well as page =
table
> >> -        * updates and their TLB flushes.
> >> +        * Explicit synced user user submissions can be promoted to
> >> +        * DMA_RESV_USAGE_READ or DMA_RESV_USAGE_WRITE as needed using
> >> +        * dma_buf_import_sync_file() when implicit synchronization sh=
ould
> >> +        * become necessary after initial adding of the fence.
> >>           */
> >>          DMA_RESV_USAGE_BOOKKEEP
> >>   };
> >> --
> >> 2.25.1
> >>
> >> _______________________________________________
> >> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> >> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org
>
