Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B86A305AD
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 09:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBDF10E438;
	Tue, 11 Feb 2025 08:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ITvmJVg2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C58110E438;
 Tue, 11 Feb 2025 08:24:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9C4F0A40112;
 Tue, 11 Feb 2025 08:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06020C4CEDD;
 Tue, 11 Feb 2025 08:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739262288;
 bh=xzTwU6L6aVazkS2rIsucwAMSQj7eAV5dZxshfy4Z8dU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ITvmJVg25hgF49vgDKGzmVu2LkOW6dIZtVLpU/KXP+mq0nJ4ZT1OMGxlkcvZxaQQL
 39Tu9WCL1eYHte2HeQM0sCKrO4HwWUtaLpYrLappeaVsCd37oXOC4gzC4HMZY4JWAE
 DkjOT/q/bNrJdb9JOyee6Y5BXTSdZnI1V9BlgIFS3ur9aGN8hAfYcYD6zmWNSRU9TO
 ELzjI6JdNomKI6gdULxtOjNgfeyn8yvEAjdoVhfM5T+KMeAuEyISspwYfm+PveIMiq
 oA1brOU/oJgx8CYoASC+W+NC0gIv5Gw8/2nfq300SOnk7/iaoLYIo8txJBoRT8NFIc
 v2XYfQJYuAo+g==
Date: Tue, 11 Feb 2025 09:24:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 01/16] dt-bindings: display/msm/hdmi: drop obsolete
 GPIOs from schema
Message-ID: <20250211-hungry-cinnamon-jacamar-b0b3c2@krzk-bin>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
 <20250209-fd-hdmi-hpd-v4-1-6224568ed87f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250209-fd-hdmi-hpd-v4-1-6224568ed87f@linaro.org>
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

On Sun, Feb 09, 2025 at 07:04:45AM +0200, Dmitry Baryshkov wrote:
> The commit 68e674b13b17 ("drm/msm/hdmi: drop unused GPIO support")

That commit looks a lot like an ABI break and keeping bindings is a
proof of that.  Commit mentions upstreamed platforms, but you have also
downstream users which matters for the ABI.

Well, that ship has sailed, so:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

