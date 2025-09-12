Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F70CB54EBD
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 15:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1367110E242;
	Fri, 12 Sep 2025 13:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DJTicBXg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1832210E1C7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 13:06:19 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-323266cd073so184788a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 06:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757682378; x=1758287178; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ckr1nOupG/FHOX87n/x1D8vzmImJQCNO14BvHg2YgKk=;
 b=DJTicBXgUH25m/7/MIxdE90DAmrrZMayG8Dc1oCI2pdbloVZGU6mKnh2W0tdH0XDsZ
 xX93GTxrENlwlKXCsMvuN9kVmWYfLwsZUMdP5nhIjBNIcyksXvZraxbhHQDsmzKCsRlE
 5oOSt++MxM6lUfHzRunHyopvOC8GPQzuTACT8DhkLX64DMpJn9mebqP6wBH6focCYAkx
 LKz50l2riVp4sqr/z0J4rqhw7zx73ANbTPP6NnwJ/AwhGzSdkax51cVotm1tfs4ihCVW
 gNTtC+0raf/Ynv2lJ81QXkPEmwSzJYRF80RW9YGrFpA6oworpzJdIDF0uLj+XC4sJ/R3
 pVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757682378; x=1758287178;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ckr1nOupG/FHOX87n/x1D8vzmImJQCNO14BvHg2YgKk=;
 b=rKbqZx9YSle2O9dDxfD5lZxWAGQQxjQx2RwWYTt2WCcr2lQIOGTJMd2GqUy+0cbPfw
 iZpHMQ/FnL6HPzXBc3uPoNuGQsS9Zc0xFKlTBPd+vNWBx+EYyeLn4Ujk9dWYPFKwIrgd
 yXpQopBfXm+XFPH8Lt0igsV8nqOTl8fMt88eASovuMbecJ0f5Ahbpu65ZxTL4xb2q5Ue
 JAlW3gjYOWc/YCxDyEIHrYya/zkbBO1TRGeZom7xs4P7ttcTqgX+E5w9JdnXhpdJoa7L
 /4M45bbXY/SpkRQQKIG0t6bEq19iFI1sZ1HmzSZKLY/e4u7JL4z9UiMXTsVmf/Ymnl0U
 hprw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0XVNgFYy5EbexkhIM61oq6AxfuV/h/Bn+s2fVqhuY9CBjsiX2ZgbhsBquie/83Gt0IMg07GnMncY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/D/efapBykAhH1DizYxD3FCaCqHENVv5/7Rns8sBIOGtED4PM
 H2vxhmpXYZ0D2mni8Vagxxeiy+JdkO8CKOki9r1J7Kp2i60NWzKies4W43WcNPUV53OGFz50NAT
 4rjojgnh9r8ZZUZN+atxFSZg5pEimTWs=
X-Gm-Gg: ASbGncvIqy8JYfI1vxbrq7oTReOY61iVNR7cgs0nSOP5UVq/h5M3XahH3buQLSmH3nV
 zxcZGucHkB2TcKySC30aRCW14gqB1wN/gGchfcY/oCqhxAFdrirUT0RiB0ibYEWGqBCkZEQstxp
 lpIDcb4gen50wkRRzcQvLQsPhuSqJq63P0u/nJ7CRVRlRtORdlpP5sSqKWdcdMUNqsmYOHVNSnX
 0MI9KHNpQf5SsvZZg==
X-Google-Smtp-Source: AGHT+IGTTvtC1IuLrcY8b4AvWUeugef+D6CmgxiovRG+v0ayfpqmLzCTs+HKBKHE/plPyLUKu92jZlW/yTLM+LNCrgY=
X-Received: by 2002:a17:90b:3b84:b0:32b:bc5c:85b2 with SMTP id
 98e67ed59e1d1-32de4e69e6emr2013081a91.2.1757682378471; Fri, 12 Sep 2025
 06:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250909151146.760450-2-thorsten.blum@linux.dev>
 <CADnq5_MFDZdJg3XFFw9+tWB=_LP47PwE3HXgPK=sryOx+_0wGQ@mail.gmail.com>
 <FED6FFD1-2C51-45F4-BF34-76484C415C83@linux.dev>
In-Reply-To: <FED6FFD1-2C51-45F4-BF34-76484C415C83@linux.dev>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 12 Sep 2025 09:06:07 -0400
X-Gm-Features: Ac12FXwJwCDZ_BVgzYuq56yoU1VX5uqBys40Ob0J7ZAD0NdiVqJ_P3OSul7PJJI
Message-ID: <CADnq5_NXCEFH6V_m0nvEqHU6tOhjUZ-ExSRb93Hi=7qxDAo6Vg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Replace kmalloc + copy_from_user with
 memdup_user
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Fri, Sep 12, 2025 at 8:48=E2=80=AFAM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:
>
> Hi Alex,
>
> On 9. Sep 2025, at 17:35, Alex Deucher wrote:
> > Applied.  Thanks!
> >
> > On Tue, Sep 9, 2025 at 11:29=E2=80=AFAM Thorsten Blum <thorsten.blum@li=
nux.dev> wrote:
> >>
> >> Replace kmalloc() followed by copy_from_user() with memdup_user() to
> >> improve and simplify kfd_criu_restore_queue().
> >>
> >> No functional changes intended.
> >>
> >> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> >> ---
>
> I just learned that calling kfree() on an error pointer doesn't work, so
> this patch should probably be reverted/not applied.

Thanks for the heads up.

Alex
