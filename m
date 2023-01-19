Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31886732A3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 08:41:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393D610E8C3;
	Thu, 19 Jan 2023 07:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9053B10E8C3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 07:41:20 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so2937181wml.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 23:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lgG2FwvgVbALatyDiQTv2yfiCg1ShOPwxPOzuE7lY8w=;
 b=Hm5Gi9OwoeVtoxiHQJgLNbxVz8+wv2x0eXhe7xsVamqCXuAYPWWRQIsYEi5R1A7/BS
 kQBPB5SrKQ/jndNqMhzTVyg/hMEmfqt4uqnPxLOkOfeL8LSKunfGNdKrZVcOMSre6Seg
 CjyjenT8VJVgZSWOgws89ekyKbtGK2M+hl5UqmrLrfDEOFkHEN7B2Qaasu0Zpn3ZGXKs
 nJ9hicBPjkU4lafBf3YIxX4LjiwoLMKmdlBP+7zKz3/H3T9TwUCWCYGb0OG7ggGnvKex
 QyatAcDxiLiUCquK5y8BrCcjbq5NNxs2+PD9GSTRVTJMBpwAkX3WfJ/mSMAHR6jIyCYl
 O1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lgG2FwvgVbALatyDiQTv2yfiCg1ShOPwxPOzuE7lY8w=;
 b=sDHgPPHr2GFRbw4U6vcgGmZEf0pCqGcTDB6e6MComne4ZteSqVQycMlmlQX+teyAR3
 Qd52PFaOPzHNQQltMUyIVtJJSfYWVKyA7Pks0kATCc2avOJo5F+GQ+NZL5vw23tLGX9q
 1zPuDamriB22QcH0QzrQMHuFDDUBX6dXDs0C4YVYZXE7r9SZEnEz+yb45qLkQSRp7ntP
 NjkH76OMdgnNOMeOGIY9AzBb5dyqm5SgTx4Vv9y/miYVf4TKNOSEAf6N6CvgTHMIcNVT
 56vI1RE76wQ2bDyNYuhL2fBMWwTlRCFkxvNjZqdCkjvL2XsryW2bLz/RP2uKTR4NwU6f
 ofnQ==
X-Gm-Message-State: AFqh2kqSRY38DeqWQk1uLkMLXg8WSsF0cngOug5oykq1TXh3612+YWti
 FktxWwLPJ7lJGBxu0dXcEc7NQQ==
X-Google-Smtp-Source: AMrXdXtFYetCnqJMuUza3ThlLq2gmtyA6w5C8ivcJj+POBDTQtKq6frwQjMMe5OHhZF4BdLBpB9o5w==
X-Received: by 2002:a05:600c:198e:b0:3db:1d7e:c429 with SMTP id
 t14-20020a05600c198e00b003db1d7ec429mr2096450wmq.40.1674114079084; 
 Wed, 18 Jan 2023 23:41:19 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 bg1-20020a05600c3c8100b003db09eaddb5sm4380139wmb.3.2023.01.18.23.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 23:41:18 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: upstream@lists.phytec.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <20221228145704.939801-1-w.egorov@phytec.de>
References: <20221228145704.939801-1-w.egorov@phytec.de>
Subject: Re: [PATCH] drm/bridge: sii902x: Allow reset line to be tied to a
 sleepy GPIO controller
Message-Id: <167411407820.262112.2141398001739030044.b4-ty@linaro.org>
Date: Thu, 19 Jan 2023 08:41:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.1
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
Cc: jernej.skrabec@gmail.com, andrzej.hajda@intel.com, jonas@kwiboo.se,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 28 Dec 2022 15:57:04 +0100, Wadim Egorov wrote:
> Switch to gpiod_set_value_cansleep() in sii902x_reset().
> This is relevant if the reset line is tied to a I2C GPIO
> controller.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/bridge: sii902x: Allow reset line to be tied to a sleepy GPIO controller
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5688ca34698c734d5591add39e72380123132656

-- 
Neil
