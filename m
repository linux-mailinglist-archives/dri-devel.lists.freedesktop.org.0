Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C693FBAA8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 19:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFFA89DE3;
	Mon, 30 Aug 2021 17:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D256989DE3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 17:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630343369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C/p1OSWm2CX6t/EcjGNpZmpBR9OMpxp/jIg4r2klJBs=;
 b=FQ3XuKAXQYIRGviXgMu/I41NI8QXbYoKWVRnuv2KUMM54njdk9LzWo65u60anFM5pw7OG8
 IabIJ0tznrgCfrW+X6x1oTQdhZyT7TzeZYprWp8qUINU+9xd792v2Enng71LIO2jr/LIGg
 mYquEoq8UAKt41EUrtIs21Rw9OLLUbQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-jOMa1dstMbqHG9tFylvUBA-1; Mon, 30 Aug 2021 13:09:26 -0400
X-MC-Unique: jOMa1dstMbqHG9tFylvUBA-1
Received: by mail-qk1-f200.google.com with SMTP id
 o4-20020ae9f504000000b003d39d97b227so124216qkg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 10:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=C/p1OSWm2CX6t/EcjGNpZmpBR9OMpxp/jIg4r2klJBs=;
 b=pSMgpaRkhKCE56Z9zoqXz4D5eU7icma/QiL8hcouxHVK7Ce7c6FOhwx7biyvnTTkiM
 kaj8dR7zDIZNYbRY4ecPSsVBjBZqai4LVTdarnYIhRo1yPhsqh6OMNmntylSuztNvv2Z
 HU0kcl0A0qaf0Bikwf1tbrEuufe7w3k7Xv5091ANIXvqqC608Q4afkAXt3DTIyC3OuD7
 yU0EBJLUgGm9knAXjFZ0Hay6ziHZYXAhD6tWfTl3khMeiHKuWBDgUiTm9hypMA/n/rAK
 tfxRZPC6+AWgHEAzUyyKU75cY74EHOQpkhvtmZLLW1As8qdU/EHcZcUdQFkBrGxbqqNy
 G4Dw==
X-Gm-Message-State: AOAM530sdqZX883bRD/BoDEqMAL4DUtsK8KnMQ/RpYyyvzEZUP7whsz4
 sLtCAYuYdisRoiJG7b/tnhdg/MoPIVWC2G1l3CaSoyc3KgJOXlX+VOb+7bjDl1Ldl1c1rOR1hTi
 k+0wA26NG6+ZlihgtG5z0stPyRxRX
X-Received: by 2002:a37:8f04:: with SMTP id r4mr23370423qkd.351.1630343366111; 
 Mon, 30 Aug 2021 10:09:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhvH3r1WkYkyhjkLLonaz0tUVij62Is1SewKkxp8wDoeh+XEGYZJb1rr+7K3QO3YKZJeC6uQ==
X-Received: by 2002:a37:8f04:: with SMTP id r4mr23370410qkd.351.1630343365881; 
 Mon, 30 Aug 2021 10:09:25 -0700 (PDT)
Received: from [192.168.8.104] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id m68sm12047562qkb.105.2021.08.30.10.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 10:09:25 -0700 (PDT)
Message-ID: <0777c34ddbd22ae247d293cf013cb763947b0b50.camel@redhat.com>
Subject: Re: [PATCH AUTOSEL 5.13 20/26] drm/nouveau: recognise GA107
From: Lyude Paul <lyude@redhat.com>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ben Skeggs
 <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Date: Mon, 30 Aug 2021 13:09:24 -0400
In-Reply-To: <c0e64fb9332b03c920de05be4c4c27f916ff6534.camel@redhat.com>
References: <20210824005356.630888-1-sashal@kernel.org>
 <20210824005356.630888-20-sashal@kernel.org>
 <6607dde4207eb7ad1666b131c86f60a57a2a193c.camel@redhat.com>
 <YSzMR4FnrnT5gjbe@sashalap>
 <c0e64fb9332b03c920de05be4c4c27f916ff6534.camel@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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

oops-except for "drm/nouveau: block a bunch of classes from userspace" of
course. the rest are fine though

On Mon, 2021-08-30 at 13:08 -0400, Lyude Paul wrote:
> ahhh-ok, that makes these patchs make a bit more sense then. If Ben doesn't
> have any objections I'd say these are fine to backport then
> 
> On Mon, 2021-08-30 at 08:17 -0400, Sasha Levin wrote:
> > On Tue, Aug 24, 2021 at 01:08:28PM -0400, Lyude Paul wrote:
> > > This is more hardware enablement, I'm not sure this should be going into
> > > stable either. Ben?
> > 
> > We take this sort of hardware enablement patches (where the platform
> > code is already there, and we just add quirks/ids/etc.
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

