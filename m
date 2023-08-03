Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1A276EE90
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 17:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B1610E620;
	Thu,  3 Aug 2023 15:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA1A10E620
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 15:46:38 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-56c87f89178so745183eaf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 08:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20221208.gappssmtp.com; s=20221208; t=1691077598; x=1691682398;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Zp3PiKIytPxL/EOK5DmSNPVBL6I0zGNmHXg+fbCw6KA=;
 b=ZX9D+DIFsTMjz4C8IqMyL2Y6Ed77FYrE45zxd1oz526ChQSfBGB0ufxVEopovh7Oof
 38VgtXUmWl5yo1e8OuGGthzXvdyhLUNM7iPDpClmtBA0YpphlXLRFvvLYiJI0jICRtDl
 OrdCc04zAIv1RSDjC1nnVp2NWxAhuugLVUIU9WgipppcgAqXovIoTK9Z6rzwsFd6x3k1
 1WvxeXAwDjbB45xQVnBvaMcJNevw0kYtnHpd9inb3CRQo2n/BHZ2Q+HqU2/9BcUYNsMq
 YBq5JWfPx3qq5KEnrfPywwmYR/MTLZexzqs8UEQiGowUXHHVqYjd3EWexeCZMZUXHCT/
 0jhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691077598; x=1691682398;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zp3PiKIytPxL/EOK5DmSNPVBL6I0zGNmHXg+fbCw6KA=;
 b=ioCusQTY9bTB8m+aw4GIhOBMNXNDWKD7Ervk15b+eiqBLNA3IurcqjdqBq45QBIu7Y
 n0htNrMk45BMlGNksUO43qpErvV9xK7G52txNtaYHEZmKAj9UKLgdeX5G5qDcBH0soo2
 F4Rbv4NBXSWrsqr8/qtZc4Jhg0rokyZbJHH16mZ7iNDUyt+P1wZRLoJ43QR9t1TkHYls
 nN0dndGRlWXf1G4011jvywVBBehL1iZbRinh8VSqohh+WFvguJR6k9AquZ1u75FsW3Wj
 2wkrKB8NWjsS5NQygXqU26FLlLdgKa31wDjbP/o8Il21Xcr0URobEAttg3C0j/trUMTY
 3Xdw==
X-Gm-Message-State: ABy/qLZXldxJej1gjY+aCZ8G73VgXRGLTnPKqa8fWNS3BHA0OA16p8K9
 gk55WKTjz9Mm2Mb7jPWtSN7V3+lO5+UckNgvde0DKQ==
X-Google-Smtp-Source: APBJJlEJS+NaHXaQ+Ndtd79jySMv/qy2wPhCwFYh0rNpLyZg6y93bhy02GO7vVTEWIszrt8aqAwWMFVlO6MgsDFKs9w=
X-Received: by 2002:a05:6358:2621:b0:134:ed9b:15a7 with SMTP id
 l33-20020a056358262100b00134ed9b15a7mr8316428rwc.30.1691077597371; Thu, 03
 Aug 2023 08:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210905122742.86029-1-daniels@collabora.com>
 <AqG6tXWB4u3qhQs6QV8AkOhbOhpAsenbzEKPlyG4IRBDtqevEHfx61dGX80b1U49N-nnoovcWzW1smGRlK6OhRrFkonCSFMalVxbhgdoNuE=@emersion.fr>
 <f27654e4-3abb-3950-1629-c32b881332ed@nvidia.com>
 <YYo7wHBACwgwy3W+@phenom.ffwll.local>
In-Reply-To: <YYo7wHBACwgwy3W+@phenom.ffwll.local>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 3 Aug 2023 16:46:25 +0100
Message-ID: <CAPj87rPaGtRirzB3-Gk+3i-=xrdA4O9LR6dV36smCgJH9JU3EA@mail.gmail.com>
Subject: Re: [PATCH] doc: gpu: Add document describing buffer exchange
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: James Jones <jajones@nvidia.com>, Daniel Stone <daniels@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 9 Nov 2021 at 09:13, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Mon, Nov 08, 2021 at 04:18:22PM -0800, James Jones wrote:
> > On 9/6/21 5:28 AM, Simon Ser wrote:
> > > > Since there's a lot of confusion around this, document both the rules
> > > > and the best practice around negotiating, allocating, importing, and
> > > > using buffers when crossing context/process/device/subsystem boundaries.
> > > >
> > > > This ties up all of dmabuf, formats and modifiers, and their usage.
> > > >
> > > > Signed-off-by: Daniel Stone <daniels@collabora.com>
> > >
> > > Thanks a lot for this write-up! This looks very good to me, a few comments
> > > below.
> >
> > Agreed, it would be awesome if this were merged somewhere. IMHO, a lot of
> > the non-trivial/typo suggestions below could be taken care of as follow-on
> > patches, as the content here is better in than out, even if it could be
> > clarified a bit.
>
> Seconded on just landing this without trying to perfect it first, because
> I was just looking for it and didn't find it anywhere :-/

Swing and a miss ...

I've just sent out v2 with - AFAICT - all the changes from all

Cheers,
Daniel
