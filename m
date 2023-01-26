Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A64E367C588
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 09:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24F110E04A;
	Thu, 26 Jan 2023 08:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128E510E04A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 08:09:22 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so558406wms.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 00:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tGmVBtO5zBSgKaXSgL7/y1bcT0XKFt+9R+LKypxoxTE=;
 b=Ve2PnYAAJYp/xCfrXznkM6RZzbksDbuJVz8AQ0YWXYYyNY4v56yZ/uEdbJXxG6+1+7
 UTQrr8r0LaeA2+EvzpAYHxXZH3ca8PSNdLyJsgsSpbehn8c6whIdj4UMjzKeJ9zzOyL3
 BQycjc3zo+SXm5p6Vx2TlLQsG/Qw3k5z+vho0FsplYOvwdIav4wwM/DFEiifop2dbAiI
 ethS71TMFFN6NOPPmNYogMRE/OYEOJhx/NuFqBA6ALohORxgN13jXowG6tuCJoqECjM4
 XAg/nIZFiPlwUyryNeSaVTAFKxr1zx+w3u0bcNpREvTg+1UaxCXxrhs2ag/p0+4iaNgH
 rWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tGmVBtO5zBSgKaXSgL7/y1bcT0XKFt+9R+LKypxoxTE=;
 b=Hsi4gQOyL5ZYNf2W7X7cZNfdXgLPvGAUbqidviXBLFmk/2wmipTxt0CtnDCa1U7Z8g
 lXRzXd9zmzsGABYArVSDzNSRiYJOACSQ3IsffL8gfRHfk+lbwzl0k/XnJPOdG7ipDROR
 91HvwqKoPY9H2+g08Qq95gKnl1ajVmkB1xRv21IsxRisFGFyMUN9bjM5oqs2DTGqXVLP
 wMXI3sNVhQAtHMNuh0gshmiXsd4wLiYVeKc29HMalT2kfCoOFD2U2Glp9R4pVT5QftsF
 PQJahMu1csvnAZFbBiGvaydtA5y81uKU3LMpkUkMMsQMIMXA0k3gaWoOhnTs3iEu545B
 epkg==
X-Gm-Message-State: AFqh2krBFJSoLO5cs4ibjEKu03pRUx6LDs+pt2iyq4Kyf1uiWIDmAqjX
 YfXPHqZrlSr4fuvID6Fo/P6HEw==
X-Google-Smtp-Source: AMrXdXtF06imT3eYJ7vI/pwAmKhSEKZoqoRp2QOeeZfmYR4oo7CVvI6UI0SLSOWQFSaPAo34VtwLKw==
X-Received: by 2002:a1c:7216:0:b0:3cf:614e:b587 with SMTP id
 n22-20020a1c7216000000b003cf614eb587mr35204528wmc.26.1674720560564; 
 Thu, 26 Jan 2023 00:09:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 k20-20020a05600c479400b003da119d7251sm735499wmo.21.2023.01.26.00.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 00:09:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230124233442.22305-1-rdunlap@infradead.org>
References: <20230124233442.22305-1-rdunlap@infradead.org>
Subject: Re: [PATCH] drm/bridge: Kconfig: fix a spelling mistake
Message-Id: <167472055986.422719.2396635475523592126.b4-ty@linaro.org>
Date: Thu, 26 Jan 2023 09:09:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
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
Cc: Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 24 Jan 2023 15:34:42 -0800, Randy Dunlap wrote:
> Correct a spelling mistake (reported by codespell).
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/bridge: Kconfig: fix a spelling mistake
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d703a0f45a70e6ed4749780ed5efb2d1ec042297

-- 
Neil

