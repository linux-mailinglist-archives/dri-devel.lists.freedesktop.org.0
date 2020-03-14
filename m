Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D12501855E8
	for <lists+dri-devel@lfdr.de>; Sat, 14 Mar 2020 16:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DC16E174;
	Sat, 14 Mar 2020 15:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1856E174
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Mar 2020 15:30:57 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id j17so10328419lfe.7
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Mar 2020 08:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nrrJw5jnsKcnYZke1fkAbMnXswGu3DHlxJpJ1mWNcSc=;
 b=n1Zz4YHrZC5MivrtvLnrrExA83Y0F6V7neZJUAyeAiAUiPtuNCe59G5TJdTyd0o7gG
 jh2/3M4rHaU3aMqIc23GIXCsQCDKzp+aaql8VI9iklbiJ8RVlBIh1HrGufL665FiCm7r
 rV7mmmqg1CjyxtPYDocJUOHIV1FkOiz6QqxtfaMoJm42shUdpIunUwo81gH8ATs5E1uC
 UtPmd4BVK6vyhB0AUsqcp8HKCmI7er9jHG9FO6iLEvEsFb0P8Pbth59ITdy1jKGEbVGk
 /6VwDOFNRnns3R3YbaTWTJ5RY3nVsT6CRpDHLvtjjgOe04FSJff5Hlr/XHRpoOjmPOmy
 ABrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=nrrJw5jnsKcnYZke1fkAbMnXswGu3DHlxJpJ1mWNcSc=;
 b=RFwx/sShbN+tgXnLNArFISXAqEv+BgjW+FoD6q80UDlKpR5ni0peLCJy/ZGQMGjTp4
 7s5jgDp4VcvL61qcgiQn4o3eHKbvha635aMDTwBsnJ/7x24+tSfz/p4Zzb3PpWVEwR+f
 EqjP4RYvtuKpCl2XacWvYDHYR1Qc6R2WJllfN2fzc1BwN9xKe1Yq+29dg2UNGMIoUP4Z
 TBEvuhO5/fnuH7asvQn6Yyg3TA1/h/N/zwbbx/jvtbVIo13UUZLX/IbkkLooMeKvc8I/
 JJ9G7ZK3fOlfKHDhB1yTIuabghWii+QWUn3UW0T3kZTldIRH6ejtq0zbAWCzp9O57t4S
 Gp+A==
X-Gm-Message-State: ANhLgQ1Pcu2CfdPKPAT9Hbe3iKjeCwsimCLvGh0O4boSBwyGdhbVOwxe
 C9slKtECPuq/b+Gw+X8VHMM=
X-Google-Smtp-Source: ADFU+vvxR0+0I4RqqN+UJxGMSf8TyU3X1cD6gx6O/+SsFCk3p2noVSOpj3blwUhudUODmJ8rU0ebiQ==
X-Received: by 2002:a19:ad47:: with SMTP id s7mr11517727lfd.165.1584199856040; 
 Sat, 14 Mar 2020 08:30:56 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 n200sm15650418lfa.50.2020.03.14.08.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2020 08:30:55 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v1 0/3] drm: drop data-mapping property from panel-dpi
Date: Sat, 14 Mar 2020 16:30:44 +0100
Message-Id: <20200314153047.2486-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the review of Laurent Pinchart we realised that the
data-mapping property introduced in panel-dpi binding
is not the right solution.

Remove it now, while we are working on finding a better way
to specify the interface between panels and display interfaces.

Include a patch to fix some grammar issues spotted in the same review.

	Sam

Sam Ravnborg (3):
      dt-bindings: display: drop data-mapping from panel-dpi
      drm/panel-simple: drop use of data-mapping property
      dt-bindings: display: grammar fixes in panel/

 .../devicetree/bindings/display/panel/display-timings.yaml    |  8 ++++----
 .../devicetree/bindings/display/panel/panel-common.yaml       |  4 ++--
 .../devicetree/bindings/display/panel/panel-dpi.yaml          | 10 ----------
 drivers/gpu/drm/panel/panel-simple.c                          | 11 -----------
 4 files changed, 6 insertions(+), 27 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
