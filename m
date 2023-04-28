Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CCB6F1706
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 13:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4CF10E28D;
	Fri, 28 Apr 2023 11:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4390810E28D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 11:49:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F0DC564348
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 11:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1D1AC433AC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 11:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682682587;
 bh=+0HUqFwXOnJ+E9EM1PWKoYSQkhdIqSOQa157EooLpo8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=czVb6MCeUP3xbaFHkgs4x/0vMLbHxGsvFeSD1NdiSfIsi1enf5KQJ9lRjo6t5P/X3
 chbcWFRGMzv0wrliGiaKF3tEoa42aIKwRlvQPXkyv8O7DC/dbsHClV92Wj6G4LPwtm
 e2Uk/HjOJOM8317xhdwdK1OnnSLVJJOztoo/IOJCSnQV5c1hRF1A67SD4Bxg5iTlA/
 mjaQzA2BKfNLVCc0vd1rpSmGMM3gV7JDHq++szEftQLqz5tik33kd1VEZDYvgdNu9p
 9b9hEFroHyrwBCztO+Z3PiTBWiBdBxXs1yd/nA0L69EYLMYP6D1+frRcD+VIwV9UWO
 /n7nuFsIr9A0Q==
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-63b67a26069so12043187b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 04:49:47 -0700 (PDT)
X-Gm-Message-State: AC+VfDy0JJD+r87XNfqnnje/7V+jqy2CfACA9yq4fCBBfaqwJbE5ale3
 DpQKG3WNCcj+AEUSGSAHbpKJXCwTjvy0Cu7EiSDIBQ==
X-Google-Smtp-Source: ACHHUZ6ccK+wRxQplHz6VziJEnxjiG7risxXQlu7jSikLwR21BJPpjCdVNEqjFUN2bwEAOpjfAxd3IvsxEToMWZskwU=
X-Received: by 2002:a05:6a00:2d93:b0:63d:4358:9140 with SMTP id
 fb19-20020a056a002d9300b0063d43589140mr7858701pfb.34.1682682587374; Fri, 28
 Apr 2023 04:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <14636275-4d26-d639-5f6e-293fc6d1c4c6@web.de>
 <CAN6tsi7caOQZLLvbL7phMEtNvBLaWgJuHLkLo3YWdqQw7Vxnaw@mail.gmail.com>
 <6f758653-36c9-91a2-7bbc-278ae3f8ccee@web.de>
 <CAN6tsi4WBDOyzvXJ8vV=xJYay1JbBGo+UzZ+vudTBm5Fk5nB=A@mail.gmail.com>
 <14083012-2f19-3760-a840-d685fcedc15e@web.de>
In-Reply-To: <14083012-2f19-3760-a840-d685fcedc15e@web.de>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 28 Apr 2023 13:49:36 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7263VnTba+WUUWR171Y+CsOKAb=it8cofPQGRk26K=aA@mail.gmail.com>
Message-ID: <CAN6tsi7263VnTba+WUUWR171Y+CsOKAb=it8cofPQGRk26K=aA@mail.gmail.com>
Subject: Re: drm/bridge: it6505: Move a variable assignment behind a null
 pointer check in receive_timing_debugfs_show()
To: Markus Elfring <Markus.Elfring@web.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Allen Chen <allen.chen@ite.com.tw>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Hermes Wu <hermes.wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-yi Wang <hsinyi@chromium.org>,
 cocci@inria.fr,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 27, 2023 at 9:40=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> > Fix the email Sign-off email !=3D Sender email issue, resubmit and I'll
> > be able to apply this.
>
> You can pick the email from my tag =E2=80=9CSigned-off-by=E2=80=9D up als=
o directly
> as an ordinary patch author email, can't you?

Of course, I can change the email to anything, but drm maintainer
scripts checks for this, presumably for a reason, so it should be
correctly submitted.

>
> Regards,
> Markus
>
