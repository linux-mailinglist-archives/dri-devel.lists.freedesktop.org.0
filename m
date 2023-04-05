Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6776D7CBC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 14:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBBD10E92F;
	Wed,  5 Apr 2023 12:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2474E10E92F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 12:35:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2D7846251E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 12:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57029C4339E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 12:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680698147;
 bh=8HlBKLIJpAV2b3eg1TOMDkkM5bLvfsYLVCoReuOUKpk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=i6O+ll+CiaHionwwAJNvxGHnXCKvQhgf+LFPbP6Caqkl44TZggP4VCA2avHOGG0cG
 p5yzqGZVrVV6cwLEFTVFf2VyH2DljKTpeg9ISGZEmrkMQiTZefigNVhiWLV4m6zhZn
 wsk/y9uFXXk2RmuQrh848zEWfiGtSGfEzHodaJGoW4EygHa9sxXD+xc4lHHmX3FVg1
 fF8ooeAEc/1tD0W9k1M/W/leOWxYXBbhmGuGRwKwPelIubqKta77NQvKHZUpyZvgL0
 kRmXHbcvQy25O1eXwc4z5N92Dfc3cppf3gvYcRSeqFTqIOWXNQAzfeSJqN2fQm6ZBM
 nsnmkjbcqKDtQ==
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-54bfce685c1so5083507b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 05:35:47 -0700 (PDT)
X-Gm-Message-State: AAQBX9fv/91M140fmabkqzX6sCl3NNEU5QjL7LRkAMiO/hMilixhfkOk
 xnSbPbkTVhYJPSR/4qXOOnzJz/msl9LOn2u7TqM=
X-Google-Smtp-Source: AKy350ZxpFbBPPjZoLu6Z6giTPoghjoGnWKV2I8a/ShJNOWIy5AwLideXolvJVQnNgYfShf4tojsh9mcOJq39p++hzI=
X-Received: by 2002:a81:b54f:0:b0:549:14b0:84af with SMTP id
 c15-20020a81b54f000000b0054914b084afmr1535850ywk.1.1680698146338; Wed, 05 Apr
 2023 05:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <1679932497-30277-1-git-send-email-quic_jhugo@quicinc.com>
 <857db3fb-b006-4aa8-a7f8-2ae0b8a160c9@quicinc.com>
 <c5d11a88-351a-8eaf-f1d2-d7cf37cdf81c@linux.intel.com>
In-Reply-To: <c5d11a88-351a-8eaf-f1d2-d7cf37cdf81c@linux.intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Wed, 5 Apr 2023 15:35:19 +0300
X-Gmail-Original-Message-ID: <CAFCwf12iVZkcPKOEc911-fCd4-YzHYJzs_p36jfBiT=VkcO9uQ@mail.gmail.com>
Message-ID: <CAFCwf12iVZkcPKOEc911-fCd4-YzHYJzs_p36jfBiT=VkcO9uQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] QAIC accel driver
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, bagasdotme@gmail.com,
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, mani@kernel.org,
 dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, stanislaw.gruszka@linux.intel.com,
 quic_carlv@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 5, 2023 at 2:26=E2=80=AFPM Jacek Lawrynowicz
<jacek.lawrynowicz@linux.intel.com> wrote:
>
> Hi,
>
> On 03.04.2023 19:22, Jeffrey Hugo wrote:
> > On 3/27/2023 9:54 AM, Jeffrey Hugo wrote:
> >> This series introduces a driver under the accel subsystem (QAIC -
> >> Qualcomm AIC) for the Qualcomm Cloud AI 100 product (AIC100).  AIC100 =
is
> >> a PCIe adapter card that hosts a dedicated machine learning inference
> >> accelerator.
> >>
> >> The previous version (v4) can be found at:
> >> https://lore.kernel.org/all/1679325074-5494-1-git-send-email-quic_jhug=
o@quicinc.com/
> >
> > Looks like things have been silent on this revision and we have a numbe=
r of review tags already.  Seems like this series is ready for merge.
> >
> > I'd like to see this queued for 6.4 if possible.  Given that we are at =
6.3-rc5, it seems like this would need to be merged now(ish) to make 6.4.
> >
> > Jacek, since you have commit permissions in drm-misc and are an active =
Accel maintainer, I wonder if it would be appropriate for you to merge this=
 series to drm-misc.  Thoughts?
>
> I'm would be happy to merge it but I think it needs to be acked by Oded f=
irst.
>
> Regards,
> Jacek

Hi,
Entire patch-set is:
Acked-by: Oded Gabbay <ogabbay@kernel.org>

Thanks,
Oded
