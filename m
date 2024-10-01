Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3728E98BBD2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 14:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9965C10E02D;
	Tue,  1 Oct 2024 12:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BfqP7N1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B2110E02D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 12:09:42 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5398b589032so4684537e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2024 05:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727784581; x=1728389381; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aWCgH0ClFjv7Xbxzqvhc8wMkP2UFTXtvCY9K+uhDros=;
 b=BfqP7N1msz9eq23nlz59eJr4HGZjihL+kUZO4MKvrhCr0/nU+0SIBbG0kge1ja/KCG
 uJFyUw+o3ndaCBXx1E6BReVlJtNQkpQWGpjKBmSp1CVkAE5XkLjvOba3k8AggEecgKqk
 x18sJcerkX3KPv6fC46Fvmys/DZHli3WeAuB7xToZcjYNOovU1yb47rFUwoqMPiHsQdb
 LL6n5RfPAkyHVvFuFcDzjgzoDD1WEYpP56C0YvB3dy/O8q+VN9FShqVjj10vCxthvJ+x
 Ah6Kjsl3Vb1516pflVYZ8haQNuHIYi8UCMgBgza7PEVoufYvjpOQfL9Vz5EUUYMXimJG
 3o3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727784581; x=1728389381;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aWCgH0ClFjv7Xbxzqvhc8wMkP2UFTXtvCY9K+uhDros=;
 b=MUqDGxcAZf6SAB3vOn/6VrkmB78V8Lxvfy2uFisxOCZ79BtfciJKx0y2mYWqlOyhXl
 x60FxaF8+yXdaZTRjlALapkDN/LcRQa761wp59klQzGhuWmx4scpaLWUSxg9SpcgTD3q
 1n6hHxr/jYJ8bX8kR/n56yjf2V2dqzaKnmpJmUzTy4TmEX8F/t5+w9IkbZHbinYLQ2AR
 P1nUROFFfWhNsYryfQBudAx7cKeB4U73pnOtgS7uSm+CI9b2xAvNjZMyH5dmLil1oezt
 7D3Oe9lDDtRaZy/3aI+lsYy1Z4dHCy0A6UWtSyNROsEjjo9bJB093EshWfPY6arhUQGb
 Y/fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8iiwFDHymUY6gpb6++TaLluBbYApVmaI8Rx4rm+xz0tH12WFnIi6zqKVjHm2H5eczPA/xP4LIngw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlXh6O2olL7tva9+5yDTx5hg36uZ+sM2WaWNsp7jvewR3izLjU
 6ixl1iOmwlOgNOUdi+0M6dDDkT1kQYKE3GMM75Ln+ideeICn7XMVEwv9rhpzgdPj/e5OqLXA9Of
 fjZnvPxeXz4tVtUhnFjfgjcgPCgA=
X-Google-Smtp-Source: AGHT+IF/9YwKZ2en3kdviSKl+8cfVU8oz+B31Oy9zgfZf1fHaLcDpl9wujyAGZjjg5hCXITsx7M6SIfrMRdCNNTEH5c=
X-Received: by 2002:ac2:4c43:0:b0:52c:e10b:cb33 with SMTP id
 2adb3069b0e04-5389fca3ae2mr10981878e87.50.1727784580470; Tue, 01 Oct 2024
 05:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_PB8zUfCN-NcNpgHqzAv8A55o2hsYHAdnSBhEy525NLfA@mail.gmail.com>
 <D01B31B5-0609-4106-ABF4-B549CDBA362B@xenosoft.de>
In-Reply-To: <D01B31B5-0609-4106-ABF4-B549CDBA362B@xenosoft.de>
From: Hoi Pok Wu <wuhoipok@gmail.com>
Date: Tue, 1 Oct 2024 20:09:28 +0800
Message-ID: <CANyH0kBnWZMZCG7K9vGt2a8Svr30U=PVOwrhwn-Q-CN9PZc=Sw@mail.gmail.com>
Subject: Re: Kernel doesn't boot after DRM updates (drm-next-2024-09-19)
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexdeucher@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 developers DRI <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, 
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Darren Stevens <darren@stevens-zone.net>,
 hypexed@yahoo.com.au, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
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

Hi Thomas,

Could you help on this issue?
I do not have access to the hardware now.
Thank you.

Regards,
Wu Hoi Pok


On Tue, Oct 1, 2024 at 12:26=E2=80=AFPM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
> On 30 September 2024 3:27pm, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> =EF=BB=BF+ Wu Hoi Pok
>
> This is likely related to the drm device rework.
>
> Alex
>
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94-
>
> Hi All,
>
> I was able to revert the drm-next-2024-09-19 updates for the RC1 of kerne=
l 6.12.
>
> This kernel works on all machines without any problems.
>
> This means, the new Radeon DRM driver is unreliable after the DRM rework.
>
> Please fix this issue because we can=E2=80=99t deliver the kernels with t=
he new Radeon DRM driver.
>
> Error log: https://www.xenosoft.de/PuTTY_P5040_U-Boot.log
>
> Thanks,
> Christian
