Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ACD951769
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 11:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB2D10E443;
	Wed, 14 Aug 2024 09:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="dz4XXzL0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A4610E449
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 09:10:51 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6bb96ef0e8eso34090326d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 02:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1723626650; x=1724231450;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vPEvb9R+nivtOxDWaQTXsJOKPes6soPv2NUR48zGQ0E=;
 b=dz4XXzL0mIlMwKQTA+7bqjmyB7SvQdq7M4MYuUVmB38Zt6liXE8C33nlIXvuxKd1YX
 EIkSovgXSuf8HbnsFVrFj9xgWNQfWlV7Xb9fIL+aP4iBnUOkeyS514C+Gkm9hM7ayvI4
 9AtMXRUPTAAVucF7vmHXB/GWcS9sgBhbaGp9w8DXPzBcLyrmZrc99VVecnTxXy0+fBdg
 GwXE+Cper974naf2kIY9ogwc4q6ihiOINUTgvgi6TTKrbT3MXz820Enc93yH5B5wVf9N
 3ndA2GH0dm63wk6egfEf9i1mGH/3uOk6luDENTGZpO/3HnmXrauw1w0qGqUMFDzdoxXu
 rgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723626650; x=1724231450;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vPEvb9R+nivtOxDWaQTXsJOKPes6soPv2NUR48zGQ0E=;
 b=fClwAZnAhmBiU4TOZLNlSz+ba1JwYwRYWC1ucq1LKhitdvzB2yl3gtrrdd+wgaPsPS
 /vAwYWx0e9EqXdwDJYh3SMSbxBTQ8r96S/52iPdgSm7hIBUR6NjNzKi1cA7UVTKRhV3z
 WEwVVlBOk8bn7F12kLdNS9ghnv6rp6Y305ts3I0UplAs9Ojp/gwcr1NDl91H1UlBxLvQ
 Ln4BuDBxUZwPln53XlmuOiaL3pdKjldRcJAnZ+WV0iNg4O88GrOFPabfJ9k0MLSHiTP+
 8TsraFWHLac+mCdwLz4OtQhzigbHCKcrJbp7afyZlEosXhGJ9WbrNU55x3tu1cU4LG7Z
 ODeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTsWjDz7cmDusShVOHkdlmSMwDME6b5PVYySLoAicEhRBApLUGC9R836M/pNbMBH5pdw4yLtBKj/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMmdJIME09Kgd6/rb/TbUvlpp0jAhQr2QobHuXfHX+pHrkFkXh
 qrNKf6wspMkS8e0oznXzjtqVuFce5xP0MNSXIytyhCeDivMDlMiOaDE/MIm0ewbq0xa0GVSlqsf
 hz/lNvl3V66oZtsxsuAxmzpuDwilbj3+wOuwmkQ==
X-Google-Smtp-Source: AGHT+IGeSqKGmFAJUAm7WniNvG9r9PhmhFUNqTMunvROKAZzH3KtLQs8l8fONQIsnzIZGRCqU8+/ty8xiYc4yDX20TQ=
X-Received: by 2002:a05:6214:3197:b0:6b7:9b2c:98d3 with SMTP id
 6a1803df08f44-6bf5d1be47fmr18702656d6.26.1723626650637; Wed, 14 Aug 2024
 02:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240813105134.17439-1-jose.exposito89@gmail.com>
In-Reply-To: <20240813105134.17439-1-jose.exposito89@gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 14 Aug 2024 10:10:39 +0100
Message-ID: <CAPj87rP0HZzdVoH18O6gVe1n8cHjhNn2LFSAAVvqj5m6tN2y_w@mail.gmail.com>
Subject: Re: [RFC PATCH 00/17] VKMS: Add configfs support
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, 
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, louis.chauvet@bootlin.com
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

Hi Jos=C3=A9,

On Tue, 13 Aug 2024 at 11:51, Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmai=
l.com> wrote:
>  - When a CRTC is added and removed before device creation, there
>    is a vblank warning.
>    The issue is caused because vblanks are referenced using the
>    CRTC index but, because one of the CRTCs is removed, the
>    indices are not consecutives and drm_crtc_vblank_crtc() tries to
>    access and invalid index
>    I'm not sure if CRTC's indices *must* start at 0 and be
>    consecutives or if this is a bug in the drm_crtc_vblank_crtc()
>    implementation.

CRTCs and planes are not hotpluggable. I recommend you just create a
lot of each of them statically at startup, and hotplug only
connectors.

Cheers,
Daniel
