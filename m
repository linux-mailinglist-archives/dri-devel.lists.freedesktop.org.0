Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 726D6A881A0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54E710E5AF;
	Mon, 14 Apr 2025 13:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Et9HZZ2O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CD410E5AB;
 Mon, 14 Apr 2025 13:19:36 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-549903f3db9so481872e87.1; 
 Mon, 14 Apr 2025 06:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744636774; x=1745241574; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WEKfPQh4/nLUv6xkt0SWK20KEx+J0sdjsHi74ls1sMc=;
 b=Et9HZZ2OFtOpRKT5vD8cohzsEgq8QzZYD/XWCOif/8Y7cDSUndPrdeyH/h+hiEtsUz
 stR+ELls+SH3gSywAxqVbMREpEQ0xGgeeIxZiCv33CR4JI71umxxxjfAq1kiN0p6Fexq
 682BX6c9VBCOasPQAS3kkZxz/vVIO4YyV6CZJRpL23iq+PfN7eaIvFH8EapNACzAIOYt
 hIkE6JK5xAU5aefumgeAG8C+5L3FlWnSE2YaMGyTAz6KnqKu3X7J/Zw2ZMtzZXcDxyfB
 3Wzi4lu55om1tudrK3PVEvc0BZX/jXLw0Nwc4SDQ10/2x26d8uVTIewZJB8RiEBK2B7X
 u8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744636774; x=1745241574;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WEKfPQh4/nLUv6xkt0SWK20KEx+J0sdjsHi74ls1sMc=;
 b=SdJ9ZzmZa0e4d35+ELh35NsmfeptDXaRiuuV+/VqnkB/qFrd2Fqo3Gin4shgexCCUV
 WTAXkhb31MNdVJy1fTNCxVpdFiZo4vIGJ8jTi5ZLO+U7UxLum7hfzgoL22isyxz29bgp
 wmtaKPJEDPTnRzY5uixLdGviQ+lSvDN0XAmOGePE+Qc/+QgG/JD7G+QijOSyKwSu6GC4
 z1vNVmhd47E7MOL2uHIfNej6czRuJxKYWXXxpL69RG27q14qg8NkTxwsTKzjcCJ+/Pb0
 tsA4Sfkl191KPXTLikrAYvPiSqOz3RzHYNCVfXSPHSA/YBDnlKBz5s+4TNTE6y6AH76e
 5fTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdsxFN+5fCiQx5cDtCB0k8/TqLaueU2mFRQKfnnTXwozsxapJ3u04r+6hQ4wVMYP4br3YuKw==@lists.freedesktop.org,
 AJvYcCXv2vukpK4x+uxghSvGA+hx95GesGJgu8kUTp+XgtCwcdQOwYicMUUD9qVRhemq91DX/UudUZXK4g8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRnGEUtWwvjPXGSRLeZfleep7+wA6beTaVcaPAUxzK4nUrofRb
 OU5GhgVZ9ORZ/8ibltraFqioAuf6EzfLk3QR7H9CgOQFhc0s6CfloWP94LUjiJi8G1zUU50mLaq
 I1+dR4VEOPBntctkv8f8o06wMh2Y=
X-Gm-Gg: ASbGnctn4YVy4GBM1pchTp7SXlIKd2LSDW1/fhwq/rBmvFEla1fBguzggIIKE8/74oS
 tq2wfgSA12b/hLdVEzvkmnLQ0nogVcU+54I2nqYO0NUxg745xOCS8qh47MhUk9ByhQu9gY9rE3G
 w1n+f4lbOsadOrWPiIaONF
X-Google-Smtp-Source: AGHT+IGsswGyvuM6kUpmfmAY4TOczzo7G7ErXVYIN7TicY7hRyM6ISLnzJf1dkqB0v4kscGctaeJgQ5FEFPv7ILu8u8=
X-Received: by 2002:a05:6512:304e:b0:545:ece:82d5 with SMTP id
 2adb3069b0e04-54d46e762ecmr1015826e87.13.1744636774097; Mon, 14 Apr 2025
 06:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250408154637.1637082-1-nunes.erico@gmail.com>
 <20250408154637.1637082-2-nunes.erico@gmail.com>
 <CAKGbVbt-Cfp_D3WH3o1Y=UUQzf-sM0uikZXO1MFRxt2P72gjJg@mail.gmail.com>
 <e24e5e05-5ffd-440f-b9d9-8a0f792cc7c8@amd.com>
 <CAKGbVbthUxOxtZ+baT=vrNE1u6fzN48K1G5dtZBqfTBc7jEuYA@mail.gmail.com>
 <0f43ad99-27f6-4c1c-915f-2b7163195f07@amd.com>
In-Reply-To: <0f43ad99-27f6-4c1c-915f-2b7163195f07@amd.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Mon, 14 Apr 2025 15:19:21 +0200
X-Gm-Features: ATxdqUE2mBj0DNZ7ekenEG7KKtQjGr9Ng1tozhxHD_hUhoZrHDMYMEN9VsJM85s
Message-ID: <CAK4VdL38fkraY2sujHCVnuhLJ8pQ4f-MejUcfsFTbdxusys3Kg@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/lima: implement the file flush callback
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Qiang Yu <yuq825@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Apr 10, 2025 at 4:04=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 10.04.25 um 15:56 schrieb Qiang Yu:
> >>>> This prevents applications with multiple contexts from running into =
a
> >>>> race condition between running tasks and context destroy when
> >>>> terminating.
> >>>>
> > If implementing flush callback fix the problem, it must not be when SIG=
KILL.
>
> SIGKILL also calls flush (again eventually), but we can detect that in th=
e scheduler code.
>
> See the code and comment in drm_sched_entity_flush(). We could potentiall=
y improve the comment cause it's not 100% correct, but it should work under=
 all cases.
>
> > Could you describe the problem and how this fix solves it? As I don't u=
nderstand
> > how the above difference could fix a race bug.
>
> That was the point I wasn't sure about either. It should *not* fix any ra=
ce, it's just gives a nicer SIGKILL experience.

Thanks for this feedback. So as mentioned in the initial letter, I'm
also trying to understand if this is the correct fix.

This problem is unfortunately not trivial to reproduce, there is only
one application which can reproduce this so far and it is a
complicated one with multiple contexts and relatively lenghty jobs.
What I observed so far is that as it is right now, a context might be
destroyed while a job is running (e.g. by killing the application at
the right time), and a context destroy appears to release buffers that
are still being used by the running job which is what causes the read
faults.
This added flush made it so that the jobs always finish before the
context destroy gets called, which prevents the issue for this
application in my attempts. But I suppose it might also just be that
it had some more time to finish now. If this is not the correct fix
then there might be some more missing synchronization between running
job and context destroy in lima?

Thanks

Erico
