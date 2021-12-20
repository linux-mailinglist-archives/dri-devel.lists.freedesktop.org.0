Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1524447A903
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 12:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CB910FB3B;
	Mon, 20 Dec 2021 11:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E813110F773
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 11:51:37 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id j18so19590421wrd.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 03:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p/P+q/gtXvYn5lTOzvGHLt9UuDdXRspn+md2NvaF8tc=;
 b=EExu677ukA0Kz6xU+BMGFfOVjUK1XpgZ67XUjgD1pnfUdQOPcgb4bF+ZDGJYTKZlXe
 sGj5vNYbwSWwybJ6uaWOATILN+GFMjUZBFq8Sz5bplGnLQwYf9DSTAs2eR+kJ8VQ5sPH
 gSnNL6o/fsVxZSxpHu+gFpnLNy/mNTtn887BXgjdTKsi8tizvuPg45r7NkNBFkJnXWeC
 RExUSanWNrtVLlnA1jqxP8uto/oG6DNHfG0v9rQ2U6S0jrgXzxRLBhSfNis/lKBeM0I6
 uAevSHDsPzzDcAGLSnaVpora0Vr7UzwcbxYRGga5g6pbMlQmusGzThrctAph0imI3rLE
 fc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p/P+q/gtXvYn5lTOzvGHLt9UuDdXRspn+md2NvaF8tc=;
 b=4CTrqv/jWlzgFu58k+GJ0X17NdSGi+A6nJhqtZvJ71jOtt2PgMkf9OxPDX/+jugB+q
 rukOTPhByuOBXfeNsJLL/DSg6yki22jl3bKSjt+hDQjQN3FC9wao/gxzR8YDBzramWAz
 0Z1GiDpbXkHQyXQ558mtmZKiURN4z6WlMGXiqBiKvZazeEB80wA+ZGkYq1nnSgKaM7WT
 7fzAgD5sDjbuqF/4VggbWzpA/RNnmh+q5owu3+GwJjd0CJakK4NbXjnrjtpJ8ZE1UAy+
 YTwSklzrzECDcCOuRM7yblTVkqv8oV7tPAZm82Sli7OK9CqaXXyr+0GuCRTxGglzNmxR
 GUcg==
X-Gm-Message-State: AOAM531Xs/ape/prkYJGJ0PWqdjF2i7SZjt2622rG9z8K946Y4XaD/+a
 epVP9LKwk5OqPi7W+RXToRvkYltQ2yM=
X-Google-Smtp-Source: ABdhPJwoEInEeH88GH83sFShjd3YXynMJnKwtGetH4cdE8mCT0mf3TOgz0/oQKBwWWGkli1YraLIhA==
X-Received: by 2002:adf:cc83:: with SMTP id p3mr12618669wrj.680.1640001096488; 
 Mon, 20 Dec 2021 03:51:36 -0800 (PST)
Received: from archbook.localnet ([217.151.114.10])
 by smtp.gmail.com with ESMTPSA id o2sm14214116wru.109.2021.12.20.03.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 03:51:36 -0800 (PST)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 00/22] drm/rockchip: RK356x VOP2 support
Date: Mon, 20 Dec 2021 12:51:34 +0100
Message-ID: <2075203.1SQL01OxuU@archbook>
In-Reply-To: <20211220110630.3521121-1-s.hauer@pengutronix.de>
References: <20211220110630.3521121-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Montag, 20. Dezember 2021 12:06:08 CET Sascha Hauer wrote:
> 
> Third round of patches and last one for this year. I hopefully integrated
> all review feedback. Additionally the driver is now fully converted to
> regmap, so no struct vop_reg necessary anymore.
> 
> Sascha
> 
> Changes since v2:
> - Add pin names to HDMI supply pin description
> - Add hclk support to HDMI driver
> - Dual license rockchip-vop2 binding, update binding
> - Add HDMI connector to board dts files
> - drop unnecessary gamma_lut registers from vop2
> - Update dclk_vop[012] clock handling, no longer hacks needed
> - Complete regmap conversion

Hi Sascha,

for future reference, you can add `-v 3` to your git format-patch
command line to mark the whole patch series as PATCH v3 and not
just the cover letter.

Thanks for your continued work on this,
Nicolas Frattaroli


