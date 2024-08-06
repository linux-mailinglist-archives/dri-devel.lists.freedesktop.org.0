Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 827D494880D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 05:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A133A10E2E3;
	Tue,  6 Aug 2024 03:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bIUhLIYV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C6810E2E3
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 03:51:18 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6b79c27dd01so1312576d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 20:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722916277; x=1723521077; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c/kd4WiMmD7cvf5H5grwZdB0fA+VVTIeAtsfQV3Ag+U=;
 b=bIUhLIYVFfYLCNKhLB6kBvZd3oRGKpoQkpIh1qKN6C2Gpr+n3f5WjIlTGJnIhlQGax
 LVe1g5IhEN/r5cjVkZkF+OPMPY39pHedUXM7cEzyles/l0VIap0W27vehTmKfgVnLW2b
 jYEKsheUJSSAg3zbXp+W4dZ/a45H1yLDOEi/3MMfg9lAoSPSmTs4SB9zcruwaVgTMAcB
 E6QEDWPgE2xNLpkF9HC4QLH2xELf9a0JrGKTStrgGXQPj7M9hjAtXguYh+3kYzmLQqk7
 qiEeQimkLX6qBMeY6i3DVTUIx7RN83Q6LwPPe0Z/HOFQ7NrXDnY4dNRwvlKfUmzxxWmc
 N2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722916277; x=1723521077;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c/kd4WiMmD7cvf5H5grwZdB0fA+VVTIeAtsfQV3Ag+U=;
 b=uZN75LZvXNAuB1MgQUz6K6Xh9WZ0UGTr42wTHr1zU16h8Op8ViQp7ngO7xsxJm9ikQ
 qs+PUlBtnOvJQ+1Wxa+mRSp+Y3+3rCIJhQCKWZBDHpYxAvxXO4sUJcg0+HYCUBEogYQE
 kN7fYMlbBORToAT89F00x3hF4AuMADzbolC5aUijAgvfZSaB5ecB/6cy4GOm2kcjRGnn
 lICPXeyt0PKgdw49TEsj8tWBImczoNeYDMAVAw/nw0w7NcMt9gJJUPj7t6eAI4n9RjgS
 SItYjQXn8bw5VDsB8URDz/FCTzt+NCJIcpbVkAYXE8+bvtXPr9qK1bCMozvmqxUHUP30
 /81Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/MSt3gFjEiCmqtvlkGJSpoNnSVDfxbRJvcEBxlncZ4jT3AIhf2hgF+eWQD7Uk5IIpK9U2GIg/VQD+LXMIDGw9U8ayI2mVkbBa8N/dstOj
X-Gm-Message-State: AOJu0YycFKmZkXIg8WSErv0569GmxSVeieJIrrTSlWz1DR0Ii0GEL33V
 3ORMSt5QpuZRLQ8BQ7smtfon+E6N3GcZwAWLcYKWkXqrAq95XgkvGM7y+ccw/6l9Rv/ZKQ2w+Y0
 P/GNiCBoB2Mi0Or5RT3Y6i76bCSk=
X-Google-Smtp-Source: AGHT+IE2RlAR/mG/tj72IoVOm1m9SyAB0Xj2ZC0vDvmPd0pDeOdqpJgJne85/B4nYiYlXvIL6sxOK+OpkyaCbeLF13M=
X-Received: by 2002:a05:6214:5687:b0:6b4:f973:d423 with SMTP id
 6a1803df08f44-6bb983477a8mr176949846d6.7.1722916276927; Mon, 05 Aug 2024
 20:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240804075619.20804-1-laoar.shao@gmail.com>
 <CAHk-=whWtUC-AjmGJveAETKOMeMFSTwKwu99v7+b6AyHMmaDFA@mail.gmail.com>
 <CALOAHbCVk08DyYtRovXWchm9JHB3-fGFpYD-cA+CKoAsVLNmuw@mail.gmail.com>
 <CAHk-=wgXYkMueFpxgSY_vfCzdcCnyoaPcjS8e0BXiRfgceRHfQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgXYkMueFpxgSY_vfCzdcCnyoaPcjS8e0BXiRfgceRHfQ@mail.gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 6 Aug 2024 11:50:40 +0800
Message-ID: <CALOAHbDPToZDrsB2wSp6Ss5L0ksrCb1ufx3SZ1GWeqQ2jP7Daw@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Improve the copy of task comm
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: akpm@linux-foundation.org, ebiederm@xmission.com, 
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com, 
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 audit@vger.kernel.org, linux-security-module@vger.kernel.org, 
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Tue, Aug 6, 2024 at 11:10=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, 5 Aug 2024 at 20:01, Yafang Shao <laoar.shao@gmail.com> wrote:
> >
> > One concern about removing the BUILD_BUG_ON() is that if we extend
> > TASK_COMM_LEN to a larger size, such as 24, the caller with a
> > hardcoded 16-byte buffer may overflow.
>
> No, not at all. Because get_task_comm() - and the replacements - would
> never use TASK_COMM_LEN.
>
> They'd use the size of the *destination*. That's what the code already do=
es:
>
>   #define get_task_comm(buf, tsk) ({                      \
>   ...
>         __get_task_comm(buf, sizeof(buf), tsk);         \
>
> note how it uses "sizeof(buf)".
>
> Now, it might be a good idea to also verify that 'buf' is an actual
> array, and that this code doesn't do some silly "sizeof(ptr)" thing.
>
> We do have a helper for that, so we could do something like
>
>    #define get_task_comm(buf, tsk) \
>         strscpy_pad(buf, __must_be_array(buf)+sizeof(buf), (tsk)->comm)
>
> as a helper macro for this all.
>
> (Although I'm not convinced we generally want the "_pad()" version,
> but whatever).
>

Will do it.
Thanks for your explanation.

--=20
Regards
Yafang
