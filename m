Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E9788E6D8
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 15:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB5B10FD45;
	Wed, 27 Mar 2024 14:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BNy1IT4n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B751210FD45;
 Wed, 27 Mar 2024 14:44:23 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6e8f765146fso5257978b3a.0; 
 Wed, 27 Mar 2024 07:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711550663; x=1712155463; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7q2C6v07RAOGYu2hu4GY7euXWF8ETU7ffxo3I9AlpmE=;
 b=BNy1IT4n/0Qd9H3hbC1UG28BwzMCo4TmoBGd4wGLjLbg5k80EmHIWhMuLN+3ZNxBY3
 d6cE0XT2MOHvGoZ/rQnNBMO2HriDQKmLb1OCDfT8cXoaMoVOSnAaHFJ1ZEhH2VxppruV
 7kvqohANIJFvC9GZ2XIPAhicT4lbT/HMGCUoHNaF7BMfiiSPAVSMfpHS7J1zMsEWpzIq
 PE9oBUNndGyNj8kwNAYS7sJugxVRDvgxEKyCjhVqSrl3pea0j7hbJJjcDHd3UetQ9vEJ
 efOGHwe2TFds+urrJDJmfl69bezJoUe9ouZpK7L18xsYFpsx5jOcXd2jQSgwUw44/xsp
 qHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711550663; x=1712155463;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7q2C6v07RAOGYu2hu4GY7euXWF8ETU7ffxo3I9AlpmE=;
 b=EbmN33S76omkUXZ4yxylmOBpqsVG8pfToBaXSXIByc+93UKehZXASGfARgQ+aTgFCE
 rAg7cpDUPg8DyUxZ//wb05XXQeGnl0v48BAsU+06PtaqnV2C90Klch9PJpLSW+XKz8p0
 5Io+id9Dd3zvZTsdpVNZeAss9dFzVkDx/lqTQmm+Qb9xeQX9hpN0MGMIBSc7Efw+iKIG
 rcrOK+OR4rXig/FhBZxKi0CItJ0hNNLL1HyCGRqbeksbd656Z5S99z5js45lCG9uRkgQ
 wz0Co/ajELJ8gaqcMhZ0qmFw7xhM7OjfVs0/KDNBs55ZlASMxk6PFj4SLs1yvvLFWYwp
 uaVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxPlQwT2cLnSJE171ZBTxNCGK0m8pSTBI+3MwEvJdZWONMsUT9wo4NQI6JUfavx3Ce++I3AitWhRGs2HB7nr3k8ZDaqssUfXhp3WXmeexZ0Tjk07XGD7JVEo1B2IJgaUZsSJk8865d6TVKCt8UO5+GnBA=
X-Gm-Message-State: AOJu0YxDdLHv8V/OlunstyMZ922Atx4iD0ZOc11sUGrJAIbXKgMyVVAt
 vIKjzZmoflPeIflTJDd4yvwGEDbXAHecSa0hVUTeoCU5EA0jqKPc011RU2ptSgoqt1bNC79Tbw/
 zrvWESnpHAEP/lTXzECNxlbLA2bI=
X-Google-Smtp-Source: AGHT+IE1qaXoQhFdrtV7QT8MND6FcMTo2zAxmPDuHTiYsb86YGvn9Hfou3VfjATjJrHui3jRqwzdKYDjQpt/iPCMqrw=
X-Received: by 2002:a05:6a20:7a9a:b0:1a3:69e9:63a9 with SMTP id
 u26-20020a056a207a9a00b001a369e963a9mr56558pzh.18.1711550663028; Wed, 27 Mar
 2024 07:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72mbsAYmR_dRPpQQ=9-NWhTtp0TWiOz0v=V-0AvwYbWw4A@mail.gmail.com>
 <20240327-magnetic-nonchalant-hare-bbe8d2@houat>
In-Reply-To: <20240327-magnetic-nonchalant-hare-bbe8d2@houat>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 Mar 2024 15:43:55 +0100
Message-ID: <CANiq72kqqQfUxLkHJYqeBAhpc6YcX7bfR96gmmbF=j8hEOykqw@mail.gmail.com>
Subject: Re: drivers/gpu/drm/qxl/qxl_cmd.c:424:6: error: variable 'count' set
 but not used
To: Maxime Ripard <mripard@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Wed, Mar 27, 2024 at 8:59=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> It looks reasonable to me, can you send a formal patch?

Will do -- I found another one when running the CI with the above one fixed=
:

    drivers/gpu/drm/qxl/qxl_ioctl.c:148:14: error: variable
'num_relocs' set but not used [-Werror,-Wunused-but-set-variable]

I will send you one for that too then.

Thanks!

Cheers,
Miguel
