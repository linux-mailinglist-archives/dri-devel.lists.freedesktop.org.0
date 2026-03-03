Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIkEGqkEp2k7bgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 16:56:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E2A1F30FD
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 16:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D4B10E052;
	Tue,  3 Mar 2026 15:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZzdtIyth";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2BE10E052;
 Tue,  3 Mar 2026 15:56:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9138140320;
 Tue,  3 Mar 2026 15:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49097C116C6;
 Tue,  3 Mar 2026 15:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772553380;
 bh=docXN/j7MOnJzfbztgBR+4k4s7H02SISB2RKfeW0qo0=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=ZzdtIyth46gErNXR0r6WhugMyRnjR7EEDJuMNo9h7G9w+7AchH7hWiJnVWefCzQdz
 5s2+sEECu4jHA+OlZbWLFjC0wdfWl6KbINixJjxirQpfzraKjmrgafAQ6DIUhYgcI3
 WBhfJOgNHSGoJ09+qA7SV55zofbwcauceVwEPyYqovYNoB0E9/BWu9vZWtGAOuqEZH
 lS17j3XPfsJlcwRHaTt4cYwFa5+ALpTsPcIvb6v9Lc3BrH/t6Sdj3mqDMvepRPUaDi
 pZqRXL4toSYN8jUmMxa7WZYMBsm9jhWxkMS/q09O4Ov1f89MhtH1eAexJVMjx8FX/B
 GElQVoakP4Vjg==
Date: Tue, 03 Mar 2026 09:56:19 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sean Paul <sean@poorly.run>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, 
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Maxime Ripard <mripard@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260303-drm-display-eliza-v1-5-814121dbb2bf@oss.qualcomm.com>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-5-814121dbb2bf@oss.qualcomm.com>
Message-Id: <177255337948.3355290.6523186852223801021.robh@kernel.org>
Subject: Re: [PATCH 5/8] dt-bindings: display/msm: qcom,eliza-mdss: Add
 Eliza SoC
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
X-Rspamd-Queue-Id: 02E2A1F30FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,suse.de,gmail.com,vger.kernel.org,quicinc.com,ffwll.ch,linux.intel.com,linux.dev,linaro.org,lists.freedesktop.org,marek.ca,oss.qualcomm.com,somainline.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action


On Tue, 03 Mar 2026 14:07:55 +0100, Krzysztof Kozlowski wrote:
> Add MDSS/MDP display subsystem for Qualcomm Eliza SoC, being overall a
> minor revision change against SM8750, but coming with few different
> components, like different DSI PHY and added HDMI.
> 
> The binding does not include HDMI description yet.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,eliza-mdss.yaml      | 496 +++++++++++++++++++++
>  1 file changed, 496 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.example.dts:25:18: fatal error: dt-bindings/clock/qcom,eliza-gcc.h: No such file or directory
   25 |         #include <dt-bindings/clock/qcom,eliza-gcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1597: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260303-drm-display-eliza-v1-5-814121dbb2bf@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

