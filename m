Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMS3Edgeg2nWhwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 11:26:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F69E4770
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 11:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D4F10E5B2;
	Wed,  4 Feb 2026 10:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G0XacNdi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A3C10E5B2
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 10:26:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9D65243FBD;
 Wed,  4 Feb 2026 10:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10194C4CEF7;
 Wed,  4 Feb 2026 10:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770200788;
 bh=d2ORjAFYDx26CCy9qL6CmpUxNx4yL0rMuIyF+swd47c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=G0XacNdiA2sPN9bZfD51gtADbKtxQu8R/qTGNkZr4YjYt0KUY7g9bp0m6ZNanmclc
 xKqjqGs/2VMC0xVXm5Sc7pi1K5NgSsT6oKaK0ukJeSa4Sm8cdf1HECNIergdRekhDd
 MzJxZo+h95odzHjxCQjaVeMYWdYOUIU1aIfOBfSo1JbF6YgUjCBH31ZlIjhCB3kcEv
 xD7TRJuUF4SpuJengb7BJeXKLzqH4Yt601kU9y7AFCqg2aSCmd+N2qVbQv46YrYAnB
 TV3WUjV/IwbCj+f8TMSCnw4ejCN4AyKKqAHrI6Ej6KKBhYDUqpXXAOAVcSOQs7FTfP
 lBDFotNRjA1Zw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>, 
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>, 
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>, 
 Alejandro Tafalla <atafalla@dnyon.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Thompson <daniel.thompson@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
References: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
Subject: Re: (subset) [PATCH v3 0/7] Fix PMI8994 WLED ovp values and more
Message-Id: <177020078282.1122108.15047767273354321830.b4-ty@kernel.org>
Date: Wed, 04 Feb 2026 10:26:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_kgunda@quicinc.com,m:deller@gmx.de,m:luca@lucaweiss.eu,m:konradybcio@kernel.org,m:fekz115@gmail.com,m:morf3089@gmail.com,m:atafalla@dnyon.com,m:barnabas.czeman@mainlining.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:daniel.thompson@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[lee@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,quicinc.com,gmx.de,lucaweiss.eu,dnyon.com,mainlining.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C6F69E4770
X-Rspamd-Action: no action

On Fri, 16 Jan 2026 08:07:32 +0100, Barnabás Czémán wrote:
> This patch series fixes supported ovp values related to pmi8994 wled
> and set same configuration for pmi8950 wled.
> It also corrects wled related properties in xiaomi-daisy, xiaomi-land and
> in xiaomi-vince.
> 
> 

Applied, thanks!

[1/7] dt-bindings: backlight: qcom-wled: Document ovp values for PMI8994
      commit: 02031064bb8f387d81988a8abb211f1366d87582
[2/7] backlight: qcom-wled: Support ovp values for PMI8994
      commit: f29f972a6e7e3f187ea4d89b98a76c1981ca4d53
[3/7] dt-bindings: backlight: qcom-wled: Document ovp values for PMI8950
      commit: b2df6cf10d5242bfef2cc957d83738ccb560ed9f
[4/7] backlight: qcom-wled: Change PM8950 WLED configurations
      commit: 83333aa97441ba7ce32b91e8a007c72d316a1c67

--
Lee Jones [李琼斯]

