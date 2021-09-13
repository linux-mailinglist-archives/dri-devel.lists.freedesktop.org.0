Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 575CB409F27
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 23:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572586E283;
	Mon, 13 Sep 2021 21:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14A26E25A;
 Mon, 13 Sep 2021 21:31:58 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 i3-20020a056830210300b0051af5666070so15362350otc.4; 
 Mon, 13 Sep 2021 14:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=QU12R93C/2HpZJoOcgXvSj7FddUhGVnWB6kugUlE2BE=;
 b=Um1uBF7zCMtuawMsLnQIMGefVBnlv4f/hGDaDK527BZp+d/r3KdO3h2Xv2kPvcCNNA
 5+TGrw8k/gXGpC4RYBQsd6Qk1tSvBo6gShUt+nAwlW8qsAiQ3NNFWET5Ue346+N4S0EP
 60JN0AeNosZunDx4q2aPQg7OoesbpdhlU1rVMRBidLhVp77QTAzCOqhWRCbZWbhq+k52
 zRG4p1hIL8ddNYaCjy4fysdpjEMda70W3+EyK6d6nhE3iG+QGYcbT2mcfvK5mdm5o2/n
 YOLWxDZ0Mvm3oZR7yNFVKCVrFTKhaFcWEN/Qsd2asF6rekP1D0E243pXO/QTpSfDJfg1
 kI/g==
X-Gm-Message-State: AOAM532OiLDJzRgXAljEhSNkpd7musS7EKIMpq8rA1/36lz0ZxfQorHQ
 x7f3s/IgSNeYDvxezirULQ==
X-Google-Smtp-Source: ABdhPJws5hIKPlUv/5PkbnyXdCuMInLDuRZvOVl9H4kZSwlpFdEIIwEw12ixvJugCp4dooNmhS8Yaw==
X-Received: by 2002:a9d:71c6:: with SMTP id z6mr11552420otj.382.1631568718235; 
 Mon, 13 Sep 2021 14:31:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id i19sm2180255ooe.44.2021.09.13.14.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 14:31:57 -0700 (PDT)
Received: (nullmailer pid 1413000 invoked by uid 1000);
 Mon, 13 Sep 2021 21:31:54 -0000
From: Rob Herring <robh@kernel.org>
To: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 intel-gfx@lists.freedesktop.org, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20210913175747.47456-13-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run>
 <20210913175747.47456-13-sean@poorly.run>
Subject: Re: [PATCH 12/14] dt-bindings: msm/dp: Add bindings for HDCP registers
Date: Mon, 13 Sep 2021 16:31:54 -0500
Message-Id: <1631568714.653445.1412999.nullmailer@robh.at.kernel.org>
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

On Mon, 13 Sep 2021 13:57:43 -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch adds the bindings for the MSM DisplayPort HDCP registers
> which are required to write the HDCP key into the display controller as
> well as the registers to enable HDCP authentication/key
> exchange/encryption.
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  .../bindings/display/msm/dp-controller.yaml           | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/msm/dp-controller.yaml:26:5: [error] duplication of key "const" in mapping (key-duplicates)
./Documentation/devicetree/bindings/display/msm/dp-controller.yaml:27:5: [error] duplication of key "const" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/display/msm/dp-controller.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 122, in get_single_data
    return self.construct_document(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 132, in construct_document
    for _dummy in generator:
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 722, in construct_yaml_map
    value = self.construct_mapping(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 446, in construct_mapping
    return BaseConstructor.construct_mapping(self, node, deep=deep)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 264, in construct_mapping
    if self.check_mapping_key(node, key_node, mapping, key, value):
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 295, in check_mapping_key
    raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 25, column 5
found duplicate key "const" with value "hdcp_key" (original value: "dp_controller")
  in "<unicode string>", line 26, column 5

To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys

make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/display/msm/dp-controller.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 25, in check_doc
    testtree = dtschema.load(filename, line_number=line_number)
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 623, in load
    return yaml.load(f.read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 122, in get_single_data
    return self.construct_document(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 132, in construct_document
    for _dummy in generator:
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 722, in construct_yaml_map
    value = self.construct_mapping(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 446, in construct_mapping
    return BaseConstructor.construct_mapping(self, node, deep=deep)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 264, in construct_mapping
    if self.check_mapping_key(node, key_node, mapping, key, value):
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 295, in check_mapping_key
    raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 25, column 5
found duplicate key "const" with value "hdcp_key" (original value: "dp_controller")
  in "<unicode string>", line 26, column 5

To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys


During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 67, in <module>
    ret = check_doc(f)
  File "/usr/local/bin/dt-doc-validate", line 30, in check_doc
    print(filename + ":", exc.path[-1], exc.message, file=sys.stderr)
AttributeError: 'DuplicateKeyError' object has no attribute 'path'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dp-controller.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/display/msm/dp-controller.yaml
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1527534

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

