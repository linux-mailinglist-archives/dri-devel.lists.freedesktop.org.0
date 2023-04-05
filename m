Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E21C26D7DB4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 15:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88D610E960;
	Wed,  5 Apr 2023 13:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62AA10E960
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 13:27:33 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-4fd1f2a0f82so52397a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 06:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680701252; x=1683293252;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XqX1N9AwIcXh3tEpxCe94h+1QEhsxAem/vTybjTN11k=;
 b=JXSAfvOtNFzK6tv8vKIgjAj2QxudkNTN+gOdh2IAHy0MotU6InrYYubzWWC4V5brU8
 +Iwz08yS0ZLc1ZEFGhg9fpD4K3avpKoWG+Rf2Aw4mDHJXV6tZSo2upS+nG1jDlo0Tylh
 /V9pl+Fa0Mjb6GSn/l601xafWZR6leIYeocfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680701252; x=1683293252;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XqX1N9AwIcXh3tEpxCe94h+1QEhsxAem/vTybjTN11k=;
 b=ztuElY56q4KEsPU0f8LoyDA8Iy7oevN2aLMOcccRgvmMJpA1LR45b3Iw+4J7ENdjvt
 I3Ur9ueZh3IR5mHapy1uVGVaml2q05SvimvzySjBKkbTfvksrQt9MR5lrM2XW4KhrZZk
 6nSfXnsuUcXGmzbQ1P6qnvwXE9DjAY6w79TWzTB545QkUK5mANY5pNT85WSy5yJjgb/0
 48xqM164DaX3sEer+5mQ51IY++06ugEU+VL8ognzKGQbfsLATtViIP3CuPQEyfmzTnPP
 ynmPRnAWimAIAgzGhkNvLXx0waBf6Ysv9v1CzbP7xJxRAUj+Pm7ET5gKRszQJdtSUGu3
 B0xg==
X-Gm-Message-State: AAQBX9esnA0J/3gRozX6QgA1PCvYUq5B2bDyQEySZhiN1lgTg+ZwJVBI
 kW5qCRe1Wc7YlYeBYg+9LrWtAQ==
X-Google-Smtp-Source: AKy350YswyL/2WjlpsmEdGmBnqipwym85alKiP+KkghBft5Jy1eR+adZL60tPSX8iCmHKGIo3/jCOQ==
X-Received: by 2002:a05:6402:524e:b0:4fd:2978:d80 with SMTP id
 t14-20020a056402524e00b004fd29780d80mr2007567edd.1.1680701251733; 
 Wed, 05 Apr 2023 06:27:31 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 q17-20020a50c351000000b004bf76fdfdb3sm7246880edb.26.2023.04.05.06.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 06:27:31 -0700 (PDT)
Date: Wed, 5 Apr 2023 15:27:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH v5 0/8] QAIC accel driver
Message-ID: <ZC13QdSRybIe3nvk@phenom.ffwll.local>
References: <1679932497-30277-1-git-send-email-quic_jhugo@quicinc.com>
 <857db3fb-b006-4aa8-a7f8-2ae0b8a160c9@quicinc.com>
 <c5d11a88-351a-8eaf-f1d2-d7cf37cdf81c@linux.intel.com>
 <CAFCwf12iVZkcPKOEc911-fCd4-YzHYJzs_p36jfBiT=VkcO9uQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFCwf12iVZkcPKOEc911-fCd4-YzHYJzs_p36jfBiT=VkcO9uQ@mail.gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
 mani@kernel.org, linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, stanislaw.gruszka@linux.intel.com,
 quic_carlv@quicinc.com, Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 03:35:19PM +0300, Oded Gabbay wrote:
> On Wed, Apr 5, 2023 at 2:26 PM Jacek Lawrynowicz
> <jacek.lawrynowicz@linux.intel.com> wrote:
> >
> > Hi,
> >
> > On 03.04.2023 19:22, Jeffrey Hugo wrote:
> > > On 3/27/2023 9:54 AM, Jeffrey Hugo wrote:
> > >> This series introduces a driver under the accel subsystem (QAIC -
> > >> Qualcomm AIC) for the Qualcomm Cloud AI 100 product (AIC100).  AIC100 is
> > >> a PCIe adapter card that hosts a dedicated machine learning inference
> > >> accelerator.
> > >>
> > >> The previous version (v4) can be found at:
> > >> https://lore.kernel.org/all/1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com/
> > >
> > > Looks like things have been silent on this revision and we have a number of review tags already.  Seems like this series is ready for merge.
> > >
> > > I'd like to see this queued for 6.4 if possible.  Given that we are at 6.3-rc5, it seems like this would need to be merged now(ish) to make 6.4.
> > >
> > > Jacek, since you have commit permissions in drm-misc and are an active Accel maintainer, I wonder if it would be appropriate for you to merge this series to drm-misc.  Thoughts?
> >
> > I'm would be happy to merge it but I think it needs to be acked by Oded first.
> >
> > Regards,
> > Jacek
> 
> Hi,
> Entire patch-set is:
> Acked-by: Oded Gabbay <ogabbay@kernel.org>

Once Jacke has pushed this I htink it would also be good to get Jeffrey
commit rights for drm-misc, so that in the future bugfixes for the qaic
driver can be pushed directly by the qaic team. Still with acks/r-b
requirements as per usual, and I guess for anything bigger/new uapi an ack
from oded is needed.

https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html#drm-misc

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
