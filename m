Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DAE9C631A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 22:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B299110E0BA;
	Tue, 12 Nov 2024 21:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mEJMG6cj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DA910E0BA
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 21:10:50 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6ea339a41f1so52699747b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 13:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731445849; x=1732050649; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xYt0wV4ODjnX2GzLVpuYfjxcoTH4gijd804UgaMzIoM=;
 b=mEJMG6cj4s7COOBFJVO5zDOj0JEMnUiqsjIgshHMc+0b63xhgmhmaM5dldETL6K4n+
 nz9xKP1Xw7sucowqgb59FYHrpGtKLdnKnMCLq/wl5MJVZ56tG7jhqhg5cyOUJv1bS9HG
 XndZ6bIH71bsh9QW4cpWmO5p5m1ugjbWbV4/jbIeTpgyZSrm6GCoFsqBDUnWRxvzcPa2
 KQtLVSBGSwOLuIRSHSA/vtlrDTc76n94NopJ2JvnDmHnwGvcOjugcfKv0dXGh5/KYWAg
 RheR5nMToX8w4wftRunqIsXcoRF4KvbonQ5ZSHBmndTGA9p0nYgo8CI/QMQjDcjGbbQR
 aTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731445849; x=1732050649;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xYt0wV4ODjnX2GzLVpuYfjxcoTH4gijd804UgaMzIoM=;
 b=JwnZAo/Pe5tGtaOU6fFcKEk7cvtKUlCrOeS9lOSkZtr3RGhRRMsXbXfpH8PqSgA9an
 BU0Fhm9i42aplNvTfsSiimG/FZ3Z5FOHfof1TMD0dfslSn+ERZY/hXQroh+/urXDlsn0
 sP7dkLxM+Q2S5HsgZzd7TObugo0AnrsSCqKrEJv5+7BGq4aqexzFACbcK18yKQwKFfIN
 0krr6WBUO0+2n1YnNBTtFGbhZhVj95PrOT7XzSI647cFKlI2lXRX8dTT7dqPSXlFQ+nY
 KjAQJ/Gef4vLggZFRo+HT7xBUTPI9OH0p/BZ1+2luHmjqzgJXujek5Dze7a/hqRqv6xW
 KMig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcXe6EBk4/zVFNLvP9ldIMHxZaL1lMb0lU/wpA4d0Nd99n6HDYJuOMNhg7xrXb3Z28P3A+BDBexs0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTVIr5q1oNXTetZQjYyEbla3Z0oQlWKlxjf75Dwv1r8gY6ocMM
 84w49q7sstRLAUZchae8hqIrFYhYIqF2MGkqxvQ5lUhk/1EVFPevCYd/GzSBdpPXq3JsXm2w8X+
 r++8LnENSWiPYqvdu7UTPZvNGfAQ=
X-Google-Smtp-Source: AGHT+IFcN4dtdR/3ssiwv3BjCNazIzRIQ8q0KgL5uHdRf+quKB2ZK3jMsizjkXce+5ke2cu5DVRnsCRfpnsA5gk5ZDk=
X-Received: by 2002:a05:690c:9688:b0:6e3:34b9:960a with SMTP id
 00721157ae682-6ecb32cd94emr5931047b3.17.1731445849144; Tue, 12 Nov 2024
 13:10:49 -0800 (PST)
MIME-Version: 1.0
References: <20241108094256.3717-1-christian.koenig@amd.com>
 <CAPaKu7SK9X3eDb6EkyXjatFT4YqZUhR949ANuYmOPVnajBU1kQ@mail.gmail.com>
 <55169975-0348-4017-9e47-0d17b6cd211f@gmail.com>
In-Reply-To: <55169975-0348-4017-9e47-0d17b6cd211f@gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 12 Nov 2024 13:10:38 -0800
Message-ID: <CAPaKu7RcMyi+edTmji883SGcyZPQUNF_rEiGgXoRj5jeXM-CFQ@mail.gmail.com>
Subject: Re: Ensure progress for dma_fence_array
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: boris.brezillon@collabora.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, lionel.g.landwerlin@intel.com, 
 dri-devel@lists.freedesktop.org, faith.ekstrand@collabora.com, 
 simona@ffwll.ch
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

On Tue, Nov 12, 2024 at 4:00=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 09.11.24 um 01:32 schrieb Chia-I Wu:
> > On Fri, Nov 8, 2024 at 1:43=E2=80=AFAM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Hi guys,
> >>
> >> as pointed out by Chia-I userspace doesn't see any progress when
> >> signaling is not enabled and Boris noted that this is because
> >> dma_fence_array_signaled() never returns true in this case.
> >>
> >> Improve this by fixing the dma_fence_array_signaled() implementation t=
o
> >> also return true even if signaling was never explicitely enabled.
> > Yeah, this fixes the timeout I was seeing on panvk.
>
> Any objections to add your Tested-by?
No.  v3 is also

  Tested-by: Chia-I Wu <olvaffe@gmail.com>

>
> >
> >> We should probably adjust the documentation as well that when the
> >> callback is implemented it should make progess visible even without
> >> enabling signaling.
> > That would be really nice.  Both dma_fence_is_signaled and
> > dma_fence_ops::signaled explicitly state otherwise at the moment.
>
> I have put that on my TODO list, but could take a while until I have
> time for it.
>
> If anybody wants to make suggestions on the wording feel free to make a
> patch.
>
> Thanks,
> Christian.
>
> >
> >
> >
> >> Please test and review,
> >> Christian.
> >>
> >>
>
