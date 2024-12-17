Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3169F5244
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 18:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B720C10EA23;
	Tue, 17 Dec 2024 17:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lVC3S9hW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F1C10EA23;
 Tue, 17 Dec 2024 17:17:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5EAC25C668E;
 Tue, 17 Dec 2024 17:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5AF7C4CED3;
 Tue, 17 Dec 2024 17:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734455841;
 bh=ShnuhRKLJAWLhwiEBbRAgFZs8muCXQgYKwgJacDbW1U=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=lVC3S9hWfTvwAJ7d5e1gXPSB+G7bSyUsWKjUmzD+P+jnAV8CiRrA9aqlNLXxJ9YTR
 abcid6dszSTROTDpH+GG2zjaFv6TqdvJ+8bFlafJUyl1Vxb8OAobFMI2cFmdhz+WE2
 Amtt6bfq81pCrXOmnhmyaLTnbceCbk45Ma+fWW4Stx/QP/sk7FELWER4mLuAXg/yKR
 Yk80H6xCP2ncKqY8C3FILEz8qxyaLNFT/3pqPjlxmClf+LVwgTDJ0H+WIOwfQvjmTb
 HQPDPe85Kq7pgKtvFb9twyOMAWprRek+FUYC+SnBXL2AiaIZ0g7UuLGSCsKgl1HHS2
 5jtFg4bwLIpWw==
Message-ID: <012deb5055f884e3c5374e1ead48fdd2@kernel.org>
Date: Tue, 17 Dec 2024 17:17:18 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v4 02/25] drm/tests: Add test for drm_crtc_in_clone_mode()
In-Reply-To: <20241216-concurrent-wb-v4-2-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-2-fe220297a7f0@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_abhinavk@quicinc.com, quic_ebharadw@quicinc.com,
 DavidAirlie <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
 JessicaZhang <quic_jesszhan@quicinc.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "Maxime
 Ripard" <mripard@kernel.org>, "Rob Clark" <robdclark@chromium.org>, "Rob
 Clark" <robdclark@gmail.com>, "Sean Paul" <sean@poorly.run>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Transfer-Encoding: 7bit
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

On Mon, 16 Dec 2024 16:43:13 -0800, Jessica Zhang wrote:
> Add kunit test to validate drm_crtc_in_clone_mode() helper
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
