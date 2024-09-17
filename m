Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ABA97B493
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 22:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C7B10E02B;
	Tue, 17 Sep 2024 20:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K/WgFcGJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164C810E02B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 20:24:59 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-71797e61d43so804043b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 13:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726604698; x=1727209498; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Id4GKCIpjHK3vGXpxt6PC/t1QKXrcVdOg0xAcAolYI=;
 b=K/WgFcGJHOJLSsRsChnQgIoEWuGh17mPn6SU0MNoXwjCQ+O29YuwldXydRaOz+zQs+
 r8ol41C6XMjHIrhVmPxhm31IFik1VnHj21Xb9NLCpVaMkdfEP/67fllerk0nnTtjmDtJ
 QcVCWdiwV2xyygs7rErEknUT35Qy0rFIGc7PbGLbxSPUGAx3Dy4yKBvVmzSQLm/+nlxw
 Gxcc/NFQ5PE0RYowZESi69qTKpbFIawHw9b38XxLy72u7lK0m6euTpNVFfLMrP4cktN2
 pX59zPMzpY0DfRlNAgWOXUypZBZKXatgVSHjwVEqJdmNUuC0zKtVMZgNDoRLxfv/wFTe
 6GKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726604698; x=1727209498;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Id4GKCIpjHK3vGXpxt6PC/t1QKXrcVdOg0xAcAolYI=;
 b=uiCdjobby0k9tMnghuFEt2ZmuA0kxktwM3RtkNZp+72glO429Au9nJu1iMCyCL0scB
 jfkXCZrBiwrUopX7MuDeUsTPEcBlEDhy0f+/IUB1NS20OtoWbJP+HC/MthO0bOPWB+tN
 WfIkPVHYeTQVZjQJK9/woq3+o/pVprsQTC7kVBuq/X4CCwVUbVyJ42F2V+JXTJ3cfQ+k
 5DHepVlxlOUhxqW8A2lLY0QdSXIFkFXHzAm6uh1L2s3N43y0kn7yEb4sa8HZnYl3dobX
 p8MSEqKut8Hsyud01E3jJn5rsw7cGVgYoQRdVwxkLYRXFIQ5cJcQom764f5I4MkruPLL
 xyAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4Hh3Y9MJiktCPE7CF12m5kkWm0VkdGw1/+dhMGWlLqvE6Vhk9gjfI5VX8dMLwjoHBoksmQ/C3cIw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztxRdTfsqi8iMnFQPnlizR51J66A9qo2hXkMMf2UuJ3LZlDUxk
 8xAHaeMpbyQie6cq40PhncygmWrs7EaVL7kzy2uqHgYePWum9c3u5E0w9tMMgasIdJ8SfOvvaN0
 xE7KmrebruEp3V7ZRhtyxEVD+82c=
X-Google-Smtp-Source: AGHT+IFCDRUphcZwCSNQ9l93mPk9heYwuLJ5usPzFHJu9Rp4nIPipiFcuyVqWnOWRaFZDJ9/oYI1YejF8NLj/dKwG7s=
X-Received: by 2002:a17:902:cec6:b0:206:b8b7:883 with SMTP id
 d9443c01a7336-2076e375379mr119298905ad.1.1726604698482; Tue, 17 Sep 2024
 13:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240916141517.3ef8b349@canb.auug.org.au>
 <4d69172b-dd12-433c-a030-3d48f2716e0a@math.uni-bielefeld.de>
In-Reply-To: <4d69172b-dd12-433c-a030-3d48f2716e0a@math.uni-bielefeld.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Sep 2024 16:24:46 -0400
Message-ID: <CADnq5_Mx1b16sbJH2Y_XfD9GiYvuGtwZyxRa_1u151aZbZEyHA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, 
 "Wentland, Harry" <Harry.Wentland@amd.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@redhat.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Jerry Zuo <jerry.zuo@amd.com>, 
 DRI <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 Sung Joon Kim <sungjoon.kim@amd.com>
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

+ Harry

On Mon, Sep 16, 2024 at 8:58=E2=80=AFAM Tobias Jakobi
<tjakobi@math.uni-bielefeld.de> wrote:
>
> On 9/16/24 06:15, Stephen Rothwell wrote:
>
> > Hi all,
> >
> > Today's linux-next merge of the drm tree got a conflict in:
> >
> >    drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
> >
> > between commit:
> >
> >    e835d5144f5e ("drm/amd/display: Avoid race between dcn35_set_drr() a=
nd dc_state_destruct()")
> >
> > from Linus' tree and commit:
> >
> >    be7a6a517164 ("drm/amd/display: Check stream pointer is initialized =
before accessing")
> >
> > from the drm tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tre=
e
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularl=
y
> > complex conflicts.
> >
> On close inspection it might be worthwhile to take the same precautions
> that we now take with tg, also with pipe_ctx[i]->stream.
>
> @Alex: What do you think?

@Wentland, Harry can stream be NULL here?

Alex

>
> With best wishes,
> Tobias
>
