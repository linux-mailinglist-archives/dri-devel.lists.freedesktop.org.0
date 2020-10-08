Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0DC288399
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27A26EC69;
	Fri,  9 Oct 2020 07:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 609 seconds by postgrey-1.36 at gabe;
 Thu, 08 Oct 2020 08:57:33 UTC
Received: from mail.lineo.co.jp (ns.lineo.co.jp [203.141.200.203])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61896E0F0;
 Thu,  8 Oct 2020 08:57:33 +0000 (UTC)
Received: from [172.31.78.0] (unknown [203.141.200.204])
 by mail.lineo.co.jp (Postfix) with ESMTPSA id 9872580214FF9;
 Thu,  8 Oct 2020 17:47:21 +0900 (JST)
From: Naoki Hayama <naoki.hayama@lineo.co.jp>
Subject: [PATCH 0/6] spelling: Fix typo related to "arbitrary"
To: linux-kernel@vger.kernel.org
Message-ID: <4dea2b7e-31b9-a231-7fa2-9ee7ffd37686@lineo.co.jp>
Date: Thu, 8 Oct 2020 17:47:21 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Fri, 09 Oct 2020 07:29:53 +0000
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
Cc: alsa-devel@alsa-project.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Samuel Chessman <chessman@tux.org>, Naoki Hayama <naoki.hayama@lineo.co.jp>,
 Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 etnaviv@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Andy Whitcroft <apw@canonical.com>,
 Jaroslav Kysela <perex@perex.cz>, netdev@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Joe Perches <joe@perches.com>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I found some typos related to "arbitrary".

s/abitrary/arbitrary/
s/arbitary/arbitrary/

This series fixes them.

These typos have been reported in the past in other codes, but
correction 'abitrary||arbitrary' wasn't added to scripts/spelling.txt.
Therefore, PATCH #6 adds it to spelling.txt.


Naoki Hayama (6):
  net: tlan: Fix typo abitrary
  dt-bindings: pinctrl: qcom: Fix typo abitrary
  dt-bindings: pinctrl: sirf: Fix typo abitrary
  ALSA: hdspm: Fix typo arbitary
  drm/etnaviv: Fix typo arbitary
  scripts/spelling.txt: Add arbitrary correction

 Documentation/devicetree/bindings/pinctrl/pinctrl-atlas7.txt    | 2 +-
 .../devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt        | 2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c                           | 2 +-
 drivers/net/ethernet/ti/tlan.c                                  | 2 +-
 scripts/spelling.txt                                            | 1 +
 sound/pci/rme9652/hdspm.c                                       | 2 +-
 6 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
