Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E137763EAFC
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 09:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE7010E02F;
	Thu,  1 Dec 2022 08:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2820010E02F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 08:26:14 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id m14so1443159wrh.7
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 00:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pFqLP9k0bT0Mt44DPB2mvhK9vHSamghHlQLp/vyzST8=;
 b=U4NmYdKBUx9QdKiyriy5EwHSu8ZdemV5FMZ0WZoeSDd/MeA3b0sg6tfj0CpFSguPFW
 +U6A6+Vdcha3723PsWPhkeMWkMIkSsHDkDcjT5MU8q1X4MH36b50tWzqtzk/lqy5knMF
 zBplGMWWnsa3Eg+wFewWUQmhq9gAYJRThFp3rXiJkobm4wJ2R+YpKq6b2zcpyB/fWCGx
 wcRJXL43lcJQivcPG+EYQdSiUayYl0qIj+HTFlb53Iq6AE47P/rq6YkPQhl745qtYPgo
 auvpMyt7QPZAwEXytAfeKETc7pelQLqr4Rp5Scsj0mU639NkHNVw1i2U4IjrXlukyLU7
 JG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pFqLP9k0bT0Mt44DPB2mvhK9vHSamghHlQLp/vyzST8=;
 b=OOcXGVCW6w5vZobYpO3WHEQC8ifivkqsOqdnR4QF1PQuMjgidl1AsK596MpJBGEDHl
 aea7Lx/yVl5yIMsU0OasBB54MkDGKoCdksj7CPpVtrftJ2eN61QrPApire3nZKSdUFvB
 fyAtNjpiDF1EaQq+iJ6AjkfSfH6GlIN75L6v/XvXzd0dZLH+2eLsOz+tPNr/JLWtIOyp
 aYZP2UUvnEnIEEL3SeiA0MUU1w6j+52Yg5J7Y+9avIm5OJM5urDtLa5ndVIBj/7IAMfe
 kiYgqZzKnaS18CUwYLyDdN1jhrl746R/YgXW3/YsyCwJirkM5ynNEQpqFZLPQvqCKftc
 yRQA==
X-Gm-Message-State: ANoB5pkIzGpYofbHWGQwrjw5jQRNN6sXM262a7GLZxXJWIjsFBuBrgpa
 P8QjBTtEgejsQ/BpMhjRjUVNTg==
X-Google-Smtp-Source: AA0mqf4a5Z0PH/UgvFikZjY+k5KPvJuMO75nsDbR3SRjCEInYm+8Ie9RFm4XdT39bhTe30ft+HlBSQ==
X-Received: by 2002:a5d:4887:0:b0:242:1b2e:a8c3 with SMTP id
 g7-20020a5d4887000000b002421b2ea8c3mr11002249wrq.296.1669883172607; 
 Thu, 01 Dec 2022 00:26:12 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a5d6249000000b002302dc43d77sm3756176wrv.115.2022.12.01.00.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 00:26:12 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Guillaume BRUN <the.cheaterman@gmail.com>, 
 Robert Foss <robert.foss@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 linux-amlogic@lists.infradead.org
In-Reply-To: <20221116143523.2126-1-the.cheaterman@gmail.com>
References: <20221116143523.2126-1-the.cheaterman@gmail.com>
Subject: Re: [PATCH] drm: bridge: dw_hdmi: fix preference of RGB modes over
 YUV420
Message-Id: <166988317174.1947573.2294084268751804752.b4-ty@linaro.org>
Date: Thu, 01 Dec 2022 09:26:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 16 Nov 2022 15:35:23 +0100, Guillaume BRUN wrote:
> Cheap monitors sometimes advertise YUV modes they don't really have
> (HDMI specification mandates YUV support so even monitors without actual
> support will often wrongfully advertise it) which results in YUV matches
> and user forum complaints of a red tint to light colour display areas in
> common desktop environments.
> 
> Moving the default RGB fall-back before YUV selection results in RGB
> mode matching in most cases, reducing complaints.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm: bridge: dw_hdmi: fix preference of RGB modes over YUV420
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d3d6b1bf85aefe0ebc0624574b3bb62f0693914c

-- 
Neil
