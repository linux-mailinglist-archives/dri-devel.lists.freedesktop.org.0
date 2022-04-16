Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 428725037A9
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 18:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFC410E1B4;
	Sat, 16 Apr 2022 16:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CDB10E05D;
 Sat, 16 Apr 2022 16:58:53 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so14045580pjn.3; 
 Sat, 16 Apr 2022 09:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cMNohu7KsNouJa1UFb+K8nUtLwDTzTI/72r42ygiURM=;
 b=Y8b4kXsAn89yhrVM/0XlFxsROV32VWFrmhPy+SPB4NP+2xDJXqt4R86dGjkRoe9U8m
 MdmH0mXzpvpipacGFAnrRsCf4QgpcP1cYnBuT9lag8JDJjsD2dlukS2RXMXDJLzuySXQ
 mB37X0txV/IsQArkVEBpXZ/0ZCXwbyNt5ahBpKOjKGBQcmBF0GAPJiQ2WBRzPwvTGoX3
 LU7TsQQj2bxorSO/0vkvdY5yB2nfZSfM1Oq24eIKtsO3W8wn3bo3jY8DmN6YpSaJuQeA
 yExE3JgRYfb29zlkViY9mCgeL769ZMdiU6+g9Y04NXlt+LY5ISCZt5cv1VWww/NctZFz
 rWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cMNohu7KsNouJa1UFb+K8nUtLwDTzTI/72r42ygiURM=;
 b=Mn303RfNr4eXEzjSk3hmNr3hZamvD3AFOdBOQKJ+2LnTZrcUNKDi1sosF9aEDBQb1O
 u7eP9MmLT6Ef2+L1LRsZRttivkX1LLhLcgcwkwg2TXR6eqE8E2yDaWPte5W7bTF0M4S+
 xtrXe8GHAEMxZrNo5G57IbNUN+Efq1u/AxMA2yiyFZxLGrGQXo4EpeGJkmNgwP1AT4+W
 JcjwtJjODKz2ZNaWYso6YYQI9A//cxX25wIv1zFyqR51Nd3hXL96xmd676oB5rYHr0Om
 mhNfCUwVbvanL4DXU1Go06aq23REVT1GnUTJfZb4n/vrcgsSqtoTQUGlwDYdPY+pYPLA
 6ysw==
X-Gm-Message-State: AOAM5335nOpAXPPSNmt2XCPPF9YQYqDfsXOzrAWmkJRINBYzUzWoltiJ
 LHjIOWJPLxPgc11qFsJiPYiIeV2wWjppoa9m76DYsCmnEgLqKLjt
X-Google-Smtp-Source: ABdhPJy7YB+IwrdQor5NjHuIZEoM/n6B3J0+rbXLoq4HAbBBdffaXFkJHbDhXcjRlqLQV7zffljEd7TTuM21G4CDAS8=
X-Received: by 2002:a17:903:1246:b0:155:c376:e5a0 with SMTP id
 u6-20020a170903124600b00155c376e5a0mr3891686plh.167.1650128332785; Sat, 16
 Apr 2022 09:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220415195027.305019-1-tales.aparecida@gmail.com>
 <20220415195027.305019-3-tales.aparecida@gmail.com>
 <4f4c8441-a144-6c2d-0f8b-b598905c2f3d@gmail.com>
In-Reply-To: <4f4c8441-a144-6c2d-0f8b-b598905c2f3d@gmail.com>
From: Tales <tales.aparecida@gmail.com>
Date: Sat, 16 Apr 2022 13:58:12 -0300
Message-ID: <CAGVoLp75WEWxk2uTz6AtomRo+5kNexqM-+aLHQe8pSp66PcHzQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: add docs entry to AMDGPU
To: Bagas Sanjaya <bagasdotme@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@riseup.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bagas Sanjaya,

Em s=C3=A1b., 16 de abr. de 2022 =C3=A0s 02:47, Bagas Sanjaya
<bagasdotme@gmail.com> escreveu:
> On 4/16/22 02:50, Tales Lelo da Aparecida wrote:
> > To make sure maintainers of amdgpu drivers are aware of any changes
> >  in their documentation, add its entry to MAINTAINERS.
> >
>
> Did you mean the Documentation/gpu/amdgpu/ is maintained by dri-devel?

`Documentation/gpu/amdgpu/` should be maintained by "RADEON and AMDGPU
DRM DRIVERS" developers, which are part of the dri-devel community.

Kind regards
