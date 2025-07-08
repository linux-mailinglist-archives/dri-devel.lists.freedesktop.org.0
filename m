Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E605AFD51E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 19:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A65510E6BB;
	Tue,  8 Jul 2025 17:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bNPqVxOO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39B210E6B9;
 Tue,  8 Jul 2025 17:18:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 330DB61441;
 Tue,  8 Jul 2025 17:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A547CC4CEED;
 Tue,  8 Jul 2025 17:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751995115;
 bh=KKG1AAQueVdFPM/vfsxIw0NhkEpOgwE0gYOAigJgiP4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bNPqVxOOTnStBW+zjuA89urtUqIvJs8KzORFdcYAZ5XQsmhnt+Dfp3DgmWlgq6qJi
 pVNJt1TUDCCgh2YhLT9zcdN+FNYJSfBX296/jmWi803oZBzy8OzpLAumKK46q5+d2Q
 cW7JYzboS0kT41hSpFo8D5gQReBQZBbO0TCB3dniOZS1RN5poS1ZmSUkZ4F9BrfH7q
 iMOKzGW4sn5vuMD/0oY+gdkCEXXIL/shNJpuqY51YO6NQcwlAEhypCDFbOTliXgy9D
 sNZwWbEw2nxNM07UTJRmUS3LFLuGQ7RVUv+l30Dor/ICSlL/V7cXszqMEnyQfCMTdz
 GF5e1cJwzlVgA==
Date: Tue, 8 Jul 2025 12:18:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bjorn Andersson <andersson@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH 3/4] dt-bindings: display/msm: describe MDSS on SC8180X
Message-ID: <175199511415.652005.7265579408818540562.robh@kernel.org>
References: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
 <20250704-mdss-schema-v1-3-e978e4e73e14@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-mdss-schema-v1-3-e978e4e73e14@oss.qualcomm.com>
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


On Fri, 04 Jul 2025 19:31:55 +0300, Dmitry Baryshkov wrote:
> Describe the Mobile Display SubSystem (MDSS) unit as present on the
> SC8180X platform.
> 
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,sc8180x-mdss.yaml    | 359 +++++++++++++++++++++
>  1 file changed, 359 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

