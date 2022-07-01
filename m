Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E12C563A18
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 21:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF73814A56E;
	Fri,  1 Jul 2022 19:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D2814A56E;
 Fri,  1 Jul 2022 19:57:03 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id s17so3244864iob.7;
 Fri, 01 Jul 2022 12:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2236WeJFhld+gP+seBGzERxVMGLyh9tBEeYJJbEdYHE=;
 b=MJSQcUZy77GEak46phOHD9eNNSjnPsyMw3MpL+XulK/omteQhDTCff6yKIrPabVfvT
 q8cidG0vIcA1p6Piacv7UEz6sEd5GUWBrYEvF3lhQ0qgEbVr6v1L9v+ZvfDN8V21mAvC
 0CjFuniO5EWtULGnvnpymYhQYZBA0ia+T31AxzL4ATUE0eXHf55FDlPnlDT1lmpPLgH6
 vfRBhZa4Fe9j5tvWPqJv4/zTEdRqbGKNtTae6RVmIaAEoRVMdPG6sXBlJaZr8UgAztyl
 2X6d367VbZC+T/hW7JFO8Rkk5LSn1gjN8fy1stiRtWqJkx4GvKe5LfSTK21m3mQ53zXG
 aUgw==
X-Gm-Message-State: AJIora+DavqljMNF0f4o++TCnkE+ecPiv5Y0eK+Gx3LqcE4j7azlbi2y
 m8SjtJ1cW/hgFPbFkLalng==
X-Google-Smtp-Source: AGRyM1ssGJMKXpVscalQyMv8NhtOBWfOOYKnSAoLW+RU5N3w9LbS3Z9hEO7Wd8qTb11ruIeOEAtfhg==
X-Received: by 2002:a05:6602:26d1:b0:669:734a:4c8a with SMTP id
 g17-20020a05660226d100b00669734a4c8amr8404169ioo.209.1656705422645; 
 Fri, 01 Jul 2022 12:57:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 c68-20020a02964a000000b003315fa78c0bsm9926313jai.146.2022.07.01.12.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 12:57:02 -0700 (PDT)
Received: (nullmailer pid 1416680 invoked by uid 1000);
 Fri, 01 Jul 2022 19:57:00 -0000
Date: Fri, 1 Jul 2022 13:57:00 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/7] dt-bindings: msm: dsi: Fix phy-name binding
Message-ID: <20220701195700.GA1413048-robh@kernel.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-2-bryan.odonoghue@linaro.org>
 <ff3caa0b-a248-d5ee-a3e5-c49fc41b8cff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff3caa0b-a248-d5ee-a3e5-c49fc41b8cff@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, quic_mkrishn@quicinc.com, dmitry.baryshkov@linaro.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, bjorn.andersson@linaro.org,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 30, 2022 at 08:59:03PM +0200, Krzysztof Kozlowski wrote:
> On 30/06/2022 14:08, Bryan O'Donoghue wrote:
> > The driver doesn't care about the name of the phy in DTS. msm8916 has since
> > 2016 named the phy "dsi-phy" with later SoCs taking the name "dsi".
> > 
> > There's no reason to have a constraint on the name here, simply to have a
> > name. Remove the redundant const in favour of maxItems: 1.
> 
> For single entry the names field could be as well removed. But if it is
> there, let's make it specific, not generic. Therefore instead add
> allOf:if:then restricting it per variants.

If we really don't care, an if/then seems excessive. Just mark as 
deprecated and remove it in all the dts files. 

Rob
