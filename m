Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2121CE878
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 00:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5376E7DB;
	Mon, 11 May 2020 22:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4057A6E595;
 Mon, 11 May 2020 21:03:37 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id bs4so2963180edb.6;
 Mon, 11 May 2020 14:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7kphY5Feu5GjDCyOhiwD3l7TIWgkPBf49fwmfgZutZM=;
 b=pi2B1oEEkaOLcGDjYguTzZ1wVBUAaddjGKvbTSIB33jMGte38wfkA0RWPar7kH5D16
 TuvXrhWYBBST5nztNM/k6ZK3rdZbNpHdgQN6WkuJp1Je5EUenMjPMKteynJV6Sc4qI+a
 AAUzW8Dj9Xxd8T4ggFrXmvSjakXJm0oNtXKoKgh5ZimIvOx3y3gj5Z/lQa2FR30djnBj
 kmCN9Hvtb0cIpyBQMdqoBKyQ4yCOi600/WwUG278KA6r5ih2jpYF9CyU5f6CYRDa2y3g
 HYmUOqPlGVf9JTE7N5BzTFM1WGzL0Bqxhiw6kE0sFMZmbh32/muIFoexknNSy7J6/lGj
 bmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7kphY5Feu5GjDCyOhiwD3l7TIWgkPBf49fwmfgZutZM=;
 b=bav8us/onf8vDxHltJnhbb0j67E7aakZk2jtmk3VE+xX69+pEVs2mrKK3KAHYn9KjN
 abfe+GolO4KTqZiBQIa3bBIn6tY13vRYhoxLz0mp4rn0xLyjOoBJskPe3W8LXfO9JUU/
 gxeVFYK8rBFeAIWjicritUkifd1fS25KYzHYxZnXAul39OfcNY9joikIiNG4pGWTvEH1
 xvNWm5KvDmShpPWH6H68P++TUtAT+YqkwaIXNoGYZcb0h97FYvhKaLu1yc/i706SUtI0
 5r/oW7F3Tfmu3GevqAQsE0dC0KjNKHKgJvSU61wtV+q2N9NULHy+aWjJKQm285cSKU0X
 OudQ==
X-Gm-Message-State: AGi0PuaDdCk7z44hjhBGgnxc+dOZAOsIx//WFQnGKrkzR3RWVTKpAC/N
 Tlb+HHR/lnOKprU0iV6qE8+JG88EWN5jXUgJf6I=
X-Google-Smtp-Source: APiQypLxSSuCw1Ty0QrHn8r+5pFK0ZY0obh40lVL+pboWUJzbPHEHgusS2MaIPc+AXlLln+Srs+52jPCEAvCaqzoFUQ=
X-Received: by 2002:aa7:dcc3:: with SMTP id w3mr14329504edu.231.1589231015906; 
 Mon, 11 May 2020 14:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200501205201.149804-1-konradybcio@gmail.com>
 <CAOCk7NqbOsQ2Bz1K8Gkeh75pLHDaUn6MhE1T7NkMYEHOPoL0NQ@mail.gmail.com>
In-Reply-To: <CAOCk7NqbOsQ2Bz1K8Gkeh75pLHDaUn6MhE1T7NkMYEHOPoL0NQ@mail.gmail.com>
From: Konrad Dybcio <konradybcio@gmail.com>
Date: Mon, 11 May 2020 23:03:00 +0200
Message-ID: <CAMS8qEWNuuo5t+D1Xq_aNbh5-GSvVSMJM6BpKX4SR=-2eBegpQ@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpu: drm: Add MDP5 configuration for MSM8x36 and
 its derivatives, such as MSM8939.
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
X-Mailman-Approved-At: Mon, 11 May 2020 22:51:58 +0000
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
Cc: freedreno <freedreno@lists.freedesktop.org>, skrzynka@konradybcio.pl,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 zhengbin <zhengbin13@huawei.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>Is the "| 0" really adding value here?

As far as I can see, it is present in every other config.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
