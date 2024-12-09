Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1CF9E97F3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 14:56:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D6C10E796;
	Mon,  9 Dec 2024 13:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZZj1zo/o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0F410E793
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 13:56:31 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3a7e108b491so35557995ab.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 05:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733752591; x=1734357391; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=20shHAH5rzhM5qlKS1vaW89uLmxf3J6zk8CxqaxVOi4=;
 b=ZZj1zo/oJPUnGSelGrdHzXxJI7FB6OnXwuKrAQ3u17hwBh+rbcavvZ5mXEca0DtEgT
 uPC9atcidQX+KMEi87+BdHCSL+s4NVsEVnNUcretV2pz/gQwAdnh2ywftdz+VGstCMzE
 z0wCPT3lw5uYAc57VmIGkADjs7LmjZPc8ZGjwa73NvH9PtwrHy3AYf7k6p8YjXtRRStS
 hNO70FQuoKn8N6KjldmlfmDBMiAFT6yIuA1n19agGysXwET8E+v1SImKzZBu4hChgVxH
 HyIXN7ACWOpjwHFS/xtf86LDtdmrz00oah985SemCWQWcF0X13zqwlylkUfVO4Ou5qs1
 zSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733752591; x=1734357391;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=20shHAH5rzhM5qlKS1vaW89uLmxf3J6zk8CxqaxVOi4=;
 b=S/Id8LELX4Hdlpf+mhBsf2mlvzjWWsvCiqnbtiSjoJodQ8OcDhBGMOlQgg+xE+4ELr
 vKCdTsLQFv8WXzgdPMwnrCHovaadrhKLyZ+Ykp+flOu7ppydSlsanU5ZeBLMZNmceDX6
 DjLolNr4ZsUY2kjY75kiyKkH8IXoUDitiHTp2q1E3xVYVilvKWU5I87l8teK8gYfL2Sq
 xWaLj4z5cz0XkdA0sGsI8TlwhczQDG6ARNK0teJOkmJxmYGm4ykfPIKBwxSZeuYFP09/
 qj5/kat0KYh8uMU9vfZBC2vea/C6u1FG1MAjEY/O10TfCobEDEGfyytGOEo4vClHNct8
 STrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvrFNKIpwvX9gAeMgpxcxarBMOcMhinDSurmgvRf+z0ly7lMlXZ+2D5l57CjCstTw7XECthVffAQY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYO+moqPHU2NmqHkPLqs52NUNLSNQ3EDTp6CD6AX+aYdYhtc4b
 jTuKcC2beSRtqO8fN4F+zGGVt4IJLGkdicCJbYoRf0/oWjE3oLqwDQtK8Jsv/wVCdj/U9Bi7RMu
 iNlKflctFJGVHSj3OnQKuQid37Gw=
X-Gm-Gg: ASbGncsU4PWIENTHWPfi2GOANRfaHdu0F1Ac5ZI+iDaXLYdvu2F+MpsrzIxptpBkDcS
 dKuWJPFDvpFMuuEjrTqCoAUgP6z8=
X-Google-Smtp-Source: AGHT+IECMwsss2FoZy9xBlkgCdMD3K+aFiFas1JeSPI3N6gfmsMB28SKRbBS6Drtula3ua1ptWvs5YbSz0qOTacUlW8=
X-Received: by 2002:a05:6e02:1746:b0:3a0:8c5f:90c0 with SMTP id
 e9e14a558f8ab-3a9dbac0662mr3847895ab.10.1733752590855; Mon, 09 Dec 2024
 05:56:30 -0800 (PST)
MIME-Version: 1.0
References: <20220621104617.8817-1-tzimmermann@suse.de>
 <CAEXMXLR55DziAMbv_+2hmLeH-jP96pmit6nhs6siB22cpQFr9w@mail.gmail.com>
 <d2562174-eebe-4462-9a9a-03936b3bcf89@leemhuis.info>
 <b4d28b98-a85c-4095-9c1b-8ebdfa13861c@suse.de>
 <CAEXMXLQEJPVPyqLpH6C7R6iqhhKBpdNS9QeESbEdcmxB70goSA@mail.gmail.com>
 <da4288a6-96cc-4095-bd73-d66b68e9ed01@suse.de>
 <CAEXMXLQw1yqUGbWcrKZdOuGvA4eZMG0utiyQ2PVRvTeuFedGbA@mail.gmail.com>
 <9c902ac0-a94d-4465-98ff-840132e482b1@suse.de>
 <CAEXMXLSLau0sEy8WSZ3=ofK97xP8aPcDQEnT=JFkkt7K=Rzivw@mail.gmail.com>
 <900b873f-6eba-4dba-b155-dc5f7594becf@suse.de>
In-Reply-To: <900b873f-6eba-4dba-b155-dc5f7594becf@suse.de>
From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Date: Mon, 9 Dec 2024 13:56:19 +0000
Message-ID: <CAEXMXLTT5m0Po_wz0ywRHFetV6e080AJwy8f99Zb9R_afzafRw@mail.gmail.com>
Subject: Re: drm/fbdev-dma: regression
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
 Linux kernel regressions list <regressions@lists.linux.dev>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 Linux Framebuffer <linux-fbdev@vger.kernel.org>
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

On Mon, Dec 9, 2024 at 1:43=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Thanks you so much for testing. I'll prepare a real patch. Can I add
> your Reported-by and Tested-by tags?

Reported-by: Nuno Gon=C3=A7alves <nunojpg@gmail.com>
Tested-by: Nuno Gon=C3=A7alves <nunojpg@gmail.com>

Thanks,
Nuno
