Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B79D65AF21
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 11:00:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D46C10E1AF;
	Mon,  2 Jan 2023 10:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86E510E1AF
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 10:00:45 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id bk16so12669722wrb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 02:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=194dBh8yd73feKUfQT2LX9SH0xX4MSntnyEqmQlb6pA=;
 b=ruc8j5Ryqx9/8iW4g1lGyVxZF6emec3HcXUP796DX5VPP+bRoFbDMWZQEy2+Pqk3c9
 IaV4CCVjtRmACtI/DG5xfLyaqdbMDt+uGGQ+sRtPEkgXjtiqL86SYw5yzJK06AnuUmtU
 fXHt7avuDKzfFDtjOU+s3IWRsfFaBWCU4e859NCfaJ2L4lzTwI78xOSewjKoYpy0lHJv
 6OsBS30koGaH0Wf1gCpLReuhwVdHDghtdjEzA27PFnO8IjnBHiC1ShzkOMnIJWQLucs7
 Tj9MSWi2+rAAyGLUiDYZ6jY53mEn23QdgsIVVTG35DIUXjMbmRnYNhe6Qwd9hHcbUc9b
 UTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=194dBh8yd73feKUfQT2LX9SH0xX4MSntnyEqmQlb6pA=;
 b=ZltY/y4a2dlehGIyOQj/70B9h5HBao1ZW3vo67m2Uhm4AoIr5js6Agn9/oY6C0oUiv
 seZDjeV74+vvvBeMfr+t/fntIGaHTqORuYTHjLHHHREwqdk4r+UAWbhBiwuconGjaBmg
 /xCU4Ph+8VfEHN+WyxmxleWoAVR7unvX2B6rRLf1jYYMX90ndEvfhtXMLIRyVptm4YgC
 VwiUPOumcZFnks8Ac/lIcj5NTyXeW+S+G7bRaM1MwVt/FZ8gxgC4iP7Ry1aPy0SnMXz4
 cGfmgil2TtWHGQ3+lDaoRPfKWRWGGH4eB5/5kYt9fdoqICfuKAJhBCZohUFCuCyLSdPI
 wyLg==
X-Gm-Message-State: AFqh2kq2mEEELiCdmB5I2ddPRgvnHIkOCeKZE/DFiK1K6hLV5TBRe+Zp
 305cPPOYGPsLDsBTh62M5SMFhrbSKpwjn681
X-Google-Smtp-Source: AMrXdXuIEK0IbdioJa+9RZomGbTgk+DyCuImUKGU1H/zzftZI7i9mNdxXkCyEwZXmAVJq7oTBjE1Iw==
X-Received: by 2002:adf:f187:0:b0:296:4854:2c6d with SMTP id
 h7-20020adff187000000b0029648542c6dmr3145509wro.32.1672653644337; 
 Mon, 02 Jan 2023 02:00:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 h9-20020adffd49000000b00242209dd1ffsm28056871wrs.41.2023.01.02.02.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 02:00:44 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Carlo Caione <ccaione@baylibre.com>
In-Reply-To: <20221216-afbc_s905x-v1-0-033bebf780d9@baylibre.com>
References: <20221216-afbc_s905x-v1-0-033bebf780d9@baylibre.com>
Subject: Re: [PATCH] drm/meson: Reduce the FIFO lines held when AFBC is not
 used
Message-Id: <167265364359.326489.7829360920975044539.b4-ty@linaro.org>
Date: Mon, 02 Jan 2023 11:00:43 +0100
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 19 Dec 2022 09:43:05 +0100, Carlo Caione wrote:
> Having a bigger number of FIFO lines held after vsync is only useful to
> SoCs using AFBC to give time to the AFBC decoder to be reset, configured
> and enabled again.
> 
> For SoCs not using AFBC this, on the contrary, is causing on some
> displays issues and a few pixels vertical offset in the displayed image.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/meson: Reduce the FIFO lines held when AFBC is not used
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3b754ed6d1cd90017e66e5cc16f3923e4a952ffc

-- 
Neil
