Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E784B1FD3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 09:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B2710EA12;
	Fri, 11 Feb 2022 08:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A37510EA0E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 08:04:25 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i14so13726018wrc.10
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 00:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/lcEOr4uqjKNofumghLHP70Sk12EtIo5iskvCPhpIT8=;
 b=0EqUeIzqvPaZiaFn1tjWOUcGQ8QzV+DdWjPdiPzg+cAQtuKSAt6ufW+5FT8PvmmRrN
 5burrJjB5mpE0DsAkSCwsf2cggLbJgOREIPMNCnQIHioY72CF9jLttI9vQS+rmj3UI+9
 nlP/YeKxTNFHGNaq03tBkO8U6z/LAeI0ti2JXyYZjungMfE68JHIwQoFFuSMP43fW4z4
 vSjoNa96xCS657CO+J2Pr/zzLuqkhJLNPKDpXacY97H8sXCcIxQ1zANtRmRwcs8/z3Ux
 vbgGjVp1tjj1NlHGWy3bw1ETpJWnkYzpIKi2/M2D7YrY3MalKhPAL6iJ7AbDhihvCuLa
 JNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/lcEOr4uqjKNofumghLHP70Sk12EtIo5iskvCPhpIT8=;
 b=32uUyEFcXVTBIZL2cC/cjP8j6CJdkjUDYcgDltFCigA4/Vie8D4h9pTXLdfToFI4Tc
 3NZrcapggtzLJESSk9e62SaNl0fMR/IDnFDuPD8BHoxzGLASJrBz2lAefx6TBaEjO+aD
 ddGcisgoAHUyLWMZeXISHSa0IOpq5P7JvyAn5DmEdX2POCxA7NS1+xgr9mDrWxfUfSPi
 iKILP+bH3MYmbwcFjd0mhUPjbnKDuvIUTPD0nAOuxRBKlCDlss4pK4RujmonebkA+FzU
 7DeO0s0F/8Ep0fKyHAGjcwS53bn/QZ6sMrlRNwUd9b7XYiBTZHyKRP8vHICaEK/t9ORe
 mgiw==
X-Gm-Message-State: AOAM530OR3TJnWqXpNDycsL9BRZEhxnX5XrzTFkWlmM41BtlItxxAW7J
 93EWPKcBA0VQszE4jAE+lrQBrg==
X-Google-Smtp-Source: ABdhPJwUaPbV+hpspCv+07XTweqV+qV7F9YlImFo8czFokOghyZPvgvkNPEvIXv29cTCyqj5fGceyw==
X-Received: by 2002:a05:6000:1363:: with SMTP id
 q3mr365638wrz.468.1644566663486; 
 Fri, 11 Feb 2022 00:04:23 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:97e4:3830:c79:136e])
 by smtp.gmail.com with ESMTPSA id
 u7sm12601533wrq.112.2022.02.11.00.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 00:04:22 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
	robert.foss@linaro.org
Subject: Re: [PATCH v3] drm/bridge: dw-hdmi: use safe format when first in
 bridge chain
Date: Fri, 11 Feb 2022 09:04:21 +0100
Message-Id: <164456659389.920211.13712775936606850365.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204143337.89221-1-narmstrong@baylibre.com>
References: <20220204143337.89221-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: jernej.skrabec@gmail.com, jonas@kwiboo.se, kieran.bingham@ideasonboard.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent.pinchart@ideasonboard.com, biju.das.jz@bp.renesas.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 4 Feb 2022 15:33:37 +0100, Neil Armstrong wrote:
> When the dw-hdmi bridge is in first place of the bridge chain, this
> means there is no way to select an input format of the dw-hdmi HW
> component.
> 
> Since introduction of display-connector, negotiation was broken since
> the dw-hdmi negotiation code only worked when the dw-hdmi bridge was
> in last position of the bridge chain or behind another bridge also
> supporting input & output format negotiation.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/bridge: dw-hdmi: use safe format when first in bridge chain
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1528038385c0a706aac9ac165eeb24044fef6825

-- 
Neil
