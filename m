Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 655BE737D52
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 10:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9882110E411;
	Wed, 21 Jun 2023 08:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C3110E0B0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 08:36:50 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f6283d0d84so7672574e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 01:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687336607; x=1689928607;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a/zdzUksxIPOSmiXU0YWFhrkNEu/a1F/FSgSG74Upok=;
 b=CRx4B3y7g7d263zpm9WLfREQxMw+gs1KNT5/8JSVIBz+g0vBdocgv6PgKh8FWq/QE8
 O/JRt2G/hWGYFDE3hhtQIC/BozrozvUz5sm/AEh6ANHpkoqmv7YI6RGm0+dfb2qloVcI
 GW9bhvqOKNk87qOGd5J37a/3DD5Riln4z+ErSFQMryWPXBmHOriWHW+XFIutKYPuKJf6
 Et3Koj9P/miMKqxCoW5Qk+D6IayKzy4gtmbgb2CXC/jtZ0COpzfk9auTNdMupsDC3CAR
 GQoMgtXx8/+oWZhnL2XPBdCYOieG7WebXawNiN04LTqactnnbL2Yj+wP2f+QepViP1YJ
 in3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687336607; x=1689928607;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a/zdzUksxIPOSmiXU0YWFhrkNEu/a1F/FSgSG74Upok=;
 b=aV3MP//Pue3EMqKM53eA4Ji3dDJEjuMQvknbG/YIQkVnKfoXPLkRPwh47sCShuZOwc
 pPw6V1oS37g6AovWrViJX9wsOzI7z3jUvEN3jKIzdjvWN3HvJ+i04z3q6LEDTn/7dyHz
 PH9ObolNngmO8p8qlF5WSio8UUYh25ioY+kjmlRwOxGV9xTz/08rDfUh21aa97iIR50y
 fy8txuGtbJNhWJ1mDA37Yf3u1IAsvJrWPLpokaSVGc81E18kMGZwvm7nTJPuFLGJKUER
 rU7mJraod/sa/821XqAmPros7cSXpPPktxCMba2e79XG5x31QYpOzrK47wWDrcIXKff3
 8WHA==
X-Gm-Message-State: AC+VfDwVxFUWnzro7MJDUeaKmpgpRYLksMXJPv/fmVcZlGURmT9/KlYd
 k1FKcQXCo66ke0gbs7QN4qA=
X-Google-Smtp-Source: ACHHUZ6n8V6ucY/9DroLUt712Tma1+4ZsPC4JSWFEm9bh8UTpOEf/ZNr3MlzCYciR40k1lUOuIPbLQ==
X-Received: by 2002:a05:6512:3c4:b0:4f6:140b:743 with SMTP id
 w4-20020a05651203c400b004f6140b0743mr8487849lfp.25.1687336607149; 
 Wed, 21 Jun 2023 01:36:47 -0700 (PDT)
Received: from ?IPV6:2a00:e180:1557:8d00:aed9:fe98:2f71:4615?
 ([2a00:e180:1557:8d00:aed9:fe98:2f71:4615])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a7bc7cb000000b003f5ffba9ae1sm4340641wmk.24.2023.06.21.01.36.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 01:36:46 -0700 (PDT)
Message-ID: <00d03e78-e14a-ae9c-9e64-75f041f8fad5@gmail.com>
Date: Wed, 21 Jun 2023 10:36:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dma-buf: keep the signaling time of merged fences
Content-Language: en-US
To: Gustavo Padovan <gustavo@padovan.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <DB9PR04MB9990B43E0722ECD4ADACD1EF8B5DA@DB9PR04MB9990.eurprd04.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <DB9PR04MB9990B43E0722ECD4ADACD1EF8B5DA@DB9PR04MB9990.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Jessie Hao <juan.hao@nxp.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

can I get a quick rb for this?

Going to add a Fixes tag before pushing.

Thanks,
Christian.

Am 21.06.23 um 09:57 schrieb Jessie Hao:
> Hi Christian,
> After applying the patch, the below android CTS cases can pass:
> CtsDeqpTestCases dEQP-EGL.functional.get_frame_timestamps*
> Thanks for taking care of this.
>
> Tested-by: Jessie Hao <juan.hao@nxp.com>
>
> -----Original Message-----
> From: Christian König <ckoenig.leichtzumerken@gmail.com>
> Sent: Wednesday, June 21, 2023 3:32 PM
> To: Jessie Hao <juan.hao@nxp.com>; dri-devel@lists.freedesktop.org
> Cc: Christian König <christian.koenig@amd.com>; stable@vger.kernel.org
> Subject: [PATCH] dma-buf: keep the signaling time of merged fences
>
>
> Some Android CTS is testing for that.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> CC: stable@vger.kernel.org
> ---
>   drivers/dma-buf/dma-fence-unwrap.c | 11 +++++++++--
>   drivers/dma-buf/dma-fence.c        |  5 +++--
>   drivers/gpu/drm/drm_syncobj.c      |  2 +-
>   include/linux/dma-fence.h          |  2 +-
>   4 files changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> index 7002bca792ff..06eb91306c01 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -66,18 +66,25 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,  {
>          struct dma_fence_array *result;
>          struct dma_fence *tmp, **array;
> +       ktime_t timestamp;
>          unsigned int i;
>          size_t count;
>
>          count = 0;
> +       timestamp = ns_to_ktime(0);
>          for (i = 0; i < num_fences; ++i) {
> -               dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
> +               dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
>                          if (!dma_fence_is_signaled(tmp))
>                                  ++count;
> +                       else if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> +                                         &tmp->flags) &&
> +                                ktime_after(tmp->timestamp, timestamp))
> +                               timestamp = tmp->timestamp;
> +               }
>          }
>
>          if (count == 0)
> -               return dma_fence_get_stub();
> +               return dma_fence_allocate_private_stub(timestamp);
>
>          array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
>          if (!array)
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c index f177c56269bb..ad076f208760 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -150,10 +150,11 @@ EXPORT_SYMBOL(dma_fence_get_stub);
>
>   /**
>    * dma_fence_allocate_private_stub - return a private, signaled fence
> + * @timestamp: timestamp when the fence was signaled
>    *
>    * Return a newly allocated and signaled stub fence.
>    */
> -struct dma_fence *dma_fence_allocate_private_stub(void)
> +struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp)
>   {
>          struct dma_fence *fence;
>
> @@ -169,7 +170,7 @@ struct dma_fence *dma_fence_allocate_private_stub(void)
>          set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>                  &fence->flags);
>
> -       dma_fence_signal(fence);
> +       dma_fence_signal_timestamp(fence, timestamp);
>
>          return fence;
>   }
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c index 0c2be8360525..04589a35eb09 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -353,7 +353,7 @@ EXPORT_SYMBOL(drm_syncobj_replace_fence);
>    */
>   static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)  {
> -       struct dma_fence *fence = dma_fence_allocate_private_stub();
> +       struct dma_fence *fence =
> + dma_fence_allocate_private_stub(ktime_get());
>
>          if (IS_ERR(fence))
>                  return PTR_ERR(fence);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h index d54b595a0fe0..0d678e9a7b24 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -606,7 +606,7 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)  void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline);
>
>   struct dma_fence *dma_fence_get_stub(void); -struct dma_fence *dma_fence_allocate_private_stub(void);
> +struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp);
>   u64 dma_fence_context_alloc(unsigned num);
>
>   extern const struct dma_fence_ops dma_fence_array_ops;
> --
> 2.34.1
>

