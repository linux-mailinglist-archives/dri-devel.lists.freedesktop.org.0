Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4468248F5C5
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jan 2022 08:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A650E10EAFA;
	Sat, 15 Jan 2022 07:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8AF10EAFA
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jan 2022 07:50:32 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id w188so15522506oiw.13
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 23:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=h3PgS0CNglNFEriFcIB5fPEGJsKvjMbV56HeR6dLGrE=;
 b=EmUyNC5+fyl6EfcWg7V5NP/+/kTDIH/EdOvuowOUADAQekSeyTVMo2Pw+R7MGnNyr3
 5F8QHuI+3uuwmjE0hhIplcSf2WL7/QNRQcOV1244KFMSs7KyWUA1l2Wf6ku/ze8CULMO
 JrK0FD1KD6O13Y02WDkLJ8qPwwJwBY8Rk79Pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=h3PgS0CNglNFEriFcIB5fPEGJsKvjMbV56HeR6dLGrE=;
 b=xfxeo/bL6A6V7KNOG1rUqA9a3P6JKCVpxEPTjcxRBnV2kq3CWY045T6+ICA+93d7ky
 zeTe20A5b9awgveWnhnmFs3Pi7Y5QJ92THMbraKcLjTu22AHiV3/4yVBX9eN/c9Z4fab
 cSd1vCzM8WSlxmME/B73cTefWLkLuhALG0u+A+QAZ2Kz/hVfWooj1M2fHp0gRz13fXzI
 8BQxhiBHfe8gjeTRTq2Ja0iy70XMw+pX4cPqvqOBKoxNmSnzeEKBnVhTRa99Vfr20DIk
 lU4LQNbslJw1/SyiEy4YZf9lfABcKweYtnGWLkqYxBCjLxtbQRDI3OmBC2M6VCIe+Bod
 UrDQ==
X-Gm-Message-State: AOAM530+FYW1Igs0ESCZn1cu6vS14k8Q2jwnquu5smF5ydK7No6x4Sdd
 anlajJEPBS85H/0WYccrxHEW8XMrIlYeFsC/Esxjug==
X-Google-Smtp-Source: ABdhPJx02kIfoT6/5m/ATyYIlU8INhZ26iHsr9xTblSQKWo5tlo36oAirP0TSNUr8dUl4s8qhL52VFzPwIS7Yj/lE4c=
X-Received: by 2002:aca:a953:: with SMTP id s80mr15972957oie.164.1642233032027; 
 Fri, 14 Jan 2022 23:50:32 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 15 Jan 2022 01:50:31 -0600
MIME-Version: 1.0
In-Reply-To: <fc7207eb9958c487fec5679da73d8f3595cc7bb1.camel@mediatek.com>
References: <20220106214556.2461363-1-swboyd@chromium.org>
 <20220106214556.2461363-26-swboyd@chromium.org>
 <1a3b368eb891ca55c33265397cffab0b9f128737.camel@mediatek.com>
 <CAE-0n53Y3WRy4_QvUm9k9wjjWV7adMDQcK_+1ji4+W25SSeGwg@mail.gmail.com>
 <ff81bc1fe1f1c2060fcf03ba14f1bef584c47599.camel@mediatek.com>
 <CAE-0n53FAHDmCznJ35Xh2aTwXBVwukAM3ioKx8SU9VowSaQSqA@mail.gmail.com>
 <69a10908622512c60790f97942731a8ab989b727.camel@mediatek.com>
 <CAE-0n53ao52UX3sJ67UQ3dgj0-DZ0xTeo-NrmW5YVAuXfAnxZw@mail.gmail.com>
 <fc7207eb9958c487fec5679da73d8f3595cc7bb1.camel@mediatek.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Sat, 15 Jan 2022 01:50:31 -0600
Message-ID: <CAE-0n52kPPXuZH8srbQXC6iPpaM_+2Qewn6-HQ0RNKMxi5Jdsg@mail.gmail.com>
Subject: Re: [PATCH v5 25/32] iommu/mtk: Migrate to aggregate driver
To: Yong Wu <yong.wu@mediatek.com>
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
Cc: youlin.pei@mediatek.com, Saravana Kannan <saravanak@google.com>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Yong Wu (2022-01-14 23:39:52)
> On Fri, 2022-01-14 at 15:30 -0600, Stephen Boyd wrote:
> >
> > This sounds more correct to me. I'm not an expert on runtime PM
> > though
> > as I always have to read the code to remember how it works. if the
> > device isn't ready for runtime PM until the component bind function
> > is
> > called then runtime PM shouldn't be enabled on the component device.
>
> Anyway, We should update the SMI driver for this case. I prepare a
> patch into this patchset or I send it independently? which way is
> better?

I can roll it into this patch. It needs to be combined otherwise it
breaks the bisectability of the series.
