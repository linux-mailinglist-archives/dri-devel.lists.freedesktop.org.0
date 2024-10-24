Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58559AEC7A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 18:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DA410E38D;
	Thu, 24 Oct 2024 16:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="fOd4j2Rk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9597810E38D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 16:45:51 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-7edb3f93369so538956a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 09:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1729788351; x=1730393151;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sbcx/f+avMo0nfnfoFrvHy0s7zMVYb5RcXeOKVfhBB0=;
 b=fOd4j2RkXlIO+mbY+t+LDOV4YusuiMR+yqO0DFKVRgbKHZcj/7jqkO5RWF3MWT20EV
 RcLrSxbcdkO/e8XRaW8LYgZ9nYDZCeXoYi28grQdUZmNxEJ0Rbf2jYLyQItvDc6R3qeY
 NdWl7QGZTiVOpkQn47Sz/E4EZNU4iuDdfzT/1WzmoN+s1+a/NVhfDGPQD+mLrK2JIg5O
 kPwt+XDSCHuQXlegSTNMJPGSLz9tzDH00cSCEYsaPR1j93hJyrC/VF5yLB4G+eHGaTuG
 SwseKbslAF5LbWJoJx+Zs3To05roQ3vBUcBG8T3hHagS3chk8CJrsARex17LKJQNvekS
 VclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729788351; x=1730393151;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sbcx/f+avMo0nfnfoFrvHy0s7zMVYb5RcXeOKVfhBB0=;
 b=Ij5lLlCBgieXF6U/KMCN/Numh9ORFTaQvg7fz17Sn0v2zYljZFB1KvMeXKKYgXx0h5
 WZiCMwYJw59wGvf+ryJxOLW2DRoW2pQsoFY9uqWrCIMDGre0ZYFKGA23Dhy9tkWwMl99
 uLZgEG/1HCuNzw44XLLe/vaPu2+urCrMazkosmCzYPdfrxC8O4KQIiPXNAVZDZSMlDNc
 TZDNlCTxEEm7bHm7rjjP9cAvMpjPfyOJKstsZaf1i5mc8v8mP3w+HpUgK4+wBI5Bm1kl
 eVmCm1Io9BHl5IkChimWN1GWtMX4JOQg7Wuz98zszTuHY5neis69EzWXDlYIT3kN403G
 F54g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9GhinKHur6aXTUwr1V2fvLIWMGArmfUZiMTgogvD57HD54ylPWmkmWNmyMoiGEAr61nyy94bMQss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywi9iMpJsOm0uw2RVZssrlcfzXcyAqEq2BaPxPgM4ymNbIRM1DI
 oG9AJTBeWWjLiW7p1/IWSMjVJ70CFN2cjiWV5YTL5TZWSwnWC5ENJJg3ValQSDAnzbcGwxpfY8I
 ZqpvuliVOKkM+fX1bRlogaFyVQ/WJ8f0ULqcm
X-Google-Smtp-Source: AGHT+IGyVGhrIax31DbYyaNPPps689qKUUGZ/dBmIonlf0Ms5Q31B+FIXf7PnrvX0k/Y2NDzzkEVUzrdywoXgv6bmrc=
X-Received: by 2002:a05:6a21:9d91:b0:1d7:1277:8d0f with SMTP id
 adf61e73a8af0-1d978bd6450mr8093124637.48.1729788350739; Thu, 24 Oct 2024
 09:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20241024061347.1771063-1-saravanak@google.com>
 <2024102457-manager-counting-ff68@gregkh>
In-Reply-To: <2024102457-manager-counting-ff68@gregkh>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 24 Oct 2024 09:45:10 -0700
Message-ID: <CAGETcx_BD_G3oOHvT7aRr98Ag7-XvrMX=NW_wm9Cx9M5+qr-aw@mail.gmail.com>
Subject: Re: [PATCH 0/3] A few minor fw_devlink fixes
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 24, 2024 at 12:08=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Oct 23, 2024 at 11:13:41PM -0700, Saravana Kannan wrote:
> > Probably easiest for Greg to pull in these changes?
> >
> > PSA: Do not pull any of these patches into stable kernels. fw_devlink
> > had a lot of changes that landed in the last year. It's hard to ensure
> > cherry-picks have picked up all the dependencies correctly. If any of
> > these really need to get cherry-picked into stable kernels, cc me and
> > wait for my explicit Ack.
>
> You can do that with the correct tag in the commit as per the stable
> documentation if you really want to :)
>
> But why would these not be able to go backwards?  What changed to
> require them now and not be ok for older kernels?

Depending on how far back we go in terms of kernel version, it'd be a
bunch of cycle detection logic, deferred probe behavior change, etc.
And those patches might have other dependencies themselves, etc.

He's one example of such a breakage:
https://lore.kernel.org/all/20241024-fixup-5-15-v1-1-74d360bd3002@mediatek.=
com/

-Saravana
