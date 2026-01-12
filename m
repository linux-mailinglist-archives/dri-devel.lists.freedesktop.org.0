Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E60D13EA5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 17:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC9210E417;
	Mon, 12 Jan 2026 16:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LxGGv3/t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF7710E0D5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 10:39:33 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2a3e89aa5d0so48154975ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 02:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768214373; x=1768819173; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UenKJW7FDUByZJnFEy7SwCkIKfj9EmdUi7nZ1uEh77A=;
 b=LxGGv3/tK9qiZu8w/DSSE8PFp1G/mMFWxov3qD3MHJ5M+FyQTQDrLByXBnbCEc7dmK
 dMqIsSd0yZVKj7tDg7jX/SUQgWCBOrbvuky68QF5rvBfNxi+P3804ChlkwZD0jtzWfX0
 CYWTbt+FpUrIumdN6GXqcfl6qIjxljboGhW+EBIYIR5EeooXA51Fy4ICGEy/7eweMZaQ
 NX1uIY7tkH2gkV1e31U0e7aCGifz4ATF2fC8/BQF5al6pIJEXXrvxzwgdxV0v/sM1gVM
 GGXXkaHVaSz4SGWwRf0yhixthfHfKaUVOqrTYTUWT+w10s/jdI1N7sy5iF/MRYo7nbuG
 FYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768214373; x=1768819173;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UenKJW7FDUByZJnFEy7SwCkIKfj9EmdUi7nZ1uEh77A=;
 b=ki/lEM2Av8H5w+JYyoVHEKEDjmsx7hhpqVlHTMXkeW4jT2GstSX8zWlXrx7HiP/pRG
 ePM8KeW0ZZtJOw+Goo7l1QQyxdEapxCaySjZrv7s4mrIXXCNpk9ql7NbwemAbsUFr2Jt
 P5ipVvUV2L5t3eVCBKu6PmoUfRS9330cjji16YYckHi/6C9eghykc0aWY5VTPetMqnqj
 fMQYSbEbipoSS0pzrSLbXml+x1h0IrvcPfUIk3Ebx401LhmglO8wMk8N/Szu5LfmUpOb
 x41eaou8DqhOmqXhsyBKT1sUowbwLEPb5sJoPhroPuYCEJGUeUkmFrzo+yUrTiQJHHvT
 B3Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFioRR2K2lEb9MwKqopqU1xC3vP0Y2J/Pbys0M+v8Ac37bULfr+77moaBvezB378T4X8wHubzbDSg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxE/+Y5/fIhMHLKftlKDaMUzH4H19dyNV7FYN6OGj3mujlQEoTl
 00W6lhsJcmp5vAq+iSGO+MHdM/9k60d6MDlyCLMX1eodD4RAk7V1UmisqU50pL1hesMIJVozkaM
 BZ3pTH905vLAFrtBDbL51XtMHG3NE4qNenJGDvfZUcTlyLhQ=
X-Gm-Gg: AY/fxX54GRevPN4Be6cz7D3LGQrjYBhcosjn7D1SaJzPqddKAAN3f8iS4nWkr9de/Vo
 HYF+dr/kHZkzcMPDHexLfgUR6nzRfow/cVE9lEkTh+pw30LDesVz+IcMTeS3X354Mqh3Rh0Yzek
 DU2aW+q1UQSrAoJnhPw+RjFTpfuj0blNMf8zNNGSjzVejZ6xdUAs9gx1IjuK0qjyLC6uiheb2cr
 Q56nU+vGiIRgaL/II2Q7UBG5Bb4YM9Nd24YaQGe47Ni/mD2/Wr7PFlCXJKVa/RNRfZgfhhh
X-Google-Smtp-Source: AGHT+IESQjBmYnaEzEFjC8s1z9ZJGCxueQscFrM8SwiysrJN1Un45jUHXMSNQG4UqdhFoyrEcxjFx9EeXGK1zWLnc2A=
X-Received: by 2002:a17:902:cf06:b0:2a3:e7aa:dd6e with SMTP id
 d9443c01a7336-2a3ee48ac0fmr167548265ad.38.1768214372727; Mon, 12 Jan 2026
 02:39:32 -0800 (PST)
MIME-Version: 1.0
References: <CAK+ZN9rJypDknnR0b5UVme6x9ABx_hCVtveTyJQT-x0ROpU1vw@mail.gmail.com>
 <2026011208-anger-jurist-a101@gregkh>
In-Reply-To: <2026011208-anger-jurist-a101@gregkh>
From: Xingjing Deng <micro6947@gmail.com>
Date: Mon, 12 Jan 2026 18:39:23 +0800
X-Gm-Features: AZwV_QhZhWX1GcqhyeVAsJ8yptjpLSjxIi-29yvJiNR1Vz04J6RwVOEBfvb8hvI
Message-ID: <CAK+ZN9pLcrmVHr+EVMU+e1GRPT=AB3Tv2VggLWFFm-xX7508ug@mail.gmail.com>
Subject: Re: [BUG] misc: fastrpc: possible double-free of cctx->remote_heap
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, srini@kernel.org, amahesh@gti.qualcomm.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 12 Jan 2026 16:13:39 +0000
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
Reply-To: micro6947@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,v2 will add the missing tags:
Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@vger.kernel.org # 6.2+
I=E2=80=99m having trouble sending v2 via git send-email at the moment; I w=
ill
resend the actual v2 patch as soon as SMTP is working (or attach the
generated patch file if needed).
Thanks, Xingjing Deng.

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2026=E5=B9=B41=E6=9C=8812=E6=
=97=A5=E5=91=A8=E4=B8=80 16:20=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jan 12, 2026 at 04:15:01PM +0800, Xingjing Deng wrote:
> > While reviewing drivers/misc/fastrpc.c, I noticed a potential lifetime
> > issue around struct fastrpc_buf *remote_heap;
> > In fastrpc_init_create_static_process(), the error path err_map: frees
> > fl->cctx->remote_heap but does not clear the pointer(set to NULL).
> > Later, in fastrpc_rpmsg_remove(), the code frees cctx->remote_heap
> > again if it is non-NULL.
> >
> > Call paths (as I understand them)
> >
> > 1) First free (ioctl error path):
> >
> > fastrpc_fops.unlocked_ioctl =E2=86=92 fastrpc_device_ioctl()
> > FASTRPC_IOCTL_INIT_CREATE_STATIC =E2=86=92 fastrpc_init_create_static_p=
rocess()
> > err_map: =E2=86=92 fastrpc_buf_free(fl->cctx->remote_heap) (pointer not=
 cleared)
> >
> > 2) Second free (rpmsg remove path):
> >
> > rpmsg driver .remove =E2=86=92 fastrpc_rpmsg_remove()
> > if (cctx->remote_heap) fastrpc_buf_free(cctx->remote_heap);
> >
>
> Hi,
>
> Please note, stable@vger is not the email address to be asking about
> this, it is only for stable kernel release stuff.
>
> Andn do you have a potential patch to resolve this issue?  That's the
> simplest way to get it fixed up and to show what you are discussing.
>
> thanks,
>
> greg k-h
