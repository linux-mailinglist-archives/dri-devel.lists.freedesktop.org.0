Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD91E6CAE22
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 21:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF5A10E6CF;
	Mon, 27 Mar 2023 19:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C4710E6CF;
 Mon, 27 Mar 2023 19:06:00 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id f14so4327869iow.5;
 Mon, 27 Mar 2023 12:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679943960;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q/6pCbry1/ETo4U2530l82j/Esz1dkFEPg21dCL6WTw=;
 b=qEjf8I4GOQ3ShgwJE6dqrPcG9qSLP1lpAnbSL/0QwbfT1gw6trLRerbTznbRPCRWGl
 ptSbtzVddhG0DF8sVXgPL8e0GpPUdTihkFWyQ2IeBBZCx3d9pTXVufkQvN4Ln2eoFpho
 minaZRNBe4lO/t3G2g5qBtUXF96q+1EmUvZVp86unc7ExQxECI7xGikVOPtjmWcztXlO
 RvVP3tNTL8YCaIKjtdq6QujfVIMo6xUontUVN+nJQBg/aNtTfhXedAA3JZ25BODvyIt1
 EK3lQYu0LF0cIkZghChlDy5bfu+7aBMkXpcUyHtmnra0GZc1Y0wCFi+hqwWmUvZdo855
 UU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679943960;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q/6pCbry1/ETo4U2530l82j/Esz1dkFEPg21dCL6WTw=;
 b=EUF1JkT4b5zHZzDZBBDK1lqkCUyuoJdwQcq6cLlLaC+gSEsYrB19X7hMD0bexBcCAj
 ISM+IEDNfqnl4O/9bA3P/MXppMSG4GzTkHRHjBobCr/Mqs/q6Xpk7IOnMbdg4/hDrmVk
 n3fdVgsBJdflQad3zhR6eittTXetMmM4L3rZ2mgjX1CqR8LYRnJ9xj1WxPE5HM9JvoXA
 AHezY+M5vVYhBXs+KcXHxMsrZ3M4o5skdqzieMWAId1po5GC8JpDLXbCw/cnImptq6a7
 iX9Na8ZCS6uQiUdIJfIzBYZleW5h9uuufCU8gg0jqoWSPgyMn0eKVFKrbuIcuP1LoXnF
 Sv2A==
X-Gm-Message-State: AO0yUKVY0lWSO2cLPWeGW2BQ3ZUXwtmDv4vYc8deU9F+tkLZb33U0YBx
 GT/OX/frXaErUSoF2ykpPGK/7KLUe65y/tssRkk=
X-Google-Smtp-Source: AK7set+YB0mgSsfhYO28hAVommFXrSJ7Khtm4bPRuGYAQdnaWKxQKYL1vrIABfxBGJd0YlxvVRZhRVs+2KV9z5cUoZY=
X-Received: by 2002:a02:2208:0:b0:3ad:65e:e489 with SMTP id
 o8-20020a022208000000b003ad065ee489mr5198516jao.1.1679943959800; Mon, 27 Mar
 2023 12:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230308155322.344664-1-robdclark@gmail.com>
In-Reply-To: <20230308155322.344664-1-robdclark@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 27 Mar 2023 15:05:48 -0400
Message-ID: <CAEdQ38FGQe_z2T2vUCsSYvH52WZc75OPCCFYOSEKJ9MzXq0ynw@mail.gmail.com>
Subject: Re: [PATCH v10 00/15] dma-fence: Deadline awareness
To: Rob Clark <robdclark@gmail.com>
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Gustavo Padovan <gustavo@padovan.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Liu Shixin <liushixin2@huawei.com>,
 Rob Clark <robdclark@chromium.org>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 8, 2023 at 10:53=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> This series adds a deadline hint to fences, so realtime deadlines
> such as vblank can be communicated to the fence signaller for power/
> frequency management decisions.
>
> This is partially inspired by a trick i915 does, but implemented
> via dma-fence for a couple of reasons:
>
> 1) To continue to be able to use the atomic helpers
> 2) To support cases where display and gpu are different drivers
>
> This iteration adds a dma-fence ioctl to set a deadline (both to
> support igt-tests, and compositors which delay decisions about which
> client buffer to display), and a sw_sync ioctl to read back the
> deadline.  IGT tests utilizing these can be found at:


I read through the series and didn't spot anything. Have a rather weak

Reviewed-by: Matt Turner <mattst88@gmail.com>

Thanks!
