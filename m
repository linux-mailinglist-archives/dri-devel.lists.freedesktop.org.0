Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F39D02086
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 11:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D042A10E6E0;
	Thu,  8 Jan 2026 10:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LzZZOBOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D52B10E6E0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 10:10:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3DC8060018;
 Thu,  8 Jan 2026 10:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62BF1C116C6;
 Thu,  8 Jan 2026 10:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767867001;
 bh=jhGglnHR79yKqzMve8kZuUJdzdwyNEoqDK2d7uLN0qk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LzZZOBOHwTd6nrl3/mbpOCHau0gCfmiYTDmWCyoFBGa4zofYuWFQz+EhZZL+46hGX
 bKrZAD4dVcQXwVVHAUS9Lf1fclm7MLcc7nuMWEHhn/bWIjO3zb3OBsF9VaWLAA59hz
 ioZoAOIPycOm3zpmADzhBEe+cMfNFw+VMNAuZjTxO8vmbhUs4sCuOFNub935V1fHSB
 wF/I3/cfExGbzozL6uhKb0aaD9Ou+linoMAj40L4CbOaFNbD6wzEUjz2T0uasVwU0E
 v0gqkJFm/Rxa/OR9Eclq2tXEuURfL+HxpFUlIkMpbrRY+rB/zVTlmudeGltnID8pC0
 4zlPsVHHIg5EQ==
Date: Thu, 8 Jan 2026 11:09:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Kiran Gunda <quic_kgunda@quicinc.com>, 
 Helge Deller <deller@gmx.de>, Luca Weiss <luca@lucaweiss.eu>, 
 Konrad Dybcio <konradybcio@kernel.org>, Eugene Lepshy <fekz115@gmail.com>, 
 Gianluca Boiano <morf3089@gmail.com>, Alejandro Tafalla <atafalla@dnyon.com>, 
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8994
Message-ID: <20260108-illustrious-original-harrier-e93aaf@quoll>
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-1-8687f23147d7@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260108-pmi8950-wled-v2-1-8687f23147d7@mainlining.org>
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

On Thu, Jan 08, 2026 at 04:43:19AM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Document ovp values supported by wled found in PMI8994.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  .../bindings/leds/backlight/qcom-wled.yaml         | 22 ++++++++++++++++=
++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

