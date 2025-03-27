Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D8FA73617
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 16:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A1810E912;
	Thu, 27 Mar 2025 15:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="e7OWlPdC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD8E10E912
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 15:54:23 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54addb5a139so1357329e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 08:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1743090858; x=1743695658;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CZv00/ePRkrRXDyY8uRk/fzDNtpq9RLmjZL7rRlPdfo=;
 b=e7OWlPdCKpiGLKC+CGweWe/aoX5MfI/ZlkEtuFQyEYv7uXqZRKCONrmBCB81gY/mSB
 qzSxKC8BmEnmvrWABx+p7/bshwd8FvxSwgrYgBRXhXdstaLIZf19/tUe2yCHgpBtq5Cn
 FILurmkuS6bT8Lnxu/5Bsk3KcmRGeuj9CNnmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743090858; x=1743695658;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CZv00/ePRkrRXDyY8uRk/fzDNtpq9RLmjZL7rRlPdfo=;
 b=JZEkhfsUUIdkSIS+DXmfN2Y2U4/aIz+k8cns6UWBq2i5Hzii6TbikE/920dWCFOAwG
 xadZTXbk5mZwoYptflBLK7XtSLXBRIa3hPDN7K6TWXIfaKKlOQ+Kgawt9zwfAIzUHEzl
 Zn8kwhsjVrQcprzW/6PrNbzmsZlvLlZ95uXJ03x3erkhp5rn83n5ciDcWCcEqqToX8Pj
 wjWOE/QUVtzxKhpcFBWhP2Lq3g0mtA7sdE94YfJD7wJn+4s66jbaJZGMcCfILtgZvq4B
 sXWZ7jljalrkcODLrQMC+P8sRUIKiH+D9sKwHO6TiBK+zMDzeS8JmKe6nTb83YkTd7bu
 bcmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuIQlbP5I+Vnt+p3JAN+VjEhkPOzxTFRf5iRGysgkfeb/o7LlIQM8HUhX8Pz2UENKOiNRDTgvzYWQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxn7GMqpVeIxbzaXstoCYpJqG1V938kZRBtLGlxkPRw5nRDNS6C
 cqCRokkkxE0GZd1qjkhYFdx/zHZv9nvCs+bDfsEs2WeBory+1kkdZykJHsC+XUj67Q9xEdTWyqO
 uZg==
X-Gm-Gg: ASbGnctTXJ6YayVZMUI/VqzsNwzIU/oeKunh5ivKfcZ/btqIHdfXwmfoztq/+OcdYsm
 GJaAx7/qm4rZoe95A4Gv663Ej92gt2mxWlm4VAuiysBdVWdlelxJUU8KTXJDaKy6U672Shb8EPL
 xEKd21n7R7d5Y93eWTtVc7LPSjxJlm+A/G7o7MQ1oRrrflU3AVXzQUPva04MFKfXyct4s+3ib9W
 NwPzsfXP/Nf5KPZi6TyLB96t6nHgnrToNCPbKg2pFvKqNhUswM07EZX1ef5a741UKZedAmhaIsF
 TUrS78ADE+9vtBAw6C6XoXCtWmdqLMAh0iUSlcE5m0trTWnNft+0AFyNa6CvUXgSuznboG+8nhM
 WMOyMvB9Y
X-Google-Smtp-Source: AGHT+IFJXNpdzrg14HDwHgClFFIOVssGjSop+QeIm+c65Ufepnnh+ylmKtg8KX22PHtGxo3u+0BG4w==
X-Received: by 2002:a05:6512:2301:b0:545:381:71e with SMTP id
 2adb3069b0e04-54b0122253cmr1408908e87.40.1743090858241; 
 Thu, 27 Mar 2025 08:54:18 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54af725deb5sm821213e87.111.2025.03.27.08.54.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 08:54:17 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-548409cd2a8so1347200e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 08:54:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXkHZDnRDL72HplvxFVq/sAYRnsqvrCNmn6ReyIk945bkBU1nLpGodeFjNLVEVTuHxqVrreG/j19mo=@lists.freedesktop.org
X-Received: by 2002:a05:6512:23a9:b0:549:8f21:bc0e with SMTP id
 2adb3069b0e04-54b012201cemr1799007e87.32.1743090855396; Thu, 27 Mar 2025
 08:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-1-e9bc7c9d30cc@linaro.org>
 <20250326-foxhound-of-nonstop-temperance-6f5a67@krzk-bin>
In-Reply-To: <20250326-foxhound-of-nonstop-temperance-6f5a67@krzk-bin>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 27 Mar 2025 08:54:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V4bA-kGs+qBfTJ2+zayGr1ndDMiT6Gc0d8ZCxxYLCZVQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jr0GBzGsFAxBQlSMWFiKpwbfZWxF1im_nyKl3vKfJiviUfLFt-4zl7_mZE
Message-ID: <CAD=FV=V4bA-kGs+qBfTJ2+zayGr1ndDMiT6Gc0d8ZCxxYLCZVQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna40yk20:
 document ATNA40YK20
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Christopher Obbard <christopher.obbard@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Mar 26, 2025 at 1:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Mar 25, 2025 at 07:21:26PM +0000, Christopher Obbard wrote:
> > The Samsung ATNA40YK20 panel is a 14" AMOLED eDP panel. It is
> > similar to the ATNA33XC20 except that it is larger and has a
> > different resolution.
> >
> > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yam=
l | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Pushed this patch to drm-misc-next:

[1/4] dt-bindings: display: panel: samsung,atna40yk20: document ATNA40YK20
      commit: 1822532477cb5f007313de4c70079c09aaa270d5
