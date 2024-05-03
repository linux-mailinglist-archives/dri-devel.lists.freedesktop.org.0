Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7068BADDB
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 15:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F79911210F;
	Fri,  3 May 2024 13:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iOrui6va";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222B2112110;
 Fri,  3 May 2024 13:39:44 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2a2da57ab3aso7506379a91.3; 
 Fri, 03 May 2024 06:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714743583; x=1715348383; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KFUZpLigbxPDxoO9afybKr4idSG4eeQ8ER4FtTi6kBk=;
 b=iOrui6vawaLa29TOOuciPgAE6nyMOw63IlJWyN/STP+A6V/kapvCTaBsP32Qz88GJN
 ckXGlRbfL5wITmdcCNyTJAVC2NtKlmW8zb/cs2i6zU1eoec1gfUyUtJFfat0uM2OU7Zi
 wNCFd3lQG0bgVpymVgm7BGloQ32NBF0ynuRoI4MT56fx6UBJ3Iu55zEpX6McqCgyk0kv
 j/GwIn0WZHVybB5NxfGzCKSX7cGg2l2q5hhtjXgKaO+oWF5tzy/XMj6UUtPVa0EJFCG/
 EIqZtyyK+KkUYWhp0yxB1mSTP5PZYaKUli5rTiDrA7+w3cRsS5THdzfP4IFjMv+eESvn
 vjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714743583; x=1715348383;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KFUZpLigbxPDxoO9afybKr4idSG4eeQ8ER4FtTi6kBk=;
 b=LAITppfOI1Uge3OVqvyz2A4tYrLXoobk1jvn2Iyha+3Ou60D2wzRydcBbELgnNnsLk
 k22N25A8yBmvarT4PNzs/7p6ZYXArhs5qa6ijZqJKBrzETKeE1NyQJulUjdIaNt7VUd/
 HTooQWxe/Td6QnBwaP7j2aVNEedHTTQQMlx0OYaioNTwK+sMf1+Bnu2UyP+Krn4LBQJz
 hANRAsc/8O8qH64L0iVUDj7/S+0LYdSsoPX6L1lKK0z5g+Q/o7jJsFfwNStoWLYGr4RC
 HN27fF50USVsn2OACaMCI7ibe3MblZrorE2vYn4MEQ1X3M84Nin1k5yZEhWkm1pzNC9S
 h/vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQb5+dqP4vyGKfLELysBYSsNVewlqwI1iom6hl7ERBgElI8YkMHUdYOpjWRPGL4FLyovD89BqLGnquzvQjxvAtoe5xgBLAdnzbgfkyeKW2N4jS1b/JaRTL/Cqsvl5+SSBON8D7Vlkq7diPixBGfQ==
X-Gm-Message-State: AOJu0YxZ/PBGD2wQLMkjijCxqqhC52Id7wCw+EETcXYkH9Y+CgG8RPIm
 jDILpl6959LFF/EUU8gjoWuHJ/CoFYmc1qgj5WiVVl9lnNT3tHCdCxOOj/zkKodtWXG4iTFbmbm
 0bGCgYRC5sORXmfLOz1Bxp3Q4UAk=
X-Google-Smtp-Source: AGHT+IFWncu2McAYd+eBj3RoIX/MWrfmT65dk0e1oIGXXWE36iwlRwLW+1EhwyVf1pawx+MJdtFXg+SmAjGSVNdD5lI=
X-Received: by 2002:a17:90a:eb0e:b0:2ac:8366:8ab4 with SMTP id
 j14-20020a17090aeb0e00b002ac83668ab4mr2995873pjz.38.1714743583336; Fri, 03
 May 2024 06:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240503123657.9441-1-tursulin@igalia.com>
 <736ba0a2-035b-4727-bbcc-437029420377@igalia.com>
 <2cdee989-f48d-4923-b12a-f09a1cc2b34d@igalia.com>
In-Reply-To: <2cdee989-f48d-4923-b12a-f09a1cc2b34d@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 3 May 2024 09:39:31 -0400
Message-ID: <CADnq5_NAO_Ao0EJTO=MJxvR-KJkF1WCwKGV-9ami7qQdzf029w@mail.gmail.com>
Subject: Re: [PATCH] Documentation/gpu: Document the situation with
 unqualified drm-memory-
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org, 
 kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>, 
 Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Fri, May 3, 2024 at 8:58=E2=80=AFAM Tvrtko Ursulin <tvrtko.ursulin@igali=
a.com> wrote:
>
>
> [And I forgot dri-devel.. doing well!]
>
> On 03/05/2024 13:40, Tvrtko Ursulin wrote:
> >
> > [Correcting Christian's email]
> >
> > On 03/05/2024 13:36, Tvrtko Ursulin wrote:
> >> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >>
> >> Currently it is not well defined what is drm-memory- compared to other
> >> categories.
> >>
> >> In practice the only driver which emits these keys is amdgpu and in th=
em
> >> exposes the total memory use (including shared).
> >>
> >> Document that drm-memory- and drm-total-memory- are aliases to prevent
> >> any
> >> confusion in the future.
> >>
> >> While at it also clarify that the reserved sub-string 'memory' refers =
to
> >> the memory region component.
> >>
> >> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >> Cc: Alex Deucher <alexander.deucher@amd.com>
> >> Cc: Christian K=C3=B6nig <christian.keonig@amd.com>
> >
> > Mea culpa, I copied the mistake from
> > 77d17c4cd0bf52eacfad88e63e8932eb45d643c5. :)
> >

I'm not following.  What is the mistake from that commit?

> > Regards,
> >
> > Tvrtko
> >
> >> Cc: Rob Clark <robdclark@chromium.org>
> >> ---
> >>   Documentation/gpu/drm-usage-stats.rst | 10 +++++++++-
> >>   1 file changed, 9 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/gpu/drm-usage-stats.rst
> >> b/Documentation/gpu/drm-usage-stats.rst
> >> index 6dc299343b48..ef5c0a0aa477 100644
> >> --- a/Documentation/gpu/drm-usage-stats.rst
> >> +++ b/Documentation/gpu/drm-usage-stats.rst
> >> @@ -128,7 +128,9 @@ Memory
> >>   Each possible memory type which can be used to store buffer objects
> >> by the
> >>   GPU in question shall be given a stable and unique name to be
> >> returned as the
> >> -string here.  The name "memory" is reserved to refer to normal system
> >> memory.
> >> +string here.
> >> +
> >> +The region name "memory" is reserved to refer to normal system memory=
.

Is this supposed to mean drm-memory-memory?  That was my impression,
but that seems sort of weird.  Maybe we should just drop that
sentence.

Alex

> >>   Value shall reflect the amount of storage currently consumed by the
> >> buffer
> >>   objects belong to this client, in the respective memory region.
> >> @@ -136,6 +138,9 @@ objects belong to this client, in the respective
> >> memory region.
> >>   Default unit shall be bytes with optional unit specifiers of 'KiB'
> >> or 'MiB'
> >>   indicating kibi- or mebi-bytes.
> >> +This is an alias for drm-total-<region> and only one of the two
> >> should be
> >> +present.
> >> +
> >>   - drm-shared-<region>: <uint> [KiB|MiB]
> >>   The total size of buffers that are shared with another file (e.g.,
> >> have more
> >> @@ -145,6 +150,9 @@ than a single handle).
> >>   The total size of buffers that including shared and private memory.
> >> +This is an alias for drm-memory-<region> and only one of the two
> >> should be
> >> +present.
> >> +
> >>   - drm-resident-<region>: <uint> [KiB|MiB]
> >>   The total size of buffers that are resident in the specified region.
