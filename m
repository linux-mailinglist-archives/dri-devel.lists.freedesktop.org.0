Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 921C4606E16
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 04:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB7210E565;
	Fri, 21 Oct 2022 02:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C143E10E565
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 02:58:07 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id e129so1332787pgc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 19:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oHilljWsWRx1PWhY+hLvNRoEhjRSaugmuLh1rPSUKY0=;
 b=w07XQlruQ9Efxxdw/R9T6Gpz9e0SNGX+p751DPbHJUS2x/ClWvuXwL7G1XlJ5T10FN
 sjXN+dIDcWjTcaqOL1f9uKocw0NaymGwMrt+3GWVlihy/FVbPCUQMjtpD6NRxthg80S/
 eLi8vQeDiWar+V44wT60WV4JexRSK/ym6eAvmNoto7tIswVs8nD/AnKf/IuTtc/D4SND
 T2GKKR9NNVaGD20nYPeZ6TMYK2Qvf1sMsjNZqf4qPJsRVfQhwRPnB8hXH0bCOwEsRLZy
 v/yW74T0BhIO5DTE2Ge9nzC4cQzlqDA6P8rwnmWeMjxz8/WRgML1tPecoLtZ+CN9ixtb
 8k0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oHilljWsWRx1PWhY+hLvNRoEhjRSaugmuLh1rPSUKY0=;
 b=ZFfQMI9dol4pLp+Uk+96OiwJVN2zgAhRFpK+mS2h5cFe4tCqXpHFUro7Crgf4N3GbY
 EjtHH+mm6YlBjOEQeW8s8D9b9DxITDrSuCXcupPWuZ6iavy5zWb4nQ8wsMIjP8lN3oij
 7DNbpubZMy3zkNOH8ovz1pF6bhlVKBARaBwWaOkF7b/69o16dishF1m8CwOhj+qob0o4
 EC3yxayZHOEBmZ92DrjWrxP3nRasawdNalVLd7UvPp8SXIzwUVxaD64WvijPdb4CoYk3
 NPOL5Wu/2R7Ht7qtd5+tTt6xHQ3grQzFGe6EBv9Htx8LNf1FeLYW6ER/ABr2Q55+UaTK
 XJKw==
X-Gm-Message-State: ACrzQf24r6yKO0WUXaO+q1nin5GeVTf40qVzWcmSx5CGBwdOx6bmE+Zw
 i8tgCzi1gGnhyhCTdoFBztZHZw==
X-Google-Smtp-Source: AMsMyM52H2RHBB/4+tA06rxTThZHTboHHp2FHsYn0xOVv7ZPD54oocgDFweSipS1HWKyPrl3EB5Z3g==
X-Received: by 2002:a65:42c7:0:b0:462:7158:c863 with SMTP id
 l7-20020a6542c7000000b004627158c863mr14691575pgp.590.1666321087284; 
 Thu, 20 Oct 2022 19:58:07 -0700 (PDT)
Received: from sean-biuld-server.itotolink.net
 (1-34-200-211.hinet-ip.hinet.net. [1.34.200.211])
 by smtp.gmail.com with ESMTPSA id
 f26-20020aa7969a000000b00561879b0f3asm13731695pfk.203.2022.10.20.19.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 19:58:06 -0700 (PDT)
From: Sean Hong <sean.hong@quanta.corp-partner.google.com>
To: dianders@chromium.org, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/panel-edp: Add INX N116BGE-EA2 (HW: C2)
Date: Fri, 21 Oct 2022 10:58:01 +0800
Message-Id: <20221021025801.2898500-1-sean.hong@quanta.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Sean Hong <sean.hong@quanta.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the INX - N116BGE-EA2 (HW: C2) panel.

Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 4b39d1dd9140..724b27a53299 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1883,6 +1883,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
 
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1139, &delay_200_500_e80_d50, "N116BGE-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1152, &delay_200_500_e80_d50, "N116BCN-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1154, &delay_200_500_e80_d50, "N116BCA-EA2"),
-- 
2.25.1

