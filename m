Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EEB916AB7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 16:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0DA10E680;
	Tue, 25 Jun 2024 14:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ulw0KFhC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC7F10E689
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 14:40:26 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-421bb51d81aso46757425e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 07:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719326424; x=1719931224; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qSANmUbEh6D7VW1j/tL/xnWMrzPKUXm5bDXQ8ewTync=;
 b=Ulw0KFhCMS/VELuI/MtopItfEUgMLv28RzMV8lqP3Ml+13E1uZUNOECxwbbGj9Ew+d
 tny9pGX4RNiQI6+Rayd6W3wVOEf2eJmRFBKix8jMFiaDimh7P2SFWUJ+hdv4HwDVo+mw
 SHqImWCIF71c7yTNT6ZARZvKWwjz9pRCBZkTZ6PGqyAwBQazLobXlCuJlknBshGPA0aK
 y8mmNIOWWaI4tDbb0icPTXg3PwWUcLoCzu1n+bqq4ETBvBBp/gMVOuGirr7DTDtZwFz8
 T2LIcYEEBz5jopataGCR5VpqA67lMGhNFpcuwR4naYxfm4btXNrg3ad/Fg6TVmR/x0OZ
 026Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719326424; x=1719931224;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qSANmUbEh6D7VW1j/tL/xnWMrzPKUXm5bDXQ8ewTync=;
 b=j7+y3aAOUP7K4y0Jnp+8EySaLKOWZiIgbAryFA0+uLIlYPxDvZJYcovT/Lnc0ndNIi
 vxdD0S0u5bt9mDqWcN0bTPD5s1t9sWWrJypMXg0CQKaXjg7pZ7EoDJen5Ufw3n5wY4oP
 R6OUhPSI/wle1gxL7i0bagHJybxYpJ1v5fu5krGY7LH279jXuekL5aUxBMJyBa8Wejf4
 1wKoCrJ0xKooE8qDNWa27V0VoWvBS8hcCtShzY5jyiu/xI5EsFhp+q9oSbAC3f3DfsMs
 mUGyhS+wfmyozbcCpozbr+9Y6JXyRA8wc1L6cW6rmdsP40PsJASINQk1RyWxK3cruB+B
 2d3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnQK6LzXst91Pa0mv3VRR2LNqYaTYgpnQ6n+bo4Zt/6bXoehwMBvnJAuaOrU/OfdiNI3mkjHKCGmpIeL3L2mD65dnjsIA5kZ8IcOaW4m+R
X-Gm-Message-State: AOJu0YyeLdR8Qjr/BkTCNpt2YaKwHwZQOqR0UzGwyKbe5B75hAQlEsZC
 E/B5J5FspDDFsgnJxmmNVj/gvsrDQW3Y0uyqf0Hl+aSpEZzOinlFGR8eUs8SaCU=
X-Google-Smtp-Source: AGHT+IHETM2J/do/2SDqnSnmgKYgYsfQ586CEBVmGuu5NWFMEzbLBxusn/KmGl6Yk1pyNmCJDNWl4g==
X-Received: by 2002:a7b:c3c1:0:b0:421:2b13:e9cf with SMTP id
 5b1f17b1804b1-4248cc66b18mr53553185e9.36.1719326424339; 
 Tue, 25 Jun 2024 07:40:24 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d208b3dsm218556165e9.34.2024.06.25.07.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:40:23 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Amol Maheshwari <amahesh@qti.qualcomm.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20240624-fastrpc-ml-v1-1-5dad89dce78f@linaro.org>
References: <20240624-fastrpc-ml-v1-1-5dad89dce78f@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: CC dri-devel list on Qualcomm FastRPC patches
Message-Id: <171932642324.352395.16698786992801289835.b4-ty@linaro.org>
Date: Tue, 25 Jun 2024 15:40:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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


On Mon, 24 Jun 2024 11:19:09 +0300, Dmitry Baryshkov wrote:
> FastRPC is a way to offload method invocation to the DSPs on Qualcomm
> platforms. As the driver uses dma-bufs, add dri-devel mailing list to
> the MAINTAINERS's entry, so that DRM maintainers are notified about the
> uAPI changes. This follows the usual practice established by the "DMA
> BUFFER SHARING FRAMEWORK" entry in the file.
> 
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: CC dri-devel list on Qualcomm FastRPC patches
      commit: 47bf4198bf386018e99673c1ce5dbd8e5eda293e

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

