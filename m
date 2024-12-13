Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5B69F0870
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 10:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAA610EF4B;
	Fri, 13 Dec 2024 09:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jWEgNTvt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2B410E259
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 09:50:25 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4361fe642ddso15637435e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 01:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734083424; x=1734688224; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JNzQNA5YMpAIaOEEK69Vz2/DURtu35jxdJqd68BQ/VM=;
 b=jWEgNTvti7YwacLmg8Z3prbGHuM82Cc0LvPk5ULVrsVLn3UT5+Op5SfHfkEE5VJYn0
 s9I0rqqL2Kq7KqrcnPu1UEO3Nl3lZL82j5v31jqxZxgdFOiXKbFi0ww1zKOAZhCUTcil
 0Tv0a4lAnWvj5UFmYUjJmntX0EFoQ8jURlUesxRrgm25qWurjgiknuL7lsXpvazh0Jvs
 glUXw99n59iSC9Vf6SA9KMJPe3rJHl9HHHShD4JPhSM+jAmeNc+rtMaNs2UJwGsoPlvy
 /5EUROnriNQEH7UXr3IMvE4ghb8FlTibhdBFO8BcjAvOlPIxrUUcvJlgL1ifWsOaW7eo
 bwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734083424; x=1734688224;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JNzQNA5YMpAIaOEEK69Vz2/DURtu35jxdJqd68BQ/VM=;
 b=oBqiFlzGHiL+Kdx4T5mZ9yeykayZFBXRm82VMxZwPXMAuCiRiCJgsfridr1PShbTfO
 YeyhFZ+EPYMYm6bAtIs6C5EjVFRzlZKn2xPzqBkZzse7XlhiG+hP2GyhPt3GtQcZ70jZ
 meRGot5CZq0FocFnuKbx+zc932HQ+qxPTUYV5LZAEGZktsxtXm2KVUTpwp8900F2I5LF
 HlxJXN54Ll6hoBFLyYeYIGN/xW8DYAwhvj9M3bWMiMeh/nMfc6KJfF3bkoakTZDWt3pW
 JonRzRaVL/UGarxlMW/C9d4CyO4NT+fFo1vPmqXu+i3HEImhPEtN9a7/uuOdGXls0fD/
 2gOQ==
X-Gm-Message-State: AOJu0YxHMos6eE6MjrrXVmuylMQXi3LkiRqqFYW24uRTrJvBWeG42yr5
 fU6O6Gi9T9ZgM/R9U6p10Y9+JuxWUu/GnuKBwFOk5Nn7tHZVbIHhiqAK9mnPNfY=
X-Gm-Gg: ASbGncvgH54ly1vPdxD8Q31nem4ixz8ye+1nMLo+vnQTEEdcE6WiuUsFvdBfbEx3fE5
 jJTv/dfuOjudf+vvn6A6oBaCvm8Z5/iJtusGVNjtpg4cR1OhEnAsUBTXcM+D2BfJJ4HK8z06zsE
 WwkxQPt4hva3YVkw4AMSzrZnAeUzYh4FA8udny0t/zQT+tzTZ0fWdhJnKAtVhbyjrQc9KOONGZs
 /bNY6uZTJC0ty+HLJud9pL7Qtd+vjhzSPR8prGoUik32NNsk804m3DW3RMDIyqykOR0ouvnjyTS
 Qg==
X-Google-Smtp-Source: AGHT+IEveubhu7QyUwffWDzma2q/2n170KZ0QuGjxxcbY8M8OEoGtORBlvRGfhraDjw5fS6fCjZXSg==
X-Received: by 2002:a05:600c:b95:b0:434:a0bf:98ea with SMTP id
 5b1f17b1804b1-4362aa2e5ffmr16750345e9.9.1734083423778; 
 Fri, 13 Dec 2024 01:50:23 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824a3e38sm6521670f8f.23.2024.12.13.01.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 01:50:23 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org
In-Reply-To: <20241125013413.160725-1-marex@denx.de>
References: <20241125013413.160725-1-marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Document Multi-Inno
 Technology MI0700A2T-30 panel
Message-Id: <173408342285.146926.4818672543940960912.b4-ty@linaro.org>
Date: Fri, 13 Dec 2024 10:50:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

Hi,

On Mon, 25 Nov 2024 02:33:35 +0100, Marek Vasut wrote:
> Add Multi-Inno Technology MI0700A2T-30 7" 800x480 LVDS panel
> compatible string.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Document Multi-Inno Technology MI0700A2T-30 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/465f127a50058ff3f32aa5e3098d9499ea63960e
[2/2] drm/panel: simple: add Multi-Inno Technology MI0700A2T-30
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ba68e6906057584d1f5f5374c585d51f64252e49

-- 
Neil

