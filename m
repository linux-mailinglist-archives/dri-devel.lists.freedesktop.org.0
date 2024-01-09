Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAC5828645
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 13:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74D610E401;
	Tue,  9 Jan 2024 12:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE96310E401
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 12:51:09 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-5e54d40cca2so21150517b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 04:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704804669; x=1705409469; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qROkrwZiYfF7G3qfeBpIFh1K/Mmm7qN8BCKWKeQz2Xg=;
 b=ncYaAsjqsvhikb1AKCvSJMuP9mf6DNlPMkyHOrsvJQIWlXlTJtDDbWp1eU1hHdluqZ
 vNT6lCtgk4Dt0sVYgNoMHGyn7EcYbSmQLNmd4v2uQ+fBCvT9PepaWMGgfvH+y6bhi1xy
 GbsiyF4p8j/H+HbAOBID6tI8PvlZZfMza7iwLmgezfZO5KFtObHC+VrW2gqd2NJZXwME
 rT8FivjskERas0yFxBVyTW08Bh5zROIkAHz2MgxCe4YGs8Wjc063IfryiAcC1t9gEq/c
 aTMJ8HRidBOYurQ+vPt4cKH8qctlt9WR93eWJOPGPqCwMPhkHDrelkylemfCcjUWdkZG
 ZiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704804669; x=1705409469;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qROkrwZiYfF7G3qfeBpIFh1K/Mmm7qN8BCKWKeQz2Xg=;
 b=mk49Sk1WXfQAwpRwx/LQ1LMQUTioJudYQq1mG6656rsxkfy1fLKSADtXNLTviTJ0eE
 JV4F4+6ujcoFeEm+dmeY7a2zuO90A14v9X5XnNpDPOWYswcgwt2XwajviTEOKVmkufhY
 niRa/bXCJcosqoaG38XbbuesMbFPdr7D8XwFpLtHv64QDxnQmO1pXhO9et/oN29mrHVD
 fMVcnbPzueS4QiiTF97LeVVwbUbF+FpXRO5lRI0YkI+IA1ycdBOLUC4rNJs4XgIBhrUN
 iD7RBSh0C8NCYoFq+e3jgjZIaITiChp0YT6IHjKiH+2vZnaYZhSQZt2MlqQ+U7X3lcoR
 CFlQ==
X-Gm-Message-State: AOJu0YyOB52OLvXIXw2EfguaoJJh8kvXln9Xan7uXfbgckyQ6Fgq+t17
 RyCfu9K/iUrz/7+Emul+rRmOS2KO5K6YDcEVHVVkwsbsVFAmGw==
X-Google-Smtp-Source: AGHT+IH+fzv4HWsvreNV0+tSn6byYRFteteAYCO+0WhpTnneXsrnBRv9MuDla7pttJ83htiBlMzNHxSf3skPhge1yI8=
X-Received: by 2002:a25:e0ce:0:b0:dbd:572a:a106 with SMTP id
 x197-20020a25e0ce000000b00dbd572aa106mr2145429ybg.10.1704804669129; Tue, 09
 Jan 2024 04:51:09 -0800 (PST)
MIME-Version: 1.0
References: <20240108201618.2798649-1-dario.binacchi@amarulasolutions.com>
 <20240108201618.2798649-6-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20240108201618.2798649-6-dario.binacchi@amarulasolutions.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Jan 2024 13:50:58 +0100
Message-ID: <CACRpkdb73Qrs6MuiC427f=RnyD=rydH_4xVhBx-2bS8bX0mJCw@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] dt-bindings: nt35510: add compatible for FRIDA
 FRD400B25025-A-CTK
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dario,

do you want me to apply patches 5,7,8 to the dri-misc
tree?

Yours,
Linus Walleij
