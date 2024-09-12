Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EB3976C1A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 16:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE89C10E224;
	Thu, 12 Sep 2024 14:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JJCZz8CU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0AF10E224
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 14:29:47 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-7178df70f28so761038b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 07:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726151387; x=1726756187; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kObZ7lH40iypxnXLN5YIJLKZF7D7KD3d3B0LY0pTPiw=;
 b=JJCZz8CUxfxlR34L0FX1l01rQ7GKcCB+z4a/qrCgBNQB3j9u4lNTpe3Vfuy3pSa8Lq
 LiLOQs7wz8PBL3Xjj7NCwHUE6J+V905n1RY8SLpAE3RR3XAvIMe1IwjXOxP65Zguan8u
 mvrDcRz+a7+P905WYxOj539MoJaVCkzy0NgQkz1nGz17S5aJPCfeObHMAev9rgqDpz4f
 Gsp/qshQ5wicIsjSFbSwS6RotLWm+1rFKQsbAzKcOdPZmtYCuEwBJ6qGvqx1DinmBPT3
 qXh6DvV7ZfSHeUonHTCSNnIIRMSDClPPVQDLFphYNx+bmCjuS2Nyh77mG9BJWGv2IIIh
 uvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726151387; x=1726756187;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kObZ7lH40iypxnXLN5YIJLKZF7D7KD3d3B0LY0pTPiw=;
 b=XoMXeDC9sB9HD23uljjNLTi1vdE8rqW6cjkjmF5nG9TRd77iZgtdxoNPhutzjELKm9
 k7REXJRYHDbNPqKe7arhgzerg1HU/kxcgRj7S5fngRVTmUbDeNlLWaoYA/ioNx3RCig5
 J66uiBG60RD7k3d5tZraSxleHp+OvNUFWg7lakMZ51G0GlmPyl+5r9DwkQqH6dqdyRuI
 5Es9PpZxqduF0MUnhUqeJkVg5u7zo9Avee/2DyuP1dWjMYThUPQp3djM6187UnXtpGdg
 fj4DsI5FfKdjAjqhG2tOxB9CorYVcjeNuONrT7ceJUD5shNbdZV+pEiewztm+VPi7Q4C
 +xMA==
X-Gm-Message-State: AOJu0YwsHMyZ+BojV+znUbmrGGQlaZunOjRPv6xYNozLyzUt1HF9VJ58
 i3ja2/8P5jpfTv4nVgJsBBS2EqZ8blDjsfmcfrUE+mXsvSOIbVUg
X-Google-Smtp-Source: AGHT+IHsIiP9is0MIit0yZGpDZaJaJi4yUCuk5PBYlnsfEvB0Idphp6Max7FdjJrq4pVAYkwoNzY+g==
X-Received: by 2002:a05:6a21:6816:b0:1cf:6953:2889 with SMTP id
 adf61e73a8af0-1cf75eeef69mr3793545637.16.1726151386687; 
 Thu, 12 Sep 2024 07:29:46 -0700 (PDT)
Received: from [10.3.80.76] ([103.4.220.252]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71909095184sm4655926b3a.106.2024.09.12.07.29.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 07:29:46 -0700 (PDT)
Message-ID: <4c053d01-2f67-47c3-9f08-e20e8e6ef1dd@gmail.com>
Date: Thu, 12 Sep 2024 19:59:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/gma500: replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent.pinchart@ideasonboard.com, patrik.r.jakobsson@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240911180650.820598-1-tejasvipin76@gmail.com>
 <b0f77fcc-5d84-4727-9a17-9d1f1e2c5b76@suse.de>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <b0f77fcc-5d84-4727-9a17-9d1f1e2c5b76@suse.de>
Content-Type: text/plain; charset=UTF-8
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



On 9/12/24 12:49 PM, Thomas Zimmermann wrote:
> Hi
> 
> Am 11.09.24 um 20:06 schrieb Tejas Vipin:
>> Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi since
>> monitor HDMI information is available after EDID is parsed. Additionally
>> rewrite the code the code to have fewer indentation levels.
> 
> The problem is that the entire logic is outdated. The content of cdv_hdmi_detect() should go into cdv_hdmi_get_modes(), the detect_ctx callback should be set to drm_connector_helper_detect_from_ddc() and cdv_hdmi_detect() should be deleted. The result is that ->detect_ctx will detect the presence of a display and ->get_modes will update EDID and other properties.
> 
> Do you have  a device for testing such a change?
> 
> Best regards
> Thomas

I do not have a device to test this. Reading the rest of the series and
given my circumstances, I do not think I will be continuing with this
patch.

-- 
Tejas Vipin
