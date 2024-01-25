Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBFB83D4F9
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 09:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDAE10EC71;
	Fri, 26 Jan 2024 08:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8B510F946
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 17:24:47 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-5edfcba97e3so70751187b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 09:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706203427; x=1706808227; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I2gaRixdg+nmjTFS1tauOhVekYOprOLzO/cqNLoAsX8=;
 b=PcHWnWwlRYTd8UtfQD6oqDMkKdXAUFDi4n7wQvyordVKeBKRDTf/SxbPJxGL7NJWVX
 VbgxBgNVRlNniOH19xo7Dmwf5OSitCAWUNyrc64jsBywvDRvwWzf/ziEjF3dhjUuFVyJ
 ThAybeL7eghLWbQvvpffLNMr+ICmPHnli4y1cyiDVdPcXBqt9yQ8W7FHwa1qumojwb3n
 k/JKjoa2Cg0N/wYk2tWpojgkG5BGbVvJLjRGtSTloqFImPbPsQ0YyVBIzII8kvsQDnAY
 s9rVCP7fr1+98EAfw47f5DC/WLuneH5jf9uUVLFVP8RUMXOm3fN6h9h/6hgrfjuxLiWr
 xwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706203427; x=1706808227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I2gaRixdg+nmjTFS1tauOhVekYOprOLzO/cqNLoAsX8=;
 b=B0JBct8IyUdzW3Lp5l1YAUse4dRoyowZSiijIEReYWUF2VpvuRdMolVECJVYsiuMAD
 +sINXu/kUY3QGjKA7blw5XoKZSz+K00W1G7hDIiOfUtMfoC64iTFTOpbauGOsaJ0mpR3
 3BclvEkuxT8OQS8xs+Tc11ORPb03fvB2uqVqiBOyN4Hwy2GrylSTLXzSxLgYMCfPkHlV
 jtNYDURSypeg/9sSdR4E9IyStyku5D6yNna+xxhPDW7QA7tYHzTdXB6hym8onx3K+UVX
 CBOa0SgXEv8DOabFGJ7ApeRsus2c59Qka+psMHUteyq3MkOzEpFN985QWNC+ryF39sIH
 seZQ==
X-Gm-Message-State: AOJu0YzwKhfzzWHls+gYZaikAgQ9UIf3D4PuSLav8ZEbZask01xdlQFq
 PeD+9XUwdD8SbX15KNoivBCbV9HTmhWGTngIXHbs70ac1H2OwUUSsiFbyrmIAVVEhCABfEJhVFs
 sJXtEooTgF6mbREM2A5ZpOmM5DsM=
X-Google-Smtp-Source: AGHT+IGGZqfQkJAtoo57UVIKirfdFkN8DoTuxdZehgVFVYr45ju9Q5mL5tp54GNZvYJTnZFvSYKNWAuAQlMc8FBPOvg=
X-Received: by 2002:a81:b54f:0:b0:5ff:5d7e:54af with SMTP id
 c15-20020a81b54f000000b005ff5d7e54afmr114682ywk.105.1706203426764; Thu, 25
 Jan 2024 09:23:46 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9twKBmO2Svky-zeP+KS8qWHFj9zrgeBqW9y__tUwcAYZhw@mail.gmail.com>
 <2faccc1a-7fdd-499b-aa0a-bd54f4068f3e@suse.cz>
 <CAOVeLGRxXfs4wxSmB2ULZS72NvJkWQvZyPRz0rAmQyFtL39ekw@mail.gmail.com>
 <0a782904-bb19-4111-979a-31b52aa44ca9@suse.cz>
 <a51ddb8c-cf11-4394-a2fe-ca855749ff02@amd.com>
 <e7eb12a9-67ed-45b1-aaf6-e1df52a247bd@leemhuis.info>
 <05ddb2da-b182-4791-8ef7-82179fd159a8@amd.com>
 <54efe4c8-38d8-4a5f-ac7a-aeb7a4e3535f@amd.com>
In-Reply-To: <54efe4c8-38d8-4a5f-ac7a-aeb7a4e3535f@amd.com>
From: Donald Carr <sirspudd@gmail.com>
Date: Thu, 25 Jan 2024 09:23:34 -0800
Message-ID: <CAOVeLGRiCZ9KBmsFY5NfGABUcw1CQoEcSKE1k0zv_6Aicdusbg@mail.gmail.com>
Subject: Re: [git pull] drm for 6.8
To: Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 26 Jan 2024 08:54:17 +0000
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Dave Airlie <airlied@gmail.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 10:23=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> The test patch [1] posted to [2] works for me.  I expect that Matthew
> will post it to dri-devel and this can catch RC2 or RC3.

> [1]
> https://gitlab.freedesktop.org/drm/amd/uploads/ca8dfaa22d6f5d247c28acf6cf=
3eafd2/0001-Drain-all-entities-in-DRM-run-jon-worker.patch
> [2] https://gitlab.freedesktop.org/drm/amd/-/issues/3124

I can also confirm the attached patch has resolved my woes; thank you
peeps for the quick turn around time.

Yours sincerely,
Donald
