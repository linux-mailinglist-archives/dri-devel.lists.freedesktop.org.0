Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5634F6D458A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 15:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC5910E178;
	Mon,  3 Apr 2023 13:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC7410E475
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 13:22:33 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id r187so34697566ybr.6
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 06:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680528152;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=puJQIiNwi0B7OHT+YCNoLm1RVfBbXjaYqHubaytTOZc=;
 b=iFmu6Bph/r5JtPpy4KiE3uF1FZx4WD1yKmH9pZNGnpcQ+rpE7jJXoHdkumVA8mECJ9
 1yuVFCPOEZAJvB8kJXc1F2AequweKSrN82RJjtyE2aSxlHiKn5qTmxPsEspfGvjnxcc+
 xO4OI/xLCUDLiDR6iXCVuF5rWXOkUwipr/nJZ6syWHfavVYl1oBrGXDm9cMRfyY0HS5R
 LHpXIg53OEKGjqDV8dmXxMElXPSjS96U8N6WMzBQtsbMd2tFuDVmB76E3bEOWSld7FPY
 a25ESuLO+P8iW9goF0NmubEftjJ0BDJT9c9zkgjjNItMW4hPRPFvcCOQCTUSDEPhXRqD
 QU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680528152;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=puJQIiNwi0B7OHT+YCNoLm1RVfBbXjaYqHubaytTOZc=;
 b=QBQ04vwLhNMmEkSictbpJLJNuVU0Hi8W3TdukHMDJDHUQGCkcpVcSvQiHbmjHSU/y8
 fqzZkWwWTEcpIpYLEP4HVeVcz9UZMxDgG23ogtuftYnUoqpxyOv3+Vj/U44rLHIX4bF9
 DQLL5hPBmC7tc82Hp7kkeh+mNAMbQEi015ng5yhmhe2I8VjOt54FCLjEBYPUQlU552+R
 66zbmK9V8GP2nnr1iCzDRAs2xmH5qZCkkL302By6tPgZf7Jo1hTSWW40cxC31lQMH16J
 LubbIuaxLDTwPR4Enyl2HMEfEDGvQ+E9b7s0Mq0w99iRRFcZvFJglrVbUmI5lRNclFN9
 2FSg==
X-Gm-Message-State: AAQBX9cneoiGaxH3XVTrFeAVbnvi5AZSlmK4jgLIFm8T2ZB70+N1JkfV
 wU7ABZtzAKsbfoHo/ywKj/gbKMVgSveZB9aVqpU=
X-Google-Smtp-Source: AKy350bWysdzXHGZ8/wze3T0qWf/LM4Wl8ayF7vOJuIYnrg0bXgibm9ykvXEhOtu6Wmfpbs5ZM+9QenlXSPq3ioXank=
X-Received: by 2002:a25:d784:0:b0:b76:3b21:b1dc with SMTP id
 o126-20020a25d784000000b00b763b21b1dcmr11126480ybg.0.1680528152080; Mon, 03
 Apr 2023 06:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230323230755.1094832-1-dmitry.osipenko@collabora.com>
 <20230323230755.1094832-3-dmitry.osipenko@collabora.com>
 <ZCXF4q81wPcczkqx@arch-x395>
 <3618a293-4f61-b076-0a9c-c70812436431@collabora.com>
 <CACvgo51GWRCQuiJDVrqo=xzd3frKvs6WNcc755pbu8jNk6t-Rg@mail.gmail.com>
In-Reply-To: <CACvgo51GWRCQuiJDVrqo=xzd3frKvs6WNcc755pbu8jNk6t-Rg@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 3 Apr 2023 14:22:20 +0100
Message-ID: <CACvgo53bkvDm7CXN_zFETZeuWas50tJys6u+nc5DO_MWK4SZfw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/virtio: Support sync objects
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 kernel@collabora.com, virtualization@lists.linux-foundation.org,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 3 Apr 2023 at 14:00, Emil Velikov <emil.l.velikov@gmail.com> wrote:

> > > I think we should zero num_(in|out)_syncobjs when the respective parse
> > > fails. Otherwise we get one "cleanup" within the parse function itself
> > > and a second during the cleanup_submit. Haven't looked at it too closely
> > > but I suspect that will trigger an UAF or two.
> >
> > There are checks for NULL pointers in the code that will prevent the
> > UAF.  I'll add zeroing of the nums for more consistency.
> >
>
> Riiiight the drm_syncobj is attached to the encapsulating struct
> virtio_gpu_submit _only_ on success.
> By clearing the num variables,  the NULL checks will no longer be
> needed ... in case you'd want to drop that.
>
> Either way - even as-is the code is safe.
>

Err or not. The NULL check itself will cause NULL pointer deref.

In more detail: in/out syncobjs are memset() to NULL in
virtio_gpu_init_submit(). The virtio_gpu_parse_(|post_)deps() will
fail and leave them unchanged. Then virtio_gpu_free_syncobjs() and
virtio_gpu_reset_syncobjs() will trigger a NULL ptr deref, because
they are accessing the elements of a the (NULL) array.

Apart from the num_(in|out)_syncobjcs=0, I would drop the NULL checks
- they give a false sense of security IMHO.

-Emil
