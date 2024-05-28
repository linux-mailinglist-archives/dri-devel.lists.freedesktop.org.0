Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C82B8D14EE
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 09:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FDB10E741;
	Tue, 28 May 2024 07:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="q03VT8KM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B55410E741
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 07:09:26 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-62a088f80f6so28305127b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 00:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1716880165;
 x=1717484965; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=28c1rMC/X0dW+TO6kpUchR3zmdXaj4zlqVXQbL/tt3M=;
 b=q03VT8KMcqZTuwOz7WgX7uWnovpqeU/e8BGrunfKKgjCD7X8UArlnmmjFPPnFusUCr
 5Fn7DCVWhTS6ga0/9r3TsKlx3t4S6nc6QuAC8au53juWT1SMFjQ6eqmWebPwBQVcNXS2
 XAJCH9U75ZEyWSR46yvwMpJvOk6FZMG2QgzX5Vte6KIGFnWaQw+YdmZ/kTDn82lxfCWV
 WUHHoJSJyOv9V+YdT5hl8nIfCjQAtNK9kLMi57cnK4o/LSeLKUAtPSPhowhvFJRTyLca
 NCrK4l40z4J1KtQKm4mAE0+/LBxBBfX30yyjBftZzhAuGHXqVQNXeOoBVIRuLTLndpVY
 lzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716880165; x=1717484965;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=28c1rMC/X0dW+TO6kpUchR3zmdXaj4zlqVXQbL/tt3M=;
 b=sF2756C3EwR7vCwEWNde2wpFKkpRndK3I3mLpBzdeh+DrA/TrGu7nIRz42bwHEti6o
 iwHCNwzZCjOEVd62ctaYrjLvigmKwzUP9Nn6LDOpnVLquZK2Ul/sPlG1fuLmWiTBvwH1
 PnshdIZj07RvDlov0krujAAboVGiTL7Hou1Df89tzTE/+rLJx8uwgi3HGNC5oKWYZUXt
 pEGFUQnTwETvMavyUVa8HoOZ9A9t9Zv0ZAahI0f+TmyNLM/yEKUwgO4KFZo9iNOmqsoQ
 VUkLzmxqr8UkEPQuPXeLwno9MDPtBmvrhkEPXKHyDPeKTXC42FeRhanDW1M9/9+vWQu2
 7dLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHRW9ArBAKzIf3y7FicPrKvlazAQondXIlI3X5MhcAZa0gIfghAZyEb1XC4AvrCk2wr8lGph+r3GrKC+HGLJKkG6pJXB0iywDnQ2QDn5gp
X-Gm-Message-State: AOJu0Yxbxl3EN0JeR7RvJPiXitJChXf7mkrKPZfHk93Y62gRPbQaciF/
 fiK8bj/PVjZSPVwvahxW/0qda1GtNArqXMoxR3aghzZyNcxP6WQ2pbFb/mu+3nopWvMt+JMQTxs
 Zg0Y=
X-Google-Smtp-Source: AGHT+IETmzE+yNWAhFebMSPWH8PVbRg/Ynpiq/P4ynkINJSBei8gj0wA0CQ3K/ik8knPCB/f3fD4LQ==
X-Received: by 2002:a25:af47:0:b0:df4:d607:e021 with SMTP id
 3f1490d57ef6-df55e402efbmr11329765276.21.1716880164851; 
 Tue, 28 May 2024 00:09:24 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-df7746b127esm892033276.33.2024.05.28.00.09.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 00:09:23 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-62027fcf9b1so3550417b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 00:09:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVXHn62OS4wvaX4d4WRmxBBBILwD2vV0QwSgmmkekrLDSYV+ncXB7SlgB8dyOYUvVb4L4l1969u6vhGIUIwV1LzQtNkQcJsoxHThRwu2Y0h
X-Received: by 2002:a81:4305:0:b0:618:48ab:e597 with SMTP id
 00721157ae682-62a07329a37mr78269317b3.8.1716880163322; Tue, 28 May 2024
 00:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAAObsKAw174AhGaA13Hyw0ANW=TxJHpK10+OwQGNMVca85Urdg@mail.gmail.com>
 <ZkyPoIXBeBUqFJ48@phenom.ffwll.local>
 <CAAObsKAJvgg54zBEP-e3PKPLVeX+akZFJudjutjzVVZOJa-41g@mail.gmail.com>
 <e22ffdea-3c18-3a23-e526-25809e98fcd9@quicinc.com>
 <b19b95ca-c235-4738-a586-bfd1a36183dc@linux.intel.com>
In-Reply-To: <b19b95ca-c235-4738-a586-bfd1a36183dc@linux.intel.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 28 May 2024 09:09:11 +0200
X-Gmail-Original-Message-ID: <CAAObsKCdU5_O7HgcPQ3SHAuSbCKFPU494GS9dazZ9CfPtvgtcA@mail.gmail.com>
Message-ID: <CAAObsKCdU5_O7HgcPQ3SHAuSbCKFPU494GS9dazZ9CfPtvgtcA@mail.gmail.com>
Subject: Re: DRM Accel BoF at Linux Plumbers
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Oded Gabbay <ogabbay@kernel.org>, Olof Johansson <olof@lixom.net>, 
 Lucas Stach <l.stach@pengutronix.de>
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

On Thu, May 23, 2024 at 8:35=E2=80=AFAM Jacek Lawrynowicz
<jacek.lawrynowicz@linux.intel.com> wrote:
>
> Hi,
>
> On 21.05.2024 17:10, Jeffrey Hugo wrote:
> > On 5/21/2024 8:41 AM, Tomeu Vizoso wrote:
> >> On Tue, May 21, 2024 at 2:12=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch=
> wrote:
> >>>
> >>> On Sat, May 18, 2024 at 10:46:01AM +0200, Tomeu Vizoso wrote:
> >>>> Hi,
> >>>>
> >>>> I would like to use the chance at the next Plumbers to discuss the
> >>>> present challenges related to ML accelerators in mainline.
> >>>>
> >>>> I'm myself more oriented towards edge-oriented deployments, and don'=
t
> >>>> know enough about how these accelerators are being used in the cloud
> >>>> (and maybe desktop?) to tell if there is enough overlap to warrant a
> >>>> common BoF.
> >>>>
> >>>> In any case, these are the topics I would like to discuss, some
> >>>> probably more relevant to the edge than to the cloud or desktop:
> >>>>
> >>>> * What is stopping vendors from mainlining their drivers?
> >>>>
> >>>> * How could we make it easier for them?
> >>>>
> >>>> * Userspace API: how close are we from a common API that we can ask
> >>>> userspace drivers to implement? What can be done to further this goa=
l?
> >>>>
> >>>> * Automated testing: DRM CI can be used, but would be good to have a
> >>>> common test suite to run there. This is probably dependent on a comm=
on
> >>>> userspace API.
> >>>>
> >>>> * Other shared userspace infrastructure (compiler, execution,
> >>>> synchronization, virtualization, ...)
> >>>>
> >>>> * Firmware-mediated IP: what should we do about it, if anything?
> >>>>
> >>>> * Any standing issues in DRM infra (GEM, gpu scheduler, DMABuf, etc)
> >>>> that are hurting accel drivers?
> >>>>
> >>>> What do people think, should we have a drivers/accel-wide BoF at
> >>>> Plumbers? If so, what other topics should we have in the agenda?
> >>>
> >>> Yeah sounds good, and I'll try to at least attend lpc this year since=
 it's
> >>> rather close ... Might be good to explicitly ping teams of merged and
> >>> in-flight drivers we have in accel already.
> >>
> >> Sounds like a good idea to me. Will check if the people that sent the
> >> previous aborted attempts are still interested in this
> >
> > Looks like the Intel VPU folks are missing from this thread.
> Hi!
>
> > I like the idea of a BoF.  I suspect I will be remote but this list of =
topics looks good to me.  Nothing obvious missing from what I can tell.
> I like it too and I will try to attend. I would maybe add to the list GPU=
/accel interoperability.

Thanks, that is a really good one.

Tomeu
