Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B01B802D8D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 09:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1008910E2CE;
	Mon,  4 Dec 2023 08:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA1010E2CE;
 Mon,  4 Dec 2023 08:49:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 53B27CE0E00;
 Mon,  4 Dec 2023 08:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAC1C433C7;
 Mon,  4 Dec 2023 08:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701679794;
 bh=uG10quNAaJD23Flc15bDB89K/G4XtxgxZ8Ig/bMsvwg=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Z9/YXd2FuWQfC8SXxbmvuad2BsQzC8grc2YLa+GPJ9JTXbwydLMq7kC3vFMhd70yo
 4O83uHoCRZoBgTGTXAZOQoDlC+xFt3t0RXEa1FA7Glgsa5AEGCBrmGws3Qjgkp9znB
 Mdz3alfvFgkPbN/LLj5W7cHkE4HPPzN0azApR3Hug5B3aGkZnrh7LssoEnSsfAmFoJ
 ZzJQrW632grwyeq03MA/ZGZ6MR3LtXSl/aOtSDGnAgRXcIcEFrDfE6W77KMvL7n2gC
 gsxFVmQFJoxEmHDM52t/rrrMG5YP/0qIR5+/SU7rV8gNKjwfYVF3WpATtGcO/Ye9Fo
 YcIv0PIw+JfjQ==
Message-ID: <335240cdb8b6b980c2380bdc25fb2833.mripard@kernel.org>
Date: Mon, 04 Dec 2023 08:49:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH RESEND 1/5] drm/atomic: add private obj state to state dump
In-Reply-To: <20231203000532.1290480-2-dmitry.baryshkov@linaro.org>
References: <20231203000532.1290480-2-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, Maxime
 Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 3 Dec 2023 03:05:28 +0300, Dmitry Baryshkov wrote:
> The drm_atomic_print_new_state() already prints private object state via
> drm_atomic_private_obj_print_state(). Add private object state dumping
> to __drm_state_dump(), so that it is also included into drm_state_dump()
> output and into debugfs/dri/N/state file.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
