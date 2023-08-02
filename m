Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B4D76D02F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 16:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F1710E1F1;
	Wed,  2 Aug 2023 14:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4F910E1F1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 14:38:07 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3a5ac8717c6so5339132b6e.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 07:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20221208.gappssmtp.com; s=20221208; t=1690987086; x=1691591886;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8nmftj9H6QNMjKvC/PHkZC+FCS8/x2xMcYkBxSq4Jqc=;
 b=Nq1cPX/iQ+SjG++rAIUe4TQ0nEJvKktHyDdQygPW6XGYm6QdZ22VYdWX3Sxia4lv/R
 YJuSNgBmBsiEtFjKvURlOY+apmhMQxa649KhDz3pit05rVnP0pFw6e83dyFOJJjEQzNM
 0vzLw+06LIheQacaf8f6rgsRruNeKoQQOtflwEXzm7ZJ6Z8vIxrKXinDr/ocV89/pImb
 /JrlZC6lPd7gqvpQrU2n55PHJKSeqQGNf+2cgjc/TscYTTu/dEGp5KDuSJtkvjVeamYh
 YQk7ZrAMcc0ajRcpiq2ELwz1ytTmjz3kH0rHjga+I055BHA+jcwpeDD7u+ByaQLXgddf
 mlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690987086; x=1691591886;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8nmftj9H6QNMjKvC/PHkZC+FCS8/x2xMcYkBxSq4Jqc=;
 b=DTV9wni6aOxFRxmqRWopeI5QwqxIehnPejW321z5eTVVa8S7FaJGuNAHDRvWkNrNJ7
 efZmh6dPykBt0nT8hjn4fCWT4vQtZibJxp6ntBpgeP7V1oZ7eqM4aR08uUg7L4EBYioO
 a1tkqVbM0LD0QomWu+cIC6KOvWQ3PhVNVM4n2WritrRlTQ+mShAXSvwsh0xg2LZ99fiW
 H7JNUf4WaJZZk2SiGTd4ul1jeAV2VIwT0Ms/RxgQtnvZ9mwseYHzuRiMtnYYXTP9KsFO
 imSNUSettoxjnRlML7R286nCvJAjwSa5EmlE8x2XRLszMrBOEisr94JT11l5NMZ5OJfC
 CyKg==
X-Gm-Message-State: ABy/qLaU0Bs48p70KPRMX8pArbGuq5frwc6rm8pU//OaUsAU6SiBGaOU
 q4XfVrnwE3th0VVoS+w7FUuN8HVt5TY0bIvH6Skp2w==
X-Google-Smtp-Source: APBJJlEzTjl6RKml+LdRCmbwAb2hGX3y19EwwY+i1muMiAb8Luqi1vw3YUfBLtHOB1vz1+aCnlEV0Yzu1qxjbKqjsqw=
X-Received: by 2002:a05:6808:3010:b0:3a3:ed41:5ab with SMTP id
 ay16-20020a056808301000b003a3ed4105abmr18113315oib.9.1690987086380; Wed, 02
 Aug 2023 07:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230731110012.2913742-1-jagan@edgeble.ai>
 <20230731110012.2913742-6-jagan@edgeble.ai>
 <20230801-residue-tractor-5c63e4447f2c@spud>
In-Reply-To: <20230801-residue-tractor-5c63e4447f2c@spud>
From: Jagan Teki <jagan@edgeble.ai>
Date: Wed, 2 Aug 2023 20:07:55 +0530
Message-ID: <CA+VMnFyh-ctPbf_j=CEXxPNKY+sUymV64Sdqqs-kY7dTojQYUA@mail.gmail.com>
Subject: Re: [PATCH 05/14] dt-bindings: display: rockchip-vop: Document rv1126
 vop
To: Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Aug 2023 at 02:37, Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, Jul 31, 2023 at 04:30:03PM +0530, Jagan Teki wrote:
> > Document the VOP for Rockchip RV1126.
> >
> > Signed-off-by: Jagan Teki <jagan@edgeble.ai>
>
> There's no commentary here about compatibility with other, existing,
> devices nor did you CC me on the rest of the series. How am I supposed
> to know if appending to enum is the right thing to do?

I had past comments not to add all people in the entire series and add
one relevant developer on respective patches. On that note, I tried to
CC the developers only involved in the respective areas. But, you are
CCed to the DT patch that affected this binding.
"[PATCH 10/14] ARM: dts: rockchip: rv1126: Add VOP_LITE support"

Please let me know if I missed anything.

Thanks,
Jagan.
