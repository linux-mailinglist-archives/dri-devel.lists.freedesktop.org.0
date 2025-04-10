Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 540B0A84881
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 17:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1ED10E323;
	Thu, 10 Apr 2025 15:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="VoeivUXQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F8710E12A;
 Thu, 10 Apr 2025 15:51:48 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZYPSc0mxGz9shl;
 Thu, 10 Apr 2025 17:51:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1744300304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S8/1bc+SSt/Lx/Up/59n5c8Pu6woNGwVv1gsX+uXOMw=;
 b=VoeivUXQ7HdrLMa0PepurFK2LL+UJ3EIaqVSNiZtIopDYhg6x7+mRpAL/TJI4Ez0qU7pac
 jfDAGctGweLk4yFrby03iwcyMX4g+s4Wl+K4gfbm3WCsiUkT86ZXOOQBD2S4ZV06VkF2wu
 2ejAm8cihlNu+t5SO4oVxuz9T6N0iHOBh78P3qPUO6J6X+a9/n0Ui8VXho2NhR2ua+g2Ff
 ObKc5TqgDtJyhjKDRbfcI5IB5g8nRvQJgZvdlPFgQUwFA9ivuhwMP1f3J0ASGHjTujI0jw
 pGeRciSKR9W3ZB7Bncr9wPMZgGAG1a9/U+so/kw+v5ora64PUu5DXkDAcnuW7w==
Date: Thu, 10 Apr 2025 17:51:38 +0200
From: Anthony Ruhier <aruhier@mailbox.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/7] Support for GPU ACD feature on Adreno X1-85
Message-ID: <dmzoooujjb4zojjlgovjt6lccxilnnc3yr4j24vj4hwpzf5ouf@e6qkdlekcsnm>
References: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
 <dj256lrkc4s5ylqkqdrak6a6p3v62ckkd3orsg7ykz2w6ugllg@rbfkojacklvx>
 <0d1aaba8-7736-497e-8424-84489c637914@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d1aaba8-7736-497e-8424-84489c637914@oss.qualcomm.com>
X-MBO-RS-META: hnpqbkrht6pxthkfq3htpiw4uki4eng8
X-MBO-RS-ID: 74da413a3d37fd97626
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

Hi,

Sorry I should have gave an update on this: I don't think the lockups are
related to this patch series, the same problem happens without applying these
patches. It seems to increase by a lot the chances that a GPU lockup happens at
start, however, so I could use that to debug the real problem.

> What firmware files are you using? ZAP surely comes from the Windows
> package, but what about GMU and SQE? Linux-firmware?
>
> Specifically, please provide the GMU version which is printed to dmesg
> on first GPU open

I'm using the firmwares imported from Windows, the Yoga Slim 7x is not in
linux-firmware. I understood that the firmware files used by the Slim 7x are
quite old, maybe it could be the problem.

The GMU version:

> [drm] Loaded GMU firmware v4.3.17

Thanks

--
Anthony Ruhier
