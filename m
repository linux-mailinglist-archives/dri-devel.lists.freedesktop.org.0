Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3684958842
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 15:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB85510E7DF;
	Tue, 20 Aug 2024 13:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MXaxDfzC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317D310E7DC;
 Tue, 20 Aug 2024 13:49:52 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a8384008482so583539266b.2; 
 Tue, 20 Aug 2024 06:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724161790; x=1724766590; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mi6P0KgyJuOg2DIv54r5lv9DcqvreKk8Q0moUstK6LI=;
 b=MXaxDfzC0wBP+QzXZDDJVHUuiRa6yMbV++0mSXLIMRNZgWWz8sHNVmzgzxeD47tCxE
 4z3ZsOFoWlRqRkQdhgkMk0Xm/CgoowHIa3l4vjTL1RF3drV+eNUxyO8J74VC7mKwg0e0
 AkxqOXd/hWgOxP7Qx6MfEstdT5S5QfhsqbF/xo1AH+s7lT+GLFY3QZhiWm1uBr6IrHqr
 iiPX6mqK1yUB3XFR1VLdPMbmMO5zLz7p1+IxECFJ0PuTCSa0swTQ9g0OW8hNkQrzX5vv
 SGFSsdX32NtDPWx2ugPjvxNZ03cjczqioIfcS37hGTtl0VACbisNQK9aRkl4HFGtGY3H
 GjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724161790; x=1724766590;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mi6P0KgyJuOg2DIv54r5lv9DcqvreKk8Q0moUstK6LI=;
 b=toCXepMomFmdDGNxbkgq3ngqaIjl2SBZaQXTaJwuBqvOrFEEcspIod8h54jMLB4G7l
 rH+Ch5/ID0uHWTV0lhOEAyGc0y1Ul0hwOMvTcMMN9D0lj0IwL/hqBMktEi5PTmJ2T8pE
 e6iTamQL6L2/wCxL+fq4/V69+FYCZR7vQJytOqH7HncJzNDAEAOG9di2LMG8Y8TGOZaI
 DJYTklct+XvF+xRCxk0YLSBAuH62FrbFZAh0lgwpCv7jJaoS5AVpPHBTSeRRZ63TLHjO
 5djG7KwGLWT19T+WZFKytkiQtIDEXmfBWyPZlg8LUn2iytviHLlgRi6erZtReKEJFiTO
 nQbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/YLWVEgFPSuCw8h/K59ZRlzmkLyBUfhwovKwEKhFQ2ro/RtMMa31jCOso1cY17vcMRqE0UhfibgM=@lists.freedesktop.org,
 AJvYcCWv1BRnvSTbiNVVw7rAffZQyuDAmnjsGa5GoTe8zDojfgvPvTH7ilKA8ujaGK6AxmwWVoKZKi6AZAsL@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDLoX+m4o3EgYuL2le/2BwPfHKIxDuKfGChkggYi5nQ8k/3pEq
 15PSjk4p4evKwRnZOc0p3l9A+tZSk+oMjxO6WPRAhk7uPRxSDKDB
X-Google-Smtp-Source: AGHT+IEXvQEyjaLUUTKVUVXyC1PuVlUVxioiqu3aSU26ykNG9MQuXj9MG1IeuWH1QcCO0RHfQJinRg==
X-Received: by 2002:a17:907:3e1a:b0:a7d:a031:7bad with SMTP id
 a640c23a62f3a-a86479ae76dmr141428466b.16.1724161790082; 
 Tue, 20 Aug 2024 06:49:50 -0700 (PDT)
Received: from [192.168.1.14] (host-80-104-252-9.retail.telecomitalia.it.
 [80.104.252.9]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838cfa0dsm762254566b.69.2024.08.20.06.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 06:49:49 -0700 (PDT)
Message-ID: <e0ec6c9f-898e-4bd1-9b32-d291ec716788@gmail.com>
Date: Tue, 20 Aug 2024 15:49:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/msm: Add submitqueue setup and close
To: Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-2-7bda26c34037@gmail.com>
 <613c79a6-c32c-4c3f-b648-673529004e49@kernel.org>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <613c79a6-c32c-4c3f-b648-673529004e49@kernel.org>
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

On 8/20/24 12:10 PM, Konrad Dybcio wrote:
> On 15.08.2024 8:26 PM, Antonino Maniscalco wrote:
>> This patch adds a bit of infrastructure to give the different Adreno
>> targets the flexibility to setup the submitqueues per their needs.
>>
>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>> ---
> 
> This email doesn't exist anymore and doesn't match yours
> 
> Konrad

I hadn't added mine since this commit is from the previous patch without 
modifications, I will add my Signed-off-by to it since this address is 
no longer valid.

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

