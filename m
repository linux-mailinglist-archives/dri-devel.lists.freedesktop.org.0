Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE3A7BF625
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 10:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089E410E159;
	Tue, 10 Oct 2023 08:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB6C10E159
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 08:37:54 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-325e9cd483eso5135325f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 01:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696927072; x=1697531872; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CLeTodDQewItkg/3d7H1CuYJRje+YY0rVU81amFMi/s=;
 b=AmfoQFG5pcenJB7HREU9HWLd5KFM2lPtrEtmNipmsYBGswF7UoCR2U+xp6/idR5rTH
 Z3l1aeOWgpBxmkwtv7UwRr0KI+VFaFjo4x6qcNALBDAoLGdZnfr6br9ODK0zDdt5NGyC
 RsIGHEIq9gKid6QZ9SfuWmFATqMgdClXfP5uLmQfO9nlCtJQ2hkY1TDdbFLtdzQvMc7k
 4JVQA8lGjp2N/srn9D/Q1HVvDpx0gYnXQn1HRFjEjzZgSxsXqQBW6B9ln6UmVcoRiWc9
 FX7RludjVGP6aWffx6qAvp7BgvQLIz/NbCln+Y9MmGv+IYzGmmfW1sX4jEkbso/LIIqj
 AwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696927072; x=1697531872;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CLeTodDQewItkg/3d7H1CuYJRje+YY0rVU81amFMi/s=;
 b=CQQNvx7gbikZLGar7tnsasgMAvXbxN144Dernr0eS8Z2+D8YwMInu3bDvza4uQTe9f
 7heT2+Po3yv0HOfc9QbOziwA37l5THj9UiMzuaR1hzk/ehaZfRVgahSQVooREznPkT/I
 /wk1GGckhcFYk2/1sy4eUqZ/iHxSEGRtC3UdFODPvpmDDmg2XLp+CEP/thBfST+r5W56
 7pjuZrar+BGDZfBXp7ef4KAcf8fEPgUu9DKti6POziRpWNFAJBbklUmIlAYqsliIO0KM
 B5o8o5NO+W+0NYZfUPDalrcd52HhQ+IaDACbyrx1SlFckie/OZ3gSljW3+S4tWdY9zBh
 EYSA==
X-Gm-Message-State: AOJu0Yx4vpAWn+jOxzU1VVJ103tdR8JuNlNkf5DGd6tC3Tnvy+c3QIWN
 GMN8QTGXh5EouTN/VaiNHdqqdg==
X-Google-Smtp-Source: AGHT+IFOwKpu6jatNoo0Jz/ERH/tyMjrEWInTl16AWeunSBiQXAFTRMYQCdIRBIOjD2ktfFVdn73Vg==
X-Received: by 2002:adf:e3d2:0:b0:32d:65ab:2228 with SMTP id
 k18-20020adfe3d2000000b0032d65ab2228mr316418wrm.11.1696927072565; 
 Tue, 10 Oct 2023 01:37:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a5d6a84000000b00327bf4f2f14sm11983147wru.88.2023.10.10.01.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 01:37:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linus.walleij@linaro.org, sam@ravnborg.org, airlied@gmail.com, 
 daniel@ffwll.ch, Ma Ke <make_ruc2021@163.com>
In-Reply-To: <20231007033105.3997998-1-make_ruc2021@163.com>
References: <20231007033105.3997998-1-make_ruc2021@163.com>
Subject: Re: [PATCH] drm/panel: fix a possible null pointer dereference
Message-Id: <169692707182.2632460.7509507129195879705.b4-ty@linaro.org>
Date: Tue, 10 Oct 2023 10:37:51 +0200
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

On Sat, 07 Oct 2023 11:31:05 +0800, Ma Ke wrote:
> In versatile_panel_get_modes(), the return value of drm_mode_duplicate()
> is assigned to mode, which will lead to a NULL pointer dereference
> on failure of drm_mode_duplicate(). Add a check to avoid npd.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/panel: fix a possible null pointer dereference
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=924e5814d1f84e6fa5cb19c6eceb69f066225229

-- 
Neil

