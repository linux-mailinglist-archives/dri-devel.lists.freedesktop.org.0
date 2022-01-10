Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80578489DDA
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 17:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D5E10EDC2;
	Mon, 10 Jan 2022 16:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F91210EDC2;
 Mon, 10 Jan 2022 16:49:05 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 c3-20020a9d6c83000000b00590b9c8819aso6140835otr.6; 
 Mon, 10 Jan 2022 08:49:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=qDRfQflqgI0j3IFv1YfAD/jfGjPzZE2xk/OYXfhH8io=;
 b=pf0+2RwKuiTkVjyBi5o1pgrvlmagN9W96mXO2GOA01bo82jOSjawH4stsp3iluevqv
 G20JXj9WN40HzzuumUUKRFONd7lSbz3wOtgNK9AkTneg7AwzWXK4nWzQcSPOUE9S4CJL
 baY3auLkkm9MyobdpN+HiEXqUfe+p327UcfhGyFTFXZSYBvE9PYdHTc17n0bUwEnc77K
 0NGgPAYxjGtIbkFWKLBN9TtLq7XfzytaSU77YUSaCeJY947kzKaq0ylc7mjupEqRJyOI
 cyDArfrFjK6q7RGQOtCRk2BZyse4BRIZJX+SKmihL622qApbAI4q4h8Ubcl0rD/p1jwc
 o2NA==
X-Gm-Message-State: AOAM53349mTACvZrFKDc3GLM6P5k7J8iOaoA2dVCp/5HBiVN3EKl4YVa
 PYMSMQcfsX73omRwTNCvdQ==
X-Google-Smtp-Source: ABdhPJyJeiZuCm18RR/zHJ1xaf3Vi0nrJE1jDK4z8CB/A8DygQapHCXq1kD5ADgN/3pUP5MHSBZHgQ==
X-Received: by 2002:a05:6830:1bfc:: with SMTP id
 k28mr478325otb.39.1641833344450; 
 Mon, 10 Jan 2022 08:49:04 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id z30sm1533929otj.1.2022.01.10.08.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 08:49:03 -0800 (PST)
Received: (nullmailer pid 1067456 invoked by uid 1000);
 Mon, 10 Jan 2022 16:48:59 -0000
From: Rob Herring <robh@kernel.org>
To: Rajeev Nandan <quic_rajeevny@quicinc.com>
In-Reply-To: <1641819337-17037-2-git-send-email-quic_rajeevny@quicinc.com>
References: <1641819337-17037-1-git-send-email-quic_rajeevny@quicinc.com>
 <1641819337-17037-2-git-send-email-quic_rajeevny@quicinc.com>
Subject: Re: [v2 1/3] dt-bindings: msm/dsi: Add 10nm dsi phy tuning properties
Date: Mon, 10 Jan 2022 10:48:59 -0600
Message-Id: <1641833339.702532.1067455.nullmailer@robh.at.kernel.org>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org, jonathan@marek.ca,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, sean@poorly.run,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Jan 2022 18:25:35 +0530, Rajeev Nandan wrote:
> In most cases, the default values of DSI PHY tuning registers should be
> sufficient as they are fully optimized. However, in some cases where
> extreme board parasitics cause the eye shape to degrade, the override
> bits can be used to improve the signal quality.
> 
> The general guidelines for DSI PHY tuning include:
> - High and moderate data rates may benefit from the drive strength and
>   drive level tuning.
> - Drive strength tuning will affect the output impedance and may be used
>   for matching optimization.
> - Drive level tuning will affect the output levels without affecting the
>   impedance.
> 
> The clock and data lanes have a calibration circuitry feature. The drive
> strength tuning can be done by adjusting rescode offset for hstop/hsbot,
> and the drive level tuning can be done by adjusting the LDO output level
> for the HSTX drive.
> 
> Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>
> ---
> 
> Changes in v2:
>  - More details in the commit text (Stephen Boyd)
>  - Use human understandable values (Stephen Boyd, Dmitry Baryshkov)
>  - Do not take values that are going to be unused (Dmitry Baryshkov)
> 
>  .../bindings/display/msm/dsi-phy-10nm.yaml         | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml:63:54: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml:  mapping values are not allowed in this context
  in "<unicode string>", line 63, column 54
make[1]: *** Deleting file 'Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 46, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 119, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 891, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: mapping values are not allowed in this context
  in "<unicode string>", line 63, column 54
make[1]: *** [Documentation/devicetree/bindings/Makefile:25: Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml: ignoring, error parsing file
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1577891

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

