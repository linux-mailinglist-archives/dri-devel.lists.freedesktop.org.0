Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D46D357E00
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 10:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003C46E1DE;
	Thu,  8 Apr 2021 08:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F3E6E1DE
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 08:22:51 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id ay2so641230plb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 01:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AZq0jejn6N+JX8GL+6Kd8YjO9l0DTf441L7DW7TCgZA=;
 b=zNdp0UN5zNh0Hn5Z1TCZ3xDcFAQ1A/npFiMYR5jxw8W9T70kCTfHahKhRJNaJxEJuY
 gm3/GSjfxf4P8/R7Q4czouby1tKYVRbqQul+1WmrYzcctkyWhY/yfz2YhWmMiqFbzE66
 ixXoeBEY52sm6xSmwSpa1ULA8Wd1LLT9VrotUFu9dOUwjiDIoXHe5MI7f30fUPDnL2yS
 je+hFLdA8T/TQBQb6qsZ68IKwKkzNqvvARWWtgq0Zf0mO9l5eLn/CV7QcwSqCJNFZsp8
 QkFnz9hWN58yypkk9hbrTw1P4PA05Ndb2lyi2HD4wTW4IyFAVQg+9KdcSix6f/aQjk1m
 BOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AZq0jejn6N+JX8GL+6Kd8YjO9l0DTf441L7DW7TCgZA=;
 b=jurZnRyn83Jvk6A0tPE39u82JySoWKMqkoW+ylZjFIPVmVHoZ3A/CxZmi5oY9+bDtc
 e9ugzfX7IY1xxFr4l8O+5VWRI/a69nxN0NgBKrsr8vn8sMgswvMe/WVCBUOqSOIsuxck
 B8D9MwV43B1cB2teJmaWbRn04iu1ntnt+vuUSxbS/FFKM9Y94ewJUDLjtU31ktXkDCIS
 MRn9vP21N4grfTr+uSWzhYOuJ2KQrKgmhFBw/wgrkai5ZCnuulodyxyHAAFoA2wbl4+w
 u3/84C3AOFQp1pWd8FRPh0mXsxYPs2ZLW1wrKZ23XIVUw17c5Jgolcw6bDTkzP4YdOpF
 LX3w==
X-Gm-Message-State: AOAM530wfO1RkxV9iTd0POTgEkZ35SjNNyjxtuun4STOOjzgRcun/pSF
 k4GGuMqE0T7gjSlsykFr1YwAAnc27MJn9pVv9Qxc5g==
X-Google-Smtp-Source: ABdhPJwGCM6bLS59WwupekGslOIZhBXBOCosyKkekU0nP0w9L5cuaeswRG9jxwFqCPpkR2ye5T4uJnMqVad4uqt0AJY=
X-Received: by 2002:a17:90a:516:: with SMTP id
 h22mr6869903pjh.222.1617870171527; 
 Thu, 08 Apr 2021 01:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210406090733.169989-1-zhangjianhua18@huawei.com>
 <CAG3jFyvC6ozPxQ=TPdPgLAugKky5AhOZGJSiw0Dc3Kn5Pba0cA@mail.gmail.com>
 <d9bd5abf-0293-6155-dee0-20199fed1fc0@huawei.com>
 <CAG3jFyu6YY5pr5bdvqAbzZu0GG0z=PWP+JHL59G26cg0P=563w@mail.gmail.com>
 <a40abdd7-af43-28a3-1b79-0de6ca0c0093@huawei.com>
 <53492034-4cec-12ed-ae27-d693686084ee@huawei.com>
In-Reply-To: <53492034-4cec-12ed-ae27-d693686084ee@huawei.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 8 Apr 2021 10:22:40 +0200
Message-ID: <CAG3jFyue0Jydf+mK2NxzLkaX81VPuuF8daXC0DFcNmjnfzOMDg@mail.gmail.com>
Subject: Re: [PATCH -next] drm/bridge: lt8912b: DRM_LONTIUM_LT8912B select
 GPIOLIB
To: "zhangjianhua (E)" <zhangjianhua18@huawei.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, johnny.chenyi@huawei.com,
 heying24@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Zhang,

On Thu, 8 Apr 2021 at 09:10, zhangjianhua (E) <zhangjianhua18@huawei.com> wrote:
>
> Hello Robert
>
> I am sorry that I make a mistake about the compiling error of lt8912b,
>
> the reason is that lt8912b miss the header file <linux/gpio/consumer.h>.
>
> Although there are many files reference gpiod_set_value_cansleep() and
>
> devm_gpiod_get_optional(), they all include <linux/gpio/consumer.h>
>
> and not occur the compiling error like lt8912b. I have send the second
>
> version patch, please read.

No worries at all, and good job finding the real issue. I'll have a
look at the next version.

Rob.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
