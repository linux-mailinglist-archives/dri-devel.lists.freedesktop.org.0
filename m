Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBF06EACB7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 16:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7C810E13D;
	Fri, 21 Apr 2023 14:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01D310EE26
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 14:21:33 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-316d901b2ecso701195ab.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 07:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1682086892; x=1684678892;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z5+C6NfuJNAhAxOI6zMo3D7L7jfA43YGoHVKgeW1YBY=;
 b=Yfzy9wOR7Pi7eDwQXwjXgisJJYtH1mZ/Xi07kQ84EF6nogfkh4g3Q+mbztQRcRA+pZ
 4u132+L5PppeRLDFuFMPGVVtjWgCujTt4PGwWZSnAplhOzzfluX/YXEpfGFaGS3//4pI
 x2h4xB159pU7pmfGk9/fRAXLuxkedJNbLzNZYoY3JOXwazd5JewQieGKgdmMvjgbfThq
 ScgJapQPDCcJIV30AFY9L0RiYzuduU0uvNLPdGmXl1p5Zqz1Ljy9gvueEXhVmYzhe8fL
 ick1JJaJXC/vkxhgxTP0uim97CR54h78AO38OwNuAAwpnyRaEHdjR4PdDBUqluN0vTdZ
 qdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682086892; x=1684678892;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z5+C6NfuJNAhAxOI6zMo3D7L7jfA43YGoHVKgeW1YBY=;
 b=f7fGiSDVac0aeUQ30c2YRw45vM53Kay2dylpzQ6cSj9CKjZwrK6tLWLEyVf2qJoLrw
 R85CH2ElzuBoV/fg04CbTmRAn871Ar1Cp0BRuNyZBTp2xnQpQW6WbWp4BkPczG/w3V/2
 p4ddzw5TzPY8DwS2XAq0zxq3BMGQNZx3GZdYdl8av/VcVHNCF6JxESUExa70K21G0mWo
 4mJiqktAlQJtVFQCj2ocTIS01LtFleRBzN8mRoicLmnCFEMe4Gs0ibm1gIEr49eDGKdc
 RxbK97Pm8KGD9wLHnL8Qj3x0n9VxuObX6/XLbuNniELWD5ogmgXLjF0LYq/v2bUDM0xu
 nHGg==
X-Gm-Message-State: AAQBX9egQexW4zt3utbk9V6azVSL6yKXcL8HhjKK+gh3ObY6Bdjq+gw1
 0jPN3VqhOvrB1Wbme8KaxrZhvpBLbk4Mr6X102tBnw==
X-Google-Smtp-Source: AKy350YTrFDjDEmxCbEslekk40tuImwCYrEPDoUtsE+dPH/6N52N9wgGQJYDTPKdtGGFL+QYkILnSuzIBSWjWbVD3lI=
X-Received: by 2002:a05:6e02:18cb:b0:32a:db6c:d51d with SMTP id
 s11-20020a056e0218cb00b0032adb6cd51dmr327630ilu.12.1682086892452; Fri, 21 Apr
 2023 07:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230224-track_gt-v7-0-11f08358c1ec@intel.com>
 <20230224-track_gt-v7-2-11f08358c1ec@intel.com>
In-Reply-To: <20230224-track_gt-v7-2-11f08358c1ec@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 21 Apr 2023 16:21:17 +0200
Message-ID: <CANn89iLUDXz9VAtCQ6Gr2Jkxogdu_5g0tN9iCkAB0JD_B_05Gw@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] lib/ref_tracker: improve printing stats
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
> In case the library is tracking busy subsystem, simply
> printing stack for every active reference will spam log
> with long, hard to read, redundant stack traces. To improve
> readabilty following changes have been made:
> - reports are printed per stack_handle - log is more compact,
> - added display name for ref_tracker_dir - it will differentiate
>   multiple subsystems,
> - stack trace is printed indented, in the same printk call,
> - info about dropped references is printed as well.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  include/linux/ref_tracker.h | 15 ++++++--
>  lib/ref_tracker.c           | 90 +++++++++++++++++++++++++++++++++++++++=
------
>  2 files changed, 91 insertions(+), 14 deletions(-)
>
> diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
> index 87a92f2bec1b88..fc9ef9952f01fd 100644
> --- a/include/linux/ref_tracker.h
> +++ b/include/linux/ref_tracker.h
> @@ -17,12 +17,19 @@ struct ref_tracker_dir {
>         bool                    dead;
>         struct list_head        list; /* List of active trackers */
>         struct list_head        quarantine; /* List of dead trackers */
> +       char                    name[32];
>  #endif
>  };
>
>  #ifdef CONFIG_REF_TRACKER
> -static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
> -                                       unsigned int quarantine_count)
> +
> +/* Temporary allow two and three arguments, until consumers are converte=
d */
> +#define ref_tracker_dir_init(_d, _q, args...) _ref_tracker_dir_init(_d, =
_q, ##args, #_d)
> +#define _ref_tracker_dir_init(_d, _q, _n, ...) __ref_tracker_dir_init(_d=
, _q, _n)
> +

We only have four callers of ref_tracker_dir_init() .

Why not simply add a name on them, and avoid this magic ?
