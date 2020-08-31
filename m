Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0410C2579F4
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 15:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D246E24E;
	Mon, 31 Aug 2020 13:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B84D6E24E
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 13:03:04 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id q3so2984212pls.11
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 06:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+IiUboT2JLDJY0XsSVzEObSUqQ+wJYQmQ9IQlrmfRQE=;
 b=AU7yxeODVSir9VRjdBY8vrW2CXURGru6jWd9wyEjXM4CcofAOpb2CtmWHknrxH+loJ
 AbqRTohLYEli5/hYHYRPDitwwHEs0IOEWpFE298hoUlMgE14e+nfgqeYft3sr2/FiDVX
 IxliwDpqNj9sEMfQ50HSyMEv6RnFicAPELAe0y5526i31VmuEQ7fAVI4FlYV4xNt98ke
 6lFjeg2hU3z9nPxSDJwZIZh9cPYoRZW6qLsoztODDCY/PcX+EJq0Cu4sFutLqKfYv/Wr
 gZBcH8gJi9eZ2vvSxbFc/o/gbyIqUhLbXhL+UOIvHiOdiNYLHSSf3/WkD54/eHcNV33b
 U7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+IiUboT2JLDJY0XsSVzEObSUqQ+wJYQmQ9IQlrmfRQE=;
 b=CE3/Bbv/JnTILKslJNp9UiSHA7KKdGkkxwunneDFEbV1yq3+CJPi+1jfcT0htvFRzs
 9l5do4vApWfGesGmCAuKnBG4UG5yrmlbohl8dAAqDmiRa+xjUUc2YDX+21qjFR8pjy0w
 AcFxhu2VGNI9oXNzPML3+qKEC5FAXpOHkLfwInGkrWNRUuVV0GsnokJoEJSSWjCnP2u+
 pSaD2JKfpie93g/6aUez8QCbpVT8+02ICgV7jfQej93H+QuV4uOjGen0T0917CF6h0kL
 Muzr56pHjT1tFheNW4UOmMup2MNoW9ZcihsmqJHLiZI5l5/N43esTGW/cp9hFIFOssUi
 00CQ==
X-Gm-Message-State: AOAM532ImpfSayMkPNoWhmgEbXcfBc27Vidzohp/R2QCQ5JQojUapmIb
 p46VpDIWfp6qA6POvKMz5TKAcQ==
X-Google-Smtp-Source: ABdhPJxMUeWG8U9zaI/FC6OP08+JhDmE4fNYmOk9ttc38HQyfr05FpxaMoj5JbHP7FA3wP0uCaHjlQ==
X-Received: by 2002:a17:902:b681:: with SMTP id
 c1mr956980pls.214.1598878983503; 
 Mon, 31 Aug 2020 06:03:03 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
 by smtp.gmail.com with ESMTPSA id l21sm7400580pgb.35.2020.08.31.06.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 06:03:01 -0700 (PDT)
From: Sumit Semwal <sumit.semwal@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v6 0/2] Add support for Tianma nt36672a video mode panel
Date: Mon, 31 Aug 2020 18:32:49 +0530
Message-Id: <20200831130251.19769-1-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some Poco F1 phones from Xiaomi have a FHD+ video mode panel based on the
Novatek NT36672A display controller; Add support for the same.

Most of the panel data is taken from downstream panel dts, and is converted to
drm-panel based driver by me.

It has been validated with v5.9-rc1 based drm-misc-next on Poco F1 phone; my tree with other
dependent patches is here [1]

[1]: https://git.linaro.org/people/sumit.semwal/linux-dev.git/log/?h=dev/poco-panel-upstreaming

---
v2: In dt-binding, removed ports node, making port@0 directly under panel@0 node.
     Also updated the panel_on delay to a safer 200ms as needed for latest Android.
v3: Replaced port@0 with just port in panel@0 node.
v4: Since "0425662fdf05: drm: Nuke mode->vrefresh", we have to calculate
     vrefresh on demand. Update for it.
v5: Fixed review comments from Sam:
      - rebased on top of drm-misc-next
           remove return of drm_panel_add()
           remove drm_panel_detach()
      - renamed the panel driver file to reflect that this is a novatek
           nt36672a display driver and not only for tianma panels.
           Adjusted some internal names also to reflect the same.
      - corrected changelog to add info about the generic Novatek DSI IC
      - corrected compatible string accordingly
      - removed pinctrl
      - used drm_panel* API for prepare/unprepare/disable/remove
v6: Fixed few review comments on v5 from Sam:
      - add dev_err_probe() support
      - move DRM_* error printing to dev_err()
      - removed a few unnecessary bits

Sumit Semwal (2):
  dt-bindings: display: panel: Add bindings for Novatek nt36672a
  drm: panel: Add novatek nt36672a panel driver

 .../display/panel/novatek,nt36672a.yaml       |  87 ++
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-novatek-nt36672a.c    | 740 ++++++++++++++++++
 5 files changed, 845 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36672a.c

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
