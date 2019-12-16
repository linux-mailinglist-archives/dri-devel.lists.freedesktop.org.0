Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DAF11FFC9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 09:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDCA6E44B;
	Mon, 16 Dec 2019 08:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6876E423
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 02:42:50 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id x5so1236646ila.6
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 18:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9aCQDna0JdNgAijPNYO66CG/8UAC3gxJw6W+92Szu1s=;
 b=kiQS2TqrzYfZYPU/1gnhQNwf7BaK3yuKuPbUIr9uvHPiSCVvyG2e2bbRtCemQsxl+w
 ZI9NXg2Uw8JfEi4PJI9oCU3NwggR0UzFqsjdiF3tKXpqqx2Oy97r41md083YYxvbFqlw
 lHfY5VBlJ7w1kDKrjCWmEaKZBPgUNS6IoHRpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9aCQDna0JdNgAijPNYO66CG/8UAC3gxJw6W+92Szu1s=;
 b=XyRTQOtpO/vsYvVoiq6LYqOEopVOxsN75u20DGBszRCZxjrymasDy3ZOZxCZKJWS5l
 jmV7CfED8TivY7Rxx7Eh/uM2r1WYMy7KqZZNECvswIztxZQmLwebXOcYMNcqJNuFk0tQ
 HgGhD1Wkj6MezSb7+VnxyxCZ8roa3Y8UnR8xBsR6rqxufBVUAfHV1Tfxxgkqx6Qp4koJ
 Ffs+9bzXYvB5o9NRMK6zJzW8ROLrZlDksFuB86i0kM/NS6VtHOLjENvY2gRtjgauxPc8
 1QLitSr7Yff68K8zDIivsmYV/a55dgIv4hj1FMLKv4tONd9BiDjPmKqQrTcPcu/Z2+CN
 dXyg==
X-Gm-Message-State: APjAAAWrpDaNkjWp89d2p3Fx2/OZxFf209+0JeKyrqQKv9rGHvhMV7u0
 CacFmkh+nqd0RrMP/1Fz8zHcDRKMAB6T08ORiB6ztA==
X-Google-Smtp-Source: APXvYqzbg32oU48Vmt3h27I+7GAVGf3W+sKHDO/Z56LHLEB+l1l4zmiyGkYXciJP3Lxka1EKNGXP3lMjw3WC7PBmK/Q=
X-Received: by 2002:a92:af8e:: with SMTP id v14mr10077850ill.150.1576464170096; 
 Sun, 15 Dec 2019 18:42:50 -0800 (PST)
MIME-Version: 1.0
References: <20191213095215.17068-1-jitao.shi@mediatek.com>
In-Reply-To: <20191213095215.17068-1-jitao.shi@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 16 Dec 2019 10:42:24 +0800
Message-ID: <CAJMQK-iZq0SRR7Q1cyh033xDXwD+MY-utO05+KqFR=ZRuaVUDg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: reduce the hbp and hfp for phy timing
To: Jitao Shi <jitao.shi@mediatek.com>
X-Mailman-Approved-At: Mon, 16 Dec 2019 08:30:48 +0000
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
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 stonea168@163.com, cawa.cheng@mediatek.com, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 9:52 AM Jitao Shi <jitao.shi@mediatek.com> wrote:
>
> There are some extra data transfer in dsi.
> ex. LPX, hs_prepare, hs_zero, hs_exit and the sof/eof of dsi packet.
> This signal will enlarge the line time. So the real frame on dsi bus
> will be lower than calc by video timing.
>
> So dsi driver reduces the hbp and hfp to keep the line time.
>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---

Tested on mt8183 and mt8173
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
