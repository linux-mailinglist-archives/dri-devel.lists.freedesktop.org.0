Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E65B3F59C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 08:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB69010E5A6;
	Tue,  2 Sep 2025 06:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Fgm4NTez";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6278510E5A6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 06:35:32 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3dad6252eacso57275f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 23:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756794931; x=1757399731; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KXtGT/edUu9psEEBI1HKjcB2ey4kH977Imncx2h66lA=;
 b=Fgm4NTezzcSYV17BmICXdRTEWO3vI9BA0PeAWPLty5CNTttdU9967qoZfrEicabOQK
 JEmQBq8DK/18TyGHz/ZajQZaMkyOeFeCr1ljMLLSX5sK3jVukv4jQGCaMSwWqwpniYYd
 nYjz+K5ZjVa1Lk4Oont85hOwLG8JcusA/5+c71k6Ju8vxDUXEP4jz2ojuvyo2Lnz86GD
 xQ09kvQDQQRCPfPbttcCnBfDU+vdDiWFoTncry+/cODtJ12qCRq/xdAFFLq1hdiWYim1
 MOFgMQdH+sHMjkQrekNNrm+JThLFj7ps6KnhPVy8uLUo+AbdGUu8UG1EPMpySYQPZSmO
 /L2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756794931; x=1757399731;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KXtGT/edUu9psEEBI1HKjcB2ey4kH977Imncx2h66lA=;
 b=CO6p/KSTpFkmxJAatQy7CflIJ2IDkoDhC2HZ97B1X0uKXCn2kSCoc2YIhNp/z+wS4m
 x8LbxnjAOoqFmaO0x/k/F4wNmCfBdRrq0kUZmQj+XZUWd6zZkYslCCIgQgAsDtnV0y0k
 cNN4+Fxils97cX/l3gVYk3Xf6y6ejCnMQNWlDrDIMXlS56u5sIQO6Sw0U7sfAzklc9X5
 lan4Ix8Aa3rZRI3HcexDzrgG478adVGv1sQPYPvC4xmYHwDD4Xyl1k4vke4sKb4Ah4Ms
 YU5bKegkGzJnIQMbb4k1dJ1ZfC9o5/A0Bdw1WLbi8FvA6DQhu/7kDKjmwgQ58CN2vqYL
 2LPg==
X-Gm-Message-State: AOJu0YzvdUg+fkn/kjVXO5MkuESUjZYbZVOjTEbXdh6e+mgRawgiobrA
 H+YDwMWwnFeepW8YpMHWWMRfwQyOY5LOAnhsrB5NPx/PRy/atJzXZbrumNNRO6Cc+Vf34c8/Hjr
 Iu7DF
X-Gm-Gg: ASbGncshuU1l84s5fogyTIf1tx/Xf0X8EmgWnORYR8Y45gp9ilsggu2AHVw8BzK5JEL
 ks3rXx/kO685l/PQ/OvwnsOXho7TieYwwrBBMOPyMUl55mG74ScE3HBAiw2CVfg/sejtJeDqL6f
 G4Ritvi7JnPavwsfK43cu9teqS3gy7ulg+7e5fNM425v3zoRM8t/JGE6DNNU3VHCvOIO/YybkDt
 AKyVAgXpIBsA8vQbY0Kib3EVxnIWIkLnSCsXCcTBHcuEfSqIo/5l1Y0qeVSjsn2YUkvl9/QYLQ+
 tw99pPj9CIqzjlyvuQfI3C54Bn2+401QX1WKc5NKRC1tWmFBmG7wP+8KIWVUHZVFN+B+suSbe0T
 oTxKV5orNfkq3V86E8bqePgS3b2z3bdH8opBenQ==
X-Google-Smtp-Source: AGHT+IGg8BjVKYnvDdxwDNjtkIifzow24zQeBYNf8X6bSErnw95jvcrv8NjqqPpSLGjhgE6yfQEC4g==
X-Received: by 2002:a05:6000:2381:b0:3da:27c2:f51d with SMTP id
 ffacd0b85a97d-3da27c2f5dbmr858247f8f.45.1756794930803; 
 Mon, 01 Sep 2025 23:35:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b66f2041fsm159807675e9.5.2025.09.01.23.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 23:35:30 -0700 (PDT)
Date: Tue, 2 Sep 2025 09:35:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] drm/bridge: synopsys: Add DW DPTX Controller support
 library
Message-ID: <aLaQLlJC8qMrnDAf@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Andy Yan,

Commit 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller
support library") from Aug 22, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/bridge/synopsys/dw-dp.c:730 dw_dp_voltage_max()
	warn: bitwise AND is zero '0x3 & 0x18'

drivers/gpu/drm/bridge/synopsys/dw-dp.c
    728 static u8 dw_dp_voltage_max(u8 preemph)
    729 {
--> 730         switch (preemph & DP_TRAIN_PRE_EMPHASIS_MASK) {
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This mask will always be zero (DP_TRAIN_PRE_EMPH_LEVEL_0).

    731         case DP_TRAIN_PRE_EMPH_LEVEL_0:
    732                 return DP_TRAIN_VOLTAGE_SWING_LEVEL_3;
    733         case DP_TRAIN_PRE_EMPH_LEVEL_1:
    734                 return DP_TRAIN_VOLTAGE_SWING_LEVEL_2;
    735         case DP_TRAIN_PRE_EMPH_LEVEL_2:
    736                 return DP_TRAIN_VOLTAGE_SWING_LEVEL_1;
    737         case DP_TRAIN_PRE_EMPH_LEVEL_3:
    738         default:
    739                 return DP_TRAIN_VOLTAGE_SWING_LEVEL_0;
    740         }
    741 }

The problem is the inconsistent >> 3 shifting.  Here is how the
caller looks like:

   755                  p = drm_dp_get_adjust_request_pre_emphasis(status, i);

p is a 0x3 << 3 mask

   756                  p >>= DP_TRAIN_PRE_EMPHASIS_SHIFT;

We shift it >> 3 for convenience

   757  
   758                  if (v != adj->voltage_swing[i] || p != adj->pre_emphasis[i])
   759                          changed = true;
   760  
   761                  if (p >=  (DP_TRAIN_PRE_EMPH_LEVEL_3 >> DP_TRAIN_PRE_EMPHASIS_SHIFT)) {
   762                          adj->pre_emphasis[i] = DP_TRAIN_PRE_EMPH_LEVEL_3 >>
   763                                                 DP_TRAIN_PRE_EMPHASIS_SHIFT;
   764                          adj->pre_max_reached[i] = true;
   765                  } else {
   766                          adj->pre_emphasis[i] = p;
   767                          adj->pre_max_reached[i] = false;
   768                  }
   769  
   770                  v = min(v, dw_dp_voltage_max(p));
                                                     ^
But the dw_dp_voltage_max() function expects the unshifted value.

There is another similar warning but it's probably deliberate.
drivers/gpu/drm/bridge/synopsys/dw-dp.c:1072 dw_dp_send_sdp() warn: bitwise AND is zero '0x1 & 0x2'

drivers/gpu/drm/bridge/synopsys/dw-dp.c
  1066  
  1067          if (sdp->flags & DW_DP_SDP_VERTICAL_INTERVAL)
  1068                  regmap_update_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
  1069                                     EN_VERTICAL_SDP << nr,
  1070                                     EN_VERTICAL_SDP << nr);
  1071  
  1072          if (sdp->flags & DW_DP_SDP_HORIZONTAL_INTERVAL)
                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
DW_DP_SDP_HORIZONTAL_INTERVAL is never used.

  1073                  regmap_update_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
  1074                                     EN_HORIZONTAL_SDP << nr,
  1075                                     EN_HORIZONTAL_SDP << nr);
  1076  

regards,
dan carpenter
