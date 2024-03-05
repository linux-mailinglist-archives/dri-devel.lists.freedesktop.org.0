Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13003871DB2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 12:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE6510E461;
	Tue,  5 Mar 2024 11:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LcT3/EID";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3C510E44B;
 Tue,  5 Mar 2024 11:29:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 60BEECE19FC;
 Tue,  5 Mar 2024 11:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510D1C433F1;
 Tue,  5 Mar 2024 11:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709638162;
 bh=VVu9dI16C/iM2beYJUGFprKauQaV6BNikDutdtC3hGQ=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=LcT3/EIDR03rBofH3InwwSMbo8TDkNJuCOpEeVEQ27wtKo6vGawtc4SFaiGHbNPor
 7BgGWrYczPxhXE5IdoY731ZvMV8vP3FNSTztjQ/gmmVOhfNhHf1kFyRsNnE5QlcixU
 37egQtroT51Sh2l3vK6FiZ5C5xqGggXUfpN5oBGhog9t1lj7TSk25dAOLW0Zrnf6W6
 7NnSbqFw7hCjyCvCdEpTGrO20dASHR4JDUCSnxfXkSXVrgDLRAGxaus1WHcDVpIMRr
 BrpP9AT5/x2TCRPVVrFeDQ21sjaQG+0h/SFqn2jRQA4LmWMGih79g5KLsqczk3oTmu
 FAnl4oaQ7dKpw==
Message-ID: <0df557af4aaceeb1ef85ee3c74169ee9@kernel.org>
Date: Tue, 05 Mar 2024 11:29:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Subject: Re: [RESEND v3 0/2] drm: enable W=1 warnings by default across the
 subsystem
In-Reply-To: <cover.1709629403.git.jani.nikula@intel.com>
References: <cover.1709629403.git.jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, "Danilo Krummrich" <dakr@redhat.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 "Hamza Mahfooz" <hamza.mahfooz@amd.com>,
 "Javier Martinez Canillas" <javierm@redhat.com>, "Karol
 Herbst" <kherbst@redhat.com>, "Lyude Paul" <lyude@redhat.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?IlwiXFxcIlxcXFxcXFwiUGFuLCBYaW5o?=
 =?utf-8?b?dWlcXFxcXFxcIlxcXCJcIiI=?= <Xinhui.Pan@amd.com>,
 "Rob Clark" <robdclark@gmail.com>, "Sean
 Paul" <sean@poorly.run>, "Sui Jingfeng" <sui.jingfeng@linux.dev>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
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

On Tue, 5 Mar 2024 11:07:34 +0200, Jani Nikula wrote:
> Resend of [1] with an intent to merge after the CI results come in. This
> is aiming for v6.10, so we'll have maximal time to find all the issues
> my configs didn't catch.
> 
> I built this on x86-64 (both gcc and clang), arm and arm64, and
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
