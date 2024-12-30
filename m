Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D739FE903
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 17:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20CF10E167;
	Mon, 30 Dec 2024 16:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="G8B4JJ8i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F9810E167
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 16:23:08 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-aa6a618981eso1548135166b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 08:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735575727; x=1736180527; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z4NeyeisMD3W02zckZ2Ty449qJqStFYvxy23pWE1RPU=;
 b=G8B4JJ8ij2DAHUwHG7IcejqFvIvtAlfiKlZkQaSz5Aqd0l1rUir1nPFGjCsxFacGFh
 xLlgM2iK3gGmLxmwe+c0J09+6C74dpBZdlJ5tlERFbaDrOMgyiZLsriTMqMyx63GZluP
 wxTl7iJt/CegU/jnvus1uwD0OAEbbAoR1T31JzkgRM3L12uX4l3EeOlOSDTPufutj60i
 rw0DWZAobZEtlmlJNxhMVbaS4A1l5R5SVocIQ6CJ5bWai4q1bumSo0Cyprq8wZmMpRAj
 j/wXitJu9BPozV29KTXNy1QGYycgdKm80kwDZJG/UM3Sak33stBI76Hre8pa6dr3aHGX
 T+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735575727; x=1736180527;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z4NeyeisMD3W02zckZ2Ty449qJqStFYvxy23pWE1RPU=;
 b=AAIIozg30XhXc69kPOBGtjmKExvKD8a5fJ5jbfX21A8AjepcAapzndHw2W0AdfAxMz
 IyvZLSGW5Gtk1gbOKs7qQvBf4BdpEReejhSG1vlr4ozkpxruoL19XpbBAvtbouUO/Vq6
 /wTXHX/UkD5wJluXbfechvJkNSRPluBw0hjqMjUFoFhn2Qxp4KIhtXR6h5FNA5b2PQ0a
 xK/jowxindtbXmtlihaoyyEEgabDcR9H4gH+4sZJHi1RKuompKqJ7iAxqnr+q0/vip8x
 ZiPBpdDW5NBlrGBaf9P5sUPoVfgCuZkzSSsuuKTl+1w9w5USlztP1myk7w1FeEy0YLmD
 UJsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZZ95jG1e5/lYw+ozDZcIaHUX8eurZo2rKTkMAayma3ioJF0NFRLkSL6zbmFe8L74WwEAWQMbFcBE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJtKYXNUXYPTR+ahGQuLbJtT+Cm+oL0Hr8aFgpQKN5PhmQfDm5
 kqQl9hgoFb7VV3qNuR+Hmt8G/6eXRUok0/mryl4/xD3W6XKibg2IOL8RdvtB/CeCr+72poAlT/v
 A
X-Gm-Gg: ASbGncsjKfb9Cly44r/YwHKfMAr959+qZa0HBaU5KIeFkZ+I7RNOKMRyTtFBFXuEw4V
 JIkLo35Wl/sJwAIQ8JCuQ6loIsezSmh+nD8gtUDE46ZfT5cUzLFySDEAZLUVW2AeM7F/nBYYbE0
 Wql0KlL6q75eSCr/GBtITmzlhFPnfMC+EznniiZdUhryy/5IXG05SMMaIvCgYjDLVZMOXxnzd+g
 y9FEO1E5Zsd7M+M5xWGghiisBFEAATkjpS2kalBd5Kja8ekkKxfaiTFtUlk2q+IYvmyH0SMWu8=
X-Google-Smtp-Source: AGHT+IFu+L2NamaQNW9mq91S67gze/Z3mzA8R5zCSKKLA+/3EBlQtuDSLav2wBYeMZN2QhWb0JYbAQ==
X-Received: by 2002:a05:600c:468f:b0:434:f871:1b97 with SMTP id
 5b1f17b1804b1-43668b78677mr243226485e9.33.1735575343520; 
 Mon, 30 Dec 2024 08:15:43 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b3b1f6sm398469025e9.31.2024.12.30.08.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 08:15:43 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-arm-msm@vger.kernel.org, Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
 dri-devel@lists.freedesktop.org, arnd@arndb.de
In-Reply-To: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
References: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
Subject: Re: [PATCH v1 0/2] Add missing fixes in fastrpc_get_args
Message-Id: <173557534277.273714.16861047953843054499.b4-ty@linaro.org>
Date: Mon, 30 Dec 2024 16:15:42 +0000
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


On Wed, 18 Dec 2024 15:54:27 +0530, Ekansh Gupta wrote:
> This patch series adds the listed bug fixes that have been missing
> in upstream fastRPC driver:
> - Page address for registered buffer(with fd) is not calculated
>   properly.
> - Page size calculation for non-registered buffer(copy buffer) is
>   incorrect.
> 
> [...]

Applied, thanks!

[1/2] misc: fastrpc: Fix registered buffer page address
      commit: fa22a9743aece593fe9f1e0a0d6189a777d67e38
[2/2] misc: fastrpc: Fix copy buffer page size
      commit: 58570026c7ac249bfbd90f9fcb7d2e0a74a106a1

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

