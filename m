Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4581DC38353
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 23:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62F910E7B7;
	Wed,  5 Nov 2025 22:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aBNjWUL1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B182710E7B7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 22:34:55 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-b9ab6cdf64bso628904a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 14:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762382095; x=1762986895; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m9YdcX48Lm+WvofyNz3S/WPJ9jf2nNHMhjPdKCdpwJM=;
 b=aBNjWUL1Eb6ikBQo0Q4T7aJqsRtq4Typ80ZS9CcZHdXzY8mEpMVFuklmNdgccsDXl0
 sWhIAEmYFy/+g3ebJ8GLIM8K8UhhlhLcsAtE8oR4b3AnflcWp2rHWl3bvdW+9QbqajHB
 Po2knLEUB9NMMva+Cc5POLGCuAq9IPpAJYqRqFUTeS+RHU7VSkE9eflpcDhX29+dO89o
 XpLu087A1Skz+RBkUDJY0O6luoaHWMbaCHjpWmn2h8m/FAcl3pDu7agpL7ZSfEtRw+Lj
 J1F0j1PwNsEW0nf23CZj81xMokb2bot/E3ifzxPqAZx5sxYwOX/cDMJnxCjhmmSk7Wc9
 F0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762382095; x=1762986895;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=m9YdcX48Lm+WvofyNz3S/WPJ9jf2nNHMhjPdKCdpwJM=;
 b=OzyKKWB7x3fyb9GjXJQgM/7/qgbcX5OlifGAzDmcM7GpwBDY5KQiAF7p0oZhT4KX3m
 Dk1OkpIwnB79+F0wOXzWCXArnLp0zOMG02NK6CLiDZJszOUn7qobVqQJDi3XayEKkVG0
 Q+G8E58RtEuM45kjelqjZV+/e5cyqHOakqXI6SctBEiVl/iRPuYpV7YlFZ2g5Lwx7WBU
 IZ8xP55dIuw6pi1dHp2ykR9zj8NfuYbJqOvOj/tPfqim9ogIz6YSTy5+hqtcPDNmAYyW
 1r24SEKTv+I9VuSxErLtYx8e5gyhlM7ofZBcZmgFTefSDfbcH61h7+8OjAqwkCe9A6LE
 F5iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsyt+sE+K4sdxqiCFRKZq6Wnp16yfGMqLIpG6aVHOXg6BQxv56+0OHC7aXGcIfpNV0WuECw/BEQt4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxq+32zX4TiPQqDaY09y0tQ4Muk3utWWIBidsUp83frdUNCnOIr
 OWO/XGJEpWxUBS1APBM1g92l2z+vEuSIguZfx5WczvGuy54rCCjVfjKSCIfiEJn4d72a44SRTqd
 6mH/mDrYw9+uRM7jQGU/YwJ3BcNN6rHc=
X-Gm-Gg: ASbGncuWdGhUIHv2XKMCj/VoQoC5NUjzL0g3xWoDujFQAxt/Pr9Vda7XKGvCw1jHDDH
 KO/eh6mYxZdHV7SpXgQAcehRyJiB1WS7xBqYqQ6y7YHKJa5uTHDWinXQkZIoEP5apz4SNsXCkTH
 oJjIK410CXRI5g1ZI29dSv8V5pvGdYOgI2xZNngpoXnY+j7z1gpLucesAGl3orLVZ/vANSdYEjZ
 nNYoTB9QaP2hSxllreUW5W9bAALhBccuAMB+gfILn9Iwdm255ymjdDVOhqzjhOIvcmrNHsD
X-Google-Smtp-Source: AGHT+IHIHO30gWfFa2a8pQjfVD3lzjmNd22UhsmtrAsEPwyuVl9HAZlkCocO18RYcmuCLRaX9tmJc35cZ/AJdbxawtM=
X-Received: by 2002:a05:6a20:9f8f:b0:346:3d90:84dd with SMTP id
 adf61e73a8af0-350dcb3337bmr950104637.1.1762382095117; Wed, 05 Nov 2025
 14:34:55 -0800 (PST)
MIME-Version: 1.0
References: <20251030230357.45070-1-mohamedahmedegypt2001@gmail.com>
 <20251030230357.45070-3-mohamedahmedegypt2001@gmail.com>
 <209ea5680e5ca28b6d068ef8e0b58613c93bf525.camel@redhat.com>
 <CAAgWFh2Zy=9vt6x4e3P6G+_RV0Hu66jyJjpKWWx4WVg8EAV+Ng@mail.gmail.com>
In-Reply-To: <CAAgWFh2Zy=9vt6x4e3P6G+_RV0Hu66jyJjpKWWx4WVg8EAV+Ng@mail.gmail.com>
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Date: Thu, 6 Nov 2025 00:34:43 +0200
X-Gm-Features: AWmQ_bk6WW3AO_AvnnWBICE7NGsiAPsdu5CZJbslfDarF5t2N6XtYRBJjhG5NGs
Message-ID: <CAA+WOBvmq_LkT97v+5Pnno7_OPWOMewew4j2dbLdcLvxNnGOjg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] drm/nouveau/uvmm: Allow larger pages
To: M Henning <mhenning@darkrefraction.com>
Cc: Lyude Paul <lyude@redhat.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org
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

Do I have to make a v5 with Lyude's and James' review tags or does
this get added when it lands?

On Thu, Nov 6, 2025 at 12:33=E2=80=AFAM M Henning <mhenning@darkrefraction.=
com> wrote:
>
> On Wed, Nov 5, 2025 at 4:01=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrot=
e:
> >
> > As long as you fix the parenthesis issue in the next respin of this ser=
ies:
> >
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> There's already a v4 on the list that fixes the parenthesis.
>
> Anyway, if I'm keeping track of things correctly this series is now
> fully reviewed (v4 on the kernel side by Lyude and James, and on the
> userspace side by me) which means I think we're ready to start
> landing.
