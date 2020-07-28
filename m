Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED412306EB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 11:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C45B89E5A;
	Tue, 28 Jul 2020 09:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A6989E5A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 09:50:40 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id s144so7000285oie.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 02:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p7WqU0daqgPYKzDM4wJY4PZYJHbY5NF/mgj6Y17PepM=;
 b=OrOtLw5EOmkRhXXIcYsw9TDIuzBhVZKGqOJAH/isn+0lcdD3Jrl499FjT3FlPrptex
 inWX7gaza/tr3nXnYkuumtjJl53aQwwmbqWksLtYZ7tdsYRpLvnK2XTYCv/8m+65Ufa+
 7DFk3TRCPt90E+tgIzUao4sOasvA27ToklnoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p7WqU0daqgPYKzDM4wJY4PZYJHbY5NF/mgj6Y17PepM=;
 b=XH2KCsaQLnJBzIKm1GgrqLQt/xFBSQ1pxh9bXj+dhrtKup+5jbJvbR5W84MgIbjhef
 HVm1T6GmLfOM0a8TfKs/t9asIgGLork4Q0OKsBxbACStVJf29agYhpEJgYPjpBdIF6Kn
 F0kbuJ8gxya/LckPp8ePPgzN1L+XBkfo+db3CZont2KSPM7owSWlgpuBEY2iXKJMCCqL
 40Cs/QpjmZL70MmtROiSPSD5UBPr8rncepBfFEMzhTe32cwKyMjQUbt9VtmTUA/hiGPP
 6yEK2DXm3ejOvnAVwyg/zHb6DNasMua596ezuZYKf2DIOH5Fn5tlV57CeeqtAHXH/2iz
 jGRA==
X-Gm-Message-State: AOAM532IpI8ryv6fG/thBwq+JgcklNmWZKi8SOJi0XG6JffEaKwrCvvM
 uonSxdwptuIU2Yc5U6O9pLxjQ9XPGTcWE6OinpZdOg==
X-Google-Smtp-Source: ABdhPJyZW+bp+9Nwgfg/xN8qMPQYWscCoqwnaoL0A0n3guJlRQVVgay29L57+3LBo5ONHbZ3iemXiiHIVW0XxKZO5vY=
X-Received: by 2002:a05:6808:88:: with SMTP id
 s8mr2583624oic.101.1595929840005; 
 Tue, 28 Jul 2020 02:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200727233833.05e48968@canb.auug.org.au>
In-Reply-To: <20200727233833.05e48968@canb.auug.org.au>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 28 Jul 2020 11:50:29 +0200
Message-ID: <CAKMK7uH773DCGvU92i1R-cexnsfYoxM=wrPZOYY6i1j+-xOBMA@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the drm-fixes tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 27, 2020 at 3:38 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   163d5446c37a ("drm/nouveau/disp/gm200-: fix regression from HDA SOR selection changes")
>
> Fixes tag
>
>   Fixes: 9b5ca547bb8 ("drm/nouveau/disp/gm200-: detect and potentially disable HDA support on some SORs")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Hm dim (our scripting) should be checking for this already, I've added
that after the last big round of malformed Fixes lines we've had ...
Dave, overuse of dim -f in your history?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
