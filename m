Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B4A2E91F9
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:40:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0FC89E35;
	Mon,  4 Jan 2021 08:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 574 seconds by postgrey-1.36 at gabe;
 Sun, 03 Jan 2021 01:39:58 UTC
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D656D892B4
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jan 2021 01:39:58 +0000 (UTC)
Received: from [192.168.1.101] (abac131.neoplus.adsl.tpnet.pl [83.6.166.131])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 934011F4AC;
 Sun,  3 Jan 2021 02:30:19 +0100 (CET)
Subject: Re: [PATCH] drm/msm: Fix MSM_INFO_GET_IOVA with carveout
To: Iskren Chernev <iskren.chernev@gmail.com>, Rob Clark <robdclark@gmail.com>
References: <20210102202437.1630365-1-iskren.chernev@gmail.com>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <63647a5d-e621-b2ce-fb2c-587b5a49f697@somainline.org>
Date: Sun, 3 Jan 2021 02:30:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210102202437.1630365-1-iskren.chernev@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kind reminder that MSM8974, 8994, 8992 and friends are held back by the lack of IOMMU support upstream. There has been an attempt back in 2014(!) [1], but it was either overlooked or forgotten about ever since. I'd be more than happy to see someone look into this, as I have some other bits (almost) ready for both 8974 and 94, but MMUs aren't something I understand well enough yet.

Konrad


[1] https://lists.linuxfoundation.org/pipermail/iommu/2014-June/008993.html


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
