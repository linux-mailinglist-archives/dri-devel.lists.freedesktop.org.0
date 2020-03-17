Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75176188BD0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 18:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392FC6E5BF;
	Tue, 17 Mar 2020 17:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5816E5C0;
 Tue, 17 Mar 2020 17:13:11 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id m3so126175wmi.0;
 Tue, 17 Mar 2020 10:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Su6bTvSI/uU7/aAEfpDKY4ByqlZ4ySZDg4mKuzIyoAE=;
 b=onHCrxll/nBTTJXWMjj4/PxkzIPJwru6P7jcenE6RAK0O2s6WFLiMulYU5q5F8DB7b
 Td9pqzKXT8NlCsayUZBmhNrM4pNucB9f0XymBwM8+3HbRF2QY5uZpfszb+cLK+rzkQnL
 ZdUX3UUuuwUJAWeKUYMdN0ODoslYYRuSdNrio1/ktfXrVUdfoOJLUtfOU1g1jvapOFqq
 JixE4G1DXC9YW4v76V28+/kUrs8o2kb5elMeG/nBDRDKyE9LZ+xSTDce1aVGktT1C2o3
 vlAaj1MsFW4viS8TgYP+5uAnpx7ypZe4ALEF0ZYsUkS9r2GqH8EP+QoUVFyvwMcMeOmx
 wPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Su6bTvSI/uU7/aAEfpDKY4ByqlZ4ySZDg4mKuzIyoAE=;
 b=OoBUu3mrLwdj0PPI6wGPdSIRLjZjdge43oXQEGDgJEh/aoo6zUJuGkLeodgetAnt2u
 k1QJiajTiiQ3+IOqbgKZyhBN4oNUX/Env2Ho5FmR/gCNy/m67rLk4oWP8JbR2o+YLphL
 L47VeyO3UmRL6iiuXYX29h7yPjvAwH0eubhEX49q/As2lKTu/MCNNWSE/tQ2zvR6m9DA
 bTWR+axjbWBrjbqQlg2eVf4m75eoUc8Vy+QOiN8ftfB+EIUPgwPByMolnmsUM2eUB5de
 9qPZt1rC5K56YFbSBkA408w9PyiNBBfCv3mvxGUIebfmE+XmoXEfcGjNdot36ntJyOJm
 EQog==
X-Gm-Message-State: ANhLgQ1FCfbB0QkFKFaOqU2ArfTX0zvKxGHM0dLUVPVrrHF1WGfM/l20
 4dypPcXIahiHGDUNQZXQExOTB0lkk8rwvcoiyAPsGg==
X-Google-Smtp-Source: ADFU+vvrlvW5Pq5+5jA2bzwrcnWqmMsg8VrMcvr00omZq98ezwQViP8P3jcUdWqESwzw3stGKMnxzrexhxAMx9DgvT0=
X-Received: by 2002:a1c:2dc7:: with SMTP id t190mr10908wmt.137.1584465189119; 
 Tue, 17 Mar 2020 10:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
 <20200316211502.GW4732@pendragon.ideasonboard.com>
 <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
 <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
In-Reply-To: <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
From: Jacob Lifshay <programmerjake@gmail.com>
Date: Tue, 17 Mar 2020 10:12:57 -0700
Message-ID: <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
To: Jason Ekstrand <jason@jlekstrand.net>
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
 Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

One related issue with explicit sync using sync_file is that combined
CPUs/GPUs (the CPU cores *are* the GPU cores) that do all the
rendering in userspace (like llvmpipe but for Vulkan and with extra
instructions for GPU tasks) but need to synchronize with other
drivers/processes is that there should be some way to create an
explicit fence/semaphore from userspace and later signal it. This
seems to conflict with the requirement for a sync_file to complete in
finite time, since the user process could be stopped or killed.

Any ideas?

Jacob Lifshay
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
