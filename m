Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC06C39A67
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 09:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C7010E846;
	Thu,  6 Nov 2025 08:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ljSTjTtx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0F810E842
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 08:50:55 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-429b9b6ce96so500035f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 00:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762419053; x=1763023853; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0O1+Bk0V1ecJIiIZPiuBQsoCpD34teqnebEkC3KejHk=;
 b=ljSTjTtx/1qygIyKEbFDScEovOg1YZtmtYfGiEp5GIiKQpgpO68pYfIYsa8E7Hx8r2
 maL/5A7rqw9A/dbk8N7IjOsLvnUjs2kihxP3h31Hi+82F7YWLqKXycFNkS7ezHoaE3Pd
 hJqqPQjuMc1ewwkaGgZDxmN+sEHfLHCqdQ0ImZh+1F1T5Zc0ygXwq9po8PT+HXs7yOLn
 JDXobhy2Cp8NsceKvRl3kVtamyZ/Ts5i11dF+COs4u9QKyNj2dAfPgqkDTOge3dJroNA
 avcAcPu0VS39tLsjf9F/4r2Wz5+O1EKnHnFaDR7a1dFAcTaOaUtrmk9DAXZvxweDGMb6
 5grA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762419053; x=1763023853;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0O1+Bk0V1ecJIiIZPiuBQsoCpD34teqnebEkC3KejHk=;
 b=mazQCfjRDhAU9jTWR4KFz4Q1O/LeGB8rqvABp4gtRsH85+x94fyhQULagjB0kBhLH0
 ufOXGVKNBaMO76zvHjYhS/pV2OZX1l8v1iqiJ4ZYX/6wTYuTcwYWy05w2nN5HX/V5lCZ
 tzCv/IbYlNCgUPqsymLmSwlVGuyjYj42oS06nxfpYjD3rRFRen9AIi7kAkUikDtX3iZw
 As4IeZAPGw5+Hb6ukulT5IuZJzduFTupyyjzNQgjL4Irmd0IP1FejLZtUJHt0PizPoPT
 oU/AJK02n+OfOka5Zib/kD22YwR71VuiLyCVB9SJBUikyt4ba9bFQJIJ1SlLGGG48jr4
 8hig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ1f5rv0GXXhzilOckcUU2B6dlSxvu66foBYbq9SMFDR2UcRuyIbdh/QXaBI9F4ZQj5irml2vXJbQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4KncOvgkIO1ryCNO144FEu+NPIj4kOhenCSsyZ2kjDi+JNFdC
 g0bbeLsIfWFOF5YVN6jRL7tky+IP0jM0I/hWRUaqPcStvnp8qibXXyaPFiEhe0bfLfI=
X-Gm-Gg: ASbGncs5ITeOOeYoAq2F0gnCAD+Eo76e96v5lzbw+HNq+dCXfiO48+3AR9qjZozJCOH
 UnHnBbDXW5vOZm63cZNsqe64yNzRw1QM7j+qKuFGZSVttFEg+lfI0zDzykJQ8iBhxLUHxizxfTY
 kkIj7ZjRUdShp0LwQOVVQaOv17T1GSwg7kvNpmOh2Xx+akvr6KK0YTSMDD9TXO86LVeIovUhXzS
 uHz8kCCTKi4JJVKTWm+poFBkvcWsAQTJFceym2Hp+TREykxGmt50j+Z8pi3/hidzkpC4ZracLHY
 f6QWMfJgLp6UOfMjVRTk3HFq/i78eOJ0DpZ4XxWUt5FC/H65NkMzbKGhZ+xv1PK9TApIFizU2F5
 WkgKeq4R2nCp+SEKt8Us8zqlgl8w1ZyJbcYvGCyjBBsfTcfMVTBsnXM5NYUQDWEbxbyvurjxh
X-Google-Smtp-Source: AGHT+IEpNkwrjClS3MRT6aT/Q6UAaN6LRZvZHXmcxt93frsHr0y/6tOsqdtfdy9Fugmh28HWQ5XyVg==
X-Received: by 2002:a05:6000:2a0c:b0:429:bb40:eecd with SMTP id
 ffacd0b85a97d-429e33120cfmr4859897f8f.52.1762419053386; 
 Thu, 06 Nov 2025 00:50:53 -0800 (PST)
Received: from linaro.org ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429eb49a079sm3648338f8f.32.2025.11.06.00.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 00:50:52 -0800 (PST)
Date: Thu, 6 Nov 2025 10:50:49 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Ritesh Kumar <riteshk@qti.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, 
 abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com, sean@poorly.run, 
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_mahap@quicinc.com, 
 andersson@kernel.org, konradybcio@kernel.org, mani@kernel.org, 
 James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
 vkoul@kernel.org, kishon@kernel.org, 
 cros-qcom-dts-watchers@chromium.org, Ritesh Kumar <quic_riteshk@quicinc.com>, 
 linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, quic_vproddut@quicinc.com
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: lemans: Add eDP ref clk for eDP
 PHYs
Message-ID: <x7ej2ne3lwn66xwgavdom45hj5imncczd5h5owufvvx4e3cblu@rdhb2adstev6>
References: <20251104114327.27842-1-riteshk@qti.qualcomm.com>
 <20251104114327.27842-3-riteshk@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104114327.27842-3-riteshk@qti.qualcomm.com>
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

On 25-11-04 17:13:27, Ritesh Kumar wrote:
> From: Ritesh Kumar <quic_riteshk@quicinc.com>
> 
> Add eDP reference clock for eDP PHYs on lemans chipset.

I'd add more information in here as to why this is needed,
specially since this is a fix.
