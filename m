Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6A31E1B99
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 08:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8F789CE1;
	Tue, 26 May 2020 06:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93FA89CE1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 06:56:41 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id o13so15478807otl.5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 23:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=z/gZAVjq5HztdI8t2Qkf0xgoeZGAE0UDbb4kz8zQfyM=;
 b=gaOw8FLOIx6jG/v3t8bOd7V86b0sZSEhMnh3p3kFBaT4McTvVGAs6/V70/sK9HpLqz
 FQuhE86S97iD3tjf9f6Y/MK2PUs5XdqO6RKrEfk1JztR86k8vSO6OyREO5Ztlawr6+oo
 l3RQpsaIFbTKND1BXBtx4RQCr+WZb9X+kIkok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=z/gZAVjq5HztdI8t2Qkf0xgoeZGAE0UDbb4kz8zQfyM=;
 b=uCuhvzbiHEKfQwYu4VQYqD3R1LTghvE//bMl5JpgCRnMgRhqXBBrKplQUtrp0STwN6
 Q/BB1ASEu4kYcJjvqjejcTRIYRpDqiXZb/v8th4DyYazUjMKjE4rqeifCW46cWtwivyw
 +afgcFHL25txeitV7bNhN3bnQR58aafpbn5ea+NusrjG1X7yFAdgavWeG/P+VjvxY637
 s98KIzi5mLN6xlfn/yM7U7a9CSgV31+IxVmhnvDhgJL8CUi0nlz5vUYpUnX3+FOjXtH9
 fCcmFV9YocRskbe0KKlZipYh42LCpAVkBxOeCUS3PLyz1KspbR2NgPL7GVzmaoqii8XQ
 ZJxw==
X-Gm-Message-State: AOAM5329hQBiWfcKZBNoaJG21Ad0i/UNIxYyFHK9HMyzqkflb51h+7Ck
 Wmy9Zy/RJMd6HVJZrf34DrlsFemAWNQ1cyJLrwyTcA==
X-Google-Smtp-Source: ABdhPJxH/DWTbcIHKQME2RAYDKycZes1qUdd1tkEwxbPosmrKDJthiQnptj8ZdNcQ6Oae2H4ZvJR+LpDh+1om4KPIbQ=
X-Received: by 2002:a9d:1d1:: with SMTP id e75mr22614536ote.303.1590476200544; 
 Mon, 25 May 2020 23:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAL3Fm-JJbjCby5_HojTf9dWKurw+CECN7LDqamtf53c9L-0jtw@mail.gmail.com>
In-Reply-To: <CAL3Fm-JJbjCby5_HojTf9dWKurw+CECN7LDqamtf53c9L-0jtw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 26 May 2020 08:56:28 +0200
Message-ID: <CAKMK7uH5Qxkvv1eKmNBQn3tSaEy50AX2TkTc4DZwiqfDqxMcFg@mail.gmail.com>
Subject: Re: Dynamically change enumeration list of DRM enumeration property
To: Yogish Kulkarni <yogishkulkarni@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 26, 2020 at 6:31 AM Yogish Kulkarni
<yogishkulkarni@gmail.com> wrote:
>
> Hi,
>
> Is it possible to dynamically change enumeration list of  DRM enumeration property ? Motivation behind this question is to understand whether it is possible to create connector enum property (e.g a property which will list supported output encodings -  like yuv420, yuv422 etc) whose list of supported enum values could be changed dynamically e.g. based on which sink is connected.
>
> I think there is existing EDID connector property whose value changes based on connected sink. EDID is a BLOB property, I am trying to understand if this is also possible for ENUM type property. There is "drm_property_replace_blob" to replace blob but I wasn't able to find any API which could replace list of supported enums. Alternatively, would it be good idea to destroy custom enum property created by a driver and create new enum property with new list of supported enums e.g when there is a HOTPLUG event.

Neither works, properties and their value ranges are static. Also
generally the idea is that the properties on the drm_connector reflect
what the source side can do, irrespective of the sink capabilities.
Since a lot of sinks have bad EDID and you might want to overwrite
what the sink claims works.

Usually how we do this is a second property that the kernel sets, and
userspace can only read, which shows what the sink is capable of.
Sometimes we also just let userspace re-decode the EDID and figure
that out itself, but that's kinda a bad interface.

Also for anything new, please keep in mind our rules for new uapi:
https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#testing-and-validation

Cheers, Daniel

-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
