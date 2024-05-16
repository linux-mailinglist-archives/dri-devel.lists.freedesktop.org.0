Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE76A8C78B4
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 16:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D615B10ED54;
	Thu, 16 May 2024 14:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ah1sau1D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B546C10ED51
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 14:53:07 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2b4a7671abaso249640a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 07:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715871187; x=1716475987; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dUyghCSA86JCJUjTIRWrRMCDSBYGrYg60pEG7wpOTdM=;
 b=ah1sau1DEfnL6uRWHCoCyyXyAZsowJf7aPILJ62rOAjxJ5xALvpC6l7yDsovPMZtrs
 RbYIH2M5kuqYiXHttLpnsZhweMg1BF1RjckPLK9+vKjx9Ae90tH60NveFiA7Am+kg/CW
 kXKMjbSZT66thqI/XTYF9DbsxYmgkAsmY5BegW6bozWZltr3RqyG3WnutcuptZjOhTRL
 ED3aUl2Q7iVT1rsb66Ci0WvrzaIYb0CTQkZU7B+K4GrHab+xCqyEl0nBfFHBYUTchfQD
 e33UfYK0zNkunFU3Elx09zagp2CpkNhDpdZ/puUJrnj+Vy610oDmstBVB+6eopZ9T2Zj
 PMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715871187; x=1716475987;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dUyghCSA86JCJUjTIRWrRMCDSBYGrYg60pEG7wpOTdM=;
 b=rzc4Kdh6CWQT7vUnyOZG5UDCFZA8VV/RFG5dAg+cdhuwaOkwJ3EBvWeavwySf8LYEd
 zzVu57T9p+mX9sn41x3DRR8yBaqCGPj2adAn4MFTN7C1wsX5SKsdHxWRSFL1249PuiCa
 OROMc2Cf5CxNIQno7HGtLKaJi62UYTXlalJGxZwsz8GId/JIzsjG+AuWou3eskufQQ0E
 TkIRnavMG7MhN3Bw9MD2D5nGzv+taKN12lvlzYvoxfJQliLsqBxhY9YsuYypIa+aQusp
 8MsDZpyf14B8J78vrt6Nau8ZreOFGihpMNa43of3eRsatsODj7laQiWBi1AZGV418ka3
 S/sw==
X-Gm-Message-State: AOJu0YyLu6D408aTICEvY9GxvM4uGNdpNKC/szhC3KzfVvFv2jb5dskC
 ftnmRIKT2kNoR6CYLL38V6ErUe7eH+odaP0xpX+kh47lEl/oMq22rZdJUDmnKXCSxAX8wxuNa1l
 aEKsoqlzQNnrMRfnq4tC+3g4SpW4=
X-Google-Smtp-Source: AGHT+IGFTkM9Lzj75Ywws6VN95Hoa6c1ZFrcOUBC41+DMbEKGV3x5T90WhLWT9bOEKw4FtyI5mt3Je43tstmYEdT4ac=
X-Received: by 2002:a17:90a:4087:b0:2b4:e4d2:b719 with SMTP id
 98e67ed59e1d1-2b6cc758cb1mr17002395a91.16.1715871187088; Thu, 16 May 2024
 07:53:07 -0700 (PDT)
MIME-Version: 1.0
References: <CABQX2QMVfsZZrHLktZ=MhJ5gG1ATRuSGa+E-CKfXATgU5BwMwQ@mail.gmail.com>
 <CAE4jU7geruhw=+e8yg4_CFZ=-OssDnt=kHdJvhPUDB=-q660wg@mail.gmail.com>
In-Reply-To: <CAE4jU7geruhw=+e8yg4_CFZ=-OssDnt=kHdJvhPUDB=-q660wg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 May 2024 10:52:55 -0400
Message-ID: <CADnq5_OXmYUHTxjzwvQ=kJydaCzqYu88Td8CiTPPM07Jr8d1Uw@mail.gmail.com>
Subject: Re: Issues with mid-command buffer preemption
To: Gregory Carter <gjcarter2@gmail.com>
Cc: dri-devel@lists.freedesktop.org
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

On Thu, May 16, 2024 at 4:12=E2=80=AFAM Gregory Carter <gjcarter2@gmail.com=
> wrote:
>
> This problem on this particular machine can be avoided by using the kerne=
l command line option amdgpu.mcbp=3D0

Something else must be going on.  mcbp is disabled by default except
for SR-IOV virtual functions.

Alex
