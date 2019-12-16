Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3842312028B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 11:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0F96E499;
	Mon, 16 Dec 2019 10:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0875C6E499
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 10:30:19 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id d17so2514190qvs.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 02:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cN9P/BG2n4fcm/c0k1+snwpKHQ7N7T0aPKvvgLtAhis=;
 b=Xl1BOaEVQnzWV9uNsZideZioGq+xYE5SBa6N051vdtEL+5gUndFQSj8rnNn8EwGyk5
 FsXetpn7+FazhrzlflKmIkol7p7Y3kL+FkC0rppFLYmDptwQytz4ZavTf9g/RQIf/ytH
 f5rqQXe4iVUBMn8deEBMuPKHDYomsCko+sga0mEIcrpvKdOjZKvi5aPJFkVW1ytNv7iG
 VQhutYCAAF4/0ZXd8N9It7vlFVNM8+W2c6qQks5rsqCoLnxQ5Lxvicn7BRI197wTNTDy
 Ow4q2LBuxD6NzpJnF+IrHNKqLeoTZF5Rxq4Ar7l3RfkQ7ZSusbwFP76fIpnuAuNE/m9X
 /r+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cN9P/BG2n4fcm/c0k1+snwpKHQ7N7T0aPKvvgLtAhis=;
 b=s4bKKM6WepwR5lNHD6C5xPSDqGEX9EI/Lmcc0jpZ9Z5Atc59jvK9RjbCtCWUf+I9dH
 k5iVukW4Jhps2cB8ZqwGu727LnzFGOno2Y00P/z0hZQYmS8ny+83WipPPtLiDXcwVOP2
 nxEFu3MmT67xeaeUutc4cUiwWrrVK58L2ms3OUY7D6X1p/HKZieleBm8hqcNTl8OJbfv
 SrUmNHW0htYmyobXeySbY47XTvRbO/frn3xuLqHzNd7MMvJUWLr5CyCrSroUb2g+b98H
 brb5O3o0Y0jI2qANSNM1L9RnROPm7v4p7RyHnNC4Ha9vCWccWopyVHhxuweaWBCjOdLZ
 lXlA==
X-Gm-Message-State: APjAAAX6Jq3AFC/ulEINntbmqJ0+f0T7GnaOtIstZOkkiDYpRYeyULH4
 PdqSV7GJ5d0FYodR9vpq50ghlSKbQpHyg7ycYyg=
X-Google-Smtp-Source: APXvYqx/dlytxqrLzbst7Hqk/D1zbEebOmGJKkioZFuGnnZ+zEpu4pRIb7CWgM6duHC0DYQ/wRStwgD3vFlt7l4uOTI=
X-Received: by 2002:a0c:c24f:: with SMTP id w15mr26533823qvh.66.1576492218033; 
 Mon, 16 Dec 2019 02:30:18 -0800 (PST)
MIME-Version: 1.0
References: <20191213095215.17068-1-jitao.shi@mediatek.com>
 <CAJMQK-iZq0SRR7Q1cyh033xDXwD+MY-utO05+KqFR=ZRuaVUDg@mail.gmail.com>
In-Reply-To: <CAJMQK-iZq0SRR7Q1cyh033xDXwD+MY-utO05+KqFR=ZRuaVUDg@mail.gmail.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Mon, 16 Dec 2019 11:30:06 +0100
Message-ID: <CAFqH_5209EaEzoPBHGM=GiS+v7znZR-XzvQ5L_ThQhhuGc1bXg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: reduce the hbp and hfp for phy timing
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 stonea168@163.com, cawa cheng <cawa.cheng@mediatek.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, sj.huang@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Missatge de Hsin-Yi Wang <hsinyi@chromium.org> del dia dl., 16 de des.
2019 a les 3:42:
>
> On Fri, Dec 13, 2019 at 9:52 AM Jitao Shi <jitao.shi@mediatek.com> wrote:
> >
> > There are some extra data transfer in dsi.
> > ex. LPX, hs_prepare, hs_zero, hs_exit and the sof/eof of dsi packet.
> > This signal will enlarge the line time. So the real frame on dsi bus
> > will be lower than calc by video timing.
> >
> > So dsi driver reduces the hbp and hfp to keep the line time.
> >

This patch not only reduces the hbp and hfp for phy timing, it also
fixes an actual issue for MT8173 boards (i.e. Acer Chromebook R 13)
which is that the display is not working anymore (black screen) after
7a5bc4e22ecfd74dc3662342beaa909770a3b786 "drm/mediatek: change the dsi
phytiming calculate method". So the patch is probably missing a:

Fixes: 7a5bc4e22ecf ("drm/mediatek: change the dsi phytiming calculate method")

And would be nice to have this patch applied for 5.5

> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>

If it helps, you can also add my

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Thanks,
 Enric

> > ---
>
> Tested on mt8183 and mt8173
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
