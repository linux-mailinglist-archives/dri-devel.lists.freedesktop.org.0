Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F97E77B8E7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 14:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC1510E1DF;
	Mon, 14 Aug 2023 12:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0952610E1DA
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 12:46:15 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-317798b359aso3722504f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 05:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692017174; x=1692621974;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u6yw+XBIE9/REIBBvFAe5sVlUZd6t4HnAxmJFaso1i4=;
 b=S77h37MdfrU0+uCMRE2QSMfHgyJh4/cMbN9E3OCLUZBjmCoE66XkBPTm43+cLIRXNu
 YUgd/B8nrEHvJKS37ZLk6A3d9Huw91uRzhaPau8wSNzLi/cHqVchpzyHrmOX71GCSR6H
 LCN7pjA8Lavy+MipUXGsg5TeKZN18Axi180Kt0TJL/cW8obI6ESFBeTL3SDR7oPLqvBS
 rXGntm737FnUK7LCQk/WYpudjob54S2LM6ct4rgkVlO3YK3WulLpDGjtmeQfoHJXPJPh
 jfUUEqGNptIH4QZ6cQMZ72wRLQPqPFCdWV9bJ6/aZ4ZI7lXnGopfbr0xez/1jTyjQdB6
 pocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692017174; x=1692621974;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u6yw+XBIE9/REIBBvFAe5sVlUZd6t4HnAxmJFaso1i4=;
 b=jZpfvs4PyVVkKhK8eJtvcBHY1JGjPhi1F9ZqH46fXOwXUghjfkFA5vrobNjubAkyAt
 Yo5T1Q6EYPbOHHC3CUiASHmCFwacyj1wJAUyDmOKNzOump5b/26l9nHswRUTWHdvWtgU
 hP0CuP2Sk8M63gQBj/b5YGMOutfP+5gT2RXTB90IaWnRIBoSa5pUQy3tWQd3MEztpsag
 uyMJ7jX3Ej0dUlCDJpN0As61qffL/hCWPk7NZ+T7lKGI3w5ZGUX1Par18vg1CKZrNmWq
 lmqyAhCyFJxq0WN/Bm6xLLnbHKI2QCgrpb3WjRaugWKIybxm7cno1YZEUCYVxPA8ymWK
 I3MQ==
X-Gm-Message-State: AOJu0YwpxWfv5XRouGGWg4BdST2feHmmD2g+gz+loNuYesoRkkR4TKsD
 uT/7DQafs2SBkU9Q1r8QaXGB+w==
X-Google-Smtp-Source: AGHT+IFXuZoZok0PogyHoeGg4IURmaLD7MMyshcsbQemPgFJZDeOiYelAyVrf1QaJCCFCVTTcpNKUg==
X-Received: by 2002:a5d:5309:0:b0:313:e57b:e96d with SMTP id
 e9-20020a5d5309000000b00313e57be96dmr6074259wrv.36.1692017174465; 
 Mon, 14 Aug 2023 05:46:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a5d444d000000b00317f29ad113sm14249506wrr.32.2023.08.14.05.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 05:46:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Heidelberg <david@ixit.cz>
In-Reply-To: <20230812183404.374718-1-david@ixit.cz>
References: <20230812183404.374718-1-david@ixit.cz>
Subject: Re: [PATCH] drm/panel: JDI LT070ME05000 drop broken link
Message-Id: <169201717354.1374248.2742017075159670711.b4-ty@linaro.org>
Date: Mon, 14 Aug 2023 14:46:13 +0200
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, 12 Aug 2023 20:34:03 +0200, David Heidelberg wrote:
> Link is no longer functional and web.archive.org doesn't provide PDF
> with detail information.
> 
> Some informations can be found from web.archive.org here:
> https://web.archive.org/web/20170629205602/http://panelone.net/en/7-0-inch/JDI_LT070ME05000_7.0_inch-datasheet
> 
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/panel: JDI LT070ME05000 drop broken link
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d19859a042668277d79f8df0165ed75011f11e6d

-- 
Neil

