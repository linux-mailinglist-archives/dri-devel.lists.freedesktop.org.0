Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA5F380E41
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 18:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359FC6F39A;
	Fri, 14 May 2021 16:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840A46F39A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 16:35:04 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id z7so9823105uav.4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 09:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zkE3PEWIpXgcqPon4dm9775/td9AsxOU80LUl3DcBGw=;
 b=TG94KnIUZtrz49T6DCXzDe0pzE4ZFiM4qclxyRHLxo8kRwEJVGnS5wmep+3hSGOL0P
 4aDLiRzRI3Vv8AUp/gAoaVLJ2pLNS5NOT4n+kZAgH6RrPMpP/2zu56IhMKWJvaxQS7/X
 7bxdcmnGjjt6QSv44mKDAugq3rHWj4D+a+pu1Sq6gH652TZS4VhaxRe1ZasrTF1xS/BX
 PXDthVE7NTRNT9UFTYEbEZoejwn+TsbJrJP/eETLyf/oIWAFp9+RbeQXRtqMXpDcnv2c
 2fcwR69E0ffNAgUZijW1U3cUutJTXQ68K32NY0sTmT0K/OEZF78n848NT6CjZuV3DFuY
 Zk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zkE3PEWIpXgcqPon4dm9775/td9AsxOU80LUl3DcBGw=;
 b=diDBrE+fmd4Uz/3uiKlfbZLK24/pszsdSimYLVVQuZzwvpd5QDYwRx30f1monPuzHd
 U5kig0bZVsjJNPLlrW/tF+ELhdOLwrYdrMS3epm77LFFis5XWdF2g415LxMUZ+7dHnI7
 OQugwocPjGrmEbCEEeL7bZtie8VqAzagk+3bHk6muYAVGu7HYX5HPcNNtbBULOaock5S
 sEUg5BhYc9u2+wXdzf+h/pKvh6YmN++iWKBSS1bcIjPFsSP9havUKOko8TQ/slyHShuh
 dvOzHfJ+yT/CKRfQ4CBhR0d1AzK7zMG0qvq2HUpHzD2D0VjUGjimApx/4RLmsPYXgzmx
 1rLA==
X-Gm-Message-State: AOAM530KNJ/klIEvVA++NKHqupD6dzuvEAe/Z9kVcy+2Y9Tu5cMSGOwo
 AeY0tVuhHF1Ks0j0VCJfoBJ8qsoJtEDd+m7VwfIi2DTTqHc=
X-Google-Smtp-Source: ABdhPJzFsMaaq8s8hEnDwfj27plDbWGZseUQeQXDwcNncmoeVSlW171BMTt2qUCqVkkAmEsZXLHdC9uBUAXFWxCutBM=
X-Received: by 2002:a9f:368f:: with SMTP id p15mr44942040uap.14.1621010103555; 
 Fri, 14 May 2021 09:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <YJ6BJBgS0HnPgzsJ@mwanda>
 <CAMWSM7gBU9VOZovOB29ZGKNvL_tXxWk1z0GD44n0=wYk+eAXUA@mail.gmail.com>
In-Reply-To: <CAMWSM7gBU9VOZovOB29ZGKNvL_tXxWk1z0GD44n0=wYk+eAXUA@mail.gmail.com>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 14 May 2021 09:34:27 -0700
Message-ID: <CAMWSM7gN3m3NT6BMQfcmNr_Vxi_R17oC1wzpprshpTJW3cQzvg@mail.gmail.com>
Subject: Re: [bug report] drm: remove usage of drm_pci_alloc/free
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 14, 2021 at 8:13 AM Joseph Kogut <joseph.kogut@gmail.com> wrote:
>
> Hi Dan,
>
> On Fri, May 14, 2021 at 6:54 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > Hello Joseph Kogut,
> >
> > The patch 70556e24e18e: "drm: remove usage of drm_pci_alloc/free"
> > from Apr 22, 2021, leads to the following static checker warning:
> >
> >     drivers/gpu/drm/drm_bufs.c:1090 drm_legacy_addbufs_pci()
> >     warn: inconsistent returns '&dev->struct_mutex'.
> >       Locked on  : 988
> >       Unlocked on: 938,944,951,959,973,1005,1042,1060,1090
> >

Do you mind if I copy this portion of the bug report in the commit message?
