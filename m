Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 654729F79F3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 11:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D45610ECD6;
	Thu, 19 Dec 2024 10:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="O9T+RKcw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7B110ECCF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 10:59:39 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-388cae9eb9fso342623f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 02:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734605978; x=1735210778; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2DrhlfxHBds/4kHdRY9eVwoEqBd4q+1/KO6/J4NzLC4=;
 b=O9T+RKcwictzXZ8Cl7k46EOCkXemWlHtgI+BFREFVDPO1F/EnxMwOwy6DGm828bMGH
 VyKQlLh3bvbKgZM9MZ/eNjckCgDdfuDseq99DhTFQdcoI3AVc8TLxszgP/aMYzsJpRmY
 7kdN7lMWOLAo7721VWmrDhUNT5XvFBSKg53CsEWAswp5TL6Jja+iLwtnj4cj+bTNqOtx
 mOxTVlvm/WGQqfl7AFqDxo2Ue0Xp0Bt0SRX4R9R4PcZh6NXjnwcqZkp8oUt+ZmviV+Uq
 6L97ZnYzu8+ICbiiuMzdhKVy9i57FBddspLcV4Rpzl50rc4b8fMJcrj9KUgE/LkpJ0yL
 gMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734605978; x=1735210778;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2DrhlfxHBds/4kHdRY9eVwoEqBd4q+1/KO6/J4NzLC4=;
 b=Y7/sm28Ib03+qeIUqZ65/OefBWijuxmkZsNjv1++ZqvQqTk2TGRMDsBnVF0NlppCIc
 qFkSbhvZo6fgv7Wk8M3j/ZeK4KVPDprx+Paf3yw/Jof1eDV8JDUiuIwFBcmshBFA6gWs
 W59kX/gFCZiHf/muVe9ZYi8LhCZWQ0V/+7lIXnWHFATm/Wc3Boi38VYIsAvthh78+9lS
 NKEBU7UlbQ8zL3GTJUegZHBnuOwUE3VrkPn0QgpWFkiQpp3EsFXN6q3YFEYc6+h9WHst
 ZdMewbBBXcIvMq4YH4+IquawZd4NB7BgkSaExSE+BcwDP46YAPc+iKXnrfi6p0c70M41
 bXHw==
X-Gm-Message-State: AOJu0YzNfHfpwat3KxUyBMFxgZQMkdM8C/1EIEUtqsuhBVlvOXmDhog7
 clQAncKWm0WH1cbFZ1Md65t2bFn4UD1L238n3Os6P0CA2GA6ruuIPZd3yhBvZsY=
X-Gm-Gg: ASbGncsNt9FdmDC+fzG2mtA0t/Wq5HGE0K+6qizL4lRpwIwQf5rIebtcV/KOwkIM8qm
 w98JpsrEXGlwovBbRT1KYaCD9/JIhhBTxRvIaRLhUYk+YtFRShhDe6ZpR/VIyUS5AHYj37dhfYk
 Ac4MpzqTCAZckaTBRQliAKho29+DPOHu6dbBX7prUYPNU+NNaXRzesM7Rw7u6YimDTTzMGlN9NU
 f0vl191t9hbe/ZhRzC8AKJNIcX4d6l93PRx8gjCmjQGbHTIIcstwrel8vGmqA1aW3Zh8aF3vY5e
 zw==
X-Google-Smtp-Source: AGHT+IFaF9sWd3quh/UU9qvPXWvBKQnkNWaZJoNMcICLp2IvxJVyKbJxKlNIvT7vBUe4q4BIMxiEXg==
X-Received: by 2002:a05:6000:1f86:b0:385:e88b:1a76 with SMTP id
 ffacd0b85a97d-38a19b16589mr2501593f8f.30.1734605978427; 
 Thu, 19 Dec 2024 02:59:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e2d2sm1289920f8f.71.2024.12.19.02.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 02:59:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: mripard@kernel.org, cristian.ciocaltea@collabora.com, 
 Andy Yan <andyshrk@163.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20241216101015.3726517-1-andyshrk@163.com>
References: <20241216101015.3726517-1-andyshrk@163.com>
Subject: Re: [PATCH v2] drm/bridge: synopsys: Fix Copyright Writing Style
 of dw-hdmi-qp
Message-Id: <173460597776.883073.16665531257709362285.b4-ty@linaro.org>
Date: Thu, 19 Dec 2024 11:59:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

Hi,

On Mon, 16 Dec 2024 18:10:03 +0800, Andy Yan wrote:
> The standard writing style should be: Co., Ltd.
> This fix the mail server warning:
> DBL_SPAM(6.50)[co.ltd:url];
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/bridge: synopsys: Fix Copyright Writing Style of dw-hdmi-qp
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1e93f594285faef57651a0c89f61a7d976db7def

-- 
Neil

