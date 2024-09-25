Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD1E986623
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 20:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C215510E131;
	Wed, 25 Sep 2024 18:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="W3q0BoFa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDE010E2F3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 18:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727288023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9ajmmr6XMjVjBJtF0Yo2GlyD0kiwIhRSnbtBKem+rA=;
 b=W3q0BoFam+w9tXEm+zWv3rfgQEyCdBhcekV4PooWCE+0Fo4ZvCB/y3fIdYcaL1aglrU1U0
 5wjIjx/IE4Ihp+hc6el81Xp+3LwI0fnRHIj77SAd5cZgCZ1NAXpDd9Wb9YRgYf2qUS/9d1
 J4GYjA92eHj0C6hdHcIHk60GDL1hAYk=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-0TaJJK5ZPX68BqPk_r0LDw-1; Wed, 25 Sep 2024 14:13:41 -0400
X-MC-Unique: 0TaJJK5ZPX68BqPk_r0LDw-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-6e22f0be237so3221627b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 11:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727288021; x=1727892821;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l9ajmmr6XMjVjBJtF0Yo2GlyD0kiwIhRSnbtBKem+rA=;
 b=Uayn8kqUbd1fKHna2E22KkUclWh9l+lVI+8C7Q+SY5Qh9clSoAOYB8Rct7/Jo+b8qZ
 qbFIENMEOkgQYcYQwxxWuiVzs3ijcj5vl3HMwo5uud/5iSlfufRBIGaptdY2z0MqoZUw
 hrABlea9p3OIr1Jf3uAclGzt3lzBtOGMAwSvS4JEE0OFrwxrGMMeM/knY++/78yuLg4O
 KXpmBaqSy/fYwNOd3XFsG1YE2qgopOEzxBfy0ag9oapXeJ/Bi49jU3j2uf2ror3FkPFB
 2Yg4Cd7qKkdWfms/w2JPN4P77BloSfOrOdPsXLaENnJbcB9rJ5pXbqdYYLGaMZgaTbx1
 19Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIr/92n7W/EETeOGCpTVA6DXHEfMwnu/MS9ar8TOjXFwVEXXN54PLcKdjfLmdHXVojP3sCGr2LdU0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyB4rqH31+hXHFtZMgPurHltTPKcOnHdb8XqQtV61xxnvHazxhD
 liq7Y9MAHH8YV66DnGh4CbMdMmq+1xUb/m657rw/Y5rLKPyEdLvzo+A2fhV/Iui5srh62teS3k4
 BmCnx/ls2SMBB1WsolztlfhG+ASl3fR38SxqikQneaZd7DM8keYVu/DZFx+J3lhJAFhednFwn/T
 P67VBDNPL343nG0Efp1h8o86UTvGEtzRGReOllsmQZ
X-Received: by 2002:a05:690c:64c3:b0:6ad:f6ae:7685 with SMTP id
 00721157ae682-6e21d838678mr34530127b3.20.1727288021383; 
 Wed, 25 Sep 2024 11:13:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3dklGZZYoRlZu5kkgzc2LFblYFn21ln7HRQP0rqBowfCP/18/rjMGTRzXCUEQmLf+LbZHcJCboLxJHRn5o3I=
X-Received: by 2002:a05:690c:64c3:b0:6ad:f6ae:7685 with SMTP id
 00721157ae682-6e21d838678mr34529767b3.20.1727288021053; Wed, 25 Sep 2024
 11:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240919165641.4632-1-user@am64> <20240924020824.6264-1-user@am64>
 <8eb45005-c6fb-4baa-a44a-243958a3a1ba@suse.de>
 <c960dc48-0a05-4cad-b86b-33ad59923bc3@suse.de>
 <CADnq5_OtdUvOUPpq1aUoxtgpt6a4h598019SNhe+9ZWUaANYqg@mail.gmail.com>
 <CAGtn9rmUfHHOGX-_7ZNUpJMjBkCOMaAuGQsJnpSrfjMfmK1xSQ@mail.gmail.com>
In-Reply-To: <CAGtn9rmUfHHOGX-_7ZNUpJMjBkCOMaAuGQsJnpSrfjMfmK1xSQ@mail.gmail.com>
From: Ewan Milne <emilne@redhat.com>
Date: Wed, 25 Sep 2024 14:13:29 -0400
Message-ID: <CAGtn9rnd1L7PbWs6K6vtB2hC_vX3qC3XNudJSt=X+VNd7q7-kQ@mail.gmail.com>
Subject: Re: radeon ARUBA NULL pointer dereference
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Arthur Marsh <arthur.marsh@internode.on.net>, 
 Xinhui.Pan@amd.com, airlied@gmail.com, alexander.deucher@amd.com, 
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 wuhoipok@gmail.com, iommu@lists.linux.dev, 
 "the arch/x86 maintainers" <x86@kernel.org>,
 Nilesh Javali <njavali@marvell.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Follow-up, qla2xxx appears to be fixed, most recent test was with:

commit 684a64bf32b6e488004e0ad7f0d7e922798f65b6 (HEAD -> master,
origin/master, origin/HEAD)
Merge: f7fccaa77271 68898131d2df
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue Sep 24 15:44:18 2024 -0700

    Merge tag 'nfs-for-6.12-1' of
git://git.linux-nfs.org/projects/anna/linux-nfs

I suppose the most likely fix was probably this one but I do not have
the HW to verify
(report I got was on an AMD EPYC 7262):

commit b348b6d17fd1d5d89b86db602f02bea54a754bd8
Author: Leon Romanovsky <leon@kernel.org>
Date:   Sun Sep 22 21:09:48 2024 +0300

    dma-mapping: report unlimited DMA addressing in IOMMU DMA path

-Ewan

On Tue, Sep 24, 2024 at 3:30=E2=80=AFPM Ewan Milne <emilne@redhat.com> wrot=
e:
>
> I think we are seeing a similar problem w/qla2xxx panicing at boot:
>

