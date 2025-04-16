Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBF6A8ADA2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 03:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED44D10E396;
	Wed, 16 Apr 2025 01:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YCcpgkhx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE7D10E396
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 01:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744767981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bAux2x29rzru79GAnli/9y6p/hjt91wz4YpqymUDDzs=;
 b=YCcpgkhxRY5AFzBwsw2pzXg/FvjkkUDF+3bvmecmDNEKEB1zpV1sCSYWDSXK8zrPMi5GSe
 5d2IBVZnUeqDnc62ytwFSYJUvzjgyww7Hrs00a7gDIxnnvHQ/2IQzE9/e1Jz6qf7t5ocZr
 sY3OjOVAsk7tHJr3rG+KAHTfspVUuo0=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-4PMbG3AQNI2ggeHMJJi8XA-1; Tue, 15 Apr 2025 21:46:19 -0400
X-MC-Unique: 4PMbG3AQNI2ggeHMJJi8XA-1
X-Mimecast-MFC-AGG-ID: 4PMbG3AQNI2ggeHMJJi8XA_1744767979
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-af91ea9e885so5168047a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 18:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744767979; x=1745372779;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bAux2x29rzru79GAnli/9y6p/hjt91wz4YpqymUDDzs=;
 b=C2NNMt82EH6MMnlrzbVp3qXWMSGXAWl1awVpSs7W5DAI/BeQ4JOT7sA5G0KbJLYONl
 BDqVjkPYWLZBtxQqlm6xjA4pttwBCwHVT7IQPQdr35bcajWmvJoPfVQEHGgguWbCXPAG
 5x2sja9Ks1v2bzIV4hjlzFmi0cLibl6AIrXUgOzN5twgZX0t4jRtH7TAg0g1PHuyehlt
 hVO9s79aqqZLF7nWp5I4UUiQjxrgYbZ03f+Cva46pZbkNopOQCEudesI6E2H3ix3E0CE
 uvSjJEcOvKgUOtxYCXLRClXsqN2TTwvXA63/T7vK+4jq39pCADVxs/4ooCPEQTjExGYi
 tD4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW193PgshAv4079QkeUZLMF2Jw7FdzB/IoKyhs1s23fdMpQU/8dLCRy+0QnjTtD+w5kq9c/1X+KZS8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+ul/eEecx/OGZQvMbMdJ5Me4lAgb+dLkQos4zpmCgMLcQX80Y
 xy7k9u1R3anK5GFe1+9T9Lplb7FPMDWMqpRckbkwsvVeorPc/MRIil8EqhmyS+iZPzNU1bY6MWH
 blzjMvOdJy+GaNqi0oRXMfjedeANr3KyALO59Pt4MSVw2O2YNjDxa049LWdScscte/TevryCJiW
 MMEFQTDBgqJumGncRJ0HhhI+2oh5tv1FPpen0cw+0N
X-Gm-Gg: ASbGncvNpPrKfuzpoAL2TUp6RG+fr2USeCQdjE3GDaeYBezA4KqQKekAPcc7IsnS/lE
 VmiN9lECsOM18pFoTD9hcSG243sQxaWq0LTAIPL1+NvlzwVkl4vN5eNpxjPwpFx0N7aE=
X-Received: by 2002:a17:90b:264d:b0:2ee:aed6:9ec2 with SMTP id
 98e67ed59e1d1-3085eeb4675mr2220915a91.14.1744767978878; 
 Tue, 15 Apr 2025 18:46:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVAUDYX1fc9zo3gyEt8qqe/RuhMfN8ThzDds91F5a1f+kZ++CgF1OWTJE4cpzcWzli2Hyns3BIdFo4trIBp14=
X-Received: by 2002:a17:90b:264d:b0:2ee:aed6:9ec2 with SMTP id
 98e67ed59e1d1-3085eeb4675mr2220892a91.14.1744767978471; Tue, 15 Apr 2025
 18:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <Z/anHRAx3SQWr+h8@animx.eu.org> <Z/2pzDAplsZz8AVd@animx.eu.org>
In-Reply-To: <Z/2pzDAplsZz8AVd@animx.eu.org>
From: David Airlie <airlied@redhat.com>
Date: Wed, 16 Apr 2025 11:46:06 +1000
X-Gm-Features: ATxdqUGaR9ylaT4IMINZhWP69BAL6dWZUQv6Kz0vm82yhI7-yxIZA-d8PtCceR0
Message-ID: <CAMwc25rKPKooaSp85zDq2eh-9q4UPZD=RqSDBRp1fAagDnmRmA@mail.gmail.com>
Subject: Re: MGA G200 issue in 6.12 and up
To: Wakko Warner <wakko@animx.eu.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x-knH-E5RMKK_Xb8Z5MTmScE4e34d88c6AoE4xTp2KA_1744767979
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

adding some people

On Tue, Apr 15, 2025 at 10:35=E2=80=AFAM Wakko Warner <wakko@animx.eu.org> =
wrote:
>
> I found the fix that works for me.  See below.
>
> Wakko Warner wrote:
> > I decided to upgrade to 6.14 on a system with a Matrox G200 onboard vga
> > (supermicro X9SCL).
> >
> > I use this system via the BMC.  When the mgag200 driver loads, the bmc
> > screen flashes between no signal and the screen.  The rate seems to be =
about
> > 1 second no signal and 1 second with signal.
> >
> > 6.12 and 6.13 both have this problem.
> >
> > 6.11 does not have this problem.
> >
> > I have a monitor plugged into the vga port and it doesn't have this pro=
blem
> > on any of the kernels I've tried.  Only the remote connection through t=
he bmc
> > has this problem.  I have booted the system with and with out the monit=
or
> > plugged in, it does not appear to make a difference.
>
> I found a thread on arch linux forums
> (https://bbs.archlinux.org/viewtopic.php?id=3D303819) where the op has th=
e
> same issue.  He bisected and came up with the bad commit.
> That commit is
> d6460bd52c27fde97d6a73e3d9c7a8d747fbaa3e drm/mgag200: Add dedicated varia=
bles
> for blanking fields
>
> I searched this commit and manually reverted it from my vanilla 6.14 and =
it
> works fine.  No blinking in the BMC remote console and the external VGA
> works fine as well.
>
> --
>  Microsoft has beaten Volkswagen's world record.  Volkswagen only created=
 22
>  million bugs.
>

