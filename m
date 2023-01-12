Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ACD666DE8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 10:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505B710E0CC;
	Thu, 12 Jan 2023 09:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD0610E0CC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 09:17:16 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id ss4so35911978ejb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 01:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6CHHBuZ5wBpmUt0KZxeVCCc+VQ4a+XKyeevgDEmhJfo=;
 b=jlwuKTQTkY1fHMD1Z6KnFwNLEKeBIrae/uRluuBBaGUjbRdqLKYQDiCiAs9rP98o6m
 Q0hFw/gyecRyZWNL3x1fE+YceKR1tGHvfgU6uRRhIvY+CpE1NkzIb04Wtr5/3gD3e/g4
 LNEnO0uxwLy9hIr3CGmH+OAZ4S+SlMiBcoH4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6CHHBuZ5wBpmUt0KZxeVCCc+VQ4a+XKyeevgDEmhJfo=;
 b=qwjkSayj8mw5kOfeKg/PB0M/ZiwJrSfRd4utejMm0KkuOUlqFribfmYd0cZb1JIj/L
 mYEnYzCB7h7dVYYxbHNM9QL4PEkFLpiH7xxIe7JZC//JSk4tPFg1wFo87gbsmvpI6fhv
 yNpTjav+ILYc6XrvYTkH2mup3bbmrh5DHtKRkZX3wPxTRrU3RzKibU01gi7uVW2qR6ac
 SgPAPXBsUXwQj2IvvdSBvWVR/KmUGXfNUxIu8787oryGG1RXL8g9KRUk0qjdzIIqNGBz
 Op+kjSY+AKfFFHYaqcFDvtYoZEdEqfo6lteHwthulCxzSUAjAh2GLNIQim/Mm3+PlVUp
 N4QQ==
X-Gm-Message-State: AFqh2koxUJNa4Rvm2as0dlKrbtxoB820S2zHuS0wiYQESYNPHo7Ukywo
 RDC9fe/IJ6ztRzhPAnSG1TM/ug==
X-Google-Smtp-Source: AMrXdXv/74y4WDatXYDIBZqrE8NioFiL4NN2b8CEU77/NC+znYdyevXfth6/oD2hJ45O7gGV3WAV6Q==
X-Received: by 2002:a17:907:3e26:b0:7ad:c8d7:4fd9 with SMTP id
 hp38-20020a1709073e2600b007adc8d74fd9mr85634456ejc.36.1673515034659; 
 Thu, 12 Jan 2023 01:17:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a1709061db100b0073d7b876621sm7118251ejh.205.2023.01.12.01.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:17:13 -0800 (PST)
Date: Thu, 12 Jan 2023 10:17:11 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v1 2/2] drm/virtio: Add the hotplug_mode_update property
 for rescanning of modes
Message-ID: <Y7/QFwsKU1qBSKzv@phenom.ffwll.local>
References: <20221118013054.182304-1-vivek.kasireddy@intel.com>
 <20221118013054.182304-3-vivek.kasireddy@intel.com>
 <20230106085640.54hvmhblmh4o2jxb@sirius.home.kraxel.org>
 <Y7frUw39xU70WQkD@phenom.ffwll.local>
 <IA0PR11MB718594D9F06FC52B5CC07279F8FF9@IA0PR11MB7185.namprd11.prod.outlook.com>
 <Y780QKVL6uRx3ZYp@phenom.ffwll.local>
 <20230112071719.syjcv7hn6qekatog@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112071719.syjcv7hn6qekatog@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>, "Kim,
 Dongwon" <dongwon.kim@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 08:17:19AM +0100, Gerd Hoffmann wrote:
>   Hi,
> 
> > > > I think we need to do a bit of refactoring/documenting here first.
> > > [Kasireddy, Vivek] Just for reference, here is Dave's commit that added this
> > > property for qxl:
> > > commit 4695b03970df378dcb93fe3e7158381f1e980fa2
> > > Author: Dave Airlie <airlied@redhat.com>
> > > Date:   Fri Oct 11 11:05:00 2013 +1000
> > > 
> > >     qxl: add a connector property to denote hotplug should rescan modes.
> > > 
> > >     So GNOME userspace has an issue with when it rescans for modes on hotplug
> > >     events, if the monitor has no EDID it assumes that nothing has changed on
> > >     EDID as with real hw we'd never have new modes without a new EDID, and they
> > >     kind off rely on the behaviour now, however with virtual GPUs we would
> > >     like to rescan the modes and get a new preferred mode on hotplug events
> > >     to handle dynamic guest resizing (where you resize the host window and the
> > >     guest resizes with it).
> > 
> > Ok this is just terrible. Because _anything_ without an EDID is impacted,
> > and we're certainly not going to sprinkle this property all over gpu
> > drivers just so Gnome takes the right path.
> 
> Oh, and (newer) virtio-gpu actually has EDIDs ...

I forgot to mention. If userspace is worried about the expensive probe
cycle that calling the GETCONNECTOR ioctl can cause. There's
drmModeGetConnectorCurrent. But that's not guaranteed to give you up to
date info after a hotplug event, depending upon driver :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
