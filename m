Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE0768B178
	for <lists+dri-devel@lfdr.de>; Sun,  5 Feb 2023 21:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F77D10E142;
	Sun,  5 Feb 2023 20:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD6610E142
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Feb 2023 20:08:14 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id me3so28811255ejb.7
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Feb 2023 12:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GsVLR2sf69c/CgAcTxB0nwg0BCA+KrQO7cMi7O1TpOc=;
 b=kdPtnC3Nm67ra02E0FY/apPVAsDq5FvlRQibSmmWtlSnL7cLhnZdrYa0uDk+SRtXnF
 A9H+k+97bnIMAwfvANMRDOAnSJxF2Krs3F6gxwnUG49qNKyUMtRVxZO2j1G5/4gu61Ya
 FyMPx1a+EkDJRTBFFjMZiS7PHCmhqMPUKpOPv3NrX5NvGtpzEB8NMXrM5ywF596fwrdz
 tTsAy8UUh7JqA8TzTktMRMjAiwjxuvhPWxHI9rt5fdmU9aF1GK9yAvO1MFrt+LYQ+opq
 PBowQ+TsC7OcYtBTLK5xF0qn/sRMC+Zof/PbAS/7x64SA54x+FTLtcEJIVPfKGJR+Dwj
 9AVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GsVLR2sf69c/CgAcTxB0nwg0BCA+KrQO7cMi7O1TpOc=;
 b=Uo/19wEb6PqkpVJOyTii38keleHSlGD7QZqrzpQ58XOJDu1xbmOjJ5g0cT75s6HC0v
 Z7/r0McYVK/a5VIw5XHNoDKpJGwYuoxt1EO6xv4G76JMHUGRI3zeyPi7S3OrdYKqZbo9
 jsuaKlSo4raW7e2fz195xTuv+fyK183lokW5AWG5X2JwwYr9D7qyXwyhz9YiZ47Hpp8s
 we5T+M7V1br75uZ0wByTd7+RJs0gcSybG3MmyfrayKyJBwejvkR8VYisenPp3a5OnL4L
 SYoG+Z1HeuzWaYEAy5a9HXgbZxChAV/YINH7OGE+SH00J9e2Q+cTUqGiBKZa8f30g9Gz
 40Tg==
X-Gm-Message-State: AO0yUKUEj9sOrUDJVmkJcLfViiIPpOZSu4YBmrmPuLv62YY72baFMUX/
 dteNYfN/tYASN70IpK3FA7PG3GoqgyClgFnMwwM=
X-Google-Smtp-Source: AK7set+VcMDxX4TIo7IIQRR6wEoDguvHUogqbf+9V7cPTapAP9TPYeYfC5TT4FFqKE5b8/F1NSfghiFWTd0Ta3dZvBY=
X-Received: by 2002:a17:907:9916:b0:886:2823:423e with SMTP id
 ka22-20020a170907991600b008862823423emr4900277ejc.284.1675627692933; Sun, 05
 Feb 2023 12:08:12 -0800 (PST)
MIME-Version: 1.0
References: <20230109223110.1165433-1-martin.blumenstingl@googlemail.com>
 <87lemai74d.fsf@intel.com>
In-Reply-To: <87lemai74d.fsf@intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 5 Feb 2023 21:08:02 +0100
Message-ID: <CAFBinCCObycVBfN0SjkYLo9BKYWGXxW6ErLoshjASNjR5-iqkQ@mail.gmail.com>
Subject: Re: [PATCH v1 RFC] video/hdmi: Fix HDMI_VENDOR_INFOFRAME_SIZE
To: Jani Nikula <jani.nikula@linux.intel.com>, ville.syrjala@linux.intel.com
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Bernard Zhao <bernard@vivo.com>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hans.verkuil@cisco.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Jani, Hello Ville,

On Tue, Jan 10, 2023 at 7:20 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
[...]
> > I'm not an expert on this topic and I'm not sure if the size still
> > depends on that if condition from long time ago. So please share your
> > thoughts.
>
> I tried to look at this quickly, but it makes my brain hurt. I don't
> think simply changing the size here is right either.
I think I see what you're saying here: hdmi_vendor_infoframe_length()
has logic to determine the "correct" size.

My idea here is to use the maximum possible size for
HDMI_VENDOR_INFOFRAME_SIZE so it can be used with the
HDMI_INFOFRAME_SIZE macro (just like the other _SIZE definitions right
above the vendor infoframe one).
If you have suggestions on my patch then please let me know.


Best regards,
Martin
