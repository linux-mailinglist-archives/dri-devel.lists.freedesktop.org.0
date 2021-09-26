Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A01418991
	for <lists+dri-devel@lfdr.de>; Sun, 26 Sep 2021 16:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8C889DFE;
	Sun, 26 Sep 2021 14:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947E689DFE
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 14:51:50 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id ee50so57775663edb.13
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 07:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sLce4anF/Ldxr9zJgqQp47ftX0X/kbCvqATSWd0SLuI=;
 b=S+hw9FjUgdENuVuqSrXHDlFjl4Zr9rPqWNEez8sEdpicMAbHwC2QIRkpRloWZzwpuA
 vcuMX59mB52afIhYL1N6sSE1uki387Gw42gR6DqohyNOmFG9GUak+ALFy6SY2nxvuJCV
 A2csKPZIvtE9OjBsqYJgK5KYHU3GQ5PWrOErJC+AkLR9AMU45iRWE2QcCuMPv9v8DKoy
 qoe95ToLD0LZgt1tjsejG8rlWCzpSokJCGwoxOPRyCCUn7/eZLQrd2YksqMy8/yvhgA/
 Uri7Z7xPRnCKqsMT7fOrkvP9dYwRU1KQ/eI0xQFhBswN1xq+Tq3yra/1IUJWxnPH9inB
 lZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sLce4anF/Ldxr9zJgqQp47ftX0X/kbCvqATSWd0SLuI=;
 b=HAEzfrWLHnkkp2ZgmPjcGekHid5UIMoBSl8DVwCa3RlR09xu+SeZcOIsS4QCvhUR01
 YpxXelIaGsZ9qjangAvK9wI7qfWSOsZmUxe/sLmlMBVt2Ux1lbTzHK8053x54mjMKkl0
 7cOy8sWVqyD8zx9mrcgxzN/2E9fSrx9kMzlvz13Zz8H/R4BNmW6Eg17DkXqmNrOFRWbC
 mnV5didaFxxyf+Y5RulzYjltsSHk/j5YMuKWcpqB89oeiZbcGdrGNBzlf5dCh8oyMdDV
 l75lg38NI+1f9Jmj3yYacLoX3c/uTo/JU7hBIQyyq4ksSZs3ejKmppHl1lFHy0wV+Emp
 5L3w==
X-Gm-Message-State: AOAM532AzC/H7YbYS6ZesNZpAm/Hz7XeehE2eJtcffL9mm3s8NiyeFET
 D9nI8xqA1P5WeugN+0k77PSZcZRAXhGWBZQN1mLLUg==
X-Google-Smtp-Source: ABdhPJwEI9Otw5j+Kubnt1ZjqadmE4duy9lhN+7xJz+VYfyRhHhxfTsqb0Bln6cUv2IXEVGS0gPu4vV4A28m+/m9Cgc=
X-Received: by 2002:a17:906:e20e:: with SMTP id
 gf14mr22462818ejb.244.1632667909119; 
 Sun, 26 Sep 2021 07:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
 <3b9463e88d88ce85205da08f8263252da7726ade.camel@mediatek.com>
 <aba7fb4ffe6e45ac90869b5017468386bce64d28.camel@mediatek.com>
 <b7ed8b71578a98704e9b8ca29cac63c67cc14b3f.camel@mediatek.com>
In-Reply-To: <b7ed8b71578a98704e9b8ca29cac63c67cc14b3f.camel@mediatek.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 26 Sep 2021 11:51:37 -0300
Message-ID: <CAAEAJfCHEBFc8B7C0bu7UxtJdffvDarqgA-rset1wPjLOiV01A@mail.gmail.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
To: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, linux-media <linux-media@vger.kernel.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
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

On Sun, 26 Sept 2021 at 05:27, yunfei.dong@mediatek.com
<yunfei.dong@mediatek.com> wrote:
>
> Hi Ezequiel,
>
> Could you please help to give some feedback when you are free for iommu
> limitation?
>

How about you work on the architecture I originally suggested?

As the saying goes, talk is cheap, show us the code.
So let's see the code and let's discuss the limitations
with the code.

> According to google's suggestion, it's better not to use v4l2 async
> also.

Hum? I haven't seen such objection on the mailing list.

Thanks,
Ezequiel
