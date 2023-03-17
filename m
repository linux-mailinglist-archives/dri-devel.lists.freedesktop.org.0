Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F916BF13D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 19:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE49710E11D;
	Fri, 17 Mar 2023 18:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB7D10E11D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 18:56:40 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id n2so6756627qtp.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 11:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1679079399;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PTdUlyOfdt8if93QsQQjrsJH2A0sNNFk09AT9iR57Ws=;
 b=EFi3o0HArF7UU3RivOVQRrRlFW6IQCaBsnCtxNHNCGuutqLAXEx8v31+MZ2nNQY+Tg
 FaeF8G47moLnzYjlgYcpsL4zHbS1+XqXmfiOuBODfSQ1uVBlTkeJFAHKAxsFaubZmE5x
 Zipjfqwm3/dJi7P5ugUcx1BfyqT8Caou44eRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679079399;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PTdUlyOfdt8if93QsQQjrsJH2A0sNNFk09AT9iR57Ws=;
 b=0047yH0XHW5oCGPCw8U4pK+ZanhD3yUwRfdYdOlJvgCiSxw15pgnoUNCJFrkmVlNoT
 vjcIFqC9kzPqSzMLN/0TMhBGYvutvGw+fIEUZJ8pNJbx69swK5Ya6fL8sxFkCXLy4Hg3
 vnbkSKu9JDZWTZvYza5f9yeNk+I4VIwzW7KgsYuPCyomb3zjPL/21i2u+Y7918Z+Tr6y
 747shzU7ALrHR71yqn8d4BPJisJK74dxES3n801dHjoUC19DUIz3T5tfeB8kDqUiwadl
 FW3pzS3KD9R+wcwplbXf7lU9cnXAn9dinEnQKyNVQ5xMHArb4RRW0+T0AkAGrIiped2Y
 L7WA==
X-Gm-Message-State: AO0yUKXoHb60LBoUrvJAetCb/XLwIzGyxbPpKjNPOEcG0xqu+GStBevq
 8G2119CPpXh99khiHa4oFue36w==
X-Google-Smtp-Source: AK7set9jipsIbDPeQ8GoSgJyYG70m2o786TV4vW4nF1NZSCv49CfSTMV5e2Aa66Gvx3kXmdFh0Da1Q==
X-Received: by 2002:a05:622a:1394:b0:3bf:b896:ff63 with SMTP id
 o20-20020a05622a139400b003bfb896ff63mr14593551qtk.52.1679079399521; 
 Fri, 17 Mar 2023 11:56:39 -0700 (PDT)
Received: from meerkat.local
 (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
 by smtp.gmail.com with ESMTPSA id
 r142-20020a37a894000000b00706c1f7a608sm2156724qke.89.2023.03.17.11.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 11:56:39 -0700 (PDT)
Date: Fri, 17 Mar 2023 14:56:37 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Matthieu Baerts <matthieu.baerts@tessares.net>
Subject: Re: [PATCH 0/2] docs & checkpatch: allow Closes tags with links
Message-ID: <20230317185637.ebxzsdxivhgzkqqw@meerkat.local>
References: <20230314-doc-checkpatch-closes-tag-v1-0-1b83072e9a9a@tessares.net>
 <c27709bd-90af-ec4f-de0b-3a4536bc17ca@leemhuis.info>
 <81f8be3e-4860-baf9-8e13-fec3a103245b@tessares.net>
 <CAHk-=wh0v1EeDV3v8TzK81nDC40=XuTdY2MCr0xy3m3FiBV3+Q@mail.gmail.com>
 <CAKMK7uESvC-zgGJEup1OAmf34Rk8s5cCrSBYUNP_REFUuer1-w@mail.gmail.com>
 <7974f3ec-3f17-c21c-139b-fd5651871a75@tessares.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7974f3ec-3f17-c21c-139b-fd5651871a75@tessares.net>
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
Cc: Jonathan Corbet <corbet@lwn.net>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-doc@vger.kernel.org, Thorsten Leemhuis <linux@leemhuis.info>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, mptcp@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 17, 2023 at 07:41:04PM +0100, Matthieu Baerts wrote:
> @Konstantin: would it be OK for your future Bugzilla bot to deal with
> the generic "Link:" tag instead of the specific "Closes:" one?

Yes and no -- we can easily figure out that "it's a bugzilla link and it
points at this bug", but we can't make any decisions based on it. Just because
it's a bug that is mentioned in a commit doesn't really mean that the bug is
fixed and we should close it.

E.g. it could be something like:

    foo: initial workaround for bar

    This implements a workaround for problems with bar (see bug link below).
    It's not a complete fix, so further work is required to address all issues
    identified in the bug report.

    Link: https://bugzilla.kernel.org/show_bug.cgi?id=5551212

It would be wrong here to auto-close this bug, but we can certainly add a new
comment that says:

    This bug was mentioned in commit abcd1234:
    https://git.kernel.org/linus/abcd1234

-K
