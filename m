Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C226C4845
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 11:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB8810E90F;
	Wed, 22 Mar 2023 10:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D470410E90F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 10:53:02 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id l27so8214191wrb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 03:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679482381;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=axAxaj7MXeeZyZASdvUOIHiY+xN3glaRGbzn8j1pi3I=;
 b=fTU6r6P40wLrXmxrzrS569jMfY8gbkSAEMkgKJm7KvjjpSM6nx7okd0eh6sNYmdRaZ
 Wz6lHFzIWoBBSJlXyWB1U/QrtAZ/g2FDDqt9Skim5vgyy2TY3Cy2yRYh1pMN91hGfZMs
 MJGuNzVND1OYtUl7eiNMImue/8CjyyX/VYwKODDMRPafTY6sZUgyv1xQwRsgr4V0m3Rx
 iQ1AEL+LRCRvTJXZIWq6yktGs8m5u5zmxLZW4q9HCR0ShToIqlQ/Tf3OcnTMmIzfSDVU
 VfL7oIZ6c1FR1/PNu9Ip4K3H34NOB/071VeAFz63oziyRuNoZDwH9FfuarI3wYSn3sDz
 wnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679482381;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=axAxaj7MXeeZyZASdvUOIHiY+xN3glaRGbzn8j1pi3I=;
 b=vpK0LtXOGkqNhSk0Pbm2gatJdjEU/xEd1FIOvLt97jv72yTZW/NGB3v0+/TZ4wYIHP
 tNHCcyBEbilWFDqTZ7CUsh5DHgWjB1K5Ut9HdQQE04r4WlDv/UF0TWUhSsH+X4x3DI+i
 yslQ5S/63xJfyL9Bk18C33D/55o+8VREELTQJbOiVbtQ/1Y9T0fRnRQzYIzUTvsDC4qg
 THnE+YuXOZf0riY5RfqAuPrnOv0dSqkGqdzIbq+jRakxpValyuadPTXBeq4KjImQPmgq
 yBIX0IdmrvzfnfDi1VYc2u7umSJ2msuqUUKNY0LpQ0j8UGhWf7mXBCSAH15Y8UaIgHvs
 y8XA==
X-Gm-Message-State: AO0yUKWDILR7XQgfZchymwbE11mbGROrbTBbljSx4pqFHMgn7FhQ/mPK
 KEHSceAR1Ptkydt2ICQVx4J1bw==
X-Google-Smtp-Source: AK7set+2WWU70m5P+jJc8FGWBVyy/DorAETD1YkwMx34X/BnosCTT7ebWI0esUT4ANz3MrqZZsNFkw==
X-Received: by 2002:a5d:688c:0:b0:2c7:fde:f7e0 with SMTP id
 h12-20020a5d688c000000b002c70fdef7e0mr4856639wru.65.1679482381373; 
 Wed, 22 Mar 2023 03:53:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 j10-20020adff00a000000b002d1bfe3269esm13555049wro.59.2023.03.22.03.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 03:53:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: laurent.pinchart@ideasonboard.com, ye.xingchen@zte.com.cn
In-Reply-To: <202303221622511915615@zte.com.cn>
References: <202303221622511915615@zte.com.cn>
Subject: Re: [PATCH] drm: bridge: simple-bridge: Use dev_err_probe()
Message-Id: <167948238056.3845492.17020283681368412723.b4-ty@linaro.org>
Date: Wed, 22 Mar 2023 11:53:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
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
Cc: rfoss@kernel.org, andrzej.hajda@intel.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 22 Mar 2023 16:22:51 +0800, ye.xingchen@zte.com.cn wrote:
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm: bridge: simple-bridge: Use dev_err_probe()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=db8496d0b50519540e1ee50f7e209b3a536ed671

-- 
Neil

