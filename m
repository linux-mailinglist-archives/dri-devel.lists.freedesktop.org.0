Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AF4AD9019
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 16:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2596C10E9CF;
	Fri, 13 Jun 2025 14:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dMaae7yz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662F010E2C0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 14:51:00 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so1808698f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 07:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749826259; x=1750431059; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WXGpMxHygcfzTELJGLmTF9Qa1p/d89Zbk7jdPDFTfug=;
 b=dMaae7yzlP35F7yqTsBiU/sjdNYW1yZ+gFs6iwJEC9Eal6LkmtPKkNn94be5vKMRxx
 QHVhHoRFUNdGRa/oBQWgbQcEKc3vIV+LtY09irZecpbffgAqo5atAaWJWOVScNMZR45r
 R9izTcepMc5ayaQX4RO8a827X3w+/QukQlNtF/ujls9akU3aB8iS2mQevjY8WN1WFA5t
 yhKy/0BzNL88G3uXZHw1vLat7Ow5lvFAEi0i1e7bN1Q91n1kALs5eYYxi2SFr4KExc8D
 6lDmI7u8Wel2xQpU64oytrLYtSCfeqB+PsiSrViay6PouCPcg+F5BXFHHp6kdofrBj8e
 2BQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749826259; x=1750431059;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WXGpMxHygcfzTELJGLmTF9Qa1p/d89Zbk7jdPDFTfug=;
 b=NkX6x7+KuxH2KOU/2UPI43XcsZ6y6WMRiHHdrjEMIlah3mHVC2706JbCx/t/KljR9u
 70F3OLa+Mv4P208Od2FxKxQaGejd6b3rUlg8yGL0/lrH3CwYgJD+ZyiZZmWe7PbLX1Z8
 AmbEDix4gUaP00WE7+CZ7gZ3P3TmyHm0FTq/SaT+DboEamODB7DjZ37ty8tyHLNupwSY
 4PaJk5GKhcmgPydwSFK2d3x0yM/jNsOD7mwxPmLuj8aEigeMx0HpiQSSinqjuBp6PRww
 q1hQd3IiTJK27JbpgAgfSkb/Dnt+Np94yM33kBaQidevN/x93X4w8cAy9PrvTxQyTzba
 3HAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFVxA+Fh02KPXtcnULt6bNLCepkS83c7VaeSkDd900w2UuWHTAshn/6+YezCNELvjIR2fXm/sON7A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnqVzQk6oo8oHhLkR6IMghIRlyF0gZqmk5yTvWOXTWBP7tfFQ8
 mLEpdW4F8jSJhTIpLD+oAtInUDU4nTwuT509tZmEFl7xiOHJKRaRTd1sj67LhxCbk7Q=
X-Gm-Gg: ASbGnctmTYyGN86rpLxJEnzlZm/89A2K3bxf70H2ORiKEde1krf6lF5uz5XNri7andl
 UMwdomciWohO5/znTMa1E54u+BsPX+WWONkzmzy7c4A+6VLlpRjB5500JGBhlAnMGu33iHuYDnh
 yUocdoqmL8z8m/VKXygDhXL3r5iT7jsjqrGdhO3TCo/QYPv3qts5Sn7+z5ZQ+tNskkc6/3asb1s
 P6T3ZyxaQ3PiDcJm6EnT7/OZ2cGZ2dUgcEqDDl5VkHkmzYCXNr2lG4x1lN43UOO97eatey4p/4G
 OHsUzFcx9plaidpMOl3pAukKScPMmFDJe2Hi/g3heTAKHcJYc2Agxr9L3UghEGl/MEi46XIYxmg
 LJnY=
X-Google-Smtp-Source: AGHT+IGJ34DzRWm1T2gZxcoEWSQEcbIW5w0AwTNiA/GS5kJjbzV7TTazO9AA/zJ8635JEJWkBn/LUw==
X-Received: by 2002:a05:6000:2893:b0:3a5:2fe2:c9e1 with SMTP id
 ffacd0b85a97d-3a56876abe1mr3243520f8f.30.1749826258845; 
 Fri, 13 Jun 2025 07:50:58 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:c8e2:ba7d:a1c6:463f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a54d1fsm2562363f8f.2.2025.06.13.07.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jun 2025 07:50:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jun 2025 15:50:57 +0100
Message-Id: <DALHN1EOXETI.3BLGEY3KMN4HD@linaro.org>
Cc: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Rob Clark" <robdclark@gmail.com>, "Sean Paul"
 <sean@poorly.run>, "Konrad Dybcio" <konradybcio@kernel.org>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Fix inverted WARN_ON() logic
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Rob Clark" <robin.clark@oss.qualcomm.com>,
 <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.0
References: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>
In-Reply-To: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>
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

On Fri Jun 13, 2025 at 3:41 PM BST, Rob Clark wrote:
> We want to WARN_ON() if info is NULL.
>
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 0838fc3e6718 ("drm/msm/adreno: Check for recognized GPU before bin=
d")
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

You forgot Reported-by tag.

Reported-by: Alexey Klimov <alexey.klimov@linaro.org>

Was the series where it is applied already merged?

[..]

Thanks,
Alexey
