Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2DA9F4A6A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 12:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD7F10E94A;
	Tue, 17 Dec 2024 11:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="swx5wMtf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0043110E958
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 11:58:54 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so57591005e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 03:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734436733; x=1735041533; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t9hqEW7XeYBzAUP6ZyZ8OpTtmoSTfB8RARV4imdTM0g=;
 b=swx5wMtfJNyMCJ84jAGbnhJBUVXobkrgetAE7AP4NHN1kvCZQHQ6e1VA7UxrOhv1BP
 8kRGQ5dni0RaKQFtcCEbo2/FK7DeK5Ira+v8lbRz3oef6bgmW2iJMBgBSSThQIt3vyZC
 W7f2jUAkutB4XsmNlVvWC53gjn03pGPKYzh9+3dR0Pjdr5yt2HuyTPmm1wE9fQOMM+vu
 iL3rAyGB0h1sueLnebPrGp6NDfICNqchXA68SktMbEM93nY4OcwU3k6DWpnqZ+4B9/ql
 d/nN+2jjs5Ph9IDv1mqpcI/4C59gVjiZYdzjk1fv/ez7jmkwp67ZzHImt9ylzhvWW+AS
 mLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734436733; x=1735041533;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t9hqEW7XeYBzAUP6ZyZ8OpTtmoSTfB8RARV4imdTM0g=;
 b=pPwyMiIoQM1b6j+xheopGo5PqW5H26WHBD2UBzWSfY1AB0KqMjpob5wzw3yYZeACKu
 u/e8l6m/TrSg4G4uKiICLGEceFwUmvW9ge2lcPDZHEs66b6hA/Y7+sj/T7w3uY8+2Xry
 M45pLL4gpIAKTQmtJFGgzhdB62QGtwLSuik9a4/u7gu69z67G0/smLqunR6gwdLDTe0/
 11D9hl2kspfauxoIpzwyctk43PQ6mJZf2cbJuSYqsJEUcB8q+ZEVkJZHL18iQU6V/zYc
 SEj8aOf8WOnbNDkCzQ3bd97edRIX9StXeEMG+4vg45jE/bhI6i7Ey8vugQYK6y1w5zbZ
 QsVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGXFK0c6Cdu1FDe/L6NDghXM4njZrCrbF3/hFbwoiyhNXKVE2pxRnorarWkTFywnhCrnDbDBndyiY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcBC9/csbEdUHQ31C82/1dIAftFCxuCKo1EUnAFjTyJgIpksYE
 T/cL/LwkTsYnzXzvI6NHC+YYh1Ks/6RGF3P53A8X4T/8jTP7yP6n5acnOnwXN7k=
X-Gm-Gg: ASbGncu/3G7I4rhRA3QiSPkXRID5x7ElZqVusgtWt68xoKLpl179eXDhgFOc6nI7Ryh
 IKpXw1kUorpolpIXH/g48zRX0M+oWFE3S6xQ6IZhkCrv/sNJi3k1vvxDEb4EYIrkpxTfKFmwTfC
 E+b6YD+RcEJI3TM3jxs+4xM78P420bjPXFSo98Zv9H8dQx7Ctle19Ky5HWJp89Ss6OmuL/YYw4Z
 GyOgZqapiGp6W2q9vHHxQthNyu26qaCL2lcR/k37MwV86gCbGVT1Nxsxl9zlng/v/lhUZwNMxU=
X-Google-Smtp-Source: AGHT+IElr3X/+n1C/bzd6Bueh8HghAIVp2JLb0iFduX7Lip+4bcYo3zxNwQH3qGvUMLrIOBL7Q//WA==
X-Received: by 2002:a05:600c:6749:b0:434:f817:4492 with SMTP id
 5b1f17b1804b1-4362aaa6334mr172111965e9.31.1734436733370; 
 Tue, 17 Dec 2024 03:58:53 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43625706caesm170318665e9.32.2024.12.17.03.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 03:58:53 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-arm-msm@vger.kernel.org, Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
 dri-devel@lists.freedesktop.org, arnd@arndb.de
In-Reply-To: <20241203053048.1690069-1-quic_ekangupt@quicinc.com>
References: <20241203053048.1690069-1-quic_ekangupt@quicinc.com>
Subject: Re: [PATCH v6 0/2] Add changes to use session index as identifier
Message-Id: <173443673261.58229.12529777015910898999.b4-ty@linaro.org>
Date: Tue, 17 Dec 2024 11:58:52 +0000
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


On Tue, 03 Dec 2024 11:00:46 +0530, Ekansh Gupta wrote:
> This patch series carries changes to use a masked session index
> as an identifier instead of process tgid to support mutiple PDs
> from same process.
> Patch [v5]: https://lore.kernel.org/all/20241202064806.1164800-1-quic_ekangupt@quicinc.com/
> 
> Changes in v6:
>   - Add single-line comment.
> Changes in v5:
>   - Remove mask and just modify session index.
> Changes in v4:
>   - Use GENMASK for client ID mask
>   - Add a new patch to rename tid and pgid as client ID.
> Changes in v3:
>   - Modified commit text.
>   - Removed idr implementation.
>   - Using session index for client id.
> Changes in v2:
>   - Reformatted commit text.
>   - Moved from ida to idr.
>   - Changed dsp_pgid data type.
>   - Resolved memory leak.
> 
> [...]

Applied, thanks!

[1/2] misc: fastrpc: Add support for multiple PD from one process
      commit: 0c3e383ce74b4239033fceb6f241cb09612f9547
[2/2] misc: fastrpc: Rename tgid and pid to client_id
      commit: 9f86299512e04b24fb0b4a49849affbb397780e1

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

