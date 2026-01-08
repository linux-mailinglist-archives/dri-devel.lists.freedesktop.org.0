Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0551D00EC4
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 04:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA6E10E676;
	Thu,  8 Jan 2026 03:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="f0OTr26U";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="CnOM96sg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B51910E676
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 03:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1767843807; bh=AvIzM2nLqwPVqyqqe4S5ee1
 crGx+CsMVd1ai9BANdC4=; b=f0OTr26UiT7GIgVZKTmWAYSbSwE5vFBJEGUd16CEEKoF7cZalg
 PgXZt79hdNp6LHZSDolSIGKVNPTdptFbXI/Q9vLZgHjHHgQjD2FrbLnrK6H9FMqjtvApmj52XTt
 LMcXxawkektU4aim0LeUZOSQ9t02pJQlP1QSJcCCkKhfzUdyZPd5NpnqIkN7MW5hyzcr3JPgimT
 Bo2EacxXEU1pUpFxa3hrLIlKi/TTwurW15LZikLMD/ZvrpDST5UX7Z1bH6HTUR6g5m5rYEjE/Ir
 l3IgY2g9FvEd0/f6PEMYsZSP4El4KrdJrnwDIdxPV/YwDnuzNmAU8slM5wF/9RcMceQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1767843807; bh=AvIzM2nLqwPVqyqqe4S5ee1
 crGx+CsMVd1ai9BANdC4=; b=CnOM96sg1N3j7zzi0tMSO9BEz9yV5gPHyqQq127VOJEz6c/3+Z
 UvjghNLS0wWClBnaPzndbbxnBzgN1HcCItBA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Thu, 08 Jan 2026 04:43:23 +0100
Subject: [PATCH v2 5/7] arm64: dts: qcom: msm8953-xiaomi-vince: correct
 wled ovp value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260108-pmi8950-wled-v2-5-8687f23147d7@mainlining.org>
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
In-Reply-To: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>, 
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>, 
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>, 
 Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Thompson <daniel.thompson@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767843800; l=985;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=R51pIOSxhagbTKh1Jt1ByaR5vAKzdpI0frd0dUUM/+g=;
 b=oN2acr/W98lwM8fcqXwIMjp8lDu4Er4W65gMn+nJV4XhwUrEhpH1qBbOdnnX44h5MmluL9Vhs
 RwL6gSur57OCon433VPOrXCg/bJHh5LpUACYjG4IvHVMp+3x8PgMpR7
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
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

PMI8950 doesn't actually support setting an OVP threshold value of
29.6 V. The closest allowed value is 29.5 V. Set that instead.

Fixes: aa17e707e04a ("arm64: dts: qcom: msm8953: Add device tree for Xiaomi Redmi 5 Plus")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts
index d46325e79917..c2a290bf493c 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts
@@ -169,7 +169,7 @@ &pm8953_resin {
 
 &pmi8950_wled {
 	qcom,current-limit-microamp = <20000>;
-	qcom,ovp-millivolt = <29600>;
+	qcom,ovp-millivolt = <29500>;
 	qcom,num-strings = <2>;
 	qcom,external-pfet;
 	qcom,cabc;

-- 
2.52.0
