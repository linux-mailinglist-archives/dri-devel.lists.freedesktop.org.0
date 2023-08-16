Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E2477DDDD
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 11:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F20510E31D;
	Wed, 16 Aug 2023 09:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B128710E0D3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 09:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692179524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZVs8rRFJ0IEN0Qvd7JyrUgFnvlIR0R3LkNLJET1b6L0=;
 b=Um+4Q6nq2Xz1uWHdGaXVJHkHtUd4QOxFV8gfx2Y14Zlxih/t6/65GFPqEC9cOVzfxKSSnl
 7fatHZ8dliK9r3algsexVXPVgHT611LDT7DV+GXG3Ig0HXJVZq3dic0Nzom5MqBJFdafIS
 354hzWQU1ccauJ7D2Rxe87vkSEbReyk=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-MC9GMWGJON2O4oxK6iIrng-1; Wed, 16 Aug 2023 05:52:03 -0400
X-MC-Unique: MC9GMWGJON2O4oxK6iIrng-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4fe56825815so1269995e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 02:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692179521; x=1692784321;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZVs8rRFJ0IEN0Qvd7JyrUgFnvlIR0R3LkNLJET1b6L0=;
 b=KV033ezdf5qxeaQFLQazvbcisMoTH9W5vBOYVI4FGhXDRxb5VGKiEtKRER+Mq8TAek
 TZhso90BVujhlgw0V4miI3wgxqK0fvLh1lL7QuSeYn4XAh5yKFmxnKq4ELZ+81kSLgKl
 dQDpeAP6+kvmFjiW2ia7JTnOwnjkN0VHBE5verHTlFIIgep8FYTSWVROE3DyrbHx5c7d
 oxQh74NgUqqbjYOK9JtXtlZzxsIt2CVObv8wnxHDzTtq4tC4o+60Zxv1oc6akRQyIUJG
 8dMP1/kGDM62YKtO28BidRqPnEzH25pHsF8nHctiUM5vUeAKW6jd8SpCHGS5/3zfK+j3
 si/Q==
X-Gm-Message-State: AOJu0YypVN98L5EwIz3hQnRUMFDyUfZEzUzAUVOihl+HDPr92OC+xzjS
 FNVtNZr/VEpZiXl5ArfzaMSQQDloGKysH+d46dpJUH0qG9WSycOI8JH4thDeU9tL9oH8OpN0LtF
 mdWtBa6fTG8V27ICx/P5ZOsLLocuL57RsEPSBpv5nC1E4SjVU3WU3
X-Received: by 2002:a2e:9043:0:b0:2b9:e10b:a511 with SMTP id
 n3-20020a2e9043000000b002b9e10ba511mr908810ljg.0.1692179521582; 
 Wed, 16 Aug 2023 02:52:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGanDULkwlMo/rQxiB2QPRaIEdUVecA5fMUQidnmhkP0uI680R9tlOgxGyrfqoEs1/jh/773s08ogYfa/jn3uU=
X-Received: by 2002:a2e:9043:0:b0:2b9:e10b:a511 with SMTP id
 n3-20020a2e9043000000b002b9e10ba511mr908801ljg.0.1692179521300; Wed, 16 Aug
 2023 02:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230814144933.3956959-1-kherbst@redhat.com>
 <20230816093015.GDZNyXJ28y9uspb4Mr@fat_crate.local>
In-Reply-To: <20230816093015.GDZNyXJ28y9uspb4Mr@fat_crate.local>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 16 Aug 2023 11:51:50 +0200
Message-ID: <CACO55tu8ab-rxCzxFXbUh4Z=W9E-1f8sH6BVd=P+16dQ9PQNjg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/disp: fix use-after-free in error handling of
 nouveau_connector_create
To: Borislav Petkov <bp@alien8.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 16, 2023 at 11:30=E2=80=AFAM Borislav Petkov <bp@alien8.de> wro=
te:
>
> On Mon, Aug 14, 2023 at 04:49:32PM +0200, Karol Herbst wrote:
> > We can't simply free the connector after calling drm_connector_init on =
it.
> > We need to clean up the drm side first.
> >
> > It might not fix all regressions from 2b5d1c29f6c4 ("drm/nouveau/disp:
> > PIOR DP uses GPIO for HPD, not PMGR AUX interrupts"), but at least it
> > fixes a memory corruption in error handling related to that commit.
> >
> > Link: https://lore.kernel.org/lkml/20230806213107.GFZNARG6moWpFuSJ9W@fa=
t_crate.local/
> > Fixes: 95983aea8003 ("drm/nouveau/disp: add connector class")
> > Signed-off-by: Karol Herbst <kherbst@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_connector.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
>
> This one ontop of -rc5 doesn't help, unfortunately.
>

Mind sharing your kernel logs with that patch applied? I suspect your
system boots up but you might just not have the connector available or
something? It could be that you have one of those GPUs affected by the
original change and then we'd have to figure out what to do with that.

> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
>

