Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD5542D96A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 14:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4436E147;
	Thu, 14 Oct 2021 12:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0146E147
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 12:39:00 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id d3so23600047edp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 05:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8OYfFNdhKlh5vCRuRw3rL+lpyG6Iz3zsndXlWQuOqNI=;
 b=rO8Cimbu3ArvFcSKskAMaEz7aYPRXYb1TiaXDvaU2b70yNbLMOWMpDmGJFMN1Rnz7G
 M297CLhdxw2O0YteyYq9YLtuf9NyzJWhkonUS9AlKuTCLX+CrlBF3jbIZ1vLEbv5JyfN
 cq9XMY7pO8xXwClCitODDk8MvmypSpa56G3dGbCHCnwUA1DHpXSTI+VBZQ5QRFvuARgD
 rnQqcQgS7V45c7G2eEvq3qx6CxbpHc1h2Zfqt8gRETh7npquNH5NFa9Iv1o2PkOi7Rq2
 EAzYMngcgh029FfDuYQ8j5b/8ea7PNtfWGsSImewcj1GyCS1CqkK4rdJsai0iuCsWFE0
 01UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8OYfFNdhKlh5vCRuRw3rL+lpyG6Iz3zsndXlWQuOqNI=;
 b=Fs9fwm6r+0hIrzNwMIDpJ8cX5TpH+vnG+V2VDQo2NNeGXjZYXbyuYac4waqZsYXXn6
 bYSeAdQ+QUYLGl+B/4ZRfM2j56nUuTVyXOtwJmhZRb3FGQYuZBwvRleoYJm+RNBH6gdM
 3PZyttKO+WoxzyDQqFv2U298uo0q5COdzwPl8vZLEV6VFupVjVbi4hT0eYt1dqYViPsp
 hJGHpuSExpz+7GmWlXZUcrrkWJQAv1xbIaOeqNhdGOeUEXjSUzIihhn9+z00en2+VX4I
 H01Odc/J+E+vjoJqpqdFwNs/M0jjkH4kH/rPQI3WWJL5ADOeOFOCVHcdp5shexrBNw+X
 J3fg==
X-Gm-Message-State: AOAM530qnLf+Dkf31bYsZuMpTYX2nYLPWhUrbULYtDGQppVtrHCtL5Tt
 BGdz+6Qir1UrLdaUA8ptEoI6Ujx6XzpK4kM/OfVOfA==
X-Google-Smtp-Source: ABdhPJw5RwGlWi8DUKaA9l8+IoPQsOFoPKhiFW27/0Uo29ALZMFUdlPeJGnIjKW+HthuHqOmJG3IW10gLCzTjzFq+d0=
X-Received: by 2002:a05:6402:40d2:: with SMTP id
 z18mr8324506edb.362.1634215135566; 
 Thu, 14 Oct 2021 05:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
 <3b9463e88d88ce85205da08f8263252da7726ade.camel@mediatek.com>
 <aba7fb4ffe6e45ac90869b5017468386bce64d28.camel@mediatek.com>
 <b7ed8b71578a98704e9b8ca29cac63c67cc14b3f.camel@mediatek.com>
 <CAAEAJfCHEBFc8B7C0bu7UxtJdffvDarqgA-rset1wPjLOiV01A@mail.gmail.com>
 <b3fa00e8b66658e120279e37261cbdb5db7edf52.camel@mediatek.com>
In-Reply-To: <b3fa00e8b66658e120279e37261cbdb5db7edf52.camel@mediatek.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 14 Oct 2021 09:38:43 -0300
Message-ID: <CAAEAJfD0=0zNOS8ydu-BwpdoCsADAjdpm1LXBzZ2T8D=JQmYtg@mail.gmail.com>
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

Hi Yunfei,

On Tue, 12 Oct 2021 at 22:17, yunfei.dong@mediatek.com
<yunfei.dong@mediatek.com> wrote:
>
> Hi Ezequiel,
>
> Thanks for your feedback,
>
> The driver can work well now according to your advice with
> of_platform_populate interface.
>
> In order to separate parent node with children node, parent node is
> master device, children node is component device.
>
> The master and component are registered platform device.
>
>
> Could you please help to review the patch again when you are free:
>
> https://patchwork.linuxtv.org/project/linux-media/cover/20211011070247.792-1-yunfei.dong@mediatek.com/
>

I'm glad you managed to simplify the driver. I tried applying the patches
but they don't apply on media master. Please push a branch to gitlab or github
or somewhere public.

Keep in mind that when you need people to review your code,
it's generally good practice to try to make it easy on them.
The harder you make it, the less inclined people will be to
spend time on your work.

Thanks,
Ezequiel
