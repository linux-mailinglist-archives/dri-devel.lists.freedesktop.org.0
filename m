Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CD26E9044
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 12:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE7810EBFE;
	Thu, 20 Apr 2023 10:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A057510EBFE;
 Thu, 20 Apr 2023 10:33:11 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-5ef51409426so1023826d6.1; 
 Thu, 20 Apr 2023 03:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681986790; x=1684578790;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AGwZRkRlnsA+vGof+tjeyG6hWGi5lvtYkhKPwunLX8A=;
 b=Iq5QEWxAKEYRJ7WPHNhJ8UlX+yubs+UNSHhXEgJ8A7lQIFVREmWHZa4I/YWUbOo4ve
 y4n5aFWcZghPvezJBrb1gQTszLaMM38owWU148LCA7p8f6USPnp7rEDkG1oQqz7j70Ag
 W9aybdAmzWJSUzftjW1OD8chs9J1IZJMGbogH/3mRjjqOwO+GmWtFHADy6BlRzd0ArVz
 dU78Zf9XcGsQtmlrViWtHO20VFm5DiX8ulew8t5BoXO4LdG3itKuo0fD1ciio2W/Lx8r
 TgRxsKZw5ebPVaNGZRSCgL0ST998ZRRH6vNU2SyaVdEBDBwzIGbdGsIay+NwyZ3cHJgO
 6ZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681986790; x=1684578790;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AGwZRkRlnsA+vGof+tjeyG6hWGi5lvtYkhKPwunLX8A=;
 b=RkK97JwnYtRjfI2ifcAQf14oNT+MRZJ5veM70ffHUzReVck5966K+LOM0gBVUD7YzQ
 YCfOCki5EFSQzbiQgagSqgY6LM/WwE1wKFRGC1GrdCsESVXM+vQhyoIMyHr6xyk5z1Zp
 sqDcJG+Lt+Vc/ByGZYe5NG4adquCP2adxD99cX4/b3UESr00tcj3ZCWFbkXevnovAmfN
 0wyxSbC1nKGYFI9uYtFiZw91XFdfSyOzX8repGxbCEgxUnnkQtPgIQOWP8wStBMK6ohm
 iIsN0lEeY3Fvs8/lPjkYrJllceT4pwlp5W5dNjOedO/yagZnY5ziJU7eoy3jD7vSMItX
 6p+w==
X-Gm-Message-State: AAQBX9e0ev/r1KqHI7mP4c35JYdGCNStTkJPTvCNHr0FJC7MFBAPLBAI
 niu7V7GyOonCI8qrGusEgMGoUKjy7sygKY8C+PQ=
X-Google-Smtp-Source: AKy350YtBYEERlx+sQJO+modBKx/Gx0XrP1st2ET3yAiNNT10OgF3OckybBYcYbFBA5wgXUkBWVpnx1HU01jaCYIVmw=
X-Received: by 2002:a05:6214:2aad:b0:5f1:31eb:1f0e with SMTP id
 js13-20020a0562142aad00b005f131eb1f0emr1074380qvb.4.1681986790164; Thu, 20
 Apr 2023 03:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsPZxgpFzAVN=eFXu0WV+Jk0vB4rv4p+Jt31C841LcqV=A@mail.gmail.com>
 <CABXGCsO0sST8+MvQs=T1JP49ogRsaHPT9gMQZGJ3dY7v3m0H8g@mail.gmail.com>
 <CABXGCsOTEpJG_0NWdGXRvcXQ4iTav6AUJm-U4SQb-vVzjoL6rA@mail.gmail.com>
 <10b2570f-a297-d236-fa7b-2e001a4dff12@gmail.com>
 <CABXGCsPcPY8dqZm0aF4c1p0ZvMYHy+NksMrZi9xK0=WdE5_osA@mail.gmail.com>
 <d96519fb-9e12-5a81-a60b-384dcb286f28@gmail.com>
 <CABXGCsP2JQMtNjBROSLs2y612iLZuCyoe-uD6OScAWbKHBWsCA@mail.gmail.com>
 <b6ab0086-7d52-2a41-2f76-44694faed317@amd.com>
In-Reply-To: <b6ab0086-7d52-2a41-2f76-44694faed317@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 20 Apr 2023 15:32:59 +0500
Message-ID: <CABXGCsP+LSPE9fH4TW781w67ju=HrNMe9s0kigqBarketr_Qog@mail.gmail.com>
Subject: Re: BUG: KASAN: null-ptr-deref in drm_sched_job_cleanup+0x96/0x290
 [gpu_sched]
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 20, 2023 at 2:59=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Could you try drm-misc-next as well?
>
> Going to give drm-fixes another round of testing.
>
> Thanks,
> Christian.

Important don't give up.
https://youtu.be/25zhHBGIHJ8 [40 min]
https://youtu.be/utnDR26eYBY [50 min]
https://youtu.be/DJQ_tiimW6g [12 min]
https://youtu.be/Y6AH1oJKivA [6 min]
Yes the issue is everything reproducible, but time to time it not
happens at first attempt.
I also uploaded other videos which proves that the issue definitely
exists if someone will launch those games in turn.
Reproducibility is only a matter of time.

Anyway I didn't want you to spend so much time trying to reproduce it.
This monkey business fits me more than you.
It would be better if I could collect more useful info.

--=20
Best Regards,
Mike Gavrilov.
