Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3A29693CC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 08:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56A910E409;
	Tue,  3 Sep 2024 06:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UjT5dk/X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C3110E407;
 Tue,  3 Sep 2024 06:36:02 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e1ce8a675f7so1273729276.3; 
 Mon, 02 Sep 2024 23:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725345362; x=1725950162; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VPZudvRVHbus4LXrbfoMkcg6cOhLHcVHXr99PO6hzJo=;
 b=UjT5dk/XUWTYbInlIYAhL7pVrKsv1g/CazbEx6k/tEooQZd9ADxujDlCtpUWedyMDw
 PoJD68l2wSHf17yRbKbUBfReQJNxcHy5hLDGEvGvMFmxuZHypJSJ850gZ+r27Vv9TitO
 9/KuhxUzaeex1OzCqUarSgQA2Bd51ux7fxdH+ACJuoQMGORuJApr2UBlnEcrwcJGDqhn
 5/fZHASrnqJJMCQEZ/+0vaUqi8Fh4NxBnc6QCvYH3bITSxbSp1ws6wMy2lZ2IYgf6OIy
 qzGTwIM3MmVUwhbbQyNSJTwmZVTVL6s8mP6kN3Pz3If8fOQ8yqPHW3HwhZQYvLe6GMfc
 nDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725345362; x=1725950162;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VPZudvRVHbus4LXrbfoMkcg6cOhLHcVHXr99PO6hzJo=;
 b=rt3dSBBr4QKdEzwunsnAbOJTfwAAVdqGjF8oq2+BTPt7PsBy22Gq4eMJvooBzJIusm
 S/NpbR7micMS2E2BHUL4bTOOWm7x5obOAogqalN+es9OioCrPsc+7HeDc4jKfgPuR3Jf
 QQOOKNOo8DCCZTrXm0ZqHMcBg3cHJRyuKTqrjh33yU/v3qkZPt93b2HAQs8baJd23V4B
 qtJwcrkQ9F3X1rcgmsbdR+f6/H4dBvXr2re+kQkMrize4iPPPN5Ku+rcLe1/Exllf2c/
 402Etkwl37hgukB5xfiSMIMxOqcs2KBJk3zIm/0sYiivhjPfAkrzUdzYfE/drSzCJsTA
 NQ8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6+MmII1Qg2xxYX3PIQQUBod8jpGCViiMYhns2024WVu7Px30DAr3InjFUWaFL5OPjfbfP+BmSbVod@lists.freedesktop.org,
 AJvYcCVrgbigZrnMddJ1WpSPZ/XRXNOVlUjP4bK9TXWQ01mnXU7++1T7fJ++g7jDfWIHsiF3NKK6yXPy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzL6zA1vErc4kCB3dLC3OBO42sGNCYkBaMqymF7Zs0Dr51I3xOj
 cMq1uAkr9pq+wpUg8EEYzFLB5KCm/AJoD8hgrKqrdZS0FbuERXiLCF6CHBU4cZ++ly1xSyESK2Y
 lzYZwRS2Vms4ftVt/JyTniqWA88o=
X-Google-Smtp-Source: AGHT+IHR8tpiw3igY6qGfaRdI1dxqyE9jFzmjN8jYW30VTbpCYodS9kwBwFF3bZihMwsgZEMvLsrfMZBR6/T790BhzE=
X-Received: by 2002:a05:6902:2313:b0:e0b:ba20:7f87 with SMTP id
 3f1490d57ef6-e1a79ffa00amr10498144276.25.1725345361902; Mon, 02 Sep 2024
 23:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsNgx6gQCqBq-L2P15ydaN_66sM9CgGa9GQYNzQsaa6Dkg@mail.gmail.com>
 <CABXGCsNztS8MLteq5=fcddwuQ1TCzeOM8TdVtpJ3crK=sV5PTQ@mail.gmail.com>
In-Reply-To: <CABXGCsNztS8MLteq5=fcddwuQ1TCzeOM8TdVtpJ3crK=sV5PTQ@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 3 Sep 2024 11:35:51 +0500
Message-ID: <CABXGCsMdxHJ-MLkS0pm51Sk8g0PTghsuZxmowvj5t44bVN4ndA@mail.gmail.com>
Subject: Re: 6.11/regression/bisected - after commit 1b04dcca4fb1, launching
 some RenPy games causes computer hang
To: Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 zaeem.mohamed@amd.com, 
 pekka.paalanen@collabora.com, "Wheeler, Daniel" <daniel.wheeler@amd.com>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
 Linux regressions mailing list <regressions@lists.linux.dev>
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

On Sun, Aug 25, 2024 at 2:12=E2=80=AFAM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> Hi,
> Is anyone trying to look into it?
> I continue to reproduce this issue on fresh kernel builds 6.11-rc4+.
> In addition to the RenPy engine, the problem also reproduces on games
> from Ubisoft, such as Far Cry 4.
> A very important note that I missed in the first message.
> To reproduce the problem, you need to enable scaling in Gnome for
> HiDPI monitors.
> I am using 4K resolution with 200% of fractional scaling.

Sorry for persistence, but I'm afraid there's no time left to fix this
regression.
There's a week left until the release.
A month later, no one has looked at what the problem is.

--=20
Best Regards,
Mike Gavrilov.
