Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C68188BE8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 18:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8966D89E32;
	Tue, 17 Mar 2020 17:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E9889E32
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 17:19:00 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id z3so9932254edq.11
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 10:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gu9EXPTfKkao/W8jv/FemJ9MYn/kCLdNIsXowFHz1To=;
 b=xqrM59kbnlls2IQoZqH75rUe2BOQ6HzHDSTFkQdK6HF5M+Cv/SrLIQ+vdyOfEF+g9Z
 94pcilXz4pLxcGBnrvIfAUyuF63JJ/1I4d6L+9uRLGU4pE/nvHkPUfcZfO9swcfQIB5U
 hCXEKksGkk5E+/Zc462N4cOaJm5Xiz1H3oB7O0nXhtexfuj4UfgthZ7EnFJe758Noa0g
 MuUSvdmjP3FFNJpr0R/1CNgr3GEzc/2IGtMl4MY5sJfQ18CKIPTspKC6lujqQjyGsaQP
 uGOUBxG73NQpp9CGO3S/iIrPElg2nGTFJydK83zxZelC8cZPbtV6CSg9BtJYb2fqYgIL
 Fnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gu9EXPTfKkao/W8jv/FemJ9MYn/kCLdNIsXowFHz1To=;
 b=rb6uo4UBNiGiKiWVOaqPRSUmCef0f2W5hflngyETSqmR2M4oH7ko6ilmDdOb8yxc/F
 hVJtH4Zhny5VTFPErW7uqIojSLvOKKecyj1NFEPYXg6xGtHoB6d6P++4jrVrjH9gpD7e
 W/ylZwl8zmVY5iLdZzd5uTOjefTZXqabrW8++3rA6M2gnNHyEtVRBuB0zhwrotfGduVN
 wTVli9cZbcpP3QWInRmfvuvOzUc8k5Tf1TLhBlLBTYXV6CTgvVuloraoiOqYj9c9d9xo
 fEOvtU+AcZERJwZj5fzTsQDMoe5tU8IkLCYD40Z7i/07lYEsfPjKLK4frszETqX9akT/
 Ncgw==
X-Gm-Message-State: ANhLgQ22OJpeMQU6enDAWM+LM2D7FezDCRy8fNT/i4r35TvTIYpHyE9H
 oBvdYASIDBv6gL62OvTbE3CSwplAyjt0ukPDm3PmbA==
X-Google-Smtp-Source: ADFU+vt/7ery+oZwZWRxqgyPq9+WVXJuHw6ERorv5ePHTAGsZPCKzeZwlC9VmoCr1kyUNM9bXT6foUOjXCTgx8IBxtk=
X-Received: by 2002:a50:eb05:: with SMTP id y5mr3809506edp.168.1584465538957; 
 Tue, 17 Mar 2020 10:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
 <20200316211502.GW4732@pendragon.ideasonboard.com>
 <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
 <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
 <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
In-Reply-To: <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 17 Mar 2020 12:18:47 -0500
Message-ID: <CAOFGe94vX5CMyjs8jehXj3f7t9yu__=-N+etNz5eY7sqwqb-jA@mail.gmail.com>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
To: Jacob Lifshay <programmerjake@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, xorg-devel <xorg-devel@lists.x.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 12:13 PM Jacob Lifshay <programmerjake@gmail.com> wrote:
>
> One related issue with explicit sync using sync_file is that combined
> CPUs/GPUs (the CPU cores *are* the GPU cores) that do all the
> rendering in userspace (like llvmpipe but for Vulkan and with extra
> instructions for GPU tasks) but need to synchronize with other
> drivers/processes is that there should be some way to create an
> explicit fence/semaphore from userspace and later signal it. This
> seems to conflict with the requirement for a sync_file to complete in
> finite time, since the user process could be stopped or killed.

Yeah... That's going to be a problem.  The only way I could see that
working is if you created a sync_file that had a timeout associated
with it.  However, then you run into the issue where you may have
corruption if stuff doesn't complete on time.  Then again, you're not
really dealing with an external unit and so the latency cost of going
across the window system protocol probably isn't massively different
from the latency cost of triggering the sync_file.  Maybe the answer
there is to just do everything in-order and not worry about
synchronization?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
