Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 939253F60BF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 16:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DB089B11;
	Tue, 24 Aug 2021 14:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4A889B11
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 14:42:06 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 x9-20020a056830278900b0051b8be1192fso25957837otu.7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 07:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yhGPEZBjkq08uUtd6l2IpriYzbQMG6LhVhlNs+OO1DE=;
 b=iMhmHCK8kDiTtWgxZffbipaN7Xkxko3NiLcH8aiZ34JKkMiFqs+6MD+MqWisOQLxbn
 t0Q2EPOfidEguEmGPVipHqFM2f+tGyvQDziL9r9cdUDvU6sQNf0FkZFId2NWIdg/jfX7
 wD1m08vpX2kGSNQ5/+dF1zWcmShmpCyCxVPKBG8N4PojpO897xWGylQMJ2zPOzxqVa0C
 lsECCF7njB8ZiEWn+QDxo22j3Tmtx3MmvnHdRIaZvzdTveM+WwOZr4gmuDYvGzRj6xcC
 q9GmyAv1puzYJ1gshcJLLttQ7Mpb2lxRByby7+6CsFWdKyJHeTUXm4Mvzz0NLbt2oaHa
 kWIg==
X-Gm-Message-State: AOAM5307UuM2raa4N7+ssA5pn2OEJgwZcqhFc0QWGyJxE+Pg1O3OMH9/
 7t5xXKKUbE0LEuIlRKhvhg==
X-Google-Smtp-Source: ABdhPJzHcjEmPd8Ul0HajXxCl4SEILDsVRnXRGJhoo3du7EoOS2bgMCAKLJVO4seL7oOj1SfWO0zrQ==
X-Received: by 2002:a05:6808:1889:: with SMTP id
 bi9mr3081101oib.139.1629816125373; 
 Tue, 24 Aug 2021 07:42:05 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r15sm4702268oth.7.2021.08.24.07.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 07:42:04 -0700 (PDT)
Received: (nullmailer pid 412187 invoked by uid 1000);
 Tue, 24 Aug 2021 14:42:03 -0000
Date: Tue, 24 Aug 2021 09:42:03 -0500
From: Rob Herring <robh@kernel.org>
To: yangcong <yangcong5@huaqin.corp-partner.google.com>
Cc: thierry.reding@gmail.com, airlied@linux.ie, sam@ravnborg.org,
 dianders@google.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, daniel@ffwll.ch
Subject: Re: [v2 2/2] dt-bindings: drm/panel: boe-tv101wum-nl6: Support
 enabling a 3.3V rail
Message-ID: <YSUFOzdFQAqLUMW4@robh.at.kernel.org>
References: <20210819124844.12424-1-yangcong5@huaqin.corp-partner.google.com>
 <20210820070113.45191-1-yangcong5@huaqin.corp-partner.google.com>
 <20210820070113.45191-3-yangcong5@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210820070113.45191-3-yangcong5@huaqin.corp-partner.google.com>
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

On Fri, 20 Aug 2021 15:01:13 +0800, yangcong wrote:
> The auo,b101uan08.3 panel (already supported by this driver) has
> a 3.3V rail that needs to be turned on. For previous users of
> this panel this voltage was directly output by pmic. On a new
> user (the not-yet-upstream sc7180-trogdor-mrbland board) we need
> to turn the 3.3V rail on.
> 
> Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
> ---
>  .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml    | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
