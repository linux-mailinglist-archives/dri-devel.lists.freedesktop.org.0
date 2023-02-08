Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D7D68F694
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 19:07:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1A610E80D;
	Wed,  8 Feb 2023 18:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D982710E80D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 18:07:22 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id sa10so22781601ejc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 10:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tBFVfiVNEsLdtkBhLEv0ZadBtNhs0mG3vibTB4tYemc=;
 b=XAeLJDcPQVko2f4g8qqceVS8gAAcUryQsdHcahKUOP2Jk2MWSsBECnM0MNvRYsEbEU
 8Rkhemz4eNZvJsIcspA4mESHfJGVkbZKZlVUz3fTdzrzaAYLncBYHn6ifn+1JD/cFx6K
 jGk8ECPIVF/CYYteBf8Yd3j8o81efd7B5QFKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tBFVfiVNEsLdtkBhLEv0ZadBtNhs0mG3vibTB4tYemc=;
 b=DhlaC/FYCiuarCyx/yn7xHYbVlPDBgNkvfS6IXjFSaSppmEreFtd4uGL+hYKbWYeuv
 a0F/DQSq7b+71Cawp2EsXXyzxptYW2aiRmVSkMKxZ57Cv191MBvmBnehvVj98X1LnLKQ
 e6dJmGEKdEw4BEdQugJ3D/GdJCrPsb9eWRhu83/AsbB9+AlBXD1fz/40cpC7Q5davpuR
 vsUObC6U2xbejQK4JeT2smyH6TZINqAndlltAaHRDgGw5TnSG8Fm7HZzAkDp0Y50ot97
 p2j1Mfp2X5HSI9bkhkaDuTMcaw749MOgOJHDJycZWcefWyer4zm82vaYGfc5NGVchYwZ
 Dskw==
X-Gm-Message-State: AO0yUKUPNSs8limylQGn9heAcBAHcpBZuxSu7uFIZB8zjKDPAdGA4y52
 o5HwY4ZPzp+WNbc+t0RJe/GD8dfMhgQUaWB5
X-Google-Smtp-Source: AK7set8eM2a1AEF5DDtZM54BMJ2nECGE46GoLY13Osy+3LjxYoAMa2TlApFZVgsnHL6SxuPYyAoUNw==
X-Received: by 2002:a17:906:19b:b0:8ae:a4db:ba6e with SMTP id
 27-20020a170906019b00b008aea4dbba6emr2533906ejb.2.1675879641409; 
 Wed, 08 Feb 2023 10:07:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 qp22-20020a170907207600b0087862f45a29sm8712615ejb.174.2023.02.08.10.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 10:07:21 -0800 (PST)
Date: Wed, 8 Feb 2023 19:07:19 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: DRM accel and debugfs/sysfs
Message-ID: <Y+Pk185JOBg7/AKN@phenom.ffwll.local>
References: <20230201152003.GA2623449@linux.intel.com>
 <5dfdf605-55a2-28d3-aecf-713a632b2431@igalia.com>
 <5651b98b-ace8-5009-409f-d6032cb5374d@quicinc.com>
 <bdf077e8-87ff-108a-e1fe-44bd6db79674@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bdf077e8-87ff-108a-e1fe-44bd6db79674@igalia.com>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 07, 2023 at 01:17:47PM -0300, Maíra Canal wrote:
> On 2/7/23 12:43, Jeffrey Hugo wrote:
> > On 2/7/2023 4:31 AM, Maíra Canal wrote:
> > > Hi Stanislaw,
> > > 
> > > On 2/1/23 12:20, Stanislaw Gruszka wrote:
> > > > Hi
> > > > 
> > > > I was about to send debugfs support for ivpu and noticed that there
> > > > are current changes that deprecate drm_devel->debugfs_init callback.
> > > > 
> > > > Further I looked at this commit [1], that stated we should not
> > > > use drm_minor for debugfs and sysfs. What is quite contrary to
> > > > what drm accel framework did in the first place.
> > > > 
> > > > So my question is how we should use debugfs/sysfs in accel?
> > > > Use it with old fashioned minor-centric way or change
> > > > the framework somehow ?
> > > 
> > > As we are trying to replace drm_debugfs_create_files() [1], it would
> > > be nice to see the accel debugfs support use the new debugfs API. This
> > > would mean using the debugfs_list from the drm_device, deprecating
> > > the debugfs_init callback, and adding the a similar code snippet to
> > > accel_debugfs_init:
> > > 
> > > list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> > >      debugfs_create_file(entry->file.name, 0444,
> > >                  minor->debugfs_root, entry, &drm_debugfs_entry_fops);
> > >      list_del(&entry->list);
> > > 
> > > Maybe Daniel has some more thoughts on this matter, but I guess it
> > > would be better to drop the use of the old-fashioned minor-centric
> > > implementation in accel.

It was a simple case of two things landing in parallel and not being
synchronized. Would be good if accel could be adapted to use the new
debugfs infra, now that both accel and the new debugfs stuff have landed.
-Daniel

> > > 
> > > [1] https://cgit.freedesktop.org/drm/drm-misc/tree/Documentation/gpu/todo.rst#n511
> > > 
> > > Best Regards,
> > > - Maíra Canal
> > 
> > Thank you for the details Maira.  It helps to explain what the todo is suggesting.  Is there an example of a driver/drm_device that uses debugfs_list which you can easily point to?
> 
> The implementation of this device-centered infrastructure is linked in [1]
> and an example of the conversion of debugfs APIs is linked in [2], and other
> drivers such as v3d, vkms, vc4 and gud use this new API as well.
> 
> [1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1c9cacbea880513a896aee65a5c58007bcb55653
> [2] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2e3ab8a6994f265bbd4dbd00448b84548f18464c
> 
> Best Regards,
> - Maíra Canal
> 
> > 
> > -Jeff
> > 
> > > 
> > > > 
> > > > [1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=99845faae7099cd704ebf67514c1157c26960a26
> > > > 
> > > > Regards
> > > > Stanislaw
> > > > 
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
