Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABCCACD842
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 09:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B2010E218;
	Wed,  4 Jun 2025 07:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TP0jMHbd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E773110E07F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 05:57:23 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-401e77e5443so3592967b6e.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 22:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749016643; x=1749621443; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=n00dA83j8zoli0JG0tl9WM/JPyLOWHYDjwi4VyFdj2c=;
 b=TP0jMHbd7I//kERtW0Sanow8558uCPd6ELYsiTezaRtstqjU/7i6RrEibOJQgtiskg
 SUX4YxUW1kr8Cebt5m0iXucDXkNGM5yzCQqpbCVTQjPX7BM7nABALJUiiWIuv2Af8IO6
 x0OZd5qc3z+SYMIJoY64MJ19BuxNdm3+FEaWLrlVVlYepCAlzZh18CyuXVz7kW1VLocz
 As+vXBpOrFV4dooeIWBwugrNsw8UfoOv8WE1ClY+BjUWi4dBWxXNckP5tkIbW0bcEi0B
 /JAo4p6Uj9zj/BtvdP/upXuEtMuPMkv0yJU6kmvTgiYuDv2HUan8EEtq7c2yI+4N0ZZ8
 fuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749016643; x=1749621443;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n00dA83j8zoli0JG0tl9WM/JPyLOWHYDjwi4VyFdj2c=;
 b=Y+yzTbQF7Ni4XM4qu7vSejWthplGTBUte/6BP8gSyL504uuywpKkLmOR+n8MsXMaAS
 bcoWymmSgyuBQnBWSthHDVW37SyKnWAA3A8uS8hbUKD68Hm04+Z5audayBZOc56FDS2h
 ALz9PRyKVwckbO0ekjn6GCN1GRk7cdLSGKO/BpA2JMhKzv5GmgHkQZFT8keJN3M1Vh/H
 Y4TdRlL97THAbNwr1dg1UTUSzDg73uPQ46DSYIimk/W1Iy1Fc/Low/W8lP9jOecjQLV6
 6Q62oV/4d0/+mivWEQrPRE7vucLvY1/R8HaR/+QJl5tQaxLbrgOJZIjk/XxwssVVgyQT
 7X3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhzj6ugMe+4TF6QLiKzW57Lnif+cLvzjX5xwGbRodqgWQe5uFZcALyK7hMu/xbRdBCCxzEBuMcHoY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZbhZj2PErTpE6rm/6NZNx1dCktsTK2toBAalqBP0QXfEXpOBJ
 KnjwryO5YQOhwgDVEs6HnwFKCpTR+HLJ/5Qt8on5JaAL+lLa2Xr1eI7MDAAwpoqc1OGs3BO+aVq
 Rtu9lfRqo4BLHJd1iZdt9aMJTumIh46c=
X-Gm-Gg: ASbGncsY2XoKYDVtFmbqy/X+jYsf9PRFL8AgREeyA8JUqcgVCgjTDBatUmhx1RQS4B5
 q9VgrErtIjLHij9JWcWfvRfT9lH7XwgjYOBHf9t+cqArJI4fj/5GhtlDhuvCw8SftBkalljoWUr
 T8DkhcESfscIiMVE/JAQrac/mFRedXO0lCPqnidoSdsKWQrY6v3D2gDQPCPE39BBXRIVA=
X-Google-Smtp-Source: AGHT+IF+gPj1zQ5wjEGeF9HTFpt3THF2EZ8texGxUSlFbIl+o8zSsDUUSTUi+UmB1BTEwzKgOBssI1nQJKXnbAQLLaM=
X-Received: by 2002:a05:6808:6a97:b0:3fe:af0b:22f7 with SMTP id
 5614622812f47-408f0ec157dmr1442659b6e.11.1749016643054; Tue, 03 Jun 2025
 22:57:23 -0700 (PDT)
MIME-Version: 1.0
From: Sha beer <sha989531@gmail.com>
Date: Wed, 4 Jun 2025 11:27:10 +0530
X-Gm-Features: AX0GCFtAO30dzTMFJoPjev_WVhnX7FVLp7U3q555IladaK2H2TICS5pjkBmxPDk
Message-ID: <CAHErRUfqpU0TyqO_2tG9ZRT=x9nURwoC2FGwaUbk3WYC6ZaVbA@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in drm_gem_object_release
To: gregkh@linuxfoundation.org
Cc: airlied@linux.ie, butterflyhuangxx@gmail.com, chris@chris-wilson.co.uk, 
 dri-devel@lists.freedesktop.org, emil.velikov@collabora.com, 
 robdclark@chromium.org, sam@ravnborg.org, seanpaul@chromium.org, 
 security@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: multipart/alternative; boundary="000000000000b72f800636b8ab3d"
X-Mailman-Approved-At: Wed, 04 Jun 2025 07:11:31 +0000
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

--000000000000b72f800636b8ab3d
Content-Type: text/plain; charset="UTF-8"



--000000000000b72f800636b8ab3d
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--000000000000b72f800636b8ab3d--
