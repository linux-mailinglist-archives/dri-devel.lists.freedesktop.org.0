Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C07E38DF10
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 04:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C5E6E064;
	Mon, 24 May 2021 02:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240E56E064
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 02:04:06 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id p24so38027848ejb.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 May 2021 19:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=e40YU14tnT4YF3bNas2mhc8Ad2sq47+duMj08U8tfNE=;
 b=rZsuxShfTtwfbNTlAwrYwYjV0F3QjWaFZtPYfrhuaKF1ASINwipAu3G2Nzs2jT7qUS
 Uk+HcW83lNtW24yFA8rFZdXbvq/HyNmc8edvT6dk6cUzgXvWwe5SLHD+L6uAHB8/vNtV
 dqOWPRwYQTro84BqK+8hDzh+DftWkkFk1uSQlkQtskZEKrzgz8pU7HpbShjnYRgLVAlw
 C3o8/8s2GhJgvnUc5QCDIKjlVNjPnZsFl7y390jxAkVLX5fKWqNmW7gPCRJ7zxdeg1PZ
 Opfkmc5AC5FVqCduMTXhAbvvEc+CMQrkXKK037uwXSyEe1iR138Ct6x4QPJCorCsGxK6
 CezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=e40YU14tnT4YF3bNas2mhc8Ad2sq47+duMj08U8tfNE=;
 b=T7RZ9intTgiGa1IPPcZjqFxQqRNxe4LxMfikE3EWbImcv0JCkXkaiyP4px/00TqOIZ
 mXNUVWdNN6nSb9gp83ZPtS/8du1aLc9ktidaNK0LM4PgS1GxTCO4yARpB9BO0apsfI1O
 hoH3PJt+yueBNBD2O+Rn3Y4mqklf5OaHL/EV1IQxeVZtzMWDwRowCBle/wWWF7LIPV1c
 Oo70hIA6wtQpnkoaHEHiU/zoCbglkdbtsazZa1PgaiRbxQuWbZm2WhAkosd4D908XSPq
 pr+JpDiKgZC5PTmoPF4qSLDiPqTjj3u06r5jHgGLX60moT5nq/O9/hrRC2VPTSSeVO2S
 y0VA==
X-Gm-Message-State: AOAM532/Q6ChJvNBFau0P0gt0RXC+SGaqk5fw7BEsDheoqdI9a7C+moN
 tkGDf/ywOjPu4nG+6Z2oBO3+MYyAjysOBbcVR3UbaTb1Bi3/Kw==
X-Google-Smtp-Source: ABdhPJy2DvY5IJQ76LcnIf3S0snTO3GwDcNs9LYvRU2/iM/Lb5GCX+V++K5WHfo4VWn9mt+US+PeH35sUctM+bYiGS0=
X-Received: by 2002:a17:906:1496:: with SMTP id
 x22mr21257244ejc.419.1621821844476; 
 Sun, 23 May 2021 19:04:04 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 24 May 2021 12:03:53 +1000
Message-ID: <CAPM=9txJQh31KE7v4YN4s9j-cYQEUSRPh7Qg5j2TyNCLNbDySQ@mail.gmail.com>
Subject: dma-resv ongoing discussion
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jason Ekstrand <jason@jlekstrand.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'd like to try and summarise where I feel we are all at with respect
to the dma-buf discussions. I think I've gotten a fairly good idea of
how things stand but I'm not sure we are really getting to the how to
move things forward stage, where is probably when I need to step in.
Thanks for keeping this as respectful as it has been I understand it
can be difficult. I also think we are starting to find we moved the
knob on driver development happening in company siloes too far with
acceleration features and hopefully with this and TTM work etc we can
start to push back to upstream first designs.

I think Jason[1] summed up my feelings on this the best. We have a
dma-buf inter-driver contract that has a design issue. We didn't fix
that initially, now we have amdgpu as the outlier in a world where
everyone else agreed to the contract.

a) Christian wants to try and move forward with fixing the world of
dma-buf design across all drivers, but hasn't come up with a plan for
doing so apart from amdgpu/i915. I think one strength Daniel has here
is that he's good at coming up with plans that change the ecosystem.
I'd really like to see some concrete effort to work out how much work
fixing this across the ecosystem is and whether it is possible. I
expect Daniel's big huge monster commit message summary of the current
drivers is a great place to start for this. That is if we can agree
dma-buf is broken and what dma-buf should look like tomorrow.

b) Daniel is coming from the side of let's bring amdgpu into the fold
first, then if the problem exists we can move everything forward
together. He intends on pointing out how alone amdgpu is here, and
wants to try and create a uapi that at least mitigates the biggest
problems with moving amdgpu to the common model first. I'd like to
know if this is at least a possibility as an alternate route. I
understand AMD have some goals to reach here but I think we've dug a
massive hole here and paying off the tech debt is going to have to
delay those goals if we are to keep upstream sane.

I'm slowly paging all of the technical details as I go, I'd like to
see more thought around Daniel's idea of fixing the amdgpu oversync
with TLB flushing, as it really doesn't make much sense to be that TLB
flushing on process teardown is going to stall out other processes
using the shared buffer, that it should only stall out moving the
pages. If that then allows aligning amdgpu for now and we can work out
how to fix (a) then that would rock.

Please correct me where I'm wrong here and definitely if I've
misrepresented anyone's positions.

Dave.


[1] https://lore.kernel.org/dri-devel/a1925038-5c3c-0193-1870-27488caa2577@gmail.com/T/#md800f00476ca1869a81b02a28cb2fabc1028c6be
