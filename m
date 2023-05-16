Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B06E7047BB
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 10:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7B510E327;
	Tue, 16 May 2023 08:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C6710E322
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 08:25:28 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3090408e09bso2678190f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 01:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684225526; x=1686817526;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YkoC9PWg6cuW4/FTvhH4rS17FDcsNm6YxnUGyMEtO/I=;
 b=mjc22NADDnU82m4BCgR/wakiErAwRFijpq34JIbDwu9Ui6f9Jdcm4Se48Cyxdmq/ZA
 SofbQO072leZee+CYxa9Xi8Ik22H69Ul0b9QccSMe6K7jOm6Qr0BeumwXWuaGueWL9Ck
 SudHxHAqP2GyE2IUG/l4XE2QIom0lRPmbUi6csy4PG04YujZz1GC24l/d4yRIEqWd7MK
 jwArey/PdEyuiNNJ25meDrPo0AMziynFeutSEPyPQkrtxPfei4uOe9gBQc+XDdR8jz4R
 sA7eK//UtSkgvHpKrdnqfp8fdpmaI9T9uIV/UU2foAQiUczv7KMdKLlm1/Wr436l5ycZ
 AunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684225526; x=1686817526;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YkoC9PWg6cuW4/FTvhH4rS17FDcsNm6YxnUGyMEtO/I=;
 b=P9KaG5LD0e1CfAzjlhAu/zg6PO6WaaTde6f5Tff5opv9EZMRWQP0tST37soFi2bZPM
 0D4cg3ndOtS2RY6rc/FQQqmwv1u9Cwux01NFs+g0kibBuzXX9M3u8Iaw/IzmMb0/vxRx
 JrPCa/eh+meD4Pn7NAerkBSuD+JhBxkRWTQSjX9kjTz6DSCWHYu9+W5thafSXnazAKlT
 P6tokw8sGm/WfwP2AgfJaqrCnuPxw0JAcXwADjKaLiJRqJTZzKUPke17G8soCgD4VXdw
 Xp4pp5JCfo/H8ZtWVwscPhd7PCihcg4DEkioo8kSTXakB9AFJ9z1Y+EB5rH3954vN5rm
 UCHw==
X-Gm-Message-State: AC+VfDwGy/CsWN5P4PO8EylOVB2CFH4r1pUQnksf8kPe83+l3N5Xl+VW
 0TvNISPVdI8YJnxf5HV1nYE2/g==
X-Google-Smtp-Source: ACHHUZ4Nwg/N5n1W1+t0K64odwxGPC6JRyHFjovDz+8QaHC/WHuXyJ4UY+Hx2Ys4CZ9FZSQVWZgggw==
X-Received: by 2002:a5d:6841:0:b0:307:8d93:a47f with SMTP id
 o1-20020a5d6841000000b003078d93a47fmr23944609wrw.55.1684225526036; 
 Tue, 16 May 2023 01:25:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a5d494e000000b003063a92bbf5sm1727505wrs.70.2023.05.16.01.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 01:25:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>
In-Reply-To: <20230515162033.66986-1-marex@denx.de>
References: <20230515162033.66986-1-marex@denx.de>
Subject: Re: [PATCH] dt-bindings: display: bridge: tc358867: Document
 TC358867/TC9595 compatible
Message-Id: <168422552521.63953.9545904244070091702.b4-ty@linaro.org>
Date: Tue, 16 May 2023 10:25:25 +0200
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
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 15 May 2023 18:20:33 +0200, Marek Vasut wrote:
> The TC358867/TC9595 devices are compatible with the predecessor TC358767.
> Document compatible strings for the new devices, so they can be discerned
> in board DTs. Update the title to match description in the process.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] dt-bindings: display: bridge: tc358867: Document TC358867/TC9595 compatible
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=adbcfcc92b5aaffdee4c5e62c077919014c483d9

-- 
Neil

