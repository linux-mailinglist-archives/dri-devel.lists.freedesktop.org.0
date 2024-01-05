Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB5C825A1E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 19:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3836410E653;
	Fri,  5 Jan 2024 18:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252CB10E653
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 18:30:11 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6dc83674972so1015536a34.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 10:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704479410; x=1705084210; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7DOGk97fr88vkauVvriKz/y0vgADMyzdF5fmnXEAejc=;
 b=QgKP2iiYMYnlhOX2/CTWhc8nkPRXh0hHG/IqNM/VDes6vyNZdbXC9miW4D8Y0/uj7h
 qY23GKeHjevI0C5hU790V10Ki7I2NGNyunCKzmQy3jd9vW1mYKrSNJQwoVhiQSd0ZPMI
 OPTzEuPP72wm4U0FqAk8+/Ww3sW25PgyQUiHXTljhs/p6gjosUXimy/ootrjD6g/jeFO
 8k7uWPrWly1WSEQzzaqj95rr/Ckz9t51RHl7p735Ut4TIN7xKZlBs/Dfisv8c5Uqngav
 oJqfG6Z1ZFfECjU3HEX2ZEjie7H3W1j+dnmjR+cS8L8ABD5hA4xYV52hZuMtJtWQe55a
 SOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704479410; x=1705084210;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7DOGk97fr88vkauVvriKz/y0vgADMyzdF5fmnXEAejc=;
 b=KHQLxez96GVOFKlZpFluxDe6bvVcSyncqGI6nirqX6ESV4zjoFpyBZei3cCAHdOtCB
 4UecNVuZv5dnkRNQgg5hBDS+kx+aCBV91WZFgFTr7xtAK6Ks62QXwKH+4Z0jYaGyGBFT
 Zac4Zmgw/UaobRjY0gDfM9VGmbcI9OFCIIYLulZL/JjLa+JIUbogcjrEDUfGf9Sj+sxy
 wmTd6tOioKbryTbSL+IDMSDCw6nRLDszEX/NPDX43y9Bc3Cr4gY7BE929kCvKe9m2eqn
 EL9e9XCL5jDJc+keVim+7D3condv2hjNbEzp6r2YtVexfdfmi8iLA/7bgPnKp1G0tIN+
 JVQA==
X-Gm-Message-State: AOJu0YyM8LC3pVgpw8WR28AOcZhj2ob4EbUjYrnKbiitje7GqU6fxHXh
 0zDCgbGKQ6iHZliQ4yJ7viGZOxCGS9yiJ3d4o2s=
X-Google-Smtp-Source: AGHT+IFihwckRwPj1sYEoQgYUkLurfzSpN6Kl5Q5syPOkuXTGfqkOp23qHjavxZpVoH/bnWn8Rsqc1uG1SHu6/wsMbw=
X-Received: by 2002:a05:6870:9f01:b0:203:7035:8a83 with SMTP id
 xl1-20020a0568709f0100b0020370358a83mr2710796oab.85.1704479410108; Fri, 05
 Jan 2024 10:30:10 -0800 (PST)
MIME-Version: 1.0
References: <566ABCD9.1060404@users.sourceforge.net>
 <8d614254-1cba-0379-cf84-52ad9bd9f3a7@users.sourceforge.net>
 <e90eea03-d7e4-4c0b-88c6-749e3528d4a3@web.de>
In-Reply-To: <e90eea03-d7e4-4c0b-88c6-749e3528d4a3@web.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 Jan 2024 13:29:58 -0500
Message-ID: <CADnq5_N_pQr+UfbO8OZ0tEXRQkQB6A7kbZtv4+Ag75GTkgvxRQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/amdgpu: Fine-tuning for several function
 implementations
To: Markus Elfring <Markus.Elfring@web.de>
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
Cc: Tom St Denis <tom.stdenis@amd.com>, Chunming Zhou <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Julia Lawall <julia.lawall@lip6.fr>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Monk Liu <Monk.Liu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 5, 2024 at 1:15=E2=80=AFPM Markus Elfring <Markus.Elfring@web.d=
e> wrote:
>
> > Date: Sun, 18 Sep 2016 18:38:48 +0200
> >
> > Some update suggestions were taken into account
> > from static source code analysis.
> >
> > Markus Elfring (5):
> >   Use kmalloc_array() in amdgpu_debugfs_gca_config_read()
> >   Improve determination of sizes in two functions
> >   Rename a jump label in amdgpu_debugfs_regs_read()
> >   Rename a jump label in amdgpu_device_init()
> >   Adjust checks for null pointers in nine functions
> >
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 68 +++++++++++++++-------=
--------
> >  1 file changed, 33 insertions(+), 35 deletions(-)
>
> Is this patch series still in review queues?

Doesn't look like I ever received it.  Can you resend?

Alex

>
> Regards,
> Markus
