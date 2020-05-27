Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E35C1E4A4E
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 18:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FE76E071;
	Wed, 27 May 2020 16:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B876B6E071
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 16:33:56 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id x22so14843323lfd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 09:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4R64lQECAezSIekk6lfrKMmFFora0mq1CFEKW++lIpo=;
 b=XqQQSknDXgHqnwyIRF1WdjWReCla6ArE+ipVeGU+Y0Fs7zp+DK2ItCI09Dq7gx/Dyj
 hJf8C7JzYXLFFiEFPSIdtpTmPXi2couBReRwKrfpziAgeR25ImfBTsGCqZ0900Sg420V
 z/54ca6O8t7uoH9d/pihKqLAZOuKmtUV7Yi6dH5K8BbubPM8Tvv2W8Pxcgdx5oaFi4dZ
 hDRBsfqV/wQ0coxuFblYgulLkwiWqgTgOJw/n3rvVaXBhvE5H8wI2VlOwvKt27ojlEeO
 vURwwXQwETHDoE/k0iaYAURYW/tVRFO8RSQLJtspA+gHvGUH0NqUsG7wshy4+xfs7f5W
 2WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4R64lQECAezSIekk6lfrKMmFFora0mq1CFEKW++lIpo=;
 b=Lpd/f+GNleYxHLs2htRa6YuoImljwqE45oNjZG+ZylOG/VgrP0wQ1iQsQE7o4G6vN1
 4209Ivxr2dt49yiGbBpEh7rOIgdMYzyMhqDD4d5E/ZCdiKvYSgG2/Sjq3ZacRG9FrnaY
 KQd0oqnXyhclNaOBXEHjSg57USZi6DQPlQ2vTW2C69DRTCY3f1ljVEa8YQe64AJJAO96
 Q4YXXVNRyxd8D5nWOUiKrwinVEiGG/C6qJWmwmRiltSTO76nzFtx2vTG8Ib7Gy3CvMze
 nSKNcL0rlPy9NY4xw4QFpBcI4WIlXZB5uvoUlyTZG3Mx1Ush7za25Kucigak1LwF4/Ir
 ntjg==
X-Gm-Message-State: AOAM5326oqA/98YzXSfh5TwdfPoJCI+/1K+TfUK9Qk/9IqKBkg5/oWpd
 ltTPpJxR7toqU/q2HcJeoOKcVAl5H8ZMMqsDpA0HLQ==
X-Google-Smtp-Source: ABdhPJzJGyZZ6OFZilVkNjwkWI14qi3Sk9vJd3/Q9ngB/1XlT/NI9vsgFlwoXIDHHg0zMevhGY3B/9Qh957nmNFRnN4=
X-Received: by 2002:a19:f813:: with SMTP id a19mr3516133lff.212.1590597235190; 
 Wed, 27 May 2020 09:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <1aaadf9a5176591c891622cb00b0c50f42e569dc.1590594512.git-series.maxime@cerno.tech>
In-Reply-To: <1aaadf9a5176591c891622cb00b0c50f42e569dc.1590594512.git-series.maxime@cerno.tech>
From: Eric Anholt <eric@anholt.net>
Date: Wed, 27 May 2020 09:33:44 -0700
Message-ID: <CADaigPWQdeTd2CGCK-yxq+TAU6xKMVsdZfhSVptn4RSENxpdxg@mail.gmail.com>
Subject: Re: [PATCH v3 015/105] drm/vc4: hvs: Boost the core clock during
 modeset
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 8:49 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> In order to prevent timeouts and stalls in the pipeline, the core clock
> needs to be maxed at 500MHz during a modeset on the BCM2711.

Like, the whole system's core clock?  How is it reasonable for some
device driver to crank the system's core clock up and back down to
some fixed-in-the-driver frequency?  Sounds like you need some sort of
opp thing here.

Patch 13,14 r-b.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
