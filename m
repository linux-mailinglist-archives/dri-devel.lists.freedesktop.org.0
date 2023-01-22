Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 772B2677028
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 16:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE5A10E17E;
	Sun, 22 Jan 2023 15:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A4A10E17E
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 15:31:38 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id p133so8403708oig.8
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 07:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FZkzDMS1ZlJGneVFTqUpOfvr7Yi2qPmA1JudWoB5Wqg=;
 b=UdZxBuqiBS8e7+HACeJ9hyS4mJKdbk5D/EdnWaP8QEdByZ692caJJYfX5fmivL6P1F
 8hUxhGFRs6itCAIhMEoN0ZiquPz4s1o/zw2Hp3gPBKsqvp07RJSvEWGfrc/hvCVRXQDS
 NTy5bgmpHJdYh7ndLRF10+sjdb/w/FFGcnEEs4qsimqNDHOEu3oPZdIgdPHb9XK9Qasp
 59Yfd6kPMZvSdnM1L20BxSezXvhRyTGGwhdZRoQm1QXjPR+EJgZ+DR9ekUq1zm/WW3yU
 XU+HvFzxqH3ikvW8R6wxH5mEJ5DjkS8Ot8Zpf0HsfACtlXqEsybvEM/TKUgz6wGWbfvi
 LY3w==
X-Gm-Message-State: AFqh2kp9YeaftEaIvCn3qnP1PoTBdq9hmBdwn3omEsv0lOKqbLb+pIbM
 Vfq36O5Rc1RBjr6cXJOWaw==
X-Google-Smtp-Source: AMrXdXs6x0mubg9C92n0oqZLWm6BQqgv4Go44B2qICGsMrS6njK5eu8A1Orc0x+NYVCJMr9qIjOXdQ==
X-Received: by 2002:a05:6808:189d:b0:364:d523:e138 with SMTP id
 bi29-20020a056808189d00b00364d523e138mr11734098oib.32.1674401497338; 
 Sun, 22 Jan 2023 07:31:37 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 2-20020aca0602000000b0036508145326sm10737337oig.9.2023.01.22.07.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 07:31:36 -0800 (PST)
Received: (nullmailer pid 2288127 invoked by uid 1000);
 Sun, 22 Jan 2023 15:31:35 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Rayyan Ansari <rayyan@ansari.sh>
In-Reply-To: <20230121153544.467126-3-rayyan@ansari.sh>
References: <20230121153544.467126-1-rayyan@ansari.sh>
 <20230121153544.467126-3-rayyan@ansari.sh>
Message-Id: <167440123887.2283488.2841716718270566192.robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: display: simple-framebuffer: Document
 physical width and height properties
Date: Sun, 22 Jan 2023 09:31:35 -0600
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 asahi@lists.linux.dev, janne@jannau.net, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 21 Jan 2023 15:35:44 +0000, Rayyan Ansari wrote:
> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
> ---
>  .../devicetree/bindings/display/simple-framebuffer.yaml   | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/simple-framebuffer.yaml: properties:width-mm: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/simple-framebuffer.yaml: properties:height-mm: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230121153544.467126-3-rayyan@ansari.sh

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

