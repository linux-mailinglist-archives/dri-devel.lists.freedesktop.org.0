Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E8F86D072
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 18:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6527810E1B9;
	Thu, 29 Feb 2024 17:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pmh1k1h5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F66210E20D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 17:23:04 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-40fd72f7125so8232195e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 09:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709227383; x=1709832183; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bErguItfMvVUEbWhwhzZCYcvRJMN18OERsBymbfbLaM=;
 b=Pmh1k1h5QEHTQVptdukQynBLQcQ+XDkw4Z0QMn4EMj15Ls7sZoFuSMAXzclfZXmbQ5
 YC6Bu5heliBpUVGjGIfzCI+jY8Q1ok5nMuA2lDlE98CV/u/LsY5y/t6K9tQ/yjvCWOXJ
 9ThS8e/erwadvwMRU//vmgTmQ0lfG6TKhM0unwy9XMGFGQQEE9YbyHlJOcSmk/P4/mhP
 BGAbcotT/sxqf9/w7CvAERC2D4jyYySBvVgmSsO7KC8uaW7yNgOdLwHZqvhifq7MvBY4
 cGwY/zZEVrXfAPy4rFWV/QBzDfunA+mNMI7gfHFKs0yxbw/0rmk6NA14D2mhHu0z07pY
 mVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709227383; x=1709832183;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bErguItfMvVUEbWhwhzZCYcvRJMN18OERsBymbfbLaM=;
 b=jdpw4AmO7QRV9T7zIai+ZDYq6LQpfZ87zboscLK4cApVZ85bVmjVNVQQOLKMoVKW1f
 rWAEbgNlFtqMw73HheQMLdClFg5fXzRoTEz4hYSz+nyz36+MlJI+f3GQUNZ/BQPMYRIZ
 X/soCMlPLzRzkYO7DMP/BsKWX4xC8mzXgttZhwWYxsT+z+vzZ271MDSMvbfk47nq5w5n
 fQGdm9n4yCMWJasqASIIMmOTlPOV46l3rj/6bzS/PxyfoVvpn/SAv+gcNTYUneVQOo08
 XS5ZQYVCqItbXwLxwPFlLIazD01a6wY7ii+GV082uhRyXh8+2HtjdsBmWxE/hUZBsywF
 UI9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKMI53qgeNptrdOeQZAuAOuU+jARSEqu515GYlAtKYfIAF0oRrFVreaTvO7a5jdrOSi/F1bGZjm6HurVgzE9GM+F78zHrfFIy64kWGi+/c
X-Gm-Message-State: AOJu0Yzlm7z4DaWMBF42GcBtCuHQY97Q9qh0XNoTYwWsgtJD8rmIaMjp
 J2F865L4uv1PjN7aY88HOtU8Uu1E1NSd0C5uggt0Es6ruJyhiA/K
X-Google-Smtp-Source: AGHT+IGZRN4ap2o8wd40N+709S+xjf8UwMB/NxUn/8e2Adb62JephEiUJItk9npwpPGB/2e/RcRl2g==
X-Received: by 2002:a05:600c:3111:b0:412:b60b:96b2 with SMTP id
 g17-20020a05600c311100b00412b60b96b2mr2326997wmo.31.1709227382257; 
 Thu, 29 Feb 2024 09:23:02 -0800 (PST)
Received: from [192.168.50.110] ([90.255.110.157])
 by smtp.gmail.com with ESMTPSA id
 je1-20020a05600c1f8100b004127ead18aasm2733244wmb.22.2024.02.29.09.23.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 09:23:01 -0800 (PST)
Message-ID: <8bbb2957-9452-424a-8e9f-4ddbd4f24722@gmail.com>
Date: Thu, 29 Feb 2024 17:23:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm: panel: st7701: Add Hardkernel ODROID-GO Ultra
 panel support
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240221194528.1855714-1-greena88@gmail.com>
 <20240222164332.3864716-1-greena88@gmail.com>
 <20240222164332.3864716-2-greena88@gmail.com>
 <f9446923-acd3-41cf-92d4-676b946280c4@quicinc.com>
 <79a4b60e-24f3-47fd-b3b3-7d207cec1470@gmail.com>
 <a13eeb01-7df9-4577-975f-34b3aed8400f@quicinc.com>
Content-Language: en-GB
From: Adam Green <greena88@gmail.com>
In-Reply-To: <a13eeb01-7df9-4577-975f-34b3aed8400f@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/02/2024 21:29, Jessica Zhang wrote:
 > Got it. Was the shorter sleep time breaking the display and is it
 > required for the new panel to work?
 >
 > Thanks,
 >
 > Jessica Zhang

Hi Jessica,

I will be submitting a v3 shortly, the change to the sleep time was not 
necessary for the new panel
to work.

I have been able to re-use the gip sequence from the kd50t048a panel 
used in the Hardkernel Odroid
Go Super as I have been led to believe it is the same elida panel, 
unfortunately the same modes
used by that device do not work for the Odroid Go Ultra and so its still 
necessary to have the
patchset,

Best regards,

Adam
