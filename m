Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001731C5700
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 15:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087636E23D;
	Tue,  5 May 2020 13:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD246E23D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 13:32:40 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id r25so1938655oij.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 06:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aGzwYdYfDeCBheVXdcJg3XhWuww2Jcj8IasjcEOMoV0=;
 b=IPREnEZsEsJxKQC+3ZI/BFHc02wYsEvvuOMnvupkB+wwfIaGP5A9nNDX/bH12r/fRn
 +BUp0JGJjqTs3oPwzYI1MRKaOtjgs1tg8JwkYc03pEoW6Dldaar9n3sETAX7UPphtTFk
 ZBip3Oirryy67q7UHd0PaY/+2dwAhSN9FiWmP+zrYbz02BDajTkpTDCFVvgPDYZSBOKR
 NdB4SZ2CqcalOSrfdkvzfi9quykGrhHaggmWbkLb9/HXyOY1CgOg997Sgk0AeugNfJfA
 TWZxwGiBSIlWw3EZmDq8g3/ZKX4hNDu1umOgzRJ0lNOqtDmFDb4pY+mEd3Bqtl6y7s1B
 Zibg==
X-Gm-Message-State: AGi0PuZp/N4o0GU6iYkYI9agIJBZq8LjINhtej/aYnw6wn4///JjyThw
 2o1r75uVZwqTyIGVwrtYhw==
X-Google-Smtp-Source: APiQypIAPbkEpcmAYhh8URn60kb6nxOuIrbrTxcDfwgGhqJijN2M8awvs8XkUUWZp//f+WPg20NRnA==
X-Received: by 2002:aca:7209:: with SMTP id p9mr2407871oic.168.1588685559210; 
 Tue, 05 May 2020 06:32:39 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 1sm547503oir.5.2020.05.05.06.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 06:32:38 -0700 (PDT)
Received: (nullmailer pid 22806 invoked by uid 1000);
 Tue, 05 May 2020 13:32:37 -0000
Date: Tue, 5 May 2020 08:32:37 -0500
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konradybcio@gmail.com>
Subject: Re: [v3 PATCH 2/2] dt-bindings: display: Document ASUS Z00T TM5P5
 NT35596 panel compatible
Message-ID: <20200505133237.GA22147@bogus>
References: <20200504200102.129195-1-konradybcio@gmail.com>
 <20200504200102.129195-3-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504200102.129195-3-konradybcio@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konradybcio@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  4 May 2020 22:01:00 +0200, Konrad Dybcio wrote:
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  .../display/panel/asus,z00t-tm5p5-n35596.yaml | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/asus,z00t-tm5p5-n35596.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/panel/asus,z00t-tm5p5-n35596.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/display/panel/asus,z00t-tm5p5-n35596.yaml#

See https://patchwork.ozlabs.org/patch/1282986

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
