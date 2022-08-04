Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C682F58A037
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 20:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9D1A361F;
	Thu,  4 Aug 2022 18:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0589FA35F4;
 Thu,  4 Aug 2022 18:06:42 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id o15so277698yba.10;
 Thu, 04 Aug 2022 11:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=W5vtOsGoRNFUeWobww4WWm+woSsVgSrVSuurs+lnPco=;
 b=Q4OVg/NCWfPBpO0ZwT+yZpjwRI5Ie989Hve6f+OWo+s3Asy9HPU46cI5AIaTJdwuNj
 NjmBa5dIdzN0o/iUiosBRTX85lzcOmurw8yGwJzgJkPQYVw10FbxjXSrGeKDmqs0BXYf
 n6ePRZze6YOK4/F60l5ES0L2Wro7NL1X+FOQnKyjwlB+EivnOGXcPo2dSwVzqjG7lgve
 Duwd+X0N+MA4+cwin9Ls9y894QMToWhZ5iz6qpEv0WfnHjVAkUdXPUZKMTwIQvZEa1Qj
 5/AL2iZPzqcNSvCTmTlpPAZ0uSVVrU/53dFvYKzwaEVDbsjhh9RPBE1UGMJuMEFgCcSG
 vYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=W5vtOsGoRNFUeWobww4WWm+woSsVgSrVSuurs+lnPco=;
 b=2QFkSVEgy5GBSsYIdkU6qkdnOYmIlN+BTMet2y/Rmrq+cGtTWFopvlWOt7ziKkA+gi
 GHpZmjuTHTW7/HDxDpBiOCCwR8afb3fgEk35uu/ByulwwAAnzi1VgYxPRUYBIYGLo4+V
 i+58Qxwj1+z8gl4YU6ngoZ9XOoJSGp12h4Eu94mq51e08oSIXRmPT6EceLlPr1n1e6lN
 HdBYHjG/OSp/OEAHHXVDAG3id5nGfoLyW9mgC1PWvYoZWh7eUUXGKw1BWI3llQouMUwa
 KtZop27s3fLg7/Uw1Ar4RgWltf6icRgsnE5BmKWbiSfZsznnbImSRUobdlCpzenox82y
 2Ysg==
X-Gm-Message-State: ACgBeo0Sk/VJ9nrCppofTdj98jg9ASaFf+EkjMT7ATOPRqHCOsKw3IcO
 TGg1rX3Ry+xGBP8MIholIatPTXyiwlLgEXmh8nY=
X-Google-Smtp-Source: AA6agR57/OeeTbYU5ZkJThBEpdOtwXIQZvZCIqiQ04Q1TZ4ctcZEEhntZH9Yy6UT9m1c3NZp2bWN9S5OdB1CpEm2Tx4=
X-Received: by 2002:a25:508b:0:b0:672:e8af:3bfe with SMTP id
 e133-20020a25508b000000b00672e8af3bfemr2283126ybb.106.1659636401974; Thu, 04
 Aug 2022 11:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <Yut2otE1h2xtC79o@debian>
 <CAHk-=wjPF0dXvDeqPiSzpev4KhhWU0-R8muaYVF73vy2Vw=QTw@mail.gmail.com>
In-Reply-To: <CAHk-=wjPF0dXvDeqPiSzpev4KhhWU0-R8muaYVF73vy2Vw=QTw@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 4 Aug 2022 19:06:05 +0100
Message-ID: <CADVatmOTkf1LfC0teDe8OLm6+Ctm28TWvefRM=frf+aB_seSKw@mail.gmail.com>
Subject: Re: mainline build failure due to 6fdd2077ec03 ("drm/amd/amdgpu: add
 memory training support for PSP_V13")
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Chengming Gui <Jack.Gui@amd.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 4, 2022 at 6:17 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Aug 4, 2022 at 12:35 AM Sudip Mukherjee (Codethink)
> <sudipm.mukherjee@gmail.com> wrote:
> >
> > I will be happy to test any patch or provide any extra log if needed.
>
> It sounds like that file just needs to get a
>
>     #include <linux/vmalloc.h>
>
> there, and for some reason architectures other than alpha and mips end
> up getting it accidentally through other headers.
>
> Mind testing just adding that header file, and perhaps even sending a
> patch if (when) that works for you?

Tested on alpha allmodconfig, that worked.
And also sent the patch.


--
Regards
Sudip
