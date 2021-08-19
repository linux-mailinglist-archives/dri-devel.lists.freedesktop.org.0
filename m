Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DD43F222D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 23:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1D06E901;
	Thu, 19 Aug 2021 21:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292436E901
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 21:19:14 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id u10so10327008oiw.4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 14:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=6ndjQ7qKsm3BuTtzm2lsx8jxF6MbixFKOgts6IRJ5+8=;
 b=KUcEX7jZI5EEhM5uDYjdvr+vQfxSCVj0aoLqudIk5vjOQ4RA3MqDa7/cCunfn5Armp
 DyOifOxCNlKyBvcAogpBxKVTNlEC1BHe/jAkIvxBLWOjUVpCtZUqhsitRpf+XIV6sEvQ
 0/tZzx3cOq+ZqYd8ZLjlHcHQ+ZG6Gwqako0Y1iRTp+k+YSL7nIMPeBGqgjnk8p9jOJkn
 BRi7VmgbVWjHdZxaiNGQQFBXOZJ1iosUZqP+95B42wSXV8+7B5eWV6xa+WPcDduW9iSy
 yvUgpQ3jWoVOqp1cpHogAC4bNl+qV5IGBa5kzFihSUHXqiQaH/BqVJIcPER4IsS8ajB1
 e52g==
X-Gm-Message-State: AOAM533lJ4NSOB6joDweXstdKn9dN5PKw2VrRpOgeJrE3oJAsYKYMCax
 9Wc/l5pNQbw6k/bXqD4emA==
X-Google-Smtp-Source: ABdhPJxXUzWsn+3Lyb8xHlM4XaqeFdxFTJhM4+LmDbUIinWDqggh+Xp8sgMp4ePnrnvS8JfUkyCm3w==
X-Received: by 2002:aca:bec2:: with SMTP id o185mr528567oif.151.1629407953436; 
 Thu, 19 Aug 2021 14:19:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o11sm975827otp.8.2021.08.19.14.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 14:19:12 -0700 (PDT)
Received: (nullmailer pid 1418773 invoked by uid 1000);
 Thu, 19 Aug 2021 21:19:11 -0000
From: Rob Herring <robh@kernel.org>
To: yangcong <yangcong5@huaqin.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sam@ravnborg.org, thierry.reding@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 devicetree@vger.kernel.org, dianders@google.com
In-Reply-To: <20210819124844.12424-3-yangcong5@huaqin.corp-partner.google.com>
References: <20210819124844.12424-1-yangcong5@huaqin.corp-partner.google.com>
 <20210819124844.12424-3-yangcong5@huaqin.corp-partner.google.com>
Subject: Re: [v1 2/2] dt-bindings: drm/panel: boe-tv101wum-nl6: Support
 enabling a 3.3V rail
Date: Thu, 19 Aug 2021 16:19:11 -0500
Message-Id: <1629407951.445122.1418772.nullmailer@robh.at.kernel.org>
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

On Thu, 19 Aug 2021 20:48:44 +0800, yangcong wrote:
> The auo,b101uan08.3 panel (already supported by this driver) has
> a 3.3V rail that needs to be turned on. For previous users of
> this panel this voltage was directly output by pmic. On a new
> user (the not-yet-upstream sc7180-trogdor-mrbland board) we need
> to turn the 3.3V rail on.
> 
> Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
> ---
>  .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml   | 4 ++++
>  1 file changed, 4 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.example.dt.yaml: panel@0: 'pp3300-supply' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1518662

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

