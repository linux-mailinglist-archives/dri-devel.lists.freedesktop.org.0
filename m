Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE6B612D3A
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 23:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA9610E031;
	Sun, 30 Oct 2022 22:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C61E10E031;
 Sun, 30 Oct 2022 22:05:17 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id i12so7422806qvs.2;
 Sun, 30 Oct 2022 15:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f9hB5rxf2lQLgckJttK0ClN8TMoVNxkXM2HKpZa8Agc=;
 b=a0gOZaVtXsTqqvaknXuDyBGYtQ6vHGoInWhHeKzJeoOi/Ai0HSf1WstuCPDZMl4w2T
 lYqTptzjjPX8Z+iytIV5TfHJ4GQTKDQLJ5VNYYJ5yZ6jra0TVCfa63ZGgsvdv5rjZPwD
 TaniurNPRZnJDqvQWUumfYMerR9S8gYB2gGIk189avVar+bQZIu16vX6JP7YuDkKcogW
 Zu6Eb5NQe8RdpufxqhkYmn6eCJU4U7ebhwzaueFyH4+DVPMEss2fUgO2UHDeWUdlFlFI
 WqvYj7RDHyR8OQOAb206gOO/Q3g05SnhW6ApTZZFg3Auk5+vtszduXVJacd978WwMx4N
 6LIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f9hB5rxf2lQLgckJttK0ClN8TMoVNxkXM2HKpZa8Agc=;
 b=NQ0bTtINr6QtNOK5n8ovRo/z4HJeDnBM53moKhoBZKZayvXVoUjjlndo21hrzl6t5e
 QHpfwnTnsmXuaL5Owdq2UmgO/MSMboZnZ/lVygpQtekmkfyqJLTyz9qFS+RWXt1AhcbK
 Sbp6gZXYo2SsiUpcOKk8F+JRLTi2RrODr86NluiFnXJHGG0W2ksgwx26aWcny5mpElhA
 6iWLaU3tNKmGGs+2fWNuFxglUMXnwQurlhE9CeEASE+6snzyGiXRB+C2HJr4iZWISG9O
 YIK/hmExNYFCQbaV2dCqE6fJNzjtGXC9Caq8SNyIvbsZsPkiCd4DEuSZqGUZtz9aHbVI
 CrEg==
X-Gm-Message-State: ACrzQf0ZdxMWxm6974/S9JfADhBWLBA02yUdcIqFkH1pRhmixRkM42Gt
 qXbIFZWp++uSqxlt4Iz3de7FrX0aQRsQ1TdC3QM=
X-Google-Smtp-Source: AMsMyM5YNaLkscCq3Gr169fMozeu918Uutqne2IPuGlkXDLIl8zyqKHeIUbjJpddfiIudrdL/Unrg43psBp74IXNSAc=
X-Received: by 2002:a05:6214:1c85:b0:4af:86a1:9983 with SMTP id
 ib5-20020a0562141c8500b004af86a19983mr8243490qvb.35.1667167516099; Sun, 30
 Oct 2022 15:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsOeQ7VYm98jRVaYp6KaNsFVsAnSb33ZT8JvZxcTcEGW0w@mail.gmail.com>
 <a67598e8-c826-2740-03bb-33d37c8c8e4b@amd.com>
 <CABXGCsNvFvJz4=N=JKYSGVcd=dKfQ3Nv_zOssMb0Z6oK79xZ7g@mail.gmail.com>
 <a537212d-4b42-4ba4-7707-1e397234c8b7@amd.com>
In-Reply-To: <a537212d-4b42-4ba4-7707-1e397234c8b7@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Mon, 31 Oct 2022 03:05:05 +0500
Message-ID: <CABXGCsMCfACsJRDPqZDYQGMpaA_6LKhQ0XqAmDN04GSMeetXnA@mail.gmail.com>
Subject: Re: [6.1][regression] after commit
 dd80d9c8eecac8c516da5b240d01a35660ba6cb6
 some games (Cyberpunk 2077, Forza Horizon 4/5) hang at start
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 26, 2022 at 12:29 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Attached is the original test patch rebased on current amd-staging-drm-ne=
xt.
>
> Can you test if this is enough to make sure that the games start without
> crashing by fetching the userptrs?

1. Over the past week the list of games affected by this issue updated
with new games: The Outlast Trials, Gotham Knights, Sackboy: A Big
Adventure.

2. I tested the patch and it really solves the problem with the launch
of all the listed games and does not create new problems.

3. The only thing I noticed is that in the game Sackboy: A Big
Adventure, when using the kernel built from the commit
b229b6ca5abbd63ff40c1396095b1b36b18139c3 + the attached patch, I can=E2=80=
=99t
connect to friend coop session due to the steam client hangs. The
kernel built from commit 736ec9fadd7a1fde8480df7e5cfac465c07ff6f3
(this is the commit prior to dd80d9c8eecac8c516da5b240d01a35660ba6cb6)
free of this problem.

I need to spend some more time to find the commit after which leads to
hanging [3] the steam client.

Thanks.

--=20
Best Regards,
Mike Gavrilov.
