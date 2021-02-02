Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA7330B459
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 02:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF26A89E2B;
	Tue,  2 Feb 2021 01:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F00489DD5;
 Tue,  2 Feb 2021 01:02:04 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id p15so18570668wrq.8;
 Mon, 01 Feb 2021 17:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jQ1WfUQt71q9l47M9pw0jo5iRtif7JjLaJa1M/+QKNA=;
 b=sfxw6+zLWDJRfH56sqKa94m7XlcE20QqtuZWiUdSqnAbENFGMkOTIrsrFcV+gfwjph
 mATOGJxGfnmlFvSnAxTObjuQIqbZpUeNzcSlthCa3peNPkbDy8VwwHZswGFsxRveHsFa
 OlzLAMaQKawooUlRGX0XYqL6M+RRBuWMi8Pz/TF2uSMSglFHIc8zbQz3MLspMr+93EEk
 hvMf7XUMSLKe3bWRt6/HPX6BKTAJh0DyO8K3pSAEgw6jpmziL/0iJyvw6DuGwl9p+QQO
 hOSQkQpkinfRhRSQmWsfTR7IScQcvkPSmck6Iax0Cs1avxUqNeGTaXhIWaEx3mLmd+w2
 gD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jQ1WfUQt71q9l47M9pw0jo5iRtif7JjLaJa1M/+QKNA=;
 b=sfmQGBdrHVYchYSfKuar9jLXpy/9g6wR20EkQ/tGDYxj5I7ZyEyL/bPlCt8XNm4/YQ
 dgHoqF42r5D9+lDrbje0yUuNNXtHBMhptTZNgWdqpsLOZyIDVZchYzE/PYCpilxTpqnB
 FNcO1w7AGBmLbb74ueTCP8ibUG5ady2OpzIg3AuaMcS7flwIrdPHCQm/NP4tzBnqt9KZ
 fCNseReuerUS/KlmJ38EQrUX15MWaa1kK6ynA3g87dvvZMZx0NrDLvoyOcTFm7nvDuPr
 nSm+wxrdsp5EAo8+ugnL0up/kgfKGSQBDzuLjSpeE0Z+KMg+NU7WcLTPWWF6N9tTx3Es
 d3eg==
X-Gm-Message-State: AOAM531CJEv5oCx7s7Ko9N6IBQx2fRcBbF/0EGXrL8Z/dIyRk2Zv499j
 TXFkor56Mh5tFZF4nQk0gJOn+R7gA3ttmlXkXiY=
X-Google-Smtp-Source: ABdhPJyN9lDOFpf6i67VfzNyhPIg+MgZptmc6lM8lXHJwQb7WZhKmtjZOl8MQcPqYywrkpcTepEhBr4RoZMPZwLMUnU=
X-Received: by 2002:a5d:69ce:: with SMTP id s14mr20175051wrw.206.1612227723132; 
 Mon, 01 Feb 2021 17:02:03 -0800 (PST)
MIME-Version: 1.0
References: <20210127105121.20345-1-lukasz.luba@arm.com>
 <CAKGbVbsn=xVEa0=c3rywRShVZD18LkmLZ1qDUuDsrT5KnTjr6g@mail.gmail.com>
 <3d1b4696-0172-f88a-f41f-c66ac3baa429@arm.com>
In-Reply-To: <3d1b4696-0172-f88a-f41f-c66ac3baa429@arm.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Tue, 2 Feb 2021 09:01:51 +0800
Message-ID: <CAKGbVbsuqsGYRqUyWRiC+h9o7kNMvB16-Y6378KG_rv0SG4VDQ@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: Use delayed timer as default in devfreq profile
To: Lukasz Luba <lukasz.luba@arm.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lukasz,

Thanks for the explanation. So the deferred timer option makes a mistake that
when GPU goes from idle to busy for only one poll periodic, in this
case 50ms, right?
But delayed timer will wakeup CPU every 50ms even when system is idle, will this
cause more power consumption for the case like phone suspend?

Regards,
Qiang


On Mon, Feb 1, 2021 at 5:53 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
>
> Hi Qiang,
>
> On 1/30/21 1:51 PM, Qiang Yu wrote:
> > Thanks for the patch. But I can't observe any difference on glmark2
> > with or without this patch.
> > Maybe you can provide other test which can benefit from it.
>
> This is a design problem and has impact on the whole system.
> There is a few issues. When the device is not checked and there are
> long delays between last check and current, the history is broken.
> It confuses the devfreq governor and thermal governor (Intelligent Power
> Allocation (IPA)). Thermal governor works on stale stats data and makes
> stupid decisions, because there is no new stats (device not checked).
> Similar applies to devfreq simple_ondemand governor, where it 'tires' to
> work on a loooong period even 3sec and make prediction for the next
> frequency based on it (which is broken).
>
> How it should be done: constant reliable check is needed, then:
> - period is guaranteed and has fixed size, e.g 50ms or 100ms.
> - device status is quite recent so thermal devfreq cooling provides
>    'fresh' data into thermal governor
>
> This would prevent odd behavior and solve the broken cases.
>
> >
> > Considering it will wake up CPU more frequently, and user may choose
> > to change this by sysfs,
> > I'd like to not apply it.
>
> The deferred timer for GPU is wrong option, for UFS or eMMC makes more
> sense. It's also not recommended for NoC busses. I've discovered that
> some time ago and proposed to have option to switch into delayed timer.
> Trust me, it wasn't obvious to find out that this missing check has
> those impacts. So the other engineers or users might not know that some
> problems they faces (especially when the device load is changing) is due
> to this delayed vs deffered timer and they will change it in the sysfs.
>
> Regards,
> Lukasz
>
> >
> > Regards,
> > Qiang
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
