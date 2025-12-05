Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2EACA6B62
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 09:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8F510EA4A;
	Fri,  5 Dec 2025 08:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IC8oLUOB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A352410EA4A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 08:33:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6E1D4441DA;
 Fri,  5 Dec 2025 08:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78EBC4CEF1;
 Fri,  5 Dec 2025 08:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764923601;
 bh=6FLIs79yqeUX+yeui13nYw2jSCWzh1jd9U8YZ/owWi4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IC8oLUOBy+kGiJRb5BvZsJ9aAcoM3x/OHWhf56X2GAXlFZZa2CxM6+Bv5Y2Zi0095
 up64MIePMwSzz4DSzq7XkxThvgJYm2PJCnH0Ghppz8PUY0TTGA8aGKZYGA57hiNahb
 Uhggo6IeBLIB7xkVa0E/6EqpQbe6BAyIZ/LpU9K1KgHz1O681DYkahlBAvTeM79HcY
 eqbqMPg3amofx9FOB2jzyLlZJx9dUifWsLfZE8ZX6HKSTkrPds2WeNFlKqpghvLteV
 7oi1jEepcF3wwUNbaIqSSEmA6nou7bNeQRUwByv/XiVPGm3EuueMXPAJEP/cMbnS6j
 BRk1zDVWrHH/g==
Date: Fri, 5 Dec 2025 09:33:19 +0100
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
Subject: Re: [PATCH v5 1/4] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Kaanapali
Message-ID: <20251205-silky-uncovered-panda-82b0bc@quoll>
References: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
 <20251202060628.1869967-2-kumari.pallavi@oss.qualcomm.com>
 <191e6be9-5e61-43b7-a75b-e2d211bc6630@kernel.org>
 <ab942177-a8a7-4047-9b6a-634aa3d15b21@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ab942177-a8a7-4047-9b6a-634aa3d15b21@oss.qualcomm.com>
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

On Tue, Dec 02, 2025 at 03:31:17PM +0530, Kumari Pallavi wrote:
> > I asked last time to drop the unnecessary items. Wasn't here before.
> >=20
>=20
> I=E2=80=99ll update the schema in the next patch series to remove the unn=
ecessary
> items. The revised version will look like this:
>=20
> properties:
>   compatible:
>     oneOf:
>       - items:
>           - enum:
>               - qcom,kaanapali-fastrpc
>           - const: qcom,fastrpc
>       - const: qcom,fastrpc
>=20
>

Yes.

Best regards,
Krzysztof

