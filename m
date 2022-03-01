Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8384C9221
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 18:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FD510E5C6;
	Tue,  1 Mar 2022 17:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F27510E5A6;
 Tue,  1 Mar 2022 17:45:11 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id ay10so3878979wrb.6;
 Tue, 01 Mar 2022 09:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LCKZuqBaQrqVvcLu/EUZDoUvEFQ31pI7qQ+wygT5714=;
 b=GgdmWlO6xVaLOUNuLj+YvNsSoAlTqMq+dOrCyEjLKS+ZFbI2FQbSkpU2ikDfOzkS63
 fgIHsSAFVJRTiXxioBvPS3Fj5Spj2nIxhcf2L7R24GTdQHbeGQvQjtZgzBZ/HE+QNYJA
 iHjXoDqknYBPfOULvIzlb2BeMyItKLFDk0d9hVXJe3mtde2171/FtAcKiIgiAURpFuOU
 /epZze29QyzrVoZGY1GgRHXmkgHyQuzsLFB/cP1oufq80EOxPWTAQ7xwZD4ElrD/Ck99
 ptIoFxorgkey4MAKh+JiiQMTS+K3YJlcQf+6XnCZcc8xtgx2W05S2wMssyHlyn/TMk7/
 DN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LCKZuqBaQrqVvcLu/EUZDoUvEFQ31pI7qQ+wygT5714=;
 b=4jiHEIiHiuG3h9QUgINlxWIk3oplB1MKgpBP6JBa9JB8IqQiZyK6njoy0Y1UgForyJ
 5JJ8y4sbMFQj+BduZlgxkXCI6Z+IoJh2h42zfW5dzSVxdUS8oJGi8w3X1eUTWd/3We5X
 lWsxY/K70x/2NJd4BOT4tN8Yvdczl0YOQz1/AJzpw1wSygLQLyS8SHNeiDvwlxnEBCBb
 8X+s4i4rxtppHYGh/XisCc6BCFf2zsHx04evgJaXpMKhM0on5T+DvdiASn/doCSNes2n
 NUs7wEGWZA9k0WNTfB21aEXdU4+BPeEolQdk4OiVDVt60FZchMIukIGiMbx6FWsy9U4e
 Ua3Q==
X-Gm-Message-State: AOAM5316o19Pxej4XZtaiG8/2nc0RlO3qCA5rESRvEH8j2C0fCGiBJ7v
 2ONs9E1kaoVTbKemI8rkOT+nLBLABUYb2CtoHB8=
X-Google-Smtp-Source: ABdhPJwQNgpFjfl73NGhoHP4atwM/20R77juX1EAsRkGpJfhZO7TsJePIDQE5ElT3fRCwE7agOirdL04RUfznC8bUXE=
X-Received: by 2002:a5d:44c7:0:b0:1ed:e11c:9b73 with SMTP id
 z7-20020a5d44c7000000b001ede11c9b73mr19967467wrr.574.1646156709718; Tue, 01
 Mar 2022 09:45:09 -0800 (PST)
MIME-Version: 1.0
References: <1644349472-31077-1-git-send-email-quic_abhinavk@quicinc.com>
 <YgZD8vPqB7ISpRpZ@kroah.com>
 <654d620b-9e14-c47f-b48c-762dc0bd32a1@quicinc.com>
 <Ygdb63FrorUsX/Hg@kroah.com>
 <b9156bde-137c-2fac-19e0-b205ab4d6016@quicinc.com>
 <7db7d01fcf5a3edce61161769c0e6eb1541237bf.camel@sipsolutions.net>
 <2add9ba7-7bc8-bd1d-1963-61e8154b0e3c@quicinc.com>
 <989efb15-cc5e-8f6d-c313-118f01498e33@quicinc.com>
 <8fa2f879e33e4e42b76e21c6fbdcb023@AcuMS.aculab.com>
In-Reply-To: <8fa2f879e33e4e42b76e21c6fbdcb023@AcuMS.aculab.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 1 Mar 2022 09:45:39 -0800
Message-ID: <CAF6AEGtNGJanJ9f2pkjst50yPSWGJPo5nDkcZZgq=BkRWMq4yg@mail.gmail.com>
Subject: Re: [PATCH] devcoredump: increase the device delete timeout to 10 mins
To: David Laight <David.Laight@aculab.com>
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
Cc: "aravindh@codeaurora.org" <aravindh@codeaurora.org>,
 "rafael@kernel.org" <rafael@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "khsieh@codeaurora.org" <khsieh@codeaurora.org>,
 "nganji@codeaurora.org" <nganji@codeaurora.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 10:49 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Abhinav Kumar
> > Sent: 28 February 2022 21:38
> ...
> > We also did some profiling around how much increasing the block size
> > helps and here is the data:
> >
> > Block size    cost
> >
> > 4KB           229s
> > 8KB            86s
>
> You must have an O(n^2) operation in there - find it.

The problem is how the devcoredump/sysfs interface works, which
results in "re-rendering" the output for each block.. it's fine for
moderate size sysfs files, but scales quite badly once you get into
couple MB size sysfs files.

It could be fixed by having some way to keep state across successive
read callbacks.

BR,
-R

>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
