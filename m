Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E03B76D71B0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 02:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A8110E806;
	Wed,  5 Apr 2023 00:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9CB810E806;
 Wed,  5 Apr 2023 00:50:19 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id n17so24505665uaj.10;
 Tue, 04 Apr 2023 17:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680655818;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ak7UXG4UZdCKSZRvuWDjbJRyNWdpFuarm6tImHqS+tw=;
 b=OMIpUT5GS1WJA1cd0vQ+yDW45uo967cPrQo1IK4SNc4XM7i2U4nksypSW7cCEjsWei
 yvKnocS8H44Yz/8uVAsYOa3dp3elKnqa+erEzQYklN1E+A7ELVYwF4s1Oc5qf0tC/QZZ
 KTdcixsuemTWEwJFNBG2RxPE32HcJqB2WH8ALNGbjRbyxcdi0WkGF70B+WOKXY5kbtWl
 3jL1Hw8rTUElosjDtCiW5uJ1e+gKtRHIxOBYObzJcV92gWqBnZkOoc6s8TrNx+ug4jBJ
 2E2Ib04IkXZ+hpBw9mqPJwFmyZPRb3uohKyw28qy4BZ9VO/D1uOcyiwbwQb7P+OH5bZd
 icSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680655818;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ak7UXG4UZdCKSZRvuWDjbJRyNWdpFuarm6tImHqS+tw=;
 b=hokn8zUNgsZ1hb8nKKBucv+5EVpUSu2ASgl0ID1SpEIbedUMXnbNvhSpoYbRy2ROp7
 qMPDsu57pUSp5sd/9YCt5duebebm2G5xOeby+c1Fvx4PVPX6a+YuZcnWmqRFZfXsOV7x
 Qx7USeHp6UevfryJpHb5gAdR5z0cmy4Ahcl0O8ZukIyUCtcoGodB989vXir9wOhJFgUW
 sZD5zgLzzMbbjlcFXXruBtPkwHWYvOiljnZbLMldrlakeWw8awnrnwPXej/LDkCePCo+
 Ubo6puC0DPYflGyo3F6kQ4VIBlCiWejXFurD3p2EgRdgoyUqhEOG07C5G9cSBX54PjkR
 vBQw==
X-Gm-Message-State: AAQBX9c4t0uy9IQA6dvLB/rNEPL2MbSQRtNK6rSHSqwOVTtsSnxumd+J
 mIlBUbG+3Voae8D0K6T7BtvBw+BgHVdql5ArwSw=
X-Google-Smtp-Source: AKy350a0K2xmeGb6mz8g69Vb5w5rMblGpVHWJMQBmt+Fo2pTG3v6JjII2AcZgJFgv8ViFObh6x9vTb3oZToI1AcP3po=
X-Received: by 2002:a9f:37cd:0:b0:764:64c1:9142 with SMTP id
 q71-20020a9f37cd000000b0076464c19142mr1076792uaq.0.1680655818366; Tue, 04 Apr
 2023 17:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230404002601.24136-1-yq882255@163.com>
 <CACvgo53mV7Aoe+omtSF0BNg+gVOWqDQ_QAmMkhikjQw-vF55Xw@mail.gmail.com>
 <ZCx6Q5y1dgAv2q/o@phenom.ffwll.local>
In-Reply-To: <ZCx6Q5y1dgAv2q/o@phenom.ffwll.local>
From: Qiang Yu <yuq825@gmail.com>
Date: Wed, 5 Apr 2023 08:50:06 +0800
Message-ID: <CAKGbVbssdy3D8iCyUHr-kqr8spSDkTXfKzg4pQwoSZB+dv3i0A@mail.gmail.com>
Subject: Re: [PATCH 0/3] Revert lima fdinfo patchset
To: Emil Velikov <emil.l.velikov@gmail.com>, yq882255@163.com, 
 Stephen Rothwell <sfr@canb.auug.org.au>, lima@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Qiang Yu <yuq825@gmail.com>, Erico Nunes <nunes.erico@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next, sorry for the trouble.

Regards,
Qiang

On Wed, Apr 5, 2023 at 3:28=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
>
> On Tue, Apr 04, 2023 at 04:17:33PM +0100, Emil Velikov wrote:
> > On Tue, 4 Apr 2023 at 08:13, <yq882255@163.com> wrote:
> > >
> > > From: Qiang Yu <yuq825@gmail.com>
> > >
> > > Upstream has reverted the dependant commit
> > > df622729ddbf ("drm/scheduler: track GPU active time per entity""),
> > > but this patchset has been pushed to drm-misc-next which still
> > > has that commit. To avoid other branch build fail after merge
> > > drm-misc-next, just revert the lima patchset on drm-misc-next too.
> > >
> >
> > The bug/revert is unfortunate, although we better keep the build clean
> > or Linus will go bananas ^_^
> >
> > Fwiw for the series:
> > Acked-by: Emil Velikov <emil.l.velikov@gmail.com>
>
> Can you (eitehr of you really) please push asap and make sure this doesn'=
t
> miss the last drm-misc-next pull (-rc6 is this w/e)? Otherwise we'll have
> a bit a mess.
> -Daniel
>
> >
> > HTH
> > -Emil
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
