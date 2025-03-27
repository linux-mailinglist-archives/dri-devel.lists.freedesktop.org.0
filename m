Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0FFA72AD7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 08:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507CC10E85C;
	Thu, 27 Mar 2025 07:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BEoJBvpK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3F510E08A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 07:51:54 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-ac339f53df9so125188466b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 00:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743061913; x=1743666713; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bkkkpsCZMXpOpBqlhNefevBtrymahUPNIaJzLNjWAFU=;
 b=BEoJBvpKC7C/PEyqgwuHJ29DTZnjgvmw19V+CxKmLKiCGhBmgFSZjZf3PWbQ1TJpYI
 mQyIRl04bT1TLLdIiWh5mY3Xw1YXqK3XLwryy7gMBVDG+ElBzqlMKADgAQLVxqjg2JgW
 Y9zJI4n3xNSiKj+ij85d9g3NIsNbLh3nYPAYv1p4F0cysuX7ETbOOGeEl89f9jH5x/u8
 DMg2lcBBDxMHnsrpoBto0TLcHQa71UVAHiJI/Rxj7NbVjW+gBbrZkpsNB0HFLiZ1bwrg
 C/9kFRMKt180OyXhG9XFO26kP0QK8gAVNmqPAkbL3MLfHVoqYWwuJJ9bLuB379eIwZC9
 zD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743061913; x=1743666713;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bkkkpsCZMXpOpBqlhNefevBtrymahUPNIaJzLNjWAFU=;
 b=mJh84XqxoM0ERFrXe7Y59c5TTCabz0nNC04bPMM1DMU346qyRyUfhTDqP0zaW7uwZF
 pcsynFK8NptpjL2fUwYb1NyqeKWl+MVq6BPyhaseBxDkb+lNbLra0rt9F0sCEHGnEX+x
 OGZummQZ8sl51buDvFxa2bhO15E0b4iwULDTgLUap6TFvVxnjpsIYkvmspJOsE04+SSS
 tqqib/FpoLV/Ey90iVQxe9nax4snCu21pRKF57MV0oamL+1nHOUJS+RLpb6LxOIE2lS+
 yHR/VWsEx63XEK7Z/Wn4XcLTMY7XESgT1jrnbDrjBzjEGb33YH7YhvSfcSrelaopg3LT
 JYSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl9neiZmSRtC/D0NaPqPHvc7iJUQEPW6Tk2Zm0QfUjKCy9h2F4gXlphoZSSDiefTKRgIZqp6OxB3c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyueYBqCGVTrf4ifdMqBBbzchYTD1XNV8fYZUi2r9BAbn6n5o1L
 mXA/FtstKT3MVjIIoFXSG1qz/RXanj/rhe7I3rpiYg5lrMmHv1tB47IjR8JhDFQ=
X-Gm-Gg: ASbGncvl2xly9uZhO62FPLS4SbjVXmg9R55VsYUSUyK8O9cj3ahDuxHfa4/Jcfl0Gjc
 SMaKR2NAf7dCWXolb/SwK/NvCUb/9FNwvnqofl3eCsd1nCZoM44rHT9lTUfKIpk2lc3Mx/jiHBY
 SZQhUAVtKVifPjsW6SkkpLVWlSwN33FiFTI+TSh+1yeV38jx9mMTUkOBt7X9Ehlc02J4IMonAFu
 +mbTRrA3Qoyt2agXRc4n8s9vvfzTbYRL5ACU/1bnsV/FvmNr/X4j2T9irYsG64cxhW6aJXOf2cu
 S45AyvcOwukO6LuEBdYC4QE06CvGeDkGyES8FK5agg==
X-Google-Smtp-Source: AGHT+IFV1UJVhREk9/GsUuOGS9IHZ/MvkBCpSqwJ+EdM05OmvKh/YSMogqljBF93/hELR+0ofu4aZA==
X-Received: by 2002:a17:907:7b8c:b0:ac2:9683:ad2c with SMTP id
 a640c23a62f3a-ac6fb1d6bdbmr197580166b.57.1743061912747; 
 Thu, 27 Mar 2025 00:51:52 -0700 (PDT)
Received: from linaro.org ([62.231.96.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3ef8d3d38sm1166893266b.39.2025.03.27.00.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 00:51:51 -0700 (PDT)
Date: Thu, 27 Mar 2025 09:51:49 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Rui Miguel Silva <rui.silva@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 LCD panel
Message-ID: <Z+UDlXFKbmxCECp9@linaro.org>
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-2-e9bc7c9d30cc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-2-e9bc7c9d30cc@linaro.org>
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

On 25-03-25 19:21:27, Christopher Obbard wrote:
> The eDP panel has an HPD GPIO. Describe it in the devicetree.
> 
> Unfortunately I cannot test this on the non-OLED model since I
> only have access to the model with OLED (which also uses the
> HPD GPIO).
> 
> I believe this could be split into two patches; one adding the
> pinctrl node and one adding the hpd gpio to the T14s devicetree.
> But I will wait for your comments on this ;-).

You should definitely drop these two paragraphs entirely from the commit
message. Maybe add them to the cover letter.
