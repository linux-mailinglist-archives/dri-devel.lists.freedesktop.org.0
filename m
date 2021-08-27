Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F143F9B17
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 16:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B8E6E985;
	Fri, 27 Aug 2021 14:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED3C6E985
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 14:46:12 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id l10so7234555ilh.8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 07:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TzOUQOR04WNA4/YVeKBqMlLPAY17QH2nosfTS9IvUQM=;
 b=tZDh69nDdVY5p7wRtH8bR1I7nA5Lti7qTlnAa+w2NJMyRCyNUDyujRpwCrdFBwcM9c
 wOkBjm2SZoBOXeA75VW9eEXPBO6RHPJvykSOIAfv1w3a+ad7jPs7uYOiNSuusNIlumh6
 nSsyDYW3SbZjy88g9okTipYz0IjSQXXJpb/+3Iyz0KTpIxP3RIK7YtTn/G5e2UkTckvB
 qey7hclft0SQShoNbO3yj8qYz8OJrSDRy8XJpTwREgJbKNKOWpsPbrc1br7t5+2SRnix
 bjTxpNKKuDAp8QH8C+hV3mWtFPjPa32fe/lhHP8ffNAOiGfPv6FaFus9FhAcWPK/Qh83
 QsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TzOUQOR04WNA4/YVeKBqMlLPAY17QH2nosfTS9IvUQM=;
 b=ihZhA2nCdntPjsuJQjbeXU7d9vM6IWGUKMiajhc/QFWTYzlWFNDcOPh6mIbd/Gk4NS
 RGOBoU1s6Si9NT9KCdkkhPyIuo/XrLNAasO2sJAMFUW6QGSv1rFY6iY5dB5tG9cRO2NX
 XZezhpAH6lhaoA1Fat1BPYEPqEHbHImsQc3whGqjJJp2iOfSxStgyuppMGooenOCYSoJ
 3GBz2gr6KKGS2uPekT/OIHPVzT5wBmpCBgpJZLAsIdRYtJjiNeMo9YlXIZwgJ1TZz9fR
 qu+puJchucX6EHJWCdaAZoypssM88jxC/IhfCBHBU1yDD7Z8nGcoUyBczjA7ZL89zyzV
 PqSw==
X-Gm-Message-State: AOAM5308j4jGO8Zj5gCfv8NdkJHCLB2P8rsSV5ugJ27RkdGQfNzmviwZ
 ECPn9pVVD21gadyKkV0VP0xDsJgceovPAznZWWfyOg==
X-Google-Smtp-Source: ABdhPJx90jiXR/+Kuna9VvwisR0DddZo5lVJ7fj2PG+cx5IfLN0T4GMa1sjlVy8FyIiIF7WR0UGBSnO1/nHgexAlrhc=
X-Received: by 2002:a92:a008:: with SMTP id e8mr6603471ili.187.1630075571040; 
 Fri, 27 Aug 2021 07:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210827082407.101053-1-yangcong5@huaqin.corp-partner.google.com>
 <20210827082407.101053-5-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20210827082407.101053-5-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Fri, 27 Aug 2021 07:45:58 -0700
Message-ID: <CAD=FV=URvNk1rBpRaRKTjGS+0u8PePd7reY9ix6cT272_MZcjA@mail.gmail.com>
Subject: Re: [v3 4/4] dt-bindngs: display: panel: Add BOE and INX panel
 bindings
To: yangcong <yangcong5@huaqin.corp-partner.google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
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

Hi,

On Fri, Aug 27, 2021 at 1:24 AM yangcong
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Add documentation for boe tv110c9m-ll3, inx hj110iz-01a panel.
>
> Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
> ---
>  .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml   | 4 ++++
>  1 file changed, 4 insertions(+)

Lumping these new panels in like this seems to be what Sam was
suggesting [1] and it seems fine to me. Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/YSPAseE6WD8dDRuz@ravnborg.org/

Note: please make sure to carry forward Reviewed-by tags to the v4
version of this patch series unless something substantially changes
about a patch.
