Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA866EACC9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 16:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B7D10EE49;
	Fri, 21 Apr 2023 14:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D211910EE26
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 14:24:58 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-329577952c5so693925ab.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 07:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1682087098; x=1684679098;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fev/HjWH2B8yyfQiDGZ9D/O2oZYyJ9gGuApag0ZRVwc=;
 b=TVGpX8Rsft5hzMr9h6Hwyheu0HJYGuHxxs7ojc6Kil4QcUiO/DlWT0in/uLxRo6Cjj
 k1VQcRlDqVO4SIIb5IVwDa4JdfL4zYLvXGhLV/kB+NM5PH/u+XjBKfnkjEQ9QVQmK60w
 Vc8FzK6DfY5mi2TbK4uHxCC49bYsU4nxKZJdASBm+oks7LbQ+RxB90HBUI6mYlegxr7U
 1XR6A+LHNGRyTDAhBVssIxGbpCl6otjWPglcnEPEXNFs1XXpb+XtVA4I/tlXGMqxR+pq
 8D4T4nbhmC3rl/qw+IT0JwOuDIGlL0G4YOWFtTiFq80UoDYKM6UOS6EJnHjngA/3Jjn6
 mLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682087098; x=1684679098;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fev/HjWH2B8yyfQiDGZ9D/O2oZYyJ9gGuApag0ZRVwc=;
 b=XCwrpNe9wMcL5kP6x5XzPFWODxGiZQiu7H3UwAiotoyT9rYSKEQ/6PiDcdLQdEoTuY
 6CGFb3PDEC/+DTZygWBQyLUUgZvbSWRn86AZKs1H2gNBucNm4MxTZOUi7xvNCurUT7mk
 7mf9Ewby7lDHx5fSr6LiE9T8s396gW2MY29ZLZVVs1id8p94SIRcmMyD6ClBQKEVrNn/
 CR5xs6oPzQsY3Ah8MXbi9cNPkc59E4FucKRbKlHt2FwFqr+6R1YpROhAIUxVbehF2T0Z
 HrnwMirbkoNuJ0K28YtbharSCHLfrHVfXnu393hOB7YRz1Vz0h7GJFzraMytuscSHJsv
 mgBQ==
X-Gm-Message-State: AAQBX9dvT3btBLZT2xAaQTz52F9jCAsb7DRwsbPPHIKAVOMiywUKZy+M
 UCSfYbgl17dVg0DTTi74eDzvFaw7RCPD4PB7SGATIg==
X-Google-Smtp-Source: AKy350Z0juoPECKlzKlGMdUfKVumXOK21XHMESzNTTUc7EvrFvimwX3M8kvTGyloRw/nYChUw0o5sGJI99iK2oqYk/g=
X-Received: by 2002:a05:6e02:1a22:b0:32a:b8fd:19be with SMTP id
 g2-20020a056e021a2200b0032ab8fd19bemr279553ile.18.1682087097600; Fri, 21 Apr
 2023 07:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230224-track_gt-v7-0-11f08358c1ec@intel.com>
 <20230224-track_gt-v7-1-11f08358c1ec@intel.com>
In-Reply-To: <20230224-track_gt-v7-1-11f08358c1ec@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 21 Apr 2023 16:24:43 +0200
Message-ID: <CANn89iL65YYs_+cJs6STTH=7n22VLi-eru2FzFh1rtrxp_a7Aw@mail.gmail.com>
Subject: Re: [PATCH v7 1/7] lib/ref_tracker: add unlocked leak print helper
To: Andrzej Hajda <andrzej.hajda@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 1:35=E2=80=AFPM Andrzej Hajda <andrzej.hajda@intel.=
com> wrote:
>
> To have reliable detection of leaks, caller must be able to check under t=
he same
> lock both: tracked counter and the leaks. dir.lock is natural candidate f=
or such
> lock and unlocked print helper can be called with this lock taken.
> As a bonus we can reuse this helper in ref_tracker_dir_exit.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---

SGTM, thanks.

Reviewed-by: Eric Dumazet <edumazet@google.com>
