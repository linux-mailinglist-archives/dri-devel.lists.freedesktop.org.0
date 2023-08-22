Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6370D784AE2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 21:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C662F10E05B;
	Tue, 22 Aug 2023 19:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5B210E05B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 19:55:29 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-76dafe9574bso104770685a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 12:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20221208.gappssmtp.com; s=20221208; t=1692734129; x=1693338929; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1Q9PzSJsZpgiOu1CVR72fJVbG7GMfY5u21uosrtHcwo=;
 b=e3zMTcqZjXEoGwBVWslC3ZpORwORyOL8dxtzfaTXF0oqIPtpxkjNbFkGpNXZCbEG6V
 p3l8wskGUPtH5zQuvFZd4rieO5HZAaAumQFvuhWH0dIwYKcQ86kSCVyGCr0XFT08LPPx
 Hrh/+4VQmxmbCoo0AH+lCdwcW2FXaVSuYhf4JHrSxYSw0cEqa2WqgdzUKn5Re66+AGop
 JBPDgHVp3djIAPe+8R9TapVgrTkconhjvsKcU+lFzcU9j3914mj1Dq10kAno3MvAcKQe
 JrFrZ34MWWkV6OShu8/9uWHsOoaCynSGhgZFOMp+y6Cd8gT5+O/7IdZtqX+dS1WD0BBF
 eBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692734129; x=1693338929;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1Q9PzSJsZpgiOu1CVR72fJVbG7GMfY5u21uosrtHcwo=;
 b=e7KtC3FuO7JdBsu/IfIzXJM9tenXt+jdrg76Anih14upEbwoSSEnBNytYk9T47noRe
 BNpkFjf6hDaLv4BPU/AySNmsHUH4GYCAlJhyCTA0K5ajxBbwTgLfGCU+qjq8iteguekh
 EO2ZKxQbY5AYAJrtfe19yRlhjNI0Bwq93ROJ9azv7FZlNIN4VkWJrHEiBjxBjdqgs8ii
 9PdhO7vBYVch0dhd42Ud+R+m+dLfzCX3QLjPDDjCeRIITbgIbYY6q8WDiQgAfJ1AoFle
 qVpdei3tpzPwg2Onwr9o76RtA1z00njGIn6+2r3QSrPkZo4i4alMAnA2x7qM2WINK7wY
 uyqw==
X-Gm-Message-State: AOJu0Yx36sSJ5iSIWIoz/YLiJWxHiu/FF6XNh78UM35Cq33o7VgLpaZ6
 ZKbaKTlS4JB1BIV+XfG/PpdaPQ==
X-Google-Smtp-Source: AGHT+IEObsx+c/lJX6FbQ9Yn/pe9TNRfUYz1pwlmVs/i9iXFeO8P55SdRnWrfg6NgJo4SUTzH6qpmw==
X-Received: by 2002:a05:622a:1907:b0:3e4:e2ce:526f with SMTP id
 w7-20020a05622a190700b003e4e2ce526fmr15163657qtc.39.1692734128793; 
 Tue, 22 Aug 2023 12:55:28 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:bae9::7a9])
 by smtp.gmail.com with ESMTPSA id
 e19-20020ac86713000000b00407ffb2c24dsm3227005qtp.63.2023.08.22.12.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 12:55:28 -0700 (PDT)
Message-ID: <9e3c7a11ed1d50c4afdf4f181aae7d4a6a425329.camel@ndufresne.ca>
Subject: Re: [RFC]: shmem fd for non-DMA buffer sharing cross drivers
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hsia-Jun Li <Randy.Li@synaptics.com>, linux-mm@kvack.org
Date: Tue, 22 Aug 2023 15:55:27 -0400
In-Reply-To: <029b982f-da62-4fa8-66c4-ab11a515574a@synaptics.com>
References: <029b982f-da62-4fa8-66c4-ab11a515574a@synaptics.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
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
Cc: daniels@collabora.com, ayaka <ayaka@soulik.info>, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 akpm@linux-foundation.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le mardi 22 ao=C3=BBt 2023 =C3=A0 19:14 +0800, Hsia-Jun Li a =C3=A9crit=C2=
=A0:
> Hello
>=20
> I would like to introduce a usage of SHMEM slimier to DMA-buf, the major=
=20
> purpose of that is sharing metadata or just a pure container for cross=
=20
> drivers.
>=20
> We need to exchange some sort of metadata between drivers, likes dynamic=
=20
> HDR data between video4linux2 and DRM. Or the graphics frame buffer is=
=20
> too complex to be described with plain plane's DMA-buf fd.
> An issue between DRM and V4L2 is that DRM could only support 4 planes=20
> while it is 8 for V4L2. It would be pretty hard for DRM to expend its=20
> interface to support that 4 more planes which would lead to revision of=
=20
> many standard likes Vulkan, EGL.
>=20
> Also, there is no reason to consume a device's memory for the content=20
> that device can't read it, or wasting an entry of IOMMU for such data.
> Usually, such a metadata would be the value should be written to a=20
> hardware's registers, a 4KiB page would be 1024 items of 32 bits register=
s.
>=20
> Still, I have some problems with SHMEM:
> 1. I don't want thhe userspace modify the context of the SHMEM allocated=
=20
> by the kernel, is there a way to do so?
> 2. Should I create a helper function for installing the SHMEM file as a f=
d?

Please have a look at memfd and the seal feature, it does cover the reason =
why
unsealed shared memory require full trust. For controls, the SEAL_WRITE is =
even
needed, as with appropriate timing, a malicous process can modify the data =
in-
between validation and allocation, causing possible memory overflow.

https://man7.org/linux/man-pages/man2/memfd_create.2.html
File sealing
       In the absence of file sealing, processes that communicate via
       shared memory must either trust each other, or take measures to
       deal with the possibility that an untrusted peer may manipulate
       the shared memory region in problematic ways.  For example, an
       untrusted peer might modify the contents of the shared memory at
       any time, or shrink the shared memory region.  The former
       possibility leaves the local process vulnerable to time-of-check-
       to-time-of-use race conditions (typically dealt with by copying
       data from the shared memory region before checking and using it).
       The latter possibility leaves the local process vulnerable to
       SIGBUS signals when an attempt is made to access a now-
       nonexistent location in the shared memory region.  (Dealing with
       this possibility necessitates the use of a handler for the SIGBUS
       signal.)

       Dealing with untrusted peers imposes extra complexity on code
       that employs shared memory.  Memory sealing enables that extra
       complexity to be eliminated, by allowing a process to operate
       secure in the knowledge that its peer can't modify the shared
       memory in an undesired fashion.

       [...]

regards,
Nicolas
