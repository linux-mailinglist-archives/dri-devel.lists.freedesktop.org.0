Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC9BBECFB5
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 14:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6560F10E10F;
	Sat, 18 Oct 2025 12:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k2iIK4wE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECC710E10F
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 12:46:26 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4711825a02bso14844875e9.2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 05:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760791585; x=1761396385; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NRDae27n+EW9z3sFe7xVTYXCCUSru9GSplX7TwKn6SY=;
 b=k2iIK4wEZZsjl/DokRt1nIbqudc7t4qWI8FGIK+ktp3uiX4t4DcP4ckclGLK9qLhEG
 lB9Y6hHvWnXVd5F9S5/mrwSxBFtjGcxgGIDzXLb7PpQt/vdyT2KNrJM333NJ8cHVQFZk
 N58Ose4PdDmld5YObfQdIfvoJD75UKFVQMQtdY/Micy73jbxxooD3GCBl9K1yN4jJOx2
 OQkp/YE0kzauCwIr/NFh8Wb8j6Gq2kemDsOkrPyFnOXbKjfI3bv4+zie5sR1ef1hrWtO
 Ju5XWyJIx2Rpifni4ZSXqe/dNtlhrkCgm2qGUQYC5Aaaetvodh3V9rAHoMxEKjjcxcEG
 mqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760791585; x=1761396385;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NRDae27n+EW9z3sFe7xVTYXCCUSru9GSplX7TwKn6SY=;
 b=xNPgmazOwPQy+lfYFE5Lg+VMwHUX1nw+RZMCzZccQ6naVb/C4fbXesUbLcjBJKIDk6
 E4lBk4vUCmzUB1d+GGfwGJPWtcgLzqJoxjj6E4mc2gmLLPXm4WM4V80j0HdX9MdphtjF
 u9aaaOI8EFRYBtDJbN2fL+tM8SeGvbJpO4u9pHMK6y01fHnO+etB85CTkLWFRHD7wZRP
 oFFczcRpGgxAOaJxvE3yXdZqiEPYv+oPY8xyV/Svlhx6RRnUgt++Dur+FEQqy/Jgk+81
 rqmd5Gh2/b9eVf9kyTtsUDb1tmGvu1QOMlzp3OwY6OtLoF7L6zLir35+6GYSSwVTt6XI
 EOhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/gXeBDDf8P+RxJbmBBrHbE3wGsaLoFjwCfDGQQ2qiX/tNgIK7bZ1pfYExo0FOvF+OQowXTSF7vXs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUNtb8ukNopnlzrDZR1Lck8wTBypP9DO0/d9W7xNRSRP2wZi+E
 arhMJEKeQ6KzJSY99PyAu1hmIn6yXj1TJemZvCtA0Q01RD35ySwcIpDH
X-Gm-Gg: ASbGncthx4gvLDbjeEBBVMGi98whtdAAWEfeuE3aNfLKF9/h0LuaT6WbA1EceGiNQHe
 4CvTaJQgEYv2GRCtWoP4YQNB0mb9+EUQ/mU0yI+jH49Yn5goDy1OwpegLJF/+Kq9ChPuzn3Eh5V
 dZvdx8gW3iiom1z4N8XTj6dl4VFnBXc8xRFr1owASrb7lbdOPr+7yn9apiCZBJrA3k7+/ZaG4QQ
 tNeX2FIetYroDQpZrcL3EEEGx7CSW8KSD7GUXyvxiDXB/GceM8uvjgEIihvTkkHRARXUk8ZEvT4
 qG9T090wy3oSC/UblAScFrXSVPuDHfwDZL702A9P42EFz6ZePDD6aUuor3YdnWWPWZFn4usI1a3
 jDQ8VuTRTzTsGA+PeSICv2sqtyBbAJUX0XI9Ql54XugwTFIaFUO1LPDacQdpodcFSZOQS1d1Bbo
 VYp1vLTQevipQae/FTS8nDUWKaLH0OoGMkmWX4t/F1IKNrEdUT
X-Google-Smtp-Source: AGHT+IHciheUaedaQWFrdBB059jOtAnHjQgXhJiw7swZ0lJsz0WMoNbXw/S7INuIJ01go/odvMDV6Q==
X-Received: by 2002:a5d:5f82:0:b0:426:da92:d3a1 with SMTP id
 ffacd0b85a97d-42704d74d3dmr4558479f8f.24.1760791584863; 
 Sat, 18 Oct 2025 05:46:24 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:2acd:89a8:83d9:4be5?
 ([2001:861:3385:e20:2acd:89a8:83d9:4be5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3acfsm4914970f8f.14.2025.10.18.05.46.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Oct 2025 05:46:24 -0700 (PDT)
Message-ID: <048d5e20-8683-413b-8eda-cc1ec901ac54@gmail.com>
Date: Sat, 18 Oct 2025 14:46:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/sti: hdmi: add bridge before attaching
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251003-b4-drm-bridge-alloc-add-before-attach-v1-0-92fb40d27704@bootlin.com>
 <20251003-b4-drm-bridge-alloc-add-before-attach-v1-2-92fb40d27704@bootlin.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20251003-b4-drm-bridge-alloc-add-before-attach-v1-2-92fb40d27704@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 03/10/2025 à 10:59, Luca Ceresoli a écrit :
> DRM bridges should be always added to the global bridge list before being
> attached.
> 
> Link: https://lore.kernel.org/all/20250709-sophisticated-loon-of-rain-6ccdd8@houat/
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
Hi Luca,

Acked-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Best regards,
Raphaël>

