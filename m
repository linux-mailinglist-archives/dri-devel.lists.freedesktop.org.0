Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6870CDF7D0
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 11:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D43910E87E;
	Sat, 27 Dec 2025 10:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gvEy1RBB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFC010E87E
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 10:26:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5271760007;
 Sat, 27 Dec 2025 10:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C1BFC4CEF1;
 Sat, 27 Dec 2025 10:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766831170;
 bh=i7XJIYAcw/8HkVs6WhLQcOjfqqNjkEqX4lOSYgSqDAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gvEy1RBBEuGkt69wQ+1y9Qb4HTew1OgKZ5ZdpcuJDJSMu/uL7r96oUSXeEmCYBEjH
 KztY8mSxlePyVqtUcxEDwsNWOzejle+LeK1qhaSPMFK1rrlFiDCR/UPojNvFGOcObf
 Xx+djfK/WmAoW0sMQKCtvitQcXQrQxBc7+w358XdBFxs4+2zuMDWKPoadqbgF0t7C2
 6VWFsW+cpFDF3kf4n8dDhJyc+8exDGtkxWpJvDaVt+UfB/iNncLgoZu/HX3gvfKT6f
 9FBKouoJJsDIIpOJ2njTyny8zDfQOmNu0MniQJq+9dQvFiKWZ+SMO3TXvtr9KPXa2D
 jHQv7ypDuimag==
Date: Sat, 27 Dec 2025 11:26:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com, 
 arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, 
 aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v7 1/4] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Kaanapali
Message-ID: <20251227-optimistic-silky-shrimp-f5dcd8@quoll>
References: <20251226070534.602021-1-kumari.pallavi@oss.qualcomm.com>
 <20251226070534.602021-2-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251226070534.602021-2-kumari.pallavi@oss.qualcomm.com>
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

On Fri, Dec 26, 2025 at 12:35:31PM +0530, Kumari Pallavi wrote:
> Kaanapali introduces changes in DSP IOVA layout and CDSP DMA addressing
> that differ from previous SoCs. The SID field moves within the physical
> address, and CDSP now supports a wider DMA range, requiring updated
> sid_pos and DMA mask handling in the driver.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

