Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B450695BDDE
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 20:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD5D10EBBF;
	Thu, 22 Aug 2024 18:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hg1zm7jv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB78310EBBF;
 Thu, 22 Aug 2024 18:02:35 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-78f86e56b4cso99719a12.3; 
 Thu, 22 Aug 2024 11:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724349755; x=1724954555; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vIdZwGKc3DhnmIOea7vq7EzG3jsdVTSM3r+4Llh1m8c=;
 b=Hg1zm7jvUDCOZtNUXOKTuNAWKYDfZ1j5+lrTptYTbgB1oeLIj+cnO2hSyoj5+qE+xg
 U3BfOOFNLjTtDqvgzC/Z5VIj1DQ3sq5Zr//M9V3GaoqFcVB7ozbtPNR8YbuyFUUBvh20
 5zQ+2bp9lp5hDEEJP1Q9S4Eeac+Y2y1eNII8DNLkIx+FzIOwLjFxKqJfslwfy65d7A7r
 o1D/XCSG6wFBDH20h4iA0iez1DY7ZN5hC7kEWug68CTYgV85QqK4sANd9PqsR1e6fxlc
 6Q8I942AFVAPhpQVCj4wLiF5jZNmYiyoI8yF50S6Ft93SYt6HoPc56hM+B6aZJIeZRJu
 GIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724349755; x=1724954555;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vIdZwGKc3DhnmIOea7vq7EzG3jsdVTSM3r+4Llh1m8c=;
 b=bhtxi2Z7Rsx1BKkZtgOoq/JsGAeKczKpQLB8cqqF6Yd550OtCrvjUINI4M8vTAKhFR
 KMtSMWBHH3tcDbDRl9rWGzRIQ5npmxvUPIZyLl6qAMWJXSpIZ7JHhTmtTQ9/bmaff+HR
 HRjNtNQqG2Rf1X4X6l3DBiiyLxygBw2hkBR9VGxFucINwe7MrdSXzXOHXdIIdSyGbx4R
 +sIVBuTFYkeau9x8H7DTPsDSWcBFuzy7shfUEYoJtYzjDJD6ZZ1R26fveGKRulke0eKs
 5AmVSJMZYUDpKBVqFZERi37jTtUrbjeY/rIwpCXNIVMpHdlD+pKD+g2plOWMS5sk3q3f
 y/AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaUEFTfWr1Z1RkM3SPrvzP/CN5Fb0Q95wVH2NiK7p2Lxz71hjSW0ehatg2WTSt8iYF2FnUWZqy@lists.freedesktop.org,
 AJvYcCXNZQn9FWRsJGhI8MTtC24SeYW/vpllyrkOKStR2lRTbl7kQb9gCtmiEjzcPKzIpncCDHriIEd7TFrF@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd+X6GaJgJYQpfoQbRkqioqZJfdFBJFNjwMEBgEophJGXUJ9XH
 0VUQ3na0O+wsEqjc8xoAa8v27n6WkO0v14ONrGQ+/4f9bXCAJRnj9ERA1C0MpVXUWuSndc5H68p
 sQWH6aXcXlRKpg/h5DK+BG1fipks=
X-Google-Smtp-Source: AGHT+IGH8BiORy07so3jtmFCtA+lbgj7e2tJludQJn6knBzrwm1xGtFWt4cjBsQ2Q4UHBBCaeVtia+r9dkZgl4i8HAo=
X-Received: by 2002:a17:902:c409:b0:1fc:6d15:478e with SMTP id
 d9443c01a7336-20367af2ea4mr42545405ad.1.1724349755001; Thu, 22 Aug 2024
 11:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240812065656.GI13701@ZenIV>
 <20240812065906.241398-1-viro@zeniv.linux.org.uk>
 <20240812065906.241398-2-viro@zeniv.linux.org.uk>
 <09a1d083-0960-4de7-ab66-527099076ee4@amd.com>
 <20240822002921.GN504335@ZenIV>
In-Reply-To: <20240822002921.GN504335@ZenIV>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 Aug 2024 14:02:23 -0400
Message-ID: <CADnq5_PfNy3-zK6XDa31LUAcMH5m-CkV1TtL_jtOqmdaQjcLMQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] amdgpu: fix a race in kfd_mem_export_dmabuf()
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org
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

On Wed, Aug 21, 2024 at 8:29=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>
> On Wed, Aug 14, 2024 at 06:15:46PM -0400, Felix Kuehling wrote:
> >
> > On 2024-08-12 02:59, Al Viro wrote:
> > > Using drm_gem_prime_handle_to_fd() to set dmabuf up and insert it int=
o
> > > descriptor table, only to have it looked up by file descriptor and
> > > remove it from descriptor table is not just too convoluted - it's
> > > racy; another thread might have modified the descriptor table while
> > > we'd been going through that song and dance.
> > >
> > > Switch kfd_mem_export_dmabuf() to using drm_gem_prime_handle_to_dmabu=
f()
> > > and leave the descriptor table alone...
> > >
> > > Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> >
> > This patch is
> >
> > Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
>
> Umm...  So which tree should that series go through?
>
> I can put it through vfs.git, or send a pull request to drm folks, or...
>
> Preferences?

I'm happy to take these via the amdgpu tree once the other patches get revi=
ewed.

Alex
