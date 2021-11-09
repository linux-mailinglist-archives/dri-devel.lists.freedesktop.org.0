Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D3344AA59
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 10:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C43F6E8DA;
	Tue,  9 Nov 2021 09:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A06D6E8DE
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 09:12:37 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id v127so15161704wme.5
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 01:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=gRAfc1WOSPFtTJjeikqx19R36PkKzboO7S+UxWLPFuY=;
 b=Js+fC3SRiOu9t7eTHQC2lBqVUHG7w9lIP65iFV6pnIcQb8q2uP2hbJw7xiOQ7QKSyc
 PI/Dc185wotzpPQWF45plKy1NCzVcLAxuSJdF21eRy+LkZGxckx0lA3WHJSe6g6fGD9F
 4ARbixgahQMbLJTLQsARgG/KOvoK5NGka014U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=gRAfc1WOSPFtTJjeikqx19R36PkKzboO7S+UxWLPFuY=;
 b=oDwA42Mqq6jnPJtRo98D9j7rxmUADZjR96o6EdiVdGstVBCnqabMXONuAA0BPSAINK
 GvH3cPe2yyNvzuTaQehX+Td4FgKTDvTrTM9WHrTNPehBkFVx7tp9r3DT7gdf5KWKFlRv
 Rd5gEAZAwXSXYxU9e0Sp/D57K8TZSYv9UUZ3aPpRyZKLDOw/LURvXIgx/v6UZUgCsMRt
 oB5C45lu6UhBne5KJWUryj50B2B34CFdXofGFDot0yUXdYfqDdf4+ZTxe6ZBSKE917Ol
 W9P2cuO8Wy3BqWd1a/tJU5BKcKOMfH72Ptw0pFZ0OgDfmfsuXNa1AYIvhfBMa3B6gZls
 HLdA==
X-Gm-Message-State: AOAM5304tKvt86pHokknFfQxtRPWJlTza6pTeM45qfxdVXqyO9yMacv0
 WiQiBuMjX5GUGrOhwEifyOcldBFPMSQHuMNX
X-Google-Smtp-Source: ABdhPJwbsKtynBEybR7uj49uwBmPPxMxzy+aOE6rR02Kd73q5TPvqv5cOcrFpUpJONJLyvuu3aiOdQ==
X-Received: by 2002:a7b:c442:: with SMTP id l2mr5494411wmi.131.1636449155905; 
 Tue, 09 Nov 2021 01:12:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u20sm2222377wmq.6.2021.11.09.01.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 01:12:35 -0800 (PST)
Date: Tue, 9 Nov 2021 10:12:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: James Jones <jajones@nvidia.com>
Subject: Re: [PATCH] doc: gpu: Add document describing buffer exchange
Message-ID: <YYo7gWRJ5Kostg/7@phenom.ffwll.local>
References: <20210905122742.86029-1-daniels@collabora.com>
 <20210908123406.33ced2d6@eldfell>
 <a_9frwKbA7AcZbDet-XMAADdlHbhTczh-d1o5rP2HQkkLXvor5XWt51MDaHvpgo_Sox1e3tt7xmfHlMyAI7Na6wcqcgQIPrbtqAblnM8mQ0=@emersion.fr>
 <84e4620c-7a37-b5ff-2c1d-45e73a01fea9@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84e4620c-7a37-b5ff-2c1d-45e73a01fea9@nvidia.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 08, 2021 at 04:21:04PM -0800, James Jones wrote:
> On 9/8/21 2:44 AM, Simon Ser wrote:
> > > stride
> > > 	????
> > 
> > I think what's clear is:
> > 
> > - Per-plane property
> > - In bytes
> > - Offset between two consecutive rows
> > 
> > How that applies to weird YUV formats is the tricky question…
> > 
> > > Btw. there was a fun argument whether the same modifier value could
> > > mean different things on different devices. There were also arguments
> > > that a certain modifier could reference additional implicit memory on
> > > the device - memory that can only be accessed by very specific devices.
> > > 
> > > I think AMLOGIC_FBC_LAYOUT_SCATTER was one of those.
> > 
> > A recent exmaple of this is [1].
> > 
> > [1]: https://patchwork.freedesktop.org/patch/452461/
> 
> What was the resolution to that argument?  It took some fiddling to get the
> NV format modifiers to be robust enough that they actually do differentiate
> "identical" layouts that actually mismatch between devices (E.g., some of
> our SoC GPUs interpret layouts differently than our discrete GPUs, so that's
> reflected in the format modifier-building macro and hence applications can
> properly deduce that they can *not* share images directly between these
> devices, but can share between two similar discrete GPUs), so I hope the
> modifier definition allows that. Cross-device sharing using tiled formats in
> machines with multiple similar NV GPUs was an important use case for
> modifiers on our side.

Imo it boils down to "past mistakes don't justify continued screw-ups" or
so :-) As in, we really should make sure we make them unique if they
differ between platforms.

I think the only ok exception is if the compression uses some special
memory/buffer and hence the buffer simply cannot be exported to another
device. Or at least not any device which doesn't have access to that
special memory (and hence by necessity of being part of the same SoC or
interconnect probably knows what's going on anyway).

Another one is r/ed drivers, especially when baked into a given soc, were
it's just a bit too hard to fully figure out the layout everywhere (and
also kinda a waste of time).

But yeah it would be good to document in drm_fourcc.h that a) we screwed
up in the past and b) we shouldn't, at least not for anything that can be
used in discrete gpus.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
