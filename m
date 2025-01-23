Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBFDA1A466
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 13:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F8110E7F9;
	Thu, 23 Jan 2025 12:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D6FlcCLK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FFF10E7F9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 12:37:04 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53f22fd6887so979209e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 04:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737635822; x=1738240622; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iKdcdXEFyobe2plG7qw0BSF/MpVvCBWQ43hwb1Q0khs=;
 b=D6FlcCLKOJLEs0TSXPvNnV2jZw4Mn2QMKSB04N+VAAWDCgAfyQB2fzxOu7ZfNwZ4xW
 4SiBEBUqw0TtCtbECukTHE4QBETG1U0qjMSKhFXp15IRo1+V/3r8jU//bpMiNf2nyv3z
 1sbiZSHomZQu13HR7tmqEQ2Pt4WmwMWH0Wbf817A6idpkbKzDhce6f43VjNgGE73HtLZ
 mWaSlOMDG9epXoZ/TB6rje9gH4Q/Xm1OJHljayCOqOMCOBYCMBY86s3s7yTq8sqg8+a7
 F7Zo+HEZzPEHX97e5lc/ytxWx/rfKjhNkmymuZ/F9nYtd1eyVhFa/P4wb8b8zbSTYV3W
 9GRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737635822; x=1738240622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iKdcdXEFyobe2plG7qw0BSF/MpVvCBWQ43hwb1Q0khs=;
 b=YLWtzLMo5QYQ669vyjw2rTlWwYu4PX4K4RQzuVM5qeboEqa47YGKqKSH/vR9QyEk6W
 efIZyGMSXOAxMakXoUbyOMJ1aqbPh3RhUNpW6P8s5ZCF1kVTg7aM9T4pKSjfQ6RvpvgH
 IIikVW1K/b6bCJGzcydUelm8/+3WdVflfJm/CA3U+KA1E0YUoo+kkL6SmtakVosangDh
 I/h/uIHGWrwt9KXPPtJFTXhAv8PJqqz5pRTIdkF8AKuK9xVgqiWWX5Rw0gFMwUvKtfFp
 FFm8qvlvFtSdcYe1Q0rdVrX7eOzmb2emG/q432XDnVqQeuOd1PrbcSYbJJB+/CW2M5qE
 BoJg==
X-Gm-Message-State: AOJu0YzvuQ+IcUzeYE0iIhD+z3phw5yyQcKCgrxxbwLim7st/HHdPfrX
 b1SNd2Gq2mQY0wGHeYxQ+n0OO9lcBIVKdWmj4zrumkvl9Vm/srj7/zjn8ccvPI4719rSLSVNTr1
 Euxw=
X-Gm-Gg: ASbGnctmnesiKn3A1LToDtvP2Ob7IEx3NhIzR1VE6+7cfJYW9kydwskhtwiZcBWW0A3
 wpPXNJc055fn255W4SYnk3ggigfeuDSZi7UHWKxJu0lvW5v8kbuqu68YeAVRF6gZbdfex9z8cwv
 BwozU/Qcm/lhQApF9X8ca1KjarNKdeGlS7XjTDo6zt3aQuMa5BIUdxiLmOxlSd994YG0RGPk6Pi
 ItV5SfaxptN0QUeVT3cKf8Bysiezw8rkN62wKJOZrEY6PKm+NUspcGatVM26JgsUR3XnyAJJ7Yn
 Ll9Q+M0GJqeP2Wg8HB8KDs3TiKXU9l27cTyrx2wP/pQ8eBZB
X-Google-Smtp-Source: AGHT+IGBYgoKjVLGqk4nQ0TpNNIeuOwqMR2fmDd5qqw23X6jFlAaj4AT2fiFDZRl/Io8WQubg4H1SA==
X-Received: by 2002:ac2:54b1:0:b0:543:9b35:5ac7 with SMTP id
 2adb3069b0e04-5439c22a87dmr7367906e87.4.1737635822226; 
 Thu, 23 Jan 2025 04:37:02 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af07437sm2644853e87.25.2025.01.23.04.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 04:37:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Archit Taneja <architt@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: (subset) [PATCH 0/6] drm: enforce rules for
 drm_atomic_helper_check_modeset()
Date: Thu, 23 Jan 2025 14:36:59 +0200
Message-ID: <173763573257.2683606.1940279042120421914.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Sun, 22 Dec 2024 07:00:40 +0200, Dmitry Baryshkov wrote:
> As pointed out by Simona, the drm_atomic_helper_check_modeset() and
> drm_atomic_helper_check() require the former function is rerun if the
> driver's callbacks modify crtc_state->mode_changed. MSM is one of the
> drivers which failed to follow this requirement.
> 
> As suggested by Simona, implement generic code to verify that the
> drivers abide to those requirement and rework MSM driver to follow that
> restrictions.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/6] drm/atomic-helper: document drm_atomic_helper_check() restrictions
      commit: 0936f0e54426177b0f0263ddf806ed5e13487db6

Best regards,
-- 
With best wishes
Dmitry

