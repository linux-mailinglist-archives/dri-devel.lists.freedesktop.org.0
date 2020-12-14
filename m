Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B012DA8E3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 09:07:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC7889B03;
	Tue, 15 Dec 2020 08:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B1189D4D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 11:03:38 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id q137so16449423iod.9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 03:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=3evjQtuLZ++eIrou/VieOpcjEYW463jW8lrXR5dRrPw=;
 b=i8nJBVUXUlMnKzS/x21t1/IfwAlV5ib/ekh6mlooSwpa31JFgb5+HUBrpWHNAaSTj9
 vdZwLQ+mCOXfZegpX0aFi191TP1Td8yrM4knTrOkCB8a1wqrgYXjQYtU/v+oaU2ea87d
 2Tmgl0AckjwDixKnc8pAJRsp1+DGxNdsQQ7Cxv7D6vGGx5Sk/blB7lApdYuVrLu0sz1i
 il3TCmnNV5nnnfriZIKYqPFQ6FpxA22Rjx3TuSypCiP6w1/lNnrbvh+V0G2jT+f31V8G
 hQ+J/URhSCEw6lylKgf3t4XTP2I6e667J73SjWaJVcFm+baR6TCnNPaEW6cYTry0v3+T
 PjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=3evjQtuLZ++eIrou/VieOpcjEYW463jW8lrXR5dRrPw=;
 b=W2G009LN9D1eekViptTFN4Tl4FGoQA2Is93R1mdkeqRh7TYTBFbKj0iIjiBxRBrYwd
 1Az1/4ziRlg6s3h5F2LWQdWP1UosGxLX72B8jCaoTqI/q+QX2grQWMgRx/32xet+TK/+
 slR0NqSl7Ak2CF/zxA2yKJGoE8kEKH+6J7NITGutTKWCagrpxGZ/OA/7DfIsP1znHklC
 pKFrwGWuQQIk0fSzFRvlsg8yHjjVYMR7autC026Um0pfxSVwSaXpWeJ6DLPR9Lk035mR
 kq2Db7DUFk0Iz73lNhJn3cY/aBMuBJCOBKbKA4p3Kt0xOIZCsLA+C37bl6aj5fKIy1VX
 6MXA==
X-Gm-Message-State: AOAM532/KGDjtHBw62/teqlLg45oV2vzQ406uPBsOz4ffPX+AZJk9Nha
 mBwbzmn3TfoO7ITncFfvn8CdwvA+8WRaVkdaJ+/yGxf4Uu5jfg==
X-Google-Smtp-Source: ABdhPJyznmZxPQTTSSm6SdFlF//chuHdUeJvgNYUeg6cY24xt92set3t5SCNV6MHgMvIRqu6VgiWLvVnOM1QPVdpqPc=
X-Received: by 2002:a6b:2c52:: with SMTP id s79mr31401596ios.53.1607943817885; 
 Mon, 14 Dec 2020 03:03:37 -0800 (PST)
MIME-Version: 1.0
References: <20201201160613.1419-1-vicencb@gmail.com>
In-Reply-To: <20201201160613.1419-1-vicencb@gmail.com>
From: Vicente Bergas <vicencb@gmail.com>
Date: Mon, 14 Dec 2020 12:03:26 +0100
Message-ID: <CAAMcf8B9HNkZie6nbkBugcteJOLUhWhHVhjKxkH1sPrTU4k+xw@mail.gmail.com>
Subject: Re: [PATCH v3] drm: rockchip: hdmi: enable higher resolutions than FHD
To: Robin Murphy <robin.murphy@arm.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Douglas Anderson <dianders@chromium.org>, crj <algea.cao@rock-chips.com>, 
 Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
X-Mailman-Approved-At: Tue, 15 Dec 2020 08:06:55 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 1, 2020 at 5:06 PM Vicente Bergas <vicencb@gmail.com> wrote:
> This patch enables a QHD HDMI monitor to work at native resolution.

Please, anybody?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
