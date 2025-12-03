Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8673EC9E18F
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 08:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D1510E0FC;
	Wed,  3 Dec 2025 07:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gua63jB4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A190410E0FC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 07:53:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 90F8F60172;
 Wed,  3 Dec 2025 07:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF4CCC4CEFB;
 Wed,  3 Dec 2025 07:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764748393;
 bh=GIt1O1sdOnAcu1gdxb3neSe5Nxyh0jnePFmYRYssJk0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gua63jB4vHJw+M/hLkKznQgJLnzHdioq6jffMYqiIOtHSaiBm+AGZaEL8IMEFjDoi
 Ie2GnlO5x1MvcBSgpB6tollJPd4QAGQI3RHnBd92PH7iUAk9/+HSQ/cwKBmM+cajJU
 PvSy0mDzHv2t8ZTUljlmCu6GOUvb/T1oN3NtnJ7O7DtABGHjNTX97g3dh813NQ4XhN
 E+DWXNlTA4h79r6GJQkvoypbE2anbIj7r/jq1NjrQOK6O3lXOiV98PmLZQicpd/BAO
 cPKNa1AnU8HRDZPMlCUOUclvhK1H/A02SewUL8/81zuhh+9BECozf73R+uhtK6x6+/
 fRp48NM63vBgA==
Date: Wed, 3 Dec 2025 08:53:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 phodina@protonmail.com, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 2/8] dt-bindings: panel: sw43408: adjust to reflect
 the DDIC and panel used
Message-ID: <20251203-faithful-steadfast-leech-5fbf14@quoll>
References: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
 <20251125-pixel-3-v4-2-3b706f8dcc96@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125-pixel-3-v4-2-3b706f8dcc96@ixit.cz>
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

On Tue, Nov 25, 2025 at 09:29:37PM +0100, David Heidelberg wrote:
> Add compatible for used LG panel.
> SW43408 is not panel, but DDIC. The panel itself is the
> LG LH546WF1-ED01, so introduce combined compatible for it.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/display/panel/lg,sw43408.yaml       | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

