Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA545ADC7A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 02:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FCF10E532;
	Tue,  6 Sep 2022 00:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C470510E529
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 00:35:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 03FFB61193
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 00:35:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ECBFC4314E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 00:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662424551;
 bh=AFVELCe6kckm5eVg8tSkLGzu73jpu1k+AHFc6+CYBcw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nI77n7PyLi5FxsG5xVGzM7IPkRddyT0b0CMVM4SXMhWb+vUNwAV0WGNt4PA9n8CqS
 zxVkXOyN5M/JlTZh6GqixESF8eOED5NoosbhPX2Hsbo0g74HUvcD5IqIAIzpnj5CaD
 d4ygcuWBgqOpLZM9kiHSPuHX97fV/gU10RfgBZV6i4M0nptUl44AJG2NDDPrJ3KyGn
 1mg1nut4G2j0qOt/ZUizGE05HWc7HSg5muHqEVTDVysQf1oTx2lYiY2aW+xCf1axIQ
 MnFiCmpbeoQzdH1L8YqUu19CRdilnf4OtxFGR0RF0l82/TvXGOFtk+ukltv8mWvtx4
 CmdEvf4qo/wqw==
Received: by mail-ot1-f48.google.com with SMTP id
 y25-20020a056830109900b0063b3c1fe018so7119796oto.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 17:35:51 -0700 (PDT)
X-Gm-Message-State: ACgBeo3kDVgO3XSeLiw0do6Fac2rdBQbmOxvB0qRaqyP9yfFcNu0l3zX
 Os7nNkMxovEqMdktUY9VB4MTQdjwfutMte3XiA==
X-Google-Smtp-Source: AA6agR7JB46gDLcqHlczb2XMcJBrFON4MTYWbTLa6xhusijh7jtXlCYbGmC4KWVKQpa3XwKRkOEL4frns62DfuOfGIw=
X-Received: by 2002:a05:6830:6999:b0:61d:26f8:94c1 with SMTP id
 cy25-20020a056830699900b0061d26f894c1mr20597426otb.278.1662424550394; Mon, 05
 Sep 2022 17:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
 <af23462c-2d3b-470a-7fd6-2bf09a3174cb@gmail.com>
 <80985882-c46f-cfb1-b077-a92866536678@collabora.com>
In-Reply-To: <80985882-c46f-cfb1-b077-a92866536678@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 6 Sep 2022 08:35:31 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-C8fmabcTrytpHowbHe8Y+tTmv=5SV+oKPjUNRLTaU9w@mail.gmail.com>
Message-ID: <CAAOTY_-C8fmabcTrytpHowbHe8Y+tTmv=5SV+oKPjUNRLTaU9w@mail.gmail.com>
Subject: Re: [PATCH v17 00/10] Add MT8195 DisplayPort driver
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 krzysztof.kozlowski+dt@linaro.org, Dmitry Osipenko <digetx@gmail.com>,
 deller@gmx.de, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Bo-Chen Chen <rex-bc.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 liangxu.xu@mediatek.com, Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Guillaume Ranquet <granquet@baylibre.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dmitry:

Dmitry Osipenko <dmitry.osipenko@collabora.com> =E6=96=BC 2022=E5=B9=B49=E6=
=9C=885=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=886:53=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On 9/4/22 15:59, Dmitry Osipenko wrote:
> > 01.09.2022 07:41, Bo-Chen Chen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> This patch is separated from v10 which is including dp driver, phy dri=
ver
> >> and dpintf driver. This series is only contained the DisplayPort drive=
r.
> >>
> >> This series can be tested using 5.19-rc2 kernel and I test it in MT819=
5
> >> Tomato Chromebook. Modetest these modes:
> >
> > Applied to drm-misc-next, thanks!
>
> Hello Chun-Kuang Hu,
>
> Angelo told me today that you wanted to pick up the MTK driver patches
> and I applied them all to the drm-misc instead just of the "video/hdmi"
> patch. The series was fully reviewed and tested, so I had no doubts when
> applied all the patches.
>
> The applied patches can't be reverted, so if you have more changes
> prepared for the MTK driver, then please rebase them on top of the
> latest drm-misc-next.
>
> Apologizes for this confusion. Please let us know if we can help you.

OK, if this cannot be reverted, I could only accept this. Normally,
drm/mediatek patches would go though medaitek-drm-* branch. To prevent
any confusion, it's better to discuss before pick up.

Regards,
Chun-Kuang.

>
> --
> Best regards,
> Dmitry
