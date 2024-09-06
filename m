Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 243AD96F8AC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 17:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A666B10EAB6;
	Fri,  6 Sep 2024 15:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="I3MxSZ0R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A282A10EAB4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 15:52:41 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e1a7d43a226so2416758276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 08:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1725637960; x=1726242760;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gFx/vzgC0Kms+7wBTBm1rpdb6LPdJzSutbfAV0tUlfA=;
 b=I3MxSZ0RoJDw99oGquXm33KiIg5j+ohIfKVED+wQAAjGPTqj5EWKJaDjulSCzrw07w
 k02YpYJNgMv0MfUWoBH0sj80Or8Gub2gnzbMiPM7/R1E3m5j6zFyoWR8qnirsBMSxL91
 Cuku97Thagh3EqyIQhQxuFlR4UdPF1WmQBXtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725637960; x=1726242760;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gFx/vzgC0Kms+7wBTBm1rpdb6LPdJzSutbfAV0tUlfA=;
 b=vQ4fJuG+J65RTjxJB6j2OrxRS6ohLNBI5wLC7JeTu+xSwMsyBdUK83Vn2DCic6KSD0
 lOzJK3ktjrWq8jLwBYqfkNV+UDZV7WSgkcodOcTzB982/WmdIv+kfSfebf4s5AvsWc9k
 kxDU0KV4AhW4ezg3S1kqHBSRksbHcHTbcJs8YOG2Ro6G9YzcWWJ6ZJ38Da7C9y9OoleC
 54uZUMuI26tpDcjasGTxIpXR/8Cy3/oqt9JIBpmmhyPM3xcu4yPOVzLQbXd/YU8Av1dC
 ODK5BSvTEcwM9kXKkvaXVpsLbrFTAiGDpmvp3o9pGXnVKE4fky3xMU7SRAmLq/bWodiR
 fmEg==
X-Gm-Message-State: AOJu0Yw1DFLphAkR41bbmh5V4G83gALqdmrZA56BpFbvg555NckL54pt
 c6Lc1oh0dqad34pm1W4Xp7Bn37L2ha5cAbLgvvP66dwTP8fqm0oDhXZe8YcoaUXUCD0x7SREkbh
 n2wQ9g30EgOZZ6x6l9vdYIjjwDFsFGL8u4+SL
X-Google-Smtp-Source: AGHT+IFPGdmt6yqTEtuP7EEDCsmi//Fyd307hdILDdKElkVinbajvXnOj4nTl9zdDRE5nrrilepF1lK5eiUKUy5o86w=
X-Received: by 2002:a05:6902:230c:b0:e1d:3354:5c80 with SMTP id
 3f1490d57ef6-e1d349e0390mr3365750276.35.1725637960484; Fri, 06 Sep 2024
 08:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240905181710.154732-1-ian.forbes@broadcom.com>
 <CABQX2QMvg-A9tnwwm1O3s5bhhd_w5==YqtLM5Jrk8psniAsKvA@mail.gmail.com>
 <CAO6MGtjCwMD8U07-oYYuwz9o5AaENkRw-isjFLGGxzfxoB+s7A@mail.gmail.com>
In-Reply-To: <CAO6MGtjCwMD8U07-oYYuwz9o5AaENkRw-isjFLGGxzfxoB+s7A@mail.gmail.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 6 Sep 2024 11:52:29 -0400
Message-ID: <CABQX2QODbZpxZ0ujj2Q4CR5MZJQRobk+s97ojBjb9RbUaCrMtQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Add tracepoints
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
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

On Fri, Sep 6, 2024 at 11:26=E2=80=AFAM Ian Forbes <ian.forbes@broadcom.com=
> wrote:
>
> On Thu, Sep 5, 2024 at 10:59=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.c=
om> wrote:
> >
> >
> > In general it looks good but what's the reason for the submit_time?
> >
> > z
>
> So you can get an approximate time of how long each command buffer takes.
> You can then use it to construct a histogram or look for outliers
> using bpftrace.
> Useful when doing performance analysis to determine if slowdowns are bein=
g
> caused by the host or the guest driver.
>
> $ sudo bpftrace -e 'tracepoint:vmwgfx:vmwgfx_cmdbuf_done{
> if(args->status =3D=3D 1) { $elapsed =3D(jiffies -
> args->header->submit_time); @exec_times =3D hist($elapsed);  } }'
> Attaching 1 probe...

Can't you do the same with just:
bpftrace -e 'kprobe:vmw_cmdbuf_header_submit { @start[tid] =3D nsecs; }
kretprobe:vmw_cmdbuf_header_submit /@start[tid]/ { @ns[comm] =3D
hist(nsecs - @start[tid]); delete(@start[tid]); }'
Or kfunc/kretfunc if you want to condition it based on args->status?

z
