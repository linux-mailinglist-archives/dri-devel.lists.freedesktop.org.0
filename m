Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 982D8A7826F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 20:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728D010E138;
	Tue,  1 Apr 2025 18:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="njS3Clqr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6E310E138
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 18:47:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6264A6840A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 18:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C200FC4AF09
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 18:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743533233;
 bh=3EN8DJcs7vuHrjbWwCn5R8YyQjIag3YYATPkbn9N4q8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=njS3ClqrxAwUbF4yEnK0hSlwuD8pke6+aclY1bvdFoign+ox83MQzL0zkf/xHlt7F
 8gIQd6jQP7+KH+wl4i+LMPAmdCRYuAs8VhO9/fPhwwMBlipjrP4CYDAayPp12cOyf6
 D5Vf/dOXpgrO1XXIt9nPe47LF/BZH3d19y+Gxw7B50PB2apsCFsNawu9Dai/wOIyNs
 7lNcVyt/xI+KiwVopJfKMHbmsv2hVe+VdTw9f0HxfHV7d8+8BFMmG3jVl/a0U/tvsd
 tipvav+4fehvAW3dszhjFwq9SmM8N7680prbeVQ0YJUZB+tEPRT1mu8VWSHZVg7iIf
 epKYMJBGL0y6A==
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30db1bd3bddso57371741fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 11:47:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX5913X9OMPIC5ceK45BvhNtiU0V9aG8jWrK/WdHQcNQhNHWb13M7OQxtsjaGDFXT403Sl7eUoiN2o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzICCIhq6gzG2nALw860u4czgzM7ibswvp5g0MUvI+BtmMdhvyb
 0zuU6eC2xvSCF7TDy+jzP6xlwjQ1MUSMgQxmMUj8lAOFOIVih4OHLDYuwXAhvY4P1nz+Qfk2SIh
 KoYc0yvmgZLRX8sU9Ep86yYvOMMw=
X-Google-Smtp-Source: AGHT+IFr3N20dboMCQNSF1kAFSfln2FgL3bYPKR5XWRvW3QXmxUfL8Uy/4klpXIcJMEO9FFaB3/1p5pp0rQ4zS5ed3s=
X-Received: by 2002:a05:651c:2209:b0:30c:189d:a169 with SMTP id
 38308e7fff4ca-30de03286edmr44217501fa.25.1743533232123; Tue, 01 Apr 2025
 11:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
 <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
 <87h6394i87.fsf@intel.com> <Z-p2ii-N2-dd_HJ6@phenom.ffwll.local>
 <20250331133137.GA263675@nvidia.com> <87tt782htn.fsf@intel.com>
 <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
In-Reply-To: <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 2 Apr 2025 03:46:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQThGkgtKgquRPv8Ysi_omedRthF1_++apKda-xWeWcbA@mail.gmail.com>
X-Gm-Features: AQ5f1JpWfavKws9pXp40pkcWPQBFSZDj0KKmDcek7l7jzydxtf6KAS-HGpcXERE
Message-ID: <CAK7LNAQThGkgtKgquRPv8Ysi_omedRthF1_++apKda-xWeWcbA@mail.gmail.com>
Subject: Re: [git pull] drm for 6.15-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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

On Wed, Apr 2, 2025 at 1:12=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 1 Apr 2025 at 05:21, Jani Nikula <jani.nikula@linux.intel.com> wr=
ote:
> >
> > The header checks have existed for uapi headers before, including the,
> > uh, turds, but apparently adding them in drm broke the camel's back.
>
> The uapi header test things never caused any problems for me [*],
> because they don't actually pollute the source tree.
>
> Why? Because they all end up in that generated 'usr/include/' directory.
>
> So when I look at the source files, filename completion is entirely
> unaffected, and it all works fine.
>
> Look, I can complete something like
>
>     include/uapi/asm-generic/poll.h
>
> perfectly fine, because there is *not* some generated turd that affects i=
t all.
>
> Because for the uapi files those hdrtest files end up being in
>
>     ./usr/include/asm-generic/poll.hdrtest
>
> and I never have any reason to really look at that subdirectory at
> all, since it's all generated.
>
> Or put another way - if I _were_ to look at it, it would be exactly
> because I want to see some generated file, in which case the 'hdrtest'
> turd would be part of it.
>
> (Although I cannot recall that ever having actually happened, to be
> honest - but looking at various header files is common, and I hit the
> drm case immediately)
>
> Would you mind taking more of that uapi approach than creating that
> hidden directory specific to the drm tree? Maybe this could *all* be
> generalized?
>
>            Linus
>
> [*] I say "never caused any problems for me", but maybe it did way in
> the past and it was fixed and I just don't recall. I have definitely
> complained about pathname completion issues to people before.

I know you dislike this, and I NACKed this before (but too late):
https://lore.kernel.org/dri-devel/CAK7LNATHXwEkjJHP7b-ZmhzLfyyuOdsyimna-=3D=
r-sJk+DxigrA@mail.gmail.com/

Compile-testing UAPI headers is useful
(and I believe this is the only case where it is useful)
because userspace is independent of any CONFIG option,
and we have no control over the include order in
userspace programs.

In contrast, kernel-space headers are conditionally parsed,
depending on CONFIG options.

You dislike this feature for the reason of TAB-completion,
but I am negative about this feature from another perspective.

We cannot avoid a false-positive:
https://lore.kernel.org/all/20190718130835.GA28520@lst.de/

It is not <drm/*.h> but <linux/*.h>
However, it is annoying to make every header self-contained
"just because we are checking this".
Actually, it is not a real problem when the relevant
CONFIG option is disabled.
I did not interrupt him because he was doing this
checkunder drivers/gpu/drm/i915/.
()
But, I am opposed to expanding it to more-global include/drm/,
or any other subsystem.

In my opinion, the right fix is
"git revert 62ae45687e43"


If we continue this, maybe leave a caution
in capital letters?


diff --git a/include/Kbuild b/include/Kbuild
index 5e76a599e2dd..4dff23ae51a4 100644
--- a/include/Kbuild
+++ b/include/Kbuild
@@ -1 +1,3 @@
+# The drm subsystem is strict about the self-containedness of header files=
.
+# OTHER SUBSYSTEMS SHOULD NOT FOLLOW THIS PRACTICE.
 obj-$(CONFIG_DRM_HEADER_TEST)  +=3D drm/



--
Best Regards

Masahiro Yamada
