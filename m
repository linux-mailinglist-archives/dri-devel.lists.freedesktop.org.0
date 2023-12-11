Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C722E80C438
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 10:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5E110E103;
	Mon, 11 Dec 2023 09:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88F010E088
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 09:16:17 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c48d7a7a7so4975915e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 01:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702286176; x=1702890976; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ituXlXKe0fJCkyKQxUR0l5+9ChW5TSXn8+gGp+m+v8=;
 b=LPNNZaaIZ6J5N5YRKFAyD9dqv/i4Rd8kUQM1f0jwwM+v1xWdyQEJnl15wwQP3cKUCi
 qcvvYnCaXyHbOXMRMb2y35eiTN8DgqBW70WI+ldF3ZzsZ0KxEo1BeI1d5cSyfuGukSEM
 vM5kCrAsSIF39/cm+Krx6MkQwNd18Gf5Pz8Ouz4n0WQuej5jSnyJ/nGTd+BXQ1VAHltt
 jbVxDCvy0uT5kaMVH1werIfMU0ECB+LQhCpv+Gql1KmeMMDhQPtnoXcSxBu1SjrfFYSj
 srZ2BFkvbfuINdQgw7sOBMeaPW3gzVfKu0r+L3090YG3p6dEDGEjaIZ8sIR69QvBOPuD
 XWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702286176; x=1702890976;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ituXlXKe0fJCkyKQxUR0l5+9ChW5TSXn8+gGp+m+v8=;
 b=vRFwxkObpeUGs4I8T0OAio0YrUqWikqVWow58KXgJJDVUifoDAi7gXM7MRBSpVWajZ
 WjmxoqEgNqc215YFMIdE90/ebV60YfXlZ+BBHFTgNgOk4bdlh2K1sej+o2KcBwUbb74l
 Ew5OfcxR9Qs6JSAP+/JOXhoWtakXRYMR1yzeVlunQRmhzDDlvx4DcmgBIdGecmjYfGsj
 mBfCXpQWxlptusa0iBwGdIieRFUMuNObph02IyoACIAux7EOGPklhu7IexmE60Qkfk9N
 DTR5rjj/oFdRp1HHsu0xxqLiCezIvlJ+9M3jjY2RoSS32Y3J+Lm/CipfjYHhl4pDL1VB
 9ZDw==
X-Gm-Message-State: AOJu0YxxlF3s1qsyvIH0JbOcIs+ghp+h2R/3quMD4zllX3JIHq+QBqy7
 1kwvbbEVU3YJCgmSoVYb+tTwNg==
X-Google-Smtp-Source: AGHT+IHOd1ua8XNnZwzl2F7B3iNmHeSOgbkbmQ4SeoUEsIsN2Y0VjRUCKLzDXzMljnkqZQyjpxXHMA==
X-Received: by 2002:a05:600c:c1b:b0:40c:27af:2ac8 with SMTP id
 fm27-20020a05600c0c1b00b0040c27af2ac8mr2088754wmb.6.1702286176108; 
 Mon, 11 Dec 2023 01:16:16 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 bd19-20020a05600c1f1300b0040839fcb217sm12398470wmb.8.2023.12.11.01.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 01:16:15 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: devicetree@vger.kernel.org, Chris Morgan <macroalpha82@gmail.com>
In-Reply-To: <20231208154847.130615-1-macroalpha82@gmail.com>
References: <20231208154847.130615-1-macroalpha82@gmail.com>
Subject: Re: [PATCH 0/3] Add Support for RG-ARC Panel
Message-Id: <170228617524.2409693.18249694265384337342.b4-ty@linaro.org>
Date: Mon, 11 Dec 2023 10:16:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: marex@denx.de, conor+dt@kernel.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jagan@amarulasolutions.com,
 krzysztof.kozlowski+dt@linaro.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 08 Dec 2023 09:48:44 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Anbernic RG-ARC display panel as used in the
> RG-ARC S and RG-ARC D handheld gaming devices from Anbernic.
> 
> Chris Morgan (3):
>   drm/panel: st7701: Fix AVCL calculation
>   dt-bindings: display: st7701: Add Anbernic RG-ARC panel
>   drm/panel: st7701: Add Anbernic RG-ARC Panel Support
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/3] drm/panel: st7701: Fix AVCL calculation
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=799825aa87200ade1ba21db853d1c2ff720dcfe0
[2/3] dt-bindings: display: st7701: Add Anbernic RG-ARC panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=acbf9184a87d5d6868809baa3a6c7d0537d1f321
[3/3] drm/panel: st7701: Add Anbernic RG-ARC Panel Support
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a7890252c1a314654862944cf4733e4333b76e25

-- 
Neil

