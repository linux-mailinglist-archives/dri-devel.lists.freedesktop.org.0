Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6166DA46424
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 16:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7EF110E931;
	Wed, 26 Feb 2025 15:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="E9EOz1fD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4774910E931
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 15:09:36 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7c0970e2e79so1264281585a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 07:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1740582575; x=1741187375;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZrilHsSf4uozHG3QDObtiEewL5WQ28IzDxI5g784Khs=;
 b=E9EOz1fDmFHKBuw6AjY5vJ3nyOFz6AmOGC6MqWaUWJhxiqwnA1VjDCZ/NL0uF/n/vR
 Ir9UyFJP0G1CxE+10gtTUu9fEG9DbBeP6CxcgN1klbHdWRM2mS82zvtfMGk5wsfuGJm+
 UwTgwuZ+QpwurGHaoN8Gwx/XmKQpOzMFKb+DLaenc2/9lA91rXA6YlnyQ0aHm3Z8/qil
 XON+pd/8aBlv8JohqofJPjb8IOI0jYb0yGRL9RJWefPgDcumPKiFYYwWKfLgmsEF7vNc
 Lgz4tKUrc4pQQcv0OSK1Ej9WEyqv5UlaoQRo5F7Iosb6e9Fi3pU7uxJ/BMQo3Htb/7A4
 vDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740582575; x=1741187375;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZrilHsSf4uozHG3QDObtiEewL5WQ28IzDxI5g784Khs=;
 b=RbZu+7lFOQBVioGZxP+qUE9UvnxfVX/R7h0cWXyRgFclir0uSQl2GEMdqXVg5B4AJ2
 d+yyqSZYFJhsVgRHoM+OaL6A201cCq0RpBpvgdvY619arO19mVRG6m+2ZvQkEuOWQYUs
 L4WsX6eaMut3/JoYwxEG/MjhQh0HeHNEWTF1us/oXmSwL27nQ3s6P0fDh7FirtGWesQZ
 7NeA9Gx/IjwaQMRRzzlBqXiJAIDqMvgY9JRd9KeDbcozeTlmtmOrsMPC3FFSU/YpCLVQ
 +OhqoU6wvHPnMPN6I9fP8ACChdt+TeWpXDcfjT8Xn98vFMKoPWq0JAzpzjrb9ZgFGyN2
 FNSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE5eY1QGOYECDXVDhfv95gg+tLB4+LMqjZPztx3uTm7THy0H+PnobrSsCxOg/i0xhcvEYIJdr49Lk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/Ojs3A0jwYIijJNlljOmBJORgkQUR0um4HLeRWa+sr80own32
 J+POfWZuZV0VSi6ZwuiiS93T9d7erXx+jtMFdvL8TjB90uxYwsEKkb3XL6GxqDaMmkuweorHxo7
 Ng+TWR/ldyi6LONPLZyHM2ChfgHT8nZi9/SxtfQ==
X-Gm-Gg: ASbGncsUsBfqfSoBU81trwdjVZYsKe7uX001z80H3V1qDQyoPYq+i5aPtw4qPPCIl0+
 0JO4a1H+TAjFOWAvhmw5mrellLl03elG4UKCbl6SQwr6cpwGQo17fjoauoQcdIp5Lm+rSUlSX5y
 FX8GEH
X-Google-Smtp-Source: AGHT+IF/tg6cM8Vratykn7v7aPCgw8wtxyKpm/qbfk92lBpsgjX6Z9qRmt7KyODFfgOjzxshnTfEuqyZgNXJsi0PTAM=
X-Received: by 2002:a05:620a:458b:b0:7c0:bd67:7dd2 with SMTP id
 af79cd13be357-7c23c048738mr1144044385a.48.1740582575363; Wed, 26 Feb 2025
 07:09:35 -0800 (PST)
MIME-Version: 1.0
References: <20250226-ci-python-timeout-v1-1-0a9092a3d6fb@linaro.org>
In-Reply-To: <20250226-ci-python-timeout-v1-1-0a9092a3d6fb@linaro.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 26 Feb 2025 15:09:23 +0000
X-Gm-Features: AWEUYZnbEiebiVjonXIF7OkUNZGFkCDHvC0BpPhmqST5ONMPQP479p20hC6Al-w
Message-ID: <CAPj87rOu-CSAvBmqrjp0oB8Y3yiTJJ5==i+OTHV=SO4CSEDLJA@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: extend python-artifacts timeout
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Vignesh Raman <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Feb 2025 at 08:35, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> The job has a timeout of 10 minutes, which causes a build failures as it
> is even unable to clone the repo within the specified limits. Extend
> the job's timeout to 1 hour.

This is neither expected nor sensible. We should fix this some other way.
