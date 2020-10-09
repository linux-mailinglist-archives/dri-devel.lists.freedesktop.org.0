Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB43288A3E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 16:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A5C6ECEA;
	Fri,  9 Oct 2020 14:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F456ECEA
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 14:02:45 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id f37so9014902otf.12
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 07:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CN5Jrnu+gIWgecJATx8xPG6kiZL3kXpcUvow4xgdW3E=;
 b=IlX0mA0GroF7tnEmrRhmQ/Lj6KWeEtCmlpnOmRTuDDAvY72h4uyPwWQcOU+6Iq1MgL
 nHKxQGJgdkWUWGIsb62iBz5AjJJGaJ5RJrLgGdqAEVSuXcu3Er3LEcgqZkGjIQwpNYoK
 h7o+1xeQbSzS4oP1tJT2Vy0NU/mN83z+rArHhebxclcY/N7IGPTa6jZ8PVT58o0ej/Lu
 e8tmJvr0rhWv7MfX476t8ZRkR6Cxu/m1qiSLGftI0dlh+Q+zh6qgBasBldnVFoIW0zNg
 +QS4x7Kql/yqZG+vPyY0VKHT0dfcAWV4TCQbLtvypBHfWPw922lPlZyfmkOGbuK1zAfi
 H3wQ==
X-Gm-Message-State: AOAM5335V8cOkywJpNrYO1J8qhMQeV0DQZhqzm8WPUrslDlw4CdI28bD
 NDH/zMh09QWkk7kH+vgXgg==
X-Google-Smtp-Source: ABdhPJwr696vOEMkrUKZxSTAGV6kme0EZ2llEvyPP0cpkFOzhxtn65bbQ8oFusmIfFnar9qX9xHAVg==
X-Received: by 2002:a9d:3626:: with SMTP id w35mr9301024otb.206.1602252165140; 
 Fri, 09 Oct 2020 07:02:45 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c200sm7482570oig.55.2020.10.09.07.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 07:02:44 -0700 (PDT)
Received: (nullmailer pid 4072341 invoked by uid 1000);
 Fri, 09 Oct 2020 14:02:43 -0000
Date: Fri, 9 Oct 2020 09:02:43 -0500
From: Rob Herring <robh@kernel.org>
To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH 2/5] dt-bindings: panel: add documentation for oneplus6
 panel
Message-ID: <20201009140243.GA4071736@bogus>
References: <20201007174736.292968-1-caleb@connolly.tech>
 <20201007174736.292968-3-caleb@connolly.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201007174736.292968-3-caleb@connolly.tech>
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 07 Oct 2020 17:49:14 +0000, Caleb Connolly wrote:
> Document the OnePlus 6/T common panel driver, example from
> arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  .../display/panel/panel-oneplus6.yaml         | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/display/panel/panel-oneplus6.example.dts:19.9-14 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/display/panel/panel-oneplus6.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1378187

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
