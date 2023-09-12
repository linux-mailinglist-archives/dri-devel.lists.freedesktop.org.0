Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E397A41EB
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0AD10E1BC;
	Mon, 18 Sep 2023 07:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-224.mta1.migadu.com (out-224.mta1.migadu.com
 [IPv6:2001:41d0:203:375::e0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7688410E3C9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 09:01:46 +0000 (UTC)
Date: Tue, 12 Sep 2023 18:56:13 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1694509304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AQMG4IAKejf/CGnCOSYDfecunXNntYUhuM2biZeDc8E=;
 b=yIZJ5OhdDceWTGU8MpBJJ9Lv0Ywhl3xSgMrkbjvJYrtXz99XD+m8oYp1m16KhKTEa9jqEn
 MPT8Sb0wpXVL7vcuK0ACtJcWUHtO+J5VW9B+8Gb+YvGTF22WCsAOb2z4ASaJK1WSgCOXXi
 1h4gF3MXZMiZlz5d4DxZp/LnWX+xkhU+DGtCAlHuwq1PwdTSBd7IRdO0BFKIsNLAJ4rLwF
 2lWVX9wM/+V5aizAkrhX+wziUms5n3bupy6kN9tTVleK1Uu7xO0YuXjzLFjbbuIOm0MhKH
 W/DabcmLaaYzuhosNQC/keG1e0VqPag4gF6pfVc5f/5HKJxcTTGWy6/xJhYA7Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [RFC PATCH 8/8] dt-bindings: display: panel: add Fascontek
 FS035VG158 panel
Message-ID: <ZQAnrcYBfhLu-vbd@titan>
References: <20230911090206.3121440-1-contact@jookia.org>
 <20230911090206.3121440-9-contact@jookia.org>
 <e22e61e7-02b1-8127-888d-e470838f4a18@linaro.org>
 <ZP7il27e9cExVWaL@titan>
 <c4d89d97-f8d4-da2e-dea9-6c054cf07eb3@linaro.org>
 <ZP9Eoh06Sirl_97l@titan>
 <42d4878a-4574-377e-e307-0dbef2354aa9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42d4878a-4574-377e-e307-0dbef2354aa9@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 18 Sep 2023 07:16:21 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 08:55:31AM +0200, Krzysztof Kozlowski wrote:
> On 11/09/2023 18:47, John Watts wrote:
> > On Mon, Sep 11, 2023 at 01:49:39PM +0200, Krzysztof Kozlowski wrote:
> >> If the other panel has exactly the same case, then yes, you can do like
> >> this. But it depends on the bindings - to which ones do you refer as
> >> your tmeplate?
> > 
> > Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
> 
> The file is indeed serving as poor example.

I'm happy to fix it up according to your response and include it in v2 of the RFC.
Should this be split in to two RFCs- one for cleanup, one for the new panel?

> 
> Best regards,
> Krzysztof
> 

John.
