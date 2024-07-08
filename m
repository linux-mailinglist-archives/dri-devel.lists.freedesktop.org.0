Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B207492AB27
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 23:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DD510E02F;
	Mon,  8 Jul 2024 21:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JX+MSlXw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D414810E02F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 21:27:11 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2ee90f56e02so43047771fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 14:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720474030; x=1721078830; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2Hnrx80vz9MsE0J2iryhuQ3skRCgcNpUt0TaSNEcw+o=;
 b=JX+MSlXwzGHwgF6STTiQj8NyYfMi1Vmb+spj73zPGoxi85gqXiCS6qkD+aZG2jGS0O
 l23qgnRwyjOcc0J2si4xlSOhCaA88NpN9T6pBQoabAUL3FsiupxSHusp3QQZolpP+2zr
 xLJ8OyrKfeqWk0i4SQNgxYYJJHfhVsrn5lZZ6XB3rTsyNI+le9aYnfZSbVslVXpZhBQC
 cFcNR1X/8kIM5GWMYzWBcz8H0aoSDxemlyZP7NcbMqkdSZWp4zsl8OC1BChJc/1Zh0+J
 lI3Ko/5+FbK/C9BcMat6mNV8nJtbrdyep65YXAD6kbI82iHsaA/dX4ZPUMcPkf0sgOGE
 b3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720474030; x=1721078830;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Hnrx80vz9MsE0J2iryhuQ3skRCgcNpUt0TaSNEcw+o=;
 b=U4AGCYz9IGTWdR62dEyOv/DQxEqSGCtRtbbYAG9UEpup2+yWxKxquVOOQhh1F9PgwH
 EcWtaD/vxrzCESCUyXQiroRMc9NUeFNp9+UCQSA873lznj7dpqOhxpwUdeDd1XqBaSHH
 ybBsKlog1xv/eJucVdTAtGdcdOlEu3LN/a6ngC0dGp9ukd1ecfQZuj/VDi7/Wk+DS34+
 Kb/N4DzlHAIFIgRuzYAocJGbAwKejAk2P84LyI0NyPYSQicnKLvb76qPUp1ZHCYyqjY4
 zgl4mBpN5sRk43Ek7uyYLac26lrECsNaIqvUDTeicQlTSB1AEJ2jxkEmxKRkxXrhXXfG
 4l/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR6tG5KDGuf9zuSGf2xmhpAQ/8VI327MafcFUPshoI8WFEAHk2g7RO3osF6EoertSWs+xVm7qF4kbJ3PglWgytZmGr72W5ZByYaLOu6T6U
X-Gm-Message-State: AOJu0YzAompW2FsFFpGjLaPA/b4xGB2Fx6YZaE4eJnyFuLVxPxGHENBv
 5cIXuEHNOhL2lecBWq+zjparRU+pYf78/BXzgQuFrCBfM3YOrqtDnsy1YCZsl88=
X-Google-Smtp-Source: AGHT+IGoTRUMiSdbRXAWAVkLZNFoG+1mw8OQw9YkrWqy50RZKRlXiFFFG0hQ1gcgSHAwQKUMcu0KTw==
X-Received: by 2002:a2e:3608:0:b0:2ee:6b86:b098 with SMTP id
 38308e7fff4ca-2eeb30b8446mr5707101fa.8.1720474029721; 
 Mon, 08 Jul 2024 14:27:09 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bc4e80c6sm261750a12.46.2024.07.08.14.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 14:27:09 -0700 (PDT)
Message-ID: <c7da3acb-4456-496d-9876-b05abcc0e010@linaro.org>
Date: Mon, 8 Jul 2024 23:27:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: add msm8998 hdmi phy/pll support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson <andersson@kernel.org>
References: <20240704-hdmi-phy-v2-1-a7f5af202cb5@freebox.fr>
 <5lbtymde3plfiqkvnd2lrjzxhengmsw242uqapnzpvfd5jrm25@x2ik2h6vrdxm>
 <2d21db63-4371-45b4-ab24-9a725c29e09a@freebox.fr>
 <CAA8EJpqz1SiUdTMpx5hmnax_rBqtpVAtOZsaL8UfHnZ5vZZFHQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAA8EJpqz1SiUdTMpx5hmnax_rBqtpVAtOZsaL8UfHnZ5vZZFHQ@mail.gmail.com>
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

On 8.07.2024 2:49 PM, Dmitry Baryshkov wrote:
> On Mon, 8 Jul 2024 at 14:07, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>>
>> On 05/07/2024 16:34, Dmitry Baryshkov wrote:

[...]

>>> I'm not going to check the math, but it looks pretty close to what we
>>> have for msm8996.
>>
>> What is the consequence of this?
> 
> That I won't check the math :-D

Dmitry is trying to say that you should check whether the calculations
are the same or almost the same as in the 8996 driver, and if so, try
to commonize the code between the two

Konrad
