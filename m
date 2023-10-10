Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2487C4132
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 22:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F163210E3DE;
	Tue, 10 Oct 2023 20:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42B310E3DE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 20:27:31 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9adca291f99so1029502866b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 13:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696969650; x=1697574450; darn=lists.freedesktop.org;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dMz0xfxZWQ5iD30pnXzqjQxLEDZhGPTotJuYkK2Gl6E=;
 b=HfhWP2muxQsQS2YpXAc3APEOlNqKQmi7cGMWMzf9EH1b7GeAYm93L+gza56LtOzeZ/
 jGB+ARquidKNrlXp+qi8yqN2QjhIiUSdHm6iIDsu9NH4rFLDvNrmlG8hm0JGJqAAvjt5
 BEYJwcO43ShzVVZ6c87uk31jmtBprLC5jAMeAeWaA80HPW9+Ou3FvuCaguNWi4zRPbN+
 eL0JNWLtnPrWpP9lXXalAy6J/P5pJlCneM2b3sc54H+sZFB9xRuWgsfmOizQQTuHlZAG
 ne0K5Dak1rOFKdRGAP/3TnewnI+v1C55V3vNgWU53rDRaDnGKb4a/hnzeKob4iP7Xh+B
 eivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696969650; x=1697574450;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dMz0xfxZWQ5iD30pnXzqjQxLEDZhGPTotJuYkK2Gl6E=;
 b=urIAOwMQf4F2ktqoQ/ePxAfKXAXkREi76G55SgLkuE5hbKS7imBblR+e9Mdqwrv9I+
 dMYaNaHkUIFwGqMX+XmZoAYvha22C7VJW3qMk3dDJ7SbwG+zHYhIwRSWacln2WU8RCaE
 ZPNEmWNTku0aOSJdnTlSVHVoCIEECsLIPeGIQydxEdshebiVhAdVhkEOJtwfd0st3ICd
 U3ZnvpRf0YQn/TA41JljO/pJWChIPnqVNElrFC4ejaMXNnAjVQWTdrezU/FKCq0ECV3S
 utGhU9jPHYGhMFzbOFcaYJD+7K6BpgBSWWb77B5tqzfS+JYyaciEUG1zbQNovkpyPL4C
 g1SA==
X-Gm-Message-State: AOJu0Yzj3er7ST8ZviMUzzcIYF+W1rV3FE16cl05aFaRM9RBFAm/FCzI
 zQJriFl+KTK818A5cin7cVHrug==
X-Google-Smtp-Source: AGHT+IHC/kwWiaqXvb0nGYRNaASLe26Qtou+/WAjNnon7U18sO0suzZHlgQJQf3+W2X/fudkzkKlfQ==
X-Received: by 2002:a17:906:3107:b0:9b2:f506:165e with SMTP id
 7-20020a170906310700b009b2f506165emr15155725ejx.56.1696969650228; 
 Tue, 10 Oct 2023 13:27:30 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 lu20-20020a170906fad400b0099297782aa9sm8780942ejb.49.2023.10.10.13.27.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 13:27:29 -0700 (PDT)
Message-ID: <d1b9b7d7-7aec-4866-ac76-e39fbacc8d7c@linaro.org>
Date: Tue, 10 Oct 2023 23:27:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: please backmerge drm/drm-next into drm-misc/drm-misc-next
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

drm-misc-next is currently stuck at 6.5-rc2. Could you please backmerge 
drm-next into drm-misc-next to bring it to 6.6-rc2? I was going to apply 
one of the pending series ([1]), but got conflicts because of the 
outdated source tree. Thank you.

[1] https://patchwork.freedesktop.org/series/120393/#rev5

-- 
With best wishes
Dmitry
